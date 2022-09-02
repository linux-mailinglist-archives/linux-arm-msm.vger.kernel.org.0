Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7434D5AB5EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 17:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237648AbiIBP4b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 11:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237539AbiIBPzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 11:55:05 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E9137F87
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 08:49:28 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id s7so2859198wro.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 08:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=drLF7rfbGFyvXeY1M1WJL6CSV1JIiJp9EbWQRGL1rFU=;
        b=L4zK3wUsOSYWO2D6udR3jh53vvOUpkrY72t8pY2Inain5vBUzHRmCuk6TqgV41wEFc
         NKmSOlvvZFCnlW5uqwOcMVVFxUY9G4DMSggUHdyLZTV/Y4Hcg7xld6pt3muuI4+6Miyd
         gMtDzY3akBcj5CDkx9uqquZOr98wJk7wS6fJzr1kCjracINbB967usKKCz28X+uE4v4m
         R0CQNKkqE9JxZR+XUNaInP8vbEnM6B1twKJpKlkOKJd28X9Q0qrQftc0VHzRrUpUslx7
         Iqb9tW+PpcDsfiU70vyoLlZ5trqDn053ODgxyNb8KgmHMr1/h9J5AVUpbYvolckt46ki
         qIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=drLF7rfbGFyvXeY1M1WJL6CSV1JIiJp9EbWQRGL1rFU=;
        b=MXgo2Jm7UOTy19XIkGtLjIivHkJkZqRLJnXNoi6wyhcv3+IdDlDbCTxPcYIRMn3VQm
         z+pKm82PxIwSSthT11TBkHymOIT6TZSwiI8zqBiVGZy9r31NBanj7pH9S0MJTKPQzaBu
         BHbS54LBHN0MLv9u0/2jcwOcPFzOf2+6MBYFdfJFFnM+RL6XXSl9sLCdpd54EVSLQZsw
         CT1gB44fNAc4CIc6SLtm7qe4yN71toNZA31HvRNFjkUtbJGKJpRbPhuZHXln4a3n/8PK
         88ga2Oa4mxyPCG768WchnyYBnWCYlItBD572SEynZcIqU6ixRVrP2N9gmaX+U5bmnBgF
         Ydtw==
X-Gm-Message-State: ACgBeo3QrXtTz4NUZH+gvqSHQfkJD6q+LNhceaqsO5wMS99YXa4yWCnA
        xK3Ns+wTEJs2WsXzkOgf9KsGMQ==
X-Google-Smtp-Source: AA6agR4Yzu+PZZQwSvEdh8nFN3CVVRDlQxTSDV0CEoalg6Hjtc2AfwoRDOy0C85kPxN5NBLq19yzcg==
X-Received: by 2002:adf:dc83:0:b0:225:738e:bb54 with SMTP id r3-20020adfdc83000000b00225738ebb54mr18670591wrj.513.1662133766207;
        Fri, 02 Sep 2022 08:49:26 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b1-20020a05600010c100b002250f9abdefsm2046741wrx.117.2022.09.02.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 08:49:25 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ekansh Gupta <quic_ekagupt@quicinc.com>
Cc:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 03/10] dt-bindings: misc: fastrpc: Document memory-region property
Date:   Fri,  2 Sep 2022 18:48:53 +0300
Message-Id: <20220902154900.3404524-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902154900.3404524-1-abel.vesa@linaro.org>
References: <20220902154900.3404524-1-abel.vesa@linaro.org>
MIME-Version: 1.0
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

Add memory-region property to the list of optional properties, specify
the value type and a definition

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
index 5ec124b138a6..3dd02aaa7ba7 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
@@ -17,6 +17,11 @@ other tasks.
 	Definition: should specify the dsp domain name this fastrpc
 	corresponds to. must be one of this: "adsp", "mdsp", "sdsp", "cdsp"
 
+- memory-region:
+	Usage: optional
+	Value type: <phandle>
+	Definition: reference to the reserved-memory for the region
+
 - qcom,non-secure-domain:
 	Usage: required
 	Value type: <boolean>
-- 
2.34.1

