Return-Path: <linux-arm-msm+bounces-103285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Om7N3F332kATgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:33:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F63403D66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDB3831496C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD2E3264E2;
	Wed, 15 Apr 2026 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WprX435k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOYlnoX7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A4C37B011
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252355; cv=none; b=EQE5wcVw/tmcmiUDWyPNSj+bnGHFi2fKv5WYlC6Z8y7k4NKTVZLNL2s3tADiSGqzDJh8pKul4P3YsASn8by4hTaBAYJybNRKE6IdzoM5XB7tVq4K/Z+CZBjrPaQLCn5TbX2wuE8ZXDyZDaZzJFPwWJGaezg3v8ES86A8DnFapPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252355; c=relaxed/simple;
	bh=wLHY1YKwTOtJ5TMOu7Sc4w4rQ5+KEfPEjuD58JrY/gw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q00T5feCl9ut/qs/EvpgyKY3U8lTllNupFHB3BVqubLdd6FwKAjnEqDxhm/7c4p3c6I66DyTJHxkz5wx4tFio32IXeJqo01lx58WyOERhx5mxwbiyDtEYWfrPQB5vMORGHeIawssh4ftI66dcFpcQ7/QIFWaUqtsbXImFJKykdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WprX435k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOYlnoX7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8x7Eo2006431
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tFUu7w/Mdhl
	BRhU4Ur6TRUhTba4EbTByy053HqbjsgU=; b=WprX435kplAEgsQTfMPYD97BASu
	LJuAGZygo87rFdvNo8j7F5cR4oUwvHOzBwsWi49+H4zzkD/EfUVb6lT2z6hbvD7M
	CxruIwU6WJNVd1CDSlXlRlbE8ig8Z6x5smEqnSaHKERwcn2LeQ0ZaWMLX02x70PJ
	wIf2TKYmSjJm79ThdLFc7dpYgyrmC+LvPJ+XEZ9NVRPal0YYqK4fqZnLNXXSDvZS
	3igHGsSiSvwuyTy4G91e8ms4QhXeIlWQOBaNnFtNNv3C18q1k0a1smAhDnWfUgpE
	XC+p4O+nRUttCDFsxNv2lh4bzXLOt1Bv9BTkl4hz/unn/Ev9S+VjtlA8YxA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjufbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adc527eaf5so48312125ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 04:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252349; x=1776857149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFUu7w/MdhlBRhU4Ur6TRUhTba4EbTByy053HqbjsgU=;
        b=bOYlnoX7cUcZ9ow9MNQ+lwTrNQbX+UPhMKmT+fUyQjvVTf85Lk4PCfp6ueDx+T7ic5
         YpzW7xLrdyPfs3Ctucdzw7jCCDqQTTg87bPJXFSyMvgXjGLh7l6Tm0J4gUJo2/G0S3ii
         R6o+wQ+9COEkl8GgS1vkiPE6tYbGN0Nk4C+ivpOtD3ORPqjCJxSHj3vhBFsxtX47VUkF
         pmYuWmb2uBkms4lwdlj5WznTJjps9iQ4FSH5TAN/rGHSsaeRltM7aKysN6ygqzKOWPiN
         Ekvv0Gbk4u57S5Q7N9iQYsq6x+fyEldvr95gWYRn0Wmsy2ILHm5EV9arPu1yQ4J9aLA7
         EcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252349; x=1776857149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tFUu7w/MdhlBRhU4Ur6TRUhTba4EbTByy053HqbjsgU=;
        b=KfqtMBhWzla0F7ZpNf2nIpD0r6ZkV77GqHVf/MudBUGNwtnKZDH//KmPF3unis5XrA
         fWcRU9NWniSEB85gLEHS8PE26QPuD06TVJj8+J5IFW6w04s6p8BtR96ZKCYTe6ZG6qO8
         xEwq8JFIn2wQj5+HG/OxCcmZJL2Es+TdW1MujENXqVyjPxqXckLsd6TSufkor9uGIryB
         L+5Xw10UjsdvLzVJ4+f0kmNe3oXJzopOlkegvvGaDGVkOxpn1oVUrjqQXpkgPq6f3BQ5
         ofRw10Pi28OL6mz34Y34wnCAoweGfiFIHEdsGCaewzL2MbXk0rqQKhSq/hcdXar14oFK
         ZU6g==
