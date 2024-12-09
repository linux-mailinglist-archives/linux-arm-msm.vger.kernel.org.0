Return-Path: <linux-arm-msm+bounces-41043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1DA9E932B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B152165588
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B872248B8;
	Mon,  9 Dec 2024 12:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BndbPVXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F37221DB7
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 12:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745674; cv=none; b=RY16TYBqBjrQ3IGxKOAnSbo1LVmlIJjqx7PGMC/6V/7myYpp/Sg4DgSUAJ4vKR9dnguEz7p0b5YPuPJVpDFRSQ5hspz025dxNSQk0uQQE2jJLUEAblhTZlnttqFR1AMqHjWG/L2ALFIBt/nJxjljNX9m47POCI7lWWRDZxZkXlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745674; c=relaxed/simple;
	bh=8pFX+27nmjk/7KfdfuKsPNR83Jiahya68QV//JkHJU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fi49lMOkOKsBZzMhFONlNJHmY0xEPghGVR9aUdjV67TCqscIbCdL6VM+M3QzSrKy9RcDZuRRdhEYIH5KVdfmxDACBUrlGeLw3mt7idL5r9v9dSRR/83yeCgrDFLSpfmbCC7ZSoPhFvqoTOQJ0ly/VNRmwnzvSMITeIKOzdcUZ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BndbPVXi; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa64f3c5a05so359832766b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 04:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733745670; x=1734350470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tR6QupvutEPi+0B6/genbHIfRkFvdzSANWIhNibRjA=;
        b=BndbPVXiWkZ2Hymlx4djmvk3gopkES+g2ciCMtH9KuwLm8K+AKenJwUnTmlB/GOHGS
         wMonUq50IRzSn65wKpPNKm98Aq/INhm9tZQp9EMohv2B/OYFNPS6tpm/m0rGXSMckI3l
         6QvvheUI4ft+hvwcntSi7r/aOghQMpsNiQdcUwGVNSbM1YM8a5SErFyLN5cNCcntNJmb
         U8OM2ROcxY1oFdHvdXVxMBNbeoAgV0vi0B3gkYrrqhxxa3PzJOps2TF0xE25omtiNzRY
         R4XD658MZRpjGFdtaRVlxnfoNX2ApzbIHHKesmRu7Xg//cK7epW8/LhBUnjftgwoMW5C
         xRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745670; x=1734350470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tR6QupvutEPi+0B6/genbHIfRkFvdzSANWIhNibRjA=;
        b=M0r8qH9fiD+tXQqrmPbYmBkRcPNb80HAkEhO1YXtHv9Q2p9gh0WzhrigKEyFza5+fW
         iXFgO3i+n4LaKTPx47jcpNEOfORaDRoQ8lLXj+Z3jig8/Rr2OIQY0zuPrOpsHOIKmd5d
         qwFF16KkfCvl0rjtMUCkelwRYUUolGCIKBkkblcbgtmPEepDdrIemxWQWW0GXebTy8A8
         xEg52IK8MmmhbECGDrQV9JM+yFZr3Jo5/0mevSgXbXazaOeRlYjyV+KRlve7a8vRvTap
         9dIQAEdAQ2a+XkOsGVpfr/p4W0zF0ipQCYcNyl2O8B+R7C9h84wpM63n1yhtiYrkAOPQ
         gJ7w==
X-Forwarded-Encrypted: i=1; AJvYcCWcGaMRazILIqr4Vb7oPc2zXKhOOOJAeGtKA1wIp85i/vKMDYwmqC0oq9JXBYnemvT4r3SVPKSRwD8lbQm6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/mG43JVXrcQlwn46ail8tbE60nf/7puo7R8mWaPfEgmrbreeM
	dTTPuJHSIeZEnSWnfc/5xfKTtHC4XC/wNNPDx0xLLnLfvGgT0kqstY7ld0W5fJ0=
X-Gm-Gg: ASbGncvjXsET+ulExvVctbpVToMEfjoXlOIZqFIAyOZG9LXoPzBmdPwokjAxBA7e2qz
	36u6mE1bUYO7KTqjHnLuffGaGN6GuhBXuq/BvHuO2ZpCj73mtP1vzURijbnzlVLnXUtNDNA5MCv
	1SLyrSfeHGNSiHMq7BWsjcnIf3L4x174gUcXfNQ5/OHOAj8IsSl0o1EFAnSSnA4QQ5cPNOirCQh
	qEONhhgn1onmnwqeDlZCAjswqE7+LxfyzGt3tqsJR8pSuP2gJKRb6/KC4BL7jyFOqs5ZgX7alO6
	zGgl09n6r8n6inAAnxGEbC2IpAj+mXsbGXsT1/O1WGwaGFn7kk983M3T0QGtJxfR7Q==
X-Google-Smtp-Source: AGHT+IGCASHop4+PMr/ElwoRqpZmRPYooFBqBNoyvG1DRpnbL890d/4qkOvn0rbSSu4AIgl1YOMZNg==
X-Received: by 2002:a17:907:aa6:b0:aa6:945c:453d with SMTP id a640c23a62f3a-aa69cda0d94mr5001966b.27.1733745670385;
        Mon, 09 Dec 2024 04:01:10 -0800 (PST)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69afa395csm22555066b.71.2024.12.09.04.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:01:10 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 09 Dec 2024 13:01:06 +0100
Subject: [PATCH 2/2] media: qcom: camss: Restrict endpoint bus-type to
 D-PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-camss-dphy-v1-2-5f1b6f25ed92@fairphone.com>
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
In-Reply-To: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Barnabas Czeman <barnabas.czeman@mainlining.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Currently the Qualcomm CAMSS driver only supports D-PHY while the
hardware on most SoCs also supports C-PHY. Until this support is added,
check for D-PHY to make it somewhat explicit that C-PHY won't work.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/media/platform/qcom/camss/camss.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9fb31f4c18adee886cd0bcf84438a8f27635e07f..b99af35074cdf6fa794a0d2f0d54ecf12ac354d9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1855,6 +1855,15 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 	if (ret)
 		return ret;
 
+	/*
+	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
+	 * D-PHY is supported in the driver.
+	 */
+	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
+		return -EINVAL;
+	}
+
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;

-- 
2.47.1


