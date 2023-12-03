Return-Path: <linux-arm-msm+bounces-3121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D26B8022E2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA41280EC5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D14C2EE;
	Sun,  3 Dec 2023 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lchwMtZr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE469B
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:43 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50be24167efso1569845e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602801; x=1702207601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDvSSyhIogsacvQW40yMxNj+Caft2xG+QOP3JVD4tRY=;
        b=lchwMtZreLGThhoWbBgjpK99UDs7tTWCMpat4IjciFU+kPWYZZLqWPuqjt2iiojFr4
         Di/MgHJ6iXAjt99xyLCLO7QYbSghT0bl8E4KFBdwLEIdXWUADbLVXY5YqWXn2iIqLBXv
         1J87VERD5uvxMD+hgmnVtKYK1RN/sBWda7cuOEguDOPBoy/GjH6NBqdv2Zw1qrN4JCPk
         r6SseDNRECe96pGbks2zyrWZlHeUsBCVH+kkkKEGZW2tkPykF6ZyEqDekjSSxbH56Gap
         BtozslHtpvmm40n8WISZvwPJH96u2MYduj3xibP12Sbk5bGTDt2xjwkyMOnrHSUDp5Xt
         dczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602801; x=1702207601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDvSSyhIogsacvQW40yMxNj+Caft2xG+QOP3JVD4tRY=;
        b=XyC9bOyC+q3yeubA6OHmuoh+6X+8i48vquHcbEjPnkwY6baijOAa0V0AVzp63wDxD5
         dF207n7KvMVTqo1fMYF4dP3IO0SINPuLmIHxDMsPouhSH0jh0M4516AA2l4nV2F0LFM2
         NCEeyVweDw/RUVaEhyRrInL/B99ZZOIv7nZjhlQD3TnAHLdADbDWB7chR3uYHlRns5kG
         gFlYLlJJWf2SgTa+YMdfyTVu+x5pmoQrzFAYSPfgo/DReeU1X7b/B6MaIb6tFeaGOw49
         GN72s4HL1VafS6CHNAf86/lqyCl/Pq3NMbaJthBeXA0nbSvS3WsOZDH9hw8E+6fIf2mn
         GonQ==
X-Gm-Message-State: AOJu0YzPGwAkUnjav6oCT+XLfb9axycI4AnWjtpi6wCx8YIAABz3pMdE
	l30WOpksmlTv9lftPisnOftbJQ==
X-Google-Smtp-Source: AGHT+IHeQWsaMBnunkzlkzcMxwXy3zyg7txAp2V9eKonjJ9riO+tx8XwpNeNPJTEU8JMafH3go4NbA==
X-Received: by 2002:a05:6512:10d4:b0:50b:f04e:6629 with SMTP id k20-20020a05651210d400b0050bf04e6629mr180503lfg.224.1701602801775;
        Sun, 03 Dec 2023 03:26:41 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org,
	quic_jesszhan@quicinc.com,
	quic_parellan@quicinc.com,
	nespera@igalia.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: enable smartdma on sm8350
Date: Sun,  3 Dec 2023 14:26:26 +0300
Message-Id: <170160265547.1305159.4757803162001385229.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908193314.27008-1-quic_abhinavk@quicinc.com>
References: <20230908193314.27008-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 08 Sep 2023 12:33:13 -0700, Abhinav Kumar wrote:
> To support high resolutions on sm8350, enable smartdma
> in its catalog.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: enable smartdma on sm8350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/921e32bf6c0c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

