Return-Path: <linux-arm-msm+bounces-86627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FE8CDE438
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 04:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B5BE3004C9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 03:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD35E28488D;
	Fri, 26 Dec 2025 03:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ki3zI7+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eunne2G+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A24C1991B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 03:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766718419; cv=none; b=In6Ag/yphos1sMWgMtK37pSDpCFPfsBlE1fXY7XBzNKpgp2oLDT6B39A5qvOuSU5cvjuONVU7Izi04pvbdTrErps45CZ+w3MLILtBKjSnxXn9B2pbQIGKlZWp+X7NfVkhC0cHtEMkjBGXizDbDgJcA2LU3AdakPCBxa7GFKpVCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766718419; c=relaxed/simple;
	bh=o9ByM8Utpv5ofb4J8fJllzORI9orvLkUbWROL6wCLos=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eqBR/r8hEHqoe5fYBPijJsXPHi9s82Is78N4n6zsUE5xbq+rNmjmgQXa0SFJUhW3seTAZWdHDBfR4h5/RA8JC4zy+8MItO0VNxTimpsznfBDoEJwO5Zj71waK1D5M5ZDLWKTViuhbvgLDwO+EuLZi2K3YYYZZTX9OsfKpYhwyhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ki3zI7+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eunne2G+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BPMM1HW1211494
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 03:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9AU6FSaZ0Vl4X1hD3OQC+6
	+SzAVgwHLjUNdZGCfzSR4=; b=ki3zI7+beSeYIhoJNhw+dhlX4NbpwKwJDmBG28
	9XhHbzurO4a0arMbTtLQ1Y4H17hq8N1qqGMXXUOTkZXGvgoEgezYuEzAJLT6ADs5
	F7XAwL5OkEdrGT9LXxvyJyCIQPMf+XG4TQFQ7prb0uZ+z7ybP6cq6fc+YCYJmynR
	46hUp35ONFIznTC28xJ6nVG4EPIKBbgdlvnhwRbh2OS7oVdAAOXHPZJyi+N4y9kD
	iVIhiLQjxuZhvhcQlDQPQs9hvAfKIY3UINv0Vm9KaUWFLJRTxVpKplDconPK9qoE
	EKSWNX4L5tSZ/LeCQLhPTnPPenyrKxU7taZV/geDLOVh6O0A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8hwe341t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 03:06:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b99dc8f439bso14221095a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 19:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766718410; x=1767323210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AU6FSaZ0Vl4X1hD3OQC+6+SzAVgwHLjUNdZGCfzSR4=;
        b=Eunne2G+hX/7hsvGdgp44f2XPuKU5+/16R5Ji7WG7DKA3Ca1e7B2Ouo0amXZdtO3Oa
         cuInuWLZl2Og2c9jJTLhMO/8QJj5ocaWcedocRh4E1lfBQte0Cl4h0jVg/pNfB+C6gMV
         KUemGibugVVIPkgbccS/VeLzFr4yn6IyCi3iEY8SYI7uq/JXljttNMjnkNfcaA1ZjJ9Y
         3GMSidhuzit15zYu5yQSMapBLQC/vffoyh0avtyM+/HSYY5rpm8TyOdQ91R493TTcFyk
         1qDqWJCHzlg4kVhS8ACr7nd2INc1kOt4iEZUoBf0jPFUACQfVYlg2HLgVLyD9KOhEWJz
         7w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766718410; x=1767323210;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AU6FSaZ0Vl4X1hD3OQC+6+SzAVgwHLjUNdZGCfzSR4=;
        b=Ri08HDks78eb4hSud2OhUrzCRaTC07Dd/eeT8pNOzeuHq5EF1kWw4g/2sPXZ1sfPXT
         CUol+6+/Tni+knfHKr61G/iho9G6RHE7a5RyoRkaOvCVI2hPos/r9H6OlvG32hNaSXwu
         qD/Hsno+n//UZsRwyt1cG/pTaNQ50H8Tg875Ksv7DAV6KRY2CLX2usDS5TyyuCq9811h
         gjzRFWFqTkNvt2ScG0doienpB24iA6V0BmH+AcEsUYbkoVTLIox3CBmpypOhmQ6EiIFa
         v4VoRTg0/MPH6KcG7XGs3lMma98Ew5GINplZL2KAsY924IZHaieEL7C6BV3Ms2hlDnsJ
         Xk0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3kdWnsOoibmfkmyEuB3CJfjrhGrCGqSujbYOlnfiPgZdDSqzPSaI2SL7rFL9hMIOmWZ9nr7E80QKswMkY@vger.kernel.org
X-Gm-Message-State: AOJu0YwKtDggcALpTVR5uaWcmJydbTgBaEYJP4e7CsEzbItyYWocM/To
	oNT9oMCcCrvIMwClNDBDqSguwJDJwmOHyr3WYpp1eiLuGJsjPIJe9xfSl/Niyjw6Y+rVmMnOwte
	ZfFXthABImoC0ORLjXF5R7fNiuu7XhIbORVs3EOqCQXnlQmcyOX7TcdehXcEHGlqVgrPr
