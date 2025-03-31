Return-Path: <linux-arm-msm+bounces-52863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AA6A7618B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 10:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF76E168E1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 08:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A948F1DE884;
	Mon, 31 Mar 2025 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k4PmS5Xk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88BF1DDC23
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409426; cv=none; b=BaczmlGGJd+lvjVwCYAFidcvhlyyVMm/JSbs0Q0mBB64WCpTRS1p/rHA9GgJAH2ySW93sEAUHrk9M0GCWlaFyQZswWTWx3ekWb3dRnBTjMZn2UlAVs5FTSf2t/XoSZ3gE1zRBscM7OgF8bU5R2LOCoFASP4YCh3GjwAn4RQEBQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409426; c=relaxed/simple;
	bh=IWIzqWTJerFVGDEJ6dyCfjqxawUtXxEZNgAVar0xfxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvJ+u9cKrpTsMvkolCmAgQQaAsCr7FCP0ERReMMTOzPbV99Sx+lddAn+xV/98CWnl6Byu3+iKaWSqjVgyYx5zvtv+YRuUsckIKxXhIsnYkzg9TqyDs1jtDZdBqYB9SgjTe6YuMYA1AFBdRlP4MwIZx81ar/f5b5bIg1eLCG1iWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k4PmS5Xk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so34660045e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743409423; x=1744014223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8WDq1ZGnO/CqUh+Nw2fu1DlW08+1Zb/2+tzpoO0cZg=;
        b=k4PmS5XkykKpXzrOoexzKUVW5fr0oskxEcL9/hohzaCgaYL2+0BFRubMCLL7Q60l58
         r9j+4tOHYeSh3D2Iw/UIWPvJw/4mB4mkGnyvzmqlrale9qh6AWbFy7qn/1gR1vDMAZm8
         zYma8n/g97W1UDErTsL5iwOVvgwD6st1GdwNoSxzUUzrmRLFSs//X+dmP8rJ6Rc/ce8E
         jtCaJtxABMpFAdXCxb6JfXYqamViqw53OqwwC7ExUDVhDkjIo4bjlSPBdpZqa8mN9fry
         OsufUvh5W4gQjeHQuwKS/PPqJYAE/slqovwOW2gdFsmCWN8Rg7Gv472h3OLQVsgt8El/
         WdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409423; x=1744014223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8WDq1ZGnO/CqUh+Nw2fu1DlW08+1Zb/2+tzpoO0cZg=;
        b=YlY57mT0bpg7PLW7eXAECar0LciipmSNqu7bSKP3VFRleyOUDGlL7DPwObCwT/lz1e
         8x2q0kioJjuaoOesGrUVSJZo7IPyQ2t2a7MLIUsGWA0EdALnUENe2WWv4LKn9rhAXVA3
         LLE+lCAKBYFio7qH5325SFIr/kI806Io5WxdIQ2aENSS7w+sJRmsiEYq7w7hnJe2zypk
         6w49Ze1nrNX844ehlTFD8OvDWwOxuhyXP0G0urz95cXEp4xFWkPZl13Gu62e1cOobOfy
         1lZa/9XB7stX1Jg2u221e2yDo8lOjY56GH5hG35nY/owz7dGC1t9lu1ql8qXqS9+Paoz
         Fhtw==
X-Forwarded-Encrypted: i=1; AJvYcCXkclfhPWn1wWVpd0N4EzQImePZlM/z4JUOFDbO+PhRAsTwloUhZNYjVhWXluAzMjPcmSU/pEOfQ/HPliEh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1jymwTKmQ1n7fGE9J6ghxNHF7M9lGrrZ8LcKxL4qCFsw66TCh
	loNg9zPOGMpRylndM8EgHtdwUevXvKkiCxpe1HkiIRDixPPgR8TFK3pNQZjD5WI=
X-Gm-Gg: ASbGncu3IhyT7TDSx/c8MU8qh+yigWMzFiMI8sXyXBDYQs46Obx1y+XXpnseCkGGe4q
	uqOh7C2jbsJ55pCliHzFBjHK00kcCsegg55anBCOI+6nC4VJ0QsxJwAqJkjwj2IzT+7P3GGMVtT
	gWfxaPZBCtw7B/u4pkGuW1C3KKbwcipmldtdBEISUVCX3D7/E0OZ5wC1icI6MGk9OHSLThAHCwG
	UyJtf8+Pc95JaHpBrQOdU3pB2+KrjARPPZ7pAKorlo3Nrc5CLICOsF19+5+eXtbgyEZ+MyLuS/j
	u+EM8CyvVKiOee9jOJO6iavfmQv3FYj98/6n9aB8Gxx/my7pwiwxj2u8Uq5KlwFuUMCYFuHxD3x
	ZDqkrws2XWg==
X-Google-Smtp-Source: AGHT+IEPliOGLXJ/ttkcUzPpUn/BmzsjWXM+S+SYmgYzau37T5+RA34Y6WBFtgNUEKvYobw7wxOI9A==
X-Received: by 2002:a05:6000:2a8:b0:391:3156:6be with SMTP id ffacd0b85a97d-39c11b7dae8mr6742640f8f.7.1743409423178;
        Mon, 31 Mar 2025 01:23:43 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a8e0asm10520079f8f.101.2025.03.31.01.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:23:42 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 31 Mar 2025 09:23:35 +0100
Subject: [PATCH v2 2/2] media: MAINTAINERS: Add myself to iris Reviewers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-2-036222fa383a@linaro.org>
References: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
In-Reply-To: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

There's some crossover between venus and iris, I'd like to help out with
the reviews for iris to ensure we keep upstream chugging along.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9571d042c7f4f7d3b0eb3e627f3b5ae20cf52e99..02da7a074541862bbc9da442f8380794ab5af87f 100644
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


