Return-Path: <linux-arm-msm+bounces-110271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA4xKiONGWpTxggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:57:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B96F6028F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E9403008C0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA05B2DC767;
	Fri, 29 May 2026 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1oKhUYG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AubOS4Uy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF972F39B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059370; cv=none; b=QmoU7MkHKre7pjVp+SFbXE10nRDyidjXUr5qhnhtv7yahc0LkrllLlND51ad+MR3s9MlSRwOAgZnRdARNLe3d5mn/s19RcmhQNc7/HU8OmS7jKMEtEsbN1x03VrGenZHb6Ci5U8HlZi2Jx+I6ar6SiEhFxNEpCsvaLkm8yEWEDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059370; c=relaxed/simple;
	bh=cBvvneJfGJhX9Fyl4t3YJDwOJjbmuxDZLayl05Ei4+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0YljPtL6SRLMg3jEp59ohrwUlRhnKRpqKlWkcjk6x/rZfm14jzFihcVzqUCE+cAPJ5t2dSbpsjPyDTZk9mvRf4VagLjtFGpaq4vcXX2r9Z+uozwX5M96BK40opXVUTRdkWqYwsq2Hj8tgnJfpFA/HdALmL8l2l4o0NjrIx0MO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1oKhUYG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AubOS4Uy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6WdUw1386624
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EqBIzW2d/Qy5w+LqO0U7UT6nDTErkNchWOxlyPRePYI=; b=f1oKhUYG68PZFmrE
	299r4PlcKr2WO1zCcr9Eklceb+e9BQ50O8tKVfBWS9MJ8CgjF2GuLsFzHzRO36p5
	0npEYnIDd6qHsAPYzpgcom+i4ZUb3YH0XmUVaeKRGdFtea/uj7frQVZp0gDnyf4K
	lGpzpkiWmyNZmklF6PEf1dbMvGrovR7m+LKHy7lGrF1Bc0JhYQ6XyLljH2iZbamD
	PYvU6bgw9tTkfaUgZQW8/CBjZdG/+sH4bB+HJGSrjGtdUGpIwCo0Kxg/YK6Xpvpe
	BamtFQu8I8sON7SC67PgaNTYxZF0o25y9OzTw+LApHzcWZBqJ+Vhkck6kbdl0JLp
	HnzCMQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumuj96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:56:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828f0f5c23so7140586a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780059367; x=1780664167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqBIzW2d/Qy5w+LqO0U7UT6nDTErkNchWOxlyPRePYI=;
        b=AubOS4UyGhbA0Xq5l0vFbQT6CqzTbX3usBe6UlQLQRuEdY8S4DL2fsJMFNp3Kk82Ut
         Onitsguxpb1DkwSbDy3BNmSBZqwYptnsjYun4o2RhvTuiMcjCECyXebZonttB6wSqVzN
         YISfe3DxCsVmg78+q9TFPK5fVkpaEB0b5YQH7prJSRaLVJ9aFLxqv+3T1tEzE/gzC2F3
         DmqBL5VNcHktq2/ZwkN/H3Rp5Xs4/tiRxHXzmJoNprfMQTrJdx7+JjDkCDkUBw6n0KDZ
         /KHOC3qxL39moyRiJ+2gK/kr6HUTg6029zTzLyBPWsaajV6m5t3PtC+RAIsBqGWVx++B
         7LYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059367; x=1780664167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EqBIzW2d/Qy5w+LqO0U7UT6nDTErkNchWOxlyPRePYI=;
        b=GK8WRS9U8lC7q1Iweit3SuMYGU6hgWwjsVpqZJ0NSqNWLlPtguGuUDBQSdjnRLCnkF
         HxTG70oqdxQehY5JWoEgrWKdOKlL7yD/OnA/B6c/hwY5Rrj6AT2R8GklxFLDi6Y6UX9v
         1/89vdicImcfYJMlcc0xFDqGmk5hLM7498GWS/Z6eKOGqjeabG0AfbcRKeCAPfNRJ6dP
         opepVaPRcf8p98Id1Gtavg1N1BOxqH6PAyrRy29WveDgsRhj0UR2rLkX3DCFyyJA9BgS
         5dc2UeUc5yR8LPHmbWCBWruiOw/gYj6zKOcV5sxg7a2AmiO6+vDejQ3b63Z+Th+IJWbz
         iYeA==
X-Gm-Message-State: AOJu0YwKVEg7WCSBxJksQLrq2XIwrqVnKbAOTSmtplBh2OATmjRtQjx/
	iWmnva6TAcmhmCP9wjlyQCWwVKSijPVRNnsFRK+idKduL5wa9nL6QD30ggk/Bv27qhbYQMgRJEv
	RZyASEbCJ26MFj/hm8RDI9UYJawoGWHXr2ssRQ6s36UzjaHReKfrVVGAbCoHCxbEw4OD5
