Return-Path: <linux-arm-msm+bounces-103475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDGNDV3d4WmtzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:12:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE347417C2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5DF4308A96D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F127334214F;
	Fri, 17 Apr 2026 07:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="T353sbhp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1868F238D54
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409675; cv=none; b=AcDBBAYXIMJRVte3lGWAMqhyI/pVLqGbVna7e+Wnc/E/wutZx1NMW9tpp3t4LuMbRi4HxQgjHIN0TOcR3FU5cm1oKJQo2pGMzQtGgfDNWKmyDhyCuLV4bnrZt5tP9d3hFpXQREa2I/2XPpi7Z944aLVHAdbErlapi+15PerLALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409675; c=relaxed/simple;
	bh=CxKlaHXcmKClm+BXYNnlDwRO4wTrssG9zSsFyKBZQhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNKSLXdDOSFUhEFqmUkMXZWVuX/UVdBcla3DzpJLytHIyYY0ma3GU7ArNvexEZ4RRz9VcbHYcyIO4TOlk07w8M/+sHnsFUy8mtvL68rhQJ8BYfbf3PW9QWM+XECLPMV5YtPjoVhKK+yPEX9iNhmgCHVeDxMDZLPRDJFPNQseA9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=T353sbhp; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9d6c8871c7so74129166b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 00:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776409672; x=1777014472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=px6notIASYyhd4u2NhurwBZM5A/O4xi/Kse0UeP1iUQ=;
        b=T353sbhpS+lNjOkgF7NyeFa3EHFZiQPiyMP8n+iJAV/kFjVKOTGJ9fKDTW/wO52mDA
         p+HrfP0SfdMHRY9kgjiyQMIsDwThz9Sbrpm+Z8OibvCCbsqIlr/pI9IGtXczfFP+evKl
         +3DUSOCO7svG3/BNP2plZCa/7St3U3Dpu6LmPr1FaboNN0gO8OGkpbLU450URpiVMnhW
         oZrwt2NkIGlnznbqpMzgGu0EXVu32TYad0pHjd7gW22aDtYTUBFyAVFr4caIOPhqPdyQ
         lMMXs37Di5HTzW/lnxFdn5XNxwb9MR2F59l9R1tYXZOFPpyTWwcliqX4s1+BxsK0BU3q
         68IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409672; x=1777014472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=px6notIASYyhd4u2NhurwBZM5A/O4xi/Kse0UeP1iUQ=;
        b=sIdPO2078yoibHnPBIIQVvxkvgX9YiPWjjVWh5jJlcpSHl8VL9MsokmGYKf7LC8EZJ
         +/cFzlNFQkim7JN5Cn8XqYOxgOVoLZoEmYgQ9EBEodB7ghrhXhYLxh8k1uwUqeM7Vjiy
         09YTLrJfJdDTR1h2c0WPwW7//umuMQWnF3/VhfDo3L0cfeAWUWVtfZSWwYA/aksaOD3C
         7s3TJ9yHNiqz6eD77cTE0VXXVJIwIFKBMIh5FIdEv4wD6U9ywRPcB8G5ivat4fJ5cBom
         4LAbX/B5Yak9FaF4v0JIuFiOSx+OwJQKsmDtV+Wv6YVbFdT828MoZrF1I9dX/FRTN/4E
         kc+g==
X-Forwarded-Encrypted: i=1; AFNElJ+Z2Xi0W00gGZcWXKT4ulB2rV5Zk4DL3cDfG8kbQKy8UInu00RzocyMT8qF2fdBF1bTVUHxCn6iRMD82MQV@vger.kernel.org
X-Gm-Message-State: AOJu0YwwNTxms2hUaGIaXzxT60hOmqNtUvQrZYVSuhRFwRsblnZ1eFbs
	Xg+YMspaUCf+OpzE03QKvPGPSCqXAjYglO7awLk7ZsFFU1No7EU3Tw8UlsL0eEjW3ew=
X-Gm-Gg: AeBDiet9cqom/Mu85rZO1cnbqzOECQxQRVJASL20EflNcb3P8UB/vEafjcsnlxulkr8
	O4C2pJdax6m6CKGfa9klW8enVWZFs3kHpbSJJxa6dCHnJLhU3nRqcnKfi4DLKAK9RyoyC7kwRFK
	buzhxG8Hmpy7SqwZrWOW38WZ2kxqvXit5+eBYTY08sIAKMJsUfb+OC0np5olvICr4XQkHMLxTkF
	g35SUUY/YAnr33oahw0HX10ImV5un6LKmafZ+eHiWgsl4nPotWJfQ2wEWJvVglDm0aQ/a9j8ZFX
	RFjK0bU02rS/17ATocBtN1yFon2mALxqNdANfKeXsVsBOgq+ET5qjlsuzKYd+RDwdkOBZJ88gdH
	0lv22tH7TDb7W0y3ASY/WCMKV0gld/t2z9Ueo1qyGC4C5CrOboRFCxLd9a6IYAMGPlBfRoFxq6C
	qpjmcoWWA5NbGJWaYhAVfCkqGdRsqZu7qJdBYPtB5uz3A+b52UWCLiDaxXYRgoBX7GnAdv/WB1t
	cfftytsfs3LDaSB
X-Received: by 2002:a17:907:849:b0:b9c:69df:4d7b with SMTP id a640c23a62f3a-ba41aeefa42mr87927366b.39.1776409672385;
        Fri, 17 Apr 2026 00:07:52 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm26448466b.26.2026.04.17.00.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:07:51 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Apr 2026 09:07:45 +0200
Subject: [PATCH v3 2/3] clk: qcom: Add support for GXCLK for Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-milos-gxclkctl-v3-2-08f5988c43a2@fairphone.com>
References: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
In-Reply-To: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776409667; l=2067;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=CxKlaHXcmKClm+BXYNnlDwRO4wTrssG9zSsFyKBZQhI=;
 b=D1Q+NSNmBB5WEGCN3xpZmWLXLC0ji06xpDbVD0s5K0mlHcPmHDp0OIJIvcmuHELDdefVf2PIA
 BpHzZnehC+uCT/qY2Kt9FKSzS8FAQoPtZmCSxNVaig4NgT41gr0UF+Z
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103475-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AE347417C2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
clocks for the GPU subsystem on GX power domain. The GX clock controller
driver manages only the GX GDSC and the rest of the resources of the
controller are managed by the firmware.

We can use the existing kaanapali driver for Milos as well since the
GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
configuration.

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Makefile             | 2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 89d07c35e4d9..462c7615a6d7 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -189,7 +189,7 @@ obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
 obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
 obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
-obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
+obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 40d856378a74..7b0af0ba1e68 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -53,6 +53,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
 static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
 	{ .compatible = "qcom,glymur-gxclkctl" },
 	{ .compatible = "qcom,kaanapali-gxclkctl" },
+	{ .compatible = "qcom,milos-gxclkctl" },
 	{ .compatible = "qcom,sm8750-gxclkctl" },
 	{ }
 };

-- 
2.53.0


