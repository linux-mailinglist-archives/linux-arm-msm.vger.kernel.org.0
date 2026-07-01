Return-Path: <linux-arm-msm+bounces-115780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KLOyGF1rRWqd/goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 21:32:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5F56F0E02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 21:32:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Y0n4zwP/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WRKXTgiq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115780-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115780-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F23DE30DAAC5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 19:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C2037DAAA;
	Wed,  1 Jul 2026 19:30:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A1C3E0C59
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 19:30:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934229; cv=none; b=hvHf2vdAebko4JBpUxqyLIC6N1+Qg4nrKJdrLmj2URNDYtUyNWLeHgF3iCpbsOpdV/rrpvYB/80wwLNAOazyCOYGfIV/4zVpC+nBkDDzuMkXS4dvlHFeRrjGM7gtL5U5jSQ29iKwuvl/QTiyTZtKUY0TQO7BLKBhJ2ypO+lWmIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934229; c=relaxed/simple;
	bh=H1tWqWH7f7OQkZEAmqyHzljV+KmSOWJG4Cq1nkdT3/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQD1TyDtt3RDBPzpnuvIl4aGWPnY3uMjrYbaoSMMyL5kZZDHkWuMxx6fRUMCbWiy1o+cfCHiP+PKdyL2jAecWcpmxs0Cv/Ac9OT/Pc8XhyzeDl73HfFg2MRBoMR6htThm+kpYkigNQ9vp9QC2ZuERWCPQY7A+HMR/b4iD54h4O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0n4zwP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRKXTgiq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gmbxg1589746
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 19:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rdkpfR+9Aob
	jzCSwvABnZN2AM7OvMcx6SeOAFBF+rQ0=; b=Y0n4zwP/8mL5g3Z43mdK1TWv07I
	AGwpMbtrnJGb0LuEY2T42shD3uofnYLez/IJoKFjxRk7g2cp70Cy3J5OTnp76aEa
	jFizmIM016M/So3nEBKlP1kyDXME6WPnas37EK29ZivTlWhY0p80+NsxmtH6B/n2
	jA9uvDq5b5PHafEO1tQkY6B9d2tQ53tkpMnssBoJGEBdmO5AoSNBP4zNTeLN78Ka
	rCbp3Gjadkx3VObCrrWxrDqHPqGFBD7nwT9op67/1aBbE9pbBHwZbnG1vWh+2yL/
	lPSGDHTUUZuK/gD6znpj9m/InEeX+HpbT+h5XiXDiVE9P5A1Nv5KbdQgK9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q09gra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 19:30:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92d1cae5939so135756285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 12:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782934225; x=1783539025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdkpfR+9AobjzCSwvABnZN2AM7OvMcx6SeOAFBF+rQ0=;
        b=WRKXTgiqTXOtWwpMoQPgu62vnspHKBvuuglv3THv7SvnVUtuZWj+IZW/P2mxupp2QM
         CHkjfX69Fw0D4mUWJrZz/4886BPIYX6/mXrNk1T8ciGwRXlnPUZwGJGvRpJPIHekxUXn
         5ktd+YpieWJ2MxCNpiKL3jLRqO0zPoK8guFVAJ6GQaEnWt9gU1QAP++ZCALRqIDCC4Fs
         oXEn4ptz5RzAtzsiemdyFQpFgEAEvDJL2gUx7qerqGV8ZTIeQfGl22D5B0cauUOASGKK
         GVUeaXZCJHZrfodn5uFheAjijaopc7pz0nwtXX1Gzh1qdpwDtykmwUktPak0DYFKyqwR
         HE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934225; x=1783539025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rdkpfR+9AobjzCSwvABnZN2AM7OvMcx6SeOAFBF+rQ0=;
        b=Xn/tkV9CkvrTLZBV6CCU5DZtntzTXMCrvbdWd8KQEb/KIn+rI2A3WoYFGCh6oOhZPY
         nLEZwy/7/KFmSVOdbMU+KyG6G2DpiBXg+808p7k/6ZWsy8k4Fkoqphv/KN1IvNJ1dI2q
         ok07JH5SgBporkoz8Cbph+C3E2BXUJJGsyZ83T5L5XzDi0QkkFtlwcyKQsB8gOI4ijXZ
         3EPGYKOEM2bONJbis1ERGmKWSP1DWCqRZyCkrhBuDKHQKviPFsj6dV0snwf8qDVW6hEj
         DXa/GZNnZEQ9kp0Eq1h/ysxyTJb8OrdhbKflEx16hxn1bgGWri8iRdpXbPrbUbYVt+W/
         pPuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+52Iwaz/e3WX5laUCvmxjwt6zbVJplNt9c/wSmO7AQvNlo392RMyhAtiZFpNTsGs6WYUuwQk3/eZRIGpHW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ZTlDqiAOX5WIoOBlk0tzk/BmCB+sD3Pr+RFf5uV5p0m5eIgI
	cY6g31p7GtApw1smS6CtxdwEarubJwytxk8xDcThKhGNdGD01RprbolxprSzPTtjp/Pq5MIxAUC
	QTCbXYrtWVzFR3n4Bk2SAc/qABA/luzCdMll99/7jUpi/fyVP53pVw9984SmfLif/a4S4
