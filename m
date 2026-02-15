Return-Path: <linux-arm-msm+bounces-92869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBIIJYwRkmm/qAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:33:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDF613F667
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A97043016CAC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 18:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4EC239567;
	Sun, 15 Feb 2026 18:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzOlScUQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sb1vqEiw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F926A8D2
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771180421; cv=none; b=XvDmT2CxtAA26CEG7orhD5wxWR7qH69kWM3gbFocdyEWIxtFMcxBYJsRYNBQRordNMQ2GaI/dG74OuPW1v3pT+q+bkXQOryUiviuqabEmTzsQ5965ouAac8xWJUDYRZnUicrycCjGFI5H+g+nHKuhLzggrkXS19+4Vi+wBpJcYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771180421; c=relaxed/simple;
	bh=1zQqEUKVytjO3fXoWk9bZkP1zJln3nhYt7OsCSJbvXw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DIvRliC+Ba1+LWj/JmxaDV2JdJFLH4ugNdFcsX8Y22YVFIoA5kayDn5NWaadDuC4rYANA65syKM1XpgCDYQe383U0Qs+hWrIn0jrm5zwoTRbAfEog8QwqGZnl+8eBvLfQsAltBoEWZDS5FCKg7B+4Q8qJUipbUIyzd2l6QRpVdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzOlScUQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sb1vqEiw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FDMwUg1976785
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Zu9DnuLLdKt7ycUHmuRUrm83WHsj11keTyu
	MlQeQOdY=; b=OzOlScUQr8jH0RBbIe+rR9gv3U6g/uwfd6ajjkiuHdgNzdfoCFC
	R/Qbze7t1GWW004BbXB6zOiVjy+qeRX8jJYz7hS5YWVtRhVqCdgl5D4copzGIekU
	RnTTWlf5uzQy8HAhf0rUWDY42hyYAJw8f97A9ilgWvYbXInjzdcejxUXIoqoUmlZ
	MxdrhgYwVJo9d/C+ZvfCm2ev5y+gOKv9CT0MJlO3orK8CF+DzMmGgta2ceerts85
	mbGL7XdFg+lCgV6q3nIVJ6bV2UfE7xrGcSqZpyb0gxXwSEGPe77J8Vwd6lfHJQFs
	Bo0anOj4X0PMw6YeEsmpQ/VqArHXUcfBEPA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4sjpk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:33:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6de06e6c08so1843120a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 10:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771180417; x=1771785217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zu9DnuLLdKt7ycUHmuRUrm83WHsj11keTyuMlQeQOdY=;
        b=Sb1vqEiw1v7NmwkeJNVU72asTApjb/NqkqeKyb20TTv1mmVAdd9eHJfdVobtKuG6pW
         Eq1c9HjV1twLTuDZ6bHZzIoEGXlbLu7huHOJ38anjxuYfwbPG5EB8bqDV0m0k4omW38G
         KOWblSg5T1FSWG9zJQh7b5ApfvrPb8LtQ5j48wIlRpHjeArQ4d/Qogude4c/+ETufnNV
         l2AN9nQO7FB60Ibw3XFNI9+3mraXiZWJ5uwU0AvUdJYUWZSEW1Gk8dOSLmQiZfrZQf41
         wuqyN1vf6ZoK6/wrCEmwiXSYE+FG4vhXh6ZAEi8oyQWgdRVj9JdP9b7TKV2Shv+1OvKe
         6aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771180417; x=1771785217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zu9DnuLLdKt7ycUHmuRUrm83WHsj11keTyuMlQeQOdY=;
        b=bre3V4TfIh8kgnNMWeE9DrA1T6e7Xo6Qulv31IHG9LDXpOGK2SPdd5cU36bWuf4UAl
         c69WkMVd09RiBYR2raCbLap0FbFdlCGUZKOE3ntjPB2EgImJdNYsqjyjkoQmKSt2GHfD
         H9oPJpHuXAjuiUgtbT9+Ov6zWBMmEhotM4jn9IeyAF3Evkk+ZcxraAzxEX6pwEOi7GDK
         DuG5zaZl59l/1j598M9Ho5Nq59AYzPjhEAXxYiJIsdAzVQmnoiOkYikzCaN95obRHWll
         YoXR4Smo91/RODEsEXcFaB79GW7UCqOEl5Mh+U7ywi3HD2L5qlvHFYvATtlxOw73a9Ct
         IRkg==
