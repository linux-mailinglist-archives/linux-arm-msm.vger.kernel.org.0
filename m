Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77D5841A3AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 01:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238205AbhI0XPi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 19:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238171AbhI0XPg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 19:15:36 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DA4C061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 16:13:58 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso26553402otb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 16:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fGTt2hnfWiF6e7IYGzXXWDUKyh0sx2hrjsxfMx+frmk=;
        b=bqDgmGGkGcNjFJyVl93eWsMtetWorm4Y5NpIDD6z8sKlV/AAZrMxEToHIVeiAlqoUU
         8lGHMB6zWrpHjYLEc//Ur49ue1GQJZP8598jcs8uv/Z1kjtDy7F7vnoXotv0GVTm8Hbg
         7Dy9FL84QNA8O7IAnoDeoVRF6TOcvW5MAdRSw0x3TFR9xgzPo7uYXKIv9dlmO+vXQeol
         RBWH7ccRfEyk62GSNtMDKcqt5eNr/S0KhH8NMc9jfGWBWrA9OWFTyO2cJL/Y0cFFwl6U
         CurhskZAxcY+Vdg3jiIkwyaB+brt0wgenOr+9hKNIGZpwcfEDabnKXs/0DQWuyAGlBu5
         AKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGTt2hnfWiF6e7IYGzXXWDUKyh0sx2hrjsxfMx+frmk=;
        b=zj5Lk0mZ7KLld4tAnCzmozC0XAE9/ZNDa+iailFQxiUTIwLXbC27B4AvGszigB64wX
         hFc+GenztO9oeSOFUsfw0AdUFqDUYO/ZX9BbM9SnKulQVCSdN7PWzM7SYj3Z7ApYPkEG
         DMgcSSgnklBGXVU/i8WvmTh+DmSLi8rNLMjEeEIWjkElQnHU6bKWbWEKftnBE7A94U44
         pKxqKUHC/oyLQUh7P2LGBwvRZGt0qmA+9jpssYkrhwC4zA7X4yNYImo/ngnwqDnKVzFC
         wqckgVAmr/pNEeqYexsfLiv3U05VuXUGiLJueIfoSbAByhrODP1IARz+UON9eInWH+3o
         XTVw==
X-Gm-Message-State: AOAM530DmHYDRD545y1HNP/bpOd7YHael6xqXVj7HoXmxRuZmQGKaTQq
        xPUVt1xQJT6hu1uDVLwjUzvM4w==
X-Google-Smtp-Source: ABdhPJwHC7Lr7HpBuR21ixlUXCwVbpfVNFO9RX/rYG9B2yRCe1NnnWqO5rDMMr1PT1LNN01H2Inukw==
X-Received: by 2002:a9d:6347:: with SMTP id y7mr2206399otk.241.1632784437605;
        Mon, 27 Sep 2021 16:13:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p21sm4162268oip.28.2021.09.27.16.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 16:13:57 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, mka@chromium.org, will@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>, swboyd@chromium.org,
        saiprakash.ranjan@codeaurora.org
Cc:     evgreen@chromium.org, linux-remoteproc@vger.kernel.org,
        robin.murphy@arm.com, linux-kernel@vger.kernel.org,
        joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        devicetree@vger.kernel.org, dianders@chromium.org, ohad@wizery.com,
        mathieu.poirier@linaro.org
Subject: Re: (subset) [PATCH v5 05/10] remoteproc: mss: q6v5-mss: Add modem support on SC7280
Date:   Mon, 27 Sep 2021 18:13:52 -0500
Message-Id: <163278440375.1524647.12772375211634032908.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631886935-14691-6-git-send-email-sibis@codeaurora.org>
References: <1631886935-14691-1-git-send-email-sibis@codeaurora.org> <1631886935-14691-6-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 17 Sep 2021 19:25:30 +0530, Sibi Sankar wrote:
> Add out of reset sequence support for modem sub-system on SC7280 SoCs.
> It requires access to an additional set of qaccept registers, external
> power/clk control registers and halt vq6 register to put the modem back
> into reset.
> 
> 

Applied, thanks!

[05/10] remoteproc: mss: q6v5-mss: Add modem support on SC7280
        commit: 529a0113177abe487614a0cba462d9973caa8c2a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
