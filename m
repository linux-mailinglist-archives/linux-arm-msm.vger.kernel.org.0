Return-Path: <linux-arm-msm+bounces-86596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EECCDCF41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 18:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDDBC300EDC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 17:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A6229A300;
	Wed, 24 Dec 2025 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RY0BaL3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F4F1386C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766597780; cv=none; b=el7KkRT/CqHuJAJX/0olEtZ1KPPq25cYGndTZ+9pn5TP38npw3fsj82on+IwT9mONxAaNO0FIXDf3KhMVmnoyNXPgkeNe5NoBY7CRpY1PoRXNOaHCzM88zikAerYjyRdUcrMS00rQZU+8iaf1vdtHkzittr9+hxZG0+oOcyD0vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766597780; c=relaxed/simple;
	bh=PClKipvoSN/NnumpcyN+/KuxzqPi200kimFq8t05q80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TKktGYMGFBe9DlXKLFsW/AciZWKyaM7KvL2CYMhZXQ+J23u67wYb3SEaU6fR3P62SyOugqV4SYrEZ9q0UFSZ5cgn2dCpUQ9qAefJh0J7+noz2FBmKI7Qibj22y0Hfvmy2r0Adm2AEjdV1E3uavlnAlkfzZT5bf6asgwPjE2J050=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RY0BaL3V; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-450063be247so2606363b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766597777; x=1767202577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpMnqFtDTmoVp19QSLvEcIFu/SJ/IsYwE4qFGJyAisg=;
        b=RY0BaL3VQxJqm3nUyGuB9UkykFhgSsccUewP6vtaZVXcVUKEBbJlo6Zi5jp67LgYdV
         1hgRqip5/B2CbV895GzvcHOz0fC+flxZh84ATLflP+XlwGMCAj1AaZDh+puTKKzA/hY5
         T4wpYxDgTzZcm5PM92GGy70+pmnl4fpY1BNp28gg6Z3kGvp3vgTkdgnCXu4TcXIcMerC
         yEsJr7VVLk0hQoazDsDUkJxV9D/bD3SLmpeS3SpDjwpyQFdlAqNSSI6bS+GOjxcJ///s
         CtJJJZVErS+brQK8P95D6Rl8nIryZ6lqCqy4udAH5IeJTb2j685nZQrTbF0gUAwJeB1Y
         dviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766597777; x=1767202577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MpMnqFtDTmoVp19QSLvEcIFu/SJ/IsYwE4qFGJyAisg=;
        b=Ax+AMHMnSXfqx8jknQWM00cbcn6h7JEXTzQ5JzBw134lzEyaDDqJpLiDOsXJMJtPyU
         5Gsu8KuvQ4HH+5pxqJq02fI5l8Cd1+ljuNoTYr+q/3HKHhPO2O4McQfkh0Z8HKX8I4FJ
         qWokMVks3tlgxF3cfDatCUIEG2gkO+dyc/AUeffINcoXyQkOwmJsIiu7WT4QGseyR9Pl
         QwdwZ6GZR+vYgGh8nmo9fAKG9lGklKakE2k2e5l0BK644dLdhjGvn13Y6GTATSgAlcPL
         2+EJlo9/WM5SZ4TDIO0o7FE2dBG5Lq+sn+k2f97HSHrTnv8/gGxuNYDHfbmIyae2w22n
         TZRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbznEieVgLkJvSaFps6lO9s0kgJDgLBFxI8rcuPXIFoeff9a4u5It/+lqqDLfvserWNaAGJoNCxd4nhWAB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7XLvQmefi3mlCL6Iw/oEIlt/Z8RYhdLPeBIJz2I85gWEkqE7A
	jq2XUe4uBXwDRUdg3ypaq3Y4MuMb3ggwVOpWiHePPyN645GKWhkXJxeV
