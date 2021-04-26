Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E8736BB44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Apr 2021 23:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233464AbhDZVh3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 17:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbhDZVh1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 17:37:27 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD064C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 14:36:45 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id s14so22910165pjl.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Apr 2021 14:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9rgsKAhhtuNFQZ+aAjo0/P+CP1GY/CUNPL3lrWCrY7Q=;
        b=KCMSZTW9Ftcr13No+8u70KquNfAPMGogImNCw5IKcikbvDCOMZqC97h0yt7wljPgqc
         vsJAhRFGYghaNeSxEQcaTGOSQuwMJRZOibqfBZigFfiqk8NUGCrUyqnr+aLo0UoSu5C0
         mF44U/JTukrAFrga5TNdsjSwg8n+4vzvb+f6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9rgsKAhhtuNFQZ+aAjo0/P+CP1GY/CUNPL3lrWCrY7Q=;
        b=hVH21jk/ANOZAhsbyLIvg3CFsowimWH/Tu+Npb+mUzIE4Ugm3qh0dVJwntVUg7Q3FU
         +n09UU/u3TAiKOLMWBk9gtzwkZdbY4jtL8N1KNNKddHbGuDgfzwe+6GQROsCdb2eoj8V
         Nbhb6LfgWoKi4AxoE1lw7vxaapmhtjvw+wDtmkTP7N0qfFMFL4L8CG0by7Q7p4UCn6p7
         6JQbqnwB6CA8Yte4MihQLHHp+PCdGezQAi/yMyxms/17UP+QNn2jUS24pJoQvk3/Q+N6
         qtY39s75HPPNCUn6W2Mdl3p7Rhi4aqqfO5LUDbaL5N9ywVq3k00suKrja9x944GIJWoN
         cOIg==
X-Gm-Message-State: AOAM532rOzEf+TY7yokKIs/JvEWk3fimKXwqrcn7lGC7rFXtToyZLTDw
        tmWqzTyEC40ktd/XSg34NyZTMg==
X-Google-Smtp-Source: ABdhPJyD6BoGT/s6yCpqFgaXtkry8ClFp2fYPOJChJ8sXblm3fM/5l4uwqy9109mOJugem9Jelj5Bw==
X-Received: by 2002:a17:90b:224d:: with SMTP id hk13mr24061527pjb.218.1619473005256;
        Mon, 26 Apr 2021 14:36:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:3a16:de17:8721:d706])
        by smtp.gmail.com with UTF8SMTPSA id 18sm482678pji.30.2021.04.26.14.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 14:36:44 -0700 (PDT)
Date:   Mon, 26 Apr 2021 14:36:43 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     amitk@kernel.org, thara.gopinath@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org, manafm@codeaurora.org
Subject: Re: [PATCH V2 2/3] ARM: dts: qcom: Add device node support for TSENS
 in SC7280.
Message-ID: <YIcya8X4O/y6uuWC@google.com>
References: <1619202177-13485-1-git-send-email-rkambl@codeaurora.org>
 <1619202177-13485-3-git-send-email-rkambl@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1619202177-13485-3-git-send-email-rkambl@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 23, 2021 at 11:52:56PM +0530, Rajeshwari wrote:
> Added device node for TSENS controller and critical interrupt support in SC7280.

nit: use present tense to describe what a patch does

> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
