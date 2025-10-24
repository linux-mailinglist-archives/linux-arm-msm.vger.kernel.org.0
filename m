Return-Path: <linux-arm-msm+bounces-78734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 082A9C066F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 15:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8206188B9F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 13:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B9E31B807;
	Fri, 24 Oct 2025 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibzR3Eme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5259C30F95A
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761311778; cv=none; b=g+BlUO4KLB3FFRQx+6OXLo2kAt6jsxbm6fPxH8VAYMXtNg+wYEn/Zjaos+5tD2fwSKpAc4tCMQ2IJmwEh2ut0/AD2Q7TE/Q8WCH9uPzDzWHwReLYbemDXEm2pewD42NUKOSenTR3OJO6c3B8mYaIEbYj0G/UxU3dzMbpAopboKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761311778; c=relaxed/simple;
	bh=usp6dZLOp3hKB8N3oryowQCR6R9XAKaemSQvv23X7Ws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxmDg8Z15sYcWz5RPWPkG+0OEhoTTTXmFqmdRiS4ZVQ18dwuJZ57w0F4FKcbvBHpssFZh/4OlI9/8AFHxcfGPzUkRS0lpMtlWUd7oev9+9moGQudl/T6zpIyYn9nj3Xsh+i/BIQwMTioopE8eJOlnMqBanN8dC02EuifqzIb3G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ibzR3Eme; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCRA6H021473
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 13:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=byOciELpl5Z6xs5F1BjoX7m6FGuSIderWS7y2wVyB/I=; b=ib
	zR3Emew2haVfNCIxDbAhctoCb8qYx040joStYMcC9bNoRWVP0qbUQ/jo5f4b33yy
	6fRO29Gtc39bZhSx7IzyCsNpfACWGt2QDB98AMIWpuK1ufR1Rk7tLqRfoIlpIuwr
	6J0OcbtD2wvRmcb1VKee+8kEBp9XxKbyTJG/SUdxA1n9NWMImykuJvj5nRsT9YlX
	Y5EjzNdKGN0z8/K7ADOIDY01kUtlLIpfktdBFnODp8FmBUw2b0lTUa+uQ8+ItcBQ
	PpEIYphQjND7VEW3py2CMDdG84F0eVsxNT9mF/1ack+2iI5EBwoBqkIW6ehcE8e+
	PlX4GYmJGassNEiT0THQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8c2rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 13:16:16 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-443abd0724dso3207936b6e.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 06:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761311775; x=1761916575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=byOciELpl5Z6xs5F1BjoX7m6FGuSIderWS7y2wVyB/I=;
        b=wp9taXxE+/BSK56SIDvJHB1affS0WMS5MCo2vX8UNARz6cmcj26qQcSrToD/RutSqO
         4yqadZZmoT+cqqwJ30VeD+xJyVfs4XYwiWqzZVw0JXbVnDflwS+88yB0uf80cdmwML1U
         Lk1P9YZM6MvNgWpVC0pKwSotWnl5RsbXBEUNMLd3/aPbCwbFshEb/lU/JGs0JURgvee/
         IJDgsSOjMZJHu6IOh51sMv5Eo7U/6fv2Z2Cn4/r7Fi7zRez5Dw9iqJw/IIA+Raa3LyvG
         fT5xZ8iLcHSz0/ong8wt7Yh7CBfTYqCbMhmLin67lGak8RK0cYxKBySlBRBbuUcdkrte
         QQnw==
X-Forwarded-Encrypted: i=1; AJvYcCUy3A6VdcOrO+PV6YyCw2dYwcmXX1znhGN/Er4K25MJxbCzCtXYIyG2H9fiZc239djDE4mYQDudvz2JVBYw@vger.kernel.org
X-Gm-Message-State: AOJu0YyOdEhJB0cVKd55cTT9PKPi13hbxBxzuLTf0toApBgQhN6mz3Ni
	4NqLpY/pIBFarVYPBFzJY5jwPXI5JIuAE1c7oFeM+ylDuPiD65sd6Y2c4sMfOn47HGgwOwtjLZL
	e4FkPme20mEkz4Udenq0kUgu23F/IUIZdCh1dlgC595OovX18nadleqhU55jCkZLGc/FOYTprnH
	dM3p4SC7ic8Fu07ZTQ4AGpxo+jqZelcACXjYNHCCEdfik=
X-Gm-Gg: ASbGnctsAnlCs+hRwAflAbt/DsgK3OM6pGKKYjhB2C3B6xAh5kuo4RjI4Mo1WaF41TO
	GVQWS/W2fJXKpHeqbfkyzflix8qiqR/8JH341iM5gDPLuyxUl9m2YZON7rt38R54SnzBgeADY3v
	uHi6w/FYIuWL6kUtsD3kSAjQJCnnlkcw6RS09M1nksxZS0Cpcugda0Bwzun/KcShxC9V3eKlG/q
	bCBVdZw7Rf80po=
