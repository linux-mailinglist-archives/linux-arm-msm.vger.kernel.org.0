Return-Path: <linux-arm-msm+bounces-71456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8AB3EEE5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46E5D7B1517
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF15F26E173;
	Mon,  1 Sep 2025 19:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXAdwQ4O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4626B942
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 19:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756250; cv=none; b=Mp9Uf8i8/QkoYmoU94IHvqRpeigUZPYIpfjqxBNP21tYI5zyzSSkiQrCu0pEP99DqsbcmlfVtzDS2cxC0BEIXRrbI6cFim2WTBTyaNccobM73wpsxUwkLEQjY535KCwkNWYIcHOlQkzf7+C2o4aN4ksXgsq2VGqs244LJxMpD0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756250; c=relaxed/simple;
	bh=bNozMk+UbMdf0ssHdcWg0zCJ6HDPoJ+No/5V1g/m1to=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gEPeTrp8mm08WJGpkZctZ52ovzDtT7FgfIALDfOj4K31zfnAo1pV55V/mh4qgwAXBq4cS4xpQDnzRnzxzWF0OjHuQxIE+4tPPTxm3RFZQ2ZOXcNmXPF0pOIyasoI4cXG0Q8ayWEIOo776bFUgYFhvu/4XuSseSIPnkAnzp9/52g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXAdwQ4O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B424j011342
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 19:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=w3XV8QBS09K8rQoBNwhaUktzkD6jagB21OB
	vcD6sKQc=; b=XXAdwQ4OrL9ZfUxatSNy/05sk+ga3U6j3xkdyq0TtzRxyF7Jdkv
	9hnRricObceT6ZeJSmr6XuFUrbXpcRCBdKap/c5u1Qg7FJ1b36DDEravHiAF9qk+
	ZHxFSqI7c1Lrgawz+4qxGRBi6Z/Te6RM54kz8cov8/i1IWTQ9uTTt4U5deX85roG
	yiO2QlGKxJepoPdLWrPuuLnWDdOnQwgBv78lU58XjKk+5U9u5I5UudC7Pwpso3wb
	0qmqlZio1yABW59MwdWKLjz3wYsX33hASwz7t8tDVVf7oabKeh+TDzsgG9lPNEW8
	vuLHmCOm0VXSLNord+oqykPqrXgFvk+NXlg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy1fv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 19:50:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2f7851326so117547231cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 12:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756241; x=1757361041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3XV8QBS09K8rQoBNwhaUktzkD6jagB21OBvcD6sKQc=;
        b=EAWefSCTGwEod3SrHbCBl7goyrhgAN53Lrtb0EM1W5tQKQUg8xAQF7FzPsiAFM5xao
         Vp8Iomgk2WLgBHUJpouDSskMimCKhaPLEpwcnmvOZSFKuRITJFNgNmAcNbeymYa8xv1V
         U5YLKYaHpcZAsX6wbTZBXw0rbdnE3h1EbZ23CO+8v/cTYwhbLjcqSUHtNqWYImBZdib3
         bCo+WfruXl6owe//OzU90jhLJxKWbszafu2pdl2qFc7pNghOjHGhx5OmRmfYziV0Pw8F
         SYj5sLCF1gkRkdm3fm5XLk38SEAMJyMuee5U3+KlY6nbQjiG9bgsI9oE8CCs9zCZXgUM
         dBdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeAZRXD705d3hkqkIO7B9RAdzk6w6Uh1CvbFWb2aQCM0x2hyayfxuWGVbcwffHB6/jSEnnE2x+bDOhwu1I@vger.kernel.org
X-Gm-Message-State: AOJu0YziaubIRGJc7jr4/ej4dnKwuUvD2U2rid8SpJXjRbs88fxWAsZ2
	NCwAv25wED+ny0qQhF8GYmfe1l9mE+AqhCaHeVYKw8bsKY5P7VTODoa24lS/AXz6uZmXTHt2HqE
	Qo7sqh75EjeWdsdIjEz2RXv6vbAyTdW17BEo57/xTrmEhXPp0sxddKg6va4PyvoGUTnU9
