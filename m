Return-Path: <linux-arm-msm+bounces-52804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BD1A753DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 02:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 833127A7CAF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 01:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89A984D2B;
	Sat, 29 Mar 2025 01:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+lWGTyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79B842048
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Mar 2025 01:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743211619; cv=none; b=Dc29X9QPhrZKJBeH/Ujl42jInmKJ5QdHMI9AvZ+ExBt4yLOjRPh35dfTbhWSdDtA+6KnKOm4tyx2tO6FR3YpTCgU6+WqIdRxtTuuPeKSt7HusO49eUWUigt3mRTPFDm+Db1uRZRE9c93HMTuhGP5yGDCkfTBzRZnxrnOXeW3/Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743211619; c=relaxed/simple;
	bh=UeU+dNWfV5v3e10I+uyNNP2RIX8IeSbfeC0wbfVG2UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=bbbUJMLv21icLXJv7wQGdY46fJZGxZPz6sGfYtOv07Sx9QJonSfWoV2qt48rjwZd8NBavPHrTk7TnOT1Pu5/kJ9oH+aXOJblXb59GtMQNCly+cYO9QAm8UHDxz7g4bnYk4ZFeNsxamRKmVyrEjZZHeJzNG1CNEkmqXbVYdeQQhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+lWGTyG; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39727fe912cso962732f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 18:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743211616; x=1743816416; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Xd7RMGwL+Gav8KAb2ER71A9xVEKtaQiZB3bM2GUMrU=;
        b=K+lWGTyGyIXG7EhqrSqtIVAJLdVEc0wRTgqLurh2rKElSDWfM3kHoFXMoOs7O+6JcS
         gJwogy3twL53S1pp0ORdg/kTGumDIkRHoisTibWfgsIIPgIfReF0C21h9w09a+abX9Tj
         mcAzPCTOnTSHBL8C3RJLnG3Fq4DaSqW8n6/vFUXoxeFSmilkU9oH+aIuHVKh4daQyMl3
         bTqs7colwiuP5IPf9bP/kNuTa7jcSe0U694O5ioTA35XImhxsLJuBfANIeTXNdMnVy2a
         8aIQjwmKd58wNhJ/pUN8iKCd053i5hgxJg/dXXOiRO2yFSzbcTQI8ONqUDppQ9TTjmpY
         bHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743211616; x=1743816416;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Xd7RMGwL+Gav8KAb2ER71A9xVEKtaQiZB3bM2GUMrU=;
        b=rAMiXPYhRW5YhvnLdnTnWva7Tet77prt+AhXT+8kIlMBufjuE5oHpwrRKosI3ITq54
         P+gk5wxFszxPe/l58OGqeXkFSbFMKkARCsUEzjFgaatN1BkTTQQohO1X+3IfK1GxIOvv
         OlVhjGUY1aZc0TCUF6J5W4If/a4LbQwY44D2z2A4+tgIFQQGYAGhONBN9mSIWHoFramk
         r13x4L1gok+o2Yc02Klr9AdsP4BcYFtAlgKldHWVWa6ZKxtIjp7B9EPPhfth5Kane6fp
         DvLqK+FOf7iiF2vkeLvRbkA0Fa6wRaBqoxFzrP9HoQvrDofpZVnMTJpsEoWhgnq6d9re
         gw5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcBmHn78EGFDbIVM61XmFnsXuSU36Cyz2kPhgr6X4+gm35bVTWWuaAKVO+1D6sk548HVVSMWcAA6yMUks+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4mGcSfYZ/fGIRXqcKxZwizLtsPK+8qMgaS58+TXdP57OM75pb
	5S8l/7dEvaPZKSBgaicIcRQVeO3XPf2IQydnzGecMEm0Ap04DylZ/C09LrCYrG8=
X-Gm-Gg: ASbGncvZ15ZJzKLLsGcU6DcJhGGM7/UDQPC0u51ck3VK/0KZF+xJv0cr8GsGAZZIqg/
	NTCkFSlLgezXnEaQg5t2HNhdQq2sk9v1tZ29rZA+04MnWuEzxs+M7I3WXAepeXEak3Nat2jbFx4
	uXV0uR7ED7gbeQZ59SCebajut9iOUdXMe2JdUefMRUDVRos0lRi6a1urw2sP21cxf/Bv/P6kRuV
	tpO71ttnNkx1z46yNRF60YVgzqj5itfy4rWLAV6bElbgwnZyz7nBvrSlssqI6UjfLgLEsYaFXJo
	LLBw3YcXi+/GP77A2/G3PjTswcsV2+MjIZAnwm+6EgdDTMGoVtoyWFFi1xgVRfvvxCI5s15R/UI
	ZPwCAeT8/SQ==
X-Google-Smtp-Source: AGHT+IEwBNuvUbAMhxVWmNvRXOcvqx3XImmXmPW/lSoPmuRLIWXWpEkqe1jIw7kqySc1oRVntaGqZQ==
X-Received: by 2002:a05:6000:1787:b0:391:2c0c:1270 with SMTP id ffacd0b85a97d-39c120cca84mr847956f8f.1.1743211616163;
        Fri, 28 Mar 2025 18:26:56 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm4264655f8f.94.2025.03.28.18.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 18:26:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 29 Mar 2025 01:26:51 +0000
Subject: [PATCH 2/2] media: MAINTAINERS: Add myself to iris Reviewers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-2-0ec1007fde3c@linaro.org>
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
In-Reply-To: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

There's some crossover between venus and iris, I'd like to help out with
the reviews for iris to ensure we keep upstream chugging along.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ccddd2030efd96324e53fcee8048120990a85d5..89fd10c690bbb395fe22f7a6440fb98c9a25c659 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19529,6 +19529,7 @@ QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained

-- 
2.49.0


