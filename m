Return-Path: <linux-arm-msm+bounces-86564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C02E3CDC14C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 848D0303E3D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F0A3161B8;
	Wed, 24 Dec 2025 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zv5J1DSE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6k1HZmr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D69C7082D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766574663; cv=none; b=F1Bn1HvDU8M2rPSHED5QMPDF4kOfn9yEDUMqZOlE1WL+G1/sEaIIKv//SaSvEH5TQviJYWoqCAdDANSljTGPKkLyS7FoFBiswytvE4f/XYBjHfEf5iGhQu4ZBOOFbQhk01Sa9PyMArSvfBDIwIQa+EO5gec6VAc7MYlC9qYd5DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766574663; c=relaxed/simple;
	bh=D+uTSNaECmJZICpMJm7ATuyq7f15JQFPv1mvQdAQrTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lvMsCoQB61AE4g+YMIkm3f20rsgYPHMgt3Nuf3TKQWD0Q2k8z/+9WqxUgcSltERS7cfQgBzz/Hk5MtgH1fluR+ea6wzeZChdaaUee+bMBvg09irSadN4AJu6aX6jfq5xJ3gZ43YjhgdQd6g1EwU3f4Za99IjrYMImUnj4ISmHcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv5J1DSE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6k1HZmr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7g4xF1056769
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eND4k2bQNoHugRX6xP9D08
	AEi9x2YTwmh5SQPR0G+Co=; b=Zv5J1DSEKKOLUYzjE5HhWVMaNPPy00jNHX0d5+
	YkQexr5KVYA8ijehv6KxCRGWQYJwc8bqmocll5HlwNnpFWdXOK9Neeb8O7zCvKmV
	jN3faPN5kQtaA4V4E+06jezZsP8xqOYE+pCs+Ehe7abGZVtf4PE0IkklXUHQHxvk
	d06ImpSZDiekPbzX+7HEERrmL2u5KRzu9JGWfQWou2LQ1rna7RV8U31M5qfUb9KI
	m/R3TB29NnpO4z/XAVP0gc5lKdz7SCjURmCshEo4BLzmNZXkyFJH/wnhUslGPRiU
	oVnPd11ZVgdIpdGTNf3IILQtikajbExnf3Y9KYCaiGMqbPWA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v28rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 11:11:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1dea13d34so132677431cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766574660; x=1767179460; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eND4k2bQNoHugRX6xP9D08AEi9x2YTwmh5SQPR0G+Co=;
        b=Y6k1HZmr0IqwPaXgsddJbo0UQ0gb6zo+1knccMouZ0mft2vcmZibFbBTKTLYPS/PYc
         Nug9KqXUCQBcwiyI/XYq75wC5ZD6gw+pAAeGXLN2k5ZHcCwm7OyCiNf/TAGCpNhkBzQQ
         HsE7HlK9KNzYuFpJKsY0shKMOmvTgvezmV5vftg7FZ2zjKRlHi7RbDmoWq1+ulgC/1Mq
         tQjvdGAkwkECe4UZ0taMbmPs5+V2laviFpA5Ctd/HrlSzVOk1nl4cMgkPqF2M2AFKJ5R
         Xt+X+hRfpeod80dsdgvb5W1kNUPCnuXMO20SRF0aYhdhHQof55DElSu4YzObdyTzvrBI
         rPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766574660; x=1767179460;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eND4k2bQNoHugRX6xP9D08AEi9x2YTwmh5SQPR0G+Co=;
        b=lzgOU4xmQWKGGUv7n1Bg42woSyMOasm6HkXonvnbO9XH2+bJRZKV0W50lDWKQvrBlL
         9zcn6Db+NWMpPAW6hw201wLzhaqwi4MYv4tnkMpcJOGYeE3UVX5Vwfnutvyd1iPSBp1U
         Q4tiUtkUeKb5pTdQvK2uityOk7Nq+UrI6bZVwrx3O9rqFsiDHbdi4V06ky3tgEk+/yqs
         dCR/NN2V80GZGQoKxmylDn3zuIIefx9ZVXYd2WNdhJa/dXqXkyU1zKQSvldtRadI6oUV
         2hiSEDZLxXw9pAhDyjx54U03ZBYiBPcr9Br+XiMjiRrCKxgLoGWx5vr0d9ql4tIt/5rg
         dKDw==
