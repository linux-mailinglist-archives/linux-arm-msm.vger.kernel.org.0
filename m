Return-Path: <linux-arm-msm+bounces-36774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF079B9564
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 17:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 851131F21DB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 16:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201C01CC896;
	Fri,  1 Nov 2024 16:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fe9v+ivb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994331CBE8D
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730478611; cv=none; b=h+H2vnTnif5Be9o22ymtt6lnhwq2mmChdaO7VMfKnAQyU+RlkLg9EU+nqfNr7cxjnK6+CF0TdwZGZePD6ub7fBKAj5dn+lSB8u0GS8twDLaRBWU/TWbLqOk6mGkxk5/NXWBdC3g7ss+PmhGwVTnBDm062PH8SilA/NiLfDeHKuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730478611; c=relaxed/simple;
	bh=Hmya9urPzYZ9DRws7XZbkyfEDvnuLnJ8Bsg7p4gHTM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+1yLlNtZJ25O/uxqX7m+7mWFXyZw8GlrMf9e3TX+lfzJyNEHuM3KCcuSjzmB6ohXnqYY4AgOn5n7BHQw5QtWbWQikrnBwU+FoEDhbR5o2xVZTs/iRMLToQOfLIuMV1XWfjGTIyWIiMAdlagrJBjF/aKQyAh6a85Yi5uKUZH98o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fe9v+ivb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso23208085e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730478607; x=1731083407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9tz5Jol/Unc2MrtdrBxllQ+sPoITbl6HWLDF/QJsGQ=;
        b=fe9v+ivbPoJukNyzupJmNWR5VY+ezrIsf8JG7Oy2nVbXbac5ybXK8LRmR4Rvm7Yz+c
         z0pDU/T7dzy3lL/BfKFULi7miQoKKk8rSwmTlAj/GVEixyw0qUhrZO7uj8KXmPXoNk4N
         +HzyZMY2f6av9xeQFK+9xy8POJcgyFXsij22tZHTN3RrT/9iDbe5IR9+9apBolltQFLu
         c3X18BPAkY3xf8trws9psEOJTpu0ZWzM4goxk3bs5hjWfFlYsVRSHGvkNfIEQk7qmpGv
         7RrQrj26zFtHecW9IDHA4KtymPmL8RtZuXY8+qN0734JK8gOq2bMtuk+Lt9x4KZ9aSDX
         +XvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730478607; x=1731083407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9tz5Jol/Unc2MrtdrBxllQ+sPoITbl6HWLDF/QJsGQ=;
        b=NuzxdnyjZJ/FBN3ihER33pM82ImzIsyGhWMxHKVyHUq9FfjDMgRwJ4tsQY/X2PLfWm
         VxtvBwm6yzf0YRVgvAW21dD2OsJ6SJe8ZgYPitAm2d4v9RVxjUv5CO9BQp2bDNx/JdBB
         2c7k/ULbScDzFD9RCNp6cUwKr4H49iu+pvqY2JU0ZbHbvzbInZ76d/6s4DsaPeg0l7yl
         +aGpxWLp7IHdpp/i0msrJ5Xtz5EGNPqbpbCSmAn0sKitDcM4+ysmNuFr8JTNk0E/HS3q
         Kou+MinhkXBrUAa4b1AAgapyOSx7ROgZYwiAH84Xv+d+HevcrzqfVG17eZnYBIx1pIcL
         8N0g==
X-Gm-Message-State: AOJu0YyJGZ+e6KiToD/jnddVD8ILpMSUXeS42qpqZOaEEbSJ5WeXoGIp
	Ya+gUSSdyT7z5kKr+4K5Gw9PcbLsYI9IgOROlO1JuFg/twQUjapLe/oTWV0Yex4=
X-Google-Smtp-Source: AGHT+IGYq8MOxpZZNEOPVMocYMY/5b1F5E8ewDQFuKwVQSWXKKk6jfKWhq69k9821k8E1sMpgsQprg==
X-Received: by 2002:a05:600c:354f:b0:431:518a:6826 with SMTP id 5b1f17b1804b1-43283255a71mr40784415e9.19.1730478606977;
        Fri, 01 Nov 2024 09:30:06 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d69845csm66697555e9.47.2024.11.01.09.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 09:30:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 01 Nov 2024 18:29:42 +0200
Subject: [PATCH v4 4/4] arm64: dts: qcom: x1e80100-crd: Enable external
 DisplayPort support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-x1e80100-ps8830-v4-4-f0f7518b263e@linaro.org>
References: <20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org>
In-Reply-To: <20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Hmya9urPzYZ9DRws7XZbkyfEDvnuLnJ8Bsg7p4gHTM8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnJQIFd2waiAbzyNMuWuHm9XUw4iSsoyPlOEIar
 aJCJGpGpISJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZyUCBQAKCRAbX0TJAJUV
 VsbRD/9MXpluqX5eNHet3fLUS8Ij5hNszOotunsBJ9jHOik73VtBi4BbobtpRU//S/gaoSTf0Y0
 sDKm5RbG/BAxSGFOCzP327fx/VXKxAp5bDFsAeEHSBfro0e/Whj+K3Em/yGUUZS/0b4e8NF6wGp
 Mpxm5XNskn8Gtv9mxn9BNDIIj1yxegyt7cheQkv751DFW0VMY27p6YhU6uWKSrAHExhXI6I0p+9
 7+YAlnjXMQHm9B1yb1bGM+MxKU8k8fJcI32ctzW8M8lJvDP/XKbBwUe7BIO158MGNksNB8Ho0WI
 KkNzRUsUWnBnLEFbtqNQXSyQ+kEaxRVncC/JBVEDZJdb5QQp+7EhAfcTF5uGDoMdzukSP22PRSU
 RRdi6uwvuixAgJEEMBH2LQn1FZhESKoICI5JntqkQiuxF/ByfpzftyGnBnAv3IbMl8wyyOGv5Ic
 FeTOwH+DkGzEI0QLGaHGHIDWNbiMhysvDbJHImHBhelelagj8u9Nnlz/Og5N9xf4GVNV3VoIsiW
 W8DNLu6EX7c+W6n5MyIZ2RgWK7IxrigwdlHTG0L3tqCP2U94Q2UVwAEbYNsDuKh3oSr4FijCLgf
 y50xtK633bgsO2VfvFkClKlESoLcwrlMh4MxRKioVDzBLARzHNdToZjRzZRi+qXNU5b+HzCTGyf
 ZhjPbGxwxj3SjTQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X Elite CRD provides external DisplayPort on all 3 USB Type-C ports.
Each one of this ports is connected to a dedicated DisplayPort
controller.

Due to support missing in the USB/DisplayPort combo PHY driver,
the external DisplayPort is limited to 2 lanes.

So enable all 3 remaining DisplayPort controllers and limit their data
lanes number to 2.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 6e1b9e1d227ce0a3607af708e2438be33424eec5..4863efd793641136e8788882c371efafa7f23c3c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -1098,6 +1098,30 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;

-- 
2.34.1


