Return-Path: <linux-arm-msm+bounces-67610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A700B1989A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 02:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F761896DDB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 00:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B052C19DFA2;
	Mon,  4 Aug 2025 00:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtzbxXm/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D11C549F;
	Mon,  4 Aug 2025 00:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267782; cv=none; b=UHgwb7qfzm1B9g/eVs4ySMyaeyAH1ZhYNQmMYNjl1ESA43iFD1+loiheAjn8MVoj8pJJlkVr0y4ffOt6Z/dQPgHoWweDrCHJf9qfAwuHlw0XJrAjSHWU4BH9Ok+UmFMrH+j/IUm0x14zbKgGwheG7SBFZ8f41tbRLfOBRJwmIb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267782; c=relaxed/simple;
	bh=Zas/NyuePvllg1eeqD5yjCVZRCcq38ogvj9AgKK9HhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nnXbVNVXDHn0GwJB0+ZLAHRgU2pCXc25IJUY6DE5dqBlFKRnOrtql9kDTpIEFoEpEKqzMK5XYh6CvSd2SU4JWPm9gyirT033coGAKYHl5ztp7UsvroCmkU8Wmb1bUbDtHBYhB0ABYuaq35sxfmk2rG5QuK1+2gMLzPqompBJ5NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtzbxXm/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDAAC4CEEB;
	Mon,  4 Aug 2025 00:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267782;
	bh=Zas/NyuePvllg1eeqD5yjCVZRCcq38ogvj9AgKK9HhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtzbxXm/Y9TIbkwxmRr/Od2eyobDcIrDNv3XlvwUt+vUX5iME5qRCumZ78ld02SfH
	 DSXWlKjeB3/QSqp+YnZfqmUYgD7KVPUq8XBsLBSHKbaO6GaopjDImZYxUgIJDnBioF
	 6btJWn9RmsOIFyq0gYy+HsycPcoctfUrDI1cY+Yp/brGGVR+Vw5vza2yy7cbjze4iH
	 n6vj3+CoyBLNT6WrBnxakvD5nT3+TrSJ5rfESmlz5XwursjIcmQpCZP7SK0fKFLFKd
	 xlL70cFrp2EHO1zHH5y1GIN+X+zd+eB+mGaCmkw93Smm2nktHHhDQRn/EGnJBSBl9H
	 C/vOxJuQ10f1g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 51/59] soc: qcom: mdt_loader: Actually use the e_phoff
Date: Sun,  3 Aug 2025 20:34:05 -0400
Message-Id: <20250804003413.3622950-51-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804003413.3622950-1-sashal@kernel.org>
References: <20250804003413.3622950-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.101
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
index 6f177e46fa0f..8de1d478bec2 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -85,7 +85,7 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	int i;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -137,7 +137,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 	void *data;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	if (ehdr->e_phnum < 2)
 		return ERR_PTR(-EINVAL);
@@ -217,7 +217,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 	int i;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -272,7 +272,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 	int i;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		/*
@@ -314,7 +314,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 	is_split = qcom_mdt_bins_are_split(fw, fw_name);
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
-- 
2.39.5


