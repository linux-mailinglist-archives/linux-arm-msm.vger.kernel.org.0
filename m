Return-Path: <linux-arm-msm+bounces-85124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7F0CBA071
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 00:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 589E93069CB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 23:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1AF30CD91;
	Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyUVN5pp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3F930170B;
	Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765580902; cv=none; b=jcjklVS5J4p1du+Gd4qeisT4cVAsgvKyFSovhMaiqWq5IhGNebHGLEDCw0woTepleMtt2n/dWfyUmd+lJymnQjkrZAsVHu/+98g5LnGnzNAmWnRWGRrS8m4pVeoz+Ie3R8C5flA0aTsZ8Q3j+TVNlpWjZdkXQHH0LSNfBNJZDR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765580902; c=relaxed/simple;
	bh=oo7GvUxe2lBq6REq4/TLwjJ3sGMJYzNJk0cYx9cbmgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQ6mzNweqSWsw1XszimGpErRAIPoCZkvBNEop2mneYd79v9cffen7oWRyRbzEnbsFWMvwNXvrY7k70TI3zO44t0AsH1L7BcsGVUDRixmPkoCeG1qudAQR6fU3fTyw4Gsj7PBFC9s/TIJ9TUC9RFqfnrsstDiNwT7N19N50vXKFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyUVN5pp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B067C113D0;
	Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765580902;
	bh=oo7GvUxe2lBq6REq4/TLwjJ3sGMJYzNJk0cYx9cbmgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hyUVN5ppha9Y0i57OFEdIurTfLj7qRam7lwBp3CXxIooZTnJJq65X+CkhIVSiELTr
	 6XXLtznrktwKQazONUhgvG2V5V4j34N4PThAhzCwWIJA+DpR9xJjynSwYnIfelOoIm
	 jogc/3ZcM68FSXSuMKKeRZTT5+e8og/Kn6xk9roKBkXcI08Yp8ulUMF85RL9yuszqi
	 w1fsYlYISorzsntZ8nZw3Pt6js5KOzA4KkW0nJG6IAqvgZkZy0hxl2Ke7y+2k/IxWi
	 10yNzLewR36GSJouatecjFX9k1jz6uWe7vCNu2LftNFPRVmsHAYaI8EbmFoV2D1v/b
	 rjmRpczX7lRTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB06D59F59;
	Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 13 Dec 2025 00:08:16 +0100
Subject: [PATCH 1/2] drm/msm/dpu: Add NULL pointer check in
 dpu_crtc_duplicate_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251213-stability-discussion-v1-1-b25df8453526@ixit.cz>
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
In-Reply-To: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=awDmg5Kg+/H+XtPy9XCo+xTI0vQQ43OvbZYHDH2Enjg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPKBkQII8PO5Rx7SPn6kSRID2R3/4fFdTDpgTQ
 6NT9bZjZRmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTygZAAKCRBgAj/E00kg
 cre1D/4qT03GfZl67wFuGoKIC52PWR93WXzhpcyxxqXURURCzRjux81RsAZNGYBQ6KcvootGuoZ
 u+XINmGXam4V36KXA4L+eNWKSAgt3bjmOl/bYRUM4fiontyWVNW9iFRFX+jMMoLxoLgKczELK2a
 vwyrj6sox1kACoZTj3uOdioc+CXpB3WkwoaFigEF/DaADT0UGInAtoYN46i6nsKoILmWmFKIJbe
 Zsrfah+aIkb9eWQDv/qQnhFqM4NYEYxeQ1hZgeMe8VbOsWzTxKS7y1lLkWonsOw01b9Eq9KA4UA
 LKPuSyhG9ignyTxyu/Qfxf2le3dYLmPIl3cldheMs6PpUejbzju4FguLVx/k36VdjM1wps6NBnr
 abs8r5Zv45L2/t8kd9kQhUW1qlntqAa3V9vsjTtoRp5ukF/eo6MMMiKBikroszOX2wEWijDPnEk
 tREiIrVdloT37C+fJz2mrIh+rdK8fmQ13oIzgDIOPnhnyssd8fJcv8WufOcMC+Q47vpBz2FNTHQ
 B0HQczn3OJS8GBDYYVG4a+LrQ7esvBawK50zaVNVvCJ7dLKOtX79IJo4WP6MAT4dU+WqFt1zDwR
 rOuuV0KPCKa7dS19Cyz89fYSv0Fo0RQdFe7h6lEMweBcwr6T6XPlODYtuWS0CgBAM+DhnOFvz0U
 w9JMVAO15wIgjtQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Petr Hodina <petr.hodina@protonmail.com>

dpu_crtc_duplicate_state() assumes that crtc->state is always valid,
but under certain error or teardown paths it may be NULL, leading to
a NULL-pointer dereference when calling to_dpu_crtc_state().

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c39f1908ea654..d03666e14d7de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1114,7 +1114,12 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
  */
 static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
 {
-	struct dpu_crtc_state *cstate, *old_cstate = to_dpu_crtc_state(crtc->state);
+	struct dpu_crtc_state *cstate, *old_cstate;
+
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
+	old_cstate = to_dpu_crtc_state(crtc->state);
 
 	cstate = kmemdup(old_cstate, sizeof(*old_cstate), GFP_KERNEL);
 	if (!cstate) {

-- 
2.51.0



