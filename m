Return-Path: <linux-arm-msm+bounces-79887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF2EC25074
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D313C467296
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F1833E340;
	Fri, 31 Oct 2025 12:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDhdJq+9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQmgAMDs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF402900A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914046; cv=none; b=QAJeRTOV/4ZRxIvJ8Q1eknAD2qgG2oEvpLrZEYUwaGiP1aLddKkwlkoCkDfNKZx80cLLtzQgRQzxKItDIH68Qd06bePypRjFRGFXAw/foMM/Ze08G2quoUvJZxmHjyuVCQz793ExHWdWLDT5iMjE5SWmS8CBmAu2BLQ8FkTln2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914046; c=relaxed/simple;
	bh=sqJNqwGnrrb/W2OtAanS252ug+Zw15TbKV12EdEx/nk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JAlejbT4qzU6Vt1uBVBmpN1EWkIdbgU2oWVb3DTn8LegLrPQHF7g7vKfeqtm51wzq6Fsr+NVVesjPypT58d+vhqOLOk0P1pua+Y1DTgQUN0WnvVlkpf2hISQpMSipbtqpnP+A8nldU23Y5il2wRJM17SXbDwd4hgh9v6hxvEsa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDhdJq+9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQmgAMDs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V4M3T51827685
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7YQCRRoiEM+61ba/NfudLdurcxlXk1dhmyr
	M49MhVh4=; b=lDhdJq+90zXlXucjR1tOMZYWa9zX19EQUMY1O8rxBZCrdt0IShm
	ditOfJTaeyJ80vjm7tLtQ+FIAFYaLOf7AF8aIPyV8Om9yma1GTOC89dQv4fasPl4
	OP7ShwWfy/tjZtNc01EDsdzjOavX610ZZKX4HsEsM1qGKmERWLtbz6DECY2a4Q/e
	8Pw+hFAkmbC2j2tOE+QUfjQ6sPn9RYjSfcnTVL8N4xzF4EDEwWDtich0Hj28kwdo
	PsqHfz4duzWeO3kKtOEfU9kjVMB6CAo0IQoSswlhoJARlPp3Ud84D7hPzUboyZli
	+YNNvXkA6OwB+txXeoWUTjXuF14YRdnWE4Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4p11s8cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781171fe1c5so2153833b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761914042; x=1762518842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7YQCRRoiEM+61ba/NfudLdurcxlXk1dhmyrM49MhVh4=;
        b=WQmgAMDscvVcEBMBSljEg69F00SiKPFHUvHuP7OSgNNvZxBFqeEWDr5M5nFiwnaK6z
         F1fXV3CmhLnPxmzmyPZsrpOsFc3YqCkYcBFFdF6JBlg3+ErVnG0Pg5VFmBOT8G67zoCV
         FhPNa7AvBZvTENrQ1AqNz+FApmvBxEKUg9rio37pXD0ha5Nuu9niygwb3P3FsXuc+Y2J
         i/e+ZAaN4uB80RHUPQlqnQ6S0r0sYSd2X4iS1i9bNWXcvStHvBLRW0RgMMJSbSZrJJiO
         7vfXudKjefuaL/cB1vr3JZHj5EZwXg3Aq2S42u8e1Nh4040IE84fM73duQMGo5+R027X
         NYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914042; x=1762518842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YQCRRoiEM+61ba/NfudLdurcxlXk1dhmyrM49MhVh4=;
        b=OffzWZiiFziocN+5mAJyRUBfhEgyFT+jDQpnJ8Gix2q8ejVABB9JtQMxm7OpYaGqOM
         JyNP1gBmoycnVJ5iX8G3op15Hq+cDUOGGo4qVJY3HYm1wCkVmg3kJaJJg7P/yd+mH634
         GRQ1DjIIoEyIOEIbRrcrB+E53Wrsn9aHVsoMep8v+B2TX/rZ9MiU2ifHZvh06Ji6zs6J
         ygcBlFsvJOQ2FkT2iOosMVqKBF0fQT6l5EqJT7Z9Ze5BSbQsfAJgoxlEHJBjyDjI8ezS
         f1kvZAzxLwyenLqNC80JZk1zbfSgUgvLVvkSMnL5oC/iZ00wOezqiqkdjPdZSiytkgty
         9klg==
