Return-Path: <linux-arm-msm+bounces-53011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61909A78A54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 888093B0FAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0792356DC;
	Wed,  2 Apr 2025 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzenInRn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1F523313E;
	Wed,  2 Apr 2025 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583613; cv=none; b=lRbeWVCmzhcBUHQj8HcCHTxzMf0gNvJwQNUHn7e96PGBwBrD4R4kA5HgFj/tBwnEtCo7cTOXgwO+PhmGtnosRns10zQ1Guw8UBNKPlU9GeLi38y3k7nxKw3r8c7wvHuxtfyFCewx2vH0pVgMjuub+a3FnnSc6WiWIV0p+aDqKHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583613; c=relaxed/simple;
	bh=r6iiGw0WPshoyykVfAw4KQSvu1jD7CE+zlVJnLOPPv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEoL9FY7SQNqeLZYNnoD5kU0UdA9qY9RPbnlxEF8xr5JVf95fQVGipzn6CcwAeubPZoSevoTcY2/rh0YH5MvwSbzrPnr4djFW40GP/IJsYVY8ReDG6JO9kzfFVxQmjZWZ/Rxcfqk2jvRjAxWp7ujdpQelFdHskiDTarI+xMWC3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzenInRn; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso10555222a12.0;
        Wed, 02 Apr 2025 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743583610; x=1744188410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8SNfV9cq9fPWvvPmR3dGHfZnD5tEVE8UIBf0qCYzhM=;
        b=bzenInRnabbHt1jTdfadt6MupKO9gRDoFQWsvz0lBRv3XxgRP/2ZtF19YcOtwJy7A+
         WHsgZ18QyaiQsjzo+psGNyUFgdmOnwhSk91tbvJPiqcOaXCLVzXpmEpw92XOEowz8i1C
         NlR7TSaxUSKfRn8a6qEyf9vHcJyXCXy3HMrbEdXGuqgrFs1U2MOf0TqvW5e84WpbmULo
         XOOTTB/3uNtgEJEgQVBMO/XKyQhEGwHQ15eiWeCbLmIvCeFduN0MquBGIT6252QGyba4
         aoT575CbE9K/ip467ZhhvNwpnILUMsuUsPYalox17zbroNszwaMJVPI7UyesEIgEsQMd
         L5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583610; x=1744188410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8SNfV9cq9fPWvvPmR3dGHfZnD5tEVE8UIBf0qCYzhM=;
        b=cpPUgjR2N0zTJ2Mgzk1F8hOyUD1cLGpWocX+EasnfdArY2QVhARHgZyF92gYV8zXFM
         W3ULpFvVca/YCtEUYEcsPajcNbCtEN7l67gtv72GHVOOFfw3YH5JpPMDiB4l1ol7K+ij
         q+0lEhg5FPB8udpsSpH8M5J4pZT6bP4ivuZlaE+p9N+gDQ0BBpkEC37KhrVTLB8vVuZh
         X/+3s1M9LUvQ0ks8NDCsfuXdkexMupzc5YOaWEZX7U40Acu7mUgKFqs+FEVRNH4Zk96J
         Lqzva/hEHtHqbsNiW4RX8tgfr/EFF5I33+YG6MM+nF9dIRHNOQkljFo4l1ZAjXf/Zstb
         PlFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0YX+pTBmNz8m5Gx74yuQ1a1j7X2E/VI1Y8vlLgRa6580X8Bq1z01R5wdXffJ1bBB2UqR9wg6paO2gz7ql@vger.kernel.org, AJvYcCX9YaoYImmh9utWcakQIsxxD/H6AsRDSNOUKoE47dBr9YgDjA97fwhG9IOgItcEJZ5jj7RSpi9AMyHZnA80+A==@vger.kernel.org, AJvYcCXIbg03KaqkpsCx3/jCXoE+8mIFlHAWoXgaVnQ7vt2ESaIvZp2HovvUtmo8TLy4HMfTaf95It0ZTFjM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoftw+NlcAstXtnaVcptgZ/Lj/DPWHBdaemt0e2lBuH3V+dvlY
	6nvrqTD57I8FTdEoXKZzs2hlABb8eKNlg9QV5AOskucGq1OBnux9d6FWoZs=
X-Gm-Gg: ASbGncs3A0/SzfgaUoew9+Wtd2F58dxoSyguS2RNM77wQyrk8B0aUKEIK7Iuh1veegq
	MpL3AKLY4nEhIdS7GnseADLGid0X+KpqB7uPu6K3Lj9ydpCc3VAbOBV8B+LGyuMtjzZ1Cm1hLaC
	sX5Pt42IgBIfMcyRQQV+JYDFKQkCBFo+47JlxMBoWMaR0+JRZCjA4Iqpnh/eBlcc8yQ5iGpcQR2
	43WDtZ4Rj+cEWM+r4TPKqD0m29Tn+1+gpUEmR6bMb1VjL6GCgkLdVCfTUNlxo3MgTgOjkWdGBqZ
	X7WVqViyT7ykj6T8TENtMivmE18ESG92xvHGHCROqAufTEeFlg==
X-Google-Smtp-Source: AGHT+IESi57MSKb8d9YAD7fhTxQEdsotw1tsxSlanZbIfAnH5/XlsnEUGyThe6cm43ZgLFRPyYZjgg==
X-Received: by 2002:a05:6402:5192:b0:5e4:a88a:657 with SMTP id 4fb4d7f45d1cf-5f04ec385f3mr1591291a12.28.1743583610424;
        Wed, 02 Apr 2025 01:46:50 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16aae40sm8162760a12.7.2025.04.02.01.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:46:49 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 2/3] firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
Date: Wed,  2 Apr 2025 10:44:03 +0200
Message-ID: <20250402084646.10098-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250402084646.10098-1-alex.vinarskis@gmail.com>
References: <20250402084646.10098-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow particular machine accessing eg. efivars.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..79128d11eb51 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1986,6 +1986,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
+	{ .compatible = "asus,zenbook-a14-ux3407qa" },
+	{ .compatible = "asus,zenbook-a14-ux3407ra" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
-- 
2.45.2


