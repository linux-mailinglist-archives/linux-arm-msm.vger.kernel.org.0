Return-Path: <linux-arm-msm+bounces-109046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M2cNgj5DmoSDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:22:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3025A4B69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0948B30D1FBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF1E3CF663;
	Thu, 21 May 2026 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pd63I82P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRi6ZeRR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9403CC7F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365813; cv=none; b=EoAvefK27wQNScMUHs1gHhU3u1fO1wzeeo889It9cg2qBblLiJLvFQqNnDxEnhGEdk5IUtIMAieF7DreEGa8mvmNrgfK2RMMwZESRaDQTwpTKctwCpwIsebQDwPMyI9f+xSO4+gOZDO8DcxBZ5xctKR00L6VNx070fcH1pwzk4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365813; c=relaxed/simple;
	bh=uAYfnyo0Xvvg5GFBPhaeuqlaXDVeO+2ZkiWWYOhV0r4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXPDv6gLYs0HMrSKU18Z/8sQwbwBzxJmci1m2GZIWMMXVYVYtB3OFYGLNW73kozR83fEas7uWLnDC3tmh2W6QQu80K2bbsezMcSeKQZk808IndOZsgXL6QzAjlwkP+gga57WkG9hxS/ZUK8u+5tp6UBGVygzBB9hTZiqpAQx5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pd63I82P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRi6ZeRR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99tsT3343616
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlXrJ19cElBVoQJotftVXbsvkzmtln1OW2fGHdfpZ40=; b=Pd63I82PIt6k3JMJ
	ovQzlSINDchjmPPGGkmTg6EF5aPF1ofBKiL2yGXJeP2kq52RheOGddWr7RFjPhUJ
	5BOdRPlLQnMkcc3nql5EjwhZWiE8JkAGs96R54bhNKonpqcKu+FOdOr7uYSj6sbI
	uXA4p/a36refdJXHa17hu6+g/qUTEsKFxT/SQOqqhCq9TmsI7hBrxC6Qk5kpheC1
	UlebLuptaR7NQB6Awcy3lcEgSdkrWdBx1MJhD23nx1nCbHLa2Z5bh74omXBROhLs
	6MDMWoFE/yo91lTnutVwxYyJx2x7w0USx1ALbqViB3bjd0YrGHTsEx4Efbl1cTM6
	NhIP6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahs7uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba054e0304so55435335ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365809; x=1779970609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlXrJ19cElBVoQJotftVXbsvkzmtln1OW2fGHdfpZ40=;
        b=aRi6ZeRRMB2SK7AbIhXGTa0v2wWfycs2BjJuLGBxhzuQv3zOsy2FnnpVkv8//VJiJS
         T40DYGTciaL3OnLojEgvy8M5wAfRA5DRBy1+XXFOAFeS5tZfffbOuqWxi9P/ABbN9gJN
         A2rWYePZqIgL528sFQMW+Wb66bWkEFp/NEt9g4LERErN1rPH+ExJKJNNENjBEkR+tegR
         jzqQ73kRxeThHaBtXGQdf5WAA/k0OkPSSuQGeHSo0b33V8Kkqm0HgcawfkefQEs9DS+e
         hIpqKoTejoPn4LP5CIcsVUI/db35Q4jxxXACCEWda7/U503iJozp4gWPdbNSROoboSe4
         YfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365809; x=1779970609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZlXrJ19cElBVoQJotftVXbsvkzmtln1OW2fGHdfpZ40=;
        b=cOqahkXZpApeCjLxNMblT65WIiPdQ6uieoAvGS59UG1uCyfn9iLTbOfmiFn4N9xWfS
         JPKpDPYRPbgpcXuLv1U5WtuWC6aOrjApLaZ6i3QVd5uHjsDp/tehKpXOcHyyf4j3zZ/I
         mecYAUb09wIgNg9/sPNgLiSkwlVmUOGunbYdMgp3gVjuZSrcGF5nUAIZbuv5C3gXt1bW
         oIy5OAVz9FnQH5OCfQAagqM6cLvv/BKCHu3HrkUjpUTcuAwfpzQy9S+pByPRND5Liq/5
         3bezNn3g2NNPq6AbV7N2WmcFUz5lMlUPrJskYqbAQqBUXnd+aVCQ0zG2uzexfUfyL8W8
         NPbw==
