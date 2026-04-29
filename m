Return-Path: <linux-arm-msm+bounces-105119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFhwOUio8WmYjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:42:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9370E48FDFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD9913055A44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DF038737E;
	Wed, 29 Apr 2026 06:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ia7g04Nd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGxMnoMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC48390221
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444874; cv=none; b=lSoQHAUzVFseLkc+BD8+ffFVPFQletqKM1ZtQ28QOwV00Zz3NGy71kEIGz8paKw5tDHgrY+paNhrA61KcK9ab2smWoGaqL4D0/SXlU+zP8jONBQPyoJbsHOpOf1chm1fapQ9KsNox/8l5XTllLSDaXgJ0EzIhSs/Jk6mfXG7cH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444874; c=relaxed/simple;
	bh=wVHD1RjHS5UuqXjH+lCw7MpevrJLujQjFsdBL+yeDyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0gU6qSPTgf+UICMsBL1Ur1CgV/QO92tFp9HLkZK7mcAoxqVo3nnKtWcFm1jOrvBJT32GtYSUYu2gIHwybIMCR12QzD3A/8AQy4hrQ53b1Ng0rLzizxeN8GspYVFsvYaH5yrcsgQGLV3SNvkfYxukwPd92kwwae2jWLTybrciRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ia7g04Nd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EGxMnoMD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3sVaD018575
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bInKs8+UiDI1gsDHlFSL4hnliYMScur7ejWLpmWE6L8=; b=ia7g04NdbDj2EulR
	PWjT/4uoFrgnXKvpFj/3XZ/kO6VU3upCjHyzX82Fzdjb3ipjVERaQfdaarx2qNPv
	buQJcZRXJiLmbOx3mzEjZlD7FCFqLqRnOuoGwThGAXj2aLq+mY2zMPspRU+9+m64
	T16JdAB3ykurX174hotUh88AUhx+7QnyxX7zASUF++hN7zpo5x5sN3IESqI63ayC
	WodMoih56M0MLvNZXhnTYs2okZ8b0sJTK5/9K3LztvQwzxkPfkP+QYMFiLWVEqJu
	E9Ja/iMv1W19RouU2lKnexXXJztoaZ8rSKqmyej7+M831BZ1zpuiLEa4fKPWtCvx
	kVldIQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1eeab3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c798ace3e03so5210258a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 23:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444872; x=1778049672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bInKs8+UiDI1gsDHlFSL4hnliYMScur7ejWLpmWE6L8=;
        b=EGxMnoMDFaVB/m8D4f8xuYPRNbGM+59hKysuELlurXlyFPR3bP0o4IimFpSb52nfFM
         lqrkd8NzN+pi4/9Qe04dl1L3xjl+9rXvlMGGU2vK7ajpR2RxbGzoDVAtxqwFUa1YvCvk
         0lUuRvYltMejavLuSSh/qf/oG01kXHhYqpgDyyi2sRfNELaAw8zj0TES2LkkSbNCEg2K
         N1MJT5lTeFR1+UQRyaWXZkhGnqw+zDVd9gm0Nk4HcDxa9tLh1wg67PMGgrws+0iO6WNA
         YdTqoLktlp+uJg0mGDj77GBiO0VjVmd/zheHCpm6aZoSP+LW2wnhAq//lyFR3Qu/gbqt
         QKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444872; x=1778049672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bInKs8+UiDI1gsDHlFSL4hnliYMScur7ejWLpmWE6L8=;
        b=AeS2qq1lpJnphCO7RxoVZ6EZeRX8ebwtoZON7lTDNvZt5tEaWXLW9mUUUXat+HzR7c
         p5JQAo0YaF+bgEyRBswF7JKGNiVF4QeLTu4amOXt/yX2d15lVthj2o63lKD4X7oZDaJt
         FFhvTxg5tGrwl42EatQUJIOWMesC9SoihAP/W4IvNYFQLtSsrzA8QSyC8C+APeCt5dho
         t85pLjmcdE2lPsb8ntHvEnjxfanJBp1Vuq3CoZoz0r52Snk1U8NXMN3AzvPFA1bVy8MX
         yQSODEvGNWQX2QYsHBq4U4XdXCYmB827QUuxAMF9XSKFxP8WeOLp8kCZEpUIzxotPKIP
         Tmpw==
