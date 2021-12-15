Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4234765AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbhLOW1z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbhLOW1w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:27:52 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F25C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:52 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso26660677otj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NwUvxEHLKrDSolFxTWG/WGpNg3gCnmJHq3/Wqr5qHB8=;
        b=Nz1p4rNYMSm2m+0tyBbmuTxodnsB6hf1MMRjozccr5LflM3ROlpaelQAcCBemFU9T1
         hLNL+3sNHjWtsX3GZcxNh2jCGiIWMImZvYnRfoNk7UOUcmuVB1xTNfoa3qGDUojA1kk0
         5FarN/LgVXQYqx0hJ5sluT58dgmxniK6aj2GghAzrw+7ksc0qlhfCJMeqGc9xW2Xub88
         7AzRzYFNJRM5ejJTzhUFG9RDxYBmVi4LSNc+uPEkuXHl2Ub9WNDfm+2CygpplgkCQkYE
         EihmltkMQeNkBoOc3tPt5Nuvqr8BT4MJKeaLdU3VkKTSiJ6lmpKwhegluyG0UOwXAaNn
         NorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NwUvxEHLKrDSolFxTWG/WGpNg3gCnmJHq3/Wqr5qHB8=;
        b=UMQ7E20a0BFEqv6ASdjiihxh+++W8js7Beh1D3O/kQ09nfgx1ZyXu8+ik4hRJ/QoJA
         YguwydqumFA6apWMtllM6G+pLbRsp6EShykClM/nD+kN8KkrfYp8Gx0gK73ZEz8bvD4d
         bXmQHdpnJ5cAkx2Ldh0iC6iJhg5dKtX4LIGd6lFBQ6+ZAhJrkFL7iweYAEVixovBRR9a
         Gv4GL6ElsburvEuRH0ehWZAqJZSGxe04OUsvqQmgN97hbO4PR5CO32E9/V9GIWx9wUsk
         DqruT0oZ0yvh5I5suBNaPEp3QUKcc3vEVHo8wviwGe4zwjp1klkuPa3FaygtUqrgYbLy
         ozRg==
X-Gm-Message-State: AOAM533oVsDr2eQnALOlnnL3C704v86vV1GyDsgyhXu4Vw9AxBTpHoU8
        f/EcOsMQLfhLAMF95g4GnaNsqw==
X-Google-Smtp-Source: ABdhPJxEPv32e4bV/5S1vxVQvv0lb10hgyL7Tv5s8IgTQceLaNKMaPbF757eEcMfl1AMJTa2lHcIEg==
X-Received: by 2002:a05:6830:195:: with SMTP id q21mr10316395ota.355.1639607271410;
        Wed, 15 Dec 2021 14:27:51 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:51 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Julian Ribbeck <julian.ribbeck@gmx.de>
Cc:     linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: Add device tree for Samsung J5 2015 (samsung-j5)
Date:   Wed, 15 Dec 2021 16:27:23 -0600
Message-Id: <163960723734.3062250.12078964213468371215.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211116200734.73920-1-julian.ribbeck@gmx.de>
References: <20211116200734.73920-1-julian.ribbeck@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 Nov 2021 21:07:34 +0100, Julian Ribbeck wrote:
> Samsung J5 2015 is a MSM8916 based Smartphone. It is similar to some of the
> other MSM8916 devices, especially the Samsung ones.
> 
> With this patch initial support for the following is added:
>   - eMMC/SD card
>   - Buttons
>   - USB (although no suiting MUIC driver currently)
>   - UART (untested for lack of equipment)
>   - WiFi/Bluetooth (WCNSS)
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Add device tree for Samsung J5 2015 (samsung-j5)
      commit: bd943653b10dc9df63ad6cb69f520c10f3f21372

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