X-Forwarded-Encrypted: i=1; AJvYcCXmLoE5OjPlWpdL2yRXPUkbuT5Ns4KH6aFeRDJCCDg9Q2zUXEYrT83AZSQyiK6nNs3p8rehYGo8V9aDpmOj@vger.kernel.org
X-Gm-Message-State: AOJu0YzX2PmZZrVQuFImP49AFormA68URRCNSixdiFO4BePwNle1621Z
	X/u6TiL+sttBAKdzF3m2QEjaUyT+HDqsJ+GyrNgelHlxwMYxpmtPnRWQ3IjjbA3x98Pg9dkqwtI
	zbKqNVaqLoIQeWNIL76SmHRmy2wOOJ/tGvb9RSuzGC6rehumJeJaXPP7obAxP/dUp2Bib
X-Gm-Gg: AZuq6aJcfABnL0BsTqbkdFzC12sV6rFPDlZporHru5A3v/k2KM94snAA6la94RbbeFE
	goDmNiymVNtGquoG4EeaR3s4pemyoS1/jJif2/Q7aPALin7NMmuKb7OfxOs9gXv/grmwLvP5A4e
	+3y3pp7/yaFphSbV9X3U1IO07pL5neYogNsj/wjcgnYCxjqxyThouLbl8h9OesfX5dg5OLiufxj
	DvDzD5EV8La6URTq8yj/VZNcFoODvoRH34mFObnnmpIdcoYgQZuaYltDKVIalydVVrQudaxnOQb
	VqzIyFYYfhzQ0TxM5r2kl6zqdfZ3svVvC2YVPaSwbDPFM/R/f5IsC9dD0oRGG5ajJalyyuCDnYS
	ui3vMKIdzQyVDWhfGCAUP6e7Ap2XvCdGqmJHg7vDX+fiDaND2DIkfNQs=
X-Received: by 2002:a05:6a00:1746:b0:81e:dcb2:52cb with SMTP id d2e1a72fcca58-824c94471bcmr7170582b3a.2.1771180416702;
        Sun, 15 Feb 2026 10:33:36 -0800 (PST)
X-Received: by 2002:a05:6a00:1746:b0:81e:dcb2:52cb with SMTP id d2e1a72fcca58-824c94471bcmr7170560b3a.2.1771180416254;
        Sun, 15 Feb 2026 10:33:36 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2afeesm9560875b3a.2.2026.02.15.10.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 10:33:35 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [RFC PATCH 0/2] Add wakeup support from system suspend
Date: Mon, 16 Feb 2026 00:03:23 +0530
Message-Id: <20260215183325.3836178-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NSBTYWx0ZWRfX8YsIrm3LdS4v
 1/gaUStQt1dqGKUfjrCgyYceogV54WHvxywnUXv9M+va2OSyuv3veu1uWTIujRe+PiX1WUTedZI
 LC1bEtlnajjLGKzSc2NXBOubBcp9jGB7cuufLKte9xxe66tJaCQdAFmgoKgufEabIUy5+Dfjwlv
 r9Ggx4458H5g3e8iSyIp2uPnSgTTErXpiMXhal4usNYkgnBX2RbxL6DLWd1GoJgvpFC/Smi6bhD
 FDW4Xk072EvOwfYtD8hR/jw738LCi0W6LEm9mVWLiCWVdiVRILJC3jwYSB4WylihAl+/4qLd6GL
 4zpIJhOMNQhs1+W/MVGRqHZHSKXTIFNmRE1XXSdhQGlGixt6R2TZ3wB0dVHPb26XCYV/f3k9kx3
 QslG0v1sYtxyfvmwGAExoeoNTFAaaiE1hDEUB+1ap9RtmCsnNXm6OLV2v9T1c62WQCg/vHsraqM
 Vj+WBNIwPmApRHmP0jw==
X-Proofpoint-GUID: g3OZOycY8cGgGMmuOhWLatJR2ePHZzvU
X-Proofpoint-ORIG-GUID: g3OZOycY8cGgGMmuOhWLatJR2ePHZzvU
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=69921181 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=IzbIpCLcpPedZRU0gO0A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150155
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92869-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DFDF613F667
X-Rspamd-Action: no action

Add wakeup support from system suspend for primary USB controller on lemans
EVK platform by making interrupt wakeup capable for HD3ss3220 port
controller.

Swati Agarwal (2):
  usb: typec: hd3ss3220: Add wakeup support from system suspend
  arm64: dts: qcom: lemans-evk: Enable wakeup for primary USB controller

 arch/arm64/boot/dts/qcom/lemans-evk.dts |  2 ++
 drivers/usb/typec/hd3ss3220.c           | 35 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.34.1