X-Gm-Gg: AY/fxX7v7l5+3QKNE9U4z/8wnVtp51ZXAQx2OFsq8iM9c3VOvIJBP+aK4u3ItDoggUy
	mVWHvC1EPSzg1OPOXVnPCPAodVzR+nm5/Odaz79bjiEerdKb/SCeVWIjg2LLwhRRT/lN0hYzjrI
	n8Eundy78i5T9p89muzPFrFQImtVpN3sW2S62BjBZEGW6R3Zm4lLQJ9Gmomh/EmKdXV/SeR0rOW
	ThcOGV799mrUIBHENxUHmTkNGAq0h/7eTHz8PD5OV1hGoHNLIDEGJ1Rveq2uciqgClQcD6z9Yf5
	8dJkJYpGWVnulxHIfAMDwvVOojhqiZ87MkMp06MmwCTZrLMwWqjNWlotbb7tuYoIqiMX84mzP95
	q77ny5sHVBG2a6A4WHhRrUCgYybrxvtLiFAfTL31k1kVIZDqPvE5ZuS0vbzzFLWnMKp1+ptVkFK
	zddEcdtuK87LeFBPCrUFtVr+cQwrqmHOHRXSaldBOff0vfYkgzAjEHPIYXua5XncwjSiXcqLIes
	yFWlCZshGjXn4D8j4LRAPj1dy7wQl0=
X-Google-Smtp-Source: AGHT+IEwhNLGB/ObbcXq24oPZkJatmLwE/LdvbRV3KFdoUMFsBjOOpCavIyiLN9TSPdAOX5X01lMsQ==
X-Received: by 2002:a05:6808:1202:b0:451:4c6d:a638 with SMTP id 5614622812f47-457b20140eamr8904780b6e.7.1766597777141;
        Wed, 24 Dec 2025 09:36:17 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaab620b8sm10695688fac.14.2025.12.24.09.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:36:16 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
Date: Wed, 24 Dec 2025 11:36:15 -0600
Message-ID: <7564740.MhkbZ0Pkbq@nukework.gtech>
In-Reply-To: <41616f5e-68a6-4354-8520-4321e747efc9@oss.qualcomm.com>
References:
 <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <12223416.nUPlyArG6x@nukework.gtech>
 <41616f5e-68a6-4354-8520-4321e747efc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, December 24, 2025 3:44:56 AM CST Vignesh Viswanathan wrote:
> On 12/24/2025 1:51 AM, Alex G. wrote:
> > On Friday, December 19, 2025 7:20:04 AM CST Konrad Dybcio wrote:
> >> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
> >>> Q6 based firmware loading is also present on IPQ9574, when coupled
> >>> with a wifi-6 device, such as QCN5024. Populate driver data for
> >>> IPQ9574 with values from the downstream 5.4 kerrnel.
> >>> 
> >>> Add the new sequences for the WCSS reset and stop. The downstream
> >>> 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
> >>> using with the "q6v5" driver because all other parts of the driver
> >>> can be seamlessly reused.
> >>> 
> >>> The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
> >>> must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
> >>> register. The second set of clocks, "clks" should only be enabled
> >>> after the Q6 is placed out of reset. Otherwise, the host CPU core that
> >>> tries to start the remoteproc will hang.
> >>> 
> >>> The downstream kernel had a funny comment, "Pray god and wait for
> >>> reset to complete", which I decided to keep for entertainment value.
> >>> 
> >>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> >>> ---
> >> 
> >> [...]
> >> 
> >>> @@ -128,6 +137,12 @@ struct q6v5_wcss {
> >>> 
> >>>  	struct clk *qdsp6ss_xo_cbcr;
> >>>  	struct clk *qdsp6ss_core_gfmux;
> >>>  	struct clk *lcc_bcr_sleep;
> >>> 
> >>> +	struct clk_bulk_data *clks;
> >>> +	/* clocks that must be started before the Q6 is booted */
> >>> +	struct clk_bulk_data *q6_clks;
> >> 
> >> "pre_boot_clks" or something along those lines?
> > 
> > I like "pre_boot_clocks".
> > 
> >> In general i'm not super stoked to see another platform where manual and
> >> through-TZ bringup of remoteprocs is supposed to be supported in
> >> parallel..
> >> 
> >> Are you sure your firmware doesn't allow you to just do a simple
> >> qcom_scm_pas_auth_and_reset() like in the multipd series?
> > 
> > I am approaching this from the perspective of an aftermarket OS, like
> > OpenWRT. I don't know if the firmware will do the right thing. I can
> > mitigate this for OS-loaded firmware, like ath11k 16/m3 firmware, because
> > I can test the driver and firmware together. I can't do that for
> > bootloader-loaded firmware, so I try to depend on it as little as
> > possible. I hope that native remoterproc loading for IPQ9574 will be
> > allowed.

Hi Vignesh,

> Does this rproc start sequence work on IPQ9574 without using the
> qcom_scm_pas_auth_and_reset ?

Yes, it works as presented in this series, without 
qcom_scm_pas_auth_and_reset().

Alex





