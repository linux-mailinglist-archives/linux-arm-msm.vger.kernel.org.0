Return-Path: <linux-arm-msm+bounces-94398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNkjGjQ4oWkbrQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:22:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4691B3336
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D186312DDED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4597E3E95B6;
	Fri, 27 Feb 2026 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGrJ03eG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPdlrQ26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06333E8C72
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772173035; cv=none; b=k3b1lc432WnaujVhbXEvXjrffseb+lD5JmmP8xlVn3k18zGTwbrcMeonVmqcykj31oNn4toHFy97cNk5CS+4DC0cwrw4goqfhIJt+ZnWrLtfRGLEYzYjV6GDbfHrE0BnN1LzZAyO+dHu+qKOeNoyw3DV8ZqEP437LWE5IDHf6cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772173035; c=relaxed/simple;
	bh=Cy0n1JMcshW/tt8MYoyLcvBwcTixFL9leAwlKd2BDy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YabiUtiwWJ9SRLhL4LsYxfIF8YfWxMbbLjAqkv+aVBjekrjytv3QRHLCy8EMKoFsPF4KKZ2Qx5qLxjhnSaGssNIOVfwMV4YTSX6pggew6z9hthtFep54XiLEnV5j7yBgnMp8IK1fGvAU13dXHcITFIajvS6cj+CiGrItix+4mfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGrJ03eG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPdlrQ26; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JxdB2353259
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uk/dtu6n7L5
	B614MlsUj2gA0vvgJ0BV4B7ONL7wOcl4=; b=EGrJ03eGg/r2nGiXyK6X0dAVPgg
	p3leuIOW/zV2g3hziQ7XotBqroAqgNGhPZrSjNrQHRBzFyF6skEDL32tc0TA8aaM
	cu5xB0VUZ+COUhOcIhqWhsmwruusqGYGCc0t3EN0z4I6KZMovYX63axPbHe0aYwG
	EKp0YycoOgdumeZhHvgMQ7Yc2D04NcD8Y+YLXyIGZ+KnCPkqpBIvFW0AmvDoYsEP
	XEBHq/60rXm5eZ6BktYnmRM1ZXG/yLTHMjV3nFbGaQB4bYnD9T/Yl5+lCcw0jIde
	+9w6WbN4/0nvSx91eR+OeKFQJDgBRQOvLoToWMXgselg/p1CiMw+rzWRRaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u3jbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:17:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aaf0dbd073so17083625ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 22:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772173032; x=1772777832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk/dtu6n7L5B614MlsUj2gA0vvgJ0BV4B7ONL7wOcl4=;
        b=NPdlrQ26gGbwpMHIjBVdOKpnHcdhiUnc2kpmFOUt/uHEuLm6ZqU5yeKr8GRvD6LZha
         YohQpYqwiXT5sNJTolKBTIXMxugBD+v7YWdhlhUlAi+mgbePaN3WHjEGTz7m4CUTfvUH
         GPlvgeftjNEfNgB8YSP4VLxE5eNsCxcmwAH77pt+Gjwy8Q4EISzhGW5n0KZEBUrGetAc
         9M+sALeAEyciKdkTjT1Lvyu6pWn8Fw8VQqzcD0SAyD237fXn7vhWCFrsOYBKcWeF1xHz
         SjsmiaWAKCr9u0VGVXeQoSXouQCvMo449yXt7MdcdYHUef9W7VrYN1DThSnbOOoDKkZv
         a1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772173032; x=1772777832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uk/dtu6n7L5B614MlsUj2gA0vvgJ0BV4B7ONL7wOcl4=;
        b=nsJsFXe+DmTyHCtl6BOpCMusCrrC+TvTrnGrRu+mMfpIp5FCqYGgfg55oJ97MpuDj3
         YQhnAojgN5jrjr4494TLj7r9teRDWXwbg0XLgOS/EwlkVaff5y9oh+ZhJZ+bNm9O40A5
         75w9geIjydXQ81x++/dKUFpQ30t5HIjJyDgn9nYckxfgFSkN6HeXj2lflbce8oYlE6YW
         o0hD3uiNTQd4PSowMg3o3vu9HPH0pVdVbu+dIYNZ8sVgnjO9VRhD0rx53Yqgg/AwAjIQ
         Bi8vELWoitfQjpu7Z2C/sWGpuh5VC8G0asjfxXGUaJMn6Rk33VnZMlYo+GKIg+ac8M68
         NMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKKr0V1EeXczeLyfGGUk03iQC3Y3itlp5gPlRG+T4BwLkPv/GzO+D+zA3ZVbXloWTwlvO0p/bmsLmCpaXQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz0xYHcpjYtDa83YxNixhRcbZkV+udOpUfYwSmtlv4fgN3bP8l
	3NrcJq/IydsCGmYbOOCFUXPA9/ASTuR5/Yrb5gjcoNY8qgeFQpnohIkLqLTCODkSnyKF9qoRPdy
	AqeYA1RnpeuSKHizOIMhfiQcVJGeLHbOCjVIl/WDbgLM6ly8ZeXbbyWod+p34KVjXYvB/
