Return-Path: <linux-arm-msm+bounces-85025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8574ECB57BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 11:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1437D3014A0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889002FF677;
	Thu, 11 Dec 2025 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBTxvHDT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cx3ZY8lQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A21C235C01
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765448256; cv=none; b=YJvmVfONm/Qory70DjpXF0IQmyuyaoKfBX4Q56M9H77WqxOi87Mv7oLw8+V8SVyBbD/r4hvVa6J9efFWSA+hwlD9Cg4fknv4OMKjlsa+Ru4WilC2jN+GwqCEA0QurxO/WQXKlpHdtULl9UTuCB3D7M325sV74J8SZPgBmjb90Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765448256; c=relaxed/simple;
	bh=qNGWcAov8RIDoxIEP/74cO5bpg4jdNYIs6s37ZDzBc0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GBYaNJks1d9X8KeRtBukpVDrG+eRP6+C8klaFm0A7+gNvkbuOyj0JpGH6GS+dwxtZGu1SvVakUijuLNTmFDH7iLZfCiYtUV1uCFoxzcIWh2RpPOvX54U6qafSgp1yLdtIJsX53fqCCB3Txv7IjSXpwO3Q9ZVK7tB6E3keOyDFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBTxvHDT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cx3ZY8lQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB9ZRtF1054809
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yIoqupIbLitrzZ0z6uCE2i
	S5VaCJD1kUszqIjbamWQU=; b=GBTxvHDTYnb4WISoTjvwYIjPcBUXk7RCI2Aaym
	B/ztAwIrrSQwBsvC0ppDgzUnQXas4Q3pqNgRsS7TFKqByYYEepgACQq3Ig8NvtgM
	1EzltAFP23wxi6Jl5PGc3pv+XWiPMWgUXN6yki2cAnhWPRtqUr8vhloFiQ4Bc0/i
	Jf3lnPB0fDejMdVKf36S1r4i7MWIPQ5WS9QPVqENlg9uR45hi2mwvwqrX0+hAWKe
	5GFhX9KbbAPCuCBmOZht9cuY502CV227awd+ccRj0bpFAxF4z/oLwSn4j0RbQHEl
	FVHoH4Jri3PFb5tjrqWmsmN+U8rB2oQPLPA24NT1+CLaVREg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygsx202w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1b8e28fdfso10721131cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 02:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765448252; x=1766053052; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yIoqupIbLitrzZ0z6uCE2iS5VaCJD1kUszqIjbamWQU=;
        b=Cx3ZY8lQr4/pl2EfTqIWHx6PusZLcBjbVr4IOfWuJgIxTkPcPD+WnlD4+S4lYN/4qo
         847EqDJpCYbYIyN2w5h/8N6DzCMJkXWwnghvZkCtWciv4Q/ApJu0WcrmMarmqMFVp9M2
         1kRsmboSgEQLJYHWCGZDGX5ovVJMb2oKOikA1KwDwr9sx8xok/cMyZFMmWvUB4v9r8Ke
         bmVhcrPO4HBKogWKKVgI/TqE6Ivm6m88e7b+aTscIsfE7vSSp4J8o7NXmmtuvYxqD19H
         3uuDst+zMTTh4UDCl3hwf/PTscgC8QP+hsy/3IEkvozppfjIh+BwnqRG4qzsW2hvIfVw
         QD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765448252; x=1766053052;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIoqupIbLitrzZ0z6uCE2iS5VaCJD1kUszqIjbamWQU=;
        b=BufIYZfFoVH8H+MthiTPr1KJUzZvm/lUKbutptBfiIItBHpMQp4RQKkkBRj8fMkiiK
         JvwS+89zzAcShUX0lf3DsSoYNeGpeL0So8bX+WwLFdmZ5MIxcFX5bMoHGFuZhuCvYWfT
         +ERxKuCzLUc1BWMBEMdaymuG5ZPRB5AGG92V/mot1mzAdYUaqlOLYzuvbPCbn0kMYIwQ
         cLneDO4+7qmte4XCG0aTrJ0NtcZYJoQJhsFdw0ub3axToJ7woiw+BbUzj9w2fqUIxRNM
         C2escufsdDniaaR2i9tJmVQDUEW02vi1hb1UQA1S/vP16co8Y8S7ZLKWE2YqyVogpKL2
         4INQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOOvEeHznSWnrK7TXa5LappJxJEpV/XjneMlG4n7vf9Yaxo0zo15PuTWsUj6MO66gs+FRjiFPic79RrhIs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4M8kkwQtJ19z6qbWuMAwvU4B+v1M+2BFxA46IDrbAnFtzWQRm
	MHHePeVHJI2p4dr4FdYr/NSHFuAOqbd2zaisDFsPdu0ghwLbzpvs7qJLr6Cr+TN6EKv2vQhlxng
	cRQOdql/PYQw+HBrL/njxrLmz6nEqmkWADyIMKhdihBpGKJeER+SWOeyJ5IZiGSb2HeTH
