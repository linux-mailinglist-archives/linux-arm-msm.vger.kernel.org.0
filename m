Return-Path: <linux-arm-msm+bounces-95829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KHIMMHfqmlqXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:08:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 258B0222511
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 041CE3018771
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA773ACF1E;
	Fri,  6 Mar 2026 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7aWQTs0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLV02YTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FF23ACA43
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805762; cv=none; b=iztIR/d/VEiYKhgoAD8Di5tQ8efN26fy7cuNlpZ0pHQXrS2hLIaj+w2mLIxosCxD/GtQVLr/WhLcrqzbFmUIaWZxePaP6DzvkrRE6jwOfqLyPYT6g66tGgrNO8E6ESn8K88C8yNZTUy/sWw+T2SY6U+YxLbZt7vJ2sYDlmy+EeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805762; c=relaxed/simple;
	bh=XdypX5R7YHwAfdYLbFXiX9GcnSh1xUjeI6q+u07iB2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o/wiDAPigeLvfUMvK9FK3X8DeeemZ1Ec9ZiG05gDKsLn2ZwtJgn3Qhasqdwg4eYwCtK6unJ0LBpBNtM2ioPH8qrRlNJVl1H6q7VUo58VRIoZc1Dna9eVQmX8b3ZKE/wcC8YCLQlKb321VQ+7kE3Jn/gh2zPIaImGeajlLVs0bF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7aWQTs0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLV02YTr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbFd84150967
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c5Mh2h/OmTF
	2BgN3VOSbtDREZ+HVddrQQ8YeRPNbPwQ=; b=j7aWQTs0N9GHkzkgqI7F+hmbMf0
	U3cx0Kj/nMfK1HbV0v/g1tw3jipIxchskdhb9pHpxGOHgWBqXOOvPS3GtGgppkiU
	nMeO6k6dWkDIwTo5VwTZu5QFX8HQr2t5Rh/VbreMFNl0wIdMGfMgpQ0koyPWHQqt
	M4JOaRTX7CvWrKk4nDwMfyN7zSvfI9FFXD7phdkb7ps5WczDYNLkonsYD7VB5lkV
	ELcGi7CQ6q8/75l6OEWG0o38ghQ2xplyhJqy1v0wzgI85SgiMmWNSBd2FxG1V0sr
	3OVpVk+phDqKTmTc4mzPaDXv36kVuiP3uw4GvtMQ7PjU0KSCDby5g9GT+gw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25ucr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:02:37 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ad0d8eff8so68612467241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805757; x=1773410557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5Mh2h/OmTF2BgN3VOSbtDREZ+HVddrQQ8YeRPNbPwQ=;
        b=SLV02YTrQ6WWZWQ13wWrWcqZE0QV6jqgaOxB6/h0cnlA1YnB6+FKSLp9TIao9x4Kxa
         E3Mw8cDm96QdtxIb3xUQrKlN6Nbke8B3A1J16a1lE985UX6IVJPgpphDFmlZxMJDDMWb
         GL/ygEhvua+Vk2W5u70rd4cbtHvJ3uNsxyoelnmqwnioOo1XgKMbOY1E16S8IlQf2uy9
         Cg2HBtsmRmV3LCMd5lSL5lNCTa4+A5XC0fAQPJpVPu4bb4SOPAhXHLZGDBYgtrwZa5d2
         Yi8cINnKcr641xML42CVelZrj8LzP/MR23D0SVHevU65a3+iDZxgj0QiHG5cXu32/s8b
         6Frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805757; x=1773410557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c5Mh2h/OmTF2BgN3VOSbtDREZ+HVddrQQ8YeRPNbPwQ=;
        b=XmBNC/zoHyI//jUYuiCyxsm7Tn0PYt7b+IdeQLEEWUn7CJzdCL04fRPRV+IxuIr4IP
         MpNUGfOw6Qk+ivTFCEUWTJJ+D0qk6mSRe9hL7mnWx/DO2H/gefEKRrC0iTIZZ/TY7nC5
         MUh5jJ13HOCfOp8IUMza1Q1XxbKagZaLPpDW/HonyYHcTwjYP5Jx9Zze6g4hIb/GumyI
         1F0EK/1daqljsz6VuLhfTDphsJoash/GCQtrpnqh4CTlLFN4sAgLkpSKELLe3E8FwTpX
         jfochVHNB4JfRIU4xwZCuJVgoWoQpo1qULj1eF0gv71JutfqZfQ1RIJ5odfNI7DEd0VD
         qaPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGg8Xg3r9DJuy4tfR5A8xIsiPX5nowACZ8xgXlxZ3t4SvMTGrKIhNqYN3rt0GItuvzvjD1G8SL8wUN+Nhq@vger.kernel.org
X-Gm-Message-State: AOJu0YwKH6eGffiqzTSzl6JTBaagXOFsmAHgDAwClDY/WpPnS5xoTo6w
	JrzufunQIHHjdzjU4M422+PKHfZsjwzLB9JwOZvIFb5vP5zH9+U6UT/DAMuj3ODLMoL4so5yN7c
	yTwAzIK1o87CHr2t9DVOXASVUU3rEB8isn4huECnPyPWlrEM5ZA8vFqG7vDLiQ/JK3GMA
