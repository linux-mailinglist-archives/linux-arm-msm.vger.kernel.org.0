Return-Path: <linux-arm-msm+bounces-87687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD33CF86CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 14:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB9583009238
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDC632E692;
	Tue,  6 Jan 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLadjuGL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B735831D393
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767704965; cv=none; b=TR2M8PWbm+wEMtJpa/Idrt2R6zcAvDMNafQK92m6qVvo2MawnWCIZZ88/XG6i2uhYHdczbuLHUiTp8xQynId6nDNWFUTL2av+apIdScfeAs75WestwR1dtCwMUorXqSeEYf8jMRt1lBqE6lCmIVDMgLDZRPVncFF6/fZRVcOwlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767704965; c=relaxed/simple;
	bh=fISq639A9LEzQDlEn/5UvYkEqYIZeG97xiheL6xSBXU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3VPdQdmoHW4kudTJIYhqlvM+PBhZ7/jRM0Zwx/zTSORVFI+ILLqwKdW8IZ59cVFp8Xw+oBhPPYIBVbA4SXsjwPDwOXFS46XaM9Bd8euHvPx08A5awanjBE7SWAjmfE2rI5feZUdRwg1La7SWgYaqm3yfkR9noqHanqtzbqRAqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLadjuGL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C78C19424
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767704965;
	bh=fISq639A9LEzQDlEn/5UvYkEqYIZeG97xiheL6xSBXU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=GLadjuGLGNiBfr9ciGMk4RO00WBCa89HeRppLxHhr1nZ8JzP9IqdsdZZ1RBoIbHpH
	 y9VYIigyUmGTwO6IDLHxyW+9bMxoEtgcDbvs3XWAQ2NxEXwvBjYauUbCK5XbRspT5l
	 AFzh3pN8kVMUbW3QCrRjm3IOhvzEfZAGNVQPL9VbV/TNsPUnSdc8NdVoIK71f4j6gp
	 ohzEEYxCiLcDNU0X3vtZr9XuYI+NRyQg8Qj58BZbG7cX/rhoXlafitJo5L3LUnCxZg
	 KMajA+DcoR6yC6PvR0b8dG+kT4OjXpxxrm2C5d4kBasTjqFv4dErqZ492NKz21ABGc
	 Ir+2v5q0dCszA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59911cb8c3cso1020153e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:09:25 -0800 (PST)
X-Gm-Message-State: AOJu0Yz5ytXq7HChiTEiMLfWLPPmHtzGXaKA62TgE3mz4D52Ykh4E3N+
	GfWgwpKtl29F4lbHlZLZOOxJOwNlkGKL3CnRBYy2O4idiHX8kwgiI4Y55yiPxkWaNBjrqdNicR+
	zTD6+6/loo0l9V9G+JKTR3asg/ZtOtvrb6CfiKMM15w==
X-Google-Smtp-Source: AGHT+IHRukwdqKvEDykEIcv4i2AMDuw4pNrSE+/ODj5JY69Wt/H3UuDG2Ps3I5fST4AD9rEd1A/zXorE+YIQSAYcApY=
X-Received: by 2002:a05:6512:2350:b0:598:ee62:32de with SMTP id
 2adb3069b0e04-59b65257e39mr1144393e87.24.1767704964026; Tue, 06 Jan 2026
 05:09:24 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:09:23 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:09:23 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260106031223.499706-2-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106031223.499706-1-shuai.zhang@oss.qualcomm.com> <20260106031223.499706-2-shuai.zhang@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 07:09:23 -0600
X-Gmail-Original-Message-ID: <CAMRc=MeLKk2wozObDrmqJ8WV2Y1bBuBOA+eCuLA+5c3aJn2r9Q@mail.gmail.com>
X-Gm-Features: AQt7F2qSe8qqxCbMknJMuoZMsqatRYfXrhM5sFgyxi0gh86SrK8kF_GBimoJMns
Message-ID: <CAMRc=MeLKk2wozObDrmqJ8WV2Y1bBuBOA+eCuLA+5c3aJn2r9Q@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] Bluetooth: btqca: move WCN7850 workaround to the caller
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com, 
	jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Jan 2026 04:12:22 +0100, Shuai Zhang
<shuai.zhang@oss.qualcomm.com> said:
> WCN7850 will first attempt to use ELF_TYPE_PATCH,
> and if that fails, it will fall back to TLV_TYPE_PATCH.
>
> To code uniformity, move WCN7850 workaround to the caller.
>
>

Stray newline but this will be fixed by b4.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---