X-Forwarded-Encrypted: i=1; AFNElJ+w5ceRQXBAVUr1I4Vs8m+UETp3fNw2AB0A+HvLz6TjQsEmcKv8YEgAy1DmEMq9vGxzcYe08n9I6y994NYi@vger.kernel.org
X-Gm-Message-State: AOJu0YxEYzug77GbK78NLWgu2UAQ9vDDfR0jwIk72bkC9tXR22cGSpCB
	9GCwRLNZ32SpRcJvQ5KRJOZzMmxapA0op1dy5nAOlW1Z9WN9cnIpNq5Aq+TDE0n/+CymFkw+rC2
	lHVKzHQVjq1dkVc+QM35MZdXKw8OUYaIIVuYv29Ojf6AEhRhuRXDw5QQ9lYkhOW4k6ifx
X-Gm-Gg: AeBDievZgNTsn+fdP04EdlLn6q+k+nVH6PrTUdxJ/XrS04cn9Revaw0Grjdr9ldkfma
	Iq5bLiW/vpHNTfbtuol/ETwq2ej7sSKHiqhKpREQe+57s0jUFJHu+pS2N2noceJ+3eHvJ1k4zWU
	dZyOeR1DK/bJBs/e+g2c6eaKGjPyvcIdwVIVVkdewiGt9b9BJky/eAQU+heYGQEHRPu5QYc14C0
	a8gcQGrxAN390t9zhFLgs9yNnQKZ9Bhw+lSgcUOd2HQXhn+F+2iwwWr0lFad66mHVDOlzHcEOtH
	GBsM5kWVAPDdh3IxxTnIjBq8GkzdV8nJSC0v1OQewIWPTSQ29lMltiItdmUeWydDnoIOaWLj5Pb
	5utzycqYU0fv8vV7S2wRpiT9PH9k3aoMrLI84/Rp0s0Yfvkblm5LZTZwhWbwTE8oO
X-Received: by 2002:a17:903:2c04:b0:2ae:c5fc:b2ef with SMTP id d9443c01a7336-2b2d5a558a4mr210626175ad.30.1776252348821;
        Wed, 15 Apr 2026 04:25:48 -0700 (PDT)
X-Received: by 2002:a17:903:2c04:b0:2ae:c5fc:b2ef with SMTP id d9443c01a7336-2b2d5a558a4mr210625925ad.30.1776252348244;
        Wed, 15 Apr 2026 04:25:48 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782b6fd8sm26794325ad.73.2026.04.15.04.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:25:47 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org
Subject: [PATCH v8 3/4] misc: fastrpc: Expand context ID mask for DSP polling mode support
Date: Wed, 15 Apr 2026 16:55:29 +0530
Message-Id: <20260415112530.4083240-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
References: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69df75be cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JTa3dIKMUYn8LlmgGFYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: YORI8PCZP_OgK-vi4uDnW7QOS2cpifPm
X-Proofpoint-GUID: YORI8PCZP_OgK-vi4uDnW7QOS2cpifPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfX+POm681MUrMe
 KIsHMbIwTnD7Kl4sw3B958qTspXJyXv389Um4pTvl0d5+kR2VQ7jaTBst9QP1VTjV8q/+JRNGlY
 TN0mFifMqdmmqwahZipoipwR98TG886yUQWsaS1pgqvevuvYVTXoBZTPxlQlPgzzP7jPZTMxxRo
 jlLEX7lCdlq9WR9xlCfa0K7MDvX9SN6ygyPYk0zu8g6o0q5fYD2WFhyIIB+08qAD9ViimaSnNE8
 ++cCtlKrLa+jCQZV33fjjdBPZTxk40ovY7NjlvRnaM6m5pyr1vzrnV4hjc53SsXr5GY+fayxcND
 GEptu3xbHKtr2XKy+rdEaVX88TNRhZcrTLDax9et24/035LTuXbqqMOOu7Cbt9tOjja7NBuWIs+
 Y8TnGbm4CfxwFGY8VytWnnElT4GgF9/CM+ZHoZJenJCHvBNvIL2Gwz0i9owTH13ExtJl6AJNb4b
 dB4t6RaFjwVzM7ygGtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150105
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103285-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34F63403D66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 3f5d5d73be5a..c4a3547a5c7f 100644
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