X-Gm-Message-State: AOJu0Yx4slWqSsMo/kOlrsWaIFE33sDGaMf16jNmmU3q4oI9kfxBZs1y
	volCP8h+sG3tlvo5U9P1PG+9ymo8eCn3vWGxV4hn6mu/gPFC78OiQaDJcFjEpugNUVKQNnrHSJx
	WfelLgW0UBH0TS9iCiiUgu8S0UJygtqtGfRZp9h0aHRPgVTimFL8sCSBOUviSG3BfHrMc
X-Gm-Gg: ASbGncutuwi0nbb4p+USYw1fbZwM6vvl6DYirmmobCjVmGiog5rky09JVA+w3PluZjL
	qNWrW8MMWOmb+FJQmsgcByXoo5ZEazbXyLSz+oWvp3ubffW4wLAg4Oac8oV6LlTLiqeH0B/P6ZK
	HJzVUfWY7nBIZ971D6UCBxyE52upH3N9U5XRZBuEk+EfSCxgOc6hnw8Cd1PnUL/nNTbZqd2zQCH
	puraRDVxRIsSLFtyIp8jRbDX+7IBPXIDokMYVEWTNnTz7KPlfeqqES9A8hpP+GR4TzBzd8Oe2TW
	UIvus6rnf5+5scqcUrtXRNyqrIEVXzPpxKZHIpWOyJM+IoXLjTNjDpgX9jtA+D5c81A4t75v65g
	5j7Ni6hrtVRznR+RVJbF7MpShG3cCTwaBGA/f
X-Received: by 2002:a05:6a00:39a7:b0:7a2:7cc3:c4ed with SMTP id d2e1a72fcca58-7a77737e83amr4042133b3a.4.1761914042485;
        Fri, 31 Oct 2025 05:34:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHReIeOkpBnk0vAQ+/4MbA0+mM/Fvz1bOi9vC6V7Ci8ebXCWBjQBmBWS+FcPQgCmB068L7yjw==
X-Received: by 2002:a05:6a00:39a7:b0:7a2:7cc3:c4ed with SMTP id d2e1a72fcca58-7a77737e83amr4042084b3a.4.1761914041930;
        Fri, 31 Oct 2025 05:34:01 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8982109sm2131277b3a.1.2025.10.31.05.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:34:01 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v10 0/3] Introduce USB DT support for SM8750
Date: Fri, 31 Oct 2025 18:03:51 +0530
Message-Id: <20251031123354.542074-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: e-iCgoE0QI8l3dcwiV31aaULgevB3lV6
X-Authority-Analysis: v=2.4 cv=RbCdyltv c=1 sm=1 tr=0 ts=6904acbb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hjxnLiisKRasYILsxJMA:9
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: e-iCgoE0QI8l3dcwiV31aaULgevB3lV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDExMyBTYWx0ZWRfX5geDpX4XAJmy
 ZDrVJf6OKIOS3B1jSITOFwdVZI6QxNm6m0NGu/Hpwrq+yrCdd4dHS78omlnrAeQ/EOi4uHXE7OW
 gcYMHaLHgWF6VGsiZ2xu9p2EcSi3Yx9BCMn+bk+vwD/nj2XLyYpCb9EDrw7jiv3C6bB1gZrCIrW
 dXa/3b9u0CHCecMinJou4GqV2oHvlTHbR44P4tf9u66xO6VOB9bNEky8CNy3Y/sd1R+ihRxF7rH
 B3E4k59AYuHVFnCh3QQh+Xrm1dH+DCMdC3mKb2QK25oPOMVpklPPr2LKqqqatELHbh4YLhv8LWH
 y3UJffpCIdRGoj/0c/bdkjAnaOPRYSHZO++UCIBwl0cCarCcpXKjBf/Zie927UMoMFI0nDjgxw4
 y3x9/SDgLX3EhDT9gqDEOd5Y9RxWrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310113

Add support for the PHYs and controllers used for USB on SM8750 SoCs.

Version-6 of this series has all the binding/driver/dt patches acked.
But only the phy changes have been merged.

Version 7 was a rebase to get acked patches merged. But comments came
in to use flattened bindings.

The v8 for usb bindings patch has been split and sent out separately [1]
and it is ACKed.

On v10, the pmic glink changes and usb role switch support are added while
addressing some comments obtained.

Defconfig patch has been resent by Jingyi on [2].

---
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
  arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  73 +++++++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  73 +++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 161 +++++++++++++++++++++++-
 3 files changed, 306 insertions(+), 1 deletion(-)

-- 
2.34.1


