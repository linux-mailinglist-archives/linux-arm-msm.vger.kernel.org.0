Return-Path: <linux-arm-msm+bounces-95386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGIfHeJuqGkkugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:41:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 123BB2054D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D84C6303DD36
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 17:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743BF3CA48D;
	Wed,  4 Mar 2026 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiCERews";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wh9TfSpX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B89374E5C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646068; cv=none; b=Xd1+YyqYd5xGqWyt1utPdkO7KoXssFAIk7E/EKgDmjPqdQF9oi+49fIsJJzLh8/k7V+ZFw4pbWYy4k0jwu/AWluKzIgFvDV3lnJMVw7L00YN4OaZ5rCKznQab0wErgQiarW2f4Z+j3hAv/A67D4d/GT/lEmSRmE/7HyYtBKwvnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646068; c=relaxed/simple;
	bh=fmMpSxSANH/XxWlmwdgOpxQtopGuJqUbV8vxTEABn8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sG1oaJ07WMMxQf2N1xTEEFPLC2DtkSOSAoqvQi6biT/lhMnAO7YaDr4wfFROF6O801KYG5LPAXco2GWH2FiYAnNus+7XiJeMJCN5XFhbx8OAXSdGGUKXYbO0ZbIZa0J6sxKLkiyo4nGXnzMXgFimSPE7tveEbvepw8K3H/ghS6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiCERews; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wh9TfSpX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HH7ET3837884
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 17:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PcvxfbbczHcX6WWI4xy9kW
	Z0bQCBbDw9HmDzvdNQ1eg=; b=eiCERews2sRLaTr2oNYh/AufwNJHJJFyn4tCbC
	DxTUNQK44ef/rB6fuYcb8BXI7vTgLvuYA6mkEVgqLIDfD7sZ7T/l9VlVUB7bkTUx
	fZIiXztWtA1g8FUMD9v8f3GguukttCBms02RwP3MmX/0HQu7UxP1kr+7ZGENOJSW
	zW8POaJ8r1IuDM+jktYRXsdcpFmtSUjfi33L7Emu8BuQQw9OYM6I9/ash6hZv8ox
	cBI/ndx4IgpJWjaXtzR1WPnxAQJ8kGq+4E4AGhx6nwNZLiUf9WXIc/TDr1+Gb41E
	bPI4d+pP6zUrOK9JBe9uceoACYFP0k9SM/qBGvA5Ob+lNJXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m0264-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 17:41:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35979a03106so4339259a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 09:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646064; x=1773250864; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcvxfbbczHcX6WWI4xy9kWZ0bQCBbDw9HmDzvdNQ1eg=;
        b=Wh9TfSpXmRXUXYZ/S1XTVfsnlGySbkBuHAPwmlgVNNjAxdzT7tVZoSr1vzxNynapHQ
         huZRO9Ksk3ZHbnnFCcVUwlrTHBO90Hzu7hJwa8UBOiMjj4odZkny6z05qGXenNulOABU
         ASUtcNwsKNpjTSlhoYbzq5jodLNSpp+xwh8wBPPsDDvTIaPB+NfaiwJxFflFWKEYA3mK
         eN/h2QtJF1zyWOs7LiGEz5N7aEMjtINLiJ2OTXuUOEjomlg2Y2r9/8+Vw5+k0Tx4GNzq
         bCAfGSaWt+apigmQ+mW/BDAXUSOb8dv5UpIl4Nkl/+dbD6yGQBBlB/YhaRJ4VcAWg17v
         XuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646064; x=1773250864;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcvxfbbczHcX6WWI4xy9kWZ0bQCBbDw9HmDzvdNQ1eg=;
        b=Nd3u6xM3rAiLaDAI2ijtoufFNUiE80ftI+pxyGu40SGts7rKQPQFbSgK7qqFGAQC5p
         TbJdTATnxsfjp9RJMTS9cnmQCIJzyrSbY3f9y36yVGMYoS/UkCASbLRvXFNQS8Wp5srs
         N29wtHLJ/Sdyd4p5/axk5nGMn990MatjnUBV8/w1Wsvon7SGw+CTjm7UYoOQVOWF884b
         q0NYRzmnonkUrTwcgcsuINDojUZbSx0pnaLDeiJOaEhz3xhg6DBLgL0d/DTAu2sizm28
         SmW/VKGrmcPtLCgJycFxfF0Slid+2vg7Y3BIcrDTVyzv+yb30G+WtWTMN2ZH01glVFec
         QWXA==
X-Forwarded-Encrypted: i=1; AJvYcCX9TjJ1RLCYzX6BNxVDkPWHz3LMJidmxrsVZNdZ8mviGwIygY9D4WBUjJZ/fgB1Gao2xwIhArChC7mzj5TW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3raXuvUbZDIfRZBJrTIXLAVy316YYdUxy+WbiqQUier/SJ8mr
	yTsPZIoLqsHvzFfdgmgfh8S9gLWxgQNS0600HHevYI4pKYG64Q8tgse8zaJHse9rqwBb6EidaGu
	JT7wUte5gu9S5CdW48Ua7/gybOBlg0dvNZPHkK2uNBit+74s46X7CccVD9+0y7QWKYW3j
