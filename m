Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63225579227
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 06:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbiGSEsU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 00:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234327AbiGSEsQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 00:48:16 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B77E3AB37
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:15 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10c8e8d973eso29318187fac.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 21:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8aJymfMTLF3V7ElX+b3QpJ+uAT3GT/5Q9yr/dFcNEhs=;
        b=vaKuG49TyhspbeY60kzZ6Im+k6xB5DEp9boY/8u3C6+YuM7Quo8zoXp0IiwwvMtxmU
         VXCgRWsb+lwpQfoVDwiQ73gnlkKo6WC8W8VA65guUg3D55tCqB1GYsGHeKLOcbCEzaB/
         BUc5PWm7ORAlDOM97jtyT+CLKNfmbAkWOKmtZjsrmCvJSFh+SwBWtIrzu+bgpjaBIEk/
         SfLonku3BdT8K0+nGwDZsiM5PjLpDVGPDNpl/vEFoKwVbpzvaxrG66Hl5ka1AiQ9AzdY
         tOqjKEuMcYMNPe6GuVWzOvL5/4I9Wy408AJFMpDsWdJONSblT0RJ/KrrT+DnJyuFWKRl
         XQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8aJymfMTLF3V7ElX+b3QpJ+uAT3GT/5Q9yr/dFcNEhs=;
        b=4bYLTFZ46H7uwiE0B1y+JczIn0m+SCAFG/Sr6aK2ZbC6nGaZsjKSBEBvax4wWGTI6s
         8JlvaPysHaJ+UPG/wggK6iAUK8hRZjyf9+mMcXp7BiRzw8PH9irfSVuzjoPZ4DKCvhnH
         kO5jAowAfg5+emkWbFsW15Hus6UnVso4Jgsxvml5rjEECWp/pXbjbTH9CqzQ7GvOf6YN
         McSEWbQuOCt4yoz05kg7wFPhdakl1QeF28U4X69bbFURw1Niud6+7dSFIWm2Gmqom4n5
         iYdemtfPboGw2CFFOqY6wVHt2wGH+zXqJeB28rQGHpvkKqfOcO/Os5x2eK2fvZSLOGMx
         WvGg==
X-Gm-Message-State: AJIora8vQADpYeQLJUB0cRQfXegGZbflC/PfS2VihaJZu71r5QEw3yEQ
        odxDrUeG6pVNSrcc7SxytMBt7Q==
X-Google-Smtp-Source: AGRyM1u+ErfCuSHr5Erivc76AfPeU0LhRvfrJ7R7I2Ve4TYxaQ8gthTJr0jwPUUBpxCskBCB6aUsaA==
X-Received: by 2002:aca:1803:0:b0:337:e764:9927 with SMTP id h3-20020aca1803000000b00337e7649927mr14949031oih.51.1658206094780;
        Mon, 18 Jul 2022 21:48:14 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w9-20020a9d70c9000000b0061c9bbac1f9sm2803209otj.16.2022.07.18.21.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 21:48:14 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, robdclark@gmail.com, quic_khsieh@quicinc.com,
        sean@poorly.run, vkoul@kernel.org, swboyd@chromium.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        dianders@chromium.org
Cc:     quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        quic_aravindh@quicinc.com, linux-arm-msm@vger.kernel.org,
        quic_kalyant@quicinc.coml, quic_abhinavk@quicinc.com,
        linux-kernel@vger.kernel.org, quic_mkrishn@quicinc.com
Subject: Re: (subset) [PATCH v2] arm64: dta: qcom: sc7280: delete vdda-1p2 and vdda-0p9 from both dp and edp
Date:   Mon, 18 Jul 2022 23:48:02 -0500
Message-Id: <165820608074.1955453.1557807402050131416.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
References: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Jul 2022 09:23:23 -0700, Kuogee Hsieh wrote:
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
> 
> 

Applied, thanks!

[1/1] arm64: dta: qcom: sc7280: delete vdda-1p2 and vdda-0p9 from both dp and edp
      commit: 8ed85d1e515ff5f302a929308c7ccc06bec68632

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
