Return-Path: <linux-arm-msm+bounces-118630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fnXhCXZ2VGoqmQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:24:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93134747406
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:24:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b7yh6r22;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PuoqASef;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118630-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118630-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 174563020100
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663993612F6;
	Mon, 13 Jul 2026 05:23:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758E4362120
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783920181; cv=none; b=JlmS9XzpzpkapkO+HYOS98f/InNxtgfdTE8PLcjVggk8yiEtfLkhDGQBhXcpvtubUXwRuxlW1e7ps9agVXVtb0HNcQ0p8SZqSt6vA7UIpG56/Yq3+o+EQwjyki+UxQwKumMtZrc3mlZ+BvQhuECzFr7tU33L7ruNYoaBCKht1MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783920181; c=relaxed/simple;
	bh=1p8eyVYqvTUCtkHLOSOqiEdeo0artqSRI8eZZupixSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BePB0CTVhRCTfGLS0SoxGSNwIBVoqzTzcXFhtPPkW3Uje563XNKuRqL1KoMgIEy/Vo3jwVxUihKeYx4j3xdy8MAxkeGnTZA8GskNjfSZgwF8MuRiX0EkQGyTTAtwSEqyn1OQP+CeTpV69SgvPKVIJCWYjcZLRsB7woii51DjFwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7yh6r22; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PuoqASef; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AG1b258208
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c9d7CVJRmBs
	yOeoXw/bOJwQIhib+0vGWqjM++PBSIfw=; b=b7yh6r22H73ACuW99iyBMt5S8k5
	jXvCMLGOf8TIuepMPttdj+llatHOzybtE0vIVSStc54uqqGTefnYVv4mLRXU71N4
	3xINTeEK0MboRg/Cu3T2Bbb9Y6kS7kRN50/xnI8xQCeUmthYs1ol+QVqozwg1U1O
	Q2vRHni8lASHBGslytHMbdFX6DIbcDfRCRGfV+rwGfT+D+I5RtK69tRzK/yCG8Dz
	++Y58jbbjxf1sbBCeZZpnWZzxr5wrxQB6eoCCLyoEx/89CkQPduEh5pbR/MyOnX1
	/Ft5ZeRudvZYTueKE/Zh4n0F0mNorEfkMS1lZ9nFo8CVgaByyX2QLaL3P5w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hmfbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84865f326efso2904169b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 22:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783920177; x=1784524977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c9d7CVJRmBsyOeoXw/bOJwQIhib+0vGWqjM++PBSIfw=;
        b=PuoqASefCA3mjUSgcGxcxklGBIQfdQt/qk4jVG7ZTVBjvQooUcnerlQD+V8wGbiRhB
         0C30oig6ILhgG5/ZXdDxwza/gIvZcyC2uaBIhDxXqDqr7mcmyORawsnVfGAVuccaIoEF
         IUe5x/H1hagf/QUD07u1OFyjH04XxziXNQmoCd+tG8cP5Kpmwf+BXSmq/OexHaRTr4M1
         KLHfw7oMzLbFKhbUfNdLIWuvVpsQ9DJyv5y/noCfroPNhnD2hXRJzr5CUauNXxqC5Xsr
         Aev6zrBDqSIqDVzRosIhBciVVn/Lmqpy0WAkhi6RlcHNumz8TZrUawm0MSMwbiKSIKVk
         k85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783920177; x=1784524977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c9d7CVJRmBsyOeoXw/bOJwQIhib+0vGWqjM++PBSIfw=;
        b=dWOUl5/vzieaEollRVG1nfs9jZKFdWVCLep22c4L+d/7LhboiIuhHb49kVsy51mSIp
         ZzRG2GEZTGhB1jTv58QlgTouq7JRvH7vYHqQxltj8RzQxy0py46bFNj5p5vwweSRMPiH
         vedjVIxbYJ3AhNffACEm98RCQX0jTe8BIuzuQ+zG35TawAzeapYsEb/AWZd8ajK2v7Ru
         aq08XXSC5371IArzsKGuTPHDDVfufvJbBNTmuptcygUrn40KrV/INPeEmcnCx8c1V+gM
         cjkrajUZyk0qDPl5i/Iub+6E47ZvyU2Ca3LBHtlbr+lzHuJ9FTKXgcb2Ip7m4xR1lMBo
         C0rQ==
