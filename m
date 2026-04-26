Return-Path: <linux-arm-msm+bounces-104555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKilEL7e7WkzoQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 11:45:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B27CD4694FA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 11:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D6133011C75
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 09:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AFA1F4611;
	Sun, 26 Apr 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etgcmWK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0siAFy8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FABD2EC0B0
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777196718; cv=none; b=X4UH9yApseFvHQRB9u6HIK2vD3qSk5uOYKOP2qSO4qs29xj3O2xP+1fyLaz9fR2oPYVJcKVoDJwCGYlKjA3qhFK2Bn2OEKJLXl02fPXLyCAj7desxJ81k8iTlg01Dl+ANDlAYAQelriBmtGqXwjFjBrl2qe32PRUwOh1H52+Z3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777196718; c=relaxed/simple;
	bh=OLSSErJr7xMEKOb+hZ/LbjI+CM4RcZpu2NN74Ss6L14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2PSAiuHhLrzunUjLCPnWTmo8AaH6WnRHn+QsQdt3pMm4un8dwd3tpKtUl1IF+zvZHCNi5bJnNvq8p0NxRVo3US4uHPEsum4J6ZBEwzCTGyJcsFYYFnzSmowGVcwvLhchrT2fpQDqJcxRYcHcavIl29JoZZYwTyTseyh7mC9PWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etgcmWK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0siAFy8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63PGNJjS2174899
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTnLO3v/ufL6HWDonUJiHCmItAGVK6uVk1cXg/u3TdM=; b=etgcmWK9lHODkmCJ
	fGECgZceTOx5wMwwwgSOi8b1yBvXnMnj9p8olaTzzIwK6flD059YYAL3pW/PtR9L
	NdN51bOO6mjtYNsZnj8Hohhs56emtgaJdwKJVRJfiPhvDdbgXgIu5vBqaZrPc4P9
	z5RTVOBNYKPRji+rBGf1uXBhiYqEre4JrCh6Ckr860nSUnNuWwBXKk42c4qB3lUu
	gdIfOw3UwuOrjO1H/9OX+47vEw5ks2HDiAx7kxcX5fNDr5TqacUtkFBLsQ5XZLY0
	aCBXSamUySy7d1EZC9hy6aIJxYxZYzm9Lx13b+q4eVB+s6+Ck97WNy4dq0tcT29y
	2VKcOw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2tjgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ed279eedso63214065ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777196716; x=1777801516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTnLO3v/ufL6HWDonUJiHCmItAGVK6uVk1cXg/u3TdM=;
        b=S0siAFy8wjNxATHFaMkoz6ps/SKA/HFEpoPOeXp5oveCvLRiue93VDcYJACtJeqAqY
         GHWQeW7zW7UDlZ5jOTWhBMYhFopi1Ys7iz8621CUuTvUkhoA2dmtFFg+7bFhEVSdI3/U
         bGBtAqe3Gwy+Ld8JVeJUlGRfjK8IsIQRbctQozOAtA3UwjZqsoahuNwkYf19nbqPQBvZ
         Dctvz059B1eGM3pjw2pnEP4YLHl9qu2RcEhRz7WxbEg3/UmY4S/ilJp5MJ0AXI+CNpHp
         CUuyIpBGnNy9N1UR2LIDOo0qwMQ+/6KUm6S7U7qwlyF7u6N904JzPHbS3BQF5w7Zn3p8
         H8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777196716; x=1777801516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTnLO3v/ufL6HWDonUJiHCmItAGVK6uVk1cXg/u3TdM=;
        b=pB7En7Al8e204pHaKRSrIWNCNPCSkd5fe/OreVORTmoBRDCd+fN89BXKUNWeeY+8u3
         W0ufPsvyUoLJYLOE6TKzjBC8MPgy+2pLCvO4w55qZCLeWDEI0W2Bi/wjNm/VY3Wp3qeE
         3Hdm/r8XTMiAneGjD0PEZofJ5kXR3Sv36rJ7XKCNzAvJvYjW8GMbNH0a801nU3aJFoZh
         cLifZFrrXlRNug3BsP2A0yg9j2ujHr3WCnIoQtayLK9J4TU73aqrvSE4AeZZ+5+X0HK4
         V/WPOKiNaG7TWJh7EkUXMzrDK5ms2/W9I92MrticBq+7EUnfJweDyfHiBEtiLAMUVpDn
         yvpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HqEGCiXTqoUdb71vbjWKnyXb5kz0pbu2J87fIji78YABvNPE2WE84Q5jJleAsTcZoSSAc+dygV38978EJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfOMsNWToBiACTWDmKSv3eQEXc2rWSukitc75XY9HAYmB7Evs
	7ABWR4Pf++zDJz+bHP2HU/SpUKuI3pZgHZmJYDGETEDE+fK+pisMtHnimIwZUq6vu0xn/anGS9D
	GesiYX8TvPIpqPARvxeo2X4IM8GA1gRySA0/OuuTGX8tLgmV9fvopvcOh4iTkcLOCceZW
