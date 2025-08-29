Return-Path: <linux-arm-msm+bounces-71226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B4FB3B53D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B832C178FE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 08:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FE62C237F;
	Fri, 29 Aug 2025 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXJuG4K3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6A42C11F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454301; cv=none; b=PPjb0wsBzI+kgFdqm9507Ir2rniVXbGt5PU5Vi9W/igIEBE0dLIHi/mebgPt5m404AFCn1wpowaErrayalGsuYm4DqvCGIVhn1YtAHw58cgZDsVkRNdvDLCzrE6AUFnZbXduFyo3KmcSSVxrJhmNJ8uzeHC0F7PjBtphUg/DmHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454301; c=relaxed/simple;
	bh=2PKGQycBUFlWqOeCmczdNYF3bcFIHeNZBIXA8HRAk4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m8TCn5EaetZKfJLx57NuVmK/orIUbgoQOzBZm+srETQItO/5KrEycUomBCJgRa80nMz+/9kmgi/u5amUH4xBtmDoLXPpIn2aa6YDSlz4/g9vy9ruKWPrNlA7pk94XDgZj7JV/3UjY4WLC1E7FnVzc4gVwx1pn6bnPopsibojmOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXJuG4K3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T5sssP001762
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 07:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nMmvvuBBHOBvmrBWmarNJi
	Kf7qrOg4JEex2f2Ps3aKM=; b=LXJuG4K3BgRrfeZMimgCglFvWnzC3A6JB0c5b1
	gWZAlKyZD1vBDheU1lkx2rB7d86lUE6d8hZMb7hzJ2dYvgVmpOrfddeR9oVHFmRp
	qD4EtZbCxAIWzC7vEta6BXyasLicDH0iYYIFySMPxFlUIIs8kfTr9lJ7QXEOe3VY
	uQTNShypSf92R2zOpM7NTtiAQGxqaR4skZMEP0btSOnQpAgurJ5lNQeNhpo/9OdS
	lZYGdh8DuGL6z5OeuPxKu3iKb6BEA9uRmmIgpcv0UCMgo/XEHyaDRi2haDWIdJ26
	cKognMvQdFp56GC3U2sapYvWcsMUUZDa4Gz5YU907J/N7VjA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgn00m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 07:58:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4d48818a04so277407a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 00:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454295; x=1757059095;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMmvvuBBHOBvmrBWmarNJiKf7qrOg4JEex2f2Ps3aKM=;
        b=pqMOyRuJwppzrBcPX1PspdGzVyF0KDz9wrkCmYR0wsYz4O48rVyqKvEKKQlf4LDnrs
         vjr0Q8bReE7cEDrwYXx4ADgU8adjA7kUOQHYHOjJNaLtuG6eH5Rfp7qIQahNL17JGw54
         hCgaZIRSzijAEmY909wpuikj3jPczY49BvTgsGEkLoW/M+BGTVgrDBnCDQCukif5GynA
         4SbacLyJglSxzN8qm0DCaZ+JLjZusQ0XEVCmvIdmSyrzQHz2rsokE/2D10YdPH+tN2gm
         dYzOofmfV//0rW7k0ReFPWLQtdJBXVgZD5qBesVPOcRpSlgk0+BiDQvtYVCNRm4xGDkq
         7jZg==
X-Forwarded-Encrypted: i=1; AJvYcCWsQQw4hm2+fz9qnSOhzp9IyAL8SOc8VPHVmgEFhV2wd+WLdtFLMLsAwEKeZyLaBhMpE0h2qhIiwVJWR3jc@vger.kernel.org
X-Gm-Message-State: AOJu0YzaDLdnQj9+b5njJCwDkKWVH2x0u7eBxiopvh9WFmO2pfErhh6Y
	sCUITq4o1X9SHmJMuU1wstHqGBvQqu2DdwKbIIX/rH1cj/2UOW+LqvKv+g7JDoRHG1u/JIrma/Y
	tmqHIKGf93u/FZh/EP8ZHUSESC6wQhySqS9RoU7bMEEv4QXky4DvDQTL7m58SWM8DJB5N
