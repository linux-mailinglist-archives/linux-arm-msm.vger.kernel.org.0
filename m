Return-Path: <linux-arm-msm+bounces-113716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g+V2DIDBM2o8FwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:59:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A70AC69F0C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:59:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QuDHZAuY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UksimSpb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113716-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113716-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2040630416EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C920F3E075C;
	Thu, 18 Jun 2026 09:51:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8BC3BF69D
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:51:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776292; cv=none; b=QBozrIupdVR1EbOq4ogauTTyqfRFd920aSa0bOXc6C0MsO3c9ywXxrOnzplM0Ew5+vo9TGYxr2PbsOMm8D5NBm3Tanp4Ys5DZbMNiY0tB1OurtPYO+NIWWJh456/Tin0TD2jxKGssZTIeCJ/VoYBBPI5Qi6WiC8e+35mzTTSqsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776292; c=relaxed/simple;
	bh=Lhk+wqCmn/ipibFL6VoRoGlLTszsCZZNLlvTSevmw3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RqQRIo/5VSOmNAnMcjt2cH8KI9AB7fRVk51JRMSj/DPMXdZmpCBvJMBOm1WOCTSZLsRBkCluWdaGR82zT+ppYq6NrOexYC2Yg759MBzQHXiI88A1taYZeHxUzR3DXkZIzZuNs16sFgOhLZ9RQuOHd4tSUltrXe3I6xlsd6anxCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QuDHZAuY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UksimSpb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Dksp667665
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b8NCvzGF3XF3GM7U4sZSXs
	LifZwFKnI0trHh5fGvjOA=; b=QuDHZAuYZfY34qaFOCpR6diZwQpkdNZI34S/bc
	SDswjGC8iM4fp/1ZeIoFEapwfjsij/v7jAIPKq9mtDLP2Vzw5UYmOps5OUHxhzuu
	jCJk+D86GCMRWiLgUWKP+EvJ6QDFbR3qUG9h/Wc4v5x+p0ZGnUXQbynng9SHOEye
	PvZUsWkUEbg/h6SH34PqNsmSBJIlnaTBdUsFL7wCdCDyMZR6pO7dQlWWjgm5a2ij
	WRH7y/YuFB8cJ3vv4NDavTC6qMXRKhVh6IjgmGyVK/35BiXirHQjbpJzv7PnXMYT
	XKcXeXLM29XWCqKeifLzj2Q1hQ3/yqvFP0jbEz/cjCj84Nxw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vm2vn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:51:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32faa62so18585805ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781776290; x=1782381090; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b8NCvzGF3XF3GM7U4sZSXsLifZwFKnI0trHh5fGvjOA=;
        b=UksimSpbsHgtCdh2yfMZF6/8GMFZTx45bo2YVJDEx8UtuLetCzxK9NOmSQyuwO9obB
         hJUL179N8L5lYv/Fmp6QnBRpL/YlfDmBlmaJ+A2SWRpnX6FJfovUf2NyShN8GvxgVj+L
         KP2yCsPVlshyvCuSK5deZHm1tjR6Cw1hzTW+ekmcmDHkkIqdDUx6ZU3UJ8dtMOoaznIT
         f7nAk0TBuIwcPNnKHeTT4zl+DT1lc4Y4WiGIRHBBnwLTVy6/q1lxfVzHFTuCxYqYnsg9
         DQ2W4mYHPJyRxtismTrVNvzMEx48sW38bG7SDV5UXNsLjkAlBnutZZRyHXsEO+u33JRp
         HS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781776290; x=1782381090;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8NCvzGF3XF3GM7U4sZSXsLifZwFKnI0trHh5fGvjOA=;
        b=JWMeDBYVbHdHSONliZAOmW+4LZoxTLuvfsPi1Nz1InjB+8NJDlbzYBhmEfVKcZAQ0F
         wIYgSgZyQaV6y2chw7mYE5pxaFFU/qQV86EpABsL5gce9D8NArX/eyj5xOFAhOuMcloA
         Yw26M9k1undfAOvA3eekiDNK0M+tsFr3yu/jcj9y+aJtJTutJYT94b7irK/rduWc52FE
         4xDaZ1V7pzrymm78+FvPb/q83KcCPVmQ4pF3tMj0TwzHMVW0KvSdrxkjeQwJ0sXBLBaq
         8Jb6nHUgENszQV+Ztezo3Yc3RDunqBo0dS97R99mA4iOtIBtRumilqbUwm0pEGWF4Fkl
         9Ciw==
