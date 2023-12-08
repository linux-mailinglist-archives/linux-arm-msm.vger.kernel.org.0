Return-Path: <linux-arm-msm+bounces-3931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E89EB80A220
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4EF328172A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969CD1094B;
	Fri,  8 Dec 2023 11:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PyhQvVlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E28910EF
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:26:25 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5de93b677f4so4643347b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 03:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702034784; x=1702639584; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=byPYVY3l+3OcfSeHRN4sVPzEvG910jYH3sPHi/VI4Xw=;
        b=PyhQvVlhVu4qj5R5ZJJ66ct+Ht7sHRIPYKu6jnOSNl6ViXaq+6PQupYVWiZt5hMhtc
         qVPCyKk32mNJx4OyRL3BSsxyABTJPYPANUcQ2DLk+ydYgJRLhXfol3jm4LhyTo3Mmohp
         gm1z5Ap97CpzC3Ynl++EuobA61urN9uuFPt54wIr7+q24ZAVODyDXLbSOyg52T4EYVDp
         hw2/lt+RFG8E00LBg78gL6onxnagohLnFcgp1rsrvY/Y9uwiZuWNeY+MU4GKCaTsmCRk
         k8GmkQjnMvKck3GGV0Hv+22QTb1vfJrnwfPCRBtwBNMUzBWHt38XpncO8xzz/T41CVC6
         Qk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702034784; x=1702639584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byPYVY3l+3OcfSeHRN4sVPzEvG910jYH3sPHi/VI4Xw=;
        b=teY8+JTrLJ0mylIArdKof5gRkTBx/0p6Kdfw3XbLOF+oQYMGwa0OYJhRBnSc0ZbCcd
         GLCIQBNNwefXBbc7jp296CEwtIbyOgFg+c6vZFm8Qwtv7w+zbK+qsz94TYrIsmwx4zS2
         g8Ol9kCm70Tn8Flmyq943jcJPCnemMct+zoAm3xDNuvOJWtXiP1XTeq17wKCo+m2isZX
         /ackLJXNd2knscD8K2cMi/5HbIFigmCXOKX0OtVbk6nbhgtxxSuvWWbW2gTkpFt5c7uh
         x6N0XxyaMl148sP0xy0nCcSJCJ/6ZFxYbSug/sl4PR9RgPnuhz0s9KSVqAuvVgHA0zAF
         yc6Q==
X-Gm-Message-State: AOJu0Yyt7SxqAYn77tokp4UJSf2N4TML7ItvCMs6YwQlzL0fzbloTpTR
	Rz4W6b4AGvj6ukcJ4wX/zKhlfuAmQiH+enEsOM6dcg==
X-Google-Smtp-Source: AGHT+IHGGsTbAV5EBSGKjADTA/4cOM5MMdVRwIFGYX6nSYYueDpA1I/YNSvKbKDV21cpoUlQldGOr9DIM2R52NDc8GY=
X-Received: by 2002:a05:690c:c84:b0:5d3:d6c3:dcf with SMTP id
 cm4-20020a05690c0c8400b005d3d6c30dcfmr3647433ywb.15.1702034784451; Fri, 08
 Dec 2023 03:26:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com> <20231208050641.32582-9-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-9-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:26:13 +0200
Message-ID: <CAA8EJppNfznTQydN+BDaFpHn432gAhHUJ+9pOvq+bV9pvE=qAg@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] drm/msm/dpu: add cdm blocks to RM
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add the RM APIs necessary to initialize and allocate CDM
> blocks to be used by the rest of the DPU pipeline.
>
> changes in v2:
>         - treat cdm_init() failure as fatal
>         - fixed the commit text
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
>  2 files changed, 15 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

