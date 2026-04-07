Return-Path: <linux-arm-msm+bounces-102114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKpFFOzb1GnzyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:26:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C8C3ACD25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F01F33087120
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAF330EF7B;
	Tue,  7 Apr 2026 10:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CH0qLK17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kmyqcG0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADCA3A7839
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557287; cv=none; b=cot43Moty9B0y3dTono2DtFF3Pv+3moLpjXlGtTmqawx9gOQs358NOOR/JLQpGR5IcrCycm22AkIGPXwkkmera1vukMxAg2wyggJlLEXvnD2dwqiQBZPfS9XJBM02D4lFvsmMFZuqQoYK5aiqVVawdQYI162Ov9AZZA5dOL1njo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557287; c=relaxed/simple;
	bh=k4XUKpLqkubWWFx6MiS4fNCXcrWR49bP8C25WodCErA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKgnqwQqZJ6Kar4VDRUD34XgQ9wI08riQyk0eJGNv6zBaCvxzWgTmhhTAw5XR67Q8eVfL3vloNtntQVdf8DSyI0M9jRLQBsMRnnPpYvmUtzff8yINGd/QXln0cZU15eT7lPVoHu9z8EqLklPuoMSl/UjqCmNWceG0whJz+oJxck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CH0qLK17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kmyqcG0C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Ru7w2550324
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZguX743r0gyTJOc5bBbYAt/gY8tHuQCdVrp7L/+iEs=; b=CH0qLK17FEtgjhjb
	Ycsawe15Ha/kzERSKqayUsfpqMpGg403oM1DPIFsCnSzL7aUYLGgF8Jb6+yjE+PC
	Zq0F2bZeVCOAvP+24RkOFkNE35ZNyKRfdgCy2kwmmFIfER9QodnewfOzpEfE6PnG
	30bryTZHm9AicdVWM0Nrgb5Zjl8TV8X9PZvUOCT61DdIRomPK5aeUd4uuoGpGb5J
	TD3Ft22WG/+4R7SmI4Wi8yrs19xbun2ocMvQ/twqt3o3LjWFIQAf3hfXFwAa/b3Y
	yATlfMKl06dv0mIU2ha6M88HzkpkAx9nxz8Qhcfvd2dxvfZ/6efi0jXoiKtBLw9V
	V9TNzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea8tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:21:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so128374185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557285; x=1776162085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZguX743r0gyTJOc5bBbYAt/gY8tHuQCdVrp7L/+iEs=;
        b=kmyqcG0CCHmjvVfAyLxqDOJQSOahGMSG5vcT6cVJRXeIhQdO42Qa6DrLmp+ofkAsuc
         nOikyEvl+YK4smij4ysdn6b1ouJX8yGveePPCmXoonufS6frmGjPtVX/NtF04ull3uyI
         4LIm0EiZ055G2uyKtZTSLPsPFPVIl1eDx63N/7Mcx/Vv2rDK1q2W4+PJkp0Qf5Q1YZFV
         g9NdBTv2BJ9cUNnrjk1hZ+7pIxn2xYuBgm9VPThm7hLB+ISDms3ZRDJltXOgpuUy/m15
         2PE6DVIHYpw/RRgWgXKByhCSEs7p/oxT/7+8Gp71LHnAkxiOBNMg8zLL3JW4NmMvtKdP
         RyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557285; x=1776162085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZguX743r0gyTJOc5bBbYAt/gY8tHuQCdVrp7L/+iEs=;
        b=QrJPhDI2SDphSvhgC0818GtzClVdoHSpFCTzQLPmKlQ+oWUYSugd/mpPG8Q5sVAayG
         q91HipQYrB66NLhP2YjJbc3NGFZ/op8AXDsjFR0kLrYxZEpN0P/C+TNJn/yVtuSFyp4c
         e9f2iI6MC4a22VA3H3lGHhjkhIY3k+JVKyCcl3RxqNO4o/QHKffvns0jx4jb6e6IWTZq
         ZyXQ3/rhNfATwYjp2kzTQIOqmytEr1zEOZgNi+pmLRtMHrCr6v9BuuthbcpG0JFlMQMP
         LFaB1qBs6FcO8f2Z73edddSk4Y3TFpD45+beeV5J7obMcc1UvvBj3dTq0h/rpzORElAW
         xwVg==
