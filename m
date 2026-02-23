Return-Path: <linux-arm-msm+bounces-93690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOZvJy5ZnGkAEQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:42:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B4217721F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF5FA30A3B19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14E323EA90;
	Mon, 23 Feb 2026 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MI7AM6x0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lifg3cBh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F05230BD5
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854009; cv=none; b=TsIGdsk3ZOBmdl3b3O/a5sCUSdYEYc3kjAizx1SwAVLfBZvfPh/baD2C5x5jo1m0BJqsZps9xrWwdap3Qc7YkevaMRxH1+I7VXxIshO18Og//WQIoZX7MScDtci7KP3McSVhv5zCeF/1g1YGeg9qZC7ZdBLETMFZbiwZPYCmkcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854009; c=relaxed/simple;
	bh=xTRDG8VPVDkjZn6a/v2LqpAFndZp0nERDikx8C8cNUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uc9WJeAWrCfPvxcaQKkt4a5lsmDp0LidJ3HcTy30/deDFxspF+0qy4yQDTZq7jVQRStEMzXBpzCbDyXslYZuRsEei3MZQgNfx/rQiiLTCWshSuD8tI0+F6XPIQvlCHPZZMS2SvXtcDmUjKEdA1iFSEVaB52Zq2lbLgggqPWa+qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MI7AM6x0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lifg3cBh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9hF8Q1195528
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JV0fojRxZfJZR81WNnONfv5U829bKs2Tndr
	jWz17jRM=; b=MI7AM6x0WJJ7Mwa1Z/FpBHsebIUwOdT3oEBJlo4qxVfcajUNphS
	hvB5BzbjkPYJvaIP9dr1pV+zPcIzNIgPdE9EcHi3Sg1isX046K8V6XhfqEz9KT96
	NcwRe2aARhSdPZtVLzWuBLt3phn2VNJRTwhubVnhsLZkY6kzbtCo+zUbxCmSEgLo
	ThnEzz3MjKBoYglf00gMJMYXsr9t17nrd9TDYuDn4+4mnx5P+VlzxS7yPxcjZAvK
	c8FqJ7p+a48Ulk8if4wW29gQHyy0m7z81hc8NNAD+oLGDjtzQT0g8dVKXXaEKKuS
	SWA/y5fE8gX9U1LcTpAGIr9/bOQNNYcHhmA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603mx4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so4992163485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771854006; x=1772458806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JV0fojRxZfJZR81WNnONfv5U829bKs2TndrjWz17jRM=;
        b=Lifg3cBh2Nu/N5sW8+hl8yTp7Kc35ydj8/6kTsXwMbqMkSgOejaGIvhkQGyjjBuKcg
         KtGMs+CzuiR5mGF0YrM0jaXFMq0aQcbHcodqiIQ7dnvitcNu7XEcoKMMtu24O7/1Gt9n
         +0EB9pPh1fI9YU1lKkSylwElL0uZ4+taibHIx4Niio1rBjyn5hrNLj1pgKiPEYJzYtWI
         4tjr9HKkdnLluSB3dbbFD5AeeooGtdBLOmTfA9iJtfJlMYSeJWBbdolGBSre/QBEReZk
         IisZE5zW96EA5JfG+ztODFiysFWJD+nDpgZU56+1sY16CMsG0kiEEFXAlnka8Am8mQjI
         9fHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771854006; x=1772458806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV0fojRxZfJZR81WNnONfv5U829bKs2TndrjWz17jRM=;
        b=JHsJlJEnWuWfmcax410/xcxIODMc+pneNatenC+pAVcz8FdV2ltZWQqXS59J/fl55m
         ffnKdTNZdfoasi0GPg35DFy0Kc55oEQohR/yb/YP0ZrEREMHu2UReb2Gh8WKgygAThl+
         LID5Zpfzsdg6mahNsM/IXkOAgKy9EjeYOdDAEWWApJsev9dMenr6HQlvrBh6OcNZr3FN
         xXLkqhnzW+sWTJdsre0sMizCf3BtgUMH58gHsFOgzvyTlLG5QvzE0ZbX7oLfCD36KnnL
         hl+obCh4pIZjZaYm8llbM3RoniOfJg9kjuchX5jw+nj7Qm5UC/9YcG/Uw6wKNwlaVHTh
         iRKQ==
X-Gm-Message-State: AOJu0YxZEC3Asvvn02jSdWOkemmN0LxEOjsotpJvV8HXeyk8Fr5OZ5q2
	7UHxeVgqllas1VSGn2mlom6cLBQ2iTr5gOcwlHgVyxSR+GcopgPHhpibFBeAVkeLfQZ4mxJcfQZ
	Ns7ZEP7MBHMIJmWTI3JAJUeneMJGYudlWm2m5uBuMTTH8gVAssaBU+EqdPbY0gVFBNgEy0p+1zJ
	wy
