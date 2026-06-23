Return-Path: <linux-arm-msm+bounces-114225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OmvUADaeOmo1BwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:54:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 457206B80E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:54:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DXZGyW9L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CZIvvC94;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114225-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114225-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 347EE30F2680
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A2D3C65E0;
	Tue, 23 Jun 2026 14:52:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A24326D51
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226358; cv=none; b=JORSdZACawqzyRTVszLSOchxFkm4WRP73CjwgR0o+0Zx4v4T/nfgEoA/RxI5Dg+I5QY+4OXAGc83t8OhLODPpV4LoLY8Mgz5eYBuDzMgM1cWDJAiT9pcRUISEeXeV1L9l3JzHQU5j4SDp9rtvkIiKmmcMKqk7RnglhmWbXc0w5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226358; c=relaxed/simple;
	bh=d3wRfKF28EPq+1ZOXUti8UPQystJWF5BefGu7E0Hn1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OT+vI5LIH/Fq1w/RiFN3G7JM/Rj1APAgLNw471/A9bFNlkeXUN4QZOAkg7NXmYoaTBKlj+BG/VBXtIMwQ9cCOVJaXrww5ostnv2QAMYYU36W/6d1wz/9BcImTxZBv4sWy4F0gzyhiYulhRDcHyqjmwhIjFG97Y6EoDDTQcH15co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXZGyW9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZIvvC94; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZJJp031413
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C1FY2EChGfq
	SXR78BU/386kT2GGSnyM0vTeoZn3970w=; b=DXZGyW9LGK4Bbq0ZYIXSXtGIeTV
	B1a93cX3A8EoZ48kiB2jGn3pwQkWsKZtiYncnYkbx6svY6FKgkAHGSsUaKf1sVGo
	jhvD7JeLrg63EOFGxFKqXY6SCfh77zPjx8wP26jEquWky51zimEZYP3lR3cVsoTf
	6lvMHnDreeC8SqDEWZ5iCNh3cHVWuUMGtAZIqjvoR25WXLlp7jBxXptb9hbhXldG
	Dg+ExgC3iK3aweBJgBWVi8lV2GPpE9aBgvmjN7lodOW9/j5OmFW7CnHDwWjQkw+S
	j9tIbu5nQlTOdUE6/dXeiCtyappMZxfO9jFzWKHp1MKpVcmOtysN/wRl0RQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe69chc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:36 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-966d2fd33b1so2207390241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226355; x=1782831155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1FY2EChGfqSXR78BU/386kT2GGSnyM0vTeoZn3970w=;
        b=CZIvvC94X0gxzeDhskopWhJ9Jab82lDhuKFtfc1zrSu9qeI5ZheRGDeWxX+nuBkMgW
         P9OkG22Hs0cmXbRr1EO0Of+8pmfNKgBVuYZhO0slpOuZ4UDwCn7jxuLNB901LZ4/pRsh
         4PCEkGWOvUhD2PNYJ4AOTIBriSfNVQU9Rd+zf7SnvxoQI4wQtWLc4oSb9uABY+FDjTOI
         LN2V5fKg2BpLTv1230+7Z8UCrazCSuzXtGMmfDLK736YytB5wD1om3fV43dShAKEKPmD
         zj9YIXg29Sd/HA+2XrcOnljtxI6nSityYyNBnECESmBj0El7vBpPqv5Ko1wWkvJYVTqj
         aA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226355; x=1782831155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C1FY2EChGfqSXR78BU/386kT2GGSnyM0vTeoZn3970w=;
        b=NL8opqHKY3GVi6NsJv/ypzQ/y8boiUDUVQ5t5vto3eS78oLagW/eUrZmDlF2GnidEV
         2pG92v44CXmA/QcjWbvzDTZVE283axchlSlBnIlGJhLiFXCcAdRcDqiqjej1lfSegqNt
         9TpenHSZa99X7tiPDqausFy/SzeYTCsevG+0sSWbTsoz80J5unu8c/jq7BbLB6RBp5Mx
         Bo7Fs80R+tycNGlRKPAupSpbkSk5+Hy2XS67zS2+VGi9nf2XE9zqomjzZ3SkOV4Fctco
         /uyA8nlADRZLLFOnTNXiV9+37V8yjMUMfKxR/o/MAR58H4Xds2g28EVIhVqeY0vFK4Cz
         xxWw==
