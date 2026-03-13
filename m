Return-Path: <linux-arm-msm+bounces-97421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI3qC5Dos2nZcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:36:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 68933281899
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61C743030885
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2582A387344;
	Fri, 13 Mar 2026 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/c/ssCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrhUihxK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBCA387346
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398110; cv=none; b=Gbw5t4StnzflJni/PGxo+3vEJLJqZf5RyObIma9QtE9tO4ml7WwIgbOJbmPrKG4u2v5XKNKdO8yLXRTBvcx+ik/mkQRYtOYWMEFKRNyE3XbK4nKpUQcT+BGJYhB0EQRcB4tfdPsBun/W8Y3u7dQvu10XbpVAjTGPiCC0bDcsF4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398110; c=relaxed/simple;
	bh=2Eyt/cZf835vJg+UD5F6DaILcgfrbs5ut1i8lTH/Hfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s/T0H+vzUQWRNIlmuY0D1PtI5gCA5T12lVogHbrlmVsAaBWMDwlBiJbXXl/ljijHSEahIuPZ+BhwBIU/YgBK9m0QRlYF8BovpwmDBuBrNZQzjUzhbd/xnV7GRkrVUAh7irX4C6aUBNTVw0xN+fH7uCOe1NdFWPHJJbGI4+qv4Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/c/ssCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrhUihxK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iLtx2262548
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hjmuyXaZGCy
	cxQIO4DPkkK7oINLVs67xlqJvYZZEsYY=; b=F/c/ssCmxU7IyOrS5ordYFZarKf
	KjV8TxfpGAP2XEfZ8DY3N2gUmmH/HLOTK89V5XuJsKPmvTfKnkb/26rT4WWWcLeQ
	KKYmpQixF/wab1rbjcHX87DiA7hrL8sAyufrb/dQWXReKwO8pM8/iahH9tA/TFfh
	t6p9vHBR6OEyy3zjMXqoPES9E07I3/O8nO7YhlltT0YExsTT1Hmm+YYLzK/8S8Kn
	FWKxJZo3QXU1e6GSbb45/CH7GQBFeCG5DaJRV6e7Xfv9orzRsEJxKQFbhaC3/KuW
	VqaCONtNkogoHFok5Q1eNBD/IBS3WpXm9XM2JJ81BrW2FiiCM7tPO+ET3sQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4rkx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:35:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aeb90532f6so22617795ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398107; x=1774002907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjmuyXaZGCycxQIO4DPkkK7oINLVs67xlqJvYZZEsYY=;
        b=TrhUihxK73N3N96LUn0Ptpzh1kxP3WPAJPYOyb58qdumJgccUi34m36KZqyhZD03+Y
         RxvXt4mt8PwySiITUCLi+CpprBF6kIEf554RFdhxaOcom5/jr8kZa7Sh1QZwufw6OqGi
         jFxjSEabmnHnE4F2hkydsppTP4D8XhOuZ8L/TsHlkH9UUjKnskzinIFShIJV4Yw7aN4e
         EcfuERysVwa343q2R1iMGnrwihWfxzT2gSvjIZ2DSLtj03Jr2N688Se4P1TZNXVwuovT
         yTflKhzxKdVMFgxohm6lpn9iiJgYyXELsdYve035Y9hiuiW4qH2/whHWvRGElBWsDULd
         eMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398107; x=1774002907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjmuyXaZGCycxQIO4DPkkK7oINLVs67xlqJvYZZEsYY=;
        b=Pt6nLCFVQb+J+PYfK1rBoubBFZV/xYyo7Peu+Ol+/lpbgDcOz2hAGgjG7P0ligf+G2
         X0I609p5b3/lb3L4Fg1ZtS4KYpTXGk/AB2uzJZrmH6oUZmybyIAPzdUacf7jOBbqddAu
         J31kuHDgt1ytGrsxsPFlthzVFoU64Q1R7XtJ4kArgAOF45QerLFCYZbMpWKscwDOZ0cu
         a0LASwYz8C0nK+zZOjlfG7Ly1S343vZ7q+4ZOzCUEb6QCy9MilBAisHj37B21MS+3kuY
         LTl5rlOjvTmJ2TuXa0XOMaJYCXS5lfnwHRCj8lfgRsrGta1DOwIOXpmhdKuXtPwT1Uwb
         wf0w==
X-Forwarded-Encrypted: i=1; AJvYcCUcftdkTVAe9MimRlwXtvHLXCA8bjQ7aoRLVrLyi8z5i0W4YiWyTYYdKwHa3QIPe9dZpVwS39infMArPl9h@vger.kernel.org
X-Gm-Message-State: AOJu0YyLyE1K2s3rlQY7I4fLZ8DIP2xkgOsOK3qqzv43XjW3ystS4nLk
	6Mdlf3fANgty246H5E6ZuMekERZWdSW9xMIXpp6TrDxS7MJrjyM0onSmKQBWkOOKJ3BhOhmnWD6
	oOIaSFf/wSkh1Gb3a80MS2cj4NnMa52pOsaCrDyygV1ubI5pZn709DQ/XFij79h1yjjXo
