Return-Path: <linux-arm-msm+bounces-102532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP4rIOjr12nnUggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:11:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F085C3CE7F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8B80300652B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD933E315F;
	Thu,  9 Apr 2026 18:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAgb7lkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FS9Nt1E9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416A41A682F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758307; cv=none; b=O7uTtWCPNQY+lpPiafAE1JWKd40Wo4tuwAroyWaRCrM9nUhk6uxf02I818jvt9EGb9HEALek4N0lkAiqkKPvcxviFujuph7bBeWunRl/2cXAfVdzt6K8Q/QppaUJKNBpMuV15nIFjTB2xU/6f7FZ7df3/lNyNlytSK5A5qrXt6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758307; c=relaxed/simple;
	bh=dWcGPZUTYNR+IrjazAYIkxGZaepcVATPwDyqe7mibkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWnuZyxOzGO7e+oG8HC9uXh9ztPeDv+0s5Y1t763ao2Q8E2IInvW6W379IsNSPvDdVeKSZvI2+x4UjDgRFnibPldOITrtP0vAnOqGMQC068sN2Kay/+s5rB2z/LiUBF15bUfKaHqpa8BKS6AwHGqkQEBp7zXxVrQnvrVzx1oIZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PAgb7lkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FS9Nt1E9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Cep1T2866294
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 18:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=; b=PAgb7lkp52h2aYe7
	X/q/AUNoT8wFXcENwF2xkHMQdpolfuJRSn3wDifsClUkQSrrf/zlY8GzlBWXEd6C
	7SvU3SDb5KzHJPPb83l5BBzoh9n0peh9a6bL5IjpU4fo0SthbVvtKQfL1fehBYva
	H/M9mnm0jSNxjxaV9U4U15b/3mwzoOByXOQe1IbfZSX9KtNupF6qYNymkSzHBeA7
	+7bkSGm/7xnnft1jUn6clpeEMxdJu59BOhyMwUyFCJwNHe7VN4PZCWYUnxl0XOPq
	Quzs9LMgIs1X1jYeFD59B4dLMq31tO3oF7cMpX/ltWeGczFMSxw4O+gbQZFFr1q4
	lGHE7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayha59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 18:11:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354490889b6so2026608a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758305; x=1776363105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=;
        b=FS9Nt1E932rGf8Mv8vTX/nP3Zy311RndazOYsFG+ggmz3+0HrRMulLXE+Yq9YkTB8V
         2m32gGq1P9kDyMVPapyBf5NZzQomvj0zkFWW6YPm9wb3A0Yk6KwmtGK3y38uW4UmmwkD
         wYiFmwiYHvnCqSAn4/qSqHr00+rT/uHzsywOuU96J0Il8dQIAXOCRkmIyXnHFw/mCVsX
         i8eZ/Ynrfv9QcSzuAoC/mf7L+SargKnlwO3I+KVecmUTv65aq5bkGEvXJ493arUSt+B0
         owXQFizJsEfLEkKnJQWjM36FyhSaKCR/qpgMt2ambm932x275rgR1nLAg4RV2Kkzu7Z2
         HOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758305; x=1776363105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=;
        b=Xih27JpRDD8hYHL10u8vCFelv7AaMyZqRheLZSPAh0jgYITYyU9FpmSRr+DkL7CkcT
         RDavOFpZnJUuv32oeVOMmCi5XWkABMa8KMaouOBcq/TC/jB3qhCpCb9otC9V5uVpgdU9
         qL2Dvp4kYxS9ViWdifZyv0kFuB+LVe3OVTNVbM0Hyo04K0G4mASbZRAo5R8WHFTA+dLo
         yvi0lKVoXtLrQ3QRo1GQAFNFGU4xsgjFHipSptKYHesONnoN5ai5NwBX/xDTfb5xR/iq
         2AWEhPMcoQpqz/uOcmrjlYVKbBp1+WBEQ5a0EF6ld20eB63MCnh7KZG/Yz8ywwJXeQZ+
         v0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlxgSUNFWMm83GGl5H9Ll2fm0u5GUvggDafY4pzKcp0l6dBnx4T3tLeZmcxXzJ9FRuP7dbKaoaAL6FYD5Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzxS5JVKVKkWHRfyHPPhe6LYsCnLzfwMdkL1KZnVzVEtSJiCOaw
	Yx5bpwwA8zzKkE7Ii9iRCBUl7xzuNVdsyprVKpWqYfzYUIPa2SfJeZloumqE7kWzb2fLOkm0G74
	IGf481NG1tGTUkjYS2GT5Jx9zTnSJjPHNV+bRfPr4sNgo2HLAmQg7f81l5wB97A3E43wJ
