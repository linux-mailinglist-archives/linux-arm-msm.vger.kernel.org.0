Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D536634E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237624AbjAIXPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237496AbjAIXOt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:14:49 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534DD3DBF3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:14:45 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bp15so15497462lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aMQc5BYXDV/7oNhbW1Pl88FNWIMOAPhqPBJwu9jrno=;
        b=TtZQLFQMSHggBMPL6z/kFK4ohDXrhJQyzkvWNZYoh0iUV9y1EKcOcPxa50mEctFydL
         RX2ewsmFAgVI5kzMGMQYoEnZSCzdMJXj36awfiagUTdsgoLvBKa8xh6F9sExaveOiSpy
         3LwsY+5MmMNVwk5bkqAw2l5UD1xUQ1fXsgzX1dEzy/wdorS8M1V+zHlptNJqqmL1F5Xs
         /XzWq5blLa1nhYGCJHZ8uU/g+nogEQ/HZCLN0tQmYojBwtkTw6SxlmuS0YeVEXtYq7hy
         yVdHFzqmG15K9dEkvBufOdCvZipNwFX5nVK7qxk0gnp/vOdPlMJZMUxz7KDvXBQ6SrkT
         Tdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aMQc5BYXDV/7oNhbW1Pl88FNWIMOAPhqPBJwu9jrno=;
        b=uPR8YHn5mFp0V9BZGZQC6F5o9G0ECX5/J5PfgJePib0lqCxHqJGeKZFvaSdivViQFJ
         jFwgD2RCo1SDWmgMiJ3ZaEC156rL/3fyKrpD84JUnx6nGz3cEojhrcU8qL98Q7Od9TkT
         DRLCrxXE19UvTEEU4VzCgjxYQc59anAyKWPwZYGP5DZGPOeLfwhKJIJJAMQ46FdxsclH
         r4lxgJhQHZe6dd75MWJBrYGlSvdrs0c+Wbk53ZPyA/rZqTXXsO/vZ0AKsIB2y54ZOxGS
         mkspvZdS1H6UQM/o9Mn0YOTE4s9DI0uQ0ximo2C0eg6vADwoRv6FkYr0CPp5wUUNA1FV
         qCDg==
X-Gm-Message-State: AFqh2ko8lL//rSfayGzvx8kk8evRuX8wc+EWEneVyuHnTitVCKE7aF0R
        Lf4IFgPTxaeAcgRqf732oIKFqcocICM=
X-Google-Smtp-Source: AMrXdXu3fTohzLJHs+Ys6z4kHHnaEEPDUV/31K4z6QI6J3cFIrnFWOYYusRQjmYBJFMM/13MRecttw==
X-Received: by 2002:ac2:5d4e:0:b0:4c3:7634:234c with SMTP id w14-20020ac25d4e000000b004c37634234cmr19517431lfd.57.1673306083423;
        Mon, 09 Jan 2023 15:14:43 -0800 (PST)
Received: from localhost (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c21-20020ac244b5000000b004cb015794a8sm1834632lfm.109.2023.01.09.15.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:14:42 -0800 (PST)
From:   Dmitry Baryshkov <dbaryshkov@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
In-Reply-To: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
References: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: disable DSC blocks for SM8350
Message-Id: <167330408773.609993.12108316021819384010.b4-ty@linaro.org>
Date:   Tue, 10 Jan 2023 00:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 09 Jan 2023 23:43:09 +0200, Dmitry Baryshkov wrote:
> SM8350 has newer version of DSC blocks, which are not supported by the
> driver yet. Remove them for now until these blocks are supported by the
> driver.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: disable DSC blocks for SM8350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3b2551eaeac3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
