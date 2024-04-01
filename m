Return-Path: <linux-arm-msm+bounces-15903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE543893719
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 04:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D5B21C20A77
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 02:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D03A385;
	Mon,  1 Apr 2024 02:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ccfb1GjD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6453CA48
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 02:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711939373; cv=none; b=P4JYZmlPEScsjkCYW24DIbLOAwUkiPcFPcKJ9wdbyL2wDZsuw3hwz5owf8xbqGh2qCjhZ3DkmdqnnTd2g/bIfuQRAj1Ki2l21ES+docDdpIgNGUGimM6IRWqWYAKZBvbCw/o7nI1IlTn5F+1io2JN0HQ9MqXkAkkaFUScHmbU28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711939373; c=relaxed/simple;
	bh=gQvNFYs+XySj42ee8HZa37cqRlMD12EMVNfdjmgcLAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2OKRKaIMn/KlK+kFToSiRKxs6UhFNXM+xUjV6WVEjdXMsVJnzldXaf+YV6El4Yr8uQV9tYBBQaKuAZuVUqF4z28xjfeutQQG0sV/fJgTbhzrJ9FYZCkVFi50y08F+3p05Jg8LpGjlLC9NWq2zApJELcxIfrBn4qNUnqsnYGIFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ccfb1GjD; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513d212f818so3960499e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 19:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711939369; x=1712544169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rDSJ7AmNeLa9TRlNQ3TwOTepykvmV+/MVa8FZsXwpw=;
        b=ccfb1GjDC+yUS/wDjcz0Djr+sMKLDzbd9Ytj7/599r2iI6OoZaaON0MP0cpTAcBcay
         bnvG+ZIafPIzcEuQ1YwkudAL3CvKbDrOKj6kaXEynBFobSYkYO+QTCfk2dLNpyESptdC
         4Xboa4qZbub2aeXC+jONNcYBo3lYzzXlIn/HXbMnNb4zJUZ1Jc26821D26eZgSIqMmBa
         LQ/jMp6Wc8lLDhKatxQ+uUQxr8dXSRIlZL7ZB5q4Ls2MQc2x/C2GsHc2c71TwnHFCu+Y
         KGgwqaSTWOm2Je0eV8kLuKkeIi4bTzat9m9RbBBdPRKb8/MOTguJ9w2glwyI/dQoWQ2W
         Jy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711939369; x=1712544169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rDSJ7AmNeLa9TRlNQ3TwOTepykvmV+/MVa8FZsXwpw=;
        b=K0zNoqw8mNRUNMj5NFa15cQ/f0BpN2D2+yalbHr9XsQkS6u4/ULofQmy5ACX525Ukd
         lSLVZVdN1wbEebAEdymWxAZPaiLrvPOG6KwFOlhwzqYnXLViECq7iySMELAOnqNYTs5R
         +ZzhNbazPcPyrPyQqa9sWR86FRWC62+BKlVhVN+4NCPM+2yl1J6aSHza4RYSFmIiL5Wp
         oue6YVHs2ow2IiMz5nvMwutg/2I4oYpSOkcYFRcbmVlESx77CxFBFCBYoEFxAfUrcl+/
         5OtAJWtpdqoO3PqF9iP0PMbhyv4unieIt1SlQtBQNHfTaJPLLP8ULYFgAHh37x8SWqXr
         qm8w==
X-Forwarded-Encrypted: i=1; AJvYcCVc1+ORKLP+frzZPm5nmY3KERm1NVgkHlShKyoABLcvfDmkQyigxXFb5kCK2mEs9KQsVui1E6hsPD9TDAYJHoQlwFOkFU3m7j6H+Zpyyw==
X-Gm-Message-State: AOJu0YxqTsMjgrf4UNJjzN6A0cVwQgMmiF5jUXlGkE9zEd93TUE9v5uy
	CvJT6MpbyjVStC9ox6luGfueJJSv2m254oyYAUI5IuIMjzMvMAy0rLHTetz1FCg=
X-Google-Smtp-Source: AGHT+IHSIDHPRdM5xZAaH3Io7sMMmdjJv4c2i8FE+Koto1FlctrjZgdMY7hLAVOqv0ATA8ZE7VAHzQ==
X-Received: by 2002:a05:6512:20a:b0:515:c43e:19c6 with SMTP id a10-20020a056512020a00b00515c43e19c6mr5023289lfo.23.1711939369518;
        Sun, 31 Mar 2024 19:42:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 19:42:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:31 +0300
Subject: [PATCH v5 01/18] drm/msm/mdp5: add writeback block bases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-1-4bdb277a85a1@linaro.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gQvNFYs+XySj42ee8HZa37cqRlMD12EMVNfdjmgcLAk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCh8kad/EEq82XdpkE7It1OWLKMTzOoaDJB4Vx
 wHdIwLFPeGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgofJAAKCRCLPIo+Aiko
 1QJoB/4lw7tABe2oXMBUbWaVTwdiGuyjcXtO2DBKvgfLzHDVK2KIp7tKRGRodYQo9pPhRWBW4pb
 NBXVffDrmZfR6R+e18AK8THWxmrP2+GfEYo3ozwbWGdiEvW52MJd3bTYIw/Pk8k25WlB58wZzOL
 FfgWM6A/8sleWqv37sIvBGRgityJwrxkDlktSJCfSl6x0U3MxXdWTj5z4je8nQpmzFc0AcFDIKQ
 YoQW4ckTlHI9GICW+AcpHa2ApE+hkbmiMgwGJClq0qlRPGLTC0muR0B2Uh52pWv2aelaAj9Wz7N
 bUnFGZedMPlWBFKAM1phN5l/lTWF+j/2Yj8Kxz80YfUWhWMW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 26c5d8b4ab46..4b988e69fbfc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -69,6 +69,16 @@ struct mdp5_mdp_block {
 	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
 };
 
+struct mdp5_wb_instance {
+	int id;
+	int lm;
+};
+
+struct mdp5_wb_block {
+	MDP5_SUB_BLOCK_DEFINITION;
+	struct mdp5_wb_instance instances[MAX_BASES];
+};
+
 #define MDP5_INTF_NUM_MAX	5
 
 struct mdp5_intf_block {
@@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block pp;
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
+	struct mdp5_wb_block wb;
 	struct mdp5_intf_block intf;
 	struct mdp5_perf_block perf;
 

-- 
2.39.2


