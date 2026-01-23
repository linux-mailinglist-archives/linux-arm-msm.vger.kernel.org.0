Return-Path: <linux-arm-msm+bounces-90288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKxCLFEgc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:16:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DAA718EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 696EB3067F46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358E035EDAD;
	Fri, 23 Jan 2026 07:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWRTRMWb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ylq7OGny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C713563F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152368; cv=none; b=b3AXlYxsCr8Aw5LxKVrzXfdGvgd7LNLQUhReZX6bFH5h/l5pZKm7XmReHKpHbFZJQpFVWxS2b3tx+zTybgBlxv0pucwxPlm7veU6rsm6Twraazk75+Hn0RD0C7FPmoc1oWIXZDHoNKOiz+/U7MjzjS+Y2REnPKlLhQO7gDohOnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152368; c=relaxed/simple;
	bh=7a3rjjm5VjPLHcbmM4PkplaRtIC//DdRJKgmUrnWJu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RCmsynnvDusCvckovzwsS4zcN7FXDfXRL2d2edO6gqBOE36HxbeeyRh6CpxpcXFzA9enQm9VYX9mdCL2/qk/g/0yhvgo/0HjjzTDBzuInioG+I7bDTp5W6E22hR8otoo1yZaupYIDv0Zr7Ltbr/5UMihnFW4dOytQyRkirGaRFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWRTRMWb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ylq7OGny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6PB9m3677838
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=baTKwHC9taAEbx9mWDj+YW
	/cnahBV4YzjX147+KjL6M=; b=eWRTRMWb/QPlWfnKC/nH8RCGNVlsgi/TzCD2Z6
	ot0jr73NrZNySlQFS0bk/5PUm3VNc/LVl4qekq4MeQswLFBkaeXzY7rnv2aSyI0t
	2azKtfWw+G3+6NCoDEAmUpJ6JZymDO/OjuIQObvI6TTSqjb3lBDwWszvZhHmdBqf
	FhlXW6xINE8kTtoUefUw720e2fVGcsvEcDCii/Uh4+3e9Q81vm0okmVOyrRagc15
	0cJ0FN0EOHGEzcCSzmASN9JgTyGYECI3cDu+iX9zXgE0R7MPQE2JCUNKKJr25/dw
	dNs7d7/wl4cQ5PzAF/wQDKO2Adgqz3zX/1QKGIIjKXKXUsPA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp2emy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e952f153so20103775ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152362; x=1769757162; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=baTKwHC9taAEbx9mWDj+YW/cnahBV4YzjX147+KjL6M=;
        b=Ylq7OGnytq9+dA4gZrJoj3bX0DA3zUPOFtaRVsqKHHu3DiBO4Vw1y44kPXDyvrXvNt
         rPUE1IUZlPF1SyDLfqKnJ8wlduBMJk0nl6Wd8dxSyXakqZ7CfQw5R3j4W7VjDPVdzXaZ
         GUR//RprZJqkEp5utVb8uwy20zWFrep8JejmA1/IQEbfKweKakdd1RxkLbYaWQV5/t5J
         RVOSwXmzeZhRK0/xUxPeUmmMkLrInG2naJA7Q1px1IlDmbLNqIJNzKOk1aFWnk1qveNK
         nqcXzL2YQq6D7tiPp0Vd0Mb3YPGN1Mi01jXiO93zR9hei68ezSnE8m+pTEndV1x9SAhH
         c3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152362; x=1769757162;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baTKwHC9taAEbx9mWDj+YW/cnahBV4YzjX147+KjL6M=;
        b=pOD3/8YR8JfP2l88Kpw5dSBd62jHwAoTHd7U4k7P8rPyoYBc+nqD/ANEOVAnfOJP1S
         5VY+CHNf9vDcU3SpoYkXKdQWJ+MhqEyBFsC/gb33lFWP4Fpge3jPjkdNfa/ybOYa3Xbl
         i2Putz62kUPRHbzYKHEBzq4u24whepAIXLl1lvlNbkpqSTIvGfzDsSF404rNLbc/9EWT
         bN3ve3AaZdrTb2ZZvagtIGeky3U+7+2z1K5LGYc5FQfGAaIJFSOI+IDkkc/BeO9AgOP0
         BVFCIS+EPHzVoctuuP+urQ9sNVEZIqML2F7Od6x0qdNy0lRB6S8r8ZsoS9kOqfySWcow
         iIEw==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZwlBHVMkhPTfKwwVQlGnNILkG6Yy2MBcEvn8gLkDeE5L9KWQwTtm2Z5YDzfIwtKyajb6MBW/3X8D3tPM@vger.kernel.org