X-Gm-Gg: ASbGnctNXhA8AxkPQQH1kNMLa0+1O/mFYbEJcZBdgfMXSp3qxGnnU3MPqM/fLFAEUnb
	dwUl9G5Q9YLCBf0Zi+3GVixGpebekxa7XTpUEaqHiz7GMWAvwnEmUBFP8ZxWsyMOjcIzF5eMNKj
	OmTirf1Exh3+7AYUPd1BBg3zFvRz9qufTQseuNg/vjJqhhwusny8Ctiy/agnEcf/ItQNBQ5jZO6
	Tayq1Hfy8uctYiGQGPqsAf+FiLM877tnz01rL8g6mIVCzH/2k8WldQI4rIa6+IiYNb/OGcYMZkV
	eRxrBIKuG/g2lTPZrvIA8ae2ZOamrUNtxBAl+dDLcK+7r7IvoPlpv0wlhXGTPidL
X-Received: by 2002:a05:6a20:3d08:b0:243:7136:2fee with SMTP id adf61e73a8af0-24371363240mr24723744637.16.1756454295483;
        Fri, 29 Aug 2025 00:58:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfNF9XR64zX9+kWe4I9diEOKRZ4goaSDhqBkb/7GI5U8d7hw0kot9p8BjaG3AyVB9EFyxlvA==
X-Received: by 2002:a05:6a20:3d08:b0:243:7136:2fee with SMTP id adf61e73a8af0-24371363240mr24723722637.16.1756454295007;
        Fri, 29 Aug 2025 00:58:15 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4bb5dasm1554416b3a.55.2025.08.29.00.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 00:58:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for Display clock controllers for Glymur
 SoC
Date: Fri, 29 Aug 2025 13:28:02 +0530
Message-Id: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIpdsWgC/yWNSW4DIRAAvzLiHCRgFpr5SuRDd9PYKLMFxlEiy
 38Pso9Vh6qHqlKyVDV3D1XkJ9e8bw3sR6f4httVdI6NlTNuNOCCvi5/673omOuhedn5S/O+nWV
 fFilVjyZ5BwCeUFRrHEVS/n31Py9vLvJ9b5vzLdWBJ9/aZO6SBe8QrBiKCQI5cVMffAShKbJl8
 SLI9tUlrNLG65rPuTNp4NAnLwSTRUYaex9JwjAMFqxH500zlNTl+fwHS8mF//EAAAA=
X-Change-ID: 20250829-glymur-disp-clock-controllers-50f728887bae
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: YJe5vU8akWeh8P6n0qB9Jcrx2xuS_3Kl
X-Proofpoint-ORIG-GUID: YJe5vU8akWeh8P6n0qB9Jcrx2xuS_3Kl
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b15d98 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=01lUyKRgbtoGor2CX9EA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX8P1GNVvVfBZM
 PjrphfcGDPH+mjuTF+z3WauyGYbhooARRE6qRU+7D7XVKS77sc4A5dEdqak+C73MstixXEPFOqI
 S6bkuRDamt29rulMV/zpbhMjPv1G3jHWrKkFUVJUbDo5y9eUofBIhW+TbfTfS4cr6WkvORmJ+8K
 9GutBLqfPMvg5buWZzlUsKtZYpb3By15Rp4CHFx82zo05L+ebfCSo9+Aphw1a5aRSxATp+QkmPh
 2jln7/HKIEEH+ue21gWUAbpp3RxBfNJo3FDbfrQxqeJea8c3GTndIFKUcPSQVoKtdY1F7exIHu5
 lckX3W0+aqNGb1HbDrglJ9y5rwRf3gMVhbpWmlg3LQkcZ/TRQmqQE6nNAEOpEFCA/jilckjzI5v
 jYl/QgQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199

Introduce the support for Display clock controller(DISPCC) for

Qualcomm's next gen compute SoC - Glymur.

Device tree changes aren't part of this series and will be posted separately after the
official announcement of the Glymur SoC.

This series has a dependency on the GCC clock controller series posted
https://lore.kernel.org/all/20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com/

Compilation of the series is dependent on which has been added as
dependency.
https://lore.kernel.org/all/20250825-glymur-clock-controller-v5-v5-5-01b8c8681bcd@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: Add DISPCC and reset controller for GLYMUR SoC
      clk: qcom: dispcc-glymur: Add support for Display Clock Controller

 .../bindings/clock/qcom,glymur-dispcc.yaml         |   99 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/dispcc-glymur.c                   | 1982 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-dispcc.h     |  114 ++
 5 files changed, 2206 insertions(+)
---
base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
change-id: 20250829-glymur-disp-clock-controllers-50f728887bae
prerequisite-patch-id: f1872a81e0bdf89b2e26397d8eb6dc1ce7eeac1e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


