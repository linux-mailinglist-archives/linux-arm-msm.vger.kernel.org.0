Return-Path: <linux-arm-msm+bounces-16713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 862AC89B4D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 02:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E70FCB20F49
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 00:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AD5B673;
	Mon,  8 Apr 2024 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tI+bLgJr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF60AD4B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 00:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712534677; cv=none; b=E1M+FJ5G7AKaKWtXYKEpKmEXZNUzHgTkU66zNoJsWsg0FOvtGJxb8RS19RhwcVjTJwxLQTbbD7BwlaD3K7+ZjcqvCHVrNv2cwoWe8OFGYoshd052R92e1rnfiZxDJlnk01L5KlAyk5P1orYd3Cd4gKfZdGRZOtRLIdv8hGoNRMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712534677; c=relaxed/simple;
	bh=4uJRDTqomRDGI6+FwBgmpcca266Nn8+WZpUZNQ2q9OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHtmRDtFH7YVjmoE7XhaXfBjcC1OqCiSqVtd0DHTC4TQujH10EqkUvEDAr0asZTkNZ2KVxHM2S0NeVTu5jBakS1m8ojzIM0MVw4NA/NMbK8jOuKLTRdaMgJUVJXh0IWovYnkf4v2aVXveULa/WNbAXnODlxQ31MfswXCrvzYApc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tI+bLgJr; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so8053171fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 17:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712534674; x=1713139474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLVDlCqxm2w8y5sxQgQ4xPnx/VTicbelMsxwHzT78bY=;
        b=tI+bLgJrkDmsTew0RwbdqOfQnJ8xz1SV4rQBgBAo4V+zdpNWGX4IEqpChGcF6sstVn
         Uc8vd8RfmtJoDgC2s9kkYGUsLRx+zeND1BZoEACMXTKtgC+CqOAIh/GvA6dMUA7DMBIe
         wlNXmVqNd1rnnbvc9FF9DxkV87eUFwLO7QDOplUXy0L0QA9NRaVhq14B8XZznH9AxGyW
         ZpgPgDGFbamf+ehgY63zwNRwtKYICsNUhRk5ajaOiTKDxXOvM3+/6DXDg8PylGvQjQk4
         wVq5jJT7o/6mIyw9/0ivN7Q43VgwRc+b0bAvIC2vwLkoK597i5baW+AmzTinHiQ5TR2t
         /osA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712534674; x=1713139474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLVDlCqxm2w8y5sxQgQ4xPnx/VTicbelMsxwHzT78bY=;
        b=AAbJqHmbnqKC5AznJe0/w/j7S8ACcFRTNy2lcuknZYnpEufkuY0ioTECuddUBfd888
         /Bsg6VGC5AVJ1ShX/lxJOA8BnJn9OZnP1d2N2VNppxOme3gP+jt6SWVLS37uuiNh8p8q
         8waJNfN8/XjccuS5UGMqZDl1m4EqjYs2jMeBYRscUcya/e/9emb3iaZ3I866BjLCMBMJ
         EaG/17GnCb9v0Y3Xt8OoAuQqXeXJzcF6cWKQuLUyFyaDJiU7kmdymkosZthiY4qjkdBJ
         k+/hWX+yKAm0F284TwRTPjj7iJ6fz0QUIru/O+VuquFtL+hyf8Dr6yrOm4KNLJnrvHsg
         Vz/g==
X-Gm-Message-State: AOJu0Yw6m2MDfXGHLt0U6bio/J0CKO6qX+sExXY7PZ2/9WDCAYkeGGgo
	7LG6C24JIXriUJnYBOx0dYzxnpmgejSSNYX9ivj+UB8iUYlQpiLDjh7uIvooZCQ=
X-Google-Smtp-Source: AGHT+IHW3sdJ6TUbTTll+xXKNsdF875DFyKpTcnrTzv2BMPtff7wbojcshPy2RGOFoHJT3wMwyaDiw==
X-Received: by 2002:a2e:9b8e:0:b0:2d8:58ca:39ff with SMTP id z14-20020a2e9b8e000000b002d858ca39ffmr5455039lji.9.1712534674282;
        Sun, 07 Apr 2024 17:04:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002d2191e20e1sm947077ljj.92.2024.04.07.17.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 17:04:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 03:04:31 +0300
Subject: [PATCH v4 1/4] arm64: dts: qcom: msm8996: specify UFS core_clk
 frequencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-msm8996-fix-ufs-v4-1-ee1a28bf8579@linaro.org>
References: <20240408-msm8996-fix-ufs-v4-0-ee1a28bf8579@linaro.org>
In-Reply-To: <20240408-msm8996-fix-ufs-v4-0-ee1a28bf8579@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4uJRDTqomRDGI6+FwBgmpcca266Nn8+WZpUZNQ2q9OE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmEzSQIK6fMWhogvncnT3r0gvhh6Q4N2FAMxz/f
 hTNsKTo5DSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhM0kAAKCRCLPIo+Aiko
 1b95B/9bDJ/aYI/5iyuzUbZIznl3vuhJ0MUupGmy6mU8PZtPz/bXXqReevRONuIzovVVqOamvof
 40QgDbH/KKdYz2Nt/qdndxg3HmXowhS9jEKSVSFqXumDSawT4QREyKBdfI+qfHPt9WIBJf6+ufR
 H93JT6XKDss1PaSnOfWqkEwePjvtOU51PaQdrz87ZVp1hQXRafsal3IL2/AV99unhWscypS/z9L
 J050x4QKLw7j2+xE72112TOcgQisFTcyP5K6G+WFpsN6pTKlpy2iKqlvJFUUAy6W8MoQ5x30XAR
 F4vlI0Vrm9smGkYVo6e/pe06gdah04VW9HwyQ0s33Bw8+cax
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the example of other platforms and specify core_clk frequencies
in the frequency table in addition to the core_clk_src frequencies. The
driver should be setting the leaf frequency instead of some interim
clock freq.

Suggested-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Fixes: 57fc67ef0d35 ("arm64: dts: qcom: msm8996: Add ufs related nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 1601e46549e7..42ad4872f94d 100644
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


