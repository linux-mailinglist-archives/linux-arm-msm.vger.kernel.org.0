Return-Path: <linux-arm-msm+bounces-34998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8149A45B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EEB5285D08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0C620CCF7;
	Fri, 18 Oct 2024 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zl+jLCLs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB3120B209;
	Fri, 18 Oct 2024 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275631; cv=none; b=U9Au5mB2FQofNBoA5A5hO4joGu9Ul8MBklJWZYWc2E9sjWJ6Pg0Cy+Ny5o/Pffm5N5G8vAdpI0uomqlvO1wZgYWHEjegxVMZW4Mrga72X5ICGVpYI/uY/yTbxkXcx1B6bV8riHSC9PgmDo0chkM514tApf3muz+si5Z3Rzl5s+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275631; c=relaxed/simple;
	bh=K6TGwjaC6x34laNvtnUI/gfDwGY3CtnGj3CGQQdvOAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gdlg2Lpqq/hLsnk2/3fRGX1UBFiuxdsv3F9rPHtvpdddm8Bv9f+/9ag8ZKukLHf2jWpxeVc1UswoBQxInhAlTMcIpgfCz2Cuvh/mL/cAoDbEN7PDTeUluPIAGAJgYcx5EXHGaXQRGlg6uAaim4EKbvgkBS3jUEUns0JYT54MbJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zl+jLCLs; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7180e07185bso1061155a34.3;
        Fri, 18 Oct 2024 11:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729275628; x=1729880428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovKNqE6RDKN0Hrsi58QwvncI+Go0wvmwlY1ykYujsaE=;
        b=Zl+jLCLspriE8pwuBSJ4Axz5oHzQx473gGOl2zNU5bm/ULACz6oSXe4sVU8Rp5lneO
         dWttd2Nqp4L+AfKt/b7TyRiL/QqAZE0dgZJBc7iAmUo/aENRZ/xG2gnH6hTc2zkdspC8
         vWmRYlx/+rQNJ+ZeBKXgrIt+kldNEEEAJdwWIM9UQCfqTb7oIhxiY9w9meiS5IFb+k6m
         QK6mPNOvVu4hy/yN+7On0z2DuOIEnu8LLkVtQT0xsi50ffXODnrzXNzagJ8UcZ9w3bCp
         VK/aAYSF3VMOkgPnJEZbmOjq0x/YHNjMaHuqZk20gTQB7u/a2GD+p8lx4/Ff0UNGYLab
         IsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275628; x=1729880428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovKNqE6RDKN0Hrsi58QwvncI+Go0wvmwlY1ykYujsaE=;
        b=TTgCb892nqw3dOqRVDSPa8WJsAOmJIMcNdBr3iuoEe5MbAiEKlxSY0TCLgvXNszE+x
         ua2L7d913Myk4bjiJRLgdQu9VT3GVvb4CXUOlZ7i/Uo0H+zJ5K/YqX8Czh/1iM6rVvBk
         3mBiw9lGuxcpiK+qtnUX+SzgLio4LQKsm4Q4lfAQ+N0nRsrij5K+c+FraAnNoG647djO
         l/S0TpEjGYVZ6CtanGulwKf0z8nEF5ScM/AGXdlKlHK81idjRaI/R1ry6blEvBDbJlMt
         qqnZMFG24vmXw3shtPBlGfaukTM3stDdPaNRjKr3PjZzorFzPzdnwPhGitd8WrQ2sKhT
         +kBA==
X-Forwarded-Encrypted: i=1; AJvYcCWYl57JyAp2TkxnuUWYxre7bLLeG/urykjk+gLWTqzevGtkcstlZBZYQ/3gv0H/5HTEGkVzR1vHODQkaklY@vger.kernel.org, AJvYcCWmtMlv8X6q2sQ35/PoI0xdNzK0mJhpBa/uj7LkDJwECp+Cdf4SDhsVil8DRHTUGE8CXMGjKHRyzYz6GsX2@vger.kernel.org
X-Gm-Message-State: AOJu0YxmS/O6JWyfwkEvNeH1T5hfW6a066eg6g7MjglX47aofIVEbYd5
	r3HfmP8UqjbWphY2wSZck0lWzO1i6CEHO3fNMt9Qg4hnHIaq3jO9tG2gEQ==
X-Google-Smtp-Source: AGHT+IFCxyJSxPQP6RAex7Yy8ews7j05lGPKGou37IK8oImGmwL/23ibsKuS7C/gej0nrLDrDXLDyQ==
X-Received: by 2002:a05:6830:4997:b0:718:c0d:6c02 with SMTP id 46e09a7af769-7181a5c4e70mr4266746a34.2.1729275628108;
        Fri, 18 Oct 2024 11:20:28 -0700 (PDT)
Received: from localhost.localdomain (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb8aa2f668sm340542eaf.44.2024.10.18.11.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:20:27 -0700 (PDT)
From: Denis Kenzior <denkenz@gmail.com>
To: netdev@vger.kernel.org
Cc: denkenz@gmail.com,
	Marcel Holtmann <marcel@holtmann.org>,
	Andy Gross <agross@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 08/10] net: qrtr: Drop remote {NEW|DEL}_LOOKUP messages
Date: Fri, 18 Oct 2024 13:18:26 -0500
Message-ID: <20241018181842.1368394-9-denkenz@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018181842.1368394-1-denkenz@gmail.com>
References: <20241018181842.1368394-1-denkenz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These messages are explicitly filtered out by the in-kernel name
service (ns.c).  Filter them out even earlier to save some CPU cycles.

Signed-off-by: Denis Kenzior <denkenz@gmail.com>
Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Andy Gross <agross@kernel.org>
---
 net/qrtr/af_qrtr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index b2f9c25ba8f8..95c9679725ee 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -560,6 +560,11 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 	if (!size || len != ALIGN(size, 4) + hdrlen)
 		goto err;
 
+	/* Don't allow remote lookups */
+	if (cb->type == QRTR_TYPE_NEW_LOOKUP ||
+	    cb->type == QRTR_TYPE_DEL_LOOKUP)
+		goto err;
+
 	if ((cb->type == QRTR_TYPE_NEW_SERVER ||
 	     cb->type == QRTR_TYPE_RESUME_TX) &&
 	    size < sizeof(struct qrtr_ctrl_pkt))
-- 
2.45.2


