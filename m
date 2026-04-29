Return-Path: <linux-arm-msm+bounces-105229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFWnMaAT8mningEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:20:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EE295495908
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44F473030F7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F402C0303;
	Wed, 29 Apr 2026 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJcH8Q5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0fSYAhi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC75272801
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472139; cv=none; b=K+61/+asYsdkL0tUz0+U2n13rLCVvht44rhW0hX5QcHJZcYZZxFVlYZman/ibSsPgKIy9C+5qEMalyaXQMAHSIAX5xd6SvE/TGZgBVoLknyOHbSm6abYjnBPho2JuYtWBMuXvH4ZDMaTbiXcY4C+VwGrmHASFsqy/rojK/9PV3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472139; c=relaxed/simple;
	bh=6qiQEZhfqswwyTy6lGpZ8vDSCa5P9FHQo6RPH8unH5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jMCbMZAFg7sHQsdsX4BkqRFnKCsPmUzt2O3m0iomxGp0hsMZ5AboDkUAASm18D/tZ2eBY03pDFELIfjyUsJWFQdQpFsaKc5oPWjCjQ1jB+ufgNBzps474WsRUl+PZE00mD0hcWFiyae8KvEIllOKC4vS5dyXLUO+dtFgEqlOfxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJcH8Q5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0fSYAhi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qEmS3066928
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iKo+UJYDFtR4I5B/NNi2ij
	yviGN2L82xHEIJ7WGjUyY=; b=QJcH8Q5YxT5C6SHwCtXpNBURPlQ0ln/DwgGg5M
	SY2XZs1CQFaUl0qIumL5BXsQnc5mR7z8/s+TWcHPZITx6WP1NvTuPuHtahnb6eyj
	453wxQuyDEdM7rtvq3xP2PjSn16hFwNdvgQZFNF+Te2Pltk2N+gj1zCHLQW23oZ/
	Jv0ro7R9PdYokbTXWVafnQp6pT+PZLlG2n5+7vklwKN7zfc6/4Gp6ntCZH4T7Ykn
	0wgpWFAjavMDGbBxEdOVB5rPfZ4nfPDqMDp5m59C5NBhUUBq/zC/5P8frrVdk/yN
	p9lamXvNl1bV8mLNzDoH+5/Q2mp6/ta4XZUFA0dTbBtKutYg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sxavcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:15:36 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-651b8f743aaso23255300d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777472136; x=1778076936; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKo+UJYDFtR4I5B/NNi2ijyviGN2L82xHEIJ7WGjUyY=;
        b=e0fSYAhipuJNCGQgUdu2XxeJYTfkNIPoGFeQBLwTCuctfXrlMPq4pkrYb3R56xoxvO
         1WQoXZxjbSKj8jOn4zXgVYdK1VtB1XbSZrOC4m2Co7CC7qCJ/Iy0Ik4wx/6iyT7Q6gCg
         hSpdEZ/4fmnZ6Qq4k8jCjZkxvD9ZzMpmJH6IGZKajp2Hjmx4gBIqgSSS9JMt36dcWeul
         FT9Pqxsn1Xu9kYQMGeqcgEenReTyyw0+wof47BipZazXPpgDSIx07Yub+SfVADmh57Fl
         OtqoWbvfx/Jx17v10Tz7/NLjF6uXUSJKXO0ZtzowS+jd/KqxdQdbLEYZKDo7pnmkZK3Z
         TIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472136; x=1778076936;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKo+UJYDFtR4I5B/NNi2ijyviGN2L82xHEIJ7WGjUyY=;
        b=Jjl9VA9Yf7U55Ue4FSczW7NBPKMG1E1H1BHmir+VYlFTuS3SVR+9i6k8fE8qyMP5aM
         8mUXrnEPn7fBr3rbCoao3k9QEZv9ggcoSn729p+op9g0msPgO3useCrXbsWKiyTgJi/c
         y+ktfNSeW26BpVHP5tXa4PKNwqfoR5iFtBMb1PyOh6yrcqhz7b+Cwg+hoRlvprL92G60
         TDqwtsFOZw7bKqfgSELJgp+0FPL6qeuMQwmw/Atnu/S5ORVuduuM2L4j2CB3tXqtl36h
         l0xgRLAmwozVaG4QrenQjAd7QbBK+yoMb/T6PXTQXATRwgjyBBn1qmjSUCZ/9nv6qcpG
         4Z0A==
