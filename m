Return-Path: <linux-arm-msm+bounces-111746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zGx0JV58JmoPXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:25:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F812653FF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:25:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L5IYjcic;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="cNlEh/aT";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111746-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111746-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80BEC3017517
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEB03A16BD;
	Mon,  8 Jun 2026 08:24:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EF123C503
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:24:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907045; cv=none; b=ZNp0j6laQ1jw3wRGsqJxScmwrwTHmCpOm4Ed0I7nw/SGA2RfEuH/PokUoXxz6BvyADw9Hf2S6zQkOq2AEFI9q+sMcNLDfeSD4KnRs29j5OLxEryj2h4ERofz1rJVdLzcZm/KrvIxVqqa9r+kMpYfARXRmTTmOC/p+nxQ0xdI1qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907045; c=relaxed/simple;
	bh=NeXDZ+l+JJOWjDiSzO/ouNpuHT816nQEkyTDUBw4+ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rJLAu5snripnI3n0dYVM//xp2EWOqjcRAfD6pDmWFjqA7Fguit5nHJozi4wYOtqUGAJU6uXTpqUciUNKXfLgYLwo1VugdF1gQ/pYxOgH57n5ka5eZdYy7KBR+A/9Le9Zjj7hEFXRNkW4e1lclH1aEU03W6o8it19NX5xrIyne60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5IYjcic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNlEh/aT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586P7Ip2386295
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+qPb7tQoDg6x3IwcPqytJEZquxNNbm3/xWq
	C4VJA8Y4=; b=L5IYjcicDCToKBPKpddWxExvSaynrHV5RWrmVXPDeuXuvhTG8sh
	l0dtG5S/6UYTNbF4FsVWcs4DkD3+pt3FC4sLct0D1JJdx2YrxQLQZvtK9QlawYi5
	Jlk74Jnhq1cRW/quG0WWyom0OB/KfcC8Fy5TXX3CzZMGGW5WOi/eWjk+K2hPHwwg
	PcMuSAXu/jVTfjl2rbR4feCkjOfZ5/H2esF+Zskqqemc7SgaKqt7vng/LKiaZlPc
	/MY7QgkEBNlfIFWZ6ypmOLWbqpAloY5mxv4kITu4SpuxLQc3q/sr14jKSBlb3qjG
	wlt3Gbv63XUmu9fBM1be6Ldu9RyojA5M4nw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1enmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:24:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d8613efbso3870003eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907043; x=1781511843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+qPb7tQoDg6x3IwcPqytJEZquxNNbm3/xWqC4VJA8Y4=;
        b=cNlEh/aT9GrNPJcgcheX1HQxtkhKuyqVRF5n6ukQPtjFj9rtLkNx/kJHMIBSMKGDg5
         hapKXogMNPEDsDXO6PjqHinoRUwT6rte9Fmml4nhs0LsPS49TEXG/ylsr1w+JEGjIhQc
         nT4lmdcXKInwmToeiWdZIrJ3Se9xGN3k4bdJfGYQHf4OVeK3ZDklBw5mSbNSqBgrjw6n
         juS7f3qjFOUUHcOb08GwpELQvcYDkifDOJxB7TJRbLsL/TRcdWMj9/Ri1FQjVrWHatAE
         K736z0V8QrSzN4ItE0wYrjaLlj0T+QkhdRfQBfkubdHdjJDDOhGoE7oA8vVAGEY+J+bF
         KMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907043; x=1781511843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qPb7tQoDg6x3IwcPqytJEZquxNNbm3/xWqC4VJA8Y4=;
        b=A/SOgpG1VZ2V2vvyOxU2dB6UWXlLf1M2eX7tNp5QR/hOu5q0d5iXScu7OZI/v/s6iU
         g1H1cHRN98KAXQwZo3FtpWIKdyhtbkm5Vl9SoJKyUQw9ocv4R48UxYO88TrU0I83cx0S
         oq+F7BetLG/0lcwMhNxq4YI+/s3KUcUE8MvTdCbdKic84elUMGbqxktrLABncQqtwaXy
         pp61005NbUmbUw6KLRnw0BCvCHzqo8Ddk2wNuM/t0ANn+vAIxTWTkzUp43k/XwHQKON/
         qX3wA3BDqwoLCuvI1opdtJYkQ547CtzWbikf69/LRpaWRxD9cuXI+UL8lZLZhQVFPWrl
         Mv7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9dULXpZoVL2RKTZoB8Cx4qB87I564QGRjMLFyXVOu3K2+sRRlv7B7TUNzFSOKGyh7rzreZ+XblFXLlq75z@vger.kernel.org
