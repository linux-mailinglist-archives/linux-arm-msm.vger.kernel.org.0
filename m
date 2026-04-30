Return-Path: <linux-arm-msm+bounces-105426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLU0KBGx82mD6AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:44:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16F4A7724
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 785F830158B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6137379ED8;
	Thu, 30 Apr 2026 19:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EB4Rtu84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3642D47E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777578253; cv=none; b=Zz12JpXz/k1V8Yn/GSwo+yOZdOhIRvI3IoUELKE0WNGX6Z3fQFQlxNJM1YcKrvj4VTZKO1Myr7Ymv+z7UC9V9H82ELeOaePMQGtJMUC+HoSs0kw8z0deOls8T7qMV+FxAHPpkUXoF55y0kJPKW/QNTq6uziSWGVFllfG0UH5bew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777578253; c=relaxed/simple;
	bh=BSPa0jvQUZnRCrvByIbYgJeR4pZBA8vjxk0FJHsNeC4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SymGT5z3fow2OrfY/R1sqiZteeq2F5IkSxwqcFJs3wFOMadq20lri2JzRdqW3H7HJUzn9A0FAs19D51WZE+9Fizj14aa16oTguvJHVFlL7h0XAIdyEMVpjErbfznFuszJcCUGaf77j5yI2Nyu/lgV0/Qv/4vz6Dh6X0PijNV2Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EB4Rtu84; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UEkfnv2943404;
	Thu, 30 Apr 2026 19:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=d6xZ/RJXVkPnWH5zHkS1sMQayVQaeEuCRqx
	Mi6vHzoA=; b=EB4Rtu84jc1MXl8fx9eFRG+h25s8kRnsVSAaMBC8Cp1cUa3bhh7
	WtUMV3H0JO6x8Dzj2B2Gkb/1KDmEmN9u6Jr9OS/CYsz81WtN0T5xnSkf5fCdVhIZ
	ApeViVxcL3TsF+lFZqagPG0ubbyc43iskWJA0vXvPrkItirEw3rBGNHuNWr65pBx
	qFzOnpSG2uR/Sj50g2rH/rpPDPNiPXve0WpG7EvUAAh7GLMpmxMDxEeXfV3hgIis
	oJ8Ah7GtZnOmoZxdRkUFBxmx6cMWHShzmLvMO+kIqwlvhBN2wB/nVIcIPp2DeX/S
	oFKNNpZJ3Zfd08xohpG8LonEvT/lXsOS/0w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duyr4420a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 19:43:00 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63UJgxgK029682;
	Thu, 30 Apr 2026 19:42:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4du6eddvhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 19:42:59 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63UJgxX2029677;
	Thu, 30 Apr 2026 19:42:59 GMT
Received: from hu-devc-lv-u22-a.qualcomm.com (hu-zmckevit-lv.qualcomm.com [10.81.26.129])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 63UJgwLf029676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 19:42:59 +0000 (GMT)
Received: by hu-devc-lv-u22-a.qualcomm.com (Postfix, from userid 4696302)
	id E2F9F5C7; Thu, 30 Apr 2026 12:42:58 -0700 (PDT)
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
To: youssef.abdulrahman@oss.qualcomm.com, jeff.hugo@oss.qualcomm.com,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        Lukas Maar <lukas.maar@tugraz.at>
Subject: [PATCH v2] accel/qaic: Add overflow check to remap_pfn_range during mmap
Date: Thu, 30 Apr 2026 12:39:01 -0700
Message-Id: <20260430193858.1178641-1-zachary.mckevitt@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=bJcm5v+Z c=1 sm=1 tr=0 ts=69f3b0c4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=jH4uIxKMFi7FzrR_XaIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIwMyBTYWx0ZWRfXxVoLOOEKCdRk
 uSLgFxE7EanPvrZG8ckVh6yTw6LStONwr1kUphfO7TQK35mLDvOW/lqznYgZ0j6PnxdvaHUgZut
 a386UlsZV1gBWTOP7WfwTo3IhK783KaXw2fkV44zZQygfTvzey0ltPN9bskubtzxsRBRm4vjTtj
 M5qkLhu0i3QWagnuPTJ3oou+aLEZlXnwjDKs/MVuhbArek62v+J6GgQYvMwlplyw/nkDj9dYM5B
 HWsHYJ3iJNnbMETqwQ1cEMtIBvUribe3iEGFZ+pQ4XfZXWr+4HUiNo+h3yKO3BF9nNm72S/Flti
 +o/LsX2NUuW072PXw4pYrQVuznn5tQRrdzu7nA7b/pHtF6OoE3I5NnDDgi/m6bn9HKY3vcdK1ur
 UkBlRCjTN7LrlyeGkJI5lN6HUttw6JBXmRnAw32sbJE+AyhEpxfY9p3EJzrPp0o1j8JNKppCGBW
 5Wi1W8M4eOepkuZRn5g==
X-Proofpoint-GUID: IdkLFVfW5nbfL2f7nM_NwNj7gBkWMTZq
X-Proofpoint-ORIG-GUID: IdkLFVfW5nbfL2f7nM_NwNj7gBkWMTZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300203
X-Rspamd-Queue-Id: 1B16F4A7724
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105426-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zachary.mckevitt@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

The call to remap_pfn_range in qaic_gem_object_mmap is susceptible to
(re)mapping beyond the VMA if the BO is too large. This can cause use
after free issues when munmap() unmaps only the VMA region and not the
additional mappings. To prevent this, check the remaining size of the
VMA before remapping and truncate the remapped length if sg->length is
too large.

Reported-by: Lukas Maar <lukas.maar@tugraz.at>
Fixes: ff13be830333 ("accel/qaic: Add datapath")
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
---
Changes in v2:
- Use check_sub_overflow to check if vma->vm_end - remap_start goes negative.
- Check if remap_end is strictly greater than vma->vm_end (rather than greater
  than or equal to) when deciding to truncate length.
- Link to v1: https://lore.kernel.org/all/20260423204412.2861046-1-zachary.mckevitt@oss.qualcomm.com/

 drivers/accel/qaic/qaic_data.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 95300c2f7d8a..642b6ae9edfa 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -606,8 +606,11 @@ static const struct vm_operations_struct drm_vm_ops = {
 static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
 	struct qaic_bo *bo = to_qaic_bo(obj);
+	unsigned long remap_start;
 	unsigned long offset = 0;
+	unsigned long remap_end;
 	struct scatterlist *sg;
+	unsigned long length;
 	int ret = 0;
 
 	if (drm_gem_is_imported(obj))
@@ -615,11 +618,26 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 
 	for (sg = bo->sgt->sgl; sg; sg = sg_next(sg)) {
 		if (sg_page(sg)) {
+			/* if sg is too large for the VMA, so truncate it to fit */
+			if (check_add_overflow(vma->vm_start, offset, &remap_start))
+				return -EINVAL;
+			if (check_add_overflow(remap_start, sg->length, &remap_end))
+				return -EINVAL;
+
+			if (remap_end > vma->vm_end) {
+				if (check_sub_overflow(vma->vm_end, remap_start, &length))
+					return -EINVAL;
+			} else
+				length = sg->length;
+
+			if (length == 0)
+				goto out;
+
 			ret = remap_pfn_range(vma, vma->vm_start + offset, page_to_pfn(sg_page(sg)),
-					      sg->length, vma->vm_page_prot);
+					      length, vma->vm_page_prot);
 			if (ret)
 				goto out;
-			offset += sg->length;
+			offset += length;
 		}
 	}
 
-- 
2.34.1


