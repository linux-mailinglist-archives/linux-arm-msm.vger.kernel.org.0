Return-Path: <linux-arm-msm+bounces-43276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 527FF9FC242
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 21:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BF5818841E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 20:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E71D18E025;
	Tue, 24 Dec 2024 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q8RX17Fy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477EB17996
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 20:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735072871; cv=none; b=r3eZtLj4I/n4Ls33wJ/bJWehl2F66qfCo6KS/EEIhqgICMrGnoWmXycrt/ZYSW9gUhN3DqPAgH/Bhycd2yifMmKwFCQtvcRttazzLdWgZ3eycBXGgpBK/oSmFDbIiwdMwGMJtHe5KKfBJBoI6NDlEg+LkZ3oKF4N52hIEgbZOWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735072871; c=relaxed/simple;
	bh=az69JqeOyO7YGtsjoLgnus5pruCM4fW6+3Y+eqVzm3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUxfb+KNkP3RX26J6POMmZqTsur26+I0eLsIxQeyZYqrQ8J1U159OtYMz2m8QT/FXV2RiK3xAJVmMlFJxXIxjuzuHF6HI4xEjTULFdXccutCr913HbOJw7ZHsR+xZUiGupjkxqgXSMOzg3ZGHMC5fHJleMNA3UZD8DN0i46z4ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q8RX17Fy; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3003e203acaso54793871fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 12:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735072867; x=1735677667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=013fQ6OlJ/C1u33CS05E3QkAEu35dZhHmucAOsh3zcE=;
        b=q8RX17FydOQsFfbGpvBkLuEsctm9MBJtASvhyx2PxAAyOwbYAC8ssRRq8j50QSVyJJ
         J+rLbsBTLaOMU5UWnmAWz9hXOSkTQLD30+dS/R9ZCsd5YriKfINblUbZ0Faz49+ign6I
         DNh37q4Rjvp/GvAzgtMnV0tNaYjKCepN0m5p6ZajYpZ//ZL6GFgRWF3WOt0fkK24exFk
         +wOdg/XSJQ92Apu4hgbxfvP3Qiyqw4kmUfrNxo8G32Go9F/wM6hkanXymGU46m+KEtOW
         RRzG8f/yb7Sg2rhcJ6DDpcXWQ1Iib8oo8pb+lhGDedYuuXFm32RdTLqXJGX36PKmow5j
         HIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735072867; x=1735677667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=013fQ6OlJ/C1u33CS05E3QkAEu35dZhHmucAOsh3zcE=;
        b=iowQbJXakdk36C7hBA6W/gDb9qFFsqmwKCT5f84HipEik1rkmXKjrL9FWiPAaT8s+u
         1ozGuN3+4syiyllyGF6cWicATmXNmmYx1U4ZIzHX3BYwpwEVMj4uCquUnRPQrp9GUCcJ
         fSqEmhz+1fDwx4CBJHv16mCeqleL8VDUtao1xsAd5dogvJuznwTn+DbIVfF4KgxwFYzq
         1haVTxwt/U3XWQnHZuI3K1QE+Io09Uq4bMHD6HI9AnF09E024xlwC6YZztQh6NCvEjuH
         51DK7aQCep9qzfK/y/HMPW+nsKjiGk5WPOdbW60srRytU0alzkDUoY43kLTuUid6RJaE
         v4Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUHctnQcsPqER6qI7mGbmo/XeHPCqKNdxwFZrvwEvjWebM7sFZJa5JWm9BbszRGQUcdr8QWk61oiRqzbAit@vger.kernel.org
X-Gm-Message-State: AOJu0YwnjG9eXseyIJmajOzRuF3ZywMxoPGHM4LVitkj7/h0FRvip7BU
	p94mZa6gmajXWCo/trNrZgti6ggBTNmT8O2RDV9ceS2q53IsJYdkyG1roDcF4l0=
X-Gm-Gg: ASbGncu3hgLkj7CDMHFSXKe1omiwQUyJsxDUUSaPy1rk0RGtiUI07wNB3tnY9dzaUdV
	6DaLMxx4dbU/fYa6wG0bvGUgbsvj3yy1twBt1yxu8hItiace70PbNWzhMCxFqmsmkKDZxJjHXR8
	YEdVtCxlfxz3G3gAa0AQ5uJh03jBm3AfehpuTq25q4BBr3diiVvqXU9hYI7h5j0tLpKeAJcMt4i
	RWSH1PNTXmwE6YLToAE9LXu2oYpbNRiwCyMGlLQJiS58f/n5OR5BCuyzNQ980NnT9MrNACk
X-Google-Smtp-Source: AGHT+IH5+6vfwjy4BTw9YCLzcbedK1FJ6WQCRricdTAApVBK2Uzvp8laNd8QmgHwa+lXbQ8/PXrF7w==
X-Received: by 2002:a05:6512:ba6:b0:540:2122:fae9 with SMTP id 2adb3069b0e04-54229582051mr5745971e87.46.1735072867393;
        Tue, 24 Dec 2024 12:41:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 12:41:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix -Wformat-security warnings
Date: Tue, 24 Dec 2024 22:40:58 +0200
Message-Id: <173507275852.561903.13981702571183938186.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216083319.1838449-1-arnd@kernel.org>
References: <20241216083319.1838449-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Dec 2024 09:33:13 +0100, Arnd Bergmann wrote:
> Passing a variable string as a printf style format is potentially
> dangerous that -Wformat-security can warn about if enabled. A new
> instance just got added:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function 'dpu_kms_mdp_snapshot':
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:1046:49: error: format not a string literal and no format arguments [-Werror=format-security]
>  1046 |                                             vbif->name);
>       |                                             ~~~~^~~~~~
> 
> [...]

Applied, thanks!

[1/1] drm/msm: fix -Wformat-security warnings
      https://gitlab.freedesktop.org/lumag/msm/-/commit/49c2e01be19c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

