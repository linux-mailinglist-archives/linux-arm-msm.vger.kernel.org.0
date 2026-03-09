Return-Path: <linux-arm-msm+bounces-96354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCD4G7Eur2lzPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:33:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3600240D94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A4273011074
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2833636C0BB;
	Mon,  9 Mar 2026 20:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqrGIy0A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkqSKu1O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA8364940
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088424; cv=none; b=Zi3RFzbW435SXyJT5lxUgIWokImtmUJ+zF3BlPuJBl/cHHVSwQRIjgmBR+V+a2b77AGmQkXaK8SHhZNWI+IqeH9AtihyJnPwz7zgfsXzFM9QJYTb0zq76R8oKWkqwX4sDiGBY11UzqL0PcI6Rdeu4c75TXmH2yz7X8O1NzPGFdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088424; c=relaxed/simple;
	bh=q38mhscR1gdYqYqY+ByN3SYm2nFCiNwlEwn7u+IVIA0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NCwdzEfWvmwrKlWoIbbape6Hl/DpKFuCKlZOAXM5lahxOWHwL4d/1zH39mrJwNUXkD75x/7FTpp8g12OTynfhPlmY98Glnof1+fI/VpbrEAU4tHaEfqJXOfQwpKvHzxgHGq21kE450ICq2uRHPL1chB/Nt1aDkCN281l30ucdgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqrGIy0A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkqSKu1O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC1xr1298214
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8kOJDOzT3HdgAsjCgYZgbv
	kEYJ0AkosRngtcd+/OvsY=; b=nqrGIy0AonSx2ZtYZ3vBRNkYngBE4mMTDqhkQS
	1fosfKnIr7+LgrqMfwsp5B9oPjiqNTIqoNXwXoHvzfTlS11rNHo8ox9dXGGSnFea
	34ZsYOLFECOhKoX4xs2ZQxp3z/q7dWxHGkgeS9+yZWyQJVzXNTvWyoG3JfVg3k9R
	DaNKVztQoNTxe0e8Q+5H4WSohYv2BXZe+LgQ4Sbn/1h3lrkHiduAoxZeEuXJ6yXi
	1MpClV/2H/Xf2TIsr7eDd19DqO7j+V4IWKREmARQ2b/UAfgRXxSMfDgu31mUrRjP
	Wk832C2K5jjv20FYfUfrpd9iJ5NwtzIcz/w2imZdp4ygoGtQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv19afc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:33:40 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d753cb3174so5470395a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088419; x=1773693219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8kOJDOzT3HdgAsjCgYZgbvkEYJ0AkosRngtcd+/OvsY=;
        b=AkqSKu1OOo+h9d37WC7YcbrNX7ZZRNjDWUJBo7dFbRO+BAPQ7RWHOOZrK3/79HZ2v5
         M+redUeewCverfHfX9SmKAWMi86DyM41MvdavA7CJAXKPCuZSXJnQ/eAX9kZ/n9ZdcRO
         Znp7IuWg6X2ccTSQFNLjJnF281PgLOEymFj3sYOTqBAxpKYxS00dHp2cCqTD7oROdejJ
         wO6djhZOu7fH1xzxWNpR3SemlXjOSnVieZxOdO3Txv1JNAY8SNBYevrKwYaTXW9sJKY0
         lyGe5beKeA13gwf+VyB3JGtWkfmvWh32HH95i0kt/41M0MPkArpVn0rgMH9JSBP6lf4G
         Ks6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088419; x=1773693219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kOJDOzT3HdgAsjCgYZgbvkEYJ0AkosRngtcd+/OvsY=;
        b=fzlqOnoZKF3ijzc0rDn4SKZCEiiUYRckUadgBEqilTBA2rfQRRVrxN3nRMnq9AZwih
         vVXWLYBXUqMXyzZKllqoigS+hpeKZJenGLQsqkntDyeyX6bWzLg7yL1fH4P5IKkUiWdn
         6CSzuHAkCHM2P7MfomGFf3HkGkQK0K2bciZAEJjJg9TLDUruh6Zz63ARBAo/Bv1f69PH
         KbJ6zB1W8pJK73VT49Y2gMhovk/WWSNt5VkojUvPDZkA84dobI+z/Rf3wI/ohkBmNVcX
         CR1461PwO3npgQSKx7Nj5jRCfz6bAKXVe2LD9Yi8O9ss7VOYFgBfL38vefqAYXOUXeZI
         mCpg==
