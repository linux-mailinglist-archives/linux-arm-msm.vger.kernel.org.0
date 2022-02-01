Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58CD74A5625
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbiBAFUM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233618AbiBAFUL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:11 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CCBC06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:11 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id m10so6177348oie.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W3pkuXcD6//2M4IafSNtYUk0ekeqEUBNIypKPlcgXSg=;
        b=NGaVgCVpuCF7KW9wQEbk/yftac+yJ4TTG6i1IzF/n47+5Mc2D8OINvU06KfuaLBRXF
         gpnD2XtD1IEpYAh415FTi29uaGHURLWzJOse7iFZMiGI+zaJ4PvGHOb+rrCT/gmgwBZh
         gSaMmIJsMLP2gKUkzP6udbMqV/3JIFjIqCV1xmtZ5BPyQELQjo0nSYXxDBnHHCryQp32
         2CpCVCLsad1sODHh8dOoRi9k3n03qQcNBqv9JsvoVUEdJkIgioWXmP93yLh7hhQ/U0cc
         ueJMvHGxErnAiZarKMhjoOrQ4VFaQjkUbVIqViaj2chDIT63he30WFM9Mw0jCfARBQKd
         86kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W3pkuXcD6//2M4IafSNtYUk0ekeqEUBNIypKPlcgXSg=;
        b=FbBdu+2efeDqGZY309pF/KZSq1lVQ7QNYEnWjwwKqMA2WRr24Dm6Dzozsiwg2uBrCg
         pQxxl5aHTQs4RUM5TqCpgsxK0QU+YtVojg4zRfuVzjFx0XqLu6sL2jfwRTM5tE/PZXKV
         C+bdQf5Vq5E/Lc8Cd1liLAKGwCzw2B7KqSpbO1x0j/oOMlFXAF0srxqvwdA5rCcEZxe/
         b2VbTAVcvu8fxlfXEx4B6xHSVpmgR//JYNjtcHzdymFvWLIuJd39vZKXca70DrIqYQBJ
         GsV2/4dftS3rI1//LmmTLLvgaiqDD8lWE4tZ+JLg/Fs1Ylt/bLgjEpWSkVmfeHOZ4Zs9
         CTxg==
X-Gm-Message-State: AOAM532FgdvPtBaECTm9xW2sElTQChH/E5bj2xgbI7kM3Ew5dfGRq4V9
        CkZSxZIRltL6M2I6Oi2kfPa7XA==
X-Google-Smtp-Source: ABdhPJyf+Wbq4ePHvO/Z19AWRX3YaNZ61EuN8lo4bOYD6TfN0gDQgCabFLnPy4NGWrQUZWX7OykxAg==
X-Received: by 2002:a05:6808:e85:: with SMTP id k5mr223269oil.238.1643692810811;
        Mon, 31 Jan 2022 21:20:10 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:10 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Baruch Siach <baruch@tkos.co.il>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Robert Marko <robert.marko@sartura.hr>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Baruch Siach <baruch.siach@siklu.com>
Subject: Re: (subset) [PATCH v4 1/3] arm64: dts: qcom: ipq6018: add pcie max-link-speed
Date:   Mon, 31 Jan 2022 23:19:20 -0600
Message-Id: <164369277344.3095904.10731707140943455148.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <fcf41277cf8529437374a5c10b2b1fcad30cd7c2.1640587131.git.baruch@tkos.co.il>
References: <cover.1640587131.git.baruch@tkos.co.il> <fcf41277cf8529437374a5c10b2b1fcad30cd7c2.1640587131.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Dec 2021 08:46:03 +0200, Baruch Siach wrote:
> From: Baruch Siach <baruch.siach@siklu.com>
> 
> Add the generic 'max-link-speed' property to describe the IPQ6018 PCIe
> link generation limit. This allows the generic dwc code to configure the
> link speed correctly.
> 
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: ipq6018: add pcie max-link-speed
      commit: e3e8a472429923d1c430bf388e9e3df1d9cc63a7

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