X-Forwarded-Encrypted: i=1; AFNElJ8pNduQDDIY25aAVcyh2HirmuZOWTWFK0FQX3gq46OA+LfRPL2NOEabKk0kcedSrU1FEngK6NlD0wipRDo9@vger.kernel.org
X-Gm-Message-State: AOJu0YyJax2vLRPv5jbj0jA3tk9uoRhixkc/YvQKre29hsIt2ZgK41pH
	eG1+IX2L20p7JmevxqPhy6mSYFPmmQ/mIu5g924TXjnpPy+059riV4LKp6+pnojPhg+9tDZ2gcN
	5TVk/Y5wlMGVxxUUE0wd7v/G4xF+25i2kP73q175aCeiVlB0uH2KulylweEdtUawK3MFg
X-Gm-Gg: AfdE7ckASgVh+Ko5ziCHpB8Npc9uFbIP6uJw9lsxtgEDbMU3ztdbWD3DGYOOK4cjqhQ
	NoHZuz74B4sePnsvRrvaf7TTGgmrfMYXpHh48aWY2tzplHIDhs+fas5ET0YE1uTSvfOcaQIdM5/
	d0mQgpyhTG6heBW7rXWsXnmSrxroYJhPuiVPRjECXE+o5sQ2YoI6U/m4MQQIYEB9pDUteR8++ym
	9fTw/cNqUA1LSD737YXBj7P6jqJ91mvW06eFezC8qVjHNKBd7+m7xPBISXMaM4cHXOjphu8+V+m
	Z6TF0ya7wtKcd2vkqVluTZ8J+Ajd/3dum8AKGTIeEKt/3afTXaf9wzoJLvKkbKXkN+cawYTUug2
	NJ4oSylJkVbrdy4eW7eRBWn3MKYN9prjzMCrLhhDmVOXpIS67JAa24BkzMhBivR7xINnyWWYcXC
	f7C3nl7eLWl57QJMKHYgHeMwmYKw==
X-Received: by 2002:a05:6102:3e09:b0:634:d42d:15e2 with SMTP id ada2fe7eead31-72ff7195e5amr1586009137.26.1782226355391;
        Tue, 23 Jun 2026 07:52:35 -0700 (PDT)
X-Received: by 2002:a05:6102:3e09:b0:634:d42d:15e2 with SMTP id ada2fe7eead31-72ff7195e5amr1585976137.26.1782226354952;
        Tue, 23 Jun 2026 07:52:34 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:33 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 04/12] ACPI: Add helpers for dealing with ACPI fwnode as secondary fwnode
