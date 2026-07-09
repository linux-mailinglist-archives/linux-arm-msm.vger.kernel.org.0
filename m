Return-Path: <linux-arm-msm+bounces-117848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L8l7MEg6T2ricQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:06:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1960372CF8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:06:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lzUTMwVw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PnwCDwiJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117848-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117848-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B37DA300C025
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558EA3AD52F;
	Thu,  9 Jul 2026 06:05:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5FF3ADBA5
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:05:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783577133; cv=none; b=XCJfx15KcNK14R7i7aUowHYf8BtB82PHlBEOGOClcTbiNaGGAEWshnRK7Ep8JwzsV/BgUonYFX2beD5EjythYJoZSRf6pXDdba4FpMmoxATlPfVwPvW8ttfla+O9p3WkmPRRx6rb8X08cZ792hXon96flbyFgWcxEpg1r3cCAbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783577133; c=relaxed/simple;
	bh=Q+LNTxMNTksgF9VnrFyj5EqxaEeRz8vjWVphTPzTZ5I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OqA7Bth+uQT0Ovuv7w9bblrlSk5FpuZ5h6HhlGwus2WljlNrcvW+ML/N5koFRRVJKcj4YUpagHzqyYLPsuPUIabKRIpO7iRz5wwR678Ks63Z4K+EVz0oXlk47bvsseHEy9f+JjX/0Yq8Qxbo5TjeLdLekdBMiL83NbznEcVSi60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzUTMwVw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnwCDwiJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Qas784669
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 06:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vm7lobBZrOzogeeSZu3t/lsBp/vgw265Z0F
	DOOPQOsk=; b=lzUTMwVwpM86ZbjFJ9yCK7tGFt6FK7njTFZy06AIu0A6AYI9hGR
	lhNajr4rP78OuO3SpD55+gFBUvS2408/pmhljHLiC7sqjaytBTA74ROSLUhNqDyB
	Jf5S5pBTLECW8ENBlct1qxjygssWjgmheodnUWZZb3fucUBFh5d46QROQlObPcwS
	HfXTENoPHBrh3PCY7iW8UEBPD0jRk41WkrgDEdntpaBiLcTmhJk3YxjiHp++AE1E
	J/gCjsspFQAOTPXYRxPMHfbrUB9Bjt88/YpBlJOFKE+TM6wUiFLBqEDcC9wV9Ugp
	mcR2GRT5NLlpKbTeygY+d3BiAMsJVAGwrdQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u23kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:05:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccf43f7a99so11797505ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783577130; x=1784181930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vm7lobBZrOzogeeSZu3t/lsBp/vgw265Z0FDOOPQOsk=;
        b=PnwCDwiJEW7gXV9fr0lr58cQBoNK20VUue7RaVWj50WeaFA/Se3HwdtObS2qK5oTm5
         keykwnXUjB/APhSiUGvajEbFGzrWiGJLcHGuaGHOpBMtx/taDhLErCTSGkCi0D3nwkZf
         mcp4T/EdjXK8CytMh2BglioS97/H3iqG1t+epuk6Ik4ZRBIYgdmlvs258o/ZuejwzUDN
         9W+ePlLFzg1M8iXFQ/m1VLFQj/syuMjLUfHDVvJ4ITi++0Koo7wq/FQZUXVOKmDjjG7u
         A/AexuWefn7fJzI+oWPeE4JPR3gZEJ9CksTQbWhjSyj+ePMIkJO15OUyoGfAZBrdzD+j
         YBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783577130; x=1784181930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vm7lobBZrOzogeeSZu3t/lsBp/vgw265Z0FDOOPQOsk=;
        b=Q/NoPBN1e5RpP0yMCAQb66IAKE6MBAvxA3CUsvX/bZHW9EqHiRKSLgQuAKFt/wpwiz
         G8xrsJkDPmO8N3AcRBTh8V9hJy0D1nS/+wN1e5tMX0+OMNb25pQE2EsuR26PYqQt0Flp
         xPqb8Mkb+SBG28zvnBR0kKIUERSh52LGEEj7oER7lNzduDYNNnXTn62yg54tPxrxHzoC
         dRu7/fI6S27/TdfgzghfBnU0fRIhdkduXBO57EfWeeyrZ/1N/suUni4T5HVRBriwtfTG
         uxK3dD+wpbV+CV0dFrOlIczYsHzarF4CCEK8SIuxJt2zViUfhxYmI57JsDljzxMUdevz
         Rbsw==
