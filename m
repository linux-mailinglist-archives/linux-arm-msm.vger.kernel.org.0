Return-Path: <linux-arm-msm+bounces-41109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D679E98CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 114BF1887C3A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 14:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BF01BEF75;
	Mon,  9 Dec 2024 14:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IU3vaFI9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0C81B4249
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754491; cv=none; b=SRzVHjF4sZ8ugbXnaQmCKJURfUe26M1Vosy/g18EN+Skdx+nzw5wxnwVZ1H6L0riLXgEi+49V/yVVD79pTUtoyjATcoCLXkT7o20oQOW+qf+s5AWZntlfCxzzV5AhShkWIBEm6iko4zvcmXksXqbqWR8Xuo5NejE+rGL4JPrdhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754491; c=relaxed/simple;
	bh=bXVwUUS+c+N5nd/x0cktMoGmXIjcEO79mBZv/WsAgiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GTzP0QePTYXeCa3nRn5UY7edQCBVLq0DOofGZ+Imxe6tGrqnKsYHWD3E+zOV8dZu2zll/havpLNq//8EXpvomXz88LCBh7PD44zMPiAkkAkBgjRkHWxhgRSARu1Pl/IymjgvPT+LpNMk4HGspP2yptz2KaZBHuIWSBU8VjhAI7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IU3vaFI9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3d69e5b63so274716a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 06:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733754488; x=1734359288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQjfcs2sKYpQsUR3dkoS5e986NnXj0KjUS47ud1KCqs=;
        b=IU3vaFI9XYLY+jB2YeghWWG+n3lJf2wwyaNo+9N6qJMqrmTHgiyF15Y0660XNGza32
         Sm9iGWOLSMn5j+ZEb0DaKQw8uDyRrx70E7jr/03ySkAJ09aTop0Pbws09UAegjOH8US0
         cq3cwgMwMBJ7MkVvWWmVbvPePUmGNhr3LaXzD02jxVAy/sAG+lwVST2GuTROVC3w4v8G
         5r5NLh2ydjTgmnXvlzVaakGoqRNFIcI79C0ZVS1tOKU9FOKNmK6Ro6/5DQSXC95uX/WD
         oI65YpUuuiiRqor4jiXuZ8j/Nq6i2LjBRnfc/SxzRwvL3f+q/TWw1bLqQnZ0O9HdZD3H
         qksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754488; x=1734359288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQjfcs2sKYpQsUR3dkoS5e986NnXj0KjUS47ud1KCqs=;
        b=Z2Fr1Q4PRbBH1K15PFx7XeaGrZmdpeTjpmfA4tmk/IhJrZjMYRGeGqNUvXaGmCWLlq
         dVeDOzjCxn3scI2AffbPcAl+Gfr+irQSjoVj8jr0nDR05IEso+yOFS2ERsSv5eTpZ/pH
         hX84m3OVa/Ouqlcb2RPrySAP+oebpC4n06ys4A3tP+2hlvlgUfg8T/BVW5VUmVUeZT+i
         RbaO3/i7/tPI3HoBF3W8v1cQ0fuKdAKMzM3x1ovY2xyvgOSoW3BLfuB569vjgnAtQAaf
         vJANaME/w+F9jy+2M0x+L/TBiZgWAtfhbOUezr3H2HLPYo+ZNx9C/C7eDAxe0CNEn3RG
         PFHw==
X-Gm-Message-State: AOJu0Yzqu5Liu1ZI6PaOUU3KtDwtPMUHlXNTuwPkwaoGHW/EQuxiWDjQ
	ywXBrPHYyMEKrVelvkNLBdQB7pyFsua2OOgOfdIIl2kjHv4YHpBUIQiSEZKhDQr199sOczgv8wa
	x
X-Gm-Gg: ASbGncueuHzcv+XsqomhObZ+LYfcoHrmgw+TJ8B7Sik76x5K6zroq7sYT6uTgdTCpjV
	08vI/5BTcfZJeoctCgNGsOl4MSerWR571NTw0lvgEpVUsl/mYwUaB2ilzcUHf/nzj1T8j5l3ykr
	gxyKF6FaaAhGmrAUjKDzbq32WmaeRCN2drl2OtctUtK0IbA2XMDQwhcVfquO2wIp5d2X+Jg+G9z
	OmW2N4X8CIlKZ4BhejYPG5F5PjQVXS3SJkqvnrVOtgSgwm+bZ9HwUuG1NPdc2IqxA==
