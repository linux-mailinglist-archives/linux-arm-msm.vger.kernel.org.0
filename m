Return-Path: <linux-arm-msm+bounces-68111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0CB1E5E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 11:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDBB63A8C72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 09:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D982D26FD9F;
	Fri,  8 Aug 2025 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gkMAqT5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456F820C010
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754646439; cv=none; b=qBMFbM/RJ6+PFjQf8Kq2hQ3X24MvWribqpMscE4oCO3l0kab8EA0retI0MUiPePDqwMnaJK3qP84cvgFM8kyYP0Hfy6rhFBsv3bkMZYTJwdZp9sJVPWZpMwyFCZWplGaAhoHyJhWdLIcu0mRWIqdGjSacH6ZxoNFSdGGKX0TJ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754646439; c=relaxed/simple;
	bh=N76AjeKqWWaDCP1rb8c1+wvNKkVDpoXrk1DrDsc9vc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Go+zfsb0FG1Fsjiq8T9qarTHIidsRx7a2NLRDznUIMP+YHgB1MzPrfK8NWExXOh1o+3wDvc05T4e9eVj9BcoqITtmr2aQaqQhr+WFKdRTyFzRUpx6Mq3ugHq4xCXaRUPCl32bmQ25VsE20ltNUnQWtEJtFuwn7xQ3HhV/MDZeKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gkMAqT5t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5788ILxR007269
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 09:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c5LHAQzvnX1on7gg4etzzi9ms/GGnbrPCaWqPhltrcE=; b=gkMAqT5t8cQfD9cS
	qcYMunlCYEiEYe3EyORPs9nF8uLZv36b20wjbimXWWWE9FbJXQVZfttf/PRvlors
	GY/fOxK5yXW205ktkdNQW2QnGpU/F0jfjnT+NE343saXYDjeGoR4Yc6s4iXZTpYh
	WnfiY7SiKWsAtSoOtn2XPndGq31sAOnYJgWLxl8EB+tmEL0uqufsOyZL8ajxFZvf
	ihUjZl3sxUL4PzPGYBZbT8dFgZrG1MAK4AabRWhKKiG9YHQfezvYijya2MDNVAgT
	AkTt6XuyZIovmdU71kcJcrMGeRKeNNRfkEomxHHUrxLgrnDHKHh0mIu/FDg5iRYf
	tsHy6w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ddkkra2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 09:47:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70999f54859so1380476d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 02:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754646436; x=1755251236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5LHAQzvnX1on7gg4etzzi9ms/GGnbrPCaWqPhltrcE=;
        b=H+0Si6TS1iYjtJtGe5281S0GYKve7MiT964MlLxbA7eQX7jgiZvng9K2t1NeJ/3q4Q
         HzT3N14WYQmEZlsWV84vTI373ZzxZt2xWsL6FH0L+7yWeJH8hEa8bxActlCRjFH6OZE8
         UVMEoNglGI1k9Uwn1DsDbRs4OEgtwJ/O4/EZswR65srQoUxMP2D686EqhklQmUsWgIr4
         4xrKpchqP6Oo7fvb/r4zHf+fvdS/Pigv+k5kkLiT1X4T5sMEMjqe87ECgutFvpECDT8X
         V1fy4l35QYIiydzWzO+r3tR1hu2FBNdBZvClpsjNk745fPFD4R+20zhMsT6XkP7qe1Ef
         zOYw==
X-Forwarded-Encrypted: i=1; AJvYcCV8L9fXv8nfjIK4KTGlpPS2XMLGuokHwdV8gjhYxiCbtfI/GSFq1wEzW9IYvZJErxfssHOjRUVKljxyiluU@vger.kernel.org
X-Gm-Message-State: AOJu0YzdAmg6ZT1uxuhdkyp77zjTWGXbwCa8VRsKKWP4MQ9o9bz2B8Y6
	XMkuaNAUi9AjwM2K+kyiuufZFahaktDKdXximhVhY+GF1cB/sK5pmwgk9LyM35vx63rTEMldrde
	F6Utzw+Q3j7nIFcZiqWSOHqdfJ3YzCQpZMAtHoom0RpatSoZXKdwKlzDxFrvRENFurig9
X-Gm-Gg: ASbGncuNwXMcFyLkTjA70uNYE/jOPmGrcjLonL4nUZEgPXgWUI0HL6vNP4+Dt1jez2B
	rvGt0cNuUo0c7bKUkrEt4YjZ8zGBn+Ihwl95qClVbeAzTSndMD/AeKPi2ORNqvOVp2PlMuc7w1O
	ChwAEkbcG5Gsu3WumB8io/ChBQydqBaZ9EfpIaLeLG/xJJLGQFLz+VEasO+zLbOG95wRf9Vfuxg
	SF6x3XrWnLNH42kAmHazHLlMttmFfG85xrK+1WgPF5ZAPkDJM5GUU0lZEE+bbQndICFNJtLGdgK
	BG5/X4XAZNysrpkXrHZgb1jaQUtyXr7q7d63XKZ1QdFx5TEUix3GuxPQr6gguiXt8HPxlTSD/Ux
	FxlU1r/M6DM1sX4KNOg==
