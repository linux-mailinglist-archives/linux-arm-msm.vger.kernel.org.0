Return-Path: <linux-arm-msm+bounces-80001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EB759C28410
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 18:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A44844E2C7D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 17:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C172FB610;
	Sat,  1 Nov 2025 17:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6LfQ7wx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+UQglXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A77F21ABD0
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762019091; cv=none; b=b7RqJDllKxQuh2fcUJMfdwWDH5zqylcqOhqfdCv/pSIlIfSgEgW7ZGIlWYcvvzab/O/FaebGLhbQKrKsKI/V5FRpm4gnhEs92Ugcwt4u8hcjbfZ+6F97367heodQHcOrL+1vScNgFYBNqLcqiBx+sePKX666YRdv/LdHHg7S6iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762019091; c=relaxed/simple;
	bh=vLiQWEIVRFJZgxk0/HwWEmquOpi3TB1UqDKG+aPt2OM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KnKyIWdiGoIOPUbHLSMNLnsJ3rGgKoGCxMebithfJUFbfxS1l6qmAFecILHcZjEmewPiuWpTO0mBYeAUQ9+6QKqvxbYpKjnPLdxXXeod+T4Octsvb9TozXW1BeTj+gOYe2z0oqW0Op9nT/+TNz4OGLxmzLd8WzrjAoG6OARShYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6LfQ7wx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+UQglXi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A1Eo5OI1799670
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 17:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=X/+zhIB9FQRuG9rnSq2AsAoUOQRRcQA9e8E
	qXCfXMIM=; b=i6LfQ7wxoWQ8OgFpUPHU3SKaioC9APUQowL5M2C7SP4UItAplBT
	WJY/QVMRUOToU2PKZv/09oUPBWw2ni7k5LSsU1dVLEbSprWFAqSwGWQ8HatLkVyn
	qDRqwVKPYUI3umtK18kEDk2WVgz+4/xHyHQ4Ga79jWo7NtCqDgI4zFfYB23qYZAY
	58l/JsfxW7V675O6AkAJ0Ss5sZGgeJ/ahxbCyigCLd28I1TMEoCjLkoFSoPVic3V
	4J6GuFPr0FWrF56lY3aARJ7bOBO+f5X9uRHiE93DcZuIxu4dikJkaYoIymKX6Gbv
	qODCYbmSD5xnzB4GTw6raHSUcYD1x2t1b3Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57we9640-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 17:44:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3407734d98bso2706109a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762019087; x=1762623887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/+zhIB9FQRuG9rnSq2AsAoUOQRRcQA9e8EqXCfXMIM=;
        b=h+UQglXi5FfVeSI1aGMsrt4aNACQA53ihzg0LI6CAPDiyHVpTZvB8mXKoVOD15cHJM
         bOEvWj7GS9R5ZYub9Le4OhMCVEhOZPqCTGvicP/4Ecw5q+1vW9t/oVUYv1GTBOGB2Ji+
         AJnzrHjLXJ0CqB31/h1x755xs6Bx/DGQX1CsEigUy9BZxKR1zbNy0lorx34eFpJTP0Kt
         AKZwq+GIb++dpNiqnGngjr1b/DFNvu7ms+3BsWxqSkdn2N/+1Xh9mmBmDTnFrxg3/s2Z
         MZOHtIJ9f2TENj3RKynFDHhRy9h7xbHxDpxrb4Ptx+GsovEFu0fH0c6Ow9zbV6FSBrhN
         9WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762019087; x=1762623887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/+zhIB9FQRuG9rnSq2AsAoUOQRRcQA9e8EqXCfXMIM=;
        b=DB733yeDjDL3/Al+LpEi//9NB1FPu2Pm0schiUNv9oIrSCqLWnbPvlDq6sTkl2xTvu
         CSIXY4x9JCvcOboEIiBc152roebFC9KwnUqpRGLZQrzwaOpf5KwG2lpU8Cp3spZYZXag
         roypvTAxStD+0vsHFLT8QfqeH5lcj/V5+CPTr40ek06TkTbT+9A8w7BqrAy3wsTgUro1
         ELWyqXWAyE/ivC9KN833220ZgmeqKT7SpA1m2x3Fw8PQfBUbinOFgaaG1cnaPEQLygUx
         T2bazdJ5Md2WO6EtPgtxX7NerYDYYqG9nTyLRl50KPfrUWEB6z5suXrjZyIVjCmqmP9C
         mMVQ==
