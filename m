Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898784A55B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 04:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbiBADvp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 22:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232792AbiBADvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 22:51:43 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280D0C06173B
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 19:51:42 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id w27-20020a9d5a9b000000b005a17d68ae89so14988207oth.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 19:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RwCJ9hsr7K8u4lScvyqLshgsHaCbHyGZzuvtWtgyQhk=;
        b=W/QeLuCExljnv+CgrUxbXAs3XEeKWZ8rl6XrNIq1eFyWpdrTb+tFCq3TopqOgLpk4m
         B0egCwsR8NYgiW3xtg8pT+VdahFhPJYh7zIOaB2oqy+B9/ac8BeN7pLfY5sKT2nc93aU
         6jX0n3f4Z7rpaOFLQdVWswntJe2MvkaNK+vFyKYzhLFcwcbqoS056ui8qZrDju+3GZbe
         R1p/YAzPyXaBwcHwZApsp5Or+JeU7CNJ8WGt5XdSSMt/Ljp6MYAMtVkLJqeJZ2GXQJsC
         EL36wmFdryie/kaqRwmRZ1rzOAdo5jKBEJ9BS0w64YQFpRaEaB+bNQgbdPHK1DJPtF2W
         FFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RwCJ9hsr7K8u4lScvyqLshgsHaCbHyGZzuvtWtgyQhk=;
        b=3Zhlr7H2spjjpscFSB6JcM3cF/8+MNKHxTZ0FFnUyuOimrUCQ+pzUNgRF7U//GWHv9
         /vScxGQTkgyBQWC1hDeNCz3meEN7mqV3RmqwqIfmcyyAgQbeRNDnVTbXpRxQe7NUxSoO
         tSfHsJvEYjTaLf8dDuIGQuBYa0xunUPA74nCVRUK+9J6tbDfjbe6bxIVuHzwe7wlpHTH
         HuXBk1WwBJ/LD9lzkGbINQE6kYg2tUiqUmDEYeBI9iX5Xp1lv2j8R8IWiNw5cXbKYW2d
         /Ihsg6H34xNTqZ4+lFDNx+lpV1GlbcIQOoHscCL5z/saDGuX/FRvEvE33ktAhkvc/IY3
         uv5w==
X-Gm-Message-State: AOAM532j4XP7l/CUZZyP9TvpSn2Ew9BWlZXyfyQe6Hp9Or6lELketw/m
        F4oTgWhvcS54ilOPfTApk69+EA==
X-Google-Smtp-Source: ABdhPJzlVbKkZvspjBMNPX/2jwwSYJ4UGETyWaSGL5Z6yUDRuLU1XIP91aNhSXJlSr73jp6k3OJsKw==
X-Received: by 2002:a9d:d72:: with SMTP id 105mr13424096oti.340.1643687501469;
        Mon, 31 Jan 2022 19:51:41 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id y3sm16901825oix.41.2022.01.31.19.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 19:51:40 -0800 (PST)
Date:   Mon, 31 Jan 2022 19:52:00 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: add wide bus support
Message-ID: <YfiuYFCONqRzv3Mk@ripper>
References: <1643390945-10813-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643390945-10813-1-git-send-email-quic_khsieh@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 28 Jan 09:29 PST 2022, Kuogee Hsieh wrote:

> Normally, mdp will push one pixel of data per pixel clock to
> interface to display. Wide bus feature will increase bus
> width from 32 bits to 64 bits so that it can push two
> pixel of data per pixel clock to interface to display.
> This feature is pre requirement to support 4k resolution.
> 

Can you please elaborate further how this is a requirement for 4k
resolution, given that I write you this question on a 4k monitor.

Regards,
Bjorn
