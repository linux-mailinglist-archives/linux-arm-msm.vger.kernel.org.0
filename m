Return-Path: <linux-arm-msm+bounces-63283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A7EAF02D9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 20:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 951BD7AEBFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0858B27E06E;
	Tue,  1 Jul 2025 18:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnvNdqRd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0E927055A;
	Tue,  1 Jul 2025 18:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751394992; cv=none; b=HEyIDKvY3c+v1Y9rGw/Y9BmSf7bAqr/kFc/UKBfb7BpeDGcSjwhunR4ruHa9CzzgQ0K8puWu52+q0rxOxmIyjJezleD+khAIy19K/0RFclaLBkd5Tu9m1HIZyggItJJqcdIigFNXudpnPkjv7DDZUdlgZJt0I8vTXHhNuf6yLH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751394992; c=relaxed/simple;
	bh=rAEt5vFd+EjR1VmpHF/Wwv+b92ME941faDWjLfPG4DE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Te+KgobK2eWojlCKJpUV7Sn5fjY/ARS4eDTNn3EaJ8SMo/sOh14efrFb6n20YP+mEjZVdfJRCFmmXI5E3K25iUaWJPsrO8zmiNbS0SPrY1BofAwWwPeCyi8SGsjrugg77VUrFEvuLyBP62gRjXVpwVKQ4IS3rt2XIhlVCZ2Iuag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnvNdqRd; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso11187258a12.0;
        Tue, 01 Jul 2025 11:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751394989; x=1751999789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bHiTb9TKSr/WtTlrIgFsHou+98o/3jDHpKPxJzADj64=;
        b=TnvNdqRd+cyL0iNEfQ+f4cY60MTsr3lfKBnvbCdRQg8uWWRU5C/hmmVkNCAN4MIf/E
         t2D4K8GSsBjKXKlQ7Xp7ZgGD1a22AGPiONVpruPSKhnYH1Z3t/tViZKbxp+5dwf582T+
         ia26i5FOmkokkeHVikNcU9nvBxH1uDBhFbspFUl7StI2JfvdFXmOhcUbznwUCyOZqnXd
         V3Q5Wwjwhc6QopTv8/EsNBHPOPClkc8K7WuQy2uulRN1tlQ2//jP3JutxN8hFKUFuyd5
         2aw7HHXaleTA3JNADxnbpyED1/HAa4QnC8PG4aMJsEhCPbc8GpqfgppWv6jlpuJ/T57z
         f0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751394989; x=1751999789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHiTb9TKSr/WtTlrIgFsHou+98o/3jDHpKPxJzADj64=;
        b=EZTa3IIj9RXCZfMmtgkCAPPTWveqp4/xOJHuMJZnC5yG1LzC/mVZWpKOS0EYHUMqhj
         t1XitHl0T2Ijsa0uF9C6dki/uJb+dNHN59ayhWjQRRHhuOf82q36l5pLBgIFGn/cBL16
         0MbCnoRlVQDEHbG8/w/ExxgkCPOjmaucLfr3mqKVBNU8dZ+FYW5QSkgCcfWnuP1h8/gJ
         vPvjVPXBCgGByq3G8GsY9fDmsegLm20a9hrkcPD8jCoTLHZn/Ql13Y1QIiUPwB3zwUj7
         4dHVws8k+oxcAoHLPQPljR/ZOgbZOp7QQ8UlwlpwMDOw9FTiKx3o9Z7ZCjqDaAHZKJTM
         7+3g==
X-Forwarded-Encrypted: i=1; AJvYcCUNgMCRBtTyFD0ve4qqxfiduwAL8oKX8t9sRb2NVGKGkhR47k7NUsUtuXOR4XedL+9/fI56oTxBL7xrBkK2@vger.kernel.org, AJvYcCVc/Xpea1pqbZ4PtQ3/jftPWgbbgOPNVkG/X0Xen3hOk9JyvkfIpDPfr4Tzx+kDHiEhaAx28V9GqA+t@vger.kernel.org, AJvYcCWOfhxnumieTAMCSo9KVJkIhn2cQDVOTpVCA09hdjx9FeECcIU/M0N/iZ8e6EvAWqh9H8Lm+p4hWVVkff/s7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKwaOe3kDNviigPcmho6iy8sO33JIQafuyp6ZUpzKjK7Ybbz+i
	RrMb8fXu6RCmB347Zv/fA9W0ZK2KHtGm9tc6g7RVDDLdsfTGmQZvtpX7V0npR+mUmQ==
X-Gm-Gg: ASbGncspEZKyq1h101HIuWMWIHqMlmTKa84BMwn0YWsILTABhN8Hcfka+krR/2mKm9a
	uQuft7E4pWuugQBuUU7gXQ96Xyrs2lqdQJYSslVsT+c/Eq8cVa6JQQtDwVy33hbF9r7T+2zre7W
	vketyRvw33VyyeMZI4AOtpjyK15U1LFt/X5QEZhy12Wj24Ko+wJXXj4KyJ2huAQHJCzBHkh15TT
	IXvIJaIxUdzHOail0wa1TFzmvL/kmcRM68Zyt1ZZjlQlNjdwZz6b9rEDWg7JIIO2XjbXpGaPkym
	vvk+xaRdFTZ+DPEbO4CPl8GKtkzGG3Swz7L5EJM+Ofhwh6dUyPrp29sxRAXTqs9UutpYFjxcBC7
	WWI6p
X-Google-Smtp-Source: AGHT+IHNcZRRTjjPHh0pd6KWMceNNNtj9SNAdIazBabeSOSFHGcZirzJ1t/FQS4NeKoMcfCoMPH93Q==
X-Received: by 2002:a17:907:2daa:b0:ae0:c690:1bed with SMTP id a640c23a62f3a-ae35019cf4bmr1748571766b.51.1751394989032;
        Tue, 01 Jul 2025 11:36:29 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c013b7sm915374566b.80.2025.07.01.11.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:36:28 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	bryan.odonoghue@linaro.org,
	jens.glathe@oldschoolsolutions.biz,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 0/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010 by default
Date: Tue,  1 Jul 2025 20:35:52 +0200
Message-ID: <20250701183625.1968246-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow up to previous discussion [1].

Disable camera specific PMIC pm8010 by default, as some X1E/X1 devices
do not have one. Platform that utilize it should enable it.

Affected upstream devices:
- none
Affected devices submitted upstream (did not land yet):
- CRD, as part of CAMSS series by Bryan [2]

Change in v2:
- Drop reference to power button issue on Dell XPS. The correlation
  between pm8010 erroring-out and power button not working cannot be
  reproduced anymore on kernel 6.14/6.16, Ubuntu 24.10/25.04, BIOS
  2.2.0/2.8.0. Perhaps was intermediate regression that was since
  resolved. Either way, appears to be irrelevant to this change now.
Link to v1: https://lore.kernel.org/all/20250624225056.1056974-1-alex.vinarskis@gmail.com/


[1] https://lore.kernel.org/linux-arm-msm/519f9e21-466f-4e8b-9bd0-dfe0448920bb@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-3fd4124cf35a@linaro.org/

Aleksandrs Vinarskis (1):
  arm64: dts: qcom: x1e80100-pmics: Disable pm8010 by default

 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.48.1


