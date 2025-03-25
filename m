Return-Path: <linux-arm-msm+bounces-52454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9F1A6FFF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 14:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50EA33A9563
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 13:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21A4267B68;
	Tue, 25 Mar 2025 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7z/Rtql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D52125A62F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742905844; cv=none; b=WbpYWUi8ahRIDo6QIqsm5Z2xrViSd6czjw64j0ze12PNfXrb/KZX6EFgFJoCRy1rPKMZzML4wguNJnEnrJHU9fWNbnKOo3aYlkjQImSZDE0ZCzZJs7fHt/ScKY0Vlos46lZC2EnG0+yw/mSHzyOYOj9HqRkrHpmONNeYSG11wlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742905844; c=relaxed/simple;
	bh=EWJKXkB8LgOYgPO2GqjsxkANuQt2ed1jlqMbsU/LlwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rfM4EU5tsWOtbX5OYqbglglPAvwvZHonXSB6w9LvrNMlEG1tEidvp6FRaBl7iBH67uOLyOQjTTm8EBi/1wpWVNqJuhfyWR2vG+tAedpbt0EtK/bZwucPzvt1Wzn/UH5i1WsF+hSvAzm8tezv+PN2ZsNIDaQe295C/ZVIZ7MMuzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7z/Rtql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vnB6028726
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/EQM6DEoDUu
	6zxmdeqRLQ9xyT8MDYjKcZBBXwIJ855Y=; b=B7z/RtqluDa1rImIos/tyMn+Tt/
	YhNGPX6sxI4vRWKSlSTbR/BNhIKdpOsdgqjrNozsWKFozs8fKQczvvmjgFfJ23KQ
	GX5N74aCFVJ5+9Mn+UTULOhThkXvMC+BtSfbpKSr6I3vXJaa02wzH7M4IAn96yFF
	HtvQ46Lygqt7/it1K3qOK+KUo6UIW+0A3CrFU7sW2wlM4kTtNgn8YDCy30hszN11
	rtHzW4ts8HN9erkSmOEwbPTQJq9hb25988OUh4CIPuHQBhS0VdcKtn0IfhQzPqkM
	pkBCFpHvBloXhHIhvZll/XXR7f1KELvsUdO/zynaphcX/NZBBR5GuHJ1PxQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hnyjfmdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff68033070so8862826a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 05:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742905833; x=1743510633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EQM6DEoDUu6zxmdeqRLQ9xyT8MDYjKcZBBXwIJ855Y=;
        b=LlENhogcL2i/kIiZJlOGqXDBKS0b4879ZFbP4117pHfXGJGVzX0IzUn8xh4E8rARu5
         6+VIArQhPNzyv1eCeyCyhpdFRoL46Ho0oVadbBkZSOhKiUExRIOwxsP72CQ/Ibp89XWZ
         zGtHLz0xJJKexJYk9KxyXamWiI5lA56kANLuvTLn2WN6jkN955KyhlXX2DiH3f2uhyB5
         MiiaEbPRR4TOid5eV5A+JxaHcpYaszhhC9zzMau9Yl/hifPEAVQuqK2DV8iXz7fY4xh7
         mhf36q3xbqm5sszeLGHxca/xBTc7Q281aygLHHqKzKsftLHV40H4pQapUBcjL6thROZh
         HBBg==
X-Forwarded-Encrypted: i=1; AJvYcCWwuSmYKp74lcJ5Cbka5sU3vP6TPGRJ8OHXwMEVvp3pR1cnfGiE5kFtAep7ZRUTfmwpnclAIyriQnjjRsi/@vger.kernel.org
X-Gm-Message-State: AOJu0YwzBkZtPxTVfsfMAsha3AOsgqad6HvxM8ocE/uZESGZHQidsgA4
	gvlUdX1AgXPD0fKcXUtm2DeHSFyxOx5vokGr2uRqUA+BUdOwVKdp/D4r/VCS5/N6dM06QEtzWEz
	OgdsBNSkla4hgUOkGVe0+N8WLBy0HA3AbYqp6BL05HIydN+HV/XPGOdw2H/xH5+pBOu/zzL3B
X-Gm-Gg: ASbGncsxjlJkstmwL+l3lF/HhRkLmrF2FxqVkoUbg2M2uTe+qjjM5iViMNXON3/28km
	a7vBpwWJIXM6zC3OYdtDTBbYLsJ+GvQC8YYLnwRRTm7+DYBLDBezU1F+5zyu6IWVHITqjNWeJ1p
	L5+QKqasL7z4qq9XBO6f/Vt0pL6SltIHE6CE69eRO5CG/XiZDkdVkz1/lNpEzLHd4L1dV9j+B5S
	UNAd5ORRHCnuJEj4biJcJ2XfbVE7NsJwKHHOFP6/lvOjuWuFa4CJkV1HZd2xr1agPmBTgynxkGj
	9JNJ/+dXycGupPA6S+T5QpPG2jDgN8awcaLJ9bwhsOHW
X-Received: by 2002:a05:6a00:1301:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-739059ffb1amr28507107b3a.18.1742905832863;
        Tue, 25 Mar 2025 05:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHouuf4m/7aas0Ea6VvKqkVXtocGxmnrkYVDOh+y2Z/ngsR4dy9YmGQThpYoaWuqqdjbhek2w==
X-Received: by 2002:a05:6a00:1301:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-739059ffb1amr28507042b3a.18.1742905832325;
        Tue, 25 Mar 2025 05:30:32 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e4b6sm9987391b3a.180.2025.03.25.05.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 05:30:31 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 2/5] arm64: dts: qcom: sm8350: Add snps,dis_u3_susphy_quirk
Date: Tue, 25 Mar 2025 18:00:16 +0530
Message-Id: <20250325123019.597976-3-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
References: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ybu95xRf c=1 sm=1 tr=0 ts=67e2a1f2 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=tc1TWAvYerzeY2VvnAsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 81kC5dHXW81qvZJYyODeNefnl2rmDZIZ
X-Proofpoint-ORIG-GUID: 81kC5dHXW81qvZJYyODeNefnl2rmDZIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_05,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=816 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250088

During device mode initialization on certain QC targets, before the
runstop bit is set, sometimes it's observed that the GEVNTADR{LO/HI}
register write fails. As a result, GEVTADDR registers are still 0x0.
Upon setting runstop bit, DWC3 controller attempts to write the new
events to address 0x0, causing an SMMU fault and system crash.

This was initially observed on SM8450 and later reported on few
other targets as well. As suggested by Qualcomm HW team, clearing
the GUSB3PIPECTL.SUSPHY bit resolves the issue by preventing register
write failures. Address this by setting the snps,dis_u3_susphy_quirk
to keep the GUSB3PIPECTL.SUSPHY bit cleared. This change was tested
on multiple targets (SM8350, SM8450 QCS615 etc.) for over an year
and hasn't exhibited any side effects.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5f93cae01b06..a4fc3657ff87 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2651,6 +2651,7 @@ usb_1_dwc3: usb@a600000 {
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x0 0x0>;
 				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
@@ -2729,6 +2730,7 @@ usb_2_dwc3: usb@a800000 {
 				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x20 0x0>;
 				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
-- 
2.25.1


