Return-Path: <linux-arm-msm+bounces-44111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4894A03CE7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51B953A5C29
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2321F0E21;
	Tue,  7 Jan 2025 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a3IlgDGP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67FE1EB9E5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246868; cv=none; b=L8zYgzyqSIZPREfLYmA8egLsk6RGT24gYRzsnJkXa+HM35iuY2LZ0ChR/qQDBNCwuvol2Jl1IRNH1UWwQgEEuAbNfWfLI/4Qd9pE264BqGMRVurd4dxAaZJlxGoEQgDZnnVsSsOv0nUpOVLRi+zFOzJoZZHOaZ7G2YFgzfMeCJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246868; c=relaxed/simple;
	bh=4DxIWS4UxbWb/GxgImQ2LJd+yXKvqJI5SXd4jfKZslM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KXsf0HECjX0Py0EbGWEuy4lI4xq6ijYSZlHzYpyImhRluS6TPUNmHAsaf8D6RJBzv9gjtG7re7ToUPNNZT0SR7pHFxIrWECsGv8uIEcnTypOAFlduaMnzil89c/Yn0CPXzS3HZ7NFyzerTwYB8fNN948aJXwmSiMNeGIxlyGoeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a3IlgDGP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736246864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xxf3smob+6l57OQXLoAdYMn9bpXPBaTQlMB2diZdpmc=;
	b=a3IlgDGPwktYC7Bgs2PuilGSvMWjcvm7cjq6x0o7NCAQvGIWG5Q1dl2WXJtco87mpCc+gX
	aF7N3T6BvVnIQ9ya+LpO8znKpHI/p6UPRBp3/90cnETUzF9LZYcAdCpVnlaCgh6pVSyFA3
	7P1u9piuHtm5mWV/1DCgKJsSpXK//C0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-Oi6iVCWlNvSG8DNXjPXGoA-1; Tue, 07 Jan 2025 05:47:43 -0500
X-MC-Unique: Oi6iVCWlNvSG8DNXjPXGoA-1
X-Mimecast-MFC-AGG-ID: Oi6iVCWlNvSG8DNXjPXGoA
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679becb47eso93999051cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 02:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736246863; x=1736851663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xxf3smob+6l57OQXLoAdYMn9bpXPBaTQlMB2diZdpmc=;
        b=RNRngkuxp4fKhfwtrT/orzJFI6TpTKT7KOSw67xYlh/XCbEUYJGFeWSPCx32fm2ZQF
         +7IWzxLaC5WVxju2qD+qtjHDcPSmpJuJex5Fo6S7GJDPYiKqqLufXj1qqaphwx8fo0xu
         RBgS3Z0LqveWHy6AF7X8TJVvRPihzf8vEN/o9yZCdd1+1PXWh4BiQ/2ljsTNoFeRmej+
         P6MVWr08xOLeD7/OHejVa3SezMNvGiDwq/tubhTkWfi7cpsA50sK+joIDYZ89wairI/u
         ehsJhejzkCmjMrg2M/3wmp0v4IdrXEvdQEE69kEqVdpmBmwT7Nqjy+r2Qg6Ad6tXFK92
         pUJA==
X-Forwarded-Encrypted: i=1; AJvYcCVjZIac3A1rhICv+puS6kcAU6KXfOX/eY6NBDwQX2ZKeQ9+16my92msN04BKxvgLTBGXzh50rbxuOfT38aU@vger.kernel.org
X-Gm-Message-State: AOJu0YzswN7eAKt+gbbAXW+z8YppS66JUBgsMvJ4EBS3sFSWWIs6f13d
	xK0qjee1zvOcbskd5jl9Gbx3d6I4LcKj810tJp41gRBH7P4+LoWr/qoeeeapVk3c9z2UuAxCpqc
	FCIdjXB8HoDlK9YxsMTOizYBtmjG9iNItoZ+JXWlMkIYRoez7vhD4A/r1sHsaovo=
X-Gm-Gg: ASbGncvJLMFLd+2ZCfojLAkaHgZ2O2TnTa6Kpwrj1hspsmgo7bAYHsnVdBQyYxK3zv/
	+WXiLzzW17QTpWxVn4GX/FjsRHM9Eb/wp5ydq+7dsnbaj8Jp8jniUxYexts7pn/KfdcCgd2CIrk
	wCvrNcGIEEM848gG9BBQOfybOLqcxLhFQvXqnhw+ahBkNiVldauBYzN/8PBDnwMnNf7zLvxYLLO
	sLpAxqlG7BxEAjgW1dbWQhmwApdHgKR0k9coIANJx3KVXtqQgXejYu41mDjS2OBpfOz89Fkr/rB
	d9bjaVq4ZgFGp2Dz391f2ySlrUUE
X-Received: by 2002:ac8:5fcc:0:b0:461:313e:8865 with SMTP id d75a77b69052e-46a4a8cca9dmr937479931cf.21.1736246862794;
        Tue, 07 Jan 2025 02:47:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCN1wrufu76U/PyJOp8iP1dgVNtmKaWBLmDGU07zHb7TNTTnchQao00F/SfyXcsqdNs1HzrA==
X-Received: by 2002:ac8:5fcc:0:b0:461:313e:8865 with SMTP id d75a77b69052e-46a4a8cca9dmr937479761cf.21.1736246862555;
        Tue, 07 Jan 2025 02:47:42 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb3403fsm184169821cf.88.2025.01.07.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:47:41 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: qcom: Select CLK_X1E80100_GCC in config CLK_X1P42100_GPUCC
Date: Tue,  7 Jan 2025 11:47:28 +0100
Message-ID: <20250107104728.23098-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 99c21c7ca642 ("clk: qcom: Add X1P42100 GPUCC driver") adds the
config definition CLK_X1P42100_GPUCC. This config definition selects the
non-existing config CLK_X1E8010_GCC. Note that the config for the X1E80100
Global Clock Controller is CLK_X1E80100_GCC.

Assuming this was just a minor typo in the number, i.e., 8010 instead of
80100, change the definition to select the existing config
CLK_X1E80100_GCC, similarly to the definitions for three configs
CLK_X1E80100_{CAMCC,DISPCC,GPUCC}.

Fixes: 99c21c7ca642 ("clk: qcom: Add X1P42100 GPUCC driver")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 42c257e4c433..ecba763a1a59 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -67,7 +67,7 @@ config CLK_X1E80100_TCSRCC
 config CLK_X1P42100_GPUCC
 	tristate "X1P42100 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	select CLK_X1E8010_GCC
+	select CLK_X1E80100_GCC
 	help
 	  Support for the graphics clock controller on X1P42100 devices.
 	  Say Y if you want to support graphics controller devices and
-- 
2.47.1


