Return-Path: <linux-arm-msm+bounces-96179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEoAKZWXrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:49:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F0B2367E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFE02300A586
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD0F3806B4;
	Mon,  9 Mar 2026 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biTdSM1m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlE9Idj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2865E37F007
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049709; cv=none; b=hxzUpsRTIg1Sv9bxLgY6d2ZFo2lFNxwJ13CEAepoz9KOeLhv76XXNNw28TVHBju7RNrXg0PD4CFihMwqbWHFqcQWkmIpc6hE89JH9qU8f3QMFFgh8sFb5EHnKXjFGQZ5512m3OzUKUECeSvA4OBqu6z8Yk+P5bOjK1odPw6+skg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049709; c=relaxed/simple;
	bh=QrDgnVgN9QaZlb9Pjj5rr7RirVn5w3K3JbRC4UnCJSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XXDeRYHiAq6xiMALtFHlFcux93J/7V8IoqqZeuhaNsdxK+hRat0fO40vLTKJeGfXL0oRzsLkrFN76O54T71SjEq8BoUVXJiol+XMtmmzyGyJdSRX987o7c34Z/FGYMxrAy5IersPJGg8kIR97HRqJ1krbvr41YqfIOZ/BwKuSDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biTdSM1m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlE9Idj1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298JAdv3464301
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 09:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lTbduWn2JF6hflXdfZAESir+Ygdnj8CJ5d+aQvJmBQ=; b=biTdSM1m4se71qQ0
	hxdNSuTApqld7yrnRvd4vLWTmunTo5HTJtjxq/as1tzfoO7TVigOzuJCymH9iL1+
	Xvxc8gJcvyDHHzBH4G5c470xx0KLetraxqWSO4mV3V/ZYsWDe5/ckQ3VmdS58XL/
	Xr/j8afTcrY61ue6/HpcIXyy3f4Ih7sHnnBNa5LBg2g8UvISSy3QyPs8h9SFv449
	u62vMd1JCy+GUGyfvOXr0pVYzP+6WMXPR+L+yrNwkebHJU66QrQt1fgWPCRj/5Lk
	09JPgPF6WG29FM3sHJcLeO55KE35rTc/bl4/Z3ql4rDC1DPz3u7VFyo76H+J5dtd
	qfQuKQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8cs51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 09:48:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae53ec06b0so390612435ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049706; x=1773654506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lTbduWn2JF6hflXdfZAESir+Ygdnj8CJ5d+aQvJmBQ=;
        b=OlE9Idj1xYh0efEYnDRwF+L+Z1D3ct1dKYQiCFaCBR/Qza8Hq7TFFd05D91XnF4Qsp
         INUBJrmocEx/ylYHChSB4PIFZB4TzIdONXQKZpuMGqbgIkfs4g5QLPbqSVBujyEW1PT9
         ixl/ULQvW72SOQd3EW9jyTboJlkgjg9X3pTfMpuB4nYZbAnCXdPnYOds6+5P7FkAGuum
         /rjR8W/Wg9id0l7agb7X+v45jC8M6mU6TINhZuCL4jF1/9T72cU2q1EJBz2EZX1hsL9O
         weiOyHO+AliZnRUgjK47h6qOoHv0LkETvqRtOQil/dZ0/oisPl8lU95XwO7XNwPa2x9e
         uy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049706; x=1773654506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/lTbduWn2JF6hflXdfZAESir+Ygdnj8CJ5d+aQvJmBQ=;
        b=dvCjCbAOGF+F84+QkVjYk+hZuhk/1s4KhVELVK0tmQfqgui5gg0I+ZgbcPMMkGgxZb
         Y4hK+z2NdZT91PBUiTuHrwJ9xcMcpcP/TQXXv4bcNEpLNyyOAagNZkVr8s12VvrKlW34
         X4EsaNKqHW1LSsSt5LopLnrthdgVrZLqH/0XFlLr9L5gF54lyQUmF6PsHZmxzqnfLkC+
         a1LhpbtqEPozZ3MN5O+hc1bD+hvvZPlKsqOcjZo8k/L8DtviPupZCwdaEJCy4VL10z7d
         8OOBTNVE64xjknV/IZHsNAIUV3x2T4yBGJFnMFsBilnc/oF2bbBe0V7S3ZKcdX4xojZl
         cNuA==
