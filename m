Return-Path: <linux-arm-msm+bounces-91899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ4mIU1yhGnI2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:34:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E795EF15C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29357300B748
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 10:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A5C3A63FB;
	Thu,  5 Feb 2026 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kPh4nUAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhZLLA37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B113B33A003
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770287687; cv=none; b=GeEDWK/g4qQbRCF+EdwUaDxaX73bzo4kyBqa79/44/98bqVyWwfCUH9aIlJNlogT3aGuBG4F6sTjp3miB1vRTEeooxq+lDi4d0UjGZBI9qL4FaH6yGaBfRUZnQ/xl3Z1O7zLskux+CoP+/vnR8v8ePlVnCNzQlWAplWDe22r8B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770287687; c=relaxed/simple;
	bh=dT7z5rplGM79lQy4O0qpooEgwGD+GS4qSWBOk3bNYj4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IKC9XjxtPynEEUBJM0pNXfT2q6Gn+l9ZIdVpLYWXjZna/Q3mAOUKihnriz+Oos+BpwJWkbXDdiiPdbS1gTcAxe4m1vhUiuZ/fhAOUR+dITuccwKyLTWlSmQ17Y/K+SS8Rgy/gEZm8bPXez0bvoDmYYnTOrLiXBVX86CkmvZGSaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kPh4nUAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhZLLA37; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153e5Gu3246366
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 10:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N/GHhI5bIJ5AP40uRCThNK
	jiOpK4JjTiLedXWJmQviM=; b=kPh4nUASpyJFew0nX0D2TU6WDNDbhh8MDNi+wg
	O7v56orzQtAmKx4JgvoNyxY4LUnhTKPw7CMAupeHIv6FE+iEZeaBATQiZUTMYePX
	eWBFaJIUYKu0Vh8xB5hKM3iKcIiDRbmexqLQx02xtuV1FpdDINIirF+xND1eWre1
	pFI4GLSdZC3CaQJ6+pSDNtTOZrpopc/ebB2EUeG+2c7OeWY5gZErjcEebGYuDCJN
	4m1Hyii8F4QBTyR8GQuYzA7j2PZaW7jPaG9t2juEbjyVvslEU9qqlLN3JsmsONfy
	aIhY0kbvi50Zj9JX9DPtmH6ANOA1mNd+w7DGvdw29dj5DMGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp528qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 10:34:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90e8b54f0so27778485ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 02:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770287686; x=1770892486; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/GHhI5bIJ5AP40uRCThNKjiOpK4JjTiLedXWJmQviM=;
        b=hhZLLA37i3+sa9m+7tp1f9htZAGZtflC9A7FEMjFPZyBfyj4DWzaAxKg/YZHDr56F3
         uwDvzDn2Nkvu1Y9vTY2bg3Kn6w1xj5QCSxZWA709tvEOVoGTEIxnWDVpfXeibqvUOPuW
         GDOTcWfp+XEFnX02nn9wGygm/vHirLfimDsS+xyaBIcptuDVmr6OOduyXDf7cZFGByQn
         u20tSM+2c7vK/1XbDG9epqXd3YozR9HIH8YfVmWMZp42gKLSDA5rwS5tw0BstV1y04uE
         fBquDTWZH/tRgfTHfdFpuji8uQIZx8jgzjwMG/Jmn+qQ75j6cnk1Iu560eKFBRhPJHYV
         HnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287686; x=1770892486;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/GHhI5bIJ5AP40uRCThNKjiOpK4JjTiLedXWJmQviM=;
        b=Tq5zCy4ii/IuUZk8+DIT0AO425/lQCuvsVI51xS7lS1MeekMoDhaVZra+9NE9lhFmv
         9WJgO/S+0bypYKDIdRDPim0Og/HbXEWdwBZUYyO3fsZTrtBjuqpNTLhCmS8OTy+7x11Y
         RJuA+j8+giox+DQzXfz/+yTKc9jOECOA94k+9FyKhtDTVFgYZHInvSLrFpvHQq6f3ENl
         epLoXr3tVqIbjAFTD664goAmGyM13EuwPmRVv19Wn2nBfO1wGyeDV44xGkbQfUV2Zb6E
         cbFsS9Mgt0M//B8P0Pk/wJSSmg91B+piHbinGlmmWeLHHXSCSmqJAvh8Zz2g/n10T5C7
         lEtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoP9wqGxo7fudno1hCx2paFrH/UBmby+52WS6+W6/QH0k6Oy2iLjeybNw6dCBdrIA942iCI9QRuqbbfFIX@vger.kernel.org
