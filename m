Return-Path: <linux-arm-msm+bounces-116547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xKu+A+NiSmquCAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 15:57:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5181F70A2C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 15:57:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iLvetTQb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NuR24+e+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116547-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116547-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D16B2300461E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 13:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622B62E1722;
	Sun,  5 Jul 2026 13:57:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE36377553
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 13:57:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783259872; cv=none; b=lC5hbdKTxoLwP/bWLLE92fhtXwSz9Pi3mU4BrNZlAGBIQU841u2Zn8QpBQw8aHJQNx0gCXSD7iDcF3SuWiiWojTU0t2K98f2dNik4obghD59K34wn2NixrMAsGpW/JIqSg5XzggzFBW8yf67/h2wISydqJEvG0tTqFFD4fa7SwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783259872; c=relaxed/simple;
	bh=JoauJP/T/XifX5LNc+BScrGeL0sofBsYpOGPhSU5gKs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A92h8Da9CFKgrx7tYTTGo+fI1STkgwVqnBl00444QJOTxaW0mmYWQsL0NvddzKNABvQhKAQwNlC+t87WEMqTwQWD6aTz0aOT4mg2QRf8IZmDGkTZEltK3LFOhSZjKYZ4ytD7OmOhPvfXrJ1p8a/I84nq1ui2QsoqE4sB1d6ZgAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLvetTQb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NuR24+e+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655pJEY898666
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 13:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cx6T4Swtw2rzqvcjubzMgz9kj6YnISYvg3z
	E4tt4Nsk=; b=iLvetTQbJBGIRKQBK/HWeTVaWLuOFF6CPVg/Ea3qbP/0w1atT8h
	OfsRhTkzjJtyODEVjV7Ely5Ksc38gKi/ZcqC1bahNPwiv1gBjKWEkico1Z7McXkT
	uZmq82UV0wGRvKSQJIRaOfKGjgBIJ7gmotoxgs4F2mFcXeRkSCGZo77JW89e5mQG
	7FPQqLoyrd7rNRAIxq9vF4Fb6URRulmeH2bzJnqGDgHWUTj3kx+oeC+1He9Yj5OP
	dW5hRsuhVWYiyiJ2VrQP/Rd5aoPR+R3PAt4jRg3F5s3eOjsacDg+lWX9zeCF/KDs
	iDpNVwp1f++L3xRmbbDgN5UVvq878faJpoQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvjtjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 13:57:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so10864315ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783259869; x=1783864669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cx6T4Swtw2rzqvcjubzMgz9kj6YnISYvg3zE4tt4Nsk=;
        b=NuR24+e+VaXedJG9jzSWlweJOAAXLr3SvenmhpCkWhs1deOh+UFHAntPItt/qJUvpQ
         Vk27iMsEjf8rMrePxqRwlsXmexeTTvXmimX28beDYNu8HSOmyYQTOa397zRWF0CLX2Rz
         WRgv3otOz6dpsz6+n2Hbud4Ue8Mt8KesFRmRb9TWF9EuuukQsvhUWMdZfkwNIZ0vEwC4
         Qfo5AQO+93vYNPbQJNpAgLF/3kXBUFsOp1xZ3C8N1ixCVMjpvDs6BbnTSMPv9Puoih4I
         pUrKFtDQ5jKSEI8Rw1UCAzX4DmsPs3pA1UYETWVd4LvMLYhK6S05RpbStStNur3GJ4dG
         p5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783259869; x=1783864669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx6T4Swtw2rzqvcjubzMgz9kj6YnISYvg3zE4tt4Nsk=;
        b=FkVUlMd7Fq0nMwk51uDP1AHNt65KWMMOmeB495xQcz95YKTm+bcC+mc6kzxBpu4xJf
         1/+48MpPBRM58r30q0ceCl3gj92YRxF91YGLWIUN8bPitPC01rMUrB87jAo7EhpxBYQI
         /3kWTo837U+ZI0eIZjHQ2EbGFvplgqO+a7TKSadLX6Z9Lyg0NEGXj+hc8tLNMIMay2l4
         UPdSp5LT3IC7xn03Ry06dosZlg/qK4v+xGu+GqzeMToob6APx5LiTXCZQ60chXXAxjXp
         YrF85AZIby7uKkRHCKP/wZMhYkaclzPjJ++VrXacGGNNQuBM/vJOqb0swlrLBBqfRVxv
         laeg==