X-Forwarded-Encrypted: i=1; AHgh+RoDMjFLAa91UhPqBc1fwJ0tR7qJKWJhnBS3wVeb+z7UXmvafBryLL+bOA5+fn6a80Mg5a2Bt6BI7is6LWAD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ZCqea6KkMX2EAC7zhsxos5xaH7Bg+NjwzWyWXEM82DhFa5iv
	BjRn42siTHWDgXMAnOV0PFqEYq6Mv3L5X6C5TSMApMKCe/Np+pkYxSOJrU1ORaTunj+ygsz+RG/
	Z2x86OO3Q6a7FxmotjEgycF8/8kSzwSZPiFqD/rJjR1kYJr4+7O/TcSdFzboNifwy9CqG
X-Gm-Gg: AfdE7cmsb4W3gIDq7zewnaHZvwxhTzeeNShVESgw1mpvJ/FXqnPWUfvLbE6/cJp8Hit
	XZDvWKFThB2od4P+jOARQ/TWhFZ3BDVofDGQBF3g+myMQQYdysXAwix9bskfk4ncwV+qyeaHleA
	jkDPPTvfMzIWot3TlLlWNd6DXTo+FKSUjy0WVyAQg0MswhdcDLP8pYaEYbUaXmtOtF3OCbL8Z5P
	4PaUeu1kW20wcUXv4+/yZn98e+Fu63CGk7JoJM2/q8diSYBVvzq+hQMR/7p3sCIVzfk2XCDLMgU
	QPYu5jGpi6CN5Rlhr4NXeFC/dLQv53fXYqPSV8/p8nYdfJs4Nmhe2WPTAlFbEB9EyDLhGEheSCl
	mcYAcVMZnCZLuO8TuL0jNrVNixhwSi+XLPq93xQbARlUV6Q==
X-Received: by 2002:a17:902:d2cb:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2ccea3e1fdfmr65120375ad.21.1783577130169;
        Wed, 08 Jul 2026 23:05:30 -0700 (PDT)
X-Received: by 2002:a17:902:d2cb:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2ccea3e1fdfmr65120005ad.21.1783577129651;
        Wed, 08 Jul 2026 23:05:29 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1f030sm38128135ad.51.2026.07.08.23.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:05:29 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com
Subject: [PATCH v3] i2c: qcom-geni: Add dynamic transfer timeout based on transfer length and frequency
Date: Thu,  9 Jul 2026 11:35:21 +0530
Message-Id: <20260709060521.4091523-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1NCBTYWx0ZWRfX1lfwGyAStE5d
 t7p/GsJdoNWwwaFODCM1nG+VPWjJEjsPBY4iuiZ74nFiPGpV5ST2ABhmX/8vbrDPO4Jv9kInoIY
 auj5D6Xl8N2O4s5z5XdMlzprOCvus5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1NCBTYWx0ZWRfXyakuVLa2x9Px
 7dmSgbtzEEvuekMR83/TAaGQIyM2OVcvPwbiBZKK22UxZoGQC/yp9Qn+DO/k0kE6uZL+isUDbni
 yor8zRrlBVgYLtoyjxpZ1x+O6MsVDM59hflRjJhAEEy6y1BpuKOQxdW1vMwXh80QDhdBp0WAXKz
 mt7WVIGtAV+Kvuyh9g6vMi02zd+dUNKIARdroM8zaRwJhoA0lnaOV+1NsRttnDRj6XarCUmjfJz
 8U65Fb2b2+PiRfr0LXxjt72f8sRSvsIC1VN4oN2cWjmtkga2G9P3H54e5VK1NWsEl8hskxcIkTz
 zjdyf8MUl+cWkHoexC6/40oIqxuZWATIzxYJcA4eG/TFYmGs7mvtUhmDPL2qcLHGd1HTBcS+JwJ
 gOgBAGe1WHc76uO7TyZ1W5eIs6u5X6akSmOZGbEXnWQL0mJiuUtqGjE5SotEu1OU/U0tg/jRJZo
 AGy1JuHlmRvdRmX6SZA==
