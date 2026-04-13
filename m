Return-Path: <linux-arm-msm+bounces-102940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Cf1EBTY3GmcWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:48:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3657F3EB7F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33E173001A5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770BB3191D8;
	Mon, 13 Apr 2026 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLzzxt+2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7tkS7Jq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F95F3002D8
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080908; cv=none; b=skJLKxOk7XN6i6+jqU2a0YiZQo9I97qTmmVCKtrpIQSL6guEY4BVkGjXfZya0H5nyffLV+NGNJ78/BOMK+/CfJRqT8QOXvupFl0ZfPsBFHPWDe2ZhBLeLuUBDdX80YJnxMoxwTkAuKub0Tl9SbXBCVxRmsWkRfsudTfK2By/d68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080908; c=relaxed/simple;
	bh=aHl0fa1quWQEYH+LJ/cOsoc5q5lRYy9SI2o7adDAxAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qX2e/xexNVt9e/SZEJSl8fWfbMHirLK93sVDDIyxrnYrSsTLQnlfhdm1qAk6pRIjq5OFSysm0wFkuIs8vMkTlXm/t9LctWtXe0XwzdqmMrIFqgSOATEG//PNAfzPomOzbJxKbk0LxMHZRaB8QqtXtZf+UiK6bL5Re0cveqvD5i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLzzxt+2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7tkS7Jq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7Ka93324824
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Pfw78ALMazQMNwKFhUwMZ+08i/aI2HMsVWb
	t4kZanXQ=; b=BLzzxt+22flapDvATEN6x3ysl/zmOBVLIQhDheOMWVP8J+v4MAs
	ZNXNu7tGfV8/fGS5PFTLqIhaujDqtoMwf2pUrbwBKOmHiclF0QFMPu140ZcKtqWr
	GfsrY0DiK+7me1QmCp9+Q+Efe/JYSg68ff3+3LMfzI54ROJd/UB0HXtVOA40qrg9
	qfN5MxGopVbvAXiGlJmn8TU65A66Q3xbeV/d7xC7hBNIhiQE3f2BUiMd9np6Vx7m
	P2mIKKFCY4kFpd7PT1cAbqolStulaSYda18zxZiLMZHi9G+Oc0tWX41i2gmsbGcp
	O5zuUB137+i/aZfqzPuLJS5L7BgPGeS0QuQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0n3g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:48:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ab344e3164so5216895ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776080906; x=1776685706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pfw78ALMazQMNwKFhUwMZ+08i/aI2HMsVWbt4kZanXQ=;
        b=U7tkS7Jqy/FcyNVegYMoy41lKhWi/OD6AHAW8AnTwVpF9Sh+fasGg9ta52XHiFo/L1
         7vb9PGq9DfOmEqV+xOItdem/99eximZzHHRMK8rxImS6dpjx7sD1YCnxL1waLfHjekkm
         Zw04QP/REC3VKN1nqTiyF7LCF7VH5xS6bilMyzzjlFWNlnH1b6PoDtPNxcVVaXZomGBe
         Ya8r6aVB7LrQxePQFEcpwKfbhw2qab8RghMF3GrDy5e206ixSBGJfTlMKCnmck8dAjm8
         BZCPfYgaLxNY5KueKOnFpk9phUpxOzuQLASbTpIPnwXvDwUD+G2yi4iIc6tCZfffsya2
         fwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080906; x=1776685706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pfw78ALMazQMNwKFhUwMZ+08i/aI2HMsVWbt4kZanXQ=;
        b=Gh6IDiiY/WPyI06CoxRENUAle5HBIoYfhXsgHuGvSnLKZ2lu5FAyoga9a2ywJA4euP
         Tv5D35VO1OKIMR8MXw2Usgoy4vVLjjJeVB9PNTlpyHgEuB2lEQyI2hmcDu1HvanRrW+i
         bCBTUVcxfs0CkdQpi9E9mxAASCbEE8U4QbSFDoPSI4JhvzBrmMaKKFCxuNj/suCHslIq
         S2zXVcbpG+cvJbSk1r7RNo1xQ5RxrSXo87FZtqyMVMpPEF8drLZQnLJ2SBWxi5dB6919
         2OVZutdPe4qWJIm+sd0hriTq7nsuciiQ+uo7gzqSkIPMSYHYWApngDsVEfRC+MTiAH3J
         /yeQ==
X-Gm-Message-State: AOJu0YzVn8wy8k6Zr3fp4OJsnpoHecF0I/WzP3LSwsnJO7xDwXSXwMdg
	WsV4LH4nfv1o31AdqMSKXPRRa6MWsdPGQk9MYyr0dZnfuZ4kLCv9nNNN9R8snbehL/yHoJ33K4E
	q20HzzyX5dr8jr3j50aOPn7ogdvj580OInKoEq3fHWsIRV+4mWyFZCEpwnepC9o2dT/r/