X-Gm-Message-State: AOJu0YyGMhf+9UWlL4++V7GfNrQgbY2KOe6shFqGPqxgYUGMLJ4dhbQ7
	yyBgSjPtvpuLZS44soRqHmM/iaw2KsWqVRAUcXEiBiObVodF/KbG24ySPJfvTefrHJ6noyF7Kky
	qozCNmH6b6pvCR/5LNZ0sHpjoM7/6htSG0PVgnY06mbj1ycNpSclCNbD6Bv40vKDs7GBvfwzjdY
	K8
X-Gm-Gg: AfdE7clry/iLWnNTNbIzSAjSWgzJE0xLJoNFjFuLoxSTGFNl+P2I0pjYWs7drGd6eIE
	l6D6ob1ahnACj7y2AeS0rosnmfhOtG5v/oi54GJjKo0XTfUqojH51tjrIJZAU4NfgA6SxRUD+bS
	GE1tFOFdf7PaCM5xO+orudO8rlN0fpFOWP+Lkox13m3gNenbzeDqJAt0SECOsD7HZq7Bxw3rryu
	eC+uhqGCjf2KhicfF8vnO7RPT170MwmvhzmIHUCZWQdqUPUL/nfCOEihPhac0i3cAdfaxbiB37k
	HvHbMpONshyz5zqMhoalFx+kvQevOYyVPfGB7ShjUffq6D9EKkZv/rVt8jXM1IZBtAvElQrvIXk
	TeE7tfJNWU481bHSFZKIR
X-Received: by 2002:a17:902:d4c6:b0:2c6:a97e:1c24 with SMTP id d9443c01a7336-2c6bbf8dc65mr77371445ad.7.1781776289663;
        Thu, 18 Jun 2026 02:51:29 -0700 (PDT)
X-Received: by 2002:a17:902:d4c6:b0:2c6:a97e:1c24 with SMTP id d9443c01a7336-2c6bbf8dc65mr77371145ad.7.1781776289219;
        Thu, 18 Jun 2026 02:51:29 -0700 (PDT)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433078264sm190231805ad.65.2026.06.18.02.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 02:51:28 -0700 (PDT)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:21:21 +0530
Subject: [PATCH] misc: fastrpc: map ADSP remote heap into remoteproc IOMMU
 domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-audio_fix_clean_v3-v1-1-ec1ee66fe455@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJi/M2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0ML3cTSlMz8+LTMivjknNTEvPgyY13LlDQzA3NTEzMDS1MloMaColS
 gPNjQ6FgIv7g0KSs1uQRkklJtLQByNSbwdgAAAA==
X-Change-ID: 20260618-audio_fix_clean_v3-9df607546095
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5MSBTYWx0ZWRfX5gvh97KJX4Dr
 twkrEZHuXlt/o2dwMB5pduUxPJONcy6AV7NsfYRONBRq59FU72B4Be/o7Ccw3YbspKO8sq5MBpE
 /y4AfjzrtdIgPpH4E7Gve++1su0aetDye5B32YHC/HrFXQaeJdk0vZ0f//46JjtaR2wi7BNy/q+
 Mg0aeNk8ssJPrs9X95qs8fWPP2kXMvxsS8122CcS8k3cBmWyS9bzoy+YShCkYTox9KzRaldHba0
 zbrKcQoLmsFC9q46Q78DkN9Wz6Q3TE9KSoevEmtVHpG+RaWJtFqP8aJwNAcb9NTfdGJKMgt44zL
 JMWcjL61RdirUq0MQS8JSPfRHXTnyrOi2ht1Tly79jtd4gUbCB1YICbSd0HwA1Ui+/cQf/eGp7o
 psvH00tnsZA0b8704h/HoCkvRJ8pZr5MbfSQd/Adc0M/02As3mSz3UuE/zvB/dJWXQL/A9rtWm1
 dJreO8atsy9D3oWpSVg==
