Return-Path: <linux-arm-msm+bounces-86452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B17CDB0F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4F6E30041DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CC53A1E60;
	Wed, 24 Dec 2025 01:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3XjD/zl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIcB1QQv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E1F245031
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538924; cv=none; b=N2viKqj8XTt2Bc/Q1gliCNzgwvd5Gbos4Ff+JY1EXmIv7ypSmQ8va6Ry29myPzDPi5UbVF1yDhnh4koTz2WOf+W4FiWHHHGSs+9gOK0BcWRdjSG7lvo+ExFi+SEl3LDn3iEzDJwk5NdPVKyOunmoOu1Mebpa4sC8b//nS/Xjrcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538924; c=relaxed/simple;
	bh=Xku24yDHtOE6sEmk/M9kKZD4G08wQOQtxaF2ueryN1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lw+yWzE5bky+B5TFf2X8U08CfWU/b0f10/eP9gGrB9xPjlvjT/XXQbTGryPzNOyQef99+Kc2E9ilJGC4Kmup+ORLF7QxGwdrUtORowbx2fkcu5Uxi53cHOHyB7UvOO04UWibAV7sygTLrf5t/Av/6CHfVKyhIp+dHUcdzc/HcPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3XjD/zl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIcB1QQv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGOG8J1018267
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b4q0D7NkeNz/Vq+kmGDFUVuJ
	8S7w0kBYhBpQhZWbzPc=; b=O3XjD/zl/pWBG5d40SNIh+N9S6utwvTCmK0gMBVS
	uMA5ts8b315DU0AcfQmIl8VyF96ATYFHHLpSxLDIHkIYtJj+57k3Jttxh7Ft/nou
	ufRlBze29hhIu07OoQKxZezL50bcfZg//VLkReCj9YVWdVT261NCU7H7YfBv21UN
	+nvmzyJYfu0VTf/dNmbI9a/ECrvGW21AGm1XsGgCjQXit/RK58MmjKnkoapy2Qe3
	bj5nYkK+0upQ+4ORZLLCTVaExCY/LLYsKwul1ijvoSmT+Fq+fFD4j+MyEkMnTPmI
	4OfekECQjsaqpfFfKOY8hsspUDSNTFj5hfmyaNaErvENHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9bce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:15:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so141925201cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538921; x=1767143721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4q0D7NkeNz/Vq+kmGDFUVuJ8S7w0kBYhBpQhZWbzPc=;
        b=WIcB1QQv4N/F9ugdmlCXimN+g9rIoMtpvq1mJ3ZAGv1KZcXJN+eBGgU0R607VaQ+6C
         QV8gZgC+NHOXawslrpmy8IdRUsqexL/ZyNzwWmHE4j7DakkMZ6p0ZEU8k12y0oT10CUr
         +M5INX8C7li9v/x4aFaubWpd7ILiiP2CUnXq6PEWGRxsxY7J9Pfw2TFmWFsUVsvi3si1
         kngZbS07L96pWLmOjIzQiyNIr7cQOu+XqFkz9cKB+AvFr1ySDfHmugcrH+pt6rCUdQ01
         /Elr38ZtcjK3oQOkTLvAfsy4uB8xIWYzFpTjRdkPy1PGzxynvo8Wu0wZn9bDueDZ1rNL
         gWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538921; x=1767143721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4q0D7NkeNz/Vq+kmGDFUVuJ8S7w0kBYhBpQhZWbzPc=;
        b=ht2H9TkC6b+sN455hEedfc/uCz4eYJIc5z6dx7RpsnrGMJTGLmVLzE2UWl/FIBLI+m
         i+wS8Kb0/xuG/kUbPF+ahXfFDIktTaVQ0CjoA2CMRyRhKsQMCq2f8l3mI/7lATsrc6en
         88xECnJr8G0jug+TKaAA4Gj/bfTznfyDpUATzpetbZB/SsCtGDoNApocO0RYXRl5faKd
         /VxnGPwiU/fr1ajQrHHebDRJPbT/kGhWwOd+FMoBDE5meS2dR9ot6N/g2T74G58aXWJt
         92zsiGHAI5nEvoRF50Ow8G92uBunhSZ2KhKJo7vgpZW/o1Of4bcsmT2vUkHGQhQ9OLHl
         2nCg==
X-Forwarded-Encrypted: i=1; AJvYcCWo0gTmBCWiPyxxuAVAz/pzdftjrafpm2mz0GYjpeyF7vQVwF5kiOC/NuYSmshq5lWVfqMfjUBUvYYg7SWM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9S8XQXuN4cdBO+/Vyko16UqndjXUJfqTcYMymvUDZ4k0freZS
	r15FWEP2Qr5+2I3jCR2NGZ+t9qd2inCbUuFOdEajo+6ZN33o+96oo3EJVQdpQFBa7PO8KsRAIVu
	EvIHgcK2CakD9WBCjbJPX63DwuxCYpYu3+IJDNDv6m1k9cbBMWF9RglFHfQ1ssPOG3xRq
