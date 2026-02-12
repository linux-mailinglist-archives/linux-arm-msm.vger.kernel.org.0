Return-Path: <linux-arm-msm+bounces-92675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKRAGtqyjWll6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:00:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D81512CC74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92B9B304C616
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C18032B9A6;
	Thu, 12 Feb 2026 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0AmMNPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ff8aliGr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CB82DAFAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770894037; cv=none; b=N/8QWJH55csqdyYwSfFc5B0dqkSFzLslZxY6cYUHjdLZH9MV52MwqjkQvB1u9JJ67U15Z0UOm8WJhg8AOdiJk83+yTw9y3jTya/pn3XgteUObxBTpBdKxbtwd6iaaHgUBjPEs0kYb407zcQwV1ci/6BS9vTSDffltseZrveFZLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770894037; c=relaxed/simple;
	bh=fR/bL8DW8w7719SXkjd06zJ2rT/UFwnxQu3aQzrS/E4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GJdBxHvJ7pXbjNR2RHUK9UsddlEeE0q0om+jW1mpbVhvIb757ro1ZUvTowOldFSgszTEpupm+2Ekldm67/cczdqPuhqKCE7E9BuO4O5+l+pqPmPmSW2aMZtR0+d+OtqBvzwqY69q3g+gmpl2OeiJyNoMSHO9wF0PYvqZRN/RYLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0AmMNPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ff8aliGr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAGvBp3963701
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IT0E+i/X/7kLm33FOBTs5Y
	3poQRTNZiMl1emlGeTKc0=; b=E0AmMNPRPUXpFgNh+qjrCYF+mXyipcE5A3vIuU
	Rg/cr9y/nnzle7sI2vOdpBq8Nm7Qm6A5ucLV/BW70OtK3EX4ORP2DBvpLBIO+UYO
	WHN5x+teVDPCreEWl5MzehE0pOTDAmV4QIQ//kVsfKMYdqLMRmQqCqOj3gZUFP51
	1vr+tcaXBpFh2ZisLdp3KsrcsrsmY6DPJXr9p5JjuKZbqTSxUAHH9ugN/GMPflzh
	nHqUMEHPkaegMxaDUf6zscwJs+sY6a6XOOgYxlUfly0zoWQyYymn0vD/ZgCjwhg3
	2TeDnMLoZVzDWCYTuvWdPOT1p4fbQvvYWaNr0iEN1wd+h2lQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8ntpyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:00:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3568090851aso4711709a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770894033; x=1771498833; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IT0E+i/X/7kLm33FOBTs5Y3poQRTNZiMl1emlGeTKc0=;
        b=Ff8aliGr6vReLBMiSernfeoVWiYuhI5oS6r7oIXN/BFPqdKJbSQ4PhYLHD5iwcpf7B
         /O9nADWEpavcpNnmUDJR293iqW1yz1abInRWUgcwxg0D3X0U9ASFuBDuMaWPk3UQMFeu
         +LJ086OrBKCtZNK84roZJD7a3N7NZuF9EGS+cd85n4EcCMz1UgQqjMI60jZ3Xb93lsxD
         eeyYr38T7LTDV4+LP7iOhR0yHlyhztcVXd+ZQtleiPQab1e8Bu9I37xs0EVEz4Gfn2iA
         c8jHt00rTui2jBKsy5ZBvwPkIS/O1P/PH7zh7pH73RyXn9Un3lcu0AtQYXhxzPSuKbX+
         euLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770894034; x=1771498834;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IT0E+i/X/7kLm33FOBTs5Y3poQRTNZiMl1emlGeTKc0=;
        b=AsYKkZkY1/BTzaP8B9JmPSki5Pqou8Tpc66lEu7vinLV3wyiyKHYyqHyaplGVOVHMJ
         Sr0aZxn2PiLC2YUZRTUi1ArqNq7z/LADb9LtWXzkUIoHIQsoJXAXX1Fujk12ur9oST48
         orJ+e/G3vXGYWAAaJPp7lWrXZSD8GSjHafRMoGrbC4k2vyBogVmtJVTHVCeR0BS5nDdP
         oYxAxPst5mkPPjkwPKUp9h3vRKvW2co8qVINSJqqNYhG7WaMJriNLpKOBk72hK/bxx0Q
         OtLM2oWfJprQpoFYqIkToawp+mub7tGL1VbMnDjAxw9NEq7nguoHq0lySDSxSuIi7DcV
         aN8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVm/yxpnwd9X0uW4TYenifmv6qGAr8GkotY6ibSw73ClzZJ99L5in32OjqKN6eLulvGU1kQCbBgV/+PpUP@vger.kernel.org