X-Gm-Gg: AeBDietZQLcCN6fBZOHT92+eW2SjE5+G2l3+xGsbAlt2AnmfEFiecQiq8oM8WF9QP6z
	aKUSuhHbqsERI9YJu4AeoQwmfreH5XeApspuPEvU0HUF2UsPYZ68zTc2jGH5HaIMKeJlsd+aDfh
	RISUacYh5yPwsPvl1/0ViwPtpFJSgzCIgdQdmkuph8MtgfW3T9ibFAwdDmXLqkL4dZ5XA7drsHZ
	72oFq0j0fdVe0OLdRqU80swPLKB1Sq2gJFfIIo05DB3laYhCRs+z6COm0BqsivKS6NSPBIUJxBK
	w42mlg8FMSwsYanqP/ea6dO6449JeWVT/Kstx98XZ8WWRPqDt9Tt32jw91Aaf8hX2g9AYjU0YRC
	lo+tYnJWc3wucHHcofBuj+bnQvW4uzvwGNOH35doXN6b+iYGplKYm
X-Received: by 2002:a05:6a20:da1b:b0:398:f074:ad07 with SMTP id adf61e73a8af0-39fe406f9a4mr7664951637.7.1776080905867;
        Mon, 13 Apr 2026 04:48:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:da1b:b0:398:f074:ad07 with SMTP id adf61e73a8af0-39fe406f9a4mr7664927637.7.1776080905203;
        Mon, 13 Apr 2026 04:48:25 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a12adasm9822453a12.26.2026.04.13.04.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:48:24 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com
Subject: [PATCH v3 0/3] arm64: dts: qcom: Introduce support for monaco-ac-evk
Date: Mon, 13 Apr 2026 17:18:16 +0530
Message-Id: <20260413114819.3894307-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcd80a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Li8ycNgQwKCU7nWBN7QA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExNiBTYWx0ZWRfX4B7l0w++dm3N
 77azaugKk271cEvuBq1NT9YDlt24vdNZnLKsSqKYtZMnPcppYt92pkoDoo0isjKhePRI6YdN0GK
 s6/TRFfYksW/zrCRmJYdEWzHDFoWHixyeQtRsnaKzJTxMO+p7pcTjeUPyJ5a/rPzGrEX3+SayRw
 C44gGDQN506hvXbmD4Z4R9uaJ32IqvejsjAJB57rOgnlgA6tBbdN8UHyOnPee683EY954zhG7ZE
 xeDMZxFltycRRg5dIxKdaNSVVQPlGVgOfbWdc4cMW3vfHaPRxnx8vhdAUeYNAWa4ht7LretUHLF
 5negKicleDyEh2I23E9L0tQAySbEminmNb14T3KVdaTKQMjmNHbnYeNDy6E50e9FKBCZbERJNxm
 mu2wzEiXGD6DY0lwe2nYH9d8QPlsZD6xR7AiV4dRJCh4xT24haRoI20kWS1C0U9JtJQI6tp8WE5
 KSly/gvqCTVvJdOMilQ==
X-Proofpoint-ORIG-GUID: myUotnlVAKHGSouDbbwCsgcDQNWG2brT
X-Proofpoint-GUID: myUotnlVAKHGSouDbbwCsgcDQNWG2brT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130116
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102940-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3657F3EB7F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Umang Chheda <uchheda.chheda@oss.qualcomm.com>

Add support for Qualcomm's monaco-ac Evaluation Kit (EVK) without
safety monitoring feature of Safety Island(SAIL) subsystem.
This board is based on Qualcomm's QCS8300-AC variant SoC.

Monaco-ac EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Compared to Monaco EVK (monaco-aa):
  - monaco-ac delivers 20 TOPS of NPU performance vs 40 TOPS on
    monaco-aa variant.
  - The power delivery network is simplified from a 4-PMIC arrangement
    (2x PM8654AU + Maxim MAX20018 + TI TPS6594) to 2 PMICs(2x PM8654AU)

Since the two boards share the vast majority of their device tree, this
series first refactors monaco-evk.dts to extract the common hardware
description into monaco-evk-common.dtsi, then introduces monaco-ac-evk.dts.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>

---
Changes in v3:

- Extract common nodes of monaco-evk and monaco-ac-evk into and common
  dtsi file "monaco-evk-common.dtsi" to avoid duplication.
- Update the commit text and cover letter to justify the re-factoring of
  DT.
- Link to v2: https://lore.kernel.org/lkml/20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com/

Changes in v2:
- Drop keyword "sku" from the compatible string of board bindings
  - Krzysztof.
- Wrap commit text of dt-bindings change based on upstream guidelines
  - Krzysztof.
- Link to v1: https://patch.msgid.link/20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com

Umang Chheda (3):
  arm64: dts: qcom: monaco-evk: Extract common EVK hardware into shared
    dtsi
  dt-bindings: arm: qcom: Add monaco-ac-evk support
  arm64: dts: qcom: monaco: Add monaco-ac EVK board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts    |  31 +
 .../boot/dts/qcom/monaco-evk-common.dtsi      | 900 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 894 +----------------
 5 files changed, 934 insertions(+), 893 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi

--
2.34.1