X-Forwarded-Encrypted: i=1; AHgh+RpxSk5LkzztSvrXdGJMPrfifjtTp99cztKghE3g8unkCspvfxlu+hmZL9JY/Kw00Zxv3jsSxM/adOPwM/Nf@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ2cGoMVSiU1Ka9WkXR/Ifxcw7aqkd8h4TlBlPZRGARh4J73hd
	WDC3yVtpHnH6gjkFC344hSo1CESPmdshTTz+13/TgExqwzvhEw7pL+26IO9/IeJWDX3ozZMNcWm
	RBfyVlpKb6/PlGhdFhDo4y0uUO78t5llR1iIwFkvLyZZk2YgyIBrMAtO13GsyKAIs21tr
X-Gm-Gg: AfdE7cl2JIq5uJHiEY1IdxzfwQpUqGrlmDf2bUPsGIyTme9Le54TEXh7fqNTVHoCb4t
	O9bWdjQhIuRBzZQewSEUj3LsutmDcjiQyt0Yt+vMS394wyAhE1MplxLQIiCULvCPJ1A+7vm6O24
	ui3CPrk/FWS+grCKfKlhHgwDjjQcxFx11toHde/ulBUOPn7CMjtdlytHGf9LdOhNKSEqREGVHtf
	jjobhMPtsfyDd9wR7AGDdWh2PTL9vcqqaB9W+/Vd5OMihIP6MlblOZj7O/dvFXaziSJb0XJqmpe
	ULTQnZozNuZQdAckzVpyY1RbOytHutMRZoDDeZhg2GJNG8lu8a8V4zXE5aQDb/QleNKBSkpm5u4
	3WY212x1T9nfvprTt4HZ1umj7bCkNpOjYdBcHkBOjUNaBow==
X-Received: by 2002:a17:902:e948:b0:2c0:b5c1:8e22 with SMTP id d9443c01a7336-2cbb7502856mr65740785ad.12.1783259868689;
        Sun, 05 Jul 2026 06:57:48 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2c0:b5c1:8e22 with SMTP id d9443c01a7336-2cbb7502856mr65740605ad.12.1783259868255;
        Sun, 05 Jul 2026 06:57:48 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef188sm40891603c88.2.2026.07.05.06.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 06:57:47 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com
Subject: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on transfer length and frequency
Date: Sun,  5 Jul 2026 19:27:39 +0530
Message-Id: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4a62dd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=oMrrxSgkesIj4bXReV0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 1EmCzQNOHRnr7iLwnZhIqfmq5K_rpG1U
X-Proofpoint-GUID: 1EmCzQNOHRnr7iLwnZhIqfmq5K_rpG1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE0NyBTYWx0ZWRfXyoiLurr26dD+
 Bc+zx+YS2cqtxWqfMK5QGIk2sU6SPUxZ9BMMpDsW6xtvghvuEMdEddjSf8Qd/Sk3ZRdJCuCYICL
 5x7Y4Nmeg9jj+Ylwkxaqaak/wuKf+1atmViSgRzK4zWT3yLOvr0cpb5MhcNISpXbvEO3AM9u9A6
 hWSMfH/Z8DlCUxK/yIt203Z76pTQwq8E/CDWhR5jS2EbEBIr95y9xrR6MyzP5lQvsxkCT1mvgch
 tWfVScuY7h8DMrS6f7qWB29YQwCMZa6hJMFSRdk9vs4D5c5Q7gTwlMQ7onzDLJ1b0ijrMgTZsZv
 z4Vh9tdvQsfytFt+zA5K6zVNLEihoWI/Y4SrbHQKPr78uebLn0MX2s12tTtKIurQNIImqJyipgf
 1a7CvaEJnQkimfZoGRjnWWZN30dPjdt/60n85vWB6ZAK3fCUaupys2DTvUwEGnhUQCA0YDl2iWR
 qAYCqGi9aNsrmVy8+7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE0NyBTYWx0ZWRfX+AatgOuGJEu+
 dozsxx4DAn/1D+22AvXRABxOZ1HTuzHCeIF1PtoSKDC2UeDt8O4wlSDb03IACfHZOwJYEmn0Dcx
 /hm4EIjZOhbK9oDFkjxpleIQ4wPxZhA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-116547-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5181F70A2C3