X-Gm-Message-State: AOJu0Yz1Di/O6m7xNo9WD+2FHD0Gcj0jUtI1n1G7PL//bLBNZi6JMTKa
	ip7C8Zc5tHTK8LXAvJGqCSXBudPsTqsUvXRpvi/u1JCJrfFSpDV+C/3ILUB7d28gqMqwvW3mggk
	Vrbw0wq9qawTitd1p9NGTeEcg5jVJfVCwZYwmkrKHgYHj1lk7+GIclWqaA56jIrUfids/
X-Gm-Gg: ATEYQzxCyFx2m6+KldnoT6ZyWVnhZYs0817a8A4Qdxyj9uvFSN7ecrrqYPW6fyHz0hf
	8+jP4LgL/gNcgIHl7i+0WqmSi+LD4woB/rLVx3RIsf8/aNIqkA7+1bcVRC36flPYPP6fqoPHM2H
	PqOenCn8wOd++T0dJzJSdbov1Hp3lKxyWQDD0DM8azBBowXhu1wnnmg+wKLPWa03ylJM3Vh0k/6
	dZLmccaFzKeu2YG710pqZfEdfRA64Rn9okTLrQ00J5Bv0N4BDDFnWHAbELkL8h6M6nXbFfUxstG
	T3YgP/beSbfIXJ8XQMYDtP7kseq0yrzkRjCczT0JzWXYzWzSb6x1hkVLK7XYhhpFAUg2/lJg3ty
	JgkjVFwZtKlyw3X76bN39m+gFagXWCpBRRjlB/FUQAtJjL4IfsZCRJgi9pGnsfHEWC4oSxspMBp
	8=
X-Received: by 2002:a05:6830:6615:b0:7d1:93e7:cd6f with SMTP id 46e09a7af769-7d726f57b83mr8422550a34.13.1773088419227;
        Mon, 09 Mar 2026 13:33:39 -0700 (PDT)
X-Received: by 2002:a05:6830:6615:b0:7d1:93e7:cd6f with SMTP id 46e09a7af769-7d726f57b83mr8422528a34.13.1773088418774;
        Mon, 09 Mar 2026 13:33:38 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:38 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 00/10] Improve Qualcomm EUD driver and platform support
Date: Mon,  9 Mar 2026 13:33:27 -0700
Message-Id: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2fMKmB0FWxZQd_YQrN2261Lkh8vf_msz
X-Proofpoint-ORIG-GUID: 2fMKmB0FWxZQd_YQrN2261Lkh8vf_msz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX3xN7aUVQ/Roo
 DxWRHGRHjJVV0dTOdK6GMqnO75fAekOFQkjxzxXMYxuCJcNeW4LfVh3rk9ii/TJJpHqu3Eg82cC
 gR/GMY233J6X0AD7HDIRk+JLeCMBvxKQwdmJmNTFzo7odLbntQqw89WKVqfuxr6SGNCsgmbERBE
 jx9VtEtUob+LeSk7glBb5Wid7XPAkjH3/KYQEfq9RYbzs4AVCS+v2kzcQUkdrfvAhAzzTNpGL9T
 asFXBja5Jhct0OD3lpg3WCZkWgU3Hd9TDUkW4v5VTSp/yTY7yJlILWquBM7rkWRrjmDoPCzHEZk
 cb+b77vvJ2djpcDiiszxHQIFycI8M00uBpsZtMJJLLYiEzPy+kV3+sZETRiePgwLSV2AsBusrw6
 IprMr1DipUAalqtsQZ41HctSAyvQD2q3JAJSLHMbwkwGW++VrySAw0BF1KSF6KHUthHI8PlYvXq
 uIRRvabcIANanUi/3vg==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af2ea4 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=QGAZVZHJaQu8Muxe3_oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: D3600240D94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96354-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,n:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.2:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Note: Marking v3 as RFC for the following reasons:
 1)The driver design has changed since v2. The earlier multi-path
   child-node approach has been replaced with a flattened representation.
 2)Patch 10 depends on below patch that is currently under review.
