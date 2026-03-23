Return-Path: <linux-arm-msm+bounces-99166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIJzLgYOwWngQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:55:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 378E52EF713
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7312C3069021
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AEB386C2B;
	Mon, 23 Mar 2026 09:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/v5HfO7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VOZukeyl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C29387572
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259402; cv=none; b=j2dUmOkwo7y4THNdh5OfLPeJmPODxE4PZVRDyUrK6QpxjQq99FplckUjDjxiPqP0H05LtZjvHZ1AAuiRqeylfA2AkvLlMe5+veS3mSwnCSGGL1Qd51ezyhWdYe+NWvuL81qubkxj+O8Vlz1x3d5D8vroj5z/eYYNqBh31RuhWFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259402; c=relaxed/simple;
	bh=FFceOaqM6wu7CDdoDhopkNKARk15nwOEHek364eGNLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1SpfngfjrRqzCkjXcI6X1C2xiqAnu2REWEtFwEu/Fv2PabD0ZrsG+XUROlHZIGnZ7L4J8N6kgMbdREYzstSa+AmbgIUO0FGLqSe4jqB7XZ7KbtRqQ/olqwtWP30QT3c4w6llCENXH50tOt0AVK3Iirl61S3ILBOCE/WHNLaGqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/v5HfO7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VOZukeyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tBNn2291169
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTJDJgY9ATjCAHRG1W16e0NWqYe38EB68qyE9RQn52c=; b=F/v5HfO705xH/vJB
	SbtOD/UJD6A0luaLs8qQTTMKjZK1pZymr3FST00FbGEerxLOcogUuB589xEbPphy
	hrAzmP6O6dDKAMp3OcGbsxNmhBpF0YLOi4upryTxgS2vcq2d/Osa8xVHsXOC4/g5
	R5XnMphB3DXKvtFYtNAViMlOsDexgm4/EdVWfbetedbeKkGvA6GFsBJrj0lPySmn
	pNThk9WcWGCKOdX0ZOom/OxX9TYiOAuoD5XNaxfA1JcEbAEoTs1GpKbXTLn0l3yU
	sf+OLw8kG+lDgrbj0jr+niLuH9wr8xliur61mwAbQ5VVGzFxIBYE9+W1Xcjtbvew
	jm0H3w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j70d0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso234383a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259399; x=1774864199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTJDJgY9ATjCAHRG1W16e0NWqYe38EB68qyE9RQn52c=;
        b=VOZukeylo5UtLiIjPivn6vn9FBZfwPPW1qwUkhS7/TRsTvNF0t2qcGu7lkZw8hK8G2
         65iM0kkuB3EixhTSWYhD1Nb7hfEMEcbJwWRClvbbo9l3eWUVDU9d06ermX4IrMo3x0Vf
         fJBmpCmSI017lmE4wEZMqju2YXTe6P3Ke0hA4OluMjRAzIpYyYW+sk1Hw9OGlvbM+CVz
         t35y32mWuOy7hW333Q/dhkDPvgfArsZ1g5X0EWN+Xqe0lzaDflvnKYr/tbgOlc7yjIz3
         KZQSS6JE5OpeEsnRVj8ho5k62U+h8Rm517J3On1UVy6vfyiy1iwh4IczpaJFZJ5G13Ys
         gW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259399; x=1774864199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTJDJgY9ATjCAHRG1W16e0NWqYe38EB68qyE9RQn52c=;
        b=emwdbf2Pn39YPjnU9dSsg0VtLVgvCBumHfeHCoQ1vCpJE1HcAHPELp8jVuHKhII/PK
         KCOelAOCy0x8fW9o+hDyEaKFEnOlTdi8zKqdEM1CPszsWGE5rqJ6PbAT0cPulDEUFLI1
         HFYNrwv5FkXzWOkXs6t9osUPTDH1BtKSAsThkosIrcjmNMkPHL0p37zfIXtw232l1bnB
         9anC8CpTAE120F2e4mKpLkDDXhF1/HFq6D9iTuaoqhXZCKgK9fslEamKHdwjBoiMnI/r
         xJ2GsfihX7kaN1LfLceGhCLs5I+toctOSyFKVM+iT3Xl0rBcOLbqVpUFof+KiTnCFS15
         C4GA==
X-Forwarded-Encrypted: i=1; AJvYcCWU6sThtKNzAIdoYZFVt7TyTMP2vBy3y1Mz6ZkNHXbzHl/MiUZCcj8w1BD28iM7Vu3Zn/dMbWE3oIERJMKz@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/Ttu2ucom0FHJbV9R9r9PYbLUriwoYeKfr8ViagKXVo4uFZn
	S1MtsMdRPfRxz1YLJZW/W+H6eflsi00Zr+/T+BrzZNfGVqJ7SkByL3L8mdJY+jtDBR7LeFG9AAw
	T5adtQRZovNq/AJd1m25gj967irOJnY4VBWHfSTqjzRQei6Pf4TpE2w+6Hrw8ihpmH2lc