X-Forwarded-Encrypted: i=1; AFNElJ8a/JeHuz57Y/IFalea9QMReT01FPht4RO2kfJU06IH2HtaU2V44oJEBBmsnT2Q3mJjA9BPAUvtX89WOzXp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl/H6zSKh8KgvAboF5FM4K+FJWvhhqMZHOLMW3yAV9xMwdCgTX
	uE9yOCfZKzFT11sX6BlozLgVjXStcupB3yW5xnVNG9aENalec/BnQVm8WwdckRy4xGl/hZCWNIb
	KBqj1TFIhfAUZ8Dtp4hM6cCkDGTCXqTG4jabTGPZZusrPekLhhhic6k1Rsp/VqmALvhow
X-Gm-Gg: Acq92OEYervTnNwo9c/9nGLV08//oy3lk7lOURGQecBXY2y19QTXnoPhEBSqR3oTVvi
	jr+2MfrpjrNzNVYV6sWziynq+Okk6Z8astbnfsnfePSzDTK+pfr6DgENWttyQnBCHpajU3hqZiG
	40KoM2kqIrmh2ICYVGohKFkglMQ2rgZsFNDh/fzFo7e61S0aj6OERjIZIzXHP4UwkSLE6Q+bi0k
	KcquusD7HEoxm0kUOFh0T+us+12WJk7n4OfXaOk4iRTu6uVAvsJsna4wtz6g/eTbCJqVaZ06psH
	+qc2FfAnAZI+TKOSeeGSzXxrW79EV9W5G4S4tS1UO1b+jjCtjh7GlcZzzXJoTvN9vqujO2Mui9Q
	1z+undtQ+w5waT+wIc5n3E+YXVRgd26RycinffOW5uJfEIiB6TWEP/YSPrQWXAEjcDC/RxUMMRi
	4QcyY0FOtC90mYnE8T7k3jjc16
X-Received: by 2002:a17:903:244c:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bea222962fmr26744525ad.12.1779365808496;
        Thu, 21 May 2026 05:16:48 -0700 (PDT)
X-Received: by 2002:a17:903:244c:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bea222962fmr26743985ad.12.1779365807798;
        Thu, 21 May 2026 05:16:47 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea917318esm10435555ad.5.2026.05.21.05.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:16:47 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Thu, 21 May 2026 20:16:28 +0800
Subject: [PATCH v9 2/4] coresight: cti: use __reg_addr() helper for
 register access
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-extended_cti-v9-2-d21f4f92c51e@oss.qualcomm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
In-Reply-To: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779365796; l=11278;
 i=yingchao.deng@oss.qualcomm.com; s=20260521; h=from:subject:message-id;
 bh=uAYfnyo0Xvvg5GFBPhaeuqlaXDVeO+2ZkiWWYOhV0r4=;
 b=LPfKwaoDbg4PbiMw/qExaph2kl97CTQVkz0lCR4v+U25LOhuJAZ45nIgrh50t2K5ApDwRcUDD
 qeaTMxA+Jf+CNafTtuToR8cEWgs5jf4eUEUNvCc4TFI9DwtmZwkeWvJ
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=YbHeeX0Qzqo7voZLva784lFhVChB9yF3a4sceW95ljA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMyBTYWx0ZWRfX5aez9LtrYpNP
 44SA+O2aNZFFaDuWPA+xFrRQ75DfG2XfO32mJIGRRIm+z/WM8Opcz7yaOoynd4rvlV2rvRFBf4n
 m4yySFRTGDcRTeJgAjYlsTae/T0VUULn1WORL3nKbnb9mU/mJRLpkcrhdTAIwROe5iiNZvslfhU
 4cd8Cw3ZDvl6w85j2JupsdbG6k6ZUZXSdkQnnVO2THShIrZK9Q99W2OnnHeKM+nW62vEKz4RIXM
 oTNMCSY7ihimagEdpmp4k6kHP/2vaEEPzaSuktsbdB1w/+Durxn/x2uPbb5pbt1RsUA1FoJU+3t
 Z+8IDhuvnQWG1cNWkpA0/pOyyeiHc3Sijmxtfu9xSnumtiy5QLFecW8vifIHzkGwxqzHg+C91Eg
 u1bJ47Hu8trDMQf0YL//WWWbodUxNDFpkBf9cfZLsp2My2K0X6Rfuxm8fna891/BNC/udofevt/
 Rw1dZYfBS9tO4ocIyxA==
X-Proofpoint-ORIG-GUID: 9tD-Sw0-pHO6wXailUoq9A01qQJ12ijz
X-Proofpoint-GUID: 9tD-Sw0-pHO6wXailUoq9A01qQJ12ijz
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ef7b1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0ZnVAlcq1A6cFeWY3PwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109046-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B3025A4B69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce __reg_addr(drvdata, off, index) to compute MMIO addresses
from a base offset and a per-trigger index, replacing the function-like
CTIINEN(n)/CTIOUTEN(n) macros with base offsets and explicit index
arithmetic. Add reg_addr and reg_index_addr convenience macros for
zero-index and indexed access respectively.