X-Proofpoint-GUID: x6wXUp2t7k-oMtMTzYpZ7KtxrtOkPUSh
X-Proofpoint-ORIG-GUID: x6wXUp2t7k-oMtMTzYpZ7KtxrtOkPUSh
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f3a2a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ThEsosvJOpkTSRB3RXoA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-117848-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1960372CF8F

The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
regardless of message length or bus frequency, causing unnecessary
delays on error paths.

Compute the timeout dynamically from message length and bus frequency
with a 10x safety margin over the theoretical wire time and a 300ms
floor. For GPI multi-descriptor transfers, use the maximum message
length across all queued messages as the per-completion timeout.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---

Changes in v3:
 - Added the extra variable to handle timeout value.

 drivers/i2c/busses/i2c-qcom-geni.c | 45 +++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 96dbf04138be..d43db77b3678 100644
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
@@ -445,7 +458,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
 	dma_addr_t rx_dma = 0;
-	unsigned long time_left;
+	unsigned long time_left, timeout;
 	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
@@ -470,8 +483,9 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		gi2c->dma_buf = dma_buf;
 	}
 
+	timeout = geni_i2c_xfer_timeout(gi2c, len);
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -484,7 +498,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
 	dma_addr_t tx_dma = 0;
-	unsigned long time_left;
+	unsigned long time_left, timeout;
 	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
@@ -512,8 +526,9 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	if (!dma_buf) /* Get FIFO IRQ */
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
+	timeout = geni_i2c_xfer_timeout(gi2c, len);
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -591,7 +606,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message transfer timeout
  * @dev: Pointer to the corresponding dev node
  * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
- * @transfer_timeout_msecs: Timeout value in milliseconds
+ * @transfer_timeout_msecs: Per-message completion timeout in jiffies
  * @transfer_comp: Completion object of the transfer
  *
  * This function waits for the completion of each processed transfer messages
@@ -601,7 +616,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  */
 static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
-						   u32 transfer_timeout_msecs,
+						   unsigned long timeout_jiffies,
 						   struct completion *transfer_comp)
 {
 	int i;
@@ -612,7 +627,7 @@ static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 
 		if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
 			time_left = wait_for_completion_timeout(transfer_comp,
-								transfer_timeout_msecs);
+								timeout_jiffies);
 			if (!time_left) {
 				dev_err(dev, "%s: Transfer timeout\n", __func__);
 				return -ETIMEDOUT;
@@ -736,8 +751,16 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		dma_async_issue_pending(gi2c->tx_c);
 
 		if ((msg_idx == (gi2c->num_msgs - 1)) || flags & DMA_PREP_INTERRUPT) {
+			unsigned long timeout;
+			size_t max_len = 0;
+			int j;
+
+			for (j = 0; j < gi2c->num_msgs; j++)
+				max_len = max_t(size_t, max_len, msgs[j].len);
+
+			timeout = geni_i2c_xfer_timeout(gi2c, max_len);
 			ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c->se.dev, gi2c_gpi_xfer,
-								      XFER_TIMEOUT, &gi2c->done);
+								      timeout, &gi2c->done);
 			if (ret) {
 				dev_err(gi2c->se.dev,
 					"I2C multi write msg transfer timeout: %d\n",
@@ -851,8 +874,10 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		}
 
 		if (!gi2c->is_tx_multi_desc_xfer) {
+			unsigned long timeout = geni_i2c_xfer_timeout(gi2c, msgs[i].len);
+
 			dma_async_issue_pending(gi2c->tx_c);
-			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+			time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 			if (!time_left) {
 				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
 				gi2c->err = -ETIMEDOUT;
-- 
2.34.1