X-Gm-Message-State: AOJu0YyqpPiCZ/rMtoe6rSG7sPCaxG7Dza8xAale7pvnjPakY1OkWHUI
	RctW2haUExhZwl2AyJfVCjl75us3cbzpDzFpm7pWOPRzj6pM1fPsaVmaaR/voF63DIT2xriKPL5
	ihkPdHtqfyvrLPWB5I8nR+ZuOqDoGSOMCi43BTKhvhs8KcUxp0iErrUns7BNkEo9BPwoV
X-Gm-Gg: AZuq6aLVSWH8GfxG35SA45OtHwPQuKm08Y6Git8NgXCFhOMzbU2vUsh+0R/ymY1r7/m
	Fq0aviy3G1ZAKMuHRLjf/usw72MGSXIi9arMTc8egkj8SLFSa19W3WMavcKYAR6ZTi0qFkhCMfJ
	rzjJRHgWZQf9i0YY4ZIsTGqSvKMMCdGpLkTrmPxjx6zPj3x9FKVSEaJBPBxWXXPuHZUKn/XhXgH
	RCdGbGp+U5P3FqR+d4NHMQhGbustCqml6d84lNXj+aPTX/7n/jK/RhCql0BnN0PHCOhGgt3imjB
	dVJbiNJP1Iqz6YXR5jzdrPd1HWj7C0a9ywmeXJ+1rQo3mvLDs8cSIKkplNC3u963oiSgxM68BdO
	gKA8JZ4XOMH5ALZiVjQKaDmIuA5EflypKFkMqsh/7TLrEZmtN
X-Received: by 2002:a17:90b:3b46:b0:356:41c2:896f with SMTP id 98e67ed59e1d1-3568f2cc5e5mr2206266a91.7.1770894031805;
        Thu, 12 Feb 2026 03:00:31 -0800 (PST)
X-Received: by 2002:a17:90b:3b46:b0:356:41c2:896f with SMTP id 98e67ed59e1d1-3568f2cc5e5mr2206090a91.7.1770894028604;
        Thu, 12 Feb 2026 03:00:28 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3bd8e6sm4708348b3a.14.2026.02.12.03.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 03:00:27 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta <vpernami@qti.qualcomm.com>
Subject: [PATCH v8 0/2] net: mhi: Add support to enable ethernet interface
Date: Thu, 12 Feb 2026 16:30:21 +0530
Message-Id: <20260212-eth_vdev_next-20260211-v8-0-0974b3a8d61b@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMWyjWkC/y2MXQqAIBAGrxL7nJAbhXSViOjnq/bFQkUC6e5J9
 DgDM4k8nMBTVyRyiOLltBlMWdByTHaHkjUzccVtxZoVwjHGFXG0uIP6tVbzYmqwabe5Ycrx5bD
 J/Y374Xlew3fcWWgAAAA=
X-Change-ID: 20260212-eth_vdev_next-20260211-bc83e286fb52
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770894024; l=5705;
 i=vpernami@qti.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=fR/bL8DW8w7719SXkjd06zJ2rT/UFwnxQu3aQzrS/E4=;
 b=gURkiOMf8DdO4v1fPTIncFv1RdaIC9dwnnrfu+Vf5zRIDNfL0aVdToooSu5BOM+4Ssc5tw36r
 eK34ORtv7jXAAPeHp3GuKaHWzmFERoHJytT6uoLc8uXZ0QGv4t3H6a4
