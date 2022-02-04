Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4E674A9F22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377562AbiBDSfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377598AbiBDSfe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:35:34 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35E6C06173D
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:35:34 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id s24so1845817oic.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ZqTezHBuGhgK67Y10o9gERImB4iI2LWS93ZFGQu9t0=;
        b=tLGfLqeTG6+sRPpgtZm3DGt/fePxhA1pedwVIJdJx3v2B0O40KPTScjbpsm3Fnj4yp
         ThyNRnFeaEwy52hxvf20QpL89lS6zwNLEcuirYOQA37tcbIdFo99kGy7oJnohkvhQcS3
         XKe1thn8/GViruYOa/y5g8/1JqdaoDk6CmgBuNLwnHZV2dugUoE/R7Vly4j4Fchlu3Np
         6qt2OWbz7XI6qYPTbIRQtZL39S2MOHW1A4TvRRx9bkwYjr2bHYrIzU2XkCCbjzJ03/K+
         GdtsjOgXamQQyJSuYU9hcarTiw7hWSrU0R9qJsnqR9iXrbC9I2TqdTVFdFvhrABEq5QZ
         6pTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ZqTezHBuGhgK67Y10o9gERImB4iI2LWS93ZFGQu9t0=;
        b=ZFRrhe3iYeLGjQAvVi1gQteRK68yNtwppNXsfLgXgEsE/1TzRFzpWPnjuS2/a83zps
         sZRXeGrE9WW3cnv8SYnV9L+R+lFHvMNaNo/iPbSfGysG60nw1NlgJT44Rgxzqs9GVCCF
         lfgf/HKKX5UQ+uOTrqustROGjUnlX43E0J8gNPWohSYi0JgtcEslGeo3z9DqcNDPIJhQ
         CtGSlBe4WfH4bG/o2kzyAvlSIQO8dSR6cLg5iXy2zoxDzFcSfLmowMZYorvcU9GjVU26
         SiyJyg2+tksQGz0loJQz8n377EqNQiLCVyXosglhRLL1zAZk3eZfJp68oeZjB+o1SzZt
         KhoA==
X-Gm-Message-State: AOAM532s80d/NXuYvL8jLG0yfD6nnkPuPN4s8gQRFJT76BvwlcL/kQcs
        poB/FwE7ABedsX5INKYUqbk2YQ==
X-Google-Smtp-Source: ABdhPJz1l+k5xRMlUDXmYxO1f6PWiL5YfAOedX1vUJluqWC+L5JFAvzg3qbGUJqd2T4RjgZ4WptekQ==
X-Received: by 2002:a05:6808:689:: with SMTP id k9mr139333oig.281.1643999734043;
        Fri, 04 Feb 2022 10:35:34 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 100sm1044182oth.75.2022.02.04.10.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:35:33 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Luca Weiss <luca@z3ntu.xyz>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] soc: qcom: ocmem: Fix missing put_device() call in of_get_ocmem
Date:   Fri,  4 Feb 2022 12:35:22 -0600
Message-Id: <164399969245.3386915.4853976609105295640.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220107073126.2335-1-linmq006@gmail.com>
References: <20220107073126.2335-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 7 Jan 2022 07:31:26 +0000, Miaoqian Lin wrote:
> The reference taken by 'of_find_device_by_node()' must be released when
> not needed anymore.
> Add the corresponding 'put_device()' in the error handling path.
> 
> 

Applied, thanks!

[1/1] soc: qcom: ocmem: Fix missing put_device() call in of_get_ocmem
      commit: 0ff027027e05a866491bbb53494f0e2a61354c85

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
