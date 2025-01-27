Return-Path: <linux-arm-msm+bounces-46280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D7DA1D9A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 16:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7AF8161E8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 15:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FCE84039;
	Mon, 27 Jan 2025 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rHSHpAKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306B5757F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737992252; cv=none; b=J+ZBYrYWDJDLzaPRshOTX6/OTfndLBMDoTurYFpnMv3T68wXQox/ryR/cAYGt6IaKzHcnI+CgFiUnai55TbMIKnaI2EYMe5YepLcepUbkMby+jf0DUYjPY1gHy1hdPTtk85yGypDx75Teb2FNPuquberVuvRtE+GmOUS1/m8DUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737992252; c=relaxed/simple;
	bh=cTvk09PSYQB9TtyqH1fpl5qWYGIWj0FIXpvabNZi8bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEFyKVwv2hWMcwR30gTGkaQbgBdlY5blwyXk6KxHyEUEpePbY7o9swyJ8UZ4fdc1fFlSnySTGkmFXeRftzSmazD/eSTwuylpujIEvt/9pieWKORu7AEm1qYRspNtXRp8vu7QY3p7pfP9CK8E4iB2OZsd8nNLwK9wSjXFM6Lpl9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rHSHpAKH; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-540215984f0so4736375e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 07:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737992248; x=1738597048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kp6joWOCfUnMEoMEFY//lu58zajvf9vP13Wi5lvaF+s=;
        b=rHSHpAKHXeIU+FzV6sNWx2fgLzGDjjZM9ZYsacG0FH382SgjtDYQEDkaw+mDymf6iQ
         x4mGsF2A3kGOiHi7Qeqw7JxpYnLgTjY6KBYHgpKmy3z85f7CECSjaYoNDa110iUdMWsq
         ndUelcyQx5tt8CJhO026DpZqSxbJmldBXXGIx8HhRQEt22Nxybkzhux6eXRjdUGFmt1/
         TTR6VlA8OA+JH21eNL7UaJpnjUMLxgZ+fmvGoSKaMw+rsPEQaxCMyMD2Y+tJqr1RcNZQ
         LKIEmifHTB7q2H+1HjwpSganl+Clo5ETufTnNzqs5ZrgVBfVoUXAwci15r/cGPXW/sxL
         1POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737992248; x=1738597048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kp6joWOCfUnMEoMEFY//lu58zajvf9vP13Wi5lvaF+s=;
        b=tl+oD5di/KipTC/UibgwEwXQyMdriOV6yJV4gif5ijOrI6AGiTrqubdedacg2G8q61
         hCRBe2FgbxFaal/B7re2G+o6Pqo0qyqangGycfbW6ZM6H5mFW4tlJ+zILMdKpntWL7Qm
         jVuKR9lWXIueGW0mmPQ7OLFIIb1Kb7OKyJpZYv9Lg4uCtCc7yOTRFki5o29YZDA+oFYF
         2k45hkZrilFiohqo8BfCpRMrlykIZNR8p7G8+D/KrJMQzuWihAtkjEVkSCeco7YDUPe2
         49Ea0exJYmKjXaxCFqDMVerB+TTRmjx4lYQ/RHHj+4BM48pqqtmKynpxN52IhAXw3uil
         Qtig==
X-Forwarded-Encrypted: i=1; AJvYcCXRFXvRmPQPmoTdV/zdrcF686E/X60f+M7wbfoSxsHB/3N/MibZDBxhlN4WS1Y0ppYH7YphWWarzMexNWZA@vger.kernel.org
X-Gm-Message-State: AOJu0YzIxJE22+8YHYLg9YtT8ECDBdALmAsg6AVphStL6nrATHJ2ymE0
	rpk7Qsm0rsBTG3C2d/J/jD2VcQNBpVXFvJFlG5e4UWnDkyV5baebbtnKociWNsc=
X-Gm-Gg: ASbGnctX+swbxo0ARsMow1B9j7evyakIHRl7ntPYhqofMhi0TPxoWZLtaOfFa+QPfxp
	MW3e7lIldXc2mWmgrjE8CXqGrDJA5ILYrQgaztnlrE/+mISgcVw/soicN3gp1la7lx28q/Z0GP+
	ZGLO8wKS5MCW/FrYzME0dtfE3gecVSDIRYjUfcikUJ7otsmmzq0rxuit2/o11+4fSU1ufdQ0sas
	OvbfvUUnteDHlDA6nXiwGbMlwKNYgL3mEKnLSbyqEiB/Cmvd1yzo3C5xnfVNGTOQ/NURhhmmqRi
	tKSmBmKYsXaea91MhvNqViyyhEFgRiNY6NEUFkB4ZHqXMC60Y+vgjVf59mGT
X-Google-Smtp-Source: AGHT+IEHADuBWqmOkiOtEdrv8Nl9Nndbtt2dRQZUpE5vreZ7UXfdVOF8Uf+s3QdgMJEeVPJe5D/OBw==
X-Received: by 2002:a05:6512:230f:b0:542:232a:7b2c with SMTP id 2adb3069b0e04-5439c253ed8mr11907073e87.29.1737992248212;
        Mon, 27 Jan 2025 07:37:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8379a54sm1354270e87.192.2025.01.27.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 07:37:27 -0800 (PST)
Date: Mon, 27 Jan 2025 17:37:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 1/5] misc: fastrpc: Move fdlist to invoke context
 structure
Message-ID: <inwvzw3cjhpyyshs4brs276uv5nucqe3xpnu2jkdgaqzr4zbhx@vpz6ofuyktag>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127044239.578540-2-quic_ekangupt@quicinc.com>

On Mon, Jan 27, 2025 at 10:12:35AM +0530, Ekansh Gupta wrote:
> FD list is part of meta buffer which is calulated during put args.
> Move fdlist to invoke context structure for better maintenance and
> to avoid code duplicacy for calculation of critcal meta buffer
> contents that are used by fastrpc driver.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

