Return-Path: <linux-arm-msm+bounces-59334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53738AC3587
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 17:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12EA3171CED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 15:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D54B1A26B;
	Sun, 25 May 2025 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVYKBR3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73131F1538
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 15:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748188476; cv=none; b=p6kyADW6SJ466WUsSqx57PyEWmX1gKGjtqgV6GhOQZJwrsh1vi6WLKxC0MQNNw8jWCJcNXwsL44zAyEYd9Ky704yRTzdlf+fvKP51T6dsuvhurRXRq0puVPI9mQ+8XYBAaqClTgjI9wwHMaA7Ez3T+e1UNHxLP4tF2ZUnASU7kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748188476; c=relaxed/simple;
	bh=5AKy5fjWPhJ9QV2LypCv6sCviDz3gCv1vUKjaactCNI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SixHe0F9piuJ2mtVVUrQQHGi/ZV/Oi2/tphf5npaBuCy8SdO+FrBG1EL7iXweePsm1c/2ws2L6NWRBUDJW5v93A12voulw4EKFxe7n1r2B9JXngxGGMVl07srw1OlPoPPKlpVEQCsk1zW8wP48db8PjDgrtU0NfRdasd7KCq2yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVYKBR3M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PAm1Qp011752
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 15:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sJKcDUQVcORFj9yrTysGK1lUuony76p+nyO
	J++9P3i4=; b=UVYKBR3MYIJln6qRIRSkf5urCOc6c95DyvL0MXVdEPSHL+mUslH
	JprE/S+6qzF43rhJm3xL0ydyyk5NhBWnnufjfv22ZGmK2j1ZFjH/v57fIdMZiIXC
	AIe8idknqPFvpnQaGuProELpvEUuuOUuOiPJCEWqalG94GD33BjtLE5kpbCFDq1g
	RvBtbaFeLZX7NFPBO4FFl2GZN2vhdpLSf95yYmg5HShhsTTyGU7hxS3/iRK8EtKH
	e2Lnby1z6aM4K0lEoYluOla6F3IRZL/8Lhy5EFBsH+P/JNI85wpKOJUSoMH7JZfy
	dWDAbM7P2Wk1A7uV4zURLD2njRG0QB7eEOA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq2adk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 15:54:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b19226b5f7dso891022a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748188472; x=1748793272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJKcDUQVcORFj9yrTysGK1lUuony76p+nyOJ++9P3i4=;
        b=aCq7RZ8E/OrYX5POgokNUOtpl/7egU5xvdJku5quT9sj6f+xvZdtbs768Xa+n4w+Ew
         mZ83kcjB6CMDexoakDiymllrfwF3ohjxqlcJzkQErPUY6L52rEhqJTVcwOW0tdqtI/Yx
         nWqPM/VMuOjLFPMpcdA4r/S001x1P486h8lCf3akoGl9MOx6lIqUu79zljasDpkny/iA
         14eATtznv8jYZvPtNOOLtqcd9ML8RzUR1jOH7VlH2NsAjsJQmy6TAO2Z0KickW+qUuWy
         RLhBjVoc/TUTmObEiVsV03jQtYIbDW83Zr9Qj4hFTsy3t/4K1dG+slGf0oICaqZjoNwM
         88HA==
X-Gm-Message-State: AOJu0Yy3zBaBIbr+q2lRc3NtDbVmB923FwufvEyQAqcp88AfM8/PYTy6
	qXks1nLJ3JK31WKYO9nRX9XvHSBELr+cpPFJhJ5Pedcqt5X3378a72EeLBFSgwxKKIVvZ8Q33sc
	ckd0r4JKQ9UphJnhoFYCsXm55WD3rA8TfA9SA5LHMkm1plk5OdaJ6ANQfmzM2zeygqLw8
