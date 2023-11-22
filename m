Return-Path: <linux-arm-msm+bounces-1487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAFC7F43D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE2861C2091A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1121F51C20;
	Wed, 22 Nov 2023 10:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u56868xc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A774BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:28:28 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-548d67d30bbso4220073a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700648907; x=1701253707; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Y2cUlQznNW/NqXaTn6bVdOB9INVybAfZi1QfoSjsZc=;
        b=u56868xcitnMO3m5KUd/SlVRJaFbE1KERG4hA2jnb0jEq005C4Ckjxj5iHI1SwENSK
         sjIj7hpJh1aCxJvlbNFl5xJFzpLDjnKwjPMKLIIq/54XtRQsetcMxj2L1Qb8MhcQw4y8
         kzZm+1wXSguR1kdVTIp+S1evt0TXMj+duFBsAYvqbOrmGFxsIodcFSET/qGlLbI20+St
         2v+hEQVtje389QiTZ1/pTgvhw3KbnQUJp0JytIsp1fH1H8bvo3gb9/W6ypgrafqiXi2V
         YtsSnDJ57OqdYnj5jqNDp4KhKzNOt2XkPGkZEgVmn1KBQG4esEKRAoEpkS96q5FNk8Fo
         LQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700648907; x=1701253707;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Y2cUlQznNW/NqXaTn6bVdOB9INVybAfZi1QfoSjsZc=;
        b=gvpNZ/3X6s3ZckqwIWfc4O4YpG7yktRHZ3v9U7ioBZ7RQHDb1nwrlzfms8ivgXOl7Y
         qH1sCGKeZcByBRxWQlPsuQkSdhuB4kL8YmuXO66COlYL8ZxOvYwDVwAP7Abwjit7zfCG
         yG2vGqvo2Ylqb0wNYGwUNFHDsHklj3jNqdVqjVJgZvg8pxskKiNmJpf4aRL0t6KaArcq
         gDD1jYm6eohoVuFZHAMVXkcvAm/TsarTqUx8jhWlyrOeCBXfK2JW4ATh7mCUTsKUsye0
         IFfF9qmvtOFg9r3w8iOIdU6ZEaJP4QTBD0zxsRP4g9cBEcmqqcfVIrxE9+kVS5DJUaiF
         CqtA==
X-Gm-Message-State: AOJu0Yy8PTAQh4XhsYY7d2TZpf/QCReNgLAL546Hu7ozmYOJU4J1O41U
	FKSMHgSSOZ2RaCG3xvm7cjcYCA==
X-Google-Smtp-Source: AGHT+IExHtT9eA+AUjQnA0C6usQk8pMh0voscLo0x/seu47pClk183lky4qcxkdaGB4Sp57tpqrDhQ==
X-Received: by 2002:aa7:da15:0:b0:53e:b8e2:1d58 with SMTP id r21-20020aa7da15000000b0053eb8e21d58mr1461950eds.13.1700648906678;
        Wed, 22 Nov 2023 02:28:26 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id e1-20020a50fb81000000b005488a15b25asm4325139edq.70.2023.11.22.02.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:28:26 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/2] phy: qcom: snps-eusb2: Add support for X1E80100
Date: Wed, 22 Nov 2023 12:28:07 +0200
Message-Id: <20231122-phy-qualcomm-eusb2-x1e80100-v1-0-ce0991161847@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALfXXWUC/x2NQQrDIBAAvxL23AXd0BL6ldLDqpsqGJO6WFJC/
 l7pceYwc4BKTaJwHw6o8kma1tLBXgbwkctLMIXOQIZGa4lwi198N85+XRaUpo5wtzIZawyOt8C
 e3TSHK0EvOFZBV7n42Bul5dzlVmVO+3/5eJ7nD/aHoeGCAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=642; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=4wqZFUCMLyo/q2U0vpCyW8hEFCWYvI1+WaIALg7qp7c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXdfCjfvLyEDAwU+2vONS4aHPrdHnSiV3uyzRx
 qwLgmI8+g2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV3XwgAKCRAbX0TJAJUV
 Vg9bD/9hbHqp2GelxBmOmtRUGivYdjz2sBkc63n2PGOWmWhhMNG/Dpc1XbJnQOYp3sTMQFvC8/9
 xwdFhG5WOlgsUnJBO3KEW7OM5Vm7Io8B2PqI/IC3QUOvaUjJvkpoI4GJe4o2kB8NKB/6lDYA7s/
 ll4wONv64w3kKrAVBanc4KlRp9UqpTxHOzGlkv4Xow5y+/ApbuywHsc5iIBfdxfB3pd5HtOGaGX
 ffFatLUkCeXteTNQoFmhXXuIl7qlzHAJUNTRzB3hZPwp08bqe5bt4Zj571zzUsgbZbBGvrO0ckE
 lwd/JK0Xp1RPBGkwHF2K4Mwgs41qlyhwY/g13MIMipbuQkhAYay8BTlJbMwxsn2VuPQaX5XGtvk
 /Gwn35NMi0WF3jbYu0bAzt32dOu6uY2qE0dWmxAIM8/Ok1AHnvYrstQnG8TkyN35ZvSZToyVv+D
 tAOVK0vlrwYwX8LR4mvbjXiT7mHWKyhhdwOpPELGZs9IcvqnGc4hmI45wlLuKgUeEkw56EYEF9G
 nUXIPNpU8Lh0eeABUD7HgPS0rw+hwngiDJoXUhg2Op61lka8tk5wicb44dFUU0X5TaNF4agskuI
 yM4Tk5SWEBhW2wc4lT5G8GmrX0YOtpdoGjtTYYjDjbJlFUwEUW3pJlxN08GutIA+l7IBOEHmwt/
 j25xKnbDe5xGbmg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds the compatible (and documents it) for the X1E80100
eUSB2 PHY.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      dt-bindings: phy: qcom: snps-eusb2: Document the X1E80100 compatible
      phy: qcom: snps-eusb2: Add X1E80100 Compatible

 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c                     | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 07b677953b9dca02928be323e2db853511305fa9
change-id: 20231122-phy-qualcomm-eusb2-x1e80100-36dacab8fd52

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