X-Developer-Key: i=vpernami@qti.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4MSBTYWx0ZWRfX2Jzl4Ik/h8ie
 dAurU3FQc9FrOMrEjteC61Knc4DmTHRQXsCEwZS/qQ7cqdnQFofe44uZezO+ECbtbqyKa+lVP47
 jnkTWu/xb9PVQst+2EXm3Kn5NR/x8kMeWBAs0088h5PKprWOYTd6IyRBBRYJXCdCjxAWlnglqVi
 IL6EFM4+DHZebs0MypBsXMw3donglruS8iygULjdshJOz4TmJKavhnHO12ptwxEz2FKkmJ3MAB0
 P+bir+HJhyQy1n3CQfZc2wcQdaYXwEPOyD3blmoGHHkc1NL30OTMtaUYNSB1rubPD8CuRz2wSl+
 mnJgqKBlZ7AjuVeqWv/HJuuSuEHJwFJfVM24CmP6IGYK9J0QpmJOAeRSuLo1k2i7D/eg8D8cHRz
 Iz9ixwRkFrR89GWgLgay1dsr3hm6vmb8MsWSKTSpkUudmY+lS9tdlmpluJNaooCr+Bvgq66yjxx
 hTz+Pi7Z9VTMbXywX+g==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698db2d2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=8SqqAd8AVnWKc5cE22EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gSKzxJY11LbmyvAGR3Z--CNHPyKzo_DB
X-Proofpoint-ORIG-GUID: gSKzxJY11LbmyvAGR3Z--CNHPyKzo_DB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92675-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,qti.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.pernamitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D81512CC74
X-Rspamd-Action: no action

Add support to configure a new client as Ethernet type over MHI
by setting "mhi_device_info.ethernet_if = true". Create a new
Ethernet interface named eth%d. This complements existing NET
driver support.

Enable IP_SW1 (ch:48/49), IP_ETH0 (ch:50,51) and IP_ETH1 (ch:52,
53) channels over MHI for M-plane, NETCONF and S-plane interface
for QDU100.

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

MHI_CHANNEL_CONFIG defines channel attributes for the host
controller to set up channel rings. These entries are part of
the MHI controller’s configuration so that client drivers, such
as the MHI network driver, can attach to them. Each interface is
mapped to an MHI channel (for example, eth0 → IP_ETH0 channels
50/51), which is why this configuration resides in the bus code.

Allocate MHI netdev's using NET_NAME_ENUM to reflect kernel-enumerated
naming. This updates the reported name_assign_type for MHI net
interfaces created by this driver, aligning naming semantics across
existing and new devices. No functional or interface naming changes
are introduced.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
patchset link for V7 : https://lore.kernel.org/all/20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com/
patchset link for V6 : https://lore.kernel.org/all/20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com/
patchset link for V1 (first post) : https://lore.kernel.org/all/20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com/

changes to v8:
- Removed skb_copy_to_linear_data call as it is not needed, updated
  as per Loic Poulain and Paolo Abeni.
- Removed ethernet_if member in struct mhi_net_dev instead used
  !!ndev->header_ops check for ethernet protocol as per paolo Abeni.
- Updated more infromation in commit text for change from
  NET_NAME_PREDICTABLE to NET_NAME_ENUM.

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

 drivers/bus/mhi/host/pci_generic.c |  8 +++++
 drivers/net/mhi_net.c              | 67 +++++++++++++++++++++++++++++++-------
 2 files changed, 64 insertions(+), 11 deletions(-)
---
base-commit: 9152bc8cebcb14dc16b03ec81f2377ee8ce12268
change-id: 20260212-eth_vdev_next-20260211-bc83e286fb52

Best regards,
-- 
Vivek Pernamitta <vpernami@qti.qualcomm.com>