X-Forwarded-Encrypted: i=1; AJvYcCUD3oXFzmBIQlvUhHrPFgvsJBbSpJ0O1f9oG8HlQucRLVnieX9nNFenNkmYOhiNTVr3p0fU52jVvamHtj2K@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvhq4b2JFYCN94lhcVy+i46xXCu/kgJ0E1orOB8BPF0mkz9HZE
	l4ffmfJLuEAfIf3iFXjmorNYYOukR9wz5I/4XYLab2EUFt2dpIeJW4j9ntVVFInRukFTlFKz6C6
	D6epCM9dEPgrPcMO8pwQwrlmJezJNBF2hKXEn/hiN7OSlcgkhavtzhg969P7EDLGHmB8A
X-Gm-Gg: AY/fxX4iWGCk66NwKdKFy8GElunJ1wzFVQp9jJsm+ezA7LcrsU9n5A+bYKytEipUhpo
	RXwiaQie68lZRRE24QktsKeaefFEtsMB51Bph/RY4fd3lnVKgw4CRN3C6hIucMrlKOhQlCec907
	TtEiOj0Xsqha58dWn64O5kBhnWFpv+clieTU0VU8ru7Kt8W6hCFC/bvLa94gWvf2ny7MOaIA9CG
	EEJZvUspRebH6lbRq6ufliEaeDEGPrRHdy5u9VrI/RYLA/JdgoAJkI8Zat0v3QwNJLJTMpM8gDn
	9rBxeJkbF8bymsxMXHmImXC+2IFTMHBS5e5kSEQ3cQj67LAErn3mvnPQKT6OhkUBGua54xIPthm
	VQ1ZckHRZOGjPKgM=
X-Received: by 2002:ac8:5dc8:0:b0:4e8:b446:c023 with SMTP id d75a77b69052e-4f4abd791d1mr267213171cf.49.1766574660482;
        Wed, 24 Dec 2025 03:11:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKZA1S/GR18OFt56AFX/nEIr8aiQPN8OYdNz+QT6DinhQ5AkVKJzhs/ZSnwnjoOgIlekCgfg==
X-Received: by 2002:ac8:5dc8:0:b0:4e8:b446:c023 with SMTP id d75a77b69052e-4f4abd791d1mr267212671cf.49.1766574659919;
        Wed, 24 Dec 2025 03:10:59 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm16799036a12.31.2025.12.24.03.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:10:58 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RESEND v6 0/4] phy: qcom: edp: Add support for Glymur
 platform
