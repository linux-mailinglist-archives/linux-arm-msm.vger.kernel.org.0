Return-Path: <linux-arm-msm+bounces-33306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B547F9923BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 06:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419E62816EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 04:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC932AD05;
	Mon,  7 Oct 2024 04:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="f7PKCYpE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1044204D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 04:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728276762; cv=none; b=Ue9W4Ot/01hGe2WgB6ImCyN/VmdNm8zIqGVS72Tv7alYPkMGTvx8NTL/+ADbShce5hujC662ELEYIAwYo1WGSucbP1c1lcqQQdvgtpxbiC1wKrvVRGmFodswzOscsONIaN7Thp4ud+Ilg/pNfyXqCr0o1yiAoBtrShoLu//SiEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728276762; c=relaxed/simple;
	bh=Pe51Lg/PsZLWAqG9WRRKbxZ4v4+EdZ8UaY5o4W06xTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rBSAT+4O1mBsRJbgF32CdqxuFcwbESFxVGtyu+7ZV4vymPFtG0+OFfiPTX/DjQr8xiZPNL3ujFWg3G3sxJxUXPKw3qH5RCRsLctO/IxNOMwFvupUTO5uGhEr2N9XRPkl1W06yvfDWeG9myTwjtOAkyyg4S7L4ly2XlgkU4Betks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=f7PKCYpE; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4582c4aa2c2so30621051cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 21:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728276759; x=1728881559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JH+eeGvKfz71oS0W6AeXi5f58Oy8T9dmTdRTdFrBnI=;
        b=f7PKCYpEyASYIm9Zx+2bSByq6wqn8r12rCjhHOb503a9RR7oTvEhPCgd9XrZ60DNdW
         +jxhl9mtpI6ONwPRk6yjUrG1G4s7Tdvc0HnpRfPtFwgWBOSA23eZuXHwnRvZTrkQWIJj
         i3U8OxSkCSAjgsUsp5BvaCpNGnQTGM5Tf9baUcYhc8bwYOhvl/KEzYJ0h1KzfHCb+iCF
         A41ROm9rqwDxTaKU+WHRjjaKiq6NQ16kDhveIb+i4RDk/CiB/bKPdnjXj4uDhLw8VYqp
         S+f6+hby1hSaLzvG4Z5x3JC5t2mehY5NzQSOe3Ky61aYPrX2+SLEM+zxLo+sFNtITZep
         kH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728276759; x=1728881559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JH+eeGvKfz71oS0W6AeXi5f58Oy8T9dmTdRTdFrBnI=;
        b=o9cZeGxkjv0KUOl2d9sPfc+PWxOgmUvhd/hxivKEJoVaaqErxnmBNkPcaJLFqH+VXm
         G7lMuNpn2zayO0GdHun6mVvFkAm+qhzotzRFxNdUdh0CBNO7q4V+c7cs0Apxx7PRkL9y
         fIpDcjm0OWCSANdTplz8VoxtvI05Wxu70Hk6Nt26k+zAklguh9WumT4JOY5D1WgpMwaD
         Y6sSGRLUDAgw/ed6IO8Xb/2FM38bqYW7pgucxo9MTlpVKvVtShohJFKVqoaQTzWwgfKZ
         Tlo8PV3jyhqo/wB4Ous2YKjuZTb7gKuNdWxCqtTQ6fIwHfLwstT9f7g++t941b+EJ1Ds
         clow==
X-Gm-Message-State: AOJu0YwHqce5ni3CXfJ34Io1DcEjocAJvMXOAFIPXfKSDvIUhLMCJsi1
	JTCoORWo6F0Q1Qh+nPpsWzJ+vcUSQFK8rr+ZvEWDOESS79SwkMfntsLcBkWzm2bAaezk0UUJeqF
	0nUY=
X-Google-Smtp-Source: AGHT+IH/9bsZq7uHy78secXuJvI/6P0sWacsBbySahkLVEBVoPJhgQSm4YakQO1cbX3fBAenHpNq8g==
X-Received: by 2002:a05:622a:450:b0:45d:5d31:89f0 with SMTP id d75a77b69052e-45d9ba2f03dmr192178031cf.3.1728276759124;
        Sun, 06 Oct 2024 21:52:39 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da764043esm22666351cf.88.2024.10.06.21.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 21:52:38 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Arun Kumar Neelakantam <quic_aneela@quicinc.com>,
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rpmsg: glink: use only lower 16-bits of param2 for CMD_OPEN name length
Date: Mon,  7 Oct 2024 00:47:22 -0400
Message-ID: <20241007044723.25347-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name len field of the CMD_OPEN packet is only 16-bits and the upper
16-bits of "param2" are a different field, which can be nonzero in certain
situations, and CMD_OPEN packets can be unexpectedly dropped because of
this.

Fix this by masking out the upper 16 bits of param2.

(the commit in this Fixes tag is not where the original code was introduced
but it should be far back enough not to matter)

Fixes: 835764ddd9af ("rpmsg: glink: Move the common glink protocol implementation to glink_native.c")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/rpmsg/qcom_glink_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 0b2f290069080..e4933b823238c 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1204,7 +1204,7 @@ void qcom_glink_native_rx(struct qcom_glink *glink)
 			ret = qcom_glink_rx_open_ack(glink, param1);
 			break;
 		case GLINK_CMD_OPEN:
-			ret = qcom_glink_rx_defer(glink, param2);
+			ret = qcom_glink_rx_defer(glink, param2 & 0xffff);
 			break;
 		case GLINK_CMD_TX_DATA:
 		case GLINK_CMD_TX_DATA_CONT:
-- 
2.45.1