X-Forwarded-Encrypted: i=1; AHgh+RprmcjcXXDaki8rrhfkXUCQ8L6XXRy3we2A7FA78GtVH00S3KXscE3pbtQbIzZhwA81Zp1CQmgN8HhEdM7u@vger.kernel.org
X-Gm-Message-State: AOJu0YydTYxzCJJGossTiOiDITMFZbE+EIkI9oDVwBB5brjwrnDkm87a
	i77lQxQS8TKMlNueR7dTLhxidWtV25HltYqom1aLi5IA1nPUdB8MkbIq9qUkOxh4AhcreN4xELx
	esi9ASgeYhpqr1ITEMFYQfIGlY+gU54++Zfmnn865nJWgEfrfQaoL9ZvKIlimyM/9yie2
X-Gm-Gg: AfdE7ckdWT4LDxblkhr1cARdXbNS/ih3f+w3Rx2INxnR0trq964UcVHXbENFepScop5
	ZRQJ9xgVl7BJi2McYrgA4NeQ33Oojzrz3s5yMWPdIV1utamprz2EJDJFpG5HYaywBX4eie0xu1X
	QAxKjhes994eymTJCIKFuCa06e/kUFRskcS2LX2QDn1aeW47/83Rj0Jx4OC9dmPy6F0vFl3y874
	pB76sstSfpXuR0chcGJNVDberqchoB58Uu8ka4JVXIzMFS/2cSGhr1vcNOu26fsOsIJyo8COcx4
	lzkengE+s6iFk7NOY+qKycSUXUlNqfF1NLjaaTppFNbem1czAFzZt+jC0gbFtIxxFFPMjqKNMhp
	a2CbrwI9q4kXbA83VAgQ50IvHW/U14qfEM2n5K6KHXeI=
X-Received: by 2002:a05:6a00:1402:b0:848:2f71:b654 with SMTP id d2e1a72fcca58-848897ac794mr6489238b3a.63.1783920176930;
        Sun, 12 Jul 2026 22:22:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:1402:b0:848:2f71:b654 with SMTP id d2e1a72fcca58-848897ac794mr6489216b3a.63.1783920176400;
        Sun, 12 Jul 2026 22:22:56 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca75ef0c30dsm6245605a12.17.2026.07.12.22.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:22:55 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v13 4/4] misc: fastrpc: Add polling mode support for fastRPC driver