X-Gm-Message-State: AOJu0YwmEIxHD1wSFKc69wgfQMDd7wVqi4eldOqS10mS4h7RVWhG38Sw
	eopgqWCF1G9ZmzcC8WX4SBxqhKXNy3F0nyHVrWheMibuhBKF89JpHZCu3uXE+5/ZBWlKoBXW4CO
	sOwy9oOAdMHXcJZ9tSSGMjwhEAr75DIix9c7FbYUJOWJwDvva6a22DP5x5xOqlyH8mcrk
X-Gm-Gg: Acq92OFxhTXVfPBYZpZYukZcCKFvD+xcbKPOWTqDWRxmQlN3uqYFCivvPnM0dhBBJTE
	aHnAgA+Vfplg8tIoNAqH7uG6k+xCPmm52ItFkSOlv+bvm9MhHE1KsxLoNDWFijUp1sRHkk5JI6g
	0c9PPr8v0vRpk8xmEHWdIgW8oQSIo5KvBCMa8qRC2g+DAjropTJZkXTGrtF+e+3oj6FCsSzaR+c
	eF11fm92GQcsOLp0tJOqgWsMVRdfI6Fc1D/OfD3BgHoKRUCTxZg4NrMuvkr3n6JqI+tdi+YV+Tx
	weXpWzbxKV2uti0e5M6mafXG/HVymPW0/hWqgKTffVPenmHtYRIv1BBl1AH2iOl/Ddi47xDTVZY
	qXRfyKeNjYObQbBGRuKwl62eyuMA6WEafeIEfm799ZIqvanZSxZDtAIBntumBJnJ0OO1KRIUykE
	LQjmvSfJsmnhlX59xl
X-Received: by 2002:a05:7301:4187:b0:304:acc:f079 with SMTP id 5a478bee46e88-3077b7e2385mr6971274eec.27.1780907042640;
        Mon, 08 Jun 2026 01:24:02 -0700 (PDT)
X-Received: by 2002:a05:7301:4187:b0:304:acc:f079 with SMTP id 5a478bee46e88-3077b7e2385mr6971259eec.27.1780907042125;
        Mon, 08 Jun 2026 01:24:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85e10sm15771014eec.7.2026.06.08.01.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:24:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] platform: arm64: qcom-hamoa-ec: Fix indentation in comment tables
Date: Mon,  8 Jun 2026 16:23:48 +0800
Message-ID: <20260608082348.92575-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NyBTYWx0ZWRfX0X4414VdBW5T
 idsu7OknbipTggPN9matfHckqHFlbBmPJE/orPfMY9+t2qlGG1jLsoZKHWxUt171sexy5HXJ0P1
 wTmekpmoQcsqlDHcQO+ChTdMXsIWYVfEchu+kedTKYwqSq8gzWbHXLETumZd16AIh0PR0JtkcB/
 R+CZTScJBvy6+5HXFQjzRkdgUxlZMeD+k/AgjSeGowPIpip18+vORTzu3C/KkWMHSyAZlbM47IR
 DXFSDQ2+R4YWNuW9hLmVo5QIb8OzmbTIpFQl/2/HbM86d9M3KknNBYokqcuwShTrp00Z97+th7w
 Lz3dasCNelojvf1XNARrCYxxEE0M5yZY1PbN3gTUs4sDGQTHScNYM/xbpdr9ORGOUfAFQ7wiG3Z
 lHFFlkVTr3E98zl2CRSqF2g1a/zGhVa26UNkJiWe7OhvM/llKnfBkBlAHAJfylJew4AxUaOjkYB
 nkSsSgvPq+cPyENThoA==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a267c23 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JXefCyyux0SJYChmvAAA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: G6cweXU6lHgPBxtv2K8co92pIOoKsqxp
X-Proofpoint-GUID: G6cweXU6lHgPBxtv2K8co92pIOoKsqxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111746-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:bryan.odonoghue@linaro.org,m:anvesh.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F812653FF9

With tab=8 (Linux Kernel coding style), there are a couple of lines
misaligned in the comment ASCII tables. Fix indentation for them.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index a018f7bf35d2..89374ab3e600 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -149,7 +149,7 @@ static int qcom_ec_read_fw_version(struct device *dev)
  * | 0x00		| Byte count	| Number of bytes in response		|
  * |			|		| (excluding byte count)		|
  * ------------------------------------------------------------------------------
- * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
+ * | 0x02 (LSB)		| EC Thermal	| Bit 0-1: Number of fans		|
  * | 0x03		| Capabilities	| Bit 2-4: Type of fan			|
  * |			|		| Bit 5-6: Reserved			|
  * |			|		| Bit 7: Data Valid/Invalid		|
@@ -273,7 +273,7 @@ static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsign
  * |			|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
  * |			|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
  * --------------------------------------------------------------------------------------
- * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
+ * | 0x04 (LSB)		| Speed in RPM	| RPM value, if mode selected is RPM		|
  * | 0x05		|		|						|
  * --------------------------------------------------------------------------------------
  * | 0x06		| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
-- 
2.43.0


