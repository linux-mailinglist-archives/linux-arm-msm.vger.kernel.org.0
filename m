Return-Path: <linux-arm-msm+bounces-118117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K+zhJ7FbUGo1xQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:40:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08334736B94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:40:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LccAUehT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="KwuXmw/E";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118117-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118117-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D7FD302414D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 02:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE3F322B7B;
	Fri, 10 Jul 2026 02:40:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B0621CC5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651204; cv=none; b=F11E5P5wWHKqIcq9K6uStRknxzDMnC5Cdt1UVqyltqqUUKH+2asf3EnIGhkH2PZCuYx+HBpubpAwHtyMhKxmshPFo0MOisIrGE5qvy2m1JmSm/XGt13yd3IzEySQdq9x632Kn/fakoF+CoLqm8gq+zJXPO3+NGsb151HQ5bruN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651204; c=relaxed/simple;
	bh=ny/0yGBUhpu15kx1B5zBZQlhBGDlWFFW9v8sFZZmW/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FZ9AZjJ0GEvf2DwI7OxwcoKWBO6ouEXhPBl+S+dETJSVdK9c4q3G3UucRE6ECUXaWTZAwc9kM49rT8GdEFL4sWW2EkQwPPtjD10qNk53TIAeT2gDQhCf9nMP7Zh0N9LcfAN/vYz/Oa4tLYWsfB1N2NBAchv192Qf0fDgnOeL1Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LccAUehT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwuXmw/E; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXTJ22473721
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NR87RDpBrxH+KnWlqPh6r/
	esmuQuv+FT//+hejaEsKc=; b=LccAUehThdCPEcjMRLbusa31reE/OLT6cXs+rB
	jScyF1qPpoAvpEZ+cqSr1vEINgeIjhDrp46JsCnLZNii9eHGPQ5ovRpvJcV1nvcX
	tzAp+JKcPmDf46iFfSR10TGx3LMz2KjiR+SrNFyYunQCwMsY4JZXW/FSj0uxagPw
	rqbB77V3OXsMNL2W+k3iqyLTJClBmfU3VFi/c2kHjQjCog8igu6AA40fdLUwSsyI
	j6PUAxrl0KCmfngMu6FvCp95t6bkQ71P5ruC5LSYSsDt2Vc8moCV7ZFyKkhjIaOL
	Mmg8TH6D/P1i9Uj2cazXJClw6Hr1FtCY7ZsMZuDMRZcWhjrA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpjwhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:40:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so6866315ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651201; x=1784256001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NR87RDpBrxH+KnWlqPh6r/esmuQuv+FT//+hejaEsKc=;
        b=KwuXmw/EqNGnBmZ1hVGdjClYW+svBcXM+CFuoPoxfUYv2En3LejUXdaNcu/XK7kWP+
         OWU3jIRI3u3rOciGWTDPN/0mWzHVvyZ4Yuq7e+xU6P0DyhMxJqepFVidj5Zud7VAF7D2
         tt6aTM43MzecGTLHoJEvzCRCiAWfYbLOGNLBEoahMqr40VK66lUUz5AzNUHtUxFriBtU
         boy5JY4AUdFuWpw9o8xtqifF4mC/Zl2Q0ET8rBhfi5lufhOZC+6Iva70IpI7JCPK3ghu
         cTePtNsW5gzW5Ovi99eXGyaArk9vVMaWc5HFuSs7UeucH7nlVTDNQHjChBbcH6OsI2VP
         fM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651201; x=1784256001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NR87RDpBrxH+KnWlqPh6r/esmuQuv+FT//+hejaEsKc=;
        b=aM7Ncd28WgLn1ECnQ7Y+HsQT1JEZFd5QbuDPEWIx+IdKcHrndaAEzSCD7jVJeXHixH
         +Omf8Kls5OAVYPNV6Hf6J5OAv8E9RfgIGKQW3AaBngZQUPoReIHD6SBOAC/qRXNsZDqI
         Td8rYEXKyPmXGdGj7gfKQw9YTiRbVZD6VotYgudGt8bDW8sn2FcRJa+N76GdmhOhSphd
         n3/gnwiaxd3YbnXEhjz84Qnq9QsBE86BfI6CAte/hzEMdgIoBRO4kD6CeOOkBzzugQJ5
         VEo6BdIlHSxb7awW5RxWziTDOtRGjsZINooR48b4HkhWrFa1vySK4mmprHO/N2vMP9Lt
         Bc4A==
