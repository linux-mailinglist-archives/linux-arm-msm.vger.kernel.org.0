Return-Path: <linux-arm-msm+bounces-88455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32009D10E0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D5FE30006FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 07:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EB1314B72;
	Mon, 12 Jan 2026 07:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W52GMF38";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d51EVWGc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E186D32E154
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768203082; cv=none; b=Edl4njjtdfAl/1x8ZnxP9oYewZqU2YTpmx6eaNP7nmmj2ITdWoFh9o0CGkwY3LTy2VJ/Xe/Y6RuZWn5Ebp0bPa7JWgyNtmWhzSWbkw8goFSJd8/6GF0cxBxsk8faPNcLqmqT3USg4nAuJ6rZPmGV2W8ppCilFfhIbIhjTRDhmy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768203082; c=relaxed/simple;
	bh=DgXclX85FUVhSWlQH2iu8vOv/Zk2lpcrKMkbE1K8elI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSlf26Vjgz/QUn+CZkUhSM63VQHq83iKpEFbpOUBtF8ued1QrmTyzq8jJxwGnTzattGHsKoI1jhO0WYfxnoXkBeQUKn0a9KxhYa5S2gzHhlCYxCI9uNjSgvGHCRL3249QzV7LQkhoPxj0abjyjO6bxUOoUQS+ZNMl1nYYHIsU6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W52GMF38; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d51EVWGc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMZ1S71231266
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aieeUG5t4cx92lVZlSq6w5Iq
	SGyS46OAJyDHIiD8MkU=; b=W52GMF38UzDGl+qereawB+dsAPCnPnKyix4Fsbip
	iuFIk34gxGeDyncv2Lh6ukHKwIUSBlTZV9V1AWO1M/X8mZBVnQTI7IiDKcRGyUde
	P1KW9QoxCm/oqnZfbFuCXQHPv681dzrhgXIA3Dg2GTXV9GhYHVHVjwtba/vqZAw9
	ZMi4Hs255Dm0bpmYFaR8nJsiAB9yADcHKu9PAelNt0Y/qEa8cepRP3soaPXfD+kD
	YIbhxWwZjN0MJLVWPXYflwKu2drfuyCq+5lnePGzuLn4g4ZPlVsRuoGkvCuxx4Xr
	O/MxgfuGgRYzVv2nrXWi2iisKtoGhaYVnwXD5jqlZl9i5w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfuw5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:31:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c52d31fe88fso2452259a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 23:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203079; x=1768807879; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aieeUG5t4cx92lVZlSq6w5IqSGyS46OAJyDHIiD8MkU=;
        b=d51EVWGcUQwh0f3fMA2UpXzOiPOLgRYwpRBDwKxINd+Qnai5742fW7dS299fvJ90wC
         BBo00VCIDDfQ6OyUF8mytq1jZKkUHJUgUjmd/DS5lr958L5PS3tmCo+dagQx0T++Q0Nb
         PvPK252Y7BPJdWCgimNcPodwiO2Ts/YbZ0mErgj1xJJSR9p8/Vv691i377PsZpjsZJ2n
         HGh3nz3nDdDzv895J1nO23MEUuq1DlVurVtInV93aCxSnlF3OszwyIya5OlEyKKOCnas
         VzEwMebf8/GAkQXLMTsb8Lun7XBHQmxmULoviCsY23TlOjvqmBryoYRZVsWhRoWAm32g
         KvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203079; x=1768807879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aieeUG5t4cx92lVZlSq6w5IqSGyS46OAJyDHIiD8MkU=;
        b=QdnaxL+CI67NwZafNeeKAU2aiDi474ZY4Sh38SHJew/SxYC1qskoasHkCMHicV77Lx
         vhsZS+GKhcmcljcsJlNVXBHIk9o8hoAUK2WL2KyqyHHZIuyqF1Xt655sdkCS+nDekzHo
         B2LTkAZ2G2ZkHrKruvL8zletT8JCXMeRhGhMgPKa7lCw5QkHPW/j+lya/rsZIsyx0ag8
         MTs/TfKCPJeMPYhyr6VoF/eBajIS/orNAgjytJPNQhBM37uNLpWQPypaZglWs+6KwhMh
         Qg4aqp1M1Obe3rY1vSs6HOs8A1/7XfFifpg/7wwyApL9oOCKpZ4NYQP1xh5ClRgyhRPE
         1Ncg==
X-Forwarded-Encrypted: i=1; AJvYcCXXSASrG0B5Dl6GA7TxHENl7nPIVr6aCCQ/ss7ucjN68MSK+Gq/xQrjhy43gOH0foYytdddoNUk3FYybflP@vger.kernel.org
X-Gm-Message-State: AOJu0YwBC/sSvMemtIwVdwTnnG7NcR/mFWe1NUBq6U7HWMhSgWtQKrvF
	yg8eaXd20SnJ2XwXSbTgam8xQb2gKLrHO7qQzIFLEllZozoXywrTSoij6yzRU8V4AhFDd/gJ9WY
	G2HtPR2bDLXMr9AEMUmWKfbKFj09hCeV9oJi0UAHAVUBp2TH/uinA4gDenptDx5YmTLyZHBsGmC
	VqLaLuhTdhuMQRrmTIW/F0BEyAmA03mkShPxFThIc+qEo=
