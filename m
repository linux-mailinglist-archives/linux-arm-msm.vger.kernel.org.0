Return-Path: <linux-arm-msm+bounces-34068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBCE99A095
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 11:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7C582894A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5451C21018A;
	Fri, 11 Oct 2024 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6wc6itB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D3920C496;
	Fri, 11 Oct 2024 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728640652; cv=none; b=f6I1TlCajk0AQ9iGnFk8mAFGo4ELCt2wy6DCvS5sT23CnDZo9YGfZ1YP8j+B6p87xd/ZHp7BJneIz+wPj08ZnkMaWV3w+nCEuWZ4lHzbhbXPqGpkQ/mysPo6LztAoueQ6l0NmFIGo6+1fhEyJZ6cmFqQQYS6+3SNH6jgXDY3QJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728640652; c=relaxed/simple;
	bh=2gk6wi1k4yh4eT4f1QLyt5TAGrsRtDo5kjnzPVa+0i4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLkjwK7rCjEWDgwxuDHq425mfm6GqwWBee9/k+Tpsq1TViiuSu+IfdfpL73vkpKL9BlDP9tbLw5/uCkDDPtv5x2py5D8EeAkOTsHAYqrzvuqm4oFNs/fETTaxFJKhSrjp6x6qZdNSA3xjzQvbseNqimBv2pykFTzAVjDZInho7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6wc6itB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEEA2C4CECC;
	Fri, 11 Oct 2024 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728640651;
	bh=2gk6wi1k4yh4eT4f1QLyt5TAGrsRtDo5kjnzPVa+0i4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A6wc6itBAOVHQ9eF/x8rnO99ux7oFb/Y4u4+GyMoH11r/HEnSR7YWT6ktOh1TlAyh
	 c3Aw9leZhsTPfMYqggqoDzxAQvXkPwQE9tyfaPz1bgbdQC37uoej7U1vmQbrWaDtUC
	 BOo14oZZ5/1XSrqbR4jEBC/CabDXay9B5/j4Mj4BgPxErjYPMNAo7Rz+CRMv1f0w8r
	 8qs5cYPAtlurYUjzO9gv+1n4AaIcAexjsHtYwRlWytP0Pas6jOjVbOFge4YKelANvg
	 +VItf0w5Oqk4dqfG3NiEfS0ulkj3XLUpfhUQ1gyQkhopzKnqKbaMF/nlzq5vWyO+9f
	 rZLZygIBfnj1Q==
From: Simon Horman <horms@kernel.org>
Date: Fri, 11 Oct 2024 10:57:12 +0100
Subject: [PATCH net-next 3/3] accel/qaic: Pass string literal as format
 argument of alloc_workqueue()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-string-thing-v1-3-acc506568033@kernel.org>
References: <20241011-string-thing-v1-0-acc506568033@kernel.org>
In-Reply-To: <20241011-string-thing-v1-0-acc506568033@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>, 
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, llvm@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.0

Recently I noticed that both gcc-14 and clang-18 report that passing
a non-string literal as the format argument of alloc_workqueue()
is potentially insecure.

E.g. clang-18 says:

.../qaic_drv.c:61:23: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
   61 |         wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
      |                              ^~~
.../qaic_drv.c:61:23: note: treat the string as an argument to avoid this
   61 |         wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
      |                              ^
      |                              "%s",

It is always the case where the contents of fmt is safe to pass as the
format argument. That is, in my understanding, it never contains any
format escape sequences.

But, it seems better to be safe than sorry. And, as a bonus, compiler
output becomes less verbose by addressing this issue as suggested by
clang-18.

Also, change the name of the parameter of qaicm_wq_init from
fmt to name to better reflect it's purpose.

Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/accel/qaic/qaic_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index bf10156c334e..30e6bf7897bd 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -53,12 +53,12 @@ static void qaicm_wq_release(struct drm_device *dev, void *res)
 	destroy_workqueue(wq);
 }
 
-static struct workqueue_struct *qaicm_wq_init(struct drm_device *dev, const char *fmt)
+static struct workqueue_struct *qaicm_wq_init(struct drm_device *dev, const char *name)
 {
 	struct workqueue_struct *wq;
 	int ret;
 
-	wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
+	wq = alloc_workqueue("%s", WQ_UNBOUND, 0, name);
 	if (!wq)
 		return ERR_PTR(-ENOMEM);
 	ret = drmm_add_action_or_reset(dev, qaicm_wq_release, wq);

-- 
2.45.2


