Return-Path: <linux-arm-msm+bounces-40765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F89E6B71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 11:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E571F2823A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3267C1FC106;
	Fri,  6 Dec 2024 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjaEY5s9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29E81F6676
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 10:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733479985; cv=none; b=oFPNAoqYkDIbKLmVAckBO/F8DDjpClpZeDaWWlByMnJbYRYcNpMTvFoQg1UztO35OX/hS8cy/iFwO4+nn3xydFYfb6T+mLFbqX+/SIOPJg6WV9Z9xehvQvYMgx4yRAmenVNiZVNMD4AUE2DblD1wYmJfBZUFE9HZ/AYSObh8wZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733479985; c=relaxed/simple;
	bh=jGLTAugEoSXwKu8aklCQX92hP9mnmqNNM/X8hnjjVXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVmAq2NKk7WG/ARezXdKf79mqTUvJSouDw53B9pfNDvGjqTC8K991hGR76HnVf+XQidEbfbWbMhxO5QhhpIlV1JpNBX6RK+60Jq1lpmECCjRdi2zBtmgXtSPymkK9IKb6wn7sR7JxaUSzXfHV7efq66kQP3dxb5xx6javoDh9G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjaEY5s9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4349fb56260so12555215e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 02:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733479980; x=1734084780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ka9OJ0lCnfA6ALixeFrsKSZhUTbEuLvcviSCATqki7U=;
        b=QjaEY5s9Bkw9iglzUNx/pCLiIbXdSAQ75q485ScP7QEO0+d4HHv2nv+a9/O9EncbOD
         K84mHQqc9IRO7bHUdemf5roRJGq7LEHgzVGM4+TxjcQyB06tGF4DoEwbybUqjz6WdPOD
         AuGoSvpxup5UeVczjOED4K+B3Gl7GYqnVRRRJ8Cpv/xpK5Z3SmwUermV9IjlXOfBqDVy
         XoTvgpzpvEJracG2ieo2SJwcj26Sex5NtyYTpG0jDsW6Nn+kz7NO372Mp3Qtr9zin8LK
         Ho0SXHfBU94Gsazxracf6KC/c9ET4q8cDwxYd1//Ic2S0PaIH9QNK2hditLLWkYaQhEA
         BDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479980; x=1734084780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ka9OJ0lCnfA6ALixeFrsKSZhUTbEuLvcviSCATqki7U=;
        b=Ed/KHBRAr44hTV/uK+jW326r+qSeA7G2gR1I01wVwsjB/o8iqISVdLl8xXr8B7Y+1B
         SoYLLsoA7+Hdqed47gEgMt3G94r7Rz80DtUbhtjzlUCEaxspZ1UbaVSHisT3W2Q87Uc8
         SvuClN0xV5Y7GhTtU9bz3GH8r7NPtTlY57rZc89dLdJ+we/O3meMqBKnJ0bKe0oiNmWa
         eIB5uzOvrlB+XEbxgFLtVZPFmEzoDdw857YCmlJxCNX5nhm3Wd2zjZ1ssILiyf3aWqEM
         bQj7v0tiitu+SkJfFdHxwis1QmojdTzix96ZwdbODfdS3sBihpuDj48BRjm9dBIujjQ8
         u5Rw==
X-Gm-Message-State: AOJu0Ywvou9H6xRJxG0xsZ+XwUSZSn+rgUp5xRKceM03lsC/hDWS7BYp
	h1sxfa/Nts8pMnovnE/ZY/IxTuDjZBGSETMUs8YZR9hUEVr0gjSz+OHFXLL6bCk=
X-Gm-Gg: ASbGncu4GmTxD/hzIn5teI7vuf6X0ilJBOh8hLkJ+zlsiuKmk/nIVFGRz7POLqxXyaK
	dKBhis2EZlVjE9I/KbMV8mtwmu5GBY7n/rpKrQq2lqkQT03pd8mYWWC6mLyT2j++5L5NPkeWBRy
	fK7LyWX+O4uERa25FEL1tQw6O3BG9CiIoalmMpsjhg8rqyTKvRC/GNw02vJQkTQggQCC9trd0ll
	twsOgSvwixY3Wa0MktzWUYnBJD7oXUG27v4zqdRFj7cNIF9woDOli6RtcbvylDIJmA1gEA=
X-Google-Smtp-Source: AGHT+IEeQfEe2B86iG5APrb8Axow0idtpWPuHuAY+/emQ2lIVQTdPPkt7qDLpwnlvSZmav3JBPl37w==
X-Received: by 2002:a05:600c:5107:b0:434:a902:97cd with SMTP id 5b1f17b1804b1-434ddeacb51mr20602005e9.12.1733479980255;
        Fri, 06 Dec 2024 02:13:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bfasm91092035e9.32.2024.12.06.02.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:12:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Dec 2024 11:12:53 +0100
Subject: [PATCH v2 1/6] arm64: dts: qcom: qcm6490-shift-otter: remove
 invalid orientation-switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-topic-misc-dt-fixes-v2-1-fb6b9cadc47f@linaro.org>
References: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
In-Reply-To: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=jGLTAugEoSXwKu8aklCQX92hP9mnmqNNM/X8hnjjVXU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUs4n2TZG5TNIYGdBdesmyibrNSY7Rztstz5n+cvi
 nwjNlKqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1LOJwAKCRB33NvayMhJ0T7EEA
 CEeKdbGLP2Tgg+QwufHRHa0gwmnrQ6RsQBAP2y5/O+SPFaP0j4FzC8BK+MfvplEc7yrZmukmiGtSPW
 upHVEhYgUabvSJcawzZnEtLuRta5ZbE1nktgKl/JTICRzWDSc+Ro05YxU1gi5K0et0lOQdouSwcutX
 S/Rd72PxQiidxSRiEZ6CYAp0SRBozYj+LWuqcPr2PrL4746RiLSNOQfmbjwtdXDJBLhx0NNlstFJNr
 cyQrO0e+phT6rwEZ8rFxbflptpPy24hdzAHwT2EpP442Tvz8/PVlo05I7PzhajA5nRClEB5qSE+sAD
 Tqwj+Y4rlaaISgjZxbqjSGCsRO4Wv5jVtwLYTyVixY1Zvo0sEoy+ZzP0vlKCqvyTHpxexXJgsvpfzP
 zVtOfteEjB/0qgRQxaqTPBJaszFDCGD0ckFMH340Ntv9XFuKL01CFRZCqSk3rhnU8iZCbZDnNvZz2f
 Yx2ffrrB8PucxxTkY1Kg8bYal8OswcYRPtXv+J3wk2RlZxBVXBNiAQR0rFB4PKsftg2xueKNA2Afhj
 nSY39Fvik2FC678rnov1bGqmrj+DBsHKN4h9GFOncvvCq6tfBSmPZtuj6MYE2kGJuQL6118apR+zvJ
 aGcDdKDR4uJeyhvgs5MkDVfc642RaO2TN8cuT2MVK8lojJ1Vn4KGak9fHB/A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The orientation-switch property is not documented in the PHY bindings,
remove it.

This fixes:
qcm6490-shift-otter.dts: phy@88e3000: 'orientation-switch' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 4667e47a74bc5b0f01a53beb49993d238b13c4ea..75930f95769663f6ac3e2dd0c5f7d224085dda40 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -942,8 +942,6 @@ &usb_1_hsphy {
 
 	qcom,squelch-detector-bp = <(-2090)>;
 
-	orientation-switch;
-
 	status = "okay";
 };
 

-- 
2.34.1