X-Forwarded-Encrypted: i=1; AFNElJ+WAf1MCmxfc/8rtrIVChQMbrenErkFEWuW03j3ThUOrFO5yzxwYf2xltnLJe33OHaS+NINBtcUz3fmxSR3@vger.kernel.org
X-Gm-Message-State: AOJu0YyfxHxtaoFVD3pHGi0VMnjxH8u026w2pCL1dzEDbS+cq2TzuS5i
	z/v18S80kAzKFOOZvhHWboqF0v297NssHlbOhJrJHRf7xTjZn+cIh9epsGvOfqJiH/6xWvS9loj
	Cdd/0OWjWSxzPgd3lSP/U+C2jwveoZzPqD6gxxSf5uHxBhtCN9yUkxkiE22/rIMEa8B4m
X-Gm-Gg: AeBDiesuIwcm8vFMYEMnoiqkynPsmDL1ZZ5WqB35WKW9GofL2LdD/5eWZHXtiOK8Aq2
	v4MHS7zq+v0NeFE3S85qpjnxmr618Wk7OkO2DZ173Bd8WmKIXpBJAnXLdxp9sz2ClN41hJkXe8T
	yhjZOV0eif0uCS/skjFuBgDP94isn1+VNXgmuQPHfOZ4xc8I99AWbRa35jQnxMLKpxzWowg8cdb
	NkBR3ui3MfBwKwDxPpgdHlJ1rwCKk4x8vNPiFeL300TusTelKSys6cd6wa5DM7V5+pt/doP4aA1
	vVQb4ltH7674mY638furynjsr5nyoI+IzwhvZa7KfVu8yrQmZkSbnrlJdrKP0uaf9Gb3cli4CbH
	Ndeb5NrvY7AotDB/bEZxVFi2xMOfnhsg11ajenPZ9eKNI7a/oDHrKW6lqR5wmfSA=
X-Received: by 2002:a05:690e:12cb:b0:65c:b99:607a with SMTP id 956f58d0204a3-65c0b996108mr810634d50.38.1777472136048;
        Wed, 29 Apr 2026 07:15:36 -0700 (PDT)
X-Received: by 2002:a05:690e:12cb:b0:65c:b99:607a with SMTP id 956f58d0204a3-65c0b996108mr810582d50.38.1777472135482;
        Wed, 29 Apr 2026 07:15:35 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff2c2eccsm1379533d50.0.2026.04.29.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:15:34 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add camera clock controller support on Glymur
 platform
Date: Wed, 29 Apr 2026 19:44:55 +0530
Message-Id: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8S8mkC/1XMQQqDMBCF4avIrBtJglbpqvcoUmIy1YAxNlNDR
 XL3pkIX3Qz8A+/bgTBYJLgUOwSMlqyfc8hTAXpU84DMmtwguTzzigs2TJtbw10rpzUzKEVT1aa
 v2x7yZAn4sO+Du3W5R0svH7ZDj+L7/UHyH4qCcYatUbxWUhjVXD1R+VzVpL1zZT7QpZQ+RlYev
 q8AAAA=
X-Change-ID: 20260401-glymur_camcc-de21745db58b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ZHmShmyGvc5uqycG2gU0p-XTUVoyPJgP
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f21288 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HjKqFMqo481W0hlq81sA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0NSBTYWx0ZWRfX5g6/oKlV5eE7
 K3AvxZpQdaY076+iTJhOFuAce8YNxnUhaRsCct9D8woGcWsLtN8YSex8+aMd+m1flg5UJFAPkbv
 U3pw3d2AVXQMo5XLRLiD8ktrupfrokrt6llAEgmAgriFUTnJNE9rwdslBTInBa0Cxm2A5XT3gxR
 pnCufMVElruwUDtX4OZcqiQe7Fvsx3//8ZB1vf+SWNrwfIZ1tBgnINCx3cASqlLl7FDQJ3AilDW
 meoLa03eZFv/Vvj3STd1hcvxxM/mBv/D6PrZSKzkRjnvHIbTS4J0j1YaKYDo3RIfnapcxKAIPf+
 YJwjJO+2vMu8tb7MTvINWreB8y5Wa//adJiLWDlkfU6ewvJXo2UECZcwgfG4l7Ah9OczfSkci20
 mevXUMi+/JBbeVrEB6Ov2EhxDQmD1OwsNTJYsZd6CTqPNNP/yTXfduMbY511PcEkzBSGztDQynG
 a7pdnO4yTJjm98VuDsw==
X-Proofpoint-ORIG-GUID: ZHmShmyGvc5uqycG2gU0p-XTUVoyPJgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290145
X-Rspamd-Queue-Id: EE295495908
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105229-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Updated DT node reg property to use hex for 0 also [Krzysztof]
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com

---
Jagadeesh Kona (4):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support
      arm64: defconfig: Enable CAMCC driver on Qualcomm Glymur SoC

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   16 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 7 files changed, 2433 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-glymur_camcc-de21745db58b

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


