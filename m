Return-Path: <linux-arm-msm+bounces-92867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C/XBxIPkmlJqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:23:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F213F60B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 935203045A8D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 18:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726DD13E02A;
	Sun, 15 Feb 2026 18:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyNm6z+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auFbO++c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4A234966
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771179715; cv=none; b=fyayO8x+HVZiZsU3mPHoG0An63s7N5NtBjS+SsHXJWoQ6MJs318ts6G0ymL2pYwyMg8flaMgsUYAFKYQCO4F5vpteDKHeJY7hV2BJFlakrSgx2KsLiU0tMUYwYD8QA46dVwTJe8Y2/q2qE1x/zD5+4bS+UAH0H9VbXYCozHLjvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771179715; c=relaxed/simple;
	bh=xKLYuFz+4tSIoIWOitziYVUW3AUr5T96HlM73lCZEcU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oYO88QoIZZKleSQR6SEQP/1WZfaOhprnRf3dqCGc3RxpODeC4mvhbNzRe6YzRUbotSFHlXtJ1CK84jjfCERRpo+mjszmqj9LIjH1KhGSMJM1X9IjO6bav/BV14bjUELIyH0wbLgi/OqWAlPpDB80GPoHTnqPXFDV2lVFSG5zMrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyNm6z+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auFbO++c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FIF06M2964259
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dgIREKXxj6b
	F+RK+0EKrSCsOy0Evz93lE4MQnPBprCM=; b=GyNm6z+3I0pB2OU0aKhe0aSTdQT
	HTxBeG08B5yKu37p+ohkm8k7DwfncUn30Xhiv5u82zMbEi9MGbV/QkwghlCkFBBW
	SRy7kUfI1TXKM+Dp3aEOlp6Q60EoMNvnvJPjLkUWutnuS0WSLRQ0CaIqjMnj0ZMu
	raTpAhosaFg5btRJQDhkcpcQSY3762iPdAM2Dt0whLRNY7N0bNrDzFO1pDCDLulF
	V9vib4AjbW7/Vxf2jz3DmHpaZvJL7M3KOuMufPj/q8QWz8Ta1zNa8VOD8wUN6pjF
	l7mOPC3Xh7QmZmuC6PY3pDcOstRucw8nTc1sQHT4vcxbOwBF3ptn9cgg0XA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7jajj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso11688331a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 10:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771179713; x=1771784513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgIREKXxj6bF+RK+0EKrSCsOy0Evz93lE4MQnPBprCM=;
        b=auFbO++cpyF1OTHazPHCmiLoQDnnwYqdK+725DNvYnTh1vJ93/zd26npJh+SrZ9pfs
         GpRWVaFQACC4IwPIZNoW+QR3yiBLbjGUfTwmK2ZPfkKcewOJAgySe94uILBfNdOOhsuo
         h/05BlJfZOVzJdIkArLS3xIsuz5XPkTGQQIoNIWH77yRo2+/UxEoXw4okeaPK/yoW6YX
         duU7qW71+kWywXbSTTcsnAVPEdtD7fBfjO9joKziADZ3I9HGNbMQd+K/NZG0ms3i3h2I
         eNynC+0VlIYr76P7uhBC1IS3Q13psZPpg5WMLzFCVPkcNfSPWWImV+VFnRHxs7cF/YJN
         D6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771179713; x=1771784513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dgIREKXxj6bF+RK+0EKrSCsOy0Evz93lE4MQnPBprCM=;
        b=qgFky6GZ7gum0g85dE2aVJlIg6GC9qlpZkRAShNer36+yB7xSjUnskKrxRd7MZZruA
         awsqG5u7R0Yr2kV9W5big+WTA1TpTdQCO6V0On6+8x3HCfYENYR/e7Dq5R5pBH7yY3Ej
         t+HlRSleMqCMp4QEgoyutCmMV6pf0PvFUoifQ9CWFpbrrHzeQQBmHwa6sAAQ+cuWehMG
         94gVrjTeWc3mMGM8tRQlQgxCgE7tyozES00vclc82VixjHQtICVbDMfycr02xedZNB2L
         F4bRB8oIHOSMu6OcTTJ0qnPAk4L8ZnuNqFv2Htg+qBFgtow5WLFJd2aPsnKmzE5K/FD6
         2DoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYQWdbfTxlBENbuXyiD2DA6e/ZiUTXHJ6Gl4zETXgcMf2jqjbHwJ6Q84iLNFVvm3RQWCj/QvlHwkXIn5GA@vger.kernel.org
