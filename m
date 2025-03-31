Return-Path: <linux-arm-msm+bounces-52900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22343A7707E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 23:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8323F3A82BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 21:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD52C21D595;
	Mon, 31 Mar 2025 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKJwcbLV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E121CA1C;
	Mon, 31 Mar 2025 21:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743458251; cv=none; b=idAKUePdXwauK3Anm/gvhO8qLpJ70z856Djj5nlV71gfU2pbaLmHNXKjRpGTMBv5ikPpURS4MJrk4S6j+IQjA+Gg4Il5ukZTlY9JyLPZmcdLvEbsHz9BeAmDL3+2ZVuKJCdqK06EF5gOFqjil3YNeGcOB9DQ/3HiYw/zi/wFfKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743458251; c=relaxed/simple;
	bh=TFtsUrFjjXHsHaj97u5rrMekhI5YNPA7+i85guy/YAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/KZIEcZ2clGGnOVy4a8WXwp5vFBpM2VfPhwrY3rKKjSYbOcWf3bs45Fo+uLB7ZaoqRxabCBYhBU61Pp/UF82wyZ4mHQX5P+V23ox/1eV6G3mYUm1G9JrInVZ/k/DIZQpq1dTwCpDVLRryZglvhwvPlG9tWKfwg25BMuQcaKE9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKJwcbLV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso4336418f8f.2;
        Mon, 31 Mar 2025 14:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743458248; x=1744063048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XB+IpvNXP4xPCe2AwPYv0yQS71znptNuidXAeoewYa8=;
        b=RKJwcbLVDb6/1p+3vzbiZCscRSXANurywpLmTMbSJfetn/XyJ6WvWSWhU2ZWCTNfd7
         akgUSV3kTSYhUXwXaV2P3TofwgGurTSu5YeEVpZAjcA0hTmWIvwcWbyHp7RT/TsxknLL
         3X5CA0gNkMREsa+bXiTHOJf27s7eXiNJG7Cj2JTmXw1N+fdY3LEpnJPyIUKlkfZQpHCi
         X9dEmVN1+IoV/JCNeaUWV/5O4yoKwprWEflvAq3qLNLdC7I6X3Unf/DcKxPNaIS2/hHK
         A6NcptO24cTc7fXj9B3NHIXfGIfuyFscMt2sjroXCjPo+gAdyMULn3g6I/P1UnBNMAu+
         ITbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743458248; x=1744063048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XB+IpvNXP4xPCe2AwPYv0yQS71znptNuidXAeoewYa8=;
        b=JC/p2AYwQoEWYOUc/gtK7m8iGRAqtLS6OVkYRBTsoDKJ0SH8Yu5WGerrTj02kNcE1H
         vHj3Eq1b6C2LJvPY45+fieAJZJ4E0FDTL5/QpuEYj8IMjtPhKYUNsbSP4p9WU/gyXfBp
         iziqAE6cJmPYWSLrV/n/v6a9/vRYUPcRUWoJMjeJa7kk5z8dXD/Ve7tjWQ5iHEbDQ4dr
         /AEFm9rqt69DDX+XZuIqBU1laqaW+Zb1LdCvufcTFTuSLPYYcbgsoQ9wET2CIiFnyOpW
         el6H+GEoAm4c9ntE4MfprHA4jH0kfGvnhWZ09Wcq7ZYg/WT6Zc+3DRwNELT2mIyBODUF
         hHoA==
X-Forwarded-Encrypted: i=1; AJvYcCV80ZpIZScA6rchSZ+kJJSDLyNSY4q0AlrZP1GrWzIIeLG9ni2bVHh5VNXtiQN7VQbz9O9OiSzyn5aRfbeVyA==@vger.kernel.org, AJvYcCVmiwEObwlohKT0rdbGWa8xJUk+HRpEhynIF3OcotqtZgkONPP4mqf7N4C7tzLnqN0ZYe9AKhxdz1LdRf3p@vger.kernel.org, AJvYcCVsTHDQtCp4vB2oYlXYR1xiesfOpA9Jyc7eJ9Kzm8iVP1FuHi5BOSyRVug0Q7Le3VrjlOQnTgjMWatq@vger.kernel.org, AJvYcCWbA0w1NuIfz+M22AMClMNK6KOkjF7luTL30yxin5QBwVf/p6jSJVR1NYfDdwJtjUgSsuM1LJR8Ug4o@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1+HwZLQ4vpDqPvKsEp751ti23HPHHBZSmeN+1MKddggx4Mj3T
	Cbp38tnqq//X3idNTBXghbLHvJFScixUsFghsBEvXVtitKzBthI=
X-Gm-Gg: ASbGncuIZEhVEPbf4t2KM9z3cI8oNLdOiFApTnDkUaBiI5zGHY0IWVLGWvTVpd62LWv
	zQ05goWwwQlj1945sfKTfWj0OTs3IUXUa1oR8TUkaJf36UNgrN7DgtbM4ur7OA2ing0LWKdyu2x
	6Q/7vuXAxYSDb1m2C8inLok/q9I3eahmXr+RMw0nDhieLoY729bxZQ1riKvbAmgV/LX+HnfrNv+
	C0sfYMP6HUkwfFy3Tm64k/UkO8yBJaOtYUsO/GDHouM/bRbENgHnjFinZRyBu6zwSh5BNwSaQLP
	BqG3AgmzGIlXfGm3+0cl8wgUsAW4noEd6s0GI8XzWmu0G9M=
X-Google-Smtp-Source: AGHT+IFvLmbRZ06og1mik2lf81LzpS0OfBOhnOLsJhSsY1hIuKjxrl4Ny4AYQi8D78Sj41sLBi28AA==
X-Received: by 2002:a05:6000:188b:b0:390:f0ff:2c11 with SMTP id ffacd0b85a97d-39c120cb546mr8918696f8f.2.1743458248007;
        Mon, 31 Mar 2025 14:57:28 -0700 (PDT)
Received: from alex-x1.. ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82a041d4sm182244665e9.0.2025.03.31.14.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:57:27 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v1 3/6] dt-bindings: usb: Add Parade PS8833 Type-C retimer variant
Date: Mon, 31 Mar 2025 23:53:37 +0200
Message-ID: <20250331215720.19692-4-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250331215720.19692-1-alex.vinarskis@gmail.com>
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Appears to behave similarly to Parade PS8830. Found on some Qualcomm
Snapdragon X1 devices, such as Asus Zenbook A14.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 Documentation/devicetree/bindings/usb/parade,ps8830.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
index 935d57f5d26f..699f4e1d9283 100644
--- a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
+++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - parade,ps8830
+      - parade,ps8833
 
   reg:
     maxItems: 1
-- 
2.45.2


