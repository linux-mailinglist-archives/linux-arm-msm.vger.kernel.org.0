Return-Path: <linux-arm-msm+bounces-87615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60286CF68B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 04:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 236EB304356D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 03:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC981DED63;
	Tue,  6 Jan 2026 03:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbupfaas";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GO0PPo22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D646E56A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 03:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767668468; cv=none; b=oVn6u8EDKNLR/7eZjt6i3esmQwpHjLjTUM6ypSdbM1ywtiz8JdomgEn7S8Ccdn6Gy4BtmSbiDPF8CQoJXrW3ZEkK1XQNYokfjaf5FOHmU8oguQSRnswFlz5j1OUbYlDPb5utRRo7bF8fM/kaRwUK3mLGLAcS5hFqAU317lWdTfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767668468; c=relaxed/simple;
	bh=smPrto0dCXTU+3kaSZgrDcLBBAxeO/3T2UDp09u0XQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cnkd92mIRyg35B/UyGMfIQGzgM32+3aETiJqbOjLZ7FJqPmMtA50R+xDFSSfC8GyxWE0FnPAW8aipDipO+QlzkKajZTuT2C03jXdSXNknLNCERO7s1r5m0nODrX+RS3Onx13z0PmNkFt0RIFaaNozeET84V2gc1r68p1Xo4fAxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbupfaas; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GO0PPo22; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060num72292082
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 03:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OC3u+tApLwVhM1BnYlD6UioY
	tGtVW9pTGK3uJ7VFS2U=; b=fbupfaasrHtJPHxnpsovIPiwnogTONEkjsQpb4DU
	lFsTUP07eVJNoWCp7W5yWDQ232jfxAj/recxppu+F29lPcSFWDF5OaBVLFBiII2+
	4o+bp7lnxADx2DspYbKx/XZBZMVZ7KNiUfZlfi9j0Dkda7kAjs4YbcEVHcDnjqb5
	zZXaj+LrHvnJs9ANlTOYw9ZtzbbZi3xc5KCgluINERDm9gGm/Av4gTRyUpwp+T7n
	RnEdHxs2Fwo7weSQPH90FhqJL4X8q50ebTOiiEcV/ZEtkiyZEoInXg/AROruprPk
	6obh0sXGEAS+4sgyTS54qSpAkyyxbGB1HkiWo3KWJfzGKQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79nkaqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 03:01:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4fc0d0646f9so19943731cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 19:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767668464; x=1768273264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OC3u+tApLwVhM1BnYlD6UioYtGtVW9pTGK3uJ7VFS2U=;
        b=GO0PPo22us2WG3jpObhmsheQfSf9ejKuvt/aqAJmLZoJ1p1FgrxaZoEXgOXdOmhtbt
         Iu55IsW2zI6OheyMjBIdcOpyp5to03M3fWwRIa9/hFQCbIhqH/kgbGRZjSYuWdDi3lf+
         DoWCIguvKIBfycmX5E3qsQPlvYsm9Of9bP1PAGiyVirKOcI5WqDY3UMt1fApNDj7UWRx
         BmSEhvZylw1xoc8YHFk8FODlb+VHQYzTfhqyo/mghARmazieC2ilg+F/JetABbdIAiEj
         vmghQIRgpqKuzBIW6j4oOfNTTaLejw+6U2mTUW/R2t438wgWxbJn+4A6Rsa+FBSqVGhU
         LirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767668464; x=1768273264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OC3u+tApLwVhM1BnYlD6UioYtGtVW9pTGK3uJ7VFS2U=;
        b=Scaq2K1ooR/1ZzZweildi9kzaa7Vnb8bpBK+XRKjJ8DvHbY2E7lPzsTHMH5io6rGMb
         r0UCMAq4Nb/WBTOUh1BLCqZhnTF/rjsnYDqgDiskElmkgmGc/8n0zBN0xYGwEq/DjFA+
         R0/DbnpEz22VukTujf9beK9EzMWX6+ipkTjAFphY4KC2IfEWXRlTa1Dvy84YgynToTJv
         7mztStEsr07VWN5lWFa2aukcRfV7fTBQgmIzfbjsKIXCtZFKA6K9I6Bi27K+Y4KC2pDb
         sHwkGK+IPwEhy2HkNErt24Y0DEkaGGuiUTaJN+B+FYTQB7Kk3IVsC1mv9RGxrqnsfM1E
         Qyjg==
X-Forwarded-Encrypted: i=1; AJvYcCWYXHng+a3947vdVgg+uW1F4FrGZFRbSkOaYZZ58HsGEF1OZbFVtQIj8fgikFAo3vPYAm4XHy+EIx2U24Wn@vger.kernel.org
X-Gm-Message-State: AOJu0YzdRdLa+wighPopQHMX8sz8QN+yYEM2hdDTEB1dP/QGvoktuNC4
	b0SeFTG4fLokEHniiUo3hZNl13hVbxpZOZ3FBFwTe74L2amt0121s0R4v3TwouwhjbcI91d5bOc
	CVFAiwFvlC7LICwrr4QtSVzaje/U010Ocxqae3o7t0PwnFH77fcmz6dh8NpYft51GZ8NM
