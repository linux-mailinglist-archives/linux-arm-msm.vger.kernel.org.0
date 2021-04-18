Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01914363324
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Apr 2021 04:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbhDRCDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Apr 2021 22:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237206AbhDRCDp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Apr 2021 22:03:45 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C195C06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 19:03:17 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id t22so15595627ply.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 19:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=f1vUS3Ze5rMYzhNmACo58zrebNguGquHyqBrPheUTBg=;
        b=VBWYmT8yvYUBS1tAUJPSf0RlTkrLPAHztDZl3/w6fFWXOag1I5um3pUtJWzqB2t7v/
         Eqoblslde/SkHUYf87Gmca5fUPfDdI8FzhIAxoQgGn8G2rWzTRkqQZiZxBFukRPlAdRa
         zWN0gKf4iYWjil27m3/XOVxDMNwCoY9YtbBgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=f1vUS3Ze5rMYzhNmACo58zrebNguGquHyqBrPheUTBg=;
        b=fxF3YzVOEbk35tVxksJgahoccV/QGBPNJmwnqZicrX6tHG4kRJIEelZZw+rFO8TVs7
         12p3B83vrgD/M2WrgqK4CleCR2wJk9fyZNMgWUygUHqyxX0q1GMJI1NAtv+eO7HUNKoA
         Ngnx8kbTYEmO9N2BnI8VXFHWMVmtostL16oC6ouy36NYHx7a84iCiJRbzGPwEBJHjoN8
         35iP8XGjP3fxxrK4Nry3WtPHoJmzif8dkbQd8c8Km0yV7R9PyjJZ6N8W9scJWlkY80YV
         a910IteC4O62h70ox/Je8dYGjJzqwDAtl0pADiMMjDX/869mtPjiM1+3l0QMhts1IjdV
         ksHA==
X-Gm-Message-State: AOAM533OAlII+Ya7K7YjAu7ivKwogc7EgqGUEscW7tdW+WIx78b1s/oE
        1otABe4q7lZOfVOnl3QTUHuLZQ==
X-Google-Smtp-Source: ABdhPJw0TP+s+3N7xH1vp/d/mCzedautJESNhv7jJC/R0yjGnT6rJ77fGt1EMUPwWSZjbZhD6rfleQ==
X-Received: by 2002:a17:90b:ed8:: with SMTP id gz24mr16894325pjb.98.1618711397068;
        Sat, 17 Apr 2021 19:03:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id t23sm9783227pju.15.2021.04.17.19.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:03:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-11-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-11-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 10/12] arm64: dts: qcom: sm8250: Use QMP binding to control load state
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:03:15 -0700
Message-ID: <161871139524.46595.11454827955816557316@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:56)
> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
> state resources on SM8250 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
