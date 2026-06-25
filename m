Return-Path: <linux-arm-msm+bounces-114492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +8wkOCj4PGq4vAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:43:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 449B36C4550
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:43:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OV6PFj7U;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BrQ4oa2y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114492-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114492-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16A2630166D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BFB3803FD;
	Thu, 25 Jun 2026 09:43:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6712FD1AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:43:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380582; cv=none; b=JxLTCcAwxSOMIgMMqbeodfDJN/D9OV9LK8gVglns7DzJa6cq22Qkccw9kc8UJgp17K1LdNEsIzPkPhf+48Y3LBg3P7J21jLcAzYaMW0k5RBqfON9BWbdTRRunIFLfWd4JNTI8fzs8yncQVnCF+WKI8SDZyqiYNUkeNkfbDSEBxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380582; c=relaxed/simple;
	bh=GeZzJ2lUUyqOawlzry+eBfuMH/i9lZW22xMIB2YOYZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WAPt5UGx2igYJ4iB2C9Tu4UzbNMy9B/ezT2NpI8taMuXh9Yvf6T3f0wObjERIWllvpe2s1oeyIC0DhVz6NtLCRfyQo9gtM2DQ7fuCkFXaY2jivD4ClFapuy8TPaWm+iIKgqVSMInd6yftTj2CApJgCWeOMn2+k4pivKNktK92eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OV6PFj7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BrQ4oa2y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pIDd1921341
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+fUJ9z7/1Rya1MBrHCkQJY
	9zUrIg/DgVL6Rli088cxo=; b=OV6PFj7UkQxzbqCn6tJEMuGDqAu4Wm0ytBQDPn
	hEmVAAU5fElFR32mh4H4Xv3NFbpTNjHWh8M5U3bFKp58s5/XiRQFUhPgJocaGJaY
	4G0W8wDFLNl4OV286anWeUZWs2cE+8cfH5hr3MiGzvV3OC/gff7vwlbttyNPRh78
	smd4g1+VBgHbk3YnepHzJiGS3D5/6KLCUQZxVJEWxHZJrz9gRf6aoIdG2LuXFKqH
	Vah+gVWEE8BVLW4hq4uqlEWFynRGor9e2Jl2UcCA4BMrU5mBvb/hfUHljFjwmGnC
	URftZsepG5VwjCdQR47rVXppt0ZXs32ahsmPYU0qlGdCFK3g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqheux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:42:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-519fd49d101so12383171cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782380579; x=1782985379; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+fUJ9z7/1Rya1MBrHCkQJY9zUrIg/DgVL6Rli088cxo=;
        b=BrQ4oa2yJuDVx7IbePOJFDNLbmowIuEQGCxzxHycuey6O94/4gl1C5xo49si+64m+y
         5OcGibvIvG9TkpIdvlK02emk0JPubM6FD5gfTbTgjY74QiDl9oCgSEMyJ+XaPY2td24/
         Tu2xbzwgLnY5NZMUqUQTtQK0M5RA01O7E2KY0e+aJWvlkLTG9P+gAhmbBLk1TB5MfgsG
         wzoTxjR1RlAQLEjuFjQTRitKdVUB58PHNKGZ3ejcY4/O6gaKL5zcpIlAmlOoHLcey2AO
         vaH4qezAr3AzPExJekM8zZFC4Nxvv6TCc6vaY4L5cWQA1UkcGN+X5bAodE0AtN2Bc+W7
         sDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380579; x=1782985379;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fUJ9z7/1Rya1MBrHCkQJY9zUrIg/DgVL6Rli088cxo=;
        b=Pn56cPHHt5aPUrCZ5ji4Hq0MObyeoDXCMvBZBr57YBPp3IcYvWNG5Jq8g+vi3EQXtM
         21LTM4SNnBckRTp1izIyoLaTfAyOzKjgtfzq/lQs9FgRzHwbEwBxJsj6D5GyIoCsOArf
         ddE3WCsUE2bogfR37JP+95x4Z0oC612Nj6+io8alFfcqr4541yQrrjOX92TsfaQx1VVG
         cN8nTGJuLovLwW4bJT7c8zqJWlCulxbhApF2DhTXmK4Mf57IHXID3eTDgDOa+NXxoIlQ
         Q3+Yul8QYBfsn2cmpHNSOBxZh4Rk493gEmWr1pKGluH+GhxJiw1gg2xhjfoeoIOkYmlY
         0gAA==
X-Forwarded-Encrypted: i=1; AFNElJ8fi5zHFjk+2WiuTtSF7a2TiGy+v+YruNlndsDIF76YF8Os0K8e71TgB8WTGzlDC6cMjmm/76GdoIIiOOok@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwn97JM2HHqpRKh01Jivf9O76TO7AhQ1m9VVnDqMuyfffNi/hh
	kxfnzwKZZL6bkLBuBQyy0QMQrVwpkX9vCKjk8+R4hC2RyJJdVVdjKXVVRxCwqidCw3YpzwJdb8D
	naXi05yhh5exhKRjOEMR7ojx7CCRTrIA0cQd4W7c78+gGC221h/G2t90h5vbqZcYmt08Pg9zm11
	Ebm+k=
