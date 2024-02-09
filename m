Return-Path: <linux-arm-msm+bounces-10411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC3284FF30
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 610D51C21C78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABB32134B;
	Fri,  9 Feb 2024 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M35PNE2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053D36AEF
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707515441; cv=none; b=N4h1IvoPU+V2CiprKCXbPi++YjaQiJHilYsCYNPGpfuvlrXPFEv2R1el8yePuZCcHUBCgRcRZ2iKVdJZ83TUv5pAIfriWPtgDH5NVzNkJOuUH5Ihw7ZHGhiAVj9A64J+gVlrKT+9gIXhGLIFLZCpxZR9be1ExXJ6PV0kBk/taJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707515441; c=relaxed/simple;
	bh=Yu/LzOcQdCwZAyJpUXbklqudqrQ3EIxx4vsAwegkqbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YDUZYVNGBiQa/dl5tFMPmtHNopIWNtGQL8RitHKkfneSMZk401BWWVJa5u6Q+E1aNbX0ybSvy/0RSxm4ABLRfD4yoEMvcNZUENWFr+XqVMNVk6PLaOCcH5AcfU32V5tPyf/0M8I85R9KpIAvZw0NpeA3DMqjGBW9XoDGXf8xN8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M35PNE2r; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cf3ed3b917so16495491fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707515437; x=1708120237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bb+Sg+PuMfej4JlBw0WjutTwckzrP3l1xV8RqoQLreY=;
        b=M35PNE2r8xjdK/dz3wynIYnPwqe+MYHyO8IEoKSuSQHvqqYllxun7lYGX1Eq9490RG
         7AN6rSnE3tVRCWT33tpJcCOMKen+A2HtSCNsZ1B/NtsKPq1ySDjFA466qvfOEAR7B1uR
         Q7t2Kj/dwTVr2qMVCRhhN7g4ijCo37/SfkDRx9aG6/dhZyTJlzv4+erh2VqrNC//dQ5s
         WPQpMOrMRgLcFt8LWjiMnWTDf7oE8oQL6wChkPTucV8hOQTapuoNF0A+OqfE72zuoJtU
         gvKncCSk6dG1sQWJsJruKPE97Fl1OKEEvPTK5MLCpvXztVH2THPnalLtKMzqUYtap3n/
         am0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707515437; x=1708120237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bb+Sg+PuMfej4JlBw0WjutTwckzrP3l1xV8RqoQLreY=;
        b=Y/kM6PddX1oiNo9CENTgyA+betGxv+CaM5PIGXjePBIFbQIm+IyxgbXYTU0jZE4O+a
         nkaEbCXn5h+tQrQKviPs88gC9ZpPVW21+NcxqGBF+cmGKybptXyWY6aIMJTF+LhDgitF
         HfUIBZgMBD2XgQ+KdKFhNqRz0VyICFpjQo8fwwJL2o4f6gOjStLfqNqvVb38kd5kFvju
         SJKyDRbUoCI1nwuqYhYKdK1oFdhSI/95/O7Gle79TW3ntnvDBevbUwo2XV80QCC+BnfB
         RbJOd0ieNIYm2fP2Drg5EHRNpDZBqdS4CFcPf+hNp22ooun/wZykl/suCzkWSIlYDRcO
         8VpA==
X-Gm-Message-State: AOJu0YxEflnJST2Jfixi7/mGMj7J1IhP21QPFQ0HlML9riugahGKTugC
	3CngwUaSClcPmLbU4yxeKK1kyhXRpRrG8rSB4hm3riotorrdZkJzti9CcR0jv/Y=
X-Google-Smtp-Source: AGHT+IFF4APdxejo3krhK98jJDEbNv7Q1pmG1j5+LIhk9UntOHNiQq20JhOvuzyyqMJR8uROmcsYtg==
X-Received: by 2002:a2e:3806:0:b0:2d0:a71f:5eab with SMTP id f6-20020a2e3806000000b002d0a71f5eabmr210385lja.23.1707515437558;
        Fri, 09 Feb 2024 13:50:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW43uGcUmlYEa7r8C65VOJ40b6JybqNWwfDRdHJLlqoqRDFTzTFQgma8bIHjq3hv9E3QJdjAcgkdRrtgFpcbDBSfXSerbEj60fLCjhechlkITjTqXk5YO1UAIb/aYKo7Cmtk7FFHLimieDNZl0W8qdrutBUT6JUXK195tZ+RyMScFRYOkdiSCqa4GwgE8sbX1MswW2XfSu7uMZi3fd1/9tQpkceusLhwvjvVAfG0t8KwilirkMk4r/Yg4W11/Ed4b0i/4U8sxLIBLQ106QckYzzu/gslhwOKCpb5qPZc6RIUOPi5buixQhqUMk3/kavFaWPiIMMGr1Nl7P9mY4ZE9zu6/Q9wmKmjGuL3hOXKqbjaN73lZByupkS3NgG+80je8sxeRhnCm9igC3vRCtUyIfXW4V9p1GbR7myxkU6sXhI1bBhwHnO9qXq6wuJadOTLf/J33gnQhJckP+iMXXlzod/cOGDxOIjn+eySTW53aOoWbwI8kE8YopI5EV07nZ6EOIh/z7QJYJuNSacL04U9SlmQEJAKHN8KjP0/I7DVF5UKT+/EEROBK4+cw3i1zR3KIkw3JwRXDCGi3netcWhEis7siP0KCFAdAE=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t1-20020a2e2d01000000b002d0ac71862csm391162ljt.9.2024.02.09.13.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:50:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 09 Feb 2024 23:50:34 +0200
Subject: [PATCH 4/8] arm64: dts: qcom: msm8996: specify UFS core_clk
 frequencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240209-msm8996-fix-ufs-v1-4-107b52e57420@linaro.org>
References: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
In-Reply-To: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=975;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Yu/LzOcQdCwZAyJpUXbklqudqrQ3EIxx4vsAwegkqbc=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBlxp4oPisjdMAjttGDKMVPpDmlZqu7GPwM7Nd5H
 MqTPgqlgz6JATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcaeKAAKCRCLPIo+Aiko
 1ciFB/ib4ZE+Qk5EBi+qpqjvxVXZjDd/Haa7IBdbqcSY5lkPH3lhVep03A1QtYcGtCzQACbKlmD
 TUaijeU5T2l4Kjz3OvlvinaAVUsWpdkSBDVFHmHQl5k3uVGlblvu4+KEvOono83JMIh7LAEOUOl
 gzZlWSGN9ovjd0+ZeVnlRncNq59y6bBmA26c9/+nhmnlndYuGuliry/311qFBz5i/eo5dNNn2qN
 ud51qCkweLTgkYzlGWIFGbGn+n97eIfSdwkDoaUSiXhfqaHepjX7Uvahc7R//LZ2sua04lxcnxq
 4jOaUSk7dnBPb/Bo+5YoMyF4vhO6itXVz24wcbUta8xjI50=
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the example of other platforms and specify core_clk frequencies
in the frequency table in addition to the core_clk_src frequencies. The
driver should be setting the leaf frequency instead of some interim
clock freq.

Suggested-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Fixes: 57fc67ef0d35 ("arm64: dts: qcom: msm8996: Add ufs related nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 80d83e01bb4d..401c6cce9fec 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2072,7 +2072,7 @@ ufshc: ufshc@624000 {
 				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>;
 			freq-table-hz =
 				<100000000 200000000>,
-				<0 0>,
+				<100000000 200000000>,
 				<0 0>,
 				<0 0>,
 				<0 0>,

-- 
2.39.2


