Return-Path: <linux-arm-msm+bounces-55628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C1A9C845
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0A827B561B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13D8258CE7;
	Fri, 25 Apr 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zIAtgyz+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3772580DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582045; cv=none; b=U/lrcWvPrb3oHjcA9M271cSeYPw1/6F07cj/yYnyid88ztOyPdu0yenbAfmu5vEhcLDjhcRk2wiabUvsr23v3mojKxKiyFUahdjqPRhWxchGkFR9NxVctiRj5sn7jX+sBDKpaPyuOx7AG6Od3bMiTwY006D1+hd6xOTjj64CeGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582045; c=relaxed/simple;
	bh=XeLScYN1m0ukjFgUD/1D7cLPV73HY95z3XyksonqFU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8IAB4ZXWQF3sWBcIiKVVG1TQVUKvRdsd0sWHkoZfOc8knoc81JIwgK0qChp8ynyJP/L+lytvlF+UoCus09IDWIsKsippa2Of6gglwlasQbA5tuty03DDJwWaf180r3qxe+mrHuBUR6GBCCophct30K8YclPtOvvtVzrFkqK4S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zIAtgyz+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb5ec407b1so358902066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582042; x=1746186842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5p8Y4tKvhmWdEJbi8Vucn1osV27ys6A00EvEG0UdIw=;
        b=zIAtgyz+LAQo1CYtBiB/esImFaSmFbdAKFrr1H5zoB6BTdelC785RBfiGM+s7qbN5b
         gsPqq7SB6IHBkOLP7n2cKTfDoOpINGBS/QUQIM8Sb0rN1K7QTohNue2Cb9z34CT9aavY
         6vEVDccu8eLdFEZOtP0dPw+KZ71Ck2g791dPpgaNZFsXaZRqOKzdkr2hmnj6M3GU0j4g
         igYg/G+WJrxZGEKp7qXmXW2p/RePaZ/XShB9ux0kqeZKkfA2jEy7XFZx0KuJrWF1l1gw
         eHvPmr1fOUeWHExp6pDe7Um6ovh6sNUhBy4Bw5qaYWnBFkAxMneHiSPn/qD+K3MQU47Z
         4GHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582042; x=1746186842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5p8Y4tKvhmWdEJbi8Vucn1osV27ys6A00EvEG0UdIw=;
        b=C0zHhMzGkX9/kB40wL+/bdp2w2T1ZU5rSX+3iOFQVWmbSBohEaiRGw50fJOdnZZ2VS
         6PG/StsyxJbHYQl0DakzayDYPjAjzg5zKENIIQJhE2FzU/yo+uKP+rdbGSQvk5D9eudA
         cNy6AzjP6CnV01KmODCoqGVQt9SWZthmnayn29ckQuVmhLC465gHqfxcty91gntajkuv
         /ystemrbU1nXqH1BhRSerzWs3UARdd1x2S6N3BBYM2F5JkbesoXeTbv/tXtrpuTBF9Ks
         xPIqmaziOMCD/5AvVmaDs0vq9ZHdd2EMLwbLk0xD9ewRQ/teT6RuyGghLmsb6u7zK7n9
         +IcA==
X-Forwarded-Encrypted: i=1; AJvYcCWlvYbQ+gGktUadoFEb8oaNDvV/s4XovPOSDM95GLxghMIrvTMkdffzPcc23A/pv/C1gHSdUbfyvUcvUxq9@vger.kernel.org
X-Gm-Message-State: AOJu0YxUSoCGNXPjkMjQtq5Kjwym1/uwaNbqMvkAssKcKji53j1BlAQf
	5w6CqW1vcCQY8Ha+4YBemvX5fJiYGphx2DRZ+6zk0cppsgh3RWj7hWx3eCkHG1k=
X-Gm-Gg: ASbGncsxFdBaPjnOpMJUO9nyB4HBUmliFnnA8RsyIvf/z9VBTFIt2pBqnPYLIbcUc3i
	uJWnXqjC9ijhxt7LAOo1YjeEiIekWSd80KmcWqzOi0JZ2SMw/pNEkjQ0/RFHZ57MkTdrVG0v02X
	BcW/wK8uy3FAkWr4nJA8mT8S25XeOZQJwgcIETiPel+FKnDUsTDQplVKXrRA1hfICht9Iw/Gczj
	vJHwuoB6ZI2Xegy1Rt0O4FzCv7PQZ1H+zPh15V16xgpsYOprEVjMn/OzQHssF86mo8OnpW9rGoF
	h7yyjPGyvJPe/G8lAc3hGVXWV/awKGKz4XGjNOTHoE79sifcAzFL6k0zeH6jUnusxx7XOY2mAnc
	gupRVN+y6+uOhEv7yJ5vaO8WwfT+FE4V7pm7L0+o/xt7no2jID3eqo/XA
X-Google-Smtp-Source: AGHT+IHXVxQr9EKAcQoitGTUZluFbCx4sSSzrFsb4EnuyIfexq+vDee5puKelJFBvsXZN5mVWwwbUg==
X-Received: by 2002:a17:907:86a7:b0:ac7:7e3e:6d3c with SMTP id a640c23a62f3a-ace71425b3dmr210673766b.55.1745582041986;
        Fri, 25 Apr 2025 04:54:01 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:54:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:48 +0200
Subject: [PATCH 09/11] arm64: dts: qcom: sdm850*: Use q6asm defines for reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-9-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 6 +++---
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 7677acd08e2d176be932d3f726fe5602cf8d50d1..3b28c543fd961c787d7e788995f8fe0e980e3f68 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -612,15 +612,15 @@ &qupv3_id_1 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index d6d4e7184c5603864668057de79c7497ad361ab3..a676d3ea01b997ec9663199fe04a230aefa555b5 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -425,15 +425,15 @@ &qupv3_id_1 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 

-- 
2.49.0


