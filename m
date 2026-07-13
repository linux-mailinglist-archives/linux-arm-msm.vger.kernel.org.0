Return-Path: <linux-arm-msm+bounces-118629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m68REV92VGoomQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:23:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A16AA7473FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:23:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nCZdYU3f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ewP/442V";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118629-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118629-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C17603028CB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A371362138;
	Mon, 13 Jul 2026 05:22:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA095361DDC
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783920175; cv=none; b=bWhvIk7cWb6TsYR60kVcDu2H6zeGAvW/ul2op892Y39JSow4gOK09drO/HAzqBSo5Id650lmLQqNhNtvQV4UtdHXw0TDqzYYnBFQHWKsZJhibgEQjDST7MKpHyAKUT94Jyi7FUWmu+3uLKVlz0IXPkYEB3hEUAUFH9Lgbrg9EiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783920175; c=relaxed/simple;
	bh=LeQEjDiT2ofBAkfryB+RRA3bVq9xl/j2VD2vUlHSTBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=re9VTrNKr6CDcVrHUE5vRq0Uchu7l0e/uL9rDDFAvdlnfD3cn4IVDWtz4/Is3if5EkQQfrNcgYxps3wFA4aFxr0CynwfN/TOA6VCeDv/4KQfmPgLXYOjs8zcO61baH1w28CVKd7XGV38WZm35vXixvAJ/pSkG3wYsl58Of7rACA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nCZdYU3f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewP/442V; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AJlv299239
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/MjSPuTi5VX
	dbi0rrWASgpaoUJZb5OphbbYvcj7YXs0=; b=nCZdYU3fuA0XZ6xQSk9gyhP5ylt
	hhjW1/sGkOpbqKJ2B21Mc64vfIXSsK7Z9cC77SiTaSKxwiaLRcES7haEVb/8qkca
	R6rq0F2icglKlVw6oUxLSL+s2/NAWX78Hfxu2xOkElqqxiFDMoDE3kRujci588Lz
	JOTvNATdATUZb2SuesbU/eFez/PtNa+LDyng5wpZAp3trJwlhgvMFqwSTrMvR5Ix
	eJs5HWNbcaGWCPe2a55rofsJb6Sak01eMwCeOBVh5jSxyFT9i32EWzt9OZr6Ou+L
	JJDPM0pBrVH3zmjfA3n5HRj1AwWdIDymScLiKCP7gvO01skd7QCeVmnT+eg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn38w1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc4401dc7so2074427a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 22:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783920173; x=1784524973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MjSPuTi5VXdbi0rrWASgpaoUJZb5OphbbYvcj7YXs0=;
        b=ewP/442VV2g2xW0vR8MyDfS02728oPOqu/2ZnAkmNzsQPMTjYeAoknUSN21S+3s9/H
         UNqUOioxCPs38SZnXr2Hqa/URkYFH67kzRESobIooLXvDt+WdPMIb+Gby8nbYE1qYL7m
         QpGVFmRNHNd+MIzATlatWbCQY/l3/oMFeyPX4Vj9gBG4tZ04htALExXa/8WvqmeARHYf
         8rglIVk9gLEgFSg56WdZi0joCuahStkZj6nzWtI3prfniNxYIEeRd/mO+YTas0/mAvKR
         3RrmoKeCu5h3cdE/E0ZGOkx9gB6HRbuu5g08vZ47IFc/6rFJKU/82A98uQ3795Mqmh3s
         cu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783920173; x=1784524973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/MjSPuTi5VXdbi0rrWASgpaoUJZb5OphbbYvcj7YXs0=;
        b=GXXacc2k/D0dKsN+LtztVwSSnkbwo3NsqkTdHimKm/wGLQWwe+EMZlGrm+xSsnrbH4
         hv5OZYxkN/dOj6Yg+sj6GLKJRY8DDswf0kHGoBkIBL3+RrnQXezqsZFGCL8OuQpUjaov
         B7KHotF6ts/OkO71J7JL+lZyU6WkIHaPG2hUquha7HdHGaVAmBRDv0yyZHLF6GCrwOYK
         MK1IKn9V7u89EMKdaQjQRavNkGecr6gy6+dZ2Sl4+vijWO87WiHxRaKxBv2TUeU+Tuno
         d8hBB+QkmwyEAEqsf12i7jRwT6eT7bWmkzvF28871SO0gvFrQRz/yZzIQJeqlJ3EZKgh
         6sOw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9H0Wxi1ekAp5oRG1Lh5QBeKVF8q1Q9cZKCe3eaZJqbmtCmHeGuZgvIyps8OYx505wsZmhh4POJEkxdgek@vger.kernel.org
