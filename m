Return-Path: <linux-arm-msm+bounces-113618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PaaGFE6CMmqa1AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:17:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CB1698EC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:17:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MA39vTZI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iuoLjRlw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113618-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113618-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8258C31E66A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12861382361;
	Wed, 17 Jun 2026 11:10:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB63793B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:10:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694605; cv=none; b=QQIX2lzl2LWY9MpaHusjUX/StwjpEYxzeooojxIMWF7OwkdMcwRC6hUiI0Kj6UNeWxSskSGCZfzn5twl5/0+n0jMSH85iPjWtr678uqydHTcQTJKCK7BLAwsWcMpSFTpye3YRbUaF2Vmm+x2n8UmJTCtKSLn9TMTo+JdL9/YL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694605; c=relaxed/simple;
	bh=52B24ThLasG7ILH6XLGWVM5QvgN0HgqHdtoVZWaDgGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GDPRpsKt3byvV6M1ENf0cjnGfQU09KJMJy1Rz8zu45R837Cz5wzooyGA/43e+L7guEMv734ix9zvdqvvtgxPqVXDV2WnHkwMCDnupTDkCgsvI6TRXvtv3r5AWmy73UJsgpZaKGcvcoz1HulGyooA89oHEb+iQHl+t0vw9I3iyKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MA39vTZI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iuoLjRlw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Vt3k2192068
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QZ2mTLAzuiOBLJIxRAjahN
	Qc8qbCeWGYALyMP2niXB0=; b=MA39vTZIq1wL6cmf3l3Vx2BsImGl+anCypF+Vz
	SEVpuUtgSoxlwqlSDbXDrVWge/zZeCp3Q/KfllwmJ7QyUcXziVLsMom45Ktech6j
	JJmr9DFhncXtwgjtz+jrXWdrBNy4nR9H0kMg6x+qBLvJxMyvP22q8mi7PPMeLlX1
	KO7ArEbch2fgCFJ+NvbozKJv+9rd0+rKPkljBUmTLiiR6O3OaQaH8Kk2TQxIbhD0
	zAIxwqPfWtYzK6JEioy5uvJlpuK12/Maz7HOx6qCk3NI65+wwzBIUhAv+fuMH2yZ
	YxzWDhL+DGJPslkEvtzo7Bt27tIjL2X9Q7G7LmSYJTij+l3Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesju5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:10:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304b8d0ee63so8601848eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694602; x=1782299402; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZ2mTLAzuiOBLJIxRAjahNQc8qbCeWGYALyMP2niXB0=;
        b=iuoLjRlwxBUsb3+WbuIkXPEc/J36Z6BJ//JOZ832FgKis47/dQqiQISCWu3V5hN+X4
         uqz5tqa0OzkWvkxmNX8xkxsgdiH96F8dtUinwyJTZZgmXILGyw19FhO8Wi42fMq6mQhj
         Y7V3lDCzk2pcV8nXst/53qEHpaVvYSVqyIkCVbvoLT2YwdbkzKSeGrqP7LBf+/lj4MBp
         ZSeo5VWtInsWUFtte3mZ7E25wpuLAbx56XxfQ2Ifgpc6qUsbUXeL3SYOeU3+G/qlbMCr
         OuOTPIVkznII0aBfNOl3ekEUJy5rq1Cn+7kP2yCmRjWSo+A3ROU1/tlV0v02iZ1ZqR4G
         JyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694602; x=1782299402;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZ2mTLAzuiOBLJIxRAjahNQc8qbCeWGYALyMP2niXB0=;
        b=k7J2JL8DZ6/CToo6d7CZfh2vOVLdN8RNvyFee6hml7hC/WFO8WuhJEmPKnaW00AipV
         dMyQJBHbE0nUNPsfa8XllEKA1XzE0z9pCDOcHUEJedztOgJPQr50Ug9TVdtH7V2aqGaL
         APEPban4+sYy7qlRz2VNAQyC53e3ktuzQ3/wLKjzKJh+EU2qZS/Z2k6mpKfLiWCx5kJx
         8VSB9SC1nH/cQHOfqBd/tnwVepV0Vr7auN7Q0K9GIJWyyb2ZI0fFcwodAXBPbDbUeAmo
         26jq2pxzIyQ3xqyAsvu7k1OMISciG0nmlNHmoqUE/Z7NiyxMIQAQcUAerj53CwYe+cc8
         YvNw==
X-Gm-Message-State: AOJu0YyuHRnnOlsqGi7pab45kq5oEoW+lPnnZLE8C42CH/6lb6SWIW29
	vNo2q6vIsZhrcl3ceWVFlnHeN9dI5kLU4It2X7S4BUkQ/yVsnpU87LUijkZtA2YUBkMjbNj0TM3
	6bVmP0lYrjHJYyaawQCrSLMnl9LaGMzA+33RmFYrUOiFm60ABaTHzg3adb0ntWVlgiIDD
