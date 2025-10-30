Return-Path: <linux-arm-msm+bounces-79729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B72EC2166B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C702404091
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523A513D638;
	Thu, 30 Oct 2025 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="grbAu8AS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7n8e600"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEB132C93D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761844154; cv=none; b=LGD6wF5en1MAYaiDeMOVIMSuFXxvrZyKcHd8IrE6Sf0G1wTwC1dgZ2Unifgw7xhXpcJQEpZzcvDpOVDKuL3wOoEgEQcHV38hdcOxj39oXPEbcplbIDqKSaFJsuUu+9wjjHt6HtQ9KYeJobrOPPU4MHGtNEKaG/mpI58RwxCZyzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761844154; c=relaxed/simple;
	bh=Iky1opZleo3Ag9ocUUqw9H0ccbMwe2ZQMmig7sL4bG0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OftgYZuIfYz1DTer8/YqcNWAeLvW4YqAhfxSJK++3LrClYInFTVm5Ag6zdA2/ON1heIbH4LezLUoMa1WK3Gzc18kFNfqdKOxtowj1AD3+5KapEQsSs889pubgmpMYO8EhFbD7evNTyHyjQaEOFCkJtxmWxdByWyfadDhWJytkzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=grbAu8AS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7n8e600; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9PMoF3509330
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pV0A1g/A4D3sZXswjBbm/Y
	b1RvRv+HhWS69DFFGbS/Q=; b=grbAu8ASANjJR1nMZH5QHqSUz+7mEeorYqFjoT
	h1huI7ZodZtr2Cd6FBgo2zI+qLBuuTNJxmmw8dhna5Gz5O0aHBtJeEfZlMTWiKDC
	VlZOQ7E4x24c0z+7ommuj1QNwbCCzBC24ywnhXdOnnLHTwFmv3isTlNTnj/B3U7B
	BoH68VFXR7GSOqXmlLk/YUc0Ntq2AzMw0p3+cr4/Bngo/lUFxIUjws7Wyg+jMvNE
	JV+1iqr7oxzlyOgIUqLJBxspqrXJMJKzzBm4g4NBsctRbQz/DfBYTdEbBR8L/489
	qckT2GuBlU04g40Mvl0vFrx3Cqg/vVg3GjmzmGHsaDrWb97g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdhb7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:09:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b522037281bso849387a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761844151; x=1762448951; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pV0A1g/A4D3sZXswjBbm/Yb1RvRv+HhWS69DFFGbS/Q=;
        b=L7n8e60011OS7LrdIqc4XOtaxyUmlaUyo66TmtkFmxogL7NmF3ZkBhN8Ki55XhJgOR
         K0ELrKZqopHdaItASV/WgXQ3fruEkGLK3HA93rULqrLVc1TiaxhgHq5liwz5D1RGYXUo
         lkmAB9ZG8Jg+Z5gGEyXzaxBjo9wq0qqay4dTIL0tn7ASdxGqjjYAyIyOrKAt8cAG8V2c
         PtbXHWn3w6ukJSRw8UWeHSxh1JaBQ9COvxV947zJucbLvSthLAfK0GYx+ZytU4V1lA2L
         dDOC/IT5StMUZLWrc4eDy0HIhPNjK0Gy3eGOVyLWjhCIm5f3tyYvZ1Iygb+5FS+ay9Ob
         9iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844151; x=1762448951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pV0A1g/A4D3sZXswjBbm/Yb1RvRv+HhWS69DFFGbS/Q=;
        b=co3IRdKCxMUbR793IKMLsgNofgTZHUKE8yGzLUKymOEK2utHY1snUc9C9LurG4C2Yy
         /sfFgy8YhSgTRPiPcYYS5PJ59a7jinVXY40DfxdAGA5/u4b8RER9TanSx3nRdLfz3usk
         I0SGMQF03g2Li0UaTGtjHZSh7ocG7xmk+6pFlAlNGj2jW6O1hfRcRfSdC7YqU1Jv2GlE
         OyPnT1gm0nID8HoKCpDPW+ewOL4hdt8ZZDkRS44i5AiVPFOAeH3VxBw6eJ2zh93cZzJq
         nvnEQ/x66vdrPbyrH63aZMWjPBOCvPO2Mq/qJpTGhA3d9DKzfZ+pEb+IqKLikuFqyaum
         NsMA==
X-Gm-Message-State: AOJu0Yy/CRG401GvgQz7XDlGcBdQDhi2mQcn+JT03qxf16ikdyhnHAgH
	iLNVhU6Om/sB9KM9NfAFgtpzdrEzu1BQUHJbTqWfTvhCcTwwmW+jHa3JS1cya4KHryQGwFrALzU
	YOhx/mGRjGf99+gFFstDDhh+swrpuwknKeJF/RfpP71qNGfZH9voBSiqpW+X7Hp0abXI4
