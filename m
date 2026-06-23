Return-Path: <linux-arm-msm+bounces-114230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YYXKFmCeOmpYBwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:55:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4B36B813B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:55:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W9s4bgpb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PA0dzL9D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114230-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114230-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A85B83114CC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851D83CC32B;
	Tue, 23 Jun 2026 14:52:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316F13D565E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226370; cv=none; b=OEQNpywfoSS1c3QVWflGfOqiAOYRnUVZopkDKihmYq2URHjfffwApj/FU/YF5X4JGrBUz5J6Zz0clBfvOy4M/2x+2cSsVQ27RX6Cy3lnDt6E2bQ+Pt3KmTWTO4qmO3K9oteXUwrQVWpp5YpJbHGeJoGt82zwiDJLFItrv20aqNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226370; c=relaxed/simple;
	bh=ZInW5BeuvtKt7WQjVviDvn0AZGfWJ5zHlxLDGSfpHNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nb4KwLXTLZ0QKSuWtxnlm8FsQBWCZKPz5PmZC57S1PXOAL4R2XjisDP36el4J+uS+CdE+rvHRxrHTitJBE5qxP0UsOOtND+3YFaZxacm7RY4hz7clLn39mnQz5YaPxGyZn66pCECcJTY8n7ffuEORe6wDTG6HT+fKA703NIiO68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9s4bgpb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA0dzL9D; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZiEG4052828
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z/hxETDnXsC
	raHrXPssAhfCHbQlGbo8HPXOtzZsYNVQ=; b=W9s4bgpbLDsFB3yz0AYq4TU2AEV
	XhrGPGaKIOEhxj/XhfZ0L7CxS4gfx20iYodnmRt9WKHe8hp8UFfcEx4VbNb9GO/Y
	2z7PH9WAuvN2Ac8NbNzRZJU9w2gRHveHX9LI1OqsoPyFT3FqVRDW2MqBXM3Rrntw
	hYDvi1ofVjyKx94pa0btKCDv+1mJEE+YJ1iePOiqNn4oVgY5rd65fGNETAua7t+w
	TSrKrZ28SxVBvWAzbrXH9AFugfxwYRTPpOv1Yeso12o2G4+N/acMHxhnkppErKG0
	ZITjy2i677Dv7f5AiZaV9RGtfit5OIwgVdcdbJkjuLAKK3UuLeSjuPmo8/w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9ys3am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cf37fe12faso3135513137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226367; x=1782831167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/hxETDnXsCraHrXPssAhfCHbQlGbo8HPXOtzZsYNVQ=;
        b=PA0dzL9DgJnUvGnTRkez/oj8oJ4n+xi4xvkBz2WiX59976p3UeLOCDUpjquUNIhccp
         140dNENRcRDkBNIjr5OUR4sC9FPNiAV+WffJwpRuOV7DUjtZc5beNG2S5qn1YBciIlhS
         z51gbPZFTMIRgCi9ORRbma7RAJRCFgUt0e3lbwxdjTgxCnQWk7twcxW/kpZ/umjnEqiH
         kf83q3xsch9SLRE5lM0C3ozBgFhCmbWQBxu+Q0gII/uGaKYPY028ZtkpC0PPUOrbI4DE
         SdCOUl4GP8ksB8hEt5+9OzTEaXMbg/K9SSjT7qtymXq1XR9XEE0yt0TBFVwKOTw3V7zP
         /+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226367; x=1782831167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z/hxETDnXsCraHrXPssAhfCHbQlGbo8HPXOtzZsYNVQ=;
        b=tC8IiYTV/6nLKF4zm4JTZVvu3cyknOBCAydC+3ef8Ml7yCbQ/VXBt/xjQGAgyeR0gv
         yZp6DXtzptvju0nC2/EVcVaZftkPQ5Gx2yzPd1fPc2FfjS/PrkE3zv3r1YCMiAhtI1x5
         1I6s6mYl2tTyENNfMFuGPbLUx6RepZdSIbMdhJ3SCAtND+jKOXKkFCBIc57SbCXtZZx0
         Y52EoSj0bsdBwN3HRdABmQX3rWwtLQeFXtFxJYeB/9hyCMCA1YZYsuC0SPP5XdCIWUzd
         AlFWYimx+4jOBv4WJyPsJu3Fh1F+FJkoeOgghuLN5Ku2czRWse6X2Uizwqbn9lqKO62z
         L/zg==
X-Forwarded-Encrypted: i=1; AFNElJ/BAI14FZRVagRagy5y7NkVQc4U3HkJU4YlocbC7QE0pdpUlmiRMsgAe5+AKsCK33JHhegczSQkltbKyg0Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwSTEFclACv7aDC5ssOKY4zNCYSY750nTic3n8hSGvXxhpPRCFe
	sj1tYu+i1gFSSpKE35+da11R5Ch/Pgw9XbJss3d5kgYXWqT3tRsfnvUP0KspMSABTkJbpHw99Mv
	FWpbr7+CBsT6AQ/m9C3OxiREp2f39TMbwlbwQ3B4ic+Lr6bTF71y8EAdnTQNYb7I/TBgF
