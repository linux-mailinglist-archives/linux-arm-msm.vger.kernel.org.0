Return-Path: <linux-arm-msm+bounces-106560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOGzAiw2/WmZYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 03:02:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3374F08A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 03:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7579B3038D1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 01:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D5B20459A;
	Fri,  8 May 2026 01:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dk4DyBCo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q6STFuf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BDA15539A
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 01:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778202152; cv=none; b=Key4BVGm7itjjjFwsCAVKs/20MqXfFLod3+1NWbKc2+BXBy6iL4HsPWk4JewKbZrt4ebxA5doBVkPvXUMXFilhEdVTblVIhdT97Mx2Fra5iOfVLJI3yFvFdTxSouH/IjucjspT5CoikcnqNQEtrDYnRN3EZZigG4B6nFqv+E2jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778202152; c=relaxed/simple;
	bh=xhkh1TF7erORjV8OcExvlJATvJ+KVZ3vDDU3XN5+QIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gRfNETfNBoL6DK1mQl5VgNsZl+vVXb+foqr8RPtgGvedFcD+wBi6jt0qxsTXpdnw/FVQ2tpj+BciBNgOKk2/qRiZPUWz26jhdW4L62tMTh3UsINeOOuuRAOvv+qOdx0UINz/XqnBX3iopVPnrknnUfA6NZB+E/D5fQDuBL2R2dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dk4DyBCo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6STFuf0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647LsHWI1173914
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 01:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OJfeav9g1tiqrRTv48wwSa
	IoEPev7RNzqVCP53Ba1+4=; b=Dk4DyBCooeZVPh1oNocG5jEYS1vANWmT4+EYGa
	dGVow0/JPLuj1Lge5RceiTzkPEUtA46b6HQbgR6gcMEgjmU/FZ3EsveV/HykoAnK
	i3Sbjov8FuoHZNuee4QUFtFXQdIcbBSc2ztYkDoM6bS2lCIj51+8Ol5xlfzr7Lwz
	WLqUWL8QWqR++/WbBJliRvfXOQ/EuK+931WFtmSjD+8ZW/TMH695cFv1g4BTpSsc
	520rrw+gV63OVMLT2n7u1EAAwvN96HhfWRSVsShP9W8xQaLHkcy0d1NNXBj7cfE3
	F93ziKsl5OWMU1R2FFREOMmOUh40/hLwUTEA5RsZIs/vCBzg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132h8evt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 01:02:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee34588671so2137023eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 18:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778202149; x=1778806949; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OJfeav9g1tiqrRTv48wwSaIoEPev7RNzqVCP53Ba1+4=;
        b=Q6STFuf0XpcKq2TEWd0ItmDo5ibpWygC7Fcl8B4BzxF7gHoZga/C8PX+lJCmJIeQgc
         sOCtw9x0JmBxqnEumsc4VRdbpJ29+nx/GqMxlJMUbr3SpHqFnFDXqTCY/NFRk2EIb4KW
         X+roIPMnJvJtJfT3j53bLcXgdHw4h4kz6ipcRDcDnSQjnXGTCBb/RO2vjt/RnyRsdOdZ
         j9Rhq9e7psZXs9EkLq1kObk2ydym3VJ0+iD4W2VwQjVbgphmJWMXDF7syU/IXkBWVJTW
         icm62SqsZIWt9N4LmHa7JMklZVa+PJKpqZS6/qQ8gcy6cI9PaOzQn4s7YGndGJMmpOkq
         a/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778202149; x=1778806949;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJfeav9g1tiqrRTv48wwSaIoEPev7RNzqVCP53Ba1+4=;
        b=QLLQVCDo8Rv8MOVRSRJ5ki3SBKZvlo0YPVXFfScFGlvFibn8JYZJYnPzDjK+hYPDqo
         K+bnc/VwvkdLiObDa/7q7x9d0wBOc0adHgBW77Udz5YwER8gIZQMdj5ZZnD01S/elPUW
         HcUZoU1+iI+WjEg5Rya6QU4YJRPqYe2QM/bQLywK4SYIc3j0rEuOb17On1XSnuktGPw5
         yJs2u5cls1B5RgGXSOvCUXFxQjsiiocylRkMxGjfPQHR+CA109h+8X78FZm0roGE54oY
         8bNnssoKoyAvosiO74miKDKVWVJu6/6YxUltcfUJapltHZ3mYg42C0eMrinP5DatvBoO
         x/5Q==
X-Gm-Message-State: AOJu0Yxplw4vm913pmOzgNVfYkm8Bisf9JqfeJXyP3WH8OVjMph4QXgP
	ahnfp3Sp8BffGKzqfC37v971Y/N5eoWOWtpDZSWkkRgAT9wulMwm74WnepO0y1NlTKgL0IEK6a9
	sbtc+7GyBbHAHAMnvCLg9hXBRz/eYsNHKpfw7Ajh/Qesjy/b2H0Usv/OFKn8hhUOR0XS/
X-Gm-Gg: AeBDiet77GTK5pPbs+0o3bRb2nF2Z1fuq/Dl7EAhknuNehQCEJc03yGypVPUa77L3vy
	8gaWzebKkqeM8/M5JlcrHdpR5YCa7H9gGWgmA7XYfhiHkV3p4uwMyfV0rYVAr++AvN6hRLfNKDo
	XbAYYxlKnwBosYYFicD0BEOO0WyVJLCQ9nrul5o2U0JG2X9nsJQlbWSv1ZZiADP1UpmJwE1HNgG
	k/mIPcqSi531/gg07xQqga2/JwsyN4FO6HW23fVEiqc+umNuImeI7jsWrlNsaMhj29yqecPh94M
	f1cMvw1G5+dfhzEsXet/T/U1qEGCF8cKlx5pl/h3zyGDncAp3c/SeHj5E/5QjRoJWEiLgLxw92c
	o5wdk4JlLDxRcVOjwHq/+S+yc/vxcSFzhkM2CSM4EziYmsWprs7Tn/AhFXw4=
