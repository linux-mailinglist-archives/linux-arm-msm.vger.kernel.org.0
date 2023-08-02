Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC70376D095
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 16:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbjHBOuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 10:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234420AbjHBOuG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 10:50:06 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF001982
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 07:50:04 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso74054385e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690987803; x=1691592603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4kw9VxVDZYvCkpggtGL2lxTsw9c6lYEtOYEG/sd3AM=;
        b=kUY9oZycAeqqSCGxzs1Y58rOUxN7O9E9ICnmR1V3/nFvBQwYLQyOvFf7GSnyFDfekl
         Q8ecp4EF3OUnb2BMVpQWOdaSFO4odgctmfFaj9QaAY56RbUADfDLASEXaRUNAOqyD3yK
         gIpJwIS1asJgKw9KDepkUvaXuCPOVCWEHjnU/PF/N5phpJ1mFHBJt/rDZ3PZltUShOsa
         RjY0+yKmbZwuGMQB5NEvE34f+QFS/1pz7nT8aN4tjYAtw4n4VksTDcbfuJOSVRvoC5kf
         2F+7h0+c7idrmSDEp+f0IzbMflRKtXSyByqGvErpyJmc5yvSOq2wZbbIXgPNNJ7hBmAR
         Rcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690987803; x=1691592603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4kw9VxVDZYvCkpggtGL2lxTsw9c6lYEtOYEG/sd3AM=;
        b=Mta+0Dg7gWyIv24GfzBrzCRY7Mh50rkIaeqbNyQpU6F6FRMiCxccSyPa6vBqyRCzVT
         /u+uno2puLONeLLgvV80axCxji2shjnREYRDcfBj10xfGzGvbcLv+GdNAu80jkcADD0D
         DygJFvE02gE8UBekcW5dnPnDeiLE6RLE6+DF9tW4FEhHAxfqrBLsZxAZWEY7mLUOrbIU
         DCtAHs0vF8Ll5vBJX/RjsqexP0hZKdVBAeZKrQPNwIm+dsZB9QV3KRtDIHc0WR1vVboa
         Edgn3hEFhFRwYyKY4guUGJm0kAlEbpoKkPkiBqwjrCixvI5husGzJqK5OVSerSm0gdEp
         kruQ==
X-Gm-Message-State: ABy/qLbVWgWrcZisQv1pC+pVvJsXBqjv6E4kXc8GIAAnr/CTJITnO7pC
        pz2UM51Sz0kKOORamUPUKEasaA==
X-Google-Smtp-Source: APBJJlFVhbFaDTXJTz2M+3Nstm59W7bEHqOSnHL+eVxrmhR1q37s1dmLA8kr/IuGg7aPTzNML4Xmiw==
X-Received: by 2002:adf:f4d0:0:b0:317:568d:d69f with SMTP id h16-20020adff4d0000000b00317568dd69fmr5128652wrp.12.1690987802781;
        Wed, 02 Aug 2023 07:50:02 -0700 (PDT)
Received: from lion.connolly.tech (host-92-17-103-66.as13285.net. [92.17.103.66])
        by smtp.gmail.com with ESMTPSA id a1-20020a056000050100b003141f96ed36sm19371033wrf.0.2023.08.02.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 07:50:02 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Wed, 02 Aug 2023 15:49:28 +0100
Subject: [PATCH 1/2] power: supply: qcom_pmi8998_charger: remove
 CHARGE_CONTROL_LIMIT_* props
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230802-pmi8998-charger-fixes-v1-1-a8f1e8b84c1e@linaro.org>
References: <20230802-pmi8998-charger-fixes-v1-0-a8f1e8b84c1e@linaro.org>
In-Reply-To: <20230802-pmi8998-charger-fixes-v1-0-a8f1e8b84c1e@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=XsNf7NjKqBKQl4vIcQzA3Ah+1YWtGg6RtxuU8xJdlHk=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhpRTuZJ6OWvmHtnqEPJxi9d/sw3GO1TONEY+nHDg9ovJL
 +bOqcsx6ChlYRDkYJAVU2QRP7HMsmntZXuN7QsuwMxhZQIZwsDFKQATmSLB8L/uoIFy5PK6NmFB
 g9w39i23VNN/2qS9ONgU+mz/Iu8uUxmG/+nTOR2Pz24RNT8bFXNi/36fc2pvd02+e/y15pyZbwJ
 u9McAAA==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These property were intended to allow the power supply to be treated as a
cooling device, however the cooling device interface has been dropped
from the psy core code. They now just duplicate the CURRENT_NOW and
CURRENT_MAX properties and are generally confusing, drop them.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/power/supply/qcom_pmi8998_charger.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/power/supply/qcom_pmi8998_charger.c b/drivers/power/supply/qcom_pmi8998_charger.c
index d16c5ee17249..61be835f4106 100644
--- a/drivers/power/supply/qcom_pmi8998_charger.c
+++ b/drivers/power/supply/qcom_pmi8998_charger.c
@@ -409,8 +409,6 @@ static enum power_supply_property smb2_properties[] = {
 	POWER_SUPPLY_PROP_HEALTH,
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_USB_TYPE,
-	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT,
-	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX,
 };
 
 static enum power_supply_usb_type smb2_usb_types[] = {
@@ -673,11 +671,7 @@ static int smb2_get_property(struct power_supply *psy,
 		val->strval = chip->name;
 		return 0;
 	case POWER_SUPPLY_PROP_CURRENT_MAX:
-	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
 		return smb2_get_current_limit(chip, &val->intval);
-	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX:
-		val->intval = DCP_CURRENT_UA;
-		return 0;
 	case POWER_SUPPLY_PROP_CURRENT_NOW:
 		return smb2_get_iio_chan(chip, chip->usb_in_i_chan,
 					 &val->intval);
@@ -706,7 +700,6 @@ static int smb2_set_property(struct power_supply *psy,
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CURRENT_MAX:
-	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
 		return smb2_set_current_limit(chip, val->intval);
 	default:
 		dev_err(chip->dev, "No setter for property: %d\n", psp);
@@ -719,7 +712,6 @@ static int smb2_property_is_writable(struct power_supply *psy,
 {
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CURRENT_MAX:
-	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
 		return 1;
 	default:
 		return 0;

-- 
2.41.0