X-Gm-Gg: AfdE7cnnBWQjMHQh7Y5Ifis4nZWaDukoqqu1lXbJrKMD/Qi36+TFJ7mKnNXYgJdMoq2
	lozNJgx3EZmOoqTlf8L6KFhqIyyAfnHPKLgNgsnKYiC/LfXtXZlJX4MBRBoqWl3BCm51zEgGLjI
	HiJMx13GMFpdpqGRNCMxJniu/g9mlNJqmT85blHcmkIsWzff7sy9zXYQYXeIERRnLUvQ2/QYBiW
	jL/MTdRW5KAeQndSFEEqAe7a619T1tTyHg0ZhQY8CQXW3B9vNnQhA4E9bYqon4hpR33dVpKeBJJ
	0DZET6f01gOB6it2zP0DDwy7sgLDwbD1o3MedlrH4HYi57vouz3sBHNAybw55Cz6hjSyydiq/Jw
	LFjOr6+h03NWEmEnWqhSiqvYg1hQZAccr8gmnAwSaajW7TeYOD5JmLNOcVkIJ3RQwhKkET21nFB
	gHKqXfYoK+5+uUXCeppgOR0j97Bw==
X-Received: by 2002:a05:6102:956:b0:650:94b2:3839 with SMTP id ada2fe7eead31-72ff476b12fmr1406118137.7.1782226367135;
        Tue, 23 Jun 2026 07:52:47 -0700 (PDT)
X-Received: by 2002:a05:6102:956:b0:650:94b2:3839 with SMTP id ada2fe7eead31-72ff476b12fmr1405980137.7.1782226361847;
        Tue, 23 Jun 2026 07:52:41 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:39 -0700 (PDT)
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
Subject: [RFC 07/12] ACPI: Make device_match_acpi_handle() also check the secondary fwnode
Date: Tue, 23 Jun 2026 16:52:20 +0200
Message-ID: <20260623145225.143218-8-johannes.goede@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3a9dc0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=Z_5jWvXtYKhrpjqL7kIA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 1lJXh0kBgdOM7rnx_luUfTZjN9E9SGsP
X-Proofpoint-ORIG-GUID: 1lJXh0kBgdOM7rnx_luUfTZjN9E9SGsP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX90JuaaGSOOtd
 g4x5TWwp/OD9M/gx8BJxR5+bd7evsf9XHnWTEpYbe6GJr87ejLa3xb82hoPRlH5DOYJLrl1JN4F
 ov/SUIco2wuQCgzX06d6bYJYrt4ZnZib9pKpnFbXMaJ4idUtKA4zjqmqe+cLtxplITiN5XNh2GH
 itJ3WHSJlaWHe0mSEOStm+Fl0kmLHUWEae88l6yuWdp+7j1TuY7G35oWyPOSAv8tyDcAbWpwkNd
 4JLbIX49WQeoU+y52wAfxPw1M/qpH7fphQuwIsvDlaV+gnRsGHKHe6Ml2oClpzmnIkWdlUO1d0D
 sIsy7JjjtnlcNBVl8fg0eyxUTN9//yxdxJqBtKjSuflaZi+xFvHTUBAYveT0MknKR6J0LUbYG3k
 85gTi7UYBDi0Qzc7URjXrGPQYTKFs31zR+A286PtR4m3xEGM7CtUXwd24pkAXeBoVRXcVkuEj9M
 XlnLLeU4aAOjMP1AeMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX2P4jq02OqYvu
 Tqxe7P3pZ3OEGNc4wzXVjavdkuynuNoW0U6VayybWrMkSTrakHWCxQmRoserwKFFtATQRi+ijO7
 g7KvWL/Gmj9LXbn1dEdfbTQ5+nOmmVA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230122
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
	TAGGED_FROM(0.00)[bounces-114230-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA4B36B813B

In DT-ACPI hybrid mode the secondary fwnode of a device may point to
an ACPI fwnode instead of the primary.

device_match_acpi_handle() is used to find parent GPIO/I2C/SPI controllers
when resolving ACPI device resources from (_CRS) in this case we always
want to also check the secondary fwnode to help find the parent.

Modify the existing device_match_acpi_handle() function to also check
the secondary fwnode.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/base/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bd2ddf2aab50..2573253f5815 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -5357,7 +5357,9 @@ EXPORT_SYMBOL(device_match_acpi_dev);
 
 int device_match_acpi_handle(struct device *dev, const void *handle)
 {
-	return handle && ACPI_HANDLE(dev) == handle;
+	struct acpi_device *adev = to_acpi_device_node_any(dev->fwnode);
+
+	return handle && adev && adev->handle == handle;
 }
 EXPORT_SYMBOL(device_match_acpi_handle);
 
-- 
2.54.0


