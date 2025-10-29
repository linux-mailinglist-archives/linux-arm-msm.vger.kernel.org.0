Return-Path: <linux-arm-msm+bounces-79479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD1C1B6CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4FBF7345D3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2BF3126CA;
	Wed, 29 Oct 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrHSavp/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Km42uYIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9FA2ED154
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749214; cv=none; b=uKMU4r1+yG5GLoa5EICwzUWOX6/ef1Pegz4VjvkNs+RAaRuiRPMDrg5c02sFgg9oeapdA2rpwO7XGRiqa/fKH/w6xBW+ZcjlI70ikaA4jmSJnzsBWqDtkSuHH4Fky+hW+EJXeeUvcz3zk12NsyjxVjweT+fX6aEQrOd8LBGFq8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749214; c=relaxed/simple;
	bh=WlLMZwo0H4Ep9SK9cIL4i/qaXEGNycF3lxaPWFNBL/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q8Uy7V3y7HEPqko8BhvamvRXrwtfb7T9CEm9V80Jouk283nvdwmHMf45IdRsAxxkipOV+8SIPu5mD+4tQPDt9LtQK7taIyPzErgFvI25Q+/cyQ4Mq2Lu+8HHZnp3gRaP7qf00L6r/GgZgqkY1WnvlYzXjwXLGlKqU9isXeidgCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrHSavp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Km42uYIh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TBm9Qn3692185
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 14:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3VQByPyxhbQga8wEr4/BN3Sn+0fDUaknqZU
	S5siW03Q=; b=WrHSavp/1SNze8CpBfqeOmlH3QWMaVVrl+7Nx6bSc70s8EZ7CJO
	AlxJ8sUtKvserq6JFA7HqErfhMbdZJhYgnoBjN1ipHlHD/THcG9Lpi9WbzomEdz1
	I8RL8zyFKl8dDdevs+IBsWmylI9aG57h/+mxtRo6d6kZ9olfJeFBLZWi5azLTqtd
	b3hwm+vAPw6K5cAbjKTi6H0u0m/KUg3HN8byDv6XnaLk31zLx6lmu8MOGSfMbPyS
	Ihi+gwhwHqowjofIKo1ymKzo3xsxkHyzKCcVIAt4KnW8MFtDzf0oVC7rWMAlrP+6
	2G6cywUi56DSEKmqTTZsmmf0o2Ss8ZGcFaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2jx5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 14:46:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eba120950fso132644611cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761749211; x=1762354011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VQByPyxhbQga8wEr4/BN3Sn+0fDUaknqZUS5siW03Q=;
        b=Km42uYIhCt6crVJbqvZUFh48lJ0/BkYL1rui7XQ7XcZeuSD6l+6pj8j+0UWcoUrTOp
         3FbZRgBLcZtVaVXLtXC4l0dLlMRunut2CSgVPSHt5G1WVkTjyr+B8+Vg/wGrOt8Yxhsv
         zhZxHHgHx11ZWfDYZMngmF5ce4ZxnNGMXpqFqKjOe0Z3Fkb0a9AdrZeG2ABCzX/qNQtM
         FLsDebHYELz2Q4bsNlQi1uWeqH/Qf/i6sInRAAwUiqCXELFOBOrk2BZoeBmlFVucmMWu
         BEJrwOTz5nT52BPkJuF8w2U15dHmCQG0qo9zugR91CIiX2n36WUkW3fdND6lbjAsErBk
         IRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749211; x=1762354011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VQByPyxhbQga8wEr4/BN3Sn+0fDUaknqZUS5siW03Q=;
        b=YY0H0VsGn92EbnzLrBCzCk/KhDrpHZK9Bi9dcLmZpJosV5BB1pQY708VHZn4B/VZzu
         JyZTIhkcyO7cFVpXQUjrIsLo05IBCRDneHAKOXpPTXDS+QaM1iLf3KWZpWG/yHnp25bF
         hbDIl7LpT4/BqryQKPephGMLFzfSmJN+3XzR6dz1+39Si+tCWJ7cUQi+1uHu+gkxvQWt
         h918D9s3nD/1PFAPnimUz8cq2S2EeMXKbtO5lfMghIxt4syh8tNCULud0yHPVw1Lp/Aq
         M0H++MKbuzPiKczcjJpwViKCGsgPlf0v5acjfcDioTXpAGwCLwGQWHcarF5KPJqYUI30
         Vwqg==
