Return-Path: <linux-arm-msm+bounces-75218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC2CBA1BC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 00:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BC1D1C84F0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 22:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034442EA46E;
	Thu, 25 Sep 2025 22:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ru+UCULM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772F62652A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837862; cv=none; b=lW3Fvv7lcghZPgYTAUZ3wxeIqtec79O0ezyOfM4sD2oqfyYXjWxoUSfjaj/qzAfyeApriWazWskvDfrVADtL65lWkZzZDmh0nwDjlm0RDz9vUUc51+IfkKgAXp+88Olb3aiCLL63sJoa9PpTTwwZ1NDtVtGMQNKYFXmrbMdQ3CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837862; c=relaxed/simple;
	bh=thd46MhkhP9ihbD6HfPrmrnhApd8VH+s/ug/zP6gdPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=td989j8ObdeXb50zMcZ02PnZ9Zf5JFlENs7s4qeMxBiXd6ZZpU54r5Zao1cfvY7MYkvf+066auFUR165/xvnW9kVY8ULjqisfgbeRLhZUL08Wow5Tq4u216meP45Q2eYZ/K3GImXcy9FF4LiP2zByvLwni7QUIDpvZR124Wc7nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ru+UCULM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQ6ht015742
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 22:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j9jhbfMWZLDlbLvHbgzYA6UULoA9b5J9ED0wfYv3EO0=; b=Ru+UCULM1uxxF5QY
	PDVRfUOSeKE72n7qUtoocVn/0tyOHj9fRxaGgSbk4rZ86lGWt9+5WJV3rXB/XAbk
	Nk6bozdWhGvHx0Alt95icca7C4ODdW6591lIlQwg4zah3Y8PkwsS+REDlYL1zBAe
	2gOrehMmLyv7U38Wfbm9R8LCx5/ND/Y6XkT4RJeQqwV7AbA722xoHEOmcLu2753F
	Nol86Xr6VgkCSY8g6wRCC4YiL5ew8OzzVnoTl3tmbcS5yNVcDpndvJyF8cgGJ3cU
	xwkQtuv0JPsB82pmqxoLoU1xI3mT081BHe1N+3n3T3xolTJ+cVNW7OaU1LKMbL37
	xxt8PA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0t8hth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 22:04:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8544316ef6aso563805185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 15:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758837859; x=1759442659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9jhbfMWZLDlbLvHbgzYA6UULoA9b5J9ED0wfYv3EO0=;
        b=eTQpdoxGNLqOXKQYvm+9SiOtUy9de2DOqZYlBKB1lwwSdAS5EW0ftZtu7o4CKfFsuu
         iw4NXi6RiFyl+fb17RV1IzTfFRmhmMxy6OF2SYSD0xHG1e/7ZCI7nWWoZrBiq6463Rr3
         nCxIWKJjh6zLeK4sin2bfKUiEk8wGScHq7MmUuSoRSLJa21xmW/11za/miRa7hhVPh45
         Zyn+ETxdHM3gHUrauPDC1GMd6m9p+Kl6E/wzmSclSs67LiWkyq8ZkwWSeyZ/cQsIdwWy
         HQpv29LOzwXtEpI3d+5MCd2tzdm2t1wxR1wcXLj/lmIxDzFWowBWPLTQWOA1em2fWZHV
         dtPg==
X-Forwarded-Encrypted: i=1; AJvYcCXqLab6yxPQrlVTlzPlTyjyzgjMh8XCeVz6RoW3PM8iDjcMy6fNAi1vPicsnFehocBfAjOTVXpzg9sbWuhV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0IJ4gT5pn4F38lSkaxHpxAV7sO4+nJO1nZzSVbwGcOq41Fpy3
	egYqVgQCuVkgs51qnKFHZIPWzoNf4dYL5dgX/UIcLCC5VvICB+UsDltv07OOoF9AFxTG/uDxuWi
	FxtsqQkMKsGIzAN9iq8IA/sFCzIDRf5ROslbVIdocoVMgd0sOfNdd3W5TpEMGofyJtMLC
X-Gm-Gg: ASbGncuurHmQW6LtQduotUhSqIeacrJto2oMLZid3fS3Q3zNSWRh26qlNWc5R5Gl4H5
	832+28fdbwV1ON6HmUdhfkl5rS4ZH0Cz5wn6lhI7C3CjNLWRMCYIzIx0vIU6qn3O/YKIzRMFfYf
	0BIFP7erTo1YqyafUDcWcMVadwyUcUh/lntI9mjm+6XW/+AtnkQifL/+VPzDhUa5BMEAPInRjYs
	i9QB0Y9QMAtF7mzukFV0GzmBMKVA6ui3zasWNCEtHuR//omXLkL/jnZK2IO3cjJ05huCzrIHjbA
	gnftYrx1fVBybRAxPgXGA0l1/qVqj5Lz1iNHiJ/H06kBAFCuttW832QaGoWi9M8ynnStws2Vks/
	tDhELSJyCcNO5Kb/icMcsEn+5KX20be8YLxg0GybRwhlA6UtmF8IQ