X-Gm-Gg: AeBDiessKzwwA8vDVpl2nc/znFGG84TWwVckXTKqGbnOryrBXNi2ctlFgBC89GRTV3U
	ciFoBHwFC73Gz/MlOtWp2UYGb2n+nuaCqIJLtasp04u1CVdi+bUoQ8FMZlUCkzGP+h/ED9vC/ix
	pdh6YUzvryl7ENonUrE0zygOxfIMexncIcnzzW2SLTHAv+qCiM3c7XedIrf7Qoh/f1NBTVtxfnu
	IOq+jER/YBTgNnSzNixTplE/WPuEGBoxuuDJjXp+C1rwovxYa9JMmEb3HghbQ637YGBqnnQab4Z
	chhx280E8BrrvnZUecUTp7zx9e/eQ4vSvE+e2dr60hRZgZHcg2m6MGSX1oxDEWXq9Ua1SPPGwmD
	Kt3xqbsj0iZSkXTAx3UJpnLPWV5XtJD3s1/6WcJ1NdRVYhA==
X-Received: by 2002:a05:6a21:32a4:b0:39c:4e62:b838 with SMTP id adf61e73a8af0-39f2edf5056mr31142009637.17.1775758304820;
        Thu, 09 Apr 2026 11:11:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a4:b0:39c:4e62:b838 with SMTP id adf61e73a8af0-39f2edf5056mr31141967637.17.1775758304218;
        Thu, 09 Apr 2026 11:11:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:48 +0530
Subject: [PATCH v2 7/8] arm64: defconfig: Enable clock controllers on
 Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-7-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d7ebe1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2e1B0ptGhY38lJQULHwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX6QY2m1/FdwZd
 Vti0TjBaKDkLMAdyCdOLr3PbctPkEBksl3dwZuw1zJ5qk/ffHZjJQtQD3M5rxAPVbY1u138CLTl
 JrMnxNUfKusz8D/2d4/T2DRupc+e7+Et5sMRTZw653+YjiYIdrTXNdz1sA3y9c97uvvArF2gFk5
 uXjFghdHb8/v7eRx565iwbHmY5ngdOA+bidAUOEdLpYhIOteVFR0zAMC5SHuimsTYFgK/fKA5be
 9VMFb1o5rsgwTuMm6SV2KqgfYECL5q0kFluMTyowggZpLl/n/wfdKXPPj7eAncnilK+HSknTig0
 AvP/PqoPhc0K5IK/CjdOLWiVOOAqsXRxCQxv6yfhydUjzEfbcAg7gf3jEZsNzO2ZuJVg01tlSf2
 O9lHoQrlY6SLy2f+WvKcXvMThqDt5NPoRgL/iCERx1oyx04VFktFN1teb51Anxc28HPQmumvedQ
 zcBXIsGnMJ65/WxcU3g==
X-Proofpoint-GUID: EyUs5Z33HSCBN6LCVDy3Ifsw5Gdxz6fh
X-Proofpoint-ORIG-GUID: EyUs5Z33HSCBN6LCVDy3Ifsw5Gdxz6fh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102532-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F085C3CE7F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the video, camera and gpu clock controllers for their respective
functionalities on the Qualcomm Eliza MTP board.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29bf631d517c38486f6896ffd82dcc9..130e8716e67d69c54cde3f66db09b352f736feaf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1475,9 +1475,12 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_ELIZA_CAMCC=m
 CONFIG_CLK_ELIZA_DISPCC=m
 CONFIG_CLK_ELIZA_GCC=y
+CONFIG_CLK_ELIZA_GPUCC=m
 CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_ELIZA_VIDEOCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1