X-Forwarded-Encrypted: i=1; AJvYcCWYaFufzrv2apJkzntwAYZRYTrBgtjnTtHVOITf76e2PBnw/Q8MU6llpToccH2cqaLTCaaiZKd6gPvhyc2O@vger.kernel.org
X-Gm-Message-State: AOJu0YyZN0Ar6B8r8sznhZGvzgc7ROUEW1G654NA53v5ghRTykAaoKmD
	wmNrBv4SXhFtFz3tAQ+6IrdRw2ShyNgygTqEq90CSnSfiN+zsxZMWApuxBcw3iTOZyr1JE60c+B
	eAO3VjrvkbB5GFO9QMzZWuPg7FU+RqyaUmMf/ScdY3sRAcNxs9zcYHugt4HjMBkxnxRIh
X-Gm-Gg: AeBDies1qW6GWBprL2o8Wz6Lr5bwECF/PkyvlolDS/OqsQIV12N3rbTjYQhN2TvM4T3
	z2oapEIxO8OdPfGtMVRk/l7A8N6OdhkbF8VBsTDWIYK7HEMAs1EV/XfFUiM74fkFUETA0TBkGuj
	V8NG9iWkEatDCpbFl0GRYGn2Z2y5MqKfZegdhEYuTjk+9y7TIBpq97VdzUfIw09XjPv5W6+THxo
	9nZ9fnH23hZdWCtEK++4oF7HaRuwcfqiY9a8stPOlrbAzNxHG8ozISmgRdXh16mMd8QYz0FTdkT
	Hq+hy7wlVvTiAFiFWCgF7qobIaGkEXN2GiTut/ITHqfT2mwCOe1iEi8tDAi0HebJXgqUr3F1gcY
	Pk8v4BtEgxMzsYH8fDn5ZQ/4kT75FUiLSORPdNde9g0z9uoR+ozCBxaId36CIY5xNmfL7TDQfhj
	2sdEM=
X-Received: by 2002:a05:620a:2590:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8d4185cdecbmr1609798585a.0.1775557284947;
        Tue, 07 Apr 2026 03:21:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8d4185cdecbmr1609796685a.0.1775557284508;
        Tue, 07 Apr 2026 03:21:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034bc112sm4047545a12.25.2026.04.07.03.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:21:22 -0700 (PDT)
Message-ID: <0e558d0e-4306-45d5-bf1f-df692c3a10ea@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:21:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add IMEM node
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
 <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4daa5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=jsmoW5eAAA8I8i0BJVwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: bsc2wfbCSfLRHKBsuR-SSH8yA3PwjLZl
X-Proofpoint-ORIG-GUID: bsc2wfbCSfLRHKBsuR-SSH8yA3PwjLZl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NiBTYWx0ZWRfX+V9WOSPlUnGR
 EqmWFCzsilAIbrG5QyFKmP21cTe8hMqQMO1O0ww7V3Asa/sVP/ylBwUm7IBVRQJrz23MF/yFHir
 ntm608nzYOjQl2wX+vnDUhCbl8qzSuviYf8831FJxAv2aY63umoeKcvrZiWTfBfG9bo3QXUo6cn
 tBOiy4tuKcKJPB1i/+oSWm45OixINXCTG5fj8mJDn09NRkfS+Nb49wSRuX5t0RTKYDRkUbrtx6I
 fE2CbN5UuCisEpdSE9RJ8LVMEQze/MAavtkSektgCAGPvtQqk5dS0sl7fxacWxHqGzUQwn1CgVh
 Ona/UWySxzR/OucDJlQLnMtEGyFObyz05JJw56H+pfGWqcdlMdcCe3uFudRF9HL30ZfoXSvgjmf
 N0RTP8ghXUQTLPl/JWBe9Ej5Zz/wkaLw9+xj1ObfYwYCmr5rNcn8+SmlLUAb446gZtsvys9yucA
 hTQD9LDjgo+snkPbV/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070096
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email,0.223.255.192:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102114-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9C8C3ACD25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 5:00 PM, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> index 4a64a98a434b..1c045743ef77 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -2289,6 +2289,25 @@ scl-pins {
>  			};
>  		};
>  
> +		sram@14680000 {
> +			compatible = "qcom,milos-imem", "syscon", "simple-mfd";

With the new compatible:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