X-Proofpoint-ORIG-GUID: 9gcYHcz1FZJXAtD9rx4xA_QZXM0RgAAs
X-Authority-Analysis: v=2.4 cv=UrRT8ewB c=1 sm=1 tr=0 ts=6a33bfa2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LsPkHLYD-RLW9ZWWSBUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 9gcYHcz1FZJXAtD9rx4xA_QZXM0RgAAs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5MSBTYWx0ZWRfXzmaZN44d7hXq
 ZOPDdPst3SHhuTWQcBAWC7WXZt5kit/RVFOO7Q9l/bBTcANdTC04oSVY+jUQVJAwMEiDASwY/Ye
 o64zJZAH4aECCDzZzdY2JVOpMtecEIg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113716-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:anandu.e@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A70AC69F0C2

On KVM-based targets the kernel runs at EL2 without a separate
hypervisor to manage inter-VM memory access control.  In this
configuration the remoteproc is assigned its own IOMMU domain, and
any memory carveout the DSP must access requires an explicit mapping
into that domain before the DSP can reach it.

The existing code calls qcom_scm_assign_mem() to transfer ownership
of the ADSP remote heap carveout from HLOS to the DSP VM.  This SCM
call is only meaningful when a separate hypervisor (e.g. Gunyah) is
present to enforce inter-VM memory access control.  On KVM-based
targets no such hypervisor exists, so the carveout must instead be
mapped into the remoteproc's IOMMU domain via an identity mapping
(IOVA == PA) using iommu_map().  Without this mapping the DSP
triggers an SMMU translation fault when accessing the remote heap
during audio PD static process creation.

Detect whether the remoteproc has an IOMMU by checking for the
"iommus" property on the remoteproc DT node and store the result in
a new has_iommu flag in fastrpc_channel_ctx.  When the flag is set,
map the carveout into the remoteproc's IOMMU domain instead of
calling qcom_scm_assign_mem().  Introduce fastrpc_remote_heap_map()
and fastrpc_remote_heap_unmap() helpers to encapsulate the IOMMU
domain lookup and map/unmap operations.

This change relies on the remote heap handling introduced in:
https://lore.kernel.org/r/20260609025938.457-1-jianping.li@oss.qualcomm.com

Link: https://lore.kernel.org/r/20260609025938.457-1-jianping.li@oss.qualcomm.com
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
This patch depends on:

  [PATCH v8 0/4] misc: fastrpc: Add missing bug fixes
  https://lore.kernel.org/r/20260609025938.457-1-jianping.li@oss.qualcomm.com

Please apply after that series.
---
 drivers/misc/fastrpc.c | 141 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 114 insertions(+), 27 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a5af901c1cb8..9ce7af2091f1 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
+#include <linux/iommu.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/bits.h>
 
@@ -285,6 +286,8 @@ struct fastrpc_channel_ctx {
 	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
+	/* set when remoteproc has an IOMMU; use iommu_map instead of hyp_assign */
+	bool has_iommu;
 	u64 dma_mask;
 	const struct fastrpc_soc_data *soc_data;
 };
@@ -2343,10 +2346,65 @@ static const struct fastrpc_soc_data default_soc_data = {
 	.dma_addr_bits_default = 32,
 };
 
