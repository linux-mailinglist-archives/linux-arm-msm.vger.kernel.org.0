Return-Path: <linux-arm-msm+bounces-50169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA5BA4DBAE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 12:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9FD13B2772
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 11:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1DB203713;
	Tue,  4 Mar 2025 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O82sfg1I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF192036E0
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085898; cv=none; b=L9ZJjAkBLjlVNSlCqdi7BNfF2TiZ86kLysmsxIN0LZJAtp1NQJhP6UAoFYluZVDcWakUO00lZpBSsi0xKwy1YEqlbNE81TBXKgQUhGT8O97HINQLSaYEicqhL742mOnY0QQ8eGdwFPG8RcnlBr1OFUq87ffOXPg6sPxttV/N1+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085898; c=relaxed/simple;
	bh=Zqqp9kj2qs1kIed4yvhKxtqoam51WaimrpCDyizSfpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2MzATu+bJwgMz8kMA4M1/Mrax3Mv/Xz+RBN9YSOtuRcZ3/giXEgTVwNjuZs2boEaDfowkBT8DoUkTxuKLKbDEBxFDE7xOr0paCIwoYoxfTy0z7cKYq1zlA5q95Xgt2dhf63S7XdSsdfNNBaTfB/GTiqDBeOOQ6hdQbak5k9LJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O82sfg1I; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abf518748cbso543841866b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 02:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085892; x=1741690692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Vb9KDOz19ijUANRYpkQgMyAo2OY8uOhKMXDPTYrFM8=;
        b=O82sfg1IEbsqJH8kjhhGL+fIzdCd9gH7J/kdptTkuLljLawGJVJy/t8CsD9Lt5ukh6
         1UF8sTqmmO/Q7ifZ0TWciGfOAyFVC41tiuLBVaIBZiGHRwJLVLYc1X8iRC6Psxbw1EtL
         bvbRLgN4KcGsAWGtn9o8+cYc5p9V73x3gZsisR24Xp23LzVGVXUf6/PIq9TeYdvCn7g7
         ZEYzkPFHfdDbx/g67jeQPxU0wdZMs7a2+dcWea2PWNk+Sq9pG+sNUlHSmnt68B+JBP7j
         AYrwFf5CuMBGsaX0QHfiFGEUEs7lu1iYDjbHkMpr8BOmgYAhU+mCmgXF9lsmeTeqYP0i
         VMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085892; x=1741690692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Vb9KDOz19ijUANRYpkQgMyAo2OY8uOhKMXDPTYrFM8=;
        b=r94UihcKq2mJDgIj2q1cB3j03OTZmfnyAoDpdS0EPuuz0gw7Fgo5XnqLhHqGRMabag
         iqhNAazYW2iTgqdVcXHFrNjmWSaWqZDUVTOP5Kuey6KN5vAt5pPjdscP6JosPTRB108/
         W9i6nuhS0Nhan/P3qGQvwW+/d/dk7hUe30hmZtTutZJlzbMjqHc5XNjPlsjI6gZCLjq7
         Ww8b4kFs9vS0tfydOr+8VD6/vHDddIAFegjaQ4XhWLXI/kps3LMoLTBJwI7wA2bocl6x
         qEK9VXJzK2PHWTIItotsy7igB02g+VkwwYsI4Xzq1s+yn1SfLxcKfCxdgfwuHE7PJO66
         VlKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU0K3DLr8EnVpcXGR8Y70ye3u6mNiJlXzn8bqQX/p4oCu00ct/92hXrTN6wcKAM7avedVwg2Gao2Tk5Mpo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrp0Ao0HK6qBCOkLfbA+zKGqUeHxpIsdM8DcnKfpJqtM00sUY1
	/ac/7OY0QLgtn6I11hT7/3hceU9v+SXPBSL+QgYfIg8qpSLLYA3TcqVm36zLg8E=