X-Gm-Message-State: AOJu0YwaFuXyQfX1nxtT0kzn34utVNtiXTFk3Wfnuc9GwVSzJpfMO0Fv
	+Wd8xTbT8piZDvMf4fPmRSytxet7wOM+dlFsG4XrLXFD/ocunRsDiXi/e+7Uq+PfHdsCMOf8is6
	6HHKHpKLSW3sJKAh+f36w6V8fODWO95E2TCMmd5V3mWPwj9Mm97nxhwiKeFGcHXNM8COd
X-Gm-Gg: AeBDieuOzRRgnIU+9eHzXhwUrW/FyQ3leL8tG4ScKapNGlM94a6VSJ2GYqkJcu3iwuL
	AaGnrt4KPSlBeiUf3uxqXnbnadhq+h0q9ihkYgBs1xasEfk6tiFtitGaBMA3T7bD/eBDup6VBjy
	EYvUFNnUxhqLY0CCVf0+vGquQbVQl1VtvwPkW+0wD2D2qstuulHwq/+9pelH5UtdtB6R/PIsDwP
	mPhPDbsoqfuJLhmS3YNQY6Oov+PYKHW1dERH1j3rhtEWYfgVAv+eQvSnuh5C0hWU+ycqP35ui4G
	RyPUq4Ioy6vWa33ViFmRh+2A5+sk/awWYvHQraxibOsz2g/l7BGYPvE2/G4115J/N/Idh0c0tln
	5rK/WX6Hig9CDdwW5+9agGG3vcRnu4KTU4SFEci0PMCezBdqOcFuHKE+HVVI=
X-Received: by 2002:a05:6a00:8011:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-834ea66ffeamr2684287b3a.42.1777444871681;
        Tue, 28 Apr 2026 23:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:8011:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-834ea66ffeamr2684269b3a.42.1777444871236;
        Tue, 28 Apr 2026 23:41:11 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb78esm1048478b3a.44.2026.04.28.23.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:41:10 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:10:42 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: kodiak: Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mahadevan P <mahap@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444855; l=772;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=9Q4RU8nmIcUZ/sSbZK6FzeP7TARNmx2z+JrnCArQMXM=;
 b=GIhSLXvYZEdY5w3FpyCWi/YoAnFFLFjbk558thplF2J3qZcPcdwFRnXBt+hdQmQA0jcDQDWqM
 Rl3uqBjTxNLCo3R8R/fZFr+3oihVEoXykbR2315v+bEnK4Hg5CivTN6
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1a808 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=80mdcyaeAbIWh__BInYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX4doys6Us631s
 eFV0WxQ+LiRl6P5oO/gnsLYVOCHFCqmGitz132W6boo7FFYXyNP+KCxI5ZS9j5694rNBtsmfQiA
 Ng89a1BFaGuelQioeRkF8jA/5dwV8Uemu1kEGhzTXh2ZVJ6ab+gk3AdhCluR4PAo2l0QfnU/sUz
 /rHc5xCpbxJZvERr+/F12Z6bJngisMep9HmanB4TBC3SiQ44UiJrjRCEffeczVRRzZ+uMppVrFA
 Eu/gQ2vDliYc2K8fbba8Cm4Ea31kIYRJP4FuEo3cRmA1Is7rIFEQMdLTgRqhHlhmYMl5IdpIggv
 Dqpmpxh2nkx3y7Ri+j3POk44p+TeotK/KvNcqgKFot1wPqFfznuAwJPafV1huKKZ3OPEx7XF257
 +QYcCQKJZSKJ8MPFBeXk0RK2ZBkl9k7UUruBQTPw75Mb4FlTe/7Yuv/CC/SKTQJ5nq9yipoOvdG
 loBI5vpjr0jhHs7YjAw==
X-Proofpoint-GUID: Ul5a0wvojqUpUQyTm7Y44pCvPJhboYWG
X-Proofpoint-ORIG-GUID: Ul5a0wvojqUpUQyTm7Y44pCvPJhboYWG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064
X-Rspamd-Queue-Id: 9370E48FDFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105119-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Mahadevan P <mahap@qti.qualcomm.com>

Allow up to 4 lanes for the DisplayPort link from the PHY to the
controller now the mode-switch events can reach the QMP Combo PHY.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 0acc6917d7aa..204513a6bd89 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5704,7 +5704,7 @@ dp_in: endpoint {
 					port@1 {
 						reg = <1>;
 						mdss_dp_out: endpoint {
-							data-lanes = <0 1>;
+							data-lanes = <0 1 2 3>;
 							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 						};
 					};

-- 
2.34.1


