Return-Path: <linux-arm-msm+bounces-46985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4598AA29C66
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 23:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AECEF7A3F01
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 22:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874EF1FFC4B;
	Wed,  5 Feb 2025 22:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sw5Wqa4u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7FF1FECB9
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 22:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738793560; cv=none; b=NB5V6++axv36g3J2xDr1dK3TCaPzevr6hrFcsz8CfwiNpWFHPQ3Q5FZkrwOnx6A3VyVYj4bn2J5gZYy1PblFXnfTybH3wbCVCAHubw4pyEEDKvkSVX/8wYqVodPKMi4KmGYtfMa91HbajHPAbGMLqa40m/QL2uxRRzOv5SDtwOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738793560; c=relaxed/simple;
	bh=X660QqrrfV/4WO1jiI7HN1neYnb5eUUbvOgM1tJEeGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ax0/OLxR9ETHfRAFIHc1tMbo3oTZ5BQhPaivK0rA6IDqQZwPUJMk79kSC87qWwcnHY0ksmqV450n11SLiWCvLJ4Q8H2YE9NCcrSUId+2mKhpqDSdF57YNVQJ5sCx1htkDH+I6nO/MjwcxstB7zLEMKrVPfQQ0In028R2Tvad0nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sw5Wqa4u; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ef60e500d7so2670837b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 14:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738793557; x=1739398357; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7QtXsxVavLUFWgY/AN/K9Qycf6vg7WLQZg/R82r5mY=;
        b=Sw5Wqa4uFAkB+OeYrIYnk/2pMdrQ/Pil/ARqXqDDIQ5X1qJAlERhOmx38501+waW3M
         3I4NCjn3P2lMHfiW+CfbOnvYEDVS0Ai3incQOu9Rs+yIHLWj3El+hqb/AKChmJQ5sPMs
         ZvN0hVqpVjRYLcCOTEKvduoULW9PnXKuwyMuNmmSm6gL+tcfh8nQyb+7pbdmhHcKLotK
         l0jtxCFiK8gGXIJmwYqV/OkQ3+R+ueDpYYDKC1W4u00d6D5COCY6rZSywBBOOMyRfrne
         dsRfJvUOLJIERNWI8XGidtPa2r5WNyu9i/zI5YlpRWl+dnK8piuuk7zMiS/9PqvhcXx4
         ao2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738793557; x=1739398357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7QtXsxVavLUFWgY/AN/K9Qycf6vg7WLQZg/R82r5mY=;
        b=Kr7NKGZYRZVYP4z1W/Ox7TmkgaARcXSlvKfix//YgmsBeljnGLHqWdjQ8MVAQSrOL1
         kNV3IYos/jKYijon/nL2/0yjqC3vtbbcoimqcFn4Ps3pxAp81rFMqoc6aylcwtymYczI
         EBtfM8HVbH0Z9Gdce618TygsKvQ0f5aqF1HWZM4T6mMVnhc5Or9yzaIiCzyeX2InyAz/
         tD3BPZ/HYuwBxzdoKDlwyE6S+UmrpfnqauKqahI+ZUHHSZLs/8098VUE1Lr7KGLxStFr
         AmKCTwBklN9m/jdqAbpoulQDSY7EsAsOuLx5k/78kndSHOGQGkBtFbNbGqZuyMmdU3o2
         Syig==
X-Forwarded-Encrypted: i=1; AJvYcCVCR/p/x2P85CnDVyKOeIP12u5qNtqd2xFx4OZgN76b1rQvMqD2RFME5E/TS8SCisOIA+t/amlQAQLWrPqg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp9CagBbvEaQI+U9mUwrZdctuggq0n1NgAaqR/Xx8SMefrOPsI
	5l2tYAePKTFQfXasrm6LAFsbLrJ8igQygEFPLHrFZytfbzcr9sSXRLnATCfRHlFqXeqGDeM4IXn
	gFqZ4zpfRegljLFezy59GvG7g7197NyzbFy9CcA==
X-Gm-Gg: ASbGncuxJDdZptWKpRGendQGJih2vjLFvG7RuJ3SVEFEYpkIGHzAcJBNH/SE+HKLLgG
	jUzEJmyVn66GASaH8Y8tKnt1dhKxyA5AblY+a6i4pwdOy6Qv1QgMUNad7wlGjSlefFVqR8KQ=
X-Google-Smtp-Source: AGHT+IFhAhS10+zrWdih03o2CEn3V2QZhNOqn9ZUKMdukpqWd+ZlfDyf4YPbIkwfMsg+f4i0a/66NxkBMlOJLtTiWgY=
X-Received: by 2002:a05:690c:48c3:b0:6f6:cad0:9ddd with SMTP id
 00721157ae682-6f989ee68bbmr44089747b3.18.1738793557654; Wed, 05 Feb 2025
 14:12:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com>
 <f7818536-4aff-4320-a9eb-9d755b86d6d8@oss.qualcomm.com>
In-Reply-To: <f7818536-4aff-4320-a9eb-9d755b86d6d8@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Feb 2025 00:12:28 +0200
X-Gm-Features: AWEUYZm56HWZv5UIHjCax8T-rZJreFLb0juXHGJzpSx4_VuWMdfATxczjYbKKdc
Message-ID: <CAA8EJpoEpbtEDU1kC8xMEM8dxGzG31vSf3wFsaG8+CZky4sanA@mail.gmail.com>
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF, v2
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 20:46, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>
> On 2/4/2025 3:05 PM, Dmitry Baryshkov wrote:
> > Hello,
> >
> > With the hopes of getting this into the February linux-firmware release:
> > Please add the following BDF file to the archive.
> >
> > Changes since v1: added regdb from the same archive
> >
> > * description for what hardware this is
> >   - Qualcomm Robotics RB3 gen2 platform
> >   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
> > * origin of the board file
> >   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
> > release, licenced under LICENSE.qcom
> > * ids to be used with the board file
> >   - WCN6750 / hw 1.0
> >      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
> > * md5sum of each new board file to add
> >
> > 39b270f43cb6d733cde607bf2b23e2be
> > bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> > bfbd247fe961dffc4e7fb413703fb284
> > regdb-bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> >
> >
>
> staged...
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/ae4407c02a434534590dec3e0ef26b371fd7888b

It's proably not worth it now, but it might be nice to have a
changelog of any kind. Like 'added BDF for Foo Bar' / 'updated BDF for
Foo Baz'. If that's not too troublesome ;-)

-- 
With best wishes
Dmitry