X-Gm-Message-State: AOJu0YyA0jzZ4k2qPDGrBrKtZr8LoJc+J55i0U0cNfmDUYnbdlOuK7X7
	URr2H4kRzaja4Jrck4a/FQVwDgKTEvqjuTYDni9mQduKRWb+PXeWCWebmHMNZIBlimOiaTwBL2Z
	m22CGoYxVQ4ZUj0kPerxzRM4z22+TAPGHA3WHt7jI3+OkxjwYd0iDwnsEQv8XjAY1a/mw
X-Gm-Gg: AZuq6aLwGSvuyWxuyl1rFCcfW2WtFIyCS7/JP+ieSoMGiC4naVn0T7aS28S5zQ29VZ/
	/KJsAladqaMnKjVKXaR37tk0mAC42zCPZ35rBG9UzW2UGGjrdjMKkvMTiBmhwo5gtwebhAtsqXR
	X1Ta/hTrHZdRYSemlHaU2WgyJL/GQ1nvBGvW6t+F9VJkxhom/07IybdOx3FZXSMD83W4nZCpUHL
	fQT8p7Pss0aMLaWiOhz632tg+9mTFJKoYsmH2oqi/zJFf4PzP1R34HVBdwl13QUBBFyQ+lJ+Igw
	1WcoK39iXASYmjcmIOnO34TPxTouPiSPAbnrzDqulLUFoUW/oo5d7PVNmAj+HeG41+cJF8kGGoe
	0apYdGBBVg+2nppRfTqekaYfh5UXSBTLsqbc=
X-Received: by 2002:a17:903:2f48:b0:2a5:8c95:d823 with SMTP id d9443c01a7336-2a7fe44aad3mr19129855ad.10.1769152361920;
        Thu, 22 Jan 2026 23:12:41 -0800 (PST)
X-Received: by 2002:a17:903:2f48:b0:2a5:8c95:d823 with SMTP id d9443c01a7336-2a7fe44aad3mr19129725ad.10.1769152361493;
        Thu, 22 Jan 2026 23:12:41 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978b8sm10979795ad.46.2026.01.22.23.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:12:41 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH 00/11] Add explicit power-domain and clock voting for
 QCOM-ICE
Date: Fri, 23 Jan 2026 12:41:24 +0530
Message-Id: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABwfc2kC/x3MQQqDMBAAwK/InhtYo0bar5SyhLjqYptoUlQQ/
 27wOJc5IHEUTvAqDoi8SpLgM8pHAW60fmAlXTZo1AZLjWpx4UfimOawcSTrO3LfidbwZ9WaZ4t
 132BlLORhjtzLfu/vz3lerbKiRW0AAAA=
X-Change-ID: 20260120-qcom_ice_power_and_clk_vote-769704f5036a
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152356; l=3081;
 i=hdev@qti.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=7a3rjjm5VjPLHcbmM4PkplaRtIC//DdRJKgmUrnWJu4=;
 b=KhzvfAniH2+Zqb4SoGIG6ug8zMLxSbyXfdnD4p98ww8G8/p1NFygW6R/HrfApdpki2LrHXI/b
 ng5tPSkgKdgCp8Qv7gBHoeUZ029f46RmtZSulTjUBOUnjfhMvaIyHsu