X-Gm-Gg: ATEYQzyRh51T8pFl2TlE9Xk7hyPaK4WsQyj9UENsk3ilDcK//oA9k5xBlEvA/+XQt/2
	/SVPV/edLs1bvcfO8FPfIYhgR95lTZyQgfwihVDf2/+0eOxZ80CdWs0jO7TvMLCgkr2sXmldvud
	RJQ+DQ2bbDbvP2b0CRwtdKteHYPK9uVoCE/SLgfhc+X2sJpbaY5QgjEGoRcazWEiL5+OZgENfmm
	4QObk754nDOeE5GH1gsRniH4xcv9MyfQKMACkAT2SCCPy16g+bNW3KI6sXz7INEA6FjaRU3Jfwa
	/R5NoflBIpZhV0GkT+iwdafXN97miF1ssXtODq/kU95oOR/QCsUE67mIGhVqj8kyS79h9Ngy1je
	kHw9/QYARyq7m9Hv3gaHMD6Mnjev6VMhLbeHVDHJXcph3tAGLZseA
X-Received: by 2002:a05:6a21:b8c:b0:394:6159:175b with SMTP id adf61e73a8af0-3982e28bdf2mr2644843637.71.1772646064459;
        Wed, 04 Mar 2026 09:41:04 -0800 (PST)
X-Received: by 2002:a05:6a21:b8c:b0:394:6159:175b with SMTP id adf61e73a8af0-3982e28bdf2mr2644808637.71.1772646064001;
        Wed, 04 Mar 2026 09:41:04 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:03 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/7] Add support for videocc and camcc on X1P42100
 platform
Date: Wed, 04 Mar 2026 23:10:50 +0530
Message-Id: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJuqGkC/22Nyw7CIBREf6W5a2ko9qGu/A/TBYWLvYmUChY1D
 f8uNnHnZpIzyZxZIaAnDHAqVvAYKZCbMohdAWqU0xUZ6cwguGh5JVo2L/4pWSSNTimmpM3JOXb
 8WHf1gAbycvZo6LVZL33mkcLD+fd2Eqtv+/Md/vpixTgbxF5j02nTDPLsQijvi7wpZ22ZA/qU0
 gcrIKKHvQAAAA==
X-Change-ID: 20260126-purwa-videocc-camcc-00e709474bef
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a86eb1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bl4M-8LdCsxBmHb54JgA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FT4pBRoKQjZfhBrXSOdZF1EwDPFdJSLY
X-Proofpoint-GUID: FT4pBRoKQjZfhBrXSOdZF1EwDPFdJSLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX23tMCxlKTRem
 omF5U36zuhttw7sUQTGumMPd+joceXJoZO3YrxndHFHZRNoHDpnrZAMxETw0O9gVnjgFIlpEpuk
 1XpGiI4p6pqR2Gz2FeE0qOARp1BrwP2+HguxVngOJaoVaE8Dv2t5GuAKVc0eWS4/Bm8ZViGt+lz
 1MaYdvQfur+qRq8qlwARZRtvoRpASeu6pSAqijScQr7bokaO6BJD5seWz4s+WJZH1Y9Rv0WHhCz
 JkAx1ZrCT773HMBJA51E2kRIFMxdmz5h90dQM0z/reOmZclPq1SVhQFFK9ds5cYYSzCC3RFSsoi
 Y2kMEMZ7SdDAfUPz3qxjAVpC8YNiZfYJnbYnOmryleDLYqCETCxglNkPkc61WdHWY/b2c6SHqhZ
 mKnJRF8Az7Q/IE/cW8pCa1J9kYCALBzCQQvMcmmJrzRPdAo/+TZIDmFnXUIewAw3KrNlfHQjY1w
 QLk+JmVjO3Bphbt/5qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
X-Rspamd-Queue-Id: 123BB2054D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-95386-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
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
Changes in v2:
- Dropped new header file for X1P42100 videocc and included
  additional clocks and resets in SM8650 videocc header file
- Updated commit text for videocc and camcc driver patches
- Squashed Purwa videocc & camcc DT compatible update into previous
  camcc node patch based on review comments
- Added R-By tags received on v1
- Added Fixes tags based on review comments
- Link to v1: https://lore.kernel.org/r/20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com

---
Bryan O'Donoghue (1):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition

Jagadeesh Kona (6):
      dt-bindings: clock: qcom: Add X1P42100 video clock controller
      dt-bindings: clock: qcom: Add X1P42100 camera clock controller
      clk: qcom: videocc-x1p42100: Add support for video clock controller
      clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
      clk: qcom: camcc-x1p42100: Add support for camera clock controller
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
 include/dt-bindings/clock/qcom,sm8650-videocc.h    |    6 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |    3 +
 12 files changed, 2935 insertions(+)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260126-purwa-videocc-camcc-00e709474bef

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