X-Gm-Gg: ASbGncvFMDbNizeQm6siyVR7Cgk6gKyngKFcqBI1xMfSUocWF1tfLQOa13Ta4euQo2n
	ceiizN85+ob9KkOrLJeX6ObK56JkDRwihjt+MUV8vTRksCriAfA3R12HOxNldSm0MkkV0b+Olrd
	HUZEhrzgKYR6ClkmBmE6/97k1Hal5Z18AGJ0iD+rvhRMDE0Qa2Uwnc8lVSuyd74oqQBecHdrYRn
	DX86j86lGZ43gq23vTtJKL0w2RGeYLY8KGa9jrbnLyyIcFo6lavjVl7IjD80Foqh/AnV5ojFqmM
	Va9t8ddQVVewMfI230mL/7lmFiNzbLkby3VzbHmIf2kX9GBq9bTFfO8r92GI13XSYu4jD/TSluk
	kuivl6WV8s/CvwhoT/UqHcw==
X-Received: by 2002:a17:902:f651:b0:295:1277:7920 with SMTP id d9443c01a7336-2951a43ebb3mr6088795ad.28.1761844150819;
        Thu, 30 Oct 2025 10:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCt5+4I47/PW//spSrNAyC1wA4DEWUlJpdARziis74notfiDAaNW2TghCcihvgBW5XZscmbQ==
X-Received: by 2002:a17:902:f651:b0:295:1277:7920 with SMTP id d9443c01a7336-2951a43ebb3mr6088255ad.28.1761844150255;
        Thu, 30 Oct 2025 10:09:10 -0700 (PDT)
Received: from [169.254.0.7] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d09855sm192828595ad.30.2025.10.30.10.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:09:09 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add interconnect support for Kaanapali SoC
Date: Thu, 30 Oct 2025 17:09:01 +0000
Message-Id: <20251030-knp-interconnect-v3-0-a084a4282715@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK2bA2kC/y2N0Q6CMAxFf4X02SUwIYK/YnzYaieNsWA3DQnh3
 62Gx5Oce+4KmZQpw7laQenDmScxOB4qwDHInRzfjMHXvquH5uQeMjuWQoqTCGFxbY8ehyam1PV
 gs1kp8fJPXq7GMWRyUYPg+As9Q7bxLiq93nZZdnvbvmO934aQAAAA
X-Change-ID: 20250917-knp-interconnect-48c2c91bff58
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: W6MsDEsFd_Wsogb405DlHHzPHA5dOqyw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0MSBTYWx0ZWRfX9ymVYgxPAXhf
 yON+ucf01xIbkK5ewL4FxpnsP5fEmb6If2X6PkJ9m5NAyk+aPpBlB28bg8R7RuTChUUkCw9/qTj
 vFYmZltlGM2Wb6rqNAB89QgfWmR1ckEuhtYsJP6B13vSZqvhdg+PRS2fRTTMCnEBkc7u6c/UzuJ
 UwylExtkyqwu5rV6clV3YYzbvAn8ouQ+Ssu/67xJwpJh2lpJ6g6jnN4zDE6kRexx7yU8zpHdtXF
 exBP6/QdZIe+Os/qE/iJSe1Izz+wl+IUgzj4Q6mw+s+x/l4mlIoDQFl5P4KZ/YKiSOmYyti2mtr
 1DqAywSGjdg4EIXe/eydDTXMr8X97Adriu9v+F9KPRxER7OxbTO4a0xTVCO1sjYGyofpO+zuuOH
 J7JYVxvzx7q6OrmGpOASnwHW/nF53w==
X-Proofpoint-ORIG-GUID: W6MsDEsFd_Wsogb405DlHHzPHA5dOqyw
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=69039bb7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=axuxfZWt1NcpswWNhAIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300141

Add interconnect dt-bindings and driver support for Qualcomm Kaanapali SoC.

Changes since V2:
  - Removed the dependency on clock header in "qcom,kaanapali-rpmh.yaml"
    bindings file [Krzysztof]
  - Corrected the patch revision number.

Changes since V1:
  - Added b4 dependency on the clock patch [Rob]
  - Updated the Module Description to "Qualcomm Kaanapali NoC driver"
    [Dmitry]

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Kaanapali SoC
      interconnect: qcom: add Kaanapali interconnect provider driver

 .../bindings/interconnect/qcom,kaanapali-rpmh.yaml |  125 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/kaanapali.c              | 1868 ++++++++++++++++++++
 .../dt-bindings/interconnect/qcom,kaanapali-rpmh.h |  149 ++
 5 files changed, 2153 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-interconnect-48c2c91bff58

Best regards,
-- 
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


