Return-Path: <linux-arm-msm+bounces-92642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNntC/dKjWkq0wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 04:37:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4C412A37C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 04:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 840E730234FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 03:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD3823D7C8;
	Thu, 12 Feb 2026 03:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNsCx8Pw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfGQwrI+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D571A0712
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770867443; cv=none; b=fiynkNdBRUgl9bRmohHG5yL9fv2nQE/aOY0215xt0lCaNFo80Mdrufla7VjaXIAhjTvi+3GZOUCULYIGEZxwU9BJ19zZk/XIsUzZyrXNCLtxSm3al6XJmdVxnzV3hkCG8cmHi6ECd+0ZCppMrw27GUG+iktia29oxySmVi5EqVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770867443; c=relaxed/simple;
	bh=wsjFMvB1TsHevFa36mBUvTBjCY2h4nNv5Y/dWeMaHmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mBqU3iBlBNovzTWjP8Z64dx4Z2RtRuIBaYBFChCJhg2h7oUJIP9dzoupMStuK9JHedtLQDpPXc5VvTFJV9pvFaJUZAHvaAqk9t7jaffK1kTXraZGucZFvNaLvyxmvMuVfuihg8W2cBr6UQwXYVVcZr4FzZAslQg4GLPSRKnGIak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNsCx8Pw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfGQwrI+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3S0Fl3222813
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qDRM45uUNnPiphT86VI8bT
	XAJnKhBph9qfBHfYoRDqo=; b=DNsCx8PwIn4EyJ/+WWtNemsnOzm5IAlLV6hBuM
	jx2mHqzY10Ie/ji6II+k5M5HApgLrKA58IjnHySZn+OKuNd8+cwLUuyAFdyTZlG1
	BDtApLW4DiPFiTw8iXEK9wMQX0J3O72BA1kUUHUvfAAnb4E4uNSrm8MTQP3ySybd
	AcZhROBBQy3Jlv3sLT3mcw7fNm5+1R2avL/bXvNN0wbQvBXGaqkyhTDODD5vmCfm
	oVKa/s0mXVBBmh/uzSVp4lOdM3DrXaoFAKEZAHsMpGh2qj4PfcjR5N6zswJ08Lzq
	0TxxSVn/uIm9J7os9mtav9cMj2M89ETIa3E2/zGuW8ELgpPQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8rvban65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:37:20 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-675f8fd5347so733097eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 19:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770867439; x=1771472239; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qDRM45uUNnPiphT86VI8bTXAJnKhBph9qfBHfYoRDqo=;
        b=OfGQwrI+P1kOKX+zpNuAlX8s0559i/lAhCj5tUDW2785IqSO+DLaAcLS8anzhgh0bg
         yOcCVS18n3e31wTeTs0M9TiZfMvGjSf0KXRpRR70bjr5oscWTseHdI3Bg71+lehik9f9
         EVOkoxjP9Lv4wZgIlrVhnYIZnSRZsqy/ssDZpAI7txP7uQihgatIKQzC/gXgPm7tun8D
         qvNXfajA/JBfMpgvQLj1jCjboTfkxPa5m5jBoe9U4COQN6cVfSOfWd5IWnJPjV7D3Pwy
         K6idGqtwWrqE73jV1b7tfahrtEPc/KVqxz8QSxdUfvuOguEQgtHAwEMtw3oxyq1w9Ejt
         T15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770867439; x=1771472239;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDRM45uUNnPiphT86VI8bTXAJnKhBph9qfBHfYoRDqo=;
        b=Br6OLAQNEeiSJamogiuRxPl6N3Zg7wIrpwVFqZXujTnYT5IchBGFjkdWkSTF0QS2Ex
         WILTjByzstfe6vk2mNHKn8sfpHyf6pxw9hA8HbnGkBW7k8efB3SXByw3vwXPi+4mux8S
         zAY2snpt0UdG4ylvwNlc0EVqQTdI/9h4Y27IlBoyxAGzW4+9f76RRg56CwxtgB1NB1yC
         evSsNGBF8X28h98Pv139i/0pfHyq1TTVBF/odOMs7wPmxs7/MV+6I6AXi2kFiaQBs5Wa
         TZxd7dnms/aaM8BJV42K4NFoZzd99OV2U1uRU6eZMUPs1cD1JYp+YIX5n6I8QdoSpLJ4
         zKdA==
