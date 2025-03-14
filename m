Return-Path: <linux-arm-msm+bounces-51380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5995A60B43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40B923AA4C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 08:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF3AEAD7;
	Fri, 14 Mar 2025 08:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="urM8dhWs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DE419006B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940676; cv=none; b=DFgYIGhBAe3mKm2BI0+F3aRdSq7WnZ1nMLEmd5h4O+Y35BLyeR9GfGn0qpfPPpSfRLBZ7WxcaNa2V2T7/LuX4hF6OZ7AaxPJdO83OIcfoYRVg0ue7Bb7LunZk2mrG0YUmMWOHEJ277mfkZNXpXSdDLzNnM5CGimGvQ2w4Vkx5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940676; c=relaxed/simple;
	bh=w97u6BXDdV//+jswswofrPD9VxViQ2Pn0svg6KRTA6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L8x9jAFggZ536yQCY37t5w/Zz66t5PL5cLpLQ3JHbIFkSkyKZUNvfxWyKIGf7bGjL2fpO70i+I0Ppk00+7/JGpzXXQZl4mgftNmBBg4f9IS1iZelZM0LxMorf7YvoJnT19kaY01TU7CYjQ+aXPGOLXPBvSc38BOF6CrWj8mwqxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=urM8dhWs; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso357744366b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741940674; x=1742545474; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ywEbrJtSFC2AqYUcKXRGNHqBvY9/O6csNZBNXCU4/xs=;
        b=urM8dhWs5Y7oLcYQvV6dZx3UhUExNrSuJDeoQJufypl9eYw4jWCypSsOmzdfE83w9Y
         lpftxzCo73kh/iXTa0QDlPDHx3rwnOh8PtKmLcS/t0ygyDNPgBszsxbSUd+twIGcgW0H
         1tKob9Ic/oSHGgI7eedII5ltBV2Qd5BNujIBvLU23BqzGzEia1gDH+s6Hf7aBfDiYRd+
         g1QfojjvqmBE4B66f6BNUu/8pguo/RMd7URx2BkIEwq/Vbq+mudQFGnNrd66WmPBJoDL
         ORKi4Rj2aUtcKcFBBIlnvLJFSNy8b2uj95AS1NpJTcYsI49CKBPvidw/VMhq4l5qqlQi
         o/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940674; x=1742545474;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywEbrJtSFC2AqYUcKXRGNHqBvY9/O6csNZBNXCU4/xs=;
        b=WMrUR2qXCXGtgp+G2LyyAkFMg38TYcXkKVYe15TJqFzmmXwVaioUBLG9Ny4vkTedCM
         2NwsFThluLknKpVS1I/pn0m+rJ1+CfSzoot80Xcp4vIL+PpiH5rXI7JtQTX5EsjVE683
         PxAk9fXZtDXS8lyn3o1mgF92d4xWWVoxzxY9i+7srDb0KEODdT5O0oUZKtbV86LTBYEd
         LOV2BswYwnuInwqVQWPkgcpmaYAD6Y26hTJlfiQT+Io3TMQHKAds17TGRqrWxuCMsXht
         QCez+zSLavvhnMts+hKx2xEIPH4LEs2ngutQPG4/GHyn0pLMrStlASEhzXOoh33i8c7X
         HmQA==
X-Forwarded-Encrypted: i=1; AJvYcCWyGYTECQ1tVqlrOq4vLKJlJFns2qvmkN4QN9sSKZagI5iXFe3QsBEbyiKjLaA8XpdLz4R11j0YD/KSp9/M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hcOA2lXp+pSJkZfe74YuhVWkJNxF7WRRrcqycP+JJw8CnXTe
	oDTpWLiOIZn8AEUWSckp81Ku2o+LsQ6Y9qoig+vPibo+B9rlK4nrY5LXPJ75IgOpcBND+QpGwTr
	O
X-Gm-Gg: ASbGncsuS8kGkjtve/QH7PhsvfDZvxsn9daE0qj2tu22lxarKjrJe8Xvb/XCJ85ie6r
	TpzVHBf7eHJmNQqVx6iDcCuNnrKsNfDQQGLScLM+L8t0OO70lve3BYu9/EMsKJE8EBDo8QpXuLy
	k8yZKin2wzMYySRC3ixU40TgoW9wSAuWpmquWZYN3lo/vmF2WOTlL+KRvJM9GvccBSBC7MKgmyG
	sCRtHeRc8jjJ6hDJJctt24h+11TtW4cphQC/J3Gx3fjSq0hSS6GMzfao/jZheShfIhOlncxjzJs
	Jp9xq8PycjmbyX4hlc1mv+NSqhsCKVJSs/TfKt5QNYUJrGK2sUiJH8X2IdYHiWttD8LaPAvyT9m
	OpX4ZZCr39E3RmJCIGQ==
X-Google-Smtp-Source: AGHT+IGTscR7BYFU80Pa4ZMB91BZEbz1XZF1lYz6b8n9RlCmwKKPrDiAzrx8K9+FPXXto+nTQ+ePIg==
X-Received: by 2002:a17:907:3d8c:b0:ac2:806e:bb51 with SMTP id a640c23a62f3a-ac33017d768mr166849366b.18.1741940673584;
        Fri, 14 Mar 2025 01:24:33 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314aa6499sm188846866b.183.2025.03.14.01.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 01:24:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Mar 2025 09:24:31 +0100
Subject: [PATCH] remoteproc: qcom: pas: add minidump_id to SC7280 WPSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sc7280-wpss-minidump-v1-1-d869d53fd432@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAL7n02cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0MT3eJkcyMLA93yguJi3dzMvMyU0twCXSMTSxOzxBRjc7NkIyWg1oK
 i1LTMCrCx0bG1tQAU0eCZZgAAAA==
X-Change-ID: 20250314-sc7280-wpss-minidump-24946ad376c2
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the minidump ID to the wpss resources, based on msm-5.4 devicetree.

Fixes: 300ed425dfa9 ("remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP & WPSS")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 97c4bdd9222a8d5324fa3655019e2818f4fd95f1..a78d4292a05c70ccc7ad0b46e641ef45253ad8e6 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1348,6 +1348,7 @@ static const struct adsp_data sc7280_wpss_resource = {
 	.crash_reason_smem = 626,
 	.firmware_name = "wpss.mdt",
 	.pas_id = 6,
+	.minidump_id = 4,
 	.auto_boot = false,
 	.proxy_pd_names = (char*[]){
 		"cx",

---
base-commit: eea255893718268e1ab852fb52f70c613d109b99
change-id: 20250314-sc7280-wpss-minidump-24946ad376c2

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


