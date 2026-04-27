Return-Path: <linux-arm-msm+bounces-104645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHMOM3gd72kf7AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:25:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C346F080
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1152E3000A73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0BC3803EB;
	Mon, 27 Apr 2026 08:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVDg6lCO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUJNF8/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E12D8376
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278211; cv=none; b=kas4Cf62f7qguShFTAVn1knuEO7gaHKQz9EYl8R8A5MpJS7nsLl9ZZKKwd+T0qqoSf7Dzado7GB3aeysS90mBcanLGNPhIhpXgKqS8El+itQ4epwhpWUIDCJukdvOWUn7RGIxX4wx5grAn9+O42DkqUCfAmjW7qyx+m56Briq6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278211; c=relaxed/simple;
	bh=S+UC5l8xLtwplTScFcAPLUWxLbOcZ4c8cKWGBkjX09c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bN5t0mmwHj8YjsHoUzkkNxCwq50htmOBDYfgS965SWBrDSlMEaCRQmYjVyS5NlQPSrhuQqchyGDfif55sSYvpSXdDFmpjd1qjxQl1LcpBHOQlY31RHQlWKwD4QLdNIGGbt6fOypU/RiaRRLXVY8dh/NVbBBgn4PcxxRIkVPUpNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVDg6lCO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUJNF8/T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R7jkFc4128510
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tiRArfcKehWqRcHRhfjkDPQuN1XNjJnT51L
	mmPgOUFs=; b=WVDg6lCOAqr0Bi/0aGdgXnRrlKaCimHsYluJXB6SN/Ld+tPVPkd
	xZCXQB1WukaG2m/MIWB7tN6/NEKBPFiYgr2SWwKkPkCf8zrbp562Avng5oD/RvTQ
	3Ryqnvpas8mfHwkxHsIE1HWSxuUE/Xtp15zcJiM9wXht3RbZzZQ0QS3+D9vImSwR
	jZIvABaTHQ9gQjCTmYRB3zI1P8MP7/7Vg4uWXc7lPWfDHOKYdWji/j/1UTp+qERJ
	2qimVFSBsNeI6l2G+b/Wd+y9WslYYo74EmxNWw0oxSPVHDdXnZggJv8MxfIa5Ekj
	w73aMlVN/2r+J/3ShwMV0HHDhmgfz9d6MMA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrn3h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:23:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so11687657eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777278208; x=1777883008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tiRArfcKehWqRcHRhfjkDPQuN1XNjJnT51LmmPgOUFs=;
        b=jUJNF8/TXX7z4/uQJfsUkRBJsfBrlNt/tbr9FLt6x/0bqCwx4idH6LKPYLIZlv7U+j
         YCqqfhP5WHa1fgWTSN/p5lSK2AqJSE2MQnPFZm8HuHcUeCPLob4DqKCipWbrTwHNTgkb
         Por/yUS0D+JlsxJE1ho7O4KBq/iNdhnDhbeXaBIVBZ9yPzS7RjnSidPCDZwY1d5xEKNY
         uUE+qOQPDHW4HxRDXurtE+LzqDfn2aeamhkOji78iFPU6ooxBHIcOEDvybjFCy6uctSM
         3w0d6nr+LtN98JBVv7lUnqDbPkF6QxP7qO7Or28706o4909WlrMsjGQeuw6W+efctiVs
         bv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777278208; x=1777883008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiRArfcKehWqRcHRhfjkDPQuN1XNjJnT51LmmPgOUFs=;
        b=C0ePkPTBt8b2/7WxzgCOmQNyDWQT96fofXeime80cD31P/yXxLE2zO2UtQ3xOgXDHe
         AAHv23hDFCtJxna3zFejRs0zmJmTe2kjvWYjt1G3vNU/GPDhTb0ZonX5zxNOLoYxGMSR
         8fiVfLI46CAsTK+YY5sbMsIuCXd8Ja9BwD2e7TV2FQghEA/WstPOxlMJQ7jWrceLtzJt
         HEtVp1J5K50pb3mt7bDenNCh9Ko2o1Tbu47MLH2+F08mGVsAMMairiBNmJcgfkEZOGHP
         DCNWOKn3dMLt3Xd5lpm83Oh1Y40oKcefaFdj/KVGl6Z4frnJGoPU84hnb9iPV2XUieFR
         xA6g==
