Return-Path: <linux-arm-msm+bounces-7219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B544E82CE89
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 21:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE99E1C210EA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 20:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EE7182BB;
	Sat, 13 Jan 2024 20:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e1BuafaD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449DB18050
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 20:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cd8b661cb8so27320921fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 12:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179358; x=1705784158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrYO45if9MkhdPnM9emuw8D1/bu4r/uB+Rm9iLY1LZw=;
        b=e1BuafaDjvLr1Lx+rQzwR9Ol2toFm0bq89aeRxlReLhlvHT47Oef48ITVRP6DBswZL
         u0ly+r3G5863JEaOI5TjFSou4jgcdZWsCaL3AWUzDdPJNsvwLGlN19Qw6FbFFxf9iq5w
         Idzbff0rSOlq3Z1G8rk2/8PEu1TuRl7P/oTNykPPrhTZ9f/XRV+MafKo06J1S9/Kn4Ki
         Dzi5rc5aj9yVmmpj2ahRTeorDCB2Z6vHU98br3c3bxcfiHL9cY7JPQD4S7O2GsIXyUxT
         89+hlto1xqKkCgKxx5zQV8s4ntPbbZAq79t5rPCtas5IjHaBqB1ODDvs2L3x7JcNsZK7
         zO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179358; x=1705784158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrYO45if9MkhdPnM9emuw8D1/bu4r/uB+Rm9iLY1LZw=;
        b=KOR9cg1lg9ey7tvnDbt3QgiqH6jYKUXASWFFT3CifhMNSuaUMFi0sPFWqx5LhEsgH9
         1pgskPdeJ1eqfBLI8zojNJGXp//hm/236qdIbYtPz6o6zVb7wDSVWfhD461YA5eQxjWb
         6kKf5CWNhdZ+l6ygDtlvNmdfdbXr4DQFQcmuIlpim8SSfH0Wu1iT/MBqArNOl/0q/FtN
         67GRNfUYPA9Nu6f6UD/MFmtg1N6fZLSBo3cmJXuxMUwdAGAVDykgStI59SImLUs9I9Nr
         e1fiwwisXYMt6R9arsLbQNSXkVRLUfPa5UZD97CyPzRuq7l/l4USiiybkNsuA5JGXpj/
         qOtQ==
X-Gm-Message-State: AOJu0YzQcJIko3pXATsZHb8a946e52iLLVf8zSC87oEwNPZYotNzW0dm
	FnRMb6RBnGVrMl9mydqhr3LsymEZyOhClg==
X-Google-Smtp-Source: AGHT+IHtkXOrSL9TAfk6/XUXQqm6LNGb8oabYf+fv5lMnRIIjxU+y2JF/ccNyKHDysvmhF7AF7ykdA==
X-Received: by 2002:a05:6512:3e16:b0:50e:7be3:b410 with SMTP id i22-20020a0565123e1600b0050e7be3b410mr1080009lfv.105.1705179358402;
        Sat, 13 Jan 2024 12:55:58 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:55:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:49 +0200
Subject: [PATCH v2 06/15] usb: typec: qcom-pmic-typec: fix arguments of
 qcom_pmic_typec_pdphy_set_roles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-6-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3329;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=z5+t2zMtCUTK2jAH3Na6Dy0WZ3qbhWesIMT9Xe4mLP0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjWutHD8dgmfbirhS+ilRzPSltZh4mmoLSRw
 7qlo8M1gr+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL41gAKCRCLPIo+Aiko
 1Ul2CACZOa4wBBNnNriCeL6gs9SGIyTin6NraWodtejNTjEut+tW+Kyau1DYOqb3qSDeSrtEIuv
 gzWQygA23AfEa/91MziX9+4/F4MPiIrHvrXefEgMJmE47SfDP+wvtde2SdpEJupQ0KoJuc99WY1
 EHHPHvR/R+8SGhz2yQvD/XI6ExtpqKOH1PSq5JNLWZ04/3rdytEqVIXijszSTeJTmH7PDlNCe7N
 braqXqgTx8MK9iMCBlN4scbuQr9Zf1maCVRw5H6j7af4livmCeSeYyOPw+69GFXKnur6zO7PSdU
 iqcZi+H9BhfTL8n3umcXHL/kDZRu4wcx/jTpXYgULmFcrt4Z
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The function qcom_pmic_typec_set_roles() passes enum values as boolean
values to qcom_pmic_typec_pdphy_set_roles(), which then interprets them
as bit values. Be more explicit about it, pass enum values directly and
compute corresponding bit masks in qcom_pmic_typec_pdphy_set_roles().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c       | 2 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 8 +++++---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h | 3 ++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 1a2b4bddaa97..a243648abb4a 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -123,7 +123,7 @@ static int qcom_pmic_typec_set_roles(struct tcpc_dev *tcpc, bool attached,
 	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
 
 	return qcom_pmic_typec_pdphy_set_roles(tcpm->pmic_typec_pdphy,
-					       data_role, power_role);
+					       power_role, data_role);
 }
 
 static int qcom_pmic_typec_set_pd_rx(struct tcpc_dev *tcpc, bool on)
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 52c81378e36e..44d8342ed0ad 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -354,7 +354,8 @@ int qcom_pmic_typec_pdphy_set_pd_rx(struct pmic_typec_pdphy *pmic_typec_pdphy, b
 }
 
 int qcom_pmic_typec_pdphy_set_roles(struct pmic_typec_pdphy *pmic_typec_pdphy,
-				    bool data_role_host, bool power_role_src)
+				    enum typec_role power_role,
+				    enum typec_data_role data_role)
 {
 	struct device *dev = pmic_typec_pdphy->dev;
 	unsigned long flags;
@@ -366,12 +367,13 @@ int qcom_pmic_typec_pdphy_set_roles(struct pmic_typec_pdphy *pmic_typec_pdphy,
 				 pmic_typec_pdphy->base + USB_PDPHY_MSG_CONFIG_REG,
 				 MSG_CONFIG_PORT_DATA_ROLE |
 				 MSG_CONFIG_PORT_POWER_ROLE,
-				 data_role_host << 3 | power_role_src << 2);
+				 (data_role == TYPEC_HOST ? MSG_CONFIG_PORT_DATA_ROLE : 0) |
+				 (power_role == TYPEC_SOURCE ? MSG_CONFIG_PORT_POWER_ROLE : 0));
 
 	spin_unlock_irqrestore(&pmic_typec_pdphy->lock, flags);
 
 	dev_dbg(dev, "pdphy_set_roles: data_role_host=%d power_role_src=%d\n",
-		data_role_host, power_role_src);
+		data_role, power_role);
 
 	return ret;
 }
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
index e67954e31b14..070822dc6f17 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
@@ -107,7 +107,8 @@ int qcom_pmic_typec_pdphy_start(struct pmic_typec_pdphy *pmic_typec_pdphy,
 void qcom_pmic_typec_pdphy_stop(struct pmic_typec_pdphy *pmic_typec_pdphy);
 
 int qcom_pmic_typec_pdphy_set_roles(struct pmic_typec_pdphy *pmic_typec_pdphy,
-				    bool power_role_src, bool data_role_host);
+				    enum typec_role power_role,
+				    enum typec_data_role data_role);
 
 int qcom_pmic_typec_pdphy_set_pd_rx(struct pmic_typec_pdphy *pmic_typec_pdphy, bool on);
 

-- 
2.39.2


