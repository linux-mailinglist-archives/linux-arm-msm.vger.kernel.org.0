Return-Path: <linux-arm-msm+bounces-117877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wEMTEIhOT2oleAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:32:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9CC72DBC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:32:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NU8u7XOq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CK3Bd+48;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117877-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117877-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FDD930797A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1363DEACE;
	Thu,  9 Jul 2026 07:30:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E5F3E1204
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:29:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582202; cv=none; b=B9ynvj3PxsRuZ/fSq+o1tViemtf6N/LSVkwMWLYrFUNqLv5Q+B8TA6fa/enfxTc91xhXDapl8JEuIti1nY+2oAuQQ5PBYWCvcq3LVJ0b58NdVH1xmjhKq/uc1gvNaX4sCjOTCVtYPbQu5jRP1+TQleHpeYkbLFwL2UkmliARfg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582202; c=relaxed/simple;
	bh=CQuF6r98MUyoHzeESCnsTSPvCQtraJDtOi9/MqYC/aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PplXqytE3NuxXOonATnrIXqRIsiKzPdaRnMIZvyLJWENsfJ2SCgXy0mUpviUyIPEMpAdKvmP+j4JgH7AuNRuVxLiO12SNX001Lkke9nzlpWoKMA/oXnspUlZBdpxOlSyPgFcpKRT4bR2If89lxhIANNERITisaIah82Pa5XGFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NU8u7XOq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CK3Bd+48; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6696khqR1020696
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+5XJP2Be7eav9Tuhpcp9P69piQCiwgmJ1NEddpNBnxk=; b=NU8u7XOqoLnceupP
	5biCqB18flB9yeri51HNrvfJXfCfRDC8/GLbdYrN+S0VlJIxjemOTVeQvDHm8uir
	Ae1uLE6AQI6pHMTcoN4PB1hlGnnjip25U//FOMSJhhZ+l/t4DCBumflcYEcQGGbx
	MXMa8S6o77P/KkNmX65/ZNFeiAtvVN2fvb97GY8iXwt8pG+OM0Z5hIVlCuv2lmWC
	nvWUSn2aoCkphQOLci5olvSForDwyCRHWAeRVsnYjr9LJrz23VQ9fO+CnMLlGGsw
	BdfJAhsCRWiIemiXRmbk4tVbAdJCcVvJV8iP9AdjiNmu2Lu1BIlCtenAJEhxolCb
	DRawgg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3r5m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:29:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8477d84264bso438499b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582198; x=1784186998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5XJP2Be7eav9Tuhpcp9P69piQCiwgmJ1NEddpNBnxk=;
        b=CK3Bd+48tWjPBQGpIpMMlqxtLaqqTq5C/XD/iCa+ZwQ758W/WzX5/IymNrhRM0IXJm
         kirrqM9hdef/RsBJcmdW3z9zPpPu/06C7vQqyoGx8676P22/jn8DwMVHMgmzMT7IeR77
         yXgsMGoyd9cHJcUEMNS+Q/8xxwjXBIqeMNzxHGtBWkzMhLw+TNu3kY4NLSLnFJim2S2Z
         qeXaUtf1ZbXp1Lb9EydEI9cdkJCjl7X2Wd3DcWpyl5zryvVW+f6wRzy1o4y3LmyftmNI
         Lv46piz03N++1X+WFKooevU1TEU16A29msRD8tIJ0qKRqQMYo1018/Y2oNJMgaNlbivZ
         MmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582198; x=1784186998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5XJP2Be7eav9Tuhpcp9P69piQCiwgmJ1NEddpNBnxk=;
        b=EttO7R1rsIdvTOxOiAzvFH1IEEojf8SzV6uVZdzCkHhyk6Ov/aMFzYaFZkV8T5KxFU
         JQW5JOakveDpQShOlx1FeGzOlfB7feE4yMtMWE1KpPQe/SShOG5zgCWpsJ04EoQydR2O
         V5ol0dsYTXel6yBcKUabh45lC1lzpsjykOB1e71L8Ni/4lbfuyonT7ybRa67VX7cU22y
         1N90PcxPuYPDMxODhSgMSO42LX2flgu+tpSygj7ZTp34/BnCh3RModkB8yMNebwnVls8
         RK+jF9X0qxbSpobU7BLYYBl7Uhx/osttcs2tKvcrYB5sRr4kIueVOzQ9UM74FtSxfbDr
         7Jbg==
