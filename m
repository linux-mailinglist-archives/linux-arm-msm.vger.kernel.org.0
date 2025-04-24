Return-Path: <linux-arm-msm+bounces-55525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC961A9BA7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 00:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74AE1925A2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 22:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C1F288C8F;
	Thu, 24 Apr 2025 22:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWFw95oT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0451AA1F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 22:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745532868; cv=none; b=M4kMqAT2nd5wpD7M5mIvc5QVYu7c9B47wXAErRnUsWP5JDEHZub5u37xaIr3h/ibCOQtsJw8PQAAjoFPBTnOTv7JM/wyDJaZxKOcN8y3Zcv7AGJv4fBGL/sHSv7rYh/RHMDd9b9C3lvZ85fZ6xrr6M93GN+tcqjoPyvAwk7BdFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745532868; c=relaxed/simple;
	bh=sNqbIfVVS0v7/OcKITy+qOzPnbY7oTqGeF2iUw3Czzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrR9yWWOWlYEL2Fmnn8JTc0Flk/iKBGPlAm5OYW1Dq/8wwItR6LC+tDjuCvJA7CNCkjLop4Ys2HKfzW/vmEXU0M23CezBU+8djdBZG8NaXsmHgOfH3onOeP685LGxS/g5Bv06jqKsxFH0nT5Nna9QYZlC0v/czLmSWcz+Zr33QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWFw95oT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJnCtZ006357
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 22:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGFxOl9tb1uWwBTzomkNAaRI9BVKWxW/VCzFDUKeLqA=; b=dWFw95oTzT5pTLuV
	Nm8I+C9BefWBvfFCumpW0sZjIX5x/QCZSlyQmUKgoNP9z9IqOAx14cvyohA55P7q
	SLVKT9WhOj2Pz/WkXAedTU44mO3mi6Izxli9iUVwJseBv2cgQ6mAicsFexC2NYgp
	DLHS3u5/wM5FrrZNoDDaxLlt3fvDmehlwX/mC8KsWU5RuE1HAy6o8LukPoYm5rX5
	kv5aogmm8IVkPfT+G1ILE6kS5ls4XEj8/U4lyE434KYRqAY7lWmOdLU8clmDzJIK
	KQADJq+5jv5KsbgL3zZI80BHw/YxB4Hu0t48AKWMYQkNbDn0ZUkuRjg8ZQ0IkxcH
	AjTyXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3f0u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 22:14:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c09f73873fso211105085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 15:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745532864; x=1746137664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGFxOl9tb1uWwBTzomkNAaRI9BVKWxW/VCzFDUKeLqA=;
        b=VvFM0G+AcLraS0AQNRrkztE7oL/XcCwikJCQUBqDCsIXkurtMSFZRZ0hoSpNt40DVi
         IYd8UCgIz1tYENdVdetVtIfAzkTpxeTXr5J+w4HDVYRqVK4KZr4FxYYZR0u1b9B8QOn/
         8cdOzg3dxYUHh1dmxOm9Qx4RjZZU14//e3qZoY8lQD5xKrdLm5kWnU61SV6EUkGWfdFa
         uaX6oyn6zh/k4JBFSo5VZIpKBnnziGTiuSab5zTTxsDrRK4UgqSgTZu/610NM9xTJH0w
         rR8BgHbCQ5K4I5iAC81L6BHhc1kxG9aOQ/ToXSoiFohIDpYkXzZQf1DgyY8M6Pe6BixV
         Co0A==
X-Forwarded-Encrypted: i=1; AJvYcCVLQ3B7xHPGdsXC5kxJd8Vsd2dCaO8ToyjZUw/E8WVKDLg377UE7iytm9CEp6OWGTfVeWrrsrCLY5svsnIT@vger.kernel.org
X-Gm-Message-State: AOJu0YyhYNi1zXzmG5Kef4ZJ1oZSGOymPPIbFir9uzQh2gDVQdGa04dX
	Kx3Sp/hTLKeYT+snHBBQ1/nfRjEX4npoFdfuHyrfu6/i0ftGPJPK0eha+4pTB6y2dr0IC6GUz5a
	myP9VhEMLd6VEe6ZZYxhZBiMWdIffrsEdtY19wlaUtIprRt4SGSDKMIyziKy4VkW7