X-Received: by 2002:a05:620a:4890:b0:84a:d990:a6d8 with SMTP id af79cd13be357-85aea5ff6a0mr735531785a.49.1758837859150;
        Thu, 25 Sep 2025 15:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxdA6dS4wu8OVd+3ocLVo0gkXNYMpAtVMslmaMzvNNUlBIIxaIcvu9v3eIlSDmgpeHrfAggw==
X-Received: by 2002:a05:620a:4890:b0:84a:d990:a6d8 with SMTP id af79cd13be357-85aea5ff6a0mr735525385a.49.1758837858668;
        Thu, 25 Sep 2025 15:04:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb528984csm8078481fa.30.2025.09.25.15.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 15:04:16 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:04:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Message-ID: <vqiizai33y53o3h6ovhilcco5yyssfqwqrqnccskqoye23bf2o@rtob2tooaqr3>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-2-6927284f1098@linaro.org>
 <CAO9ioeW2AHDM3KSRu-WOvy+1De9tqfhrCNozw5Wkh=CJDHxFYg@mail.gmail.com>
 <CABymUCP2m-Z1spkAydryNWfysXTVma_H=7w=0GYL6+aH5KW9QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCP2m-Z1spkAydryNWfysXTVma_H=7w=0GYL6+aH5KW9QA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: AFC8vjrWwzLC68dldBcBvA-6oM7d7IJ-
X-Proofpoint-GUID: AFC8vjrWwzLC68dldBcBvA-6oM7d7IJ-
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d5bc64 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=TPbfgU9MJehzMSnRnG4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX95445cVpaxgw
 glK0qq4qP1znEvyCBR6AzjDwfY/ubu+LqnReShIT3pm5Pf8qAa5bnO61+tJOQ4wJRhYoWM1NiM2
 lY4cJk0a4XBhVqLAcHFWNy9SbfmwJZO+hxqb1UwqK0xn4kZ0CTf3+zMfx8aEd9ACLo9oLGWlZD5
 g6pFy1Y+57ZMMiPgV756gEimJTHHxXZCNSAuYquMU8oYtAQmvHztdJtDLHmWD5c7uO6Ck78MX0g
 4ZvauDRZmTCAhHQd5X1PvQ364JFNj1HLJCiv468Nj0SEkXheRk/ZuN7MZmwGq1WNtvRmdb0jau1
 NxnQ7P5E1jVNDbZGyLvhiR3fGmUFWa5Ql61qnY+ktWlk+NYDe0d8rQkZCFLWjn0NpFJx6ISsGcC
 tA8mVBui71OMnx9zID8RDRGYZ99AOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 03:10:35PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月25日周四 02:02写道：
> >
> > On Wed, 24 Sept 2025 at 18:08, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Some devices treat two independent physical DSI panels as a single
> > > logical panel from the CRTC's perspective. However, two separate DSI
> > > hosts are still required to drive the panels individually.
> > >
> > > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > > allows a panel driver to inform the DSI host that it is part of a
> > > dual-panel setup, enabling the host to coordinate both physical
> > > displays as one.
> >
> > How is it being set?
> 
> This is set by panel driver in probe(). You mean this should be documented
> here, right?

Yes.

> 
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  include/drm/drm_mipi_dsi.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > > index 5a85ba01f402a3866b70828391bb417bb8dd5956..0faff285d9ffeb19e4523cdc7bf21c1ec20e6eff 100644
> > > --- a/include/drm/drm_mipi_dsi.h
> > > +++ b/include/drm/drm_mipi_dsi.h
> > > @@ -170,6 +170,7 @@ struct mipi_dsi_device_info {
> > >   * @host: DSI host for this peripheral
> > >   * @dev: driver model device node for this peripheral
> > >   * @attached: the DSI device has been successfully attached
> > > + * @dual_panel: the DSI device is one instance of dual panel
> > >   * @name: DSI peripheral chip type
> > >   * @channel: virtual channel assigned to the peripheral
> > >   * @format: pixel format for video mode
> > > @@ -188,6 +189,7 @@ struct mipi_dsi_device {
> > >         struct mipi_dsi_host *host;
> > >         struct device dev;
> > >         bool attached;
> > > +       bool dual_panel;
> > >
> > >         char name[DSI_DEV_NAME_SIZE];
> > >         unsigned int channel;
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