X-Gm-Message-State: AOJu0YxE6YJxuVDa7A26n2k/dHcrn1EJONrbGZO/JzBusAOk20gKlz4K
	NJAzusS2vUVVCq34rKZPTaRBXrPGvWk98zgI4oKZ0lAfj9q1YqL/ZBIQAg9RP23WkpkvqNHmGXP
	im5+BcTUQj67BF6uvJ8WXo4yqSLGhvjisk1d9Z4OEu5+JNuXAbGOxiXG0rm9QjqD1MANI
X-Gm-Gg: AZuq6aKo+/F/PHkkJ8A/xVwAHvQv7/xlRPtXvCjo7QwcAD287ZO6W5jbcWWmPOeOx+y
	iYIpmTWVFQVIAmVU5Un5Bem2gEIkbmjn0Bx3PcvDR09T+uCF076N0RoYzWcoEwTw5S941iPpHus
	V1RswNYGFsjpYiiKgTzr2N+YBcWKwpPyNjYYCnYu8v7WO8OIsZrLUqBhCEWoqfH3GpCAW0iO7QY
	w6q74fgr538GX8PTjpXK8cWQdQBhpErom6rtGNzQszd9Gk4Dfx64PIu12K27DhRV8h8eb0Icpun
	S+r5Fj40TVateTlT1WjExKo9lSHlYdLYyUxM7GDjC+8Y0S7x+ZgckCXAq9o+ILktpHC5m4TE/Aa
	XpQmaDDk8RPnpBhBGeC5FWUhE5YJvXSdrrtco
X-Received: by 2002:a17:902:d2d2:b0:2a9:db7:446a with SMTP id d9443c01a7336-2a933bbdebbmr44677745ad.9.1770287686199;
        Thu, 05 Feb 2026 02:34:46 -0800 (PST)
X-Received: by 2002:a17:902:d2d2:b0:2a9:db7:446a with SMTP id d9443c01a7336-2a933bbdebbmr44677515ad.9.1770287685715;
        Thu, 05 Feb 2026 02:34:45 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933851341sm50539255ad.4.2026.02.05.02.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:34:45 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta <vpernami@qti.qualcomm.com>
Subject: [PATCH v7 0/2] net: mhi: Add support to enable ethernet interface
Date: Thu, 05 Feb 2026 16:04:39 +0530
Message-Id: <20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD9yhGkC/y3MTQqAIBBA4avErBMm+6WrREjkVLOx0JBAvHtDt
 Hzf4iUI5JkCjEUCT5EDn06iLwtYj8XtpNhKg0bdocZW0X2YaCkaR8+tfm6MsBqwr+puse1qEWR
 wedr4+ebTnPMLoXuirWwAAAA=
X-Change-ID: 20260205-eth_vdev_next-20260204_eth-807136ad5cd0
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vpernami@qti.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770287681; l=4500;
 i=vpernami@qti.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=dT7z5rplGM79lQy4O0qpooEgwGD+GS4qSWBOk3bNYj4=;
 b=tp5Y9zEwPAgMKaGIN25gZhRbwBXPoLfw+nAg4r2A4QKsygZ7duZlw1yaMvTwd2i52qbBjtXVW
 rrZsKsVN0/WAVPtFe7+WGV1ioEL3JL90t8FvWXmmL5p6wS1HoU5B7BF
X-Developer-Key: i=vpernami@qti.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=69847246 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=YSi5vx8Vv47Z1plTbMMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 39K92bdvPWKWcKxS_mbO0wIIL9ipHOvI
X-Proofpoint-GUID: 39K92bdvPWKWcKxS_mbO0wIIL9ipHOvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA3NyBTYWx0ZWRfX4gnSL/APrUE2
 RMz84fOemhf/hDptwo4ICpFnnYsBm1RkgZZ/Yko79nW7rVgrGwC8CLsa8MenyX2PKVU8d+Hh6FG
 /7JZuGbgDCsiPyvB07uYGareoBqCEW6W8ejViXxbiupQ9qv/m0vExbzA7A5hWiiYREh4mTJwYcd
 gsLUmbj8LkfgKuYCdoH5sdFwzizgkJLcFuZagrLKkMT091S1Ul4SRMq1ZonbTql5+uZgvtI9ltV
 bPlj9n8Urip8NNwoTP5urmxwGuolrcJru12AL8NofxkpTArxb+G3DssdZh6tLfzbgzqmr+nVm+Q
 /ZyLSrRpa2DwGySYzlBHYxbsAi+ti+9S0LhnrhZSmWLO/RVMNDV+i7pB9lwdtqcNX6xCBerlQ77
 bpof+yYlCCpQTm1CDu96TfnrFtpRdh2OagrORyi3L02k65/fQex19udTFQL2gG3SN31bSLp1qJX
 TNW4K9iOoDmhsOSmNcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91899-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.pernamitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E795EF15C7