X-Received: by 2002:a05:7300:2a99:b0:2ef:9961:27f5 with SMTP id 5a478bee46e88-2f54869c8f6mr3361635eec.12.1778202149112;
        Thu, 07 May 2026 18:02:29 -0700 (PDT)
X-Received: by 2002:a05:7300:2a99:b0:2ef:9961:27f5 with SMTP id 5a478bee46e88-2f54869c8f6mr3361620eec.12.1778202148501;
        Thu, 07 May 2026 18:02:28 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c469b6sm149809eec.24.2026.05.07.18.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 18:02:27 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
Date: Fri, 08 May 2026 01:02:13 +0000
Message-Id: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABc2/WkC/02O3W7CMAxGX6XK9SLlr4bkVRAXjuMOb+OvKWUS4
 t0X6LRxZR3p6Du+qcqjcFWpu6mRZ6lyPDSwb52iHR7eWUtprJxxYHoDeodX0ScS1gPY4HvC4Ay
 p5p9GHuT7ubXZLlwv+YNpegz8GiOfLy0yLdp/I3XPgreg6etzqVgsgbB4KIBp9ur1pz/faiFa/
 AKFLPTDOvo+zeHhZ6ys6bjfy5S6QMWsArIzORO56HO7HC14zBxjgTUyIBu1vd9/AMGyvUgZAQA
 A
X-Change-ID: 20260506-hawi-pcie-f61435ca420c
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778202147; l=2053;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=xhkh1TF7erORjV8OcExvlJATvJ+KVZ3vDDU3XN5+QIw=;
 b=Ls6ww86vo/YCQgpm5DESbZASw7MqjlMKC87USRZHX+EdDixe3vcSZRwwpqPdMbkniuMI3NLDd
 2t86wQSOgJ6DBaWrepnhlZBa3ZJW5zcrMVmDFoORc23xOmvVylky3jG
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAwNyBTYWx0ZWRfX1cOyTkuKCnCX
 z6vT9HD8gDaMdR9bD6YBtEwLp2gzrnkyZc1TtjjjI1tWP5HY4zFGqzOZ02npa8fX2XiqRVldL7P
 nhXGv4udSJY22DYFiaimJM9J1ZojN/pi17RBaE5m5ytLEx0U0GBmC0GeD8fRKrRcgZiCd11MQwK
 5ScelykV/h6PNdO4H4P0ymNz5BTC1YV6HmKU5YuOsvUvA7lpAa765Kr/u7Eserp9d85yVh2dJkD
 ks4Jo9ClYVMET8dZp2s9Il+hF6bqG+uZNd7QU0F+UFFmomVYnNNonnfiuzrSaMpTOnAcguVxERy
 3bDjm0P7/7r4ali/iW5f/8DcrnIuG907Mtq9UOKiW2Uq0Z8yvqfSk0kRPNJ7DvdP/J8E2IYL0WP
 7Nb9dg1dxLyXOqfKH3Vx49WM6Kxp3+qopS2boyA1Yj+Twyyyu3qQN1HHN2DEpizlfrNGzBjNvGK
 zfpNPHolb8qTGX7aIbw==
X-Proofpoint-ORIG-GUID: GlKYa3L8Mi3SXEsH3iT8PV7qs1VE32j6
X-Proofpoint-GUID: GlKYa3L8Mi3SXEsH3iT8PV7qs1VE32j6
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fd3626 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DYLwrDP1oi7eDBu46k8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080007
X-Rspamd-Queue-Id: 5B3374F08A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106560-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
platform features two PCIe controllers: one capable of Gen3 x2 operation
and one capable of Gen4 x1 operation. The first patch adds the device
tree bindings documentation for the Hawi PCIe controller, and the second
patch adds driver support by enabling the Hawi compatible string in the
existing qcom PCIe driver.

This series depends on the following prerequisite series:
- [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
  upcoming Hawi SoC (Change-ID: 20260316-clk-hawi-1ad4cad36d6a:v3)
- [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
  (Change-ID: 20260311-icc-hawi-d6dc165f8935:v4)

These dependencies add necessary headers for running dt_binding_check
against the binding.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
Matthew Leung (2):
      dt-bindings: PCI: qcom: Document the Hawi PCIe Controller
      PCI: qcom: Add support for Hawi

 .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 188 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
 2 files changed, 189 insertions(+)
---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260506-hawi-pcie-f61435ca420c
prerequisite-change-id: 20260316-clk-hawi-1ad4cad36d6a:v3
prerequisite-patch-id: c4fbb0620d748d7f1ee675ade5167775bd31c8ac
prerequisite-patch-id: ae5e212518cc333a1a93564cabfc6abd128df664
prerequisite-patch-id: 3c3816e0d595589fc02383f10e48c83a61fdc9d1
prerequisite-patch-id: cbc13fb819d1c1ee77957393f0958f05db8db864
prerequisite-patch-id: 17e2c0cfbbea826fefa1c67d0f5dc2094ab73d76
prerequisite-patch-id: 150dc74750377f4558deab6b179632872bcbb71c
prerequisite-patch-id: 38fe0da5b18610aeb32c7154f9e50187ccaec6a4
prerequisite-change-id: 20260311-icc-hawi-d6dc165f8935:v4
prerequisite-patch-id: a1ff655f0b21d6259b158ad9f99a95bde31257e6
prerequisite-patch-id: db21b6b20451be8475129faece7ef4191d41273c

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>


