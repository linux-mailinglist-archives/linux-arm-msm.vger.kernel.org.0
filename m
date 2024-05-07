Return-Path: <linux-arm-msm+bounces-19332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E18BE3F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 15:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCC1328CE90
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794C016F8F9;
	Tue,  7 May 2024 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I65H6rof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088316EC10
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087928; cv=none; b=glF6XA8INZxdMroBZOMn8YY4DdxcYOpmvzMn0u2ykxCRETdQ6678e1Ng2fEIMxvrSGsvLWE2cD5TmS3LKVy8V1Z7ZTxsYONeKcrKus9QW2gM1sekZM/FSqJ64RnJiBBA5mrijC4ut57+jyeeEmzYh7p6yF+yRORw1gGyXJ+6QlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087928; c=relaxed/simple;
	bh=yspSc0vXW80bDStJJU6njW8ROGAmYm1HyjTlHpef53U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GL4UyhPgX9xZHxSyED4Md5IXRNgwUwqAU/ZLvNVVxezljhIN5hGwtky+YbWfTXGReu5DhPhsGCJRYib8tj41asXWa5SIQPlQicjF6u/1KZB/wAuV9CuCqFoHHtWt/qZ0TfPBqH+6CqQqmCtCSWyZuXKbj4Htg/09/wXtIhS5qEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I65H6rof; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-792706dbdc6so317966485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 06:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087923; x=1715692723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NkWJe8JlogUB1KQ6tzpQTV71nluZthbO4z82dt8idE=;
        b=I65H6rofeep41/6v6/LZuouHXo+dQExIclgd2rGra9OW1eOnPYVVEv/Rik8spS+1+c
         IWzHOTuICIyl5VcEPSF3ctMSYrkEt4IA8EN/qRKYvxocv3l7hQbP/D8mIsK4yxSHdW8S
         1J4qwjQhDcZMoYD2dLjqaSbb2dImNFlxQ+aAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087923; x=1715692723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NkWJe8JlogUB1KQ6tzpQTV71nluZthbO4z82dt8idE=;
        b=hLMjYIuhW7u1my0oIyDZNWEVKibDcnUN8EJGd9gHFG3DW4314APTMnUwM7bfruhFgF
         D1A/nOvvnOj8Vou4PSpj6elfYGmZlIpNeL5skKSVoNBadCdluOIjzGJyGMUsVfpC0VaS
         9NDpH2G53Whq5P4G7aN3sOMGJKK2BAm/f4dsxjVP4/kyarTNavxDJHuRtiUEnci5k6bo
         +76Ut7N8tFY14+oorLuV7ayLZirc2FrYDsHlnzU1olxHDw09c3rLvUAXg+xNyTvSR9Il
         dq7nxLvOkO5Xqw21RasK2x3VDweuZVf6pMpwy3tT2vPyZJJAO/jEpAzXApJoO4tB3Mh7
         MbiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9LNBdGLN7NYXdCGopllPMP2OON2T/71y9NhwPr5evW/Dd4rqq1nkji+2y5f6B7tLhKTS4H54pa2OdEgCyzfUeOwDCHL+ZgzSj7z9poQ==
X-Gm-Message-State: AOJu0YzbMRZlC/FnmjqXvmxc4LP7v95KPsxe9Ngzu+jc6uHlyouf91gu
	GN4qECgdp5cM7w9yU0szlykatyMhN142cJQkPraN00g6FKom9Za6oXH9pKK2eg==
X-Google-Smtp-Source: AGHT+IHtK11JNQ0Mp4ZynJH1X6U9hIM5Ax6eZry5/k41CUicJOL6ws6WrCLsSXzFe5ZsTI8+M4i8kQ==
X-Received: by 2002:a05:6214:288:b0:6a0:f057:402f with SMTP id 6a1803df08f44-6a14608b428mr41532076d6.32.1715087922869;
        Tue, 07 May 2024 06:18:42 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:40 +0000
Subject: [PATCH 14/18] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-14-4a421c21fd06@chromium.org>
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The single element array data[1] is never used. Replace it whit a
padding field of the same size.

This fixes the following cocci error:
drivers/media/platform/qcom/venus/hfi_cmds.h:163:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index e1dd0ea2be1a..15271b3f2b49 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -160,7 +160,7 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
 	u32 input_tag;
 	u32 packet_buffer;
 	u32 extradata_buffer;
-	u32 data[1];
+	u32 padding;
 };
 
 struct hfi_session_fill_buffer_pkt {

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


