Return-Path: <linux-arm-msm+bounces-79997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3649CC27ED7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 13:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABE5D3B8DC1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 12:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26342F2616;
	Sat,  1 Nov 2025 12:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtiiOUvX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+VoLeDD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76B259CA1
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762001861; cv=none; b=DZwQHHQeQ5ip40tDDJDNRXOMB6LmmwmxjRkuc6kTHDUn8JzQ3H/tqWYJxWpnSe5Km7Ci/kv6X4hKys7uolQvfx2uq4hRL6MBd5iDoJ6lvsjN1CZVXzbmk7RFPKUcug6w4iz72uYRZkZSxeyYLgfUdz3zZ/vnfv8eghneu0R6uRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762001861; c=relaxed/simple;
	bh=vWzcokX+fkv3blLO4+gAjLqyDHawzei+lj2sK38kx6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KI0gZucWA8Okvlht1lK3lE7UwvQOceyuHzRAjhwWKGA905Cpntvmgmp9qVS+E+CXpXQPD4f6XqCY1ZnHNinqDkRPSTaQTIvgi/YEB8X02ed4PJ0b2WdyfC5QMEX7QE1TS57f8Rki9MbnGx+wALId1OQGfA5l3sUZsk9styHxQOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtiiOUvX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+VoLeDD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A14E2xi560360
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 12:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=GN6gpt39o6//WjbpTKlKjBfjUHi2y2bKsxupqs7pKU8=; b=Dt
	iiOUvXeQQJWf+k7n6l4FlCYsKlDOo6wF0/gVZBk/pnlRh6OG06MlII/KO57lzs31
	6yolqVLfx/pKWDPJg2lSEGPiTHrVdGog4RmfBt+mK9JM8OvFMXFbWBmR6BE3n57v
	Y/dSA/a6MGtib7VPKkgV4uNTUfe8VSnuVp3dd6kl8A98P/F5kF+zKuy8EGvLF6SW
	BmP12HgadllxbjzJYtRku64uyQQSDx7X8Q5iv31bKrS6zWuoB4xBNxZxuHkBdEgW
	XkPRE+Mu5tuYDe1venoJFC4QAQH9gTDZKBkhdjexYb7qpK0KkWoZm69rr4WwD8v0
	uJxBNoEsQ4uuYGTpGHsw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ayf8k7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 12:57:37 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-44db05e943dso3747125b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762001857; x=1762606657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GN6gpt39o6//WjbpTKlKjBfjUHi2y2bKsxupqs7pKU8=;
        b=B+VoLeDDzilhscV9BUx3Ktrk9zPnj6ZjQNvyh93nkUY1oQLNwL4mk1ZPlvqIgrXRzc
         fYOVp3j7kGtWNS/E2kNsaLnB8W8DNR4OSXceZwJkzOABDGUF5lAQ9pjGR3hoPE52K/gM
         x5Hcfia8cb1s3cxMd/9SwMeX1rCWoQkb7G2E5flswwdS+ix2TBJNuK4nj5GECoSvw56U
         yDOleJ//spDlNfXEPY7K9kC60SUw0iKZY02V5yN5kQAsx38B4RNZvJMhmNYOdJRPujTX
         sTOfPCWosD3GWGqwdQc4lywXkyC5xU0BzXkVvbvvmafsHv86a3XWr8NIKFPRV9rbW7Q4
         kcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762001857; x=1762606657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GN6gpt39o6//WjbpTKlKjBfjUHi2y2bKsxupqs7pKU8=;
        b=oKj6yaTKppDXZFlcuhpwKsab5f/KCaR7oaqDhL6w1Mv40/+iPDIytJG1fVNeJrbtcF
         Eq5olgK5XeZdgs/WS5q+eqd8IsFY3HMN8LjeYUgwWG4BzcCVUkMtR/GRlWyigHyXJule
         B5redtqaQz7SUUhs1LRUptmm0Ia8IWwlrunomGwJaQwXmm8xKL/MbBwfX5NL4rzGn1uM
         O72i5Sda2yNqCp6MqV87ChjJZKYD4j+0WVYGXAb0A/1PYiyj5SS+UaXPHOdVTEqdVnco
         stEZuEGSyldZLq0bFpsz557DenyiE3aDRfaob/CcYyHoOD+jKTpqFJRFoBFXnpDVW1aM
         kawQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOg3Kwxgfk1bO/tl3/k38DWXrnzejsreyNeiMPc8+ytHhS0pRADqeenLXBk6HWqzTNp2Zai3Qrrnkg3NuG@vger.kernel.org