X-Gm-Gg: ASbGncs+i46QCk7roeJdQlf0IrC+3UTZqwgJkSOnmL9/KdRezUZXfnAqb3Yd9JJ/u5/
	GYbh8XCFz/1V4eFA2hlk43/q13XZbdZJWjfzYiF7wbbQ3QdebVnWEZaJEFbKk/qUfs7uK7dFP5Q
	qvLCywro9vK3ZF5de3GrgGjtWzqjiEQcx1xnEJ7JMdnaTJs6SKAg2C9JzAIr0610HoIwZoOPy15
	ME3tc/FTP5WgBoS1LDvIYMduc0iW5SVpFf4JTQfDkkwKyfXLNmZZqmTFIVNNir9ZZfqpIZZyab7
	j79cYcTOih6+UADSLhgc4sFmiTuzWOFFvWpMKlryyEI=
X-Google-Smtp-Source: AGHT+IEb6EuiS7+dqi0bOsXT4Ym7YeiUZxDY4eCglHY6UpaosBItLqyrdP3V6eA6K1sjLH5BfCCguA==
X-Received: by 2002:a17:907:9815:b0:abf:641a:5727 with SMTP id a640c23a62f3a-abf641a5b44mr960726166b.7.1741085892630;
        Tue, 04 Mar 2025 02:58:12 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1fde3f585sm38973266b.53.2025.03.04.02.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:58:12 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 04 Mar 2025 12:57:49 +0200
Subject: [PATCH v6 4/4] arm64: dts: qcom: x1e80100-t14s: Enable external
 DisplayPort support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-x1e80100-dts-crd-t14s-enable-typec-retimers-v6-4-e5a49fae4e94@linaro.org>
References: <20250304-x1e80100-dts-crd-t14s-enable-typec-retimers-v6-0-e5a49fae4e94@linaro.org>
In-Reply-To: <20250304-x1e80100-dts-crd-t14s-enable-typec-retimers-v6-0-e5a49fae4e94@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Zqqp9kj2qs1kIed4yvhKxtqoam51WaimrpCDyizSfpo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnxty8xDqJ7tIs1vHQGl75zJ9YMfmFdEX5aZ9tH
 Xr32KIn8ouJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ8bcvAAKCRAbX0TJAJUV
 VpBJEACX3dW3/8corJf9Px6nz2ARucorC6oYdZW0igUQU4rTBy7bepm/UpbBA7qwulCmelx3WLB
 7cF5N5zt56lFGhrip8y+b2Wz4YcdiqDXFLh4qOQGQY/P3JreSZ/EAIEuZCJ1N5NpviqfQLERLNl
 2IWb+/+Ja5d3GEGux26msLHl3Ee/AYzL/8ERE1XxGtCFeLy11LrdupIT6hFMR2/H7o/fpmdG0ab
 ZZx5uTtPIcB0S7N+jmLoQdKwtE+nM+kJVkPhCjNhFipTQvV/8Ft/drZylti9jmmtwg6qSbN4smw
 qgtA7XK0u20qklXeJPEtrrr6WnJWBA3Qg0cDjPCGkVpX62ds5OoGpCWLXKeQ9v2SLYNXMwM+CFq
 yUiakuqCJIUs/84W/hXvSKpGuxrxGeGX3l+LAfsm4FjxeXXQekOso4CHAylnMYFyViPxFR29zop
 xp55c696KwdJ7K8NOPEutNIoat6cGfOSxHB6EfL3KYmVm/nIrGJYHD3G8R0plcsJPnxTOvoCnqS
 6DXWMSaQRkIxRM9fvuATNIrEs94joa6WR0aWiwPZmnPzoJ0NcL9HLD1EIWCRl8vaiv00ulqCxId
 KPczgueY0Evy/d0kkSVZQNTpO4NVa1Ff3KIqcopheIoDWoRUL4eC9sHT7aocFVr95n0PAM0iWeg
 qKqny9o2BXHFTaQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Lenovo ThinkPad T14s Gen6 provides external DisplayPort on all
2 USB Type-C ports. Each one of this ports is connected to a dedicated
DisplayPort controller.

Due to support missing in the USB/DisplayPort combo PHY driver,
the external DisplayPort is limited to 2 lanes.

So enable the first and second DisplayPort controllers and limit their
data lanes number to 2.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 9c0903b8436396b2fe6e17ee3bc4d454cb5a0f8b..05b2f3bf1fc81c1b10e375b5335377c9ce39be95 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -923,6 +923,22 @@ &mdss {
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
 &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;

-- 
2.34.1