X-Gm-Gg: Acq92OGxXG9vRXWE3mQSgG4FsnjmdE0dXkuj8moRnfi2/oGfWX5VvgyTxjdueHsN/f1
	6nX857ktQyFSP8ygLy1iu097lNo2wVh7p50+ODsMu+QbSCt7imx6b/Ae2XjQXuMpsNPALTMWcE1
	H4WLAvN2WrNlQQPSJw21kA2WYG4DGPXV9DwagrRDJiEkqMXIkei2xrOM0SU4JoYiQZCcOpLUto9
	479u8onKryWauuflVBrT8LSPtLdSxCpXAniWmnlKLPRwTT/Pjp5nZ1HcmulHIXPUNg8oKull5Mj
	6ibav7HHMo9Nu7UKrMejIFxEgdcWplQZOrhV6jW52iVOi/V7qTr6pYQYjoicfNjxLmE2RMygdy0
	3a7bd3zXDM0TGcgrQCAHCMINA3aEF8Z5Bjg7daYNTwWX3XHIixWMj2FLTqt9f7Q==
X-Received: by 2002:a05:6a20:432c:b0:3a1:90ef:7e46 with SMTP id adf61e73a8af0-3b411e16350mr3018564637.33.1780059366533;
        Fri, 29 May 2026 05:56:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:432c:b0:3a1:90ef:7e46 with SMTP id adf61e73a8af0-3b411e16350mr3018536637.33.1780059366065;
        Fri, 29 May 2026 05:56:06 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a7c24sm2119680a12.2.2026.05.29.05.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:56:05 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:25:45 +0530
Subject: [PATCH 2/3] pinctrl: qcom: Fix resolving register base address
 from device node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-tlmm_test_changes-v1-2-88bfdccb4369@oss.qualcomm.com>
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
In-Reply-To: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780059355; l=2155;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=cBvvneJfGJhX9Fyl4t3YJDwOJjbmuxDZLayl05Ei4+0=;
 b=L2bj2YcoyPU7o9lR8uK0/dcAAj2uZyspMWCIkwU6ogDf6DK1Riqyj+8urNGGvh5csWYwAq7l/
 1/Zg7q6RSx0AXvAmQyo1Z9aLeEHQZCt6XptBBO8tYKLuFHfipKkcAVe
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: X5Qd2heGFi5LT8XWxDYXxKNB_rrUpVdP
X-Proofpoint-ORIG-GUID: X5Qd2heGFi5LT8XWxDYXxKNB_rrUpVdP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyOCBTYWx0ZWRfXw0+pMeB8bVr4
 Z0QaBf/UiCJvz3byC4Lx38+Z6P9uQSk9WsAQvI/HSSkaW2yfqpXAIkJYmkm0k9Gpz8XZjj0cvFv
 Doa2TnSp52GWADbK6bhOBOQCAi3pwiF9e+QWQcp+9q5R3kf5/YZ/Z42gRIgLzKqnqxQ6Tuyy/3I
 jl/O3HRT0DrYtaGCxgesyPf8uuBss5uCRb7pNIupLfeUchY3v/fj2QeRaR6RysS+0T61UBs8Ogy
 /acMebASKatXS6c7obZ56lwyvqd6mwsgSn5iqW1oufAhxL1+DbsiokcQZWZO5jvqTFB1wTMQFlo
 w4X25sSEwiKgOcFSGHUH9KF/EbJEksjnuUbdgpOhUWq4WPMny2lL7NrsKaJnbTUoZgueTgvPIYN
 GuBWnm7M1Ndq+nqMsFK+ad+t25/kR3OhmRhUL3TXgpgcB2VOPXSZqDonmOBs6kQitHHGJu4cgYs
 nHnKIf3bUedmgtrpQfQ==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a198ce7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bvtI4k_f0RER6Z2YCYcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110271-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B96F6028F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")
added reg-names property based register reading. However multiple platforms
are not using the reg-names as they have only single TLMM register region.

Commit tried to handle this using the default_region module parameter,
however this condition is unreachable as the error return precedes it by
just checking if reg-names property exists or not, making it impossible
to use tlmm-test for the SoCs (x1e80100) which don't have reg-names
property in TLMM device.

Fix this by moving the default_region check at the start of the
tlmm_reg_base().

Fixes: 56ffb63749f4 ("pinctrl: qcom: add multi TLMM region option parameter")
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/tlmm-test.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index b655de5b4c5f08e7b138f0da24546274bc5fa93b..007d6539ceced294e81cfbe93a00c75a98c858de 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -581,6 +581,9 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
 	int ret;
 	int i;
 
+	if (!strcmp(tlmm_reg_name, "default_region"))
+		return of_address_to_resource(tlmm, 0, res);
+
 	count = of_property_count_strings(tlmm, "reg-names");
 	if (count <= 0) {
 		pr_err("failed to find tlmm reg name\n");
@@ -597,18 +600,14 @@ static int tlmm_reg_base(struct device_node *tlmm, struct resource *res)
 		return -EINVAL;
 	}
 
-	if (!strcmp(tlmm_reg_name, "default_region")) {
-		ret = of_address_to_resource(tlmm, 0, res);
-	} else {
-		for (i = 0; i < count; i++) {
-			if (!strcmp(reg_names[i], tlmm_reg_name)) {
-				ret = of_address_to_resource(tlmm, i, res);
-				break;
-			}
+	for (i = 0; i < count; i++) {
+		if (!strcmp(reg_names[i], tlmm_reg_name)) {
+			ret = of_address_to_resource(tlmm, i, res);
+			break;
 		}
-		if (i == count)
-			ret = -EINVAL;
 	}
+	if (i == count)
+		ret = -EINVAL;
 
 	kfree(reg_names);
 

-- 
2.34.1


