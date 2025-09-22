Return-Path: <linux-arm-msm+bounces-74407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF6B8FD92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 11:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 022347AFA46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 09:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D049285058;
	Mon, 22 Sep 2025 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g00bKmK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EFF275AF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534697; cv=none; b=WS/8bIFdB0QvLUOrYz/jBL0RYXamqsJqF9CbcYoea63sStaGE2v8XZvn0UKCx3reRvMey59Za1Phg+4mfECyYvEo0WIIIrawVR33KHH1aIcicQfsIghiO2ACSTcxxZL8vXL31wiC8tFAoBpKhFGRA3R1Ps5OWlQeCydjef1jXoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534697; c=relaxed/simple;
	bh=Wd7MXk7KVvMKiL8QsKVzK7/O3AGc1BJP+qNpHFBkcrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiWVC/65JIo7bfRUhfvXXs5Q12W7c5GHEXAEoBY0dI9Hqt2bcPyhPSvcqwQAmB/mukW8MxCI0bAsZCxccJe1B85dSFzM2r9ODvnoEHsfAhqCt5z7ZCzn+PnLQvpxmuACNIQdi/lagcxaddSjLz3yQ3oL4mT81tPtpJYJr/5+WVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g00bKmK5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8xqs9010941
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yAF4yxuR/rHPPnaXohNM3mKvMvsG55hvpoK6MrwhJhU=; b=g00bKmK5X+iyT6uJ
	BwwkFrqPb/8fMndkoZlDRAdF5JCjZ2u33EG0dixZvArwSBfHbfVkWdBQ6AEOtLYP
	YneL8oWNwt8gPDS18jhrN8m/90eS5ok+EeizhllVZQlX4r64xYgDqYhJH2o+IgUb
	mgYCMrfnXa+yL7YgU2j+OqQV6HVRxugZBv+KMaUqVTIs2sbHrzIZL1xxUzOZ8dCT
	iGW05FnhuouX8q12uvMTcI2Ewxq17xNWcrLz97qkB3/PbU4yJHwwbex3gS3dnVbW
	COgxkaU3NsY7vfhs4QzzGObrctjQ3y8BlWwliEB5LGi4RiKg9rcDysPry7GuHMXB
	RD0IYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7svdgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:51:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b7ad72bc9fso92826551cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 02:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534694; x=1759139494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAF4yxuR/rHPPnaXohNM3mKvMvsG55hvpoK6MrwhJhU=;
        b=G5N9KMdspJoAuhXVIPK6SZyY2s4L4DFthP+m8+j+2TQAZ1GjKUbYUobps/juaGa/b1
         Q/X4Zx9/6uDvxufZOUkzQEqBcf1rkKVEq43SCob9oyQnKt30OhQoNag/NNFABPrqxegv
         Z5BThCMtnf0sDGUmzgdfTSPxgq/4yw5RKt2NvzhLKQ/tdGmZCdUPVfcx8UIC9JEy2i9r
         EYKINzk1zOELRHeVyIPNPQg7mY5Y3PVcqONYtaZfIcHySpbsfeAnGnk4+I+kas+ySw0g
         eB0Kgr/R6L7HCtwBZdgVY/rwxaA0Mpiw3zN9HFcAxxsVfprnPyDotdVcL17gCcmjITqR
         4B/g==
X-Forwarded-Encrypted: i=1; AJvYcCXpKvM+mB00zJ7TwgoYGF+gmEL/T6m17lhrNEECmkI+jfYq6ouEFE3Dd+qWYKLl1VG4vxMDAPo6M1L0Z6ew@vger.kernel.org
X-Gm-Message-State: AOJu0YxmRjV9TppL1fW6IMo9e+RXmjjCsKKGPDvozbNJPwa5I8HSQSqc
	eYH0fh2XLf2yV0RffUdlb/2UDPzLGnC323xB6HqIIVVtL9wdkqEFNUYFLkHv6CjXOvFeWic3Idf
	uTRIK0qZNRJW46SyI2eFs5h3S9QLikfieLYSk6kMizqrZ1gKFDwW4/xXlIN7pGPrX56y3
