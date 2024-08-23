Return-Path: <linux-arm-msm+bounces-29353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3BE95CCDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 14:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CC082887AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 12:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3078186E29;
	Fri, 23 Aug 2024 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l4mbgIdV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A31865F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417494; cv=none; b=Fvr8TE1BSQaZj8Wfc0MEPYUcm0Uq3U0nv3c+ruuWrxxphCJH8pUucJutj31DRWDG/LptRBwrSbnKDOwaTLSiHcA9hhLSLick0il7EMy7WuUuKqg6l+GNpH9HP6YJ+hFcfuZLaug/wzpVJXb/EvHwg1lFPJDOZZ6x0LzlJnLweto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417494; c=relaxed/simple;
	bh=tKIx1euz/voqGvTWXrKxtVVbTahOhXCIVgZ5jLT/O6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBfsZFYQze6RbttUrQImq8/vsui1Go228X6+7vuT4gJjn4+f81e+wScbKWLOmxyU1Q25zX01JFbPDoBU7FHeDnuCC4p408/HjMXamY5iUxNugSmBw1ax4WHZrIWV3R/fWuAh47BGDqHnMmWzT2A7ppVAJyU0Qi4bU7sONVqeZxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l4mbgIdV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4281da2cdaeso3371395e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417491; x=1725022291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08WjYAlBBFEeMm+hEjWVyH9fkJaAAMN7ZuFtniSsgzY=;
        b=l4mbgIdVMnD5ls4smclpRIQ/nJTYo263LJB5uuombUlsvewFCZCvydDfKV918N6wCX
         oEs8Y68EOVyjgt9fOVT8dLndVhnPR2e3Hd66pThrggFSG6wXA5sGSM5XjfpYLdcXDF9V
         1MqN3mjyvfr+VHwdRRY/2ljcO8xts4SnMfD0dsm+Idn16h5M0OcTvRB4cv/E2d+P1EFe
         +UG/HANtBKzMq4GynnCsBeABvbPyr+4l3WKIqaV6ou2E2zoHttpPRxdcqiYLmMM4ObLl
         HT3QSo2jQCbZL+50zRLd5qogiDiyxocb2B1mU2Pi85/MaUrzRlHWcn8CEHRxBg1WG/Bs
         hj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417491; x=1725022291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08WjYAlBBFEeMm+hEjWVyH9fkJaAAMN7ZuFtniSsgzY=;
        b=epXxBxu8/AxApLAjDrPoKdAw3pyKlzDEJafTY2gp4/PW79PueuuoAZplYS9OzK7U9T
         uadboFRTvSvIEFpSNjL5vHDlqJFutu1zibDtQI5I7A/w/rL1NLM0HgKRt0Y6JBgYoyle
         4XmSto+clDFLVO8Xn1jsnOeWAE0cc09F4pCqsjcPinuB3neXytJbM3E7TDi7dJ91wrAL
         X+jZ+sbBrtsMcTNczNmqu/nYZ5sB0YlaaPeq1Lg52E3TDu57EpxIrvdY+6O5ZeweC0ow
         SQNXyYABD/4D5hya7TG6HAzoJQbQq8uiYmv046MSRUAVvFBTufD8puRCiPXFtI/nr7BQ
         Ymhw==
X-Forwarded-Encrypted: i=1; AJvYcCWt1eNGXcKtgCu7aMtS57F7bdtI3QCF9QkATnlpFT2suKheaZ3cM4zDaT/p1deTZirYeZTLUI1XngLoNggs@vger.kernel.org
X-Gm-Message-State: AOJu0YwEfvXS5QvHdV1BaaiLD4EAv1poawaD5+TNmydguhO2BTNPP7Mb
	mMbYXluOKqsq1Fnt180gnYEzGLfqqThcNLix8SvTQqe4wMc7RZORz5SL2cVFFjk=
X-Google-Smtp-Source: AGHT+IFvESEynb7DEBYY8hzcsJgziySe0iFY1cy2WIsrs8d5Dw+VUq4IdBOvbW6RhGMnpPDiy3f+xg==
X-Received: by 2002:a05:6000:402a:b0:367:95e3:e4c6 with SMTP id ffacd0b85a97d-373118310a2mr763684f8f.1.1724417490919;
        Fri, 23 Aug 2024 05:51:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:06 +0200
Subject: [PATCH 02/10] pmdomain: rockchip: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-2-8320722eaf39@linaro.org>
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tKIx1euz/voqGvTWXrKxtVVbTahOhXCIVgZ5jLT/O6E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXFrRydBY7pj/F8sriEDoh64iP0CNuv6npaj
 HfeNRwU4H2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFxQAKCRDBN2bmhouD
 1ydTD/9YGdRcqk+Zok98MLP0sxqW8OpRmhtYJW2V4NNNbYyyky4ZJr4aGR1Odu+U8AtBgSsNa47
 2nLXZ2bJ/5YbwBxRXa1l30xja/ULnh17kbIf7MVIbVbbuXU1oqsAyqX9zuje16YcLC5qF3v5ATI
 BCrONFjJ2VsbJgn4GHfBK89oDUSVCXIPjrzONIpHVL5vqBv0hBtzSAYjXcqtBAzvCcpGNRT0zDf
 LLAB5t2TCzU0sxWRUhXWVTGXcq6LRh178lslP4leZ0m2NrwNTRR2A2xbY90vS+yjVEXQJOGh00m
 VGi/TyviAJK/vok5UfhiiCnLk171BkRPjlAEv6BG6Pc8qLj/LWjCPJNlbwqD3LT+yvv05kEpmeP
 R/BGeiUEtv4xxgpRxfIuSZJhx8iDXIoog+OhAqs4FsFU1CY3Hz4SgTlVI2nkPthKcYdS8U2V16R
 452XzYefITynrpOSYMuxMwfO/7/lil34uB1lR3L2Rc2ltoMqmrUpCr0p3qsuxfZdBogfQsvIpEZ
 dPcBUzyYD1q8vqQJveSoOBN1E5cDJuOiT39Yar1sk03UVz1B2MbvwJiE0L/ORWvknPaKPFbvtEX
 QY243Ebc6HD3s/4s6YzaO097h0Ba5tySJAZBbSKWoAHDKYpgQ3/NaSheTq0SdA+D6L2xGHJQ59p
 WJa/6IY/F6V89qQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (smaller error handling) over locks with
guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/rockchip/pm-domains.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 5679ad336a11..538dde58d924 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -910,7 +910,7 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 	 * Prevent any rockchip_pmu_block() from racing with the remainder of
 	 * setup (clocks, register initialization).
 	 */
-	mutex_lock(&dmc_pmu_mutex);
+	guard(mutex)(&dmc_pmu_mutex);
 
 	for_each_available_child_of_node_scoped(np, node) {
 		error = rockchip_pm_add_one_domain(pmu, node);
@@ -943,13 +943,10 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 	if (!WARN_ON_ONCE(dmc_pmu))
 		dmc_pmu = pmu;
 
-	mutex_unlock(&dmc_pmu_mutex);
-
 	return 0;
 
 err_out:
 	rockchip_pm_domain_cleanup(pmu);
-	mutex_unlock(&dmc_pmu_mutex);
 	return error;
 }
 

-- 
2.43.0