Extend cs_off_attribute with a u32 index field and update
cti_read_single_reg() and cti_write_single_reg() to accept separate
offset and index parameters, allowing sysfs show/store handlers to
use the attribute's index field directly.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 45 ++++++++++++++---------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c | 25 +++++++------
 drivers/hwtracing/coresight/coresight-cti.h       |  9 +++--
 drivers/hwtracing/coresight/coresight-priv.h      |  4 +-
 4 files changed, 50 insertions(+), 33 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 4e7d12bd2d3e..c5cc2706e241 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -42,6 +42,15 @@ static DEFINE_MUTEX(ect_mutex);
 #define csdev_to_cti_drvdata(csdev)	\
 	dev_get_drvdata(csdev->dev.parent)
 
+static void __iomem *__reg_addr(struct cti_drvdata *drvdata, u32 off,
+				u32 index)
+{
+	return drvdata->base + off + sizeof(u32) * index;
+}
+
+#define reg_addr(drvdata, off)		__reg_addr((drvdata), (off), 0)
+#define reg_index_addr(drvdata, off, i)	__reg_addr((drvdata), (off), (i))
+
 /* write set of regs to hardware - call with spinlock claimed */
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 {
@@ -55,16 +64,17 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 
 	/* write the CTI trigger registers */
 	for (i = 0; i < config->nr_trig_max; i++) {
-		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
+		writel_relaxed(config->ctiinen[i],
+			       reg_index_addr(drvdata, CTIINEN, i));
 		writel_relaxed(config->ctiouten[i],
-			       drvdata->base + CTIOUTEN(i));
+			       reg_index_addr(drvdata, CTIOUTEN, i));
 	}
 
 	/* other regs */
-	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
+	writel_relaxed(config->ctigate, reg_addr(drvdata, CTIGATE));
 	if (config->asicctl_impl)
-		writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
-	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
+		writel_relaxed(config->asicctl, reg_addr(drvdata, ASICCTL));
+	writel_relaxed(config->ctiappset, reg_addr(drvdata, CTIAPPSET));
 
 	/* re-enable CTI */
 	writel_relaxed(1, drvdata->base + CTICONTROL);
@@ -122,21 +132,22 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	return 0;
 }
 
-u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
+u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index)
 {
-	int val;
+	u32 val;
 
 	CS_UNLOCK(drvdata->base);
-	val = readl_relaxed(drvdata->base + offset);
+	val = readl_relaxed(reg_index_addr(drvdata, off, index));
 	CS_LOCK(drvdata->base);
 
 	return val;
 }
 
-void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
+void cti_write_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index,
+			  u32 value)
 {
 	CS_UNLOCK(drvdata->base);
-	writel_relaxed(value, drvdata->base + offset);
+	writel_relaxed(value, reg_index_addr(drvdata, off, index));
 	CS_LOCK(drvdata->base);
 }
 
@@ -149,7 +160,7 @@ void cti_write_intack(struct device *dev, u32 ackval)
 
 	/* write if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIINTACK, ackval);
+		cti_write_single_reg(drvdata, CTIINTACK, 0, ackval);
 }
 
 /*
@@ -322,7 +333,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	struct cti_config *config = &drvdata->config;
 	u32 chan_bitmask;
 	u32 reg_value;
-	int reg_offset;
+	u32 reg_offset;
 
 	/* ensure indexes in range */
 	if ((channel_idx >= config->nr_ctm_channels) ||
@@ -344,8 +355,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* update the local register values */
 	chan_bitmask = BIT(channel_idx);
-	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
-		      CTIOUTEN(trigger_idx));
+	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN : CTIOUTEN);
 
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
@@ -365,7 +375,8 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, reg_offset, reg_value);
+		cti_write_single_reg(drvdata, reg_offset, trigger_idx,
+				     reg_value);
 
 	return 0;
 }
@@ -403,7 +414,7 @@ int cti_channel_gate_op(struct device *dev, enum cti_chan_gate_op op,
 	if (err == 0) {
 		config->ctigate = reg_value;
 		if (cti_is_active(config))
-			cti_write_single_reg(drvdata, CTIGATE, reg_value);
+			cti_write_single_reg(drvdata, CTIGATE, 0, reg_value);
 	}
 
 	return err;
@@ -452,7 +463,7 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 	}
 
 	if ((err == 0) && cti_is_active(config))
