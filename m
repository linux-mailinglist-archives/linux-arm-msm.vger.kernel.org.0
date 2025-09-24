Return-Path: <linux-arm-msm+bounces-74744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A402B9C948
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BC924A506E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2495725484D;
	Wed, 24 Sep 2025 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awWAqg4n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5711A83F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756704; cv=none; b=QNAuHAIKg3SV3HdtdIQF4iU7kNKup6SXeQ+kefcjhnXuRC7mr8DDbJwWEEclSh9jd9cTUzy+7PXKdfccOOpxnFcP4zfSbtxfxbbLhWM8RZJ7dgWNnqnTjwTF1VBq0VC99NHYXKSC5K0PjY3gKU3E+jrRZQ8K5F4kV4SJ+akvZhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756704; c=relaxed/simple;
	bh=otknaPiEgPCDQetk4SzSeTofpJhMuWSTYnVr2MNp7n8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oEwdEbtdVjAgEP7DTrR8aS0ISS7VG8qVxpxlBx3gTgaP3aFI3d8JCkiuokdKO3DswUJ3GpvBJ+hvKFUK2eN/4TgXgfZEhOc+FW8LSoV01ad66bX1dpdd81s3MHo7wa4utt7zRG6sY0LeD7Jzxsy1BiSBEcxfl4d8wdj0RqyQT7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awWAqg4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCSwET025075
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=23y7ZKBGeMd6lj+VSF6lS2
	f4pAAL+cqtAVWcFUxP8LU=; b=awWAqg4nn3TFDPtv62excKiONOW3qk4bX0NZ+A
	OY7JnZt8UtairjsGOBRncZ8RFDx3f06VYlKmItWFnp0/iOyqLq8VrgkvU6sBapt6
	j29KfRyyW/cp7xueg+sH05eQS1Mirrq/l8eE34Q4tYCOt+x9P6Pp6M2WZRiQi1WM
	qMwOjVLKjG+nUrebR01/YkmdWW+DJZ/L0R6rPbOYhljk/hNt6VkjsN3iJELavPIe
	UjT4WsMmyluNgHAs+PdE08a8rW11uUZfSA4Y+SQmsluCzjWnLaFQXfBph5+fzHUb
	0E0FKKtAI0bm6kKZELvYH7jqZiHpfH63rGy3vgtfSmD0fq8A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexbu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:31:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befc5bso342567a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756701; x=1759361501;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23y7ZKBGeMd6lj+VSF6lS2f4pAAL+cqtAVWcFUxP8LU=;
        b=nQLsOQFMOEAwHnN8WZulD1jG2PI5w+4R5gF7JOc/hUExOOBtdDhAv8NnG05Ub8E54q
         41/65SX+g637mm9b2MfTfFkFsjSANVkV4XDskODr4WKTmEWJPYNzFUUuUZJooVA5tOT9
         TV5rZEsiXJenSDB+vA0+qbm91B1bjIDZBfwYzqaGoHqjmKocRtiHwYrQqm9RBOE8g18L
         3I3AagKqagwaY6HTIjd9pujYzhOPQ2v/HYkvgGkbhRWUMcj8t6sZZ7wzr0m5dgytJglU
         A0g53MuRLR5TjaZE7LM0xIL7JJoF9hlO+HWZ0dYGwr63f8Mt++OLi4I9vmt5zn7uLRLo
         uYRg==
X-Gm-Message-State: AOJu0YyUmv9qGqPDEg6fIuU1hU8rL84rUqeq6u8sF+riIv1JrZZQTXr5
	eFCStJr7C+F+zh9cfWeeGPdl2lzQVuY0hztIdwjmyD7302miU5/SVUX70da+ea0rr3SIOQlYiAu
	27Jjc1jwmF4SsQ4DttWZbEonvkwpEB84J3+f5WBC9y1ztuKmVmpfFKWMVjQvoH/EWmo+L
