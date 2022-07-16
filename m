Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35EB9576FC8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbiGPPTW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231935AbiGPPTT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:19:19 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A74C1CB38
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:15 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-fe023ab520so12803741fac.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hcSYRznlrOD/DFURZxCB8EBFPEAfx808gDBYygMWkbw=;
        b=gZdF4ckcD4LKBVTLYXsBauBZx1rFKzVid4XN/n7TIiHkfJG5/TJQfMhnDuq5qxiIhk
         425mCE/GZxIDwEI01zqTKLP0EvjfsqIacQngyRNq5xV2z1KBHFrZ9yBcpb21nLndmyvt
         suitiaQbyAPvXcoH+CCNVpmiUOrQgtOZLOVxbcvM8aEw9STbXJ6f11RFENZ020kqNXhg
         /2W9np94EX47VvjoTvsqqceCVHBpG6Eb0zPdHHsO0KfLB5KIJ2adZy+WnM3HJ7ei73gH
         jwORMid2boO+75R/v0FMjuKWrMxsNmtykjv95q40Ck9rWEfKUK9JP+Wxg10N3nZSG5bi
         Xjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hcSYRznlrOD/DFURZxCB8EBFPEAfx808gDBYygMWkbw=;
        b=ROKWhvbwCIwMXimMJaBsOnPWTfeX4RTWEumnNisfw21hf7RgxwZ/5BOF3EkG4Lpw32
         jwNyhO+RnhZ+0GRa4ahsQ8tQkeGDXmCTalwFSol0qmX3dfv3JpA52Hzcpaj3C9dktShK
         DWyMXicpEdzGUlcWj2oRzSjjNCvQMjtRUHVqmfB5ALotNNQwKPHjOZfL2VAD7aHnH/vo
         BsFYMD+6joWddGh7ea3kY7hYlOUvfYkfXyF43KvV+yqVDxNquzMtmCJsvaRaUKifBJu9
         DBH+lp4PosthElsD+nsRQhBB1VcuE0Urn3mO8ZtiFeseA1lsKzhAf8fcWmbIy8OQkxLW
         33zQ==
X-Gm-Message-State: AJIora+QLEaoH3rp1OPYCdW75dXlaLxGHndxnDX3Q13MNCNcMKTdKkZ/
        q/4Z+MDYHvvYA1OqVdKsLCRYuw==
X-Google-Smtp-Source: AGRyM1vlOaikmmmBzvktDG7vbeToMJATn0OahqMwmGy44VSpuIjBFpAt+1Hf+OXoWfKd0G+4ZW6++A==
X-Received: by 2002:a05:6870:d68e:b0:e2:861:8b15 with SMTP id z14-20020a056870d68e00b000e208618b15mr13741361oap.156.1657984754421;
        Sat, 16 Jul 2022 08:19:14 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:19:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v6 4/4] arm: dts: qcom-apq8064: create tsens device node
Date:   Sat, 16 Jul 2022 10:18:57 -0500
Message-Id: <165798474063.1679948.7784256926551377758.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521151437.1489111-5-dmitry.baryshkov@linaro.org>
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org> <20220521151437.1489111-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 21 May 2022 18:14:37 +0300, Dmitry Baryshkov wrote:
> Create separate device node for thermal sensors on apq8064 platform.
> Move related properties to the newly created device tree node.
> This harmonizes apq8064 and ipq8064 device trees and allows gcc device
> to be probed earlier by removing dependency on QFPROM nodes.
> 
> 

Applied, thanks!

[4/4] arm: dts: qcom-apq8064: create tsens device node
      commit: 5142c3926f8fd358a62810cf09adcb128904694b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