X-Gm-Message-State: AOJu0Yy5V4jkOXUqLL0POKKd4Vir5J0KGJet1GgvRQ6lvHUatf6sCrjQ
	pTgSAOd/Z2+BmzrV9LrSppGBU/baEMK0gumI3ePw0SJ4vUwFvPSrTt0Vr/lo3OTKzLddWCcX9UA
	mPIB8VX2jEYs7OwaXx45cJ9LPj6tivKKlVA4tEfe04JMqF9WpukivmxGaesn23Ksh9fY1yICTzD
	R6XrE=
X-Gm-Gg: AfdE7cn1bxfZx948v3ZqJpr9rVJ9lA2USlEYkVxn7akbPEhJvvEwSP1mTlX/d6x3k9D
	pY7uSBBVSWHPP4hHqm0y/Lyt9rl6cV7dt0UX5SKz36SQwSo08lcGxZMG0yI3QgBdkHfX2YwvrIJ
	ugi8YbY8p72OMEIpclVs4clPdtkOJMsZ9eCXC8BWhXNxKou9pKDMXfrcYkljdHz1dDplr0+R7Ni
	tSI6+dhz0Or/qkutCsV4+rU4uoPDE+hpn88NN7RaPJzIUOxxYvUGiR0dbwamX7iq5UcH8fv1+hL
	ddAwVZcVkraLl4vicA+kfU7P4rbtjQsTnpRCnj/FMFmDIMD3Zfi7WI2HidBqIRYxRnPpVON/wXX
	8DrgMbmK2VU5eEg3WpleDgSAoQcLFzSChnuS2JDiplIErTi1dhW3kRGmwuGmQtQ==
X-Received: by 2002:a05:6a00:b8f:b0:845:328c:1ed3 with SMTP id d2e1a72fcca58-848560608e8mr2014121b3a.7.1783582198273;
        Thu, 09 Jul 2026 00:29:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:b8f:b0:845:328c:1ed3 with SMTP id d2e1a72fcca58-848560608e8mr2014092b3a.7.1783582197789;
        Thu, 09 Jul 2026 00:29:57 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d53sm8167222b3a.38.2026.07.09.00.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:29:57 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 12:59:42 +0530
Subject: [PATCH 3/3] power: sequencing: pcie-m2: Deassert W_DISABLE2# when
 no UART serdev is created
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-fix-hamoa-m2-w-disable2-v1-3-5e725091266a@oss.qualcomm.com>
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>,
        mengshi.wu@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: WOa15bujw6h1KMud497y2FM_qr4AapYz
X-Proofpoint-GUID: WOa15bujw6h1KMud497y2FM_qr4AapYz
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f4df6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Rd_Q6lwWc_OclDomn9YA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfXx5FIRMULXQY3
 LpwSsBL1t7Njbx8Ez7LQPPHUI/CS4uZVt/eoWrpgrM+pHPSPWpqodvm8EazZdeAB9g4Ue4AS34l
 f1uTjKsGS5BCl7PRemHw48mpYFrhBsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX8f4fICWE47Jy
 cXNgxl1RTe4c1fLTZgG6GkibbN61oLaGG+aCyMGQR+HEWfXaTucLFsuBsuhGkoKyBCOrwHeDlPE
 YNJ5AoTexm6iR+j/qj59FH7zyBi/pVgQCh6Cao5WvAOpxPJkFvrWLbnMPvnYGGi7+EBExQ0zAxP
 Grm878e58GtBoQO5lKNr/WROBgyCbDGOP8tMtPZJ7NovdWJe5SbmN+ekg+xGRwa8HMWwI4DPsow
 0dAFhj1H5r8EKELPYJojX7os0tB0yRda0WNnMEc7YQqPb7lCQ1yFt5jVWQ2N88UeKP+I6C093r3
 CpzDPH32we4wsNcCToPLto6LMW/E6T8L1NG/BNstEdaKtJF7fxeRuMj90z8juUH/c55jFHoOZw/
 /qL+J9wlA0IE8p6QcHEKlmhp6sVyfG3lmeBX7nwPV20F1bzMmVuU6tYfiIP8FezhaODqPUT5fWA
 g39cP5ULp0OWf7EoWiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117877-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:wei.deng@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A9CC72DBC4