https://lore.kernel.org/all/20260223191042.825136-1-elson.serrao@oss.qualcomm.com/

Requesting feedback on the updated design.

Although below three patches in v2 had Reviewed-by tags and remain
unchanged here, the tags have been intentionally dropped in v3 due
to the RFC nature of this revision:
  - [PATCH 02/10] usb: misc: qcom_eud: add sysfs attribute for port selection
  - [PATCH 05/10] usb: misc: qcom_eud: improve enable_store API
  - [PATCH 06/10] usb: misc: qcom_eud: fix virtual attach/detach event handling

---

The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
provides debug and trace capabilities on Qualcomm platforms. The current
EUD driver, however, lacks essential hardware resources such as PHY
references and support for multi-port configurations. This series
addresses those gaps and introduces the necessary device tree updates
to enable testing and validation of the enhanced functionality.

This work builds upon an earlier EUD driver submission:
https://lore.kernel.org/all/20240730222439.3469-1-quic_eserrao@quicinc.com/
and extends it with support for multi-port use cases and proper handling
of EUD operation across different USB roles.

The series has been validated on the Qualcomm Dragonwing Q6 platform
(RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
interface. For detailed usage instructions, refer to Qualcomm’s Linux
kernel debugging guide:
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd

---
Changes in RFC v3:
- Replaced the per-path (eud-path@N) model with a flattened ports
  representation based on the feedback.
- Added port@2 and port@3 to support dual-port configurations.
- Removed the EUD-local 'phys' and 'usb-role-switch' properties since PHY
  and role-switch information is obtained from walking the OF graph.
- Updated PHY discovery logic by fetching the PHY from the controller
  node/fwnode, and exported a new API for the controller to report role
  changes. The dwc3-qcom driver now uses this API to notify EUD on role
  transitions.
- Updated the DTS structure by moving the EUD-to-controller port mapping
  into the base SoC DTSI, enabling EUD by default, and adjusting all board
  DTS files accordingly, including adding the usb-role-switch provider
  link on connector nodes.
- Link to v2: https://lore.kernel.org/all/20260126233830.2193816-1-elson.serrao@oss.qualcomm.com/

Changes in v2:
- Improved commit message of patch 0001 and 0003 with historical context
  on why EUD worked without PHY references on single-path systems.
  Expanded the usb-role-switch property description in the bindings file.
- Link to v1: https://lore.kernel.org/all/20260116232106.2234978-1-elson.serrao@oss.qualcomm.com/
---

Elson Serrao (10):
  dt-bindings: soc: qcom: eud: Add support for dual-port configuration
  usb: misc: qcom_eud: add sysfs attribute for port selection
  usb: misc: qcom_eud: add per-port High-Speed PHY control
  usb: misc: qcom_eud: add per-port role switch support
  usb: misc: qcom_eud: improve enable_store API
  usb: misc: qcom_eud: fix virtual attach/detach event handling
  usb: misc: qcom_eud: add host mode coordination
  usb: dwc3: qcom: notify EUD driver of role changes
  arm64: dts: qcom: kodiak: Fix EUD USB controller connection
  arm64: dts: qcom: Map USB connector to EUD for kodiak boards

 Documentation/ABI/testing/sysfs-driver-eud    |  16 +
 .../bindings/soc/qcom/qcom,eud.yaml           |  19 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  19 +-
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  11 +-
 .../dts/qcom/qcm6490-particle-tachyon.dts     |  11 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  11 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  11 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  11 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  11 +-
 drivers/usb/dwc3/Kconfig                      |   1 +
 drivers/usb/dwc3/dwc3-qcom.c                  |  10 +
 drivers/usb/misc/Kconfig                      |   1 +
 drivers/usb/misc/qcom_eud.c                   | 322 +++++++++++++++++-
 include/linux/usb/qcom_eud.h                  |  21 ++
 14 files changed, 414 insertions(+), 61 deletions(-)
 create mode 100644 include/linux/usb/qcom_eud.h

-- 
2.34.1