Date: Mon, 13 Jul 2026 10:52:36 +0530
Message-Id: <20260713052236.3033744-5-ekansh.gupta@oss.qualcomm.com>
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
X-Proofpoint-GUID: 6Q96jV-1RXssErivgRzH4CnNlXIAWWsG
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a547632 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6cPVkdQNTzjcPQfNhwcA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 6Q96jV-1RXssErivgRzH4CnNlXIAWWsG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1MSBTYWx0ZWRfX08nc47FDGv+n
 WjUXIYYrUmUqAWE/wCm53PfGyS/D6p6fdypbMTC14mqPC6g77P2hHFvb2evqFyh4XePreqKIGdR
 oFNCr0DtbPHJHRY7oOatP6GzMHTpWx2yiyLjimA76/0IjIsgTN+ItokkDdwtfISRw7ncFzBqcmy
 M7crvWZ6ZevNU0Jw/AgdpphpmhY5weP17x3PFrxUKvHmN/Ohbi1Bk30gPsOgRIZ2psCfAfyUDAQ
 JfgbC2m/YhYjwXe1B2X8H9ySwjFGcqSOm5Rf4A1JWj/A7MpO1Zk1FdYo/4yGuKooZmG3pRqkvGp
 F6vExwnqA8ET6BWehNeOoNdM9EHXc8GvIc7oyzjajoOPkRUPzX+7ouQ81wtak0ulqQaAJHeZ3Hr
 oZAyogeBIgphGVRenoPg6fShqrQzlVvTDQoMS0Cjzb0ZcBV0yNz1tUBUBWYC6qgesUHkS36UwhT
 TA3sRBymd77aqupWHCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1MSBTYWx0ZWRfX2C7w4/M3XC5w
 brRJr00AcXP+XbneaVTYiE69d06UiGl3BHshlafZxDRD2R/XCQWZYtDAOgbvuOzsKk8KE0wL/s4
 tm8GKMF5WHveeT4zhl2Wjffdef1jPkk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130051
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
	TAGGED_FROM(0.00)[bounces-118630-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 93134747406

For any remote call to DSP, after sending an invocation message,
the fastRPC driver waits for a glink response, during which the CPU
can enter low power modes. This adds latency to the fastRPC call
due to CPU wakeup and scheduling overhead. Add polling mode support
where the fastRPC driver polls a shared memory location for
completion after sending the invocation, avoiding CPU wakeup and
scheduling latency and reducing fastRPC overhead. If the poll times
out, the call falls back to the normal interrupt/glink-based
completion path.

Poll mode is only applied to dynamic modules running in a user PD
(handle > FASTRPC_MAX_STATIC_HANDLE), since static/root-PD handles
are not expected to benefit from, or require, this optimization.
Support is advertised per SoC via fastrpc_soc_data, with a closed
exception list for older platforms whose DSP firmware is known to
support polling but which otherwise use the default soc_data.

Poll mode can be enabled by userspace via the FASTRPC_IOCTL_SET_OPTION
ioctl with the FASTRPC_POLL_MODE request id.

Since context IDs (ctxid) are allocated from a fixed-size, per-channel
cyclic IDR shared by all processes on a DSP, a context ID can be
recycled for a new request soon after it is freed. In poll mode the
context can be considered complete (and released) as soon as the poll
memory is updated, while the corresponding glink COMPLETE response
from the DSP may still be in flight. If that response arrives after
the ctxid has been reused, it would otherwise match the new context
and incorrectly signal completion for it while the DSP may still be
operating on the new context's buffers. To prevent this, embed a
monotonically increasing per-channel sequence number in the unused
upper bits of the ctxid/message context and validate it in the
rpmsg callback, dropping any response whose sequence number does not
match the current owner of that ctxid slot.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c      | 194 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |  29 ++++++
 2 files changed, 215 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 78bd5b8f67f8..94681394c1a0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -24,6 +24,8 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/bits.h>
 #include <linux/bitops.h>
+#include <linux/compiler.h>
+#include <linux/iopoll.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -38,7 +40,16 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
+/*
+ * Maximum handle value for static handles.
+ * Static handles are pre-defined, fixed numeric values statically assigned
+ * in the IDL file or FastRPC framework.
+ */
+#define FASTRPC_MAX_STATIC_HANDLE (20)
 #define FASTRPC_CTXID_MASK GENMASK(15, 8)
+/* Sequence number occupies bits 63:16 of the ctxid / message context */
+#define FASTRPC_CTXID_SEQ_SHIFT	16
+#define FASTRPC_CTXID_SEQ_MASK	GENMASK_ULL(63, 16)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -106,6 +117,12 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+/* Poll response number from remote processor for call completion */
+#define FASTRPC_POLL_RESPONSE (0xdecaf)
+
+/* Polling mode timeout limit */
+#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
+
 struct fastrpc_phy_page {
 	dma_addr_t addr;	/* dma address */
 	u64 size;		/* size of contiguous region */
@@ -236,8 +253,14 @@ struct fastrpc_invoke_ctx {
 	u32 sc;
 	u64 *fdlist;
 	u32 *crc;
+	/* Poll memory that DSP updates */
+	u32 *poll_addr;
 	u64 ctxid;
 	u64 msg_sz;
+	/* work done status flag */
+	bool is_work_done;
+	/* process updates poll memory instead of glink response */
+	bool is_polled;
 	struct kref refcount;
 	struct list_head node; /* list of ctxs */
 	struct completion work;
@@ -263,6 +286,7 @@ struct fastrpc_soc_data {
 	u32 sid_pos;
 	u32 dma_addr_bits_cdsp;
 	u32 dma_addr_bits_default;
+	bool poll_mode_supported;
 };
 
 struct fastrpc_channel_ctx {
@@ -285,6 +309,9 @@ struct fastrpc_channel_ctx {
 	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
+	bool poll_mode_supported;
+	/* Per-channel sequence counter; incremented on every context allocation */
+	atomic_t ctx_seq;
 	u64 dma_mask;
 	const struct fastrpc_soc_data *soc_data;
 };
@@ -308,6 +335,8 @@ struct fastrpc_user {
 	int client_id;
 	int pd;
 	bool is_secure_dev;
+	/* Flags poll mode state */
+	bool poll_mode;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -705,7 +734,9 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
+	ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret) |
+		     FIELD_PREP(FASTRPC_CTXID_SEQ_MASK,
+				(u64)atomic_inc_return(&cctx->ctx_seq));
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -970,7 +1001,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 		sizeof(struct fastrpc_invoke_buf) +
 		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
 		sizeof(u64) * FASTRPC_MAX_FDLIST +
-		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+		sizeof(u32) * FASTRPC_MAX_CRCLIST +
+		sizeof(u32);
 
 	return size;
 }
@@ -1066,6 +1098,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
+	ctx->poll_addr = (u32 *)((uintptr_t)ctx->fdlist + sizeof(u64) * FASTRPC_MAX_FDLIST +
+			     sizeof(u32) * FASTRPC_MAX_CRCLIST);
+
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1235,6 +1270,71 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
 }
 
+static u32 fastrpc_read_poll_addr(struct fastrpc_invoke_ctx *ctx)
+{
+	dma_rmb();
+	return READ_ONCE(*ctx->poll_addr);
+}
+
+static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
+{
+	u32 val;
+	int ret;
+
+	/*
+	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll_addr
+	 * or until another path marks the work done.
+	 */
+	ret = read_poll_timeout_atomic(fastrpc_read_poll_addr, val,
+				       (val == FASTRPC_POLL_RESPONSE) || ctx->is_work_done, 1,
+				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);
+
+	if (!ret && val == FASTRPC_POLL_RESPONSE) {
+		/*
+		 * DSP writes FASTRPC_POLL_RESPONSE to signal successful
+		 * completion via the poll path.
+		 */
+		ctx->is_work_done = true;
+		ctx->retval = 0;
+	}
+
+	if (ret == -ETIMEDOUT)
+		ret = -EIO;
+
+	return ret;
+}
+
+static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
+					    u32 kernel)
+{
+	int err = 0;
+
+	if (kernel) {
+		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
+			err = -ETIMEDOUT;
+	} else {
+		err = wait_for_completion_interruptible(&ctx->work);
+	}
+
+	return err;
+}
+
+static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
+				       u32 kernel)
+{
+	int err;
+
+	if (ctx->is_polled) {
+		err = poll_for_remote_response(ctx);
+		if (!err)
+			return 0;
+		/* If polling timed out or failed, move to normal response mode */
+		ctx->is_polled = false;
+	}
+
+	return fastrpc_wait_for_response(ctx, kernel);
+}
+
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   u32 handle, u32 sc,
 				   struct fastrpc_invoke_args *args)
