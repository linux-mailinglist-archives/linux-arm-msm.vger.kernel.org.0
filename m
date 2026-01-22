Return-Path: <linux-arm-msm+bounces-90118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOIHBlTXcWk+MgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:52:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B41DB62ACB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5E4363814AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB8C3B8BAA;
	Thu, 22 Jan 2026 07:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPyfvjzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqFavM5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA0D313551
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067934; cv=none; b=IFLZG1Bqx0WMkzjewc3ky/kL8LVp2XK31NG70l6ngTHdIcGj9gZZyfE1ZkrCPmlyW3uEFrXTtLNrohQxt4YUxZPKXUvF716ZfrUgyHA9tg2nl4mpSFhGTyG+WVJWhDaL1toLUJdowpUL3KYqoliRNeY2NLrQiRsANbfV9vbafqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067934; c=relaxed/simple;
	bh=PMstPFg1QN7a4XoG9VnKG/9ifAd+dRDq/L+1XKm6iRc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O76DsZK0yJKk6wPTeOiy3L00808LHM6IqXV27mYCRb8iUC5tPkReNFxLvqLApgjX/uDPfW4wZzwWPraD0ZYakdBXMt6x3h1ZsPwh41kH8BzGXn9hmXBROV8LpmG4F8crSUopAWJhwrzn8D2XI6mitnRZCo5SAIHtjNn23KPfFcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPyfvjzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqFavM5H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LNVxS0645951
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6lhG8ds9fGZW56ZjCR5UpZ
	AcAwZrWWFB1JgpuJ3VisA=; b=LPyfvjzV+L6BqiC08W89GS54332xskpIvGSV0y
	ACCzFGBpHZcX67gke9KbCte13YJcs8XKmjfsXPJo/6UzfZTQK2oiOYF5/SY9oOkU
	7klSDmkxSYqpSi6pzMrOwGRhApijVy1b+aMTimxZvvXk9yf+KAcqhW0wmOzxlHgM
	0dRO5CGBejcugzSDkYMnlwjhw1/0I+bI7izT36ALHQRZMgCseX53nDwKCykfPqvA
	F2eEtfTguqIiYvJ5yyDKonYV7+1SheYoUUN7mAB3ivewwSTjs5W2Ww+6sK2sEYlz
	ylgAUc0A/K9wSW7zh+zrDzFeBT4xjBKMBCRPjCpKYdeB+Ilg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu8j9s733-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:45:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b724ff60e6so596931eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 23:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769067926; x=1769672726; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lhG8ds9fGZW56ZjCR5UpZAcAwZrWWFB1JgpuJ3VisA=;
        b=DqFavM5HYU851FOd1rWWPO0TOzlX7oRQZxcvzS2UipF0QvwtGAx0aGo8RoB75x9oVG
         c7xjuDiK5w/Q+HVJ1nMwQV3NySp3XkHoZbM9L5XfWjnJsdnEvtIkkeEUCNleTJ3mJS/V
         r/N5Ea/j/KH8bHEb3kkT8yB3x90b6giGUNS3TEEYYPmm1Jtj/48OsCpqDeUTk6O3UDYt
         jwP4vQODxQ1Hsyyqahu7GQ39zWhQwNkFBZByEnj9VgXHEJAdc4fdLRZJOKVnCkhR+jge
         n9A5i2C56j/8IBp+NrD/Skpg6L1jIOGy/+FOSkYNGeP3sCzaaf8D03raKhzdjdmPoC59
         CC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067926; x=1769672726;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lhG8ds9fGZW56ZjCR5UpZAcAwZrWWFB1JgpuJ3VisA=;
        b=RTW9vpQgXhA7Orik+lmdlHI0ByaEHI54kHfOTNfPiQ+6H3f6FTK7I7MdIU7MbWDPE7
         uvyQ61wgd3JLLXkVfoFHMqniHA1s2MN1iXrwcauJ49zlzCMQnbFdqo6op7TgZCBkEtLL
         rwmTrbuiTGMsayV18U+lN475t5O1DQEJhSuiWRHQ9zhX3YK7iY7nVHoDjzZ3F+3VFQ3A
         JiqPT5esTSRdxTYxKxcgBGHWyyhzbJHEJYDMRJPs7t1hd0qLyXUrYKKOWJ5NzGbISRrb
         iAmf6xRyy4/7TxfY622Is/D4VjO1hmBgK4Bqhi8wO5jHtaErLg8oru3VzkDReKQjfSOV
         JpoA==
X-Forwarded-Encrypted: i=1; AJvYcCWcKBbLxf8BTMVmx4iOTZzRrcPHd+aBFR+RRsaj3Vt3rCj7VA4ci0VFJb1Fc+fHDQxsHPO/Wav8ZRUsRin9@vger.kernel.org
X-Gm-Message-State: AOJu0YyzDEsOrboH/USVgflDzbM7BW6LAfKSI34SGk8krJw7lnQc7GYq
	GHq3QZ3UV+sxatOhzz0dyNPl6Go9eCcQ8A00O7aj3+9MzToz2X731RC6Sj9eujVA3GtDKj1NEjQ
	qE86vXC8Q7jfsCVMD3JoK4jY7chAM8cR2K8CWc70QrzVrVTdo3JdvHb41rcnL0SQBW4Je
