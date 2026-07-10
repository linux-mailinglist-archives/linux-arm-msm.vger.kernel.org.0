Return-Path: <linux-arm-msm+bounces-118330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t54rOqcaUWq8/QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:15:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 406B273C81B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:15:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=niHyyzJ9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RqSRzl3B;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118330-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118330-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B84A3023505
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 16:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7158043C041;
	Fri, 10 Jul 2026 16:11:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088B443B4AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 16:11:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699880; cv=none; b=XkQ/V33zO2+9s9+xrFspJ7pf0SV19N5JLCG9mu4nek1ssYnWY9yCMrJsDQtb9PrPaGDKygqjEYGnDorOi3UrGvcWdyzW+M4RHEUmp32mD3UN1u5whJSXORaMLbeGhKEMKfnLcymOLeYledc65AKDFOjVmSPNY1qnEeNqHW8WekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699880; c=relaxed/simple;
	bh=9AdOw2utOUy8At6CB5zdi6t3HYQn47X5MK/JJiqcs1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hSVUTxhltC62AVT26t/W7GxEjHZLlS3v57mZpAmeC3wLyYZj9tCTWNIMB7KK7Hb5VBZa+thgl5n4zCLiYbyOSMysjsz9dxbvMDE1BabTMfkIdzuNiAvatGC5cTSqlcIsy9sSE4dWA/vEgZuzUH+gR+CtUAlg7EPVpYx2BWRrQX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niHyyzJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RqSRzl3B; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEcUmf1076564
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 16:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9KheAc7I+aBb0Mu9MvhRuCgqeY8ZW+ixLVF
	g/AQ6n/g=; b=niHyyzJ9n6F4jllZESey+VgnsJ0EmhI0zq+OrGKZ2UwTUmL+iVx
	MbG+8FhcJ9BGjmfpQNPgJ10f3rax8Yy1oVVmGZexTbWWfEXs2zyGUEx2Xx+XHoGP
	vec/AL4xZr9vJRXrNgKyhH4BuDWhg85OkpYNKccqNFArk0DywZIIzTLHH2dHMq8V
	tds6InoIiZLKpgKPjpcXteW619tfxI/VIYu+Ulvhf6wFJQRT+g3quUsI4f+lTE5t
	RjXLxLhOWy2vXCbv52voip4K4hdIVLhFXTw66snsH86nWSIz3AmsCUDPsnPrwrsV
	UsOkVzZUIoCF+XKmIP6GrfxsBS4AlrG+hfg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg996w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 16:11:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9667280edeso1594197a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783699866; x=1784304666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KheAc7I+aBb0Mu9MvhRuCgqeY8ZW+ixLVFg/AQ6n/g=;
        b=RqSRzl3BuYecQUXBWfnzNssUmV3CjPojzhdoCdwHQLfRpfNAOZTWfvpgEQSqTMRdgd
         i1ChRU/RhIbbD5LmWLx/PkfI7Ao3ckf3Kp7+6U60IhMaSRXWYRdlCVQ2xflH0uX0A1I+
         EuNGeRGNrekFhg/97qWkx2YB3dRFPO1eYphCuHVx5P9s3FvzIitBqj44MPu7N9E7cwaO
         LPlcV6hSyw1DT0V0hf44p/fJyRQGBetpCB4+w+d8+Rmxt0JMxnL8Agtk4akHPoCGEzS6
         UFcSzMCfi9EheyRvUaXFplJf9YZ4s2vwItxJct5U4H7dp/OLgo4KLPHgFuMc+pOVNYMR
         vNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699866; x=1784304666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KheAc7I+aBb0Mu9MvhRuCgqeY8ZW+ixLVFg/AQ6n/g=;
        b=bF0lAiadx+J/nPuhem+1JmPRQR2oBrbOC3JuYXjxH1Z5tty0k3woBxKZ5aF6QbSDjS
         1XBWVLRUxa4AhWhPB8o6UGxcBvyuGvEp4c5Ahyswzea215n18x+9oHsBL3ovZVEk7RcU
         7KET/OK1ANQbIdMfu2jRm6CQqW0Oz26s+ED4rsdSBQZy9+I8ljE3k05lD3nwRgIlXhU+
         R3cfNN9Bv4gC2ueT+ys7oKTyL77ms4yO0n6LNTfItNC7UraXmdvPskjCS/9xBeqAzDtR
         LD6071m7jLRdj/f7olA33p+5lZNq9dcIkLPply+Yz0dTcuL3+Ur2g9RapoKDJTcucmrt
         RgjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9jfQULRr3gaeVI05dFuDPXTDDzrNL282c4onWqGVSWDLmzGAJTyyhtdy86DQ24r5OdE1HqmtlNuouD/WV@vger.kernel.org