X-Forwarded-Encrypted: i=1; AJvYcCXpIAz6BElUS19dTNT3VtfnsRK2HfanVxDbfYEbqzJKq/8q8DwikLIDrxm8mF1bWfpyHEYgot7KM9HWQfih@vger.kernel.org
X-Gm-Message-State: AOJu0YxtShuErKbBhow7u8ZizwKKoQxcBdoNAP73J9Ksk+xe4BM8p9f4
	AL8sDhWTNAN00fNA3tNJrrQGIsGwYuwCvj5WuYCA2uLON0YWeOPKK8LGmN+kJQGlCS7aLluickF
	0sgVSxKFdm3k6ThvldcT9ps/mu5y5JLj9SNF53ZSpcSij8uc7eBCAUTv4E20Ui1WKkBQo
X-Gm-Gg: ATEYQzxNFXm3YkFoB0v/p0g0+V/XowVhVXwa3yoDQ8098sFuMYdRHXB1aGvOWm+T3uZ
	BSW5nXaXqY0JjdRH2noIhU8NGbcIWJEwaJIQ+foBlZURN9fL8itg235EjKsm/po53gxbwue4eYW
	i2bZzs+oAA3Mlr9DwCmPXENfryAzhX9AQcj0btaom/uNG5tnp2+ifi9xYog4trt+XtydfRh6K8l
	pIcN73XWvU4WlQdabh5R+HGciRpnNFIpY9GbIFIgjp0zmk3OpkuvZmbRsjcjbILhVZF5+KQ0k71
	VhyzUYECTpj0l4+Yu86GgVeFSSQRXHdRfcIIuupF85aCa79aOpjWPAIPKFqdnNvcgbHFJDb3wlG
	jPBVSRtfUUfGhFUiN3FLBaAQmmHGTlx45tiG2dO9Jha59MQmwJT4ASaihSM7Zp2uChix+tFGEH3
	5z9XDT3TfZ
X-Received: by 2002:a17:903:40cf:b0:2a9:5db8:d651 with SMTP id d9443c01a7336-2ae823b349dmr103277255ad.25.1773049705961;
        Mon, 09 Mar 2026 02:48:25 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2a9:5db8:d651 with SMTP id d9443c01a7336-2ae823b349dmr103277085ad.25.1773049705400;
        Mon, 09 Mar 2026 02:48:25 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:25 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:42 +0800
Subject: [PATCH v14 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-3-c08823e5a8e6@oss.qualcomm.com>
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049687; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=QrDgnVgN9QaZlb9Pjj5rr7RirVn5w3K3JbRC4UnCJSw=;
 b=yxl9m8Ty4i26yQ6UJTJPydSgQqLp+CGWhP1ClwC6hg5uLbQ/+Vgjx+t+odguyBG2oDLHYXcn3
 h7WKUo6vdHHBOc1Ah7ir+FojeGznSGL9aQnqEDrOwUW69m2LqA6SV9e
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: z5tpfnFqWi9hA9tO-XEJdcGvysRMITZv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX9E35CF7jgc6R
 1peDuIs+p+gPsMACD7ej1l8qNDd1HC/bTKSKP7PDq+bb7z2N9vqn4Opon9U5WeBv5LFH9AlC23E
 hpwgUAhMY8DZmsF2p+572LEWEiF5LXDF5Kul8Hvl5a+WnEgxbuE/t/ICXcpPKdimiuiH3ulxYOO
 tJpBTQcjMm42DUL0R66hJjexiqWSUMSzZQ4LqU2ofWyl98Ff2A5AUOFgeoBG1dmlGJzVDB1yKRF
 FscQtqr7kOo0i4aXOLkz2UEjcw6yU/2Yv6S6eVN3ixDguYVDKH+5iLM/2atRidKCsQUMUk2DpH2
 37Yv2hrLwl0OY4GBhiKfPT0a7+ofnEhJgX4qJbZa2n3TL9zsmA8e7FBHLZ0tLbyEyTArrFTY8Pq
 De+zDfg2H73fyHuzTsiBxd8FFDcVns9IPqKsDYcgtPi0jIbMztVyMIkayIA1Yer1kmKgEEpafsT
 Ykwfjrkv+78XJn6D41g==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ae976a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: z5tpfnFqWi9hA9tO-XEJdcGvysRMITZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090090
X-Rspamd-Queue-Id: B7F0B2367E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96179-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,desc.name:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bac3278ef4dd..110eedde077f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 5ac07e8dd5ff..69d55ee3895f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