X-Gm-Gg: AY/fxX5VHzTXVzQfZE9olWNrOIFtFc5Mcn+G37KeuyQrnjW2LGKB26e9jR5DeXsjBtm
	sW6gOAoaqVBxKb1No37Y7Zzi9LClstbf1eZiRdyC7YbpV0JjgWPTT4UW9R/P9HVOxKTubpuN5Q2
	GQ6XBea++lxNE7l+9+kT6nKmLrUfD1WVVUL1Y5X6u7QFXKwRX7a10aNaNOGC5bBU7CugtZv/T+v
	9S/3C9k
X-Received: by 2002:a17:90b:57c4:b0:34c:a211:e52a with SMTP id 98e67ed59e1d1-34f68cae46emr15271750a91.27.1768203079382;
        Sun, 11 Jan 2026 23:31:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVeH0yXzyL99iEdeKLneF+ImcqBHnePS2A59769rwS8dnkwplqXvC3R56OCpCd22vzD6s6AQmmtQNsHGCNhFA=
X-Received: by 2002:a17:90b:57c4:b0:34c:a211:e52a with SMTP id
 98e67ed59e1d1-34f68cae46emr15271737a91.27.1768203078885; Sun, 11 Jan 2026
 23:31:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
 <20260112-max-mixer-width-v3-1-f98063ea21f5@oss.qualcomm.com> <2E7090A0C462255A+6658f83c-4e5b-4f49-a90b-54eecd61fcbf@radxa.com>
In-Reply-To: <2E7090A0C462255A+6658f83c-4e5b-4f49-a90b-54eecd61fcbf@radxa.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 09:31:07 +0200
X-Gm-Features: AZwV_QiGdaYcA4jSvflgXX6CaLCQduNAeACnn8ngi5rlFmuoNNo_wOw555UhKO4
Message-ID: <CAO9ioeXY=rzZkJi=Lz4-JDASSnE7DWBh59aPawrPSzrFFPCNbw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: check mode against PINGPONG or DSC
 max width
To: Xilin Wu <sophon@radxa.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: ST9oNI2WwDBee4QZZxTudnNhNMsW2Yls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1NyBTYWx0ZWRfX/7U7JJeJGu1N
 zWkWfkEbbzMthEOqF6nTrS2iPqDDs0/LOxaPtsm/tPY/Io6X8QmmfnzFUHVFX8NZFBsJK6b4W6o
 TQUt/ZqMh2GJzUoMD9oF29TWFuuwj/ztagKxRSb5+4eDHJY1h0h4f0K3SEzTNQEGWGApYKJWoJV
 QTf5CwivJAePQygk82n0ug7WBWhFlWeKfoA+7vWm8R3RxZg8ABmrIMJnQ1N4K9A2ATbgBdkT7Ue
 qUx18ChQy71Sjn46fdyk5klZG/G97VTaPYnDea2vsABtaNBLGrtiCuT4+350yncVxvmjiYAnFUb
 9xxzfKUNHv4YGU/hjW6n/GwuRhi21CWc2aZDEQpIfbKi37f8wE6SW6ejpz5lcyLAXZES3B/gTpa
 oMvDFVikMqRjCheexf/TeQGuzKhsfLaep7tcmeO/jb1TF3g7b1NpzkDeH9mbzGBDijImTgANDvS
 +dsJYA84d1lyg3mKjtQ==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964a348 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=5DgrgJxoGKuf3rDOEbEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: ST9oNI2WwDBee4QZZxTudnNhNMsW2Yls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120057

On Mon, 12 Jan 2026 at 09:25, Xilin Wu <sophon@radxa.com> wrote:
>
> On 1/12/2026 11:11 AM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> >
> > LM block doesn't have a hardware buffer (unlike PINGPONG and DSC
> > encoders). As such, don't use ephemeral max_mixer_width and
> > MAX_HDISPLAY_SPLIT to validate requested modes. Instead use PP and DSC
> > buffer widths.
> >
> > While on the DPU 8.x+ supports a max linewidth of 8960 for PINGPONG_0,
> > there is some additional logic that needs to be added to the resource
> > manager to specifically try and reserve PINGPONG_0 for modes that are
> > greater than 5k.
> >
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
> > [DB: reworked to drop catalog changes, updated commit message]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Sorry for the late reply, my colleagues are still testing the new series
> on qcs6490.
>
> However, this completely breaks 4K 120Hz display on SC8280XP CRD, which
> was previously functional (albeit with the clock check bypassed [1]).
> The display now shows a solid blue screen. Kernel logs indicate that
> only one layer mixer is being used, instead of the two that were used
> previously.

Interesting, thanks.

>
> [1]
> https://lore.kernel.org/all/F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com/
>
> --
> Best regards,
> Xilin Wu <sophon@radxa.com>



-- 
With best wishes
Dmitry

