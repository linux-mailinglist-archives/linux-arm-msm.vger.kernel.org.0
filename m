Return-Path: <linux-arm-msm+bounces-85337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C95CC291D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2C45302CD74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 12:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122243659F8;
	Tue, 16 Dec 2025 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/4t52Gw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzSmeIFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5973659EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887147; cv=none; b=DPkKNBK1NIhvpFrYYlyL7cqw34PZCV++uwPC2FJidJs0+E5+rmcbSq0jKvIxbL4/wom2sA7crVxJ30F82u97/iNyt7xy2eU3wKjeLujVWoFQb2YlEQ7Xc0y3bCTp5BvlpeWzUnSupRjvYWPasz0Eq8g1tKUUbOUkILm8eC4YwVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887147; c=relaxed/simple;
	bh=bkTIQyeWp/MZPvcJfDiSBDWzKxP/BNy4vT1ZS8bsKJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5LRYyHYAL8/swzz67tnHcDFLaHI0Y1a1TVeEusa2ajYL4ZL+Fij1qyQwCwkyYqy4F9rjgS3sPr8qdP+eR7fx9HRc5a+3teT7BPzfz0f6S3+ub2Q2GVJsn2dtiQsrMYOCEDv0TCu9LVxSCuxrdXHknjBZOebEBDcnR4XLTySJug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/4t52Gw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzSmeIFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG9Zu9b3349370
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vWVxed6lx1LvkP66PLXZ6Vp0SoYPsSztBsPvb54e+4=; b=e/4t52GwzIBWbzz0
	8dtzFQXyaktGfVH4LQVzmyLsQTDE4XccGCyk+0ZFzo2kU6tXuvc7RN1zJMkpQr7P
	M6ksMT2dsWMBVH34fQFfFVdu2JtUAHiLq2wDn6Qn3QYZTJv9bP+IoM4GMRHv7dFy
	7BFl1mOMxr4zx83HsVjQ7sG869EqhAYC1phHliV7IJXmLn1XB31a5gRU4yVS3ikk
	LLY8Lmu6KtYS+rm5TfLzcnpcalWDPEBfXauUNrlc5ztbEfxZtLiUQQ/27zqoU2HV
	2Mw0M72Kw1HaxH1FqP5xAZjuYWosIqtQfQlC5N2hMWAtgeXun5CCt/KZfpnYFfzp
	B3pk6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b34xd0kgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:12:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea2b51cfso102120185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765887144; x=1766491944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vWVxed6lx1LvkP66PLXZ6Vp0SoYPsSztBsPvb54e+4=;
        b=dzSmeIFpWIRpD/Yxv1Mc8wktagndqqoVzSlxyHNcGpFvffdFK6sGPLM/u66OnXt6j7
         jlxkdkJ4277QoYuacfLPbe8tG+QaijnGHFeCXaD86Byv/s75+SFVZfIH7Q7fhXO+3gnD
         C6u3HX9fODKt9Y10EWdvNW1OHAibEEAHdOKjcdyv4gAh2k+xE0UHi9VVo6c09tWvBZFJ
         JvBU3YjnZYz112eWGfdREGPUOEumGlnnHwl9ASxCg2i0BX+o5cUJvXzqCn7wq7kRUgQO
         PYzEhRXxNHBG63fVTZ4GA+IMo+vVq+lVPfUigyK2r1GJ2CMjIz+SY+alVCKuZOB71hZ0
         BSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887144; x=1766491944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vWVxed6lx1LvkP66PLXZ6Vp0SoYPsSztBsPvb54e+4=;
        b=F06+FBVklE5lFufHKVZW6X5tkAJvWhoKPgacP4n4vHxtz1+aDy6d4ddtzoFNmfmzBm
         Ga6U+tNc/+mcHVH65j2Jmt6N/ecCh+1XfPnxbmedXvg5R4ewe5N96IW9wPswcORQUcHR
         lyxrxmD2nXbKG4cNWwWnWECBkeVb2HS7xC0t/LGO1zlN3JOtXspY5glVi3loFL4Znzeh
         rwbwoKV5cmhwsJocmRBwxsh4vfVS6PeOzOhRlHW0TOUmUGajoZKjjc6/9lWfHpN0WCow
         tX8cktCqRsnnhAkgMYGRL6f53NJatfzhacVkoxSzmom4pumPIUyRg64/RZGSZj79vasv
         rV3w==
