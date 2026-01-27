Return-Path: <linux-arm-msm+bounces-90868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPUfMX8ReWmHuwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:26:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA899C71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1CD2301724C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 19:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E110F36CE10;
	Tue, 27 Jan 2026 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyhRwKlB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIHJncje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556E236C0D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542007; cv=none; b=ixILLYjvHrFbKJyuL+cxaZxJ9pWGf+X+TMe0iYP2dyqzzedwL/gu+TqSobSP1TpmLvk+J60K5t014Mu3STVXUCzDKknT7O6pJrfmjFdCleTFGwHG/18mfsjL+RBTJnQWn8Kd/HJa42gAR0td2JwhT70pde9ZPcBi4ybnL/lHkCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542007; c=relaxed/simple;
	bh=+dxg2AYPWOBezbo/AusD04dPbtAzqmuYg8xU4IUzxDQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZY/Qk+NGGlsY7QeOzxbdTR9rHbEOB2xqB/U/YZsmQwzIjZhP4aNOpXCMygpcBn8Qyv1rTP/IgADkkdSoYxSooS1FeVFOIA5vOMHpOGddaqouP7p2MalbMm77W1ZZdw7u0sdXYGwUpNTnbbieGeK59XSIGQv1ff/tAGwebm/6VO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyhRwKlB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIHJncje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RFMBwa621762
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=orv3m8vsoj1ff5G3TkE7oP
	TvE8SD/wrAmlZy8rbZhHc=; b=WyhRwKlBrhVPfGxQGxXP6BPM6hvNZ3bx7rh+Fh
	plcnHu5kPWu9XdXjDWZXNt4ijXUenoaJkzTD4fbjvS8J5EtiRO5UUy1kGPfGtNC0
	ltDju2N/4NpWdReO1u33GlWTrmn7TzU56LXuHVsbKXTzmAU2x7mIl7+kgr0ppmUB
	Noq0AnRVRP5cHhZYalRpOY0m3W6SdqvZ3FLFvV0/CwvLBrWpxapSvAVs0LRDDFq6
	llpzCnKXSSe7wBcycfFKlLt5QqGyj4ssoCvFROa2ZhJdgS62Co7JkF1293fgNKa5
	kymRANPJJ6/2O3eINOeuG243ScU9koIxJyHW10nPGgcvTM7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjej90v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:26:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a351686c17so53113345ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542004; x=1770146804; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orv3m8vsoj1ff5G3TkE7oPTvE8SD/wrAmlZy8rbZhHc=;
        b=AIHJncjeVpxqukxGHuPXii7RcuQ3Mg/U27Hiy+78kHGiWHCecZjsvYpgkIIMxUYPGH
         rbhIUtAZeTt2Scz3L8tQPgftTcH1fPPpkHlmCohsdlQUjFwjSy3bHgGOeMQ3GbQykP2r
         0QMtUsh7FV28g23XxR+LpPfRg27ZovjNM+dW316hhQqtuNHBfHMSa/STsKZBY3bwmLFb
         GVx2hY2h6LVGcSYEquSiZNBbm2Yvf4EYBtWzK/Ps1m+zInklCoNCT4KDOb665yo96Cqd
         BCxJsRJUgopeD1rcVji8ow2cMu9jE/2mj9Ag3vV7xMdVYFys+PLgtOWylC5Fz6J/gY0U
         4EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542004; x=1770146804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orv3m8vsoj1ff5G3TkE7oPTvE8SD/wrAmlZy8rbZhHc=;
        b=BWsteA3T3H/vEBpr79OAwJYJogSlC2TcH3cgHbJDaw18vOCx1mo2V8QJ1T1AP8iLqf
         SPGt0hxiQvPFQlEeVXUJl9FTK62K/fJSgB0E69hlJswFl74uepUOaKjUw0EomwLSfAws
         rZXMe4l7oQEsJY2asXIFdy68OmfgPjydRLlAXOCbcERsrzRhcAITXlpwwv6OG+W1c/FQ
         WX5PVIdDmi1rs1Vd51WheS6YKgTkeDgFYORkwFwr3JLoY22BGf14vnqqhjRsxwkkIueG
         Z0NN9UZ/9pFlKpO+Ok80pESW+ojT9bSiIZ+mVyA8EprNfcmzq0WWjbxmmm1YQxWIKQMD
         RIaA==
X-Forwarded-Encrypted: i=1; AJvYcCV22rphcc5ANxoln0Kwtg9B9OR43jUps/5/rCfDN/AKra66fBD8jBeRC+Sbd3FSSfgmvDotGyQvZIkBdUFE@vger.kernel.org
X-Gm-Message-State: AOJu0YzuZ0Sey0lX7lFltTrCAeEqbDjopt9ETiQg5E8NFtWPjTh0osoH
	uy/OUamNb87y99IDm+ivWzjjVDBYMxLyP7wtD33GouivhtUCXH0bNyI493ShF8tRX3Hu/YeWrYA
	eJKReJ4MENwfv8qn4HaFrZgym5kB+6N53S9i9FNnc3tsnmx9KjSEqLpYLr+71somfJVGJ
