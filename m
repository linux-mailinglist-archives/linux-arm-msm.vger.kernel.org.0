Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F3C41B316
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 17:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241682AbhI1Pkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 11:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241680AbhI1Pkc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 11:40:32 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12CFC06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 08:38:52 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u22so30447594oie.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7jDiOTxX7jaxQpVKcdTHIgMq+jgTAr1Yd+3O5LrgMwU=;
        b=h/+LwkgzEG9aGMKoRoMXckMlXYX4aBbnBYOTXpWVIYrd0VTf21pPQEzYYZX5oK3gQo
         eRarN92LB/LqUla5rfSIRWHw7qG8ZsFq1GspdaLA9hHCPt6aujalsLb3e8b6APnMWgD3
         yfo3NUOwQJR9g/eSyQPXildzYOwQgyrUd1a1RrD5cWPLlFzs5GGeN2G5lXO78EU3fEHu
         Cs16KJipmr/XUs6dpXEnEC+g9bfrcpi2/BNwdOFjCdPb7Ns+jZa8GrgETfTmYkPqkLzX
         Kq9dU95wWe6dTCNN5S8JzVfUHg9k3jixeikhCuv22bOgj+yjFzx2LkYU7gHRiA2iQX+9
         Yqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7jDiOTxX7jaxQpVKcdTHIgMq+jgTAr1Yd+3O5LrgMwU=;
        b=ALluSOkPYYYrFr+BFYerJM70yLe0gliDnpMxa2Jny2BImbUD/RrfAnLNIHWqExSL4h
         calSTLY6flhT9WeHJHkJJ8Iu2inTplDCqrux9Qkobgx9cGSluAFT1hkW5q54QV/r1iaL
         BARsPwNPtp4xHoxeA2+KDLCI0tCkbVmKsmf4lqpl4mhhbk0mEKrs6vXfKu3oCz69EZT3
         KFffdnHBhO4qJwm28kC/5Xcs0gPpmzx5zNKK2jB7JevkRAjdXPk/VuW25QCllYbYLj4X
         5DCBUf9eKy7e8z+Ossi7r9798b3XCR5xPfHU3qRuEAbMOKMmM2rPMU+z/oekm0HYBgdi
         4FKw==
X-Gm-Message-State: AOAM530bupqeu9oL+sPclWgkrbkSF7GRTiT2OGx6IajzULcBvDynAtO5
        8M0P2xQXFgElHoUOhydP+qDyOw==
X-Google-Smtp-Source: ABdhPJxtuuraLtO422PIv+kxJ+gf970U0cto3rIHLv58MEm715ro8XN4qNx/zOYTxxiGCqMsloA6LA==
X-Received: by 2002:a54:4199:: with SMTP id 25mr4181397oiy.108.1632843531969;
        Tue, 28 Sep 2021 08:38:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 18sm4753034otj.10.2021.09.28.08.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 08:38:51 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: pm8916: Remove wrong reg-names for rtc@6000
Date:   Tue, 28 Sep 2021 10:38:48 -0500
Message-Id: <163284350355.1592203.14045868206050212695.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210928112945.25310-1-stephan@gerhold.net>
References: <20210928112945.25310-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Sep 2021 13:29:43 +0200, Stephan Gerhold wrote:
> While removing the size from the "reg" properties in pm8916.dtsi,
> commit bd6429e81010 ("ARM64: dts: qcom: Remove size elements from
> pmic reg properties") mistakenly also removed the second register
> address for the rtc@6000 device. That one did not represent the size
> of the register region but actually the address of the second "alarm"
> register region of the rtc@6000 device.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: pm8916: Remove wrong reg-names for rtc@6000
      commit: 483de2b44cd3a168458f8f9ff237e78a434729bc
[2/3] arm64: dts: qcom: pm8916: Add pm8941-misc extcon for USB detection
      commit: f5d7bca55425c8611e6cfa3f236d1f56031920e8
[3/3] arm64: dts: qcom: msm8916-longcheer-l8150: Use &pm8916_usbin extcon
      commit: b30cad26d8030bddeb0ee2373b6d4c1440ffb1a3

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
