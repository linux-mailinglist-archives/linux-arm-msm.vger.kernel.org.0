Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1D52EBC5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 11:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbhAFKak (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 05:30:40 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:8403 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbhAFKaj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 05:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609928866;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=HPdrK9zrtiXehwRFe7QN+8x/BpSYvHuDnRLTpzJG4m8=;
        b=W064oqAHUrp/mF/7gacybGt9s6CuunjSuMOrswu3m1NG2dwBHLZzWjyeA2PNsEj/Ys
        gt2zaxKNvjB56rQVXAQO8MyxoJVZW3ScPfLybASoEensFes2VMxs7ZZrIiRGICB2Hofn
        Cp6VvAbgGLzLtcAzhn/eS0VgQhvAdCDdTgTM8B+lju4bTs99RwJKOK69exDTF7FkUpGx
        gwIcq2E4ZqBcXyI/90+dNEvBtDRe1ETeq0d/4vvSfJkYu+igh4+Hw6fSvwGp05USBTqK
        9yUh1+BAgm/2Sa3+F/ZBYEIYr1ATNR7gkVTB/opuHHDqPLZXoOZheJj5QDuQ8GEQmWXD
        57hA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5G6JlrU="
X-RZG-CLASS-ID: mo00
Received: from droid..
        by smtp.strato.de (RZmta 47.10.7 DYNA|AUTH)
        with ESMTPSA id e09c6dx06ALk5DY
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 6 Jan 2021 11:21:46 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/3] remoteproc: qcom_wcnss_iris: Add qcom,wcn3660b compatible
Date:   Wed,  6 Jan 2021 11:21:33 +0100
Message-Id: <20210106102134.59801-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106102134.59801-1-stephan@gerhold.net>
References: <20210106102134.59801-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

WCN3660B is a variant of WCN3660, but with the same regulator
requirements as WCN3620/WCN3680. As far as qcom_wcnss_iris is
concerned we can just use qcom,wcn3680 (wcn3680_data).

However, a separate compatible is needed for WCN3660B because
the wcn36xx driver uses it to enable chip-specific functionality.
In particular, it enables 802.11ac for qcom,wcn3680 which is not
supported by WCN3660B.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/remoteproc/qcom_wcnss_iris.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index 0e0ae1e764ea..169acd305ae3 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -160,6 +160,7 @@ static int qcom_iris_remove(struct platform_device *pdev)
 static const struct of_device_id iris_of_match[] = {
 	{ .compatible = "qcom,wcn3620", .data = &wcn3620_data },
 	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
+	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
 	{ .compatible = "qcom,wcn3680", .data = &wcn3680_data },
 	{}
 };
-- 
2.30.0