X-Gm-Gg: AZuq6aIYdna8Pe2jYiyzGVKXFHCgL9NL7EKNAFxPxeZyKCYT6TmdFH6JrmFA57QTDKV
	SaJJ2KbgSUV+Kz0hlTHS9JAKSNYh21OSCzLKMtOswK0tsWoFCQ0Hv5YJn7G5KAKX7HS0SQN0ofq
	BmPH4/Qi5aguiOz6T/buiUKCBs8luc3cNGOG/1JcEly6VITATvxBQdzumJn6kDBvZl8lcpzl/yD
	bpR8OZUmcDDThpknaW0MsSCa733boRzwG7EosxpIFKMZD5+UMaa5efi7qNrxPvRBVG6m6vCVFs/
	XqJx2/hCxEJ3ctYWzFm5IhuzAcAEjf9Dd+n+hBriMrwT3RlFVlSh1txs7M4Uy0RAE8m7SQWrmvK
	Sct2OMZv0JI7demSh+r1uzdnTsQhv8FdV0xFhsKWNtKTI5BCuL36dg820
X-Received: by 2002:a05:7300:1489:b0:2a4:7b58:1a25 with SMTP id 5a478bee46e88-2b6fd7905c1mr5388088eec.27.1769067926046;
        Wed, 21 Jan 2026 23:45:26 -0800 (PST)
X-Received: by 2002:a05:7300:1489:b0:2a4:7b58:1a25 with SMTP id 5a478bee46e88-2b6fd7905c1mr5388071eec.27.1769067925498;
        Wed, 21 Jan 2026 23:45:25 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36550dfsm24875278eec.25.2026.01.21.23.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:45:24 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH 0/2] PCI: dwc: Code clean up and formatting improvements
Date: Wed, 21 Jan 2026 23:45:17 -0800
Message-Id: <20260121-remove_cap_clean_up-v1-0-e78115e5d467@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI3VcWkC/x3MQQqAIBBA0avErBNUsKirRIjZVAOloiRBePek5
 Vv8/0LCSJhgbF6ImCmRdxWibcAexu3IaK0GyWXHhRQs4uUzamuCticap+/Ahp4vHbebGpSBWoa
 IGz3/dZpL+QCjpR2iZQAAAA==
X-Change-ID: 20260121-remove_cap_clean_up-970b60cf595a
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769067924; l=1237;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=PMstPFg1QN7a4XoG9VnKG/9ifAd+dRDq/L+1XKm6iRc=;
 b=nyhpBvhNqaf9xnsUAmzmG2COrkUEmNi7pENUEklDiiz7lSmjc85aMlR7DpjlEt2akzqVKqUAa
 FcWoLbmSjbVBIR07L1gLfICrCsXmhDDued2jLqJZH6fDIn1z+pfIlo1
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: t83M8nS8fF7D8TkUTYOlT-UWYOj2Gqe7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA1MCBTYWx0ZWRfXz6mWj+Yqk0vz
 roLPAlyZgfY0pEdkO6DVErLBGIscxoICiz3psoqmXjPhYU59VkZFYChX2dSd5twzw8ZBDm13QKf
 ItGGopX4SW7seLYwPShy3npSx7Evl+lz6xmhGPxU7wWF1O+JVOWQUZ2+MwhADYJsOwJfRJC1qg2
 TX4yNJUF0h5g/DX0p2AQBSBtvJWBDjRc9OtQ+MbGaJH8KAVMz/puyf5Ux5dhoFeJycNNrYB9zSP
 chcpPGUDqA7cIhtR2p6tQlKccagR7FbQcSAyrKMog4+XAN9ZegnIUFWTEiBPk+boLgMEF9sCQ5t
 kc5yChjDOCK31I+76J6fINmzWlZixvB6dggjNgTW5twUhXYwXZgv1ZMAcK8x+MQIrC6+2PadHkd
 uwKRyWzOPDabIPaxexeXDX6ksnKgUiUIWLmu0v9lZ6DsrtQKO8PdpMxS7kdKwvPGYmW0qZ3uSQF
 v7Lq/G5IYajaW4R69uA==
X-Authority-Analysis: v=2.4 cv=U4CfzOru c=1 sm=1 tr=0 ts=6971d596 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=y6s2foKJdXeFtfApewsA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: t83M8nS8fF7D8TkUTYOlT-UWYOj2Gqe7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	TAGGED_FROM(0.00)[bounces-90118-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B41DB62ACB
X-Rspamd-Action: no action

This series contains two cleanup patches for the PCI DWC subsystem that
improve code readability and maintainability without any functional
changes.

The first patch addresses a naming issue where the "has_msi_ctrl" flag
name was misleading. The flag specifically indicates when a platform uses
the iMSI-RX module for MSI handling, rather than having any generic MSI
controller. Renaming it to "uses_imsi_rx" makes the code's intent much
clearer.

The second patch fixes a grammatical error and improves code formatting.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (2):
      PCI: dwc: Fix grammar and formatting in dw_pcie_remove_ext_capability()
      PCI: dwc: Rename has_msi_ctrl to uses_imsi_rx for clarity

 drivers/pci/controller/dwc/pcie-designware-host.c | 16 ++++++++--------
 drivers/pci/controller/dwc/pcie-designware.c      |  3 ++-
 drivers/pci/controller/dwc/pcie-designware.h      |  2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            |  4 ++--
 4 files changed, 13 insertions(+), 12 deletions(-)
---
base-commit: 86291f774fe8524178446cb2c792939640b4970c
change-id: 20260121-remove_cap_clean_up-970b60cf595a

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