X-Rspamd-Action: no action

Add support to configure a new client as Ethernet type over MHI
by setting "mhi_device_info.ethernet_if = true". Create a new
Ethernet interface named eth%d. This complements existing NET
driver support.

Introduce IP_SW1, ETH0, and ETH1 network interfaces required
for M-plane, NETCONF, and S-plane components.

M-plane:
Implement DU M-Plane software for non-real-time O-RAN
management between O-DU and O-RU using NETCONF/YANG and
O-RAN WG4 M-Plane YANG models. Provide capability exchange,
configuration management, performance monitoring, and fault
management per O-RAN.WG4.TS.MP.0-R004-v18.00.

YANG model based interface aligned with O-RAN WG4 M-Plane
specifications over TCP between the OAM application on the
host and the DU M-Plane software running on the X100 platform.

Netconf:
Use NETCONF protocol for configuration operations such as
fetching, modifying, and deleting network device
configurations.

This interface is used for IETF Netconf communication,
enabling a Netconf server on the ORU to interact with a
Netconf client running on the host.

S-plane:
Support frequency and time synchronization between O-DUs and
O-RUs using Synchronous Ethernet and IEEE 1588. Assume PTP
transport over L2 Ethernet (ITU-T G.8275.1) for full timing
support; allow PTP over UDP/IP (ITU-T G.8275.2) with reduced
reliability, as per ORAN spec O-RAN.WG4.CUS.0-R003-v12.00.

To support accurate phase and time synchronization between
the host (L2) and device (L1-High), the system must exchange
PTP messages as raw Layer-2 Ethernet frames, because the
ITU-T G.8275.1 profile operates strictly over Ethernet
multicast and not over IP networks. This means the device’s
PTP stack can only send and receive PTP Announce, Sync,
Follow-Up, and Delay messages in native Ethernet format, not
as IPv4/IPv6 packets. However, the host and device communicate
only through MHI/PCIe, which provides no native Ethernet
interface. Therefore, the system must implement a virtual
Ethernet interface over MHI on both sides. This virtual
Layer-2 link enables true Ethernet-frame transport, ensuring
the device’s PTP implementation remains fully compliant with
the G.8275.1 Ethernet-based timing model.

The actual link between the device (QDU100) and the host is
PCIe/MHI. The device has the Ethernet interface and is exposed
as the MHI channel to the host. So this patch creates the
Ethernet interface on the host based on the 'IP_ETH' channel
so that the host can use this interface for exchanging the
NETCONF packets.

The patch primarily addresses host-to-DU(QDU100) communication.
However, the NETCONF/M-Plane packets originating from the host
will eventually be transmitted from the DU to the RU over the
fronthaul, which uses Ethernet. For additional details on this
architecture and data flow, refer to the O-RAN Management
Plane Specification:

O-RAN.WG4.MP.0-v07.00
O-RAN Alliance Working Group 4 – Management Plane
Specification
Chapter 4: O-RU to O-DU Interface Management

Signed-off-by: Vivek Pernamitta <vpernami@qti.qualcomm.com>
---
patchset link for V6 : https://lore.kernel.org/all/20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com/
patchset link for V1 (first post) : https://lore.kernel.org/all/20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com/

changes to v7:
- Updated to NET_NAME_ENUM while allocating netdev as per Andrew
- Updated more information as per comments from Jakub and Mani

changes to v6:
- Removed interm variable useage as per comments from Simon and Dmirty.
- Squashed gerrits 1 and 2 in single gerrit.
- Added more description for M-plane, Netconf and S-plane.

changes to v5:
- change in email ID from "quic_vpernami@quicinc.com" to "vivek.pernamitta@oss.qualcomm.com"
- Renamed to patch v5 as per comments from Manivannan
- Restored to original name as per comments from Jakub
- Renamed the ethernet interfce to eth%d as per Jakub
---

---
Vivek Pernamitta (2):
      net: mhi: Enable Ethernet interface support
      bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for QDU100

 drivers/bus/mhi/host/pci_generic.c |  8 ++++
 drivers/net/mhi_net.c              | 75 +++++++++++++++++++++++++++++++-------
 2 files changed, 70 insertions(+), 13 deletions(-)
---
base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
change-id: 20260205-eth_vdev_next-20260204_eth-807136ad5cd0

Best regards,
-- 
Vivek Pernamitta <vpernami@qti.qualcomm.com>


