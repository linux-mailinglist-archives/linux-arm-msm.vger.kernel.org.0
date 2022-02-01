Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A510F4A5632
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbiBAFUR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233707AbiBAFUQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:16 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A238C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:16 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id l12-20020a0568302b0c00b005a4856ff4ceso7027037otv.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g+6xVlRHZ5MT+Inx9k6AWb3AGoOMLsKW6sp1bpZjTNI=;
        b=Y1m8FVJnQW262dAUik4xD9cR1LocT1+w4tY6UC0EuMwQhLVE05vLgCdT5xNpdtzzoo
         2r+0mIn3dwR8/N3KKePIDLiNIbpHvLm8uWp3/9Q/JODjqasrnbnAfYcg7U8gcYY7hjyl
         e6yPrR3BjRx8jBVotvWY7FhDe+ocCtYCWLpVvTB6hgqpY7EsgrXKN/5YrFo0yeCliyPI
         kh1BpL3bTjbY8hjCxWMBo7ddJQCsZRM88HlLqwZDZ/QZ4Zq0ZK9Z92uIdOZryb2g2u4F
         rNH2r3LEX+VF/mMT0U7BY6w8nACEjVGjl9//h76KViWgE6tqFcIE8uercXaHqxisvDwN
         w7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g+6xVlRHZ5MT+Inx9k6AWb3AGoOMLsKW6sp1bpZjTNI=;
        b=ypHO94/rF1HI18w353QbngG84TIbo6amNf4sV6B7udjkcBcCFQFrZCtnnFNYlogEnz
         7k81D2FivbMwyVI1ZC/OVP9rL7jJ4URGyNJ2/GjO9aHSEf0+EuIrz5Ow9tpp3wWXywy9
         X8/GYdS1gcVp5jrFQJRCFdPhuOFFnTq+TYEevlS2Fa1KJHIPpbZNkEgLYFNIXoOQwdse
         Be27scWJQbyZTvHooUmUZyp2yJseXQSRwzFLMGTzPamR+po8FNYvo8N9rufItqpII6f5
         uhbMxmeewmautTGbWNEP4U0XMRNSgpTef/GcZ8ooE21QMjYJ2mylhv2q3h8aIEgwKgIf
         bGmQ==
X-Gm-Message-State: AOAM530CVSQlwMKx+34W50vquup88ce0uTb2nn9NSnLkSPcO1pOhUNat
        5pFfJ8MACdHolVRdfqQ57DCnyA==
X-Google-Smtp-Source: ABdhPJyotraUmLUEPaIYf36doS9+10BrZz23TPtFA99aAfq/lnnzNXRueRNgVmhdHiSrUQlpz+ACSw==
X-Received: by 2002:a9d:4b0d:: with SMTP id q13mr12970197otf.67.1643692815824;
        Mon, 31 Jan 2022 21:20:15 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:15 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Pavel Kubelun <be.dissent@gmail.com>,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH v1] ARM: dts: qcom: ipq4019: fix sleep clock
Date:   Mon, 31 Jan 2022 23:19:25 -0600
Message-Id: <164369277343.3095904.2268876631029229883.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220170352.34591-1-chunkeey@gmail.com>
References: <20211220170352.34591-1-chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Dec 2021 18:03:52 +0100, Christian Lamparter wrote:
> From: Pavel Kubelun <be.dissent@gmail.com>
> 
> It seems like sleep_clk was copied from ipq806x.
> Fix ipq40xx sleep_clk to the value QSDK defines.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: ipq4019: fix sleep clock
      commit: 3d7e7980993d2c1ae42d3d314040fc2de6a9c45f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