The pwrseq_m2_pci_ids[] table lists PCIe BT devices that use UART as the
BT transport and need a UART serdev created by the driver. When a PCIe
device under the M.2 connector does not match any entry in this table,
no UART serdev is created.

However, the BT subsystem of such a device may still require W_DISABLE2#
to be deasserted to power up. Rather than adding every possible non-UART
BT device ID to the table, add an else branch that deasserts W_DISABLE2#
whenever a PCIe device is detected under the connector but does not match
a UART BT entry. This allows any BT interface on the card (USB or other)
to enumerate without requiring explicit knowledge of its device ID.

The primary use case is USB BT variants of combo chips that share the
same PCIe device ID as their UART counterpart (e.g. WCN7851 NCM865 USB,
sub 0x3378, vs NCM865A UART, sub 0x337c): no UART serdev is needed, but
W_DISABLE2# must be deasserted so the USB BT device can enumerate.

Reassert W_DISABLE2# symmetrically when the PCIe device is removed.

Validated on Hamoa EVK (IQ-X7181-EVK) with WCN7851 NCM865 USB card
(sub 0x3378): without this change GPIO116 (W_DISABLE2#) stays low and
no BT interface appears; with this change GPIO116 is driven high and the
USB BT device enumerates and comes up via btusb.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 33 +++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index cf51122d54fd..06eb5eb0676b 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -401,11 +401,23 @@ static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action
 			ret = pwrseq_pcie_m2_create_serdev_one(ctx, pdev);
 			if (ret)
 				return notifier_from_errno(ret);
+		} else if (ctx->w_disable2_gpio) {
+			/*
+			 * PCIe device not in the UART BT table. This covers
+			 * USB BT variants of the same combo chip (same PCIe
+			 * device ID, different sub-system ID, BT exposed over
+			 * USB instead of UART). No UART serdev is needed, but
+			 * W_DISABLE2# must be deasserted to enable the BT
+			 * subsystem so the USB BT interface can enumerate.
+			 */
+			gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
 		}
 		break;
 	case BUS_NOTIFY_REMOVED_DEVICE:
 		if (pci_match_id(pwrseq_m2_pci_ids, pdev))
 			pwrseq_pcie_m2_remove_serdev(ctx, pdev);
+		else if (ctx->w_disable2_gpio)
+			gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 
 		break;
 	}
@@ -469,16 +481,17 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
 		if (!pdev->dev.parent || pci_parent != pdev->dev.parent->of_node)
 			continue;
 
-		if (!pci_match_id(pwrseq_m2_pci_ids, pdev))
-			continue;
-
-		ret = pwrseq_pcie_m2_create_serdev_one(ctx, pdev);
-		if (ret) {
-			dev_err_probe(ctx->dev, ret,
-				      "Failed to create serdev for PCI device (%s)\n",
-				      pci_name(pdev));
-			pci_dev_put(pdev);
-			goto err_remove_serdev;
+		if (pci_match_id(pwrseq_m2_pci_ids, pdev)) {
+			ret = pwrseq_pcie_m2_create_serdev_one(ctx, pdev);
+			if (ret) {
+				dev_err_probe(ctx->dev, ret,
+					      "Failed to create serdev for PCI device (%s)\n",
+					      pci_name(pdev));
+				pci_dev_put(pdev);
+				goto err_remove_serdev;
+			}
+		} else if (ctx->w_disable2_gpio) {
+			gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
 		}
 	}
 

-- 
2.34.1


