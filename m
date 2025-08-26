Return-Path: <linux-arm-msm+bounces-70868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D12B358F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A4C83A7A3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BADA2FF64C;
	Tue, 26 Aug 2025 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtYTmx7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6A53093A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200764; cv=none; b=rJyy4JIM8NOaazBZyfX1iF3AXukAPmnzhDKIZLKqmRVGiJuhaBlsC2tmqXDqieSPz7ljIj/Lh7rlsgxjwQ8Pb/MjWIvqaniPBIHXxulVbTERP8B5dbXEuQhnWqfDhWzvJUhyXXLdE+x7hEGEmiPNdBhZApVpBxkUZVezb0Teew4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200764; c=relaxed/simple;
	bh=oTaKC1uCyo1lYnQ7uFQQm9lWFtm/uPvEC7t5hzGGpb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNmC/xQkWPNMTaoowP0f/4j2U1f9/WSfEx+k3mXBfV4W53232n7R7Fvbl7jGkqJxCUXTTp8+KCRBo2XkbX7MwNyN170kFPtQLl8fHWD/xJbaFewyZdaYwPJ1zqxHvhwekQxN29Ejl8OMpm8ZLuHHOBJALhz1hJbKg17CjEFmrLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtYTmx7o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q9MqZR002835
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yw7Fk6HJCJShlv2t9i0lzWI2
	sWKEgdH07td1ipZYTIs=; b=TtYTmx7oQltxw6Oc38y1ihdCLJNaDUO/XHkY7JlG
	iPA1iHeugl7VmWmaaonhvIPPK9qZhmH3WI8oZAfLk6S73i8tvYZMWCV7mW7fC20q
	IaQeEGyhU3G1TQL5c2DbLUz7AZBanjz1Np68EEFeS0eFhGg8xdw1GYTGR2umic8y
	1G6HQ3PHk5H7Cs7dQ3v7/oeu0ykQ3XwpRNspfepw1o7mEx4AfjkWALD8xJjhB0Be
	1GTW83bNMF8D6S9K8uYTymXR2Er1WkB6zGBiTEME2wLXtGn2wgrD86vftJh9rElT
	0pM1wD25Bi916ScgX4hSJm8Z5bNOk594j6DhyimubANMSw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpetm5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:32:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2d2cbbf9cso44582501cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200760; x=1756805560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yw7Fk6HJCJShlv2t9i0lzWI2sWKEgdH07td1ipZYTIs=;
        b=rs85o8OkWdoaFb8UF8PqdPFvG1U7nw/GVLSUrtQKwwW6LE67UrKV+p6hL1p4d7z/Ue
         GRpcJyprJ3kvuowDZaRx3Jj+ePfRVmk8XbtKGR4k6SJmFIJSK3h7AUNcAT165q8m+4te
         aMfr4xCWTUBr7thu0nOTnSABSDL2s4J+5WawtphTnEP6bb7fKkcHkvrNCJ2BLMrQYENp
         N7Cw5LWWQtU1duiZ/jkRYDE22daKIOt07WO1ubZfgEkrk0ErS2gCfmR/FdePqOyhV/jX
         7jMNNDeoMCazznb0yxGMy4rxgmjNvrB1olmSbzD7TtDkKIdS55bu81jzOlam9ScuFEMG
         oU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVs/54WLPFshq2kO+LINky+2mKXzOQ32gp79aggXz6/O/dBI0g7yGMmsnw/kCf11uUFc19FFR0iqp25L48s@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0nRVyLYcvIlpeQ8mdFWaP7HHFMZJp8okOEfYIm/13DGiH7KLc
	1pkm04pelFoiL+0XhSPzp+2dilNWF770k+T03kIbv4W48ahbN2FXiCZEl9GzYjcHy1S+2hyWhHs
	TVv0C0z3nl3jkDIrzIqHBUUYc15+5TUfbGqsN2AR7OxYxyNbpF0nLT4Yk1UNgHVVj9Euk
X-Gm-Gg: ASbGnctDb09JnFA07hQ+MMAc2kWVQJ/x4yfHwsK6FX8mYEMFsmymBjrTS01Jcg2h7Mb
	3OXJv2J3GPlX73nfvzKOroYt0Gu4+VNJSk39pTm0XeQF22O+37QspA2INer+Oxlr2vHZv4bTsw6
	FQmalWdSmUKQk57AvvmKfVOnwK4giTlQPv1o3ClgmSUs07rdhCkySytsEdV2TD8mdQXRedioKwz
	Wvb/uigoiTv75SeJoytJZUsDIwVQHGZP4pjsiSjxcLN8181tUEhdnhsazfAsS43T0Juwi7OlJUi
	YIge9ZFd2ILbMwcvQmAUUPgBhUN4NDmWTcg6tm31oAnayAXfNRFsKVI+kq9rlxVrqlFcO/k2PeP
	q3zNtZpNoKe/EqmBaZQqE9dqH0tKVd9dbXxbwxX3ZbfMzCuPKtmQa
X-Received: by 2002:a05:622a:544d:b0:4b1:c29:22d9 with SMTP id d75a77b69052e-4b2aab66b5emr196220501cf.58.1756200760486;
        Tue, 26 Aug 2025 02:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Pd9IGXO+XQ9K5LfqZoyJqKQgbNRBf/lZhXlh2ogmR33qnivK3QzAsXMGZxpxVrpfTu0QvQ==
X-Received: by 2002:a05:622a:544d:b0:4b1:c29:22d9 with SMTP id d75a77b69052e-4b2aab66b5emr196220251cf.58.1756200759935;
        Tue, 26 Aug 2025 02:32:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c9a1efsm2142240e87.118.2025.08.26.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:32:39 -0700 (PDT)
Date: Tue, 26 Aug 2025 12:32:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix incorrect type for ret
Message-ID: <m22aqeeviic76y5dgo6xgvlc6y3nl6xa34gnznp66g4exkgtce@eu2ta774tekb>
References: <20250826092047.224341-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826092047.224341-1-rongqianfeng@vivo.com>
X-Proofpoint-GUID: fSTfjbilcDPJRiKICTHsRxKqIoUBpiEY
X-Proofpoint-ORIG-GUID: fSTfjbilcDPJRiKICTHsRxKqIoUBpiEY
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68ad7f39 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=b381tfKDLOYfEgrzl5gA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX8lpoqOVjDBVD
 w0GrgFzWEKBj/jmDMET9slDZNR0RDS3QkvxzCHpXBcV1V+4pzcgHUdFlKj0CHkMokW1IB9NCDVp
 IXus1whAsFqravoXp0BZgmW+BLbvsoyfkJdWQeT2laqN2o7smW9KUweEyztbI5SSlWD7cu0a23Z
 5PerWzaBcScgGc35buZvdn46FHnTAoE7e6P1DrqXZtq+bpVnP3FvjJqMr/H6njQPl8J+gyjHptC
 NvX+35yHV0qzohJVMWE6qy/6k2yIWeV6O3AhgTP9cOT2j2FQFMFD/cz0w/45rkFu1F2CsHfknrh
 k3Dq13lx123tcvJptDIl95O7l8ubpzxZVGHqAB4oSxo3xevllGNw6FdBH6Lkda8Dde/r8kR1+eV
 QjqYNP8/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

On Tue, Aug 26, 2025 at 05:20:45PM +0800, Qianfeng Rong wrote:
> Change 'ret' from unsigned long to int, as storing negative error codes
> in an unsigned long makes it never equal to -ETIMEDOUT, causing logical
> errors.
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

