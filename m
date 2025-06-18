Return-Path: <linux-arm-msm+bounces-61767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE93ADF77D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 22:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C95D5612C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 20:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBDE21A424;
	Wed, 18 Jun 2025 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TntHOHKR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C32920E70F;
	Wed, 18 Jun 2025 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750277661; cv=none; b=nZx85ifkrvgsV4RguN6FqGu3XA7ccblCbVGdCRwleuzkxy+FzWdra7q4vNkRls7YazZ/8hhQR5F0QRGM5BkowAEt17hiZFgQ682jADBtOJJ8H2T4IAn54dhmRYdOE3rGkOSg5l/V+Hik4XRAsZ6bFElCP3OlsrjasDKv39vbo6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750277661; c=relaxed/simple;
	bh=1E9Kl4wxQ8nz4CVnnFmaNtGd4pj7WRmztCJrxJOssoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jf6kiAZOC9RD/HSrnyK3rW2NM5Kq0qyjAsU5g/QZeCYCdU8z6iP8Z7NoD3/pbJxZZdfSBvmdf8oDFn90tJuu9aFHSOWuc+SwMgwsUtirzRVenW8OXj/Hgar0yUTpwRWtoMKsE/QSdL6AWfmyygA8VheyqeetYPCuuFDmZcdYzek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TntHOHKR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a375e72473so50264f8f.0;
        Wed, 18 Jun 2025 13:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750277658; x=1750882458; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VblNPo1guxJ4nHzsvrQqdryJtW7RA9yK1k2HgAbcIm4=;
        b=TntHOHKRFYVnhMOV8+tqz7lOxHFvI/jgXE1PU8njp7osSpImtjs+gTE1jDlBwwL6pY
         4M2ySOSH3Ry4kyFGa9wCzCVzK34Q5khT7fxE9MTs3OFNFnVtUx+otMPtgPnAUoN93YiY
         zXkpFpZ0RgORQV5GY3X3NAW6A2Qsu6AljuCQj0813/c+0wQwGXkxhsU/JTTl1EHz1ERw
         byv9bCWYMWerfTiPcx4YHZQ7RdM53c9EnIPUX5ACuJMwFWRMTsuypt4sJvnL7Lk3DNQu
         Y2DCzMbtc0ZhrE+b1bj6s+BrSFFezCZwjXW6aySLIeXaQ2EB0zACnExxtqGb4sjG4lvq
         YyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750277658; x=1750882458;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VblNPo1guxJ4nHzsvrQqdryJtW7RA9yK1k2HgAbcIm4=;
        b=G4oHGYUNvNnIh0lOgwGnQbkLCFIM5yn12+2nfrI5UGb7/4i5Nznn7vEgHgpbwVFwK5
         sdjsJ+83l2XZ+WPzzlxFmsTtAOecKFZjNxHhOTIK4UVavNpvDYTkZRez8Kyn9GByrbSF
         UKQPYEP/PkI11MGJ53Rj90H9rVg7u1wWF86D7D6DQrh+yYBPMxIv1kffpQi8Jxvgda5r
         slJ8Ldwn6vvqZ1jotBJTQzaIM4nDA6EqRJ0h9ncOKx3h5mjp7UA+TRvo338dmZDU82ba
         9i4PF2E7qFSBe7qV40Nn6w3+pX5PgMpT7HmLR1K154/nq1696BEU21ENlWSkT7yihSU+
         FC7A==
X-Forwarded-Encrypted: i=1; AJvYcCWmsrZgpUynN50uaMMd/XDVJxE0VYjonE6GyP/UNuglrrIZ2A85jFH/n5FOAkJ2KVJYq7wFlW4thOoZ@vger.kernel.org, AJvYcCXlF4X4LEfMmWoJJxUjLe6bPjv7Qo1bR0VO80d6bj9+NHX1w8wvQznQp+Z9Nzd6tk+dESSbzk0EQE9wfIPW@vger.kernel.org
X-Gm-Message-State: AOJu0YxPBRQGej5JkmpkRjprHvyMLbbQMngnm+Ajtppd4otBb/M9FVmB
	uDcggB3ETNiYH7UDycf/3ouEQw7I+Dv6K5PSITl5H+gGsJtmx5UVIvwqDir7qg==
X-Gm-Gg: ASbGnctevPoAbcsvaEQmSi59F3NOyx+MYVgo6s3wmYHwUEN0lKiqwQL/WtynJbckUl1
	7URCMEKckse1N8W9HSNmx7dLhlnuu0/T7qKPAPgU3inUDycsiCRNO1USj3Kb8hQGgDc1yFdyKGa
	cS/3dxnBBx+tfMCO9dUPixowz9chc2lll0lx0jKdGozuajunYq/6idtWpNdY575tHivdyNRb0Dp
	1eJxMj2ZHJBgp3QV/5ozUKOBwZlVyuWoejiRwEqJodbyW8gauWydoei/uPLUayvGoMrF34UMlao
	IhJZoFMnVQ+KxyppaQ00UnmetThap6ibeRDizLLbMiTP62UJwyaMIg6UcaaQ7h3sHLFISJ8Wpvz
	FChSmg9HOUUbyNoU=
X-Google-Smtp-Source: AGHT+IFJClKdMTkSaxoreSQInmfkuGmWzvsXBbKDgFdDGxOyg0dhDMD2DbxEemQO+6juz+ShTX8Mwg==
X-Received: by 2002:a05:6000:71c:b0:3a4:dc80:b932 with SMTP id ffacd0b85a97d-3a572367dd8mr13087576f8f.8.1750277657675;
        Wed, 18 Jun 2025 13:14:17 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4535e97a795sm7124715e9.5.2025.06.18.13.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:14:17 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 18 Jun 2025 22:14:09 +0200
Subject: [PATCH] arm64: dts: qcom: ipq9574: use 'pcie' as node name for
 'pcie0'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-ipq9574-pcie0-name-v1-1-f0a8016ea504@gmail.com>
X-B4-Tracking: v=1; b=H4sIABAeU2gC/x3MQQ5AMBBA0avIrE0ySglXEYuqKbNQ1SYiEXfXW
 L7F/w8kjsIJhuKByJckOXxGVRZgN+NXRlmyQZHS1FKNEs5edw0GK0zozc5oezc7pauGWgM5DJG
 d3P90nN73A5xmnZ1kAAAA
X-Change-ID: 20250603-ipq9574-pcie0-name-c9fbf251406a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 devi priya <quic_devipriy@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

The PCI controller at address 28000000 supports PCIe only, so use 'pcie'
as node name for that. This ensures that all PCIe controller instance
nodes are using the same name.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 815b5f9540b80e91e81e02a97b20c0426f40b003..8ae4b165c315394532006665235592add112d266 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -1161,7 +1161,7 @@ pcie2: pcie@20000000 {
 			status = "disabled";
 		};
 
-		pcie0: pci@28000000 {
+		pcie0: pcie@28000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x28000000 0xf1d>,
 			      <0x28000f20 0xa8>,

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250603-ipq9574-pcie0-name-c9fbf251406a

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