X-Gm-Gg: AfdE7cmzfTVHwGc+L0Zlqaw5gRnGaI05hUvjuO/FKHyuOA7P9wYtdqoPrgSyWwOxJ57
	SJnOVfmkm1wKJIIZrN7HR6GZ/YN5i8CFcbg/kQX7I9mNDMf8JQOirm1R1viV0iW4Gcn7pt5iCwr
	yUh689SDVSw4AMQLlZ/A0x/Z+Dvfksrf0F7rcNgG9rWwjvCRTMe7f2FE747nANaAog/zKShpTQa
	eUjsgHQfV73u8FmEAMmUF52TCewMdR5vee45jM7KKWWO0PcGYhNJFf35bkpBLutA2gU3oMxcDpK
	JKxZdotgnHhUXXgzJNdz65L9fKx2soUkqdrTnKTgl+hAgayGIMIkocDMa/pFo/JAdOrE4IUM2Xc
	L5ChB0k1AlGvH2lV7AwbmYDXk
X-Received: by 2002:a05:620a:29d0:b0:92e:7181:efef with SMTP id af79cd13be357-92e7852bcf5mr437640385a.67.1782934224542;
        Wed, 01 Jul 2026 12:30:24 -0700 (PDT)
X-Received: by 2002:a05:620a:29d0:b0:92e:7181:efef with SMTP id af79cd13be357-92e7852bcf5mr437610785a.67.1782934222276;
        Wed, 01 Jul 2026 12:30:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef11338sm78261885e9.1.2026.07.01.12.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 12:30:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: vkoul@kernel.org
Cc: srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH 2/2] soundwire: qcom: Allocate sruntime array dynamically
Date: Wed,  1 Jul 2026 20:30:06 +0100
Message-ID: <20260701193006.4113-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a456ad2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UtTtXjrgFGKwB5H3BscA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: YLEnLcFKrFVznt2PMA5M_BxFQOuEEtHX
X-Proofpoint-GUID: YLEnLcFKrFVznt2PMA5M_BxFQOuEEtHX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfX2Xc094fCOXWX
 11m4hpOh3PeuVU0tZkgBDtsW3qn3TVlnJmJZSWa9dae8GM0FuloA8g6N2UMHzp/DofGtgYXcsuX
 U6DYL7OOccHLK2q2EOMTzqU16azhD/geDuWHKLtyaHnRAjACJRccq57D6ncM3YO82J6VxONooc5
 BMqVE5fvfefTQ53jZKlNIp2x/O8s1tW52nX6DW9lCgphQjbmocDlc37asPeofp6ILg+AZgiFoI8
 cxirvizVgJKEGd524qEFDsT8YeO933UxzaC1latC9mekt+LfH9N9w1ZizUJXbqft+9qNKirt4mc
 lZtySFP2DaIsw8ixT6Ay0bKyNRcv6Eqf+ur5TIaIooJBXXx5+ELBpaOxEfCzOx7/cdn6YTY2a7C
 DDrw5eV+Vfu2n6/GvZjTUSv0DSdslcK/G4YfngLWWUUYn2En0v64EyqjI4RRWT/2ehMaYMOuwkz
 OwmTqIfbTtF5wsiLtBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfX4Vtq1HKxeqRv
 RGp5y/1ulzSgS9mE5odK3ZqGFGbIWhG/bQr+GsJadZzi8eZjJGDR8tiu2T2dWvovQXmIwTZ4bi4
 QVslbI/04aGQfzA9SIjQ4re96x5w+rM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010208
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115780-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:srini@kernel.org,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:sashiko-bot@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA5F56F0E02

Instead of sizing sruntime[] with a hardcoded SWRM_MAX_DAIS constant,
allocate it at probe time once the actual port count is known from
hardware.  This removes the need to keep the constant in sync with
dt-binding limits and naturally supports any future port count increase.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Assisted-by: Claude Sonnet 4.6
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index b288218f64b4..603f228f46b5 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -134,7 +134,6 @@
 #define TIMEOUT_MS						100
 #define QCOM_SWRM_MAX_RD_LEN					0x1
 #define DEFAULT_CLK_FREQ					9600000
-#define SWRM_MAX_DAIS						0xF
 #define SWR_INVALID_PARAM					0xFF
 #define SWR_HSTOP_MAX_VAL					0xF
 #define SWR_HSTART_MIN_VAL					0x0
@@ -215,7 +214,7 @@ struct qcom_swrm_ctrl {
 	u8 wcmd_id;
 	/* Port numbers are 1 - 14 */
 	struct qcom_swrm_port_config *pconfig;
-	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
+	struct sdw_stream_runtime **sruntime;
 	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
 	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
 	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
@@ -1384,6 +1383,10 @@ static int qcom_swrm_register_dais(struct qcom_swrm_ctrl *ctrl)
 	struct device *dev = ctrl->dev;
 	int i;
 
+	ctrl->sruntime = devm_kcalloc(dev, num_dais, sizeof(*ctrl->sruntime), GFP_KERNEL);
+	if (!ctrl->sruntime)
+		return -ENOMEM;
+
 	/* PDM dais are only tested for now */
 	dais = devm_kcalloc(dev, num_dais, sizeof(*dais), GFP_KERNEL);
 	if (!dais)
-- 
2.53.0


