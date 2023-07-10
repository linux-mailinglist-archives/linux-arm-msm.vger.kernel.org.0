Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4332E74DF11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 22:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbjGJUS0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 16:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjGJUSY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 16:18:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D475BB
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 13:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689020259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZfBCs08BCyvb4rUBf/lFUidTAq5uH0UA99R+iDtQ+Ug=;
        b=Pnya4dSf4foCvV4aRMLFzaJuoB8VBuNFZ9GeishVdwZBhinU4P8rvcFgfeJtugbP0vUBcJ
        /E+N6OTfatjTs3kKboUX2OmR+AwB5QMHWJIi/7xmRi2zWOKecQyXHn5ioTbUs7V7HvQL6j
        RAYVjNpNiRycYE/F2SaJKHLygEeSsBY=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-tTANMhPZNN2LIOb7bN5fTg-1; Mon, 10 Jul 2023 16:17:38 -0400
X-MC-Unique: tTANMhPZNN2LIOb7bN5fTg-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1b016818400so3953690fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 13:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689020258; x=1691612258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfBCs08BCyvb4rUBf/lFUidTAq5uH0UA99R+iDtQ+Ug=;
        b=dnDuf1h0gEpKMlF3Iiy6+C85RK5EErqp5w2OKHQk6pPGN+yeLIpt7oxf7B4Z+B/JqM
         8F/Zqnr6K3HKnOqLeQGJFM+FgR8QKElWfJFV5066Y0CZoSAq59TfFLm7RiXsVRmUIKNU
         lFmTwG2/k+5Hrake+fNNQ1GeyXiBv7id7JlbXML1eAfDl0KKyOLETkYeF9MSHEWIWJs4
         qcaWNMDUmB0YIgZpJO9xJkDOvTlWhD2Gf9w/w4H1whO+PpC+DW7XykgSzM17WXaePkgz
         DpQv3X0fYjehZH225w4wUugZ3MBgt7COvYKA6Nk9oZo+y/6ee/5MyF9+D/hE7UqST+iN
         4vsg==
X-Gm-Message-State: ABy/qLbAr2u+9a4sJHwWRodX7ekaomULywub+E0uTU4p/4iI/DKTxNF9
        eq3htpHZDgpUJZISA17XF2pJlEW7hQddS2qntxson04cuvaW07A6k3cGQiFbY7eIoTExgOPcj1x
        osvK1hkLpjlDKHYr3AQ1IU0BJDQ==
X-Received: by 2002:a05:6870:440b:b0:19f:9353:d9b0 with SMTP id u11-20020a056870440b00b0019f9353d9b0mr13312427oah.24.1689020258016;
        Mon, 10 Jul 2023 13:17:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG/yzsbrle2mK4hDSP+ymIcBBFgugjNQj9A986L5d0AncrnW2gjIY3q9PjS07ExUBl/iRYYsw==
X-Received: by 2002:a05:6870:440b:b0:19f:9353:d9b0 with SMTP id u11-20020a056870440b00b0019f9353d9b0mr13312403oah.24.1689020257748;
        Mon, 10 Jul 2023 13:17:37 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id j12-20020a81920c000000b0056d2a19ad91sm155097ywg.103.2023.07.10.13.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 13:17:37 -0700 (PDT)
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
Subject: [PATCH net-next v2 2/3] net: stmmac: dwmac-qcom-ethqos: Use dev_err_probe()
Date:   Mon, 10 Jul 2023 15:06:38 -0500
Message-ID: <20230710201636.200412-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710201636.200412-1-ahalaney@redhat.com>
References: <20230710201636.200412-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using dev_err_probe() logs to devices_deferred which is helpful
when debugging.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
    * Collect tags (Andrew Lunn)

 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ebafdadb28d5..1e103fd356b7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -710,8 +710,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat)) {
-		dev_err(dev, "dt configuration failed\n");
-		return PTR_ERR(plat_dat);
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "dt configuration failed\n");
 	}
 
 	plat_dat->clks_config = ethqos_clks_config;
-- 
2.41.0