Date: Tue, 23 Jun 2026 16:52:17 +0200
Message-ID: <20260623145225.143218-5-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xVut10y2TmgWb9IHdZ-m4hCKy_RHIX4S
X-Proofpoint-ORIG-GUID: xVut10y2TmgWb9IHdZ-m4hCKy_RHIX4S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX/fWZA7Y+ZA6I
 MNy2oW4asAs38YEskiH5LMsnqFpiaLcKVZ4yJPa7ZLUNSyiF6EHYANu9DO5QfHT4MuEJyD/quYA
 h4L89cM5tKi7xEslbeGR+aatgBlTDaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX1gFfOIFOAoPt
 lPqXc8NOjVOAuFxTEYSGB7/6Hw2rSmreof+Naer/bEvdyTsFKxtAoe+wJ2pNyHuwtMxXINmZBrA
 80s2MJCvMDUrv/+bKYFJ5t2iE8IyYYn6FuuTV2mae19Yg5Pqsn+l1ByLNuNIhyJvJnKfPZX68/h
 OYmv7HbsjgijY0ISCu8MifU0CgCoQMcw8QMHqvc4j3N5iOussh1yi36D0u9LvefGz9gDWnfLQBB
 rQBh0LVwg1q3UJYC9dsZKn3ofgG4g/WBdaXfCTVQk04hE8C97bs44+1awjJwjhNTvM1jy1D23jG
 tzMp0Cyqg8PzvN9t7DMyBEsSKWXvyOoGTq60aNNE+SFVkTlKu0f/oBo/3pYtIs3mqqn5W8jPQPV
 He0KwBL/JRLVgUvLNF/Q4nwKxDsulFO29UFs8o3iVt+GBU8qfpuQcn+TjIwKQHg4gL6WaTKeqtr
 MzAj+v28Xi9eoMi63iA==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a9db4 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=9gDGnDraTdPISYb5DTAA:9
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230122
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
	TAGGED_FROM(0.00)[bounces-114225-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 457206B80E5

In DT-ACPI hybrid mode in some cases code calling is_acpi_device_node() or
to_acpi_device_node() may also want the secondary fwnode to be used.

DT-ACPI hybrid mode is something which subsystems / drivers should opt-in
to, so it is undesirable to make existing helpers use the secondary fwnode.

Add new is_acpi_device_node_any() and to_acpi_device_node_any() helpers
which also use the secondary fwnode.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/acpi/property.c | 13 +++++++++++++
 include/acpi/acpi_bus.h | 16 ++++++++++++++++
 include/linux/acpi.h    | 10 ++++++++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 8ee5a1f0eb48..fb555e50ce83 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -1775,6 +1775,19 @@ bool is_acpi_device_node(const struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL(is_acpi_device_node);
 
+/* Like is_acpi_device_node() but also check the secondary fwnode */
+bool is_acpi_device_node_any(const struct fwnode_handle *fwnode)
+{
+	if (IS_ERR_OR_NULL(fwnode))
+		return false;
+
+	if (fwnode->ops == &acpi_device_fwnode_ops)
+		return true;
+
+	return is_acpi_device_node(fwnode->secondary);
+}
+EXPORT_SYMBOL(is_acpi_device_node_any);
+
 bool is_acpi_data_node(const struct fwnode_handle *fwnode)
 {
 	return !IS_ERR_OR_NULL(fwnode) && fwnode->ops == &acpi_data_fwnode_ops;
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index c41d9a7565cf..bfc3883765f1 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -515,6 +515,7 @@ extern const struct fwnode_operations acpi_data_fwnode_ops;
 extern const struct fwnode_operations acpi_static_fwnode_ops;
 
 bool is_acpi_device_node(const struct fwnode_handle *fwnode);
+bool is_acpi_device_node_any(const struct fwnode_handle *fwnode);
 bool is_acpi_data_node(const struct fwnode_handle *fwnode);
 
 static inline bool is_acpi_node(const struct fwnode_handle *fwnode)
@@ -532,6 +533,21 @@ static inline bool is_acpi_node(const struct fwnode_handle *fwnode)
 			NULL;						\
 	})
 
+/* Like to_acpi_device_node() but also check the secondary fwnode */
+#define to_acpi_device_node_any(__fwnode)				\
+	({								\
+		typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
+									\
+		IS_ERR_OR_NULL(__to_acpi_device_node_fwnode) ? NULL :	\
+		is_acpi_device_node(__to_acpi_device_node_fwnode) ?	\
+			container_of(__to_acpi_device_node_fwnode,	\
+				     struct acpi_device, fwnode) :	\
+		is_acpi_device_node(__to_acpi_device_node_fwnode->secondary) ? \
+			container_of(__to_acpi_device_node_fwnode->secondary, \
+				     struct acpi_device, fwnode) :	\
+			NULL;						\
+	})
+
 #define to_acpi_data_node(__fwnode)					\
 	({								\
 		typeof(__fwnode) __to_acpi_data_node_fwnode = __fwnode;	\
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 67effb91fa98..bb84774f61df 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -865,11 +865,21 @@ static inline bool is_acpi_device_node(const struct fwnode_handle *fwnode)
 	return false;
 }
 
+static inline bool is_acpi_device_node_any(const struct fwnode_handle *fwnode)
+{
+	return false;
+}
+
 static inline struct acpi_device *to_acpi_device_node(const struct fwnode_handle *fwnode)
 {
 	return NULL;
 }
 
+static inline struct acpi_device *to_acpi_device_node_any(const struct fwnode_handle *fwnode)
+{
+	return NULL;
+}
+
 static inline bool is_acpi_data_node(const struct fwnode_handle *fwnode)
 {
 	return false;
-- 
2.54.0


