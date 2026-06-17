Return-Path: <linux-arm-msm+bounces-113612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Il60LXiBMmpQ1AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:14:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9E1698E03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:14:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Fa9eQQyv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SdIr35rL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113612-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113612-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 864233108A40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD42C3955EE;
	Wed, 17 Jun 2026 11:07:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFAC3B3898
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:07:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694450; cv=none; b=QmaFqyT/+mO3mhPTaIsjvak5CSVHpn9I77vTDRD2VY+hCW03RQSSqPZI5JR/BhaBW8W3yw2XkmEbXVSHEDuRy58KK+wKvlGoD5qo7UJTxA4wOGckYwj3ZmkI/ZzJBpx6leHpHVE+skPEtBx6dX4z5dGNmRDLiOQVyuaaFnUhDAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694450; c=relaxed/simple;
	bh=0w1s3YLkG+jtkr8qUvyuwkEbPb4RqLlVdDbqa6f/WtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lugpKgAKOzpuZ0ypFnMtNdhc40VZNqoOygewN5vC+UXEM+S5PcPCeIy7wKC1HZP0nvkCo2CH3RZRZMGqShtjJNdNFhMEhzZC2KqpAwoquJBCe4sxZOqSMTrY1Ttnz2mT7lnk/fyGpUnuZiD8th3d1jxhpttN1VpiiSFXbmEO4To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fa9eQQyv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdIr35rL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VC3k2291489
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6y9ccpxsi5yOvGDb95mPzv4201ZnlOndGkxveCSQBy0=; b=Fa9eQQyvT6/fYXwB
	Ar+yBsfOHuqXmBX4aG8koDP+IythKcL/6cfa7fu3WMrzIInJ9RcM4lKHqD0dLDLI
	+JL6ZvNuMNUyQhciqAr/rSoGRYY7JebGbS6VKOmEVPk5WnW4FFDL5cjCWd90mmm/
	ZkXBfi1ugupurheaOBQQW1THX2em/BBmtq9koxZHCHJdgx0dZRtUOtcPRsBv8FwF
	edu9Ceccm3HmBnTXjuYd4fCwuKhN15nypCOQ/0hRS1O/UdTGm1N1Hm35E0jUhWX7
	wuEzbEZKdW2XqTRqXOwjeibedBVNvfOcZCK9+zlRwuxSrr0e5KhuYy5NEkvUIxhI
	r5AEVg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevjus9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:07:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso6544880a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694447; x=1782299247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6y9ccpxsi5yOvGDb95mPzv4201ZnlOndGkxveCSQBy0=;
        b=SdIr35rLxMt9RbQLIcY9PpvJ2TYbotzQT5yVXJEBBWJ6ItwG9yHV4nyq8xUVeGbNyY
         YBmJzmKfYYbNRHeMEIk+mnoem5QdJHiK3yAM02qfXxKi7AMQMk7uwvBh3m0rP51EPnz3
         M+p87L1TPJShs5MrMzoLu2cfYjtVs9ub45SP2LCKwTa+QkNVqU2OFE3dwAf92ZH2FCys
         UzWwvaPxFmc4Nez7SpBnYh+NFoumrIWspA6bzFPP47WdMdPHT+XunkDCYoQg1OGH8jk+
         fttPEmSRnrt2rFoyb/9fMBpKkLrXfGt/gDeJjtwfEYWfGJSWOCy95xgorGgiz9URLlaq
         LplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694447; x=1782299247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6y9ccpxsi5yOvGDb95mPzv4201ZnlOndGkxveCSQBy0=;
        b=iSkovox6E03IOhTKascSO0AZlPsYDQqKJbAcxRZuriwxDBwyGj/UTUujt04q4bJQ3W
         lo9I3pqOWfJE2dknU6drJn/FfmM9chKzVHsD9JAoZDdLI06jSz50ekHSzUk6KH4ShzdN
         Kq0m+81hv/rrdiHiSLSryYikiLXGiBriRmnlc9Y6ihLriY+eWJcF7uvgqvX0TiQ6p67U
         zC8dip0j1mVpYzmKdek7vbAwWvLGwvpKk7w5JO+ywjCZSX5uzwLOSxPJcUKuQT/RW+Mi
         9u9UwwQfw5XNTFt60B05I+CklaeAXa9N2zLmZz6B6hDMzIgdV2JWVj4+zp46Tb7rX9T1
         rStw==
X-Gm-Message-State: AOJu0YzLfmmqSEY1UbD4Zjx9aj5F7XZb50VG8MHeF5tTWjMCwU3MFyHH
	eyD1JHQeOieyIPic9UgdCKk74rVc0JCB8fgLffoNhy8fZK6DbmQF9XFeiEIqspfNKUecXXRScCB
	ggpb1NhaBsd7vnXDwO0hGq7+hPokfLLQCpZgGc/XT+lDnnMK7cEq58HybWWvaiXGdN7gX
X-Gm-Gg: AfdE7ckXpmIGwKWoggbiwwNUAV0qeACjoPfbtF3VDuHcbUiOYqV29jot/yyCLIwadpY
	VfwP9eyT0nLSmTl1AfYw8ve0MLOp/lbL8KCx0aeM7BUkP2dpIyND7QW/L34f2pOzP2+fq9wrRVM
	qm+CcMV2c2WSi7u5Y53Pdk3+RmSSTbcg5aYlVVM3NkgUDWFXr/mvx6GZDbx9JbY7tFmPZjFmC6L
	Gm/dmQdHRzEvqbVl0/+k8GuaNvC2plNv+pykbAaR7a1O++yQW4F5uqfhQDr9JDqJ0b1psVejnZ+
	GrSKsj38ezVIEkzMKGiiwSUlpkkgUNN6guVQ+1bIjFGEj98GS+oX6DOcaihxSs9gs4US4asN1w4
	W3YuWQwncAEOKfnaGRIHk+B6JGB3vPIK/DqS/D7T9/GPXZ22q4w2GkhhTEOtwiBdx1g3qrR51HN
	E1465MlA==
