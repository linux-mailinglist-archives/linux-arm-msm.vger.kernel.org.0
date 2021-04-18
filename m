Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4F0363318
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Apr 2021 04:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237185AbhDRCCt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Apr 2021 22:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237179AbhDRCCt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Apr 2021 22:02:49 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299A4C061761
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 19:02:21 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id q11so2815036plx.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 19:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=IKYgVJGdlnys8DHl050Hdn2rR9TNdmyUAeeIRt8xOq8=;
        b=VF9Z4jSEf+p1UYjim3ow8+Dcmv9lFG03tFUbryapVjJzsvMmV5CecfV0GDI2KXfunj
         jhMEG+qOVzj75h9hYPJ2aulXfLBXfG3watRAzQ7mNtvWbO6XLqH6et+eX/2t2AFy+MZ8
         BYh0O8Y5vgdC9oqv762RLzLjzrI7iwhcG06cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=IKYgVJGdlnys8DHl050Hdn2rR9TNdmyUAeeIRt8xOq8=;
        b=HJ14gKwfg/EifaZ+ihsAVkBdjHyNgmDF7EM+gjkRMB6L32Knj1nxwvTD0NIKfP+F1h
         274Z4lg4v2d/cEARhg6FiziaZajQgAZeD7IaLV2L/m1Hl0I5zZYFDps2OGC+FpNEEDvB
         hp8fkumL9j+P0YnBKgor5vzEWBECGLE7QPuwXdvFiD7iG3Z+dtshRVGM6cyc/jPmRCGw
         v40oXYSVtqvvJ3s8i4hjrmkFaYwFheJ+Ed6W57t14eUB6IRucJed68mGjAyocpTKe6ik
         X+XDpFv+ThN1cTwsN6FgA4l/o5ogC4/H+AjtRWrJsmJwly3Nd2w3hnjoQnvSUChAttWG
         hFTQ==
X-Gm-Message-State: AOAM533xdFkJiGK1yb25xoNqPZv0ZXVovnMqgTdPBZTajsbhIwYu9aGJ
        eQ0K9YIEwBULT5J8Wc127h25MA==
X-Google-Smtp-Source: ABdhPJz6CvpZyiD0cG5835NFc7okMDvkcBy2tU66Rq0gbRSYjPjEBctZOKgh8mRtkOWICw1Hof3aZg==
X-Received: by 2002:a17:90a:d191:: with SMTP id fu17mr17106897pjb.137.1618711340749;
        Sat, 17 Apr 2021 19:02:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id i11sm9110213pfa.108.2021.04.17.19.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:02:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-8-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-8-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 07/12] arm64: dts: qcom: sc7280: Use QMP binding to control load state
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:02:18 -0700
Message-ID: <161871133896.46595.3264774242647444219@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:53)
> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
> state resources on SC7280 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