-		cti_write_single_reg(drvdata, reg_offset, reg_value);
+		cti_write_single_reg(drvdata, reg_offset, 0, reg_value);
 
 	return err;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 2bbfa405cb6b..7191a478b2da 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -171,7 +171,7 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	pm_runtime_get_sync(dev->parent);
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
-		val = cti_read_single_reg(drvdata, cti_attr->off);
+		val = cti_read_single_reg(drvdata, cti_attr->off, cti_attr->index);
 
 	pm_runtime_put_sync(dev->parent);
 	return sysfs_emit(buf, "0x%x\n", val);
@@ -192,7 +192,7 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	pm_runtime_get_sync(dev->parent);
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
-		cti_write_single_reg(drvdata, cti_attr->off, val);
+		cti_write_single_reg(drvdata, cti_attr->off, cti_attr->index, val);
 
 	pm_runtime_put_sync(dev->parent);
 	return size;
@@ -202,7 +202,8 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
 		__ATTR(name, 0444, coresight_cti_reg_show, NULL),	\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 
@@ -211,7 +212,8 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	   {								\
 		__ATTR(name, 0644, coresight_cti_reg_show,		\
 		       coresight_cti_reg_store),			\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 
@@ -219,7 +221,8 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
 		__ATTR(name, 0200, NULL, coresight_cti_reg_store),	\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 
@@ -257,7 +260,7 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
 		if (cti_is_active(config)) {
-			val = cti_read_single_reg(drvdata, reg_offset);
+			val = cti_read_single_reg(drvdata, reg_offset, 0);
 			if (pcached_val)
 				*pcached_val = val;
 		} else if (pcached_val) {
@@ -293,7 +296,7 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 
 		/* write through if offset and enabled */
 		if (cti_is_active(config))
-			cti_write_single_reg(drvdata, reg_offset, val);
+			cti_write_single_reg(drvdata, reg_offset, 0, val);
 	}
 
 	return size;
@@ -386,7 +389,7 @@ static ssize_t inen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIINEN(index), val);
+		cti_write_single_reg(drvdata, CTIINEN, index, val);
 
 	return size;
 }
@@ -427,7 +430,7 @@ static ssize_t outen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+		cti_write_single_reg(drvdata, CTIOUTEN, index, val);
 
 	return size;
 }
@@ -469,7 +472,7 @@ static ssize_t appclear_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIAPPCLEAR, val);
+		cti_write_single_reg(drvdata, CTIAPPCLEAR, 0, val);
 
 	return size;
 }
@@ -490,7 +493,7 @@ static ssize_t apppulse_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIAPPPULSE, val);
+		cti_write_single_reg(drvdata, CTIAPPPULSE, 0, val);
 
 	return size;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index ef079fc18b72..98b8de8a3687 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -30,8 +30,8 @@ struct fwnode_handle;
 #define CTIAPPSET		0x014
 #define CTIAPPCLEAR		0x018
 #define CTIAPPPULSE		0x01C
-#define CTIINEN(n)		(0x020 + (4 * n))
-#define CTIOUTEN(n)		(0x0A0 + (4 * n))
+#define CTIINEN			0x020
+#define CTIOUTEN		0x0A0
 #define CTITRIGINSTATUS		0x130
 #define CTITRIGOUTSTATUS	0x134
 #define CTICHINSTATUS		0x138
@@ -217,8 +217,9 @@ int cti_enable(struct coresight_device *csdev, enum cs_mode mode,
 int cti_disable(struct coresight_device *csdev, struct coresight_path *path);
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata);
 void cti_write_intack(struct device *dev, u32 ackval);
-void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value);
-u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset);
+void cti_write_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index,
+			  u32 value);
+u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index);
 int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 			enum cti_trig_dir direction, u32 channel_idx,
 			u32 trigger_idx);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 770a8dc881b3..4aa25dda856c 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -68,6 +68,7 @@ struct cs_pair_attribute {
 struct cs_off_attribute {
 	struct device_attribute attr;
 	u32 off;
+	u32 index;
 };
 
 ssize_t coresight_simple_show32(struct device *_dev, struct device_attribute *attr, char *buf);
@@ -77,7 +78,8 @@ ssize_t coresight_simple_show_pair(struct device *_dev, struct device_attribute
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
 		__ATTR(name, 0444, coresight_simple_show32, NULL),	\
-		offset							\
+		offset,							\
+		0							\
 	   }								\
 	})[0].attr.attr)
 

-- 
2.43.0