X-Gm-Gg: AY/fxX6cyeV2MMPG5lQUEE5oG9yTb23zEahBA3c233X5srUs36N/qrKfGqA+8kujJfg
	8+f+C1T2YDrs1Aal462Cz0q5VlSLp3nmtdDCPmBPk7iTzlHgNfZiSbn2Scz1WTZWluG3gHv2wEl
	hMx32jvgIO+VcgqAMnT6yETtaY7O5U6Vl/sDWVphaBoofJNLAOt9TKWy7UcJjaHdPmWY7IVdZ9j
	IlwUZPWVlBCzF9dD6ydQZUXkIDqTUiOS+blGRkwGeQoa9LdyVWUauJ2BEP6l290SwI7PrabdXzM
	2T9FrT/jg+mM97GZyFtjpOanGIOClveaVEIWC730blw+n0dCygSzCzMDlQxaSstkWBkZ8CNbo97
	hr2FvgVHeBSYOuEoQ01XoVGnI2d1cttI3d9o7ajpaTUwsGBdXQkNET1nlIrQx+OQjQWAmfcr/1Y
	RONXKemRRnjy0q1eIJA8mBZM0=
X-Received: by 2002:a05:622a:4d88:b0:4b6:24ba:dc6a with SMTP id d75a77b69052e-4ffa77b1dbamr22182601cf.38.1767668464262;
        Mon, 05 Jan 2026 19:01:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEobzTf2lPIangMEN0oHS3jpHzAtpeuUrTGa3tGnhhISVAAxziYc6vwUHpKV/mgzey2QUfvZg==
X-Received: by 2002:a05:622a:4d88:b0:4b6:24ba:dc6a with SMTP id d75a77b69052e-4ffa77b1dbamr22182221cf.38.1767668463829;
        Mon, 05 Jan 2026 19:01:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0da4dsm233154e87.41.2026.01.05.19.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 19:01:03 -0800 (PST)
Date: Tue, 6 Jan 2026 05:01:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v8 1/2] Bluetooth: btqca: move WCN7850 workaround to the
 caller
Message-ID: <5kflcsvtxpd4qz3nogck7xo6sj4brvnp6t2gg72sjc4x3bwm6c@z3x2gdnwb3sz>
References: <20260106024806.480779-1-shuai.zhang@oss.qualcomm.com>
 <20260106024806.480779-2-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106024806.480779-2-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-GUID: mLv0mz4kxuyFWCVkphqtH814d3qfgFAR
X-Proofpoint-ORIG-GUID: mLv0mz4kxuyFWCVkphqtH814d3qfgFAR
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695c7af0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YWdG3P-n8oS0mWOsiswA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyNSBTYWx0ZWRfX+JkYNvSzw4H7
 tp0MSbc9jFk0vnhwPVrUc25a7DmL76kCTKTxSBUovzvJmG1rUpPJEla2VGf4rMWpZBHnJSgp6YO
 MaLTTkXvtsuL5HAUg+mGBkJ+oiqm4AcnjQCrAh7yTMYKYiO7vhedBf0EdBtthRqhLFX/IkXsnsp
 rfoKTaW4zBkZwNiGuIat6MEfrqtfNILQIO9WjMqKGXIrUqED1y0QXUH7NUk5DIzBbkxweuIBwvw
 Hx4fGSq7vNKy7DLwCVBLv9BUx2UCD+6as4p0pWAEhZPlyOV0MKdI9/RC+CHjwWhvffHbgT29f8J
 YE9sn2pm4Ac71segURcXljhWrjX3jI8bNPA4E9//416MzawO6ZWXTEksGIaV3Bc9G3MqkhRzCUi
 yxo/Tijmqn2rSmnFRdzOq2xQa4pLh/r0eEwgu1qq9FZri3tL6PGZLqH8E9Cxn1/FSyZHTq/g/SJ
 /fhe9w+mR3TV+lCWzGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060025

On Tue, Jan 06, 2026 at 10:48:05AM +0800, Shuai Zhang wrote:
> WCN7850 will first attempt to use ELF_TYPE_PATCH,
> and if that fails, it will fall back to TLV_TYPE_PATCH.
> 
> To code uniformity, move WCN7850 workaround to the caller.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 37 +++++++++++++++++--------------------
>  1 file changed, 17 insertions(+), 20 deletions(-)
> 

Oh, you have ignored the tags for both patches. Why?

-- 
With best wishes
Dmitry

