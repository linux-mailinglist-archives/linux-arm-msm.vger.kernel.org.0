Return-Path: <linux-arm-msm+bounces-81149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A44C49464
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 21:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 27B2F4E8A5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 20:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F732F12C4;
	Mon, 10 Nov 2025 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xi1eYA8c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T55e+mQ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2112F0C69
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762807281; cv=none; b=poY6QFWAKDxcVLbncBhonXV5qRy8FVyIquBXUO5Onuu0vMGQqIz5SzPadkecd8L2C8KsXaSOkoiXCf8t2XdgX7b+XsG1hSzYoCRWmHPOOIWzK/iwfnQUkNnA3ri+qglQ/QRvWU3ULaEfjJ+KWaSB6nTkhqNPvk9TgHwKFVIjS3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762807281; c=relaxed/simple;
	bh=/ULJ+RHZtgJ/qdu+VUHwEkwRnotDrHE8hwZukLRGwf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISM0gMnitJhqFMZiDj+lhz2HP+0PYV6rp8ltOufZHgWtZKhTeoWaWSsuQ/mm+oMVgnSyW+ShvL0RWKz4qpR6QIeTLE6Gh6hDcV5C2BAxhH4Tcfqjf2zUTQcJ9tE0dnkmaPPjGxMvjRZn91gTrBgtRXHN4saGc6rboXLTWqZ1zNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xi1eYA8c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T55e+mQ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAKI4fk212391
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 20:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FTlua583S/dZeMaixdSpGWSB
	TXZiJ388iplr0b/Hmng=; b=Xi1eYA8c8AvO0xpHrOwV5GyBJ98PFSY7Q09j9c+a
	H6bNYBq6Hl0wzrSvTplecqVfHJ5kkeCshwl66zQEU1UjGcgTPiJGCBufeYtT0SMC
	EWZh6xwq36HBPytwpVY5KXc7JAeufYjTQTkxxXX8+G8DhZpvu6YOv0U8vbdODPj/
	H0/bGby+bccYNUHstKVfyyUe0yBxa4YD14Zelyr2+/P9xmcJvHMG7wYcEPOP2HJr
	gIQcRyWz6GLFmZQbk0MXDI8Zl6Whn5uv2UUldnSf5FwM1lCvILAt3kQ+RUSjqalA
	PArADd/4uZHCw6lDj0HD+jIVnP7V1tPmebniWdt41fHtLw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abpy8g1m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 20:41:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed5f5a2948so97176571cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 12:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762807278; x=1763412078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FTlua583S/dZeMaixdSpGWSBTXZiJ388iplr0b/Hmng=;
        b=T55e+mQ4s7PMea37Xi3gxhTa9W7sKIakYU3DO3/1XnR7GykNY15xp0ErNTOoF+1kAm
         SnWLE9RiewtlPwBAuWUCkQxty4dIrxrZ/rnuU3vrXMGGs6ULPY+Q4/vSl6SkARIZ49DX
         azRxIKaZfdsXaHVSYWh7aCImATduwdW5oaRbKQ+O27PZBRKPi59fnDjRzuUqruGjGbti
         XpL4Q7Mm29hj683UtIVxLTOBXsXTST8GR3qMqtBbTJ6sZ6GpAmJMouH/2lZzwLwXoW3+
         5U9fMH2w2/tVX9Jsuy3HNaXJfSfrJ0Vo7RmYforgxXd71SfAa/r/JTVQ1iCDCaisMz/5
         590Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762807278; x=1763412078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTlua583S/dZeMaixdSpGWSBTXZiJ388iplr0b/Hmng=;
        b=T84u+Pca/IPgAIm6IgxIm8oubzc1Zl8hP2gddNtbLRp8MZMKI8FGQ/ZZyYqdbiCDpr
         ixfzkg+jmVPkiLpmnLF0iNuDjjfDBx/vYkfVf8nDPBupQ55wsXNjnVRDPgUMjAOI/Kwa
         c8MqkUCnmvTBkGd2iAly+Qgz9p5hckLxWrMbbu+vG2s6Dwkuv7GTUxpirbBAl2HVctkZ
         d3feCUbWRyrT4qRz7kdVYKfk4Uot/bqGeTfcYzU8BzCLpIn9HNES8c504SnX8EjJUenc
         n/Kx/BDBWEf1zRy6AwmLKaZAAYPFYWkHfr/sCV9HChVrlwBtv7V6hj+fWEU6EdTIEtyR
         8m9A==
X-Forwarded-Encrypted: i=1; AJvYcCUJJh3n7EL1Y/NbprW62fHuz1JNjo1xE6fSGbxQ5/uCfRMPxxelZLkeGyNg0VSk9AZ2VxMkIVR87ACsgX67@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9M/SXltmKY3fRsMX4JEt5+/KyOD0372viKDBl053DnxmKJ1Kr
	N1rA9EFrDRTS8O8lcbBKXux0N3ah83uGI8vSjm42DY23jozldHsRLt/pxqUoEdgOTum59OtbYuP
	X4U72jINfLIBzt4ICrWVcojSLmHEvmX+q9AKZnvHl13s989Tz4aqAiPFMdWmwuKUkvNTD
