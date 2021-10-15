Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAF642FA29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 19:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242495AbhJORZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 13:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242336AbhJORZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 13:25:24 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92506C0617AD
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 10:22:29 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id i1-20020a4ab241000000b002b7069d0e88so3208673ooo.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kJaOC+igESCxHZ0vSXJ7r3WczPiGs7VUV72llPTS2Uk=;
        b=A+aVvtFyb8ZzRtWmDzfa0VG6m5m4ixVZqdZL3S7A65QKwyzPJw22PbxU3xVHazGm9R
         gSmmpldx8T7i8XJssZooB9Cg18uPB+UOETODn9SpBtw5rKCox7UYjbpOpOR8bWgYKznr
         qpSsYXnA5H/7MGyEbgczWuxqaXxbH8f9fRbIqc3Lf4sAyLySXIFpwo8kIqGShi7EWZ9d
         skqRN9I3HI6yuc2eIvOBLKXtw3cY7bNrnHXd6zJqZviQglX1A3iyLFX6+rUyJXRDzfqv
         m50wiFxiUxls3fnjiVZFeUJzJnCZ2UspX1y6s2B7/rvQks6+O2iM1G57dog9O6y0/VQz
         BDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kJaOC+igESCxHZ0vSXJ7r3WczPiGs7VUV72llPTS2Uk=;
        b=nHFdSoP/piPQ3WGNKen0XDKVbnATxlB6e21rOXZL+5gmNNvBYs58alzOIJFieLLus3
         hucH4pIrozgSv5HY+GX9EjaygII1gJ0Q3EOlE1mzA0D92qT/71vzVx0sv4DcDD8fraMC
         Mees9u2aLzjChDe8sgIXMWUh12Q1PtaB0X85BdEbkasklJzb/JfaKmm7C7x0My4OF3pS
         IAXFNIHDA6if5LkqUJo7UxF38CJeA3+kKU50+0ziHxZGcy5kqFo2uFZHBIdqgOGVir4t
         s8TkV+Onp8+vs2opIUgRLTpx0MSUnAHLP1OtDnukHEajTxjOgTG3SLiUE2znb3j5fBei
         9DOQ==
X-Gm-Message-State: AOAM530qpj6npydvMzxgFf/pQUHmAwir/UIlJJCu+pkUwsXsogW1wk2r
        UQlL/8gL/Qc3BuO4KqznpVKcqg==
X-Google-Smtp-Source: ABdhPJzAgZdCsdlc8CdqRpH5laQZnFJ2Ly1chA6vVUc/nvd52UGsVuCVUlWZXSr1DTZCvOIMT6rQLw==
X-Received: by 2002:a4a:d5c8:: with SMTP id a8mr9422889oot.18.1634318548918;
        Fri, 15 Oct 2021 10:22:28 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s206sm1289635oia.33.2021.10.15.10.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:22:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mathieu.poirier@linaro.org, agross@kernel.org,
        zhaoxiao <long870912@gmail.com>, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] remoteproc: qcom_q6v5_mss: Use devm_platform_ioremap_resource_byname() to simplify code
Date:   Fri, 15 Oct 2021 12:22:19 -0500
Message-Id: <163431847249.251657.1271402903289939838.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210906071147.9095-1-long870912@gmail.com>
References: <20210906071147.9095-1-long870912@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Sep 2021 15:11:47 +0800, zhaoxiao wrote:
> In this function, devm_platform_ioremap_resource_byname() should be
> suitable to simplify code.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_mss: Use devm_platform_ioremap_resource_byname() to simplify code
      commit: 9db9c738ac89fb1c408c4ec819633540856ea62f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