X-Gm-Message-State: AOJu0YxclyLn78BH5FO11dMkz/wUSmwKZskROItRk1lAJxgwJ1fa9Jj+
	LM+ntZETsleZqk2Rjp+joA5F8JntMu1UfpXZAwTANDNTHfjGU/HzlnZbbPOclAFIkkQ9/pf1ZkR
	90l13RPqFAMYmXGZ9yVO43NfeG0x0GHsmDh2Z88lvB67bwE/9zVSxtUoydFteQ0nKzPkpW8uCrI
	3W14vExTXN5lgS3LO8yWoVSJFKNiOKD9sLdRu6n3F76Vc=
X-Gm-Gg: ASbGnctH8SXfCuC+cg4WOYz28iYxqNsLYiD+S/8e1SRtJvevLkUAkQcSBD2M1cbOfBf
	YcgWzikZSiSv/dDH8VlI4Qf6uvm0wwIeTccRXrr3ortXBS4I9OraQr74/FXEoQaHhuDIWRRy589
	LaXIQDLdllOAH+/fMww8SpDy8cB2jEtz+P42zHlmjENUKn+eJkWS6oR156rIuMHCRKJDVMQXWNr
	EV+MDeXAEKmPuA=
X-Received: by 2002:a05:6808:1395:b0:43f:75c5:57e1 with SMTP id 5614622812f47-44f95eb9a32mr3052048b6e.18.1762001856932;
        Sat, 01 Nov 2025 05:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSZCgJFRRbRntQyU/jMD4SdopeuBQLtXGPHNOR+3XpYFUVZPmSaDlMP5/4p8dDW1tBsNVfQYutjVNe3R0atsY=
X-Received: by 2002:a05:6808:1395:b0:43f:75c5:57e1 with SMTP id
 5614622812f47-44f95eb9a32mr3052036b6e.18.1762001856562; Sat, 01 Nov 2025
 05:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com> <CAPaKu7TQ3tkQREG8xphW_L5eQPLuQhA=oKjfmYVJDR7PsNBXQg@mail.gmail.com>
In-Reply-To: <CAPaKu7TQ3tkQREG8xphW_L5eQPLuQhA=oKjfmYVJDR7PsNBXQg@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 1 Nov 2025 05:57:25 -0700
X-Gm-Features: AWmQ_bmJNIWsGXJ9igpVvjSPKZvPAb_uZwlX3x7hysAr5tWUQUTqmyJnka2MZDs
Message-ID: <CACSVV02B8BzvznzOoMw0EgOXEY39syWdyfzTcqWB0qsYjf42hQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDExMCBTYWx0ZWRfX03qBoAwyn6Nj
 zVq/oM9PlKrKUO3Ye6/y0hUw4KV8Jd0MNNurzvsArKj2hUz47IZHSTHxdyd2AGnmiRV1XqX7dU3
 /9jebRN0Lc6ljVBd6a9ZhGa84Y0Bn04RZJqN01jSFemznlltkGY05TotLfFo9pW/weZBjUJsXPt
 ooKeTeKBB6UbJKSi304Q5njs7PHGee1/3vYY0L2OMYH0JysFwPChZWSCnc4S3JjFvjkCFtb6Gn0
 iR9zBbuypCIk+ar2VNQYiqjP6r2I03CzIB8Tu0ZSQSuf75GfDwwmF11sy1GllYXdG6EPfVzKDHX
 oMRO+nFfYIcSZ5DVbKDlY4XbXvcEKUflR21nkEKOwF2wXQQOHuubzCZ3yNq9e5A2SwuEEwaJZfJ
 wg6DsbbWOOSdl7UWK9IZTloDz6QkxA==
