Return-Path: <linux-arm-msm+bounces-104789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAdkEN6f72kcDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:41:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AED0F477D1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11890304D15D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645333E5573;
	Mon, 27 Apr 2026 17:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pa1kiRR9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSQ4Yvkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B363E5EC0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311437; cv=none; b=cRGMWwRmPW0grO50mJH2U4YgHRcJGwqVjKH4qrIcLqocshxOgkJ3MoPvhdw9kWpLoWULSJfeHWy7NMZ4fWeeBEtx069FRhPLMWyXG6AHWdlMdHgCJnILnrNpl8oaKfFBURwiiFQXwjU+7oSjzifJKFy+MtxKYyjPrbgHpxkUMsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311437; c=relaxed/simple;
	bh=5QIzxz7gWGxheo3NhPJy7cnaOZvXTFo2HH4ZUk+68mM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYL2bCsyfHYpGbo8+vv5tUrx/JqRNWF9we+QrcpE6W0go/klMcWzmkhwf1JYALldZpYdYV7HrgikVYB72G+PeuwQzYOg4bH+qM+Qp+/EnOwvmLFBIA0FCY6oTnA4y1ds9IDaXum8bKgYnei1pP4F7P7rhd3FItrYvSH/IYz+OT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa1kiRR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSQ4Yvkc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RGaMu73123484
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbPQdWSvpV1A9Kh3jDfv9xIG/RX44VAlr59SkR3C6Vo=; b=pa1kiRR99pQd0rw/
	3Io4uUb5Ect4M7AQha7O+U9rTWTepqY+VdZPBtStrlH8sbijExxwtHilnTjbion3
	y/RhL1XNQJYxFOnOqA3AQFwgx+ts5LWckyghw/wvDcu5TJuYftDfbsZs2cNBsa4h
	GN9s0xbyjUc8n3onvZqYi9uJQbkA79yS0e5xHCauGBO4CZNPQKM/T8HNqycel9nT
	CHa+zHfJgmLp6gGhfEXfdo9NxZioFXUz6WZvzCGsrhys9sgyIqPDrgZ6qEUx3Zvl
	enYQjfLRNHStjulukiCgLJS++Le/1r7kW+dvriqHmb6gy3UD+CS+5YxCI0jQZMYk
	5Oal8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qghpcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:37:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so10475461a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311434; x=1777916234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbPQdWSvpV1A9Kh3jDfv9xIG/RX44VAlr59SkR3C6Vo=;
        b=kSQ4Yvkc8q2aQ4Z1IBP5EH79GFaxgN/BE9Snz6hxws36qOCf8tDwKFms/FMrcqgGo/
         r2Hhj3zKLFUN1ZHuzVYCmy3zSwXtnM/WSJfDz68XvP8ap0Tn++poSp3u5IuWTwU9YAm5
         jh2eWV6tSfWqxDL4MM4rVFPn5N8W4TITd3WnU41gHJyL0qRuSM+1UQ359A9HgvHwrUnS
         VCCkszUkFpaqorUoxIKGf9N2bWfELFk9nza3mgjFkroBR+cI4seshCjR/nAxnIr3sE4T
         pUDFyxl5IIj2e4fWgjCN1clCG2fiDPiZu+YiFtQCvqsDplnzIgd8LtuBVT8UfgCuUb27
         Dubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311434; x=1777916234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xbPQdWSvpV1A9Kh3jDfv9xIG/RX44VAlr59SkR3C6Vo=;
        b=QOTrmPBsXHj2B0ITOffbr7FL6v9+OSIKBAqddr4+a1aY3nFmcdkYDnHE9D04zkOKGo
         QqotzNVoAmGDu2aYOk55U+QLjaA/CAQJvoznOW5BL0XoMpaTNCXGbsc7/zvgpxXHnhaS
         rU6lU0Q0G/lkkvkKBZ3M51qW7vbx+2k1pIIr5vLeBIXE+Pyfo3cY8Oc1lDbq2Wmry8WT
         yU9Q8ODt/2QrM5iGCnn1+e+tAVP4I9Trs7mYORLrKPDW88dBLMoayzutA8DSDxVdV3fu
         ZVgZLl3Sx4YrStrYz7CTGwoO44KHXvdtyQW2xwJyK/N8zEn+ZoGs9dBtOaDDFI5mGEus
         +lsA==
