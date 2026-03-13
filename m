Return-Path: <linux-arm-msm+bounces-97378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JKLIOfSs2l5bQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:03:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F172F280271
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E334306B79D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E759C34DCD2;
	Fri, 13 Mar 2026 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJUSP//V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcGJX/fQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAF93890E2
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392581; cv=none; b=cNURH960f2kKPyuye2JSSMUQrUKQRh8d5pil/0n/cZwJXNYZJbcp/9hxyrBTynklwpgfIOSHr0dNKVy8Hc22PCyRUtAigDheTRr/mRw/A+7Hp6ZwM6SonG0ZH8EVEjboATCohy5/cKidhGSYIhz/6MkcTil2apJ20Ioh/j00oO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392581; c=relaxed/simple;
	bh=SHQCxyqhzOhDvbMmdapiBeYjKlWwzGTzuuL4qctEsok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGWJcOiOuVjDLQXf0AB5XGgv1xrhMalxHd1lDrb0PMdGF/nZtwVTkho0AXHzacwZQFSjCWViETrfc93X16h6sO6WVvl7mAjKmZuOtE/HP+VJeQkPTOO8GOTV3i7BkjwKFB+5qeKOXH/lxm5fKgdO8yIjo7V0W2pkdsQjJsILEzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJUSP//V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcGJX/fQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6oVOv793577
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3QKe9UEvF2DO5cfYaW3eH4Kymumo+ieIlTFLLIUxrU=; b=QJUSP//V4NS+aQIo
	n/iEjSXTXQFa82nnGfgR3XQ7XZn16yizAvPIrYC0Xf4ZkSJWhaUVhQZ16Rrlg+8f
	h9bJu05RqPo+tdjXk2Ji6CECtbs5FLIZOlql6vd8X6cjPpl5zOSeef5TZPgouaYV
	LAD0ZRFsMboM+i2ftLAYLERyarzqoHmNxbDGZ6+1K7+uKaghX/YlQ9PgKcFQIyPB
	hcgaXyulZZGZ2g82T+wDC/nDXURAXhErKcr017vfMI1xXtZB5JziIf4TGy9Wposc
	Sj6LMoEgskLk6A7XJAggwv+LLbk4sv7bpoByomC30gKgeqNda5OA9JaQWzkYJIZk
	r37fNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt0g1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae6dd98043so20899845ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392578; x=1773997378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3QKe9UEvF2DO5cfYaW3eH4Kymumo+ieIlTFLLIUxrU=;
        b=RcGJX/fQxzMdjCpaUCTG2IVGThG0ZlfIJGp51uYPlX3G8AWIaXagPWndh58iGQwXhT
         FgY3T0FLXam6h9ATLjxDaT9zC8JndQ5eF+yQRnFjBs2UqSzlYA7slgu3eHBvVbhP7b+1
         Aob0hKlHHrtQjCCmFL6Mzvbb/YTs3it9NlHIEb/6Vx0AI6pCFBuTuGAB62ijrYtzdiai
         F6cVL9dI6TpeKUhXw0UnoUR28ZhNrlb6kLZ2hjrMJMzjf/GUBeBs/YOe/pRJ5yTCzaVP
         z2/vNKL8OLF2hik21Xx+ShJ7xqBZmgECH4qTP+/XAlu+MswP3mNNyPkkiJtlHGDT2jVR
         nG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392578; x=1773997378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e3QKe9UEvF2DO5cfYaW3eH4Kymumo+ieIlTFLLIUxrU=;
        b=cI2cVsHgfxgxWTdZRsDn9vypdeZ5FQoRDUgPf011Sq5qliIPqaKFhJYbvaI/50CrpJ
         EIrZI97Gj6FjgkmixwF6lhEO1R74OG7kMsqrVwcG1nGNG36fOv1FvxgxxnZZlBc6niE9
         BY70SI76HRjl71AFdMapMJMDZA+feUQOjjdTwNqnUns48tBhPR0RB20gupgWRrLNSdc9
         4rILeb2m489Kegb5Vv0m0qXxSM+RsSeeFCe5uNx7ouesizNqzUxMf+de+pWC4HwpdNUY
         UwXdTbY0p3xLzr715Vv7sEXhGe8/n/tRLy0KWGDuvbNpXqga3Vm4M5II+jWSZqv3Xts2
         GC/w==