X-Gm-Gg: ATEYQzxsVNV+zKSp0WCWKMR5B5RQDIFKZHBEn/ZsPC48bLVoHYosDomR8bdH3uHWT6n
	3fuC3iM+0IfzZQ1qm0veQXeXfF8ve91xW21Gs1OF9VJ0M+bdpsFOxhoS1Q3Mf5bqTMUK6/itY1l
	k4lQXJEM/WTOz/uUZqovkuTP5EM+F6g9uTGqHQLPM1oU/GqKvhDX3egJA90LhAo3KbX0LkkOTu0
	g02mPU7zU4oy5Tmi+z6lHUONq+HX6zkHniNY0szo4P0UgonjDX/stchBNngto+7+0OzeKPX6ZT3
	CCLd+LyQtOTNJhtWpGS7dx3SbHjTAspSeoX3Aj6vjLJ1ZkarGBuCAHIHAyXa2EZqHG9hAOjGG2Z
	cDkwPgjl0ZihxbxRhDMjb+LOmEk+p+m8U7px/4gOJ7msiDXiKj7jv85kQvQX4IdTJLLEOH+XNCz
	A4humAyb7Q
X-Received: by 2002:a17:90b:4a84:b0:359:ff8a:ee4f with SMTP id 98e67ed59e1d1-35bd2bd8b5cmr10355260a91.7.1774259399436;
        Mon, 23 Mar 2026 02:49:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4a84:b0:359:ff8a:ee4f with SMTP id 98e67ed59e1d1-35bd2bd8b5cmr10355240a91.7.1774259398986;
        Mon, 23 Mar 2026 02:49:58 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:49:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:27 +0800
Subject: [PATCH v16 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-2-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259383; l=6204;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=FFceOaqM6wu7CDdoDhopkNKARk15nwOEHek364eGNLA=;
 b=IxYt/7EWVEDsCF4b7tnmVPQ9RVLcT/lR15WOFzdR6hqbCMhYuQEXRluud+4FVD3Lk5YXocrsX
 oWbe/GW9qWtB6KsrbrOt6MFOi22gzWTP6IOOljrd0am8sPMzK69IDG0
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c10cc8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 58eqYhtUROeywAxZdrnuiyX7cX_TvXzM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX6uNzWLcjgk+d
 Kuyk31UxDSV/2MZSr/qX5m5voSgGwzxoblZzIm1fFR3vdHLpbF6SGLvMnPslhxSbS6M0H8CewPu
 JAkKakFyXf0hp6Kila7RFFE2H3TUZQzeX7V4Yt5Ws15LXzmUD3bKuNy6uBBxM0piAr1NdVfaLy9
 DSpaKP9MXX2A8Yy4j+ceqUFEcNYxNPRAa0d8/CLHXfgS+2LACZA6NpHouEekBaTDvrnZ29kBs0u
 5Thhw4Hmhy5HHbcQNP63I+0Rm+QQ59vDZlIAZng/vrN7CqmjeSEh1WJ/XH5iA+NbQEhYnSI/ZC8
 ME9uGSyF45/y0p5hL0stY9/9MCqDlgclCzoEJuGDP9SuWfubGCLiW9RvnPm9DC9+o5viCTyKQCD
 fDl+yIoB66JtqiYlmkL4uj2r0YZQX2w/WvlEKeGax+fOfhxNn4IpC8NBbr1pJUt25tkPtWTdUyp
 tHoxsCv1Faj3POepBDQ==
X-Proofpoint-GUID: 58eqYhtUROeywAxZdrnuiyX7cX_TvXzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99166-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 378E52EF713
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 98 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++
 3 files changed, 116 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index c89fe996af23..bac3278ef4dd 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 4dc1defe27a5..306982e88dbb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,104 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove unused buffers from @drvdata->etr_buf_list and free them.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED) {
+				/*
+				 * Dont free the sysfs_buf, just remove it from the list.
+				 * drvdata->sysfs_buf will hold the buffer and free it later.
+				 */
+				nd->sysfs_buf = NULL;
+				list_del(&nd->link);
+				kfree(nd);
+				continue;
+			}
+			/* Free the sysfs_buf in coming steps through nd->sysfs_buf */
+			drvdata->sysfs_buf = NULL;
+		}
+		/* Free allocated buffers which are not utilized by ETR */
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		nd->sysfs_buf = NULL;
+		list_del(&nd->link);
+		kfree(nd);
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	int i = 0, ret = 0;
+
+	/* We dont need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/* We expect that sysfs_buf in drvdata has already been allocated. */
+	if (drvdata->sysfs_buf) {
+		/* Directly insert the allocated sysfs_buf into the list first */
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node)
+			return -ENOMEM;
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (!sysfs_buf) {
+			kfree(new_node);
+			ret = -ENOMEM;
+			break;
+		}
+
+		/* We dont have a available sysfs_buf in drvdata, setup one */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else
+			new_node->is_free = true;
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..6e994678f926 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Offset to the start of the buffer.
+ * @link:	list_head of the node.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	link;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +258,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +289,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
 };
 
 struct etr_buf_operations {
@@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


