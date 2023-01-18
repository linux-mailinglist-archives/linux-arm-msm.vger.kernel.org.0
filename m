Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA38671098
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjARCGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjARCG3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:29 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B6040BE1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:28 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id az20so60734978ejc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JiIW4jdJdESp+XWdfOpWNkOvZv4eYC/Zwku6YKYIAo=;
        b=uaVExwDWCIJ0xQwsFvsIky+V+xINrX9hCx2pfSTY5maDB97Q1+SHOgSWIOd9Y85DEu
         qivbNZNWA7oug2IwDwENI40xE5EoTcKsYxycv1UKezFBQCdgcpniTeZkwUt2IaT6elWU
         LE0oTGaq3h1+e8Wkv8/S9kWPkvczwIlN+4M17pv4geo6kMJteYsmveZp7DkvpLd/fajW
         Q2Aqv5CTIToBIV7Oud5LIdOuWFFPf7uHSqacKbyl6plbDDWp1E9S5mP/fB39tAB73kRb
         5oRzR3TaZ2fIhzLyc8mfTuAFNTgRcCho5wfyj0dKTa07PFJHJ9lqu26vmk+lWum80WPm
         3w+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JiIW4jdJdESp+XWdfOpWNkOvZv4eYC/Zwku6YKYIAo=;
        b=dhsv/iaG0Lb9TrHzA5qCUjxwpvuLgdadtTxm0gS4ZvWWkDYGV6V+PiKnNFz51I6U2y
         e3SrEgIdC62Xe1xHx3KoUo6A8pjLFnUFH6tEBgWa++zkk9uj/0yE6SaQa4c5HBNQe7h+
         NEAfT1YO0gaqBtPSLoeAz4YNsQHoUXnskAJ9y0zZJyTNM711ANutTVmjy73Py/vIMf1N
         zmx2nyYNyWHB+FKKdkExKr5HQoRU+KuUOBDBlA52/BuBXlULaZD02ACsZYo4qa681lRN
         xm5o+LuP6s1J3fizVDWdb+9W22DrHxdPOVQOtwtmg61RYnA57VUa7pdcSj2OcnmUZOMJ
         phBw==
X-Gm-Message-State: AFqh2kpKdMi0vaGfvV8C+hNjMY+Z91cvRfXqPilhahttPCFrLxfmrxQ9
        W78xldWeseKNJ/ZwVkyYrBl0tg==
X-Google-Smtp-Source: AMrXdXuJIiZAj16VZgUuBRqA2k8+gGkvW5kulFivi6sXooiaAxXwgafM57hBk4Cu3ulhpAJuOQb6+Q==
X-Received: by 2002:a17:906:ae86:b0:84d:3d88:dff3 with SMTP id md6-20020a170906ae8600b0084d3d88dff3mr5179129ejb.25.1674007587942;
        Tue, 17 Jan 2023 18:06:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:27 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: merge two CRTC debugfs dirs
Date:   Wed, 18 Jan 2023 04:06:10 +0200
Message-Id: <167400670535.1683873.9301034219626704629.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112053659.1361298-1-dmitry.baryshkov@linaro.org>
References: <20230112053659.1361298-1-dmitry.baryshkov@linaro.org>
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


On Thu, 12 Jan 2023 07:36:59 +0200, Dmitry Baryshkov wrote:
> For each CRTC we are creating two different debugfs directories one
> using crtc index (created automatically for the CRC files) and another
> one using CRTC name/object ID (for state and status files).
> 
> This can be confusing, so move our custom files to crtc->debugfs_entry,
> effetively merging two debugfs dirs.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: merge two CRTC debugfs dirs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f377ea2c3c3a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
