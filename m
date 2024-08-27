Return-Path: <linux-arm-msm+bounces-29661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8788196165E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 20:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD593288F7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 18:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C16E1D31AE;
	Tue, 27 Aug 2024 18:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QIZbH10N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760B61D31A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 18:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781857; cv=none; b=BHkOQ3SqOLD/YB+ih5W/vuFzOyjJU+2fwp96iKBjgYVFVx0bQ6dxFM22hgVneCCBaP3kY75uHRP//Ue8H97/ES/Zna5hDIEa+FP4TKmeoXi4bxlxQLK3unGUT+JehthMNA50sxv4djKyYAk8sRRsuZZ15dXTWpv+jflmQKElz+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781857; c=relaxed/simple;
	bh=dMLDKe44fCDwnHMVTWPeFlG+Xo4vnWXVI5dcdgD1bYs=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lj/fKklygEH5ZJJJFDGGDTjOI7QogPVFd7pFJ2ReFUQwd98kWIqrvcB6G4rgnRMQZspxT1B4lr0RIPLd/6QCaeRcd2ydviFTUJ4R+TkrbDmG93KfuubDgXAvyeU7WdSoVZzMONMlvgYtSws2Id2luePxQzOzvc3TcuUs+0pftBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QIZbH10N; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e17c1881a52so2540551276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 11:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724781853; x=1725386653; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMLDKe44fCDwnHMVTWPeFlG+Xo4vnWXVI5dcdgD1bYs=;
        b=QIZbH10NZHJZralFoSyn8LA+6zuUnsh7bTrPreNjKeczWRVIc7fZgT8tJu/Ld4V1nt
         LRdFnJ6JVHwX3RXh6g7KRn7d9HQMI0+ga1ao9LJI0dHnW4BL054RvD/rTH+6hvg0oXCy
         vprFaW5Gx0BkvdqmvZkAEe3LR2vVqUaJt3zww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781853; x=1725386653;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMLDKe44fCDwnHMVTWPeFlG+Xo4vnWXVI5dcdgD1bYs=;
        b=WrfrBQwlaHqPsbLO+BuZlFXjNTwFkNB3KrvZ5w0B2VrFPf5yWFMrga/VGm0BEI5uoH
         bMAXfFurXzBkAqmD7DLOjPiC/E5TqNrLkCm+JB69EIX7E61sv86c9UByrbq7+BATAShp
         mJdZnnGfySylye7AugsBjViK84ju88qjZCPkxCBY9DEC8H+IFBRYk8AgvFuj8GT9byy/
         9wDpeJEquxTQZDkTjLlNHTbNnhPR1M6nvwKby6JdP36WYTdY56MaEMnlIFDRKmRKK1Wb
         5YxyC+eB4BG1tW5uiz2YeJtyXoaqR14vx7ayTw+ycVyp83+P9+bXoS1FbT3OD56ICPJY
         oYqg==
X-Forwarded-Encrypted: i=1; AJvYcCX+tgYwLCyHZtSKpcZTa+Ahh0Qizj5ls+IVUVVlsausN1uBzwqwqtylp7xfyG1Jby4hLg1OHBGw/s9K4HPG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzql4vO1FXS30a3SOQij9hNJBILFnt6p36zuXUOpjoRN33FzuVy
	rZFstqy3Wxv9a/lI8sPy3ZxNViABT9uXlJVR2Cffu13OUkjEy3ecg+Q72op8OEbZdImkSNbamd7
	5NyEyvfQ2SXOFb9cojmaU1QNwvcPiQW3iKIx4
X-Google-Smtp-Source: AGHT+IE0Bn9i/bUKuhoTzrKG4rVSXstRxEFMj4JTAl4ym01IvcLZrTD5rOM1gwCNkQJJ0jrFSUsDnYcxg59QUJYwibU=
X-Received: by 2002:a25:dcc5:0:b0:e11:7588:3329 with SMTP id
 3f1490d57ef6-e1a42273847mr72517276.7.1724781853199; Tue, 27 Aug 2024 11:04:13
 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Aug 2024 18:04:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240819233628.2074654-3-swboyd@chromium.org>
References: <20240819233628.2074654-1-swboyd@chromium.org> <20240819233628.2074654-3-swboyd@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 27 Aug 2024 18:04:12 +0000
Message-ID: <CAE-0n52xg2ts9dm4cG1CmevrD0Gn8d9x+VvK8av8Fn8esoz14g@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sm8550: Don't park the USB RCG at
 registration time
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, linux-clk@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Stephen Boyd (2024-08-19 16:36:27)
> Amit Pundir reports that audio and USB-C host mode stops working if the
> gcc_usb30_prim_master_clk_src clk is registered and
> clk_rcg2_shared_init() parks it on XO. Skip parking this clk at
> registration time to fix those issues.
>
> Partially revert commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
> registration") by skipping the parking bit for this clk, but keep the
> part where we cache the config register. That's still necessary to
> figure out the true parent of the clk at registration time.
>
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Applied to clk-fixes

