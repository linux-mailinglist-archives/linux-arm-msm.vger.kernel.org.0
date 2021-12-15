Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89504765CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbhLOW2c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbhLOW2K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:28:10 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 930FDC0613A5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:05 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id bf8so33743801oib.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V5R9U+oC/7eHwDFpxquRyWa1j63G0+nVe7NvNu7Z86s=;
        b=Iq1flnwsumjTw74ppUe2VE06UNTbMowri3eCilvDA9fwTdMAX67rUSEXt/H8UYqdcj
         ZceEa9jfXkylFCoRACK7WhNXoqWAe/L7giKgYK21SVhl24gmF+KndT7qlsmUXhc2OtKQ
         sWJ0v0ZkqrLnZkm64jvricxYsQiFmFnnzhA5w8rC9ICdUtnlmYOWktjsDFu+2hm1lZA8
         2mH77hRVrrRIqu/2edr9e0HFqIJ1g+4HK6qX3ulXAlWdyVTwGKFXKfskqePFy81cFBuL
         T2//ymyHHwAOTj8wR4qRkvPD4iikC6Ky0LeTlwoNR4XQpbucrh7JnfBYjkqJtAdKJ6mP
         srXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V5R9U+oC/7eHwDFpxquRyWa1j63G0+nVe7NvNu7Z86s=;
        b=wAYpB4B5mwjuPWDcwiuaJYQn2s6NyRecC7YrlZVyk/EBJ+Iq6RbQrshgHOKXfIQAZs
         Hewm0C3PLBUnHvmWw2Csf5pJQjH6wzXBJzGhJTzLoH/l3nAES5pyXDTQha5OYDvyZ4h5
         7CVo/ISvQRnuT3DAzlBs+Nx7b5VVlNvmzClt8UU1CjS7f2eomQL2PI4jTI2wS7iaFnl8
         K562aPyjeQrYH9VUOeNicV3fJD2wZ9NskeYGfP/IeoaZB1Qyu9dhYkCLrooWm6rn2JYT
         XZNN40mmk2ja7L0dQ5LXSX0TBAaUckYZQq3tis3skF4M/ycQflXaq8ByxlPRlSQPeGsu
         9amw==
X-Gm-Message-State: AOAM531YszhEkBRhyF2ooHmbXGmlm7Oivinwl7E5E45ePWYApZNw6/0S
        jFABJsBoh8i96IHh+dRTCy676g==
X-Google-Smtp-Source: ABdhPJyuNwD8WZ1iUgIMOwmOs012KKU3EtgfAHn3os7eAApEGQG5AjS1L8JvwV9bcDOUFcnOWe+ONg==
X-Received: by 2002:a05:6808:a1b:: with SMTP id n27mr1828814oij.111.1639607285003;
        Wed, 15 Dec 2021 14:28:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:28:04 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] ARM: dts: qcom: Build apq8016-sbc/DragonBoard 410c DTB on ARM32
Date:   Wed, 15 Dec 2021 16:27:37 -0600
Message-Id: <163960723734.3062250.8748900345758211208.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211213113250.4249-1-stephan@gerhold.net>
References: <20211213113250.4249-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Dec 2021 12:32:49 +0100, Stephan Gerhold wrote:
> The DragonBoard 410c is a convenient device for testing and debugging.
> Since there is support for using ARM32 kernels on MSM8916 now, also
> build the DB410c DTB on ARM32 so it can be used for testing. ARM64
> is still the main supported architecture for DB410c but it actually
> works great on ARM32 as well.
> 
> The "apq8016-sbc.dts" is simply included as-is from ARM64 similar
> to the approach used for Raspberry Pi (e.g. bcm2711-rpi-4-b.dts).
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: qcom: Build apq8016-sbc/DragonBoard 410c DTB on ARM32
      commit: a6839c42fe7c21173eb6f5db67d944e0f076be2a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
