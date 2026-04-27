Return-Path: <linux-arm-msm+bounces-104808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHaJBoGp72kCDwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:22:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B833B4787B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C33A30071F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD573E92B1;
	Mon, 27 Apr 2026 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8SjaOC6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AL4EFtdg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA5B3E5EEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314174; cv=none; b=pivyTNd/NDwArEiuY906sHfeB5gskK18WvcY7W22V68DoNcVMtUJGFplI9VmGPawY+ERXRo2qHK92kSuxFicKuMrZm/vuHhjM4dbLmDeYrQUcppHwGZ86JCCoNcUVjrJarYuBmvJQufW2huBayPevXm+HKcuYg99xP/HZ7IaMyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314174; c=relaxed/simple;
	bh=tw51MsOyz2BGDthyyDgyrXoxxkiUQ3siRaQ/WT+H4yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8krThkeLDRT/s5eazTgUvQa4EDKEpBVHoRmGCq7FSVqR3PpID5EsuhGzKuscMjPEfJ+6imaEJyEO/KfVRs7pLxgJqoHIjqTOedZeopbt+Hy3gHmLXy86ZtT1IDpWW6bBmfHI2lq8v0UASkFp5SLCcltVagxDyQ9S4g0yOmkcR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8SjaOC6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AL4EFtdg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLLXj440889
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JpS1yWQaR7R3cfgZ/X82WKAagfHQOei/La+rB06jiAA=; b=J8SjaOC674MV6T9d
	L0YRVlS9g9EnTQVUWETDg9vZnZEdEp73FX99+6PaBscKm4o/XDCxFONyDm4DCjdj
	GTEyNO+4wPw6SLLIvzh0gHoO/BQHR8yZfv+Cl0TXrSfQmOOfDbOmnsPC1rPpf3Aa
	Z0O4VTOHb29FaPIcnUPhBSTUqjRPJbpXz07D3tlU0+XAzxQZOVd4z4qWauljwqGB
	VfGvdLP4gIePExL14+gAl28rSbW47oGGq0nPT+SFvRloDd5RIcvd5q4O9Qo4b72+
	dr30bnM3QLrTaaT8ArNBpuLGpLbFuaRcgNkUKZJkbbgTvXSnuMFUTTiNfWmG3XE9
	IDf39g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac40pmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:22:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c795fa31e18so5394916a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777314171; x=1777918971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpS1yWQaR7R3cfgZ/X82WKAagfHQOei/La+rB06jiAA=;
        b=AL4EFtdgL1iRj5IIhvsm993f7cF3TstL9Cp2q2guOul7voleEs80wtcyo5IRI5EytE
         HgdeaUOyw9/f5o9fZAvgXQvwNKb/YX8Bc7k5QgEwk+OvI+K2nEGwwFCtPjTG/Ng0WPeG
         uVu4b/k+nxmG6kFq/ErTrwCWDijaRCLKRvJcG3+STdpCRWQ8GAJdfH1lKyDn66OaVgHr
         bERglixADwwzOfsLA7HzRoQ+oOVdbB7xCOXJzxd5aoYNgsx4iZxQ1oAD4N4NnQi2PYFn
         B2upL+JLudinoqH4XtRzLL07Uu1h0CXggP+2W5580xiOP/DPyfz5VDskK6REpP35LOyV
         KNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314171; x=1777918971;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpS1yWQaR7R3cfgZ/X82WKAagfHQOei/La+rB06jiAA=;
        b=ivQMIsZPrB/lELuu2Z5W74WSUDoCk5rvmRaxOynMrYyPeKq80cghtxtpzsW5LlQY4s
         XaSuM2gngOuMOku+Q6hgDmW1DAESC18xCbxHvvsVmaxXOGras1Eva2XfR3TNDCXm8uT3
         7EiuW9KJfMzcVc/deaJObOxwzl8yVpWzGAbbM9rC0t8AEHoJ/R1WHjGCAR67g60bZGnq
         Lem+633t4e5emmPrAvEsswx8PNqjJTkCCSYzZVpeldal+iifnNbRhgGGwy7tbBVBcL6s
         8oWAmSyF3U5Q/03iw8W+eLkBb6EhMwObmzB9qipdES1jFbzJ4jYmDjqSE6x0z4PG+kao
         nlZw==
