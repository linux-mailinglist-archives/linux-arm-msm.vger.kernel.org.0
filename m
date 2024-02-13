Return-Path: <linux-arm-msm+bounces-10919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BAB853673
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 17:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A7DD1C214D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 16:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A19E5FDD8;
	Tue, 13 Feb 2024 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TS99mw1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1E05FDD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707842784; cv=none; b=cwfIcNI56CgX0TgEQoUOMd5lQxzzynh6RTP0j0tmdcq5MPszs/+2DU6C4nIN2tRO6iqIDnjsXz4+P4uuvDZ2HCxlAvbuF/F2Fo4oB0ohKruxfV3fYmT7mDUNMJYcunwZoDWZs4Q2fQ7BG7yrrk4AxZ/aoGP+VX67yUU73pu29u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707842784; c=relaxed/simple;
	bh=qLwyUT1WDaJkmtc1ktAdhzGZdAoIw9Yxyb+2sQS97nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpnYKtZoHuMIWUjZlfMXO6tp7RSmd7YRvlmFkQdv2CK0lvlpvsrOKalOV0Q1XNordHvaS0bCUK1xtDReBSFSROP5DEH+0c+0HIGLyrGqKLQot84317US6hBnB11xJf+e11A9XVEP+QgaowMDz+YdgsnA85jjKpRVKJOsBHh0/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TS99mw1i; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6079d44b02bso2923717b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 08:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707842781; x=1708447581; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eoJh2tr4FRlgildwrsRsaxdcgRdL5qVvqZCjhMVH4Ko=;
        b=TS99mw1ivCob+GNJBKb8uCCh9sAf8omFMpCDfJTy7W2v8sWUeRJP0vz9g0ikOBGMM7
         GNuV/P0bTEca7+OlGy5nXSXig++5DVaK1olldsBDOcEohAHims2iFOvR8PBF2ooleiR8
         CKYWYZKW80AdEH+047+ZpD5/IoAGtzVIVhVaHEHetbhs2E2sz3+S51aAuqON1+vDs+Ry
         0A+kvl1bzZzAXUspvpm4aBXiPxa5p2CXC41Swnr0UpX87MTl5ovsjfeMSJ27tLUP8EF4
         J0B8XZhp3rKZ4dezyxjEaisFc3kR9vpO9g3aM+LFoqo1zM23MVqEh0Q4Ug+qKAHdW8qV
         4V2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707842781; x=1708447581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoJh2tr4FRlgildwrsRsaxdcgRdL5qVvqZCjhMVH4Ko=;
        b=hAMKthbRXrcx9BuM1NvBuYGQMFrm+YSDB8sHoomCiFsOA1eloBn3oeXgRT23VKhvYc
         TqB09N+iaG8Fu4isLs3FuDe1yoOEqzMv1AMt4reu8VAY7Oq0KCQ2vGjUeEt24DOi6g/I
         yDOk1oyUNuwojAmaCXH/+YXX3RGAJ8OT6+Bp1J1KPRW8ihxK3JE6yCFN6JBOdaWbIh0s
         rSMOE6P3z8f80nGLxpADrK4P37BNfqbSA7T6CK0vv4soQc1jy6igG1tQAJk9v6UIX9v3
         /1bOgZtXEZyE6m47A9p+uvf3/yccck7Vrg4om0DiEPXjEkhtI3ad5vZOo4k1qfkigK0F
         ML/w==
X-Forwarded-Encrypted: i=1; AJvYcCVMKNefm7wq5WfPPSGdLfyHSOgQSZGpomABe7dgiXTQPYBFVJG+nR9WC24ShGo+6FfdxTFaaCk/z0XQuUiTSQVE+T0D9F3Cou/6okGFvQ==
X-Gm-Message-State: AOJu0YxYrq8Q1qNVdo559Ucw5Q5bqTUPIwOAC6HU923hi3Ckv+boXEen
	b5qxepexnqysk2pAOF3VQ62U6prEcGTkf8y/ur3JBmF/f1uS4bIo1vQVb4MnajcKHj1tMyxV6Rb
	AX6PxQxyPkBlIUFr8l40l6f1ExQbdYg7+myf1dw==
X-Google-Smtp-Source: AGHT+IFRerUNGbTgBU3wwf+oG/ehW5Ekk/0QwzhAC8Xq9yczIGeKWYHJlcAKuGRj+5ja1rh2Bcscw93PtgyqvkaSKmI=
X-Received: by 2002:a0d:d382:0:b0:604:7b9e:f622 with SMTP id
 v124-20020a0dd382000000b006047b9ef622mr6848335ywd.30.1707842781524; Tue, 13
 Feb 2024 08:46:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209160934.3866475-1-quic_jhugo@quicinc.com>
In-Reply-To: <20240209160934.3866475-1-quic_jhugo@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Feb 2024 17:45:45 +0100
Message-ID: <CAPDyKFqjnsF44YRgr2vvdfWi6P9FxPuNkgfYFKbPWqECgY_eeA@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update bouncing @codeaurora addresses
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: adrian.hunter@intel.com, ritesh.list@gmail.com, quic_asutoshd@quicinc.com, 
	quic_bjorande@quicinc.com, linux-mmc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Feb 2024 at 17:10, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> The @codeaurora email domain's servers have been decommissioned for a
> long while now, and any emails addressed there will bounce.
>
> Asutosh has an entry in .mailmap pointing to a new address, but
> MAINTAINERS still lists an old @codeaurora address.  Update MAINTAINERS
> to match .mailmap for anyone reading the file directly.
>
> Ritesh appears to have changed jobs, but looks to be still active in the
> community.  Update Ritesh's address to the one used in recient community
> postings.  Also Ritesh has indicated their entry should be changed from
> Maintainer (M:) to Reviewer (R:) so make that update while we are making
> changes to the entry.
>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> v2: Change Ritesh to R: per Ritesh's suggestion
>
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4be2fd097f26..56b3311e51de 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7832,8 +7832,8 @@ F:        drivers/media/usb/em28xx/
>
>  EMMC CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER
>  M:     Adrian Hunter <adrian.hunter@intel.com>
> -M:     Ritesh Harjani <riteshh@codeaurora.org>
> -M:     Asutosh Das <asutoshd@codeaurora.org>
> +M:     Asutosh Das <quic_asutoshd@quicinc.com>
> +R:     Ritesh Harjani <ritesh.list@gmail.com>
>  L:     linux-mmc@vger.kernel.org
>  S:     Supported
>  F:     drivers/mmc/host/cqhci*
> --
> 2.34.1
>
>

