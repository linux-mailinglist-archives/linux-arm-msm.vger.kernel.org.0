Return-Path: <linux-arm-msm+bounces-104788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COcAKeie72nwDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:37:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BDE477BED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FA5A300F128
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8543E5595;
	Mon, 27 Apr 2026 17:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjH4Qx0/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQkYblrA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3723E5573
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311428; cv=none; b=kTfNuBzHHeEsu1sS/ZmSnCtKxbeT5iKS1REtePZo4UIpmya0V+lIKDZNNM5vk4IPuRaqAwxm6etcYPgyH3rH+AjdhahE3pMXD2uYVfolGrmG9WlFl7AomDovgYABGGEdEqPdCOzI9N3SqorhNIUodfPt0hHZEPwqz8qwGvneQjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311428; c=relaxed/simple;
	bh=h00z8eJrG9Om/PVeRuYJqWqHHclJ/SVVNDy0H5KfL9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLevYSsXFGTgOgxxF8hjfkXsEs4GQRCv00f6dfgIfVPo0ZMgSvrmaHRiPyT8268Q0mEWfMehpAVpiP1LIQrhImYMHSmtvMLciDb9+FwvCGC9QvCmq/4QbVRqaPIoEtg0yBzW/M3CSRVCNAqRqxjEZBmS7u8gMRajY89iIo01/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjH4Qx0/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQkYblrA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDtqM4241654
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oiKYNjR7tdA5pwtW1ikVn9/8qKjQhXp6ICOArgh9fU4=; b=SjH4Qx0/YBGE9Pkz
	+EvcyMX2J6ffdxIzk5k0z3txVMhYZ3+ebNnCGADmPm5bIzE5xeTMCJp1zEKWIvDb
	vguIHW/RwUljNF1tSJZXVOceMF1PCUxOhSjz/1r4WZflca10YE+566I4yRSdnBDH
	XdcdHI7V9sStsz+uplme0GiTWypJjVIp/10lVPmMKp+uLFhe+LUTK1fL9M973Lvw
	VUor2HQU5pADclP9Ja4sSDrl8AGF/7tNvWDtWNsBuQ5RK4TGw6GJrrau78FUUNad
	iwyQ2Lfe45gCYIkEspU6SW7l0Ja3GQjqQxlatAimPicyDc8T818zBvjF67Xrw+Qs
	igbFIg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946ruqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:37:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso96129915ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311425; x=1777916225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiKYNjR7tdA5pwtW1ikVn9/8qKjQhXp6ICOArgh9fU4=;
        b=aQkYblrAcr4kQNgNSUuA98+GsCd3mFkakF9/nY+Sd7v9ecmoaUUl7WbCgEjfwm4BF+
         fiEyq1fQZ2oQuDIrhX8mokigqz/0GRlVjKq3eoYXwCLwDW9xM4cgtdr3E+PSQOQsNyBQ
         xDCuzt0UV7DHwF7KOl2xBmc/b9vllA4FePBBYyjh2yij4c3xDLid5OsQwnA4Tm36fkpy
         m8SOQJQewsvmt3k8yXXRVdVLMNyLEkMV8lw13ij+EINVYsZShW4NnLOaoVlg6jvbYxGL
         MtcLlBiURaacKdaLGjdsLWOX9U+396SSbE6PviBYss5tLBTbFe7G/3rjuaTuWu26BI0o
         KHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311425; x=1777916225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oiKYNjR7tdA5pwtW1ikVn9/8qKjQhXp6ICOArgh9fU4=;
        b=hOcAZ9lT0ebO9IGFBVMWw6JIVnxeUJ/1150FUYXOCioVbwNOgUy0sshlu4612Mnwzb
         nPUCc5NkvUgaKhkJQeaSxElJ3SjSRnOMwoTae4/BmR8oXBtg4Xtg1YyDG4ymaOkwCoMo
         QZ/FXovYWrvHDOXrusf861xtK9gNUl4fAIDihqMnk3TxtH6Hs/UsrKRzR4niWuyYc77S
         6djZoY8jvN2ZRNALqdoz5xfaz3Mv1z83+J2gvRAsIqTrAMyRqr5qS1k3Bz/rx8gATgwY
         eTl7lu6/H/BoavkvguHHZPxZTa9QM1iWfOncGwXcxXpXF+Zlxl9+0UxR/U6eNpM0OUAX
         yi6g==
