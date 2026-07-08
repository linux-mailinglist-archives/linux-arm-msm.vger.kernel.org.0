Return-Path: <linux-arm-msm+bounces-117506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pd1XNSTrTWpYAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:16:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8747221B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:16:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="afY/+KNc";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qq8hsTYz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117506-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117506-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1FBC300BD95
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 06:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1963F3C1083;
	Wed,  8 Jul 2026 06:15:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C201431619C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 06:15:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491332; cv=none; b=Ho0JpeCSbTewaAt/dGDT/v4qo1hj68lUXhbHnaJXZbBVc6GKydqjnkvleoOaESDFru4UtEcjxUaQ66TQzeaEpLTrM7BKMLTWhFSygjVZmcxh8ZLFFuzHr3TvKPdX+T4uwXpE2beY9tkpTWC3OFiGNUrIYXjXJmvhgE7WXyNyIR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491332; c=relaxed/simple;
	bh=9K6vfVzhKCXdUq4d+j4awQs9fiw6bDpb1vMBeRfWLJs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NOFmL872kGHEEmrbB/Im/CN/tc5RYFDgzwTrAGiIbmIzUUTS3Zf38C6Cv1sMzdkebzVXZZJwq1hxpDY1hZxOTWRS2LA6sQ1QZnwXOhNRu/ZAgvW1ulEmj8tCXAlMghmQvnEJvNi9AuFDbwSYvHy1ML++lJN11ANH0vQT537EC8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afY/+KNc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qq8hsTYz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6685mnmH1761174
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 06:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lSi54AxqGvoG4nwsPTGBrX
	UBt+OSewX4NiNqyYTnmXk=; b=afY/+KNcy+RHl29RzvqTkbr0Bq9Uohd+AlyT9R
	rCl0ei/p0nsDqOc2yeIUfuVNEUXLb34W3ISjULqZGnMuA46RGqjNZXuzydwBYqUi
	Bs6IYVkOcAIV9CxcZv6SxcpOP6H459CWl4cyY17FmzAaP9iZ1xfM+5PYlLtWR1eZ
	78wouj2UYGiuoxS+IahvpvO9sB6kDTWY1E4J6W5GsLNT35fTDaGIIMUBHpvu3IWa
	eSem5Sapbli8OSOTLeEfu1NUQv0RV+8Kr2SllZk5MuSSkf4XbA0dzy7/ruBr9XXN
	mbngoo4G0Rc/FxwBKkjY9SUZIb+WbZG3l8DIPKd+jnYNl7Uw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw835v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:15:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc5faecf01so9772165ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783491328; x=1784096128; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lSi54AxqGvoG4nwsPTGBrXUBt+OSewX4NiNqyYTnmXk=;
        b=Qq8hsTYzKWYXTWwAYNjalpgovMVxfr0nxuunA2e9VYO5ziN//0j/1wfC2x0+t/X06i
         KmBOVaCvyB+Vvk5IVUEayltiIblMLQfps/RLnj1c/zrtHWiKtPPQLx72jSgZNbHN/RK0
         qayO2BXkPe2leNbhEQOUR/4QnEtX3St9jZqvLz5L2ds9LgajfiKBJjQAw4HBGgiJtdM1
         FTW3Ph4t2X+iHAsevorzTFZ7JQqc634YUqFDpDfKQPVlDdqwuuRia+89KOjh30TPHGRX
         p+p3tsx+ozHtmOnJmDFPUMQnWzPsaDLTZ+LKahRiZtUwk0YIrThWHrFO0GL4/bqZ9OMk
         rtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491328; x=1784096128;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSi54AxqGvoG4nwsPTGBrXUBt+OSewX4NiNqyYTnmXk=;
        b=mR9jNZuQX+AaRrKhc/eoUrwZjZ0arE4h3iQ/NudbVIXB3o3MvWI+6CXQQGU4bztu26
         2cbHkL0yZAZrm2qcYtV34qIctucwdf2s2UC42RVz7oOGUbv7W65++ZwtWSYtJ7pjG1Hj
         igI7AtcjmgyFSwtES5J0of1MAJdSEDu3jQ1269oWcHH8i+6M5LSkvQ14mCaZ0vDL7nbN
         Jcy1VSCqDoAmXFsE2XU6foYLNfVNqKRYdfwOx28qv8VIYjs1zwoOJPSBxv92PflS4uRV
         xlvZ7MEQfTqpAbbMznC9/1rQg26bxao8JjvITdlE+l1NjZ7vQU+93MYXXee1muUIiSUh
         qUrg==
X-Gm-Message-State: AOJu0YwnGjNAWv8D1cORaDlqURmhVoxZSeRklIo2DMY1oTwpMqtAVqdd
	YmXcyKfP/sJbnUdDJ2Lrfdtqy+pvBI9igSHywuLSDVxnf72g5MtvFKLseKgVsblYC/pc5sRb6sB
	RajGx8189/lKMRhEons0RfHckk2YjRIRm6k4bM6+0gyIATx54wdooiEamQqZVF8s2RkzucqOLmT
	HD