+static int fastrpc_remote_heap_map(struct device *rdev,
+				   struct device_node *rproc_node,
+				   struct fastrpc_buf *heap)
+{
+	struct platform_device *rproc_pdev;
+	struct iommu_domain *domain;
+	int ret;
+
+	rproc_pdev = of_find_device_by_node(rproc_node);
+	if (!rproc_pdev) {
+		dev_err(rdev, "failed to find remoteproc platform device\n");
+		return -ENODEV;
+	}
+
+	domain = iommu_get_domain_for_dev(&rproc_pdev->dev);
+	if (!domain) {
+		put_device(&rproc_pdev->dev);
+		dev_err(rdev, "no IOMMU domain for remoteproc\n");
+		return -ENODEV;
+	}
+
+	ret = iommu_map(domain, heap->dma_addr, heap->dma_addr, heap->size,
+			IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
+	if (ret)
+		dev_err(rdev, "failed to map remote heap phys=0x%llx size=0x%llx err=%d\n",
+			heap->dma_addr, heap->size, ret);
+
+	put_device(&rproc_pdev->dev);
+	return ret;
+}
+
+static void fastrpc_remote_heap_unmap(struct rpmsg_device *rpdev,
+				      struct fastrpc_buf *heap)
+{
+	struct device_node *rproc_node;
+	struct platform_device *rproc_pdev;
+	struct iommu_domain *domain;
+
+	rproc_node = of_get_parent(of_get_parent(rpdev->dev.of_node));
+	if (!rproc_node)
+		return;
+
+	rproc_pdev = of_find_device_by_node(rproc_node);
+	of_node_put(rproc_node);
+	if (!rproc_pdev)
+		return;
+
+	domain = iommu_get_domain_for_dev(&rproc_pdev->dev);
+	if (domain)
+		iommu_unmap(domain, heap->dma_addr, heap->size);
+
+	put_device(&rproc_pdev->dev);
+}
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
 	struct fastrpc_channel_ctx *data;
+	struct device_node *rproc_node;
 	int i, err, domain_id = -1, vmcount;
 	const char *domain;
 	bool secure_dsp;
@@ -2390,9 +2448,12 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
+	rproc_node = of_get_parent(of_get_parent(rdev->of_node));
+	if (rproc_node)
+		data->has_iommu = of_property_present(rproc_node, "iommus");
+
 	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
 		struct resource res;
-		u64 src_perms;
 
 		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
 		if (!err) {
@@ -2401,21 +2462,41 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
 				if (!data->remote_heap) {
 					err = -ENOMEM;
-					goto err_free_data;
+					goto err_put_node;
 				}
 
 				data->remote_heap->dma_addr = res.start;
 				data->remote_heap->size = resource_size(&res);
+
+				if (data->has_iommu) {
+					err = fastrpc_remote_heap_map(rdev,
+								      rproc_node,
+								      data->remote_heap);
+					if (err) {
+						kfree(data->remote_heap);
+						data->remote_heap = NULL;
+						goto err_put_node;
+					}
+				}
 			}
-			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
-				    data->vmperms, data->vmcount);
-			if (err)
-				goto err_free_data;
+			if (!data->has_iommu) {
+				u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
+
+				err = qcom_scm_assign_mem(res.start,
+							  resource_size(&res),
+							  &src_perms,
+							  data->vmperms,
+							  data->vmcount);
+				if (err)
+					goto err_put_node;
+			}
 		}
 	}
 
+	of_node_put(rproc_node);
+	rproc_node = NULL;
+
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
 	data->soc_data = soc_data;
@@ -2471,6 +2552,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (data->secure_fdevice)
 		misc_deregister(&data->secure_fdevice->miscdev);
 
+err_put_node:
+	of_node_put(rproc_node);
+
 err_free_data:
 	kfree(data->remote_heap);
 	kfree(data);
@@ -2513,28 +2597,31 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 
-	if (cctx->remote_heap && cctx->vmcount) {
-		u64 src_perms = 0;
-		struct qcom_scm_vmperm dst_perms;
-
-		for (u32 i = 0; i < cctx->vmcount; i++)
-			src_perms |= BIT(cctx->vmperms[i].vmid);
-
-		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
-		dst_perms.perm = QCOM_SCM_PERM_RWX;
-
-		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
-					  cctx->remote_heap->size, &src_perms,
-					  &dst_perms, 1);
-		if (err)
-			dev_err(&rpdev->dev,
-				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
-				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
+	if (cctx->remote_heap) {
+		if (cctx->has_iommu) {
+			fastrpc_remote_heap_unmap(rpdev, cctx->remote_heap);
+			kfree(cctx->remote_heap);
+			cctx->remote_heap = NULL;
+		} else if (cctx->vmcount) {
+			u64 src_perms = 0;
+			struct qcom_scm_vmperm dst_perms;
+
+			for (u32 i = 0; i < cctx->vmcount; i++)
+				src_perms |= BIT(cctx->vmperms[i].vmid);
+
+			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+			dst_perms.perm = QCOM_SCM_PERM_RWX;
+
+			err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
+						  cctx->remote_heap->size,
+						  &src_perms, &dst_perms, 1);
+			if (!err) {
+				kfree(cctx->remote_heap);
+				cctx->remote_heap = NULL;
+			}
+		}
 	}
 
-	kfree(cctx->remote_heap);
-	cctx->remote_heap = NULL;
-
 	of_platform_depopulate(&rpdev->dev);
 
 	fastrpc_channel_ctx_put(cctx);

---
base-commit: f1256704b88067430e255e5c85d6b727e1bbb2ea
change-id: 20260618-audio_fix_clean_v3-9df607546095

Best regards,
--  
Anandu Krishnan E <anandu.e@oss.qualcomm.com>


