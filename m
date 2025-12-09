Return-Path: <linux-arm-msm+bounces-84791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B9BCB0878
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 17:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65E54300EE48
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 16:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6933002BC;
	Tue,  9 Dec 2025 16:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDpxgASj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h86Gddlq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D1D2FF64E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 16:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765297081; cv=none; b=jKVpUS6sotbVjMgZjWiA1890XfPFzW1LA6VTcupY43N7VsvYb215Sg4RbaUBIvZxbtlQyKhHUYJ3A3LZZSvIGHlta6B9wzmUdRvqW1z/XvZDQ1jy9EvgtAEkEz4fG2qe8E1TNxs8mppUamON3UDaF/0KJnKsOb35LMe4MrHgevE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765297081; c=relaxed/simple;
	bh=Y2Lk733WYmLDKg5FYlfP1NWRsD6WeDL9M3sLn0p3zw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1XunLmr8WzQrHyKYX36ybNNAjUYjxz7GAhorEthc4xFoCh88N6660yf6YN1Rku6FTUfhJHV1IqbqY9XCFOuMKA9N4GMjLmZy3h/jVBxdeHt/Ff3p/83CUalweFzCNVtMyWRpbr64NGolAOz4nibyoJgnKQcgwNBX9jj25QEfFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDpxgASj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h86Gddlq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9Fhb22278196
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 16:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ElTGFxQMLglFIHDskkjStI1P
	Q8H7QYuzazr8vG/1lr4=; b=NDpxgASjIXmYN4phY+3loczxCDEUvDlUFrfTcodS
	NB/bb83ACdr0zqlcM2LLvqS6faGKFPeX0r+SaaBAjZCt+EOQchG7nG8Vrov8+fYC
	bRFlsd81+tBLxfUNl4d09ZEuPhPDHkPTvbghHVMZxLQdClutsUiY58n0wuVS0SiA
	J6dnwD2zKEZ9LAqljIlLCRLABLtRB3wSczFqNegGyBtPVZQ4phOzrrtgWnR2j/wk
	S57wWFbFBRL0FIaTCJPj+8f2vLlTPZHl63SNMJbiIJBlO+CG5bVd4tizGj1ziEs2
	r7ke+z/rAyyc86BfRIFr8fws0SL2Q4n2lyy7TLP6+7OGKw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axnpp8cad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 16:17:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55b188806faso3126422e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765297078; x=1765901878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElTGFxQMLglFIHDskkjStI1PQ8H7QYuzazr8vG/1lr4=;
        b=h86Gddlqzy/Qa+/OcueppB3+mc1e3kVEWX/CowbbO6YIm5eB1vxwtpYB51PlQ9FM4U
         LxUkgiwhZvCTE2z0CfKUIhGLUnHeLQs71PS4uwBVLkvLin0DbhuTYFtE0kerYgicZr3n
         3LK18v/EN/iqmSBhERZV/D+a03Qk70foWjT7lOPTTT9cE5/pIZmB4WVyKFVo+MM0zEmC
         8vBypb9iwU5Cn4x1zmLDNgPluV9WcDZ+KbJ51JUfr0z/aofMga/53sEx8NOfn9uUuqDs
         hYxQL+O042UYjXz3waERjNYUEEkXjcmt9zlbJVmKO8piDzwTg1F3OmhvvWSlAlTEAbyc
         /UnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765297078; x=1765901878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElTGFxQMLglFIHDskkjStI1PQ8H7QYuzazr8vG/1lr4=;
        b=FdDJLQz7nVPEyhKmFCH9vAYA+STTHV89tnHnQSBcS52HNkDhosRvt8J0bNCjDspG26
         TTsEeYnRqjA4z4pU4nX5RzqtsWD3INGV7pXpGBgpiDq3UaKR/dshxovWmloX3qGjPjua
         Prky7di2VGGjFCnFYhi5DTCCWgH/FwiZz1gJd3TrCykZvWpGHiKuHDPDsUQPR+9RQY2k
         TMSo/aI1pBTHjIU/6GDI2bsMCLNSSwBrUlGDd0slTauzm0OdzYs6BhJuU7JhZyOoMWTN
         ARfGszVlieQhP3gEoC7B/vuyZm37CXvMOe3NWO97ji5hu1003qQcWbnWOJGTzrVdO6W1
         2NZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiC7f/4o7BC7xc1KiypwioXOLk+93E/94Bs7UQStltyUtx/WmL+SPBZHC5AJy+8AXdbZZchG3tm964IZ1V@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7uGQZly08Y7QB38T/kUBZGRfvhfHJNya9RwSdu74BWc9DqAOw
	oHDvYIxQAS4U0C6ihQin71Y4C0oPfnfCsnSlc1SlLdo0pYNs2zh5nT7Ckdenggk5+rtZjIp/iji
	ezkz/5bliuFsYZqPXtSXooZYooumBsFMdwFa1+i9v/chaCEBHjFLM5qV0ZUMlyN91tBFC
