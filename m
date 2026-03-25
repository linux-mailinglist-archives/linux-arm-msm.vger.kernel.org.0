Return-Path: <linux-arm-msm+bounces-99792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA3fF812w2ktrAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:46:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D757631FEFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53E5630C5545
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3A030FC1F;
	Wed, 25 Mar 2026 05:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJw8Mhh+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LU5va6c0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4363115BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417455; cv=none; b=OxaZIhUvnMAjLU2VbbhJ1F7+TcKvfImJo0qVWfXWmO3hJ4y/JjXOzlrY3T4rS7oOAeJNvz9KXYci0NBhZhQDqVvak3o/enQcFC/PXpFkVgc9IGQPARGQY6XzoapIUy6TRn7DXq9Up8jL5Xnz0pMy5gKgYoPNdyhVXBhp6jH/m0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417455; c=relaxed/simple;
	bh=8tA/1rrhluQQOhAaaei29rn2Ss2/RThN58fxl9hPMJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SghDHt9VhZVOjYYqO4i39B01tMKRumEiBOIbESvc70iUboMOCpyfzXtGrYO0xUiTNiPkItv4q8G60beBCMDhu6cbM6abeu84DRRGlEGmAg97+/BmNYvJ/vAjsfDDU+qNKRUE7B3OLDwj2CdXmAhT7eQCfydTzU7ZzxD7A9vykHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJw8Mhh+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LU5va6c0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P2JDga3057430
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sAedjumssGP8HnleB4ucvI59aev90SYKLdAP8s7agLk=; b=VJw8Mhh+jSJxkCAh
	LyLamUjsD8eHWm6v3vFbKQU/sWUjwQXPpuf/99WJTdRfcC3oZaF2n4hS3C0UgGf3
	ATiCZbAQcjFZV11hm7XjAHJ/lw21IoBoNk2+z1Gmfnq0LnrnyHKvn6Q17wUm8T1M
	PlNDOMgBuKTomM2iwEyqn39fAd8unaXfFDtIOAe63AHCl8YXyPDcFxZMpjGSO7q/
	VYLYJgGoxO/HMNqna1mnZHvO9j5oGNiGlP8KiYQ8BI0xnKFrnYmwFDg9BifoejYM
	TVrEKBfw+YDsjdb5fT+ru+t7/HhwkVTtSWqNaHGaoeNZHJYyQrqpLceSN9kn1T6B
	v9wEdQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp0jjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b060c14ccbso180584195ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417453; x=1775022253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAedjumssGP8HnleB4ucvI59aev90SYKLdAP8s7agLk=;
        b=LU5va6c0ikkjQbZnWgWBzl+GBLp20vCl4sBK80IKtkjidMk9yY62U8uUruGNeuXfhx
         xyiwobl7Xz9DvJixwPq4tX7cYQvSBc3wyIMELsz/2jVruipgouNVM1luGWHmrWZDcchf
         Zhy5qO9seH/zAjTBc6VpYoWgluAr9ZLlXjbPU3SDGFaWZFL4wnzsa5JGheT3A2FIEJHg
         h96JwRxFiGfH3aMrTZi/iZdPxaFZdFi3ikOqu+99tJZ4ZqhzuNHbxA0x9u9XeNy99Tr4
         faRPdkZMz5IKxDDTb555NCQ4N6V/bJ8eny+8ZAuL7yU9Endc6uxB+C/SPdgkoKWbzTFt
         6nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417453; x=1775022253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAedjumssGP8HnleB4ucvI59aev90SYKLdAP8s7agLk=;
        b=Pi3SQgIbvQyoIFdBI6zBIpb6fAGMkLxOBkIcNxZfie2WRRb8UruoCJnBP8pfG0os3A
         /vGWxsG/Fm4h59Sh1K+9o+bpzwpwRALC4ACoksYToxvCRuq2kJ82HDXjt2TwS2zVUcP2
         OFOU+XXHyM61YoxasZLdOPDvvOOXgpgZSV5H5o/yE/7A+n8LIBcObdhLr76bsnqKOGuC
         +Dz8uFIhDXMq33jtLCcV0DKVlMyfWVJdhR2X8Fh0BItxCuczEIEwUrdgM6CzPtSpDLjB
         X6tEheoYWpMrc2v21ljxWJlIEQ2MAEtPePqrxQDjqw+bB5BwzuqqdPnZOIZSNp6Ean6Q
         ODhg==
