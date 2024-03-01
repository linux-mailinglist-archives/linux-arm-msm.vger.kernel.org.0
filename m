Return-Path: <linux-arm-msm+bounces-13103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F8F86E6A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 18:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 787FF288EE9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 17:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA11282EE;
	Fri,  1 Mar 2024 17:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UoiXNq1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240B1208C4
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Mar 2024 17:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312575; cv=none; b=e8uNAgFQSLrWtAhprXuHFyYleiIyybHD4QA1fHJMMaQk3agOW7+SbuKt8G5lmjdStbU7chpdNHcW8EWjm5eNgwGc5uwaDrmW4zekOrODeue6ZRMjB3QP/M4ryy5qUARk4Vn176xqy/3zleNEoraTJTj2FfW2mrVzGNtH6tBOnqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312575; c=relaxed/simple;
	bh=Am0NKmlCwgLy7Njo99K+o5i4CrEnaQkPIJSAd0GcvZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oe9qFwFXEZGO6XeTQ49hp5MLcgT0q/lKizdFfJUdQftvK5l0Q2wHJB7KGsJ43/YFu3MT3rgdAR/z1IYyc+kGlI2SkFGvdl1JTSZCuqUiEPTDURa2tMdSLZIoPg0f8yBciH1ZyKAWsB0nPXhMI9+WZsPoQup1KvtR0dCLWkx2mW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UoiXNq1Y; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7c794deb6cdso102742839f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 09:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709312572; x=1709917372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D+lwpw4B4CqzaxbOzMn85Ig/zR5F9N9xKtP1WaY0I4=;
        b=UoiXNq1YIse/AYhZrBjeNzM++GGQGFq9Ey6Ss73tCz4yKRng/w92bL2oPBe0j0KBSb
         sFADnKJ51BglRq4K0hCoRsx9qRaOqhb6bnSGHD3604Muzw/NvCk95+VSbhOjtRnDfXit
         oDMp3CHa+n4nqSKUmEIACbxyiR7HcYYG/NSbvt4gmdfNm2hColtUbZsGVdyEzkpjlnfK
         PH/vBB5ZBdKP+x+varCLCAzZror7efDGkRcNmoBZUweLURWvDUVw6ykNWGY5JIPJNfPF
         nbUffIGAJFNqijTjujOUCefemb5CkWdMt1MFd5XcQWTElWR17FpRLQ+YnQTwQHyLpvb1
         mf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709312572; x=1709917372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5D+lwpw4B4CqzaxbOzMn85Ig/zR5F9N9xKtP1WaY0I4=;
        b=F2F+aqFBc3qxYug2FDZ6eoeVCjRioyFIbR3Ma/koMZMnnKQ5jgrSRtILYQcoI7vIy6
         uwHjTvY4TMp+HcOvzhqSwRb32lld8a55gQW+GM0C1mDh0w+YV3zr//c9Pck/WKEnXW+q
         He4Zpx1ftimeVGREYJn4YN/GTlZC8lKunxCx9AUmKbqlfQHt/LrG0RKsFOUVyY3nYy1K
         nWjPfBZiPVNBFuqvBJkl8AELLAcds3Cfjek6qgvR+l+GlpLJ5i+X/GlykXjmefJbKdFw
         g5FEgYRzY80rMOoHRxCv2xZECAe9aEn9s2ZaNqMNVbDRBmodZoYPjyhTrcVL0l9VduW9
         Nrlw==
X-Forwarded-Encrypted: i=1; AJvYcCVYv4WT3Fu/PCcRF4Mt7zf6Nr9i0iuqGjkvCwgXXX8rr7erePFr4pCk9XA7EdP5c4C0d/tjxB34tE2CVfATOUk8e1zu2hxWgnxuVnzqSA==
X-Gm-Message-State: AOJu0YxIe+aKA6qZlCLObbPd7MeWv/IhVHq1+/Y5cLyAaMgToKDtg/o3
	yO9YPVMxTAwJQ319PZwMBtSYG6J/CPjAX+nSflTYeJxym0sWVDJyLN31odzOBLk=
X-Google-Smtp-Source: AGHT+IEao1txlb3PWR+Vls4dRzrvRoKUVfV7DGZtMHkfNbUdkpxeGg58q0ddiR3eTAA5Nv2Op55FMw==
X-Received: by 2002:a05:6e02:12c3:b0:365:b574:960b with SMTP id i3-20020a056e0212c300b00365b574960bmr2458398ilm.18.1709312572586;
        Fri, 01 Mar 2024 09:02:52 -0800 (PST)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id o2-20020a92dac2000000b0036581060910sm991430ilq.6.2024.03.01.09.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 09:02:52 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 5/7] net: ipa: pass a platform device to ipa_smp2p_irq_init()
Date: Fri,  1 Mar 2024 11:02:40 -0600
Message-Id: <20240301170242.243703-6-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240301170242.243703-1-elder@linaro.org>
References: <20240301170242.243703-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than using the platform device pointer field in the IPA
pointer, pass a platform device pointer to ipa_smp2p_irq_init().
Use that pointer throughout that function (without assuming it's
the same as the IPA platform device pointer).

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_smp2p.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
index 5620dc271fac3..8c4497dfe5afd 100644
--- a/drivers/net/ipa/ipa_smp2p.c
+++ b/drivers/net/ipa/ipa_smp2p.c
@@ -5,7 +5,7 @@
  */
 
 #include <linux/types.h>
-#include <linux/device.h>
+#include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/notifier.h>
 #include <linux/panic_notifier.h>
@@ -179,14 +179,15 @@ static irqreturn_t ipa_smp2p_modem_setup_ready_isr(int irq, void *dev_id)
 }
 
 /* Initialize SMP2P interrupts */
-static int ipa_smp2p_irq_init(struct ipa_smp2p *smp2p, const char *name,
-			      irq_handler_t handler)
+static int ipa_smp2p_irq_init(struct ipa_smp2p *smp2p,
+			      struct platform_device *pdev,
+			      const char *name, irq_handler_t handler)
 {
-	struct device *dev = &smp2p->ipa->pdev->dev;
+	struct device *dev = &pdev->dev;
 	unsigned int irq;
 	int ret;
 
-	ret = platform_get_irq_byname(smp2p->ipa->pdev, name);
+	ret = platform_get_irq_byname(pdev, name);
 	if (ret <= 0)
 		return ret ? : -EINVAL;
 	irq = ret;
@@ -261,7 +262,7 @@ int ipa_smp2p_init(struct ipa *ipa, bool modem_init)
 	/* We have enough information saved to handle notifications */
 	ipa->smp2p = smp2p;
 
-	ret = ipa_smp2p_irq_init(smp2p, "ipa-clock-query",
+	ret = ipa_smp2p_irq_init(smp2p, smp2p->ipa->pdev, "ipa-clock-query",
 				 ipa_smp2p_modem_clk_query_isr);
 	if (ret < 0)
 		goto err_null_smp2p;
@@ -273,7 +274,8 @@ int ipa_smp2p_init(struct ipa *ipa, bool modem_init)
 
 	if (modem_init) {
 		/* Result will be non-zero (negative for error) */
-		ret = ipa_smp2p_irq_init(smp2p, "ipa-setup-ready",
+		ret = ipa_smp2p_irq_init(smp2p, smp2p->ipa->pdev,
+					 "ipa-setup-ready",
 					 ipa_smp2p_modem_setup_ready_isr);
 		if (ret < 0)
 			goto err_notifier_unregister;
-- 
2.40.1


