Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D826455D0F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240936AbiF0UDn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240881AbiF0UDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:39 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E7F19C2E
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:32 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so14262952fac.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vpytQ6IK3LHhv1gnJRGgBJvht4kouE8pWXZhbVPUcoY=;
        b=clXRi9J22KR7Q0WCcsYy2KqJO2ZGNtEKoTBgEOMW5FF8/RWjDwlP/k6s1znA8vuM+l
         pASvlDtgxxdZzk9vLYn6JRnCH3/PE9yssitL2G+aNpM+ooA/aZds8m1rTr50+3EvnbdR
         t0yliaqVPs+WCS3g7SPbdTwTHG40Z3oIQHWZjMxiU3J4V+a997yfki1XnfrJqfO6sa3Q
         H1QjKvDB0C3Q1lrlR1ovhHgELQwpFiWfSzGv4ljYaqS4vYGsnGEwG/h2Rj9z7y0qMhuo
         EBCu14TgDgHuE3up7YMTThQiZGSQ9iDjAzGGB3qkUx025MUr7i0IP0amfJApl3jBS7nk
         8F/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vpytQ6IK3LHhv1gnJRGgBJvht4kouE8pWXZhbVPUcoY=;
        b=HB47J2c5j35VoIyPyiGSVFzyiGTizvkHtSByD5vWlB7oz+9PY3aaBCr8AFsRGh+Mmp
         5LXL0PgG6U0xlmBN25BifHw2DjnJYj9VFr4ytMApwxV9tL81xIkGJvPp39+jz/chnTve
         HwHUgohh87GqR8YwWC6gIEzPTr04iau2GhO9OnYMPLnZ52cITdbWD1y9IRglBzeg2flu
         /La68LI9jqjzMpcC1kzrEV5P3o1/wIZKrq/QVDGTDHRsU4o1xSViHzILOZoj1Thp8SdB
         g5q8UqLrEE1eUtuf7+pz3+u4czxSRORqZxC5QN+j1pl7sfJAwANlqsJ9qWYBqnmxYDQE
         rTTQ==
X-Gm-Message-State: AJIora81/6EAbh8R/1vwSV7H9c66ZGDyfj+Zy8ROWp5MtM7jbmLiOqoK
        Lryq3RHC1XBDxowMT/YwDNvWjw==
X-Google-Smtp-Source: AGRyM1t/ko3nXIIJekAtfb3y3tIJhPzmV3xURO/JpEzJOfDPMA5uFaoaOJhjRiTroOL/4PprSn3dNA==
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id z3-20020a056870d68300b000deeaa23550mr9209074oap.253.1656360211620;
        Mon, 27 Jun 2022 13:03:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 0/3] clk: qcom: gdsc: add support for collapse-vote registers
Date:   Mon, 27 Jun 2022 15:02:50 -0500
Message-Id: <165636016350.3080661.13379016019370183937.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520100948.19622-1-johan+linaro@kernel.org>
References: <20220520100948.19622-1-johan+linaro@kernel.org>
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

On Fri, 20 May 2022 12:09:45 +0200, Johan Hovold wrote:
> Recent Qualcomm platforms have APCS collapse-vote registers that allow
> for sharing GDSCs with other masters (e.g. LPASS).
> 
> Add support for using such vote registers instead of the control
> register when updating the GDSC power state.
> 
> Note that the gcc-sc8280xp driver has not yet been merged. [1]
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: gdsc: add collapse-bit helper
      commit: e73cb8527c597598599119fcd9c7d1752d9e9fd7
[2/3] clk: qcom: gdsc: add support for collapse-vote registers
      commit: 77ea2bd72da4f61f59ad2e839babe83849f35dea
[3/3] clk: qcom: gcc-sc8280xp: use collapse-voting for PCIe GDSCs
      commit: 8d114b94fc39210b88b203b57aaf04836a87a4f0

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
