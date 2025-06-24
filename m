Return-Path: <linux-arm-msm+bounces-62255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE4AE72B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 00:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E80911894508
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 22:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275C625C6FA;
	Tue, 24 Jun 2025 22:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0Gk3GSW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A4225B67E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805743; cv=none; b=FyPOnQN+Fc+jvcdolhCOt5Xzssy1rT0BMXnSh8dAMHy+PcSgTCI+votI39WrTVfQ+YMbRsej47GJPS1w857qP7+DO5L4fDsi/qHKxhEy5VfDv4TZQG4nKDB65AcW55fNoj56wWrZN6n32kkQwFyIiVjdn4KyXtwjAMsfOt68EZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805743; c=relaxed/simple;
	bh=th3Ae5B/SQAWX6qLmHXpAPB7x+Q8bgonubks/T4X9/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uXKg3Dpp+hg63upD5SKPYtbuTpX20bTi6Yth64hvFgghWmqyu/Mg4hR3HeLecSkQue4GYpljJ1XiT8a+TIAtQj+lqbPdgjcwprjJ2+gFc5TjDZFR+aGtBO+k0lRFRr2VCy8raJ8KkzO6ndR74wHaMIi4sIf6UE3c/SVrpsaTETs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0Gk3GSW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFMmrm004238
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bgLdW+b+xrw
	utFkJoAS7ASliarNli0r6EfO3VZgj67w=; b=N0Gk3GSWnwDK4e0ANrY0jSWtvFf
	1UOfU2wZw7mu35MG5xmsMWjfKHNZGPn5FTeGMZl4A0zOzyquAXkfseASogx6oQ/3
	98liObGVWZlnn8SwmsWAQ8su7FW8HwVRGPpC+NuOqcqixLCInUd7Ggl58AWg5BWC
	iZMKIb57fwCV+3mN35raW7yGiNTFgdqfThoKPMahiOCEWa0s8iVmvXhrOA2FP18K
	m0NqGwZJyiobz5TI60uzSRGMDSyoLkinu76LSzl40D7k/QnxOCLePTY+W+Crs/3T
	4ipj7V8LXWKwztEhrQYIopxEHxgZ+REBp6md44ySOW+cKppRKe5PPly7DVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4q3fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:55:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311a6b43ed7so5008641a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 15:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805739; x=1751410539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgLdW+b+xrwutFkJoAS7ASliarNli0r6EfO3VZgj67w=;
        b=KZsjZrF2jLiiHAHPBPUoeCxiarlE7OkwdVx6epX3R5wXc7w2hlMfZWY0Da2sd/dZ0z
         ZK6vG/xkAgFMnOPW1bxwoX8FY+tQqTE0e8tnXnp7fEUJXVCXn7xDoq842ROlyyArPeIx
         sqQat9fxM+FzY49pCHlbK2WrjpdnmR2RcCzqrZ3OpGYAqd2wyrOli+EulA8if91BlWCW
         dtfnpgqq0L53zfGYufHQLV8donLSGeZR7xW5TuIUgjaeT9wEQqTbT8/0EF/m5YCdYyus
         3EFWug48eL8ZHhaP7YV+12fAoEB9QH6bvanwn8v5zox9CbYUL2ymYDJAdFKAXje6d18v
         9nYw==
X-Forwarded-Encrypted: i=1; AJvYcCWtt1nRyjw56GClv8yz2x1u7JQgz90rWAp5q+7L6v2gU5UEw21CoPBQbgdfULUfYuOT6QxJ99AMTppVmO/X@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu9AIe4+YXGA2Bc8w/+KTMuBD9zB9oW98Zznug1fQhpqFqTk+W
	1kAcT/GfWWLbnXPvX7xKWAYvjpId8DpJInF9mfwbSOFhlKRdMmcjkTqivuqT9DmotO2Fiqj+o4E
	7ucqaN1dv1hmPRqfiswh8Ey7aU5DOnbn8FVUG1kscE3xzSwcIkHh+TmBv7N8SylogTrki
