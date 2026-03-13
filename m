Return-Path: <linux-arm-msm+bounces-97374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIYYO7rSs2l5bQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:02:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19028022F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F39463022C08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FFB386C3A;
	Fri, 13 Mar 2026 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THZ0iXBn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdtJelJ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3656B38758F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392566; cv=none; b=UIjYn1LB37SidDN19VgxOZL938Z+3tuNdBuBpiqQt7hDYrlcLmHNKUYgwxf6uG4rOZsjKglqiTyEOIK8n3AG/2WkF8s5WzDG0pi0kNIjvUJE/aIyaWSEhO0H+m84E91jZFwvW1vWdvj5oWxAu+BlQ6HARNzBNtLbwtW/q6SIC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392566; c=relaxed/simple;
	bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aAbf+/SEJqBF6T/rYoHB+XrzfUUPoTLsIBmL0axjj9sXYIs5OTw1u1J0f95cgVr51RNN05K4aRxZjghf6rBggLDhvTHhvT3i02fghOealmsu8gnvpSBPQaln7r8sOt0K0Nb/Twd/2F1Sh1XfTuFfWEZACcUXkjcKZCxAlttTTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THZ0iXBn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdtJelJ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JK5O237571
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=; b=THZ0iXBnRpfwi66q
	bycRV2natZUmE2rHybS/kvBqs+m77SehKofeSekf/WSIseZNZsB6vA24t40smfgh
	L7GGveMOY+zhDhBhmvJr1AMyVk5u1BjiylSyw4xlDU8UZ71iUdqu3kyi2ZCgKzyB
	aD/qYgrE6uJEuZ9un974J2LjSou/FVvNuIQaHL7TaihRV11oB0/GDzr+DRKvoyCJ
	UhjXnh2gPoRMaor8VTmqfzcn9eKEfXp+EHbrmAFWmULiSfk2qz76yF5g3WuaTq88
	70eL+3pu0FLxgFDpkdYDUe2gBXPcTDbkUiZCUDOLyHLM2NqhpP2IGbOJstanf/00
	CFTZ9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d8cb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3598733bec0so13151292a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392563; x=1773997363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=ZdtJelJ0cZ57p2nhK15hQwE1r1zL7QWkBvG9ikjLYXOEfj5q2CFkR27r97ZqWdk6eJ
         KlnH7fomTGtDQ6H1Y1Nu0OhH5lXtY7G2u1zZb6TF/2TqFIpzwoB6I52IiDm4fLkYd5b7
         8DPQ6as8kbYJNt+7biPExQv5AIi7szbL7lh25wY+EvQbj4wvYQLAK5dtSwTdCFT7NR05
         V9SPg6dNsQ/i1obVxzPksGKS4zepGZ6SdP8nItp1emmLQ/QR7BY6AUug57S1ewLs3XnZ
         bmldFx2PilEgoT0XzKA8XD2VmNJiYUHIL8JXM+RuoByhRe9ppr/47oa6SLSVDFITdozD
         b1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392563; x=1773997363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=asXRt9MMJ101knfUZ1Hf3wmuYPgorspNpZSgok8csoWy6UEdL+z7XNBSsqJ3cpzAqi
         3Fvw6Z0PEchFIx49h5Vg28lbD9CkrMcQzB36bGCW1gRNvgXxwWDbfFaCj10u5juOzBBE
         TzNM5jAQxPy+Qo+pMxMUfCdG9WLvL8yeYWhn7jml/3irNYlEC+Qo2DKnaVnGTbXeumdx
         PINZKH6NpP9DiTBdRm69xBn8IXnGN07LTPDr9ubMBo0ld8S9o7LXGhgnbgEW5HHkIBLf
         oepCVSYXFDLbr4fHbrz03VZa6GMpgw8kWFNRRlV+WEdM0gfbHdBHDTmPo8rD5iD8SBho
         VnZA==
