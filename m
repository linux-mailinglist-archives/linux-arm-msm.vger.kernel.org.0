Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62BD2673CAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 15:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbjASOqq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 09:46:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbjASOqQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 09:46:16 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBEB8758B
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:43:30 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id u19so6198025ejm.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 06:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9KHL7S0sw0CegFriPkOF815DSWCPV/UoYSgl9XlgPOY=;
        b=rI60sDSpn5RzojNYOrqgO+epm0kV/SqZlHJaYJpL6rOLd4quu6COOI4QQUxn5hDufC
         wvmpYBA/n8ZesJA7fGa7GhyhbgTciGXVbP1c8V13I52l04+WA+1jUasLeBfgqJmcF718
         s269U+eS5Llwb+cIpfDxvv91RIB09MRX/sWALY/+aquNq4o/rYhBk9codbUErbq0hkE8
         drfuRyZeIXKOD/SdTJKPsilXpYHSpwhQ262iyh+/hQ7CNfK1PKMLWHbKB5YTnEzsMIbG
         MBwLpmeCMkQByoLOUtGZ7VAdi0/DHPPRYqSmzRigksJDvM1VNXWrX4xKODVHFpsdmOw/
         SkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KHL7S0sw0CegFriPkOF815DSWCPV/UoYSgl9XlgPOY=;
        b=c1oy8uXL+onNsnQNdsb7fd7THjxkGTuEV2rYG8x5Q6gr6cuGaj9YXfiGRBnHBTF1zG
         6IsJ0fP4VCRYtt/QYpbNCDZ0twqH3aFdMjm2BQfbTlzy2AE7x9UoceiWg2CY4MjJOodZ
         w1RLgfc3DROw1ebbhcioEFE07OM0chhSwOcjVQn6z/OOzlS9DtGvcOlJOVSTX6oIFjXq
         Y0cEVv9C5oP75pLM1oCP62Tol8ro+RfVzz4VJKYTJLHL3cdMzNiO0LRJOKtNzU/85hcS
         xjtbCkNTyMYrxZScZ+6NuyL/0KO4ZCTM4E8rLGmh2rSd28C4AQCmlwXlQNnHC279/Qtj
         ATdA==
X-Gm-Message-State: AFqh2koG2R0lqcbcVUlMCm9ZiVsxLpeeHH5SsL41RZfkojLGx1TJ+I5k
        NkaS3iirxA6ZNrm3/ED1aqe+Xw==
X-Google-Smtp-Source: AMrXdXvKKXPY95QPENbEySgQE55aRaDebl+PjzRWVQqS4XzsL/YEJ8XskLiETVUXqdvkKsyyCLtJWQ==
X-Received: by 2002:a17:907:b610:b0:7c0:d23c:ead3 with SMTP id vl16-20020a170907b61000b007c0d23cead3mr12951464ejc.27.1674139407713;
        Thu, 19 Jan 2023 06:43:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id fn4-20020a1709069d0400b0084d4b907ff8sm13434169ejc.120.2023.01.19.06.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:43:27 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org
Subject: [PATCH 0/2] arm64/msm8996: enable UFS interconnect
Date:   Thu, 19 Jan 2023 16:43:24 +0200
Message-Id: <20230119144326.2492847-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
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

MSM8996 requires a vote on UFS interconnects to work in a stable manner.
The first patch is a rework of older patch from Brian, see [1]

[1] https://lore.kernel.org/all/20221117104957.254648-2-bmasney@redhat.com/

Brian Masney (1):
  scsi: ufs: ufs-qcom: add basic interconnect support

Dmitry Baryshkov (1):
  arm64: dts: qcom: msm8996: enable UFS interconnects

 arch/arm64/boot/dts/qcom/msm8996.dtsi |  4 ++++
 drivers/ufs/host/ufs-qcom.c           | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.39.0

