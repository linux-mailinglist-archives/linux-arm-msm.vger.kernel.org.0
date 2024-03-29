Return-Path: <linux-arm-msm+bounces-15668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B030891399
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 07:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6821B23A72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 06:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23C44C3CD;
	Fri, 29 Mar 2024 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XSjPZg3x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F58447F72
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692950; cv=none; b=CnL933zUJEpSey73LWlavdCI7V+2PIhPlaIl3QdL9ablwMaaRTGE9aS72NpkTJtCb4kjEaYUTN3DlYAfm10ZgMu4UAPrIAqQd9mTO5gQ4V6+/hb9nxTKqgFO3SYxxEioAFzX5BLvlhjtbsHgoJNd5NQP58NMQf9AdUlp2nrZX4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692950; c=relaxed/simple;
	bh=YxeqS9+AEKt92fJPZZCdKrmg0ZW698/Ca7k90saHM74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbRgV/+CX7gmSCQRQIZ/zkKSyiPGdajU0Tc/VLP+0VGbH255AaGj/CJGDVovfrRjxygFOMqYcmkDCfjJICStElwbWhifcPGog34Um3n63D7CGMPdAhIQARn5t2emKbrL4Mko0W/1o/bd+4uVQ/Mcgo3LnX6bSDaFJHQiYY57OqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XSjPZg3x; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d718ee7344so2674701fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 23:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692946; x=1712297746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBbPByPot+es2m/svxnMW+kEyaRct2JNWCRNRMHPaxk=;
        b=XSjPZg3xoQgpcJUmLIrTGKnhI3wRhlxmT6WLYfMPf2LO1EsVpuG1yfKjFGacP+HYaJ
         oDYHdGLr83iIWJL82xDMavNbkPghxPppIN8d+2smFPh4auShQwsxUlXRtV7nM7VpVZrm
         Ejn92mqluRNnELciAyRNom18nIjwu7fXfQRxkVL40LOJce0gLc5KjFUF/cfxhlCplWLE
         bBvjTFn4wy3l2IKhoF7BCNHw8ZTdInReVJc3FkG2C1XsJ88yKLoq3anmhwm0n7dSDNEl
         Ef5RL6cG28FY3WCUTReO4k2At8JtLHpOwhl96/0i7Qp4hfEHhlv5e9V/P0QBtsbM/9NC
         f9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692946; x=1712297746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBbPByPot+es2m/svxnMW+kEyaRct2JNWCRNRMHPaxk=;
        b=AKzCe3I5pqyKj3RPbPPgNwgiuWUito2QcMWEw19r46Xq5puFw7yTT2VK+YNngiOxeD
         JXyhhw8rJaf6+groLthbVNqj3B2apD02pCEU/+VSyJOY3QghMNuofhWQZZHYi59BE8Un
         ewolsscIJzvsDOSLpR0Ddo1L71GF6erdBUOaPwgRcWL+McR6+q8qiFXMdrAL9oJrgt2+
         PJoBPxnYBQgfqI4hFFuxduvpfz0VZ2eH0bCsXU+pgIXS5y4wxxvkDsXBm3+6JvpklE7k
         nscvuU/aPMJ0kEoEBsGc87wA6yA9EDRg9I5AzjTFJs+EqlVT7dPESpYitjqhwJ1jK17+
         V3Sg==
X-Forwarded-Encrypted: i=1; AJvYcCV/VX02W9AbPr4iCqUj9zqYhLmNxarYeb+/3Wo0Q5wNLg/QPh6jQkcGtPYIVPSpfDddOgx16NxmnViqXjByz+PO/lxxcANdfuqACkkvpw==
X-Gm-Message-State: AOJu0YyRsPXzV8SEMMOfu+08Wlt2w5hcykZjZBaAH++F+rip1jKFjRFC
	q/+grKh11VXdrPvxLafhVD/eWkHVOL2xO551rSkKEZ1+C6/DX6A8kFbbUmmNuy0=
X-Google-Smtp-Source: AGHT+IEPRQ9eWd4qptN07z8gS0eJNHOjSCyMldcVnalm+I6vKhSLVJfC/bSy+HJ5vt9TdPwVznv1YQ==
X-Received: by 2002:a05:651c:2d0:b0:2d5:6b1c:b180 with SMTP id f16-20020a05651c02d000b002d56b1cb180mr705437ljo.8.1711692946084;
        Thu, 28 Mar 2024 23:15:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:37 +0200
Subject: [PATCH v2 05/11] usb: typec: ucsi: simplify partner's PD caps
 registration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-5-0f5d37ed04db@linaro.org>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YxeqS9+AEKt92fJPZZCdKrmg0ZW698/Ca7k90saHM74=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyMV0bTuwZx+D2SMO9pQ+XDYOMhJOfUz/7xa
 RNXDKlDJteJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZcjAAKCRCLPIo+Aiko
 1ZDFB/9HExwMtBzgRUjHqXIUx0di+43lhFI+s9kC7ti/gtDev/iUP+vWLRGMVRzVR1ZdDzWqO1R
 h1RdeGsKcC8Igl2PhxQwD/fENbaTS1e9y5XhB9JkvFeBHDaLLHSlp4sCMHe49jokgud19ytIgPj
 mnmgh7/1kIh94acoGWrSD6yOP34NOjvdonWkAzWcqjz8EDT8n1KEC06dvjjxg52XgVS196NqpAj
 Jh5d8Uy91MY3Ilbe4rAUJBTXc8padNuDmHJywy5Ugn5GwvpuQEnaJ4CA81DYS+nRngn55GLKjht
 TSPr/GmYBN1hbwWpNOSCXOju1pKg2bVH+98hwBlX30VTe02T
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In a way similar to the previous commit, move
typec_partner_set_usb_power_delivery() to be called after reading the PD
caps. This also removes calls to
usb_power_delivery_unregister_capabilities() from the error path. Keep
all capabilities registered until they are cleared by
ucsi_unregister_partner_pdos().

Fixes: b04e1747fbcc ("usb: typec: ucsi: Register USB Power Delivery Capabilities")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index d1a45ce7f660..35366b1a3d78 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -826,12 +826,6 @@ static int ucsi_register_partner_pdos(struct ucsi_connector *con)
 			return PTR_ERR(cap);
 
 		con->partner_source_caps = cap;
-
-		ret = typec_partner_set_usb_power_delivery(con->partner, con->partner_pd);
-		if (ret) {
-			usb_power_delivery_unregister_capabilities(con->partner_source_caps);
-			return ret;
-		}
 	}
 
 	ret = ucsi_get_pdos(con, TYPEC_SINK, 1, caps.pdo);
@@ -846,15 +840,9 @@ static int ucsi_register_partner_pdos(struct ucsi_connector *con)
 			return PTR_ERR(cap);
 
 		con->partner_sink_caps = cap;
-
-		ret = typec_partner_set_usb_power_delivery(con->partner, con->partner_pd);
-		if (ret) {
-			usb_power_delivery_unregister_capabilities(con->partner_sink_caps);
-			return ret;
-		}
 	}
 
-	return 0;
+	return typec_partner_set_usb_power_delivery(con->partner, con->partner_pd);
 }
 
 static void ucsi_unregister_partner_pdos(struct ucsi_connector *con)

-- 
2.39.2


