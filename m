Return-Path: <linux-arm-msm+bounces-53051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A47BA79150
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 16:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FDA916E317
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC1B23C388;
	Wed,  2 Apr 2025 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u4lV3mTq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC33023AE95
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604603; cv=none; b=dwc8bNJG3RRVcFqEuBJPRE24TKMJBd5XT4IIOyFnu0x8TAqgqoe3IC3Mf+ayVu/np1VTdEmxPXBYRaZwWE/K7l4xcwEwvG4Uw2h8KHaYUX4gX20pWPKqxeJnL/78JMsuL4k9qdtNmWGybmSyrMSDzPpfLWp3e9EqtkX4tW1F1S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604603; c=relaxed/simple;
	bh=8hS6GfBJNXR0FuahNdWaTupB+X7huKbQP3wOJFPU12o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3ZGQENyw2gvoHS2mFdkt0VmoQoded5c90esU90kXhkjsfnSm24dz3kdhJNch44/2hCaq7v936cVKbffqwtqYUC85TbSTajXk4mAUSYGn6Di3huTcpGD5SdCyIo88s3vNGYm5NFyRDV1E113fbzl9UgS8teW/plOBES3EoOh/G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u4lV3mTq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso5270248f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 07:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743604598; x=1744209398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzxsAOJT4Iqs9UJzPZL2Q0zcziM4hu6YpQDFHvHcut8=;
        b=u4lV3mTqTPysPBatsAMFr7ce0+lFiFRvqfyNK8GWemGdxguoeSq6Pn/WchI+APFAPo
         pPhcE8FRCkm9OEYy9yO+uGuKZGQsgrqNqC5qIlAjzoIQvP20r/Ag/JVlVypDFSt9MlKz
         er8b0Zu9YgFHK+twe/20XF6KLOtGhPkG3j1nWlLkj3vKoUvsggSHklfbvOFZ8VANOPLu
         vQyzC/9pXdH9l9yk4vtNYiDJtj0uSsfEHMPnTVhI86X+4EAKIzHyOcry2NROHwIa7Rjc
         svNcmcurjj/LxJS3hmlM5ax0377Oh6T2x34onxxzfI6/VrJS1lgTE/haeIv0UDUd9FbX
         95yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604598; x=1744209398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzxsAOJT4Iqs9UJzPZL2Q0zcziM4hu6YpQDFHvHcut8=;
        b=UFk4zxeWy+ISidRHhjzTXuvHOIxi1IKWQ4jOg8i6HWB1fP7DxwmlI4M8sWlKxUx0k0
         HrJf/fo6oNuTN3i0BOmHcz8nqCv/sIS7UGNmcpj/sES389mHt/lDhIMOPNng191vl6DK
         1iVL/IX/wi8bnf9lHD67FICRRmeE65EEmXvzDnXUHMHdTv6FE9ADUh6GlVimdfHX+lIv
         RD6j+gHtEmli+NEp7D2g828OP88axASiPCvuhcFXjbTKTz4zMHROjv/pQNz+KmWVZeX3
         vfBiBAp9ZTujU4jDwcGmdOL1GPBtJaemM/pF/pS8MSnStELvG2oEYaJlyqfY8k5rG9mJ
         jwhg==
X-Forwarded-Encrypted: i=1; AJvYcCWl1kk4qpcY+Vv6KeA5OoT4e/eTEjLDdRtaiVlAGtEsK3Bh0/Icj1WttlVFKNuaz++WTalh3IDzuz96Rt11@vger.kernel.org
X-Gm-Message-State: AOJu0YwJstmE0T9pJ2UCpoJLtiBMscqvvBxiD5StTo1M+Q/wSwCmi5jh
	qZcCk8TkjO6rS9mGhFfeU6m5xdhNixJjYHk1gUNsA9GaxNeh7kRX0E2vtxj7rc0=