X-Gm-Gg: ASbGncsycWa0Njx2icdhtaHL0oSwMEwUSqqvZhwpwKo1FjNMaU2ZKDHGEa1JYB1wzZi
	uc75ymPBzslEnq97BntJ+sWIBZpVn4FWZLcYEwEKGavAZeAp2BVeuof8aQTFO3wa9SSRx1iFW34
	7Edgw6q44iiF+MwlwKgTvm+qI6AKMvq7Tpj8Fc52H/8HK/qVvEzDlPDw8d+g491SAkIzM5wj77G
	e/2i46mXidQuirTMAFykUQMdwOi9LNWFi2jeBADsJbiUsRxhcSn1D7cFCgo2ZKUB8d7vqR2DthQ
	cWNVqnRqmfMx/2npJgocca39GOAuUyDe/33Ug1++0b3S1UOUCrR/8IfpMLjZ0l/5Ebjulec1YWM
	=
X-Received: by 2002:a05:620a:4492:b0:7c5:5909:18f3 with SMTP id af79cd13be357-7c96077f5e3mr30010685a.37.1745532864190;
        Thu, 24 Apr 2025 15:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8HUjpHWu1vfSTPhZe4k1ZaRnS080d806N1Oqj8kDA2MR5+f8rJBbCwkO61rR/i9VHSTnesA==
X-Received: by 2002:a05:620a:4492:b0:7c5:5909:18f3 with SMTP id af79cd13be357-7c96077f5e3mr30007085a.37.1745532863751;
        Thu, 24 Apr 2025 15:14:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9837dsm4294571fa.108.2025.04.24.15.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 15:14:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 01:14:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <n2wt3i3lrbz2spfxdmkwvq6xdjq4rwif3sul755h6prs4w4fj5@ishlqsc4qxr2>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <CAF6AEGs5Sw76kVS6_GaK6=VZ3jWPuqN9bc+7UvVU=jfaBBTLDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs5Sw76kVS6_GaK6=VZ3jWPuqN9bc+7UvVU=jfaBBTLDQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: IBuLjYS8PWo24o_F-20idAtRzZAkA2yg
X-Proofpoint-GUID: IBuLjYS8PWo24o_F-20idAtRzZAkA2yg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE1NyBTYWx0ZWRfX7ZAgJVVbDq5V CsbYd39kHU4LxbhsWRs121O9FUy5Prwm3cCX/+bqE47i+gDlBsbHpUjagPk9SCirQgBv8dFhco0 Yn4583Q9Kuh1lf0VElxMwGVBfXG2N5bFOho4Lux6qQngp3eo0XkCbCoFubIAbjVMllI/p2pwDSP
 01TjeMAZJ9JfyLbQt3CzjlkGiNODugWNHMyLXmy5abC0RAZBg06RG71s+6TEkJpCynLW7hWPgJp nEI7dOJqtmFojGbRyXUdNfgnyYAxTXn+DBDPSfYanxTWDhZM9hLwQUOX3d5PEDFwgEsU5J7ANKc d4D7ixrXy3LY/aS/CQFjLkdGCI3AN/k0gQ4Nx8rKwLoch1snw/g/vrhWI4/ifFTDecCgLMP+dW+
 yOTagVSJQ9O1sZOTJUZGkBhQ217Js5p5fn8Da+XQIe/x8GIlt3VOzjI/ET1b4tMW4twbuzG8
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680ab7c1 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=dNxstN5UYNHJ3myx06AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240157

