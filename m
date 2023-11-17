Return-Path: <linux-arm-msm+bounces-1009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A87617EF887
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 21:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9C691C2091F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 20:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA56846428;
	Fri, 17 Nov 2023 20:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgjnvzlX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064A3A8;
	Fri, 17 Nov 2023 12:17:47 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9e62f903e88so314584866b.2;
        Fri, 17 Nov 2023 12:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700252265; x=1700857065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwQ5/SyDH1GtZNxQjHNPZv7NfjgdWC/XscIu7KZavV8=;
        b=mgjnvzlXQri4Ie1cYahn8Si392nxUE0VPxYsbVzUe/7B7GSR0gBiXDaX7oz0myDChv
         xAUJaXI0wHIz15iJl03BXjH6DvdX9zpzffJgZpWg58vQ5dh7oC/FAkbdu7NTzVKOQC6H
         i3cllcS8RkG5ZjIlQgkydh0MGu3EbieUGZ5a0Hj/fMW9WoaTi+FHXNME3B2TKonUUi9i
         RKQhhjewPh7klTBNnMcjGedcKf0jOfAvhrKmkqfYlf1q5mUbkqOafNBd2SEM20Ogn4Zs
         ikwH+Ij+Fb0hTt2Kyu0SiQT1XUqeb1xcDHbl19RPzgNVnXU5GwJ0giuD3w+Lh3WsIx2u
         sifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700252265; x=1700857065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwQ5/SyDH1GtZNxQjHNPZv7NfjgdWC/XscIu7KZavV8=;
        b=pfXhTfVhvUuH+ONZav6Elh4GwfdoptuRCBiqwmKkl+xsmRUsPCYqbUVMInhz6KptaD
         soU2sXZSscJQJc4Zx+Yalabk7F7wfiLmjj69yMoiMCuOufn5wHIHNVbzPl4RZbEFvvnt
         9Iqj4DBHUkbIAcNu4Qrmj2jHBGIxQ4w9G+QJOkPdqnIYy6NBR8fhSIKqeL+R5ixJKhhm
         I84/2h6k7NyNNpCA8tcjbiEt4/PASJDus80c26r7+9+R27VV0B73yQE4uW8PA0kwJ61r
         e5Cw2/Eufsc5MK+0JBfxQSmJzKDYe9mqnXG9rm2VWPgJTup9A5MZDsc6c1uxoP1ivlsb
         SfDw==
X-Gm-Message-State: AOJu0YyQ2rk/SHDaR7nYA51W+UsSXaKLtvoDCF0QhmRvRi3uGnnDzGtD
	P/sqFtzGmp/C7aD+U5yoZD3LuRBW77G7nA==
X-Google-Smtp-Source: AGHT+IHFAfP6OfNo7QloA+j9CMWL4Ji1GKo+VCAC3R+zjElUahqMCLXDXvEROjygi2X0j2Hq5EGNOA==
X-Received: by 2002:a17:907:7f28:b0:9e4:67d9:438 with SMTP id qf40-20020a1709077f2800b009e467d90438mr192022ejc.56.1700252265458;
        Fri, 17 Nov 2023 12:17:45 -0800 (PST)
Received: from david-ryuzu.fritz.box ([188.195.169.6])
        by smtp.googlemail.com with ESMTPSA id e7-20020a1709062c0700b0099d804da2e9sm1130630ejh.225.2023.11.17.12.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 12:17:45 -0800 (PST)
From: David Wronek <davidwronek@gmail.com>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Joe Mason <buddyjojo06@outlook.com>,
	hexdump0815@googlemail.com
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	David Wronek <davidwronek@gmail.com>
Subject: [PATCH v2 5/8] phy: qcom: qmp-ufs: Add SC7180 support
Date: Fri, 17 Nov 2023 21:08:37 +0100
Message-ID: <20231117201720.298422-6-davidwronek@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117201720.298422-1-davidwronek@gmail.com>
References: <20231117201720.298422-1-davidwronek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SC7180 UFS PHY is identical to the one found on SM7150. Add a
compatible for it.

Signed-off-by: David Wronek <davidwronek@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 5f79d188b435..be7c21858d69 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1870,6 +1870,9 @@ static const struct of_device_id qmp_ufs_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sa8775p-qmp-ufs-phy",
 		.data = &sa8775p_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sc7180-qmp-ufs-phy",
+		.data = &sm7150_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sc7280-qmp-ufs-phy",
 		.data = &sc7280_ufsphy_cfg,
-- 
2.42.1