X-Forwarded-Encrypted: i=1; AJvYcCWH4D1sex0Jhds7vI+dSv9RjffIwR8Y2vbTsDodyfaTlaWVZbTImZJhh6wiR6BwzSlHWv0AD+BmjSum7R0R@vger.kernel.org
X-Gm-Message-State: AOJu0Yy19WaaoD/CcQuXFX9t0zwtjgHKDycqOGyLHQzEVpjNIe5Lk1P2
	1WEqxWnN1EWA+JqJSMM71wWUKx62jF/HdhYblsMBT9SRrXd9Hmx0RF+z8RDOylEZTPYLrws5j89
	i7D8vQyPl65jqG8dGWTnZccFR1eQxzaKw2MYFsNZkYtIprln9cEPuGnnGyNQw+7p5vZwb
X-Gm-Gg: ATEYQzzeJ8JOOVSrnD6bZxnb5L2IbhdkfN0YLRGTSw1vOsExK3iGFTGyFV7tBxZy8eZ
	GAX8tMy3weKBlP0ESWvrzaV+TgWaRp2Jmrr5zdcXB3zAjbLqUzEVZ6qpzE3FcRqajn/wbIgLWCV
	NdY5a9u+EUJ9v3zkH5kHxfIHD5XTgGVEupSRxdjCIDgAJA5c3xgDOVJShQApbBxbY+Eow4PSEYo
	7cM3AJqIqZjc0wUbweWkOZ9Ym2fX7+SyyYsSmqpzX5wqWhZwsvMp17NLJvM7ME1hqaM5Evq/rh4
	EZSWnoo9vk0SDRlBnAbblzFlPeAwXgPlzUbD+3wBo3TbQ1XABuIoD/560hz/kMlqWz9wVUSzDu7
	kt4h++yLZfJrghM70pmaTtMK4N6HgKlGvqaM7ebmHsN+JoYrZC/rF1fNsH3JEQ3rlzIMQ1NQwRg
	m2icS7xSAT
X-Received: by 2002:a05:6a21:339a:b0:347:9ae1:cffb with SMTP id adf61e73a8af0-398ecab089emr2423198637.24.1773392563445;
        Fri, 13 Mar 2026 02:02:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:339a:b0:347:9ae1:cffb with SMTP id adf61e73a8af0-398ecab089emr2423158637.24.1773392562923;
        Fri, 13 Mar 2026 02:02:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:02:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:04 +0800
Subject: [PATCH v15 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-1-1777f14ed319@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392552; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
 b=c/dRbCE5JkmyLINGwwdPHLcTkYrm7yMV8q5tvofpzFQTU7KcXIJgFI63txp30QPtCREO35GBx
 Q5aR9IeTh+HC3vuo91oweld6aAYBhoPk90BhhK3WfITAv129Baly/sG
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: yj9yaJO3RwN3eeVaNRkhWVx83Zcy0YTQ
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b3d2b4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OCBTYWx0ZWRfX3i8nK6o/NkWa
 Fl5Ou15o4W8Sm45OpcHmz6dnXMdEmC5oBzQVaQYVqEJokZwQty75KFqtzaIKKXT6VhU4sqARjdS
 k14jOAKVIB2B+M4yRjJTab3HC834YrzLNQ8GmNhNkmBzGXBTSEZbVwMx2u7uhYgRaQkZTAgqkHO
 QENSZVDsNiDO9fbGlEIA3jwczBck3lwOw/l48KB4opyIBj9IUtXk/YwGZRNfY//1uNH6OxySWG6
 tf9FyQd2bZFcO32SrcvBxVtHF1ZyGjwJvN3laHT2Y16J73Y94ae1aoc6PjsnnDcfXbJ9bWB4jUH
 IO2EkKzzuI/OomKMLx8I4ZyfDPP/GMQAwuYU+uemNfQEVgCb+kD1wQBPwC4aQFMXf4U1wOr1YRp
 gfBIWtEUvEQkKfGigXBVUAA3EdA0jOM0YLITbEALVI6YaAG3CIPK2FGEU2PwZtEiIgGnzLqHs0B
 kBm7lat6c1kgQVlfrDQ==
X-Proofpoint-GUID: yj9yaJO3RwN3eeVaNRkhWVx83Zcy0YTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130068
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
	TAGGED_FROM(0.00)[bounces-97374-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD19028022F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..221de57ca57b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -588,6 +588,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e8720026c9e3 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,7 +128,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd70..5532ec82e82c 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


