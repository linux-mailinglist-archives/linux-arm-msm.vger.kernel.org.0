Return-Path: <linux-arm-msm+bounces-35221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F36C89A6717
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 13:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5827281B81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 11:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B871E573E;
	Mon, 21 Oct 2024 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doJLA7GZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A54B1E1A3B;
	Mon, 21 Oct 2024 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729511702; cv=none; b=sbhs3rcZqZrvKtOzZm2eGV6jGcDOZxpd6NP6bM+2ffBI6zKpUEhs+Dr8YTRcJh/dF8PpEdiGkMdhJQIbmZEvC9+BUII7JCW8Z4G3yfQpSelaL3VDzgXpwEGkYa7u6usR6nBA4RcCkqx2NgEfGRYx4ArrokgauSM6z1lSIyMyC1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729511702; c=relaxed/simple;
	bh=06LlHFojHrVTo+PSFbs24Q0soi3A8O9lOE7FpxnTxFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GCLlmnXXqBTOHCeWm5XbB+clu0bLVlZqcVzH+NMZ+M8WyEmJNhVZ9AX58IYxWQgeKq/4Lu/UjqxCgUOfOUMJ8hOyIcQXfJEALtQbqh1pgqbvLyYnVFCRUdItZwy7BhknK0LbQfWAXVhOImG249hDJv7NkOHkfDzcPDVJEy7pzO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doJLA7GZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5F8C4CEC3;
	Mon, 21 Oct 2024 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729511701;
	bh=06LlHFojHrVTo+PSFbs24Q0soi3A8O9lOE7FpxnTxFM=;
	h=From:Date:Subject:To:Cc:From;
	b=doJLA7GZIHonBurIFWEkwbR5fBUk9TZvshq7sPUeMzVqoc1fJPk6c96EwzS7YPu+f
	 CSuPPl8NVDn/cPhsMJPvEp7Auy68EqeSatHYSNQW/MEbxh9IGIAjwya5/vhwcZELE/
	 I0ZMqf1KWxqow21UsbbUioqjG8xX6yyX/2Etnh9/wHKZ1vg+aHXJYNHFS8+jUuRMIy
	 I1yQeJNFGLHA5ezzET9MEfTw4Em/drJhKY+OMmlUcQFRJq/+Q7rc3pAaBy92NuYMwj
	 wV0oJhyeqe4kRcmS7YiWQUjTFaNWpUFqaKR3kNFbL9dFnLts8Npt8TI7t6/YAcGFqi
	 vYz5Qb/oa/9iQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 21 Oct 2024 13:54:56 +0200
Subject: [PATCH] soc: qcom: smem: Fix up kerneldoc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-topic-smem_kerneldoc-v1-1-4825904a7e25@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA9BFmcC/x3M0QpAMBSA4VfRubbaTjK8iiTmjBM2bZKSd7dcf
 hf//0CkwBShyR4IdHFk7xJUnoFZBjeT4CkZUGKhJCpx+oONiDvt/UrB0TZ5I4qh0qNGLK2uIaV
 HIMv3v2279/0A1ecdLmYAAAA=
X-Change-ID: 20241021-topic-smem_kerneldoc-4a87b7226f79
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729511699; l=2037;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=cG0vZ4jI/onDMnu+l7tO5fvwatOEKwwfWQ9VJw+BN9U=;
 b=YrQ1XQuR6Nt29ZUzpRSJ4/p31T0N4+PBGkNJCsslmWGfltFFi2VAqDg8PSI4RMyjqI2s5RE0k
 jOclcx5NPdUBMZUV3rYNF98AjSOt+PX8rFvtbGIzPe5S6AFW5+drNFm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix warnings like:

smem.c:504: warning: No description found for return value of 'qcom_smem_alloc'

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index e4411771f482f8126a24a8775ccd34b4d8f92d32..0d1ccf3ef1086ce20c497cbe78015d1a8a69038c 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -499,6 +499,8 @@ static int qcom_smem_alloc_global(struct qcom_smem *smem,
  *
  * Allocate space for a given smem item of size @size, given that the item is
  * not yet allocated.
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
 {
@@ -677,6 +679,8 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
  *
  * Looks up smem item and returns pointer to it. Size of smem
  * item is returned in @size.
+ *
+ * Return: a pointer to an SMEM item on success, ERR_PTR() on failure.
  */
 void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
 {
@@ -709,6 +713,8 @@ EXPORT_SYMBOL_GPL(qcom_smem_get);
  *
  * To be used by smem clients as a quick way to determine if any new
  * allocations has been made.
+ *
+ * Return: number of available bytes on success, negative errno on failure.
  */
 int qcom_smem_get_free_space(unsigned host)
 {
@@ -758,7 +764,7 @@ static bool addr_in_range(void __iomem *base, size_t size, void *addr)
  * with an smem item pointer (previously returned by qcom_smem_get()
  * @p:	the virtual address to convert
  *
- * Returns 0 if the pointer provided is not within any smem region.
+ * Return: physical address of the SMEM item (if found), 0 otherwise
  */
 phys_addr_t qcom_smem_virt_to_phys(void *p)
 {

---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241021-topic-smem_kerneldoc-4a87b7226f79

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


