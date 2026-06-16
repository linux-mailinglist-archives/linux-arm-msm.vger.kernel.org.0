Return-Path: <linux-arm-msm+bounces-113329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gK2WADD+MGq/aAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:41:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FA168CE5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:41:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YFfrVMrY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Wr66GQcg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113329-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113329-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AB613051155
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 07:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83FD30D3FA;
	Tue, 16 Jun 2026 07:37:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E78409638
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:37:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781595446; cv=none; b=PnIrie4tpEJLshYHIhjks1yGFBAJcDTeV+8ks5MVTl1BXR1mx+JjrFaHsZli4CwpKihgujHzwLliKCEuVE5oPx3y467YY5fiIeLm65eC/EOH3qxe6XkERuCc8fWL5PXXbjBLENsUgXjmL/vOhvcXDsM6i3U87yU+ZfArAOnVrjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781595446; c=relaxed/simple;
	bh=+d+MalgaHFdaHZ4kRY2NIU+01UETJbwu9uGioyEZ7l8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qzsETkV1WzFtax+OMnlj+0wCBpO1hYYT5buJ9oSDq6hR7cQZtMfYFDYMzHphs9xQ45qT2+aFTEIegf+VpUWarrV8LBR1BzIRYwP8DatyYlP8Q6ml41CcteIG8mgPf1t/2vtDp3sKQYYhuvVPSMwLFULKoyuiZY41BlbM5AhH0kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YFfrVMrY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wr66GQcg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65Ho72849806
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AcLDgmWZTS4s2Sn/xP9SdWaHwheyO6SQdW9
	n/fciaqk=; b=YFfrVMrY5msrs7PYpW55qNHss7ZpOQ+1XMm6QCNHMpslTvfNksb
	SGlyEWDeXpBza+vfDcQkw89MIs+sI7vTfqrw1ruqpUp7v2HHdBQ7kkDDpBARZjQQ
	ye2KEWdm6HpZcMqgpIw8mNTc4OMnKH4CeaKnW0K2bB9uE7J846N7pVrsrFZ6q+aN
	P04/KQ5KJh0QUWWAmXgEBqKF7QvgB2hqYrwgseuHT2+11WYOuOGXEXpR6rUQnjDj
	Mh6Rdl9+yYcm4W92RSr56IOo0a8ZnwEJ5yN3fClygjQumptOeLVbek2AXNGVIFII
	UCZ/5J5vD4zNNRbsx0uT5eXEroKNNMzt9ew==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09g8k01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:37:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ce9df49c6bso54048786d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781595444; x=1782200244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AcLDgmWZTS4s2Sn/xP9SdWaHwheyO6SQdW9n/fciaqk=;
        b=Wr66GQcgekX2YX1QAxY7b5iV2u2N3oyeLXdMa0PMsgLHbKnOaCFlPvxgqj75E37I6J
         nBhPUPFNvQILzhDrih7Vg/Y9R1iy/U1Gk1dZ7qY5WXuqAa2BXRsp8AbO16tUVknT9tCS
         ick38Su93P73JEW3Ruk3+tykwKX6C6xJ+qlpzHFb2FpkvI/emHtvZeU+o2NnDY493BkP
         kfnat/1ecToAm31ic0Eh4vNfV7f2IaRm0ARcUau5KpGve6ahahZHLqRcUVVnxb3NNOLc
         IzA5cTgKkgdrWcAGImLqSqfe6QXfH2Wse3P2Dj22CvLPIx6R9UQVCj+W572G2ZwqDmxs
         eL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781595444; x=1782200244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcLDgmWZTS4s2Sn/xP9SdWaHwheyO6SQdW9n/fciaqk=;
        b=ASjXhTigUQLuOl1h8OXjcFNnbCdkF69NL2oqNohJ0U0KbLIGjFEbPtp5A/pVRTwYxL
         9omzWepflyOrzAFK4Ih3knK3d7ym+/KIfkZSllSzaU+wKTG0Wh0BZMs403U5F4hGIUsp
         smOsH95GiDvM3+R45eLhBhHUZrGcINRAaBMIFI5Piuf15nARdjGP8bbjroqqkvqqx9GY
         8vo3EdiPh5zBwd57opVdj8JROqstHg1/0q05YIXr7UxWF0vjkKk2xkMH+QPSG4pM8GFU
         mH+9jcMdKRggonVUbK6n3WhPhzKr3iQCPe1GO5L7wwROxaLIdWyYGd3cZdgcswLGu0Mv
         qYgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Dw989lOGDhXqGWvrWWckiImDVmx2K99DvhyaZfJiyG6JrxSLvpDTMNSo8HLwuWMuk+0rjTSUqcLr1eKsA@vger.kernel.org