@@ -1270,13 +1370,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
-	if (kernel) {
-		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
-			err = -ETIMEDOUT;
-	} else {
-		err = wait_for_completion_interruptible(&ctx->work);
-	}
+	/*
+	 * Set message context as polled if the call is for a user PD
+	 * dynamic module and user has enabled poll mode.
+	 */
+	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD && fl->poll_mode)
+		ctx->is_polled = true;
 
+	err = fastrpc_wait_for_completion(ctx, kernel);
 	if (err)
 		goto bail;
 
@@ -1842,6 +1943,35 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	return 0;
 }
 
+static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_ioctl_set_option opt = {0};
+	int i;
+
+	if (copy_from_user(&opt, argp, sizeof(opt)))
+		return -EFAULT;
+
+	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
+		if (opt.reserved[i] != 0)
+			return -EINVAL;
+	}
+
+	if (opt.request_id != FASTRPC_POLL_MODE)
+		return -EINVAL;
+
+	if (!fl->cctx->poll_mode_supported)
+		return -EOPNOTSUPP;
+
+	if (opt.value == FASTRPC_POLL_MODE_ENABLE)
+		fl->poll_mode = true;
+	else if (opt.value == FASTRPC_POLL_MODE_DISABLE)
+		fl->poll_mode = false;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
 static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_ioctl_capability cap = {0};
@@ -2203,6 +2333,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_MEM_UNMAP:
 		err = fastrpc_req_mem_unmap(fl, argp);
 		break;
+	case FASTRPC_IOCTL_SET_OPTION:
+		err = fastrpc_set_option(fl, argp);
+		break;
 	case FASTRPC_IOCTL_GET_DSP_INFO:
 		err = fastrpc_get_dsp_info(fl, argp);
 		break;
