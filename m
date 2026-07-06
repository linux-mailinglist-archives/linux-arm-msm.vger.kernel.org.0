Return-Path: <linux-arm-msm+bounces-116628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pbdqKjA9S2pROAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:29:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C9070C9C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:29:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KTCjD9Pg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lp2Dzwbi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116628-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116628-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41FA3300C904
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 05:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E169B3AFAE6;
	Mon,  6 Jul 2026 05:28:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AB53542D4
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 05:28:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315733; cv=none; b=ULCY/3z2nDfVl24JeTCzdZRZpn9rZHGlLD6us1FjzIGinT/SB/Pn6fe9eW+JJeSm6N/wuLkj/yEf8Na5xX4ncgG/eVKv3B/PO6rbEhyg8eZWFIQR7gmxEdhauwc5TFcQXlNYMqMi13SwYjVxlthk2WvlqP2kJNKGGAVX6VZqXqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315733; c=relaxed/simple;
	bh=kTpordRqqKUl8WzwLQ+oGN1UCo8FnhtoeNRWYUBKhgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HUfMTk6G603zexOhobaFZpNodPiVTE0k11DjL1m7i7x1t4P1a8MHbBvY7QsnxpHjf2XI9ThkU09Y2pKDu0/z79a49H/p0QWUY7JZkGCn7K1VPfURrx9YBf+QAnT0JLuaPFNI1iZ0uFpD3NFjtHaQdT1v6zGIxNATry7IWdLMrAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTCjD9Pg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lp2Dzwbi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641dU03402319
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 05:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=; b=KTCjD9PgjuqwdhZ2
	6dKSeiGSFQc61DcwHTYZuiPE3Nzt6bkRKmB7JAP8kqILuOjsKUx7MF0CpIPeFVYD
	RUCipmYE7vOki3GEj3C7lv3maOv+cKsubyRLeUSpKniySdE1bexIaKJqFrrc8brS
	EYxHmUm96SPfBzgOF7MTx1BMp3B7GbQ31CJYYApMm0dK1ebt+XiZ00Pfe5aplC/Y
	77bW6JHPQDoCwyfLQ5s1pxhDw+Sjixbg7CeRV/WE+Fo4BcRHQ+jOTV4HVkRSi2Yv
	71reF6u7d+jJhq/Cmin2Xq+gh+IiWjTMD8IeOHsjYw4gZBx6jlCPQdKF8wJwZjH/
	khhobw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgmb8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:28:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so3729805a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 22:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783315731; x=1783920531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=;
        b=Lp2DzwbiIlRR85ZXn1AUzmG/yZM8HsKeWjDet5BXYEmsio4PuiQ5awemPKcVqJ8zE0
         SWgN5eVXfo+1ael/G7LR7m7EOIJVU3+oIP/cc150WBStFMjYRcCasCzjLVhzjuIhJfN8
         Wpb/Zaph3YhIuDH1PWpwIn10oYhPcSXA5NeCIcy+2ZAnjRXRuEOkkO53GSG/yGLO/Rej
         iUOQfl2mpC2vdjeRsNAXS7AiLEDEJZ7NwAVFKlr0lbSVmJn8xN2ht/gA4vru/oZXitET
         qP6NjdW1jgKDkT0MSQ4KyxqSAkfbUarWzZ0NkXuOy/Xl2buaq+mvlzWpsVjfSoY1PlTa
         wOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315731; x=1783920531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=;
        b=qJN/zAvPk6sWcTuiplHY0dP3VRHz4r1aRQWDZlFHpsyyutp5+wRBtILggxclsze7yM
         EdvTS9JZWCC4WH9JJPMmScSV4nl3PeMCPofPMqzviDqlIOEF5wkC1irvZ1VHvDHa+ODa
         nx2RnKt8FGxpvrbIgW2eQw947t6r54JSfG3UECvNkOTMPojmeFI0iWDaORZ9MUdL6IPD
         qJgouQTaK7d5VbvoDOsdOuSFQZiq7W3tRrwf5lXtPLOvpjvKq/6bPjfPo2iYHfRrcnb1
         ktPH5B/RhgfFY8/BQLKMapGHre1aMYZT6ga3SvZVNGiVWspz/rz16Zrl1UuEXFA+QplK
         +i3w==
