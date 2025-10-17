Return-Path: <linux-arm-msm+bounces-77712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C33BE736A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 554FD1A61F24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BEA29D269;
	Fri, 17 Oct 2025 08:40:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B861021B185;
	Fri, 17 Oct 2025 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760690416; cv=none; b=R62wCbWkOliWKVDvBySslLwzwdDAy9MgAxkQgBQx5vT+2IUkjkuVcvZ+4Qx0hYZ1IfiKILJdcaoHbqClAbRW6kXqSQXfWPd93uleCOEh4HWs+g6hlexKb0F9PujZDtfBKsI7fX5E0Owi9WXDA0spEfZlhlGx/Eevh31q6V4hsR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760690416; c=relaxed/simple;
	bh=dsZvQxJtweRSbWprsBUkU2SOnynoqRWoBCApBCXh3Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=baqDEEOF/fKZFnRY5uzmi/kCrhudUfpW63761ASUlsnjKERvjza0snx6yjNvO1WKy/DTZHMoWV+gzWre3gwCVUDpCJ1dr6c7NUJMtJAYpBM0BDBC52j85luyN/uys9nfCFsvRn+RV647vKk01GSMZzELCHnX7qAE+yeSjo8kX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz3t1760690358tf89476e9
X-QQ-Originating-IP: /A5aLrgRw/j8SKmd3JVMi6f9jX/yuWXc2XR2LUdo+jU=
Received: from bigfoot-server-arm-node1.classf ( [183.250.239.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Oct 2025 16:39:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10021269870126242908
EX-QQ-RecipientCnt: 12
From: Junhao Xie <bigfoot@radxa.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Junhao Xie <bigfoot@radxa.com>,
	stable@kernel.org,
	Xilin Wu <sophon@radxa.com>
Subject: [PATCH] misc: fastrpc: Fix dma_buf object leak in fastrpc_map_lookup
Date: Fri, 17 Oct 2025 16:39:06 +0800
Message-ID: <48B368FB4C7007A7+20251017083906.3259343-1-bigfoot@radxa.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz7a-0
X-QQ-XMAILINFO: OYM3GZRvbPalLiATFyBjHVySEMnZJbrPaHEmf0UANKERrzk59tlfdMzE
	1xVTYc05P4fnjfJf28d2OOdTKxK30dnaWuuB7Nu5kL3M5l6e546UvECTxFlLljqwE9s0PeL
	uS5gOemc3MZYV16PsD7c0yH0Y7QzDc+mlpQ7W6aX6KiNoCL97HEYM+hu3uUNqq5Hte7fWn/
	7ol9cdSXCzLv+ERwWrjbaMQ6RJAd487S9M8l/0+JV3qcOqW2ActcHnDhCmQ/LR2C9dQzpYD
	SnmIol/jN5MVdChcxjZLRZ1mOLKzPao/Hy+5/yq1wy1A1N0lOYCThR+jm4h89/bmPK/Qq6l
	dJNE/7nj6ekgz3cANWfPr5c+Vn7EgpP0P2At+PoKELaFqIkceDT0j7M3yjk66U+gCRpy8FK
	E0bipQx8dowM0eSgzFUzXfqcYkjVf2RZ+VKplS6Z7FxvH+QSiV3SQxaX03z5Mly27nm5QV3
	hxYAIUKXHh7UC0top63w1ACj4lH8Llkpp7TA6eaiUZ6Zb+WPfYbzUojPIJZRPba++Yopghx
	QvfAVnrTEEs306aSLr8xSpxIkZ9Blevq5I9x4FsSZ6nhvZO66iPn6JchUloSj7n2hJpztW2
	EhIFRoVv1+6dM9xJdOrGZiCNYleuB/hI/T9U9w6DUazM3eXeA8k1vyGE2+If524evhKdCdW
	vFAVprC0v/NmMyKDCZbQr3HXQuqj+L2VISrWecmWAPxzxJaXSqP5vVmGs8Rbo9yjOf6Oe1n
	TDPMJvW5gFbsueQYlfIPZeft+3HFd7QD4uxmO+jYniGTYrh38B7GXqDMT06vpEroKhre2us
	bofaZWb4Is5ySxdEZhTyC2+isAuz7OZPUQagdkxSWaKcxH6xPrOzsDop0gRAs+VEnqSdFms
	bjVAjF2sYg//ngFTNpMBfpkSf8gZZgxBYRYhxT+h3e6IaOijTTw8HZCfuPVWo7c6b1plh6a
	VWpgg23v/RHreGIgctvr1Xg0SDgsTxM3xhvW+CNasByBbcbiL8sPLRzWznzG2wVn3BF/AJp
	cgRnwohQ==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

In fastrpc_map_lookup, dma_buf_get is called to obtain a reference to
the dma_buf for comparison purposes. However, this reference is never
released when the function returns, leading to a dma_buf memory leak.

Fix this by adding dma_buf_put before returning from the function,
ensuring that the temporarily acquired reference is properly released
regardless of whether a matching map is found.

Fixes: 9031626ade38 ("misc: fastrpc: Fix fastrpc_map_lookup operation")
Cc: stable@kernel.org
Signed-off-by: Junhao Xie <bigfoot@radxa.com>
Tested-by: Xilin Wu <sophon@radxa.com>
---
 drivers/misc/fastrpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 621bce7e101c1..ee652ef01534a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -381,6 +381,8 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 	}
 	spin_unlock(&fl->lock);
 
+	dma_buf_put(buf);
+
 	return ret;
 }
 
-- 
2.50.1


