Return-Path: <linux-arm-msm+bounces-101697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEWpGg/zz2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:04:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C60EF396BC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4029630166FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF733CEBAF;
	Fri,  3 Apr 2026 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mmk1jOuI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCWhpWZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993CE3CAE73
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235694; cv=none; b=EhBFBRQBWXU2by3R7Dv5Y1GM2p0L+ovUyC4/RCs30gWjRS895tupDDo5MRfx5cEVDNl6d5iV7JjicqzT1Iy9Ppw8UdY5mLk7dh8VptvyWm1+C1AtALdXar7Bq3KdTEH3q6ZqznGoSMLVFhy8RQF2bYPBNMYfcH84Mv4SH6HnoD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235694; c=relaxed/simple;
	bh=PA0C4ej5YL/VzFP4tE4ta3PvKcduZVLgCuPM3C6M4eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLO+aHA+4zh4l9Ry8tEWtaxu+60wygU8ekhwbUcBwJOxcpHipdppQgD2vUWHVMFjTOwsQKrmWiz9MYVWwxJwqpOZnr0eE4DCSC4GvmeML0fVuZ2PFysQ3Qxl2TTQPLVKmJjJLNuROrjM9z7g2BeK0YR2oo6sS823RtsUufHZpgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mmk1jOuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCWhpWZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FDNTX3449844
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 17:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2WCjm4bmftNP02ylQSc1VUrhgMuL1A1n9jIOcKmvYA=; b=Mmk1jOuItibzAY61
	5woSpu+MRp8GecYFWmWVsXbC7WU8yBvutMc4CsO0WrZgSiyIgk5gP0bg5edvaRKL
	B0yda2FyHSQKngPNvkctzXEZaTecUQgo35b0Fp5UNmllAJYapaqcbpHw4MzXWlIT
	zy52BxksjcWxx1HdbqPY0wf30geET23v45ZQTOg/doOAePBu6AfEH/LtkhsH2rjr
	QDRSwO5RTZOOkeNx5EEj+QeiTKWAvk+Po6pA2FkQg2+0k9orkkuts0V0wzn9/sOd
	RLI5oghNoOR5ysLWwMKZhk7jgEJHnob3rr2BVE94m6ZbamNpDbt/hkHrGtW3qcA6
	2E534A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u59nbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 17:01:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b242f76113so22884725ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775235691; x=1775840491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2WCjm4bmftNP02ylQSc1VUrhgMuL1A1n9jIOcKmvYA=;
        b=CCWhpWZGrCWtQX+aO6UcoyGaQVt/Q0mjbj3xDFjrUqfArvOtM2FMseLobJHuJcgkls
         u3cMF59UxQM+8ZwFxpARLrrcQOKeRAT8jHN9vfqYYCZ5IZDrV431c5vDfTLDqgOWt0Af
         cVSWWYIV+XJ5HMAoehNd1+4Ov8QTSOo6plI4ZyB/23rzSbA5AF2UuKbmU5pgeX6R8+lH
         +a4J61G/syzEbi4YqNYiNZXNwz2ZnncD9FrZEKb+UgMZ0aoxzMVbjHyDFJTqPiwonS6F
         pFFcZdT3vpRkUlnHypSp3j/SWh6jXPLFUjNUeIqwUYj8Dr2Lrm9FJFRoPXZA2Tkclv5l
         oBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775235691; x=1775840491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2WCjm4bmftNP02ylQSc1VUrhgMuL1A1n9jIOcKmvYA=;
        b=Q4Ol5HmxF/1qKgdtVvD100mUANL3ir3KGXnXd1hYPrH+y6mSfGdP9Fc4EdcOF403kY
         I5KN3bIuErYjxYnEX+GQaZLfuBA2dm4NzTDgmXqoF3EHbLYmxOUkBw63SruQhfGZtbYm
         YXVZXGRK+Xr/PP9+Rjuz3H5zMNCpTZcMAAcbhjfADOivMYC3wNOTRUzwgUw/QafcqS0z
         stT/pOjfqvDvL6qx4rVrpW/6gHJKPOTlsHdHe3zKIyVuPpS249qpRBZYl4tRJr6i/Acp
         xDBoG5OxFHQcTew0U+77scte2iG3Bh2nbrRElx4JdIgY3K+GjDuuohkace4Cjo79MPmi
         xoug==
X-Gm-Message-State: AOJu0YzbLuaNlLX68A9/yLOGKIYnYq+3VzieBoI0FSrAU8YQOMokRnlk
	etGws+DZQNkK46JPTBhianghU/Yj3SlU4sJxXxOPMe/KZXGIdsTTyqDeIcUE//+sGnTSaND99OZ
	RR/Maf/iQg2mQWMtX8dpwMfkPt5QBb2agn3pox14fyC77vPZwGGANr3NANg75HWXI9PPT
