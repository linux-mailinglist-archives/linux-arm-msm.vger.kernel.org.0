Return-Path: <linux-arm-msm+bounces-25509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422FD92A730
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 18:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C84FA28839D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 16:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF1B1474A3;
	Mon,  8 Jul 2024 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sRxpj3gI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CC3146013
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455749; cv=none; b=efm8cz71NpvKIhl/vEINdBE2DxJIoEhCeUOKqKGFNMCB69Esgom/XWulsxDomrlaAf+P8qQ6kUy4UkqKiz2wKgcagPL8AhPdEW+y3odVUwgyhu4T1b2iwZPjeiDERmsyltwbRbJrPGwe0ZDSgd8h/2Nh+mZsVXWmWGyUEUVFWjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455749; c=relaxed/simple;
	bh=Tr62qMYfC0ruz01Dz9fIIR6iv52RtdqzIwTLr7SB9Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wm7VfNoqYFZmsl+vNYRX4C97EbktI8OmL4+d69ELNAagSOcsY7VrwEag42pKSr/nXZ4oVyrRI1uBmxeuU5ek6q+/LeU6aNyFjose/MmglvfLqPMQF0RNZHqPy+KT7svRCNM3qUjFyQV8EGQA2oVvKR/x6T5ZfVW1a6nOtrQZNQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRxpj3gI; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee7a1ad286so43178741fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 09:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720455746; x=1721060546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByBG64bnfS7ZhtMwa9DcMP0vWKacmBp78weeYmR9owI=;
        b=sRxpj3gImKnawMoMM5FlLO6hMCML5qtK4bwkieyzwMHCUv4Val1FD7newBsHXb3peM
         cy6VMATfF6wiGkbBMf5iCUwnk9ogNw3qZ2jShiCybA06mkSWium9+BWI9bFeAFt4tCUB
         wLOB1eS5u6mDOZZ3oJ1tsnq+Sy7Z3mOI7Uzxe5RXrXLW/Kd4xxiFDfDX8Swl1OJTub57
         o5ZLTXUDDQUmBflCR0gPYGSKlrCHMMMSt+f0OQeRe1pCi/Vn9CV1newKkUS9v04qC6ER
         0Cq70eXtn3NRHcK/LcVPHe10Dkyca0M7NneBLYaElskH+p+8Sf9ZJ2mDBzAVH9I3bcSu
         Iohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720455746; x=1721060546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByBG64bnfS7ZhtMwa9DcMP0vWKacmBp78weeYmR9owI=;
        b=tnlzleCscQHNjjhXDVWE4U/ZaYfcRj7EL5D4p7anLL0BXXEpfvH5KXsUJMfna9D9mq
         jwrGYjobaU3geBbofUEqJ7a5hmQOWtqQ5BRVbWO4OaEqGuLZ7mcskcjES6JtpRsLN+mf
         oygRu5yAsX7hulplramCTOC+TT88gXVDLDVhxwmefKa4cCOvJLe+L3MMaw9f1yC73goF
         JulhiIp9c3mcn99mnZgpSp4cgpMi+BxGiutbUDTnaxVVl8MyzPmFj9e9TwpMD0+iTBEG
         HA1bOvQ71gebhgdxSRelIjdlliMt6n4EQJlCU009AcwSnxpE4s3r7iouuAs9JdbX1UOS
         rNLg==
X-Gm-Message-State: AOJu0YxOPLfpf7EKReoAga6/qG7pXe6rTEMSoL4ltN7ejvGD7XFZV5iG
	/7EooFbehrcIYts+NhqKeyUCqP7fOaerehzuDndsmX3sTJui1ZydWU+FxFpPW5xTmlBX9hhhno4
	rpFkbCuU9
X-Google-Smtp-Source: AGHT+IESYBQLqgCNV7vA1SHB0F557mIv6mzPAZ83t9fxwalFBTmkwcTPFV0IYIDR+A43AcU6oVUgQg==
X-Received: by 2002:a2e:7208:0:b0:2ee:8cb5:6ed9 with SMTP id 38308e7fff4ca-2eeb30febabmr1346711fa.31.1720455746233;
        Mon, 08 Jul 2024 09:22:26 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:d237:f5ca:52b6:108c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e0b6bsm4466875e9.3.2024.07.08.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:22:26 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jul 2024 18:22:10 +0200
Subject: [PATCH 2/2] soc: qcom: pd_mapper: Add more older platforms without
 domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-x1e80100-pd-mapper-v1-2-854386af4cf5@linaro.org>
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
In-Reply-To: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0

MSM8909, MSM8916 and MSM8939 all do not make use of pd-mapper, add them to
the list similar to the other older platforms to avoid the following
message in dmesg when booting:

 "PDM: no support for the platform, userspace daemon might be required."

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index ff6aa3e521bd..0b9a149b2953 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -527,11 +527,15 @@ static const struct qcom_pdm_domain_data *x1e80100_domains[] = {
 };
 
 static const struct of_device_id qcom_pdm_domains[] = {
+	{ .compatible = "qcom,apq8016", .data = NULL, },
 	{ .compatible = "qcom,apq8064", .data = NULL, },
 	{ .compatible = "qcom,apq8074", .data = NULL, },
 	{ .compatible = "qcom,apq8084", .data = NULL, },
 	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
 	{ .compatible = "qcom,msm8226", .data = NULL, },
+	{ .compatible = "qcom,msm8909", .data = NULL, },
+	{ .compatible = "qcom,msm8916", .data = NULL, },
+	{ .compatible = "qcom,msm8939", .data = NULL, },
 	{ .compatible = "qcom,msm8974", .data = NULL, },
 	{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
 	{ .compatible = "qcom,msm8998", .data = msm8998_domains, },

-- 
2.44.1