X-Authority-Analysis: v=2.4 cv=Scj6t/Ru c=1 sm=1 tr=0 ts=690603c1 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=YJZoVlBuq9nIZB7zQycA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: lE2NzwWpyn71914b8UFSrMPR_kMVJbYZ
X-Proofpoint-ORIG-GUID: lE2NzwWpyn71914b8UFSrMPR_kMVJbYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010110

On Fri, Oct 31, 2025 at 4:43=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> wrote=
:
>
> On Mon, Sep 8, 2025 at 1:28=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualco=
mm.com> wrote:
> >
> > Add the IFPC restore register list and enable IFPC support on Adreno
> > X1-85 gpu.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 68 +++++++++++++++++++++++=
+++++++-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
> >  3 files changed, 79 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_catalog.c
> > index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..547c046730a9b50a82cc9b2=
7f08a5b1eeb08dced 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] =
=3D {
> >
> >  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
> >
> > +/* Applicable for X185, A750 */
> > +static const u32 a750_ifpc_reglist_regs[] =3D {
> > +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
> > +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> > +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> > +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> > +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> > +       REG_A6XX_TPL1_NC_MODE_CNTL,
> > +       REG_A6XX_SP_NC_MODE_CNTL,
> > +       REG_A6XX_CP_DBG_ECO_CNTL,
> > +       REG_A6XX_CP_PROTECT_CNTL,
> > +       REG_A6XX_CP_PROTECT(0),
> > +       REG_A6XX_CP_PROTECT(1),
> > +       REG_A6XX_CP_PROTECT(2),
> > +       REG_A6XX_CP_PROTECT(3),
> > +       REG_A6XX_CP_PROTECT(4),
> > +       REG_A6XX_CP_PROTECT(5),
> > +       REG_A6XX_CP_PROTECT(6),
> > +       REG_A6XX_CP_PROTECT(7),
> > +       REG_A6XX_CP_PROTECT(8),
> > +       REG_A6XX_CP_PROTECT(9),
> > +       REG_A6XX_CP_PROTECT(10),
> > +       REG_A6XX_CP_PROTECT(11),
> > +       REG_A6XX_CP_PROTECT(12),
> > +       REG_A6XX_CP_PROTECT(13),
> > +       REG_A6XX_CP_PROTECT(14),
> > +       REG_A6XX_CP_PROTECT(15),
> > +       REG_A6XX_CP_PROTECT(16),
> > +       REG_A6XX_CP_PROTECT(17),
> > +       REG_A6XX_CP_PROTECT(18),
> > +       REG_A6XX_CP_PROTECT(19),
> > +       REG_A6XX_CP_PROTECT(20),
> > +       REG_A6XX_CP_PROTECT(21),
> > +       REG_A6XX_CP_PROTECT(22),
> > +       REG_A6XX_CP_PROTECT(23),
> > +       REG_A6XX_CP_PROTECT(24),
> > +       REG_A6XX_CP_PROTECT(25),
> > +       REG_A6XX_CP_PROTECT(26),
> > +       REG_A6XX_CP_PROTECT(27),
> > +       REG_A6XX_CP_PROTECT(28),
> > +       REG_A6XX_CP_PROTECT(29),
> > +       REG_A6XX_CP_PROTECT(30),
> > +       REG_A6XX_CP_PROTECT(31),
> > +       REG_A6XX_CP_PROTECT(32),
> > +       REG_A6XX_CP_PROTECT(33),
> > +       REG_A6XX_CP_PROTECT(34),
> > +       REG_A6XX_CP_PROTECT(35),
> > +       REG_A6XX_CP_PROTECT(36),
> > +       REG_A6XX_CP_PROTECT(37),
> > +       REG_A6XX_CP_PROTECT(38),
> > +       REG_A6XX_CP_PROTECT(39),
> > +       REG_A6XX_CP_PROTECT(40),
> > +       REG_A6XX_CP_PROTECT(41),
> > +       REG_A6XX_CP_PROTECT(42),
> > +       REG_A6XX_CP_PROTECT(43),
> > +       REG_A6XX_CP_PROTECT(44),
> > +       REG_A6XX_CP_PROTECT(45),
> > +       REG_A6XX_CP_PROTECT(46),
> > +       REG_A6XX_CP_PROTECT(47),
> > +};
> > +
> > +DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
> > +
> >  static const struct adreno_info a7xx_gpus[] =3D {
> >         {
> >                 .chip_ids =3D ADRENO_CHIP_IDS(0x07000200),
> > @@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> >                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >                 .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> >                           ADRENO_QUIRK_HAS_HW_APRIV |
> > -                         ADRENO_QUIRK_PREEMPTION,
> > +                         ADRENO_QUIRK_PREEMPTION |
> > +                         ADRENO_QUIRK_IFPC,
> >                 .init =3D a6xx_gpu_init,
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .hwcg =3D a740_hwcg,
> >                         .protect =3D &a730_protect,
> >                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > +                       .ifpc_reglist =3D &a750_ifpc_reglist,
> >                         .gmu_chipid =3D 0x7050001,
> >                         .gmu_cgc_mode =3D 0x00020202,
> >                 },
> > @@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
> >                 .a6xx =3D &(const struct a6xx_info) {
> >                         .protect =3D &a730_protect,
> >                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > +                       .ifpc_reglist =3D &a750_ifpc_reglist,
> >                         .gmu_chipid =3D 0x7090100,
> >                         .gmu_cgc_mode =3D 0x00020202,
> >                         .bcms =3D (const struct a6xx_bcm[]) {
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 76dd78f5c48ea818a2aa209e0c0c88bc5e8f4e06..91a2a82c4f388ca6b052172=
efdd7255165f3c04a 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -828,11 +828,10 @@ static void a7xx_patch_pwrup_reglist(struct msm_g=
pu *gpu)
> >         u32 *dest =3D (u32 *)&lock->regs[0];
> >         int i;
> >
> > -       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> > -
> >         lock->gpu_req =3D lock->cpu_req =3D lock->turn =3D 0;
> > -       lock->ifpc_list_len =3D 0;
> > -       lock->preemption_list_len =3D reglist->count;
> > +
> > +       reglist =3D adreno_gpu->info->a6xx->ifpc_reglist;
> This is NULL on X1-45 and causes
>
>   [    8.795603] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000008

Hmm, this is probably going to happen on all a7xx which don't have
IFPC from the looks of it.

We should either check for the IFPC quirk.. or maybe just drop the
quirk and decide whether IFPC is supported based on ifpc_reglist !=3D
NULL?

(That said, we probably do want to have IFPC enabled for x1-45)

BR,
-R

> > +       lock->ifpc_list_len =3D reglist->count;
> >
> >         /*
> >          * For each entry in each of the lists, write the offset and th=
e current
> > @@ -843,6 +842,14 @@ static void a7xx_patch_pwrup_reglist(struct msm_gp=
u *gpu)
> >                 *dest++ =3D gpu_read(gpu, reglist->regs[i]);
> >         }
> >
> > +       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> > +       lock->preemption_list_len =3D reglist->count;
> > +
> > +       for (i =3D 0; i < reglist->count; i++) {
> > +               *dest++ =3D reglist->regs[i];
> > +               *dest++ =3D gpu_read(gpu, reglist->regs[i]);
> > +       }
> > +
> >         /*
> >          * The overall register list is composed of
> >          * 1. Static IFPC-only registers
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.h
> > index 124c63c4615930b00c64e488a498163ae35afccd..0b17d36c36a9567e6afa426=
9ae7783ed3578e40e 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > @@ -45,6 +45,7 @@ struct a6xx_info {
> >         const struct adreno_reglist *hwcg;
> >         const struct adreno_protect *protect;
> >         const struct adreno_reglist_list *pwrup_reglist;
> > +       const struct adreno_reglist_list *ifpc_reglist;
> >         u32 gmu_chipid;
> >         u32 gmu_cgc_mode;
> >         u32 prim_fifo_threshold;
> >
> > --
> > 2.50.1
> >

