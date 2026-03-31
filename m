Return-Path: <linux-arm-msm+bounces-101061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBLjI0LUy2mILwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:03:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2956D36A9F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97E4030E2BC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06973F23B7;
	Tue, 31 Mar 2026 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2o2dQV1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdlO7akQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB3346E56
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965278; cv=none; b=eRcfxnjNWrph0XrXRdwhXI5O2Ua+CEsh5H6fTPICLnfpHHPF3RileTfr31bf3cGLXR/4lNJgGb10RiyPAqY1M/nyRPAuWBUmQPBjTm4/GwjQ8s6CNs81exULQZWBg21BqUu38DB8Z8zrhVSJAjr4Sj0UCZxlMI3qqBzsNQCliBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965278; c=relaxed/simple;
	bh=bko6/n6Y3o4LVRBfTVGhnO2E4+IxCBptdpcPANcT05c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZsB7DqJbNUpBlMDm9tPmffF8tM7yHf9DwqNLghXnAPCojHCM+5rH8Kaqh8a+MamyioDhwOdqqKjibVI2ceTnT4dgGfe6bJQyPoja+o2f1vPAv/k2LVzIrc3hs3uIcXjvWXfsmY6f0INooRZOOzBC1SqSq1gDQP51EK+XzqWfqXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2o2dQV1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdlO7akQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8jqt02049348
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2d5FgYC3u6aE0xSdZ+PL0d
	lE9GM2ls8llKU/gqPjrf4=; b=C2o2dQV19D8XQgKcSsBP7gvRkZD8SGHCiL2o2v
	i2NfKWidOMoI7BnhCNOfak/oGoBTdlzEXX8laUmSwvGuFkIRkaxdO7CfB7Yi9hiT
	T2w1kN38qafr7ICdoJIxeFEE4ch4ybeZop76eS8sEGMCNNULEiNDvzKMtaBcOHEE
	6ozfeviyDrSCWfoLkjvD8HqPA7s4yKWIFDpUqYahSsLYXMSxZ9h6jOU//uKi15Bl
	R2/juYlAKRw7mL6uuePwSab0qV4B1hDNli8Mnp94sNA/iEoXDjtr1iFN/sLc1pWS
	NJtvcEimKM5FOCQPTzJCp+/KlLYYcXOD8MxZ7uaqVuej8u4g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1ys7gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:54:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0f4e632caso57151665ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965275; x=1775570075; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2d5FgYC3u6aE0xSdZ+PL0dlE9GM2ls8llKU/gqPjrf4=;
        b=VdlO7akQfXd5DWq+5D8AA47i7kU05McShob17Vij4qLQoi60t+Q3OD0P8JS5HI8kmF
         DMfwGAEakcwdn73dw/bK5uz01J7yI022OLZOGUJJU10kHBrRt0NbLjC3E7rIPWywTnD1
         sL74lu18dhOQyXNfrUHuhhqAYlLrmvyFdhOPpdTEdF5bFBsyV+4TJjxlr4RBPpQCHUpU
         tmcpuyllKM+vdocF0XI0cr5YEUJSHq3RMmWQsVGBrlcDCqlkcRedJhpzzxR84Q7grJtN
         s21PTivyFRFPR0OaJzFAIl3vMNzdfdkv5ffZsZO6pHiJPZV03FsiSQuNN4hzpRlmqYdo
         Ei7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965275; x=1775570075;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d5FgYC3u6aE0xSdZ+PL0dlE9GM2ls8llKU/gqPjrf4=;
        b=WnmwkTRwzJRm6crwUJ4q/wUynITs3Vsvtq6JP09PPPEuAQrLZd+ZzdROBhd5v+u3CA
         D/nyZkbCPkrixvEaJlh7INEpiqkn+CIAusQRHD7CpGEzL2e/afy8C0tK9IpLCu0FX7gx
         GAkZufnow4dUwS6uUMQXz5C7a3Nrol6+Eh4UdSInhUCPgMcaxvrDGo/OyjSTDyUW1tJN
         u6UCd9Tn/HDLGj28zPIm2E4rV84xyJ8b4M3k2AXZE/p2o8Bwj5SoAgxvtCY6a6eyLClq
         /I98Grfjy83CYE7ghK80s4UzeUSfZX4Cvais5R0S3v0yfonaXKLs//WlfkiwSVBMJ+Vi
         xrdA==
X-Gm-Message-State: AOJu0YzEJMJP3GiCRb7rxZccIb6HvKfBt9R0I3NNjfltfal7kCTTQEUi
	XIKt26669XjPdKpbbqRf90Pf2FGSHyHPwZEDrpdQPisWXxbsKNY1V6CHWcmOcAO8+Ibj1ack01+
	ptEvY6Q5t4txg28zQD5vJ5pZkrGLYi9ko3/xHXw9/sAHYCm73dU1UIBXVLrEi8aszv02s