X-Received: by 2002:a05:6808:1a10:b0:438:2907:2eb2 with SMTP id 5614622812f47-443a2f1bd6amr12854277b6e.27.1761311775047;
        Fri, 24 Oct 2025 06:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2CISebn1N5xd4PZByUVLyDXrr/11eYjZ+6T+XeX31Sqh8BXVvKthtYMmCCNr6jM2tfm7vhWAcoEANgO9/pjY=
X-Received: by 2002:a05:6808:1a10:b0:438:2907:2eb2 with SMTP id
 5614622812f47-443a2f1bd6amr12854248b6e.27.1761311774411; Fri, 24 Oct 2025
 06:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
 <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com> <97aeb6a1-fda2-440f-b14b-2f3dbc2d7e8e@oss.qualcomm.com>
 <5e64c246-a424-42c9-b102-e1a2af579936@oss.qualcomm.com>
In-Reply-To: <5e64c246-a424-42c9-b102-e1a2af579936@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 06:16:03 -0700
X-Gm-Features: AWmQ_bn61rL8UkwSaP9vHSdM_zlnxFNoNmPvQunQe3sK6AVw6dJjnNBmKMTrbrw
Message-ID: <CACSVV00vwbNtH47S_BVet7uP7u9t4RY=xTBn_r3u4sS91Y7Muw@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXwhGkl0EOyGpl
 M2ecjPyOx9TW8k2mzPMQEgRqxF6A1oMg67qO8RTd0/QYORBlIyZmNE5L8v9wNYpzhbsrBF/yCHH
 ruqZ0t0ll1eHCYmAO1tiZPWohR1Ab5M3gp8hV+n6MwU4d6pGUegP6yUS4NUPy5gFjwkEJ9be0QP
 /NiKCVPGIKksa0NaO1EXo3Qo9DhvI2su8rsI3YPl76aAzGmEvLd1Y6uBjxzuDsOyhSiw5qnNgl+
 p0NBbpt3qeidmw8DfLPEeYkPx4oJvj298TOKEbhydWGStPLqX2Ug/KWbbzWdXHe2ODL8N+rYJqZ
 PPdRRssD3LhzcCRiXvQxqn3gTjSsanKzClj0hQ0P66dsFTAiZhFmImg/mi1SjaqwO2Pl1s5NAmx
 Bk12yn3THKnoViKtYlo/bVg/GawWvw==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fb7c20 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=gM72ra8ASCPjNpuaUpAA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iC7uX5b1_1pAN8W6IsJvkyEvQQg-RAg5
X-Proofpoint-ORIG-GUID: iC7uX5b1_1pAN8W6IsJvkyEvQQg-RAg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On Fri, Oct 24, 2025 at 12:55=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/24/25 12:57 AM, Akhil P Oommen wrote:
> > On 10/22/2025 8:43 PM, Konrad Dybcio wrote:
> >> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> >>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>
> >>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> >>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> >>> of A615 GPU.
> >>>
> >>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
> >>> which is a small state machine which helps to toggle GX GDSC
> >>> (connected to CX rail) to implement IFPC feature. It doesn't support
> >>> any other features of a full fledged GMU like clock control, resource
> >>> voting to rpmh etc. So we need linux clock driver support like other
> >>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc=
.
> >>> This patch skips RGMU core initialization and act more like a
> >>> gmu-wrapper case.
> >>>
> >>> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_=
oob_bits[] =3D {
> >>>  /* Trigger a OOB (out of band) request to the GMU */
> >>>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state s=
tate)
> >>>  {
> >>> +   struct a6xx_gpu *a6xx_gpu =3D container_of(gmu, struct a6xx_gpu, =
gmu);
> >>> +   struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> >>>     int ret;
> >>>     u32 val;
> >>>     int request, ack;
> >>>
> >>>     WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
> >>>
> >>> +   /* Skip OOB calls since RGMU is not enabled */
> >>
> >> "RGMU doesn't handle OOB calls"
> >
> > Technically RGMU can handle OOB calls. But we are not initializing rgmu=
.
>
> Oh, I glossed over that..
>
> IIRC the reason we delayed 612 support in the past was to make sure
> that the RGMU FW is consumed, so that runtime requirements don't
> suddenly change one day.
>
> If you have no interest/way in getting it wholly supported right now,
> can you at least make sure that the driver requests the firmware and
> exits if it's absent?

adreno_load_gpu() calls adreno_load_fw() first thing, and will bail if
gmu fw is missing.  (zap fw is a bit more awkward since that could
come from dt or device table.)

BR,
-R

