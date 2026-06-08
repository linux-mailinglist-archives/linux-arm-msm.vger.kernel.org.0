Return-Path: <linux-arm-msm+bounces-111815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6fD4KNeeJmrXZwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:52:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C603B655554
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:52:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AYmamVuI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hir1ueIX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111815-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111815-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A166230A0E8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD733B6377;
	Mon,  8 Jun 2026 10:22:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB73B5DED
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:22:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914159; cv=none; b=W9A00uFg3U7pmX8RcTIKN0VoaOPaCvEARtvSVD8PfIso4+e+oN6PXk5/JjfjuRlTwLSFOjTSX1QR4iyV3kTkFkEg38jAjCQqqCva3zrBEkY6yfhLn+ogjq7Z5mCHsupJIChlNo5kPJ/9pAPH08b2jYdcJs7GRKOX9Oxfss2T+mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914159; c=relaxed/simple;
	bh=2zV7V26zU4pOU/kgTmW1ImaHfMZhebHeA7Bki0BNmjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsMERo9iA0X/dn6rb9YwXIvO+f4RVVoHeBJbU7Tnbe03WX7J6JsA/I/IPdjOdkrD18BbYtCiwXX1iRO9ShAKJkhGDw8sO9jOuuvQIa7WeJ2KhMhyrYpbuz6R7fh8KxVEXCKt2gQXfSEQoDMmTuaSLAc0ApTDFhbxJ8PfiXXcRJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYmamVuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hir1ueIX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Orwg2274543
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYvl71QtDzEZ7qSnEjRK/0Px3BTe2QEgb2RI9epOOUU=; b=AYmamVuInxW08hQT
	1Dr2d/29gXXEMycGMyF4zaT9Gwwos7EpLAQHWux+tNwYa947NqDrmicztu9HzBH9
	t4nsVjhgRHgHLjXIUKi8VCE7DgK3eweVxqqh1tGafVm+m46aSiM4outvodlYh26R
	uZArtAv/FG0gPQyvZM9FHa/hFiNsF8gtCCw1FX9uF+VB0gp8W0+3GSocbrQB+E8R
	c37kGs6O1CnkV6BfVsZIibuH+1BIutlsiqkWfj6YFFAp8jLEZ5HXSJEpPvXtmVp6
	90wjoCkOP9UoWsJ+yOQR1AUh3BiqtUESHdKPxSK79KCO4LaWWkuvPnIHy8K1ppuP
	dlyFog==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgy1yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:22:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccef0be668so7657796d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914155; x=1781518955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RYvl71QtDzEZ7qSnEjRK/0Px3BTe2QEgb2RI9epOOUU=;
        b=hir1ueIXfIOwLcm2rtW0XWKyGH9YtAUFdHXDao9bT+hkNCc2XUhsm5lUPd/FhwzwFK
         67IlKXUQNhO4SObUKXBLQ3+oSFQGdlZP9GmNrJSXNRx8NdN8ibw4jUZYknxn41zmfebJ
         xNCSnrVJu56NyuKDrpmIiLsTHCwRyw+T8JrfVeMgq3rWP8Zl7YUWSpLhLRTMqwdSD7+K
         4TduVpuFwTVOydfDe1EMThXcC7SsF2Vf/Zg/oqiKGG1amAcNwAMtAECcbZy3LoNRwlI0
         gtH7Ii2uAz/J71FxQYPdA5xepB1gEWiIs7c9RmAgyMEVfzjvcRdg3SYDT+DSYgXOuQvx
         9n2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914155; x=1781518955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYvl71QtDzEZ7qSnEjRK/0Px3BTe2QEgb2RI9epOOUU=;
        b=LDAJ6GkC+Uvr+XSuhkNaG/1wSEnhu+g5yYc8ZjjV6wnlQwEUbfhGk+AnH+DiJ9v/sR
         IVsWuP1AVuMehlsr0phI4q9UuL3LD+rO6YgFhjzd8DikrbKewOdWIIqWAfJzQ604zrPb
         VDJgAl12mtz9S12P+zxDba/hVkEVAfs9wvPneHAFauq1+YjF1HiGD6U4KXtksSlteLqB
         xCqrg8Sj4LxV6ZOEpjLZyT36bUC2RN8z6NziLK3P4wJcrOpCHqhzLqpUXzyKoNIxNMgs
         AZ4JQR3HvVrn7S1gv7hwCBrQPYsprxPA2AdN2A/VIwiycroUlfcgfi9k2O2LZLtmPlqf
         lXcQ==
