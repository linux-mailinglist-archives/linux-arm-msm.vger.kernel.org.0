Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 504BD7E0660
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Nov 2023 17:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344888AbjKCQZU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 12:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344250AbjKCQZT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 12:25:19 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0842BD4E
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 09:25:10 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40806e40fccso14457855e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Nov 2023 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699028708; x=1699633508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBeLT8khJaQLixVgfl4LSRyi0x5wnZw3atoglLJt33I=;
        b=Vr734cyqkkMNlOstR84dmRXwAdxOZf/IwG5PVXy5aT1dh/II68WKBTMh+qXt5W9H2D
         howgdEt+TQ2464ZiwVQ1C8yjRs9dtRy6LKRuel/EenJ1VvZaH0ywTHiMAi2CMPo8wgC7
         ltbGklQwSpRBQ6vdu1IWC/GrejEzOGf2VueW5cL2kL9KqzsGqa1Ko+biG8VOZh4QZc35
         MMWUOyvIkjIfjufyrsAc4XDxAuLvk7+jtTFnahuQqoSFVjnJDdbYv6LGYT2DdXFi622z
         5d5xCxKYqdC5dZCAVjh40CR9qsXB45OpqZX8elGoTiuDrU6dvppp9T4WUyVtVuG622Oo
         mt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699028708; x=1699633508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBeLT8khJaQLixVgfl4LSRyi0x5wnZw3atoglLJt33I=;
        b=NiLvc4eAW/0lYkjpFRewAqQAYtRfz3fh7xD0A1wSI+1lxEajYiBfjMKcFCJqKwc4wA
         YmVPtjxIu8KBGo6ZFx2JNvOkP+N68j4QfBBRlVjmvumwpyZHqM7sJKLjKrAsZIGWT44p
         Kvn8G05/XH18pvIuTRX1/F8ZsA8dcsLP7rnIPHVCtBdsYzo2f2l1M0I4TFMdjznwl2M0
         T0Nt4FfBEkUlQMO4Yih41Yr8Aven06Je0hH3FmrWup8DHRHYLLAbdn3QYPjg4VQekqW+
         TkJuNIF77J5NSAFySguLD09sL9Jdmgw2KJ2/WKRytQF2XGZlgM3y+5DgFvO30uYdrA7e
         4jtw==
X-Gm-Message-State: AOJu0YywLlHTIapa6iVu/+0eg/6CZamHBD390DQ79qTYrXEjsLt0p9Ky
        qAqH8kjmWSwAu/+wd1uiMS4uJg==
X-Google-Smtp-Source: AGHT+IEdTiIMGgGP+ktwzNDEaY0cO5gYG/t4sT4+snMUn/vAHQo1C3nZq898slGn9y+nWxx0xq/eLw==
X-Received: by 2002:a05:6000:144e:b0:32f:7fb1:66d9 with SMTP id v14-20020a056000144e00b0032f7fb166d9mr13999015wrx.21.1699028708527;
        Fri, 03 Nov 2023 09:25:08 -0700 (PDT)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d650d000000b003142e438e8csm2219972wru.26.2023.11.03.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 09:25:08 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Fri, 03 Nov 2023 16:25:05 +0000
Subject: [PATCH v2 2/6] media: qcom: camss: Add CAMSS_SC8280XP enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231103-b4-camss-sc8280xp-v2-2-b7af4d253a20@linaro.org>
References: <20231103-b4-camss-sc8280xp-v2-0-b7af4d253a20@linaro.org>
In-Reply-To: <20231103-b4-camss-sc8280xp-v2-0-b7af4d253a20@linaro.org>
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-26615
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds a CAMSS SoC identifier for the SC8280XP.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a0c2dcc779f05..ac15fe23a702e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -77,6 +77,7 @@ enum camss_version {
 	CAMSS_660,
 	CAMSS_845,
 	CAMSS_8250,
+	CAMSS_8280XP,
 };
 
 enum icc_count {

-- 
2.42.0