X-Forwarded-Encrypted: i=1; AFNElJ8AlEj3KFSdPvBKS94lDdiarEzlv6rwHHhf4FhdjfVOo5ogHAhp07okysVnCFlInoYqXzQZKZUfeWxqOI1c@vger.kernel.org
X-Gm-Message-State: AOJu0YzBh6uinnHBRjWeYJkgfqMxlZjjJ1BDnLOra06/cQujpIwwz2Sc
	SJW6/iHT41XkWO9aJxC4QH8X7skem9de3exp/fg0+n/0jy4wEfAg3bCEZWSCizhU5/JLTyzE/Pd
	ea7TVKv9LzU8JTdsqPMZMJnOnBu0e9FRLp7eWfsyYVgsNCHvMSdytmGnlPQDtxMs3tzIW
X-Gm-Gg: AeBDietB7DOcJy/TN9jsue+yej4rmPDEjws9jmW/5/BxwwhUHNVMQuulE5nKzcVy3af
	0j/MWaEfxDqyzA0rKmX1pFYS9a0Z4KrHdvvUWcGNlwQ/BZtzpLHVU1YVO9TUMWUQCyjAMYaLI9P
	A9ljbzB8MJb8rtHIyuUEcIx+5/P1P19wcVtbyJEOIGh95HfHQtRFoUvfxUo9teuOgWyE0viMlYT
	y7sSmT8NlEmc1Tl/PmZ+zcjqkEKpmg1WkDePjArsqWZJ9zEixHl2ac/p+MKAkjbY868Al8Dl5B+
	uXi9ZfSuBMZj/Q797KknMpyOgAwDsOKZQJi0ir0SOxN/i/HdgLIjdr1odHKCq25yZjMlfIeOrSb
	pufFNmG0XDyGVR6iA+VOopYWEte+k9aishoNOxjZDu0YgutHIzF1xmplbaRCt2ENjUd88
X-Received: by 2002:a17:903:1a6f:b0:2b0:61c2:8e83 with SMTP id d9443c01a7336-2b97a924669mr1659895ad.20.1777311424483;
        Mon, 27 Apr 2026 10:37:04 -0700 (PDT)
X-Received: by 2002:a17:903:1a6f:b0:2b0:61c2:8e83 with SMTP id d9443c01a7336-2b97a924669mr1659515ad.20.1777311423818;
        Mon, 27 Apr 2026 10:37:03 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:37:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:51 +0530
Subject: [PATCH v21 11/13] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-11-dcf937775e73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2273;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=h00z8eJrG9Om/PVeRuYJqWqHHclJ/SVVNDy0H5KfL9w=;
 b=Q35HP/J2vtbEzUDMZsMZbyjq9HYtQfZXXwSbRotBnbtk6hYnUlUP8WvO7OSd1uQ/nBxMl0dss
 ABpqvPjag7pDem3Sei7AtCm5F8E1ZQvfuNpYj2jLju6vlzV4BYHiHVt
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69ef9ec1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 8jM0ym6PLvf9XBNZkswkSwl8i4HHjcuL
X-Proofpoint-ORIG-GUID: 8jM0ym6PLvf9XBNZkswkSwl8i4HHjcuL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfXyFKs74DvPPPJ
 g19GjxFcsmnYL5/bT1+sAHxXQPbbFAB7TMvt8Wzp6Vgj16uI30l86+0z/18k/l/HxsR4L3RLAwU
 kzYgAXqe0/vFdDgq5mtZCPEkN2NvbBGEzPOkcxneswigMgF319XUYowCjPITeERG90cBWXBwRoc
 H+zwjd8uNMiXMOJen/WadfJ2gSMvZWkz0qGHsl1uoS1JfEWK8wcTWclecSQrdW1e+Ri9MO4A+O/
 hv7MDiH+1fKw+wqGZ9Os01FRoY1BmF7u9e70jYPtpP8RJResuVZiDKpeOEGtDP1W+tlTJTaXzRi
 ulgSi0bCIA2U7ejCp9QtxmvFw7ewLdcdyTZR175Mg2WnDfpxctBDj0AftkkthbZpwA77gFyMZFU
 fhtlOFjCW/PolXex4p9WOHBSYgNQ463OwnlseukZO7z21NMnoYyTEJ/8NyoE6WRWdoM0yzj37OR
 XzaEjT2jJTf+VoNJJjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270187
X-Rspamd-Queue-Id: 49BDE477BED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104788-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595cef441f4bd5ba21fe133652b97c6..8be0f50188839e6301e33a50948a523825fc5a6a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -758,6 +758,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 31bd00546d55f4e37f6dd8db58f0adc36336d873..ff01f71fad54dab735e799eeb25ce9d0938031c6 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -704,6 +704,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e7635182307386c06b16a547b52e5bc4dc2ea..e3ba8a4b57df02687e1321e3df9f1e9856a8588c 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -559,7 +559,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