X-Gm-Gg: AY/fxX6vQD11BKxtab9rhiiGoaz7ZqahuTcUoAYSRBHEbaqsXDymuCPl50yv5K+JBAo
	BaCR88mpGaIxs71jvy6PdHTF0n0UuAVlOo1PtCX90ARz/rVeF9UnNj5tF2y2hOjimpdc9TO7PZ6
	pvPil9tfFnRJlUWEwgCpKvgG7lxBLfFLmOBQAbKermoD+EG8GCodbUksCvh5gYPWmn4WUWFEs31
	UErFoofYre1h1vxNiFyXko7ozXu8/LqbU76bbp6fRWQmTPejBF0eR+Gv/lFrId29uZ9Q+XbHrAL
	nGLWOqY4ScVRxdyPPINgyjeZWejG4IyRgj96oOLQUYU1DB3v70cp/836JnksnNno8sxBLdIukDp
	uoKmvOMJbx87E8lqa0y1mJ4phTyWywzlK51em4vk8oQWElKFzgyWkVYT5XFqv
X-Received: by 2002:a05:7022:258d:b0:11d:f464:5c97 with SMTP id a92af1059eb24-1217230621bmr20670567c88.39.1766718410282;
        Thu, 25 Dec 2025 19:06:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhSZHVBPoJJ9v0xUmns+Jmp5dPO+OtadwEh/5L2h88zDEVpBLDs8I+DvjAvsgxr/Ugppecpg==
X-Received: by 2002:a05:7022:258d:b0:11d:f464:5c97 with SMTP id a92af1059eb24-1217230621bmr20670530c88.39.1766718409642;
        Thu, 25 Dec 2025 19:06:49 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm83135082c88.5.2025.12.25.19.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 19:06:49 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: kaanapali: Add misc features
Date: Thu, 25 Dec 2025 19:06:42 -0800
Message-Id: <20251225-knp-dts-misc-v2-0-a8a8a31fd528@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAML7TWkC/0WPQW7DIBBFr2KxLpEHMDJe5R5VFswANWptJ2Bbr
 SLfvZAo7WakL828N//Osk/RZzY0d5b8HnNc5hLEW8NotPOH59GVzEQrOhCi45/zlbs18ylm4l4
 a1SvdE2nDysk1+RC/H7j3S8los+eY7ExjhYCA11ryt63I1ufuv6uoqwnapwm3zIMHKYIOGoQcd
 sFeXFqmKa5DQyStVRKVQodKuoCW2kDYAXW6M8oCSNnbntWPxpjXJf08+hZWdVdha4T6q7YDb7k
 MDkmh8YBwXnI+3Tb7VZWnMtjlOI5fJkL4CTwBAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766718408; l=1322;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=o9ByM8Utpv5ofb4J8fJllzORI9orvLkUbWROL6wCLos=;
 b=y6/UfDKvmvsjws0q7oRClPCgpHFFxISlUh3HF7+LFr4ceiskmIgfPKb8jkyAtTQyXGjb1dYt7
 YaOtZyd11awD7k39M4tDN0nz+s1vKi6D3I6Vhcer++FHnc2CQy7XNZR
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDAyOCBTYWx0ZWRfX9cPQgaWDxHth
 ni4IMUdZOzs/iYT+Itzi41/nQOna9iYjNiQuP0gFkD4Z3KZIY/C/uFogF32jCEGCBR9teeGvfom
 6ODOktKAg8qNDtrtcDRHZCR7BOQp644Q1f0eOD0MBA9l3D7eKou+SyWItmf4RWKLBL/USDqa/0D
 i9T4mIbaru6F3SNvsA7fsydSI0RW/tbWNU6AUwmE+8h7doMyJ/bbVJwpR+RHhO/M+Gp7Uf83qCh
 9RtKbb/sk6u3RBp+QUXXrMgD1b0rH8xRoGgGtNrIGpuSYiIRhyABrV60XPlF/KrqJ2xZOsfGOCc
 kHJT6XBeiiempgrWvqp1/MNMrZdpHQmcbKeu4yQ12RGsXwKYell9zwjaUr3S8Sfp7ewY8pp+8wP
 m/bVzSs9K1GqVAV0lcEMPOILEcCeM5mc8i7sbfRmi9sL97f5YPv1CMmUbm2HV+plj2Ov+fKPcF3
 W6MkUvNqgczYtD4SY6A==
X-Proofpoint-GUID: xelZ732WjpJ8BQqhFayPp3NABCyV85WI
X-Proofpoint-ORIG-GUID: xelZ732WjpJ8BQqhFayPp3NABCyV85WI
X-Authority-Analysis: v=2.4 cv=P9c3RyAu c=1 sm=1 tr=0 ts=694dfbcb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=oEMF-frSRFZDcAtVmLgA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260028

Add new features on the Kaanapali Platform including:

- TSENS and thermal zones
- CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
  These devices are part of the AOSS, CDSP, QDSS, modem and some small
  subsystems, such as DCC, GCC, ipcc and so on.
- QUPv3 serial engine protocols with 5 I2C hubs and 24 QUP serial engines
  across 4 QUP wrappers, each with support of GPI DMA engines.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- picked latest coresight patch form: https://lore.kernel.org/all/20251205-add-coresight-nodes-for-kaanapali-v1-1-d3d2099b9b24@oss.qualcomm.com/
- Link to v1: https://lore.kernel.org/r/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com

---
Jie Gan (1):
      arm64: dts: qcom: kaanapali: add coresight nodes

Jingyi Wang (1):
      arm64: dts: qcom: kaanapali: Add TSENS and QUPv3 serial engines

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 3997 +++++++++++++++++++++++++++++++
 1 file changed, 3997 insertions(+)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251225-knp-dts-misc-e3948468cc69
prerequisite-change-id: 20251105-knp-bus-fe132f6f6123:v2
prerequisite-patch-id: 64b5c2583a515ba7b77e521123058e10e2461313

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


