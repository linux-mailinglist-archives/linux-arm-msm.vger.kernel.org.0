Return-Path: <linux-arm-msm+bounces-46610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A869A240E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 17:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CF2816AA08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 16:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9674B1F2C35;
	Fri, 31 Jan 2025 16:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYzy2ldk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F461F2C2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341441; cv=none; b=WBcaEah48SMq/loBuCECIhJ69xlCXAaO5ebPVZQqMt7jfHYMcnOcADvd9thl84T7sMWJtnwut54+89/NVIc2MtsN2vhigH2DblV+XgX/POflypCPpVQK4QihpoM0tcC5dfHx83kf9PueoU6+D3QoH6xrNbxvDdIPPRA88noCQbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341441; c=relaxed/simple;
	bh=6PxJERCfOlWdvjBBvwuCTiAa/h2g6rjj12EfEqksNAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kmxMdwpU7+Ict2ANqFLmAEn40FGYxNjyg++qtTogZoCUlLj6ZuqtfKmc6OUWcI2I82sptrF9hUn3Dt+sMijiCShfVUpWWkt28P8odJkegfm64u9jTyhPqnvX3gPK3AQzrfWhHeA7o+E4YQt2ML2FiO1ygCNMvoXOU7DedXDeqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYzy2ldk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361f796586so26115685e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738341438; x=1738946238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMx2YnOlJPDXeo1XJnfHHROuTOY3+drwNmWAuq+4lIg=;
        b=fYzy2ldkXyrqgsmrhEnM/t0NNjNkMx4gvHm0o6VcrTaTT4yU9DqCQmpYV3ldYykfob
         GS/28EUrrPEDcH6EuuArMgCbTCIxOYJTx1obMXA8RpFP7r7T6lpYOCNzvi7gy3N2q8FG
         e/cZwIc/lRgWC0zDWk4bLFKsqgsIpHzC6cY00CvxQTocZfsXPl/GbTRi0OR8ZiOVO33G
         +Rzu/TQ0yJQzVxeoGlCvAI+6aCrBOwqWhVU/XVspbnk/3YgC4nXrUJkOAfZtPr0yr5mG
         Wr9IBTbbTwHL63dD8mpQiR3fq6P3P5Qw9AJwn0VZvpjOd+ltd01sM+k9iRgN9aZ+6jya
         nL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341438; x=1738946238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMx2YnOlJPDXeo1XJnfHHROuTOY3+drwNmWAuq+4lIg=;
        b=kA6VXeuD6E2TrzLB9M3WOsY4hIapCpfuE1F8T8TfzsnKf8LjZd9hxdleql9rqMJL57
         sLKx+f85nL/cxgpDV3IUl2mvb5d4Xz7umXIRMwXnmXDjarajVxd/qqVBfyWhZaJqc5XF
         Uf+hSnz5TUfQ4rOI9f5EAH5t5ronAATCv5ChXFq72kHyRuHzwYsA4ngxDY7tBopkouE1
         9qi0GuA+3N588Pt4y6cveqHDDU4fCQpof56wPnQrWrWEaGTyObmDoUIhvmHWHX3YysjU
         h/3iG3ej2SILu3+iqo2+n+1K8ipwl8jNOU29L/cAI8lMHI2k3FKdWMbGTIjf62nAQytk
         8CWw==
X-Forwarded-Encrypted: i=1; AJvYcCVc3Uza2Gqpki07JWMoedM4/x3deAvTuHBgD4H3GqJRnVBvFi6UOHHJEr5fEVeP3HSNCFvxprHHJgogy8SM@vger.kernel.org
X-Gm-Message-State: AOJu0YxvagCyOAGRzyprsHmALf6/RHno6Z58TJScR057drNVJA1YRak8
	p1y8HeYHl4XsOqaTHoLX0c7QWkhCCGqmcnfaiCilkKS4TI09aKZr50cTUSbfRjk=
X-Gm-Gg: ASbGncuPMfP4lV+SZW0/N1O1m0upszRukG2YF8kVVPTZlzeAz5eUOayl3daS6rdXvbk
	lIf39lH/1fdGgzaXLO+qyWP3BJtBpXfQndcRgSDEdmfF+KGiSXpg/2sTqUxxq20GYDewdctiJcT
	igxu77C9P3U6EI48ov0yFf1Iyu5kR2cQyI6ttHL270EQPMdqARS7pdRyxdiSCRP7ic7IswwZB3q
	wesDgWbkPyeCZx5+X5oNbpmR8rvTUd9f0KWyAaDo1umvK6rKmOVHwTKr1W8HbPfu0Gzyz8R07nu
	Stu6ETNeCqY6C2c=
X-Google-Smtp-Source: AGHT+IEK8aXASXk07qexYhvsAde0vZ0pJEgD444D81jkJ1PplRhBIzhtI0G4gtXUjh/qBfrt6nphdA==
X-Received: by 2002:a05:600c:4ec7:b0:436:e751:e436 with SMTP id 5b1f17b1804b1-438dc40d574mr116288475e9.19.1738341437975;
        Fri, 31 Jan 2025 08:37:17 -0800 (PST)
Received: from pop-os.. ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1e8f53sm4975118f8f.100.2025.01.31.08.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:37:11 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: quic_jiegan@quicinc.com
Cc: quic_tingweiz@quicinc.com,
	quic_jinlmao@quicinc.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	alexander.shishkin@linux.intel.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	James Clark <james.clark@linaro.org>
Subject: [PATCH 2/3] coresight: Export coresight_get_sink()
Date: Fri, 31 Jan 2025 16:36:14 +0000
Message-Id: <20250131163617.1730505-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163617.1730505-1-james.clark@linaro.org>
References: <d5332d6d-237f-4b78-9eaf-2619bd97b7bd@quicinc.com>
 <20250131163617.1730505-1-james.clark@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 253ef02fde12..f31c8477f7b7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -526,6 +526,7 @@ struct coresight_device *coresight_get_sink(struct list_head *path)
 
 	return csdev;
 }
+EXPORT_SYMBOL_GPL(coresight_get_sink);
 
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
-- 
2.34.1


