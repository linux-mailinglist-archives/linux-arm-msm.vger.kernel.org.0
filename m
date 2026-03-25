Return-Path: <linux-arm-msm+bounces-99791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G5HFcJ2w2ktrAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:46:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F003131FEEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E765F30BC108
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A4A30F548;
	Wed, 25 Mar 2026 05:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiZGZjY3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4G2iMKJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B15314D1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417452; cv=none; b=sDLGv0ljv6UcwmD3JyZLqifTKx6d/5naEkbKIz/rO+lTpvu3KT+sLCWuZVUVJSylvUX04QsFNF+mP9rneddi8/QUrLWZBxzT3etjGe1C0Nco/40u0DUECyv4rr3OQs0PtMCkZKfSsRE0NDzs/mOSDtnwO0iXI07eE9QpTmDutHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417452; c=relaxed/simple;
	bh=tsL6V64wIF8Vfwl80JY3mqBfH+J4HRNO08L5h5sdEfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhwClpHUKl8Ig00Qb9nRsi3m3+nvVIBOj12y96+Mt3u1Ezcy5e8MZgqH1fvf0DEfXw8iFITusy/ttPC4AxPYCb5XvG653BuHAB0FxbJQSQWTQ18VUKFbXoBRHFMaDdltqKyjxCWoPmW1G8gmFpDFLS42k8Vlgc0LLW37X2vHDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiZGZjY3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4G2iMKJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4srFU3110448
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQzcZFRQRIe3UKXb4FlRrFEi/jWZoZmnUtf/AMN/Ogw=; b=NiZGZjY3SFMHnPFt
	X0WQNpSEZD9A6EaXQ+f5Snw3WZSTbTjt4qJQDM9us1cuNp83RTnmPrDiMJ2K5c0n
	50Q/vNdr+jOo6JXeWGA6YswxpEFgCAK3dslJjzBVVE2NQgAa/9+DHTv1/9vsMMiE
	VQlNW/5sm9tq/szqsa68u7JE9jhQtSBrsaAYglrrVMVnemtTdzviRssY8RViFzyZ
	TFufeOBJNVVRK5aKBtLTjbt2BgxpQiIoHd2uD1IXvN9hOWBYU9KklyTKHvwbidnl
	433DnG6XuC945cf1aErJXIdKjJUNOvyXYV8xw/AWD8Btw/Errc310h94wpedF0ji
	7m1GZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvtwrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:44:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b06395b8deso30204485ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417449; x=1775022249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQzcZFRQRIe3UKXb4FlRrFEi/jWZoZmnUtf/AMN/Ogw=;
        b=I4G2iMKJPrTSUK3KQyto5rL3c3WHlS2qYNpywFfUaiBQh+pUWugar3nWQmWf7dVko6
         6pgsfULtl+f9QmNf0B+sDoLeUnhUl7H7ClpUT11QDjgfr+dd6pGJFdBbMUfctwBugss7
         Owk7W88BLajuyTiC8OqcN/BzTfseJwIREm/V8bqDcgRmW/Tmgy2rPP8EyWTGOf1Zs3Rb
         FLVtetDutS48t7gdKp36wTJ0WFO3j7fTo0TkjlKpwhzzWB8jent+wi7QsUswnR6cxIcD
         hy1GHrHs4bkHfDKvDk+hft4QPimgf7/zL0TVfmIpIOcybubv62rglHkTjEVm4sYPjlWT
         9Oiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417449; x=1775022249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JQzcZFRQRIe3UKXb4FlRrFEi/jWZoZmnUtf/AMN/Ogw=;
        b=JIqWqiE/COBKOIBhbbvegE7tJAamg3MScqXkQCYYnMgz141qDt67qUw3pkMeYURraS
         geETMx1TyfZq0C8sRriZNQWsfepjCxMPv/LHInBzGyhdY+ORDBExGryWHwp9+jE2RfnV
         NlxCjKkgcdtC4NKp4WgAA4VH5R9w0zEjGi3SAOrSx0/SKTh7ESMNOt5mpfqQueqpgTrx
         0kVyWgz8SmDACYWWaOOMvv7rQAC4dCF/ixK7E9Qj3Vq/5gNMPaEDaSAb2iJ5QCRmcRvX
         66zgmfcAlaJo7sI+2o2qqwdxPFr8TWRDvs2N7IT2BXGCbXv3LpKiIE4pNy4QPwbMF465
         ioWg==
X-Forwarded-Encrypted: i=1; AJvYcCVnTb5e8ZN+br0GVznzylLUpK31g9JbB1xin4y5/d2pCrKHSpQ2fL68u2HTgEWBrLnUveFztusAr1eUZOTt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9TCOex8WN2MGPOxvfu8QU6Lcfpw4ywTbntnCKTjcgxQUlHh9b
	/kthFDw/oe4IBZDSCDUlrA9DuXbSmOdIZ0R3bzHDiP0tmL5Ah4DWUxaBx536R0O14wuFbf3+Zo1
	BHGtEu7m6q4FH82HX5QEn8o3/6jtgbzhFcmmL1E6IrIdvceVWUUt2afpCdkNwE4PvOELC
