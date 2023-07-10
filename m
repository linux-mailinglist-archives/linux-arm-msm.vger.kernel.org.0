Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B0A74DF15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 22:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbjGJUSg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 16:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232096AbjGJUSc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 16:18:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E5A13E
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 13:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689020264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6Lt3BtWczAjK1pGWk1bVfpBjHD7dTaFpkCieY8rxpSU=;
        b=cNkbrjcJFsTKJ1KCk6HwIpM70gl9YYlTLxj7sGrSWh/ia3KXaMrv+MOM/rgKP4wNKfzRow
        6+4YlFD4d0gykE1c7/GwiTUQowrz09AA2pdQWtsFJv+3BOCNfGp00V9ZJdrkcZ1hcq736a
        HXB2m+T8mwsE87RH8KZcTzqTFygIBZw=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-ZM6_vitGPGGGAK6WZZrvHA-1; Mon, 10 Jul 2023 16:17:43 -0400
X-MC-Unique: ZM6_vitGPGGGAK6WZZrvHA-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1b439698cd8so4591071fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 13:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689020262; x=1691612262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Lt3BtWczAjK1pGWk1bVfpBjHD7dTaFpkCieY8rxpSU=;
        b=UeAFcVY8/7T1Sm4/d4yABlGVgVnBh4x4vZqiy3o5vw1bqRBRpBgpzyuDts4nalR3Fz
         icWtQZbpOqfyzSOIQIf9vrw/jWN33zdN0RfBDwf1tHhtelVlPd+jgP4zs5BTivZFBz8J
         /0GiouzhF1Qu9JJ18aEjbr995Eh6vlM5Z7pivbiWaAPLxboiuJYpEidfygxB5AWZw/1J
         LFeBTYQ000kPH7XvSH5Cc8BJ5xOWXrEFefgb9OTFJEQDEFnUMmI7Q3r4FPuHIDEp+lIf
         qtZOTcWWKZ4/6SqporPKsIfshE0mE0X9SrnQkNkB7YxmD08kLxoiSYEkVVd1yhaEG/Ce
         /UBw==
X-Gm-Message-State: ABy/qLavadmS5u1867QbFIw4ughhO5zeQqC9KbtyrKj2LYYaeBhFiOiL
        hwDJLcDweIAbE6YdraD2oC7cC2CqjzyyDCKultPXJx2y7BnTEnJaGuQxeEkXslP89vfKHp/8mvD
        BTh1gXYGMhLDmjNLG+JAM7x5Bbw==
X-Received: by 2002:a05:6870:6112:b0:1b0:4899:10d with SMTP id s18-20020a056870611200b001b04899010dmr13142258oae.35.1689020262509;
        Mon, 10 Jul 2023 13:17:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH5cLj5bn3UpXHR1dUTlmhj+Qmb+K7OJTd7/WyAoeWXbjil07VpyzlZI5NQ0gyXvfavO3Rbyg==
X-Received: by 2002:a05:6870:6112:b0:1b0:4899:10d with SMTP id s18-20020a056870611200b001b04899010dmr13142235oae.35.1689020262255;
        Mon, 10 Jul 2023 13:17:42 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id j12-20020a81920c000000b0056d2a19ad91sm155097ywg.103.2023.07.10.13.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 13:17:41 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        mcoquelin.stm32@gmail.com, pabeni@redhat.com, kuba@kernel.org,
        edumazet@google.com, davem@davemloft.net, joabreu@synopsys.com,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        bhupesh.sharma@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, andrew@lunn.ch,
        simon.horman@corigine.com, Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net-next v2 3/3] net: stmmac: dwmac-qcom-ethqos: Log more errors in probe
Date:   Mon, 10 Jul 2023 15:06:39 -0500
Message-ID: <20230710201636.200412-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710201636.200412-1-ahalaney@redhat.com>
References: <20230710201636.200412-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These are useful to see when debugging a probe failure.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
    * No changes

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1e103fd356b7..757504ebb676 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -706,7 +706,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "Failed to get platform resources\n");
 
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat)) {
@@ -734,13 +735,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		ethqos->configure_func = ethqos_configure_sgmii;
 		break;
 	default:
+		dev_err(dev, "Unsupported phy mode %s\n",
+			phy_modes(ethqos->phy_mode));
 		return -EINVAL;
 	}
 
 	ethqos->pdev = pdev;
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_base))
-		return PTR_ERR(ethqos->rgmii_base);
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
 
 	ethqos->mac_base = stmmac_res.addr;
 
@@ -752,7 +756,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
-		return PTR_ERR(ethqos->link_clk);
+		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
 	if (ret)
@@ -764,7 +769,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
 	if (IS_ERR(ethqos->serdes_phy))
-		return PTR_ERR(ethqos->serdes_phy);
+		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+				     "Failed to get serdes phy\n");
 
 	ethqos->speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
-- 
2.41.0