X-Gm-Message-State: AOJu0YyY+vdba+sRkFgx/JMuxKaWBiD+hENQdVbVhsaiJCG47PL7DeGP
	oAR0aE6CRskAdg/XocEw7hxBiWgsYZnFC/YZi6ybTJuVyTzkTT2+Ia4Psssi3jNKqRyrptOYtpl
	k+G5A3NV9/RKt/lGxyQXb/+nLs0HUtB2m2LefEKEJWiHsyoJzj5K8S9np7yWPjCNrJxHfv0HCvI
	rr
X-Gm-Gg: AfdE7cmSdmxlAHoLLhuTBXBFN+wwDL8bB1L+qvmwIX1IFNuEKcnGcph+ENZq/LSKS2U
	dNUlCfC3HThk1phkLS8OQA05H4jZAt1EUyOJWUfWYUsLk44VI2SsPeSBD6RV3UPTUP90FX7eIpb
	zUnEoZ/Y5e9BhBoslie8OaAW9ha2kecCIU+Cwz9osJ2CaPIkL8t6Qb6pj0nj4S4IaSBC6Hb0I4o
	ll12+ZSRIQ420lVu0WIQ1+w9CJr1q4g+d7j6tRpY36ncg8ouxfsITxhBzkkO2Ef//TssmMsC17m
	kvy7pmWNwsH+XSlGeQPAKuZYLnfIjWDbXHTW6QFybHuIVFc+7Y9iU4t+yhzj/Y19YeBmeQc4hEN
	27SFzGLoSlwqBMuAJ6dfwEdEPbgM/5/hmwVDqyvOz8znM9g==
X-Received: by 2002:a05:6a20:a123:b0:3bf:97e8:a026 with SMTP id adf61e73a8af0-3c0bced45eamr14574926637.25.1783699866554;
        Fri, 10 Jul 2026 09:11:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:a123:b0:3bf:97e8:a026 with SMTP id adf61e73a8af0-3c0bced45eamr14574892637.25.1783699866069;
        Fri, 10 Jul 2026 09:11:06 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b251eesm5128818a12.31.2026.07.10.09.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:11:05 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com
Subject: [PATCH V4] i2c: qcom-geni: Add dynamic transfer timeout based on transfer length and frequency
Date: Fri, 10 Jul 2026 21:40:56 +0530
Message-Id: <20260710161056.1799019-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bPP0MFCv3LIL3t8GbMsx9L79Z3GuH3ax
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a51199b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=z1CpEO-fZNADMcIYu6MA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE2MSBTYWx0ZWRfXzOIGSgJpjFd6
 6WaLyvgt4q5BMh8CXbJeXRZB4myxYKTrZ5bZQKgJmLizkJeysZ9cU8wxgDViwzd4xs0I1pzvqwZ
 gkiDHMePn6SnFEjXNw3NNM6RaoCwpdo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE2MSBTYWx0ZWRfXycsn5zHCmcS0
 lfJw601DdTnkMS3h8xpX35cUaGVninWPAINJrzfZIO2FHk3Q+yhEq7RzL1oXztoGEMb6DoRLALL
 OvGZ1yDLvg5opSd7qcakJZ8QWr49nVmGADL/X85cIkT97iK+JgoH2i46AAGHNcIzgcUvzKRuxVx
 dDQnjQkJwlqv4P4e6VfCGyYIg7GMufqadTf26ozQnejgE6+TnO0v9DrZw9zECgtUHfDTNqU8jId
 U+2s2ytEFObuzA43Zt+X/zOU1DbQsAVZYT5jZKkE8yo61LCXdWmFbaH2xtdBQBcsOBE8PQEJ0e4
 VgZoUTNgGhZyX0eL9WyeVKnAep0m4VZK0vC6Q/Raw8F2wohMbtCw+mgnSGAUA+QQ7ODcv5PYeY1
 X9oJAtkl97bsRuwxoZEXl/ZXOX0h23QXsX9ncaemudLk1JBlmd/A1q4MZ8SCB5A0P0+l0ZAg3C5
 YLZzoiYx208JYKTmK5A==
