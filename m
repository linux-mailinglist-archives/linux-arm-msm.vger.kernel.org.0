Return-Path: <linux-arm-msm+bounces-41851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E958F9EFD6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 21:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF97216D1EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 20:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2581AF0BF;
	Thu, 12 Dec 2024 20:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uq1qERd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180E918FDA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734035209; cv=none; b=GbYIE6+xBVydIKjxYV6mi/cdmLtqnrQuDez19rh6XUc7zB36YXNBFl9v473ijV/G3mpWyYHJetbq97ESeDJRlAKMSLci9HiLeShTWaKwBGxtMXMlo/PpsDQ2M5khSJJJVuM0g5hWVJXP7WnqlS1P0qBCCyQz/a1Y1BHY1qdv5Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734035209; c=relaxed/simple;
	bh=SW5CnNui3R97mY2cLBPEbaMn7nNMtZlM3tT/CgKujL8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kR47WqjhdhHcDVM4DU0crmbrVbRL0kaUpvdowK76+t1oSsNWELJuCC1pqroYCZSQKOkV5fptQaacH8I5LtC4jMNn8TRDJ74SlNf5uBuUwP/O0PSRBVDtfPjszQRpKx5NvHRPwFdjQ9soJMrd4fjbUXS5z4eYdqTM92soqLmXuY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uq1qERd4; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e3983f8ff40so718448276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 12:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734035206; x=1734640006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SW5CnNui3R97mY2cLBPEbaMn7nNMtZlM3tT/CgKujL8=;
        b=Uq1qERd4gLzTGBIJiHV4+hpId7LNlDdbXmnMfA/pORylOP8hvTeu/LxzSF9lIwVyb4
         PzshsXUX3g0LpKyJjyTbcYBB+OxgpF9D2ptyRXycE2EAGGk6y8k0H0+PUMqa+qf/kT/Y
         saqwrYgmqa89ZC7vvPvvyh/+2keUBE0t8mdmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734035206; x=1734640006;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SW5CnNui3R97mY2cLBPEbaMn7nNMtZlM3tT/CgKujL8=;
        b=O7aW9gSP4Pn/XMLpNOuunvNC2MHoxx5rNEqfge09oeiaLZmIBUPKFc1GhlvXNV67GZ
         dklvZPvACApggnGhG1P2XACANIZ5fXCxWrXkDG7KIF5ObxfVhLgbfUCJcxHUm8O9gv1M
         cVYFOX2WvK0UPD5rSzgFMiNo0ksv0BgY/i9HJIZ9TQzfrk7kitF0Yt7GdDD5xOzqNdr+
         0iPbsmduVBL6zA3Ef9GLcIXJNizN3wY0r49blmkIX+poLw3fEnsCclPupbvxvc92sMrI
         +imSkTYV+Ec3Tdbk0/qdsHpJMQ0ms685M1Se70bxd8VXfCErnktteKXBKv7kzVSI4cX5
         9EFw==
X-Forwarded-Encrypted: i=1; AJvYcCVTUaHxwFWEmdeb+zVU/JAOWrPHHcublKUj9dYT7Ox1v3An2IXHqTkg/scC4IRyGbmxZ1iLLjT4Nyn56VNE@vger.kernel.org
X-Gm-Message-State: AOJu0YzRLGpBMLif0bAPSQPFAYcCgwpsH2aow5SxfCLwHSA60yMWbLGX
	1ECnyDvz3n9TXf69s7+ZzAvubzyJC9z5JU1H/4XF6A6F/9jHjC7cmoyrN57fZ698Cx0ELDIwOSf
	XnuJ6KQfcyAHUKs8v+5BPf5YMG2TcD2Jbs4cT
X-Gm-Gg: ASbGnctrEnp1q+mhPxkIdk+5mfAnvh2qtwbAMOLBKlyY2zzMS8WOcUUeW1YYzNc+n1l
	EJ5nsj09Dx6/igwGXzBdyPsFzPdwuSQVLhBqWvVx36KNpcwhup44yin89RDrPFBH64Q==
X-Google-Smtp-Source: AGHT+IGFOgDVm4CFDXe3IU7TrIeBHR0ltNsmIqxmA2AqNWpAHBHRWN40vh5Dhn/6yXzuo/xaxcnVD3/msC5W/xKQZns=
X-Received: by 2002:a05:6902:140f:b0:e39:598a:239f with SMTP id
 3f1490d57ef6-e434f945c4dmr88547276.49.1734035206765; Thu, 12 Dec 2024
 12:26:46 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Dec 2024 12:26:46 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-6-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org> <20241212-fd-dp-audio-fixup-v3-6-0b1c65e7dba3@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 12 Dec 2024 12:26:46 -0800
Message-ID: <CAE-0n52xCodsb94V2N5+ENsft81LvHrngTrcc=w+FSYmmXELHw@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] drm/msm/dp: move/inline AUX register functions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-11 15:41:41)
> Move all register-level functions to dp_aux.c, inlining one line
> wrappers during this process.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

