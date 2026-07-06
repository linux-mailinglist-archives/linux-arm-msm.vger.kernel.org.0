Return-Path: <linux-arm-msm+bounces-116633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eD7pHaBFS2rvOQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:05:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E1270CC5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:05:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ORhYOTG4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=crSG9yUc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116633-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116633-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08BF73019923
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 06:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8553D3BF68D;
	Mon,  6 Jul 2026 06:04:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C773BFAC0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:04:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317893; cv=none; b=bzngkIkbBgB7W2SsL0sUzpDA+TO/zBr0ZjUzIG4RqEVMHSvejhHJ2L3EJdA77ONfsWkPrcso9SE6hYQuXarGXBTJWjWUUkls+0AZr0/5VtwMG/HcvpKoZBkp3ASarBbjPipggcNG0/bmzKw/TjKQV4+oj7qHoCVTlN1S6bvoDis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317893; c=relaxed/simple;
	bh=gGSQU4jSiiX4CxuX084+dPf9muR4QVsmsPL3s+XDlL4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DMg9KyswvGtdMPrG8ktsVfHU0M/v2C7Q0+iEeU/gzAvVEIyqvmvGljentBA1KfPQyPhBDoGI6j4BvLQdqR2gskBB6bTHoW/RgtJeeh4TESPqit0bpxaaZynhh1xRg7h9LYjZnVbJ/9IODKrktSa+C+dmzxQnaB0lEpYv8mCoq4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORhYOTG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crSG9yUc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641YAA3593835
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XXZc4kMI0w9drHzHaT4ieS
	dTFNSAt7PNw/13BBp0mII=; b=ORhYOTG4dKntTjiM+4crhjKkOYiOe+AmhUs8rC
	t8X6ckH88avFKq4MhCfWdTDLg1AQPDar4b8FcrOgwDjyJsyqas8cTXI8DQo8rra8
	aYd4Gk+FLNCDsVGUDDZXxFbvCt3RICdICJorqM1pACM/defX/JMudQtTneC4mipe
	tLlsvB+1siAalg526Uc9lCi1S/CeaUlxhXr6zqBKCk+76EidyuiGWT0Yk8ZiOuTz
	78N+Pl8WgrS5TJbuz0h/39jPMYpq7zAq3ZNq9Gls1Z7JPRdYBUP1Ybg3ehB36la+
	uRwXqPqc9z4ea6v3P4xDxpHce+DH5idEU1rOHryfMaEn5eng==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh4qq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:04:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f544944so1905887b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783317890; x=1783922690; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XXZc4kMI0w9drHzHaT4ieSdTFNSAt7PNw/13BBp0mII=;
        b=crSG9yUc8qJxvXn85R3OpT9pYmP0zw3IyfeKZuMDRzyAOw0Gtqw2QDD9/6fMw5ABxC
         XJv0YIVzs7ODYQLjZRVHhkyFX05Dmz0k0WWSjFXhEtNE/FgQqmmAOHTbwHtyHNPnfsFN
         WLfSr+hrp3eor7OkkQLcmkXHVk3ajH7OqtUTUTFzWpqI6yvmvpOSCMjU5GvYQ5qIwTvi
         ulG0SO0FBUM/pRiYcrraoh8Q2k8vk9WrjapcgoxMvLANL7crgyq5waR8/RyFlPbN/62/
         cSxeQCGVLeCxhyjjfxlt5l8xvPFiFYKTx9r5od5Hquu47Lcu5pZY4mrDN+JdwfIRxVvk
         Tn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783317890; x=1783922690;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XXZc4kMI0w9drHzHaT4ieSdTFNSAt7PNw/13BBp0mII=;
        b=jhsFdwsnrWe5OoV0Ng5Ij7DgQ1PuLdSpSPvGuT/JnYvKF+jD5OGEBawLX/th2rclpe
         1O9Pf+UaHlrVbgbDOHsCMZlRyWcAPeiyIwfR6M7PXF632Soq3AsDkqK3lVnrLW4UATyR
         f6bUT4vpZLRsuCi6FqH09AZ+k2FnJC2+VryC5e3rzu9cG+jhaTU5nanAu2QiiOr1XSom
         ZcT2aUSp2KQ59sHYdEEAUMvV5X/KhpcPLyDqB2jPqCVNmSWSjR09qmA9sPpMn2RSKF2V
         7xOJkNfLw6y74+uoy9g/ROik3pOMzJ57FP9BWGPkzNgti8xBI+yUeIfJqG/bbPf/VR/x
         3m8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqVxhtr2sHgw4Hm963DoC1VwHUuhcLFZfcvlhT7EGJMwBFUhqdRWXNXy2fbRfyfcmYwstG7B/dKyMucWTzv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0TzuFqypoXmfUjMiUl6fWMEG4+AzNJcNyRCDbmHsjcwy5yFHS
	4Jaskm4nGksUEeRSpUUV4u3fzFkjVhlaUzUcxrbdFcBK8Z0umevDnHW6/UjijA4jMpeQqHrBZ//
	cjToUc/4aMlHndtj9tfAnrZ+6RLvcknOZTPEm7QB0V1B1c/UEFoPB+UUfW4QLWO9GlirE