On Thu, Apr 24, 2025 at 02:12:15PM -0700, Rob Clark wrote:
> On Wed, Apr 16, 2025 at 7:13 PM Aleksandrs Vinarskis
> <alex.vinarskis@gmail.com> wrote:
> >
> > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > to non-transparent mode to enable video output on X1E-based devices
> > that come with LTTPR on the motherboards. However, video would not work
> > if additional LTTPR(s) are present between sink and source, which is
> > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> >
> > First, take into account LTTPR capabilities when computing max link
> > rate, number of lanes. Take into account previous discussion on the
> > lists - exit early if reading DPCD caps failed. This also fixes
> > "*ERROR* panel edid read failed" on some monitors which seems to be
> > caused by msm_dp_panel_read_sink_caps running before LTTPR(s) are
> > initialized.
> >
> > Finally, implement link training per-segment. Pass lttpr_count to all
> > required helpers.
> > This seems to also partially improve UI (Wayland) hanging when
> > changing external display's link parameters (resolution, framerate):
> > * Prior to this series, via direct USB Type-C to display connection,
> >   attempt to change resolution or framerate hangs the UI, setting does
> >   not stick. Some back and forth replugging finally sets desired
> >   parameters.
> > * With this series, via direct USB Type-C to display connection,
> >   changing parameters works most of the time, without UI freezing. Via
> >   docking station/multiple LTTPRs the setting again does not stick.
> > * On Xorg changing link paramaters works in all combinations.
> >
> > These appear to be mainlink initialization related, as in all cases LT
> > passes successfully.
> >
> > Test matrix:
> > * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
> >         * Left USB Type-C, Right USB Type-C
> >         * Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
> >           Type-C to HDMI dongle, USB Type-C to DP dongle
> >         * Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
> >           monitor per USB Type-C connector)
> > * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
> >         * Left USB Type-C, Right USB Type-C
> >         * Direct monitor connection
> >         * Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
> >           Thunderbolt/USB Type-C, probes with an LTTPR when in USB
> >           Type-C/DP Alt mode)
> > * Dell XPS 9345, Debian trixie/sid, Gnome 48, Wayland (Stefan Schmidt)
> >         * Left USB Type-C, Right USB Type-C
> >         * Dell WD15 Dock with DisplayPort connected
> >         * Dell HD22Q dock with HDMI connected
> >         * USB Type-C to HDMI dongle
> >         * Dell U3417W
> 
> For the series,
> 
> Tested-by: Rob Clark <robdclark@gmail.com>  # yoga slim 7x

Could you please send this as a response to one of the patches, so that
it's also recorded by the patchwork?

> 
> patch 4/4 had a number of conflicting hunks, you might need to rebase
> on msm-next
> 
> BR,
> -R
> 
> > In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled
> > in UEFI to force universal Thunderbolt/USB Type-C devices to work in
> > DP Alt mode.
> > In both cases laptops had HBR3 patches applied [1], resulting in
> > maximum successful link at 3440x1440@100hz and 4k@60hz respectively.
> > When using Dell WD22TB4/U2725QE, USB Type-C pin assigment D got enabled
> > and USB3.0 devices were working in parallel to video ouput.
> >
> > Known issues:
> > * As mentioned above, it appears that on Gnome+Wayland framerate and
> >   resolution parameter adjustment is not stable.
> >
> > Due to lack of access to the official DisplayPort specfication, changes
> > were primarily inspired by/reverse engineered from Intel's i915 driver.
> >
> > [1] https://lore.kernel.org/all/20250226231436.16138-2-alex.vinarskis@gmail.com/
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> >
> > ---
> >
> > Changes in v3:
> > - Split 1st patch into 3
> > - Simplified handling of max_lttpr_lanes/max_lttpr_rate
> > - Moved lttpr_common_caps to msm_dp_link (not msm_dp_panel, as LTTPRs
> >   are link related, not panel related)
> > - Picked Stefan's T-b tag (last patch only, as 1st one is getting split)
> > - Droped Abel's R-b tags from 1st patch that got split due to high diff
> > - Fixed alignment issues, initialization of variables, debug prints
> > - Moved lttpr_count to avoid ugly pointer
> > - Link to v2: https://lore.kernel.org/all/20250311234109.136510-1-alex.vinarskis@gmail.com/
> >
> > Changes in v2:
> > - Picked up Abel's R-b tags
> > - Fixed typo as per Abel, fixed readability as per Johan
> > - Updated cover and commit message on mailink issue which appears to be
> >   specific to Gnome+Wayland. No problems on Xorg.
> > - Link to v1: https://lore.kernel.org/all/20250310211039.29843-1-alex.vinarskis@gmail.com/
> >
> > Aleksandrs Vinarskis (4):
> >   drm/msm/dp: Fix support of LTTPR initialization
> >   drm/msm/dp: Account for LTTPRs capabilities
> >   drm/msm/dp: Prepare for link training per-segment for LTTPRs
> >   drm/msm/dp: Introduce link training per-segment for LTTPRs
> >
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 126 ++++++++++++++++++++--------
> >  drivers/gpu/drm/msm/dp/dp_display.c |  27 ++++--
> >  drivers/gpu/drm/msm/dp/dp_link.h    |   4 +
> >  drivers/gpu/drm/msm/dp/dp_panel.c   |  12 ++-
> >  4 files changed, 122 insertions(+), 47 deletions(-)
> >
> > --
> > 2.45.2
> >

-- 
With best wishes
Dmitry