X-Received: by 2002:ac8:59d2:0:b0:475:1c59:1748 with SMTP id d75a77b69052e-4b0aee278c8mr15475121cf.11.1754646435971;
        Fri, 08 Aug 2025 02:47:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf+bmZXtrB5iN1ZcDOo7CVlLIU0Jwj0Do2OpnxiPusVz7TYkqt0exOl8J3+oBRed9YiUlNlg==
X-Received: by 2002:ac8:59d2:0:b0:475:1c59:1748 with SMTP id d75a77b69052e-4b0aee278c8mr15474971cf.11.1754646435422;
        Fri, 08 Aug 2025 02:47:15 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076620sm1457229666b.10.2025.08.08.02.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:47:14 -0700 (PDT)
Message-ID: <488da4b7-1017-4582-808e-f8f244d8a975@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 11:47:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add Xiaomi Redmi Note 8 support
To: Gabriel Gonzales <semfault@disroot.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250308013019.10321-1-semfault@disroot.org>
 <20250311003353.8250-1-semfault@disroot.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250311003353.8250-1-semfault@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA2NiBTYWx0ZWRfX2QeprPPhrJQx
 6OCWA9exVtw6J144GTylAOaCNxYQgdVwIzg4VbHra9UAVtMxvzjEQbOvvTkMKDLxTHn5vAahET0
 mxe73S6VY9GKCTpAAz7Z02oiEJWGY+K29JjYy7GyS0I0D0M2lJNT+xsGnExcfQGI34zkpfUuVCj
 yzdS5tuIWerZvgK2Vqqrm2ofGJUSr/LskOAcdBGwSQm8zCEpMBwTTwAHhdOr3Sv7k8odCkwUR2i
 0vsDGxHH5XsbXkxTEH0u8YrWXO7J74tn6pqNSfZK5L2Z8iiCrUlbSvdBNTSZO1z6oTUdPtEMver
 pbIDBS4Ws3yyCiugPHV9Y/N9nD/q3Q9iS6IZg/62v93gkhaTu/UpjFCzOAbCD4J2jfH3CThOMg3
 or4WkFy/
X-Proofpoint-GUID: H05XKeqE19BjFylgA2FDRQ9byDw4Gy51
X-Proofpoint-ORIG-GUID: H05XKeqE19BjFylgA2FDRQ9byDw4Gy51
X-Authority-Analysis: v=2.4 cv=Xpv6OUF9 c=1 sm=1 tr=0 ts=6895c7a4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=dqPQs9Fgn_eni4IfNrgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508080066

On 3/11/25 1:33 AM, Gabriel Gonzales wrote:
> This patchset introduces support for the Redmi Note 8 (codenamed ginkgo). 
> 
> Changes in v2:
> - Add missing cover letter
> - Fix up commit message for schema
> Changes in v3:
> - Use qcom ids instead of hardcoded msm-id (and other changes suggested by Konrad)
> - Switch up model properties and qcom properties position

Hi, I noticed that the msm-id is failing the dt-bindings check (need
two values, with the first one being the SoC ID and the second one being
the revision - 0x10000 as there was only ever a single rev of 6125)

I also found this dt:

https://github.com/xiaomi-ginkgo/android_kernel_xiaomi_ginkgo/blob/main/arch/arm64/boot/dts/xiaomi/ginkgo-trinket-overlay.dts

which suggests that the board ID you used may be incorrect

(you put in 22 and the link above says 34 - FWIW 0x22 == 34, maybe
that's related?)

Could you please give the below a shot and see if it still boots?

From ccef64e4058ba657ada5000ec3c2aa9b682c552b Mon Sep 17 00:00:00 2001
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 11:45:06 +0200
Subject: [PATCH] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix up msm/board ID

Include a version in the SoC ID (mostly to appease the bindings
checker) and fix up the board-id according to match the device's BSP
kernel.

Link: https://github.com/xiaomi-ginkgo/android_kernel_xiaomi_ginkgo/blob/main/arch/arm64/boot/dts/xiaomi/ginkgo-trinket-overlay.dts
Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index 68a237215bd1..52f74f22764d 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -19,8 +19,8 @@ / {
 	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <QCOM_ID_SM6125>;
-	qcom,board-id = <22 0>;
+	qcom,msm-id = <QCOM_ID_SM6125 0x10000>;
+	qcom,board-id = <34 0>;
 
 	chosen {
 		#address-cells = <2>;
-- 
2.50.1

Konrad

