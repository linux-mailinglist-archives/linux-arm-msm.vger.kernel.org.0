Return-Path: <linux-arm-msm+bounces-98010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBjGNqRPuGlHbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:44:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B45229F310
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B23273038A4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0713DEFFE;
	Mon, 16 Mar 2026 18:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgNVbvl9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SypG+PZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A253DF015
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686689; cv=none; b=N7/hemca/yu4chDDOkPgYLjobWucxlH3gPugmLuwKyq+zzOyQS+NlN+sj+18J+McqirEoRW2d5gn6J3cgFC3u9W5RwHpUrV4LWMeHzHyWHicxxL1EfBSQqBX8iwm9CoJ9AmCyvPL85Pu4GqIb2XWS4lPUIfaeagKoZBeJhLyqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686689; c=relaxed/simple;
	bh=jE4D1swpL8Um6LGyMEDXGN3uSXFJdqxsXdNj0I5lHtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MDLXvVLB/n1yXRTd4RCQpumTHuaqMGAQj404Fu4ND1fS5GkOytzJ/y+K6aVLFU4dqd7Nxq7EMt2T3nGzTgk5CL+P6OyKwLTQxOz1ygGK3daJpITWKbdepq5BQNS8vUxfYE+eKW0TyRbM5J2eixS9/n4cVSDJPK/DQ0Eu9sTsN1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgNVbvl9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SypG+PZO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GE83J42375064
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0ttFQZOfTjABcr/CRg+BE/xbEpdFtWOpPO3
	5ThpdIfs=; b=WgNVbvl9R/3IIJBd77oCtMTQp/ywFS2m0nIkqHvpJ4tuJ/lDwun
	Vfl2RqWP6pkpyhgW7bX2AekxSUJ0rtmUBbdt7hYHmvP7x+5muph49RvgUvqbYHyi
	DKf87yM/M6cMfCWxiFgkNU9S46jdeyTOWc7YYx/0JCiR5I8BzHvKk70zLi12zZn9
	uNeJM7Qmul4zw7C5mmJsbEP0C8BMhehTSKB/f3XDYO1TbALh03ydke2ijqCYAUUc
	/WBYMtq2mALi9o9QTxqvC7QxoHi9oWcLTkkVKbaHvdb8v/nlEzBjzCEwudCTiegz
	tbtPu8F/yCMQFTSsj2ta/7kNkXvjdnwYdSA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkby12tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 18:44:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7381a9a932so2787194a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773686687; x=1774291487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ttFQZOfTjABcr/CRg+BE/xbEpdFtWOpPO35ThpdIfs=;
        b=SypG+PZOWsiT0KxTaYHdRI4mmiAyxH+5vC8STPi5at+Az1+Ufs/ZYb/+rfx5K3Glbg
         dKwrLNQHsE11QoV1VkN5dni4FWDPQlfvoulUi1CAaIwmduynraCE+Iqg7YqKKo2EhsiA
         9L7MLHbmZsiVqvvfl9YHk8N4mvI5beJ0DChxpzc112hq99yZC2SlXZ3sHN9gP5DEmhOS
         drRlnhlU+VANnLeyQuODRdgSMBtwFEW0Kp3NYJOkAwuoX36ZYUezoYjGCumHP51cLbdP
         eyMLYmY9iE5yg2IOyAxKt1RIEdsTbAHv1pa+XsQkjYkXnfIpwzja90lSHp1biykL5FNg
         5Ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773686687; x=1774291487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ttFQZOfTjABcr/CRg+BE/xbEpdFtWOpPO35ThpdIfs=;
        b=ddIc0loxqdvJC9Z7TYPNCVKzB+cY7vvXbiup0qasmAnU8jRuVGv2Hsyu6lb7JOA/r+
         64M3peAEFoC379GL/xEln++/a6cJV8uj24kaIDLPZL2gpcEIyv/eDXxNUQL6vt3QcdWc
         VPVns+X07/Gn4cjoTAENGzBWEB2MShdSh4rU9WPyQCmD1eARd0K7qf8W6IXBWXO2r/PY
         oEiaCujsIUcQVeC3gb7AMQQJl5PLWfidlEkBE9iNSV0H8O8AWGc/egsP45WePuqozaNN
         Z5gFu3RsRxRJQSfyTntq+naCGbRoKQjnFTUVYM8RCEocsF2ak6Enq1o76APrsgkMVW/7
         xMIQ==
X-Gm-Message-State: AOJu0YwR+lVVchx7B4J+KEq2AQXHTG2r8L/9RzGYiCZ0kjX8CDvm+TmB
	qjthkINgAN/AAhNICTcpIU0r8n6pCeNj2YciKVHkcFYO4IA1mZQkXb6xmmzaZ0CybM+QGUmlNBo
	E/dnjvSsh1dUKXebLdjqRPMr7XXcshXIEqFyJzIJ1MuiIpnQwxKXjINF7Bp9lgTN4VpZcWvVb7S
	i3
