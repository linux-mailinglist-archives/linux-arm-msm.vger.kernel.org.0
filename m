Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99FDF46511D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 16:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350767AbhLAPQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 10:16:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350452AbhLAPQd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 10:16:33 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197C0C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 07:13:12 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id bj13so49142519oib.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 07:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CNXwuNajRVo+QCNGz+v+sL5PlFLUQrYaYXHbOY04Ehg=;
        b=xJQX3nUfDrLZdLQBMNXMjHvZgNH6jXyjVGbxZXzTJYG+QXOGUF63HsM+r5vSXOEu3u
         4Tr0hCaLKSdULsCOV4NDOoQnlcRaK6UUirP+ExOoKDpJv4HstrvCb4y2bc5tSiCqRBZd
         8EGCyCuOHl874DVGr5ZaSFIBQPZwUmc+uPN6n7CcTHHktSanfeWOZCIRLiWvTIrZO0kP
         CKm6BSOHqp05tV53vqGlxV7xcrzADozHgLguma4RqJJo4FziInV+RyjB6Nw9lzacX0Bq
         f0FD5igrmlb5OkxHMKj6ZCsSlLP0c0oXjyHOixs9KTdhcOatggiOEd/L6W4hpnrdGyNa
         f2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CNXwuNajRVo+QCNGz+v+sL5PlFLUQrYaYXHbOY04Ehg=;
        b=M1YTK2XxKkhkeNSO4IQsLo7F33k3XCvSj428L2su5dlAP8hkMXx+2kjmgTfOQ6b8JY
         KokxsRzKtRROVy3iVMbKPi1pmDeDLgmRwhNk/XTheOlHCcAeALebC/QsDHkxlSrDjbHp
         EmBiQugh1g8+VRwfQkxRREFiKLarbkUWhCOgrzOxE3LLlayTIGwjYql8OKWIytqXl40u
         y0avzjlhHzfVj9uYOblfF7Yt1ua1Bds/iF8kqrrUYGHYAuIrkOU0klXE12t5xdhslqCv
         U6X8pGkxmymElU+4PO6wr5rEpdCOnyuhwNcX/QsRAJz4UptuHDe6gnBpi78dYGTL6hts
         075Q==
X-Gm-Message-State: AOAM53136V25V4rrR7bgpiE2IaKqEih6a7QNUXyEnCUQeIsmsR/e5Iun
        yPcicosQs5sh2e7JEypGRKcTYg==
X-Google-Smtp-Source: ABdhPJwc/xoogwOrCik8phD86EfKrG2Y4083asIc2Kn7alDnE1kOIjzj7GX3bhBjZuD1/+UwgwGFCQ==
X-Received: by 2002:a05:6808:1589:: with SMTP id t9mr6770036oiw.108.1638371591498;
        Wed, 01 Dec 2021 07:13:11 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id be12sm33933oib.50.2021.12.01.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 07:13:10 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        martin.botka@somainline.org, jamipkettunen@somainline.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH v2 2/2] soc: qcom: llcc: Add configuration data for SM8350
Date:   Wed,  1 Dec 2021 09:12:58 -0600
Message-Id: <163837153032.1905338.921912577848816065.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211121002050.36977-2-konrad.dybcio@somainline.org>
References: <20211121002050.36977-1-konrad.dybcio@somainline.org> <20211121002050.36977-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 21 Nov 2021 01:20:46 +0100, Konrad Dybcio wrote:
> Add LLCC configuration data for SM8350 SoC.
> 
> 

Applied, thanks!

[2/2] soc: qcom: llcc: Add configuration data for SM8350
      commit: 31c1dbe43cb69bcba6fd1926f4a80d101e8848f5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