X-Gm-Gg: AZuq6aL21z9R1dsIoCpfG4hY2V+w85+dVDQMKlZQ0q7imN4ffX7FRnBi2mnD9VDFhbt
	UvGMDyKJS2O+vymrtzGdzBayemN9wfmj51q0PhZoGXzNSO+xjoLfpUCWe+o36BHnKREIPfyUfa0
	VzAwvFDDbmWUCNbPK/hYHkmVSl3tCig9NJZSdX6/hoi7Bkvrn/i1+KUU4TVbBbZ2tZXFg0od2bw
	irz4vrHj7IEjSX1JyCmx3+RhwJ94yMM/cgJClMP1L33AOU3fXb4WAwKBjkAqtIi7T4REbW1plof
	fxSQ78shnnryNf8ydBuSE8a/hUok6CIdYPUBN+Dtixy2pDs7yKNDn4BRMjSlY2N0/JRRVZRcsDq
	LBDzOqFBF1Nf5RUcvzavy3X/QPExObSUdZ89IEcPJ
X-Received: by 2002:a17:902:d58d:b0:2a0:b7d3:eec5 with SMTP id d9443c01a7336-2a870de2f61mr27623345ad.33.1769542004112;
        Tue, 27 Jan 2026 11:26:44 -0800 (PST)
X-Received: by 2002:a17:902:d58d:b0:2a0:b7d3:eec5 with SMTP id d9443c01a7336-2a870de2f61mr27623025ad.33.1769542003644;
        Tue, 27 Jan 2026 11:26:43 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:26:43 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/8] Add support for videocc and camcc on X1P42100 platform
Date: Wed, 28 Jan 2026 00:56:31 +0530
Message-Id: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGcReWkC/x2MywqAIBAAf0X2nLCJFPUr0cHWrfbQAyULwn9Pu
 gzMYeaFyEE4Qq9eCJwkyrEXqSsFtLp9YS2+OBg0Ddam0ecVbqeTeD6INLmtEJFb7GxrJ56hlGf
 gWZ7/Oow5f8qzzidlAAAA
X-Change-ID: 20260126-purwa-videocc-camcc-00e709474bef
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfX7mf7REC5yheB
 mYElrExazZE172yYkvhHDTciLbbXBt8TjRa86bIntgQefNISImTlOeuqtFczvNf7psFl5EfgGBG
 MOtne+Db+c5g4BbIq9KHDr9L/pEkudPOkRFszE8xGyGzVraDY64kVjvbd2YOrUI5Qj6DyOACA4b
 IIDgXfXhaU1PHqhoMT3rUc+cT/qLiKASVNqVa92woStdwct1BNiaSa+uVc2yudgqT8Vb5hquFPB
 Z2G/td5Jw9ioPPETzoCDcjG5PTCjLsJgkC+/w+Mn8DVGD4uhW8CFff/TrRxxQ/hAYw/2yIvjoJ3
 msxeZ8ZveIkPftme9Tq73VE5RzQYW7Wq0+LqMcSSXd3Zv4wN3bUopZyQWiPeCRgcrMAYKy+tjex
 dlO/foqM7gx0HrZRPvrLh7XomzlKgGqbioylW+6O/Dpb7KhTsJgT4Aqw6HdRhlfvs5t6qNgbqvc
 iZPMQ/mnOILEgurEkvw==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=69791175 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=bl4M-8LdCsxBmHb54JgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: X4lRc1RH1KD5i_kIsSD45GMayPAfLNDg
X-Proofpoint-GUID: X4lRc1RH1KD5i_kIsSD45GMayPAfLNDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90868-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44CA899C71
X-Rspamd-Action: no action

Add support for video and camera clock controllers on
X1P42100 platform.

The purwa(X1P42100) platform includes the hamoa dtsi file
and camcc node is already posted upstream on hamoa(X1E80100)
platform in Bryan's series[1]. Hence included the camcc node
patch[PATCH 06/15] from Bryan's series[1] and extended it for
purwa(X1P42100).

[1]: https://lore.kernel.org/all/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-0bc5da82f526@linaro.org/

The camcc node was added in x1e80100.dtsi in above Bryan's series
but moved it to hamoa.dtsi in this series to align as per the latest
changes.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Bryan O'Donoghue (1):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition

Jagadeesh Kona (7):
      dt-bindings: clock: qcom: Add X1P42100 video clock controller
      dt-bindings: clock: qcom: Add X1P42100 camera clock controller
      clk: qcom: videocc-x1p42100: Add support for video clock controller
      clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
      clk: qcom: camcc-x1p42100: Add support for camera clock controller
      arm64: dts: qcom: Update compatible for videocc and camcc nodes on purwa
      arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100

 .../bindings/clock/qcom,sm8450-videocc.yaml        |    2 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   17 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |   10 +
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |   20 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/camcc-x1e80100.c                  |   64 +
 drivers/clk/qcom/camcc-x1p42100.c                  | 2223 ++++++++++++++++++++
 drivers/clk/qcom/videocc-x1p42100.c                |  585 ++++++
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |    3 +
 include/dt-bindings/clock/qcom,x1p42100-videocc.h  |   21 +
 12 files changed, 2950 insertions(+)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260126-purwa-videocc-camcc-00e709474bef

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


