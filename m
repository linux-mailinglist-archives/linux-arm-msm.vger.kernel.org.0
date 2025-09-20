Return-Path: <linux-arm-msm+bounces-74285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6044AB8CBD3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 17:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1590C463BEF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 15:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEC9223DF1;
	Sat, 20 Sep 2025 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aD0Ny0nC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0164A19309E
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758382945; cv=none; b=gYtczzDyd06qbLz4ZZD0ba+wNOeuabXaRhTh3HUDArghAk0wb4VZ5fOr4wlKmgbPMonqQmNlVpD6PGB/xWBwWoJ51daHrtWLPoTv5elRuRBplxvJ4aKeunFSUnAJJ8TEI5F5G/iP9pJpLecHV8bprD3bHNPg17klDH7GUO02x4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758382945; c=relaxed/simple;
	bh=7N5jlOZYh9u1THddtOHhgkD+bhf1xoM3gGgwqKJdFqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0nPNuB9nuVIa2zgTgWvZcBckqx/5ead8P3hL4ssPv/g7OqIFln4JxHdR7VCljUs9yH+DOrrWwchewdx568FxkT8lWnuG3rdKoECoiGRfq+lRFScNv066SJpuCITttpfeicAQqnHdFf+hUZK+uwLI7YcjDe/LBSDa2XMhuVQH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aD0Ny0nC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3lbSD007185
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ySgCIkEcT6RN//nbWYzuq5eP
	Gh9GHy2GH+slUyUPPTc=; b=aD0Ny0nCLmWMWLln8dhigVD2p98ZjnM7Hhjiy7Io
	OSzpOmF/9xFlnw6RgBm8V7VJsgtb1lY97wWsSaMOYIxgtInXVyUGiapOf2SpSKlN
	CrSnJqG3MwcNHv1tw25TBP3PJNayf95X2XeAUVgzdTA40POrr/MfI9TQzg28wrXH
	uzx6AryKBEzq7YLb1FLqPkUkxdsJHsVbGredFeKi20WlW+Ojl8mjeGOpqHjIrtk3
	Si79Fs3QH/va57PgWoGLIColF0Qr+RkMrSQIRBWnLD7NQWW3Ph7iazPI7GyFRdHu
	VFn1G3do5z/mE8j64iemUdCMxFE5OfG5JcGUO8safeWVSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn78w1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 15:42:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f6eeb20eso110385381cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 08:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758382942; x=1758987742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySgCIkEcT6RN//nbWYzuq5ePGh9GHy2GH+slUyUPPTc=;
        b=a9khjOy3bCdmMl0XcUzsxL9eONd8bft3eP+9EMz1IEopSWNFyEY97ctOM8ry8656mL
         zztOkA37SyfSXy0mtDoDpkLMfzatrKJWdMHzdMzhnb7RlF0r5TN8i4yELywK7O/Q/Cmw
         QGhUrtjZzbKkmEhj6OCzs09H+t3xmC2TxW/fcYVRk+7EvYckHMo2jnxpCA0PcD9fLV16
         Us8BEM4D1g7i99J7ZgJ2lQFSUVuyhnEE2p1xzT08eSk6jpJVu/8EH+8czF91UIp407DE
         o4xqTp53YWOYkufda57ll56i8tSQIoH8DLOVN/pqchX8IXj7NmcCboeO8ZnQHOZeIruz
         o6tA==
X-Forwarded-Encrypted: i=1; AJvYcCXAMBgOGOiHSuIFEk24tYySt7ecBmbgCXRX/HPH7/CeF8Xpnph9VJV83NuaQurhb+XGhJZH1vhDK3WeVpx4@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOPHcxZpbw2wYb+NFvih2i1P6CZg9l6OVJyqucwTD0QsWmvME
	DIvo+Q5P1h6fUxJpc1wwSuRc96GuOxCvQZlgmLGwBiboRAAyR6tO013kZhgDSKEpSZ8TWzL7hoW
	KyyXjEXo04/5WCiAc540n+Ai9ufM6YiOi/x7bYuD2XRRpPBPG2OofVfhanvsjOGpXT1Ab