X-Gm-Message-State: AOJu0YwWxg6gzI428ZSKRNRB9tvt2qOob1WC6vR2Y8pjY1z8YzZ19hnp
	/MpNmahDHicLDuZoGeL7nwljWJQ50Y6GP74HqZcTP1sHvrdoAOXhdS0sVfjBx9dRPmWgT2uvnBN
	bnD9deQszTBX2Opbc7FqDpOSxCni/ah0UbPkbKCjoHq3r8tCTwFvWJmExYsRpwJHXkRUbZIhvKv
	9Pxy8=
X-Gm-Gg: Acq92OGYj7GZLTxSrMHSBcmRy65AXo2PXHkyLKH/B4sdTlHlx0O0R91jvgXTjoNRqch
	eGEXcaac0qQgtkMSbhW/VZNkCIQl1uYT25NHUzCGibBn5YxMsoXAVlt8yr7OMsAhm7D+ycYcG/O
	seFzqgbAwo+V0RhGSEbDiEh5L+fASb1epxFUtY1aV5ho00lAPTMbo+SmZM7w+V/6LDFvbHcf81w
	7ATcns09hoRLpbaRVbTBMbGnqWUXdQ/i3+q3Zit/IaAMu8aEJ8WcHjF/K+KGS5OhKDPmnGsLTcs
	7DS++KWjZz1b7OKHhCp8FjZ8wywUNDPHqmKVt3KO+NwhHN1VWtkP/P0IOOkQBc9ozMnNV2/afFJ
	6yC2+/+xIBw7hThToH+W2/pSDCqbw6EqmTvNCelvxJvI5lp0tYQ==
X-Received: by 2002:a05:620a:458c:b0:915:d322:c465 with SMTP id af79cd13be357-91c4541436bmr384185285a.6.1781595443892;
        Tue, 16 Jun 2026 00:37:23 -0700 (PDT)
X-Received: by 2002:a05:620a:458c:b0:915:d322:c465 with SMTP id af79cd13be357-91c4541436bmr384181585a.6.1781595443498;
        Tue, 16 Jun 2026 00:37:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:cbbd:82b7:e325:35a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47d1csm56407175e9.4.2026.06.16.00.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:37:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: add myself as the maintainer for Qualcomm pin control drivers
Date: Tue, 16 Jun 2026 09:37:08 +0200
Message-ID: <20260616073708.5534-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA3NCBTYWx0ZWRfXxcF1TRe9EQQF
 sWQbkWf2HQ7SQmcQEInxmAbuOJLsGt5T/ZBtCfXvzotvJtltAk7C9K30dDhmQ00yITNY4bCPWRT
 RV8bo7l1Wj/3hP0Hlif7OROfODcSohN/C5DN2vwAp5hyegEv9p9kN8AQaU1FLyUVclIb3FZo43k
 V+7Qtu5T8M7JtlnyLKa4Z8HLuO7EoRMGdYzTLio1qKv7i9XWupvKPi2h+uBnPmNF8aPFzeX5GGF
 DhPysaVQDHtLAZW4IRXeMFwlb+8FxGY2tPlCn3i2zIU9xEEudRRI48FHzWcmEunD/RX0PRCFp83
 k4Sd7XplhF46tfbWfU8mCsSqcxJzCmr8BvnYpOYW8sYl2WpkwIDepyzezAQJMz5nnmYkcKS8Jcn
 2yjYGRd93Ql6hHTBTuU0HTSqbhDegJ98mdmmiarX3eUqK6mDRbZB5/yWFtgRQK6q2vmbCa/UazI
 SOHkNO33BLc5whfjw+Q==
X-Proofpoint-ORIG-GUID: uiUuDpdm-AsNfGoAcQUZbzD0vSFJxfq-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA3NCBTYWx0ZWRfX+8iJxOoVYCac
 IZXutSyeSYlrx211RjRORwUiiUJRckynpxtkMuzm4G9fBkUwEEqZTu3cHV28E199mfEr8CNOapU
 WGijGe7sfVgxnNw8z6H/ZGcQtlkLi4c=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a30fd34 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=jVqbDabETOUBSQthAj8A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: uiUuDpdm-AsNfGoAcQUZbzD0vSFJxfq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113329-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42FA168CE5C

Linus Walleij expresed the need for a dedicated maintainer for Qualcomm
pin control drivers which receive a lot more changes lately. Qualcomm
volunteered me for this role so add an entry to MAINTAINERS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 825e7cd2d673..5d0d2e4b2cf4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22343,6 +22343,13 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
 
+QUALCOMM PINCTRL DRIVERS
+M:	Bartosz Golaszewski <brgl@kernel.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/pinctrl/qcom,*.yaml
+F:	drivers/pinctrl/qcom/
+
 QUALCOMM RMNET DRIVER
 M:	Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
 M:	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
-- 
2.47.3


