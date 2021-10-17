Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A11430A17
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344000AbhJQPdd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241982AbhJQPdb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:33:31 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9372C061768
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:21 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id n64so20954503oih.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X1BNeRRH+4pCFYNacV/SnSRJ6/WkMTg9riRV4NgpWaI=;
        b=inBJGGXIeipJ60XqJEqfNPYwCvRqERJvdfzckXf/FQlU71wzj2xsmJCKM9jT7XzJ/2
         BC9S7duklDKg5BtPmWacZJd0pbyzXWhjYFPwV+5XdqS8ZbWmSqmfYosZf63fwiB+OxMF
         GzLqRQ0zFHW8s/kfc0bpv4ca4k4uTTtgD92PaWv5hJPyZy2iBCUxzQXO+XTUdzZzyscI
         dVHv7mVozrZE4TxH9tU5IgepLQkIAVirLb+Q5GJz8va0OLNOfvIuZ4VlUnV8p2DEphXv
         omswBq76lmR2CB+tZAtCRdRhlDXXNqz66pJdfAqsY9WrKiveeGckR6p1ZKAFC4KWHP/i
         qmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X1BNeRRH+4pCFYNacV/SnSRJ6/WkMTg9riRV4NgpWaI=;
        b=SSn4NH9UKYIVtzST4Cv6x39x/gTLCQXombNZiWUjIcOCdZdzPtEVBai9YzruMJJ8OI
         Nw+PAUlDXHxim+kbS4nrubaRJTUjBjGnk/swrfKrKUroKbSpEf+5OllJEdsnrbKNms1+
         SszVoGy2WybMUjJnQnzUWz/DVUkwwn8gY+hpHb69TeS/Gake1l2a2UF1sha3QLRSAwfi
         fsaEg6c5Rw1WB9ZpBSxAlys/Y3Wu4/aDRV8HMgcvBHT4Ks2Bh749h4u1ECRteOCEbQ8G
         ldKxXlJsnCjgSHU6H8efNdtXbqBIJzXZXKLtBU12dh4iYS05QJJyAvKrAHd4QC4SImZ1
         axdw==
X-Gm-Message-State: AOAM530aCO3we04yaJO0C3zxYELMYhbGatXgQdIHb6FXM9iEU000ETh6
        xa5kFnrSaOVtz+ySpQvb1kiYUg==
X-Google-Smtp-Source: ABdhPJwNs6CeqlgS6OrYQ39EbXlETugWmu6Cbv6RgS/P1oLqmnnKTp0wpWhxbPZRXkjeOYXTmmJ9PQ==
X-Received: by 2002:a05:6808:308e:: with SMTP id bl14mr8869305oib.92.1634484681347;
        Sun, 17 Oct 2021 08:31:21 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id x6sm2565698otp.49.2021.10.17.08.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 08:31:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] dt-bindings: soc: smem: Make indirection optional
Date:   Sun, 17 Oct 2021 10:31:06 -0500
Message-Id: <163448466184.410927.8544390085953194195.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210930182111.57353-1-bjorn.andersson@linaro.org>
References: <20210930182111.57353-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Sep 2021 11:21:07 -0700, Bjorn Andersson wrote:
> In the modern Qualcomm platform there's no reason for having smem as a
> separate node, so let's change this.
> 
> Bjorn Andersson (4):
>   dt-bindings: sram: Document qcom,rpm-msg-ram
>   dt-bindings: soc: smem: Make indirection optional
>   soc: qcom: smem: Support reserved-memory description
>   arm64: dts: qcom: sdm845: Drop standalone smem node
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sdm845: Drop standalone smem node
      commit: 622adb84b3e7c48a888c3df26fbf28679ded660b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
