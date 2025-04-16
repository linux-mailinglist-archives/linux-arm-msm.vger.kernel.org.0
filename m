Return-Path: <linux-arm-msm+bounces-54575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C61A90F86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 01:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A31AA17FB74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 23:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7730324BCE8;
	Wed, 16 Apr 2025 23:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k58AEY3T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FA8235345;
	Wed, 16 Apr 2025 23:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845834; cv=none; b=YEypM27YwfOwMnGbgXukvWU62NMRZ1kr2e7cWgsQTqx1XRPAMWc5CDkgEI76g0JEcyk57e9AmidEamc93WouNQ2V4+ZamyeO77DTjWmYI3cjDHNhVhJcIamGI9EAEPWDb6R0YWi2UaMBxWlfDAKUCkNGY3jMjNRaHuK84oduL6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845834; c=relaxed/simple;
	bh=LKTrU+sgU2OIjybj0utaZFM0waoa3ItskjDGTcF6xOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4UNzr4qFLPdjkcPilA1dmzGrhWjPXV0DJxPkSEY3q/dSN9CHddvE8v2fzvvv+6+VRMc3jlcr6Xh56BoXgaCtqbrMWmXU6EL2dQpbNiA/IS+USedS1mUtmr12vYv0GEjtGKI32ysysRJCZFzMV3zTZ4MJ188tInaMe/KfBxSet8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k58AEY3T; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso1347465e9.0;
        Wed, 16 Apr 2025 16:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744845831; x=1745450631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjHXYMC7zHygZVzVtYT+NoerxDkgqGuxQiQmQIb1pA4=;
        b=k58AEY3TTP3sJHgs5W/4iVg72VsTxYbZRJCLOk8imxqLj/PM1PQxT/4nbm79zYiLCv
         X6aN2ndEWO9Uv2XvKDvumsYNGm8PjAJWZW2mocU6rB4VPizAOJNImWDDKK3ugweyNEsw
         oMwxhkG3obsHrKkV05elxC2Gi0SIgz4Ju98/4duO8RkChOGru1ANr0dJz0s5CmT9kTYu
         u4gj81+M+v3HkcD2rBkITZp3Ldw/zLoWVC9uTgsffnah4bjw1+6opNVle6lgAeWmMG15
         GDAfcH/OF861QyAxZIQGjAoY4Hhbk+R1o+kA+Pu3UBHOuvVxANELkIXNidTCBCSLGent
         KaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845831; x=1745450631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjHXYMC7zHygZVzVtYT+NoerxDkgqGuxQiQmQIb1pA4=;
        b=Hg3vMxPiN50FTqKOR0IdmUq+MLXFtXHEcuHrdMcXAaVCknyPus1iJmRvk0kEZQboeB
         aFzA4zDA14yeWfhcArFzOiHA0D8oqYwhcF0K1H0zDCaueZsCloRa+Z25goWsDB6U88tD
         Jz59N9gVjtajLTPdb3PbscgDLVYYsxmfN0xt9zRKGtbXbVB+GwTFiV1LoMqsStyW/ft7
         RlFX9yxcjCukgDOvKb9tsZCQZEjmL/GP2ECEYp5jrMG9PHnFdmpqtO/KmOn1rB2CGzxG
         yIT+hNBTy/GA86Qhnj7NcOTPOvQhAgmc5mMv9y4gvbv4Kyw6VUGzatnz9Wf/yq4YbA+i
         ugPw==
X-Forwarded-Encrypted: i=1; AJvYcCUEbelFsMfGY8aMD54LtlMb8xt/l+l9kA9PGc2XYKPyzfvGx22B8qM/ExiH83sxuju9i5VdGtPM34vxLKpHgQ==@vger.kernel.org, AJvYcCUHYJ5ef0QsqvYtUxDVTkGbErVkBuw1eExqxwH6UwYO7eibqvich/9STPL7GzFHZCs3wsv2sZlrRjvjzE42@vger.kernel.org, AJvYcCVhgxOgaPpNmnTwXEiDF5qrWIylCxqFPo91D5Xx/tFPniUuo127Sh2k5vWV5kPCBAkRDRGXnMH38ncq@vger.kernel.org, AJvYcCWn/0RM8hehKAzTpk50UZB+SHhZ0U67rOEEdcpPt5/SZSi860tB3IgArTp6OsU9eIxDogGtON46bIm6@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/ND6NDazrT1qRabdcwE0TPwL7nJgubL634NCJfKoCOqwGQem
	p5ysGq5nkluFe2EdpQysrFjXBJa3zVKNVEj8ROa35VcU6SwKdks=
X-Gm-Gg: ASbGncusXunLIWa9I+xZyxpZwieDm2aXiJvt/Ee4eP/8hvpU9FNDV2BHSTBPH00eujZ
	RC7T85gN3LKzwfF67O7lZ414hSsHW0ZKyAV5wCyzwB8Rkqnfxyh94djL5DDIApqgOATwi0hOJQd
	hA7K48kIItm20AA68Pzq+SOvYrrA4jWGXLrjqHKawzvDOfkv8f+j6aKbv5vcnt/lgKfhbRH05+2
	1p0VYg/vG5tq+yPA/shNeVxeXa7Bsz3EmdVVRfSdf5no+au009ZpEIlcSry5+b+WRMjd+J8kXgX
	bkZ4aPMWD1CT+flLB/K8+HGVV6f5sqDp043DcPJdt9ve2Q==
X-Google-Smtp-Source: AGHT+IE5zbHou//dRNGvt+Vsme8KKZ8BhiJRDmyZVKFMRGE+OOd3vEs4H5fPDZbFtNhjriRHcXPv8A==
X-Received: by 2002:a05:600c:3b88:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-440636a4008mr3712315e9.13.1744845830281;
        Wed, 16 Apr 2025 16:23:50 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f3ac4sm34026465e9.23.2025.04.16.16.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:23:50 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 2/4] dt-bindings: arm: qcom: Add Asus Zenbook A14
Date: Thu, 17 Apr 2025 01:20:49 +0200
Message-ID: <20250416232345.5240-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416232345.5240-1-alex.vinarskis@gmail.com>
References: <20250416232345.5240-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E-78-100 and X1P-42-100/X1-26-100 variants.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 08c329b1e919..bb589021a97a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1133,6 +1133,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15
+              - asus,zenbook-a14-ux3407ra
               - dell,xps13-9345
               - hp,omnibook-x14
               - lenovo,yoga-slim7x
@@ -1144,6 +1145,7 @@ properties:
 
       - items:
           - enum:
+              - asus,zenbook-a14-ux3407qa
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 
-- 
2.45.2


