Return-Path: <linux-arm-msm+bounces-89782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A029D3C487
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BC6B556980E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 09:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A963D3489;
	Tue, 20 Jan 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mMlsLV3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYFVJNYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E5D3D1CD1
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903024; cv=none; b=E+fFmCRRIJ+Nx/QnEgCW94vsWrEkkhvpEE2J7qMw05X8HKZufRN5N78zyOCsYoHY6OJoBHAh+yQVGltkVR2ja7+BlYzGrDlErvx3n6hEmzgL/TTVPHJXiOfUhvbxBYsrZPU1PDDMYmZSzWKjF/EihCAjgA14qc3pASG6UwD+XRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903024; c=relaxed/simple;
	bh=FzH3FXVIZ4sYtWn5IF8efd7H+UrV06X/7FFmsV/Erq8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kBkvQ4+/4E+SoTogA2svLK7ToJiLJVWBa7s+r+3WYaMw/EIaNUO98ZdGGcvyunwYHlSOA8LYnkccfRWGf0Xv5nD1GoxVadT82IhvH5qu/TqbTmq4ewaFiT+0Ij8k0dVIWAFl37nodiUUMeEk+ATdeEKt1NGSsf92qDtPvemdn5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mMlsLV3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYFVJNYa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K61XkH3772433
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 09:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SnG6fJCRZE7y7BN7GndMWu
	n9/Ei2lFxmtqiFlXiBylA=; b=mMlsLV3ZjWqaASrLJPHtMb47IpfszxZVgrOKw3
	kWnB2FHI31GXfDtdmeDiwP050lXuj0QNUKP0NTZ6l9RAKX6RKruKPoULErwENulN
	AlN7iJXGLAs1GNHX1PkjtXKzMIoilxj1NGYNI8fDyLqr3t53juanrzMJgPnwrIwK
	O4kCfOzxNYLlSkcm1Tg4cfjvF0fzTQoDyHSdATzRyGQEBoV2qJw1h7WAfN/b1Pbd
	K+Oa8Om/+DrAXyGUsOzIy/cEcKlPzHVJQKEbRFmQ4xLqj2hjup87FxTrEyCZVYcL
	yHUa6VavQABDp6HXq9uq+IfB3G5wReDZ6hDETFCNE8hZK6rA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt42wrr4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 09:57:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5015175bbb0so121137311cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 01:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768903020; x=1769507820; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SnG6fJCRZE7y7BN7GndMWun9/Ei2lFxmtqiFlXiBylA=;
        b=dYFVJNYaHo5MV06LohLD3CDrO6apOz9AGwsH6JuVYEJF5sHB7zwzG062pf+SaOMdNX
         AynnRkZEP0kHLPBw8vW5ILAOL03SmKQ6V70XT6uBgPb7hrFZ19ZoDRWtPxMme6J+fEwP
         C/klO57cxU3dg9FNikb3dMeWjTreBfVlP84zO+De/W4leGpQ5DCKFQsxBJKa+htQ5eLI
         PQJw7oi9PE6gcmZU6XD7MYfBSuWGUVOcxcNz8XRfLQUM7Cikwpv1Cd+QJIKJwORzKUbw
         IevZmup7kM050HQIS2gaTcQOY9hx3XyA/kjA5ZpzHp/9asi8Yb0AqBDM43sMzTzFnxwJ
         u3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768903020; x=1769507820;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnG6fJCRZE7y7BN7GndMWun9/Ei2lFxmtqiFlXiBylA=;
        b=oaoVgtXwW6c3/DBe7LLMF73Wz8azbuHcGfqOD4XAQ4hyYA7q1zGNltTo/eDiqNq5nS
         y7mGDFAMYXUBDVsvO1NSVhXSDZBFb1fxhGE62g9mvpfJ21IN4+F4v016r0JtXBco+b+n
         SICM+3/70VDB/pAY2c2ACERvIP/Ppini1sDN7fXBLqCMNor3kriIy3pG1TrP7X+Xu+XH
         /X2e5VZYdpHVNPUtPByrzyhani5IVjBK3JwQrhv6dJkM0WmrYrJLPu8j7wAyObTFD1CF
         jghfwhuNJLZZvMZZ1cYb6v0meDtLDi6r3TkCOumD2odbyPPJFl4/um0aRTb/8j2ZC3n6
         vGWw==
X-Gm-Message-State: AOJu0YyVhzzxdQTAgQBjmzM5o8QcEXUW1dybpoZCn+MqJzOcZxMcOVQq
	eI1iocWd3ABcA/364ZpZTxQyLqGdqhk3vmtlTEWLyfiCyaOCVGnihMvbbCokp9rkVJLfla81jMd
	CPdTgA12ya6E26jtU0WMVxebtFZOJcYSt3PHb2zfB2jLF7P3x6JYX6YUKL6ukSJBvm1Ot
X-Gm-Gg: AY/fxX4OdT7xspxTzU5/P8K91ulqFFCgvSI06hmJ9VOqbakXok0XzkYnmDATdIpBf1T
	+qWfMEf5KzU/KdzaATZ0fonX7AdAxuFps84XSrzhjGPCp9ot0K/YCNHiaV/O4ZdatBVnCyqemlR
	9lXcNCaYEz4iRidb1ga1EJS+BP3ICHipiPZwWoquw0jPze7k/hnKsuw6lJuivurfIdnEWjqYeH6
	U0RlQcTYVvWKnhImq6JzzR7x3omZOWbyNHJwWOBSIdjk8yhUX9SACAOxLBIzz8vpXMeIiPaynnc
	eUfL2+mSqWvKqrQ74vm65hQ0BTZlG5zbV8o2NkSxxmq/cy0huhgHKV7PDwlKPwEjGCLNBYpT3UH
	oNxHzvAdd5/hptmkjAA==
