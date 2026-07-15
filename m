Return-Path: <linux-arm-msm+bounces-119271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6xBaClKNV2oZWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:38:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E375EC34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:38:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TfHtkWwz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c5TqUL4M;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119271-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119271-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F197730D5564
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924EE305698;
	Wed, 15 Jul 2026 13:33:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E889307481
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:33:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122385; cv=none; b=aXrOk86gA6/LGMmRtANQcnQOz2w1Cb2WFhgDgJHaSALHlnMQr701Ul+t1L7sWFTlFFgjobJ+tsF+eFnMTSxqEQGUKoV8ZFwflSYazLwifZo3P+0VRQkq1V7gjNC/tc7Kdwn7umlyexdQ21Lh2FRQQ5tWOVyY4c217pTsIegltJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122385; c=relaxed/simple;
	bh=q+7zjm3QauD0cdoSi39Jo9reVzr6JqwU0EcSEWe1mzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtBEbPP2Bzfw32RJvFHvfTpC3bKU/bL7cPd7upv0AI3HDZl1iXa2p1zxQn7f7ZVKYMT08ZiD/dV2IvLyjRW/JPNGmb7Rik2bdt19PlkRR0t0feJ4BApAti4UAgZ+AYAgIPs2wXf7oo3h8VIoDJPaBmOdBNVS7OEmvQvhO8yG4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfHtkWwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5TqUL4M; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcaTX3450228
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iw/u9ZrMIQ3ULEddbptuQOr63BuhliJaBiAN0b5L9Q8=; b=TfHtkWwz16hDDkjr
	LpIcICOfPQWP9LtEDyqw+rZmBSc1jT4mXDXPX1+Ag1SfM38oHsn8g+4S1bWCZlt4
	ZHLXtvsRmGBgq24yWDLi8UVz4XNZZcO9y2tjpLErpba93buYWjDICBjwrgBBko1b
	YbK+Hu4ose38nsP02DZVkiyppGC6oK8Gm+NCAuWjiHKCRdAfq+Ik3LVjxjafMvIh
	cxwhwzZwFzL/v3QEqIYyZ1X3o01807rWjjd+lG5Eultn0IJbDqA8KUtdVOLjvrwq
	+shqf0Cc0E6F9RhblwC+9P2qtdAsO8ogL4P1ZwqC2zNWTOmob4pzdvwn4cKKp38I
	JvWZKA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka8y53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:33:02 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bfd77ecafbso247753e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122382; x=1784727182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw/u9ZrMIQ3ULEddbptuQOr63BuhliJaBiAN0b5L9Q8=;
        b=c5TqUL4MzQFAi3mqESIXPMTlQeM8QK92CAlJ1M8+YVmK7QBZ9Yh3Hb3DFUvrkY5Z1r
         hAXUMaI28BPaX3VWRY0Blao6ffR2aduFps7icJ5Ly0JngeGV2CmT7OiypWstaLCMX8hq
         RJbk87G29TFLOdFE2x1YbZ9TLEphp5ELartGcdjH8JVZObZjL9NJfPb11jaDWvpLcntR
         2qxuDwteaxHAxajpTu65P65owUnEuoKm+T0uh312sYtXtDyDNn4HViMF6X8kapATAmjl
         NSf92Oz2g49sGtiEkI3NGQ8AStojz5UkKlnUcHijKej/VcuSyU0G9R5uBEHdqhXPaXa2
         ctHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122382; x=1784727182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iw/u9ZrMIQ3ULEddbptuQOr63BuhliJaBiAN0b5L9Q8=;
        b=c9aT5GOSdyZ1EZPlOKR0Y/hDBXwuQhKvPbdOUih4fVMYodTummUxMNYPa2gCPWbK2+
         ioCz35knpPwP+SNnnArlFptbEmGgNT0iWOtbUecELK+LHwQgGgQ1oKZLASeNU3zAPxgJ
         LIGZ+YBYl5svWef4YHwj+JiddsgK+wGnsjrK8cBE4JnLtZRYkmyHRXwC4Bo1+i5RfT2z
         dBmy84+B7Ug7+TEBktTtX3t5IUIKM4yspunMkKrPOdwCoxa9AfDNSG8XRYva1EW9EfMV
         GeNMaXznWqKAJG1Q1U8dvLDVelU1YfHHqHSdX6iBYZp2ddJu6Rbduyxf8r0Al89a8aKS
         z84A==
