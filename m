Return-Path: <linux-arm-msm+bounces-87984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3EBD01150
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 06:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05E4F3050CCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 05:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A933A2D9EEF;
	Thu,  8 Jan 2026 05:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/FqIs35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4b4I2dy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE0B2D7384
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 05:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849911; cv=none; b=sPT4mvycj/eD2dRraO3Ep93b7WKsJv+Fis3ityn9kFL3szFZLoFtHyKirJw5GpXbQZ+NTzJkimFvlIZsvOhiYCgnCndgoW6J+Q7ceGE+JtMTKb7ShEeHvIKzJmMp/Zs+FCfPsDYckA6sxWQ6yeD9rDWqc46WFPUc5dwFKxQvIc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849911; c=relaxed/simple;
	bh=IMK3zv9NIjugam6340VLEJj1mdGgqzHLgIjpLYgNc74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D8eYptbp+ZiUwjN/B9WopULU23HXGW/INVfd9MzcpSXN4PWR9gwPuKG6SYM1QckS4triSQ7/HaH6Rfz1bTz48gDH54xnOnmX4/5TazMO3pgtlfbeyrtzXNGffQcCIIo94K5L0NlOoN+BpyvRnurD3ETd47m9P1rtSfw5rflixiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/FqIs35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4b4I2dy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084RTTJ3672967
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 05:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h284+dPa4FQpjAJBeqsPnfaBl5y8M0qOC6M
	qt56lPbo=; b=B/FqIs356xrsX8RSWtefKWutC3ITd9nvA2KWabdxWNmEW0dhIIY
	FR7noES8oCDnNnVHdT2K1cvgtX1PWRAEdqNoWb19GhSu98/dWBwADjRiSkxXQB5n
	ZUdK1HnbNQbkEnE+to0rSGkWLI16J1s8DiALMpd96LOkeUwSgbkeoFC1ryVplyan
	LJuGk/VfDtyRqFbRbMmpLYfviDH/UFozp1aqCACshEVlYdcDOKlJf4nI7Ok4m0hh
	+ludwIWYes/6wpvmIKJxi4dsOC6+1zGxJnNbPWeI7qs7zGRiYEwWKorGtUmmi8E4
	Ju2LPIrQ3uQ7tQY4L9TJXupPdxl64WtsJ3Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhum51vmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:25:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b82c2c2ca2so3438120b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 21:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767849907; x=1768454707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h284+dPa4FQpjAJBeqsPnfaBl5y8M0qOC6Mqt56lPbo=;
        b=N4b4I2dyO8NRrrAJNqUYtwMefZwHAJ3xNflUmeO4d9MInVfGMk46lboDTT/XsmmQTC
         lAzM9szAkLhXiyibBjCfyKFJqu3U+4K+G9+cW6k7CDj2eX4ftrzMhgOcwWWDv20S+9HN
         k5NK4+MNJKwseMJjwRra32HrtZ5jUjqrjiF5s575ESmN6GvnuaYKWiPWdictXCyEdv8m
         ENIsrRK2wVNVVAYnT5zUGpgeW23wWOUmU1mVg0VEt6evUjf0dkhqQUvq5r3+TloovTRP
         pYA8DaJYys3S9b0arivRqbs8isEMmnaMNehahJbFpjHj2J9zfjqYK9Rdix2UefiQBZh7
         bzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767849907; x=1768454707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h284+dPa4FQpjAJBeqsPnfaBl5y8M0qOC6Mqt56lPbo=;
        b=bTcACyEUrCswRxT7TixZc2ytXFvejoVmqXNinO/0R6D8kuNe5SYsynut5pOKDt7FV7
         azXRo1BPDBwTc6gB0LF7fiWyOWM2KdMafuuLP63wd3oNNroAXgSJHsfAPYFshTfynB3g
         wSWdUsN66C0z8R+9OGFrJoV7Ml6IrzAyFpWEO4P40x+sUxo6ODs4W44ocTvHv+BOwinp
         aq7jREUATF4sflwE7nDQ+4bGAb9nz76I3FLRhEA6QJB2aTWlV6RWuMBA1yBZnDjMzlkG
         yrTnnP5qoVXfIB65/7PUrsWafm5RMEneMW74eiwFhctEv0tQ0dmapD8R+v2P8JNh1bqT
         8Ygw==
X-Gm-Message-State: AOJu0YzWpsNNuzNMwtTJM0XEQJfbzvJAMTVHdGvjlfnAnwp+MzT3tJSi
	jmA8DY4XUXQq6JAJMwncnOopvYWAm3O356DPyMOK7HLaiHRTIqi2NUnscZ9sKsAMf/v79z8UH7/
	ZDJwd8g1fxpqJ9mzg31NFLmFUzuj7vn4Qw3jaDErLjrqlNL7vbt7eN2GqQ1PndgE6Q/Vo
