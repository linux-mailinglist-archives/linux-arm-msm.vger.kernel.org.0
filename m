Return-Path: <linux-arm-msm+bounces-82086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0080EC63F09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5B00A351BE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1896B274B3C;
	Mon, 17 Nov 2025 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1EWzlv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cx3xHDq1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B8124169F
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763380305; cv=none; b=ulKQwDO3UHjnv0SG8+p8qOadNKcaTe8yPr/dqmy+zOCEuV3oMiLDR1Qz0bQoeAXZqqcje7YzSsc6OnrCc2qvPvQEUN6YzjgMPaJ4LbWvDk7aZdmBPzBicAEifwkN5cd0ATEa3R+1yR+WL5v/yO2jhoWMDxKurrFO+IkmTcM64NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763380305; c=relaxed/simple;
	bh=ZgTNFTZSyER20HvvBFS2cRNtGyXc7c7w5RUMLHIVi5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOM0F6+t12lBOgyAuS93+kJl7C/VaGlRWfrdkJIKYXcvVCzuBcyfLx6Sw3vFXorr0hMtZop1xYVknOJ2qDjt6OvC2uHxWFpWkyG0DPf3cyd8CrPcOnJk3mCFzRW4nqqeHWEiBPifqWzT14oXP/l06/axHZ7ggD1B26IFOINTgVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1EWzlv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cx3xHDq1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAC27W3571473
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WYLAwiT4R6uv1jAYWe5dyjp8
	L/jzi7VLXlWgopt83iw=; b=A1EWzlv6SJlzks8Ugno2AHKhShar7mVKUFCwarll
	iPXHn+5Qcsg6d6GhOccDaT5JPSolImVqc/ZWA0sgNNXktHFOKJS01t5Feorcffpo
	9SGz3ZgKze0ltbo+YJ8sJeDYOhvRh2Zgi/9Zr9SN9v5mRKtHomn3W4EC3/U9c4pJ
	45TQ3aitsjOehIKo3PfE4ntNPc53ZATN4P36zoMqZ4kLk5ZzM3IIZFcfzN6SiTwD
	wYFMc7RMTGCmwprXdLe5NtnD88mD004pYYrIsoKrDD9y1EF7eXqSqUBz4x2ZFOez
	k5U3SAN2d3MT0n84a/UQH+BZPMQIT9YZGTWrMkPu6mMHoQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbr8gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:51:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297fbfb4e53so75319905ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763380302; x=1763985102; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WYLAwiT4R6uv1jAYWe5dyjp8L/jzi7VLXlWgopt83iw=;
        b=cx3xHDq11vYmp8Oe123ZB7lfil5oQcY8fZwDCzz0CVIOjpAgyC8LrslCNsmdUEMIyV
         gJ+jsFbxoM1CumP6b2O/LKXCsUZpZRk+sHHWPZIm/AWdzdEN2yECHrRWsEK7jwnrec+K
         geUkkwp27j3OsBdvv86gSHgliR77B1HMNt3IHEZywWsfrbRj8JVVuFylYBNgsD0J5/JN
         hcpPIl3Q34P7ykqhGLlGC6RXDFx7CAnsta+IVE59Q5/7ukESAxrm47a3GyGObokEv0Ki
         P84s0ezZyTbjp9tlOmUgZVj0XWEIAHoX7f/yCp8mL4khah1r0Q+peLWzg+ca3v6neF85
         UP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763380302; x=1763985102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYLAwiT4R6uv1jAYWe5dyjp8L/jzi7VLXlWgopt83iw=;
        b=dKme3IJhcURil11qFIOgmuxcCE9Y61qt/VSidvAPcv2J4fzGfqViBh42vbycHIFbav
         y+Yma1Xgns5Z5kyAS4ff53KOIzRonpqAv08b7ue4jOue5SS5DH2+viKsveKnU9RRZOcZ
         JNLMKM/bowBjYnK6GwCUtYnt9k4XFP3bYqcNrREF+RS4XVMP0s6ODEDFpdgmjWfPzReC
         /wVvB+EecNhmSnTV9hsg6FYQMNBXriz34eS9HvVAMbzeM3SNuSXUHdv9e8CDaK6oK3IN
         i0GdIKO15e5C7z72ibCdHg6wMKyMzlingCeofTH1GMfU58ZBgqAyNbV1VXc1CfMeeK9z
         RUKw==
