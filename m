Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F97458122
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237822AbhKTX7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237747AbhKTX6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:58:55 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6406C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:51 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id q25so29733424oiw.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QT/9LakYvmo4oV8kwdCxJLgdKPL3jqMBknkwoE9YCYE=;
        b=O2RjbCqc8QPrXAyKcorBw9sG7E40QkQmzPh5kWvJW5LyTGziUR76ey2lXlXiEpLBOx
         5YKgp+8KRpaq3TfAzwu7qlQdH43+7hvw/9/YXp5JsgzhaY3ZjATKZObgtRnqtsTu6vuJ
         FDAU58VpbT5Yn/9vXzL5DyeZrDmY8eVGJ7trH2W7gtSgu/LNwTinFq7DyaYTYk/Upx2e
         irrFsDc5i/oMFiIQwdOrJKlSDbQh3Igm3/ENBVGN8QVinlP/ZKmDp6+4HKDa93qXHLXo
         q3PnTN6t8+AnPJ7Day5EuynSVcxT9zl1cew2ysucbyejXoD2LiWUrD0jllw0lEKjAk8p
         bqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QT/9LakYvmo4oV8kwdCxJLgdKPL3jqMBknkwoE9YCYE=;
        b=7C5sZIpJSk7cwV0KnbwUHxqKaliJNSQkesv5VYTmHVe5wWwRR9lrNC9CN8rhQWfPTM
         RrleVH++T7LvHeoV+cXUQBxMeY5O1gcf8hwzMLCjVFmlDdtMEYx0oHke7DQlkHbgF9Rh
         aRtLXKHQCR/GxQaiGwlkfIwj6Y7mAWPhtnCpU4zfDFEadP9ZpcdVhHHxUxoItaEBySuJ
         3Kx54edOg4pUnWf/I6ndFcxf0pTwX3Dta0MXFDm9Qjm7/yAEXsE6msGO9/jHafZU8blT
         AHENBdOvQGpata28fr8cQ3MlU7SzWsSJIs3oZ/YBMAUhMFaCiBvcsuRxCJbv+wCw9SIF
         nkhA==
X-Gm-Message-State: AOAM532Ded/lladfAV0RnzIzJKWsqS5e0wOu/m0fANQ6htlBQp3D7/v7
        jyb3gHkE3/wLjGToY9LA0newpN+zyj6Ncw==
X-Google-Smtp-Source: ABdhPJwCLy/Cl846Jg9EVSgQcb4RkktPIuKRCnx26gUQVcLOmrVyYLO5J6txySDtVJQzBcljv4RrOg==
X-Received: by 2002:a05:6808:228c:: with SMTP id bo12mr10183181oib.93.1637452550977;
        Sat, 20 Nov 2021 15:55:50 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:50 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        robh+dt@kernel.org, agross@kernel.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        stanimir.varbanov@linaro.org, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: Re: (subset) [PATCH v7] arm64: dts: qcom: sc7280: Add venus DT node
Date:   Sat, 20 Nov 2021 17:55:27 -0600
Message-Id: <163745250541.1078332.8582779710145477282.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1635259922-25378-1-git-send-email-quic_dikshita@quicinc.com>
References: <1635259922-25378-1-git-send-email-quic_dikshita@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Oct 2021 20:22:02 +0530, Dikshita Agarwal wrote:
> From: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> Add DT entries for the sc7280 venus encoder/decoder.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Add venus DT node
      commit: 37613aee217928dddf62d91d3db831827f860833

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