X-Gm-Message-State: AOJu0Yyc1JLJcLYAF4vfZWTv2qxsdFcBs4+OfhHlfOUIBmdUuY1JBhMS
	mr8E7pW1wNz9J4urAxmA9xKatAemJ6GmuyLvmBnUMUrQWVa36Y6pT8L+9wjSg5N8zP5BU9qQsDI
	xVeviLuQgQHaogElm+x1YNOToYKY5xSsxDn7Y4dOpNzSYlOydrz8Fh/84eBR/fnhTFlqm
X-Gm-Gg: ASbGncsJ0uOmbotvCZrecPGPmTw7o+EUr/UDrlrjpmmhBeBQRn4X9YPNu6GNNA8gvwe
	Tz843IczWNXyC4JgF28XUoMbJDJmjYtAwZaZ6CW7LsWWg8h1XffM8bwqxOpV/Gt3/8s7o3QI4ZJ
	2VJ6QqtcFdrWCEh8Hrh4NiY1i7fZ8NpkYl3+sbJISer+eLFo/xMzUqYGfHJ8/Qe/md64L6k/cBx
	kWkh/WTN97fPz2GUqmi/0TLuejOYtZfWK10ggCv+iibMMzPGW5fezivmjot+uNg0Chfyl6j7exL
	X+sWJ9PcT16ykXp7HdsGsnOPNR2lBatu6LuYLQ0i2WEpyy3rkVE9hu3DbojNYWqAjsgK8dmc8Lr
	zluw8kk4n/WmavswhZId3YHqN0fhodD5KXD90
X-Received: by 2002:a17:90b:56c5:b0:336:bfce:3b48 with SMTP id 98e67ed59e1d1-34082fd8a01mr8835464a91.9.1762019087335;
        Sat, 01 Nov 2025 10:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR5LoDv82yndP5lM6/yXVpvqLE5akU/VcIDSQGBfSky1Mh9I+PN6s3PUOaEvBXj5wM9y0VmQ==
X-Received: by 2002:a17:90b:56c5:b0:336:bfce:3b48 with SMTP id 98e67ed59e1d1-34082fd8a01mr8835444a91.9.1762019086787;
        Sat, 01 Nov 2025 10:44:46 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407f24ee93sm2793393a91.9.2025.11.01.10.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 10:44:46 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v11 0/3] Introduce USB DT support for SM8750
Date: Sat,  1 Nov 2025 23:14:34 +0530
Message-Id: <20251101174437.1267998-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69064710 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hjxnLiisKRasYILsxJMA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 71bQ4b9OCdXbbVad5CBU9yCkZSrIr0OM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDE1MiBTYWx0ZWRfX8AKDxg5uQH+1
 AbQJGN3jUEnxbNemrCou1NVGveOcC2M15BlpGuRUatHhwQUCaNIZwafhrf8lSGUkm7QS+72sTEY
 ATlXQqSL4EMmK2iDOmUnTi2ZMjjOv0OMhp1aCmCphwZ7dLkxBkQhDYVK/G8HfgiHtQqmyvp5/Ns
 iEvEoD9uiQltaj0Bx2Szt3PfIJXDH9SQNqy2pJ58F0r9ceffQ3yVSTYb1Zhd9TeL7QDlPJCzkus
 dYDtqEMTjx8QYYvENpEbbYQUNOxoLL+kppJieFxQ3XjBzArvp6FqIVh8BWDwTie6id5HdFq6Na7
 MBYFWlvaTjpd9wHH5KdPwBDXXCzriBQS3rETH4Ku+Mp2zQVNqRw0QGj8mZa1pzCRNaKoxkJBNg7
 FRJmGR7bknFJIDdliUD06sz6DGF8Vw==
X-Proofpoint-GUID: 71bQ4b9OCdXbbVad5CBU9yCkZSrIr0OM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010152