X-Forwarded-Encrypted: i=1; AJvYcCWx5K43dhWr6q82Ef3XSEAy3oS+rCaoy8/C4bK91Brzp+EnkZMuL33Zxu4oWppSPSTeO+BJlxz8Fz0sdkPu@vger.kernel.org
X-Gm-Message-State: AOJu0YwSbRWm7VQdzSzXf+ABolGQY0KFqxV29eTrfpuQHxvr9/fV2iVp
	tD+WunlE8FSLTuqg53zYZiCwG1Et77QpidznuGFmCldCHtBaTuFT10Fxcs04Ocj7rR7lqNEq5Cm
	xL76R+n2WFMGFSW5HtaLCO1XSvEW+CuBsHKBqMN9k6mRKYVaCHtwMgTahuxjNsznA3B/VLFbQza
	OfBLs9d4S/qhGeWTXZafMlvnQF2pTaqrBXEbOSHNaZSW0=
X-Gm-Gg: ASbGncvL0wcIxBEK2o0ZIU9vczyyUK8KMoZP2qs4dg+Yx0ZFjlQtqI0f2cHCU7yLYSd
	ndexI4SaBgnNf4O092JJOXuGa80lnYWo4vwSMry1hCvcCfjRwUU0gWo07BgXY4MI580EPWYh7dO
	Mp7p8EgqUFIbrFErFZHHlpi4+6c92LfQrHd6xxeK9s/fqP2m7+iZwsGE196Jkr0UTlR9I39zWe2
	Waa67CLNIV/PlU=
X-Received: by 2002:a17:903:247:b0:298:efa:511f with SMTP id d9443c01a7336-2986a733395mr136201365ad.39.1763380301949;
        Mon, 17 Nov 2025 03:51:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBEicDfJ83cSCsKbUuvVLPVCMLfXBFOILWYFrgA9wPVMoV0gqTVn6LftKS1p2HKjBWSv/bvpkjeIJ9TH9GPrM=
X-Received: by 2002:a17:903:247:b0:298:efa:511f with SMTP id
 d9443c01a7336-2986a733395mr136200975ad.39.1763380301388; Mon, 17 Nov 2025
 03:51:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com> <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
In-Reply-To: <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:51:29 +0200
X-Gm-Features: AWmQ_bkuOKYfJMAKqGOVS6VALoKprEWuD_PpuMz-0Npx4AVyTkqubf-cEM7Zxco
Message-ID: <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Federico Amedeo Izzo <federico@izzo.pro>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Bcngshp7etb8Msj34L8aPjLbtv_-biJh
X-Proofpoint-ORIG-GUID: Bcngshp7etb8Msj34L8aPjLbtv_-biJh
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b0c4e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=b1ue4J2JLKFJIZ4Ya5QA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwMCBTYWx0ZWRfXws4EuD9MQvH6
 z3cdhYQXoKTNCtVEaJb6k/La1vCl4Jf8FSOOMtRjuZOGeUybHeVDnf/jmP/TTijtjH9EjSNUtaJ
 xjEKQK1hW4CHmhzrQJlCe20ck9LK/KPzVxpNDmOkwLnBfDDZ9uplu/DTc4+9uGw0+96t56xYlil
 2LCsOAY7ddbl/AjE8aI8hTgeSQ1TpwLwDl36U85mbbXf862ptr7N2/c17bQGGPHpphv7zZfOTS7
 GErEZCwG3qVioe+Ygnpm2Eeq0+gc3c0EjL9ceJ2j7EQ931SiboSQtNrNoQEij9MbIe95jQ3hIqi
 tUrymsLZR8Iu01ICgZlhQC7j+c3lmbj9JfrRJihHpt1JnGMEf1wzwdMhIPMqqcQQppYIXua/1Ui
 YswJV40g0ahcT5Twb9MfrP48fJ7ulA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170100

On Mon, 17 Nov 2025 at 13:25, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
> > IGT reported test failures with Gamma correction block on SC7180.
> > Disable GC subblock on SC7180 until we trage the issue.
> >
> > Cc: Federico Amedeo Izzo <federico@izzo.pro>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Most likely I will squash this into the GC patch
> > ---
>
> Peeking at downstream, 7180 and 845 should have the exact same GC
> (v1.8).. it seems like there's an attempt to program it through
> REGDMA instead of regular reg access. Not sure if it's actually
> necessary or just an optimization

I think it's mostly an optimization.

> What tests are exactly failing? I couldn't track it down on FDO GL

See [1] and other failed SC7180 jobs from the same pipeline. I haven't
triaged it yet, but I assume this might be related to platform
resources (it has only 2 LM blocks and only 1 DSPP).
Another possibility is that maybe we need higher CFG bus bandwidth
when writing LUT registers.

[1] https://gitlab.freedesktop.org/drm/msm/-/jobs/87878393


-- 
With best wishes
Dmitry

