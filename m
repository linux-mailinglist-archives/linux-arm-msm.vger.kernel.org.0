Return-Path: <linux-arm-msm+bounces-118721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z3BtFYi9VGq3qQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:27:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7D0749CC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:27:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S2eoXy2O;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fAroZetO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118721-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118721-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6E99302C782
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E4D3EAC71;
	Mon, 13 Jul 2026 10:26:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51AB3EA94A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938380; cv=none; b=GCPEZYZdKBzRoLlIAUcoH675Ad33uaw+Mo0ltB3JbDAmZVcnO938SLMetIj5Ai5FrGx5OGuwxaBsY+UGaFj/0hI1oNmbRQok6B2diP5zTAZcFYQGHEyemg62zNBICx2Hnu7mZ6i/fu9cSWawVLxPHqCn8tBdTzRvsixL5OEJRpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938380; c=relaxed/simple;
	bh=8bsRgBVyAMOmy/SwlppHPk3z00uNAJT+Hv0VOSWqUXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WnkcgOFm0Kn8dQ0bZZ2lvsKIMmxTRMytblq7AnaoWKLbHB9hQH8G2QmkB3RyhgseW10KBNWp4OqLyAds7KSB2X2FlRRfiN8Uc1mwNATAUeR22HhUN8vPYdNOvis1NwrQXVyA91uRHc0vLYo5muxON3zwxGfSezqLVOFbALokg6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2eoXy2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fAroZetO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O1SR507448
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4ukWEC6EkRevgK/M2ooVzj1d4/9KXAX+yGWKOo8Vog=; b=S2eoXy2O5qov9G0F
	QTziADaZuesOIkWpKdypmWmlQIN7bKXsrgohYTtJQF61aRBxndB64q49n+tgmLQA
	d3om9PYlqi0JT79f9aztQGJbqMjQHqI08U7bKm9VAeVYFtFSi7tJa9b/BnAMxdvH
	QYpfKtokwoB9tSzTMxMuYCBwwWsiPsaA5CMF0M5f7C3cZc8S77sgHBGmBbXQ9N39
	f2ctyN/eeb0oRbFFMvkvo6MH/ka8yXWhT9zx1Qwo8WZwbDixJEvDREsrlteK2agj
	4lnYYQ6HMIKpc8haRjkESbboBtQvjZz2vvEWBjK1bhc/y6DFgkV3vEv+agiNLwsM
	CO4KKA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8h1p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso4622371a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938377; x=1784543177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4ukWEC6EkRevgK/M2ooVzj1d4/9KXAX+yGWKOo8Vog=;
        b=fAroZetOQJ058GkFhCQYlCjaWlFuAy0aSgIA4luyKIoJbpf89xElFKupp9B419pdVv
         QImjcw1Ew5+auK4Uy120p5xNbVjfMevQ1EMjNtf/95/lrwLa6mPXmTkiTH5YDhzEFp7m
         jOIRJXeXswY9f18eI6kQEGxn7PuP8VdZlUEQPTACljhfMrMnJRTGHPInL7qfSODH18AQ
         8Y2d33ZVaRfENFaFri0AgcFkjYFxZUkZfhQxc65FXwUuafiR5My7SX5pa4gW6Rn436Qw
         ra2TA4zwjjEW7Qtkkz7SthZuDDwEeNge64PLJn7x7ubVa4jAOkp/m1iGFCrnEBeSRHZC
         9hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938377; x=1784543177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4ukWEC6EkRevgK/M2ooVzj1d4/9KXAX+yGWKOo8Vog=;
        b=OaWpkVJSbNO7u3Ebea9hwt0xMvTqNibhsKGmT6PdrkEffMikcDwiYgJhoaYhWDO9/I
         dfe/4Cj+vxwxeiSaa91ku1mgF2sYlkPw+jDsBMVroAEwDGin34i2Yde9LvzA8tILViQw
         i8RAxmSh+FLId1vV0yB8Wj887J5TF00HuOfeq794s6YirUJaZLUruOiIxWI7f4G/2v8z
         Z5hsqQfK2E1g65kfZ1+J4aLZgIdaDjolJZ9n0XocbTfjvAWoZW3Zr0ABm56U7G2slniz
         mfqr9uY7i6IqS1zjtWnphhEwfjCl2eNsNXmOXAdkGXtSeWludj2Pay3Hv7ALA3Gdkeks
         ddgA==