X-Gm-Gg: ASbGncvYQjVzk08gPv6pVndmVCHzgspHZWxv1LUN8sl5JVq0RGeq2m8rmXbUsfNE7tX
	2Lo2bCxKVROD484Vl+X9o0xAzvn0BwOWtyts2mEgNNtYsoAfvItIRnEPI7nUxRotLND9Qyjl8XZ
	Gma2C43u1GFlQDILr7C3OUiPA1Y3wj5pMDZsInNa8JX1izH1LxdrbenbCc4OK0D9tfLl93LAtBH
	ytp5ucxOlgJvhPDApu24inTsU0pHBgO5NXrbL+3OYecR2zJIO4hqRQP1KfytIGNBySXeNyp4TIv
	E9vUtBDo0yS8Heqs/bbZCuDMB8ZJ0xCqE96jJP8X28es9ptoLYtgcPCK
X-Google-Smtp-Source: AGHT+IGfBz/Tbc3ihv0gbUFvVnQ+Ik0K5L560vpD6awXQAxP5KkZBzRejgIatspUJzWM+LD8gckAfQ==
X-Received: by 2002:a5d:64cd:0:b0:391:412b:e23f with SMTP id ffacd0b85a97d-39c29751a59mr2180684f8f.15.1743604598316;
        Wed, 02 Apr 2025 07:36:38 -0700 (PDT)
Received: from localhost ([213.215.212.194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b662850sm16965019f8f.26.2025.04.02.07.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:36:37 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 15:36:32 +0100
Subject: [PATCH v5 1/3] arm64: dts: qcom: x1e80100: add epd hpd pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=726;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=8hS6GfBJNXR0FuahNdWaTupB+X7huKbQP3wOJFPU12o=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7Ut0tpiNwg8/a9cbIdQZJunopxaffChO5bBV7
 y8mLRat166JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+1LdAAKCRBjTcTwaHBG
 +EgcD/sE6Qds4MJdJXtaZcqzeDVC60vw8sK0/fGKt8X9MiP488uMAh8JT0+bLt14Tilx5sBgj+U
 HvcgrTD5qU+IZEAkRLIo7I7tGxJ0/WhXa4IBHsqKXaRz+CAAxIPZXkexTO8HeFsRzRb0AJWNkd3
 JU9IMBVgSU82sYq4Ya451T1ReBHNdwff6WX6Jb6qbfQO4p6R/0bS+ntwj8fRrcmNBlVEHn3zs8O
 0TbIKDbHnDF2CiaFdeSwBKAoM9WbymDcOqOHuHXjEDL8Wcdlh1OMM+yy8Kfc35X9IIiLHcf4TJF
 IgiRjP307m0TZsBp4wApqpQjE+hmBs29HYiXF87T72y3Gx6fIy1ZAINGawxX1yRqhMQ83Q5g43A
 C2Lxt45Gu2sZcOCrXVnttCvA4i66Ov8zyYM76Nb3d2fVLYi5N0bl7OeHmHf5x7YqS/f01e0wLoK
 L/9pvdl5b4NhCrgkuK3HfUb012E41/x/GeCKcB2L/lZsYqjfNJuj4gBhlmoSqKGEqBujbbMXr5G
 GiA0/ojdeHJDNVeuXXizAmahLTPdtdjs2I1y71L6Q37fmBbw3iEQ957rP1Cv4dtFOWZPTb/TpHR
 ANbGjp9m0UMyglMTZlYYafPEYsa6/fqLuRL8ZY9Iwh8utU1yfak2XMkUwSjY6pLZXQzGaSCOalJ
 11J0TLAL7pkEofg==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

Add edp_hpd_active pinctrl to the X1E80100 device tree.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 46b79fce92c90d969e3de48bc88e27915d1592bb..5b1b80c445404fd02e9f6e5dab207610b03ff9c5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -6389,6 +6389,11 @@ data-pins {
 					bias-pull-up;
 				};
 			};
+
+			edp_hpd_active: edp-hpd-active-state {
+				pins = "gpio119";
+				function = "edp_hot";
+			};
 		};
 
 		stm@10002000 {

-- 
2.49.0