X-Gm-Gg: AY/fxX6aLcOOPr+1HUvh1IOZcMne80pHvclXHnpOlfM+tipas4dmlzi4GanEzB41sFS
	/8kgrNZ936gJ5xs5ulbo/unv9SdA6PY+vjkRwVSOcFjmXMVaBnlOAl57ALr+tUhdX7MJ9sO02ds
	4IfViUz6UD4B+UalKDzsHzAeZe6bDEHBm40qAxu0IDY7cVhnpY6zCweSq/PEeVpAVm2lwVta7ZG
	psDVlnsDZqsHRY3CXBRkOF+2CxS4llre6EdD/Ob93+ksC2BkZYdLHd5kEtwFtkWmZQRrn2rhiW5
	jj9K8CAd0qv4Ybl50Pe+z/twJ/+gAZ7rNvgqL7v96Yxu7zex7GPtJbhkIsPeTLFhHziiXPUbJLk
	O7Gb7HgdOys+3Gxo=
X-Received: by 2002:a05:622a:40c6:b0:4ec:f07c:3e85 with SMTP id d75a77b69052e-4f1b1a9b174mr73152611cf.43.1765448252050;
        Thu, 11 Dec 2025 02:17:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmWyqlpm4ije4EDHxWehml5rJFNcFDBMiVXFIGGIAmz/RHJ2O3FfjGRGoDAdTF/+AbtDiiIA==
X-Received: by 2002:a05:622a:40c6:b0:4ec:f07c:3e85 with SMTP id d75a77b69052e-4f1b1a9b174mr73152231cf.43.1765448251502;
        Thu, 11 Dec 2025 02:17:31 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5191efsm225381766b.40.2025.12.11.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 02:17:30 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v6 0/4] phy: qcom: edp: Add support for Glymur platform
Date: Thu, 11 Dec 2025 12:17:21 +0200
Message-Id: <20251211-phy-qcom-edp-add-glymur-support-v6-0-5be5b32762b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGaOmkC/43NTW6DMBAF4KtEXtfI4x9sZ5V7VFkYbMASxMQOq
 Cji7jWR2kZiQTcjvdHM954ouehdQufTE0U3++TDLYfy44Tqztxah73NGVFCBdGE4bFb8L0OA3Z
 2xMZa3PbLMEWcpnEM8YGpUQDSalopjbIyRtf4r1fD5zXnzqdHiMurcIZt+2PzQ3sGTLBTrC4rb
 YCL6tL7m4mhCLFFGz7Td1AfgzSD+VgwpsBxaXcgewMBjkGWQaiVAM6AGSh3IP8FgQD/H0ilpIp
 JwqhrdqD4AykRx6DYQAJSMl2WDTSXkFJxn0yfn4YiD3Rd1/UbNaLMdRkCAAA=
X-Change-ID: 20250903-phy-qcom-edp-add-glymur-support-2a8117d92b89
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2664;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qNGWcAov8RIDoxIEP/74cO5bpg4jdNYIs6s37ZDzBc0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpOpozCmZkhn6r19tDW4FmYUz2BDWzqJhHzIgiA
 JVyNzf026+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaTqaMwAKCRAbX0TJAJUV
 Vs5+EAC2FidAFarc4PYMxFqe7Q1B60XvbdKZHvLTSrOrTvBe/U5gKU0xfVK/rYz73sAD8iyIlPW
 VBFT/990/H4ytLpYfwn1PbEOqfsL0BiPEnHbsKKIVa0xdPmphucrCXWMD/k4Ia6yTj1zaeeJy51
 Hn4nWxStoM2/B9yfRgVSIfmKk2EYTk6ruywN7WStwlBpNA+Aqdq2kQJQUKze6mYglkoa99kqciv
 ANg0k4sp/IIQBPsA5MXsgGk0kEuHgPxqRoa/mcd6bw/eO3XmVvU0y25rknSC0qcPoyHEAGAfBPP
 aFKs9HrA3UWvYzKReh4yJfqRUPcQq8XaK8YgprbYJ7qwXq3gKh/QoRfDigJtZwxhjAJEEXSqaCe
 9tLTAaqcXiaAR9aLM/NlBqFna0lVVgH7/29nBiSIrCVjTNo++g6Mt7lpoi3DaFE1RN/Kg/9UJLt
 eHp5LcYFs+UTQsaO71bp7PzI26jB+q0lmi9PuBGd/kqVrK65iU+dcKDfOxtI4kSOh6qErqX4/Tk
 UA4sttl7QhijV9hdJm9JnNGE04JlDRuUE7MoZGnk2OZrhOnViUubVvKjciM8kXI2Abhm7BRy6dR
 7DoiXzmGYIqGDzoxWHQmTtUr+GIzomIH/N3T5qn4cht+7IoyTXkZ/NdAypF/WS4/eN2+e0NIpqQ
 QZTPmVnw5gboFIw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: M7lncvbq9jqmI2G74YrBzAM7q74gs8NB