X-Gm-Gg: ASbGncs9TUfItYbvTj+K7TdAWHmAuzQWwUqdwX5Jn+nFjeqfRyfzMK8vUItQlgFVO15
	VSEl6FeLYrvln2kPL3e7SoFsx43TzyPIYMQYZdEYVRGWUvtNWwcoJr6nrphuBwVIwab8SKYVblU
	dojhPKYI8YN/F4FCzDP+iPQaoocUgf7pvhBUGk5vT+XmnevpOj1jdpAXO87J9KWMMTiTUSHLqMH
	z4nYZ1Vtxo/mslLaZIaXI0FOcGD2dQ7fjvzs2E8HQLuSWeWqbKHrMsd5w4EsWd0xgor1tWmfETW
	Kslgq+o+PlzSyhX9yO4LjtxfXqC+9k2uQ70I+fxfaM9FypGDbDuZyxOXgGIUFaR8FO5mC+mdye3
	kAUMUwBJa8eJk2gW2NIOeAJivYLEhCgcx1njAQ5kQsYvwksdeUyPM3QBV9XXfRqY9Cu4VZT5J9L
	fTEwhXWWdhqxQ3X8fPVe449go=
X-Received: by 2002:a05:6122:318b:b0:55b:305b:4e3c with SMTP id 71dfb90a1353d-55e8477c8a3mr3515779e0c.18.1765297077724;
        Tue, 09 Dec 2025 08:17:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJplDoWHUuU4XC4O8OJ07DX3zlSMoz4LtuK7lJSnCPjCg3HxqIF5X2AN1S3eNyf/G03YBuuQ==
X-Received: by 2002:a05:6122:318b:b0:55b:305b:4e3c with SMTP id 71dfb90a1353d-55e8477c8a3mr3515760e0c.18.1765297077298;
        Tue, 09 Dec 2025 08:17:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70595fcasm46117731fa.24.2025.12.09.08.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:17:56 -0800 (PST)
Date: Tue, 9 Dec 2025 18:17:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Use 'usb-phy' for node names
Message-ID: <xmserprghzwpcxt7ionh2ju7o3cudj5emtkycvurbz5obztzr5@lkllnnsag6ri>
References: <20251209160755.3878878-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209160755.3878878-1-mr.nuke.me@gmail.com>
X-Proofpoint-GUID: yt0VIUT2JaYVdLMNIhbpn1OvE0VzfTdZ
X-Authority-Analysis: v=2.4 cv=dciNHHXe c=1 sm=1 tr=0 ts=69384bb6 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=oe-HYfr5i6muIj_1Hq8A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: yt0VIUT2JaYVdLMNIhbpn1OvE0VzfTdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEyMiBTYWx0ZWRfX1uX/H/jrj8fx
 +uECpk2fL1TxDVbqfyuGLioas7Xomab4Wg1lrKWO2ldtnCcdi3Dd7OwPlaQUk94YXOMcbD5BtfK
 vMXkpam/MiRL2trJlQSvYWdx/dOFwf9CTbmPlCvGTJMa0j5ltWOeTLYUe/o6Xeb3kVoTXCbXQnf
 QX7TUTdZHrkqNp2DuqQmgwwKhUcwxl9rmlMHwEaRahjqD/Uvla44PWeOEBnHCjTlPR1LLkytPBm
 UVQeuel+zxevC006IJ3Ix4qB2NLQlkzyqQ2PHP8SUElfPjT3I43CheUCsuiPdx4VTbNGyt4jbjh
 O1Xap8qjUanv8F41nVecDdr9Hg4jZLtQa5dle5lbdySpwsDMQWIOxm5kXabXd7KfBQx50eyFPBH
 kYsoi8euv7XrtEX9GsNlUoipFOyD0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090122

On Tue, Dec 09, 2025 at 10:07:54AM -0600, Alexandru Gagniuc wrote:
> The devicetree spec allows node names of "usb-phy". So be more
> specific for the USB PHYs, and name the nodes "usb-phy" instead of
> just "phy".

Why? "phy" is more generic.

> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 86c9cb9fffc98..4b8cbf1ff131b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -702,7 +702,7 @@ qpic_nand: spi@79b0000 {
>  			status = "disabled";
>  		};
>  
> -		usb_0_qusbphy: phy@7b000 {
> +		usb_0_qusbphy: usb-phy@7b000 {
>  			compatible = "qcom,ipq9574-qusb2-phy";
>  			reg = <0x0007b000 0x180>;
>  			#phy-cells = <0>;
> @@ -716,7 +716,7 @@ usb_0_qusbphy: phy@7b000 {
>  			status = "disabled";
>  		};
>  
> -		usb_0_qmpphy: phy@7d000 {
> +		usb_0_qmpphy: usb-phy@7d000 {
>  			compatible = "qcom,ipq9574-qmp-usb3-phy";
>  			reg = <0x0007d000 0xa00>;
>  			#phy-cells = <0>;
> -- 
> 2.45.1
> 

-- 
With best wishes
Dmitry