X-Gm-Gg: ASbGnctAVCgECCu4Yb7b1zDNJhP5/5y2G1vigXYC+mVODOtrk2kqq7ZOLE1LORtMg3g
	/k6d/VmLhPYzSGNVi2SqfWuHYyGu197K4ZaxC8JucHXLNUCMEpXUQwUo7r5ajCDQcYkMxeZynvH
	NeMNoGr2NCqS7esXwLcuxS8EGW3y4hXQ+9120Nk/P7tsHPj4ueKlGaKyuDAiGxSRuvF98WIz6GU
	3NoGCy4LzeeIHm6A8qvpRKpF39UH5inue0p/F6LcVIvtpZ+oWr65quzegfjJkyTfPrlByjGVH5V
	nL69iqqFcF2ZuNQ4pUCglVLUsE3Vj91ZWh5ySX0CxXbtnRYUGigv0I8KuVillR81xJzhe8IKyf9
	yJGP4TEwYHWq6oeEy3NFnnYKfV/3lUgSKTOBqp3S+tof4NuBTMfLuSsdNT2rxH+LSkaMWOBYVe2
	6Z5cT9ZgpdGmWI
X-Received: by 2002:a05:622a:180a:b0:4ed:68ec:ef0b with SMTP id d75a77b69052e-4eda4fb503amr123049781cf.65.1762807277878;
        Mon, 10 Nov 2025 12:41:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElUDq/y44gjPvRzLfM/ZwtkC9odeJSaAhtGvVNGQ4FaNWkS5GBSU5BWkELW6/a5ap9d7GDvw==
X-Received: by 2002:a05:622a:180a:b0:4ed:68ec:ef0b with SMTP id d75a77b69052e-4eda4fb503amr123049271cf.65.1762807277332;
        Mon, 10 Nov 2025 12:41:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0fdd55sm36895631fa.52.2025.11.10.12.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 12:41:16 -0800 (PST)
Date: Mon, 10 Nov 2025 22:41:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v2 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
Message-ID: <ttka4uevai7tzf4c3r7rgozzpd3hsdhjzf5uyysfzj24ex2o2v@r64z6pvxb6sv>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
 <2b34ceae-5e31-4dba-93e5-3fa35754fab6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b34ceae-5e31-4dba-93e5-3fa35754fab6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1dtJ_GlAEpRYJpT9i4EqgP5iW2YNreCc
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=69124dee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=p0WdMEafAAAA:8 a=yp1dWoDyaxJPrsKXCeAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE3NSBTYWx0ZWRfX6AaPOy7Q+7Y0
 ig0Ayz6fW4yMWJO6KzDWeeOC/3gl4vaztKMRVi6p6oxVZNvxEpJS4jJpiA9HEBwB8UZtUKEctvn
 wgiIgCklCWRwea4t6OslgIh700d9R81PGFov9su608NgA0MBWouVMi3u9GqGiuVhpvHVetYUA1U
 O0L2fbr0Bd8ggSiu/XFqWgZa7AJcqqzOVjrGXnDpjuWBtLs26NoB9HN5AYCMmYdIag6jsHGG90w
 JERd/sXSUwthXybbLc4eg1VmokFHR8iUzvfE/HjeYVbnJAPh9uhRavbajy+wc+i7+cWmpC2szbg
 CmfCRdRlE/DWIQWfXE4k3CFj1wjT88Yq1O8RLC2U/NQBbw6o4eEHd/40CtiC7MY4fmjXvcsCKU6
 oVK3l2HJUYxADP1ypDJj7w6Wm1tsaw==
X-Proofpoint-GUID: 1dtJ_GlAEpRYJpT9i4EqgP5iW2YNreCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100175

On Mon, Nov 10, 2025 at 12:04:30PM -0800, Jeff Johnson wrote:
> On 11/10/2025 6:26 AM, David Heidelberg via B4 Relay wrote:
> > This quirk is used so far for Xiaomi Poco F1.
> > 
> > I'm resending it after ~ 4 years since initial send due to Snapdragon
> > 845 being one of best supported platform for mobile phones running
> > Linux, so it would be shame to not have shiny support.
> > 
> > I'm very much open to suggestions how to solve this in a different way,
> > as the original discussion thread got quiet, see
> >   https://lore.kernel.org/all/b796bfee-b753-479a-a8d6-ba1fe3ee6222@ixit.cz/
> > 
> > There could be other devices in need of this quirk, but if they're not,
> > we could make it compatible specific quirk.
> > 
> > Until merged, available also at:
> >   https://gitlab.com/dhxx/linux/-/commits/b4/skip-host-cam-qmi-req
> > 
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> > Amit Pundir (3):
> >       dt-bindings: wireless: ath10k: Introduce quirk to skip host cap QMI requests
> >       ath10k: Introduce a devicetree quirk to skip host cap QMI requests
> >       arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
> > 
> >  .../devicetree/bindings/net/wireless/qcom,ath10k.yaml       |  6 ++++++
> >  .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  2 ++
> >  drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
> >  drivers/net/wireless/ath/ath10k/snoc.c                      |  3 +++
> >  drivers/net/wireless/ath/ath10k/snoc.h                      |  1 +
> >  5 files changed, 22 insertions(+), 3 deletions(-)
> > ---
> > base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
> > change-id: 20251110-skip-host-cam-qmi-req-e155628ebc39
> > 
> > Best regards,
> 
> The original thread predates me becoming an ath.git maintainer.
> Just for my information, is the firmware and board files for this platform
> available in linux-firmware? Or does it leverage the files already present
> from the original (Android?) installation?
> 
> I ask because the alternative solution suggested by Kalle would require
> modification of the board file on the device, and that seems more of a hassle
> than just modifying the DT.

I think this should go to the firmware-N file. SNOC platforms now allow
per-platform firmware description files, so it's possible to describe
quirks for the particular firmware file.

> 
> So I'm personally OK with this suggested approach.
> 
> /jeff

-- 
With best wishes
Dmitry

