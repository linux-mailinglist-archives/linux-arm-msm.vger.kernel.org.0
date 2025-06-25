Return-Path: <linux-arm-msm+bounces-62365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 191EDAE7C85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5576D3BD3D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1FA2E2F1F;
	Wed, 25 Jun 2025 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SM3O5nFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9598E2BDC3F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842941; cv=none; b=VYy4wGCX+/bsJqhnaiIkXlsfCqHLYG+OgOCbYg7axMQ0ql/lyE2N/A6xZHcs/kihtLrxskoXhNKJgnhfkk9vEPjLFC+mpKD9wShK30BeMWdUUgMFEDE6Mlt3bnw4gb+uRSoBuPKE7knB0Jagi43vs+1+jZ15c3sxvhzJqvp+ThI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842941; c=relaxed/simple;
	bh=vCp//gPYQcR3DNj7zr7SuBIjoFrxsV54Ke1YSaCx7AM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGQqoZZBEVsF6JVJJm4N54F/HrxhqgBkfsP1hYNfi34U1eLvhX9N/AdPhxK/PZKwI4V7G04wI+2PexoKlapkp9yyPLk1PMojxC881VI4u4d77Q/TV05IhI46F5doNEhd3Stz+xo2NbYQsKFBeKKTdD07Fmy6pi1RKuC20wmUB0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SM3O5nFR; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0c4945c76so59105466b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842937; x=1751447737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+LGnTNcVQ28XMxEvYu54IUxPobup7v+2rWujowv9BA=;
        b=SM3O5nFRQHEsv8VN0Cmmh9NTOVterKyDltoX7QgHtBeQ00m5a5L1+BgTIr6r0huxp6
         Xr6VS73kc9bTFrNyX9cHB08T/7aTRxdvnIce6wl5K0bnK1XYOdTgoGDnsrUcGQqWIwMZ
         MysajJGPnFaH/GMbw3lOIhZGCFzOXgiPS4IST+n7qJACcsy3cDVN3UTw+Uimad8Ouqus
         +reNjDhOqyqrvEY4BYi7bkIPYpM6sw3/89+O9C4O0xJUoyJtDd+asMtJDiapz/yciLPU
         Svc9tWHO3FlhHL4wfqJ/DBd18kS2D5pg6d+gGmOEi59CQ72BL3bX2adln7dbfML+S913
         tw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842937; x=1751447737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+LGnTNcVQ28XMxEvYu54IUxPobup7v+2rWujowv9BA=;
        b=YflGLkk6E8DbxYJHa+G8jsvcRdmtbwI1TXRPs5aR7xQYSsEr7SBROPmkm+A3pRQEVw
         1XCgED7RrRPk2XMdedQBnMLzcpiSWOGG2YU/7g9i1AAoKC0aSnXQAgPzCCA/SDichwkV
         BnZjMncSym+idHBtyt3xDAcuXjsYLBM0PznX2ohHoftddYR33YkCis6z9PgklrHhn5Rd
         nzZuj8OnGUnisFVmC5RPoBKTsNRhPFadcbDdz8/K27JzT3AEoGQ1kObHnNQD2nbCXXLe
         HrnGrrXOxno+4NIbeqCqgr0N0VE1+9CJUJJuFgdCkqeWbfN4WJPC3lsU+tmLN9+HyOcd
         HgHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcpUdOZB1DGirpyDOay5R6El79vu0BgliQAf35WWiOLedgiD7WttjrmahGLOxPxu3OJQkqbH5aX989Nlq4@vger.kernel.org
X-Gm-Message-State: AOJu0YxgrQLJUtJ+aK9f4vOY84p4zslpu0TTKPw3YrHF8DIkQMVwjTVI
	MQ5JGx/qjOwCleNG5vtc6HVqH/wOo7ZteUBnEruyNhRQ1+LLK0GtzHEXPMZnqaCCbqA=
X-Gm-Gg: ASbGncvvPHHRJ6ralQ1btjpxBOW4khluDWqHgYR4XdAyvbkmQadjlEHcYMoM7FYeOHk
	/booKsSEmoHXGtErpvBHOCR/kM8JRWU7NGTNxXKMPtfUD4Ct55VDnmP93nLeEE6w2+Q76NITVJH
	TPwIJcaFoUGKUl3AMxBcN5vpNzu5OvFR9RvfjjHEu5PZAvrCXgQp05XN/uzITwus6WyFGkwknQa
	aSfgzKnTRWVxffhI2ynFhJjpnn7yi1oVffRWSRdDuNlCxNJ4FATzOKgxUz7pI2lkHL4M+t0geob
	EQtcTdIthXHZwyqWy1ujDczfebGktvy5V61cpNzZAsG18LAmzv7j4ZA16IgYy7ysn5TcsvAx9XF
	m3ZTYN+8xhxjNNSPX3R98vcb7Ci16duwJ
X-Google-Smtp-Source: AGHT+IGSQHONXHhGs7cWOB0/NTlFhiN2ogHvgUjj0VhDky9sGi/Ee+gtbAm+6l/Fi03lgPKfdTnIGA==
X-Received: by 2002:a17:907:3e0e:b0:ae0:c7b4:b797 with SMTP id a640c23a62f3a-ae0c7b4b8e3mr100993766b.45.1750842936691;
        Wed, 25 Jun 2025 02:15:36 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542035ddsm1029713266b.147.2025.06.25.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:15:26 +0200
Subject: [PATCH 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
In-Reply-To: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842933; l=2007;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=vCp//gPYQcR3DNj7zr7SuBIjoFrxsV54Ke1YSaCx7AM=;
 b=f5gSZiEPc0KYORoD9MIxojR436BImQVvwqEP0M+uXcgT4W6dNEvF51An0CzYkuee1ijtEq4Co
 CF7+pN7zZ/aA3gtmkblm7pFHD1iPm+Aw0sp4Z5flwM76VydGzDVk5Ke
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
WPSS.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b306f223127c452f8f2d85aa0fc98db2d684feae..6aae61dea8d0dbb9cf3ce84b9dbebb77b5aa1d52 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1261,6 +1261,26 @@ static const struct adsp_data sdx55_mpss_resource = {
 	.ssctl_id = 0x22,
 };
 
+static const struct adsp_data sm7635_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mdt",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
 static const struct adsp_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1478,6 +1498,10 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
+	{ .compatible = "qcom,sm7635-adsp-pas", .data = &sm8550_adsp_resource},
+	{ .compatible = "qcom,sm7635-cdsp-pas", .data = &sm7635_cdsp_resource},
+	{ .compatible = "qcom,sm7635-mpss-pas", .data = &sm8450_mpss_resource},
+	{ .compatible = "qcom,sm7635-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},

-- 
2.50.0


