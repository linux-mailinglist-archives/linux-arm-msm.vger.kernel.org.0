Return-Path: <linux-arm-msm+bounces-70410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043EEB316F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 14:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFEEC16D6AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B642FF151;
	Fri, 22 Aug 2025 12:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBHJG5sZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6FE2FE576
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864284; cv=none; b=cFHIvPj+BWOTHs0GZ3EbuDbRbVwPztQjry1qd1+Pek5cIJGkC4cOtNP+nV+/MuS/Io/cBVPgymP1tbaHZBGooTtQKOc5Ey+ZZ28XsTIUV93O5yM6tmaX9/PqF2iW2smslVMVJ+kHO12bT0P5+GIYRn0qs8Qp/Uc9VlOVW2MPUSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864284; c=relaxed/simple;
	bh=SQm20kIaOiWYFBfzGEfwLlwWGDgrofGLefsJbh17LUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHHIChUF3ArvZUe7VDx8Z0Qq2rN8MbkSHlPgs+H4P0cvh5CQsLheK1T/RXfHHFbi9hpVMJc9n/3EeqVOPSrrZ48C/ayG0ATzBvpg9vCwKfHZYr5KqS06x0g2WyORCST1G0VGZwUacXPgISggnLtop1cLHtb/3DjK3AvvU5oHfvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBHJG5sZ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61c25ad57ffso58126a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864281; x=1756469081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zM3/qo32zjBOLvIBZIBEBGO/3GnYRbMH0KTgG3XM90A=;
        b=DBHJG5sZsKg+CkDpyojutJorQl5sreLgMm1goGDxVjwDTSVeAmHrZ9AwQ7ryPsxtcA
         aRummyf8mC7U6qjRW9S5ug7GF2V+DrN9JoIOQYq92Gd/kMvfbxz6DWR+hw1XRaENXER1
         7YfAyi0CmMPZp4wRDV6eiPaotDFt9ovlH/MPDqFUMce8BnuBCqaSbWiaBk0nTqIbNt3J
         NMU6sqgCNQfEmgafIi3oXr/DgGhjYlO1SMN+wvf5NZiYELOnWDfJv8V9FMpAoVIL4mJ9
         k9yUdrgN/aB0GCxBG51te3cqpIcZnFs7bHyMOQD7/1lj2cFSjKcgYh9xTcs9WAFZlvfe
         swyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864281; x=1756469081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zM3/qo32zjBOLvIBZIBEBGO/3GnYRbMH0KTgG3XM90A=;
        b=lREZTyIqAdej/wwrf09oV8g9D28frYjk//5apOXzHCl7ZTovvln3IUCkuA4dJ0DQvr
         3LXQxaMFIr68sF4ZTpKBWK1tOFtymgnZEaZK1GJxsMi8dpduEZPVLyHYbD4s4rDg3NiD
         45S3MZOx8sE5zxesHgUAfKGn2qF/+3c7+eNJMu+fTgz5NOXIwV53X7fzJ442jIWuwA7i
         sBD976boHJpDb4XjWiLkG3sX7qtBhaZqj9Y349indqr+vFrINoA469csnPXn5xjX5StG
         gscFVyajQfrrsHnJzAqQePnMDOdFcJRJvhy6+EkpWsuT4rPDIoe5vZV6n/SB85HeZI8D
         Jw7w==
X-Gm-Message-State: AOJu0Yz4zu6+mSSYrnv/O7OzJOwQIBpjLW2FGxDs0C9HByvI+haX8uX9
	FgBOfcG9RLdUXOqJX27yWceYrHOFseSecZDodeSwa4RyNaElxZaEj741I9ZM9+qrWwE=
