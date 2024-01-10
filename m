Return-Path: <linux-arm-msm+bounces-6991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73A82A514
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 00:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDC7E1F217D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 23:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87874F8A2;
	Wed, 10 Jan 2024 23:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bmo+oYOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8401C30
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 23:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-db3a09e96daso3895054276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 15:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704930648; x=1705535448; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IY2WHo656dlJft78J6VUeykbQH3OBUSeMuyIpTpTn1Y=;
        b=Bmo+oYOSaJ0xZ16vSCdSpMyXzm5gawk84S0rDaHGmBG6nUqLh2QUliuy/Ciwl83hfZ
         pOwx76LQFrCxRdc5aenk7sW2+2w7NI7H5y92f371xaoNUrjWkIseY+Pi6gC1PgcSRbhO
         AwQKiQAAYspqERWNpNBloPKn76f/xeX96UWsgUGaE+Y3pUErP9noqI13bJIBY6wcPWnP
         Ezik3MyFwNqgXxgar+teYEw0oHMHciPou675m9qY73vo9pr+j52mBWbzD5kdQkLlsTku
         N1ByQ32B9VZO/g3npNTkWo7gljN9J3Yttty/1ngd0qcwhZ8PohWX3W03uTG7X1D3TNZ5
         vepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704930648; x=1705535448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IY2WHo656dlJft78J6VUeykbQH3OBUSeMuyIpTpTn1Y=;
        b=foLXqfSVNS0M2lvVcoZcRFg9aNMoymTVbZpJLeEE95u/3Ab962x3UllmV+fWyTnhGx
         FZseLtdVvmLNuLapr//xO3t1s/EZRPmJU9HDgDOdapSJ8dLOqVEMVjq2ZK4ROD9tCc/u
         Dj7Np5jyBLDTiGf3MvDvSDQckad2zjGE2u7S2u9Ptrx5Ba03xpFKC/WJWcrAfKXoTcWK
         GUYlRB7WqUohhjKGZ7KzYz/nyqTp9P3221wn1aXWl3IWTJAGkXOOLLfUxPrvvQ9jAr9O
         kQ8yVwfySyMgoh39nfpH20W7d73/b3zfxmVzkwnBLp1ltsPAWxWPXpe3LItSgJ9ob2xq
         xJ+g==
X-Gm-Message-State: AOJu0YyhGNrb3jWP6nYY4aeWtlCT0+J5sMK9zgKoqq0u7ZBRN55nPr4E
	bTQwO4dYOrmch3tIPj+sHx4yTk/qffmTz3xTAkXq4dCgRNkPLQ==
X-Google-Smtp-Source: AGHT+IE0M9W/0P2Ae6mYe8PCrJ9dMKg+/Sc+SJ/3RpX4hnY2c5YNeNuY5R4SrTJIFAZOV6C8lq2rU9YH1tu7XsHEaA4=
X-Received: by 2002:a5b:651:0:b0:dbd:b17c:802 with SMTP id o17-20020a5b0651000000b00dbdb17c0802mr409911ybq.52.1704930648185;
 Wed, 10 Jan 2024 15:50:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1704917931-30133-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1704917931-30133-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 01:50:37 +0200
Message-ID: <CAA8EJppcsQtS7h4g+hK+sss7pDuvKjkJX1o7_DUO-rTg1BtWLQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msms/dp: fixed link clock divider bits be over
 written in BPC unknown case
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jan 2024 at 22:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Since the value of DP_TEST_BIT_DEPTH_8 is already left shifted, in the
> BPC unknown case, the additional shift causes spill over to the other
> bits of the [DP_CONFIGURATION_CTRL] register.
> Fix this by changing the return value of dp_link_get_test_bits_depth()
> in the BPC unknown case to (DP_TEST_BIT_DEPTH_8 >> DP_TEST_BIT_DEPTH_SHIFT).
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Additional note. Since this made me look at how DP_TEST_BIT_DEPTH is
handled in the driver, I stumbled upon dp_link_bit_depth_to_bpc() vs
dp_link_bit_depth_to_bpp(). These two functions look pretty redundant.
Since the former one is used only for the debugfs, please consider
sending a patch that removes it for the sake of using the latter one
and /3 in dp_test_data_show().


-- 
With best wishes
Dmitry

