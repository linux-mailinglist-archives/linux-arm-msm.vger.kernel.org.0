Return-Path: <linux-arm-msm+bounces-19375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C98BE8FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 18:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834351F22146
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321F216F83E;
	Tue,  7 May 2024 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ih1Uydkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5493216C695
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099244; cv=none; b=NbT7kOulUHrPSZBBFpaxlun/uIyq6XyiHJyHjcXUDt1UZcvgWuIK1TuiI8kKXPf1NUBaXH/M4NvZ0ufbwIGtdHTBlvoTVJaIDd+WWozlloyf9tjjrN2hf0hPKNoTyZkHy4SLAXXE9c5U0OeVUbGgwMquNPBojh0dafh/nApygL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099244; c=relaxed/simple;
	bh=yspSc0vXW80bDStJJU6njW8ROGAmYm1HyjTlHpef53U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmRZo0oCfQZ8RCSq2XD3hhaXYdWy2G0NDf0xbv/PLRf89bmMIhLX1UcCLGcNLCAV3oMvUiFlyPediO6dwdtRhGhyMThuAnQl+rJrWxF8CAbgJyiBGIRCZ/BLGihCf/GGFjhHbpWqnIGkQ8Os8/kDapY2X7mlSMbFhsEAoEACoR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ih1Uydkd; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43d3a33d41dso19517491cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099241; x=1715704041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NkWJe8JlogUB1KQ6tzpQTV71nluZthbO4z82dt8idE=;
        b=Ih1UydkdSYL7D6Y4C6DxytlIs1qR81AfUGZZba3QfeLyiuXoWX1OriB+ok/TmrGPBD
         uAedXrg3bP3EnX7vIEybdyzlW8IeiUfUX6bE82uhK9Rab+xdcKrxxrb2Czdn41bLZ+gR
         gwlvrUJeUkXf6+lDwp+4UtgqeLc5RmM/aSX78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099241; x=1715704041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NkWJe8JlogUB1KQ6tzpQTV71nluZthbO4z82dt8idE=;
        b=C6mPYsiVQqi85jwKSO8eXCviesFoRxQX09u2MT6j9Vd2WNZz0V/Ek9M7hOHv4ZKisF
         n1VNrd5Usxh8tgvAF+pT51ofjxtTZHPhOV7bqYlFpYaMp6+Rh8mPD5/KFgoRcsLvRmsR
         4kMA12yzib+VjNBT84Gez9JB/Jxgl73rbKMhQ8Smaes/I5cJYzKg65ilA2ZSbPEtVW2o
         vXuEe9W6t5nokL/zETRNbYq04Ij23uCAntvtiqKA0+ZijvylogPqexBULPTcJAFbntnb
         gUP0kss/+kCpneE3qVWoUyvN7l0EiqFA607BHOyFdUNijBcBMYvml2H4Kj9ojZ8zSNCI
         dohA==
X-Forwarded-Encrypted: i=1; AJvYcCUrTBkN9a01P0jn3KXqcCVQYpFk5sb3LbhEaTAMTXBUJgHns7shqZOmoH9PbUbrnkSso2NDl4XaCvsZvHZ+F6FGSD540lENMxXelVpKhQ==
X-Gm-Message-State: AOJu0YzDnz69CKBzypqRXPZ62D+e82WJYFWLKB7bFPGVzcxHsXmq14/r
	DG/BHCdaNujkUJK+JCRSZodRkAjvQNqenD4wc848ZBHXL0JChLp4sAhwYU6Ksw==
X-Google-Smtp-Source: AGHT+IGy63ktMUcef0pl0O/LB4NVLwAUnrH80knXHLAZJvTEQKiy8Aq4N4cNRIawlD7kkWl28ecX+w==
X-Received: by 2002:a05:622a:1650:b0:43a:f441:b3ac with SMTP id d75a77b69052e-43dbf4e70d5mr2464831cf.32.1715099241340;
        Tue, 07 May 2024 09:27:21 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:19 +0000
Subject: [PATCH v2 14/18] media: venus: Refactor
 hfi_session_empty_buffer_uncompressed_plane0_pkt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-14-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
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


