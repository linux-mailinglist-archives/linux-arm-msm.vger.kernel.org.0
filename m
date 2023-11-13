Return-Path: <linux-arm-msm+bounces-582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 757BE7E9F4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 15:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15FE4B20AFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 14:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636982134B;
	Mon, 13 Nov 2023 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJcfMXe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6505C21356
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 14:53:36 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE5D171A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 06:53:34 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-507a0907896so6232672e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 06:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699887213; x=1700492013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KajBuUuJpwuy15xSzO9YMy+TSc6B+gUFFD30MmfVQnM=;
        b=VJcfMXe3ExiMBDQgYmCyUNtHRsDg+Yhk/Q8ESynJ1U48TbuzDon7N4dz3sWUHXWSCX
         7y5mxJCq4E7WvR4+G+VohoZfFnwToNZBhO7YVmLoxyq6gCuyXB5oH33ME2oVmh9jm1Ow
         wk+ww22bB8ouOCnSJo3BKLy8VKsPkSg9q8npY8TprRjzA0EYKGomAWuVTwW5gUgPZ/Qw
         YtaN08+KPrjWJAdrY2PVyHd42CE18u45HGYKdxa2f0xEU6MTq+RK0GNMfuGGItC3YUyS
         8vFDuHLadKsK4xyYgss2gF5O1nS3JvLp0xOnBZzqk4Xd5+ObSrz2rjvKW/IRWdYScLE9
         4CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699887213; x=1700492013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KajBuUuJpwuy15xSzO9YMy+TSc6B+gUFFD30MmfVQnM=;
        b=kHezQ8CToqYPgmlzK7WymOmf/2MKB7cS8DFmt6SGwh96N2h6lYr1X9d8p/rHJ81ieg
         xTmsS2nX+PezFlrzCNyn4UVD3F5dobc8mKKekpao5ftoH5p1f31MPgDxLAInYwPFq8e/
         PAbNkgfIMEeSVDWm47WGew9bkys+MfNxyioLt1OftZVreyVXzUHEN1bgCQSYZEL/qsoB
         aejX0FIxQilwXeltavKgTcPeUocAqR8+80b4Gg9bpHSxV8Fwl3maQnIYGK33I0G/y8Zh
         kgIdsnkHx9Y6/YpLyX5WJS5U2jQP7UHQAqQ+i+K9+oAqfljJb0JYGquiC9ZI8DvkBhjD
         aO6w==
X-Gm-Message-State: AOJu0Yw2DzbW64dli4DkUgpGqeruGyMk8XpN5sLjHediFWgO8/LUhanx
	zyTiAbc6kcWbDTl0h3/LwWuopQ==
X-Google-Smtp-Source: AGHT+IFssdsSeMO8OhuFr2rnn73oVtRkLf8RT6Drkzt27EUHXdwP55jUd9bvfFdMoYRyYOwcBoTFqA==
X-Received: by 2002:a05:6512:3d90:b0:509:494d:c3d2 with SMTP id k16-20020a0565123d9000b00509494dc3d2mr5401160lfv.32.1699887212950;
        Mon, 13 Nov 2023 06:53:32 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x24-20020ac24898000000b0050794b05c8asm991429lfc.42.2023.11.13.06.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:53:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid
Date: Mon, 13 Nov 2023 16:33:09 +0200
Message-ID: <20231113145328.42575-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113145328.42575-1-dmitry.baryshkov@linaro.org>
References: <20231113145328.42575-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the bindings and use 16-bit value for AltMode SVID instead of
using the full u32.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index c8cd40a462a3..88b37ceb13ed 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1425,7 +1425,7 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = <0xff01>;
+				svid = /bits/ 16 <0xff01>;
 				vdo = <0x00001c46>;
 			};
 		};
-- 
2.42.0