X-Forwarded-Encrypted: i=1; AJvYcCVbGtMrvK9QfRR9OQB0G0i19241NJJ2r4DxjDODCDSTllfbEWkWI4G6eE/nJ19BJvoNGY6AM50RBf15HSAt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+SbXCOlsXPcglWXybYYxMAi6+mXFPlqsAvGqar+thVR3nFMzW
	mlzG+IiJ7ZQwwJFliIxHNcolU6y/p9lPhuzY8ErpiSgqWbxx7KFgCT9LWHZID1obW8DpdVtOUOj
	nk32LjbRgQyy0dbL/o03/nKBsudVisJ5Z/UpZFsuK6PTKQxBA78s3jqYiXnQSjIH95+JJ
X-Gm-Gg: ATEYQzx1pr6qK1SW24gEKlKMLwAQL5E4xlMblKO/BpTjLp4ZzVIsiqnJpTeJCag54k6
	zJOqDIXVhmTI8jbEvKL0I1zFrOKdxpyF/1PVpZPXZXXVg5rhvgnjikjLr1r85D6Q3PYJZM2mKyC
	+TxJeyZOdIWpIDLi7IuottMeLT4DpkQd4Jk+RvimEq0CYgQjqRWLF53/CrHMSW/N0ofgHozOJf4
	PadwO85vY3AAyYUhToGr9qlpP33B6Bh4MXuiNmP/4SVt+qDBhDRswrgABKNhCSJy+5G+O3PkI8E
	9N+2gRQkAhC1p0AVyz/d5Xsge6lloa3OgylMOhIlba15Z0jATmYhkyjGwPlS3I28guTvvA8rKvX
	HjdS5t/SHKbpbvgfhw61u/AH2MOCjnsRBQfogeIKIegw84RVRPN1SMnbSyMRgq7CX/KvJ0xe5AG
	xIwCP2GV/L
X-Received: by 2002:a05:6a21:7706:b0:398:71b6:33aa with SMTP id adf61e73a8af0-398ecdf29ddmr2038621637.64.1773392577538;
        Fri, 13 Mar 2026 02:02:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:7706:b0:398:71b6:33aa with SMTP id adf61e73a8af0-398ecdf29ddmr2038581637.64.1773392577039;
        Fri, 13 Mar 2026 02:02:57 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:02:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:07 +0800
Subject: [PATCH v15 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-4-1777f14ed319@oss.qualcomm.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392552; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=SHQCxyqhzOhDvbMmdapiBeYjKlWwzGTzuuL4qctEsok=;
 b=r51Dn3HQ6+cRTi9Bx+21pf6jblf+Slf/fo169jNssmIDb5fBcFkHf0XkqJIAVYEoIHrgjF6V7
 uWc4QNP8xkpCMCX65JnUKBnylEf39DUaaagbjqPQlEyMbdU3Jl1MLyG
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b3d2c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Hay9cutlgjFfScRAm1kyNP0Dj1Cctgpr
X-Proofpoint-ORIG-GUID: Hay9cutlgjFfScRAm1kyNP0Dj1Cctgpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfX/lFeyheW3wNe
 KXEGadnkoBbHtG7SF808LQucNuZ6XAKLhCdMGbiE5ULkIjDvL1rG60rSDZg76SYSccSij51BOlx
 zazgulvN8dTrYCo1Z7ndHvuiwJBTH0kmxkfemiYdpQuYy5Imi0HoAKzJDqHyHJa3Mf6fEkP42Y7
 7uC63/agfFD3EioUuDl4bbPfJpKvLu2tHHp9/ek0Fsqeb2NbcGDgEfx9n3vxU3tJID2KAIQrs+L
 OZ6tLbHGs9nmlDgIn04pPNm4k4FyltpbT4f6JiWQU8guKoGO55TdkYzdvNr0sA+8QaSN1ZG2+h6
 EaQee7fe/SJ4foDQvROw15ZrYi9YAsmNDCplGJWG6khtrGLYfz8reuX60OQRfhRTyOnDyF1mSln
 +L6uFA8PJntfqmJa5SXd7LBuy1xcIay2piIVbUVtIZfd2adM79B/xBVvbMF/yNu8xkKctN2CaYb
 8hJ82QKUq0pz85KI4LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97378-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F172F280271
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index fdf23e1c932f..eebfe45b82b9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 4d80105d3fcf..00a0b3597348 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