X-Gm-Gg: AZuq6aI4MnTaU9F+Ufxqm7nnj3ZGvg5Q3d0IuDLPFRgwrl2wZGAOCuGhXCsE5L4byWz
	D+nNsfRtQTw3F7gckZbCGpQr/rZ2hGtivWu9nqmV/bu1wzeeQaQW8YKCrGuw2u6T4yjwgzxA2pj
	uGW55Ygk3NQ7dBJMjhL4NFpxwrHeToNCgv+ereDnXVYKVO971bJ+T2XJd22KjdZ9I7+Tb7Mo6sB
	z6y9lT9vnmDYvWAsrCwQo66JraZJl6rnymAu/r1szduQciYwBXLKCOqZ0QMn1gozFK/pmW1QqpT
	Dgox4u+6C6LZZFlpGvpYzeStWRmNLDDTMryV/BWOf5f1Le5LFy6gugt30BzC3bwhRRgshpn1tqM
	9ynPzIwzyU9smjNylbg0WwCOYsI4AQ9kPcypPfQ5eWMewOKG167/3Dd4=
X-Received: by 2002:a05:620a:6c86:b0:8c7:1b10:e35d with SMTP id af79cd13be357-8cb7bfc8d51mr1648314985a.24.1771854005032;
        Mon, 23 Feb 2026 05:40:05 -0800 (PST)
X-Received: by 2002:a05:620a:6c86:b0:8c7:1b10:e35d with SMTP id af79cd13be357-8cb7bfc8d51mr1648311185a.24.1771854004562;
        Mon, 23 Feb 2026 05:40:04 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c626sm21323985f8f.28.2026.02.23.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:40:04 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: arduino-imola: add support for sound
Date: Mon, 23 Feb 2026 13:39:45 +0000
Message-ID: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c58b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=qC_FGOx9AAAA:8
 a=fKfvPGargzKJvhmaAEoA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX3+/XgI1F4kUd
 DVhF3uTlBdHKnJrwANZn66x/orOzR2Y0Q2cBUJSt/ivMxXq2Td7MFjjoC/Q8aeeDGI+rQ/Wh7pF
 cBh+hcAB/YLs022t7soe3TqLpawG2b/kSbKIN0yhdF7AbmuMLoLBlEbvQTDRB1ZN0HamT2N5Pu5
 oJgUS2k/wtkjpvwQCRMGcJPOveUZr150CmKYKoXvfUgN9pZuccNohW7lANOP/NaxgfcKMZxL95s
 XqgbGjDyRK9syBTeTTntLZ9Kqo4Kb5C2+OD2J4bYTd7Z+hOKUFqvLM/0tVAbG6PmJr0FQG0R4Rc
 gCjgz6RS7oubnn8aP8bGYzqlrCYeJyrIxRN9UH6nH7GQY9etHN6cb83t68cVBld3UjHAIrf7crJ
 Wofa6Jj3wbZQu9Hp28W0m7YUBOGgobdlwkMr29yFraCqfgDCeS6FLc+SWZG9mCDYhsNOe+63Hpc
 m2GemoNZzg0Ujn/ScfQ==
X-Proofpoint-ORIG-GUID: 8xvwnykkVYyAYaJ9W9jNGgSYb5dsyll3
X-Proofpoint-GUID: 8xvwnykkVYyAYaJ9W9jNGgSYb5dsyll3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93690-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,codelinaro.org:url];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1B4217721F
X-Rspamd-Action: no action

This patchset adds support for audio on Arduino-Imola platform which is
based on Agatti SoC. As part of series a some of the patches worked by
Alexey are reworked and sent as per previous comments, mainly on the
dt-bindings part.

Other base soc level dtsi change is picked up from 
https://git.codelinaro.org/alexey.klimov/linux_next_tracking/-/commits/rb1_audio_wip_v3?ref_type=HEADS

Along with these changes, add sound nodes for the Imola along with
a fix and defconfig changes.

thanks,
Srini

Changes since v1:
	- updated various register ranges as per documentation.
	- added a fix for sm6115 lpasscc driver.
	- updated commit log
	- fixed various style issues in dt nodes.	

Alexey Klimov (2):
  dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4124-codec
  arm64: dts: qcom: agatti: add LPASS devices

Srinivas Kandagatla (3):
  clk: qcom: fix SM6115 lpasscc register offset
  arm64: dts: arduino-imola: add support for sound
  arm64: defconfig: Enable configs for audio drivers on Arduino UnoQ

 .../bindings/mfd/qcom,spmi-pmic.yaml          |   6 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi          | 167 ++++++++++++++++++
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 138 +++++++++++++++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/qcom/lpasscc-sm6115.c             |   4 +-
 5 files changed, 314 insertions(+), 3 deletions(-)

-- 
2.47.3