X-Received: by 2002:a05:622a:95:b0:4ee:191e:adea with SMTP id d75a77b69052e-502a163d0fdmr178747241cf.35.1768903020114;
        Tue, 20 Jan 2026 01:57:00 -0800 (PST)
X-Received: by 2002:a05:622a:95:b0:4ee:191e:adea with SMTP id d75a77b69052e-502a163d0fdmr178746921cf.35.1768903019439;
        Tue, 20 Jan 2026 01:56:59 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654533cc543sm12697032a12.20.2026.01.20.01.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 01:56:58 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] pinctrl: qcom: Add support for Qualcomm Eliza SoC
Date: Tue, 20 Jan 2026 11:56:39 +0200
Message-Id: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdRb2kC/yXMQQ5AMBBA0avIrDVpKwhXEYu2BiNS0pYIcXfF8
 i3+v8CjI/RQJxc43MnTYiNEmoAZlR2QURcNksuCC8kZznQqtpI1wc2s1DqvpOqKrBcQm9VhT8f
 3a9rfftMTmvBO4L4f5a3x9XEAAAA=
X-Change-ID: 20260120-eliza-pinctrl-7bb592ad63f1
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=FzH3FXVIZ4sYtWn5IF8efd7H+UrV06X/7FFmsV/Erq8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpb1Ffa++4e/D5/abuIIXQA45h3fb+68lmL9fqB
 wtBEzvBiwyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaW9RXwAKCRAbX0TJAJUV
 VhXYEADBf+0NS6KjFQ6ZDlmQpwIq9NRAJAIcZ6u30sOffxG+/wziu/zgbXoZuG04PC16KWMQp6P
 ar0UaU8C8IUcs2INdg6KqPOWiYn4Xo2creB3habv5hS1Xd9yTFSVr+b4q2deY50jS+5x5eR4kZA
 V2Nn1TXGVVFxzoT35XNKv9g4Z/JjyJK5Bx29z3FxZQc5K38O8tFooexvpIv7LlI9fc26Ex3uiOh
 HtS+aq+5RQaNnAjAULAMBSwgwyDTfaGeLTqL2MlFfsTZTPDv3lBIQtP+52XguNPQDaG3lSuC1UM
 d94Q6Hdn32UK1CKMZoMbKLPzLY7ida/WtF6B6y+/81Ob98/Jzg+9J2e+AM57YIfY98jdBsX+1W9
 MzezyRKL9+67GhcMbodPffXCOIzszPvJ1dzVjIV5bIunt7wwVnVJJiiswJw5/iWEwaqPNe1972n
 dPV8WTdsVlHE20fYdQ1pkGW0hgEjRDzxmtJoFmYjnvWbFKvbVCaOuRlxe0zvw42EQEqf0jAqBNN
 hVMvzNz1zY62KGdiwTDGC03mwlLUdhhHG3Tv2+1hjJqQE7/QhuPTsvC9k8V/yLHTZ6wBhjvAFtG
 i/5F93uHQwpO9nP+45umIz/lpPFm9v7c5wETe+Vo+2xnoP31w0868tvzoLMn4dNzK66Iw4wiCp8
 taT6xkLqTLT2EyQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: q4YyIU2_DMuk8sBU03nmCVvrpUxz_0zP
X-Authority-Analysis: v=2.4 cv=eJMeTXp1 c=1 sm=1 tr=0 ts=696f516d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OwXYu7Csgvg7BBQfv-AA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: q4YyIU2_DMuk8sBU03nmCVvrpUxz_0zP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4MiBTYWx0ZWRfX5AeQKwdItaxm
 1D+/W9ws1WwvkN3wszc6eLHbDqG4i1FiRaR3EeL7JQHrNh2UOcBtDtVlPGWWeko8yz27hEnHtet
 rZVsi+C0bRkpD3nnJ2xoJdpSenAu8R5C5goYWugfd07X7GwieC6BdXkca61z5qj+c2pa++hV6qx
 ++M0G95vWSu0hA5BN6ELadd5uFeGk+4aaiTi0Nd9R+HGeUuhDjN9kqkHpvgLMGqn1SoHZgGsAbE
 B51LQwlp+FdXC1UwXaQLEZ5hx4qsWVDAbfVltB5/ic5QiryDbWhkN3qS7wowVlAWSExtYvVfx0m
 AD0uD1Jc2urXEFlgBj2WCsK8kFgKOJsEQvevd5ymsXjEp/dvrji+K1EhAuHVfo5SvNBPXeMgsd3
 9WIzKpAvkm8R7Tk47CHV/nLxMbkqq0qngUTueUSlf4RASuQslexakCiPndg2iSNMNQj4roBUDc8
 oOWh8E64iP8BdtahPaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200082

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as built-in.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      dt-bindings: pinctrl: document the Eliza Top Level Mode Multiplexer
      pinctrl: qcom: Add Eliza pinctrl driver
      arm64: defconfig: Enable Qualcomm Eliza pinctrl

 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          |  138 ++
 arch/arm64/configs/defconfig                       |    1 +
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-eliza.c               | 1548 ++++++++++++++++++++
 5 files changed, 1698 insertions(+)
---
base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
change-id: 20260120-eliza-pinctrl-7bb592ad63f1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


