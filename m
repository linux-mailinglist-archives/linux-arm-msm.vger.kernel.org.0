Return-Path: <linux-arm-msm+bounces-95869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NhcL+36qmmcZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:03:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B4F224826
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47DFF307E42B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132812853FD;
	Fri,  6 Mar 2026 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oksn7Qm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FgR+w90W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80CC3AE1AC
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812818; cv=none; b=Nyl7Ed26UfruqbY1MaZdSuHTjXzCkg8kH6FPBmDmAvz5dtAm8breQRtt2jVlLPnEq6r5rj+eKjcqUNUOyrXzonKh0WPJMJj3XVuBhfPS7nHn7l3A8ZKi0uLYZI5hHTUzMMs2Ji/HGGJnvJMaxRsH+IwoDHyNmbSXoRcf/atgsnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812818; c=relaxed/simple;
	bh=if4eaLzLPgPSjLbsM4bnpYncKYVm83evR7YeMoNXPFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CRByrklTRMdbcZ0eLX2R1oGfSTPSoMThOek5ckD8ECAan+mAlCMHjJEO8tKiCieXATUb0FoNLgP6ymVZBoz5uieFUNNfKUMLzgGaQQS6oB0Ltaa4ja6xf+a8M+zmoi23tlgVg3Odq7TcWGWaVvVKKJ3Wym5d5iEgFYolHu8sLIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oksn7Qm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgR+w90W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fr6822008575
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qvPNFU2tjsk
	R6IdlqRpGfMUHzJ76OegAIKA/3dzxcvg=; b=oksn7Qm6J+h11HxqXPd0rJqHwAt
	io6S57c1PYQCUQSdTNJZSk9JviDP2jA1A4K69UEX2mmMajrHqkfQd5MkoxLazbdU
	jInz569hO5SUAvlySRR4NYHFbUyZzHgVdxD5if1I5XLitx6pQCs+VTM1EBVCOY1k
	h958AQi8QtSDy8hnleJqghNRvQBP81zvvF+qIl34uOI2lRZU2FC3XPvj/ti5b2it
	Nv9iruoWSbndL9g04NBGRM8RvhmPKMdOMR1nOFO+AtHGoyvuvHdggJqGwutkC11/
	gQP4FOqMJVcl1K7kI2m+K6EWinJJXh3f8FCVy+hP9Ji9o3+VuyM2t7i/ryQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ah7hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:00:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so1233107985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812815; x=1773417615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvPNFU2tjskR6IdlqRpGfMUHzJ76OegAIKA/3dzxcvg=;
        b=FgR+w90WOj7sUOIwUcPmPu9Du1bbO2lylCLmDg42nju0s8PYLczzvGmMnSWEIJGVn8
         eUej5b4oLrgocq9t9p52Syq48nAtjk94VUDHmzsxVYhoyd13tQSTkyAbeQWJ8fGekXOF
         ereKZ2BS5GlkovZpzQYAsdTamgOxqtaE+SWtoYSP1MGBATtHULv9nj10ZBZE1KTjrTMq
         NW6YACAY6IB18DKVwAWVurlV8++f8G/AmH+RKcGjZQrNyKRujUlC2pJzkdfpIJ/aSYij
         Ksyl0FCe6qIa5rNYI4ovr782OzZffN2Qny85OldSk1c4G+az3IPHaaWeDuPhAme+qUU9
         8zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812815; x=1773417615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qvPNFU2tjskR6IdlqRpGfMUHzJ76OegAIKA/3dzxcvg=;
        b=kP3GtQd4n0fWoFugbl0NpWn8+PrtXMrCzlnQuWf5BNF1EzS1nH27Nxme2N1UjsI4MM
         Tq7LgdS8senQNe9jqA7gb0LArVOwxgGGBFhUz0x6WWYxbVg+xXS3w62c5DALKrTMLKzT
         qXwFLogHCSxVECmBK+gkcOReO763AJ8OW+FL5AXLwyKHcwNo7vDC2oDChfE6XWM6lY3s
         zeqXUESsLEW5JFTtmY/RUOOvshGFbk4Dz+WGXYvhDC27SIqHtbanVxKqC89N5RUrFvNO
         cFbRkGqIBxTy2aQtFtQKuSpe1BbccuJd/wRDYa+89bAMjGKNfwxarInXptmOQmySzS3I
         Yufw==
X-Forwarded-Encrypted: i=1; AJvYcCU9SjpasY3jmYgpLpoYiZFl3UhCTHh9pMtxDh+arOIDTOpMToUSA/AA7mHmwFzNBuGDRLR68PMwC5o1ajBD@vger.kernel.org
X-Gm-Message-State: AOJu0YwvflNvN/5TlE/tibR8KD6MPr+hKqH+7Jr/E2Va+7kfHwprk42E
	6vv6qwTiM8GJw9I9RHyGbOg1sjmb6jUvN/3EdW8K2yByzGgzxP5ETHa/UqZ6ZKW+JvWBMC7mqjP
	YCs4TDwJ1eH9hClSUM6qeVYQ5/fNiAs9Sh5obSxKXPPwbee067YwkkfWz669nP/m4ttwT
