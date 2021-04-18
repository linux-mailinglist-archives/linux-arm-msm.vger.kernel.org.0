Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE44363327
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Apr 2021 04:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237230AbhDRCD4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Apr 2021 22:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237227AbhDRCD4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Apr 2021 22:03:56 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20167C06174A
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 19:03:29 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so16600689pjv.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 19:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2UkCdcxCkeQ7ocXEI0Bytf+xWLtA0Qk4M5dxvPYcA7Y=;
        b=eICm1if6gp7Ae6efb8ncUSr6vByRuHeVXQFK+xnQ943WgFkJeGVGXu5H/b0HCyaFiH
         tX1CUeBM2OGDajDAJp6eZlavBXjpIpaJPRStW12cToGpbpdnX7U43ZdDQOtJj7k7cHWH
         TCOPbrDOY+JkNBPpORy64pBTk8WUaVY9+anNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2UkCdcxCkeQ7ocXEI0Bytf+xWLtA0Qk4M5dxvPYcA7Y=;
        b=Rbdg/bP7V+t5avGApBPMASDkWSX6VltfshXjWpME74nUo1+Pq31F8j1YxZAcKTI5Qy
         jqeXx2f83DDw3/oriM8Cwh8nnqFNlJzR4+sFePw/qsinRkEjX6wQaInFPBCiwezNM9iK
         Z8gojd+97dENf5LM8olSLtuGZYRIRgMa7z1Mn1AkMNGV6zPfBWwtDQPaEP1J8srPD7Mn
         PC9QrSpHPu0mGZNy0IVeg68x1vMWmQvwG4GBsO8NhpJKQMau14LXg6cdkXkN34Hoe3sP
         pKK7cwrPwRemNi/viexG9K2xrjQQe0lcrMNwprqVjfZfrd0FgHwhZpPCpol0eeImuNx6
         5RlA==
X-Gm-Message-State: AOAM531FjhOKZOXJYnEybcueQCxeEzOCMb6jQSj9PfqtdHY3JIBUm/vm
        s+H4Z9gsKWvAlJvY3Zuxn9v8hQ==
X-Google-Smtp-Source: ABdhPJz+BPS7QP/pDLIllhg2nCqaVJIg+JdtU7rsoYM0r9g7cwSIGnpk5QD+k3MGQX38WOYOrSrbKw==
X-Received: by 2002:a17:90a:d983:: with SMTP id d3mr9637816pjv.99.1618711408774;
        Sat, 17 Apr 2021 19:03:28 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id q17sm9679712pfq.171.2021.04.17.19.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:03:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-12-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-12-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 11/12] arm64: dts: qcom: sm8350: Use QMP binding to control load state
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:03:27 -0700
Message-ID: <161871140708.46595.7272450915110466257@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:57)
> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
> state resources on SM8350 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