X-Received: by 2002:a17:90b:5807:b0:36d:ae6a:22f4 with SMTP id 98e67ed59e1d1-37c9e9c8c7emr2943102a91.15.1781694446546;
        Wed, 17 Jun 2026 04:07:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5807:b0:36d:ae6a:22f4 with SMTP id 98e67ed59e1d1-37c9e9c8c7emr2943065a91.15.1781694445993;
        Wed, 17 Jun 2026 04:07:25 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228eb5bsm5577639a91.12.2026.06.17.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:07:25 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 19:07:14 +0800
Subject: [PATCH v2 2/2] rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO index
 invariants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rpmsg-improvements-v2-2-477d4eb569dc@oss.qualcomm.com>
References: <20260617-rpmsg-improvements-v2-0-477d4eb569dc@oss.qualcomm.com>
In-Reply-To: <20260617-rpmsg-improvements-v2-0-477d4eb569dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781694436; l=2286;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=0w1s3YLkG+jtkr8qUvyuwkEbPb4RqLlVdDbqa6f/WtY=;
 b=WB/PBn5QAVqwzjusrIFk4JTnZj1Sveo89mv10F/gfaxNm4YfnActQH8YKmaaD9fOueq+gIZnq
 OyweneaLAq7DDrQDG/d0MuzitO8Momdu9vFuncqVhyfApANi7TTYMeG
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX1UtR6Mjuz+zN
 HKCj4tb0sozSEatEvA5+Ci27JPBU/1gip7ZCy25z3gAFUVw30YNAxk9xxGXW9uiju0KKKwJrbmV
 eurGAvltFUlFocPVAizY25coz4W2H6HJSLtJZ9rrepBc8jPLMY/mDhk/qBZCyxzZjKCIfRPF+h0
 q7hUZe87V/GysWXezrQmjiRByGl4Qtrq+OJ1cJGb/v3d27LaZfkP3XpdlQ65eyZWkkIdipxhMEb
 zRyj1d7JpbtLszeMvDQtgjFyRSYl+/z8PgoFnYC2AvokKyKazK6Zrnx68XiqFygeYQ6R2lrIEzD
 30YxD+VnYKXi69/NQMGl8ppN/N97vWe6xa4Z2vNpBg3jw0o7h8a2vfOzF5MYyYCW+rnWolxgT63
 zWlRlLV0BNyhxefjc38+D19F6cxxEwGPRexUgV/T+rN2C5k8SXc6zUHQWVWHvqFSY5S9jrHXX+n
 W5xDImLSPKih3QaNXYQ==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a327fef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: NE-WAITZDR-FI9znxj7S49Davbs0IbB0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX5qPt4P3KGuSw
 VltWEZIws13rfFAXyMavzTKwd1b84UlwKUeZp7FY/RljZYBGsL0hyhs5O/Y+MXjbJSnLxiDCcOX
 s5+vfQm7QxGVWUrRPfwnCZqh9Iirp9s=
X-Proofpoint-ORIG-GUID: NE-WAITZDR-FI9znxj7S49Davbs0IbB0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170104
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
	TAGGED_FROM(0.00)[bounces-113612-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:tony.truong@oss.qualcomm.com,m:chunkai.deng@oss.qualcomm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A9E1698E03

The FIFO read/write helpers assume the head and tail indices stay within
[0, pipe->native.length) and use them directly as offsets into the
mapped FIFO region. If that invariant is ever broken, the subsequent
memcpy or memcpy_fromio would access memory outside the FIFO.

Add WARN_ON_ONCE checks in these helpers so a broken invariant is
caught and reported once, and the out-of-bounds access is skipped
instead of proceeding silently.

Fixes: caf989c350e8 ("rpmsg: glink: Introduce glink smem based transport")
Cc: stable@vger.kernel.org
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index edab912557ac..42ad315d7910 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -86,9 +86,14 @@ static size_t glink_smem_rx_avail(struct qcom_glink_pipe *np)
 	tail = le32_to_cpu(*pipe->tail);
 
 	if (head < tail)
-		return pipe->native.length - tail + head;
+		len = pipe->native.length - tail + head;
 	else
-		return head - tail;
+		len = head - tail;
+
+	if (WARN_ON_ONCE(len > pipe->native.length))
+		len = 0;
+
+	return len;
 }
 
 static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
@@ -103,6 +108,9 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
 	if (tail >= pipe->native.length)
 		tail -= pipe->native.length;
 
+	if (WARN_ON_ONCE(tail >= pipe->native.length))
+		return;
+
 	len = min_t(size_t, count, pipe->native.length - tail);
 	if (len)
 		memcpy_fromio(data, pipe->fifo + tail, len);
@@ -141,6 +149,9 @@ static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
 	else
 		avail = tail - head;
 
+	if (WARN_ON_ONCE(avail > pipe->native.length))
+		avail = 0;
+
 	if (avail < (FIFO_FULL_RESERVE + TX_BLOCKED_CMD_RESERVE))
 		avail = 0;
 	else
@@ -155,6 +166,9 @@ static unsigned int glink_smem_tx_write_one(struct glink_smem_pipe *pipe,
 {
 	size_t len;
 
+	if (WARN_ON_ONCE(head >= pipe->native.length))
+		return head;
+
 	len = min_t(size_t, count, pipe->native.length - head);
 	if (len)
 		memcpy(pipe->fifo + head, data, len);

-- 
2.34.1


