Return-Path: <linux-arm-msm+bounces-67593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8696FB19775
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 02:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A6C13B81EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 00:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31797170826;
	Mon,  4 Aug 2025 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSGHJJ0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F6429A2;
	Mon,  4 Aug 2025 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267244; cv=none; b=NI9umBUpSmJ8IxvP8SFwMx7CKtDDG8AoyXdH1PN0bHyZ8hosP9l0WifmkucloU3xiR1gxEig5QLPQJoGrY7jI2S79b6qsD0xAokp9Rm1VO9G8r1qKESy778/ZmQ2AdXyitkYSMmgjthaoV9w9SreSinmckNCJ4DYgPMs119tddQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267244; c=relaxed/simple;
	bh=xx+cMnBca5FdB4NqdtJoNYBKpU8YHM9fYDGzhuRR+d8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CFVoj9p3rEqi6H0HecIsT7CKInwZ8A8P/HTKhC2Nel9Vv8E2k0eZX1zkeoTRLft2T7qVNWGI8Y1zraVsnstaGGqaYvSgLpAK8A4vIaRj1wmGXqxCg3CqoTLO2og6sdWI424F6GEv9Gjn3gMrArng+91JuLqZLzxScCROIzyvh1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSGHJJ0+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BB9C4CEEB;
	Mon,  4 Aug 2025 00:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267243;
	bh=xx+cMnBca5FdB4NqdtJoNYBKpU8YHM9fYDGzhuRR+d8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SSGHJJ0+kKA/MoQ6FUHf5U957BvCVynHBzPZxmkvAEib3Ssl215kO7HJx/x3G6bKi
	 Ks4chw6m1oyhn95kaKfxBU29OsLfk6OK+/rgTdQs8sMSZHtdhszzwzyhuvMvLzBAv3
	 8VwmKMbzRWiE6JCGFrnNfVOHS2vAsDsl4DBlZAyIDWLiTezkNsbaVVTgRCsbL1oGn2
	 ywTIpN8DEglDCHGfdE3or7WHtbMsdi/x/kH6uESp+5RlIGKGIerho8qO9HMF4ssk1r
	 eAGkqVKwdh54kgQjnINgwGh+WDDyuclQlQ7YBQta+pjO9NCX+kQtFn61V8XiWIvPUa
	 Y9jmslW293nAg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16 77/85] soc: qcom: mdt_loader: Actually use the e_phoff
Date: Sun,  3 Aug 2025 20:23:26 -0400
Message-Id: <20250804002335.3613254-77-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804002335.3613254-1-sashal@kernel.org>
References: <20250804002335.3613254-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

[ Upstream commit 47e339cac89143709e84a3b71ba8bd9b2fdd2368 ]

Rather than relying/assuming that the tools generating the firmware
places the program headers immediately following the ELF header, use
e_phoff as intended to find the program headers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20250610-mdt-loader-validation-and-fixes-v2-3-f7073e9ab899@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit and code changes, I can now provide
my assessment:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Bug Fix**: The commit fixes a genuine bug where the code was
   incorrectly assuming that program headers immediately follow the ELF
   header instead of using the `e_phoff` (ELF header's program header
   offset) field. This is a clear violation of the ELF specification.

2. **Security Implications**: The bug could lead to incorrect parsing of
   firmware files, potentially causing:
   - Out-of-bounds memory access if `e_phoff` points to a location
     beyond `sizeof(ehdr)`
   - Loading incorrect data as program headers
   - Firmware loading failures or crashes in Qualcomm devices

3. **Minimal Risk**: The fix is simple and contained - it changes 4
   lines in the same pattern:
  ```c
   - phdrs = (struct elf32_phdr *)(ehdr + 1);
   + phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
   ```

4. **Affects Multiple Functions**: The bug affects critical firmware
   loading functions:
   - `qcom_mdt_get_size()` - calculates memory requirements
   - `qcom_mdt_read_metadata()` - reads firmware metadata for
     authentication
   - `qcom_mdt_pas_init()` - initializes firmware loading
   - `qcom_mdt_bins_are_split()` - determines firmware structure
   - `__qcom_mdt_load()` - performs actual firmware loading

5. **Real-World Impact**: This affects Qualcomm device firmware loading,
   which is used in many Android devices and embedded systems. Incorrect
   firmware loading could lead to device failures.

6. **Clear Fix**: The commit message clearly explains the issue and the
   fix follows ELF specification standards by properly using `e_phoff`
   instead of making assumptions about file layout.

7. **Stable Tree Criteria Met**:
   - Fixes a real bug that affects users
   - Small, self-contained change
   - No architectural changes
   - Low risk of regression
   - Important for device stability

The fix ensures proper ELF parsing according to specification and
prevents potential security issues from incorrect memory access during
firmware loading on Qualcomm platforms.

 drivers/soc/qcom/mdt_loader.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index b2c0fb55d4ae..44589d10b15b 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -83,7 +83,7 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	int i;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -135,7 +135,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 	void *data;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	if (ehdr->e_phnum < 2)
 		return ERR_PTR(-EINVAL);
@@ -215,7 +215,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 	int i;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -270,7 +270,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 	int i;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		/*
@@ -312,7 +312,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 	is_split = qcom_mdt_bins_are_split(fw, fw_name);
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
-- 
2.39.5