X-Gm-Gg: AfdE7cnabLL8kRB4gRfu3BUG753+PrQcpkdKJOpeS26RkUKmxP4j4CXz+UFz4hY5dkv
	33llxYsGpwRf7GxwKQoWrWLIV5QqX2t55kmJK4wW3RM7vb0gKNUv526QodsGTnTVae/vOoLVWGS
	J+mrizLd5irdKa6xlTxGvo5YCofMCRn4xdZRhEiyp+7hpCaNS3xx196ZRCbX6Mh+rzwZrjg1FkS
	fE22MR0ir0sSfV1qR7o6pYAXQqwARhKgFSA5rIQwc3FFLRBFsALglE4V/xXnPJxI/r2kj3Kn56f
	rm9s18NpimDOwiBcB/Nff+nN+SOeMgyBClSFBa2aWnH/oQMIs2fx1mhPwdK0ch97xEmal7DXlCL
	37ncUznR4AmG5yYwhRaPmvuH0L4plJhxGtaHqD8LZDb+X
X-Received: by 2002:a17:902:f544:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2ccea45a730mr13677475ad.34.1783491326964;
        Tue, 07 Jul 2026 23:15:26 -0700 (PDT)
X-Received: by 2002:a17:902:f544:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2ccea45a730mr13676965ad.34.1783491326340;
        Tue, 07 Jul 2026 23:15:26 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9bbsm23011555ad.4.2026.07.07.23.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:15:25 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/3] i2c: qcom-geni: improve transfer error recovery and
 synchronization
Date: Wed, 08 Jul 2026 11:45:20 +0530
Message-Id: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-0-dd8f841f36a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPjqTWoC/yWNQQrCMBREr1L+2kAaaVO8isgnjRP9UhJNjAild
 zfqbt5i3lupIAsKHbqVMl5SJMUG/a4jf3XxAiXnxmS0GbXVexXkzd5Fj4ULHhVtcYocnCw1g0P
 KLMYrN43TYPtgLTQ12T2jPX+h4+nPpc43+OfXTtv2AUPV7NSKAAAA
X-Change-ID: 20260703-fix_cancel_sequence_on_failure_for_i2c-a868571f77e0
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783491323; l=1250;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=9K6vfVzhKCXdUq4d+j4awQs9fiw6bDpb1vMBeRfWLJs=;
 b=ByQSfggJAKnfZGu99/vRYzT8lR2KjfeA/l3UmxBvKRlsx4kcWYm3MTbHzzrlBEpwTHn53s7y1
 qNF0KANZxkjA4Kq2ZyrCx9Cnu+bQYx6c0OaHxka8ToyX54ucpgV2bY8
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1NyBTYWx0ZWRfX3zTI00uWgSoV
 8/N2TbUtsgRoh0XX0pm8PcYsjUokSTTJpUu5+bSslRF94llSmd1vtQI8+vkut67hUx/vDw7tXym
 6X+10f4jNtNipszVcP6pifnmBDC4+oOXpHzd5QI5XJlw2X8mODrNZAUBze6/EJ1RgHAaDhC/hz8
 CZLhoEZbC6UG6O15uz8n4MtAF0mtxKFTNw4V2hksd4cob5KfEDUOVlngZJhwQjB1bMKnyaB1YrD
 9aXZ1fePshhun7fJ5MfHc7H0OvVlIUetOyum+tCAimkCs7Cb0t5ypH/F1Y+E7oiY5zUS2M5aaww
 oK1hCaP427KzPkE/nFYOhAY098yaUE4kWiwlv0OtgoBaG4zHruBUpAPNBW0Bw6Qmye6WwAUskdl
 zA48Yf9vZ6dIwxF1WB7MNbO4/2QcpUHJ/yG0re+BFLZ1ptZsFxtj5fb8ZcDPoaBOtfNXMJK1UWo
 sKV1kVQWICFf2TrBoOw==
X-Proofpoint-GUID: 2RPBIW7e3XXXgJjIJ6lnSNlqattrumQ7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1NyBTYWx0ZWRfXyjV/QT1auD7w
 qHQ2ggCgc7l0ZSWrRme6UNJyrki3wBKWKnwjrX+b6kXUP4REZKKLxsdSJVXqM5XBLtWgdptTFWB
 U4dkzmaazT3xTpxGJs0xVbBC130N1IY=
X-Proofpoint-ORIG-GUID: 2RPBIW7e3XXXgJjIJ6lnSNlqattrumQ7
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4deb00 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=88dMlJQ2g5BURVayAFUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117506-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C8747221B4

The GENI I2C driver currently has a few issues in its transfer recovery
and completion handling paths.

The timeout recovery flow directly aborts outstanding commands, while
GENI hardware requires command cancellation to be attempted before
issuing an abort. In addition, multiple operations share a common
completion object, which can allow unrelated events to wake waiters
prematurely and lead to incorrect synchronization.

Address NACK handling can also trigger unnecessary cancel and reset
operations even though the transfer has already terminated during the
address phase.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (3):
      i2c: qcom-geni: use cancel command before abort on transfer timeout
      i2c: qcom-geni: use dedicated completions for abort and reset events
      i2c: qcom-geni: Avoid unnecessary transfer cancel on address NACK

 drivers/i2c/busses/i2c-qcom-geni.c | 100 ++++++++++++++++++++++++-------------
 1 file changed, 66 insertions(+), 34 deletions(-)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260703-fix_cancel_sequence_on_failure_for_i2c-a868571f77e0

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


