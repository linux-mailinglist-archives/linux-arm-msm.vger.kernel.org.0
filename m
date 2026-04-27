Return-Path: <linux-arm-msm+bounces-104596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLQFKp/L7mkMxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 04:36:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A61946C24E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 04:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA2A0301F313
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B18031E828;
	Mon, 27 Apr 2026 02:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRlHMEk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ilmzrhcx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEC031AF2D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257337; cv=none; b=o+S1gUNkYIGOtu9qzxaX+eh6AA/GBohLvDZMSmNcCsiDR9ilMnkH93eSnsxVEjGxHYn9mTxwj/+PlvNvypibXDGN3+W7T6eBwOOhCvZqRA61xl/ZM8LWcJFsBgcX4fWuNp7oJ37mMZ+1AMqByOQkFDDGA/Jcqrlybc3yBziVhAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257337; c=relaxed/simple;
	bh=LEwR6v9bxHgbCjB8GVmFUhAjmErcJ2hWGaRLxadUSYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dbw7gfwRqJJAz0TfRAZQPz2QJjukbtOvZWNui5zInL54j5usrLkdbJssAXJZZl20AkArN3fsR5/aNw/OF/UZTrcyIgd9bGWJXCHDE9lv+tsvZFRenVELe1jcoAsbmOIIBSN136JzPtvEMRHYVbBzR/TmRoAwcLknhi3fSpTnn2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRlHMEk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ilmzrhcx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMwVt12685479
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBL3PHuJifY3cYYzaLEvuQzpmM9khXGOiPkutzeifcQ=; b=nRlHMEk4/E8Oe361
	dzewPlBUGZXlaR1Itc/VdLmdDHMg7B9nEkRMjFIkZolz04JZp3SCfrCfbOGNIoCT
	aGQQd9bXmWHhEFRpfX0UdH+HfXix+wcG4lE/1/L73CIrL6tHUGZrssdqaBS+5sCG
	n9lPnGpVmW7eexSb6Qj5Y3mzgegq/6S24buyWMPthr0MwhyShiucQkpdL8Tq01xS
	t0Y7mQYAliJrdSkPtkJWVv+HikqAMAc1pRjLWLU3EZLTMcNIiilFA3eszxSlTJeJ
	r9HZm6cUXiS5INgL8uBbp6cUYgVqzifSb9bWC56ok1UEGpiNMisO21uSNTcmBwzg
	EbyXGQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtc40k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:35:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2eaed3d96d7so1581809eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 19:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777257334; x=1777862134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBL3PHuJifY3cYYzaLEvuQzpmM9khXGOiPkutzeifcQ=;
        b=Ilmzrhcxker0r3VKsGEbterUg1jMj3N+k+M6qrMdlpgn8lzBVpjn63dHrE3TfttMhr
         qIl/7l5bVrdY7TZGTz7o31mjjXlUWP0CxVG1MTcevUy3NHRlZQ9eVutbzfTim8M6q4LV
         lqAS2q3Uw+dJfnNF9Z7GMa81pm0cfKTUIRsljBtgdLYa4kUWYaEfxdJzisqzydTdeZMw
         14m6FG3AN6hUicDsmdjt9oDAsUdExrVjbD8Vdv9khiIBJVaZ2kCQZMdKIe6tU0+YG9IE
         MtjMh7P9ktE58famhn25ve+aBP+dbFE0d1CsVfQCQChQSImTCUl2nptfstoTJcBuxDW9
         HnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777257334; x=1777862134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fBL3PHuJifY3cYYzaLEvuQzpmM9khXGOiPkutzeifcQ=;
        b=Rkl9pkDMQUlRTn3HSu1Yb/ifUirKTi3eEadMAAHHh8vSOxip6OK4r10WWDc9yELeDO
         T5zPrNwm5SbxtjlejLxCII2X7kAHF74KEbA08X70gi5jksAlz1wHK9LXfHqNjaTM8H62
         d1mojKAG3uOeeLBWB6U3/rjev9OvJv05lqgYbdEH/ZPt0yZzWTAgQPi4NEJUhVltFLsN
         avHmRzZ1S1Qqy06e4xJeQBFKQYrKwjtclj2U6PQolpJM89mfO2mNJ+fzzaJP48O0KxBO
         H/VnwLnm+w85jN0TF/bNHDsnEFkrc2pxGqkrJ/yW+YJ474aOm1cFZRfFbTtbRTAB1P2v
         E4Lw==