X-Gm-Gg: AfdE7cnAAUeydy5auVBCVogGxrooVz9nptcu9eggjqCBFsYcmuPvDOJRw5oCXggNjVZ
	RkYYPEVtL0vBu/fvAlaO30dRgntCgJTIz1cTTMbTx5+GoffqOcjXEMPoJnSO3VwV4sHOS7+uyUZ
	EenpDOlKs99qc9DPjQ+aO9pjIgr91qqGB76GzGVHYPAMKHf/MxUfxaL9AxgnkC4gs+18dLHEudQ
	XYCobz9Ff+dECOJQ9mgxs0V3QuNZ0jcD7GeqHp/kxnoX3k2vswjavrXsWG7/sd4/Awm3SspfdaD
	qpZUhICirx2KvxWuwQ1/FiGQmF5XvV4+Hxqd2M+2aoO9n2zOUsMV7sXUUAdrQBK4oTi5E8uoq5W
	rNbDw1RrWEueDybuidpxC6IP6KMG/XHC3sooszffnwARRoMbaawTWhXCXSvCYXfEp26+PZ+Py/q
	fW14E=
X-Received: by 2002:ac8:58cf:0:b0:517:91e5:108d with SMTP id d75a77b69052e-51a51bf8868mr151889871cf.42.1782380578716;
        Thu, 25 Jun 2026 02:42:58 -0700 (PDT)
X-Received: by 2002:ac8:58cf:0:b0:517:91e5:108d with SMTP id d75a77b69052e-51a51bf8868mr151889641cf.42.1782380578260;
        Thu, 25 Jun 2026 02:42:58 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a6e7669ebsm15037901cf.12.2026.06.25.02.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:42:57 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 17:42:45 +0800
Subject: [PATCH] i2c: qcom-cci: drop custom suspend/resume and rely on
 runtime PM helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-cci-v1-1-a100cda673ce@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABT4PGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNT3eTkTF3j1NSUNHMzsxQT4yQloMqCotS0zAqwKdGxtbUASFSZY1U
 AAAA=
X-Change-ID: 20260625-cci-3eedf766d43b
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782380574; l=1696;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=GeZzJ2lUUyqOawlzry+eBfuMH/i9lZW22xMIB2YOYZo=;
 b=y4tcfj8mA/WqgImYz0vooABkfL2DEx5+/5V2i80MAcTQI7vA7eCjNQitwNBRVPLIFzFp4oObY
 wMnYB0V0DrlB3B+oHcsjtk9Nx4MppDvjo4Djgm9KwMHCeqbGWMAebC4
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: _8DA0ndcAwDFLcGqHED14NbsYXrBG8qw
X-Proofpoint-ORIG-GUID: _8DA0ndcAwDFLcGqHED14NbsYXrBG8qw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MiBTYWx0ZWRfX0yUDoUp3wLgP
 OwulPfFST1ySe4+NbXU6z2T8Qgk8X1z6DeWyor32Imj4BWVH7rL64UCCG4OW69hYtNLUy7GHp3O
 sm6G16ERJfNg9EZYuRz7YkYLb19TBxU=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3cf823 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rHcAlnMhGb8R5zFVClEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MiBTYWx0ZWRfXzWAfcy49j33n
 zMjWz/1rQk5jb87zHvFOVEqA0K4E+9wtl9fvDXuEwGar2Dm/LBqx9Itqwk5T/hO6t3cZSKNPTs0
 6RbpaSRRuzBX7punYJpOPpP7o/2M8+asSnXSz/iUmmO+laV5JxPnj7Xo3YPav67brFYXEc8go2L
 PCU6egbIGQxKviyRhy+bqDRhsuNjOGB/9+NC/pdho2C+MGC4kRCigEI7B2Z8r012e2u4AgL7q2Y
 tOQo3ljS+0krfyOAatlosyvrJqawJTRVII1goR3tv6qG1idXmYpL00dkrupAI/VwwBf+Z1nPpFR
 F/y11JgNZaE+ACNtLfniSM3cGVjbGM21x/pLd1Kxa5xifNv6zOI8qAu39Igssh0JxHEQoNsfcCc
 ZNcAdMq2NFHbCZe+ImmlnvGVTzrvsmGHDnzrsAh0N9w1z4SmOGNRI+ZpCM1nBjuAojZnltUFX0Y
 mIIhT9telULFBRxaXhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114492-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:andersson@kernel.org,m:wsa@kernel.org,m:todor.too@gmail.com,m:vkoul@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:wenmeng.liu@oss.qualcomm.com,m:todortoo@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 449B36C4550

cci_resume() unconditionally calls cci_resume_runtime() regardless of
the runtime PM state.

If the device is already runtime-suspended before system suspend,
the clock is re-enabled while runtime_status remains RPM_SUSPENDED.
As a result, pm_request_autosuspend() does not arm the timer,
leaving the clock permanently enabled.

Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 4d64895a9e9e4e0bd5e0ccb5c3cc04b282b1e4d5..bdeda3979c4814b5cdb463734b8361da7fffa879 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -492,24 +492,8 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cci_suspend(struct device *dev)
-{
-	if (!pm_runtime_suspended(dev))
-		return cci_suspend_runtime(dev);
-
-	return 0;
-}
-
-static int __maybe_unused cci_resume(struct device *dev)
-{
-	cci_resume_runtime(dev);
-	pm_request_autosuspend(dev);
-
-	return 0;
-}
-
 static const struct dev_pm_ops qcom_cci_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(cci_suspend, cci_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(cci_suspend_runtime, cci_resume_runtime, NULL)
 };
 

---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260625-cci-3eedf766d43b

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


