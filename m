Return-Path: <linux-arm-msm+bounces-96177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPTKBXWXrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:48:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F50D2367B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C73E930254F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9014C37EFF8;
	Mon,  9 Mar 2026 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZzMoV6k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzEhv8Hg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEC537F8C2
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049702; cv=none; b=rbJOkLjUJdnFJ+L8U0mQAGzQaw7D4O/XbohHKWIJUb5O1l3cgWTU5BtOUhhHTZgjHFDqsqf7oIxuPdIRlPZtNqFz1CndkdWwgkEMxHLspOFegrr/X3Kd86nth1LFw1Bi5kVN4/Fz0HvfjfqrYheui5Eqbb23cwtXw7LAdFvjF7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049702; c=relaxed/simple;
	bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dp/GJm4xF/uJuolIrAcpdQWnc+zHVXgzhFyEM2cAX4aJV9zFwuVFFqaYekog9fYApAGJIP3PB0rivtfZUeDkBFt+wbwz2tksWyQwFu5dnpNp3nSV+BNMhqKnQWMC4Flrdoa6776uhQWby9FH6XqW6IpuNW8x7RUclr9S9WfMetc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZzMoV6k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzEhv8Hg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298Wcth2663851
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 09:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=; b=iZzMoV6kALXGGI+H
	YEwVtlR0hvT8XhKBqqCBBj9skPwKCYNRNle6mOvuPSJIKpzE40/zsdqY4Pb7RUrk
	YO8SCq0/9/iNQX8EIIht3o180FlBIBoy5mX2FzOx2AAsE8XVxJsDz/LtTa/NB4ID
	7tKkCJoU1kiLIvRX4x4oQX2rewR7+NbYdjPyOxWRNv48xgQrnrDW6+tEGbOCHDBE
	AnZWIPRINCZDPzMhC8OJY0eTJHjousLcrBucar7D1IjiuEbwx1VDX0eTEn2+gjbf
	ei14XxvoTRUe3Tr/JlMnjnAyEbifoyxxXIh2wvbk4j73I76g0b7KCOTx+4wBfWpy
	r95BKA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpn4m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 09:48:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35979a03106so8569288a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 02:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049697; x=1773654497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=BzEhv8HgVaYTZGWKL+D5nWrPiy8igpW1N8sBZ/u1AiD199bDK2PVbbthdI8k6EXBZk
         9+s7FD25mvN+MfqclpXMhi5So2VX5qsH5RP96y1j5lv9fOEGcpsb1XSl13Ye0yVfa5NK
         sG9MbO3+XokPep2Jf5/scImG8u2lq0vMU+kX43U2WJUXiz7CKj4hCmaWgN25TODqxsO5
         sfvl3gHrgMedOkqKeOvbCtcC46u/TPGUIIwQIs5JToaTGhqv15DptP0I90zagrZI9xNw
         v7c1Y3kDYe8RC565YOsHke1wqK30cjgfbh0HTar8J0fsRSGq4Y+QvOoLtjoNBE5V7Cq6
         aykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049697; x=1773654497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aOdpdbZJkeNi3c6n6qEjoFu015+pEeWRTwmOxcPblaY=;
        b=s9UZ+bsWi68N5UHUqqK3iXOZWaZ/hiTekGUntWcIUTtv8B3G5EsGp5QW9DvbcLiVA7
         vPxXktD++zWBSREfmbAeiJZOIIxoJkcYjDpmvN0Abp/PCZ7n4wIwZ/DQ937vKjMSvWgd
         YSAaBaSmOmrtuaffw2CTzwNQL8p3ki5So8hM5xZjYmKqi38S2nIVQESpl2FH2h4zL6RP
         96pVZtWS+z3Fy9W7BBjl7DQ3SeeWl5ve5zBlo0hFJ0Yl+b3rObyevpZgudrykqn/D2d6
         gY3IHprQqgBWPFu/nrs6J2WazBTPXbTo1lrzJ8VdjrIZN/DD5TjC2lNIrtaJKEBGDGb3
         M2ww==
