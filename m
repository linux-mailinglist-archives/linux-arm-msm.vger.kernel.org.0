Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5014765AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 23:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhLOW1x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 17:27:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhLOW1u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 17:27:50 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E79CC06173F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:50 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id x3-20020a05683000c300b0057a5318c517so26594607oto.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 14:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3woIFShbDmzf9wnXEZVDBVWncGxHDDKs/+W+xxlc+zg=;
        b=RUBVQhZ5FG3Nt1WxXGhTwYxiZstvItSS2n4Hk4MPq/z/r4G1/gQoabeWh1bePaEM2E
         1Pa2rdBZmojOp0DZOlzzwKr80gvAv/UNZAd3NQk7I1TJUMl9UcLLeZQzdZOS72275oWn
         F5qmr1NqPMxBpa15uqM+6sL9kpazcyvPLJlZreEJ0QVvsPGS185nDOfbIwx+ym+vsE1d
         lWjS9y6MniBVcUW8233N+AC+fuKUc8+n5QXG8RlbMTBegoL855szBUmd+1PkmSsWmA7+
         vxvBgzJFk8ahmrSvFzpRJJg164w3C6C6WNNdd4ii8mK72uCth5iB+3oYKUkA78VfUn0h
         SE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3woIFShbDmzf9wnXEZVDBVWncGxHDDKs/+W+xxlc+zg=;
        b=8FaXJcPvLEBCuWgJH6u7ADiNbAJrACMk1VLaK0xgTmH+QXu65Kfr+Pvqn+HOwcgMKx
         fjJCfVV2i4Qo9itnMgapYnR7daXgXtQvxALQlsThXx5kxnm6KCmUqrR9oNso3dU+Wb3/
         l0n7U4vyS3cHQpR10dGah3vUoZ5VT+39FZJ7VgJ1dHcEVzC8DWYCTIQQEznOK5FD9eBf
         pWZfmheKjLnAZ320wV7FIWw6zvo206jiphP+7cwzaOyY6xjISGFWXZSpv7+sLscJNy/C
         qeK40B/ntbSOuZvhNYA0bDGdwAPi7kisDoZp/5kUEO4vbbXTxqCEMth+XjGPF58bw530
         DsRQ==
X-Gm-Message-State: AOAM5336ItalDfgRRZk9Y3YGeWIU+pyT7f+hnaTZXMW/LJ0fRTahBU+J
        5LWLHoi/oeqtMtowLvnhhd1Ls/rdi1r2jA==
X-Google-Smtp-Source: ABdhPJysVLDI2muvhBAquJr9/wRRbusyuNh9jJzwQG+htSd/FO5gCR3DHhz1Af1bHKV1zX4rTUq85g==
X-Received: by 2002:a9d:6a56:: with SMTP id h22mr10480462otn.135.1639607269728;
        Wed, 15 Dec 2021 14:27:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:49 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~okias/devicetree@lists.sr.ht, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sdm845: add QFPROM chipset specific compatible
Date:   Wed, 15 Dec 2021 16:27:21 -0600
Message-Id: <163960723735.3062250.13664178993788316936.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211213190228.106924-1-david@ixit.cz>
References: <20211213190228.106924-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Dec 2021 20:02:28 +0100, David Heidelberg wrote:
> Use correct compatible according to dt-binding.
> 
> Fixes + few other lines of `make qcom/sdm845-oneplus-fajita.dtb`:
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: qfprom@784000: compatible: ['qcom,qfprom'] is too short
>         From schema: Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845: add QFPROM chipset specific compatible
      commit: c8b9d64bb262033775ff64dde6ca7cf18899651b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