X-Gm-Gg: AfdE7ckYJ1P/K/nxCn4ygiLdFctS81lMRyDcOb7J2R8Se/NepdSQc2K/D6KctLPHBMq
	ZlEUUDuXd15IRNEBHgFtgsTpeSOI67qBRDcTXr5Z4sXUwOVAV4aiVlf4ih+GKmsl+1TdrMd2Qxw
	OtAGfKFWfLiYyKf5b0fV1ua6qglqqBhwR5XqGsyP+0Q4z6XCiAQrwIrloGN71in1AnPOA7aAyXW
	YoJfqkYKSzUoGGmqp2dwR9TgPyNW9ZTaWj5s5yFrPFmPIenPvnr57+NvKp2j8YHBS7cVVTvzTZt
	cNxZsUI+8AWKkihv+Lbjv27ABuCw1U6MmRa/D50clVqME2Gi2dxeUZTbkn2JDsdI404S0rwb3oU
	omx1mB4UgUW9a9z1XQH5YSqNWrfqz6ML6XnAMNQ==
X-Received: by 2002:a05:6a00:3403:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-847f6d593d5mr7880250b3a.6.1783317889805;
        Sun, 05 Jul 2026 23:04:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:3403:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-847f6d593d5mr7880222b3a.6.1783317889299;
        Sun, 05 Jul 2026 23:04:49 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498dcsm3113266b3a.30.2026.07.05.23.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:04:48 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v2 0/4] arm64: qcom: dts: Add display support for Qualcomm
 Shikra
Date: Mon, 06 Jul 2026 11:34:40 +0530
Message-Id: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHlFS2oC/22NzQ6CMAyAX4X0bMk2+RFPvofhMFiVqTBdgWgI7
 +6AePPS5Eu/fp2AyVtiOEYTeBotW9cFULsI6kZ3V0JrAoMSKhOZypAbe/caTY/bnvFgpMorKlJ
 pUgh3T08X+16b53JjHqob1f0SWozGcu/8Z306ysX79fM//VGiwCQpdBKcfG/EyTHHr0E/ate2c
 RhQzvP8Bdo/OW3LAAAA