X-Gm-Gg: ASbGncuz5zBBG8rLDXhfuICqItUCMM7ZJUcCzujZ5FCjjzUYnnB1Y+ZIWCspyXoNi+e
	6E8wDuuyZC39uy+qEI8bPnZTLjiH1aw9Dnw6hLyJezmE2ZUwQ2OjFjkkhNIavK0oEJ3fkmG5mc5
	wLJYj66AV3HB76Sg8VohpDWVSG2lPZmY+6rXk44Byh2eVfCGYNOa5Vsagc2QJXuvxcXeHv+cOVD
	qomVcN4lHTxc5Y5yqn1BujLS0JKCbbP3JZkml4+Z/Jhi2VZgiyR92Hw+ZfXUTdjlJ1bt4wOLFWe
	88OTaFFZUzX/CMK1KiJaHrWSG7baS+L4BfhOe5RVRFcediiwnKJfemXkoAkqtXVbWYeoqvFffqf
	cYTh+itpn10uWjvtRPbyw/sYg1lrnvrXMlU5wrMSdedBwKfxroYNN
X-Received: by 2002:a05:622a:34b:b0:4b7:9b8f:77f5 with SMTP id d75a77b69052e-4c0735e1ba6mr76977421cf.74.1758382941861;
        Sat, 20 Sep 2025 08:42:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa7N3uIqh65GWelgeqk16thcj0MeA27XSvrxJ5FJEhQq0QoxcPVOcMSSN3aUJTlhCRSHqxDA==
X-Received: by 2002:a05:622a:34b:b0:4b7:9b8f:77f5 with SMTP id d75a77b69052e-4c0735e1ba6mr76977211cf.74.1758382941370;
        Sat, 20 Sep 2025 08:42:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f4479fsm2017952e87.12.2025.09.20.08.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 08:42:20 -0700 (PDT)
Date: Sat, 20 Sep 2025 18:42:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 9/9] phy: qualcomm: m31-eusb2: Make USB repeater optional
Message-ID: <umoo45pmamr3qraaiommpqh37tgmqidylmtjh3iamlxs34s7wf@ouug53aqvdfd>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-10-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920032108.242643-10-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfX02uc4CXitSF5
 RWf31Km5D6/DkR+S+eGUokcd+x+nh4ppHqocqPu3SUC5TKOoWFe3tOy9MhIOPyTq9sV0fWW/AQ/
 hBx37FjftubiSNIjXabHRS65KZb3n0K6p5VGsaHae4qkFnqDSekSOgIqLjHqslHwz+IzHMl0DqM
 3GcJDWZ0sGU49eUojMadFryYG9dEQw0z4rSmUbpK6QieWH7lfOC8sz1wbirYiMTzjV9vRBzBBxp
 MrY43icN0SB5gAI8uuWXPQLhlL9QgtCDgsdOPgdSoYuhxIH80soO/wahS/4nkQzWjCKeY/M7yi3
 +XNOCuG0RNkfDjBrbD5WAVT5JjZAkRofmWnTUp2IdqNUBIJhr8rQjCxrMs1poqPljJNy05j/iEX
 rLrZl/t0
X-Proofpoint-GUID: f5hucJrkrSolcxZZ-3ZxQWYPpiLFZv65
X-Proofpoint-ORIG-GUID: f5hucJrkrSolcxZZ-3ZxQWYPpiLFZv65
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68cecb5e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=GYK7A1noeA1yCKcWlPMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_06,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033

On Fri, Sep 19, 2025 at 08:21:08PM -0700, Wesley Cheng wrote:
> Change the notation of making the USB repeater a required DT parameter.
> Issues were seen when supporting USB2 across different form
> factor/platforms, which led to enumeration issues due to improper eUSB2
> repeater tuning.  By making the repeater optional, for SMB/QC PMIC based
> repeaters, it can utilize repeater settings done in the bootloader,
> which cover a wider range of platforms.

No, please don't depend on the bootloader settings. Instead we need to
implement proper prgramming / tuning for eUSB2 repeaters

> 
> For other repeater vendors outside of the SMB/QC PMICs the repeater
> should be defined and managed within the kernel.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index f4355d38aad9..b8ddadf78c53 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -285,7 +285,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(phy->phy, phy);
>  
> -	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	phy->repeater = devm_phy_optional_get(dev, NULL);
>  	if (IS_ERR(phy->repeater))
>  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>  				     "failed to get repeater\n");

-- 
With best wishes
Dmitry