X-Gm-Gg: ATEYQzwWW4yerDBA4aVO+BGtItkFtZYxTqx9Au+Shg2ZYOkQ6+ZZSN/aP3Z3N0dTtvR
	qc8IEtGXhMrcGP8edY8XZyjG33FDiXP2OAgJjQkh8wOFa5HYvDKkwLJ6dgwOIhybzf+84dh6b9C
	R4Mq/2tvAUpbcEma9R2K79B1kP9bFczuJZygYFoKU/9yCkCd7f5t1YVPM5uw4s0gBGSz6PAEEu+
	jgovbEwUt0G1rXIK3VUXdRcgqb2QNSXN7dULo402OtZ4dLejcijMx7NgjSvKhyJYJZRI/nUSnQ+
	B3YiyyTSGgOussGyfNkNWccHIMJmP+Wkf60Vr8YxwP8prXMnv0IA5UbkxoT7tHgDYjI2XDJm+x9
	ZMOoce7DkiAkMSVsWJPOWc73Wd4CuM8qOnS6osaRocdNbRmlc6rR9cshlBSfo9iRZ71WDbF7wbp
	4VU0jSwyRT1QqVy9oD0BHBP0BbKtjPwXT3ibJriLuAyw==
X-Received: by 2002:a05:620a:31a0:b0:8c6:aeff:4002 with SMTP id af79cd13be357-8cd6d4a4e6amr321231485a.81.1772812813543;
        Fri, 06 Mar 2026 08:00:13 -0800 (PST)
X-Received: by 2002:a05:620a:31a0:b0:8c6:aeff:4002 with SMTP id af79cd13be357-8cd6d4a4e6amr321208185a.81.1772812812013;
        Fri, 06 Mar 2026 08:00:12 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada9116sm4695983f8f.14.2026.03.06.08.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:00:11 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 1/3] media: camss: Add per-format BPL alignment helper
Date: Fri,  6 Mar 2026 17:00:04 +0100
Message-Id: <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xH5yG8lpLDrMxxXMF4adFJzxC_GM8hgf
X-Proofpoint-ORIG-GUID: xH5yG8lpLDrMxxXMF4adFJzxC_GM8hgf
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69aafa0f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ksOl0FbaWB9S7YhX058A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0OCBTYWx0ZWRfX7/9GbRfJvxAg
 v0bCjz6bDk6nQLHDqzj5UaxnJZ7zSYMLSI1kpxzQO5FQzIeCRV6cg3NdIIipO0HdgL6lYwlp0/6
 acKbXQbhn989hbAZQDQjwrn60okChvEp7CaMd8Tp2xBZQO45uJn5jF/FwD30KgLi3jPppXuCN8m
 O/MEvkh0BZXbEzQQn7V28lTBRmhcrW3ixYQPzrgqTEqUxCzQaxNhIG2ccNxW/yVuzGJ7MVIMfbc
 nm4JcS8p4Trd9b4MmDeFiUNuMRH4RVwlEUqsta58cVoz4orT9H++/9eWf7Kp7q/VitJrJOgNVyj
 aMG1FOtKBhPMchaObYdH8UH57BqDbFTAvJu5h60HFBIAZyGZpO+4WfGu1BGJeIYqlsNeJweXX6f
 Z0lBMHo5qKFPSV8YB9mFyXtdWmAPkdDxi9tX142X7BDipiTqQ3WhGGo/MjbXbZxOpB5FGEpVLQk
 vPcIcuaidZr4Nm19K9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060148
X-Rspamd-Queue-Id: 64B4F224826
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95869-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.986];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add camss_format_get_bpl_alignment(), a helper that returns the
bytes-per-line (BPL) alignment requirement for a given CAMSS format.

Different RAW Bayer packing schemes impose different BPL alignment
constraints (e.g. RAW10 requires multiples of 5 bytes, RAW12 multiples of
3 bytes, RAW14 multiples of 7 bytes, etc.). Centralizing this logic
makes the alignment rules explicit and avoids duplicating them across
the pipeline.

This will allow PIX paths and buffer preparation code to correctly
round up BPL values to hardware-required boundaries.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-format.c  | 28 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-format.h  |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers/media/platform/qcom/camss/camss-format.c
index 4a3d5549615c..2cd0f3a0bfac 100644
--- a/drivers/media/platform/qcom/camss/camss-format.c
+++ b/drivers/media/platform/qcom/camss/camss-format.c
@@ -33,6 +33,34 @@ u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nf
 	return formats[0].mbus_bpp;
 }
 
+
+/*
+ * camss_format_get_bpl_alignment - Retrieve required BPL alignment for a given format.
+ * @format: a pointer to the format
+ *
+ * Return the required alignment, in bytes.
+ */
+unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *format)
+{
+	switch (format->mbus_bpp) {
+	case 8: /* Plain 8-bit -> output must be a multiple of 1 pixel (1 byte) */
+		return 1;
+	case 10: /* Packed 10-bit -> output must be a multiple of 4 pixels (5 bytes) */
+		return 5;
+	case 12: /* Packed 12-bit -> output must be a multiple of 2 pixels (3 bytes) */
+		return 3;
+	case 14: /* Packed 14-bit -> output must be a multiple of 4 pixels (7 bytes) */
+		return 7;
+	case 16: /* 16-bit -> output must be a multiple of 1 pixel (2 bytes) */
+		return 2;
+	default:
+		WARN(1, "Unsupported format/bpp (%u)", format->mbus_bpp);
+	}
+
+	return 1;
+}
+
+
 /*
  * camss_format_find_code - Find a format code in an array
  * @code: a pointer to media bus format codes array
diff --git a/drivers/media/platform/qcom/camss/camss-format.h b/drivers/media/platform/qcom/camss/camss-format.h
index 923a48c9c3fb..4f87ac8c4975 100644
--- a/drivers/media/platform/qcom/camss/camss-format.h
+++ b/drivers/media/platform/qcom/camss/camss-format.h
@@ -55,6 +55,7 @@ struct camss_formats {
 };
 
 u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nformats, u32 code);
+unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *f);
 u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned int index, u32 req_code);
 int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_format_info *formats,
 			     unsigned int nformats);
-- 
2.34.1