X-Gm-Message-State: AOJu0YwMOd3Rw6JP0S7MzPkrGwAQ3zBvYGJsGwWvRtUadHgbxhZkKrMh
	wTuwuIWLuocQm08eQfPF51+VIxQGTwqsBkzMrOmJL0zAwiiTbyfxhwZxcyoB34neSvs1WxJswJR
	1Iz11TCt/oxxNt5tL89qeoARnc2EyCM1niWj9WM+dgb4ybPb9PLEsZ1bzMDnc+HZEPyeB
X-Gm-Gg: Acq92OEpZfPZJHqGmC5nu3CI2zdSJir+6/G4O2BzdmApPFxbfusDv7ZqUZGziMkw1CW
	BRVidmDrKfCuimMJLUyyxe2CzSY+qICEVp2QDC8w6GuMkoDra4n+qdvXpS7x1No5/U2jWoQ3rla
	vj4/EGy+2DAjatupf7BPVOQJReaqghCQ0oNjV/Ad6WRn6lRDlNXwvR/u8UKfpdvM1vbz3r43J2m
	cB5ML8PFnq7CykIHTjrGrs8F9zsBAJSu6ZG33dbAGiKIx3WS9F3MrsKgXtgAEU/B2t5umDXYeLX
	pEiQHn5CXagg9bzMPe7/TCGXDDo8bnHjgMZ0E4/OeDw7LZ56lA2KGinCZwMs/N2AQvOebkXiIYt
	rudAMi0oVp2V2gDakGifK1Hzw6sPVrqdYVsC7PNl6tRK/wEy6OPhb5DEP
X-Received: by 2002:a05:620a:1787:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915a9d85c2bmr1432111885a.4.1780914154930;
        Mon, 08 Jun 2026 03:22:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1787:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915a9d85c2bmr1432110785a.4.1780914154487;
        Mon, 08 Jun 2026 03:22:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b58596sm6917561a12.30.2026.06.08.03.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:22:33 -0700 (PDT)
Message-ID: <c59579b0-8c88-444d-947b-615a623f42ce@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:22:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
 <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a2697eb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Doh2zD5oPK5BlR8ocyYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: F2DdKjhdtOafigvVjhtn-Q0gLaT7LK5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NSBTYWx0ZWRfX/zl5wYBGEPm8
 qMx+uCVr66aBQy0dbjKHWCpOdUYzrDElY6jwoLj3bX4dS5fD3FEhslu716QFUKxaa8bG79QIn21
 Rdohq8UZX+1Fjl4UjV4HZmD9S/IE5US9dMhOniHbio2yC3zb/egz0atU4crflPW9Pxz0HlWDs7c
 5lSYZo1+vqyisBpancjNuVfsfhzcrr6AG8yuzs+Z5kbzD05lqrumxSl2E5i4CKik+KExAfpL+4/
 kl/hnV26LpI7XGNPvDpGXMiz06/HD+nkGCVU0KIL+vjsPzn3xEMBWziFlLUm1axSZ8cS97RX+0Z
 1sMRxvTzT3zjW1L72qajb22aQk8RRuZeKmNnd0gSiQ0F/Gh8aUQ9rzo9VLaAUEv/+vkTKFd3KvM
 m7/xj0FjDiIAtYqYwV8riVMT9TH8k+gp8MO6GQjWa45209fX9bL4EPtFJ/8BI6+w0q/km9Mz2YT
 qg/hTJClepwfZ8ouZZQ==
X-Proofpoint-ORIG-GUID: F2DdKjhdtOafigvVjhtn-Q0gLaT7LK5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111815-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C603B655554

On 6/2/26 6:34 PM, Kathiravan Thirumoorthy wrote:
> Follow the new binding style by defining PHYs and PERST# (now RESET#)
> under the Root Port node. Avoid mixing styles and move these properties
> to the RP node.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

>  
> -			pcie@0 {
> +			pcie1_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> +				phys = <&pcie1_phy>;

nit: other socs (like hamoa) do it like this:

pcie3_port0: pcie@0 {
	device_type = "pci";
	compatible = "pciclass,0604";
	reg = <0x0 0x0 0x0 0x0 0x0>;
	bus-range = <0x01 0xff>;

	phys = <&pcie3_phy>;

	#address-cells = <3>;
	#size-cells = <2>;
	ranges;
};

Konrad

