Return-Path: <linux-arm-msm+bounces-74780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C750B9CAFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1A827A1DAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4CE2BD5B3;
	Wed, 24 Sep 2025 23:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XaHniraV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3FF298CDE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757447; cv=none; b=S+k6/FRVVOdJf6rogDXfPQeSjEbhf8RttyTBuWe7ahCZhJnRXRDlpZL0ns/i4V6PZm59IzACQV+dTL/deVcsigIhc0jTgpNLoEEgUY91a9qchr++8fwx5DgY1tapDE3O5D6m3X71KBUuKaWPKo+fkrav9ha30daq4SZXObPFcR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757447; c=relaxed/simple;
	bh=ST7vOr29TDO9i9RP8IbSrNRO7LJ0DeNCOw/G8G8H0bg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vzc3naWYPCm26msjLCIfYquoznIsldPNTfreg6Yyjl7W1FK4WWs+/qooUh38y9twMuuNTY1g5i8i7GWGL8/QDpnwuPdqzH03dEwrw3in5DxLE4HdW5HXksEefdxEmT0yWn8JwQfJNkoW0AXGM5djBlQSA4jUYp5FfgYuJxG/0p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XaHniraV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD4AIR002118
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=obb4lO5267TXksQoWvciqc
	u5t4/H8CEqGSV3VieHmJc=; b=XaHniraV7tn4fi/dWo9Td/Sp+rB7RvsDXrkSJJ
	NmtVDmvAWfn3XtJs31YegkWOKpr8tWQ/YxnRfOA29joHSbMR+xsTNQzeh+WV7Fqk
	pK1YSjbmXfcbJa8UttiXy21nVZYbDL/TTfhL56mzTqC2WU7uKxFaxxtYEnIn0fA2
	JTP6MNF6wSrACBAabxtRNiBYySm5CiK/MMjNY7a37D7boWA3r5+1mlbMGNgbiTdD
	CrbiNL9unb+Fb0Bmg7UEpB5wEjKdhdLT9SsMHX6HSNEVnSzR4B5PaWCRz7ZPkaR0
	Mvx/khd8m5Fn1kT/eJ2P5Z8/gzB0fEgrp8Jg/o2766SW5cWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p354-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:44:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eb18b5529so400563a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757443; x=1759362243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obb4lO5267TXksQoWvciqcu5t4/H8CEqGSV3VieHmJc=;
        b=hIiqNBAYiuN2ctFVbBmNu72hrxAEEJwrMbqEh8PQerAAfk63CNxpQzSJ97VuwV9wfD
         x3QnHyz18iRRta/EfE4B1A3hhAscg9aCXmXSShJqcRXxWB+1z0mpblBOPXmK0ijO2veE
         1rPvnf3qX0aKyro6OhzCHT92Zjib261eMvWrCl64Z1s9ukEldTbj+wI/RyFoAS2oeMPY
         fxwVawy5jV0vRK6rSXxVQuBn2RoyaWSSws3+torclhjc44byNZZckf9dHpkNWk8jTjoN
         Ss5ishRCDof5jhXdlIIpOGeYjUwAlPTqtkwSbcFFMPA30TO9v/eilFsE3OFos1CzwXDi
         QmFg==
X-Forwarded-Encrypted: i=1; AJvYcCXSOpw+FdOeXGnEhJmZ2ymsuHp2VKeo/upInDbOtLgRVroJBZKe6apQqHiWyMOudI49mCVzKzgLmuQ0EZ2s@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKOyzYDF/k0Xh3A4WKf8OB9CzZGwOh+QF4dgQ5485P1OqP4le
	IQYX41syBs2ytrMXLAKOVqC6wx4iZyvG1I5PyUD04NRVzItnTSXnXMlrZNSzOIBAs1XQU2lTQZ8
	tdF6jo0xQwg0Io1QGDoLxJzX1uLaLFguVeLMb0q+PqndxGWWn79yftXwTDweWg0v2t/5u