X-Gm-Gg: ATEYQzzDU/44Zr/c3iL6eFuvo5IzYnEolUk59n/f90jpPuP803ub+fO4/Zo9hjCTIq0
	Lg1ok/A9dSef0Jp/m6ZLv5qoUZAig/WIeV6Hmn3fCqYWtnaipjiRp8HJ/TTi48SgMHMDitxDCJv
	QJkSdQ7XiSBfTqiDyeIbu3Db2YBqQc44+B77fn9JkcMcZW6ATsvlWUh6vIbym9Bb2OSAQEKxEkD
	N/0XeFAaQ4uwCfDBKfDSFvoYuscXqGhfLNciGdNT8e4fzWWY9RjF7e6wEKY2RfEMhmKLztpsKjM
	R/m+FQtdIqfWNNZaJsIidyesLTRM8oNF7F5AHI/ekVcO6iW3e7SN/0Gak7NayJFrzUhYNKTRrCU
	rgo7+vx2B5a95SNLy3M6THICmQ0D/YPpe8PaC4hlEusE8qgB6F0l5FhgrGoTVzeXsbCBkGmO+0d
	8Gt1u3LFmUctmAB7Hfy1E8KeBiCEpgQComjvtS
X-Received: by 2002:a17:903:2c07:b0:2ae:7f9b:3148 with SMTP id d9443c01a7336-2aecaa091e7mr27834295ad.14.1773398106504;
        Fri, 13 Mar 2026 03:35:06 -0700 (PDT)
X-Received: by 2002:a17:903:2c07:b0:2ae:7f9b:3148 with SMTP id d9443c01a7336-2aecaa091e7mr27833895ad.14.1773398106059;
        Fri, 13 Mar 2026 03:35:06 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece84d57asm18120745ad.85.2026.03.13.03.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:35:05 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: sudeep.holla@kernel.org, angelogioacchino.delregno@collabora.com,
        viresh.kumar@linaro.org, neil.armstrong@linaro.org, festevam@gmail.com,
        Frank.Li@nxp.com, danila@jiaxyga.com, lpieralisi@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] dt-bindings: arm: cpus: Extend Qualcomm Oryon compatibles
Date: Fri, 13 Mar 2026 16:04:38 +0530
Message-Id: <20260313103439.1255247-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313103439.1255247-1-sibi.sankar@oss.qualcomm.com>
References: <20260313103439.1255247-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DSTGxmJkPEPrtvwbU6ajpi63uVNUkSsI
X-Proofpoint-GUID: DSTGxmJkPEPrtvwbU6ajpi63uVNUkSsI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfXy6P4v9FDcqYR
 Ffc1/wQGTID6vqCfW1FjX5KNeeTqousCGEVDb7PUgqdlFo1Z/xPKQnRSjMDwD+xzieGRv7Zy85U
 9tfAzGmphrVBKuJ1KzC+FMs/YdO0XYZvwC1fjj/j33giu95hNei3M769j/la9uxrvgW0U8HxWpK
 5uSpZgWnALBYjmTseV7l9CHvD8BJJmpNtJ7/J1+pnMUc1QwXadCbMUijGkAi1DjA7T6rhjJdS6L
 GDQYr3/AJGifNUw/Rbcd+41jWvJqqJ/4stUzywgZqnvAONidvsPhB6jz2IeNqlK4ajKZgQVe8bt
 53hPiPNzgNMlutaNNfaYQJlT5dVwu+VTT+O8iXUH+EW50zcAyP3revqPFQ1q8/N0uSmjbpSSOaI
 0TketSkbzBE5t1xBjauoTpWDnMsdPmkkyBiqOQ55/pXHOLh7aZK/EdMBkVtfTfhp4nSb5X+g8vF
 cgxdBnPiJ1HTF7Cpsbg==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3e85b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Md80sOCNy-dqt-4CZCwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,gmail.com,nxp.com,jiaxyga.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97421-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68933281899
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The generic Qualcomm Oryon CPU compatible documented in the binding
doesn't account for differences between core types and has been
deprecated. Introduce core-specific compatibles, by appending the
compatible with MIDR part and variant numbers as listed below.

qcom,oryon-MIDR_EL1[PART_NUM]-MIDR_EL1[VARIANT]

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 700255e9a002..fb6e5871b625 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -218,6 +218,13 @@ properties:
           - qcom,kryo685
           - qcom,kryo780
           - qcom,scorpion
+          - qcom,oryon-1-1
+          - qcom,oryon-1-2
+          - qcom,oryon-1-3
+          - qcom,oryon-1-4
+          - qcom,oryon-2-1
+          - qcom,oryon-2-2
+          - qcom,oryon-2-3
           - samsung,mongoose-m2
           - samsung,mongoose-m3
           - samsung,mongoose-m5
-- 
2.34.1


