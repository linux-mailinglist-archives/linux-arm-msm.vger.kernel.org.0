Return-Path: <linux-arm-msm+bounces-42938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F49F8E74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1B1516071E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8031A9B3E;
	Fri, 20 Dec 2024 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="srA+c5mv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575D11A83E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685198; cv=none; b=CmPszgKk6ABDBCVW2QOad6rbwBipK1apHIEVhuAA/MK7V8mlpQJ67fKrWxxCSCy29lxXIy04mki9be+J3C2+f0xbKkEvHtqMO7oOIdCE9oIXd0iAKRlAfc+FhdZSKMdZdSw4TS4DN6j1vvjv17udkoxFF9BcCAGj+aSph4Bobso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685198; c=relaxed/simple;
	bh=B/CSxh8bc02YGzxj4Cp8fAYbQzfHZ0MyOHkF9uHAlPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TzX0VTvz4QdzWXinV1Xa+611sDr8Tfnq9cTWlXa703GTUBQulUTBs65TBay3wK++HeKu3q8LMh+oDlZJ2fzGcAdVNf7D2zGC7SAeEeEdrtmh9luxNKOJ5gIrh92nTeUeWtJRIaHa0ElO8RfQszg8MDtGZpDqgBvtKT5L9IrdfRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=srA+c5mv; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so2251865a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 00:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734685194; x=1735289994; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AvLjk+c7NI0W4wMRUe8v0vkFjUGPpNKl7JTlpY6nKSM=;
        b=srA+c5mvSf5bH9gWc20ubWKiWy4hWZUtrPSmLYZE+W1mCrP7mP2V8v+KmNj0qDBAza
         NZrudquBDpd5p+vy4Z2LK4MqUU/9YCPdi/7prh7cZjkIFTNMAGdfcScpUlwfXEVksere
         xZ6QA56KqrZAvzU+KnscMXM26sNFQnBiuKyaSAlS02EUEK+4HgAz7WbSGyftKnhVEvd5
         O1+3hjgo+M6zsg8JJxxyYuIpgM7JBKrDjpyHdw/CaOCWh9exAlixjWLoMkn9zIdt2XMD
         BSOv6TuPDPZqUKYl96Gc0NdrdQbU8fkd6VQAM6dkYSKA+jdM4cPS8v5JjKSlLTABC6Ss
         RilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685194; x=1735289994;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvLjk+c7NI0W4wMRUe8v0vkFjUGPpNKl7JTlpY6nKSM=;
        b=wPFLL+n9c41N02a2jvCKAuVbEIgzeoTAH87le1+AYYrc9brTPROV7JpgFSyKPzVRRi
         KtLoNuvSAtHuKaKBwNCiGAyUxZsS+di1+KCwy869EFVwJ8vpWO0e867j0tWB1V0cLLe8
         WtdYaSDxa+z9VlFmtFpnCxEvwt814E7sNlstxm0Idc0J7e5TXIC4xHOZh8aysMAwfUgr
         WzpdcnF2EK1fKjVI55iP9HyQtrokWNltEzuoJEXuNb0Vk0+gLE4S5TYZkCqGYrVuTeOl
         yxm0aHoIsRNH0h5+t5GNatSKXnrUbXKJL+7iPCXYabPJOMBtDum3WCB26YTvIny9rteU
         A9qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi59SBzIHZeNJMLmlLs5/Aq9UbW3tr0Lg+SZVVTW0h+uRIV8QZZwaUV7j/Adma0tj4sGvz7FNVhJpZ3sSK@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQ09nLJOPhkvePBpBIJGR1QcjpHTJ43uDCPk0N4KsjbEYv9fs
	EKSaAD/Vo51PRSgZEpfanWNzGgOxDB/GxpJL2/+OjbJoAUkulJZWfVN1pJEw0Nk=
X-Gm-Gg: ASbGncsopxAtz/7WDlfaaFHoJjMhsXbUUBXSTYu5qZ1S60f0TDnwMQDkbKgD/giFLlP
	YD3gthVJ92rtvk4CA643xahOKDpcEBzR5+rQLCsHt906DxUmUiVQe4vrwvIYxXjxT0vWUrPekVh
	XY7rxFpEkA4iHr19Gsro+exfCxXAl1UiLlE4VmU3qJA92uu93ocoOXBr5OsX8GEoRYFtrWmgxak
	hBsO/5VUQG/+JuHgvY8yw4PBBf/KiZFsoPT8fHZJAuGrEDuXId+4aoOMm3ViN2dqduto0heb5Ag
	iXshEPQy6Qnaae9y99Ef2Dhwt2QCOg==
X-Google-Smtp-Source: AGHT+IG4raqmf5z3+Bbit2pptVJL+0AF6PrPFax/4lpRRdG7CllZm9cIM6vpTrrrMN18RRgqKa7m+w==
X-Received: by 2002:a17:907:6e8c:b0:aa9:1b4b:489e with SMTP id a640c23a62f3a-aac2ad8ea23mr156763466b.24.1734685194579;
        Fri, 20 Dec 2024 00:59:54 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f080c1asm151178766b.205.2024.12.20.00.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:59:54 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Dec 2024 09:59:50 +0100
Subject: [PATCH] arm64: dts: qcom: sm6350: Fix uart1 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-sm6350-uart1-icc-v1-1-f4f10fd91adf@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAUyZWcC/x3MOQqAMBBA0avI1A5kU8SriEVMRp3ChURFCLm7w
 fIV/yeIFJgi9FWCQA9HPvYCWVfgVrsvhOyLQQllpFIC49bqRuBtwyWRnUNPxgk7dUZqDyU7A83
 8/sthzPkDzf3AwmIAAAA=
X-Change-ID: 20241220-sm6350-uart1-icc-de4c0ab8413d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

The path MASTER_QUP_0 to SLAVE_EBI_CH0 would be qup-memory path and not
qup-config. Since the qup-memory path is not part of the qcom,geni-uart
bindings, just replace that path with the correct path for qup-config.

Fixes: b179f35b887b ("arm64: dts: qcom: sm6350: add uart1 node")
Cc: stable@vger.kernel.org
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8d697280249fefcc62ab0848e949b5509deb32a6..7b5c340df5f6f32233f4254db2012f84bdde6be2 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -936,7 +936,7 @@ uart1: serial@884000 {
 				power-domains = <&rpmhpd SM6350_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
-						<&aggre1_noc MASTER_QUP_0 0 &clk_virt SLAVE_EBI_CH0 0>;
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241220-sm6350-uart1-icc-de4c0ab8413d

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


