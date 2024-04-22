Return-Path: <linux-arm-msm+bounces-18153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DDF8ACA51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 12:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A89E71C20EF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 10:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740F113E039;
	Mon, 22 Apr 2024 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOphGDbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6479013E037
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713780689; cv=none; b=DjY7L1vgo+EOhs/RN/SPcl1gHkF/UNjO6qb1dKr84kJR6atedVGni8gYoA3jUsyjz2PUHM9ZLQMddtQlNBO10LNomRHjGXidtA4+D2ohBICgrEQ68zUlZqJiCVjiA0ldeloFP8u87cViS6Oc/Nb16zN+WLUcqY4g9Aozvp5gYw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713780689; c=relaxed/simple;
	bh=5hXnO01E2x9fmcS8/rZbJSCLl/2FJgazSpXgDUcXmNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WlViSD//6/jl0rNEZSUAZwusGsWRMik21yoNa7/AcPhrBXbmoiREHOoe+RVjkUseyv9fb2li+WRBZCk64Qly7oQG89l/3GLObNt3CWiPi9PRiowQqFxv2GbG/PrvlwvLupzhEWZxaf2ET6IfUbaokhBgnED5bmzU/pL8hn3cgr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOphGDbt; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5196fe87775so4578045e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 03:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780685; x=1714385485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TM1RhMLiz+lI7GOe6oFw/63N/y/J+ZLWylZ/Uc+1/88=;
        b=oOphGDbtMY5Cy7MfAzdknm/1kRpPRs6lXUWAD5B3lXxigujoVYpkxhvsQjK5iKQP/k
         kS/FJWi8fo1iGtm5lbkRediGnhinXNym2seM/bvqobnqKfYG0GNeSyLF3LpeAdY8cWRD
         sQ89EeRAHu/NjS0Ow1iWysIFXy4JSm1/sCVNjoaOCm3Fozxvd7E4z4HR8eVOAC2x9crf
         RMSlNYKS/PQa2/okfN1JgSKMnIdci/KZ0PGcQe7SN6VTorBGfMZQ5hqEkMmpXBvIWpAy
         kwsY5VmBa2g7Ay9HRK/MicTXFme3R3PQULnAE5mz8tf0k8wNQ+08HWIEp3zfzQoWD7W+
         TkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780685; x=1714385485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TM1RhMLiz+lI7GOe6oFw/63N/y/J+ZLWylZ/Uc+1/88=;
        b=HtvfszEAbSI/Xtu9EyU5q0K8s0PvL6kfw/wJnilw8LFF1wheQCVeAXpIGRJjClOzjl
         zE5W5dw0g18uhQkeknqZgSq7AE8ZtNHcSef4UWw+1QNQEEfpXgPU9nwgB/24+H6a3E4T
         L35Km80LtoG7NIFLpJEvyJrV6He1s7yWvZ4iiD9UGl/MxWYoSMXu3+4hTB9q++oyXhWe
         7UMpRHXvIOfdn+mckv7BRKsDPmzFKEaWmfNty4XvJadv3QLtB5DKR8bjn9e0XcrrYFO5
         NiZ6N076lWdwO3IY8QoUrzTaAkP5j4YP/X2766RcPqHZjuxao4DZLXxLcrXbyBYC/6Zy
         1Qhg==
X-Gm-Message-State: AOJu0YyYyPKA9EAGftI5Kv0egdrR9Cly2kHZ9R1P+/syIBlRoCy9dL33
	2iG3sYMjjtX910O87X/mNRuNN/IVkohqLGWVVIvHcbX5zGB4U0dh00z6EZj4oEM=
X-Google-Smtp-Source: AGHT+IH6FUN+2KBjvGtti/xaT0DmdGbnKBA63wDm5a3VNPeJ6QCJlA2B0gIXRXlgbXUvW1az5jeEQA==
X-Received: by 2002:a05:6512:b90:b0:51a:b933:b297 with SMTP id b16-20020a0565120b9000b0051ab933b297mr8596058lfv.2.1713780685402;
        Mon, 22 Apr 2024 03:11:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b00a525609ae30sm5576339ejb.169.2024.04.22.03.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:11:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 Apr 2024 13:11:17 +0300
Subject: [PATCH v6 2/6] soc: qcom: pdr: fix parsing of domains lists
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-qcom-pd-mapper-v6-2-f96957d01207@linaro.org>
References: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
In-Reply-To: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5hXnO01E2x9fmcS8/rZbJSCLl/2FJgazSpXgDUcXmNU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmJjfJIdwYaQRKspqP42Yq0aBTU0T6jGb1S4UPd
 RT1jHoTZV2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiY3yQAKCRCLPIo+Aiko
 1dfjCACT5oVu4xTgrg91ZN5ukoPMmtokrpJKa2JpXXKDZr4Llqtc7oo4B9l6ILcn+hy1STIQ5Af
 Ygv4ScWrnE0kO52757C9f3dOO3ARI+OrNfwRLJyXdrOVYoI01UuvoDaTIEZD4I1uu3LcOBxiuw7
 q8smfNqOnwEnOKwK5YmgLFhWqskZ5MKY8tzmvt6ZwsZD0VrGdwpBFpxNA3vTQZBhtfmJtcdnNfc
 YvtGQr+VE/woW7P3GIVAiJZY5dAZeYjpOl0GSEWVf+sbpMO7i7s75Vb0MqGmRw1v4RKa7K/ayut
 oIYK0To1COVrFZ6vZLphi7MowenDO+UHD1L1d9hfdBkTD9GO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While parsing the domains list, start offsets from 0 rather than from
domains_read. The domains_read is equal to the total count of the
domains we have seen, while the domains list in the message starts from
offset 0.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pdr_interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 19cfe4b41235..3c6f2d21e5e4 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -415,7 +415,7 @@ static int pdr_locate_service(struct pdr_handle *pdr, struct pdr_service *pds)
 		if (ret < 0)
 			goto out;
 
-		for (i = domains_read; i < resp->domain_list_len; i++) {
+		for (i = 0; i < resp->domain_list_len; i++) {
 			entry = &resp->domain_list[i];
 
 			if (strnlen(entry->name, sizeof(entry->name)) == sizeof(entry->name))

-- 
2.39.2


