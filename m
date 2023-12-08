Return-Path: <linux-arm-msm+bounces-3933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE680A249
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21C041F21409
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0E11B279;
	Fri,  8 Dec 2023 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="giCreBYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253F510F7
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:34:29 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5d7346442d4so19086037b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 03:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702035268; x=1702640068; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ioy7a4mjD1TM5aUtdQWmEC4pgXl3wwexCFdK6aCY8Cc=;
        b=giCreBYvncCZ6/Io7X9V45ZU9cTxZYvEelC13IDRv1edoaTEq4yxql/3MFNoG4Iynd
         q480wb/ag2cQPD9q6JzOkinjdC1EVxF2beHzTTmE75hR1lrPHbtqw2NcucJJEJ/2ZfcL
         ddtDBkmtVSwUMICGCjkuPUitKmFJ9YZXOhYADgPdPye2wKqGt3w0+Og37qyGwIemviKh
         ZHf/QggpWIp4I6XmhcZP9q2BdguvHN28z/JBYui2m4DwxJW+W3L9eNnGD7SLovonZdRb
         tx5S08qkbj98/Ba1sKCzKucMaJH1g4wGCQXOvMBsS/k74dlbcdKbteyhfqRWch7O6VXv
         xqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702035268; x=1702640068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ioy7a4mjD1TM5aUtdQWmEC4pgXl3wwexCFdK6aCY8Cc=;
        b=oViuueFpkvNa6OC5l6kDepexRQ5MwUWry408a+xKy6qzccXST3JYHsHpojw4h4JYMJ
         8r01LQmYw0ILakfnO00wXvFL407yXT2ga45gvW9V2qNtSl36+pfMDEppTU+yw1lQkDBN
         drA+k0vDYCvl09f9Il3RaGkxkXzqfADKZr8yQgkD+YONkKlEWe+D7qNpsPq9X55Y3ql3
         clOzpsxjVKXky4dBcUQdAvevPSLl4M06mtYvdxhvc3TlWyfIBNQ2dAlR7YUxf5hbLhsK
         BvtVYoCG3DWVhpXvf0e5rlHr0Ajql/Xya1bU6yzGNLr0NJTSgu1Vk3c1vcQnoXCDrTmb
         tBtw==
X-Gm-Message-State: AOJu0Yyq2LgbH2d/F2s0/UMzaBjlDQK/cjD+nrggGaFGX70YQPTbLbzw
	VK47zZPt7H8ctIcwNfrYBEsdjp8xbga3SGws58+orQ==
X-Google-Smtp-Source: AGHT+IEnxfoJSBiNek6sdMc7Ud4skvctpIP2+cEf8vddxE69b7AorZ3VH3y8fLa2ZwsZWhID77sUwyYka6dZEElUZlU=
X-Received: by 2002:a0d:cbc4:0:b0:5de:955e:24a6 with SMTP id
 n187-20020a0dcbc4000000b005de955e24a6mr639733ywd.2.1702035268406; Fri, 08 Dec
 2023 03:34:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com> <20231208050641.32582-11-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-11-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:34:17 +0200
Message-ID: <CAA8EJpowcKmn_xXbmwXZGiTJXuwJcArjyDii7m1WjofPE_xoxA@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] drm/msm/dpu: add CDM related logic to dpu_hw_ctl layer
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> CDM block will need its own logic to program the flush and active
> bits in the dpu_hw_ctl layer.
>
> Make necessary changes in dpu_hw_ctl to support CDM programming.
>
> changes in v2:
>         - remove unused empty line
>         - pass in cdm_num to update_pending_flush_cdm()
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 35 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 12 ++++++++
>  2 files changed, 47 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