X-Forwarded-Encrypted: i=1; AFNElJ8DFB0nWFGM9E87ADfc9eh5cbXeSrzMAZGOb8wGEmn0L/UJKZB8jFHd03sCT/Tmmfekr4Q4ct/Muc6ne5Vp@vger.kernel.org
X-Gm-Message-State: AOJu0YypmXF1ZkrcqXe6N0wQB6m+dQYhmO3HGdc1J0xmy1ZmRsctgTeM
	7m3+X8KBABs0jwtcvE5JA51As1AL327UEX0E2zizpfPrBf9ge3YJfGaIe9mWdiFFdgL6i/McaUj
	YuTAtcYEhNxDY6q1oGXX4PI6y4JrGUVgAaRGbGKUphnTD0NP53aZOVfgK36QWIfxcpCar
X-Gm-Gg: AeBDievEe0cr4KjrPlVPCicoyoEKud0iCxTK/EqZd/B1uNxyE+xnPZ1nteV+5qG5Xso
	7O/9G5yAesGO0yWElP6bYafbrDsrAIYB+MCCEqxVLFez+HSszTFGwqZ7ilVxH8Edyrw3mB+MJfm
	5zfsbzS1f0IpthFaJ2Ay2dHgryerlYqi7uzBvFFSBHcFYF22Jq1ycsYKO8JbOkeAdwKX9CHMy3i
	OmPTSeCJAhPwCPuegzqQNrJNfdbtyrgp2wi36sBAy3aPQmA/ebuUIhyO7AXCunzsU5sTmTGyedb
	EDHg9BvRVgHBnc5iw58NcSkiyf57cOUH2CW/ZgvnphOaGdFQlZKC/UE83CmmQeDoIbQonBaDaw/
	TrewBlGSGnlrgqNoT0jp8+CRZY0RK+OL2Rz7SNgq54UAzbywvEMIy1ZQ+z44+yEMNjILx
X-Received: by 2002:a17:90b:2747:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-36490caeaa9mr35330a91.21.1777311434381;
        Mon, 27 Apr 2026 10:37:14 -0700 (PDT)
X-Received: by 2002:a17:90b:2747:b0:35b:a7be:ae47 with SMTP id 98e67ed59e1d1-36490caeaa9mr35301a91.21.1777311433790;
        Mon, 27 Apr 2026 10:37:13 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:37:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:52 +0530
Subject: [PATCH v21 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-12-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2171;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5QIzxz7gWGxheo3NhPJy7cnaOZvXTFo2HH4ZUk+68mM=;
 b=325D48bjWTKLlbPLVqjl4k3qXSzuj715BcxjqaXLOtBtLhOIIX41XNRMTpsTte806BXO9r4FM
 h4AC48/o5MuBi+c5QrFZhPxIMh+5eaRSzd3aPipb6c/EUTlGKfAshkt
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX0CQGJueW6OhL
 2WM1t451H9SoszsCzlyU0kGVUvxB9wN4zHWODm4ZtDrBIyK+Q3w+k5mZVQkuEDk4d2RNJgTSsvb
 SmoSD8/p/s0YF2+ay9xlvk3ywQZuYp7UHMVuTFTwbPgiI5ZFWBBnBhCGcCJxcSDIpHk2sYKLtFu
 NQ3Ozby+J9ltn4v/KMRB2afgFOJ0J/58aPpO9FhvgUX9m34+zh5AkIcuSTWB3pLKXxEVM/ePsk8
 Q7E8TJrOV+PXiRJUCloXlHeVLhpunC4hRltDDRcxUB20mpDWRDmU8XgRm3DR9h4OzF7iAg2zO3p
 7xMkQcWgGyhSDIHxLzTSzmSV4U9muDJW0cqeimMS+xfHcUyL3YmzD0dUCZIHioPNeUQbehFcH4g
 SY7y2ZQ6DHBXq4RkOTCw0jgSHzCfoCQde4lwRWUujE2pdmh7muufWP3EtzVBxaJpjQzon5qLhQv
 49j0wxdhS9hvBFNyO6g==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef9ecb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: FAzoc1WOM0YKOb5U69cB8-LcjcQiFGkw
X-Proofpoint-ORIG-GUID: FAzoc1WOM0YKOb5U69cB8-LcjcQiFGkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270187
X-Rspamd-Queue-Id: AED0F477D1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104789-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf130564efc2d0159ac0de39126e80..df668dbf2bc60175c36cabfa310aff625647899e 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e6953acc7fa06d22a1f83ab24edb0..da675f7a8f2d83f3598a6a7ad71a99206213d03c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -674,7 +674,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d821ca88a38ac59a78625707850bb5d..3ab5ae3124ed5314f04202b6b247fbbbef665053 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