X-Change-ID: 20260626-shikra-dt-changes-8d127be951d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783317885; l=2973;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=gGSQU4jSiiX4CxuX084+dPf9muR4QVsmsPL3s+XDlL4=;
 b=PIyj83IU2iaFSgxUheV/fdsiZQuLyg4fcG3g1hgl8cHVg604Za96wkZ1H140BA0i2ZzvAIXVf
 N8qrPRaN3LLAcqc6NUVwUU/CoWv3LaM+eOlWVCKNiwncfzCwd/08PfD
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4b4582 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8
 a=EzW1FMLw5TrtRJQtR8UA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfX5Z4mTBW7QyZr
 6ug7Y8pdp7UpCJf7efaQGp11fsjiozESuNzwKnqRbGScUplaqO0k6KbPkr9ygKgfLatfSFb4+Bg
 eXfiPB61/4zBA+kKg06NqVq+k6zyx1daT3brdiGUb/0yKTxfYdwtwUE9NsjQSCR27oyPud++R5O
 Fk7rR6G7Ou4yHYqVjNDmYe0Z3BQXVZ32DtWmJfGSkR8V5OBRlEG4KAlNYp8Uz7ca2z15egSLmNA
 5t6XEgD40fV1LA2pylzHw+1YJsb4qGNZuwXR2tHlg/Me7DL8hoWn0AHhlkdAE9+DwF6b0tIwpO2
 M8WrgLbOZ8+VCtPXahX8/udZi01EDfEtAWIrARXH3fRWQz0pnVpV7Xupn141G/3Eoom4L5oFSro
 y90cn2g4+kkwvNcsfch3LCpWT4k7b/eCr3PPT8izCplnEDFYgPRG/yO/8ZbWfbjvJI14PQYCfRy
 JJKAIJTw/Nzly9MdbAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfX6sPEui95fyEp
 vKHorHsshnQcg1GQRGmmATPUWzCHdLXV3AXPditzsKtiJNImu+tocE7gean9xgTMk1qynqE21Zl
 Hp31RIuBH9bUKTqoliRNkjWepCApb5U=
X-Proofpoint-ORIG-GUID: h3rngo0xtnpcEUZh8SkrgSImMpg3t15O
X-Proofpoint-GUID: h3rngo0xtnpcEUZh8SkrgSImMpg3t15O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116633-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16E1270CC5E

This series adds display support for the Qualcomm Shikra platform.

It introduces the Qualcomm Shikra MDSS display subsystem support
at the SoC level, and enables display on the Qualcomm Shikra CQS
EVK and CQM EVK boards with the required DSI panel nodes.

---
Changes in v2:
- Replace QCM2290-specific RPM power domain identifiers with generic
  RPMPD_VDDCX/VDDMX macros in Shikra display and DSI nodes.
- Add missing blank line before status = "okay" in &mdss_dsi0 node(Dmitry).
- Split avdd-supply and avee-supply into separate regulators vreg_disp_p
  and vreg_disp_n instead of sharing the same lcd_bias regulator(Dmitry).
- Sort tlmm pin state entries by pin number: gpio3, gpio86, gpio91,
  gpio151 (Dmitry).
- Add vph_pwr as an always-on fixed regulator representing the main
  board power supply, used as vin-supply for lcd_bias.
- Droped the 5th patch "Shikra LT9611UXD support". NAK by Dmitry. Once
  the hdmi-dsi driver is fixed then we will post DT changes.
- Link to v1: https://patch.msgid.link/20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com

prerequisite-message-id: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
prerequisite-message-id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
prerequisite-message-id: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
prerequisite-message-id: <20260508134009.4582-1-syyang@lontium.com>
prerequisite-message-id: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: arpit.saini@oss.qualcomm.com

---
Arpit Saini (3):
      arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
      arm64: defconfig: Enable ILI7807S DSI panel driver
      arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel

Nabige Aala (1):
      arm64: dts: qcom: shikra: Add MDSS display subsystem

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 126 +++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 126 +++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 203 +++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig                |   1 +
 4 files changed, 454 insertions(+), 2 deletions(-)
---
base-commit: f28fb4ff0d25819c58341fec6e3953f1ebb1fc2e
change-id: 20260626-shikra-dt-changes-8d127be951d5

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


