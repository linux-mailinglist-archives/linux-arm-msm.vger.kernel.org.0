Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0568D4B55C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 17:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356233AbiBNQKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 11:10:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356191AbiBNQK0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 11:10:26 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9681160D85
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:10:17 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id q7so27581521wrc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JY40me+cvEI+ZEwVsx9mxL0PQSUpWscJw7u6fHkuhDs=;
        b=AaWb3EXnFJJwL2tB8qsT5Esv4Am6bmqjQpmSxSu04umlOcmywi90ZilbwSqTqJDmQN
         OaTcel2iWBLo9lsuucGMqPy5SacvBr3kDQtKS4GyNZ1qlBBvMgz9MlWuZD9fv3WtpOwh
         /CdjMG+tEmtiy5bieQw2B9pVQ9Q4KtVVkbb96KA1iVdw0IaNfwdr0H10vcXxFeSx+32/
         b9B1fuiLbtLSVnyBfjoxvygzRnOyMlzs/rqx/N0ame2He2o7YgPbM23/YhhDSmsERznQ
         a7Mcm1E7j2+a8W2vK1d17djZNJli023KOx6uNFaebv3iFVikpUF0kM8dVI4xkrFIZBpa
         YIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JY40me+cvEI+ZEwVsx9mxL0PQSUpWscJw7u6fHkuhDs=;
        b=CZgAOzXCGxWwXH/ymV2lHCV7DhWvLLaPiMb4yjC1PuW3lH1JVtjf0/ZEng38DD7J2m
         mverFJ/2Pt78DWWBiCI9+IWY4FkbUmuzhdxFxeAqGz6RYzGvPTBGeAxCwf+1MmfUBL6t
         oFBY6D2PauxVjAOSL8y6yiDGKhnuO7dINEU3i311C5d8yUmYgEmgZYvLxBopD/+YeMPJ
         6RlflCBa9huXUz6UFjPv9t8YFodEB0JvLPxlmXV5dw1epBZv0dlkT/525iYy8jM0+Lrz
         2BXobQwpL/2c3AoccILFXyifC3rOoTYJ8FMBRpdWolrRuhFnhoTM2zzYVLdlvbg2ufk8
         PBIg==
X-Gm-Message-State: AOAM530/Xu98eoKFHplYWQtYf+54LnWLRhX1MwN603ap0gMuAJsUrQou
        jk9frdb6EG8vuhMXq9gZZ+Fvbw==
X-Google-Smtp-Source: ABdhPJwe/E4mNaJBfa58EgO8WJ6izbNMYSP3r5UvZf9qn9blb5yzAxRjpNNufTXONkF8KQvFBS9CDQ==
X-Received: by 2002:a5d:4dcc:: with SMTP id f12mr277291wru.598.1644855016240;
        Mon, 14 Feb 2022 08:10:16 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id k28sm13677022wms.23.2022.02.14.08.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 08:10:15 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        bkumar@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        srini@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org,
        Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 07/12] dt-bindings: misc: add fastrpc domain vmid property
Date:   Mon, 14 Feb 2022 16:09:57 +0000
Message-Id: <20220214161002.6831-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220214161002.6831-1-srinivas.kandagatla@linaro.org>
References: <20220214161002.6831-1-srinivas.kandagatla@linaro.org>
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

From: Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>

Add fastrpc domain virtual machine IDs property. This property is used to
setup memory protection for remote processor.

Signed-off-by: Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
index f9a01e2b4c96..5ec124b138a6 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
@@ -22,6 +22,11 @@ other tasks.
 	Value type: <boolean>
 	Definition: Property to specify that dsp domain is non-secure.
 
+- qcom,vmids:
+	Usage: optional
+	Value type: <u32 array>
+	Definition: Virtual machine IDs for remote processor.
+
 - #address-cells
 	Usage: required
 	Value type: <u32>
-- 
2.21.0

