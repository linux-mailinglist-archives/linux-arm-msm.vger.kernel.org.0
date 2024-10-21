Return-Path: <linux-arm-msm+bounces-35238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D27769A67ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8899E1F225FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B981F709B;
	Mon, 21 Oct 2024 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gdi4SvD3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28711F4731
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513072; cv=none; b=T2mFSHciBw+nb6VEDy5NXxiJdPO833ucUm11oqHLHfERa4c4WFJkLuj1leMPEZYq/e6OWv+25sk+0Kpu+gaX6dS8VF4JmdjqtfXescn7QXf/rL8PKSC+trROOxCUZ5vKcyXWDgTR9P+jZoobLk54K2rvKvZtclzpiyL1sAbzxAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513072; c=relaxed/simple;
	bh=Bk2N6mWyb9VwBpvSkQFvVLAPHcEmjUsvtHxjFnzzpz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RL2nrVLf15wYfX4olXK6eBgrG1nSRtNkYpaXHWqQ/6iDpQUm9LlwZyIZsg19mpDvYLXsGkP0weKzCwPiQY2kAnub0hR5izwncLsh1UBETT0/zOJrAcieWli2NycHVXvCyYxGWrg3g9CfpBDvFLL+cFw3i6jjbHGCmE3x+/uf8eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gdi4SvD3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e4b7409fso4402809e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729513069; x=1730117869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZF/QY6lgKCZozlrE12q9Y4uQ6tVQUtMhzEdEOTrjAI=;
        b=gdi4SvD3pazS2fj5ciMrEX7E5+IasHIartaHPAKAKvjtrt4X+eDO3cniZL+Dmzra2w
         SfliB7g6CrX0mDQ+0cD38r/0iRLV7G3WOcf0UU/IEiKLHEASPgA4Lw/8Qr7Rf3K1Z7nS
         4r64ej5kguRbDRTLRF0VooRiQT49F22LCQ2Mk3TKom1762tRmeqcjVCgIZ4ygBG1mXJj
         rHsouymgHmHTzS9n0MpSLUuRj4k91dBm+sYaLHX13LP6Rr4YWKzyTvB2xvYdYGX+Y5qW
         8fWZ2QdH51W0l9E3I2EiLPTTnIF/Cg+BzgjFkEiWGOEFnY15b1XpMtBIZ1XKrNGLJuE+
         VoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513069; x=1730117869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZF/QY6lgKCZozlrE12q9Y4uQ6tVQUtMhzEdEOTrjAI=;
        b=LKukokv3fJGG590NxqP4SbTlDLx4Cp6Uwwty7xUYdcF9m3kmEPBQunx1vqD2WylSpe
         HGvsrBLI7F7j7lPwnDcnz4KfgI2zITfYbunHkVC9KQHVLtBKBrhFIZwNlo/TSTXo/E94
         LoFN98kaMPirILGS0S7JSVP77omdwfN1+9mHXSMbvgKKLfPQ53U/k9q1IjIdVIg6QLqY
         ZXt2QWY01pVF2eupq5951yJR+U+OuAGMQk/C4Tl8W7HTOacjZrrb3JymxJuwhpytlamV
         HajhDcsl5kyDAtggrcruiEhiwMAg98FAPoVgrYfATlnj/9f1LPan9X40FxaIOjpSlNvJ
         rhmQ==
X-Gm-Message-State: AOJu0YwhlHhUGLqjR6efaKuOlyqCb3/lfNjyjDBA+JvX1tOje4V71fGi
	hIY4BlJNZFQFRgUOwfGH40L/VUvSwth46ZOjtGmYowvwgFsQp1LtQoyQwN2IVaE=
X-Google-Smtp-Source: AGHT+IEp7b9dHlvPptGyKtr826kptA0YP++LFaH82xrCED22x7jik+ibY/CFrIq5TZveCAvHnhMo+A==
X-Received: by 2002:a05:6512:1584:b0:539:f84d:bee1 with SMTP id 2adb3069b0e04-53a0c6dbb2amr5752157e87.17.1729513068790;
        Mon, 21 Oct 2024 05:17:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:17:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Sravanthi Kollukuduru <skolluku@codeaurora.org>,
	Rajesh Yadav <ryadav@codeaurora.org>,
	Archit Taneja <architt@codeaurora.org>,
	Jami Kettunen <jami.kettunen@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [PATCH 0/3] drm/msm/dpu: catalog fixes for SDM845 / MSM8998
Date: Mon, 21 Oct 2024 15:17:38 +0300
Message-Id: <172950935861.2053501.17445989059295810521.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
References: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Sep 2024 06:26:12 +0300, Dmitry Baryshkov wrote:
> Drop two extra blocks that sneaked into SDM845 and MSM8998 catalog
> declarations.
> 
> 

Applied, thanks!

[1/3] drm/msm/dpu: on SDM845 move DSPP_3 to LM_5 block
      https://gitlab.freedesktop.org/lumag/msm/-/commit/768a272d5357
[2/3] drm/msm/dpu: drop LM_3 / LM_4 on SDM845
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d39271061d67
[3/3] drm/msm/dpu: drop LM_3 / LM_4 on MSM8998
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c59afe50773d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

