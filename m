Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7867F55EF65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbiF1UXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbiF1UVk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:40 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6601964FA
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:36 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 73-20020a9d084f000000b00616b04c7656so9236181oty.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VHrN/Oxxf35D3M+A4ASVVo4AXIbjxEuhMehr+bJZKZk=;
        b=B/v3D5svjuBFLzOL8VzgQJkhF0VdwlREaHaC4TsKMch8wGlPNksdnqPS0DXLYT7GPZ
         8QYEFiaMQJE8BRJUTVVWoGKj8dQlviSVvxuNMKVvRKy4TrcIep4tN3euFg3jSNSITPiT
         RyKmXeu6XnWu1jQa7W5q52rRU5kwe3yuVoA6hQhS9pHusdiXxFGWSsOhgIX7tm9OmpLB
         XhOMGIUIEn4v8rFRblfGuFAcZia1V0juR6yOQOiSdbgeKQQaH2d2H1AsvwWJL7qnxK9y
         IAh03PJOF+bhULSqVIn4zRNp/i0VGAK5WVjlLLCV4zebhPYBaSV69KLRzApSJUfkMbQL
         tqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VHrN/Oxxf35D3M+A4ASVVo4AXIbjxEuhMehr+bJZKZk=;
        b=APXFbnPf+GXR0JveuASMOLbdpNO9Bao9UdqNqRRdpSq0eqLQ09rq/XtPtEvyDHG23L
         R6nt2/7cK4v/SyHanFYNeCGtP1q++1uqNK5t5Ajon0zoM3uaYSmNtJKgHpUIDauNDFU/
         hgMjJAKo3lyfUuVukoaqC58f+iYtup19iXWgGAK42M0LW8Z3945Yf66fcdH+gV1XV7Zx
         ouWDuU9CaP8KgnsYzr4bfmtB3sVdNzWH2txrt1xaRYhPdjXTGGpbhFJTPgaDJbBf2SgW
         c3jrIy74drLoMniBWBsKm+ODkv1bKJDlJpB3O2QmjlDH4A6D0u5+v/db6ZhCnQ5IrW5a
         +exA==
X-Gm-Message-State: AJIora+seNUXsCq73ln82KYlpb/skwbsCi0FP6SPw++lq74NAAIvHtpJ
        C9uF4+kknEXe3+/Qm0hpT9aCDMKRCnLb9Q==
X-Google-Smtp-Source: AGRyM1sPJhvyMknN/nwu+IU7uPEKW5OwqDp2rh4N54sd0eJEeitwSz/E7S8HBXOZoX3bnieDIZ6S+Q==
X-Received: by 2002:a05:6830:2801:b0:60c:76b1:d23c with SMTP id w1-20020a056830280100b0060c76b1d23cmr9459452otu.154.1656447575670;
        Tue, 28 Jun 2022 13:19:35 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:34 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org,
        Li kunyu <kunyu@nfschina.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] drivers: the return value statement of the gcc_sm6350_probe function has an extra semicolon
Date:   Tue, 28 Jun 2022 15:19:05 -0500
Message-Id: <165644753306.10525.6775278248022275480.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220627020500.135125-1-kunyu@nfschina.com>
References: <20220627020500.135125-1-kunyu@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Jun 2022 10:05:00 +0800, Li kunyu wrote:
> I think this semicolon could be deleted.
> 
> 

Applied, thanks!

[1/1] drivers: the return value statement of the gcc_sm6350_probe function has an extra semicolon
      commit: 255a47e745674dbbda9250ae0ad1f78a49179988

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
