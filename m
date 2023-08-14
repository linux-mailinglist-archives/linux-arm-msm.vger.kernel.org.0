Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5667777B64F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 12:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbjHNKOp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 06:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236730AbjHNKO3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 06:14:29 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC03E6D
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:14:27 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so64590231fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1692008065; x=1692612865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I83KyFDhUVnCPx9y366vR3xpO/5sGGkMxv/PQ7v8Fw0=;
        b=rO2zGjR9Va+S5MUXy6gxgaDEzcGHw9OuD6aMVa1xPlHQBpgF3GuCn9VpyJTDONmG2u
         UOf71K5log6TLInqx8u72GbDaAYyM0Tk8/ftOi9cvdal8R21w7/nCGu+ag+QgE5K8ucw
         Ix5/8fvA5YW+FyY7lWGDJ6UUzNEXifq6fIs3T01Ou5kFgIgUWwIJ9PYCFbQF//g6Xa0v
         K0p4rLBvySrf3lgBkTSFQ29223fuuyONzolRtVe9qwpJyuu3sI1xSC7exemn3PcrJhsY
         Yr8yz3NzwitFgrs/Lk8AacFyoJRUrWUDS+QQisoH2F4xQwbK6Ij5bKc49If8yuPl6rzj
         Fqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692008065; x=1692612865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I83KyFDhUVnCPx9y366vR3xpO/5sGGkMxv/PQ7v8Fw0=;
        b=ZYqL4t8iXN0iP2li36LiID0qiIGxiR13JjNq9CBNwkuKOn1OJkNxC7iVvdG4yuE50H
         03xPYM2qzcjLmqlhD/kuiDci93ruEQ0B7ExsO5FmMZaRiYV2wZwnUffetBObNIMonruk
         ysIDhOYVoSO3OO+mxfFNzinpbkolplSEOEJPfB0dqXagljrNW+dk0v/FIqxLgKbtZBq9
         r3n0PznnWKOw0JDbl0KVpUh2n8PxpydkitaVsazVmSWXB19VbuGTK4QuhB7XQanH5PtE
         fQkHcmFWr5KVGjoZ24SKVxEcNdzhYEIYxyy7bSAQFjjigjv7FEUGaFJ8IF1amk6oX1hk
         1Qtw==
X-Gm-Message-State: AOJu0YyJcVLWRwtq6cfwKBemZn9Fyvs83IihBXv24yBlxppVw6TQncCw
        DwR2Rfgm/K0fQOfYTKWXCP+nq5NTlmn+YFsGkDoJYA==
X-Google-Smtp-Source: AGHT+IE+cNjSLZKnX1joMZVDOUeJz9XLWS7JFmYF2fGu2r3hV8E8pwivCDMNZ9yIdROEghBe2azAmw==
X-Received: by 2002:a2e:808f:0:b0:2b9:ec57:c330 with SMTP id i15-20020a2e808f000000b002b9ec57c330mr6261247ljg.7.1692008065036;
        Mon, 14 Aug 2023 03:14:25 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (212095005216.public.telering.at. [212.95.5.216])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b00993a37aebc5sm5472870ejb.50.2023.08.14.03.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:14:24 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 14 Aug 2023 12:14:16 +0200
Subject: [PATCH v6 4/4] dt-bindings: crypto: ice: Document sm8450 inline
 crypto engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-dt-binding-ufs-v6-4-fd94845adeda@fairphone.com>
References: <20230814-dt-binding-ufs-v6-0-fd94845adeda@fairphone.com>
In-Reply-To: <20230814-dt-binding-ufs-v6-0-fd94845adeda@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the compatible used for the inline crypto engine found on
SM8450.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 92e1d76e29ee..7da9aa82d837 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 

-- 
2.41.0