X-Forwarded-Encrypted: i=1; AJvYcCXnLqxrP6vKxsbwcuWG2emQx1gyA/Ye9a9+j8z9VyDrAcqrTVMBYd4CrwG0pJkyjEPFXOP2ElJJwugGmYbt@vger.kernel.org
X-Gm-Message-State: AOJu0YxYq4MIlbe4pg61kJ1KGEcGANxFCmuMxW+Zrx0rH2K89rj1gX3c
	valFzVTHPRrBatUYkKo2f93D1Cout0EdsVo1aUCjCM+/mTUta2/MxamtLeoUNWh336S0MvFttX3
	thP4C6CHYiXMcDhbzDEqu+1FHhwt7piYhc3GS0qN/GyagtWykCL4Z+RGDvaBnjxJtj6X1
X-Gm-Gg: ATEYQzxrXlofaiN4FQmtpOz2fshTcgP2kv0ykcfDJQBBIU48XiUTyASyOE78JMAChoz
	3DgT66rtdOxIdGDvjonDXIbDGedFKPJb8wvmzt2EGH/hFZ/KSIPrtnQyBjeYnVn7GXhtjA7X0My
	7K+IVT9mxX38diTPk4k1ECOT9F08yhY9wiEj21nABiJ8RDpfnPD+Wv1wQ8qIVGXIMSnUSYxW5MS
	X7gHQjqx3xxkStchGxSVucVeF8ESgV16NVzoFWRJ8xa0q8QWjnxH4wBV3iq+QUxRqK02YsfGukO
	sVexiVC3fy8OpbKcktFliaY0e8XNIueSROduHM4A4VgIogGzgMl5fW+bFZfKHaxShMDyTOUrEwY
	Y1vbmgle+3b9BcBodp9vD3ZZotvM9OVVnNYG3nMLn/eb2SUWTZN60ZVv+0Vsoq3EG4s+Rza90Bg
	30V+tRJPwolAktgQ==
X-Received: by 2002:a17:903:46cb:b0:2b0:4b37:e9a5 with SMTP id d9443c01a7336-2b0b0b2efd3mr24364815ad.53.1774417452673;
        Tue, 24 Mar 2026 22:44:12 -0700 (PDT)
X-Received: by 2002:a17:903:46cb:b0:2b0:4b37:e9a5 with SMTP id d9443c01a7336-2b0b0b2efd3mr24364465ad.53.1774417452193;
        Tue, 24 Mar 2026 22:44:12 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556f6sm219985805ad.49.2026.03.24.22.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:44:11 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:43:47 +0800
Subject: [PATCH v7 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-extended_cti-v7-4-bb406005089f@oss.qualcomm.com>
References: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
In-Reply-To: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774417433; l=4654;
 i=yingchao.deng@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=8tA/1rrhluQQOhAaaei29rn2Ss2/RThN58fxl9hPMJs=;
 b=kPJ6va5jIdBC1luKdNocyudY3wzT2OYkTluHO1R/HtuMWrwpokb9DAG6Jv97cbz6jci6+Z6Ti
 6OStKD1lfPDBsz4zmeoCXv8H7A1fqyT/sRvuwPlSrS8Bih4EWbKRC61
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=5tp504LR96W2IVT3sAbRCqWtoG16CxJVUnXJSfU8NlQ=
X-Proofpoint-ORIG-GUID: JkT1gWjuQGwva-0pIk1g4O393v_kPnpu
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3762d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PrhcshflQRWEcWOJaRQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: JkT1gWjuQGwva-0pIk1g4O393v_kPnpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfX+yWR4EoXU9Ym
 XrKH+YMJQ1nFFAhnM7W1jthtVjPYs6iFJ4U0Spkd+llUj+SE0oSGbLacrfPs0N01p7IHKf3RA8C
 pMU/Vt8sj31hilDQiaBzID3SsBtE/fosygiAvMCYL7jk9ngK/TqWNjKq6GQOPQJGLhwV1gVnRJb
 spZ3e6cRLBHsM+l3BoUqzM4n52h5dktd9qR/tGIpKynY+SXTzWr8qPjSFrdbeCbc+3qQl48aIIx
 DOSSrrexaQVgTo+Pbig2FTbCAXu7I4G+EhphNlGTMt/8cc6AjrQdwbvXG8orTWUT/EQrbxQbAzJ
 vW3GYMt2546sODmB6l1xiuOKxFUtwhnAdSDtIK1ZnVktQMzOwv4VzEG0Ruf0Rgz5x00v1bM8umm
 FmeG1lIKPjtEqEA8jzEWP0d0/Q/EJElLrnOtYRRLqVWNAQZ6OEL2jfCQDe2EPxWSzUfZVtKvVja
 fheEjbn4EsQuIueMMNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-99792-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D757631FEFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm extended CTI implements banked trigger status and integration
registers, where each bank covers 32 triggers. Multiple instances of
these registers are required to expose the full trigger space.

Add static sysfs entries for the banked CTI registers and control their
visibility based on the underlying hardware configuration. Numbered
sysfs nodes are hidden on standard ARM CTIs, preserving the existing ABI.
On Qualcomm CTIs, only banked registers backed by hardware are exposed,
with the number of visible banks derived from nr_trig_max.

This ensures that userspace only sees registers that are actually
implemented, while maintaining compatibility with existing CTI tooling.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 075f633ea9e1..123ac862d8de 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -511,18 +511,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_appclear.attr,
 	&dev_attr_apppulse.attr,
 	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
+	coresight_cti_reg(triginstatus1, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 1)),
+	coresight_cti_reg(triginstatus2, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 2)),
+	coresight_cti_reg(triginstatus3, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 3)),
 	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