X-Gm-Gg: ASbGnctBhe+Mckkp4aqPJt9itNgSauzadLJHqg1ziCNbsu0LL8dHoEqAM5m8J7+xWHA
	A/3v5cmYe0xKrqxkLerBO7pdSS5DIW0BbV0ECsYyVaaYEnICucxa2aZHl6XjzhB5CX6PVzKSWC4
	mq2pkvAHl7COnFS6s5cixORtVN78Nyk7wuCwcbaHM/WkFv2tw2xFx7FTckOtzPM3R9S7CY+eNdh
	xqG4rMA5g0+wlr9AygkpG+Fs0IxqZc+/Z4P5v7Y9Slb4KlGQNfJyQDcMh3dHoF+XVHe2GHfhA5E
	92sEhyY+jshW1cDA3w2Wa/IZQZPZR7LpHJ3xU6wolXsNM61Sq8AjDdhaGvM8Bo2352v7Ic21TZM
	ZYnPFgRkxPsn5ws0=
X-Received: by 2002:a17:90b:1d92:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-3342a2c0fcemr1354039a91.23.1758757443226;
        Wed, 24 Sep 2025 16:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0TxC32/4r64+xVuO2ZdIoa+1ml3rjX8myfrrzn8Wie45klXhgJClDIMGhR2jHJwNtuCEvmQ==
X-Received: by 2002:a17:90b:1d92:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-3342a2c0fcemr1354020a91.23.1758757442765;
        Wed, 24 Sep 2025 16:44:02 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3347453dc35sm206983a91.16.2025.09.24.16.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:44:02 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] dt-bindings: leds: Add bindings for Kaanapali PMIC
 peripherals
Date: Wed, 24 Sep 2025 16:43:52 -0700
Message-Id: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADiC1GgC/12Nyw6CMBREf4V07SVtAUFX/odhUcpFGu3DXiQaw
 r9bSNy4meQkM3MWRhgNEjtnC4s4GzLeJZCHjOlRuRuC6RMzyWXFT7KAuwsQrNEQ0hCQH2vdyFp
 XhWBpEyIO5r3/XdvEnSKELiqnx+3FKpowbsXR0OTjZ/fOYqv/FOWfYhbAoaxLUQxN33eDvHii/
 PlSD+2tzVOwdl3XL5aP7brKAAAA
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757441; l=884;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ST7vOr29TDO9i9RP8IbSrNRO7LJ0DeNCOw/G8G8H0bg=;
 b=rBA8xpzV+0eQ4YNHV7IuTbVY3dKaHO80pQiG0Ef78uayvrSTLAr4lmDSUQXmke1FCU0vC3Ghy
 iH9uJwaCn6GDSf1Fuf9ILkZ9MUOHjO5BErHSEpKrqkyrznC3eAS9AwZ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: H9d5GMSf7EaJ_DpGH9713Fm0-8uVRD5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX0VWp6EAn4ELZ
 bvZRhkWUmq3Gxtk9TP8AtMa9pXnCbwzlcOt65zbF2MUYXC18MP9Mj26kN35UsgYFyw93OeBNPT7
 HpvcvLDZK4cs2h2D5xA1AjeBEhwfmTIJWXWsqPht9ib1pUF93FY1/ZOwY+gxSOnqgZRS549UUkV
 gl7EO7Bedq46YPHtVuisa9IetVO6uVnpwaR3ZGpUlzI/MaJbl41FoeRq2j9fIpdiMOU/4wbLWAH
 /Rjc+Lm1RcDYi9+84HO+PJwPpQ7XFuYoSLtbLYlEr1gnUCD45JJKJ4SZYutzA3sxza2nz8o7OG1
 zPh19Gg5aAHHidKLMzdFWn4WEVIK4Jv6KEkkNCRfZ0s73CFqCuFk5aqhKSYeZmKqfv0s+NNBiRS
 rZi4i45+
X-Proofpoint-ORIG-GUID: H9d5GMSf7EaJ_DpGH9713Fm0-8uVRD5C
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d48244 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=w1v-58I_rqdrY5_ohRUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Add bindings for flash led and PWM devices present on Kaanapali PMICs.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com

---
Jishnu Prakash (2):
      dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
      dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101 compatible

 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml       | 1 +
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250923-knp-pmic-peri-e067c827c531

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


