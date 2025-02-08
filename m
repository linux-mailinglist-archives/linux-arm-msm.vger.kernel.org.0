Return-Path: <linux-arm-msm+bounces-47220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D68FDA2D2BA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 02:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 870F77A601D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 01:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8F6145323;
	Sat,  8 Feb 2025 01:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMVwTL2L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3A3125D6
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 01:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738979009; cv=none; b=IAIPuRuJSJrdRq0Q/ZvGP/iiPDNv8R/Eahk0TD0K7FWiQxbkGTz1MyrHxToRpMl5rLd/bi3bNsvkOwPPqQhsQ/IfIZIQqaSnlDgd/TVX4CT+Qa2Zt4yiHyyKm3I/zzx4iWLgkrVCc1D9QfExjr5sj7oEnw5Yok2fvKiO28F4W4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738979009; c=relaxed/simple;
	bh=8KOc8TEtPMV6vPScInXgKUCKf0lxAqvOCy5Faaq1d1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OjuypwEJ/8gCExaWubzmUyIWEj/z8vjFnl64kSXdtUwvNSpX/3IKrfVXnpcgK3SSXFvpce+6hfqCZ59R0btlb5p8uCKO/wD8aUDKubar9miyEjaFpc6LaArYsIps3r5xSaH4bRPll0Uq0JRziW16pElNupnR83rXtpqon6HaxoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMVwTL2L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517Hfewd013852
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Feb 2025 01:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvl2a0j7vqsq5LA3kTdIeYd/weJt9uMnmK28HOLRjek=; b=ZMVwTL2LkACuACMy
	ygKp3yW7CTUwiETtROhJy1HJUozpmgXNUUmgzvu402fofhhXAr3pG6ToO3GZbMB+
	alcJaTXvhr0VKr+MC3iI6nxwUrSBUHMa/ToyIlzVWtjyy9iFfDbO9prOa7sDEJ5q
	JKAyFsaX3Lnho06J2tlJh86hzqfHIaYyTHi94uHS9FlxBfIJd84Pceie5+itI16o
	zqJ9mrIxd8rdKBoac1w9TJl2cvFunfELroOQrtVZNrspGu/aQDlmGchmdBxdJAct
	ZmHYSAsKtmH0AV4AfNm4EnQcyfhlxVo1jlMKUoAuLzTGOM8dGb1/6VZYxPcPcbB+
	isOj/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44npt18vrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 01:43:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6e132c31eso34326885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 17:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738979005; x=1739583805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvl2a0j7vqsq5LA3kTdIeYd/weJt9uMnmK28HOLRjek=;
        b=tRkyWK17y1e8zLuZo+Pbj0FXkHSYt0/G3KpDDOiarVxsVAxK5iewv506t5iYtnhfRY
         jGAQ+DdhPKZhuS3pd1toQEy7ns7n5sqgAz75IBpJroCUFac/WnCWzTf+GPyzML2jGtss
         V63wPhKeGfadD3+3jSABe6hZg/tb6aVTSkb1YHdczuuyZ8BH/t3k+j081h3F7eSd0lKT
         MA5oj3dCw0DBUORZ11WvV+Lz+7V4dk2Ro00r8LtojZmoYaciQP2St+HFyJz211E9W39D
         E4AjP8qi0C+4+wfW5VqVSeekIGGMEIvVu2LS+XQm3mtDvBOd23bCsIXYNcUKvLpdhHo3
         VMjg==
X-Gm-Message-State: AOJu0YwpnMZ0Zi4hvrru+bdO99xdkI4M7/3TgEqnt8VWxPTcjcs9AwYR
	hZuW+bmjaUsVdc36nDaWQ9XUcUSwg0+Zz4gs2xyqDynWh6PKHgW4zM9GUZMJNkOHjpe8PeCcgCw
	QgYX5Zy4/hzGtMjPgp2M16MVaxX8jvGMMRfJ+WH7VvWg2su3TYL1tiaq1UCndMHtd
X-Gm-Gg: ASbGncvLJBL8CsTDT5y8XvoIFEuwtQBKhYnpXupJSFm9NXbj7K978SlNMQqLWsai1xs
	tQmr4JuRmjsB3kK8hfIcU3pcSrKQrqodQ3DV7R0raMwUsEsgQnUsa1ZN5l0//i2bTqBzJMKKcuI
	5j9RtEv2NrqDKlBGfm9k5VpBs3jpdCg5uJ2x5cwhOChUgHTi/Sgmf51dWeDebTtjHE+lTDQTwaX
	IH/WHycH5SaRLHtV2tKHZv8afeITnwFUwL7EBApij1XCgLxVjOJ7WsdthP5O+utuFANHpm7bUP7
	eKntKGQj9pnLjsfKoUzkwWcaygm7bCYD2++h18KgMc6DRpyXqIodSYvx46c=
X-Received: by 2002:a05:620a:318e:b0:7b1:3bf8:b3c4 with SMTP id af79cd13be357-7c047afc65fmr327771885a.0.1738979004745;
        Fri, 07 Feb 2025 17:43:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8UTS+vVH26H8xLRB9dyiuCt4iajAYis4LHIkOKK04eLWDXnRv19j6gDsEybLesd/OnD2ezg==
X-Received: by 2002:a05:620a:318e:b0:7b1:3bf8:b3c4 with SMTP id af79cd13be357-7c047afc65fmr327770685a.0.1738979004410;
        Fri, 07 Feb 2025 17:43:24 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7b0a2sm3418731a12.22.2025.02.07.17.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 17:43:23 -0800 (PST)
Message-ID: <9368eaa3-f1f0-4581-9f18-24c2a6f8f5b3@oss.qualcomm.com>
Date: Sat, 8 Feb 2025 02:43:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750
 SoC
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Manish Pandey <quic_mapa@quicinc.com>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <20250113-sm8750_ufs_master-v1-4-b3774120eb8c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250113-sm8750_ufs_master-v1-4-b3774120eb8c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GukVSM3I9W4aQGVbW9rEsPUhWc0029me
X-Proofpoint-ORIG-GUID: GukVSM3I9W4aQGVbW9rEsPUhWc0029me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=878
 spamscore=0 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502080010

On 13.01.2025 10:46 PM, Melody Olvera wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Add UFS host controller and PHY nodes for SM8750 SoC.
> 
> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Please also add this bit:

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3bbd7d18598e..1f79f2adb0a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -532,9 +532,9 @@ gcc: clock-controller@100000 {
                                 <0>,
                                 <&sleep_clk>,
                                 <0>,
-                                <0>,
-                                <0>,
-                                <0>,
+                                <&ufs_mem_phy 0>,
+                                <&ufs_mem_phy 1>,
+                                <&ufs_mem_phy 2>,
                                 <0>;
 
                        #clock-cells = <1>;


Konrad

