Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67AA047F089
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Dec 2021 19:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353423AbhLXSMJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Dec 2021 13:12:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353425AbhLXSMG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Dec 2021 13:12:06 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFA7C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Dec 2021 10:12:06 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so11863864otj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Dec 2021 10:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=givG84UFD4gNa7xeZxhpUFNzV7usFzOyWYPoeEhti1E=;
        b=u6mcMpK3feWBd6geWPTXyLMyawyZJpHes483r06hwk4TL08UdY/o+mkrGSwemRxHiD
         ZZ7CP4EMtJmhQAjbFyd+PmTi9B9tYwhKjPEeK1CX7boCoOiRvIIb78+/kWSgsLYcTUa0
         uGCc4Euyn4JDqSyTZ53vg5BjAtvymuzBLH9be9Wkn4qXFREn2d9CrkKXRGz95cFby8Hi
         BOfICf98sWXKZ1I2E9tnSeeyZI3D9hcIGK+9N7Ff5p64zCQxrODNtNE2xXTe4NHtdSE/
         xFuQ/6hiR4BpJV0MPUA76GDP4p5JvxnOcaLeTQdSSnQMUHjqaYPa6od5BqPQFKilo49D
         dkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=givG84UFD4gNa7xeZxhpUFNzV7usFzOyWYPoeEhti1E=;
        b=3ToQrXsprfrpVRcq0jJjBRKgL6NIDJewpYoUxESRzJYsvF0yR068T8aRxDlx0topXF
         wi/6FNz8lxD3jCtldWQgRHWyIVgcF4MOyUSu4iAj3cKRpjgIY547A0kSRrwfhqZN6s3x
         +5Z7f2HxaRp5CVhGqV4EJEM0Ss9QwpNHg98CJ3cNfEVnkhiMH3VwiyUhWnkhTvHt9TYT
         YHM9Amz2b7kDMDS5uYvdmcx5bsN8JzWf8I7cVEnPAbXAiFztQR0jWMaTmN+y0qr+GELl
         XIq1wc5ARkqtFpV0zLYYIT9ihNrQOEuaH9+wJdDP4aH8e+rMb/OzxlXa0hD7Ql1i3d36
         vYUQ==
X-Gm-Message-State: AOAM532dBfaJyR44RJG8MvmLNuiGyXIliBkd3C7O/i/gYXpMQk55I64a
        xP1t6M+dgSJETaZ0JMnGy4y9Eg==
X-Google-Smtp-Source: ABdhPJxW3loolgEUsdpaDRQ7lS5/U7vOfjUzMzyHJ9fnLd3MTMl54ab6cZ2PFwTgKxJrqYrZkYG0AA==
X-Received: by 2002:a9d:66d:: with SMTP id 100mr5357747otn.40.1640369525626;
        Fri, 24 Dec 2021 10:12:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 186sm1740772oig.28.2021.12.24.10.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 10:12:05 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     ~okias/devicetree@lists.sr.ht, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: use standartized naming for spmi node
Date:   Fri, 24 Dec 2021 12:12:01 -0600
Message-Id: <164036951699.3936163.2946375253138631316.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211224163107.53708-1-david@ixit.cz>
References: <20211224163107.53708-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Dec 2021 17:31:07 +0100, David Heidelberg wrote:
> Following naming convention, rename qcom,spmi@ node to spmi@
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996: use standartized naming for spmi node
      commit: 22cc83a0cee99d5cc50be20103fab3b303db51ea

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