X-Google-Smtp-Source: AGHT+IE3RGJa2VRCqJMaJ+Lhq6v/u63fkKtlHSC8vuqVBVwcK2u/Be4KhKB5cdbTigwywznwhJ5WdA==
X-Received: by 2002:a05:6402:51cb:b0:5d0:bcc4:8af1 with SMTP id 4fb4d7f45d1cf-5d3be462850mr4743547a12.0.1733754487524;
        Mon, 09 Dec 2024 06:28:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3eb109bc9sm2887141a12.42.2024.12.09.06.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:28:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 15:27:55 +0100
Subject: [PATCH v2 2/6] firmware: qcom: scm: Fix missing read barrier in
 qcom_scm_get_tzmem_pool()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-2-9061013c8d92@linaro.org>
References: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
In-Reply-To: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Kuldeep Singh <quic_kuldsing@quicinc.com>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, 
 Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bXVwUUS+c+N5nd/x0cktMoGmXIjcEO79mBZv/WsAgiA=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGdW/m6g3rABh5shDUgjU/soyymq+TMXJ8TFB7jZg/JkOKV5w
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJnVv5uAAoJEME3ZuaGi4PXgkAP/A9+
 9P6Iwv9mNhA3OiZh5j6FG/JhMIO/suJ8Rifu2WMhiHjQ3ChhoBr8GJuSzHkMruggY9lO6xcYFMB
 HeE7lSzT3wvutASuNPD/7Ez6h+Zvv4K7IUZPSYuPxsMMj32hpdh+JvyIU3gVw9af9aFMPVKBf55
 2hUSZ9PcpTQ+VQmVtesqoKvqtRb2ZyNT+UGAy6G3IVpwxZXRCQLwdQsrVCD8PDuCOpQPhRkDVWe
 JsrLqwxlRzHoAy1RZtEPRS06q0U+MZJj/ODxOPh2coJ6JUXxdr9n7fTjJlfjxHY8hroDfjFIhgg
 eIpsPQklLqllENdwvZB+AcTcAiO4eQeZpFMljypYjSQscUNeKNKsY0jgJE6MuIinM6qkzJVbG4x
 IhaZW5RU01/eQaXUZoVwSlJWi09hseuFLs4iSH76nj1qcSDhksJi3VwOAqXGw3drEru26lnDefb
 MgnTK7IolNwMOpLmUhlCYZs0c+CwR9j1QlnHQbTp0/RjJA+ZfM/u2kWbVl/AzjGfkr7vM8cKHLv
 blOG2n9SO+EbNBvutNOqVke+ey88zWhbmfzOR8Utjyqpk+/OGatfM0h6DqE2EWJAvBkIzZWMw9m
 nTJpmjfwNnjn3D4hFUZmXv3h5YrLvwvfm6oI3dZ65eImlLLInwlIhlbR873dv4lgn0vjr0ww1nn
 VeGlP
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit 2e4955167ec5 ("firmware: qcom: scm: Fix __scm and waitq
completion variable initialization") introduced a write barrier in probe
function to store global '__scm' variable.  We all known barriers are
paired (see memory-barriers.txt: "Note that write barriers should
normally be paired with read or address-dependency barriers"), therefore
accessing it from concurrent contexts requires read barrier.  Previous
commit added such barrier in qcom_scm_is_available(), so let's use that
directly.

Lack of this read barrier can result in fetching stale '__scm' variable
value, NULL, and dereferencing it.

Note that barrier in qcom_scm_is_available() satisfies here the control
dependency.

Fixes: ca61d6836e6f ("firmware: qcom: scm: fix a NULL-pointer dereference")
Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 246d672e8f7f0e2a326a03a5af40cd434a665e67..5d91b8e22844608f35432f1ba9c08d477d4ff762 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -217,7 +217,10 @@ static DEFINE_SPINLOCK(scm_query_lock);
 
 struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)
 {
-	return __scm ? __scm->mempool : NULL;
+	if (!qcom_scm_is_available())
+		return NULL;
+
+	return __scm->mempool;
 }
 
 static enum qcom_scm_convention __get_convention(void)

-- 
2.43.0


