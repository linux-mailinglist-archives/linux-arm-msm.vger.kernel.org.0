Return-Path: <linux-arm-msm+bounces-71702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D1DB4114A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 02:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 752AF5602DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 00:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31AA15855E;
	Wed,  3 Sep 2025 00:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHr+qWnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EC01465B4
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858990; cv=none; b=XQsaFDOY6fuCH5zqg/wlxLKgNn3JehjOTXl7wX+IIY86Io8/f3RA0cjzLNUbDCP5jaqMYAdb/M9X1SQa2CEFFQt46u/a4vFGZIl9GEfIcTYP9LUbT593MG1stD1XpzGuxP5USy0+PtQ0eVeMek1KhUOsFp4DK996zunOz9OPlBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858990; c=relaxed/simple;
	bh=+zLwhXHiWKXvYK6XtyXNEo22hiTXQEOOe3vSK4n5PZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dO39SUz3jbggA+z0eDilj/CqKMsfDEyDyISYky/qlG5Xr6fKkmRicE+imRo3vR9qvFVAdvyM7BG7vEhiU/U6syDU5JcrUo9x9r6CONUPh5e2l2/eTQFnfLgfH0mlgGCCtnsy0hVXfs7kJ/YW/poukOV1wRkZPVxqwC9Zys/SYlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yHr+qWnh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f7be09db9so476851e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 17:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858987; x=1757463787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ied3KyKYXo1OXsMQmpWvwcS5LOsHy9YZp/ZoDS/HAiY=;
        b=yHr+qWnhWrdOYldQSCD0XCknsHFwr39ZHRuL4gZRHFPvgvqTeFxZvNbTEA2ZraIXkh
         70bxQNnlItwiTgHFivHNeYBev+BFuDyHoDMfH/AhWSGO7QRN5UiC4FA3uUV5f7PdICnn
         dtreLeo7BdkHKGfrZCkfKI+XcoB0qurERLxhFCvBjMNbyVnMyn+CBYNH22M3S+5pBt1l
         YNdf6I+JqL8r4K0xS3ad/ZmAQfHPfApg2LJCuJTu3xN9x7ASbTFvTq08xOOh9a/r1OYu
         HfDKsOLwCIuTyUSadOpL8w6bpTpTdWa8rMM/eQbEoOS6BpQcp5xQtBx5+vY3mR60eWh7
         kDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858987; x=1757463787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ied3KyKYXo1OXsMQmpWvwcS5LOsHy9YZp/ZoDS/HAiY=;
        b=nxhfi3iLXDY9ib0PqL0q1GMNJUVioP064DMmoUv/CZ4wLrVsz9Tl4QFNDjOdfAGAJH
         COmTS+BaJKY4bCnLO8QC/b1yqzLK+RP9YVacN9d/AExA4JKw5uIHY+p72JzJ76qrH8ei
         /k2TgWs4G1AfP2V/R+7BZwi0J9aZIb6i3Jlm/Fiq3MmFLto3eBlk22rVyxOwLHgaud0i
         1uI/v2TtASgUdKLdcdKMBUr3dJwopUtzYsTIe9a2Xrb/BnVh41M9wCqozfn2gb1hNgrI
         AOSgL/E6LhICg+6WIlhqGTWSaDeqCP8Pq32cjbIv8Hne9EGNB7ASakISJcAYBpHHXWpt
         ehBA==
X-Forwarded-Encrypted: i=1; AJvYcCVNQzoiUSTbw725MD33AR2O3qKyFEwnIDqIN3BkZnWV9b32B2gWh/Iaq8kH96XAiNuOud5DrzXAkC2WOr1V@vger.kernel.org
X-Gm-Message-State: AOJu0YwkbV5kh01pn6ve++ORJ6rl9F70d7pvgI72nBYm/CXXb0yVTfVo
	CypotoTJuiHjpP7zDND8dqVHAqwWXz/+heS+RyOcW1l2eYn+fhpJNpKEbv+r3Y05E50=
X-Gm-Gg: ASbGncvSfAnPLDjeqbYTR1STS4bx2lztnG2a5dhRHDw4yP2Q2rMoInKDkYj7CK8G5SE
	JFQzXQCzADO1T0uzmY1FV38EsF62cSbjY2Pt3k2sRnTLrWgxgWd3ZDRVVuf/IFmv5I05dt0O/Z0
	qICvg0XrGRu4ALd3lGhdR+OwfgA1WKSuCCTpu3ByJtcY8kDpAxBYKqPcbBswkZ4jqx0PpSFwrIw
	vnJF55cT0Yg6u+CvPXwkcolBUTmnf5E87x9JgZc6ynOAf312fX+mZjmqJFYd+jSaToLf1h7uEgQ
	CaDZmpe2MBFEybB2Ar+TkqgxWbisjKCjnzOKZvTQljKQU0orgBMss7Nggh6pDakhLCeFzDKKMNV
	y62Yd+zpxvf3Tm5Om+CuFfCrEV4Xn5wWytX3lyw8OA0UWfxNc08Lk2uCfrM/g8Qs2QvX/5bVX8A
	PGqV4O2Q==
X-Google-Smtp-Source: AGHT+IFNMQg1OhGMRxFYe5kVq/TMBgE6GTRSJ/oEOASGuZ+aGzm+/sOteKbXO8hlOUzKkQ6+dG64YA==
X-Received: by 2002:a05:6512:220f:b0:55f:4d37:6363 with SMTP id 2adb3069b0e04-55f6af049c1mr2785992e87.0.1756858987105;
        Tue, 02 Sep 2025 17:23:07 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:23:05 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/5] media: qcom: camss: remove a check for unavailable CAMSS endpoint
Date: Wed,  3 Sep 2025 03:22:53 +0300
Message-ID: <20250903002255.346026-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Media endpoints are not devices, and there is no valid or sane usecase,
when an endpoint on the ISP side is an unavailable device.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 898d90410551..42f392f6f3a8 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3041,9 +3041,6 @@ static int camss_of_parse_ports(struct camss *camss)
 	for_each_endpoint_of_node(dev->of_node, node) {
 		struct camss_async_subdev *csd;
 
-		if (!of_device_is_available(node))
-			continue;
-
 		remote = of_graph_get_remote_port_parent(node);
 		if (!remote) {
 			dev_err(dev, "Cannot get remote parent\n");
-- 
2.49.0