X-Authority-Analysis: v=2.4 cv=d974CBjE c=1 sm=1 tr=0 ts=693a9a3d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=rv5esH4l-LSXXVRZdzkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3OCBTYWx0ZWRfX35+B15ld55G4
 wmZC/8dz6rSE9eTZ16+AD6WE3e5AjVE63IrsypMJm0W1/2N6zE4v6gR99Rl3RG8vuFQLrFyBjXa
 ySe/IxayhM3dW14IvcZ1x9oyVB9YdYqOQ+C0mAIZ//A5tx/4B59dXBCO+7u254WHWzLoDgRt6v2
 A09E+iKSXhqtXHPR/qVwT7cRHO/u/Px80Q0VPQezJE3qt8ZDxmXfL3M2FW11/xdiWIo9GbVmPog
 He5w5hVPoPhvNkAA9jCmdperv8I2cQx8ykTyOTNee4MIz7WZB2Uv8NoPx3JGOjvEo7LV6bfLbE5
 i7gkEhMHhimeaWCourIFOZNO4T14yT9YNyq9quvdBBJFyyoyf/jVeIzlf3J+rCMuijHUxAsPSo7
 z4FQz2ZRbOw9bOHtj0oMWelUnNWYDQ==
X-Proofpoint-ORIG-GUID: M7lncvbq9jqmI2G74YrBzAM7q74gs8NB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110078

The Glymur platform implements the eDP/DP PHY version 8.
Add the necessary registers, rework the driver to accommodate
this new version and add the Glymur specific configuration data.

This patchset depends on:
https://lore.kernel.org/all/20251030-phy-qcom-edp-add-missing-refclk-v5-0-fce8c76f855a@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v6:
- Added the rest of the values for the AUX_CFG arrays for v4 and v5
  platforms, and re-worded the commit to explain why. 
- Added proper values for the VCO_DIV for v8.
- Picked up Dmitry's R-b tag for 2nd patch
- Link to v5: https://patch.msgid.link/20251205-phy-qcom-edp-add-glymur-support-v5-0-201773966f1f@oss.qualcomm.com

Changes in v5:
- Renamed phy-qcom-qmp-dp-qserdes-com-v8.h to phy-qcom-qmp-qserdes-dp-com-v8.h,
  as Dmitry suggested, and addapted the include guard.
- Added my Qualcomm OSS signed-off-by tag.
- Link to v4: https://lore.kernel.org/r/20251014-phy-qcom-edp-add-glymur-support-v3-0-2772837032ef@linaro.org

Changes in v4:
- Force fallthrough for 5400 and 8100 link rates in qcom_edp_com_configure_pll_v8,
  as they use the same values.
- Picked up Rob's and Konrad's R-b tags.
- Link to v3: https://lore.kernel.org/r/20250911-phy-qcom-edp-add-glymur-support-v3-0-1c8514313a16@linaro.org

Changes in v3:
- Split the DP_AUX_CFG_SIZE change into as separate patch, as per
  Konrad's request.
- Re-worded the dt-bindings commit, as per Krzysztof's request.
- Link to v2: https://lore.kernel.org/r/20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org

Changes in v2:
- Sorted alphabetically the both the compatible and v8 specific
  configuration.
- Prefixed the new offsets with DP in order differentiate from PCIe ones
- Link to v1: https://lore.kernel.org/r/20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org

---
Abel Vesa (4):
      dt-bindings: phy: Add DP PHY compatible for Glymur
      phy: qcom: edp: Fix the DP_PHY_AUX_CFG registers count
      phy: qcom-qmp: qserdes-com: Add v8 DP-specific qserdes register offsets
      phy: qcom: edp: Add Glymur platform support

 .../devicetree/bindings/phy/qcom,edp-phy.yaml      |   2 +
 drivers/phy/qualcomm/phy-qcom-edp.c                | 229 ++++++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h  |  52 +++++
 3 files changed, 274 insertions(+), 9 deletions(-)
---
base-commit: 801584822345ed46c0443c1a66ead9173a47c723
change-id: 20250903-phy-qcom-edp-add-glymur-support-2a8117d92b89

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


