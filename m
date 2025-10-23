Return-Path: <linux-arm-msm+bounces-78483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B52BFFE38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C87EB4F9D21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9226E2FC86F;
	Thu, 23 Oct 2025 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3D/dYor"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FF82F39AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761207746; cv=none; b=VEwEztapiwN+/YWmURQx6tTSpi6eNWLW8U0QXr9z0wbmgayemh8T/ZJhxF6wDomdGgmMmEpKAEq7ullozHv5IndfT4NPIfR8zagLrI7ievPZl7oAhgEcYjzWSnuegXuAMe6Qu4iakI2Earo9QusY1dcm8IGFobRw2WOq/onezno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761207746; c=relaxed/simple;
	bh=S4vW/Rc/0VyuVVLJvAg90iQZN++icVTdUocdP09y+/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4a0sjI9okBOBE4Vco4Fd3VsYghBLG0AcIu51b8JO6cG3Lu74AkHrQ6KvtbFKXqEwrJq8zSynA9kOrRxSr8U6EDJi4leIBcwzTzxG9fpu3oVrvzRMGd1aK5x0bogUEc15ntvKVr5dajyAZxnYPNucIfLpSidVtmfgl9xpax8LaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3D/dYor; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6nm5k025826
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8FruMMDEn1euhlML1huGGXWeCVKOxK18le6bqpoMasM=; b=M3D/dYorK3RcIt7H
	jJ55aYz/7RKPCryvULpMhjyJ9CHcFylvfk/9r8H9Tn2J8jtVr2TgatzdVW5ocAzz
	KlFXjdcFtGC3bI4brJU+UxlgCUrsy5NCxQB6AFvK423OOVRf7+11JVVAhbuDANhJ
	L2L0yPns8sRASb9lkySjZ9xkYdGQ37kadKwbrS0+vxDvNpJXaJq93zyvQhvMMlV2
	Bzktpfq7R8KJtQyDbqDVqOjpjPsKyx+65fIbayk+NxEHOc+CbVMUjr0YnSCjgUfY
	y/2yIXnKfwTbicUp8R09X6pNgtrzl6ZCx+riHFJkKiF4FLWyXcaqCqisfooJCSrT
	FXqyfg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfe3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:22:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87dfd456d01so1848246d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761207738; x=1761812538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8FruMMDEn1euhlML1huGGXWeCVKOxK18le6bqpoMasM=;
        b=riRlgbVCih8lkOlqrcwU2UMm2IeyF0oR1gmuOthOddNWMqKtpYzKs9zmSVUlAb6KFp
         vsMBFGfZ57vBeemVSI4hy3f8HYmp9i5G1ptTE/EAMCdSzQzMHtBTUNgh1nedhkfA1G6y
         GIqg/lwVsos5poYCOYXgcCo9UuMxJVnq6EJaHnHJP3pm0L6QEQFv7An/i5fRvXj5B9LR
         BVY/PM0/JwCbVjoNcVeUSi1ogvPU+7SDkD2Fyj6yrqYiOI55LXaRJn0SWfAobliZLDmN
         OwuvunL5aDJOs+PYUkv0bVmUTk651OrCoKxEwcd0ADxn1oR3dAOubzkDWew9IWUkHe/d
         1AeQ==
X-Gm-Message-State: AOJu0YwdeeqNMrd3oF1Y2qUk/42VrGz9XHQr1I9F5hP7PVKTOk9HZexs
	7lqZo+ZJCI/KuYxls5tc4k0carn88xVa2XedcTdM6gK4g1aHUKQI/mvQz0iNIm8Jw0M221N2ZFR
	MA0SDlPa3oKEE8qS0Qxwx4aC6S+5rVtkxx2wusULcNH6xhf9Z1e6Urxbwi4QeSv23TIYX
X-Gm-Gg: ASbGncvRPFbxrF8EUw4nWAiI4O8+P9Yy6cp6o91SkGasv3GXySmY2Tj03aC6SpcDL5g
	p1C/RDJxVEpnk0gk2h/3Gua/ISfxWQYB+Ao4n7nYDrfcry/hGa8fg2f32zBMUEdk9FP0IkR+HVK
	UY6Xa39ck4XJHc/+utqdiIJkJQFO/McT3BM2K0X4TvTspaze4ZfjTYhLfmcsGftiTv8aEQFYgWC
	8hMhsnvSAtH4PR1UhBpoIlhVAC6o3AzWGP5ppLh6D6ai61QrjteR54gkKeI72qJA+HIBva0cIQ8
	ztnaz38kLccwLCiKNJPaBcgf/do9zeUydUAcJLDWB7uLo1YFxbOiKmwiOSNluerQ9sAlxBCiCJd
	o2b9lcohc9RomUHfrIAtYlsaHcKz5WsPyBgbaboWp6ngi5gRu58O630kw
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id d75a77b69052e-4ea116a2337mr82965501cf.1.1761207737725;
        Thu, 23 Oct 2025 01:22:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2XIoSLrV1GTocr6bbATcJdQVR3JTJAVs0QtA04SjsNS+0NDII1q5KQNFmWxX0Qxq+jTp1XQ==
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id d75a77b69052e-4ea116a2337mr82965141cf.1.1761207737193;
        Thu, 23 Oct 2025 01:22:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471c24sm157607666b.75.2025.10.23.01.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:22:16 -0700 (PDT)
Message-ID: <4f9573d3-41a4-4478-8c19-39716b29f587@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:22:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o1ZA2kAplNTYQUjYIIECuE0sMU-CIipA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX5goGLIUFXrWo
 ZohE8wBj13hlyXhhbrvfqF2LVyQFjhWFo/UOlpuFIa/+ac2RclYlt2LbWuAcJW3NMBOEDEfQVbi
 bv98H7lzJh9N7alxvLGkFbpOuCsEoLp16EhiDI8Fd5X/kzd8aX4GW7/2DkIfT9BF3OB0oyBxqB8
 aRiygU4FHg939tOlibkbzwVyjQczKOUNabtbPhhHZkoS6L3/jopoANvVdnCYD9zK6rQg0OtqRR5
 xJE56Cr4ChIEsTujMXjNwbyDi4ywz/D5034pxJhjfUHssB0WWvLc7ET0o83On9kRyF+x3fjTp/A
 NxkC9MdE7hvWEHmA8W647J5krY2KrTuxE8UYVgVtYkJZuHXKW7a4MY68EWALEEGOYEzPZVormgG
 5H6Ivx66bK8iKTk2tn1y17mXSLfa8g==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9e5bb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=91DCyrf_GaaWAzlYtecA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: o1ZA2kAplNTYQUjYIIECuE0sMU-CIipA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/23/25 10:06 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---

This patch should have been sent separately as it's not at all
related to extending the msm display driver to support Kaanapali
*and* it goes through a different maintainer

Konrad