X-Forwarded-Encrypted: i=1; AHgh+Ro4x1r/t5P88/rtFi9jzVbySh3Zr0/gP0X11Lv33st0+205Hu7tf+cGTrrDeNwpLOA9N9VODttOpapnbwD9@vger.kernel.org
X-Gm-Message-State: AOJu0YzjA+R4v6qPlXbzDknQGj8zeiD81OShF4w5PWLTImASK1Xq+GHm
	f1pMuxxNmPalKHiy1EnCJhGktTuFBKIj5epWjHXSdNDmbBWIr5ra95mLMfnPbowrrToR5QxMM09
	x6lk58JyXY0gH8rcwY1d+WeHqcIkHoaaXPtKeN2fMKe5VrmU7ruGdKYBqNANTGJfxR3+s
X-Gm-Gg: AfdE7ckesfjw/A0gGhYwQDfjd3rBlYcfhVi0Ul77CSFbUFx5C/f1Ztg/culpI0RoLaN
	VIgYSQKvA77nSjioXcpCGbXU3hKrhu57wqZzg+3LXrmWMZDpXAHcXeUpWRROn14tMwk4tyMt/r5
	8W76/768iOJxotue+JIXAQ6MyEeF7y7sT+MIRRuDBrkQFD8x1SoJIjVVm+EUl3a3HDgajGsi7ob
	ZjtxKNmOMX02P6BJEgxvlhWTf5MR7w4Z5Pb0GlEzvjsxhyhdxJhKynSGS2vCMbQL62XczG+k6xc
	cjs+a7BDQs5afuN/3E3krFIvlBhd4uhe8yeBfAzkh6BcOLqgMctRy/AdpWN6F/oh66xpPKGQRgA
	7jnXj/+QjPOWNa78llLubjzphZG+ApwY8GWdWCgxDiaDi
X-Received: by 2002:a05:6a21:1fc3:b0:3bf:97e8:a07d with SMTP id adf61e73a8af0-3c0bc902b2emr11133515637.10.1783651200698;
        Thu, 09 Jul 2026 19:40:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:1fc3:b0:3bf:97e8:a07d with SMTP id adf61e73a8af0-3c0bc902b2emr11133484637.10.1783651200251;
        Thu, 09 Jul 2026 19:40:00 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm38300227eec.31.2026.07.09.19.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:39:59 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/2] media: iris: add LTR and hierarchical coding support
 for ar50lt
Date: Fri, 10 Jul 2026 08:09:11 +0530
Message-Id: <20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFBbUGoC/y2NW2rDMBBFt2L0XQXJ1iMypXQfIYTRq1Fqx45GD
 oGQvVeO+zNwhnvPfRIMOQUkffMkOdwTpulagX80xJ3h+hNo8pVJy1rFNGcUz+k3w2ko+YTLPE+
 50FZbb0AYZSQjtTjnENPjLT0cN8bFXoIrq+k/kcNtqWtli5ExIMJ7rW8+tzFmaMoJKWTJhkLvm
 jKqFUTjvfA8qu8JcXdbYHDTOO7q+VrVFjDQ9ZNK33TCReUhOqGF4D5aZTupgBlp98Z1ci/BdJo
 Lcny9/gASuuAoCwEAAA==
