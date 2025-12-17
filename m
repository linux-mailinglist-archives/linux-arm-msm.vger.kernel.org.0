Return-Path: <linux-arm-msm+bounces-85441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE38CC64C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 07:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73233300E141
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 06:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED75732D0E8;
	Wed, 17 Dec 2025 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVcZJkyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APCekDP7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C392430DEAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954293; cv=none; b=G6Bz0xVAuetj3CDZPkRwo+MLyJ2on5Pb8P2/Bvt4cP1DkMaqGzHurv5DKmd/Eh0dOzMGPsHEAwQg4JEMMUXuqhzaj5LUdse5tnjmj3flKz/u2wmNedUa7KAd0FwS5YKCCKWDfJhwNOPac5GP/5nFz6d5w/QOeVsNitnT3xkUozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954293; c=relaxed/simple;
	bh=VP+rBUGF7qVbbXP2x/EhbFqX8g8zi65PFtLqGlmueNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ywhv4tmKhH8rJYgUDpMN5kMQFEQWpOJE6ElNbh8eqexeA56VJfwguODZUjB7Ex3yMMzqk3lzwJ0bH5q9rWa1i0Iynbztb+CPrHfBNO/Lt1vmNY9s+AlvWnj1u2Tb1N4Pl76RfVE7+0PyvxfIoAFnKFK/Ao4gG5nsXpf6dC8GwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVcZJkyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APCekDP7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FHAl1323648
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dq7HdBaR+ND
	Ov/4A5+SkcbKsybvvsE5z7g6twcyjF/c=; b=EVcZJkyi+tKjvtCbFZaRg1uqURK
	aKOJWOL1hxwaslQ2c94co3dW7fgwYakXEFWHwOzkJaGhN0HNqU4GtPlBmcahJNI6
	4gKBQLOFI21pcZrAnesZj3sIZB9L0yfqXMjoKy3ceQt51qUAwOAXYBUSrt4pfvON
	sueW3OQ9JY1ikcTWI0MeAIL42EkOJK4gUT/l5wHoq48Mt65rACXtJVA+2rxuGuUl
	UAMWN2vcPyDLd7nwX1Ag3qw9WxevvhVS4zr4on4abzcdw7ZgU/ngEjAHxEgQc2ml
	LxCXvAlMX/gaax7uQG42ydoQIK0JgepSSrDxI0/AOibI7oejcoMU72QXfoQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fh19ag4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:51:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b9b9e8b0812so9224428a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 22:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954284; x=1766559084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dq7HdBaR+NDOv/4A5+SkcbKsybvvsE5z7g6twcyjF/c=;
        b=APCekDP7n77WtoPYL1q1OREvCWNj4vtX6/KWecu4Rdw6cG810aRXa6iYBcj9YhQ8W8
         nFn/5fR+1g6oBLuSn0Z7kcxz/a+7XPXz7f1jnnNF8fHE0emcoVya2V2dAAZtvVUEPxXz
         wj4r8ExJnihgIzoTCk4x06B91pw3/mdemvYa+zkp5OCiIBUwRCd+NjGKYHvuNpSN+tld
         FHufiFpdR3HDoOOPHoP2suzYg7cEP01QZ2UqXIltUkkxhwXiB7RQezj/N0EL0J/AnLnr
         mFrfsgINhww5fKStfS1wQ/lkLT2U8hXCDPjYRAVpk9DqPET2QHFVkOKtJBXFUFBoNKH4
         WuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954284; x=1766559084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dq7HdBaR+NDOv/4A5+SkcbKsybvvsE5z7g6twcyjF/c=;
        b=mn3/+T1W6LDXbVhxZk3xpiku8cA5y7hL32d5A+tEodJnI7CqfWk2gdVkNiYq36RYNS
         RjhVaqwn//XsPVKIUE3JRRZ5R2SJWC1r6wSA+Z/Tz86bayJIQTMaT6UW3ldQEf/ipuJs
         j4Eu+ab8Yfcmk2OEkgZDOje05OgCio2ERkEjAXtTkwEP1hJJ3AROTweSu6r+WXyRldnc
         cIhngMIHqywaHEWDlFSerzvyg81iSkNFMMKx7dGO+nsZEFdWsoa23P4b+Ahyz6fzz5U8
         EO6B1NrY2qtqFRLXJd1moazHVLWYoZGn+OHbgaiOuz4q7VXtczZUxitBQSkvBCKS4G14
         Odqg==
X-Forwarded-Encrypted: i=1; AJvYcCUiK1o1f9nKdJvcHXqt4h+oqt2HvE43lNtaVa06XAEi5TfeAAgd9g490qBbhV+9eVwU80lzLg5YR9I8SNs/@vger.kernel.org
X-Gm-Message-State: AOJu0YwKe+zc/2PzfmVRNBag7Y2aK2qzcKKkBGOAP1ypoUY21PkLDE2a
	ycihJ2VJhwSBTTQe3v2PBHoF8YClY3HqOqoZ2Av9UKhL+FKiOmXXZqGKTj9UMLM40Aw4rmaypK7
	MjS5eTeF5dcNzIwcUqAR0DB97RXMuCJntT4P17aqazEd9rz3nIuDTkA9BDG16pyd7cnmr
