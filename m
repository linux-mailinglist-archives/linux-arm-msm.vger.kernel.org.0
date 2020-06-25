Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24C020A485
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436503AbgFYSNl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436495AbgFYSNh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:13:37 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896DFC08C5C1;
        Thu, 25 Jun 2020 11:13:36 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id e15so4945070edr.2;
        Thu, 25 Jun 2020 11:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pTVtJVVsCF4n2vh1JzOdJd7gCv+oDiYNsYtyRbNOBIc=;
        b=ixlImA06Nr5e01ifqfEEyf6rzECc1Okb1pNmTKLFn0PSG1r0pQtlaCo7SJEq5aLugL
         sFZFoK+daoJ4kNk8u6T7NkbDo1cj4cU7LJ9vMmbXmA4zX0394EGK0qVxc/5LHjtC9sUC
         xHZvYvSxHylI6zVtp+m8FfKkdCYh2QNXZck0he86EMLnqzVxEpSZHMVy/OkXcKz4JLhM
         h77tEPVpecG1eVUugb1J7UJnvDF+1DDuB2Ea4CjImcCOfgU/wU35fovwj4aghCDP3CsX
         PWMjOdWwkGmBJT7nJKoMrAarEAB9TQlKb9bbVRYfaCJgd9E8HkltK8kdwdW23YWIS7JC
         JjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pTVtJVVsCF4n2vh1JzOdJd7gCv+oDiYNsYtyRbNOBIc=;
        b=UgZaeN600aLOt3ZCAYVxM3J+ewGtDNYhj5biij5wkZapXOTaKm8HsqPWRjszaSWSgy
         ZWmnqJbmsuv73lCMUmBXEFlLr9+uTakY8fkYgk33egFnCiaC/syOJvfoglr4F8z6uZg6
         igBxASmJGuJFNkv2krRx3jF97mIM1L5xDTL6hoHKOnMd+kj2X435vaJ5TDg+m/wPwQm3
         mIOscRwsaih0PPGCy4KJzUSKQahwBM7Ru+QRhD/UyHTgeNdZq5TAGxLBGDNc6eNOm1Qx
         ZxO37FOywKvrKhdt6k86LQcEuYcY2qPB5gfYhIHeYB8qWGo6N/qy+EzpCqWfESziD5GX
         DaPg==
X-Gm-Message-State: AOAM530QkBhOQDC4CuEy1lGRQ8KYe20E9NMlPveIvhXOZsf5OzvuvvBO
        B7UVDHLxao8qT6V+TiKlfd0=
X-Google-Smtp-Source: ABdhPJyY11PPoNaAfdw0LgZL387dC5vzTPwKBDUp7TLdThYF7QDCiFPwx6qOXkmzNZw6tem39cbvkw==
X-Received: by 2002:aa7:c4c7:: with SMTP id p7mr34432726edr.271.1593108815349;
        Thu, 25 Jun 2020 11:13:35 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id p4sm19511112edj.64.2020.06.25.11.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:13:35 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] arm64: dts: qcom: msm8992: Add RPMCC node
Date:   Thu, 25 Jun 2020 20:12:59 +0200
Message-Id: <20200625181303.129874-12-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625181303.129874-1-konradybcio@gmail.com>
References: <20200625181303.129874-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This lets us use clocks provided by RPM.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index bc3acc0cf9bf..188fff2095f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -588,6 +588,11 @@ rpm {
 			rpm_requests: rpm-requests {
 				compatible = "qcom,rpm-msm8994";
 				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: rpmcc {
+					compatible = "qcom,rpmcc-msm8992";
+					#clock-cells = <1>;
+				};
 			};
 		};
 	};
-- 
2.27.0