X-Gm-Gg: ASbGncsOXThC4UstRvRQ11RevxhtaG+HcPgdf0ftEUQW4DK/JnTvhgUDgoSkkB2F6sm
	WjpyI3dqqqJPUloLBuhEcKYIqlBv9UB5xJ4LO6CCRLyuSg81lRhnCWyqZZ8qJKBzjAOZddaTRS6
	wUTlOFC6zfEEAwIBykz+M0UEGrI1idPt0rL7AspSio7dx82dGmvwCVhWkMHbqwSXM38Mk8FVN/p
	RzPth6PNzgZC8bOXcwe7MavgwShBGhui7qGG+tiBO2XCujRiOdRouAkvp11Kywlf7d0oZBIa6YI
	ri551WYympba2WQKm4ER+liom8PsmNu2oRnU1tbsnzLuZBCk
X-Received: by 2002:a05:6a20:6f8c:b0:215:d1dd:df4c with SMTP id adf61e73a8af0-2188b571a1fmr10112526637.6.1748188472109;
        Sun, 25 May 2025 08:54:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtYN5afNoqrSTBdKB0G11sEGq4ECVlIT30ApclIhLBIdZNZzcv9oS8JRiOcaZHnxsufMmAxA==
X-Received: by 2002:a05:6a20:6f8c:b0:215:d1dd:df4c with SMTP id adf61e73a8af0-2188b571a1fmr10112505637.6.1748188471733;
        Sun, 25 May 2025 08:54:31 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de11csm15634488b3a.31.2025.05.25.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 08:54:31 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 0/2] Enable audio on qcs9075-evk board.
Date: Sun, 25 May 2025 21:23:54 +0530
Message-Id: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7cp5Ii15yb-WDP3iECaLn7IOjksPq4kh
X-Proofpoint-ORIG-GUID: 7cp5Ii15yb-WDP3iECaLn7IOjksPq4kh
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=68333d39 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=YkB-U3mbqUf8DnNMcaUA:9
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDE0NyBTYWx0ZWRfX8t8ECwc9F1g8
 KujrOtPz9IW5y4lyfOCojhcf9Fym5XsSFrX25AYDpFYn3X+p4tUZrGljdRx3za3MN9vruSkZDC6
 u5QjGjg6Fh8mOSwWlepTpccWX5w/PWnMR/N1V3oCpbJ0ZTa4UvAB3AZO8y7s2SGsJU71phvA9Xn
 MyJ8relP9BFli/ABso0KQfKM7aFxLtQljZ8h7R/IKch7sIkhtYkX7nRsPUX+kJaTv1hdUyUUJy8
 pJKABP1XeJ5KOUjy3gpRjoWfYSG8McQRZgxyZWfUQgogfwRcdzvADm+AGJc076OpqdUP8ajX8Ja
 XLcdadADSZT1n/U0S8b0YaAip7KC0aMVgraHmo/iz65XDTGS//um93IA5SeLw6Y1FAHm6W9EJYO
 Cf72LlTljXRTVBk61hi7mkL0QsvuknCCGCYFECKsKT4CPaXj8WWAt4E6pQVSMJzvqySY5CUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=906
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250147

Enable audio support on qcs9075-evk board.

Introduce HS (High-Speed) MI2S pin control support.
The I2S max98357a speaker is connected via HS0 and I2S
microphones utilize the HS2 interface.

---
This patch series depends on patch series:
https://lore.kernel.org/all/20250521140807.3837019-1-quic_wasimn@quicinc.com/
---

Mohammad Rafi Shaik (2):
  arm64: dts: qcom: sa8775p: Add gpr node
  arm64: dts: qcom: qcs9075-evk: Add sound card

 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 54 +++++++++++++++++++
 2 files changed, 106 insertions(+)


base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
prerequisite-patch-id: 853eaf437b81f6fa9bd6d36e6ed5350acaf73017
prerequisite-patch-id: 6d9fd3e0257f120cff342c287774454aad2be2e8
prerequisite-patch-id: 736cbcd47d5e7cfcc53fcaa7da920eac757ce487
prerequisite-patch-id: 4eddce6daeaa125f14380586c759f8cb8997c601
prerequisite-patch-id: baac180e8715b5cf2922f79346440d92569704f6
prerequisite-patch-id: baac180e8715b5cf2922f79346440d92569704f6
-- 
2.34.1