X-Gm-Gg: AY/fxX6MXa+qPSAaePrbasH8nEVnbYcLjbCjXZZUR2mMuRMxSfqTFp92aK18Ky4PpUn
	lvrfN6uGm0PiqFS/T0zso2VP0tmFNwNsoFaa56mO7B6yd2EqJrpTI5vsak7tuIpSEhGM9BfWO5B
	r6b0L4CjRUVNME7+fRmAJYmnFsg/nXhVqCNFff/mfxoOvixDDE2L7Kq3Qe5VQ32IysBkkkB7JzT
	qSdUoLK6+JyhXe8W0TOMvzM7JXh1hsiWKCI1nWa/Q864LMN1ZYsfjY7Ee2ZqZghn83mlZGcoxnY
	rfWCp0wnCth2V8gabndOQAkRBaSkGgPPQVlq5JMfNKKjDCU0Q/jnNCG4cxHEmcFk2cVjpjBan+j
	HCSmB1/4Tqf4lZhg9FvqS1vFXKvpxlxDKyplGGnAYhkRDw38=
X-Received: by 2002:aa7:9a84:0:b0:7ef:3f4e:9182 with SMTP id d2e1a72fcca58-81b7fbc8cdemr3936900b3a.47.1767849906959;
        Wed, 07 Jan 2026 21:25:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkC50Q2aJ655U+CHSbpfZEuTeYv1otkG2hAbeVnSEOLGvnwXr4wGCcorPHoMILiev+qnqiww==
X-Received: by 2002:aa7:9a84:0:b0:7ef:3f4e:9182 with SMTP id d2e1a72fcca58-81b7fbc8cdemr3936866b3a.47.1767849906466;
        Wed, 07 Jan 2026 21:25:06 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0de2d2sm6415534b3a.27.2026.01.07.21.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 21:25:06 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 0/2] phy: qcom: Introduce USB support for Kaanapali
Date: Thu,  8 Jan 2026 10:54:57 +0530
Message-Id: <20260108052459.1819970-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SeU6MEzFkJ6Af-CRbLHAp9FysxaI61oc
X-Proofpoint-ORIG-GUID: SeU6MEzFkJ6Af-CRbLHAp9FysxaI61oc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzMiBTYWx0ZWRfXybawTe5jdslv
 MKd0ev1LdW58f9gtq8tjQDPGCts/pTKXeQ19K6ZRIwlez3o8pRVDFz2kTVdvtA9S8AdrF9lRv8R
 Rftt2oprvt0GXzek+z3IchY6ySfRvHryhupM34opR5qRaCfxAPzlrQ2O3GsgSXQAvXSQB1tA4Z7
 X61+vCkhg97a6+PmWymJ1P2C3IkV3OfIJGxXQuWW98TpbEEfb66MPi6qVyyrVgbV9VJ3XfxwsYd
 yT240N5oSgsHhf5zKhG5Mi6PVryGF6NYkwLtGcfPuDx9ZLtq1XIIsVnkL2a9vXhO47nHP4uJNFQ
 VWZk3l9Kq+oJfzsay7b+V/SbzI1YRK2MrlpGet1qBJ5L8OpDZ1vFwMPH3jOlWpTv8r+/6p2LrNB
 oApD4pHEv4wk913EcbS0LT8jydYefJvipOxgw2eULJWMBn54tEwec7Ne03VhhtH45PAkM3x0Gsj
 JfzGujdPi5V3ynR4lfQ==
X-Authority-Analysis: v=2.4 cv=KNZXzVFo c=1 sm=1 tr=0 ts=695f3fb3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JHePba-_m_tI3beqYUIA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080032

Add support for the PHYs used for USB on Kaanapali SoCs.

On v2, the usb controller bindings have been split and v3 was sent and it
got merged.

The m31 eusb2 defconfig patch also got merged.

Changes in v3:
- Rebased phy binding since glymur phy bindigs have been merged.
- Removed RB tag of Krzysztof on M31 Phy bindings since the changes now
  expand compatibles list that use sm8750 as fallback instead of
  implementing the fallback.

Link to v2:
https://lore.kernel.org/all/20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com/

Changes in v2:
- fix author name typo

Link to v1:
https://lore.kernel.org/r/20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com

Ronak Raheja (2):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Kaanapali QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for
    Kaanapali

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |  1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 58 ++++++++++---------
 2 files changed, 33 insertions(+), 26 deletions(-)

-- 
2.34.1


