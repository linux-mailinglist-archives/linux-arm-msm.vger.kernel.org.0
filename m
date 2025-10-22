Return-Path: <linux-arm-msm+bounces-78253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A1ABFA242
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8B04D4E28B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E6F2C21D8;
	Wed, 22 Oct 2025 06:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZhPjwr2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741001F584C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761112834; cv=none; b=b16lRbpGzVn/bsNKGhC0akxYskzF+qaQgGmnCL+wlNsy+HThL9zIYZBFNu4Eh+RxAtTXLh4RrW+goWlTN91sg3aU2EDb1skLazfYEjdX8S5nVRuUafmw9UCS8A2OZBBX6m6vUpdZwsomCiysP9CY31UGE+s6fQ/vKueGkcL/3fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761112834; c=relaxed/simple;
	bh=yQXrAqjTG7BN0GCsnlOIGGeXITJFR61e1qODGkTt/HY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gwLTSZJcLcg2A+Fplzc1jryWwF76V+wQbkKJGvKxzIvwD3Y6MWbavFr4m+gSphhCyStbcl6IGXOevUwQf227bM/d13qLMFTkQZDgwpyfY2hSOzxxyA3W/8UeTv2yfoezKn00BK2ecl3JSoqaBn07J9sY/q2gk+uxY+C6kYDtNe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZhPjwr2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LNGaOq004699
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KiHfETugvxtw4u23LQt/a1
	R2Um1zLYjRMwuZfIZP8GM=; b=RZhPjwr2AS5FcoPchY1w4vkn2lFjTmhT0U/9kZ
	Sxlyh+jo3DNgkCy18N45wVqFaUucT5iXD7q9T2nylY8A1qQk0+Vvj2o5kimLVm0Z
	tL6QcDOsnaxYu5AtmI4GoDMSPIF4JS6/L3+tiPlUZ2MYOTy+zseaRCK+fy0q+Pqz
	yKC/x/eFxZfmJV5Kl22tGouhn9/3A4M0IB2EM1Wo3Q0nD3IJhb+wXFWVi9EFKiK7
	jI7Q8oPvWk2+aMcZNmsAyxbgfwEKwUzIPTHCFKZ6i3wWKZxYy6PERu+1yL9bK0jy
	FuYXeDeZdqcy1PNSAvCK7cmI4Aq9N1hjvTMG6l2V01yVBRzw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkps8x9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:00:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2909a67aed4so5294175ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761112832; x=1761717632;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiHfETugvxtw4u23LQt/a1R2Um1zLYjRMwuZfIZP8GM=;
        b=FXZpb0dCjTqm0Xg/G06Tewf9hh+/Z9PzGw2A2RyHk6rdy8UJZ6B36GihBTh6J+Zh9W
         mYWnXaCL0QSq1bfcO1po+vSwVXRPgUFrGUwaIwJeJBDIHjFGCTL1KYOSn6iaRvx9/9EP
         3NrqDPkK7xkvHu8KLRuQ1nX/xeASw6hYU60qnctmVMyJtD3JEwXq1H9xckfpw8jeLbis
         OhFZu4VeKiHIpAzcT8+XePHV6GI1FKevE/gVNaCaz4n76crwPABS0mZlivGcO7iJZ+yG
         Oj9eh1ev8ljJP3koDk+qeWR//NWfNwDI38s4rtySc/QTXHV0AJ9RkNdVo7owMQaf21+Z
         YhmA==
X-Forwarded-Encrypted: i=1; AJvYcCUPMPHeWAX7bCiUDBEnUwNgixhggZz4nai8Ri0DnFCRHFRB2XUWUERSok7qHQNrfKsGYuSDGdohg4WKxa8v@vger.kernel.org
X-Gm-Message-State: AOJu0YyUNywOlOuhcIy0ggVdZtUWINRpZe94fTEotZ6DkZ/tM8dh6nC8
	WKqGtT5kBaPcY7aAtujXEDv8PCSpGYa4EiaO/XnztHP1I++w0T3hUzb2m1wLzcWNpegyzXY3sHp
	fHPyu66V26FReFb5YYnCb/cMV+zY0cT2Z09gnFEHm2sEAznbZhLzDG+XjUUrFxyAxIsxVeHIqiy
	KYb8o=