X-Forwarded-Encrypted: i=1; AFNElJ+A8gA2Umn6VPSl5WkWxh/IqMzpMtQq1IFVsO75w3hP+eRRKXpKcNo/77Kdd/i1Y4xjvXimX1VeRfBnW2Lf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa86j4h5XjCoPupeAmQkkeuoRMO+/1BB2fCsa8UGHtsqswkOJP
	mdNDVOfEiQH5SbhIeXozvG9fa5Km1LcyqIcz1OUGr7utBcsvY+clTVvr2oPHEOTKggJ4tNtEguS
	Gpzc1KygwJMkvMFJeYqvh5mMJsFm0LF8J3bNCYtEswmvJOXys5m9F/oFvVblpD9QGxDGt
X-Gm-Gg: AeBDietYFD9ZpTtoFutbulmupXVYoPcuT024xNl5mT1QKrxfHxLXd2ZRQen9yjLDKWZ
	GGrHKSL+w/b1fb/mqEmtsflhprgdNmip+iNVbIXo4lERKqfCyC0T31z4qdYytavsFjk8ym77Znv
	7hO8tKnle0WixJahJmnXHk/YNX0kgFsqjQVlrXBIOrY8X+kUz8uHl0M5XeaDQ0sxpNWZwuzbWgQ
	w4ODb/5ng2rNrZOPxwFEjjM8FchlndyjSIt/CNcwx0Mp+zdarYlYRTE7Tod3Qg2pgE5m5V3irhJ
	HxDELW/N1v9Fid4FHmNX4JKzKR/2tDKO1BrEzImZU1PuprdQsY6XRLmTsPNswkNo7tWDQ/Votr/
	5WUEwCQMgqM8HdCJv6GwDe35McPMet1jXsfthE2IQsVmRw28L4OuHJgVKbO/25H1Y0tEbiKAaof
	C5uxzzw/qz9GcMrl23
X-Received: by 2002:a05:7300:2d15:b0:2c9:ee15:a0d6 with SMTP id 5a478bee46e88-2e47901662fmr24908307eec.29.1777257334256;
        Sun, 26 Apr 2026 19:35:34 -0700 (PDT)
X-Received: by 2002:a05:7300:2d15:b0:2c9:ee15:a0d6 with SMTP id 5a478bee46e88-2e47901662fmr24908297eec.29.1777257333668;
        Sun, 26 Apr 2026 19:35:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52916316eec.8.2026.04.26.19.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:35:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/4] dt-bindings: arm: qcom: Document SA8797P Ride board
Date: Mon, 27 Apr 2026 10:34:54 +0800
Message-ID: <20260427023455.236410-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69eecb76 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QgBviVkkQy8jiF2zUbIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: d4GSYtsmEcNZ8SpDT41hV9RyRP2mq_iL
X-Proofpoint-GUID: d4GSYtsmEcNZ8SpDT41hV9RyRP2mq_iL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAyNiBTYWx0ZWRfX/wL36XMI1iMv
 Ij3a3aV3Jp5Eeg+9gG2ZST2H7DR+kavWgjss1ml0z/LBV65ANhPdUAcEsaiDnSDvTN8CMINOmU9
 Q6P8nzqMzctuCarkiZDV7RWrrRCxFdUkPpjIgNxvTyn23+Eg0ZJIlKmhH7WCD9BbW7f71hDAouz
 mRGJxrhz4DZsjx6aDCrNrQWwZIhMkD78g4JrrXQD+q2yL/VQSaY8YvdCYN7ndGs9WVMFOGMHuZs
 +pHT+rT4BwJXrcoMqBDVG2cDPcN4eh/2b000H3Mxu2g8VT3WGgdlw+/IixSm2ustkNHV1+QeNIf
 F4dIKxcVRyOjOB0i3iOWisAf1HiCLN/tLW0LEK7Afo0S/2eMq8durHqjF0vMm8AWV2N3nsZXWzz
 iBR4Iyxw9ex1+7EeBt1vpSMI8fG8a7H1KLQiQKRN8/jZVt0c5SbWpiTAYXcYzqHJjXgttcSKQfR
 AJC3rwsW4qjXNKOsqQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270026
X-Rspamd-Queue-Id: 0A61946C24E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104596-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add compatible for SA8797P Ride which is an automotive‑grade development
board from Qualcomm.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..eac77282f86d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -302,6 +302,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,sa8797p-ride
+          - const: qcom,sa8797p
+          - const: qcom,nord
+
       - items:
           - enum:
               - 8dev,jalapeno
-- 
2.43.0