X-Gm-Gg: ATEYQzzlIvbyKf4X/B/DRoD41y9NMgnakz0J4xS8ztvjga3k/KrgRs10fq509Psw7xR
	xtVPJa4EGU6r1NeTvz8iUs2FVcuKUE3Yj314rZeKYEzmmuCu8+dh2PlLB6FdVW6bx0zHO/kVtKr
	pUsooaqBecFCita81QQD8B5v6cMvfQjDbIIxtacSrhhYG876G+2cqLaqTahExBEBLijiJb1ImUO
	MvpNbP4v8BTumUZR6YkjzGJigijjLNWSm8QUaISMBQmuq6GEtGdDQvXEQYnwQlgt8jrGiwy8kH6
	wUtKcbPMxFVtKZfBs94C/c8Xjm7O9WfltRuI3GMogk6AJzrtvMwf3njeQaKoWubu8/aBuDaBWxZ
	VzssqHs6OFm1orMM9y2/x5jv9KJqKO9hdv6ZUv9p8L3sxtCw74Xd87V0NW/HtHnPaAgh5jGLbwq
	rVN5iW+yow4e3bM3ahso38vB6wFHEQgkzGdTXnL06dLw==
X-Received: by 2002:a05:6102:c10:b0:5fd:ea47:d317 with SMTP id ada2fe7eead31-5ffc8edc536mr2505952137.15.1772805753874;
        Fri, 06 Mar 2026 06:02:33 -0800 (PST)
X-Received: by 2002:a05:6102:c10:b0:5fd:ea47:d317 with SMTP id ada2fe7eead31-5ffc8edc536mr2505792137.15.1772805752700;
        Fri, 06 Mar 2026 06:02:32 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237f2d2bsm20171425e9.4.2026.03.06.06.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:02:31 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 3/5] media: qcom: camss: csid-340: Enable PIX interface routing
Date: Fri,  6 Mar 2026 15:02:18 +0100
Message-Id: <20260306140220.1512341-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AK9il6BRuBtmP_7mk0f6tXGvspgPNhLY
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aade7d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Qlv3vNw1l6VwQTj1CKsA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfX8mGOhoGP/qs2
 p0D0pWbVOuR4d01R/On+rWEdsn0A4KI+fR45Y0uCkaIxagFKjGoBcja1CTVph0lpmNNi6ZYIWxg
 UBpIKyT+HdBzJCh4WdgT+Eefg2AvJw42SRl0jAG/Kr18Iu2mdrvmAnsjp16WXkJ8dvUivZNvep+
 5HRgMFhSH79/hk0pPUspJ9HX/ZochlZzi55R0gmI8eR6gB/vOLsKL9YKyak3TTBz9ebDT8DLYnu
 pGvSbZjW+BErqjen6eq3V79HgPooaUFpVEbX6R9XJimN4yu2NxA8oJ29c6/8crPkQRxdIYf97vB
 ZVY/1S658aviohSclep9SJonYwje+eJAJxTN+Fl30nW9OkeWYoIjgCbyhKmh4jTEt9DKbB8XqTx
 CJmcF/ToeiiauR0z5nMoiv5wpaXLbCxGyYxv60O20xBuOILM4W3AhbtQ47QMuvHtS49ZSGwO2eA
 uhEf9MS9PiuDAvgTVsA==
X-Proofpoint-GUID: AK9il6BRuBtmP_7mk0f6tXGvspgPNhLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134
X-Rspamd-Queue-Id: 258B0222511
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95829-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add PIX path support to the CSID-340 driver. The hardware exposes a
dedicated PIX interface in addition to the existing RDI paths, but
the driver only supported RDI stream configuration so far.

Implements a dedicated __csid_configure_pix_stream() helper. The
PIX path is configured similarly to RDI but uses the primary stream
(VC0/DT0) and the appropriate CSID_CFG0/CSID_CTRL registers. Stream
selection logic is also updated so RDI and PIX paths are configured
independently.

The PIX pipeline can subsequently perform further processing,
including scaling, cropping, and statistics.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-340.c      | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 9e80408727ee..f61493d2e72e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -56,6 +56,7 @@
 #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
 #define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
+#define CSID_PIX_SRC_STREAMS		CSID_MAX_RDI_SRC_STREAMS
 
 enum csid_iface {
 	CSID_IFACE_PIX,
@@ -64,10 +65,11 @@ enum csid_iface {
 	CSID_IFACE_RDI2,
 };
 
-static enum csid_iface csid_vc_iface_map[CSID_MAX_RDI_SRC_STREAMS] = {
+static enum csid_iface csid_vc_iface_map[MSM_CSID_MAX_SRC_STREAMS] = {
 	[0] = CSID_IFACE_RDI0,
 	[1] = CSID_IFACE_RDI1,
 	[2] = CSID_IFACE_RDI2,
+	[3] = CSID_IFACE_PIX,
 };
 
 static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
@@ -123,6 +125,30 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, bool enable, u
 	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
 }
 
+static void __csid_configure_pix_stream(struct csid_device *csid, bool enable)
+{
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PADS_NUM - 1];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+	u32 val;
+
+	val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
+	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
+
+	/* For PIX we use the same VC/DTID as RDI0 (0) to capture the main stream */
+	val |= FIELD_PREP(CSID_CFG0_VC_MASK, 0);
+	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, 0);
+
+	if (enable)
+		val |= CSID_CFG0_ENABLE;
+
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %sable PIX (dt:0x%x df:0x%x)\n",
+		csid->id, enable ? "en" : "dis", format->data_type, format->decode_format);
+
+	writel_relaxed(val, csid->base + CSID_CFG0(CSID_IFACE_PIX));
+	writel_relaxed(enable, csid->base + CSID_CTRL(CSID_IFACE_PIX));
+}
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
@@ -135,6 +161,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i))
 			__csid_configure_rdi_stream(csid, !!enable, i);
 	}
+
+	/* PIX */
+	if (csid->phy.en_vc & BIT(CSID_PIX_SRC_STREAMS))
+		__csid_configure_pix_stream(csid, !!enable);
 }
 
 static int csid_reset(struct csid_device *csid)
-- 
2.34.1