X-Gm-Gg: AY/fxX7rYnFdWRzgIqn5jM26nZVOtCuVleZDElejVO7Bk9Qt2oxTnMJqUnA/VAVSOHA
	gJ5f+CVaDWj99qrQ9bKbV5tEJ6dwA2+teu9tqfCT3MofAtm2GUzbevo3Bznv+XhvgCx7daH782g
	NqzTokyjW9LzluiW1a49XL7QOdPABPVi7G/TaKIushhABrJE8OAZ+13VeIDctKP0Rzw5mdRw6NV
	m5c5FIGQzyrNiIAlWXE1h4Dm7+BRK7z7ctwgD34crz7LCXYqwzxyahWGVP5JtL8uYsKdG29NRLl
	FxuU22XJYBPjGeu6BIN1/8wWL0pZyXzT24nG7L1l3YrjuwUptnu1zobDQW4eqRhwK2yB2v6ckOY
	CrJGLsGkBniXLjdcE00h3b3+bvPNQiESQKXs2ezkj5RreFmGMcfm4b8TEGY5CU497VpwB1VYI0Y
	38Tq5aQFwDa0tFSkJxPsRsbPI=
X-Received: by 2002:a05:622a:14e:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f35f4839ccmr294274461cf.41.1766538921349;
        Tue, 23 Dec 2025 17:15:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPlJ0zgIqVmoR8XF7IVmAXnDQqrn9yFgbRvLN/shgnJZxjSn85jMH0OkDGhlGF5xTByPJY9g==
X-Received: by 2002:a05:622a:14e:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f35f4839ccmr294273891cf.41.1766538920925;
        Tue, 23 Dec 2025 17:15:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618cf9sm4591517e87.57.2025.12.23.17.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:15:18 -0800 (PST)
Date: Wed, 24 Dec 2025 03:15:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Casey Connolly <casey.connolly@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 07/11] drm/panel: Add panel driver for Samsung
 SOFEF03-M DDIC
Message-ID: <5rcsiogle5hczm3unxqlhhcg433rpkfhx7herfl6pdgdhh7tzs@ej3ell7c4nt3>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-7-82a87465d163@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-7-82a87465d163@somainline.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwOCBTYWx0ZWRfX+5+pH35ePovv
 Ljb+JswWieKRxnYf/zm2038S9iTw1rOBoaRFcHMsmj8s450C94tCgcejHlpyupb+hmnaXvuKR2n
 3hP3tLXWfMaArMitKXZt9I1Fq1XUUxzxLLoiZ36BxLoz8mm5jptrk/4zgwRgzx3nql6AFQ8wktS
 V4WMhw4BEffYVkM35hZ6ISRUYx/5wNpj5gjbT463WYc7gGFgqUD2FKPAudHYT0Hl1KRffATuSBL
 8mESnifF6BV+5O7H8BA6htfTl0y61EwBqC8fIIfRqhkC0zB/sLswN8gDjDEY1kjuTBYkgEP4gSk
 9bFPcqTz8IVnjkugBTbUpBqJH+/0w8P36JHrD6fRLxOBTuDNHVyJ5cLnwprKr/r+8Zo0T5htLwE
 sBG5dU7gIYE9vVCUU5uufl2B4oUEqZUzIvzVI183WW6NR+fspN/aKmUw5ayZcUtvJrSrpFZPGoA
 D7KDy2upJMmBGsPaXBA==
X-Proofpoint-ORIG-GUID: 4yPs3QVOMnJBonFVBfkWxOKHLJPyN2-O
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b3ea9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gKpLsENyAAAA:20 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=tnqT5d8xbY2qSbqZTlMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 4yPs3QVOMnJBonFVBfkWxOKHLJPyN2-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240008

On Mon, Dec 22, 2025 at 12:32:13AM +0100, Marijn Suijten wrote:
> The SOFEF03-M Display-Driver-IC is paired with a amb609vp01 panel on
> the Sony Xperia 5 II and amb609vp04 panel on the Sony Xperia 5 III. It
> requires Display Stream Compression 1.1 which allows the panels to run
> at 120Hz, even though a 60Hz mode is available too.
> 
> Downstream porch values are retained; despite not being used in
> command-mode they are useful to artificially bump the clock values to
> account for "transfer overhead" while that calculation is still missing
> from the MSM DSI host driver.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  16 ++
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-sofef03.c | 373 ++++++++++++++++++++++++++
>  4 files changed, 391 insertions(+)
> 
> + * Based on the following Sony downstream DTS command sequences:
> + * - Xperia 5 II (edo pdx206): https://github.com/sonyxperiadev/kernel-copyleft-dts/blob/58.2.A.10.xxx/somc/dsi-panel-sofef03_m-fhd_plus.dtsi
> + *  - Xperia 5 III (sagami pdx214): https://github.com/sonyxperiadev/kernel-copyleft-dts/blob/61.2.A.0.xxx/somc/dsi-panel-sofef03_m-amb609vp01-fhd_plus.dtsi

Nit: please align.

> + */
> +

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

