Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 724F9FE83C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 23:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbfKOWp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 17:45:29 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40879 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbfKOWp3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 17:45:29 -0500
Received: by mail-pg1-f196.google.com with SMTP id 15so6633960pgt.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 14:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=TIQx/W2wsyTfrLCB4wkXJI0AK0ooLAfik2qBodlMv9Q=;
        b=jFTdO6uQkNPKGB+sgB3g5p+gLJ2Z2GX0XxDXRULOaYD7dXrTMJvMy8ooEOa76ptYJy
         O+9QnZzvExaXj7XG7tmndRtrCg6eqfmp+jOQKPUgULH0iRPc2XF4VbcW+F4S3fL++ry3
         LUosm1MhLc68sRXzjbITUGgMXegakDZbtWZDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=TIQx/W2wsyTfrLCB4wkXJI0AK0ooLAfik2qBodlMv9Q=;
        b=mG9yKa+Oi6Kaecyc8qhcb/nCzQH3yXbR6JdaZhppJb2lPBYmrHkTvDOQlOgE72ZuGQ
         TBc/kdgG/4eqmhTuSvsgSRb7vEjOYRfg45NLLXT1ROkgkDxk0lecTKqooNYH7cxfIR2b
         ui7vHTxn7UbzUzZtfauyQaR6aJwlDao9aLRXe1N0PYy9N6E4XYvT4Al3TXGLBqVAMDRu
         gXYLWbPB/Zssw8Jy9OdxTn758CZcjBjZZKwjM1dB1CUrOVso+SW5CYvJBrRGbGYq1FBB
         hFkSbsmkXeRJEzRSFir9AfxQBKxnGs93euOxkLL6yRTcYatLx+2cBygW26zGWlSKg1nH
         bvtw==
X-Gm-Message-State: APjAAAXfTWT6zysYDIsxaMkAIH3g40r9wc+5GxvXtctGllirdjXICC3U
        VbVe4pw9VMzmWUBnkIB9Y4XrqA==
X-Google-Smtp-Source: APXvYqwIieFZ+AoiRqEA6AOmCV2fSK0ePU0g/VFuOLiyJGWLORJamjpTLg0d14VcejqPVesEBsIPqA==
X-Received: by 2002:a62:108:: with SMTP id 8mr20401575pfb.53.1573857928696;
        Fri, 15 Nov 2019 14:45:28 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r28sm12330264pfl.37.2019.11.15.14.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 14:45:28 -0800 (PST)
Message-ID: <5dcf2a88.1c69fb81.8b56d.469f@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-6-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-6-git-send-email-eberman@codeaurora.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v2 05/18] firmware: qcom_scm: Remove unused qcom_scm_get_version
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 14:45:27 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:41)
> Remove unused qcom_scm_get_version.
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

