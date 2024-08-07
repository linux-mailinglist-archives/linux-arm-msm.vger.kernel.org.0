Return-Path: <linux-arm-msm+bounces-28078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B7794A618
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 12:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70AD62854E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 10:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDB11E2880;
	Wed,  7 Aug 2024 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eQEG66Vw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419011C3F0A
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723027459; cv=none; b=EGj7lS/zSpwuFpNnB4YnO48GwnnlYw3kevew4fjFw5O9hmf/Mql/FweaMJuhjQ2deHLZtw6okLGEdHq4CMA9zsdxTmfDUi8bnfLjXa8E0+3c+Lq8rJtBGXRstHb3PHozwVcK/WtXHHiChe36JsiticIPRF39DNRglIxxwnzy2ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723027459; c=relaxed/simple;
	bh=7F2dgW4FuJsClw6RwBczzLtLul8AUYM2EWM8QMsAPjU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=MI4XLQtEHWtIwFh8sqiYTPOyIBkoemCzI53ekCtfqgQTy9CwnMKyvFx+93LvJZJIEo+HXDG5z+YbwE9W9L2FLwJiJjbetp2EB9BDKYoQTs0njmaCb5lc27T6McE9y1Bijd4DSSWXjpxlu7DWh12U/4AQl5eA4Zk7+xp2m9v19QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eQEG66Vw; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-1fc56fd4de1so5646445ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723027457; x=1723632257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F3o02Xw7ezzA14Pd+Lgc2BLB9SvalP82R9YVWF/sDxk=;
        b=eQEG66Vwf4gwAYtdaF9HPk1L4L+dBqzCKMONQnz8rR1WzM1b8ZZ85xLIh1QuEwRU+l
         uQ8U+SsAsydm3JgxcPZIshMx1mJa02gO4eZ2GMzHDhHS0ksZxIyDQO7QDWirGi3dGhHb
         7mTgICeuaHy75sqEGS35/Xa3yQYIyvR8I+cyjSMmDsPJM2OV1aL7wIbzf78RzMevTyls
         uqOaNNAJBQquMIg0zr1plyUb5UxseIjUeebIsUtEM76TTQ3Fvc37sgWuMEnyIPy+HhDI
         /YL216wDGRsn6zoIs+XBY2Aq6/EwzJ7wD1zf9c+vGcTEi+eqGa256Dk7QAtpR15WxXkx
         Ifxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723027457; x=1723632257;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F3o02Xw7ezzA14Pd+Lgc2BLB9SvalP82R9YVWF/sDxk=;
        b=GD36c6ZojlV3QEqOWibxX618swcNA2jbk/AAjqsr+CkDxlZIt2xTWBKKZeKZiXIPmo
         CcHojoYmkaBAO702K2xUWRuM+US7MIn5J5uGn85xNFsokhY+HpOifwGvL0uFBNsZAL/M
         ptg3E4pmhqa+l4Oo/rRsO7F2WT7VKIUE7Yi+N9FEzRdYYePOuRY9cc+aYJKTNI6yTppg
         1UxAX1D24ZqUdPvNvsMaKQaTLwSyYqNtD0qpoxxoBKk2LzW7SHVRz+3lofrFLqWacwC2
         mLfxLxWsuAcAFNvAtO5+l9chuGyEZhysDIyT9zQpiEdIMPk66/YaslFwDS32zBK5EVb7
         IxPw==
X-Gm-Message-State: AOJu0YxK7spl2oCVhD2pWQLM+2wigQApWsXFDodcnp21xQt+7upFuskE
	j4FfYgX2uwwYFxLBzG91HChegJrNITrCo9sgne/Nocx0+4UsLIXl196mfNucKojroygED+zrdUK
	rGzpXbfuYs1k=
X-Google-Smtp-Source: AGHT+IFoNLrt1GaF+yeaFvmCHadWYdmm/RDr/6D/Md5qSi81mcUQk94i8uHGUfoK6lIe9cztu7TiAg==
X-Received: by 2002:a17:903:a88:b0:1f9:ad91:f8d0 with SMTP id d9443c01a7336-200853de85cmr23075065ad.8.1723027457532;
        Wed, 07 Aug 2024 03:44:17 -0700 (PDT)
Received: from [127.0.0.1] ([182.232.168.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5905e58fsm103268695ad.177.2024.08.07.03.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 03:44:17 -0700 (PDT)
Date: Wed, 07 Aug 2024 17:44:12 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Leonard Lausen <leonard@lausen.nl>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_drm/msm/dpu1=3A_don=27t_c?=
 =?US-ASCII?Q?hoke_on_disabling_the_writeback_connector?=
User-Agent: K-9 Mail for Android
In-Reply-To: <57cdac1a-1c4d-4299-8fde-92ae054fc6c0@lausen.nl>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org> <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org> <57cdac1a-1c4d-4299-8fde-92ae054fc6c0@lausen.nl>
Message-ID: <61D52432-DD30-4C43-BD5E-1CC9F84DF5B9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 5, 2024 9:27:39 AM GMT+07:00, Leonard Lausen <leonard@lausen=2Enl=
> wrote:
>Dear Dmitry,
>
>Thank you for the patch=2E Unfortunately, the patch triggers a regression=
 with
>respect to DRM CRTC state handling=2E With the patch applied, suspending =
and
>resuming a lazor sc7180 with external display connected, looses CRTC stat=
e on
>resume and prevents applying a new CRTC state=2E Without the patch, CRTC =
state is
>preserved across suspend and resume and it remains possible to change CRT=
C
>settings after resume=2E This means the patch regresses the user experien=
ce,
>preventing "Night Light" mode to work as expected=2E I've validated this =
on
>v6=2E10=2E2 vs=2E v6=2E10=2E2 with this patch applied=2E
>

Could you please clarify, I was under the impression that currently whole =
suspend/resume is broken, so it's more than a dmesg message=2E

>While the cause for the bug uncovered by this change is likely separate, =
given
>it's impact, would it be prudent to delay the application of this patch u=
ntil
>the related bug is identified and fixed? Otherwise we would be fixing a d=
mesg
>error message "[dpu error]connector not connected 3" that appears to do n=
o harm
>but thereby break more critical user visible behavior=2E
>
>Best regards
>Leonard
>
>On 8/2/24 15:47, Dmitry Baryshkov wrote:
>> During suspend/resume process all connectors are explicitly disabled an=
d
>> then reenabled=2E However resume fails because of the connector_status =
check:
>>=20
>> [ 1185=2E831970] [dpu error]connector not connected 3
>>=20
>> It doesn't make sense to check for the Writeback connected status (and
>> other drivers don't perform such check), so drop the check=2E
>>=20
>> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu=
_writeback=2Ec")
>> Cc: stable@vger=2Ekernel=2Eorg
>> Reported-by: Leonard Lausen <leonard@lausen=2Enl>
>> Closes: https://gitlab=2Efreedesktop=2Eorg/drm/msm/-/issues/57
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec | 3 ---
>>  1 file changed, 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec
>> index 16f144cbc0c9=2E=2E8ff496082902 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec
>> @@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connec=
tor *connector,
>>  	if (!conn_state || !conn_state->connector) {
>>  		DPU_ERROR("invalid connector state\n");
>>  		return -EINVAL;
>> -	} else if (conn_state->connector->status !=3D connector_status_connec=
ted) {
>> -		DPU_ERROR("connector not connected %d\n", conn_state->connector->sta=
tus);
>> -		return -EINVAL;
>>  	}
>> =20
>>  	crtc =3D conn_state->crtc;
>>=20
>


--=20
With best wishes
Dmitry