X-Gm-Gg: ATEYQzwgUHwErMjuMTm5gygu86qsHpiBJQMVwoIGP0w9uMqPlGTxTuXO1JiSohFDdHE
	/sBTWwAcBI6MRcmRoNI+GnsWdD73W4lUdPwmLw0i6UIqEjlZHPoZ/ZRfvSjISnhz7bubezT5ctX
	lOWVVbNNXQIhzUCT43EmdxDh2P8bWcpzZbNkChA4pSKrIZfpdSp6fsyBygnFTT+zdfLR+18vBac
	2TENBsxwaq06QokjFyK67Q3xlDfT4022LvvR/RGWQtih+SL7Awo9kromLgpA4J5SKSfpros4Ovv
	TOHrSrI3zQObEQtn59He9pkh3uKcCJYh5Chwa9NdPaduJuhs7tKf8Z7c1lZyvoCVpC/7F0mKBxq
	TkKuVKkdjSo5BSteKpL/USVPtntZYuYqgYLeqd8mQBluzT7GpeGjNZNE55bLcues5ukIcPkwWvY
	MYG3p5KjtWeNsnNkwNZ1iPc2yJo7acy3e+xaQ7bGo/xg==
X-Received: by 2002:a17:902:e742:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b0cdcd3cd5mr171529865ad.41.1774965275557;
        Tue, 31 Mar 2026 06:54:35 -0700 (PDT)
X-Received: by 2002:a17:902:e742:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b0cdcd3cd5mr171529495ad.41.1774965274993;
        Tue, 31 Mar 2026 06:54:34 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24268e7f5sm112748945ad.35.2026.03.31.06.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:54:34 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: glymur: Add QFPROM efuse support
Date: Tue, 31 Mar 2026 19:24:19 +0530
Message-Id: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAvSy2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3fScytzSIt3CtIKi/FxdU8Nkc1Mjw1STlEQDJaCegqLUtMwKsHn
 RsbW1ADuBShZfAAAA
X-Change-ID: 20260311-glymur-qfprom-51c7521e4da0
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774965271; l=829;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=bko6/n6Y3o4LVRBfTVGhnO2E4+IxCBptdpcPANcT05c=;
 b=w9WwVzeTekg3k7DDit81XXPqscSO+tejDRErTEmSn8WAsWmtMPdbolhG6P4Saya6v4tjCBDxH
 unwEpCNzDTeA+09HCJvoQsNE7HB1c75mB9xUnCtX5oikyJZYSefCJv4
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-GUID: 6KG8mEiWQUSoXZcPJF5WWwQ_9LrZqq7I
X-Proofpoint-ORIG-GUID: 6KG8mEiWQUSoXZcPJF5WWwQ_9LrZqq7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNCBTYWx0ZWRfX1L9JYXOf0XEp
 hSnioinlbYV9+ewOyjpxwY2YVV7ru7iQK7RTK9HhMjG9bh/YZoSXOiVMxUU0PNx/OpIQgQMWE/x
 4menc01opqICFHJDDnEs4v9yfcf1+YQVTVmBz8nam8UfOZGO7yDmuE9esXZz2yWGd2DQgrTvo5W
 XDYlJioeNUn9wtjXMY/OnxS1e4CLmuDBYHBfUYxcvldbHco+i4+5MXUE3JMIK8Pz7weyIqK0U6k
 qJDk3db9WiQuHXgkaxGCdvATEgUOj/M/O5wA1JcXUBBjNQnnbyNB/Tz2lhWJIp9KiF+p+MNqeLQ
 KwbJP1sclv+byX2Lhm0vMHoJO8A1Ot9paiNiG+g12uGxkI7+k2SZ+Bmr7eOLclLJ6QccbUBMseq
 nKGUUtYeMOh9qnsaICqbMdSVz35KwajGpk+C3niQR3tAlw8oAQAnXfA2w6npsL9s/WXb4ABv/5m
 QZ75a1WXAOI9BfSyz4w==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cbd21c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9phbO8Kjjr4k9TnTO1MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101061-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2956D36A9F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add dt-bindings and dt-node for Glymur QFPROM efuse. The GPU speed bin
child node nvmem cell contains details of clk frequencies supported by 
the GPU, which is then read by the GPU driver to select the correct set
of operating performance points (OPPs) for the device

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Pankaj Patil (2):
      dt-bindings: nvmem: qfprom: Add glymur compatible
      arm64: dts: qcom: glymur: Add qfprom efuse node

 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi                     | 12 ++++++++++++
 2 files changed, 13 insertions(+)
---
base-commit: cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
change-id: 20260311-glymur-qfprom-51c7521e4da0

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