X-Forwarded-Encrypted: i=1; AJvYcCWElfCnL5fdrnrwloMqpW1grrUjIDJ54E4QACRVMQVYt41W6L8nHD9hrsOv+lZnG1uDle6n9IdtzwivCN4N@vger.kernel.org
X-Gm-Message-State: AOJu0YzvCH9Y3tc2DdkUsmGgKzUhIinVGWVH+0EijTcbp/DnssHZjzIT
	xaqbk3Pv+02HWesZB3TIInlQsRjv6MnfDBisPoVCe54h6kMClcffWGj+PHVq7orEe8hYwjCiVHk
	MOJ2wQBbZL8sHSEASLsyua0vM5zlC+pIcnmO1JftFTWDMkMryHF0RNja5dmArqv2RRIjE8o+B3R
	5U+bI=
X-Gm-Gg: ATEYQzwRcHfF1MWD1xzwYfYdD9Jo82oUyXDqBKUFWlwBYXyYeQ4D/LYDo5KPJrqmb27
	TWb1f7H+R377na1WVDOeEwsTvp/a1fLh5eNMyXPOoaCdNRRQ2Qwp5z7WniVPiZF5WqHbqexbU3Z
	64xXXJ5kVh9K42Avcs0A3uVUjKebd1I1KDj5CFXri59bU1fOXzRAcbfG2FTPI7hTd5tfsA6+1Mi
	uVR/Nlwb/+v0C/IfUrcrXN/TUteNLOHV+5/sVFxkcb5ZXNwPkC5Qc9vLFHqAsVFfEWrRa0gw2hZ
	MfUoWC9igtkkt1klYk0bMoV1Vwg7aPFQUWRyC4vtWmYhVvzQqyOWjqFYUpWwTxb0BB/SxRk8jOk
	vuCfaRBNxDPOyOPiwVMxhmXTq6uXQl7/IBQjqxDOAPQ0Mr04XYiaED1zh5ZNGFPcJznjLMIbVfM
	PSiBz6eMFd
X-Received: by 2002:a17:90b:3b51:b0:354:a2a0:259f with SMTP id 98e67ed59e1d1-359be2712b1mr9314292a91.12.1773049697359;
        Mon, 09 Mar 2026 02:48:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3b51:b0:354:a2a0:259f with SMTP id 98e67ed59e1d1-359be2712b1mr9314256a91.12.1773049696833;
        Mon, 09 Mar 2026 02:48:16 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:40 +0800
Subject: [PATCH v14 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-1-c08823e5a8e6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049686; l=3771;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ckf80wWUcb1qnI0v7q/6ZqqYr3nuJh7ROL35EVLOH7w=;
 b=SP1XBoxrjv50xLFsBmzMeldsDCMB1RShb3RxUsYvVhf4SyCCM5CIn2Rs0xqX/kti1exe207ZY
 cY1nHs7jN9UD/5HGaQRmMbnoWI5WtLsPWwJpBpPBKQxAlTUdWxXciWl
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX9AKh54GKPG4e
 QXWD3ku3Ngxt2TRss0/cq+usmmhXA/an6yYOmX8HjAjiRTk9b5tSSVIjL+CldEmZtFNoMXWJt8y
 6+VitZsJ8lJvJOS0wMAaT1v0O5V6LjnCtfVs1I/akp8gtZf5UWtK0uhT6/td0x1dJZ69ct+PiIn
 3XoAwWEPTvo50bqiT8YShQUG5MMnLWA1qv7J/mS4bmjL7FMyRoZI8xhopCRHYcZG1uOkCfg5V16
 XyPls5OxD4tNWWUc7eeMKaHjezOoJhhnV9mwxrFMWonHFUm1hmTopdT78GiBOGLEfrpd0RB+pwz
 S/U/ZM8EaNR/+GHWYSWJZEHHZK8BqWPaglRquZSOwjiK48aLaq+P/BWs8g7pYYVy5OeVtNwpY5N
 ZbSted+j9b5G3gzP3CX/dZrT8n8jUiYdab1t8nYUOfnJb05iCIU+Xe7KVtYMaVVjYpQ6sMIkVOd
 j6KwNKYstrzIDJur5ZQ==
X-Proofpoint-ORIG-GUID: sx5bFvNpR5NuuqeuD4TDRjyHOjGbAe-a
X-Proofpoint-GUID: sx5bFvNpR5NuuqeuD4TDRjyHOjGbAe-a
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae9762 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090090
X-Rspamd-Queue-Id: 7F50D2367B7
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96177-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


