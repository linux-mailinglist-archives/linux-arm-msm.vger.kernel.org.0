Return-Path: <linux-arm-msm+bounces-76876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 671DEBD0DC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 01:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA16C3B660C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 23:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AB0296BA8;
	Sun, 12 Oct 2025 23:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="T7waS6er"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860D2264D9
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 23:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760313299; cv=none; b=SkRVFtam5ZvWluADZt8deO5H8/Ciu8Ir8m/yp9UyzLJKYcTq/IWRr6V20F6huk1JYkCZzxJ91sQpNBIUBxiizNeFUc+6+MfJ5OOMRUzpuTNBaem5eGd0UP6pCxQAL63nx0osS6gTYaHmHGpG+6WU81p/pKgTcfz/pH7WAihmhuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760313299; c=relaxed/simple;
	bh=iTyFt5ez1lBly+//wwjoO3grAFk0FSahGRzQMVVcmnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SC+D/4KW7NoBKAvhi3OLl1Fkw+Zqytda8oF6NgoOWGjs/IviI0uD0J6BhBxYP/VlEmlkeCQ5DBinKMxVLgf+HBKU5KmTLFZzekryHG5EuPjtBKQqR6V9vNZvMS0f3l07kjPIEn97bdFbP6rU0dmoG6UQr+ipr7ZR0UnbBcj18fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=T7waS6er; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1760313284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8CxAXJfbAsaYoAMPHJQ53bKHUsu2eren/sXR8daUSJM=;
	b=T7waS6erCcjJDvfRPTw6OjDLCboUisABvyYtd7kQzntiXik1ZN4FmwYgHNFszvMlF7sd+U
	rlgtpsCViyX2wLM/LKf7H9G9gqHt/3GvOU8L3JyWD67+XmriamrvkMk0+ASYDkH5LomUmd
	34H7FP4PaKxyBnmadq0Kqmkw3sdMxqHFAiqLcK1kxipyL5FU16VvUJ8Jtz9q1rFLb1hxnG
	9eD7ZL7FFggMLljWzjSwj7Wnc5qpMcyIAUqusQxQaxwO2exOB3Qa9Mn7Ozx/iTqHNeSE93
	2jDTerGDrcR+9HQRC+zzhGVMZPNdlx0oPpu0Bmiio90jTdLb3UastuTMS8P3WQ==
From: Val Packett <val@packett.cool>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Vedang Nagar <quic_vnagar@quicinc.com>
Cc: Val Packett <val@packett.cool>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: iris: set default size when S_FMT is called with zero size
Date: Sun, 12 Oct 2025 20:50:41 -0300
Message-ID: <20251012235330.20897-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

According to 4.5.1.5 of the M2M stateful decoder UAPI documentation,
providing the width and the height is "required only if it cannot be
parsed from the stream", otherwise zero can be passed.

The iris driver would only set the state fields to DEFAULT_WIDTH/HEIGHT
once upon init, but they would get overwritten with zeroes from one S_FMT
call and the next S_FMT call would already see zeroes in place of the
defaults. For clients that used that sequence and did not pass a size,
such as rpi-ffmpeg, this would then result in REQBUFS failing due to
the zero size remembered in the state.

Fix by explicitly falling back to the defaults in S_FMT.

Fixes: b530b95de22c ("media: iris: implement s_fmt, g_fmt and try_fmt ioctls")
Link: https://github.com/jc-kynesim/rpi-ffmpeg/issues/103
Signed-off-by: Val Packett <val@packett.cool>
---
Somehow Venus didn't have this issue and didn't explicitly handle this..

I'm not familiar with this code so if there's a better way to comply
with the UAPI requirements by just not even getting to overwrite the
state with the provided 0 size, I could not figure it out.

Still, let's get this fixed one way or another.

Thanks,
~val
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ae13c3e1b426..6be09d82e24d 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -196,6 +196,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	if (vb2_is_busy(q))
 		return -EBUSY;
 
+	if (f->fmt.pix_mp.width == 0 && f->fmt.pix_mp.height == 0) {
+		f->fmt.pix_mp.width = DEFAULT_WIDTH;
+		f->fmt.pix_mp.height = DEFAULT_HEIGHT;
+	}
+
 	iris_vdec_try_fmt(inst, f);
 
 	switch (f->type) {
-- 
2.51.0


