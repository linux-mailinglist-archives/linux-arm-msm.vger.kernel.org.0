Return-Path: <linux-arm-msm+bounces-115459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mbvICQfPQ2p5iwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:13:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAF36E5485
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:13:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="l+ZGPTR/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fKeF2hpb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115459-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115459-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17BD03018D98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1945374A07;
	Tue, 30 Jun 2026 14:09:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD34B40DFBD
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:09:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828570; cv=none; b=ddkybjSyt29eZtPnFLqA3nsIzems8Vd1xFh1CHxCzq6FUqihQCE+/ueoHCXRkXha949sg6BSc6zplzA3jDQOo5sjepGR9NivEoibSPrpO/xAZgwTFD2ipW2WJnaJKy9SsoVCAj6l5P4o3ex/OvABr+Ytwa/JMW2B5ma6fUhwZPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828570; c=relaxed/simple;
	bh=cB1rzD8ttt3+Pf+ZC36TaOXTRkhlR9lFs2JuBGQUUfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTSAicG9jLyQrZ4dDI0mkOQYsqJ15kAHNuShAU5bWZdZBfiBuLtgIvG5Sk+ENvu5gUfN2Sq09C7O5C/nVu9fdzmsnORcBP1rSvucMAckNfaH6ND8/S5rgkjUn52uvwArJLdSqS9XyehxIs8f0clmrJ6IDH6XEykqyZF4XPISB7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+ZGPTR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKeF2hpb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mnRa1541495
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=; b=l+ZGPTR/vmlcOdho
	OUfrMpbjEUKfVs9bvMHEcwv6H4b39fhh1wPo8Dm7jgzukwZl/PSbgsaLZaMbzy1q
	ITBLEm5XdUUIN0mCuUOTCB7l7Ud8iuA4d19qSvbcDdTySF0RHqxCfRI7LlxFCclY
	0EffM3nelQKouYnkvfVvUDP4xJQKR8H7bSwkj6FYluvSQny+v5SzX21ZTjUMPMR+
	v5XhSEA6kQ35BepHizcN307Txcn12IBPKnU7+7xsX603GaJ8XSpOCZGZSyqd5Xhh
	2RTf4hC8Emv9RIawxllPdEslvboyos5lszxELdnMOugQX3nfKgPQomvfgZ4sXLPa
	iNlckA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp2uqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:09:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-734f7d8bb37so441045137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828553; x=1783433353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=;
        b=fKeF2hpbt7cXhINuGgZ6DIXNpPtufTxL/sv2gumgUj0QyiAC/nPaDNBAQ6tbrtUDuJ
         HGhqXGkJRjndvHsg03y408/OAAE4AzCCJ2AU70pV89KK3BRps9bDluL/j4v44ylAk6dY
         rGgxcPl2TP447E680n8ECTXoMpt2gntL6inutUuYxz+dYLvWexxYoBr/LO8MP/KDELeM
         vp7uHasfcMWf278d4Mz1hc3ugOvR2TV/XbKnAkzYt1JPBgJCWX202uigf3VyfzOxVXWN
         tB0gCxegtPRLWvEpuEP+rn4w7l5yr5wkSmSHkcfn5DKR22F0ap8pCCrYkk19AQ8aIZ76
         xTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828553; x=1783433353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cq/+IEZrDwJouA9RSiTyjXYgqRvfyJwMH0J3p6H0hvo=;
        b=N7eQrIBC3BG0qAV7TkPoBnfN+lLB7RTrqN/YsfC1BPaPBLmn6ojtKqe2APHCG3Ee1i
         n7v9pCQFSD7IJojAKrGWiZ50BEaSFidCesYj0F3JXSsXl1cQXYJBmHYHioD+lQT8A6yd
         xsbcd6BvBX75z9JBsmPlnxFmKlcyt1FdKQsvVURyYBlvbBWP2/ILWYIf8EPlQMWoemfU
         Ub4nvjAlqmlbILTiaH05EPhVrqqO+87y8sQMGwSyvBiLNcL9UmNev0rsHLX4AOUfHkH6
         BhChrHUPUWJ5g9zcTIRXzLhnzv2WAeYirTGAg8sWOW1y8rtkqjLb52V9j5mvZIBiBDlW
         T+Aw==