X-Forwarded-Encrypted: i=1; AHgh+Rp5rkm9FppYQGhyX+Jrpf1GT0RUQQLntxxKfMFhYkyhKq6q9ES+n3PWJZNRep+owCHpHEVum0cjyJVCphQL@vger.kernel.org
X-Gm-Message-State: AOJu0YyVXFdy2YRdFz3J6vMTGpshZ81mHUkpPhkBazCwyW8kUTRH7zvA
	4PHRRHH2WFy/h2QNgS8AbWEYwQ8NckhUSu3s6dH4y6W8+tzzABR8E89tmlHqs/zrVkifZC1g+Pl
	mPFEXR4GUhh3oMOs/GSVRq0oFByoh2i/Eg+6QUIE5XpNG3KtXXESjWGBEKmfomKvCuwmH
X-Gm-Gg: AfdE7cmhEgWUpyrpBXbkpDsr8O1sDkK280bFzWUiX/daLDM+50e3KAtJOvpR4RPFfbt
	uNqSr7cXnTiVfW90BEBqOZlK3cydipKYUo/irp+rDYvbH231bklEjqMH+aTHWzDEsWHBc/ElE2E
	0FyLMPk/T/RONVETyiFy2EsKSrK1zFBXYtZaTcYbddrbcPHessZoxkKd66qHtwOSVjsWkouuwn/
	SZSnYP6MUntRV/oHVQ1RQhutUMoF0apDtmvCTmA+lJCS0toBUsVjlGXBGl2lkPQvEsnOyB3Vdl5
	vebICPBDDVr37I8ZZNQA0s2GpQlirPyW0FutQuGP3+Zq+NZeywwkkKy+O2zWVE4vkN2PSSckfys
	//SDgFXreuGNEAGvyCinry/cNT3YoesrBfQE=
X-Received: by 2002:a05:6102:4499:b0:740:2974:57bc with SMTP id ada2fe7eead31-74533b1e81amr4012850137.2.1784122382013;
        Wed, 15 Jul 2026 06:33:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4499:b0:740:2974:57bc with SMTP id ada2fe7eead31-74533b1e81amr4012773137.2.1784122378668;
        Wed, 15 Jul 2026 06:32:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168731831esm26739166b.31.2026.07.15.06.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:32:57 -0700 (PDT)
Message-ID: <f8be6eb8-00b2-4f34-ba7d-f66f1982cab9@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:32:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: glymur: Add CX power domain to
 GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-3-72eb5adad156@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-3-72eb5adad156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a578c0e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: DE_4RMFOvFjsDasrm-_ckKOKJstFOc-Y
X-Proofpoint-ORIG-GUID: DE_4RMFOvFjsDasrm-_ckKOKJstFOc-Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfXzAfTXsK+6nic
 61eRX+o6Ebc6NbXfkXCe5mcCNSmEvIQtXK+3CGZLOm34K9wm8Ry1WpD9gst9HGknmAbC+rTRPvT
 tiA8YkjgDjVvblJkE96iPePE4wiO8Is=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNSBTYWx0ZWRfX7jGuWBQL5d8v
 /ltPDuPeLc/5fY/l5goKlA1dUgVQ0iJF+t59LpU8lMhjjuYGzGYZKN/qWu8PCMtVA5e48UEILhO
 75OIe3y04jc5w/pVqYyVDGcw7X8m+A4zLkqoIY+2EomEjXlHl2r2Whb0NoIiWti1dvawguyKTbH
 sgGYAz3k/lVsjD8nh8Ho47pJ0MZTqgRONXbs7YLbrTQ0GPbfVdzCNFJqKfk58xX87gi7Lp5l7nB
 0qA0jcuqhRiL21dr/Dwf/fqWLlZYMpkyJjL0cpedodzuGv52lAarT+RtXj10ANXmsSFcTbbpHBF
 QhTiYN3KzZ/yE1PFOSqcElU5ATXJi95aLm2mnqoBk9YD/hjPmZcsSDGCvg4uzlZB/TBThMFc31A
 Y8gdWjAtZgh+D+4tZf8PkiPnGKRqpc2+8hkhHN+OPXdkl9k2SQ2xuNp5SojFxJEGBSztSvL0TLl
 rVmV5SC7U2fh8DTXryA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150135
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119271-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:maulik.shah@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:bmasney@redhat.com,m:krzk@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:abelvesa@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 995E375EC34
X-Rspamd-Action: no action

On 7/15/26 3:29 PM, Abel Vesa wrote:
> The GCC GDSCs on Glymur are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