X-Gm-Message-State: AOJu0YzVbBFlls6Z3M7ttyols3qwNnOY71Oe7HjduuZjVFiyUjkhmcgS
	voV33fVfFj/RuETGUf827fGj53rFEIOiiHPrKbiMUtz8jNM6D7WIlw88hlnYql8OGco8TWmxmAp
	9afBjSJLfd/0ehsmPVzqeq9vdTXkaMtqQZDj4nO99DzJuJ1Q2k0A3caogCwQORtB09JQacQl5YM
	Pt
X-Gm-Gg: AeBDiesbBVBteaUuNMpUbbrWCNZkHPu2iCF7cxReu1NWnKgmuVl3y19OhzHS9TYPl9Z
	KGAic3LlG1slbABHyS0bP/9vf+t4S7VbflVCfCCl291erH3fo74jNV2leYDWNaUFtDNXXC+7HdI
	STzrITIE2kIZd5bbVZsvXLTRUE2QIOx7Bg6gQRiEguWsdXIQVQFvSAyeKIxMFM+JEbMkPtim8jz
	GFEbvItZTgyzLr24e18JvHEy7R8dDnwwYcAX65CNp+c+9qjrZaZfjFFFqe24igvIYGakeJiwDnK
	Cpc4PKXIGaWq5Wh1hhM7WkxPcJNt8hr7yDafYkNOeOrpQZCtDt9BuY+uJ75SiuRuQV9C4agGOBN
	qWi4jVXUkKrLgYqjQ00GC88hVDH7//BZ65A86L0Lje0aI9cSc2bUi7w==
X-Received: by 2002:a05:6a00:800f:b0:82d:24f:2511 with SMTP id d2e1a72fcca58-834dc1a9445mr133717b3a.12.1777314171128;
        Mon, 27 Apr 2026 11:22:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:800f:b0:82d:24f:2511 with SMTP id d2e1a72fcca58-834dc1a9445mr133687b3a.12.1777314170528;
        Mon, 27 Apr 2026 11:22:50 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.232.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf6a1fesm120638b3a.51.2026.04.27.11.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 11:22:50 -0700 (PDT)
Message-ID: <2e727c3c-f3da-4b4d-8f2e-953f0823f142@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:52:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable Adreno X1-85 GPU
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260427-hamoa-evt-gpu-v1-1-5434b5be76f5@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260427-hamoa-evt-gpu-v1-1-5434b5be76f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qaIHlUgUGK4wdh9lCgDz2-WL6UnN_aWY
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69efa97c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Okm+ZZIDgIQWz23Sjl1oKQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eBu_aoQerpSAkrlkAZQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: qaIHlUgUGK4wdh9lCgDz2-WL6UnN_aWY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NiBTYWx0ZWRfX//AF57sRJU97
 IXtdRFWTNALj2Jc9IBlzcALyqscvQIrpI+Jkfe0W9z/JKztPKqS9YcLDKFjJVprjmiMIkVaqePP
 u+JmptD5GZA6C6DsBW5uburqPPOJyPRGSiFl8VJ5aGRHzZVEnrZ8qDHyu7B3fgd2BKV3E1DOoFJ
 E9ApsgSmLJxXCIJEETD9k8eU9B63+FVYPcoYOw2m1yG+UOQ/rqb/2w7Kb+Be752XLN+80IhE1Rp
 v9zy2VaEp+RCfFndgVG5SPrBJ+pbn4zY+sGeO0dEAtrE2+EwnB67D8Ley1oKPM5CMTp3XFHW6HH
 +AyQ6FIp9GCMdDfakSbzDiLjUQo5kCbMZjGQSrJW5AXcPFy+fK5HGIRvuvohjzl2QpPuriGx02P
 6e5AtMJRxMXiSG86jjbYFE+n1Z+rbqezk20CCgj6oJUTnRtRHd5jVTt29oUktBYjVwlumDMACDU
 XjDz5BI8tYaY6FvfrwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270196
X-Rspamd-Queue-Id: B833B4787B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104808-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/2026 11:23 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for hamoa-iot-evk platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 460f27dcd6f6..b2a2538747f5 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -729,6 +729,14 @@ vreg_pmu_pcie_1p8: ldo9 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
> +};
> +

Ah! Looks like this was a stale patch in my stack. Yijie Yang aleady
enabled GPU nodes in hamoa-iot-som.dtsi.

Please ignore this patch.

-Akhil.

>  &i2c1 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> 
> ---
> base-commit: 6ffbce0fdf09f89d4f970301f6ce6d6d88d9393c
> change-id: 20260427-hamoa-evt-gpu-dea01004ffce
> 
> Best regards,