X-Proofpoint-GUID: bPP0MFCv3LIL3t8GbMsx9L79Z3GuH3ax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-118330-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 406B273C81B

The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
regardless of message length or bus frequency, causing unnecessary
delays on error paths.

Compute the timeout dynamically from message length and bus frequency
with a 10x safety margin over the theoretical wire time. Add a 300ms
floor to budget for I2C clock stretching, where a slave may hold SCL
low indefinitely during internal processing. This detects real hangs
3x faster than the old 1s static timeout.

For GPI multi-descriptor transfers, use the maximum message length across
all queued messages as the per-completion timeout.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---

Changes in v4:
 - As per konrad suggestion used mult_frac() for bit_usec to avoid intermediate
  overflow on 32-bit targets.
 - Updated the commit message and added a driver comment explaining the
   rationale for the 0.3-second minimum timeout floor value.

 drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 96dbf04138be..c5c3adc8ec77 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -74,9 +74,13 @@ enum geni_i2c_err_code {
 #define PACKING_BYTES_PW	4
 
 #define ABORT_TIMEOUT		HZ
-#define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+/* 9 bits per byte (8 data + 1 ACK), 10x safety margin */
+#define I2C_TIMEOUT_SAFETY_COEFFICIENT	10
+/* 300ms floor: budget for clock stretching; slave may hold SCL low indefinitely */
+#define I2C_TIMEOUT_MIN_USEC		300000
+
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
@@ -204,6 +208,16 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
+static unsigned long geni_i2c_xfer_timeout(struct geni_i2c_dev *gi2c, size_t len)
+{
+	size_t bit_cnt = len * 9;
+	size_t bit_usec = mult_frac(bit_cnt, USEC_PER_SEC, gi2c->clk_freq_out);
+	size_t xfer_max_usec = (bit_usec * I2C_TIMEOUT_SAFETY_COEFFICIENT) +
+			       I2C_TIMEOUT_MIN_USEC;
+
+	return usecs_to_jiffies(xfer_max_usec);
+}
+
 static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
@@ -445,7 +459,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
 	dma_addr_t rx_dma = 0;
-	unsigned long time_left;
+	unsigned long time_left, timeout;
 	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
@@ -470,8 +484,9 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		gi2c->dma_buf = dma_buf;
 	}
 
+	timeout = geni_i2c_xfer_timeout(gi2c, len);
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -484,7 +499,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
 	dma_addr_t tx_dma = 0;
-	unsigned long time_left;
+	unsigned long time_left, timeout;
 	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
@@ -512,8 +527,9 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	if (!dma_buf) /* Get FIFO IRQ */
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
+	timeout = geni_i2c_xfer_timeout(gi2c, len);
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -591,7 +607,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message transfer timeout
  * @dev: Pointer to the corresponding dev node
  * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
- * @transfer_timeout_msecs: Timeout value in milliseconds
+ * @transfer_timeout_msecs: Per-message completion timeout in jiffies
  * @transfer_comp: Completion object of the transfer
  *
  * This function waits for the completion of each processed transfer messages
@@ -601,7 +617,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  */
 static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
-						   u32 transfer_timeout_msecs,
+						   unsigned long timeout_jiffies,
 						   struct completion *transfer_comp)
 {
 	int i;
@@ -612,7 +628,7 @@ static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 
 		if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
 			time_left = wait_for_completion_timeout(transfer_comp,
-								transfer_timeout_msecs);
+								timeout_jiffies);
 			if (!time_left) {
 				dev_err(dev, "%s: Transfer timeout\n", __func__);
 				return -ETIMEDOUT;
@@ -736,8 +752,16 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
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
@@ -851,8 +875,10 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
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