X-Forwarded-Encrypted: i=1; AJvYcCU1FJhAGTvSnZ0ClHdK87RhDOtY9pC05i0xkeDbQC4n16rSa/SPuZz5XDCZmX4Ct8t13vYxx1hs8yZvlIhJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwkeGzjuYLVVGwLkwgHPnxle2BmYURAlINspDIfS/xlpEJyXlDj
	PD68+rXaQJHznE3lt6I8lzWadOMn4vX1RSEp0LUytFS8YSnv4vxdhsp+yfaKITHxNMKLMbEFKhP
	WBQG5bJLz0DsALcEHTW/RqQ6LnIJYT63CJF6blGYaYnj7dip5GY8PJ9ffpT+A0PwBogCw
X-Gm-Gg: ASbGncuTNwF5+7WvPjsduq26vbrtNL0GgwNePKF9VNsc8dzBqsgJle/Qlw76Meljg1J
	4iBDz2b0dT/KNy8Cvk1rw1Zj5HuCghBo58mJ3OAMQREI3G29YsoP4t35xxNXlWvL8N5c4oW2Z13
	GgUmxdDDbGasSrOpD13lBI4Sks+05CcAsJYcC75NVf5aI57aWgA+Rw9RqoeHDvPCmldvYj0nAQx
	qG7ULYt36skNrSdNjZsbvNwupLr9oiNUx89e6uG+BRIwkgANc1s/otlf7421fvQOdJyF4ibdnSP
	IAgK/nttOXc8nUfmiIuULY4Sg8vZ0LKJYZpZkC1f7n3aGP7xOTHlzYvKRWAwosaIcnWNoTcB6zL
	IhdKGdDv69M4P
X-Received: by 2002:a05:622a:8354:b0:4ec:f07c:3e85 with SMTP id d75a77b69052e-4ed1e4dde2fmr11330971cf.43.1761749210804;
        Wed, 29 Oct 2025 07:46:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXErexYyuFdz0AmKoKmT2JVIOCX89erGQ023chN47ZncI2gn9SrZMs/CXgh80y8c6IyjAKUA==
X-Received: by 2002:a05:622a:8354:b0:4ec:f07c:3e85 with SMTP id d75a77b69052e-4ed1e4dde2fmr11330681cf.43.1761749210348;
        Wed, 29 Oct 2025 07:46:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e18bd9dsm51573075e9.3.2025.10.29.07.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:46:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] ASoC: dt-bindings: pm4125-sdw: correct number of soundwire ports
Date: Wed, 29 Oct 2025 14:46:36 +0000
Message-ID: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 61_bYq4KHF4foMVIPtsWZGXvTdLYBHkH
X-Proofpoint-ORIG-GUID: 61_bYq4KHF4foMVIPtsWZGXvTdLYBHkH
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=690228db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sX3_Zgyp12BJ_7Xf3x0A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDExNCBTYWx0ZWRfX6rIWj41JGDWU
 cH29xQa4F6kX2QQLWLSrLzpI5fuFvhdNR1+HKnYDsOCGRvlVwy1vvAbAwS8IhzKom8HMSbas1Vy
 WTFeA9CgNsFnzR2kGf30MWHYy/SncT5jICukaw8TFRDwcZF08sa8WpLDX2oBQAxgnZmqVJKwn01
 RbvAUq+jdCaaVuZ3/N73K1CYFf5SFg4Mhy+lsUvEd8WgpEzQEpYuOGIBUvSjm+cL2XbTeaMHrw/
 w7rCbruiqOgHWccZuQoOvLknfeSxb/P8kO1qMbTnFeGaSkvrNbOeVyhsKaLpOX+8iM+A/2XxWKW
 f5RNAIbWT5JT221VHF4GmsM3PlDItxLLA4cuVVMThowSrKT/jppSFG8G90X2rAvVcz6JPv6pMgH
 4JwGnxQBoOSxb6fmYDuFE+jDuhoShA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290114

For some reason we ended up limiting the number of soundwire ports to 2
in the bindings, the actual codec supports 4 rx and 5 tx ports.

Fixes: 88d0d17192c5 ("ASoC: dt-bindings: add bindings for pm4125 audio codec")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
index 23624f32ac30..769e4cb5b99b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
@@ -32,7 +32,7 @@ properties:
 
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 2
+    maxItems: 4
     items:
       enum: [1, 2, 3, 4]
 
@@ -48,7 +48,7 @@ properties:
 
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 2
+    maxItems: 5
     items:
       enum: [1, 2, 3, 4, 5]
 
-- 
2.51.0


