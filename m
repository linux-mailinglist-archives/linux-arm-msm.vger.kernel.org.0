Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCA1590D5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 10:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237385AbiHLI2K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 04:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbiHLI2G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 04:28:06 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA41EA8942
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 01:28:04 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id gk3so794376ejb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 01:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rbiT8abHpNIVTow1zJdQqE2vgvQ7Yb359Ee+AMPsAQA=;
        b=lT8dpsaErdbLV0K3ZLzhZfFSixtAMLiRDp5mJ9NboNobp+7usMGwPwJjB4q0aMakyU
         ry4SVlSx6L47BPSr3EOTiNVpI5nIHRsjcRaOIw0aPjt2W8iIfPrbrP1byYck1cI8S6UK
         ttHZlcJX6ky9FwZpdrwYKsRFhdxne3r5gqzXYQqhXtm+LgCXmylYP7BECHMUv00W7V12
         g0TUmU1Z+LO/lQyFU8mM6ruYKDBEkkCb1SjP7mbvdzUnkCUnoItGZS3sFj+D/1NF5KnQ
         044jD/Sh04ceAPHi7ad21iNLQCiytOQMrFoiIdjaGfcUrxocCpeCiIFwb6TDsE8iqfE9
         UQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rbiT8abHpNIVTow1zJdQqE2vgvQ7Yb359Ee+AMPsAQA=;
        b=6+ba3dodEtzQ2UamB85wsWN20kxGFtQRtLJhuv8+y9wjPAwogH9UcJa/N0rbVCTFGH
         QxOEjEIPVN/4DwQ7iKst+PTCOZDA1lCQyAu5u7+p9HzOEsay2Bbhp1ql4ysYHyocFCSq
         Ibh7k33nJ3L3kMPxKcKJ/v8z8XzZr0O6cCJd78qfbakXi8U1Tu4hvipXxo0f3YmAFZUF
         hIXtag3US9VYx+GAE7kiZhdc+mMQcMWeOtyHCJruS061WEELMaWgDPBXCOWzx2QcHII7
         jAqeCYVLgy0Xi/EiAngHVOLIJ832264ulB7o/uLF5zPXWHpqItqyeIWX3ud02LiQPcjh
         S57A==
X-Gm-Message-State: ACgBeo3cNfleQIjbcfyBymBuDaW9HwxJn746q8XuOtaQj3+95NgjPVIi
        lqUIs/ytDXDh+ktUhmSwKkckSD4BNRAJWg==
X-Google-Smtp-Source: AA6agR4bCiFo6JQMxH4zL9Zl3l53OrKzev/JZxdFlwlvYbnIqEoTGJCeg6rFgWv9ULxwxa5Ng6IBng==
X-Received: by 2002:a17:906:228a:b0:731:3a33:326 with SMTP id p10-20020a170906228a00b007313a330326mr1931777eja.253.1660292883160;
        Fri, 12 Aug 2022 01:28:03 -0700 (PDT)
Received: from otso.arnhem.chello.nl (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id y6-20020a056402134600b0043cf1c6bb10sm971326edw.25.2022.08.12.01.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 01:28:02 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dmaengine: qcom: gpi: Add SM6350 support
Date:   Fri, 12 Aug 2022 10:27:20 +0200
Message-Id: <20220812082721.1125759-3-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812082721.1125759-1-luca.weiss@fairphone.com>
References: <20220812082721.1125759-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SM6350 platform does, like the SM8450, provide a set of GPI
controllers with an ee-offset of 0x10000. Add this to the driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/dma/qcom/gpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 8f0c9c4e2efd..89839864b4ec 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2288,6 +2288,7 @@ static int gpi_probe(struct platform_device *pdev)
 static const struct of_device_id gpi_of_match[] = {
 	{ .compatible = "qcom,sc7280-gpi-dma", .data = (void *)0x10000 },
 	{ .compatible = "qcom,sdm845-gpi-dma", .data = (void *)0x0 },
+	{ .compatible = "qcom,sm6350-gpi-dma", .data = (void *)0x10000 },
 	{ .compatible = "qcom,sm8150-gpi-dma", .data = (void *)0x0 },
 	{ .compatible = "qcom,sm8250-gpi-dma", .data = (void *)0x0 },
 	{ .compatible = "qcom,sm8350-gpi-dma", .data = (void *)0x10000 },
-- 
2.37.1