X-Gm-Message-State: AOJu0YxLfo5Pw6jUx1Jsg5G8AnjbYIH6dhqafQUpNudCuBLNughQWzXl
	SZXBuYTHrZ8npyfn2gvs8l+oEsjEZUyfeypaAfREfSgX1sCL8vLRtypAGZDyLuVft9xy3VfrotH
	oZljlnbFNcRDAnif+sWkJjcBSnY21PEE9gN2eRV23AaoAngI9p1IhwKVkawvjB0Zi5juO
X-Gm-Gg: AfdE7clUotJh6Ndot7HJFyzwb85q3FyrXnVm0sWKMx5WgsqTdmbXzfN0gHGCf9oaMq3
	pUOnmvRio3JBX0Rwnmt7+5EyDWZDWfn14dBJAifsZ4LPfSrsFtURWsz5f8nz6KXRgmZRjg2O1a4
	vMH7i8RAjPLaFMRcp1y3TJeSlaVlSZDgg3gHC2S6Y+wG7bYcCU0piodo7HlGYE+1W9gm39wgoIT
	PQ9QYimxNqytTALJ5AamQ04fuaJ/HA/bxIlv3F1s7uIoqdL0v9Pi1Eb0vjkJBNlT0hHHSKG1LND
	Mv4cr/5sMp2pnacA14Ogz90GhEdlc+b0Fpesi0nvq4GzLpd/vWAJ2AHy7t4IJ0pG56iMKB4RlN+
	S618hRy1g6YNPi/mQh/P8Gfp9o115ck8DIRzlaIgKce4=
X-Received: by 2002:a05:6a21:3393:b0:3bf:7994:ddc6 with SMTP id adf61e73a8af0-3c11063c3bamr10103096637.25.1783920173336;
        Sun, 12 Jul 2026 22:22:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:3393:b0:3bf:7994:ddc6 with SMTP id adf61e73a8af0-3c11063c3bamr10103065637.25.1783920172795;
        Sun, 12 Jul 2026 22:22:52 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca75ef0c30dsm6245605a12.17.2026.07.12.22.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:22:52 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v13 3/4] misc: fastrpc: Expand context ID mask for DSP polling mode support
Date: Mon, 13 Jul 2026 10:52:35 +0530
Message-Id: <20260713052236.3033744-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713052236.3033744-1-ekansh.gupta@oss.qualcomm.com>
References: <20260713052236.3033744-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1MiBTYWx0ZWRfX4IjLu9YcAxDo
 qwlei3AMVz95kixd5IOsAJkjlOmOmXSKvXJGwP4R9zVyT9kOcxjRm9bq9TFzcG/ZCKArId1ABN2
 f8YDIxJk3MgJ8Y6q/yAWL1UW+zYJU1Xal2KwjPthbPCezYEHMkS21q+xH1YuqICvHRhf/V8W4j0
 AZsuyVenkAdPK0T8krvTKwNfK5TXkD8Hz//qeE3pRgWEVUgqPf30ntVLL1u8J5h09OBNg4iEAV9
 C8uSpamItJu8xPq4oDtGX1UzvEoIl6xuiHVEYzlUD9pj5m+GMv+lvA87VKc/WNz5QaKm6ylqWFl
 UiIvuhTzL8Fypni7QdtegfgXULmlvGVkso3ueP6Nyss/Antci/mB7andT3EmosfDO7koXnzWhVR
 QWNrKyS5PBfOmeuJ5lZNhLgJeDggcBa42wTL/0hOf7Dxrz4mjMEU0rcKI8mWsqwfHT/B+9/MUyr
 t4A7TvK8U6WBazuZrZQ==
X-Proofpoint-ORIG-GUID: LKhEePDinYTxmQ5G_zlFDhvyP4K_Xi0R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1MiBTYWx0ZWRfX29brnP5Si9+d
 qKjaDtt8iR0Cxzq7ODAiAixbSdWT9DEX72SlQ+Jjxo+IrRCCXUyIAqPpKCcBzF+yhM9i/aERHUc
 l2nvxp3hnf3b7DZfny3E3NqUFto7d1Q=
X-Proofpoint-GUID: LKhEePDinYTxmQ5G_zlFDhvyP4K_Xi0R
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54762e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=JTa3dIKMUYn8LlmgGFYA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130052
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:dri-devel@lists.freedesktop.org,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118629-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A16AA7473FE

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
index 41c2ec0bc628..78bd5b8f67f8 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -38,7 +38,7 @@
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


