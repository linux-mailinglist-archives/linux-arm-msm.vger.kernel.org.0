Return-Path: <linux-arm-msm+bounces-60530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F2FAD0FA1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 22:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD9ED1891764
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 20:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E19217F27;
	Sat,  7 Jun 2025 20:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7dWBebX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1968215779
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 20:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749326918; cv=none; b=n1VH8nYoAN4mLsQkQ7NHv3uzrH6Cd7V0A6ShE3ydJBrRLTYdU7YDYe78av5tMN/Ys6Ly4wygPhUnpI2qWqvkd8t4xoIJWwj6nRuH3kS3qdRNgjnPJpGFs6j0jL3h6nfi5aHEJiZ5v8B+Jg6rmwCFuiifhQqQREzjfPv5aBsjbF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749326918; c=relaxed/simple;
	bh=VCmRdOUHHx69BMRY8Zh21+gZfzCtkEfrMaDX1Ai28fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgVnm4G8jKe6LpjGz63Tcvs2Re9zZEcmkLJZP/+Gdg0jBDt9gmKIHY6ZfzsjLzWhyVM4BGIQZrsa0FqQnkX966h++Vya3FHGrkK8Yt97QBFpQh4NJ9JwL97HfIhrIimvzO8h5vwIwbparBZCYXo6tgHB4xh0C0s7GJb4qSNLt/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7dWBebX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557JRdqa029427
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 20:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LcGfjI1c42cfgKc7S4/kHbha
	JgN+ngahbXwD1Is9qfk=; b=o7dWBebXGy2Cs22/xuJV35Pxmnsjac75jmvdr0S3
	dtGm9z7kVKJL9nLHnG6beiYIxvRYu+LqzPWTLQzF88i/j7voi9xVL346mIrHCvPI
	CDYTeSpDaA7xAQvzQ6mrZERBuJ4q7yKHxn/2OebdZheO10KrUyS7PSw2Wn77ZGX3
	hVrN2ocOs2yjxgl8pNeQueDxjq8RGxy3cL4lWw035nGiKw2DW1NiXrjL/0CidDCC
	smmHUHqxrA2w36Ku5DWop5gvZAFpEnxTO8g7J4Pp3o5d4XCcpdtybvFq+YCpvwyY
	qyxlp5KeUs8rvM20sdLLnww+iJHURWvT2sJULIOyvjB56A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv13be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 20:08:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38fe2eff2so31754085a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 13:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749326914; x=1749931714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcGfjI1c42cfgKc7S4/kHbhaJgN+ngahbXwD1Is9qfk=;
        b=qzZAqxlO5qlYWzMGEjakUJktaQLimIBcyDDgwEqT4ctbRTpRB3pLyHF/y6GBeCSAxn
         CUWsLum6HWKtHJ4huoC1RfWCsNi6WkrV8d7jnGeKzgT+IxB/wZdrXrDAL6/XQWmuK3Mc
         IxXO5H1TkKmFpQ+0fSuVC5g4lGTo5M3KWAyfP9zBqwKV5kTZAX311TPS1MOmxMQ5aIbP
         KON1GNKEF1jUka1yB+n0dYWjb+P98c5dYBLpO/zlw8CF8wbijiWmw+8YKQsLfvYbM+dh
         tB6UiwNMjvYoXKgRaR/MFfXcvFQPS8XvF1RAtjzZ7Hx6fxhtFmeALH6IFw22FUkQdNeg
         ldpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfR7lV2oudHak/q01ou3cOSxznLfoW3Q+sCFKnNG6yO4tXBgUO6GojCpyMZMDWjc6bEvYVCJLo8UT5ry2H@vger.kernel.org
X-Gm-Message-State: AOJu0YyCqLht5uOZgH0V7bQTtY/jh1H5gIGAQ1TFbWv2nMnsJLEEHqFH
	phLnnD2SE9tGr2iwXnOx6fGwgDYnYwIdFBgyw2BloDRFC++PNIWTaI0MdzEuuF3BdWPuQQvj1xX
	fmQG9qOxJnayB0rbKeB89cJhqB05x2Bvz5WViab6hKotdPQVKEbXijRWOSPFMOjIvDjxJ