X-Gm-Gg: AY/fxX70pXfHWKNIcWZ+Xg4va65n0c3U3/0l0QJNiymPqheAKunaYqrwdtZVDelsc1P
	sHelc2fRg9rkx2XO5oJeCap41rXVz/YmMGVkOu31A2ow9kyHzsdEjz+rrUTR432vX6sWp8VXZKj
	NyPuhyQCFD4XA2c8rQz7SfQwVww3Mfk1WnJElYcWDJowQ0xDOBfnqkABfe9mOpVB8bMs0GqC/fF
	e8DWElVrFk3L2fVrtN1EbOTDxwmdWu0fUiGT8/hHIrf7cBDj+oQ9PNrjZy4bwW3cqrFf6ue+DWr
	CHEezTZ2BiQ/R6k7gWJAKmnKpXRA7B+OuSAxE7UpEv+erva6OAA4QLhIrlSR0UkMTap2Wm+FUlo
	PQw1UYiMrZBHBdQEm5MVsM6rJh5oWarv2mh2ZCmv79fl31jBvPMV7eKQNH+9VopvUYKNTraMjc2
	VF
X-Received: by 2002:a05:6a20:72a3:b0:35b:b97f:7471 with SMTP id adf61e73a8af0-369adbc913bmr18285865637.4.1765954283762;
        Tue, 16 Dec 2025 22:51:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZM57x3z2KMv8n/8dDpTON5UMcn+/BZFIjIc6sGg09joQLGKprkmLRzvfNxzJGnpGzmQ8N3Q==
X-Received: by 2002:a05:6a20:72a3:b0:35b:b97f:7471 with SMTP id adf61e73a8af0-369adbc913bmr18285848637.4.1765954283344;
        Tue, 16 Dec 2025 22:51:23 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:23 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 2/5] rpmsg: core: Fix incorrect return value documentation
Date: Wed, 17 Dec 2025 14:51:09 +0800
Message-ID: <20251217065112.18392-3-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YkpKh4_W_bPTirtjQTKVm_9-oy9Z46lN
X-Authority-Analysis: v=2.4 cv=CYoFJbrl c=1 sm=1 tr=0 ts=694252ec cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EyzG0aFrAOtqPBJHxvMA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX4PenWn0fGkP7
 zG3sm4oQqA5gEMgQX1GYaMnTrJvb/Rr2XM9g+9g7c7EgR+RF3+uKz3HnevIx9hlQNqoOvxJyo2k
 A6N0PgzvfBg7aeA7gz4t1TOl23uwuucWLfWu0cLOajBrq+WDOhWVw9hVBg2bjFDQ1nmRuvZ7Xai
 UpMOJMYT8c8lCuwI1DdJ6ui1UsKywVd/Vb8fqmS1d+90Dj2O5cWh83r9WdqbnGz0ux+dvEK7brd
 E+GkTULD/6AdoUBz+ICQ96/rdRoQ6ZzRKmdHM7j7NdP5f7eMRfoW3Asn8Zoem+U2J0F+/oNo6I8
 8c+ZHv6hSLxpEjL/24/OcmjS8/YzK+CsQNK/L4uX1bt9Mgw3/DEk55syuCsTG+lcOhQVYHADTrd
 GM8x5vhHUolaQtltk5rRrUoXR54DOg==
X-Proofpoint-ORIG-GUID: YkpKh4_W_bPTirtjQTKVm_9-oy9Z46lN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170053

The unregister_rpmsg_driver() function has a void return type but the
documentation incorrectly described a return value. Remove the incorrect
return value documentation to match the actual function signature.

Fixes: bcabbccabffe ("rpmsg: add virtio-based remote processor messaging bus")
Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 Documentation/staging/rpmsg.rst | 1 -
 drivers/rpmsg/rpmsg_core.c      | 2 --
 2 files changed, 3 deletions(-)

diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 40282cca86ca..11fc22f3736a 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -212,7 +212,6 @@ be probed with.
 
 unregisters an rpmsg driver from the rpmsg bus. user should provide
 a pointer to a previously-registered rpmsg_driver struct.
-Returns 0 on success, and an appropriate error value on failure.
 
 
 Typical usage
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index bcfd17e5309e..a5dd09f19b14 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -627,8 +627,6 @@ EXPORT_SYMBOL(__register_rpmsg_driver);
 /**
  * unregister_rpmsg_driver() - unregister an rpmsg driver from the rpmsg bus
  * @rpdrv: pointer to a struct rpmsg_driver
- *
- * Return: 0 on success, and an appropriate error value on failure.
  */
 void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv)
 {
-- 
2.43.0


