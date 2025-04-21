Return-Path: <linux-arm-msm+bounces-54878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D30EA956C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 21:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD36C1723C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 19:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE471EF0B0;
	Mon, 21 Apr 2025 19:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSJ6VfM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02DD1E7C18
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745264155; cv=none; b=FwVYCo7+EkWt7DShNSHr7MxAXI19a5Ey7YpfoD3Q2jy7VUdKzkEhmtXJfsBLsOuSJhiz+ouKr3siOM4L9UAOX9qZ4MpvD18P4Tr0lX1QLnwgUxMLBdWe6PPCsIN3NKArufjq41d2o8qSSoONlPCaZ3EyO2EJ575RuPkslZKAUPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745264155; c=relaxed/simple;
	bh=SbKiprvdu+s+l54ghqSeEGtwo1OssftIDBCVOa72pt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+qsTz0lzfILAF0jA4DuPWa62FY0WKu4mjdHgtFxyAREh5+wpGLTNT1DIMKYKr7MkxwliUmgX48pknroJy7VWqi/khJBI7x49IvEcxbPfnOBZzu3po2K7liezoalUGAQaq1HciEPE+EpX7rnUSxqq6352f0eHkwnvCkAZpvKF88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSJ6VfM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIh5YE029545
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 19:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=om+egLePgGfYseSunmGqN3yI
	bby3rY1UOjx6vajoAVk=; b=MSJ6VfM5DF2XFLi1QwD9htczC6TH9TQU3UvnpGTP
	F5fhKRUjNhpj625imdzHjH1YA4jL7iH28ol3pRLgu7boSMBFWdDoLpiXTv6jM1P3
	YDUxo3XFk+lEm9UDR2t5LYTL/gAweRpopggXwLYpNE98fUUZdwgveJ4dzBKUWRJ6
	U54kisUW59YCrHk2SisJ0fPnWN1h6Tl+ShfetXk9VYUef0K3XbEiPBtb2e6Juhqs
	JkZv7onSVRfxb9ythaMZCutYkBwLbAFux4H+J2wBIjOgWEgA0uIjO7Uq3qboWbaP
	770BDq18oTiHNmWBX6q4qE/OFBi4W8kbKq3I29v1tFUteQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464478w5h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 19:35:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f6443ed5so91120246d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 12:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745264151; x=1745868951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=om+egLePgGfYseSunmGqN3yIbby3rY1UOjx6vajoAVk=;
        b=redwl3UNLGVzu2JfJv2vXtredD5ny1Y/+pF+sqcmTYSi3yiUx74QbVK4H68RyfKJgk
         ZRd3CdJNv2ZlnEruIIJ3qBA+M8B7eRyfJmwysGFU6YP9W5u8+CWyzUKWIrVvHwzgSsaw
         doCHs2q0T4yU1vqi5I3lSpyIlLJNkAyyHFlk4nEPEaSqfoEykTVCH+EJrbYA84CJFB7S
         NJ1AQ9HowKc0gp8zYrffh1I95T0ak+GyZVzRdX3LS6IZ93yjlVQyNA3QpNKi75137JPS
         DuCoNbbsj0IHaZzaBun023/0kyHUUReHHiu9J0GOPE69UwrVTVrdnugUMzdgVcs32EgZ
         UhCw==
X-Forwarded-Encrypted: i=1; AJvYcCV9F72pb6moyFfDhj+ROYBsfGx5QNMWkc9ldSO6lvKw/cxjzs1G8v40vzubkmM+2BU9IYaBerwFKxyhME64@vger.kernel.org
X-Gm-Message-State: AOJu0YxKubeMBVs/4brkvrty0rPEr2UAkoikdAQiMCA9HgfWmILq/6wq
	xPJDBUUUojqop12NZNVvJqQ8LUlnjADFtu1D5ifgQ97R194m1vnIT5G00FPUiMabvkGN1ovaldC
	qJL+c3ZNjJxBUaNHoIadMkfRCcKFVKt2t0JOtH/czFObbh8wbIL/vKGR88pzSvpFOmMKcwCvA
X-Gm-Gg: ASbGncuinR9+SIA2pS9mIgXkl8RCFSNTGeEJUks7GsHy8eQi6ZajyShz8FuwpetD5nJ
	+zd5f36Lm+1lZrflo3ozZMua+Eob345pzVgcqTXB+UrdTzDHxWXkSGqyEWhcpA2ZX82+QZRp321
	VyiLGORDwULbIrihM8o5JIx62Km9vIz8MiL8EX9qfMeH1moAUVS2kAjFW5aDlweRVfwtSemLBeY
	fNXlyJDxbM31r/uJBG2/LvimHWBQslCiW/z9jyj80oCV4bhTysAMp49zQMI221Klgw7TwRZYdQ3
	4jaUcfvBLXgIUA3l+4A950cZyWivcpX0+36ahXtr59K/YRWrf1lMZlF6sAONQlqAcaiFM7TccI0
	=
X-Received: by 2002:ad4:5762:0:b0:6e4:540b:5352 with SMTP id 6a1803df08f44-6f2c27b2031mr229557926d6.16.1745264150801;
        Mon, 21 Apr 2025 12:35:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxNzS2YaVJyYpzz1s37ReU986z6Z+/tz7FCIXXRT5d5zk4FBxJfdb9F9EQ96XJ15BWNYcBhQ==
X-Received: by 2002:ad4:5762:0:b0:6e4:540b:5352 with SMTP id 6a1803df08f44-6f2c27b2031mr229557636d6.16.1745264150384;
        Mon, 21 Apr 2025 12:35:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f4e20sm1009454e87.217.2025.04.21.12.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 12:35:49 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:35:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Widjaja <kevin.widjaja21@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: qcom: sony-xperia-rhine: Enable USB
 charging
Message-ID: <svhbckb63yga4eqp3vvlhrns5aj37cuwyv6ctrhn5snzkt27ze@zxi3zlglbi6s>
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
 <20250419-togari-v1-1-45840c677364@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-togari-v1-1-45840c677364@lucaweiss.eu>
X-Proofpoint-GUID: W30Fc9KLRIglcxVPjZn6wAhaS1hFgp0k
X-Authority-Analysis: v=2.4 cv=CYgI5Krl c=1 sm=1 tr=0 ts=68069e18 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=YFT1mlhl2oHJEvFVBf4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: W30Fc9KLRIglcxVPjZn6wAhaS1hFgp0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=925 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210153

On Sat, Apr 19, 2025 at 11:00:38AM +0200, Luca Weiss wrote:
> From: Kevin Widjaja <kevin.widjaja21@gmail.com>
> 
> Set usb-charge-current-limit to enable charging over USB for all
> sony-rhine devices.
> 
> Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
> index d34659ebac22e65a511994ef201fe04f12089781..915221e00ff348309b62bd9b637ae9771d213f1e 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
> @@ -449,6 +449,7 @@ &smbb {
>  	qcom,fast-charge-safe-current = <1500000>;
>  	qcom,fast-charge-current-limit = <1500000>;
>  	qcom,dc-current-limit = <1800000>;
> +	usb-charge-current-limit = <1800000>;
>  	qcom,fast-charge-safe-voltage = <4400000>;
>  	qcom,fast-charge-high-threshold-voltage = <4350000>;
>  	qcom,fast-charge-low-threshold-voltage = <3400000>;

I'd say it's a strange placement of the property. Usually generic
properties come before vendor-specific props.

> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