X-Gm-Message-State: AOJu0Yw+AS9E1OesK7zu4Q+XBOc9ksgjwd85TnXEeOOYRdSjnPINmjA6
	ATYCNB9YdNogC7Cs+Ul5HMUmIGQMvt09dyzg63bnuiQMoOn8vQA1GaOgL+OZT870ADSyaeyMuCc
	Mw6baQoAdfLheRMQCyz0HmJ98ON9ahDTurYEevX/dklZnfkY6cwtmhOK00/99ZDJqkm/Rd0LRam
	L0
X-Gm-Gg: AfdE7cmt5d4ueMnpQlt3idJVhrPqSGfPQ8tWBiIwlf3+x7flYypLZlkSKa4ZDpOJ690
	U1cOKA4G6Grq6DXqlxjaiQ/c+cSqAGRyYGK42SGwoLqneYhm8QqkcQidtOCZV1ZdSBRgTlVZDkC
	Inl0CYeXhX564GVXrON7I2TW4V5A3dY4Wc/RyUMqqxmnKrU1DFPFQe927o/Ub36oJ4SHHzkFn1B
	PkaBLQKduxN9aMhdL/EzGAsX5ej81eZ1DxERPG8wjOGh7urCBxOhHeXMymgfikTLu03M50Rn4dy
	oueILnlqmBVfVSiBL+lQnwJmx7Vew5rhkehriyh/DQuZ7MBE3AmKINHf7CQW7fxTEWpSXsLOctg
	OBNIo9dl9HgjmZ9zTALnNGUlTAzJ2aYmsFha7K2Nr
X-Received: by 2002:a05:6a20:6a09:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c110160b71mr8725842637.20.1783938376968;
        Mon, 13 Jul 2026 03:26:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a09:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c110160b71mr8725815637.20.1783938376553;
        Mon, 13 Jul 2026 03:26:16 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:16 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:43 +0530
Subject: [PATCH 3/7] irqchip/irq-qcom-mpm: Prepare common access path for
 timer and pin regs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-3-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=3598;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=8bsRgBVyAMOmy/SwlppHPk3z00uNAJT+Hv0VOSWqUXI=;
 b=3T6USNmicRXSCrdUybYcQQjYxJ8w93f60KvFRy/Baiw9Y7w/pxexISbx7soZyZUFWMwnE3ht3
 EyHD11SlWgpDzvcXWsZlOJqg4u0NqsWmtUZUy7AvMRD5hbIdQNBWqSJ
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: -G0ZlIAss2bph2swBnzMfGS81vKltjZs
X-Proofpoint-ORIG-GUID: -G0ZlIAss2bph2swBnzMfGS81vKltjZs
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54bd49 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rc4BuqHPY2vEHf5WpjwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXwEFOr61+v2Si
 cC0oqTd1qEzESwoE3V010KKxzftm2Wh9uWlLdhkxU2rsuvgxxJr5iM07GSdYRJvK2aD/86fLbyn
 zdeTlRyMS8eYMzbQUTP/rc/dWK/8oJM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX4iTxi4TH2Khg
 KkjSoIxtsc0FKol5Qp5Ig4zVxGbabQGm3Nc8sB6BBC4huRmbpvg66xTX/5naxPd00S3divhfCU4
 D8bbKFWjwaRmrmSzrE3xrFAh7jeUiJsfvRk4+bky6WQFCG4QwdmRck08QSHXFsZ8Iw4pXLvy6Iy
 2UStI6QsHIXqV5TJIQubWCDkxXnS0JNNCHXP8s9JfoDZJ6dEng5F4goLJFAmF8ATB88TTyhq2Iu
 VBjmEJOxD8xIwTeQZBbaV2dVwlY/pzqO8kKvVKDivYCTx02Kly/7ah+VaCaCDRCJPcum6qzYyx0
 3opB+DRU7Itu01lkVE3pwWWSiYoZhix83rA7VA8xYDFwFeQrKzqQMuGTjWnHwpt/nfIwmxo/E5o
 IK7Vdt5iHi3aD5W1mZofpcQtiQ+zPJHVi9uydS6NcEW/HBU5BBxDfZesceydowAn/O11ZJbvugW
 mr5uUApgQzyjGr9QCAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118721-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD7D0749CC6

