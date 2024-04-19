Return-Path: <linux-arm-msm+bounces-17935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF78AAC27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 11:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFFFE1C2138C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 09:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B0A12FB01;
	Fri, 19 Apr 2024 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZJFVxKSX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E40712EBE4
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520184; cv=none; b=JIS7CkSNNqQ6sx5uE834fqWXiUIdxxN7JSkxaNQ0orACD+xWMfY3jTUB635zObvdaNM9Jr8U6YwR+RbfQ/+6cpBRUeRcqoPVPY4lEMF4bcRqgWjuybxbn8Af97H7L5vknEaWkoa//TCUHli8BSm0bTblQgyqIddFVkVmR1aB6Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520184; c=relaxed/simple;
	bh=b7575egpMtje3XxHm3TKUIbqmP2kiwLFL5J+QhZ2HHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/AHXIhBYBSKzr3R0GB7A4dfTPuR2XPIkV/+3uWILfbXvHt6yPRP+jff4mA+nEXbzuNf3aZob5OpIZa0Jz6CS70ZiWPDbFmL+A3hdnZ2Nbbryg034PpnrAA0fVVZihVAPhNtuTH8pDb6G0YqqSZFjHCkzzzjHBRO6ks/S18VXvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZJFVxKSX; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so1185480b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520181; x=1714124981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYOJzUnpv9q2D47VjlP9TkFSb49icqGz0TC7JGSn6z0=;
        b=ZJFVxKSX8eoV6cYNRP+b+5IGt6mvMt/G8+Pls6/zbV0WGGCNY1repwFbcFQw0dLQsS
         A6fvjqQsIzsQ6ZpYZ38CCC0aHsyieNzv0hmT88v02df7DnXH+uZTGOxj16fjiqR3XHeH
         p3WeXy5+/ImHJUN26tCUj0CDuRxAhf6vajQYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520181; x=1714124981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYOJzUnpv9q2D47VjlP9TkFSb49icqGz0TC7JGSn6z0=;
        b=fO6nh6Xh/E4+F558arnsYtrRMaW7FKtuNiI8mtBD3Ok96DKXvia3E9UyB7YkU++vCL
         gTTI/QDUgJdcOjqcaGauxH9nsicUE6CF6FQuow6p3TYtZRxNxlTuuGUhnjEK2vGwAxzD
         o+fRuwh0r4Ry5WT8CUYF2ara42BaU61njnE+hJTjWqP/oBhI9OXBNgF7j5jRdQFMT0O5
         h6135Q+z3d/CI+2hQcCHAw8zJYt3sP60q8WQGCAEL+zut6cL2UnZfM8nRBecD2Sr8IDK
         WJAIDlxXB++hrCb9gTpib2CWMbnhZpY+2CxxGxgmftJsEBbQXkbOKU8bHylnt475JsTC
         eNzA==
X-Forwarded-Encrypted: i=1; AJvYcCWLfKfenCd38kL3IKj5AmEbPhwTILYLTLLSAbZhqgspCxcPI7jHJFmyI0ZEl6JiVYPAkvsH3Q4q2FhpE2w51vTaKPPR553xVY4JFPV1Fw==
X-Gm-Message-State: AOJu0YwcVpYcuCEB3kTCu7uqhcikoNOpUFA7eKVrP6ReQk4BY6w9BWbx
	91BTbsZdp0orm6eMvboazQqYfVJDXI+igS7DAe0BfG4ikek9LOe2ietHihkBiMN9KHpS1B3QGTS
	jCQ==
X-Google-Smtp-Source: AGHT+IEqg8WI1huh374uXjkgiCfNW5dvf3VCHAQb3EvwSLWOaLDMHldgLr7J0rc8UDIeS/oMY5gCXQ==
X-Received: by 2002:a05:6808:2029:b0:3c7:2eff:7dec with SMTP id q41-20020a056808202900b003c72eff7decmr2132218oiw.2.1713520181341;
        Fri, 19 Apr 2024 02:49:41 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:05 +0000
Subject: [PATCH v2 19/26] media: stk1160: Use min macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-19-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Simplifies the code.

Found by cocci:
drivers/media/usb/stk1160/stk1160-video.c:133:12-13: WARNING opportunity for min()
drivers/media/usb/stk1160/stk1160-video.c:176:13-14: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/stk1160/stk1160-video.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 366f0e4a5dc0..0ba0f41fe3f4 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -130,10 +130,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	dst += linesdone * bytesperline * 2 + lineoff;
 
 	/* Copy the remaining of current line */
-	if (remain < (bytesperline - lineoff))
-		lencopy = remain;
-	else
-		lencopy = bytesperline - lineoff;
+	lencopy = min(remain, bytesperline - lineoff);
 
 	/*
 	 * Check if we have enough space left in the buffer.
@@ -173,10 +170,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 		src += lencopy;
 
 		/* Copy one line at a time */
-		if (remain < bytesperline)
-			lencopy = remain;
-		else
-			lencopy = bytesperline;
+		lencopy = min(remain, bytesperline);
 
 		/*
 		 * Check if we have enough space left in the buffer.

-- 
2.44.0.769.g3c40516874-goog