X-Gm-Message-State: AOJu0YwzPDj+zjpSROrIhl5Z215FRiy8jg7wTkA13uUvZKFCH+U/FwF9
	SIIACNOookPjvPJ5khgbGOo9+YT78rhlm4rwN6fcAePmHU+YEm7G0mhVJSEPkInfh5hxFLRoyk7
	0bHcYxm9EIn+Ht1Im+NIuv+uxMMvOan6ePnlmUqLOs9ufxh3H9jHdfckPvtTpt8POM1Vq5OvcjB
	7H
X-Gm-Gg: AZuq6aJBDgW0aNzJGSO6D420NVCDxjvpGqQhBbFHrk3Ax1fldGfgnpfqpilSVJ8LZ0I
	9uxcj0jexqwsOYFqH4+9PGRDm3g8OhlEHehR/bbLhvIPGE3ErzLwFLl8eHaW+A74VXc0dgD6iTA
	OIxPqZEL1DWMkDbuppu7hm5SgGL/wiTpgZx1EXgsDosyD49Z8Q7bFokirK0gDKS9zFFGvNdvzgu
	I2Ctu2lHEv8/cOMa6JtaETfv+uzq78/2Dq28VD4uz73EAD5CbsqKlpQs1xRlVQqn+w3d+0swcy3
	BSOQ455isjHegVlgCYc8OYjPyldTDMReONK21CGJ+LVjtQ0mHbdY5ydqKvKzOmD7VXCH56ylPrA
	wqzUoVEDeRJL2FpYNt/FEvgsaZEjD3HmdT2rpMfBHIGNieJ/FoGLy9l7h5Czm5k8P6/Q8RUNVFb
	H3aTQSKXA/TgX1G4uZq5Dm
X-Received: by 2002:a05:6820:210d:b0:65d:3c7:b57 with SMTP id 006d021491bc7-675992f37e5mr701294eaf.34.1770867439308;
        Wed, 11 Feb 2026 19:37:19 -0800 (PST)
X-Received: by 2002:a05:6820:210d:b0:65d:3c7:b57 with SMTP id 006d021491bc7-675992f37e5mr701293eaf.34.1770867438985;
        Wed, 11 Feb 2026 19:37:18 -0800 (PST)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67475407c2fsm1798674eaf.10.2026.02.11.19.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 19:37:18 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 21:37:14 -0600
Subject: [PATCH] regulator: core: Remove regulator supply_name length limit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-regulator-supply-name-length-v1-1-3875541c1576@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOlKjWkC/x3MQQqEMAwAwK9IzgbaIIp+RTwUzdZArSXVZUX8u
 2WPc5kbMqtwhqG6QfkrWfZYYOsK5tVFzyhLMZCh1pC1qOzP4I5dMZ8phQuj2xgDR3+saJvOtB3
 RMjc9lCIpf+T378fpeV6RXWgobgAAAA==