X-Gm-Gg: ASbGncvwy3XNEodovnm7tHK+s+SFt0VKbluHCqvZQbjXaOUXT1pSWKjZ7imToZ0pmNJ
	Ev8r1T4hCB6mDL425UO2Vz205eKAz/6XXg53brlHF0bzqxg4skIjM1ynJkC/VaL8WUrNVmweaeT
	p95+GcOOT2A6J/xBtaXAa4Rnd2RIV2Jr5smkaiq174XF8GbsGxBdPsKhhPoNC3ai2IbMDrtxNNM
	4unbkGoejlvzjtaG7t285LQbrFJwWWLUzHt30aH8eR9XcYLsmabdiXjVF2nllGRuLJKIJAGAaCz
	5f5xIUVb2vSKToW1RZgC+Z0qWeMmshHlLeeiAatXiZ1oR0qnFkBJHyaLm0IrUpeQa7gRJ3XX64/
	YBgfJwC8ss5i1uL0=
X-Received: by 2002:a17:90b:4983:b0:334:3286:8fe2 with SMTP id 98e67ed59e1d1-33432869004mr1085528a91.10.1758756701010;
        Wed, 24 Sep 2025 16:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtORkDSyEBh0p7+g4y62c1D6EhvzJ6cOeEDKqrvpOJ6GR6ILAAtp6OjtcvEuAknWFxquO62w==
X-Received: by 2002:a17:90b:4983:b0:334:3286:8fe2 with SMTP id 98e67ed59e1d1-33432869004mr1085489a91.10.1758756700469;
        Wed, 24 Sep 2025 16:31:40 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33474f14e4bsm194322a91.28.2025.09.24.16.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:31:40 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/3] dt-bindings: soc: qcom: Add Kaanapali soc related
 bindings
Date: Wed, 24 Sep 2025 16:31:35 -0700
Message-Id: <20250924-knp-soc-binding-v1-0-93a072e174f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFd/1GgC/x3MQQqDQAxA0atI1g1MZ6pgr1K6yIxRgzRKUkpBv
 HunLt/i/x2cTdjh3uxg/BGXVSuulwbKTDoxylANMcQ29DHiohv6WjCLDqITUkht6FJJ3Y2hVpv
 xKN/z+HhWZ3LGbKRl/n9e5G82OI4ftvizFnoAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756699; l=804;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=otknaPiEgPCDQetk4SzSeTofpJhMuWSTYnVr2MNp7n8=;
 b=NiUXXvA0pi0wEDXjXfqcoiXeUo2PEdIFJzoqMWL66deRAKqxlnbzyQOmjnnsHHAxUW6Ol7jvO
 mR5BHUlF5KED6Wb7t2HjP5lVRx0FNIDmqVeVpykvCVnRJ23+MB2XK5F
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: ltR5kfXgbKbgA3smDJqp4mJ9eAtb2smA
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d47f5d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MEM9KrPBMfUx3s_cz2kA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXwFuQjSZlPsGc
 oMTHqycoazyE+/xlAVkd8R9FT0Krson/yCuXhaU58JGaNTn4d1wIFJBhpRYcpT7BkSW4zMPUgRw
 AUIyQJ+KWv4H+k5fj0axYweMro9GnbG5bVAow5L9kLZVK1Qpsck5b7l+e03fmxlPcie3r5HnbBL
 EAIWcG9cOGbClsKqRqeWZETU8SgmQPFCA8mK2n3v/ROSyAIj9HZ+huIZt3/wj70bS4KceTyk4kp
 LiE+rB5fCijUagwmLOktg4RdKt/Z3qnOjiLf2BulrObrHvCK04fGu2taX4OG3ER3lsE+QU3kjxZ
 6ZgeSqKPtd+XyQzp02E5NZXwBISxMIOPe22r4evh30emw3pDN3r5LrSNRR/4aj8u7TZbjeXJjm0
 5j38Y0Xh
X-Proofpoint-ORIG-GUID: ltR5kfXgbKbgA3smDJqp4mJ9eAtb2smA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Add soc related bindings for Kaanapali Platform including asoo_qmp,
imem and scm.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (3):
      dt-bindings: soc: qcom: add qcom,kaanapali-imem compatible
      dt-bindings: soc: qcom,aoss-qmp: Document the Kaanapali AOSS channel
      dt-bindings: firmware: qcom,scm: document SCM on Kaanapali SOC

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml      | 2 ++
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 Documentation/devicetree/bindings/sram/qcom,imem.yaml         | 1 +
 3 files changed, 4 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250922-knp-soc-binding-a035063c364e

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


