Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC6115BF06A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiITWnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiITWni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:43:38 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E208D6BD61;
        Tue, 20 Sep 2022 15:43:36 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id d8so3605705iof.11;
        Tue, 20 Sep 2022 15:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7xsEMjteUIRYdHjfsuLZY+0Sg1b2m+N60SxgczV6reU=;
        b=l6v1Z+GNYF63ivSVS56CRei7tIxROuPjdYd1VsP1VI2dU1K9slSd3CfjTQHbcCrDh2
         L/VC4wqAICo7M+Y8+sKDpEn8d45/IAummtm3+j1+7EEnl643GoGdRGKUhct3U6PYNAt9
         nUxhZ1LMYXpm6S92EC2v3Cy767FzMXh5YLecf+nNQHGe7IzykaW1vuHYOXAGM3581oUl
         6wqjT/31gwptkUEIzOGqE1a0NpnhBmV4/Iw0plb+D0XAHjG4NJX2S2KX6D+IG+75caCq
         tS2JXu86FNndfO2wCkjl18kNOrTi1xoOCUbptuvNn6pUq0RnhUnTAcepn4SLc4MdxWBj
         UnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7xsEMjteUIRYdHjfsuLZY+0Sg1b2m+N60SxgczV6reU=;
        b=G9NqUWFvvtKjMZtB23smyt9UUD9cQL9O5OHTAkj1yrBTzpSiauFqsftxOhKoMCaD3W
         wL5ep27cJmXSJAfGY32jLXttny91PpEHOcy/gb0KZ9TJ2ZQfx4Y3Wxy+14Yi8tP0nS5v
         /8P8n+2r4zIgP4rHGNVyLJ5dCcwjVn24HlXlvAg/ZMBRp/dpBAD2EXr2FIAzc8DlTLkA
         At9t8Hm0jDgG3XIRbJclVc9IqdsGQo4gjTK3tNAE+TGJ4wJSxCuyCWa2itpQ/QUT+KwV
         g81CSSbzDK1CG9l/IKEw2f/QKN70oZ3LghKXaC5CDOziXXwwckDVURMXvDGAfcebE+35
         HTzQ==
X-Gm-Message-State: ACrzQf2aBIvcpfXG3ciIi0n37JrD1x8BmyBsyQ9Lui2xAeyi+MZEfFMl
        YRktGY7VL83f+6FugJvc7TExATluSuw=
X-Google-Smtp-Source: AMsMyM7unFkrTrNS+6qbuaDDl4WIJnO3Ixz7/PW2/OS0pNg9dEBPssaoow1zBR4bj2kpirKTJ4LgPg==
X-Received: by 2002:a05:6638:1606:b0:35a:5472:fa1b with SMTP id x6-20020a056638160600b0035a5472fa1bmr11423321jas.241.1663713816433;
        Tue, 20 Sep 2022 15:43:36 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id d38-20020a0285a9000000b003469c4d60fesm407468jai.27.2022.09.20.15.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:43:36 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/3] usb: dwc3: qcom: add sdm670 compatible
Date:   Tue, 20 Sep 2022 18:43:20 -0400
Message-Id: <20220920224320.152127-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920224320.152127-1-mailingradian@gmail.com>
References: <20220920224320.152127-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 has DWC3 USB support. Add a compatible for device tree
semantics.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9a94b1ab8f7a..34b70c3c2f70 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -1010,6 +1010,7 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
 	{ .compatible = "qcom,msm8996-dwc3" },
 	{ .compatible = "qcom,msm8998-dwc3" },
 	{ .compatible = "qcom,sdm660-dwc3" },
+	{ .compatible = "qcom,sdm670-dwc3" },
 	{ .compatible = "qcom,sdm845-dwc3" },
 	{ }
 };
-- 
2.37.3