@@ -2359,6 +2492,7 @@ static const struct fastrpc_soc_data kaanapali_soc_data = {
 	.sid_pos = 56,
 	.dma_addr_bits_cdsp = 34,
 	.dma_addr_bits_default = 32,
+	.poll_mode_supported = true,
 };
 
 static const struct fastrpc_soc_data default_soc_data = {
@@ -2367,6 +2501,29 @@ static const struct fastrpc_soc_data default_soc_data = {
 	.dma_addr_bits_default = 32,
 };
 
+/*
+ * Exception list for older platforms that use default_soc_data but whose
+ * DSP firmware supports FastRPC polling mode.
+ *
+ * NOTE: This list is intentionally closed.
+ * Do NOT add new platforms here. New SoCs must advertise polling mode
+ * support via their soc_data.
+ */
+
+static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unused = {
+	{ .compatible = "qcom,milos" },
+	{ .compatible = "qcom,qcs8300" },
+	{ .compatible = "qcom,sa8775p" },
+	{ .compatible = "qcom,sar2130p" },
+	{ .compatible = "qcom,sm8450" },
+	{ .compatible = "qcom,sm8550" },
+	{ .compatible = "qcom,sm8650" },
+	{ .compatible = "qcom,sm8750" },
+	{ .compatible = "qcom,x1e80100" },
+	{ .compatible = "qcom,x1p42100" },
+	{},
+};
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2433,6 +2590,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
 	data->soc_data = soc_data;
+	data->poll_mode_supported = soc_data->poll_mode_supported ||
+		of_machine_get_match(fastrpc_poll_supported_machines);
 
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
@@ -2462,6 +2621,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	}
 
 	kref_init(&data->refcount);
+	atomic_set(&data->ctx_seq, 0);
 
 	rdev->dma_mask = &data->dma_mask;
 	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
@@ -2559,7 +2719,25 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 		return -ENOENT;
 	}
 
+	/*
+	 * Validate the sequence number embedded in the upper bits of the
+	 * context ID.  Under high concurrency the IDR slot can be recycled
+	 * for a new request before a late (or duplicate) glink COMPLETE
+	 * response for the previous request arrives.  Without this check the
+	 * driver would call complete() on the wrong context, waking a thread
+	 * whose buffers are still being accessed by the DSP.
+	 */
+	if (FIELD_GET(FASTRPC_CTXID_SEQ_MASK, rsp->ctx) !=
+	    FIELD_GET(FASTRPC_CTXID_SEQ_MASK, ctx->ctxid)) {
+		dev_dbg(&rpdev->dev,
+			"Stale glink response ctx 0x%llx (expected seq 0x%llx), dropping\n",
+			rsp->ctx,
+			FIELD_GET(FASTRPC_CTXID_SEQ_MASK, ctx->ctxid));
+		return 0;
+	}
+
 	ctx->retval = rsp->retval;
+	ctx->is_work_done = true;
 	complete(&ctx->work);
 
 	/*
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index c6e2925f47e6..ba1ea5ed426c 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -16,6 +16,7 @@
 #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
 #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
 #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
+#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
 #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
 
 /**
@@ -67,6 +68,28 @@ enum fastrpc_proc_attr {
 /* Fastrpc attribute for memory protection of buffers */
 #define FASTRPC_ATTR_SECUREMAP	(1)
 
+/**
+ * FASTRPC_POLL_MODE - Enable/disable poll mode for FastRPC invocations
+ *
+ * Poll mode is an optimization that allows the CPU to poll shared memory
+ * for completion instead of waiting for an interrupt-based response.
+ * This reduces latency for fast-completing operations.
+ *
+ * Restrictions:
+ * - Only supported for USER_PD (User Protection Domain)
+ * - Only applies to dynamic modules (handle > 20)
+ * - Static modules always use interrupt-based completion
+ *
+ * Values:
+ * - 0: Disable poll mode (use interrupt-based completion)
+ * - 1: Enable poll mode (poll shared memory for completion)
+ */
+#define FASTRPC_POLL_MODE	(1)
+
+/* Values for FASTRPC_POLL_MODE request */
+#define FASTRPC_POLL_MODE_DISABLE	0
+#define FASTRPC_POLL_MODE_ENABLE	1
+
 struct fastrpc_invoke_args {
 	__u64 ptr;
 	__u64 length;
@@ -133,6 +156,12 @@ struct fastrpc_mem_unmap {
 	__s32 reserved[5];
 };
 
+struct fastrpc_ioctl_set_option {
+	__u32 request_id;	/* Request type (e.g., FASTRPC_POLL_MODE) */
+	__u32 value;	/* Request-specific value */
+	__s32 reserved[6];
+};
+
 struct fastrpc_ioctl_capability {
 	__u32 unused; /* deprecated, ignored by the kernel */
 	__u32 attribute_id;
-- 
2.34.1