X-Developer-Key: i=hdev@qti.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=69731f6a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=g2SMA5Qby75y8d18gdwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: WJNMXK0HxFNc225_Gu0gIm2e1IkgR145
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfXyJSsJDnMwEid
 pqnYxAElrLTTgcelDuEkQCPnBoG9oP5IkctJzaMMMWXV1k16pWsUhbl487FVjdzhaxV3j1K77kL
 zeC9sRVLIF4xBRglkAikvQZPJp+t+0LxnONnbqR3mv25HqlbcPAnyBsBMd7akwoCZImVNa6oNS0
 kJm5nMqUUbFzgPlAnS2F2jXcb1QcA3PelBphH3bZ3hiXa6IWfpVXBda6+iMbGTbz5wuIBLD17w/
 eLJGj6npZ4DASLVWNuoSRzPS+WQHozvm2HnKNXSqDUDHE7+28i+EHewILRDb9E1S4+kx55kbEko
 0M56iQ7IcyElY8dsKDJsW5t653AeUAwp6jnbTWBKGE/XVCwLfDRHbuNUMEk37FHSdu51Z6QKckh
 Wi/5lOzKaKUId8xtNhGv8m6e3bmnYWV7mEEHUMJPnEcIu1Pz7ju/SW+Ps57jp6jTHyiSP6Fnk1Y
 4t7u3yLZS1letlpJDuw==
X-Proofpoint-GUID: WJNMXK0HxFNc225_Gu0gIm2e1IkgR145
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90288-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,qti.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54DAA718EE
X-Rspamd-Action: no action

When the kernel is booted without the 'clk_ignore_unused' command‑line
flag, votes for unused clocks and power domains are dropped by the kernel
post late_init and deferred probe timeout. Depending on the relative
timing between the ICE probe and the kernel disabling the unused clocks
and power domains occasional unclocked register accesses or 'stuck' clocks
are observed during QCOM‑ICE probe.
When the 'iface' clock is not voted on, unclocked register access would
be observed. On the other hand, if the associated power-domain for ICE
is not enabled, a 'stuck' clock is observed.

This patch series resolves both of these problems by adding explicit
power‑domain enablement and 'iface' clock‑vote handling to the QCOM‑ICE
driver.

The clock 'stuck' issue was first reported on Qualcomm RideSX4 (sa8775p)
platform: https://lore.kernel.org/all/ZZYTYsaNUuWQg3tR@x1/

Issue with unclocked ICE register access is easily reproducible on
on Qualcomm RB3Gen2 (kodiak) platform when 'clk_ignore_unused' is
not passed on the kernel command-line.

This patch series has been validated on: SM8650-MTP, RB3Gen2 and
Lemans-EVK.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Harshal Dev (11):
      dt-bindings: crypto: qcom,ice: Require power-domain and iface clk
      arm64: dts: qcom: kaanpali: Add power-domain and iface clk for ice node
      arm64: dts: qcom: lemans: Add power-domain and iface clk for ice node
      arm64: dts: qcom: monaco: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sc7180: Add power-domain and iface clk for ice node
      arm64: dts: qcom: kodiak: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8450: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8550: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8650: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8750: Add power-domain and iface clk for ice node
      soc: qcom: ice: Add explicit power-domain and clock voting calls for ICE

 .../bindings/crypto/qcom,inline-crypto-engine.yaml   | 14 +++++++++++++-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi              |  6 +++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi                 |  6 +++++-
 arch/arm64/boot/dts/qcom/lemans.dtsi                 |  6 +++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi                 |  6 +++++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi                 |  6 +++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi                 |  6 +++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi                 |  6 +++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi                 |  6 +++++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi                 |  6 +++++-
 drivers/soc/qcom/ice.c                               | 20 ++++++++++++++++++++
 11 files changed, 78 insertions(+), 10 deletions(-)
---
base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
change-id: 20260120-qcom_ice_power_and_clk_vote-769704f5036a

Best regards,
-- 
Harshal Dev <hdev@qti.qualcomm.com>