X-Gm-Gg: ASbGncuPIYKecWrKyZrq2cuhmlwm170O6FscQ6YIv1JKTjUK9E0HnofCdCDwGoXsuzo
	vRkCyMCl4gDB1UyW/ZOqwuPCHJSdt/Gi+DXLRJf8wIFkvjrUUeRx7DT8rWzL6nWhPRZ4bcpHRwT
	7+ZJk6/OjhEsH8o85Ljq87RhR+2PJ2dgKOPuGMsgQufY5uUJj06Gz3bvMsmELcUrKrJ60EL6Oaw
	v1pC8G6/YMDmrXys64kl5qzPMvPR4hcT+qDdnwTfsnI3F/XJNApJoMsgXHTaR81EBr18vAG+irx
	TW2IGe5uDl030hs+TGIQ/15MouIybJjabnE6hAROh6sfRzgFTwdBCRajb05+gJgzN2QNcfL/GQg
	umitOdOIvISWC2O++as0qsFg/l27SBn4uddhHtuNFa2AE1GVPDA==
X-Received: by 2002:a17:902:f60a:b0:292:ffa2:776f with SMTP id d9443c01a7336-2935e0b4f92mr3968345ad.14.1761112831516;
        Tue, 21 Oct 2025 23:00:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHGcNB9dXXCmTz01IciMyYl/TMG3cpDkUXuT+VDd0s9/0d0nie9Z1Rw8YNrEYSq2MqvMJ4MA==
X-Received: by 2002:a17:902:f60a:b0:292:ffa2:776f with SMTP id d9443c01a7336-2935e0b4f92mr3967575ad.14.1761112830815;
        Tue, 21 Oct 2025 23:00:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fcc78asm128857445ad.32.2025.10.21.23.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:00:30 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 23:00:26 -0700
Subject: [PATCH v2] dt-bindings: qcom,pdc: document Kaanapali Power Domain
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-knp-pdc-v2-1-a38767f5bb8e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPly+GgC/z2N0Q6CMAxFf4X02ZGtSgg++R+Gh7EVWZQNVyUaw
 r9beDBNmtz03NMFmHIghnOxQKY5cEhRAh4KcIONN1LBSwbUWBmNRt3jpCbv1LGpCI3W3lQ9CD1
 l6sNnN11byZ1lUl220Q1bX7q4YUPgV8rf/d9sNnhX6wZPf/VslIwlV5Pzcq0vibl8vu3DpXEsZ
 UG7rusPC8CqPrwAAAA=
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761112829; l=1114;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yQXrAqjTG7BN0GCsnlOIGGeXITJFR61e1qODGkTt/HY=;
 b=oEn7Mzyvj04DD14Hb0ypY0Ca2zNr/t4mQzgu+lJDOMJQ5ki76NYBngbjpIw3UtnfNHRmMwEKQ
 0JGMLud1iaFDDd7MCU3zlczY3fJyon08Onj6QD5QQBrNnCeS9hQVhM6
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfXyBnwW8hkJV7s
 C//e62fF+kkd/upNEOaYzHefqNVJzPdygMcG1a6NL7Nspj+lHGJCFB1Vk+NmMmaonhl4CTYoZLq
 ti9+ED0rKiXjoAaiAnUDWCR3KP8GC5MiMFm8q3GtTPR9dn49kqvvF6YeoTTQWfdZiSv7rJQQDlC
 s5YAqeCq40RUPxrIjKl6ZSTuv09rCL+RDKTklRjM+FVlPoouaBtzNpUjbHlK8jE+6sJfG+GP6wK
 WSCdRTtdZfJeLSfpDeoQb6SxF1pv5G7+kEhFJOroDwxVqtMjRGcx74V9HALsE5OhTNaY1HP0KZZ
 GNEsy5KxZxgI4QNcPJwEhYs0WBTxS0i9pxeopWkH08+32AP/8PO7DkuxmYTPepo7zNnKZaY5hpA
 5+thEFwAPvXwghr8v/jmD46gcxvtcA==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f87300 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D5gLrYdNfuu7_6MvFCsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ikmcwqLl0MoRTfcYaqgIJUZCfrDR-dES
X-Proofpoint-ORIG-GUID: ikmcwqLl0MoRTfcYaqgIJUZCfrDR-dES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

Add a compatible for the Power Domain Controller on Kaanapali platforms.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- rebase patch
- Link to v1: https://lore.kernel.org/r/20250924-knp-pdc-v1-1-1aec7ecd2027@oss.qualcomm.com
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 38d0c2d57dd6..b26246de3186 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -27,6 +27,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-pdc
+          - qcom,kaanapali-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc

---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251021-knp-pdc-395e2100d15f

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


