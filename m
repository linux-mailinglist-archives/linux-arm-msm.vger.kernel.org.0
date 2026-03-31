Return-Path: <linux-arm-msm+bounces-101162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI2MBFYpzGkmQgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:06:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78493370FD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FF3C303767D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE5A3CFF50;
	Tue, 31 Mar 2026 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/8XDrzE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43413CD8AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987595; cv=none; b=UioCWwuV4dRz8T73eYU0fO7wlD+9NyDbCqSwwVIXT1NxJjNHoNyL+N+QK2P4CJjI5JxktG0xsv3eAGgein6F1o5Xdw7t9kpGe58NHrBvNEI3Cg8Q2nDWxs/pw9xb/3JGTFT6JIeIWSBbKZyqwhGu0dfy2CbzHE0BmHaEoZ1azCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987595; c=relaxed/simple;
	bh=Jsw2LZX+24ad49I5ppoLXlXypBhq0fgDlxTOnH7YRDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fy9PIj7V6avfwY2NNl+wBhb+pClEikJ6b5lDe/7UDPjY1VufzQe9GD4ovH0llJ4Xq5IsQy+NXaeINfQ/x/WmzbSBCOfSkSmbMZZPRqHWmRF2IyeAF3xyh4XBin/nmUJNILER9/S/cEPN7TR5YASYIJZ5rVgBkGHgpLY72jWNRSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/8XDrzE; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8d0288d24f6so49202285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774987591; x=1775592391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvo58vQkpYun2pER1aP/8VK1/EjAtCoPrLClSYN1Vl0=;
        b=H/8XDrzEjnkTZX0j3TkbF4zrSP79umb61uRp3hLK8f52G+O2gqx1/LJ4UTDWL5Rech
         Jgz171iUsGK4cojfYMHtJugESICe5/wAdUNwz7NsV6SOjyOdOjtR4JCxLAo87robJu6D
         7qR2JcUeAVvPCrwM3kvuPWmPwlT9ebMP6EVrmGF04DhMSvJLD5THRc1+7q9tvd07O5b7
         nh8zim3mugahkJEV1nn6eVs3cBw4zQle3LYlZeIbkP5/Ptpc9arHOdGLlWaCN7OKUoEk
         I0xn/8D0ATlr4sZnifHluJdq0/MPJvUQVgKqw680VXxKBgyJogGuUQGqPWkggJGGlLUH
         Vg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987591; x=1775592391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mvo58vQkpYun2pER1aP/8VK1/EjAtCoPrLClSYN1Vl0=;
        b=CjQg29ApsRAMI9+ShGH6Z/RoKr08LNFShgfT9TfCT902YCcLBlpr040XpqijH38Q75
         5a2xvW63FOvempLbPRqGDw3waba+TTQvuUzEtXN8E9M47JkUZC5+q54sun3ZOEGkhWdj
         VuAK9gyvK4zunJBKR8hqn2v8L5//ZsGqPXVj4AFRPLpVvABbGGEql9iSY085lQaHdyrU
         5XGn43an7HczFk4QwZXDOR2PIjfGDwjAwZverOnEC/AtA9i81Dq/adHQg4V7RStChVEv
         /bBjh1rYhg/mot2joIabHqH+tHobPvt6takKOaUbS0fuJgvt2OvLmbg2sfaSVempzE83
         yPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlwTa8CBoeVpgfRuFdt39Po451h7cJOLJ6LB2dqccA7OjLunxjzeRUzYC/7NcI9P10udHNJOLFe7XOAfDw@vger.kernel.org
X-Gm-Message-State: AOJu0YzDE/NMkqRoRhS+bIEV8AVeHXjJ/XTRqA37piIbB/slpEocEdU8
	203hTXaXrqZe6QkIJ2qTI9bvNz/jDjyeRx11hsnh9IIDa3Or2HVWGaVZ
X-Gm-Gg: ATEYQzzJD46o14u4B/4fRY2QjmoHlWZuClvlLWjDfWty6vRsquW1eO6KIwlDVqmMfHd
	YgOXmZCWI5OzJfw4Wp2ftaVE1X0wWjaeEzyETqLZDU+Tk/PBm2p0Cutn8j2HBWintrD4K18MyQB
	zxxvjkum+ShV86oLxq+o2JzhR6qqZ4RtHB2HcUqCUeU4iZMVhzkp/nirAWWYln5gPe+R6qIbM0l
	+8Cks0rx96LW+oI0IuoRUBIDIxMKQnzPeaqKCLDQzxnTnXH1lzPWe64AcVypNFGVNoBUNlFRUm1
	cRrT576zAI1uW7o78dcC3bjhyKjNoRULQalMsd5jml0d3oIIcrfkpHtOQ28y+iXpIUTxayUyAtS
	Nb+YmtZjxmyawwLSuMtDr/LWhq5LrHXPjLZQW7U3C1szo5eI+5QQYpJnmOeybsGVYqEZUWRie+T
	6P+KKYy4Oe8JRriyA71oNJy0oM68DFz48oqwE=
X-Received: by 2002:a05:620a:28ca:b0:8cf:dbf0:502b with SMTP id af79cd13be357-8d1b642e06emr97471985a.31.1774987591205;
        Tue, 31 Mar 2026 13:06:31 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d0280428d1sm961054385a.25.2026.03.31.13.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:06:30 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 4/4] arm64: dts: qcom: sdm670: add lpi pinctrl
Date: Tue, 31 Mar 2026 16:06:58 -0400
Message-ID: <20260331200658.1306-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
References: <20260331200658.1306-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101162-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,17d78800:email,62b40000:email,0.0.0.12:email]
X-Rspamd-Queue-Id: 78493370FD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Snapdragon 670 has a separate TLMM for audio pins. Add the device
node for it.

Also add reserved GPIOs for the Pixel 3a, which blocks access to the
sensor GPIOs.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   |  5 ++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 73 +++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 0f57b915186b..b4854801a5f5 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -522,6 +522,11 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpi_tlmm {
+	/* sensor gpios are protected */
+	gpio-reserved-ranges = <0 8>, <12 6>;
+};
+
 &mdss {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5b41f8bac7bc..2d5728c75a93 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -2346,6 +2346,79 @@ lmh_cluster0: lmh@17d78800 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 		};
+
+		lpi_tlmm: pinctrl@62b40000 {
+			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
+			reg = <0 0x62b40000 0 0x20000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+			cdc_pdm_default: cdc-pdm-default-state {
+				clk-pins {
+					pins = "gpio18";
+					function = "slimbus_clk";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				sync-pins {
+					pins = "gpio19";
+					function = "pdm_sync";
+					drive-strength = <4>;
+					output-low;
+				};
+
+				tx-pins {
+					pins = "gpio20";
+					function = "pdm_tx";
+					drive-strength = <8>;
+				};
+
+				rx-pins {
+					pins = "gpio21", "gpio23", "gpio25";
+					function = "pdm_rx";
+					drive-strength = <4>;
+					output-low;
+				};
+			};
+
+			cdc_comp_default: cdc-comp-default-state {
+				pins = "gpio22", "gpio24";
+				function = "comp_rx";
+				drive-strength = <4>;
+			};
+
+			cdc_dmic_default: cdc-dmic-default-state {
+				clk1-pins {
+					pins = "gpio26";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				clk2-pins {
+					pins = "gpio28";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data1-pins {
+					pins = "gpio27";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+
+				data2-pins {
+					pins = "gpio29";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.53.0