X-Gm-Gg: AfdE7cnYt91vj+FkmcbAaxdSwPhu/EGuWw5TZMO3ArqG+ez/s4ANDY5aBKFNlSNVWsE
	5HJIIwOZFn95JGRtF7KQXf+PiEDPMnGChLKTnBkQpY7fg+fxKRVjpNFX5G/S4r0L7wfSLciik8d
	QjtPkhfUHm2DCGlYTX3RRVT5ITJsw9s7x0mKDWvc+ngRVnWtfZd3VlHzKQUvX1aq04vF0pSxpYG
	ScQ89c6eJlV/KG8j8Pe/WidhtDO/MdJFzXKCliw1dj868zZbIdxNNsbAU4wvjrrVtjHxhlm7fkk
	fBsJqXQ9LNF421pg0gBwNgk6d2mz2Y/jzEcMJNgXTeTl8fd9nrtbTYIgOQs1sJHABPG2phFZ3AR
	exc3uuRm+lU82xbqd5whm8vDaK7CV1lBH/WZjjw8tyyGPNVzF9YOm0i2QSFo=
X-Received: by 2002:a05:693c:20d2:20b0:30b:e525:4702 with SMTP id 5a478bee46e88-30be52548e7mr127253eec.12.1781694601916;
        Wed, 17 Jun 2026 04:10:01 -0700 (PDT)
X-Received: by 2002:a05:693c:20d2:20b0:30b:e525:4702 with SMTP id 5a478bee46e88-30be52548e7mr127243eec.12.1781694601350;
        Wed, 17 Jun 2026 04:10:01 -0700 (PDT)
Received: from hu-yutlin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bd01b768bsm2426972eec.13.2026.06.17.04.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:10:00 -0700 (PDT)
From: Eddie Lin <eddie.lin@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 04:09:50 -0700
Subject: [PATCH v2] misc: fastrpc: fix memory leak in
 fastrpc_channel_ctx_free
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-fastrpc-cctx-cleanup-v2-1-be87c021114a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH2AMmoC/4WNQQqDMBBFryKzbiQTRG1XvUdxEcdYU9TYTBSLe
 PdGe4BuPjz4/78N2HhrGG7JBt4slq0bI6hLAtTp8WmEbSKDkiqXOaJoNQc/kSAKq6De6HGeRN0
 2Smpd1KWWEKeTN61dz9tH9WOe65ehcHwdjc5ycP5zehc8en8UCwoUqpTXIssyxJzujjl9z7onN
 wxpDKj2ff8C5msettEAAAA=
X-Change-ID: 20260611-fastrpc-cctx-cleanup-bfd20aa7b8a0
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Eddie Lin <eddie.lin@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX4gq1UYUouKb8
 DOT7ACDSyJ8WUHlLdBWW62X6ndRbbX2jiGfBtBob+kEuHanajtn+ye79Cazayv3hiNXr/P1i5Nm
 V4OIv5yqNeXOix/1nWaAqztPsWEROuHQExfLaQN3rJGOCwcz3yUdENaPatpRFDVJAdn+LNH7Kna
 DcDOffWqJzV+vYY13GiLR2IS5kOb7y0/tsBT2y+FNFk+qMQECDgcvCovRx+Nu0/uEck6I/0rsTA
 x+BYS0RJl5WGBEmPlk20AaLtok04EvlGYhLMeqBDQsYPDUbBobI8+D7E1ZxoYnGWrwOfs5jeTfK
 6gpk4xTtGFDp2YpAy6haHo5rr3+pvW4NkfeQCeeJz5qhWUa2MC4KsF59APEgINsIztw+QuLl6Pl
 CqOfBHCM4QHqO7CtpSG01CNeRDaB1Z1qILcveZHNn3Cfzm91k9SjB4z64DqpRqKebwWLwueRS6S
 XMGCDj8+FLRPaY10lwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX8xno8NtpLzn4
 sJu/YEIsg6ZH32fOh6OEfvrCPAL3lNpdTg/WzytC2leKx8I3oFUvYQQXuUDWwIHEf/DhLu4BQJc
 AwubMzWJoV9v1pA9YPwv0K3YYo9pwWE=
X-Proofpoint-ORIG-GUID: s-NE1v1wskrGyU0ZmVvXFAntLCOCUaFV
X-Proofpoint-GUID: s-NE1v1wskrGyU0ZmVvXFAntLCOCUaFV
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a32808a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Rsn1OCey0fvCUy5VNe4A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170105
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
	TAGGED_FROM(0.00)[bounces-113618-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[eddie.lin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:eddie.lin@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eddie.lin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5CB1698EC7

The 'ctx_idr' is initialized but never destroyed when
the channel context is freed, leading to a memory leak.
Add idr_destroy() to properly clean up the IDR resources.

Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
Cc: stable@vger.kernel.org
Signed-off-by: Eddie Lin <eddie.lin@oss.qualcomm.com>
---
This patch fixes a memory leak in the FastRPC driver by destroying the
IDR associated with the channel context during cleanup.
---
Changes in v2:
- Added Fixes tag.
- Added Cc: stable@vger.kernel.org.
- Removed duplicate description from cover letter.
- Link to v1: https://patch.msgid.link/20260611-fastrpc-cctx-cleanup-v1-1-28097444116c@oss.qualcomm.com
---
 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a9b2ae44c06f..7727850e9240 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -492,6 +492,7 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
 
 	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
 
+	idr_destroy(&cctx->ctx_idr);
 	kfree(cctx);
 }
 

---
base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
change-id: 20260611-fastrpc-cctx-cleanup-bfd20aa7b8a0

Best regards,
--  
Eddie Lin <eddie.lin@oss.qualcomm.com>