X-Gm-Gg: ASbGncvOp2pJUvLNl0hgWq4kc3K8cXpiaYkkOnmzm/+3vxqFvIzkmIwFGK1S4GsKlId
	4K13k9+7wPzgKP/MAdM2SVzk5bkCwqvU/2CpaP3TDXLI1l0ZROfLNh3dxYspTnDSTQHQrgLmuGp
	D1AJmtaCMiWrSzTQtbQXK7qKLhfXvMyiTHObQ6tISyamzYlELU0Ou08BaJwbsSLE54bbLYTwnme
	MxMGvTw7rtHeKnIFayBXOONso86BmehCx8TguJhaPFT6nh0VsGXGeswhRdAJWBH9pEH90ruX6TS
	B4qv6C5z1XXmQdIVKmMI1gyuvf8tgf1KRCJA3j0GkoHXUkedV1NpVqBkf+tUPjGeLv3TN85KygY
	E06wm6UQ8LQ==
X-Received: by 2002:a17:90b:5867:b0:311:ba32:164f with SMTP id 98e67ed59e1d1-315f25dff48mr941739a91.8.1750805738585;
        Tue, 24 Jun 2025 15:55:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA+1PGk3DwG/2p8elRCOrzngH3sOpe34iA4o54hpHWqXeVT8z7hYLta/eMScjWi0EtA4uG/g==
X-Received: by 2002:a17:90b:5867:b0:311:ba32:164f with SMTP id 98e67ed59e1d1-315f25dff48mr941699a91.8.1750805738114;
        Tue, 24 Jun 2025 15:55:38 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53a65adsm154949a91.11.2025.06.24.15.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:55:37 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add qcom,subsys-name property
Date: Tue, 24 Jun 2025 15:55:34 -0700
Message-Id: <20250624225535.2013141-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
References: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685b2ceb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dMs3LNW3c4SnNh3c2sIA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: R4YUmlVAMJ8g07lxb45ACo5j6qgc6J_l
X-Proofpoint-ORIG-GUID: R4YUmlVAMJ8g07lxb45ACo5j6qgc6J_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MyBTYWx0ZWRfXzOf0gyS7zplW
 un7E57bXGCm/PFQFB5yYdr7JO/NXfwleKWGk7CM7Z1qRdj68dt6AHJjDUYr0ZNK43CtIjpu3QAE
 1LErkUOtbAcP2rZOd5nniWLnICzGwOAoG6WFNH69JVnAw/lauvyeBSegH6X5vVaUfK+lohv0QM5
 vo8azs6o7hAgN1A6FD5UNjw/Lg8KafEE3zaGF53RXewAMBgiNzqCF2IMJyVO54NBJh++x6YYF+7
 hBZKCxgCcsDi5g6Mi5DXvFBUPZp9OCokdw6dyX+wBtCfU5N49bzjvfoN4jGiEGK2UcQMBKoTEn8
 nqutv5einYn3/Zl8LQCYy0q9GhBWOuBlynD4UQQG1idxW4VZms2zO5Xf/E0A5mMeokUlmBbqvvK
 la2Yn+ODamrat4iJv3U1fAm4Wz9cYd/3Hm1nQgj4USsqrRbKhoruT7hNqM2/BEWR0No6SBti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240183

Add new "qcom,subsys-name" property to set the name of the subsystem in
order to get subsystem restart (SSR) notifications.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 4c9e78f29523..0d1f30fdc579 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -49,6 +49,10 @@ properties:
   '#size-cells':
     const: 0
 
+  qcom,subsys-name:
+    description: Subsystem name used for subsystem restart.
+    $ref: /schemas/types.yaml#/definitions/string
+
   orientation-gpios:
     description: Array of input gpios for the Type-C connector orientation indication.
       The GPIO indication is used to detect the orientation of the Type-C connector.
-- 
2.34.1