X-Gm-Gg: ATEYQzxZZinSqhQ3L/UGl71wbtgQJtQ6K4TzWhnFENY6Pq/yWe0Va/crEaaH9rpokMD
	ko0n0aJLN6KWxZMAbtMiFcNsA+cly99N8ltON6+k+P3O+N42hmwGlDiPclrwRHLWVPtNnvVGcyY
	HCwP3wYo9j2HMk8Nm0rIt9ag+lCcXlRuQipvfHdKhcBwP3aECxhfAN3WHon7UioZmw7brOVpIwp
	mto3x3LeV3QPXuzJLLXwnMeT1Y9VUgrFmSpMvbaLmVfcYesiTGEdUQj+AL9SWAR4WXcoLUkDzac
	DKOvvqxHnmeJg8+Khz3pIziZ60EYCgEGmILT2Kzw1nI/qGi7/fagNa3C2ZVeptjdqDYTzRXiciU
	8pGwzyRpK35PWDSQCRHo6Pay+Wvi70SI0xaVan3gSH5Yq8IPp/MjL2jw=
X-Received: by 2002:a17:902:e891:b0:2ad:bdc4:c39a with SMTP id d9443c01a7336-2ae2e4b0921mr16507505ad.30.1772173031958;
        Thu, 26 Feb 2026 22:17:11 -0800 (PST)
X-Received: by 2002:a17:902:e891:b0:2ad:bdc4:c39a with SMTP id d9443c01a7336-2ae2e4b0921mr16507025ad.30.1772173031005;
        Thu, 26 Feb 2026 22:17:11 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm64813025ad.54.2026.02.26.22.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:17:10 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
Subject: [PATCH v6 11/13] i2c: qcom-geni: Use resources helper APIs in runtime PM functions
Date: Fri, 27 Feb 2026 11:45:42 +0530
Message-Id: <20260227061544.1785978-12-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfXxJ25IbytaAAF
 W8tJE+H3T0ppHo8GVlKBTtouHFJDfD4D/JXha9toUnprwH8AYSstV/WQcNgDuhE9JlvwmDO/Ba+
 K1gqKAcVnMvI4q3/IyY1durREOdykATw6UC3bVZGx4Ea9t7z0SmjXcDwFksZOocgkJJjtJJ9mhj
 tp4fTV19+/j/xxe71KqKosExbCKu6SvDMZs5MN7Sm+Jh1H2eRh7byTJS9VIeY2NR9z7ccdJ4fJd
 x2TxtRo+I2YDob85RYqxiLoB+pt7xbIOunsV41sEsqjaigolvLi9Bh2giKXt0fRHNRw+GW3mXbU
 aVVWkUJzpFvDTHvdBURIMKq7uPz0xYCvO8ojI72kXhIBOo2MY35PNtbJ0HGoyIc7Wy7OlwzH9yN
 0VXglyE7ddKBRoiVlCkLDk1aLCCe/+7GrnRF7txn7ihtMCKEInrKGWAA50UZH4xb9GMUKIgs9QQ
 8NJ6bxZjnSbftFqcM6A==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a136e8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3PeDo36KSfG0vlEF63sA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: B_FMpcjsRjeinDMnjgL6pQdaC6saewma
X-Proofpoint-GUID: B_FMpcjsRjeinDMnjgL6pQdaC6saewma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270050
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94398-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB4691B3336
X-Rspamd-Action: no action

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v5->v6:
Konrad:
- Updated last return value as "0".
- Added Reviewed-by

v3->v4:
- Added Acked-by tag.

v1->v2:
Bjorn:
- Remove geni_se_resources_state() API.
- Used geni_se_resources_activate() and geni_se_resources_deactivate()
  to enable/disable resources.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a67634ca0c7c..0ea4abbcd170 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1160,18 +1160,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
-	ret = geni_se_resources_off(&gi2c->se);
+
+	ret = geni_se_resources_deactivate(&gi2c->se);
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
-
-	} else {
-		gi2c->suspended = 1;
 	}
 
-	clk_disable_unprepare(gi2c->se.core_clk);
-
-	return geni_icc_disable(&gi2c->se);
+	gi2c->suspended = 1;
+	return 0;
 }
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
@@ -1179,29 +1176,14 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_icc_enable(&gi2c->se);
+	ret = geni_se_resources_activate(&gi2c->se);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->se.core_clk);
-	if (ret)
-		goto out_icc_disable;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret)
-		goto out_clk_disable;
-
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
 
 	return 0;
-
-out_clk_disable:
-	clk_disable_unprepare(gi2c->se.core_clk);
-out_icc_disable:
-	geni_icc_disable(&gi2c->se);
-
-	return ret;
 }
 
 static int __maybe_unused geni_i2c_suspend_noirq(struct device *dev)
-- 
2.34.1