X-Change-ID: 20260211-regulator-supply-name-length-14706722dc49
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2140;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=wsjFMvB1TsHevFa36mBUvTBjCY2h4nNv5Y/dWeMaHmc=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpjUrtgtrvEMxUjFaq18lYyfIMGGP3PaMzIVLf3
 h3Tgg/kvz6JAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaY1K7RUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXVSg//cyJyo9rcs4vTIur3vMZxlaPMRxB8hms19C3Gjlq
 kpjcoIWiMtKwRbxEtZrMFiJJprZ8+f/FJIe953HjGDifnxVofxZamu6fDqqTb/AOS2PkCOlR6HA
 bqfwJAohiZWKIbKj/ZReWDznye1a4V87jQUn7MBn6HGnj9pPs5fqJlS9YrL/RiQOZ5PhE0VQaYC
 J901A3DeeGKpl9DYPsRKr4d3pCwGzFCiYjZwqnckzjIyq1G4MQCblylXR0hacSrDfIk5SMKc6f6
 LJ7REBNt804GIioKh077KJTTSNCzK9zS9W8hbzckupUBpb0gloLGtDGpL9poYH/qVIMhPL3a89F
 +982pzxiWkrdfFofxaSYTfGg3CaWUIoQILYtOdLHULO1ZACocfhM462m9PszFWmi9o6IqL32yno
 M+c7RoIvPrEMDZX2HxciBpHG5OlTeswY6xRfJk/g5AIbA3A8lQ52V+YvmuypIHfaSaFiFbI0Lj1
 LsGiPDUaV+g3jszfDkyxEK/9VxTRqECpQDsKfCIw4HIruHS3zVbThDNnTsXWthm5b/xytaj/357
 m8H3bfl+jBkvV/l6kgKsNl39JYWd0entTdfXEzniFkfAAHEPj122fbroODXyFBRK+NnOdyUNusq
 ZPMEy6hHFokHOJlENyKAT7OZUeSpr4/D7MzdsRGNDx58=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=H+XWAuYi c=1 sm=1 tr=0 ts=698d4af0 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=_RYW3SsQ4qHbjUntC7EA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDAyMyBTYWx0ZWRfX8PBHsCcBaifm
 lWMeeUkAVXzKr6ibwfENHIbpbXoQK4ANbVAVJUSdJX1JI5bXrsS5eulbTjZ21yYACO84eyVK5Bk
 /xKGMc0yaNSlf2LmrkYkylRzS3HCwIAjF89TNynleCIQs8Gx9ORMYBavQP0nNfn3R7B7ti8gqBZ
 lz3JlXS/7Cq2SrS/9+Dsd3d83998YY06XFQYJyM0T7RzYoCqD3aNP4t9AinH058gnhjqABDFFDI
 UniJmQN8T1dhdpfG5omOBnm/eh9nnS7FnfF2axmiGsDuGPCLGQ1kGeAUVUMQnLS578/UQrR4eLr
 R9UKbFjlYtXb1rJNRWkd/3/bnZrnkw83knph5mx9zpdCYjJH1s2OzibEAm9Ib9CaVVRDgwWslQc
 7MqX/3zuvHL3CM11ito4F/zJ9321kEr+j5pjQmOAkPgpllFdivNgv6Hz4AsQrWAmUEErz2tHXaj
 2v+KPbZ8Z6K1e++lR0Q==
X-Proofpoint-GUID: Y_fllSDA35ldAO_S0xf9SSrqr73fidDz
X-Proofpoint-ORIG-GUID: Y_fllSDA35ldAO_S0xf9SSrqr73fidDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_01,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1011 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120023
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92642-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C4C412A37C
X-Rspamd-Action: no action

When creating the regulator object, associated with a consumer device,
the supply_name is string formatted into a statically sized buffer on
the stack, then strdup()'ed onto the heap.

Not only is the dance on the stack unnecessary, but when the device's
name is long we might not fit the constructed supply_name in the fixed
64 byte buffer on the stack.

One such case can be seen on the Qualcomm Rb3Gen2 board, where we find a
PCIe controller, with a PCIe switch, with a USB controller, with a USB
hub, consuming a regulator. In this example the dev->kobj.name itself is
62 characters long.

Drop the temporary buffer on the stack and kasprintf() the string
directly on the heap, both to simplify the code, and to remove the
length limitation.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/regulator/core.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 8c2fd20edd50591c962454a358459e52e97c8ac0..80bb95750a207d52329273e8a780c391d2d78fda 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1965,8 +1965,6 @@ static const struct file_operations constraint_flags_fops = {
 #endif
 };
 
-#define REG_STR_SIZE	64
-
 static void link_and_create_debugfs(struct regulator *regulator, struct regulator_dev *rdev,
 				    struct device *dev)
 {
@@ -2014,15 +2012,7 @@ static struct regulator *create_regulator(struct regulator_dev *rdev,
 	lockdep_assert_held_once(&rdev->mutex.base);
 
 	if (dev) {
-		char buf[REG_STR_SIZE];
-		int size;
-
-		size = snprintf(buf, REG_STR_SIZE, "%s-%s",
-				dev->kobj.name, supply_name);
-		if (size >= REG_STR_SIZE)
-			return NULL;
-
-		supply_name = kstrdup(buf, GFP_KERNEL);
+		supply_name = kasprintf(GFP_KERNEL, "%s-%s", dev->kobj.name, supply_name);
 		if (supply_name == NULL)
 			return NULL;
 	} else {

---
base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
change-id: 20260211-regulator-supply-name-length-14706722dc49

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


