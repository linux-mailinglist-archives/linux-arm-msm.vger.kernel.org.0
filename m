Return-Path: <linux-arm-msm+bounces-55695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 027C5A9CFAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16CA61BA0261
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464A920DD7E;
	Fri, 25 Apr 2025 17:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHUmUr9p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99DF1F76A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602496; cv=none; b=LZxxZOpB24uNlHzg0O+HKQYilBGypc5GJDAJRSI8hwlkfUNHOjlKv9fhjhJbn/lJN5ZMdbUB9U8UnzAH9FvwJ7KjtqSTxAZT+kV/9/woDWo6ln7+RHPD47DSQvEpwmCZADeJZXy9JkN69WTtO81+9Fb9+RgcQ9FjNn/C0iWeZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602496; c=relaxed/simple;
	bh=TFEdMlNIoiQqELt0JCQQPUgIJevHQRS2Vk04AlYrV3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXUygdDLEZLy2XFVQMl7El2bX+AXSUklJ5tHj1UqlS7vwxi5BN1WdXs7UcVeBg15yzkH8mhMH6/IKqH9cEM0k4rStqvvMtTmmJJy4CwDlNW8erTTHyNUQ+Ed/dxpwFG4bgHNmmKVmKC/P25dCXFaj1uyDvqfA5fLrKWirZQlhOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHUmUr9p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwnY011503
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hLwVTepjDVXejNa1tCFYvYXy
	WyUbn6X2cQd++bAXZOs=; b=LHUmUr9pfAs/bqL9pLDuq57EncJrCRHzEseO84Vv
	a82s0WHx+SIy46WdNQzPmXrvMIPqcdblp12K0z8Pb2bcrMtZ9DqCkfHXuF7aLcFQ
	6AfTX03NYW8uuSMwl8HWjXuVC0tnA/eyNCMkfvceMoyZzghC2Z9kM7a9Jj5rj2Rb
	DR37x2o/XA8f6VWmdk3sDKRcIAr3tvQ5CsV6Md7fWocjhJfezioc06GDCJSyWgbM
	NJ9nuId6HQJ9st/GuJSm2hOfFyzNZShys5xW/UmGrlJFYEUGmd2BNz/9rR1irQYK
	BRI/1aB6NC+XG1Qv5rcj9ChoCo9+tYVnGpoMbcUxbsJOAQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ssgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:34:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2b50a75d8so31219406d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602492; x=1746207292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLwVTepjDVXejNa1tCFYvYXyWyUbn6X2cQd++bAXZOs=;
        b=BIOoPoF31y9DSt0VsmUTlUa85wdR8fY3AvDKzT8xE/Hx9caAnlFApIS188Y6+dfLmg
         7H6O4gKFMmJo5JipWQ9sMdGjtubi2w0oGgAEXNQNr7YzBg0AXq/PC3fgekW/pzvDmfOC
         xlt77CelN9dX/O36rdoirBYXm+NSDAx9xUBCJvDOUA80auDYr8xkXL2lLkIYD/eCz2d1
         CqX6NExPkSB9JNNBda/vvundIO5VTkTLfhq4O4io1Gewj3SFuoIo9uiGKzZorM4D4nSp
         UG405TqMY2McceUe8AQz8OyCGYhoZPmYpeEYjRUfiVdQUoJGMBjAUIZ7pxhGTynME4fE
         t1mw==
X-Forwarded-Encrypted: i=1; AJvYcCVShheS7Fk8tCCaK8f++Lw6GGJG0v79BGdKGewF1RqIF5n3k+90TaXDmzwCvyf4DSVheDBl9q1s8v0smkwH@vger.kernel.org
X-Gm-Message-State: AOJu0YwDgyJgXbT+z3SANWkSuwVBRY8/ySEg3bbULj5dgBmNl7y/ZcOG
	r6y2xTtbpNtBldwbGK2aWM2cKyLvFy+9YpbdJZwcHfbtEDrQWzlT/zTaau1XUGHoZvBmgS2uS5i
	X3ErkiXUDGW0ZgEPY1bBzXeyjZv2km4KqiWd8ed0LMPIYrRpfsY04Fu0ayu7Or4xi
X-Gm-Gg: ASbGncvtyi7wr/jAGyaQ94xsIdFEAUyRMbE2/mcIhx6Jt3CV729sUEoinpMbFupOnoN
	y5Iiz8tIZhhGV1sGx8/PD7/uzX0eJXRCCFkj3ukaipRIZgHkJCT/FExQWToQDJWpl/sFgqKkN3H
	EZCEZ7n+hgXfdabCamexwcvaVSCrulbMxWQf0C10DcB4MUnDzWrG2xQNliXI90LKlGN4rAr6TbU
	sygBt4KZtkouFVVR4htYSaB/fRCykkRz89gFOJkPg3mE++5bwuW6uxWMKJh+zG2dMjpc/khyv04
	C4lRfMVeChI8eg5v51+/Xx5Bi2sazvp0MUoktliiLVniBgYH49jG4boZr5Eisx41adv49QOQqPA
	=
X-Received: by 2002:ad4:5c66:0:b0:6e4:2872:45f5 with SMTP id 6a1803df08f44-6f4d1f16818mr4509256d6.25.1745602492733;
        Fri, 25 Apr 2025 10:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0SyVjc0RwTNTmuwQe3VVznnrOs1x0zqUz05amuo9krdS8Yw9U8i0uKqP+X/0Qq0cUkmLviQ==
X-Received: by 2002:ad4:5c66:0:b0:6e4:2872:45f5 with SMTP id 6a1803df08f44-6f4d1f16818mr4508916d6.25.1745602492411;
        Fri, 25 Apr 2025 10:34:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d0019d59sm8153871fa.64.2025.04.25.10.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:34:51 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:34:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] arm64: dts: qcom: msm8916-modem-qdsp6: Use q6asm
 defines for reg
Message-ID: <kwvouq7elpyzktrwqdzjg7omzzn76ocxtauhlmpwgv6i2ca6wv@gpjksblyphm3>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-2-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-2-28308e2ce7d4@fairphone.com>
X-Proofpoint-ORIG-GUID: JccQFcAhB_fm6BSw58Y6QyJpFnw1BWOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfXwPLnqSFCOVXe XVMiXQSVLcMGdF/+SNSLLURZrDYRr62ZMx9/KOVNOKZPjqKgIpcoUP35+1IVDNV7NASVXlahmr4 zwkl0gbww8T87Pfg7QjlFxHY3PpTPhJ1Rz4imi/mJTW/b30Tf+j0HrxaURHDGuXu2CXDz9b85Q8
 ygMIeVwDFQUcQb6uHqOXLk2m7lXpPAdg8lkgbgBKTQTHOMQwMw72fp3ldBMOhRvbJqrV22LfTGb WJfWmRFHsDRq1LydKfsJ4AhbrNJjd9iDV3CHrGQ3WPnVG9Q19QPhfpaLUy3WdlKgcGsyQ31uccM 0fW5lTmGgAfjp5nksptTpc+w6jFcJzczlJW9rAVFyQ1exugIPwh23xnr4WjkOeYarOhajUg3bAN
 syi4G/HATXzQDGXQvVoVlkISqHfi5u9TPzBAVrNr0OGf+feZnOYFv6i2YOsUNImOuj6Jvz7j
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bc7bd cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: JccQFcAhB_fm6BSw58Y6QyJpFnw1BWOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=683 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 01:53:41PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