The vMPM layout starts with two timer registers followed by pin register
banks (ENABLE/FALLING/RISING/POLARITY/STATUS), each with reg_stride
number of entries.

Use qcom_mpm_offset() as the common addressing helper for both timer and
pin register accesses based on that layout.

vMPM has MPM_REG_* values represented as contiguous register IDs,
hence replace the macros with enum qcom_mpm_reg and modify the accessor
helpers accordingly.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 48 ++++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 01fd1843172aa22760d359281e39f0d9394bab6d..763eddee99dc4cdd5edab22ce54808528f9ef165 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -66,11 +66,16 @@
  *
  */
 
-#define MPM_REG_ENABLE		0
-#define MPM_REG_FALLING_EDGE	1
-#define MPM_REG_RISING_EDGE	2
-#define MPM_REG_POLARITY	3
-#define MPM_REG_STATUS		4
+#define MPM_TIMER_REGS	2
+
+enum qcom_mpm_reg {
+	MPM_REG_TIMER = 0,
+	MPM_REG_ENABLE,
+	MPM_REG_FALLING_EDGE,
+	MPM_REG_RISING_EDGE,
+	MPM_REG_POLARITY,
+	MPM_REG_STATUS,
+};
 
 /* MPM pin map to GIC hwirq */
 struct mpm_gic_map {
@@ -92,18 +97,36 @@ struct qcom_mpm_priv {
 	atomic_t cpus_in_pm;
 };
 
-static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
-			 unsigned int index)
+static unsigned int qcom_mpm_offset(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
+				    unsigned int index)
+{
+	unsigned int reg_offset;
+
+	/*
+	 * Per the vMPM register map, TIMER[0..1] starts at register index 0 and all pin-specific
+	 * registers start after the two TIMER regs. Pin-specific register IDs start at
+	 * MPM_REG_ENABLE, so subtract it to convert to a zero-based pin-register group index.
+	 */
+	if (reg == MPM_REG_TIMER)
+		reg_offset = index;
+	else
+		reg_offset = MPM_TIMER_REGS +
+			 (reg - MPM_REG_ENABLE) * priv->reg_stride + index;
+
+	return reg_offset * sizeof(u32);
+}
+
+static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg, unsigned int index)
 {
-	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+	unsigned int offset = qcom_mpm_offset(priv, reg, index);
 
 	return readl_relaxed(priv->base + offset);
 }
 
-static void qcom_mpm_write(struct qcom_mpm_priv *priv, unsigned int reg,
+static void qcom_mpm_write(struct qcom_mpm_priv *priv, enum qcom_mpm_reg reg,
 			   unsigned int index, u32 val)
 {
-	unsigned int offset = (reg * priv->reg_stride + index + 2) * 4;
+	unsigned int offset = qcom_mpm_offset(priv, reg, index);
 
 	writel_relaxed(val, priv->base + offset);
 
@@ -144,7 +167,7 @@ static void qcom_mpm_unmask(struct irq_data *d)
 		irq_chip_unmask_parent(d);
 }
 
-static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, unsigned int reg,
+static void mpm_set_type(struct qcom_mpm_priv *priv, bool set, enum qcom_mpm_reg reg,
 			 unsigned int index, unsigned int shift)
 {
 	unsigned long flags, val;
@@ -327,8 +350,7 @@ static int mpm_pd_power_cb(struct notifier_block *nb, unsigned long action, void
 	return NOTIFY_OK;
 }
 
-static int mpm_cpu_pm_callback(struct notifier_block *nfb,
-			       unsigned long action, void *v)
+static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long action, void *v)
 {
 	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
 	int cpus_in_pm;

-- 
2.34.1