X-Gm-Gg: ATEYQzy2uloe2iRJQiIfUrTMbscvDqTOtLr68IbgKj0vtZiB14pWAZNZQA//TKFKyOS
	229talUdUOSvzWMSvvKWCnYYlBuCJ6DVV6zsMvC7mSzWlSAJkpMgMijWS39m5lprMLIVFqZFuCU
	nWGK7t95kPKxxwLNuCewswJeCEy7eRLr/SHO3aZOAEOGg5NyL88K/VDa+zrZzApkzhi9wEPQUfG
	2vFgs73aUADyawmVfdWiC+ACL5IWL7XrzqzNlRV4YaDe5TxUBJpC88M0BYTwpZ5TBznKwyiT7gt
	mk8792/RxqVjSS/8QDBDc+L+id0fpWT3AYCHOQKfNCj5An/jIERPaYtsjJzlybhgaHskq0i5HAh
	djqTxNAO5QQyCrntLGymrevZs5KfWvEdWSLxW1j90d/kpbfJP7fIMf6I3WPMtZ1NitbgVtrOIVg
	YkXlngKkOSTCJTkw==
X-Received: by 2002:a17:902:d591:b0:2b0:4b3a:9b4b with SMTP id d9443c01a7336-2b0b09e8568mr25984075ad.16.1774417449102;
        Tue, 24 Mar 2026 22:44:09 -0700 (PDT)
X-Received: by 2002:a17:902:d591:b0:2b0:4b3a:9b4b with SMTP id d9443c01a7336-2b0b09e8568mr25983705ad.16.1774417448521;
        Tue, 24 Mar 2026 22:44:08 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556f6sm219985805ad.49.2026.03.24.22.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:44:08 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:43:46 +0800
Subject: [PATCH v7 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-extended_cti-v7-3-bb406005089f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774417433; l=6755;
 i=yingchao.deng@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=tsL6V64wIF8Vfwl80JY3mqBfH+J4HRNO08L5h5sdEfE=;
 b=tx726oeyFvbCnTOQp3JfZzxjdXfeYZd1ALE7Mk5SBqWKrsk0fUv3xrS++jS3n/gLw8+YysSCU
 JbRLrJG20QuB580j1reWygEgD3vvB5fL+BsqdvMYSRq4aqPN0KgahME
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=5tp504LR96W2IVT3sAbRCqWtoG16CxJVUnXJSfU8NlQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfX0LaI8i4Rlcem
 xKLiet6NmEu+gyhN4Yh1c+Ys6udR1JJYl2/revx7GO+MBj6/MDAKRdbJoV8BmIebPWgMNc8ewO0
 okjR7XyZouY7FlcwTxBGKkQMma3E1fdDm4FQsbxoaKRe9RdQD0jePahZV/pjxAFYlKrYx95SoOj
 J+sscm4MksCpEuPNQ5nrp2J7cG+kgvRzbxPfwX0Rx5btX3lefete/aMPY7OdYYFQKwJT3EMrulP
 1hd4Yq+17mlDLk31bOpS1Aj/Ja/CqGiSD/ilviZY0ThKGOgLD0zg4hghs6g71RS7FMSnNMgiufO
 9pwUb/VNItMeJWAdwhcr6uNGte54M1MCxyO05PRJ0khzDUPGqwCMoGSkBpNvzfO1eK/ft9PDcDH
 4Ae11Oi5aSzn7Oy3A7D4bUa2PyQb0L2bxafMmubld6BEoTYsoxQEG6BAAqkTw4Maj8vrO0AQhp6
 eAGqCm83/S6VrAoZUqQ==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c37629 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7a10iwBbuTRWBBlgjiMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Lqfo9dRf1HHDu1F2gFrXKFGFqiKg5dnM
X-Proofpoint-GUID: Lqfo9dRf1HHDu1F2gFrXKFGFqiKg5dnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-99791-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: F003131FEEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm implements an extended variant of the ARM CoreSight CTI with a
different register layout and vendor-specific behavior. While the
programming model remains largely compatible, the register offsets differ
from the standard ARM CTI and require explicit handling.

Detect Qualcomm CTIs via the DEVARCH register and record this in the CTI
driver data. Introduce a small mapping layer to translate standard CTI
register offsets to Qualcomm-specific offsets, allowing the rest of the
driver to use a common register access path.

Additionally, handle a Qualcomm-specific quirk where the CLAIMSET
register is incorrectly initialized to a non-zero value, which can cause
tools or drivers to assume the component is already claimed. Clear the
register during probe to reflect the actual unclaimed state.

No functional change is intended for standard ARM CTI devices.

Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 26 +++++++++-
 drivers/hwtracing/coresight/coresight-cti.h      |  1 +
 drivers/hwtracing/coresight/qcom-cti.h           | 65 ++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 023993475a2e..afa83d411a4a 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -21,6 +21,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-cti.h"
+#include "qcom-cti.h"
 
 /*
  * CTI devices can be associated with a PE, or be connected to CoreSight
@@ -47,6 +48,10 @@ static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, u32 reg)
 	u32 offset = CTI_REG_CLR_NR(reg);
 	u32 nr = CTI_REG_GET_NR(reg);
 
+	/* convert to qcom specific offset */
+	if (unlikely(drvdata->is_qcom_cti))
+		offset = cti_qcom_reg_off(offset);
+
 	return drvdata->base + offset + sizeof(u32) * nr;
 }
 
