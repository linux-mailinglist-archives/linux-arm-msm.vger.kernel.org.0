Return-Path: <linux-arm-msm+bounces-9539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8111384702D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 13:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 173921F2A7AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 12:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355A2140798;
	Fri,  2 Feb 2024 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8dVIt/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12305140795
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706876582; cv=none; b=Vjowl3rZgmRrVcUPogrzTaaEl+jbPpBdI5VjOOa5bIxkdwB1+2H7/rgSEW2PWHe/BHMBPcob4BraTjJPojkX7SSVweReBTwKn6zarGBQpiRXlnfDo63y0UEf8g+5CrDzOiw/X5OjuZBv4bwbG88grNK8ZckEZHThFoRxQVh7i1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706876582; c=relaxed/simple;
	bh=Y0RWYNQXBIinllb5znkEPLKEIYhubG57soevcgTM65M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HoO2xMNnbx5vmDnA0tUtbqlN8XLirJn9M038iokfSYoE4sptxhhiHwJqDQtN9haxCzdwbJ2lqXrmgSyD1aSY2oCa+Efy1QmSL7dChPGvlnYDr8+HNIEUeTVs3AH42KPvMChDcg2F/7CKkmY9t/JKHeNh0ScrC8LMDBoqkDAwf6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8dVIt/Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB2AC43390
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706876581;
	bh=Y0RWYNQXBIinllb5znkEPLKEIYhubG57soevcgTM65M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Y8dVIt/YwBfzp0ABSY7V6f3z3XJI68LAdzWKtBi3eigE2/HW++dM4nvXTzlznLoUV
	 fEOBxv8ys3amlCFV8eHsh78dgTXcStJJ9+xoll2B9/WT3XqiOQis3RTbtEpOe8NepL
	 /l1ZmxRaL7zHhX3QcGZoZv8p3hkNNhA17gcCnOjSVw4iWFLsDcNpfeYt48apCfSJgM
	 efuz+rU5Fn4ggEgRfGDu6Q98NuaJJ1zmh6oh6Q6qTFUfpcU8RlXvFtFxS5+X1nCGh4
	 Wgd71m3+hxddCN7yDkNN2QUn/+s4rEEEfqiKGnH1OxlCNy3YzJaa0OXe5kq55o7FxC
	 RqvskeW8fbS2w==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6040d0c9cf1so20272007b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 04:23:01 -0800 (PST)
X-Gm-Message-State: AOJu0Yw5FQlsDLq8brkUs2H9U3L6Q3CL1ygJTC6gYdlhEJu7yueM+ZQv
	qkpwo1G4IKqq9UlPS+D5OQ28H0j5f8fNzzNy3NWuyxuf9W6lxvo/ewq1ophTRym4NbQrZgCGJVi
	9YqEMORUKA7GrFCQFL19g5KN4Ems=
X-Google-Smtp-Source: AGHT+IGOzi8yjjcR0JvFG7rQ/Av6xeI4XTKjHIoT3mcEudoUigktG14VMDbV4J5XP/4AFVIPV5sCZ913D1Y1NuCX3XE=
X-Received: by 2002:a0d:ca8a:0:b0:5ff:bb43:2a69 with SMTP id
 m132-20020a0dca8a000000b005ffbb432a69mr6763584ywd.40.1706876581010; Fri, 02
 Feb 2024 04:23:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <465420cc-c40e-45df-9cc0-80244fed7bf4@linaro.org>
In-Reply-To: <465420cc-c40e-45df-9cc0-80244fed7bf4@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Feb 2024 07:22:49 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4Pse4fJHG47XTt6jLZr8yqbdmneoOobb55ybxQeoMANA@mail.gmail.com>
Message-ID: <CA+5PVA4Pse4fJHG47XTt6jLZr8yqbdmneoOobb55ybxQeoMANA@mail.gmail.com>
Subject: Re: [GIT PULL] Add Audio topology firmware for Qualcomm SM8650 MTP platform
To: neil.armstrong@linaro.org
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 8:35=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> The following changes since commit 0c40df810685c15141413cee5bea7233e1db43=
fb:
>
>    Merge branch 'consistent-file-spacing' into 'main' (2024-01-24 16:42:1=
7 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/neil.armstrong/linux-firmware.git sm8650-mt=
p-audio-fw

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/134

josh

>
> for you to fetch changes up to 85d372744a19cf78f7437c6027d7037baa0f0a52:
>
>    qcom: Add Audio firmware for SM8650 MTP (2024-01-26 14:31:24 +0100)
>
> ----------------------------------------------------------------
> Neil Armstrong (1):
>        qcom: Add Audio firmware for SM8650 MTP
>
>   WHENCE                          |   1 +
>   qcom/sm8650/SM8650-MTP-tplg.bin | Bin 0 -> 24296 bytes
>   2 files changed, 1 insertion(+)
>   create mode 100644 qcom/sm8650/SM8650-MTP-tplg.bin

