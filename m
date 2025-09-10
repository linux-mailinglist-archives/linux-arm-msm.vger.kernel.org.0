Return-Path: <linux-arm-msm+bounces-72915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CA0B510B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 244BD3A8C3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B03311960;
	Wed, 10 Sep 2025 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f0pf2R4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA2D311598
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757491676; cv=none; b=ko0Zu0f4y8nDKxWldSbHoLadVbPDX6TXCzkTiLWH+c4mhS2lc4Q2q3n2AQ8ozaMwIhpWtoeSNgeBVI93K0xoTJQcnJcJY96OsBXe0bamnlHdM1Z2vgLUIpTn4pcl0uJ3vHdpXC9OGvUEHbLgEGXhm6Qk59SiMNWMiNyq1a/JVnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757491676; c=relaxed/simple;
	bh=fwsfkO/edNU0K9G/U0ffbwq3ATl5oZ4mal9F1JcWMmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SO4ODyb/SfpkVWeB4ibGjTbK9t3DpaI3q9+Dd/lgCJ7BjJXoUunTi2RoINVyGpiw2sXfdhuMSMHXWn7n1tCrLuAfK9+Ib8SjmerJWDDmQ5Rjz4mrhukpJ6xdnZv0oncpu5+uHoGy+hg4TckDba0SIFmDJvAN+FgoPoqrCqg/WWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f0pf2R4c; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45df7cb7f6bso2440275e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491673; x=1758096473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
        b=f0pf2R4cDjwGxM7o7+PN8nqd6iXaga0AC5gG25lOvNf5ENNCenTKpn1eykQqTNg0Kg
         BSaHyDd7NnEw8YfB+H3Nu4uv5NQ1XV/d3Zj0TT4RpqODF1JaewX6K8R5OnxtLUO/b9u7
         r/VbE6BVvF73dKJcXraFSnHi+/0YFOpHz5nYCuCbKpU+nFITKI4+Qrw1yxmy0reX4+S5
         Ia+3DSmubWWzxck+DfcF08v1Z4uESaIiRqFqLkrQtRvtvW98ufrqc7g0zSIiWV1qngwS
         ZEFnmYmLspnKAvDrURBXP2QPzjz8z1l8TW0MaKBXeCzkIf+qrhRfzkVAtmHmXk4vFcej
         xYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491673; x=1758096473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
        b=F5C7qROiM4hpp1dPcUc71R0WnhW1tBFHB9BDnotmF3d4BQBBSWQEghktK+0b1R73jQ
         LPPL+Z3lU1wuPYxd9BHK6nzSOcSQCbJO+Cfh6QvJ1KAXuVVc59L6QQoiqnF7CDz4gJtm
         dyUbS9Ny8ubz5r2bJI04o43ta7kUMK9eLaXRy5mqjZOd5XE8WJU9kv56ExrDqZvIRN2p
         yw5CZZY1WNmcYU4ly7eEpCvZqRUgKhEf/CgbN0A8xdgWva9p0regOMmQC12zM8SSBR6p
         FUDSetwlnz7LX59+72dePVUO6prCwIgObyqxNB4rOG4NzckeDCmlcKZIJlFm5YOZQ3ht
         1Lnw==
X-Gm-Message-State: AOJu0YwuuXiaQm/tnb2UKnZN9Q7mZj0gNHIXL9mnaiPVdlgIn/yfz4Dw
	6LOE6OZOgYNg9sZ5p6Y3kBq0zrJy7qpqztV46u4vbrq0KJ1GSKoBQ7SNqtL0LJ0bsH0=
X-Gm-Gg: ASbGnctwQ5Qpj6IARZCM4sVtOHgQ6Kiy+uLrPEMVZoWdWitB0DkFiDSK15onuoGNwbX
	y0sVmRz0EX1fr7QGhfvgxe8lAcwlof96WZAhEx6j1f6lQmImyjRnULnzY/IriceGo9OygYGsr5j
	NLPQvS28XCJS/nGIcI5AHQ0ZPHFmpMqNgpZOFrK+n5lW1FQ9sj8hIkJ81s6jqJGGzzfnLFeLXeH
	R/MPnHsT8V9kCeciWRd3DafYTxPXZ/aSq3AOhYWw8V9LFHQKmUrxqJQnKDfdFLIVBa+vCTvhF3H
	qUAQIYF6fc/tjTQ45XR12zEFLPbnOHiGGVJbULqiatxCYmAaj+q/M9WIo1N0qgajD/jDbfiWB0O
	y4lzptEn9VjY/T1rsiJO0egp/mti3
X-Google-Smtp-Source: AGHT+IFjyHooIgPzsIu5mjEBNXpXbM4EqzCxFwgK0R45SY2NiW1XrpvBRtE5XdvWfXqw4HoOsFUisQ==
X-Received: by 2002:a05:600c:6305:b0:45d:5c71:76a9 with SMTP id 5b1f17b1804b1-45ddded7652mr141100805e9.24.1757491673453;
        Wed, 10 Sep 2025 01:07:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:07:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:41 +0200
Subject: [PATCH 4/9] net: stmmac: qcom-ethqos: improve typing in devres
 callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-sa8255p-emac-v1-4-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XKd4Dvzw0ejsOil4omJOz8oD8d0/SZudynnYpUwSWG4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHNFd6+XtHbiUlr0CBiyUr3sDo3TcopvUbxA
 Cez11/GZEiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzQAKCRARpy6gFHHX
 crSCD/sHgzl01Xm7vNRAaVRSRvpCpLopzb9hsEChofm4FjfDYUIcvTtJaJuDjU3XhHdNDwZV9Zu
 Jvj61hgts5CXRzx2EblTpQ/3DuiqYeDUlYoRNrKZ+bFnX5AXAVq/TA2zOzyXsWrNbUAaV1gNLOz
 VTz+PAVZGKpiWFDBpYusQE8juIR6bh0tEB17WWbbhZV6l0uK2fFCvllZG1nNk3SqJ5qG36efTPj
 /6VjOG1kimbc6GRwk5dLbYporMJimuedb5ycfMKxPqv+u3sJ1GTEbnxQDx9BxF/u562rsqfxazv
 mXGxtvtw56tQ3NaUCvLlWl5uxCMVhqV+jt0c8yiUxhssWPP6jK9r06eAybsTAVxChagDzakxs01
 n65RPiOgqoEuSqlYQpchL/l6Vjst4EKT/9xb/qi3pqlJTpBqcSyxiri6drcKDGaxihhe8w8gmMs
 sYLzxlL/oqpOYFfhL0aeFEA1WTGBYIeYQwsezafFr0CpNawRbrT5V8AuBRhSVZkNelEuFmYE9SI
 oAXG5zUxUzYb6LOW9qQ/LhFF6/plZCYbBsZP4cWXfzas3rXBaTecTfEcRctYXDXFmc596Gy3CTw
 eDYk7Xqxz1uDVEZOr5HoOdY/3M6E7CBtmpvBdIIMuVmWW43k8aLvjHK8ZWqdpWkIQ7ijqwOkMFM
 DCJTB/f1x5kcYUw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's bad practice to just directly pass void pointers to functions which
expect concrete types. Make it more clear what type ethqos_clks_config()
expects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index aa4715bc0b3e7ebb8534f6456c29991d2ab3f917..0381026af0fd8baaefa767f7e0ef33efe41b0aa4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -742,7 +742,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
 static void ethqos_clks_disable(void *data)
 {
-	ethqos_clks_config(data, false);
+	struct qcom_ethqos *ethqos = data;
+
+	ethqos_clks_config(ethqos, false);
 }
 
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)

-- 
2.48.1