X-Gm-Gg: AeBDies6ZCvWhaOV+9WIAR5QOc7u/Ej/STTTHl4AYXNFb1ij5mAB3Hu5j3il08G66A2
	B4OhQzbyJViB6cESazjV9iB4UeJN6wBwFuvyccAzHt8gHVHYF/wBGKuHOEmG2zgCiiC0/q0MRQ/
	GsXJsnXNAieuSEVjdredVUz8lseYX2F/LgIFJMUEfAQbY1E593rkyhfwE7Xz3+dY0/DnnPqsnky
	rHKrSj+MtvA5q5BpFWLF3AUIIbwpVQmCRWmiiocQ6WOElDdZ7KEwDz3MY+CisrqyrC/XHTmfwiz
	LfyNVOQ8UL1KJcCVALt7l8G/UN5Xyea5eeFkfrtTnFHoAJ+YraKbFqWRHtpdFj2qWpcpSlCqSS8
	oj9EVWWvpXmNIdHRwVA1M3qc7HpOpdegVYnDJk/lfJ/lGT76gqB2AhdP7kjvJ9ANE9Hv0pXMeqa
	ahgH5PqqjcZ3/P/YzfbS7Stntw
X-Received: by 2002:a17:903:120d:b0:2ae:8253:1452 with SMTP id d9443c01a7336-2b5f9e8195fmr412637005ad.11.1777196716302;
        Sun, 26 Apr 2026 02:45:16 -0700 (PDT)
X-Received: by 2002:a17:903:120d:b0:2ae:8253:1452 with SMTP id d9443c01a7336-2b5f9e8195fmr412636805ad.11.1777196715822;
        Sun, 26 Apr 2026 02:45:15 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab208d4sm294960905ad.55.2026.04.26.02.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:45:15 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Sun, 26 Apr 2026 17:44:41 +0800
Subject: [PATCH v8 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-extended-cti-v8-4-23b900a4902f@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777196695; l=4661;
 i=yingchao.deng@oss.qualcomm.com; s=20260426; h=from:subject:message-id;
 bh=OLSSErJr7xMEKOb+hZ/LbjI+CM4RcZpu2NN74Ss6L14=;
 b=rIBj4R3Di+1yR8dNdgF+nHpt5UGIVdG09pNVsdxHQm/RGUTcM0OuFsgMKvZA1tO2yFe0EVzWQ
 Jj75zoM14SzAWrvwKEdYSs3i2cWj0S7Yv0miEAYqQKslPdcqt9lS0Sr
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=aufKZC4I8k2lqi+B/z87rB5kPPybOn8C3mLosbtw+no=
X-Proofpoint-GUID: EkMgx2kbM0C7iwf9PjbWjBUuIttA9cZQ
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69eddeac cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2umZ0bgHSShhNh9j1XYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: EkMgx2kbM0C7iwf9PjbWjBUuIttA9cZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEwMyBTYWx0ZWRfX6JETnBUKMdfp
 kYmk9KbwMXNZGsjgg7rqzrVbLM/4tJBuqxQuS2tzFgIIfqTu2aD/GljPVCexKqxxsJlFZssNHVV
 pHudp4kyYy0dhOcY+PFw5pwWFCcji7gXrg9NMIqabDcyKrA70PSqQzHiWiKL9sawThTRk5Ybccg
 pRAhjZ6+d4f7ZA/QTtDpZyDyyAVmPxYquHYc5IktAen3jVJXEZOPZJDsxrQtPXcsU5pKBnKNpDA
 04lWGquJWK72r0OGLPC2+51BNGhEhsohsXVFxErdE8Fko6DbOSuEY1ralIeg8NMFGTm3uw7hUKB
 lPpywNe1TQQ+lFm3FNVjSIAx65uorKwkiwViDFzf676K1qXSF/7vNuvfzhaxlUx6Anpz2PQ4n2o
 LCmAmV+SPY4Mv3hgvUjvjWxsrEIZAPqcot7FhpVS50jBWlrpdPDzeVjFUISmFSYVtlOu0N97fRT
 YVgcrPBnNmSeyp2IySg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260103
X-Rspamd-Queue-Id: B27CD4694FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104555-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

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
index 8b70e7e38ea3..046757e4e9b6 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -512,18 +512,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
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
@@ -534,10 +552,50 @@ static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	static const char * const qcom_suffix_registers[] = {
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


