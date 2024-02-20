Return-Path: <linux-arm-msm+bounces-11947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7681985CB9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 00:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322B6284402
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB794154445;
	Tue, 20 Feb 2024 23:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QfMqzgW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B915443B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 23:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708470068; cv=none; b=KymDiH+HJ9yyelTEvYaeVIASg61MBE7ZzNw1/8Q81ak5MGh6Ejr1ApNGCcxZmWx1TOEsBMgQYj3VKQDf1jAF7+UczGYJz7wk5FwjrpUWWzlA8oxv7+TGEuWjC1H+d5jMeZ/YZAlBra0cx/c3aNkbWf3KWIlxpZSABKaP2qFefcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708470068; c=relaxed/simple;
	bh=ZH1Shcw7u15ZCG1t+CtfsAPJrxf9hlxF4UYzNdDcnpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqJBsjA/3sUZB+ShmTQg85ivIVg1549Km64aNtW7+2p/0is9k7LPIUCSj6bB5eqkAaMH7sUOOaRzl33CDyTkhWHRYvj5VIIoMyUtMhi/eTSYioBwfwj/DJ97wlBJEeol4nqXmIjlbH/G57MGY1uEx/0F4UGqLCBA3/0vzwfIzAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QfMqzgW1; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so6196219276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 15:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708470066; x=1709074866; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U2fn3Q8ysQNGsP4/bFdrwVKI00s9RBc5Vo0obuiYfWE=;
        b=QfMqzgW18qcN/x/LbG3APkh8Vk+cs0hverVKQw72SfRnKZqXe93r88Ju5vqPGEX1NS
         QiFgYzy5wuu7Z1/udjIJYU2EJxbUAkCNH00dfeU9tJx/zumvz2duiGTMBd3hxo1qbapZ
         sEwVdCp5PqAqO6coaJglrMEQ71GkeDjMmUv9P93iZvpYD/SrC2difZJkkNUSJE25z+tw
         e9ExfuPKFMtGU4HKKv2Cv7VPJeKa7mWjZj0XjdygqnZzCCoS/i//5m/VzvOC+NcEiFdA
         tYJm+8UfK44aBj0duCAC0g6f7yUlOk798V+SrJ8zSeEnH6Gl8JD64xwoQeyZE1UH1P/0
         RLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708470066; x=1709074866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2fn3Q8ysQNGsP4/bFdrwVKI00s9RBc5Vo0obuiYfWE=;
        b=NXBGI77I6LJNWNtkLaajisTtFAmNweAq7Wbh6x/CP98CFGJN+VkEn0ZriUJSgmbqkX
         nbgpAwWovv3VlbMMpltlgZLJ1U/9cpdoVjcNfzJNtDM0yrnVXqlrTUaRDF8Skhm3OgqX
         1pwn6CqH9RGOAIGPhnilahL0YJmNY69Djpf72MGbp8Ew1Mp5JDoocEBnAg+DMfGRy4ai
         4IZjnyfPr1miniQXqreLAFqVB7Wc70ms2WRVmANvRRL4XO/JykwwuRkwqtT5pFpColLQ
         K9iRoL9LkubLiz08N3UA8nXKNO9MJ79Emamk/tWnfqAe0wlUt6yfD9qfG8unEO9VgATi
         YABQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk8jPXU/7ei6zqdT21fiAd7MllmkDQamZmKeVYMFeEaunxhPK5pMj7QFemiKFxe4k0TUPQS358jCu9m2G5jFT7GEY1l7xF6kVDfBoVQA==
X-Gm-Message-State: AOJu0YxRYvUdi9i87mezO4oKEfrsrCbKiiNTXDrdEIbtdDRkvAGMgrXU
	3sFOWkKBsfi1A1NmGg4uuOF9iLw8HMwxm2ZOgjv3/63m9cpljfk27fcfgstmUbqIFuLhZst+mvD
	Z1hG+Rqzo6THbiUa7CH21lOYCxtQytMMzuc0FYg==
X-Google-Smtp-Source: AGHT+IHF4X8wKExd1/pvj1ol/XkM7oZ8gVoH8+BQhl5KQKK4+h/fjqShZZcUu2zwUnRK8rhG/TFZmoyPRSTuQf9Je84=
X-Received: by 2002:a25:8a12:0:b0:dcc:e388:6db6 with SMTP id
 g18-20020a258a12000000b00dcce3886db6mr16240782ybl.55.1708470065975; Tue, 20
 Feb 2024 15:01:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
 <20240221-x1e80100-display-refactor-connector-v1-2-86c0e1ebd5ec@linaro.org>
In-Reply-To: <20240221-x1e80100-display-refactor-connector-v1-2-86c0e1ebd5ec@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:00:54 +0200
Message-ID: <CAA8EJppgusQObCgmtG7Sz2tLiQziyPy71Eq7ru1=VmOaTZE9og@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] drm/msm/dp: Add support for setting the eDP mode
 from devicetree
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 00:50, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Instead of relying on different compatibles for eDP and DP, use
> the is-edp property from DT to figure out the connector type and
> then pass on that information to the PHY.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 11 +++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 19 ++++++++++++++++---
>  3 files changed, 28 insertions(+), 3 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

