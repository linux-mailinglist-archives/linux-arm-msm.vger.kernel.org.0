Return-Path: <linux-arm-msm+bounces-27738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394D945108
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 18:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 600041C257AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 16:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C8813CFA4;
	Thu,  1 Aug 2024 16:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Dg6A5Ykc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031D1B151B;
	Thu,  1 Aug 2024 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722530716; cv=none; b=N/Ee5UBeZNf2A8jTH822ibQbzx86Nn2eDZw1g4pfC+OLjbHmKZ9n4KDLpWyGhroL/b/eaaG0iZjdP11ywHWHew4/RL22uq2BTI6k/Dx6norUPEBt0WmYFI5vbMW3fct52RlmbNnfnmOnOgqITzYS0W80i7Q404hezo+G8VHTg2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722530716; c=relaxed/simple;
	bh=sMIMp3uEa+EEzyoCDwp8+qa9SbIjLirvPVuJpld5/2w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Q/rHplRWruugrJarNvadAAvuMRU9GGhGvlnYJZwoBP486Jkn8mpLVnKUckIkjzEPywdv5K11vQHnE6c1DZep+Oz/Q28/duxAb6p9xHUjG868FGN8ewqMIkvAROhyub59knNnXnovsTpfvMUQWBnX2KfhJSdp7Mj15JK22cL8ttU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Dg6A5Ykc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [127.0.0.1] (254C2FDD.nat.pool.telekom.hu [37.76.47.221])
	by mail.mainlining.org (Postfix) with ESMTPSA id DEA75E4504;
	Thu,  1 Aug 2024 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1722530706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5l+UJOnTuIA2VF3IVpxLITj1fy8BGXTZgAAao9FeIc=;
	b=Dg6A5YkcSa+bOJBu/209DtaFqEZs9XbCrbL1TMnnfdQqyMaoZX3JOS4cJltrVAISiyWllX
	zI/QmqpZRKZInbCcxiuJr/1sZlrheR0Pacan5bI45PjmYbFjjzCCP8Q5vm5f3CH9NplQ+S
	KLhIiaeOGhmeAHndl8Ax4MIWS62MmSUrxdqV50eM/quiZCR/LrSXQu7HfuBRtdtQmy/wcd
	6Itxv9kNyIgVp8JrlK/r72cK6PlUfL/PFhVKiKQiZMuUKgheGdxz44xEQCHS6todGMrL2Q
	39nnuD3L2wF3w3+PRZA4qbS7eJS62iALEti28VaG35ZmrpscfXHa7pUfjbg2Xg==
Date: Thu, 01 Aug 2024 18:45:03 +0200
From: =?ISO-8859-1?Q?Barnab=E1s_Cz=E9m=E1n?= <barnabas.czeman@mainlining.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
User-Agent: K-9 Mail for Android
In-Reply-To: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
Message-ID: <874E8EE9-6BE5-4801-AB2E-536B6A160AF8@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Should i resend this patch set?

On June 28, 2024 4:39:38 PM GMT+02:00, "Barnab=C3=A1s Cz=C3=A9m=C3=A1n" <b=
arnabas=2Eczeman@mainlining=2Eorg> wrote:
>This patch series add dpu support for MSM8996/MSM8953 devices=2E
>
>Note, by default these platforms are still handled by the MDP5 driver
>unless the `msm=2Eprefer_mdp5=3Dfalse' parameter is provided=2E
>
>Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas=2Eczeman@mainlini=
ng=2Eorg>
>---
>Dmitry Baryshkov (1):
>      drm/msm/dpu: add support for MSM8953
>
>Konrad Dybcio (1):
>      drm/msm/dpu: Add MSM8996 support
>
> =2E=2E=2E/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953=2Eh   | 218 +++++++=
++++++
> =2E=2E=2E/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996=2Eh    | 348 +++++++=
++++++++++++++
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Ec     | 106 +++++++
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh     |   2 +
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec            |   2 +
> drivers/gpu/drm/msm/msm_drv=2Ec                      |   2 +
> 6 files changed, 678 insertions(+)
>---
>base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
>change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
>
>Best regards,