X-Gm-Gg: ASbGnctweLMPbxOywVOgFwgnEpQ+TP9yit16kcKExCEKWLvZh+4iSDAw6glpic8jiRH
	SDSwbPP4+lUbGsLT3qmmtFDy3Sim2yzP5n+iuYLIaVafk1o0qbKQhDPvJlbkcw5OuJp+5F7n8ZW
	MDoymjLrCXj+aHC956Ows4uSw28efngSNChwgct85jtmiVzCnpKQsfk4a0E2wHAooFgoQp2N4bR
	XNnkFKhbXncLh/7dEU3Mg0mqWjiuMt4vfzfRr4JJb9YU9j3r22HhGKXisa27+zCYijxtLWFlIW+
	zUBtY9ls6Z7mpk1694zO3DTl6FlFIPMTj06ccqw+OIQrfFKn7szwNmgbYssHNPzLDu8rOEh/XMb
	HLBikI3ircjbdeCQOSt8T3O9+r3PKkvl+5KyOxTo=
X-Google-Smtp-Source: AGHT+IFwMiNd25c3zhgrvhAmngDo9FNZRE9nriqcJsOWEo5om0gR7ypTZ1T9dXb++N7wKLpkbtHqWQ==
X-Received: by 2002:a05:6402:2348:b0:61b:6c51:3ffe with SMTP id 4fb4d7f45d1cf-61c1b3b8e86mr1301185a12.2.1755864281284;
        Fri, 22 Aug 2025 05:04:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757b9b39sm6690444a12.48.2025.08.22.05.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:04:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 14:04:11 +0200
Subject: [PATCH 11/15] ARM: dts: qcom: ipq4019: Add default GIC address
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-dts-interrupt-address-cells-v1-11-d54d44b74460@linaro.org>
References: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
In-Reply-To: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=SQm20kIaOiWYFBfzGEfwLlwWGDgrofGLefsJbh17LUY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqFzE3OLh7yjsa4aMZSjWDk8pfgleU6y1gNAGY
 zq6hq/rgcyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhcxAAKCRDBN2bmhouD
 1yOyD/9iykAoYYtpeVzhCG0dNW+0mnJqxb2Zt2XvdCW9roXVThrG5Ok8fIgQ+ugiKYMPe7L62tL
 iKKBgk//O1foNODXR5lsXAE9GAkzr3X+M7WzIeFHEEcsJSK0n+pJdgsSqUxxWQygu2HsoKMkm6W
 DQGMEFoO4qrm88tB3DlMlYANpTxiu41zHwX5jUWcsiT6auR558QIQPXbCglxkZed3MoUTScarZ6
 gu34lFeEWMgU4VAU3/9YuMaEsb5w+NepagzCKlp6kWsyzT7BR/RyDfDHjctVDpunEiQW0LQiJWS
 N7c4wlc/aCb+NBuHQ1rLjmQZD3iLY2Vkf3im4Dydskg7eXNcT43vv9Qe5nqz3Hykz2mBVooxEAZ
 D1IQgfk/8KsqkEuzgkCb0hN+z+7ElKcBCtY8hWZGivdlrNLhvCfbg17WHSygo3EgcU3ZvpvURca
 vMYXF3F22CfciBePz21yUOzpCZmjwShSe0rh/1yOh3/bC5rxKz87JmcX9b/G6TGRuYjbeg+j004
 CWdvRWZsrbC8mMyDsUSpi16vVOPCc4WxNaCkiCC7KL9iced6o8gVOPa2hh0R5gngrwi5RNTC0y5
 x+xeA371vCGgdl55rIMXrJNczUCjqYdQ9xiefGwrGZ25tWSGf+B+ABm9b4cDHxqpksYWl4ja0ff
 Q5yUTaJmGdSgu1Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  qcom-ipq4019.dtsi:431.4-434.30: Warning (interrupt_map): /soc/pcie@40000000:interrupt-map:
    Missing property '#address-cells' in node /soc/interrupt-controller@b000000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index f77542fb3d4fc2fe5998aaea092d62f482af1672..5bf5027e1ad98fef92a012fefe0450c5a3df7e0f 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -175,6 +175,7 @@ soc {
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			reg = <0x0b000000 0x1000>,
 			<0x0b002000 0x1000>;

-- 
2.48.1


