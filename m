Return-Path: <linux-arm-msm+bounces-3114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F88022BF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B06B2280EEC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B159B670;
	Sun,  3 Dec 2023 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="brhfVVP8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C444DFF
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:36 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bb8ff22e6so4838728e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602795; x=1702207595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILn7PVh6aYBuIQEV/pLqqVkkuCaezFiyrMqK2tj/fnE=;
        b=brhfVVP8SVb9nH0FP4F9IFOEaEO5AsrfdO9VhoUFPSLnlk8FiKMWIlYOLcvoahOq4u
         UdLQ2n0pUCEaMn/ktghUFyCtNsNPM4atJPNcpoceFAegEDOLzldQXJWXOYi2VOYP4s6K
         0cy0AxeN4WrJC104LOWwnQnsuFuoO2sC40zxMcoD3OQPkhlTL7KPeqzsVxn/3PTep5tt
         j4uBJ/2hN6b/qh98Or/lnsG4KU9/aRZTM/5j4J2jw6/2ZEHowwK2iPs/ASInwDXIS4wl
         b5UEZ7dEHHi8FvOwC0DnfQLZN+4hYD+/R1NdMQWQFJ5VBwxjlGvU8O89inXDZsAZ3UTK
         Qa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602795; x=1702207595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILn7PVh6aYBuIQEV/pLqqVkkuCaezFiyrMqK2tj/fnE=;
        b=uE4oA2Ph4WHGUZ7ulwMdVSO2TCeHMc/9IKigyeIuob02+WZjQfc4INkA59eIrsbWUk
         795sZOHmDm4rA6hNszZeWZM7SG4GpRzT+dPM5MtL+48LzgfxCJAnnGf0P1w/06I6L/9K
         hA26MQlm/HTdQ0/Y7iPSSGNSMwTth7pfuvx0ZFkCPIJj4dJUw8DtOxW4Jz9wsk7JxKna
         zcwAv7noyOta/CeS8/cHIru2KiEeE1phc6YDYG9ixXq3SDNTLUamtjfCEYRHO8ktyVjN
         XGEji6vwRo2acKAzhorq51mFC5NDGkhTK7HJIgAtAYpJ4k7Xq58W7xJ7IItLOpinojOK
         CmQQ==
X-Gm-Message-State: AOJu0YwStFPg0axuAaNfJrCK0zdfHO7eTm8Cxu8/o2E7c5PGAFsg3RBu
	vkNrCfjdxDWDWJ+Yi6ntBNzi/Q==
X-Google-Smtp-Source: AGHT+IE9COw1Y68kTBfxxsXnuXRJ3h2E+eC8l9YxhsjXV/OdXFAs/7OMg0yg+x2mIKvHKolp2c/eUw==
X-Received: by 2002:a05:6512:2812:b0:50b:f0a9:1e3e with SMTP id cf18-20020a056512281200b0050bf0a91e3emr557443lfb.3.1701602795005;
        Sun, 03 Dec 2023 03:26:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dp: cleanup debugfs handling
Date: Sun,  3 Dec 2023 14:26:19 +0300
Message-Id: <170160265546.1305159.14134248616774170208.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019104419.1032329-1-dmitry.baryshkov@linaro.org>
References: <20231019104419.1032329-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Oct 2023 13:44:19 +0300, Dmitry Baryshkov wrote:
> Currently there are two subdirs for DP debugfs files, e.g. DP-1, created
> by the drm core for the connector, and the msm_dp-DP-1, created by the
> DP driver itself. Merge those two, so that there are no extraneous
> connector-related subdirs.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: cleanup debugfs handling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ab8420418c2e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