X-Forwarded-Encrypted: i=1; AHgh+RrCD6blW6+wb9Daph3knBjRRnq85cHnB3dcVaf1cbl3iV9M7S9KC8TUylgL0H8Az+8pToC3/NcmY14q7e4p@vger.kernel.org
X-Gm-Message-State: AOJu0YzEiDEyEapW68I6Y4kwnrVsNLEuQyvmL6XqIOOVsLC3ONlmhwW5
	SDO9vGRN7B29rtpsykzyXBGMkcRfNhWvtBnImCpaIZA+dfi7CeCGFDrVCSa4RFB1gBzgz3PN2T3
	FoObzwEtTBCH8sS2ziqmVauwcbb1he6ynYFSacc1FXR0CCC+rgLOuxTv6UcDG5+RJSwEW
X-Gm-Gg: AfdE7cnqDtN875wETLHQ3o6hT8w9f7NOdXpuKdjZFTJ+RNKB/UiFoQZzCYyHDpjAh90
	w9V6UpDeKZZnYIgSqNzRMXHZ5m7emJJYt9nLsBVQE4WEMYlB7fWftu/g+lVcAKb8ISU4QKdJXa5
	rl2TspOBhq8uv13gysK/VA9kCANvUtQwG1U842vkccl+FzKRValB7cjGrtHiO1JGBDd+Ff7HBDD
	K1QOjcdHOHPtueYUExWoMPJxPziQgb5WSRanossowlXz4oPT1Y/O7RF6JZDTobVR7G6nD5WjKPe
	oU99hJsXFTBEfeRsZMWQhfROX3GiVXZnKLALZx3ubwg3l0/KPx6P+2I8/3dfqIyv56HoxWivTlr
	sCZbQusHJ3NkL2VN5KYZfkl7vx+pa0E+sp3QVAIA=
X-Received: by 2002:a05:6a21:7a91:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c03e5469bbmr8361330637.43.1783315730996;
        Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a91:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c03e5469bbmr8361303637.43.1783315730566;
        Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ef50sm5875489a12.6.2026.07.05.22.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
Message-ID: <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:58:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1MiBTYWx0ZWRfX7aiX5sLSVAf7
 6nQOjT2VGQwPt5gRe4f5J+TyUOaH1puMTvXpDv/azuIImvlMQyM8kUjivj8Vn1oC3twYnQpnHLx
 Vj7VCjTIH30HtKZJ1XOQQJ0sWiNVMFY=
X-Proofpoint-ORIG-GUID: cKDauN368kZ8JUbuIT-C-knpMr72otEe
X-Proofpoint-GUID: cKDauN368kZ8JUbuIT-C-knpMr72otEe
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4b3d13 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dZunwGW3stLU1k_RaHIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1MiBTYWx0ZWRfX3rYVXoC0/k/u
 5aqgoVYQVfhKnn70UhHK4MPm9AFfJWzku/OC0WqxJq1bhXt1a3izpxEN5n5CtVwz4abYS+MvrYU
 ytCpqK7/ThGDiLC6IwlF1bqHCGWmLEWK5RAz1A8KNDJnGEtABWhCnxK5m0HqsBVX5t/AwuM9Bcp
 fwywIwnjMPJMK2r1fEDJWC/QENsNXHwCZR1yiPiTSerBUfIVhur+aQTpR3jBT/4K7S2dsPSBXUW
 NYT0/wmqNah8uvvCHuBMNr1UYE/jOTiW+CwXRXnr3nBFSAdYHSel8DDhM39C1rZjdDnyc9m3asf
 Z4lOpvAB37B0yOlhqrFLICEdV+EI8nt5V7fVMJq00dD5q4tNVNsumjyKibFfexoimt2cJOmZ5Fo
 46viHaKoviQKNIvVl3RHG2Hd1KtNSviF7cm3HCi0z7p8YJ08FAKCY3w+QBUlQH1SWqEc1nIPy0p
 gqHo/hamVU5LA8KEw2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116628-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32C9070C9C8



On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
> On 6/9/26 5:02 PM, Taniya Das wrote:
>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> Almost all of these nodes lack power-domains, meaning the
> aggregated performance state requests will not be translated
> into RPMH requests
> 

Konrad, all the clock controllers are on CX, similar to Milos and does
not have any special voltage requirement for the clock controller.
It is okay to not map the power domains here.

-- 
Thanks,
Taniya Das