X-Gm-Gg: ATEYQzwIUhV8ssU5W2g/6Nc3PcXWgPLdWKyp+bzIOQ9hxxx4vlbCxTyEzzgGtGsLg6q
	EOWFPYbpK7yVJy8g5Mm7mTk/VfPYPCxOj4p7QsB00LbhdgiDYG/rwRCV6r0D0dilY0iqFvuAeoN
	/FDqS2OL8HpiRV0kt590cblqvtgAeb/L5Gtxx5Ok2ag6RZ3nT6whzRbyfNV9dACFBTPe1J3Pakw
	t9MSKjlPoQVXqqSXcMluOP6t2AGoOvf3uJt9YWTAUqlUF/SeQ1pEl3Cfg35vmDJV6qDQ8qUTMsd
	sfuyHziOfYLY1yn0xfjQHzOkbXlq2uNL1xjLvNKbQ6GVgDJuFKfUZFo0UtPu/NxnZnhyHa62YhK
	N7LPkvi0BqFRXxZtyBf0Mrw+aZrPR0kkC
X-Received: by 2002:a05:6a21:2c11:b0:398:80dd:5705 with SMTP id adf61e73a8af0-398eccf385amr12697692637.46.1773686687020;
        Mon, 16 Mar 2026 11:44:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:2c11:b0:398:80dd:5705 with SMTP id adf61e73a8af0-398eccf385amr12697675637.46.1773686686581;
        Mon, 16 Mar 2026 11:44:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73fc935ad4sm5615135a12.2.2026.03.16.11.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:44:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/vma: Avoid lock in VM_BIND fence signaling path
Date: Mon, 16 Mar 2026 11:44:42 -0700
Message-ID: <20260316184442.673558-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iaZaW5qrkeUuKM7g7OYz2Cf9hDGHQ7rD
X-Proofpoint-ORIG-GUID: iaZaW5qrkeUuKM7g7OYz2Cf9hDGHQ7rD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE0OCBTYWx0ZWRfX7yb8fwmrjhWN
 oKGmJ3B+J2ji2agv/eYbsDat4gXKE4kiDIgxKF5Ewi0kBp/rF/zWy8D3D704xbAMJo/vbMgBqJL
 sc7yXPRZuiqobLZcj/MYjToIJxWPbZs4MKgVK6KqqnTqNtwUkGkq21cPRMkn2Jm+/Xi/83DbLGV
 j/DGsXznTCVGY3mlfNHFJKC0qGdslnBn/brzfBtgy7eI3CFits8P6fm1OXoG73uf2RFjzB6RZ1C
 ZveeBbBuLcCXcwyOmR/ttQ+X+eTesM82Uu+R8FM4OE6l98K1t5OvnRE7thr8lWxDpTZ/UYetGmS
 BhkbXcUTnoD8wbTU3WRbaxRbuUvr7UjBoZUm4wIGeawy1uj6h2f8eqSIe4NkUH7mUE4Y+PxRyCh
 jMGtEPBdD2H64L2Dfb8jy2qeJ24PHLWEm6CS5EEMVwTvtGsKn4MvcfWpmCfBkQQP5/6vIJfZsKR
 zG4/N+OKE2EXEYkcvpw==
X-Authority-Analysis: v=2.4 cv=ZpLg6t7G c=1 sm=1 tr=0 ts=69b84f9f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=BjPo030qj9DsFgYBbnAA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160148
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-98010-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B45229F310
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use msm_gem_unpin_active(), similar to what is used in the GEM_SUBMIT
path.  This avoids needing to hold the obj lock, and the end result is
the same.  (As with GEM_SUBMIT, we know the fence isn't signaled yet.)

Reported-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 3 +++
 drivers/gpu/drm/msm/msm_gem_vma.c | 9 ++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index da74f1413f94..74636646d80e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -507,8 +507,11 @@ void msm_gem_unpin_locked(struct drm_gem_object *obj)
  */
 void msm_gem_unpin_active(struct drm_gem_object *obj)
 {
+	struct msm_drm_private *priv = obj->dev->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
+	GEM_WARN_ON(!mutex_is_locked(&priv->lru.lock));
+
 	msm_obj->pin_count--;
 	GEM_WARN_ON(msm_obj->pin_count < 0);
 	update_lru_active(obj);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 3a6c435d5105..1c6b0920c0d8 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -696,6 +696,7 @@ static struct dma_fence *
 msm_vma_job_run(struct drm_sched_job *_job)
 {
 	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
+	struct msm_drm_private *priv = job->vm->drm->dev_private;
 	struct msm_gem_vm *vm = to_msm_vm(job->vm);
 	struct drm_gem_object *obj;
 	int ret = vm->unusable ? -EINVAL : 0;
@@ -738,12 +739,14 @@ msm_vma_job_run(struct drm_sched_job *_job)
 	if (ret)
 		msm_gem_vm_unusable(job->vm);
 
+	mutex_lock(&priv->lru.lock);
+
 	job_foreach_bo (obj, job) {
-		msm_gem_lock(obj);
-		msm_gem_unpin_locked(obj);
-		msm_gem_unlock(obj);
+		msm_gem_unpin_active(obj);
 	}
 
+	mutex_unlock(&priv->lru.lock);
+
 	/* VM_BIND ops are synchronous, so no fence to wait on: */
 	return NULL;
 }
-- 
2.53.0