X-Gm-Gg: ASbGnctY0jt+aMJyIgBiZc4qaA+GazRPBuwRtKEVLzkW1Jff2ihSQ7hJIw39yInG56D
	coMtqVDawtxEqP2TcXTJwuBqjT0m/0EXyDzpuPxl5cM9bJ39J4/PiE8xkiY5Lxt24GyWc0ab6Jp
	3HmgY3QSIDu+Tpt2tPKT/pgrDxpW4f16tkhh17VFlVCAOMjC2dfojJpj8P5iDWLbRdpHYhlolH/
	EMZ4jKkchNZzitug+WbE4Aq/8cPM/rlTbZMmeKwiA8cDdIA4cUB76wJJjrsCdhh1KBkp7Ng63Nq
	jcS4t1qSR8ZJCjYY6ZqgM1Jd6oIWa6+vm3JBpfaizSlRhKEQS3KjaRTWHcUCS/oEF5wFP5p5vu/
	RWbz1rMGvQD5VQTLJxzIFMTP2qIPE4dfSkF40y4DKWjGaZSr4lTEJ
X-Received: by 2002:ac8:574e:0:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4c06e3f854amr129598311cf.17.1758534693623;
        Mon, 22 Sep 2025 02:51:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEojLDIZ5dwkeP8Fy6MbtD8yJ4tYri6Xinj/1tvHaAC1AZVzLBWg33l1NfA/vlFrxCb/mR7WA==
X-Received: by 2002:ac8:574e:0:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4c06e3f854amr129598121cf.17.1758534693106;
        Mon, 22 Sep 2025 02:51:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a8fadb2dsm3183075e87.90.2025.09.22.02.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:51:32 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:51:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric =?utf-8?Q?Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250-samsung-common: correct
 reserved pins
Message-ID: <aar5oq4xvlbpjmitnwzti5w7gitf7wxdas4bflx6eqh3r6srt7@iccpujd6xc4m>
References: <20250921135623.273662-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250921135623.273662-1-ghatto404@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX9/Tvfg2098LO
 u5vIPgS8vxAxQlmd/nMo5g8tCYR37hyf4NeEDJHcGRgvsfuSsDW0ObDoQ0at+c24EbfQg7R2leJ
 sixKqEmFr5N1JD3Omjd2urKZaom9LGCftnzkeYlgBZ+CS5aOksGZn9gNcBEP1eW/4QIGPoxnzWF
 4rRJh50XDADZFDzu2Ai0RM28H3N3s1RJ9vAY4uKf0epPVzDvd1VaTH/r+1UqT9AocKUy13h2P0u
 h3SRIjiVJV9oUWqEqedkgCqftv7BSenatLowHk/J9QZvO6OCDUEgMypb64n7D0L+kWA9W049Cqo
 z4Xy9hfRMwrtJ3gpupapEbju+OWvDO1dO45CKkhYugi2hVGoChqlRzhpgXXMRIaKzx3/8ru4OSD
 lsdecv5f
X-Proofpoint-ORIG-GUID: IkD5UZ-_kKxvk2uHMPzs4S5rEP8TSZuQ
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68d11c27 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=jqn0LYlPQ9Sjq9uXwicA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: IkD5UZ-_kKxvk2uHMPzs4S5rEP8TSZuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Sun, Sep 21, 2025 at 01:56:23PM +0000, Eric Gonçalves wrote:
> The S20 series has additional reserved pins for the fingerprint sensor,
> GPIO 20-23. Correct it by adding them into gpio-reserved-ranges.
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> index 96662bf9e527..1680be67e733 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> @@ -159,7 +159,8 @@ &pon_resin {
>  };
>  
>  &tlmm {
> -	gpio-reserved-ranges = <40 4>; /* I2C (Unused) */
> +	gpio-reserved-ranges = <20 4>, /* SPI (Fingerprint scanner) */
> +						   <40 4>; /* I2C (Unused) */

Typically Tab size is 8 spaces, not 4.


Also:

Fixes: 6657fe9e9f23 ("arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE")


>  };
>  
>  &usb_1 {
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