+	coresight_cti_reg(trigoutstatus1, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 1)),
+	coresight_cti_reg(trigoutstatus2, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 2)),
+	coresight_cti_reg(trigoutstatus3, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 3)),
 	coresight_cti_reg(chinstatus, CTICHINSTATUS),
 	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
 #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
 	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
 	coresight_cti_reg(ittrigin, ITTRIGIN),
+	coresight_cti_reg(ittrigin1, CTI_REG_SET_NR_CONST(ITTRIGIN, 1)),
+	coresight_cti_reg(ittrigin2, CTI_REG_SET_NR_CONST(ITTRIGIN, 2)),
+	coresight_cti_reg(ittrigin3, CTI_REG_SET_NR_CONST(ITTRIGIN, 3)),
 	coresight_cti_reg(itchin, ITCHIN),
 	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
+	coresight_cti_reg_rw(ittrigout1, CTI_REG_SET_NR_CONST(ITTRIGOUT, 1)),
+	coresight_cti_reg_rw(ittrigout2, CTI_REG_SET_NR_CONST(ITTRIGOUT, 2)),
+	coresight_cti_reg_rw(ittrigout3, CTI_REG_SET_NR_CONST(ITTRIGOUT, 3)),
 	coresight_cti_reg_rw(itchout, ITCHOUT),
 	coresight_cti_reg(itchoutack, ITCHOUTACK),
 	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
+	coresight_cti_reg(ittrigoutack1, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 1)),
+	coresight_cti_reg(ittrigoutack2, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 2)),
+	coresight_cti_reg(ittrigoutack3, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 3)),
 	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
+	coresight_cti_reg_wo(ittriginack1, CTI_REG_SET_NR_CONST(ITTRIGINACK, 1)),
+	coresight_cti_reg_wo(ittriginack2, CTI_REG_SET_NR_CONST(ITTRIGINACK, 2)),
+	coresight_cti_reg_wo(ittriginack3, CTI_REG_SET_NR_CONST(ITTRIGINACK, 3)),
 	coresight_cti_reg_wo(itchinack, ITCHINACK),
 #endif
 	NULL,
@@ -533,10 +551,50 @@ static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	const char * const qcom_suffix_registers[] = {
+		"triginstatus",
+		"trigoutstatus",
+#ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
+		"ittrigin",
+		"ittrigout",
+		"ittriginack",
+		"ittrigoutack",
+#endif
+	};
+	int i, nr, max_bank;
+	size_t len;
 
 	if (attr == &dev_attr_asicctl.attr && !drvdata->config.asicctl_impl)
 		return 0;
 
+	/*
+	 * Banked regs are exposed as <qcom_suffix_registers><nr> (nr = 1..3).
+	 * - Hide them on standard CTIs.
+	 * - On QCOM CTIs, hide suffixes beyond the number of banks implied
+	 *   by nr_trig_max (32 triggers per bank).
+	 */
+	for (i = 0; i < ARRAY_SIZE(qcom_suffix_registers); i++) {
+		len = strlen(qcom_suffix_registers[i]);
+
+		if (strncmp(attr->name, qcom_suffix_registers[i], len))
+			continue;
+
+		if (kstrtoint(attr->name + len, 10, &nr))
+			continue;
+
+		if (!drvdata->is_qcom_cti)
+			return 0;
+
+		if (nr < 1 || nr > 3)
+			return 0;
+
+		max_bank = DIV_ROUND_UP(drvdata->config.nr_trig_max, 32) - 1;
+		if (nr > max_bank)
+			return 0;
+
+		break;
+	}
+
 	return attr->mode;
 }
 

-- 
2.43.0


