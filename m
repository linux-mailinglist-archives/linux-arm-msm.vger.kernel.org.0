Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC1401636C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 00:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgBRXDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 18:03:24 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:37802 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbgBRXDX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 18:03:23 -0500
Received: by mail-ot1-f48.google.com with SMTP id w23so4848298otj.4;
        Tue, 18 Feb 2020 15:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/OUq9HnmLC39bwvwK3zdiIFd4Xyuiy+9BAYMbBqnLpE=;
        b=MgtEsQ+Ssn4TX8RppXL48ogPVzvABz4sDdawibTmYecoHm0CAAyxHsPZdWA35z6f6r
         HZUN+NqnyfJ7N6XBktGP3vdtKDmR9bzTryA1tOeVpZW43HkSf7Wh1jSoYl9XcVePXEMw
         kOXeA2yB8BDR1PuVCNj4N/Cug52MWLjtOe2s0FYUM/1r3I0525uFod+90Ick2fB6yWxt
         Gx6+yvguvS4RiSLIqwUDFg3UPeHaAaZxya0kCQEHiHJpSN31eSozJaYNR6v/4GM+k0ER
         goAaHFwOWc90u8I221bvUkqc50W3C7GgXH23nMX9Fo47KvLrGqcenz2546DbuqV1cMZs
         iHxg==
X-Gm-Message-State: APjAAAVp7OHXzGz2DiJHj1yit7zs45bPaDHuI7lsc/M2XRQDhxYomsHi
        ZvTT9MV0NyPE8p7SJbdXKw==
X-Google-Smtp-Source: APXvYqxCzDLHXIGYjFlzG6Q6f8GZsOXUYoDWJm6RVL1HBDpxsnxGVcSPSLKELpFB+g2wI947gkqZiA==
X-Received: by 2002:a9d:64ca:: with SMTP id n10mr17626635otl.325.1582067002984;
        Tue, 18 Feb 2020 15:03:22 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w8sm1822780ote.80.2020.02.18.15.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 15:03:22 -0800 (PST)
Received: (nullmailer pid 11058 invoked by uid 1000);
        Tue, 18 Feb 2020 23:03:21 -0000
Date:   Tue, 18 Feb 2020 17:03:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv3 2/2] dt-bindings: watchdog: Add compatible for QCS404,
 SC7180, SDM845, SM8150
Message-ID: <20200218230321.GA10954@bogus>
References: <cover.1581459151.git.saiprakash.ranjan@codeaurora.org>
 <a8bd3f4062fd7bb45aeab5aa55f6f31c14c69a96.1581459151.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8bd3f4062fd7bb45aeab5aa55f6f31c14c69a96.1581459151.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 12 Feb 2020 03:54:30 +0530, Sai Prakash Ranjan wrote:
> Add missing compatible for watchdog timer on QCS404,
> SC7180, SDM845 and SM8150 SoCs.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