X-Gm-Message-State: AOJu0Yza0ns5UCAYnep8jMt1kNHrCyjTXg+MmbAs3J1SY8ENS+0J2GzZ
	0pQydoBu68L2cEiuU+giqoWQT1lm/3ZtpFSWkIEnhB4AjnsqBnLGUso4/2kffTZc3Fza58Gssk3
	Fr1mwYqkUC8Hx4p2wObqGlQ3UJcv6Pmh5pFUF+avkxfzxRECqTkUG+OP5VfK8xvqcW164VR0QmW
	ls
X-Gm-Gg: AeBDieuKqe+RPYnzPEoaOBCQNAfScVCIRqpylMRtStsu5fUj/Vi2Avg1yB8bed7h1u8
	mYKxViUCkFh8Eo8Zfd+b5IE+7nxHuCWbvjFmLzts7HV3JyyNLkRq2r7M0/lbKpGwfU5rOuuBKd1
	KpNlL+f/OiOj0zwPUQrxHM337Ch5JvXdgUiegrJiUVxUamTubCMh+b4aXNbKJRRD8XLNIlj8r/Z
	DieZTogT7qJYnSX13lfgitZcAgEEYpKjhKKC5Ttkyi+qwpIcMNE4yaDEtlB1fFZY/xq34GsMMzl
	361wMXyEpPoaEIABLEY6nPTLdBFICsr1aEnvBB8mCHgluUfUMpXJLpYp6Tehjm5iT0cH4cAnglH
	kHxP9sanIKbrClZithVNh3rFRmSWylVLlZfSQ1zxhUh9AUMtiJ3izT9fXO9HC3IZWBeh2ddPUDS
	Lfhg==
X-Received: by 2002:a05:7300:3723:b0:2d9:db50:c6d6 with SMTP id 5a478bee46e88-2e478a331b3mr23189775eec.21.1777278207589;
        Mon, 27 Apr 2026 01:23:27 -0700 (PDT)
X-Received: by 2002:a05:7300:3723:b0:2d9:db50:c6d6 with SMTP id 5a478bee46e88-2e478a331b3mr23189760eec.21.1777278207087;
        Mon, 27 Apr 2026 01:23:27 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa5c86sm50814692eec.1.2026.04.27.01.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:23:26 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: talos: Add EL2 overlay for talos-evk
Date: Mon, 27 Apr 2026 01:23:25 -0700
Message-ID: <20260427082325.1895450-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA4OCBTYWx0ZWRfX5NxmyFikK3Vt
 dRgItHqUuvsErrMTiPGltjbR4eS/H2GJ5JFzhhtK760VfsEK3owvcO/VgqGF5pdTO49duCIFR8N
 e50BTJP6bnegjwM4kGBLxP0ttKd7a34ZQfWgK4s9zpk79stM9iQZX+0IYabJsn3CrX9d3a2PDCF
 +/HA3U7Qg2oAy3RLaATmMG1ePLehVyp2fz8OgUfYpvcFskj22b/vxRAo9KgHu7hLZUSIo5RVMcv
 IhfX+8VQ8ZJuH8x9wQHFHTqGoL4wqSYJTprVEz4PrUNEEPihc4KhByYDph1DOH4wbgYgnqoaOFt
 wLETercI1k47yb/R3k8PrncGCITBx189F1U1jERSrdmvAG6iY5hADDRbfzzcLEVDK3cgM9aM9iG
 fVlaaABfl22G/9TC+MmCAw7dbvbiAY2YR1X61rBlfjUtK2KSNLi7jMqh2V/ZUpZ73Rit6tmQ6G6
 89dsuDUuj8ikzgxSWrg==
X-Proofpoint-ORIG-GUID: sMT1-NK9OkHhGsj2fzLppSMsyldCWWiO
X-Proofpoint-GUID: sMT1-NK9OkHhGsj2fzLppSMsyldCWWiO
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef1d00 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=_9oBJBIr4Ljb0oQskpwA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270088
X-Rspamd-Queue-Id: 1D2C346F080
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-104645-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for building an EL2 combined DTB for the talos-evk
in the Qualcomm DTS Makefile.

The new talos-evk-el2.dtb is generated by combining the base
talos-evk.dtb with the talos-el2.dtbo overlay, enabling EL2-specific
configurations required by the platform.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..c89e4327ef18 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -393,6 +393,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+
+talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-el2.dtb
 talos-evk-usb1-peripheral-dtbs := talos-evk.dtb talos-evk-usb1-peripheral.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-evk-usb1-peripheral.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
-- 
2.43.0