X-Forwarded-Encrypted: i=1; AHgh+Rrk7CAaXMFmDooezKnzIbYYjrwHoCq1drLVaN/IjyRVvfd81eLL8XZM45gytInVSVznGWdkn3xY0O4S8Vh0@vger.kernel.org
X-Gm-Message-State: AOJu0YzYy/Sx8xompKzCfyLMgjf3dFrbSS0PVgrgWweD9DAfkgGri21N
	u7clUNFsBzB8fQVF7Zbnas8dyDxtW1M9U+KzE2Y3KLMvL4ngCoNEOc5s0DmF6xrcMeWC6OZ4K5X
	mcyXL/36aiU+jvenh8r1w0ugChgsZ7qyf8QgC1Vrs/BFlCN80RaDlS4B3zDzZsYaVYGAJ
X-Gm-Gg: AfdE7clFjkY8WIvoChXWBYKumqqx9R+oOKqSfIoBf611frZ16bq/opNOgZ8gSbOm+tz
	NKR+8G/0Tge+nx2RiJBqpKzex9gP9UnkuF7VuC/R1Mx4GgW1hAgwT3uPrlP+zb3tjV5CJLj+2of
	W31aBLZyd4XsC2/jEXXDyIqJx9Y6IfQ7KOhOa4XULNEnYu3GD71/2Qo69yJQacKEkouI6zZOLU5
	dpsOKifWH4yaRbyRto7tfRDAqvLTjU49v7VstkgTDoqcNbCGIzfNFxvi/MmgaV6UJwglI0HOGD+
	EOVOFg1Z0TUPHi3todAkgt7lwSORNj2Pt1rW6WOv2GEoH7/zrT1WFCFJ1j+s7kFcxVC4ChtfEW5
	nAxmNgotT+kgYe5SGmT7No0nH2XY8KZ92yJA=
X-Received: by 2002:a05:6102:8081:b0:72f:6669:286a with SMTP id ada2fe7eead31-73a363e653fmr674939137.2.1782828553181;
        Tue, 30 Jun 2026 07:09:13 -0700 (PDT)
X-Received: by 2002:a05:6102:8081:b0:72f:6669:286a with SMTP id ada2fe7eead31-73a363e653fmr674926137.2.1782828552777;
        Tue, 30 Jun 2026 07:09:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc1esm135860766b.41.2026.06.30.07.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:09:11 -0700 (PDT)
Message-ID: <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Taniya Das <taniya.das@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cuoIXngu7ZM9SWxG0y_nbRl22fE3pZOa
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a43ce17 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6vCOFkJVGQXElGg4amEA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: cuoIXngu7ZM9SWxG0y_nbRl22fE3pZOa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfXyGgB4MUqq8Gb
 8py+V8QOSZLK9H5RlQiWQ+N8kV0O7DZ+o6YPutC4GTdF8+NbAuUO0ph7sjqLTNXZAEEYJRjhD5k
 mCLvAPgDntbtbLnC+XHg09FbU13/Y8FwWHN8px5YkoaxGjJIuiLx+4dP/qWCk2TnNGTAkcXvux0
 vIV1zGDLjWsvReeXrAMieztzbx45ylGqQ9qsYia3nSpHSf+P3+UXtLxx3f+oEIkvhqJ1zN0OUwg
 CK31MTKsUKwv9Xj0MQKb9eoXvf1Du+7kxIRn5V6cmCSXtm/AjOUd3mrWQc35ByyTBIpUWfd7G4v
 RG1KIxelyI8hOeQYJBeHYHlqHdHacn1dQd5ajVbUqQ3oi4QHSFQHWGVYTV2haTW56MJPYtHyVde
 PLaYlA5i7OCAF4rxY+SV3PcV5tdsGvVVnThFmL5vlFxc/R3zxOOgQx+1YkECJSXPssOQ3GXyW6b
 g7280hEMXLrs5vNGpog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfX9zmnGUnP6ZXm
 mx7UDvPmR7DAGMvlFgSaWDkgedxTnhLMWZzQC8yvTQeq0xoaHoAs2fWAOjnIKT3O2sy/Q4ryTye
 TeQWtysWJ0T+D2/Ugvs5qvQpYJPpzCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115459-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 1AAF36E5485

On 6/9/26 5:02 PM, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Almost all of these nodes lack power-domains, meaning the
aggregated performance state requests will not be translated
into RPMH requests

Konrad

