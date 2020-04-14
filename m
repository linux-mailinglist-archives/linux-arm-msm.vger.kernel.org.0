Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95FF51A8CF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 22:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633467AbgDNU4c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 16:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633469AbgDNU43 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 16:56:29 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2FEC061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:56:28 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x3so499283pfp.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=NtGBbRMFHuGLYVWwP2S8WNTOMnjyQJo86GhiRsq/RLI=;
        b=UXtZj/Hxj2RogzSqhPdsIrV+Tb1Mi6cLH48af5r9FlBJkIsru50FCL5CzAaQQeqJ7n
         rsIoZhTl1LDgqnD5qEIf3p202tMUHA7FkZPQ5/P1FGdHN3SH3xTUhgGA5Dk5VXQ7LnQs
         3UcGLqg1dTAzptGp9XrHAIY2rkU1JMmoyOJsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=NtGBbRMFHuGLYVWwP2S8WNTOMnjyQJo86GhiRsq/RLI=;
        b=KQ0OaWY40WexiiGfi6BBZ1/bgrmTjCvfxM2/rSbcluY2THASIx31aVhNKMOsXw22cc
         TxmM8DW5wryyPRYJYv1tpHPU7r4Vb0nzsdX4Vq+Z7SPXbhoTv1m1U4lyXlsZfOpOTXpX
         WlcHF0V5Za5GjgW8lJcRerenWkoRj57mL7WMGxSw+NRracPRX/k2n9g9zE/iB/3TqI0F
         SaqRt2S9kGptIvecrztP89QkDMUzgtQgd09hJiu/AFoPl0ViZZ+5dMiX1sC8rfmaIVjR
         ehh6i8y/dLyU3ubja2MYN5B+gSgeVV/u4e408J6aX7g+Vzo9+8BzdnfEXjDfwX6Zd19T
         261Q==
X-Gm-Message-State: AGi0PuYTbtb7PKbc4xdCeMq0F6EDfxw53isbYJq1b6lvj9/Hll44Pt5s
        SqC7j7EFEe9sOnSFT77QCxhhuVWrxm0=
X-Google-Smtp-Source: APiQypK6gPQlntq3g5CB8LbqghejJJbCs9iCRhnLW7s+orakW8jOYEegO8lYlVr+WaR9N/K8T1o/Xw==
X-Received: by 2002:aa7:8505:: with SMTP id v5mr1947475pfn.224.1586897787330;
        Tue, 14 Apr 2020 13:56:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b21sm6889644pfb.130.2020.04.14.13.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:56:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585809534-11244-4-git-send-email-sanm@codeaurora.org>
References: <1585809534-11244-1-git-send-email-sanm@codeaurora.org> <1585809534-11244-4-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v5 3/3] phy: qcom-qmp: Add QMP V3 USB3 PHY support for SC7180
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 14 Apr 2020 13:56:25 -0700
Message-ID: <158689778567.105027.9816194008999279570@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-04-01 23:38:54)
> Adding QMP v3 USB3 PHY support for SC7180.
> Adding only usb phy reset in the list to avoid
> reset of DP block.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