Add support for the PHYs and controllers used for USB on SM8750 SoCs.

Version-6 of this series has all the binding/driver/dt patches acked.
But only the phy changes have been merged. Version 7 was a rebase to get
acked patches merged. But comments came in to use flattened bindings.
The v8 for usb bindings patch has been split and sent out separately [1]
and it is ACKed. On v10, the pmic glink changes and usb role switch
support are added while addressing some comments obtained.

Defconfig patch has been resent by Jingyi on [2].

---
Changes in v11:
- Fixed commit header in QRD patch.
- Reordered nodes to be in alphabetical order.
- Link to v10: https://lore.kernel.org/all/20251031123354.542074-1-krishna.kurapati@oss.qualcomm.com/

Changes in v10:
- Squashed pmic-glink changes from [3] in this series.
- Added remote endpoints between connector and usb nodes.
- Added Jishnu's CDB & SOB tag to credit for pmic glink changes.
- Renamed "usb_1"  to "usb" as per comments from Bjorn.
- Added QMP Phy pipe clock in GCC properties as per comments from Dmitry.
- Link to v9: https://lore.kernel.org/all/20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com/

Changes in v9:
- Updated commit tags (Removed Suggested-by of Konrad andadded his SoB)
- Confirmed with Konrad offline before adding his Signed-off-by
- Updated commit text in patch 1/3 as per suggestion from Bjorn.
- Link to v8: https://lore.kernel.org/all/20251022084052.218043-1-krishna.kurapati@oss.qualcomm.com/

Changes in v8:
- Using Flattened DT representation.
- Removed obtained RB tags since the code has changed significantly.
- Modified Author mail address from quicinc to oss.qualcomm.com
- Link to v7: https://lore.kernel.org/all/20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com/

Changes in v7:
- Rebased on top of linux next
- Split usb patch and sent out separately.
- Link to v6: https://lore.kernel.org/all/20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com/

Changes in v6:
- Change readl_relaxed/writel_relaxed calls to just readl/writel in the readback function
- Updated languange in the defconfig commit to specify SM8750 as a Qualcomm SoC
- Link to v5: https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com

Changes in v5:
- Removed refclk_src from the QMP PHY driver as that is no longer used.
- The decision to move the TCSR clkref property from controller --> phy
node was made in v4, and the refclk_src was a lingering change that was
meant to be removed.  CXO is the parent clock for TCSR clkref, so CXO
clk will be voted for as well.
- Relocate the SM8750 compatible within the qcom,dwc3 bindings.  This is
to take into account the change in clock list.
- Link to v4: https://lore.kernel.org/r/20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com

Changes in v4:
- Made some fixups to the M31 eUSB2 driver
- Moved TCSR refclk_en to the QMP PHY DT node
- Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com

Changes in v3:
- Split platform DTs into separate commits.
- Fixed up M31 eUSB2 PHY driver with feedback received.
- Reordered DT properties based on feedback.
- Rewrote commit message for enabling EUSB driver.
- Link to v2: https://lore.kernel.org/r/20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com

Changes in v2:
- Added new QMP PHY register definitions for v8 based QMP phys.
- Made changes to clean up some code in the M31 eUSB2 PHY driver based
on feedback received.
- Added bulk regulator operations in M31 eUSB2 PHY, to ensure that
both the vdd and vdda12 regulators are properly voted for.
- Removed external references to other dt bindings in M31 example for
the DT bindings change.
- Split DT patches between SoC and plaform changes, as well as the
PHY subsystem Kconfig changes when introducing the M31 eUSB2 PHY.
- Added orientation switch and port definitions in the DT changes.EDITME: describe what is new in this series revision.
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com

[1]: https://lore.kernel.org/all/20251021050954.3462613-1-krishna.kurapati@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20251021-knp-usb-v2-4-a2809fffcfab@oss.qualcomm.com/
[3]: https://lore.kernel.org/all/20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com/

Wesley Cheng (3):
  arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
  arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
  arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  73 +++++++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  73 +++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 161 +++++++++++++++++++++++-
 3 files changed, 306 insertions(+), 1 deletion(-)

-- 
2.34.1