X-Change-ID: 20260710-shikra_ltr_support-27bd9a496950
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651196; l=1984;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ny/0yGBUhpu15kx1B5zBZQlhBGDlWFFW9v8sFZZmW/o=;
 b=spNxXQj0rH+mwHqW5MAv5vYojEgV0w2RY13nmwVwDEKu0Ddz7Yaw7b5BJKp2WpgBDLuqzoPfS
 4zmfYNCXe3MDmxv90GdTgKJ3cTxoZ85SnUPiwz+gJkbc5MNYgQ2jmPt
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfXwU8fUaZvlFpV
 unrAN/sCo9XJlSuJsIYrIt8IE+wR5alHNAn/o1RPMDfboFYqXzuwURUXZO9Bs5YTdPL+GDlM4Zb
 nDiD2uSkbZNkAV4SDRBltww+zR3PK7QgWTDT1fFJdKNwMOg0QM9A5cqLoONCqnhAKc0BKDkmzAm
 82VB4o2H9VzTryMQuaO12bLm1x6fwXhss8AquDIY+5MbQKbleXtwCZOhg74gl0+X5DujJpQXu/h
 QsgWqb3sP7sVmQ65EH9ccGet5N+XdEhTe9PH2FvyvcJ9smv2KP9G/Sui98ajeNi7f0l2HDHkIBv
 WrO/wEiPg/uyY3ASW5sXWRi5Z8h5NT43R6uVrajeL/DHEQTsG7/+ECtXODSAE8MQ6AjG0QKEL9T
 qGcFDdexUtF7dCsXMZsDT6CPVCpDBzDFaaD3+Hqaj+zEZFDoVa82YsN2Pzw/6ih44GrxohY82Dd
 RUS2N85u8BOG6XRKYVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX5tginGaVSrDP
 VjsfhARCFdbhNCGf6CNUHAGzQiJmrwT8UFzD/awecdU8u7y6lEN41c/JI9Z7+maar9KC5QfB4KY
 39Ed68TKUPplhqVrc3ieS3i38C5dWvg=
X-Proofpoint-GUID: xTzmw69mwkevNSh-JbElcIk38YgyfSaZ
X-Proofpoint-ORIG-GUID: xTzmw69mwkevNSh-JbElcIk38YgyfSaZ
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a505b81 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tubY2wRCqZv2GIUqL5oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100023
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
	TAGGED_FROM(0.00)[bounces-118117-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08334736B94

This series adds support for Long-Term Reference (LTR) controls and
hierarchical coding controls for the AR50LT encoder by enabling the
required firmware capabilities in the iris driver.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Gourav Kumar (2):
      media: iris: add Long-Term Reference control support for ar50lt encoder
      media: iris: add hierarchical coding support for ar50lt encoder

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 212 +++++++++++++++++++++++
 1 file changed, 212 insertions(+)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260710-shikra_ltr_support-27bd9a496950
prerequisite-message-id: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
prerequisite-patch-id: 8b5a1be5778fb4c7feb069452ecb60e8b8dfc3f8
prerequisite-patch-id: e669517302297a7b315c9aa4f4189e4928091e0c
prerequisite-patch-id: 922bc325dbd9a499a3a209d2f8dbbce6a4166e60
prerequisite-patch-id: a5a49cda4e21d835558fa84f2f6bd25b8f7e72b4
prerequisite-patch-id: e62e8285bcbddade64c026379f23a8c5ae70fe52
prerequisite-patch-id: cac29b25348e2e791638a0286283109f2546f9a7
prerequisite-patch-id: 4dfaff2f9644d7a168b1b35fe947660b8f464af6
prerequisite-patch-id: a26fa49eefecf2b5ba6cf964be9327eb5ba5929a
prerequisite-patch-id: d97c79463fe1487fa7bc9eebd4cfb4610713f44a
prerequisite-patch-id: 76eafea8230160a3b5e6503c68a5c9c3c2d1497e
prerequisite-patch-id: ea9cd9a8e6561321cd9cf338a76da1382ff47e13
prerequisite-patch-id: 26e9083b709cc8f2f1184edf6b39fb89f365a9f1
prerequisite-patch-id: ce4576bd3d20880939a97a1cda9bb8678808ea65
prerequisite-patch-id: 8c94bec467b385c373bd98eb9ee5a5805fc4e6a6
prerequisite-patch-id: 6e258cd475b77927d6476704cbf91bf48a63aa0d
prerequisite-patch-id: 54c8855d0721ba8667d095e6ad6556c2021f89e9
prerequisite-patch-id: f5479d2ca6b850c0c750944a8e0b05a7df2cc5a8
prerequisite-patch-id: 96dfec1c2df69f748c1a4bd741628e946cb7bec1

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