X-Gm-Gg: AeBDievP2eseVH29HYw4UTpfTuObJSAXZKwh6/mBFBzhD4/rtXVWsJ2EFSRSflBnE2e
	Qq7QVDrmwd0kWQ5uLAZFqj4XS1DsvT4oF5mWkb47TpKTnk6vuZuQqQ6i1mt5qnsXGpa0IP3dNcj
	k4ddfcjPIZsbv1xHnEF5YpgJnThHfbb4Rxf1bvOqtQwVoObN+0NHUGhUHSWGG7/dH/74UWvTd4v
	BosN4wp5FzHYUIlQqe3pUcRsCbMevHGORbB/RkxmzcyndNRtFGkWtC9+700TvdfLj7N1snOc3D1
	cVyR3e2Djn4LM21VElyS+Pn42UpNk8hFniZYTZ2l5BN3UbaLoIoZLZ047Fv5U6K8i9J1/5irOAk
	M7GNjI7Fq8NbuBvF25ShbcKuhdua4K2zSe5HiILrm/CSuZJSc84s=
X-Received: by 2002:a17:902:f642:b0:2b2:49a7:a5c4 with SMTP id d9443c01a7336-2b2818b00ccmr32553505ad.27.1775235691251;
        Fri, 03 Apr 2026 10:01:31 -0700 (PDT)
X-Received: by 2002:a17:902:f642:b0:2b2:49a7:a5c4 with SMTP id d9443c01a7336-2b2818b00ccmr32553045ad.27.1775235690603;
        Fri, 03 Apr 2026 10:01:30 -0700 (PDT)
Received: from [192.168.29.116] ([49.37.147.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd4dsm61858985ad.76.2026.04.03.10.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 10:01:30 -0700 (PDT)
Message-ID: <e4bf900f-687e-4934-8ddf-9dc0eca96c02@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 22:31:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Fix ICE reg size
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
 <20260402-ice_dt_reg_fix-v1-1-74e4c2129238@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260402-ice_dt_reg_fix-v1-1-74e4c2129238@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1MiBTYWx0ZWRfX2vHZD3gjWzmQ
 X53KfPuL9KQ+muN4n8a8JmmSqoMf/Bf9Kb1M5E/znIDNaHql/lzMdlIGsU7TgCegflRBYdXfL+k
 acgNaoi2Z1TC1foebfDCuay+f62YMS3rUNJqVBSGR6+/8oOoCLX6j8EzcMj046Q9I5RGyeadwlT
 t7FpQvQjimt23WIoC2wumpoRIbRDA1cijRgaqJ10M9klsw6hXOWvEpqMHfO7v8s1oMLalG3jvw6
 gF1sL/eq8KWIpdEUjgUg+67TPmIZ+e2cru2ISLOtqRZK30uCP1Nm9EUnRiww+LuvrvG5xEI3hqu
 fcI6O3uq1p7h/Na3XA2QTRzOFdc4CEgyTQaYUWIdqiqfbGYPKTU11SvrkorrxT+j1JZl0YD7F1l
 h0XeMa04ytiMBMvNJQIzEX4be0ArqEjjRIVqat0ruf4NJubYeCoQOkTNOiUNLz3DIZtGOmHDrhU
 CQcLBCeICo1xOQy8otg==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69cff26c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=pj5RAjPJ5lVSI15MjsbsBQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JbxdblzTRLZAtYUtz1gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: wH5M8HEuKfrnj59mvaRHIclbD-9IrHm2
X-Proofpoint-GUID: wH5M8HEuKfrnj59mvaRHIclbD-9IrHm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030152
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,1d87000:email,1d88000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101697-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C60EF396BC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/2026 12:05 AM, Kuldeep Singh wrote:
> The ICE register region on Kodiak is currently defined as 0x8000 bytes.
> According to the hardware specification, the correct register size is
> 0x18000.
> 
> Update the ICE node reg property to match the hardware.
> 
> Fixes: dfd5ee7b34bb ("arm64: dts: qcom: sc7280: Add inline crypto engine")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..ed8361f79e28 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -2578,7 +2578,7 @@ ufs_mem_phy: phy@1d87000 {
>  		ice: crypto@1d88000 {
>  			compatible = "qcom,sc7280-inline-crypto-engine",
>  				     "qcom,inline-crypto-engine";
> -			reg = <0 0x01d88000 0 0x8000>;
> +			reg = <0 0x01d88000 0 0x18000>;
>  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>  		};
>  
> 

Good catch, looks good to me.

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