X-Gm-Message-State: AOJu0YwkVNlRHXwjJNxXOj9+QhUNhdFAZ78ktXCGAH2+xYBs8dfhPZsU
	iqsbJzyROxRyfpo+LYFvU+ay8Udec8tD1FCuAA9GChQHZ4mPZAq1a8YcnD+FQTguIo99DrDhGBv
	g/m5OEtggah77gP0e5Vc2tasieS+wRl36QUrGdeDAsiIOGuRKSjtkU1avjMtcAdkfJXmD
X-Gm-Gg: AY/fxX7DXZh8bqVdKAm2unfZcXiXMVGLpv0DLy6Uh5O9cj7Q/WvLk/Ui+l9KLG0ZMrc
	Zi7fFJxzvd4HfPwXs90AZJTftvx89TzjpdY6FjXuDK1K5+BcwtR64S+7VX8DI6TTKSoGHq+SmXn
	0/6l6hq9WuiByMShtvQ9QDssgj5IMpr//aIW6TNh5AMmVb2v5enNryfmjUEN3/hRGP3VguKD6Ov
	E7DP4COPVXj0X3shxwmsPx1MOVnLbxbiCSUIhVg3v87G9fdDomindSTGDgS1BrQFLc4A/fs/ZNt
	i/ggpdxVaj6dvsgbjQbGEo/EuoPALOrr2y/Egc8qBUR5s2WPjS7d/dUSKDHKEhY6Z+g1ZVm3rcg
	Sdc/I2gVe98ycSs7jOp4VJnZbi6vf+Jfoza9IqzvIj6l196PnwE4v7kfW60zDM1Uq4w==
X-Received: by 2002:ac8:7d14:0:b0:4f1:be96:568a with SMTP id d75a77b69052e-4f1d01680b8mr146265971cf.0.1765887143913;
        Tue, 16 Dec 2025 04:12:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcOGcvmVgn3k3SfXED03MrDqYUrxG+ufi2Qr/nd8NV9X5yw6yzf3dN6Q7v4nN8pYsNzqxqVw==
X-Received: by 2002:ac8:7d14:0:b0:4f1:be96:568a with SMTP id d75a77b69052e-4f1d01680b8mr146265731cf.0.1765887143471;
        Tue, 16 Dec 2025 04:12:23 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-649820f76f3sm15849858a12.20.2025.12.16.04.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:12:23 -0800 (PST)
Message-ID: <d0f329b9-dc5c-4e39-9bea-32a84664651c@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:12:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: power: qcom,rpmhpd: drop duplicate
 defines
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
References: <20251211-rpmhpd-drop-v2-1-569e5e8ab34a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251211-rpmhpd-drop-v2-1-569e5e8ab34a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfXy26ZgSnmfm6T
 Wa2utfAdhxoBrDbywMr5iwvE76Xf4OXSC7GbHg+t08x0+7XJp1MBAGDNtze8y/Dftzl+NFdRzbO
 Xrm0QbnyH6/G6bC7JIu0Zafmrmt/k7JmcRrT9IwwPLK7USw7X8CnCQth0AlcAO6wo41preKkHSt
 jU+pqIJJpDmcKrlF8pocf3TG5EFiJE8xdqGxT0Uy+hJZ9ItcKshTSRIJV1JDyJhHxRSZkyv5fps
 4dREtTqeRX136kG+0sznu0eYfg47CtCzHUICLNTf5C9W/h+XkN/9tqmjyM2VJPuTFzhJSEaPwiC
 3GevpBCKm0e+x5Zah5qudAXq0Kq4i7rEpEF0wd+31U8k8Nsw+isG1t8jqkIwI67rwWCPZuFouQr
 WYHz7dkM3U2wQyTH8YM7c9MD4xlCJw==
X-Proofpoint-GUID: sr48qiCNZeYkLZSZhAjTOAzKode9NE2K
X-Proofpoint-ORIG-GUID: sr48qiCNZeYkLZSZhAjTOAzKode9NE2K
X-Authority-Analysis: v=2.4 cv=T7mBjvKQ c=1 sm=1 tr=0 ts=69414ca8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lR2tOKNDw1Un2gOXHDgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160103

On 12/11/25 2:51 AM, Dmitry Baryshkov wrote:
> In order to prevent further confusion, drop SoC-specific defines for
> power domain indices for platforms which were converted to use
> RPMHPD_foo indices.
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