@@ -170,6 +175,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
+/* DEVARCH[31:21] - ARCHITECT */
+#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
+
 static int cti_set_default_config(struct device *dev,
 				  struct cti_drvdata *drvdata)
 {
@@ -698,6 +706,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc cti_desc;
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
+	u32 devarch;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -722,6 +731,20 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	raw_spin_lock_init(&drvdata->spinlock);
 
+	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
+	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
+		drvdata->is_qcom_cti = true;
+		/*
+		 * QCOM CTI does not implement Claimtag functionality as
+		 * per CoreSight specification, but its CLAIMSET register
+		 * is incorrectly initialized to 0xF. This can mislead
+		 * tools or drivers into thinking the component is claimed.
+		 *
+		 * Reset CLAIMSET to 0 to reflect that no claims are active.
+		 */
+		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
+	}
+
 	/* initialise CTI driver config values */
 	ret = cti_set_default_config(dev, drvdata);
 	if (ret)
@@ -778,7 +801,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
-	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+	dev_info(&drvdata->csdev->dev,
+		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 21bcdedcb95f..9c0896b17c24 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -187,6 +187,7 @@ struct cti_drvdata {
 	raw_spinlock_t spinlock;
 	struct cti_config config;
 	struct list_head node;
+	bool is_qcom_cti;
 };
 
 /*
diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
new file mode 100644
index 000000000000..21a33b759b36
--- /dev/null
+++ b/drivers/hwtracing/coresight/qcom-cti.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _CORESIGHT_QCOM_CTI_H
+#define _CORESIGHT_QCOM_CTI_H
+
+#include "coresight-cti.h"
+
+#define ARCHITECT_QCOM 0x477
+
+/* CTI programming registers */
+#define    QCOM_CTIINTACK	0x020
+#define    QCOM_CTIAPPSET	0x004
+#define    QCOM_CTIAPPCLEAR	0x008
+#define    QCOM_CTIAPPPULSE	0x00C
+#define    QCOM_CTIINEN		0x400
+#define    QCOM_CTIOUTEN        0x800
+#define    QCOM_CTITRIGINSTATUS	0x040
+#define    QCOM_CTITRIGOUTSTATUS	0x060
+#define    QCOM_CTICHINSTATUS	0x080
+#define    QCOM_CTICHOUTSTATUS	0x084
+#define    QCOM_CTIGATE		0x088
+#define    QCOM_ASICCTL		0x08c
+/* Integration test registers */
+#define    QCOM_ITCHINACK	0xE70
+#define    QCOM_ITTRIGINACK	0xE80
+#define    QCOM_ITCHOUT		0xE74
+#define    QCOM_ITTRIGOUT	0xEA0
+#define    QCOM_ITCHOUTACK	0xE78
+#define    QCOM_ITTRIGOUTACK	0xEC0
+#define    QCOM_ITCHIN		0xE7C
+#define    QCOM_ITTRIGIN	0xEE0
+
+static noinline u32 cti_qcom_reg_off(u32 offset)
+{
+	switch (offset) {
+	case CTIINTACK:		return QCOM_CTIINTACK;
+	case CTIAPPSET:		return QCOM_CTIAPPSET;
+	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
+	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
+	case CTIINEN:		return QCOM_CTIINEN;
+	case CTIOUTEN:		return QCOM_CTIOUTEN;
+	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
+	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
+	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
+	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
+	case CTIGATE:		return QCOM_CTIGATE;
+	case ASICCTL:		return QCOM_ASICCTL;
+	case ITCHINACK:		return QCOM_ITCHINACK;
+	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
+	case ITCHOUT:		return QCOM_ITCHOUT;
+	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
+	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
+	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
+	case ITCHIN:		return QCOM_ITCHIN;
+	case ITTRIGIN:		return QCOM_ITTRIGIN;
+
+	default:
+		return offset;
+	}
+}
+
+#endif  /* _CORESIGHT_QCOM_CTI_H */

-- 
2.43.0


