Return-Path: <linux-arm-msm+bounces-103654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PfXOfGn5WnEmgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:13:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39038426AF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D2F9300B479
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2F420468E;
	Mon, 20 Apr 2026 04:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIWTe5uQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FyKES1J2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32968192B75
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776658412; cv=none; b=e6iuzNqH8gMPvft727W+2kNafgo5dt2ptLbPHfdk9wXWpqQJ566NhNZ/VLsfKF0lQ+M/e6EeKLT819iLA5+uXOnRvFpCw8isrzHAW+q64wjMcWzShSxgWSsGnt5Ws/2LM0FGnZIpdJwal9AJccdpmNQErv2iQdZvcSRO0RVY3/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776658412; c=relaxed/simple;
	bh=9QGzM2GwADzNh5EjP6rspLOkwQKNf6EL9dVRXE6ozSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s+xGpDBSI91kovcR+JVmlEgr98RDk7EPIiHONgGFkV+xtEjDQWHXn+70Fs3VUA6lx99kbaX+tK/20ZoRuQ0wveoO6XaKJLCZ03sXu+xbaqQZ3lrEVaxvhgIk5a8Q10c/KW8h2tXsXfBLxVPKiPHQ+fwa7aEAxRafuyzBzTfF5tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIWTe5uQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FyKES1J2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JJSbT82500821
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5IqKT33huxo6LgScnLPN/qrcfhux/M7Dtrs
	2VQgJeQE=; b=JIWTe5uQ4xnihPabIgaKWD/zPfTSVxMPHl6VqUVYnYYnXsdfV64
	tqe+AoTsX0I90H8AE4k3k/cxwBOGSP1DGwzls1Eo8ZB8VSZrnEQu6pXMAl82BwAa
	fLXLYQVBs2fb9kbaaKz8HllFMLyQ157RW6QwOGKfKL8gsK3Y0karVv0KZDQN0Txn
	RKbraZ4U7UNr7PV1BvyDrUFMAMTO4T1u+cx9lyPDup0brz0aWiFkahJRtRiB1ymT
	n8yz0LJkh5fufhgLant4Q5KQQeobJAgFfFu07cTGMZKF7X7meHCe2nv/EeQf38uV
	inQWFBPoWUCU20BwZce2XhrAtR2rUjcs5lA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y6430s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:13:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so4942536a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 21:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776658408; x=1777263208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5IqKT33huxo6LgScnLPN/qrcfhux/M7Dtrs2VQgJeQE=;
        b=FyKES1J2O3LrTpQgfo5AoorNNJAXTn/3PA07VbVQc4EOB7rifp5dTJ6T2I1C+bvWwV
         eLyIwOCrZOKK/Rb80cYwWgWoHJBBDu6AV5hbocdDJf8kT6Csf1QmpB7tb1QERGxUm9+u
         sb3uSAmOB72U+MafwbBLKYCo6Cf3b42y7NGJViwHENMgPAnrWfdGAtytrl886Ut9gyGU
         PhcGdUoYjv9BPS/UBlng9d770J76MyWC4rn4h1de1gnZ6MxRttUC/ABTwGWdzmR+lc3l
         INiegWmFUa1dMy6wz605Y07S+dl3Wte2ZJx6o2RepAHFZ5bfPIiOdr/neh5YOQ/2Pnjm
         EoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776658408; x=1777263208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IqKT33huxo6LgScnLPN/qrcfhux/M7Dtrs2VQgJeQE=;
        b=sEu+bhAoZvzpl4XchAgQW7EEkJMzF2/jloSpy+o5keZ+Y8dXpgT3vLG2I5mnsOWdGp
         HXRlDsYSh0wY6i3Dk/kdy8cdSVg/qHnfsy+rs4AuqrNAzxQvjYFWJSnwzjro1BD8nutF
         zDAoqxQnnLCQ9TNkS3GzNuhcGTEguZ4NYct+RPJYs3DsRdw4gmATYl1fyTbCdgWOcz8O
         //4yHjrP3rMZ072mfEnEdRn9tpQ7Lla9JvVJ9rGvdwWsgX2OatNw5XwFqYy7Ere/amEm
         1c/NxnegvHGgLsYaAxvYd0cAa1JJxFG07kSFiRTRB8ernWEhb+FN2XD5t3WmXu2t5FMK
         62WA==
