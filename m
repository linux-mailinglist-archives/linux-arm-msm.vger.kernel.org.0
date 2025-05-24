Return-Path: <linux-arm-msm+bounces-59282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F228AC2EC8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 12:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCB2A1881CE0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 10:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E271C18DF80;
	Sat, 24 May 2025 10:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jopsFuCM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5F912CD96
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 10:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081504; cv=none; b=uyg0XmBavu+LzkxvnK6S4dM8G343DGDjqwqIiUGIhYIo6DCin9FPk/BpykVZztjwQxgib7LcbaX0WDkR54KMnq3iww51x74HBujlnwLzi16bQP+RJCsa5n1nUtIkevd9YF8q4bXXAUVs9wf0c8JFcQL9W9aN5V5Lc/GsDnWvS28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081504; c=relaxed/simple;
	bh=yi0nJZG9HpJprpjPC17cymVzwqzBeojV3kBquhceHpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpvXRkn+63UPFUdz5WS5qHEGbwnuy+fNA79qkfGfWsWQ9ITEdwFvtiKT4dd/mv/UkeQ7/meUH8Dtt6tzd+zv6qRbBPw8VHnfkdFCxKgnil4hFOvqNCljdUNSFCyE6v+K4EZTZYLARWGALu/EvwUFZQtSnC7IWLpPKIif8/5DPts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jopsFuCM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O9nisI000895
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 10:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q5Ywd8CbRuq6nVjt49lYrhT3
	U7K9EU94H7oOTbzR8PI=; b=jopsFuCM3uH7xTo+LmcRutvUrKk8LvTQ4RzCmBBT
	Wz5jsSkBvvtseKSNOO6c0U9M6h4usQhgyFrm/nO1UGodVGOJewNzKra9ndhGIno5
	CAffzgMWOo/aAFroUIbYMUgMbmHcekJ5RpylhFA+6h52rRgTDlK8mCzQwYJeuNOo
	++Jo+R/Tl4eh+ypL45h/NOnWao13fq+N4phxwPUHWCTDqLOyf9gd6Lv76aHiSNkr
	/1TLAuvwwNh102RQmDTPq0zmK0Vg/dSLSipkZYZqdBmEtePHcxIVqrwnsfIE0mBX
	VCikBpu61ee2fhcSgW0Yl2xdirPWfnAUQm/KMw35xwgpXw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5gft7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 10:11:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so13055716d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 03:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748081501; x=1748686301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5Ywd8CbRuq6nVjt49lYrhT3U7K9EU94H7oOTbzR8PI=;
        b=as21yFfY4Fa57WeXjCSgV5jkyUHUd8mLi3fl2sGNxvQWmgtxJfOUqKnAmObJ7VpMC2
         NOIKExEKWwvUPDI9sVAVY524+zkXURj9H4u+XUPsLs30AN83hhwyZkzeci0GTbMlVMrY
         8oaJbwrNgK9HAV3uHhUwHv9oSFr+0ReI5v+qYWDIU3z0RQ8WuIzYhT/WZxkQu34rRgGd
         vPyOiz4cAE3lo3pFyjTZB3f2u/KqrnMznqWB2EDVK/y2wyvScQq4qw/hbKt18hGajkE3
         sWnkU+TO9XmV8MvVRc3Fk2vRBr+/G5xM2oNBR/9cyiI/QM7xRP+4BL3XEZDDL8okYe+0
         9NgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLWQcjXbn068mZ9RiRLFeOKyaTSWsvoChNltALNHV6OzHFr7IFULgv44ny68xsio7cg0bYd7rZCiqnkqWU@vger.kernel.org
X-Gm-Message-State: AOJu0YzDY87qRD66N3vIzOvLXjOxHBiIQJ+w+kaNDvLP1cIZRkNR758g
	+eBD35vVU6JcIIYP4tyg7nDfbm+dtd4Im1Hlykl9kG5M/9jDUeT9W7McULuaOoChy2ksC9nz+AD
	8RAroDJLpSMh0vO1piuKCuLEflZtb3B4YzJbZysxzZszKOr2UM4S0yf7W3dNulH0QFthw