The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
regardless of message length or bus frequency, causing unnecessary
delays on error paths.

Compute the timeout dynamically from message length and bus frequency
with a 10x safety margin over the theoretical wire time and a 300ms
floor. For GPI multi-descriptor transfers, use the maximum message
length across all queued messages as the per-completion timeout.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---

Changes in v2: 
 - Remove accidental defconfig change.

 drivers/i2c/busses/i2c-qcom-geni.c | 37 +++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 96dbf04138be..43ae2121f01c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -74,9 +74,12 @@ enum geni_i2c_err_code {
 #define PACKING_BYTES_PW	4
 
 #define ABORT_TIMEOUT		HZ
-#define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+/* 9 bits per byte (8 data + 1 ACK), 10x safety margin, 300ms floor */
+#define I2C_TIMEOUT_SAFETY_COEFFICIENT	10
+#define I2C_TIMEOUT_MIN_USEC		300000
+
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
@@ -204,6 +207,16 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
+static unsigned long geni_i2c_xfer_timeout(struct geni_i2c_dev *gi2c, size_t len)
+{
+	size_t bit_cnt = len * 9;
+	size_t bit_usec = (bit_cnt * USEC_PER_SEC) / gi2c->clk_freq_out;
+	size_t xfer_max_usec = (bit_usec * I2C_TIMEOUT_SAFETY_COEFFICIENT) +
+			       I2C_TIMEOUT_MIN_USEC;
+
+	return usecs_to_jiffies(xfer_max_usec);
+}
+
 static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
@@ -471,7 +484,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	}
 
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, geni_i2c_xfer_timeout(gi2c, len));
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -513,7 +526,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, geni_i2c_xfer_timeout(gi2c, len));
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -591,7 +604,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message transfer timeout
  * @dev: Pointer to the corresponding dev node
  * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
- * @transfer_timeout_msecs: Timeout value in milliseconds
+ * @transfer_timeout_msecs: Per-message completion timeout in jiffies
  * @transfer_comp: Completion object of the transfer
  *
  * This function waits for the completion of each processed transfer messages
@@ -601,7 +614,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  */
 static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
-						   u32 transfer_timeout_msecs,
+						   unsigned long timeout_jiffies,
 						   struct completion *transfer_comp)
 {
 	int i;
@@ -612,7 +625,7 @@ static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 
 		if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
 			time_left = wait_for_completion_timeout(transfer_comp,
-								transfer_timeout_msecs);
+								timeout_jiffies);
 			if (!time_left) {
 				dev_err(dev, "%s: Transfer timeout\n", __func__);
 				return -ETIMEDOUT;
@@ -736,8 +749,15 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		dma_async_issue_pending(gi2c->tx_c);
 
 		if ((msg_idx == (gi2c->num_msgs - 1)) || flags & DMA_PREP_INTERRUPT) {
+			size_t max_len = 0;
+			int j;
+
+			for (j = 0; j < gi2c->num_msgs; j++)
+				max_len = max_t(size_t, max_len, msgs[j].len);
+
 			ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c->se.dev, gi2c_gpi_xfer,
-								      XFER_TIMEOUT, &gi2c->done);
+								      geni_i2c_xfer_timeout(
+								      gi2c, max_len), &gi2c->done);
 			if (ret) {
 				dev_err(gi2c->se.dev,
 					"I2C multi write msg transfer timeout: %d\n",
@@ -852,7 +872,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 
 		if (!gi2c->is_tx_multi_desc_xfer) {
 			dma_async_issue_pending(gi2c->tx_c);
-			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+			time_left = wait_for_completion_timeout(&gi2c->done, geni_i2c_xfer_timeout(
+								gi2c, msgs[i].len));
 			if (!time_left) {
 				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
 				gi2c->err = -ETIMEDOUT;
-- 
2.34.1


