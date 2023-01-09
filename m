Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E205B663598
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237721AbjAIXo1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237967AbjAIXoM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:44:12 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC163FC86
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:44:05 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f34so15577366lfv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJYCXzCwWlmnquQ5yNkG+nGz0jiVnLUqp4W9MaxrD4s=;
        b=RIPP0LX1WVF/EwnvQtIj9jJQabFc2G1iyrCosOv6yvEXLxKIHVdJDa5nwzFlLU/isO
         0xnLLL5EcOekI5uHkhLcnOZkUzGqP13Fl069NnVwv590tcKGPg3rMP2n6zpfmK3YDaJE
         eGnaxtnchWCtqGKaR7uPRGw4kb7tdACQwLpKtFyBC1DWYDTAqRDvA+S7+tDj+oXg4mY3
         v1iTvaAsh+tf7nI/gZsUcWZzWx/htWgqmh1ovXPig19o4FEoJuvEvoo2Q9SpbcWXGL9H
         kYb169Z+TIdUuBIzLlqfhpKvwMDvzog7fpoE/POg+/+ckFqidCkW+15WFd1r42qEAkIk
         Z2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJYCXzCwWlmnquQ5yNkG+nGz0jiVnLUqp4W9MaxrD4s=;
        b=nCnm25I77+4iekBpi88eVD0FNvOSeiw9Z3RIEm21vokAj4KZ7ba5R7UHGtJr+z+wWY
         H3wpAbXRR7JgmITCRzhCe4iEAUY5DmVLYj8eFkFIYCa5i4W303iO6sf5SUuYDZo1HqTN
         P6LFpsAC5guEm2XmMQKyvTXcrhEnKXrwyd4UGjz/E2fAu3US9Fi62y83gPKYWuNDxFbf
         LuIVKgsFuBVk1Rao+ll0889yOediNIk8lgJR5OFBLAl9aLNyGWw16+O+NLqHki333uTS
         VzdWOTDrOyQiUatsXNld/1TZYqPSEfo7wxZqO4m6fiWFECCE34Oq8LMpkK+XaWCP7ol5
         KzSg==
X-Gm-Message-State: AFqh2ko5kiIIn4ALx6tmMugfYDGTqkaSxJdcl7yefxG/sunmDtreHyYF
        /8FEfZlrc5h/TqSsg+CyWjtJeQYZFT8gQ1Sz
X-Google-Smtp-Source: AMrXdXvhuCtr9p3TaitJ7JU10h9BQxbrBE5HONX1QxhdjdTu1u8Jk5LG3EXWzIioN5/bOobU+UeVjg==
X-Received: by 2002:a05:6512:3f0c:b0:4b5:2ef3:fd2b with SMTP id y12-20020a0565123f0c00b004b52ef3fd2bmr21828551lfa.18.1673307844326;
        Mon, 09 Jan 2023 15:44:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:44:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, swboyd@chromium.org,
        quic_khsieh@quicinc.com, johan+linaro@kernel.org,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/hdmi: Add missing check for alloc_ordered_workqueue
Date:   Tue, 10 Jan 2023 01:43:48 +0200
Message-Id: <167330408781.609993.12402793226257634056.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
References: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 06 Jan 2023 10:30:11 +0800, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference in `hdmi_hdcp.c` and
> `hdmi_hpd.c`.
> 
> 

Applied, thanks!

[1/1] drm/msm/hdmi: Add missing check for alloc_ordered_workqueue
      https://gitlab.freedesktop.org/lumag/msm/-/commit/afe4cb96153a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