X-Forwarded-Encrypted: i=1; AFNElJ8nrKGsNAuzirHbDkNa+RaDGdtmK+B8Pg4wZEseHbuyTMnZJYWiK5pmKWu+AtblsdNtGsQ/rGErAKYCpRVe@vger.kernel.org
X-Gm-Message-State: AOJu0YyTZnwo1uNK0XA4S5anl/7aFIDVURuKXgknQxavTFzkATXE4T8m
	gEqqz2i4yQ3O/A8gT4Syc34BkwkZv+lHgGsNxmQ9LVg8IEeR9sBozR+lQxHXhWBLvH8w9TlVQe2
	aCESv5RFUko+pXOXARBXs8FSDCc+jzILVqxw5DuWn7nQsZ0jw5kN2mumffijXnHEcwmx8
X-Gm-Gg: AeBDiesLMbwAVMymCi1nNUxag/FlQb65+KoHoJ/E0Gap+I3qrVIp5NElyd5ANHISvhv
	xsCpog3+8yTz0vsbxwT76NoTdgoXimF+d9N+seBXv/+GMbxZxuj1n8RyLQAUHKCARYefuvpucgU
	uNb2jOXOWnPk1mSm0E3Mfc4ZI8/MKQDVRcglcz+hcK3hGlZQxprnjMfGavvbBqtfKGhSl8f0sIR
	js32A/Kcy6wxBgwMn7mbdRhkHc2KYK6hiEcg7/kexwSa+O+IeoTdbjCgDSWcp5hQyKDueUB6cuJ
	sRiukqb0I8DyQAUCZpjXPSMOZqBaz9bCb8UVmNcROsi2KOWqXXwBTreU0/LTQV7Gocs9YE9PKLC
	IyHEj0HMFmEH5ZKYFepZsMzq3xiYZmEFoLhCl9+ZQmd6lwzvCwMsaNBQR/A8WOLyK
X-Received: by 2002:a17:90b:5203:b0:35f:b9ea:8f9f with SMTP id 98e67ed59e1d1-36140464842mr10938069a91.16.1776658408548;
        Sun, 19 Apr 2026 21:13:28 -0700 (PDT)
X-Received: by 2002:a17:90b:5203:b0:35f:b9ea:8f9f with SMTP id 98e67ed59e1d1-36140464842mr10938052a91.16.1776658408110;
        Sun, 19 Apr 2026 21:13:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a8f0sm8725035a91.12.2026.04.19.21.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:13:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Date: Mon, 20 Apr 2026 12:13:18 +0800
Message-ID: <20260420041318.1247875-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mcld_KdqVHj1FFtsngBx1l2GIb7NE5Kb
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e5a7e9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=LjGnC7tzK2yCY8HLVSUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: mcld_KdqVHj1FFtsngBx1l2GIb7NE5Kb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzNyBTYWx0ZWRfXwUwFhv9Ekjh8
 a0+NsU7iRfmukMmbdVFBMLYxjqYB4KiRWg09SjTVQ/x9YANCQpRtMcW/RFHUWf/EKp4qpaUs+ga
 uHj/Br0eCRe/Whd2c3mypBjFrCSkYBLtHfjz51I8rVNc3IJH0KTdvB0+2VZPsW/rhpwvCuJX6mI
 iml/C6H6FvAnkSgMzeozgmf1Ec73/AG9k64PGTy5Gng8zJcy9iGzYGQZgMfjgmHPOH7zJpot0Fr
 FiXvn8HzyBWMXCIKWCYOmqOfPrpyZ503iQ7K7m6hniEqbjanZqrsK6AyrcRfNkSuUjdcAX2djL/
 m91awQvobGffhGYrANd4k6A7l3SV1HXPGWx/buSJKf/Z9Ex49rRZ8qP/jcCwP/uZOHgB43+yUrA
 zz1QX/wbSGzwNZbhuxnyN6AptOSHzYE7tU7hiVN9gjKd6WK1mRCgfA6svQbgIKaudWMKeTPAHTW
 ziALSGQcWM0RkBQwNrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200037
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103654-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39038426AF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Top Control and Status Register controller for Qualcomm Nord
SoC with a fallback on syscon.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..23317d1b381c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
+          - qcom,nord-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
           - qcom,qcs615-tcsr
-- 
2.43.0