X-Gm-Message-State: AOJu0YyH0jDYnvpJjYUomfTYGFSA3MgHyRSz/HADE8ifqsu+C52Nq1k4
	R3lN90tu6wXr4rQtxObdiaHPHR9OUiaSOwcogVwgd3fGW+42Gd5+UbrNK4NzYUVwO+wAX1qma+B
	SJ7AgoRAAt50hpu85Yqd9qju/LS4SKdvLG26DB7fDVLCjFQUrht1gYAp3J+f8hoZEGSc0
X-Gm-Gg: AZuq6aI8KgPuedXAU21Z2CZEZRrAafTx7vPTjQZnTytpmFADFhD7kcwCzpb9M/o+6E4
	5p0jOJEyptNAILZqp02V9qCSGoQKzgZka0FSnihp7pMH9PMsma0Y1Yga3qb57UZAm7GvJZkAnUn
	TKUBbpbhagIdxFZxdYmbpV3/+tECl1lALRWn4RQRrS2tAtPTBIzJ50KvZiZoAovwebuHVg9tASn
	Qq+/4HNWtLMxhSx5SrCFrYpf/6WptrTwAPwF0Gs9rfax0CZlCp0FDlzAJJUEQ+ybv98AS8ATmV3
	0rKtl2+GRdAGa++b3VcQD33mt79ua772lMvRObZlm+7drNJFJLYJXohHiOo0W4k4nLsh8awyoUt
	4JCMoe6/mLObD6d+2a1ZHzBt1MuLW5dpvK/H31AI4m3SQE7MAZBzUqw==
X-Received: by 2002:a17:90b:554d:b0:34a:b1ea:6648 with SMTP id 98e67ed59e1d1-35844819f9amr4757690a91.2.1771179713102;
        Sun, 15 Feb 2026 10:21:53 -0800 (PST)
X-Received: by 2002:a17:90b:554d:b0:34a:b1ea:6648 with SMTP id 98e67ed59e1d1-35844819f9amr4757678a91.2.1771179712598;
        Sun, 15 Feb 2026 10:21:52 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e537desm17425381a91.4.2026.02.15.10.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 10:21:52 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v6 3/4] misc: fastrpc: Expand context ID mask for DSP polling mode support
Date: Sun, 15 Feb 2026 23:51:34 +0530
Message-Id: <20260215182136.3995111-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=69920ec1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=JTa3dIKMUYn8LlmgGFYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NCBTYWx0ZWRfX3d9TOWgonqW2
 MWS+200K+iCDbRltFH6oQYzcuuiFIWV+w0QCkAmB2ECwuVirHUfLTTzbpowBa1pAPqy2N3G8NC5
 czSVfTAGCVaxLylIkZXrsBIwd/piS+vy9fhtPL6lbvCCLmP3sVN995ixYoSX1bcPup0WC/zxNKt
 SepGH0Kx+VBu4oquF0+DfOWsrRW4tcFNoxx5NVG0GOZgpSltWnhHe4M5VeMLpn/u/1nz9s5/Iv+
 4o1Xd+Lf91W4P0yHJBzP6m9kUtjoV0kJTWIEmC1Eqs5CHdbbzhufQBWUAK/cYWfYrwDx5vV9tWs
 jMG0RofnfaOuEK7Zi1e/zQ0AgGAxXgMtQA5Rv7/17nS0xIyA3Q/r0BWSbWur8b1bmkCTuvFKxtI
 VKaZg0bY5wcrd/HGH4q0FEbzgKiwodZu2V8KfM/NmBgz2sxcNUuLYjFJLbn6zjQ1GPfeUciUuVC
 Gnv/YbBJH5hqzdJSixA==
X-Proofpoint-GUID: Nc8k9DfpmCnOIF5fW7i3ljspBYJ5_D9C
X-Proofpoint-ORIG-GUID: Nc8k9DfpmCnOIF5fW7i3ljspBYJ5_D9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602150154
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92867-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 974F213F60B
X-Rspamd-Action: no action

Current FastRPC context uses a 12-bit mask:
  [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)

This works for normal calls but fails for DSP polling mode.
Polling mode expects a 16-bit layout:
  [15:8] = context ID (8 bits)
  [7:5]  = reserved
  [4]    = async mode bit
  [3:0]  = PD type (4 bits)

If async bit (bit 4) is set, DSP disables polling. With current
mask, odd IDs can set this bit, causing DSP to skip poll updates.

Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
byte and lower byte is left for DSP flags and PD type.

Reserved bits remain unused. This change is compatible with
polling mode and does not break non-polling behavior.

Bit layout:
  [15:8] = CCCCCCCC (context ID)
  [7:5]  = xxx (reserved)
  [4]    = A (async mode)
  [3:0]  = PPPP (PD type)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 0d8d89a2e220..e935ae3776b4 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -37,7 +37,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK GENMASK(11, 4)
+#define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
-- 
2.34.1


