Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C64A43F178
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 23:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhJ1VUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 17:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbhJ1VUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 17:20:31 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91841C061570;
        Thu, 28 Oct 2021 14:18:03 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id i5so5345792pla.5;
        Thu, 28 Oct 2021 14:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ognCBoDmFtJ0jDf9zfDBkQa2RYeMmm2YH6+AY/lKCjM=;
        b=lOCqcChIKAD8dJfBjdbwL8TXk5QjcZcv9l3rc0j5+eya4fdOCh4wIkKuJV9HS31xGF
         rrCjQnVUpqpqYv6Vtx8LBVhv9AoBXs9Pd9DRLHWbqKs08y7jgQvI3u2wA3xTLNwM70SS
         jAakJYIRxEaSSAid8d7bOebSAGQgxYbpLjZ4VJ22eKKebLe5RJUwjMadHkCl9pYZ82ko
         9eEA/U7VHmTp2caVUysV98zxsjJj1QLW/526wruP8a1kLXjm77HYX+wDzwKuYeItK20S
         H7xJJUvN//0mvaDI9jB+94MeuFqT5qFdv7Fkc9lCV9rOjQcFu1xL6wLAshp9LEt2CD6b
         Qg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ognCBoDmFtJ0jDf9zfDBkQa2RYeMmm2YH6+AY/lKCjM=;
        b=AV8AyXpCLhxv5OGvs0vWQZw++BS6dtYe9eV0Elz2xr8CIrDZ/sEi3qjZGPmdYqV6bV
         /CUj2br1RpGO6FfAfOGGq5cxEUWmuUMG91qF5gzcxLZH//pkno1Z0zWrofph7H3Mj8zk
         WhFoYV8w+2UqXDR8qvQ7opv2fvwxziS1Y/x1L4nZtydm1MKKpCnXyEWy7stjHeb94gIs
         Fgt0y6d/fV/iCKmutgpcRHp218lzwF/P4DTy5FSrmX+au4BMdst23Xtioj4wWsBVXMZ4
         PUr9vIQBRe0a4b5yhZNS0xnaGR0GGJGxoL0VWYZjMo2Rr7Z/rS7fuHx0EqIPribLX8gb
         v87A==
X-Gm-Message-State: AOAM532cuwo0P7itHEzTiR8xdBAcG2pClKpxzoFJHjR7/68LlrBGsFO7
        a4bZ2kKJvzasEaQZdDrYbLE=
X-Google-Smtp-Source: ABdhPJzrTgJfhrpqGWj1qM5QwUFP0K5QAEpTzWvTeWlrqi8R3sgEBjKhWA41WO/fRhzNB3xO7wtvoQ==
X-Received: by 2002:a17:902:904b:b0:13f:b0c9:3c5d with SMTP id w11-20020a170902904b00b0013fb0c93c5dmr6293241plz.26.1635455883112;
        Thu, 28 Oct 2021 14:18:03 -0700 (PDT)
Received: from jaschultz-Thelio-Major.corp.microsoft.com ([2001:4898:80e8:0:1173:767a:1b1e:f6a4])
        by smtp.gmail.com with ESMTPSA id t14sm3506610pga.62.2021.10.28.14.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:18:02 -0700 (PDT)
From:   Jarrett Schultz <jaschultzms@gmail.com>
X-Google-Original-From: Jarrett Schultz <jaschultzMS@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultzMS@gmail.com>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: [PATCH 3/3] arm64: dts: qcom: surface-duo: Add surface xbl
Date:   Thu, 28 Oct 2021 14:17:53 -0700
Message-Id: <20211028211753.573480-4-jaschultzMS@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028211753.573480-1-jaschultzMS@gmail.com>
References: <20211028211753.573480-1-jaschultzMS@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce device tree source for the surface xbl driver.

Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
---
 arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index 736da9af44e0..9fd9f733a791 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -57,6 +57,12 @@ vol_up {
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
+
+	xbl@146bfa94 {
+		compatible = "microsoft,sm8150-surface-duo-xbl";
+		reg = <0x00 0x146bfa94 0x00 0x100>;
+		status = "okay";
+	};
 };
 
 &apps_rsc {
-- 
2.25.1

