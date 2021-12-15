Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAAA4765D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbhLOW2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:28:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbhLOW2K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:28:10 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BC1C061377
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:07 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id u74so33675125oie.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SK63vxKrZwaNQvieiGIU0vVsUkzcjcWKDTfGdB9aCuE=;
        b=yYpTB0XEYF4R3lVYu9gBMnvU9dq/b1JGiSaUBD59DARHi40AR11EdR+NmFkbVMYaK1
         k0gydFmcsBOKAVcOqA/A/uT0816Sijhphqsb7wPopl3az1OVZivWNaxEPIUm0o+Ii0ee
         fnFb/j45l/gznUlkZRy/FRpUtmyX7a3vGD6ehcnGUgOd7kNNu2Df9TMS5WZJFvzxW9vr
         ZsJ42hwxcgWRGuXvzzzadHMeSl4q4MeZGU5kMq9U1xcM93ItsMdMkPHgcAcbm7cAAHcv
         WzZlQh3dEOnM6nkdNm55MnTdP4hei0QTs4Jpf9DbpfHhyIK2iOissN3ZGj/S1uUanfLy
         uamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SK63vxKrZwaNQvieiGIU0vVsUkzcjcWKDTfGdB9aCuE=;
        b=lIere6Bul6mRQt1aZxswT1hyxZjNJl4q22xo/VP4gIPAZMtZAdETbKMUWozFnn/QOy
         SY7daAekzg987mHtElubtqIDQ35KRlXeC/VX2GRC63XHAg/ZNemV6K5OlGYrPElzrrYf
         c2P4eIGVHAo7xEJKj6V2RNmpTAIDdom35sgSmlGhG88cZDICcSliLCaXSN4fi8IuEbYl
         H+8FPR2jUILBbg/HDQoJpEkJkh6it7JF2mj6CjOR1g6bR6o/LxERd20wM7Q0evIQv0Yn
         a+NB1XWipYdfHkz4DyfvMHFf6T5yQ3caRepZWWTMBBaNWNXHuCHTiW8+MqkAZXrtbe7P
         VOPA==
X-Gm-Message-State: AOAM533EhM296U+08Tgyv9KMlQHQCMYu9YJK+CpeH8mUeMbCh3bxbHGx
        y6TailnEMrjF7lyWKq+FSoT0wA==
X-Google-Smtp-Source: ABdhPJyfrJB+bp/wlYelJ7JQQC102saJenkrO5gIDWvQ7uaFfm5k9fsdVDv8UMSZ52c3c2hIYJRb7g==
X-Received: by 2002:a05:6808:609:: with SMTP id y9mr1884494oih.178.1639607286701;
        Wed, 15 Dec 2021 14:28:06 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:28:06 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vamsi Krishna Lanka <quic_vamslank@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: clock: Add SM8450 GCC clock bindings
Date:   Wed, 15 Dec 2021 16:27:39 -0600
Message-Id: <163960723735.3062250.8848555721887430569.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207114003.100693-2-vkoul@kernel.org>
References: <20211207114003.100693-1-vkoul@kernel.org> <20211207114003.100693-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 7 Dec 2021 17:10:02 +0530, Vinod Koul wrote:
> Add device tree bindings for global clock controller on SM8450 SoCs.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: Add SM8450 GCC clock bindings
      commit: 72a0ca203ca7fae34fe61668906fe483b97d9039

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