X-Gm-Gg: ASbGnctVtYgGPspG4B+Ha7VH80YbtAlZBpQ7QdG70p0y3EedQE9yCauG0CK2/kmlrSp
	4FHoSBGVtya9sk5736mQ1dYAG/SXkkjNjsEbFK3O+bU6pZpPpi9it/CRlaP3h9fC7LzDAJt5+/s
	OLGfSCtIumLS+PugjCW1hjoRpAjiogXgu0RxtR0UZrPoO1lKDdfquykmj5YvnPNZHyuK8igwQVJ
	LUnXIq5RXD3lljDXX4b50wf8SA3J3HQWwAfpHxck6NqNE5CM6T6OfDxKBelBPxF6cpn4l8SKARg
	iIpolg8I9wqT6gvXSoNCfZLaFzgMYSN2cwOsLHqBKGmS140/gb3n219JT5WmGBWdmI3ervKE6CU
	=
X-Received: by 2002:a05:6214:240f:b0:6f8:c284:45c5 with SMTP id 6a1803df08f44-6fa9cfea4dcmr46563596d6.4.1748081501048;
        Sat, 24 May 2025 03:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3xlcfUJq8nA48ODJlNUBRaEf9+7/QJQDSqq3iA7gxZrJiVGayzAZZZ+Q6hrv/sh+JeoK21g==
X-Received: by 2002:a05:6214:240f:b0:6f8:c284:45c5 with SMTP id 6a1803df08f44-6fa9cfea4dcmr46563106d6.4.1748081500681;
        Sat, 24 May 2025 03:11:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084c8c78sm39724731fa.36.2025.05.24.03.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 03:11:39 -0700 (PDT)
Date: Sat, 24 May 2025 13:11:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook
 16 G7 QOY
Message-ID: <6iuro54yed6tqfej6l2l2ky7dletbs73nwjnfufbuulkw3kl46@okoj2v3wvck3>
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=68319b5e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=cusL2G7gvvxGUya2EAQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA5MiBTYWx0ZWRfXyLQkHOdt7j7H
 zOGOD3tXfOUxbr06wz8qy245ZcQ4VGnEOimp+LeEvoWNBQAa4/d+PnrIhlZU1VeGas9toYsUyLt
 b1tQBcLc7PlDmgwfnIGj1uDpkHcRouc7LdFsAQ16El7myEi+E+s0kzmijCAbKjAzaWfPkKeTO0n
 fI7o4+DF/DUTIhlPZfRd1PWL/m24AHt5yWAp1N/diztrqdnSXQQh6rBa+IFq2JeXNQnvbyJQ0sr
 SOVL2lxHZmaZm3VhIO7+OjcMizji38FQh8CtM0aDk40ZEK5vP9B/VN/C3Cy6kIPfusP49gekX73
 bhYwSbG7bRUVKe9+vm/OtTTkAa0Q/r7DFCOZXdpNy1hskWXeUiFiIlXj//1aKnKOJyjTSHoHahW
 G85Ga0dQpfNop/RItDVm+XA5ie8zQIhtc24YTTvhpCvMr5B3aN0jGwB0H0QtWFbLWFELP95P
X-Proofpoint-GUID: DwJupni2P1gAsdoumPoI9q72c5Z7nQQk
X-Proofpoint-ORIG-GUID: DwJupni2P1gAsdoumPoI9q72c5Z7nQQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=812 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240092

On Sat, May 24, 2025 at 11:19:12AM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Thinkbook 16 appears to be an X1 / X1 Plus only design.
> Add make targets for normal and -el2 variant.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  arch/arm64/boot/dts/qcom/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..aff4fe3e81ec0d6f6d52e2aa0da327b7576632d8 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -327,3 +327,6 @@ x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
>  x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
> +x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> +

This will break without the next patch. They need to be squashet into a
single patch.

-- 
With best wishes
Dmitry