Date: Wed, 24 Dec 2025 13:10:43 +0200
Message-Id: <20251224-phy-qcom-edp-add-glymur-support-v6-0-4fcba75a6fa9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADPKS2kC/43PzW6EIBQF4FeZsC6GCwLa1Sw62y7aZdMFCo4kK
 g6Mpmbiu5fapjWxibO5yeHnO7k3FIy3JqDHww15M9pgXReDeDigslbd2WCrY0aUUE5ywnBfT/h
 SuhYb3WOlNT43Uzt4HIa+d/6KqcoApM5pkeUoKr03lf1YGt7Qy+n19PyE3uN5bcPV+WkpHmG5/
 elIdztGwASbjJWiyBWkvDg2tlPeJc6fF3ykazDfB2kE42POWAYmlXoDshUIsA+yCEKZcUgZMAV
 iA6a/IBBI7wOplDRjkjBqqg3I/0BK+D7Iv0ACUrJciAqqowshuQyqiZ/aJI5vVqzYexYXkeWF4
 QWjUtCC/8PO8/wJMUmaU3gCAAA=
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=D+uTSNaECmJZICpMJm7ATuyq7f15JQFPv1mvQdAQrTw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8o68JRKhNasBuwj0ePI4f/AzXv68GOwEOecq
 Ct3e/mtwEOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvKOgAKCRAbX0TJAJUV
 VtrSD/9rMJU1PStDCSNziaNhiDcahqEgNsKrHPEWZ9xa64+3h/SkVaCun+UihaWGsk3W2B6eI+d
 zr7oaK9A1+NI7Tzg0qqm01h3HmPYpvkFp3L09AA0/74A00LcfTCJ+gu/Cx8wYxT5bDItknWBQwf
 bCRjR1Qd1qTT9susNE+mmVqwoe+GU3YD801ByWxcCWPvZ6/UHqgMY2aJbnFhmR4AA7II8Gto5Ci
 9pjxrj8quDwGY4AGfJAbQo1ISPrgfPA8S/JPhcQWYg/eoGGPcEfNRQWbsM6BXwugA52hjY2/S46
 cU0U4IFDBg12yK35KSJAA0Iei0OYwFVmMQYEnjxv1zjVK7CumyM8lWQ9v4qYxdgZYun8a4hTG0N
 X44YnvmB3nJKsmraclyt5P+nCxDt1XdrNyTHzj4Frlj4GaeYoPhHh12nsPG3NYVis1/wkCrqWJE
 kLAB6FaETOFtVrsH1ey2fWaIUXSNSsoxA1HWZX9hTr8Q+5GHuNQHsZ1qiWRkCOKrHXFG7ZDVC8+
 ClkNTfabW1UO72lNZgxTvgj9EMhbv9Q6BY5D6NvfLs6C01Z59Ez1i1gKLChDCZ/81Ops+bgWFtd
 hqEzqyYaM/KhXccljARFvtPzHEnTI/MrvcQO9Ps9OnAV2w2pYNtiPiDF/BXWo5C+FNVubShgTWR
 wkrPSCnHdT2L+Fw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NyBTYWx0ZWRfXzLCZGb7j1kV9
 cNGz85MSIsaehq6guxujqnBBx+7ZQh7xOr09X7lp01kz/2ydSgZlOOgETHbp7lfao6IxyTbWo/b
 FqlZMqaS9261XDTmgYC35xbW/ir7xcv2trsA+UK0MA7ujHAWRZlUe25G12aKIKyp6pYAL2fgqPk
 VHIhJzZm56iMVgrg6W9PdrGCY88pVU5kbcbSx5WfsuvGO99do97CWgXlnqS7hnrwzsnCU9xXTy1
 D8wxIeFBqfqDiFPeyPNjx6LZm+Fat1iCoFOdLvogmFyZmI80HqN95+Zt2hIVHmr7Iv/qJ/xrulN
 mw4uVlTU7NWazAEoXqRmdpDi6y+PBIehyTssvhj0tlPPoIS8QUXNl6YM4b1CJGqzF6xHgodL74Z
 FiMA6sxF0rwrRQg6D2NF+/n8cNXpX/KGfQ40iOlxNmxIabIpicJQSCzL6uI5hRTA0pd4+LeLd0j
 Ay6cJ+BGat9wkqml7NA==
X-Proofpoint-ORIG-GUID: mH6it5cCDTwIluE84d8g5h7ZoOnGKRWI
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694bca45 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=KKAkSRfTAAAA:8 a=rv5esH4l-LSXXVRZdzkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mH6it5cCDTwIluE84d8g5h7ZoOnGKRWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240097

The Glymur platform implements the eDP/DP PHY version 8.
Add the necessary registers, rework the driver to accommodate
this new version and add the Glymur specific configuration data.

This patchset depends on:
https://lore.kernel.org/r/20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v6 (resend):
- Picked up Dmitry's R-b tag for the 4th patch
- Rebased on next-20251219 (+dependency)
- Link to v6: https://lore.kernel.org/r/20251211-phy-qcom-edp-add-glymur-support-v6-0-5be5b32762b5@oss.qualcomm.com
 
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
base-commit: f8beda16dfb950d9ec35e7a195251361e98ebea5
change-id: 20250903-phy-qcom-edp-add-glymur-support-2a8117d92b89

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