X-Gm-Gg: ASbGncu1VWyh8FvAiyrnTq2wKYW58OVZ63B5/JkTfwnFXo4uOTNhe9DQ+fln80fsgL4
	rViFPkqcvfW0bH/HlE902vhC5H91USjJSAfkcT0LQHZCD2K7Lr/MJKuCdtSyh1wY/hVR0KWFIRR
	jBfOKeniUUiq82BpO7eQmTncVOZNEwAPTiLWcKLnOGiqmVZ94yxVEHbfb/2yeUaQrmDfGE4MWxw
	BL5eSuFco5U9zijUbqQlA75QJO5dpwEI5L3qY/h06mJXJNOnVYFO2K2YkewNpU4HkgPUZfsbAzz
	Xj7TUnKOTGkUR+CpgociGBwuIn8a/NW0jaYJdO2xQygqVGERyb1fGosRGCbBcwE092yRpwrqpIt
	15EA28rrDSA==
X-Received: by 2002:a05:620a:199f:b0:7c5:5883:8fbf with SMTP id af79cd13be357-7d22988e34emr1206536785a.21.1749326914451;
        Sat, 07 Jun 2025 13:08:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjhcwfKBxBqhK/w/iqBpz8K5IgFSPkf/a8LQCs/4fz1R0yrkN5KXByabTonhsJQyxPWceGJg==
X-Received: by 2002:a05:620a:199f:b0:7c5:5883:8fbf with SMTP id af79cd13be357-7d22988e34emr1206534285a.21.1749326914070;
        Sat, 07 Jun 2025 13:08:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731785sm595624e87.216.2025.06.07.13.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:08:33 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:08:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 2/4] usb: misc: onboard_usb_dev: Add Bison Electronics
 Inc. Integrated Camera
Message-ID: <lx6z62sadq5ijteuww3o5mriti45abty64ucmzig5bdaijumzn@dponhgcugds3>
References: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
 <20250607-tb16-dt-v6-2-61a31914ee72@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-tb16-dt-v6-2-61a31914ee72@oldschoolsolutions.biz>
X-Proofpoint-ORIG-GUID: wUcGWZ3hqe4S2wZScPs0NMPiCszPlqM5
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68449c43 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=gIeN6KSkFSykCpat-AUA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: wUcGWZ3hqe4S2wZScPs0NMPiCszPlqM5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NiBTYWx0ZWRfX1WNoty8qp4oa
 Q/7h8nhCMjW1fzV2Knp23CSrncWdfIOEtr11SkRd0XwU/o/ZD2p5Qk1JfjoiJS2j+mMA8JOOJk5
 61fhzT7PU87bCCKn1E4wbQuQ2OPsU/wzvlMe1EOlquJrm5w3kLcVeA2pUuTIwxpUvkFyq8z26nE
 8XN5h8MOaan6xf5snOQKU3L+6rzyQgFpeGhcXKInFcvJj567VZN/r3jdPcxw+DoJGgrGgHhgLKh
 eAvu4jNaVyFSIk63o5eqbaVm+EuwpmQS4O43uBqTaqCH8mEWqJT11SpwSOFEiUjiVt7Wi5YWd5u
 YTsZpKRGZwAJHcF1Z/7J7hPBINWhWRGWj0UnNZ+wGtAIPIoi4YheOq8ehEWQVpktt9Bbm6y4wIG
 0id0rnDQm84kktWNiQFdyl8d9FiipQMs9iYdmZLrtUgubMR3K8/qYDd0GP7nDrRAxibbni84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070146

On Sat, Jun 07, 2025 at 09:19:37PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Camera is built into the Thinkbook 16 G7 QOY and directly attached on the
> usb_2 controller (dwc3 USB2 only). It has a separate power supply that needs
> to be controlled for PM.
> 
> Add the support for this device for the power supply.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 2 ++
>  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> @@ -127,6 +134,7 @@ static const struct of_device_id onboard_dev_match[] = {
>  	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
>  	{ .compatible = "usb451,8440", .data = &ti_tusb8041_data, },
>  	{ .compatible = "usb451,8442", .data = &ti_tusb8041_data, },
> +	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },

The list is sorted, so this should be the last entry.

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
>  	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
>  	{ .compatible = "usb4b4,6570", .data = &cypress_hx2vl_data, },
> 
> -- 
> 2.48.1
> 
> 

-- 
With best wishes
Dmitry