X-Gm-Gg: ASbGncsFQLr1qcqnZs8THfLYvUeztTvoF0i6biGLVPymo6MF8nMZCZt/PhWraEEIGTF
	by6MD+rJyLfujzAO6ss1svFGn754bpfVeU/sA8WoKvwyPwcWGpeIKvJtis6ubqc4VJ5Iz/mS/aZ
	gknjECxy8vRX6bpvuSjVvZXsn+76FRqUzAbE977HyKDrt97YfRHsrjBxP4ZibDVv05YbbN0HjXV
	ISb4tT7XYvn/BDWCbhQdnYaNdRcyKZzZrc5x1VFf373CVCGyQ6bIdk0xMn0znpSdzXQp2Qrft2a
	CAqnPBGZtKqAeYbHZOBToYDpkDwti+/vXvMbV9fwqrPRQ6JOc0vCXw==
X-Received: by 2002:a05:622a:1441:b0:4b3:755:3c82 with SMTP id d75a77b69052e-4b31db6a646mr96708891cf.49.1756756240811;
        Mon, 01 Sep 2025 12:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNqO+011I8C+a+NWKi0w13L3lHbVjjPv/XfgLwhTgpHoDzYVyuOZp/gX7zx+H3LGRPzX7dLQ==
X-Received: by 2002:a05:622a:1441:b0:4b3:755:3c82 with SMTP id d75a77b69052e-4b31db6a646mr96708691cf.49.1756756240281;
        Mon, 01 Sep 2025 12:50:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm4653705f8f.10.2025.09.01.12.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:50:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/7] soundwire: qcom: add support for v3.1.0 controller
Date: Mon,  1 Sep 2025 20:50:30 +0100
Message-ID: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b5f911 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=plMaQY1jPcDNhxvH7e0A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Urtt77KJVa8HjcZU_LkIP34pCSDl-Bxo
X-Proofpoint-ORIG-GUID: Urtt77KJVa8HjcZU_LkIP34pCSDl-Bxo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX4dAcldnkxjRK
 0U+HXj1/RxgKJRXBhwnBbmHUJZNeKnyl51SXXpljpdDBWQLzxad4+pv9sBEXC+NnyrNCSAcxn3D
 ZGYBjv7oi6QZvYgHv0+xgj3czYu6FGc27mqpOZUWPSa11pWdkmqx2OIiebieHKFh4HSqUJTUqut
 g0C6o1sm+Qy8hqgm0940OibrHb/n/Jqq80fME1O93VtZqm6eJtMHt+EBx/7WJufCv0b9CUq2dQn
 DrXyK0Hpqg9nM7Myox/jDLtABs7mZieXEMDaYZizRiOXCZeEVwKqBZR3Mis6XdUrGZkGGaGFsTy
 LGQhg6axJVbX0EhFLWomipI4MMDsu46ikyCxcs8LkMNGc7jHFGjYhzhWVoxlNroMOFFNxpiHObi
 5SD0RFY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

This patch series adds support for Qualcomm Soundwire Controller
version v3.1.0.
As part for adding this support, a new macro of_property_read_u8_index()
is added so that we can remove the qcom,din-ports and qcom,dout-ports.
As v3.1.0 supports more than 17 soundwire ports. Also due to change in
the register offsets, new entries are added to the variant data.

Tested this patchset on X14s and Glymur reference platform.

Thanks,
Srini

Srinivas Kandagatla (7):
  of: base: Add of_property_read_u8_index
  soundwire: qcom: remove unused rd_fifo_depth
  dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
  soundwire: qcom: deprecate qcom,din/out-ports
  soundwire: qcom: prepare for v3.x
  dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
  soundwire: qcom: adding support for v3.1.0

 .../bindings/soundwire/qcom,soundwire.yaml    |   8 +-
 drivers/of/property.c                         |  33 +++
 drivers/soundwire/qcom.c                      | 253 +++++++++++-------
 include/linux/of.h                            |   9 +
 4 files changed, 197 insertions(+), 106 deletions(-)

-- 
2.50.0


