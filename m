Return-Path: <linux-arm-msm+bounces-117771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t0MWCYR8TmrmNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:36:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E3728C77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:36:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JFPsZbk1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ayH1O133;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117771-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117771-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13CD930DD121
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 16:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B2B36F8FB;
	Wed,  8 Jul 2026 16:12:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117AB439356
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 16:12:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527155; cv=none; b=XniY29Id8fiMmoV5VD3NYdCzw39yNyrOEZpYpWaoFlPglCVNDG69EHlk0/joEdF7l2PmcBtRZP8j8AK/rqTIB4GJZFtnSWFJTh4Fdt76x34h7TVEdbL+dudBexjhx8F5f6lo9bPdLDPtrODC+qganf/KnwRrxP3/O8TNGPS+o7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527155; c=relaxed/simple;
	bh=+tXz5yz/BOgGJ0WHeriv1sPGWRXmchF8dFL04nWOKV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNP12vg/jGrR8EnWp98/nN/XWeEu9+aCEROHPIwvFuFehJHxcQ4XqHki9S4QrpiJom75c0PEYKAckD1GJNtEaY69L+SVcr9HSv0tqmeng0bVkT9a4K09tjDgAPHYzdwl6TYYS1QtCOpZY5BoTAhroL2fIB2sRrb0BWaUCfqJlf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFPsZbk1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayH1O133; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668G34t23213285
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 16:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Br03ngdQOh
	p4qWvZC4lrt6hROOBO1XKAnkTgjwsB3M=; b=JFPsZbk1p2iiazqNg1aWkBMYLW/
	0GVZ7jHodQP5J0O8ibac5gwCzsb/7I56yq/x57JJKDZ0SpgKcfKGJ0D6Ux45SjY0
	HbMLrLLFIjSqolr8iFyNS1jVFt7NQqyg63SzRsOxMe1GvJzphnLIBcmC9v1m59BS
	p58H2ZwGsk41vv/x8I6H7x1n+0Lsc4Q+pr1XW5vnu2iqVKahY9Odo6j+x8dYQDkM
	qBel4p1hC/erfPuuaRuCcBpUIIUJffc7lw43O43U+v2+q9wrVamk9L4LiC7zRhCd
	10j9V3W/sxsQj0PtvDRSnVCVZKjDeLaPWOyZYJgoZ+JqoDd8qil3ZDRyztw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqw81qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 16:12:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so17574515ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783527152; x=1784131952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Br03ngdQOhp4qWvZC4lrt6hROOBO1XKAnkTgjwsB3M=;
        b=ayH1O133orq7NcODiaLns0R2XpijBkfL+2xDkSkDKBbLK7KkTuD5cqzP5LWXCR+ZM8
         YhJihAwISe6jiQfROh5NtqLMi1mdWo3k9tcqOmgFycQM/hN572LDhcjhre7KsJGkhXP8
         cMky6M08PhXZ2eTnDcENUgjvcD7Yl19O9NsU1Ay9pyv5CCGEfE0Ok4gSncaYm8E6jkpl
         vDg5NyHe5WegUCoW7BC+CfX9eJfMzGilOLbVY6U5FR5ApERNRhw9uOWYQbTKXlcc8htJ
         uE/hhGKBurqso1rqPIch0cu4EUf1hZ6/aYfy+zcI9GyRhfTCS1vKAZ42fLMDoLPwupbY
         yJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527152; x=1784131952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Br03ngdQOhp4qWvZC4lrt6hROOBO1XKAnkTgjwsB3M=;
        b=kh+nYNqnCyTJpsV8x2+Ie9Z6sIBMG8a9XI3SCIssgkmEffxwYQ5PBzOw+/S4ih4MdM
         pfnI4Ejl2xbUmJFl92tINMLrTzkgIWah6gjboSiNuaKFXT1dSiUfoiKf+zpHorlIghxU
         mn653TbbPKOL3cOXwCKMLvREunqLjbMOtqCxCOKGpXa6kbNNiBIYS4Ccnu+Z4ETDyF8X
         GUGRk7BZwFXFDr/yNderXtIjfyMR8moh0jzy6mGcThpwFKfODuecWyRGehoVQcB/cGCr
         LjFIeSi4Z45/OCpAg/IgVMk0MqZe+IDhHPBoDRb6Sar15Y3lSm4Fk0tmS2sbaz4LlPLW
         fj1A==
X-Forwarded-Encrypted: i=1; AHgh+RoYoH0p7hu9b+o1UdsaHTzvxN2x6FgNRUMXkNJhh036IFH9Q5ke3gocTy9qgRaAdh0fFhPZaHS6WpZ1dJUG@vger.kernel.org
X-Gm-Message-State: AOJu0YzKNh8MCpPlz2RzK2eCw0vSFL4pfJKhCivu9nwfEdl6waFK7jo0
	sV0LvFFqiE6C/CDLqghgrZZhzsM5KC0url35ffMepaAyTj9uWok91ot8BA0XxAR0tf4AtheUehf
	sb81DIbq+lnGLHcElSdp9zW1/kJeQ7y6dtWMJ8ICPTE5aX3xYSZ5PHQGQlMlsaZ2GEhGf
X-Gm-Gg: AfdE7cn3j4GOsVnvK+pTfXcWna3opplpItQK0G81LRAHXc+5fJozTSLrW5QlXIlSegd
	p25DgrlVsuSQvcL5PG5lZcW/MTF7kemWb89YV+jhBVDneHRcn2UiJxMTc9k/3h9HZPrJMdbVikA
	zd4QHVwTHPRizadZ0q1KG91ZvpdoxbhqJft6I8daLcFArWgPJebV7ljCOkMBJ+ylxWIbBYwOPiI
	ds/ia0CsA9sRgtGUHzlECuteKLAuF4Ebkp4HdSuPQr1Pb5tLfsPaKuCn3KkZIIXEsuLYPOo4HSm
	4cml9Xk2IIQWu5YuoyKOUKk9AcLyFW0fDfB08+5CG8N6Mlje5oRiGpHN/q6yz2G+9WnKQyws2Ml
	70RRRzsiFS2xNC5l18VFWc5f5DskhxUo5Qrm5ENZLPBwFTKdSk4If3J151Q==
X-Received: by 2002:a17:903:41d1:b0:2ca:f425:4d44 with SMTP id d9443c01a7336-2ccea36913fmr31545415ad.4.1783527151720;
        Wed, 08 Jul 2026 09:12:31 -0700 (PDT)
X-Received: by 2002:a17:903:41d1:b0:2ca:f425:4d44 with SMTP id d9443c01a7336-2ccea36913fmr31544945ad.4.1783527151106;
        Wed, 08 Jul 2026 09:12:31 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm30704985ad.0.2026.07.08.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:12:30 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH v2 1/2] drm-uapi: Sync msm_drm.h
Date: Wed,  8 Jul 2026 09:12:23 -0700
Message-ID: <20260708161224.507091-2-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708161224.507091-1-rob.clark@oss.qualcomm.com>
References: <20260708161224.507091-1-rob.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1OCBTYWx0ZWRfXzgn+SSnSNGW4
 iGPu3wJaF8JY34AEeUaO12l+xcwqDSvflXAyNjSkiqe7myb2kdZ6WJn7PDSCej1CGIk3e+ccrvH
 CyN4eJ39/lFbUoxTKDZzQbbPxeCsHjXssDYdm/A/IGopx1HP/owuM+22lQCOto1CW4D+REBb5LQ
 3yY5Nqgdv0Kah2f3NQ40WAA3TqPVWxoyhoDBX1z/DJYFktZKhtwAyaRSzjOkrP30mWvZyVOsg3M
 husDKAdlrIlkMYA2mFPQa93dAx7penchTugnrB9pKqBqSlr26takGyZGD6goZBBZufie/BfXthI
 bDMPvi1ZGLLKM4AfimvhD08R1R9dfRkl6UgMi3utMB+5iFxw3MEhIseZvu4I+CGVOtxjSRsgn3W
 XQqZaJdDZMLoD9FR1Ei9eK1G8ucm1ZwK+dNnODKn/fjHnfKm4SA0i6zIzJ3y2G54kTT5xNvq43N
 ZgVOh7OWq22gX5HS8xA==
X-Proofpoint-GUID: hILkTcPYZNzAGtMswuE7uAYnVgU5ODjc
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4e76f0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=Nei9H0Qy7Mr5T7KAPYEA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: hILkTcPYZNzAGtMswuE7uAYnVgU5ODjc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1OCBTYWx0ZWRfX685ZFFnlZfLV
 wa2NeKF5vwBWOE45E7r/ivJNZr43W23qROGRo5SjDG4ByDCWKuB/rBdKOnK6mZDSF+ivqG09Ypa
 rFhHO9PQn9AVbJqcGnwPq0kfqmXSN2o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1011 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080158
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117771-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:igt-dev@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:rob.clark@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A3E3728C77

Pull in updated UABI header with PERFCNTR_CONFIG ioctl.  Sync with:

   commit 44c460d2cc8b87c08360fe60f861660c8045ef90
   Merge: 9bb8af2770b7 9a967125427e
   Author: Dave Airlie <airlied@redhat.com>

       Merge tag 'drm-msm-next-2026-05-30' of https://gitlab.freedesktop.org/drm/msm into drm-next

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41158>
---
 include/drm-uapi/msm_drm.h | 204 ++++++++++++++++++++++++++++++++++---
 1 file changed, 188 insertions(+), 16 deletions(-)

diff --git a/include/drm-uapi/msm_drm.h b/include/drm-uapi/msm_drm.h
index 2377147b6af0..7f2e594be4eb 100644
--- a/include/drm-uapi/msm_drm.h
+++ b/include/drm-uapi/msm_drm.h
@@ -90,6 +90,34 @@ struct drm_msm_timespec {
 #define MSM_PARAM_RAYTRACING 0x11 /* RO */
 #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
 #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
+#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
+/* PRR (Partially Resident Region) is required for sparse residency: */
+#define MSM_PARAM_HAS_PRR    0x15  /* RO */
+/* MSM_PARAM_EN_VM_BIND is set to 1 to enable VM_BIND ops.
+ *
+ * With VM_BIND enabled, userspace is required to allocate iova and use the
+ * VM_BIND ops for map/unmap ioctls.  MSM_INFO_SET_IOVA and MSM_INFO_GET_IOVA
+ * will be rejected.  (The latter does not have a sensible meaning when a BO
+ * can have multiple and/or partial mappings.)
+ *
+ * With VM_BIND enabled, userspace does not include a submit_bo table in the
+ * SUBMIT ioctl (this will be rejected), the resident set is determined by
+ * the the VM_BIND ops.
+ *
+ * Enabling VM_BIND will fail on devices which do not have per-process pgtables.
+ * And it is not allowed to disable VM_BIND once it has been enabled.
+ *
+ * Enabling VM_BIND should be done (attempted) prior to allocating any BOs or
+ * submitqueues of type MSM_SUBMITQUEUE_VM_BIND.
+ *
+ * Relatedly, when VM_BIND mode is enabled, the kernel will not try to recover
+ * from GPU faults or failed async VM_BIND ops, in particular because it is
+ * difficult to communicate to userspace which op failed so that userspace
+ * could rewind and try again.  When the VM is marked unusable, the SUBMIT
+ * ioctl will throw -EPIPE.
+ */
+#define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
+#define MSM_PARAM_AQE	     0x17  /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
@@ -113,6 +141,19 @@ struct drm_msm_param {
 
 #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
 #define MSM_BO_GPU_READONLY  0x00000002
+/* Private buffers do not need to be explicitly listed in the SUBMIT
+ * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
+ * buffers may NOT be imported/exported or used for scanout (or any
+ * other situation where buffers can be indefinitely pinned, but
+ * cases other than scanout are all kernel owned BOs which are not
+ * visible to userspace).
+ *
+ * In exchange for those constraints, all private BOs associated with
+ * a single context (drm_file) share a single dma_resv, and if there
+ * has been no eviction since the last submit, there are no per-BO
+ * bookeeping to do, significantly cutting the SUBMIT overhead.
+ */
+#define MSM_BO_NO_SHARE      0x00000004
 #define MSM_BO_CACHE_MASK    0x000f0000
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
@@ -122,6 +163,7 @@ struct drm_msm_param {
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
+                              MSM_BO_NO_SHARE | \
                               MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
@@ -179,6 +221,17 @@ struct drm_msm_gem_cpu_fini {
  * Cmdstream Submission:
  */
 
+#define MSM_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
+#define MSM_SYNCOBJ_FLAGS ( \
+		MSM_SYNCOBJ_RESET | \
+		0)
+
+struct drm_msm_syncobj {
+	__u32 handle;     /* in, syncobj handle. */
+	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
+	__u64 point;      /* in, timepoint for timeline syncobjs. */
+};
+
 /* The value written into the cmdstream is logically:
  *
  *   ((relocbuf->gpuaddr + reloc_offset) << shift) | or
@@ -220,7 +273,10 @@ struct drm_msm_gem_submit_cmd {
 	__u32 size;           /* in, cmdstream size */
 	__u32 pad;
 	__u32 nr_relocs;      /* in, number of submit_reloc's */
-	__u64 relocs;         /* in, ptr to array of submit_reloc's */
+	union {
+		__u64 relocs; /* in, ptr to array of submit_reloc's */
+		__u64 iova;   /* cmdstream address (for VM_BIND contexts) */
+	};
 };
 
 /* Each buffer referenced elsewhere in the cmdstream submit (ie. the
@@ -268,17 +324,6 @@ struct drm_msm_gem_submit_bo {
 		MSM_SUBMIT_FENCE_SN_IN   | \
 		0)
 
-#define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
-#define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
-		MSM_SUBMIT_SYNCOBJ_RESET | \
-		0)
-
-struct drm_msm_gem_submit_syncobj {
-	__u32 handle;     /* in, syncobj handle. */
-	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
-	__u64 point;      /* in, timepoint for timeline syncobjs. */
-};
-
 /* Each cmdstream submit consists of a table of buffers involved, and
  * one or more cmdstream buffers.  This allows for conditional execution
  * (context-restore), and IB buffers needed for per tile/bin draw cmds.
@@ -292,13 +337,80 @@ struct drm_msm_gem_submit {
 	__u64 cmds;           /* in, ptr to array of submit_cmd's */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
 	__u32 queueid;        /* in, submitqueue id */
-	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_gem_submit_syncobj */
-	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_gem_submit_syncobj */
+	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_syncobj */
+	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_syncobj */
 	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
 	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
 	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
 	__u32 pad;            /*in, reserved for future use, always 0. */
+};
+
+#define MSM_VM_BIND_OP_UNMAP	0
+#define MSM_VM_BIND_OP_MAP	1
+#define MSM_VM_BIND_OP_MAP_NULL	2
 
+#define MSM_VM_BIND_OP_DUMP	1
+#define MSM_VM_BIND_OP_FLAGS ( \
+		MSM_VM_BIND_OP_DUMP | \
+		0)
+
+/**
+ * struct drm_msm_vm_bind_op - bind/unbind op to run
+ */
+struct drm_msm_vm_bind_op {
+	/** @op: one of MSM_VM_BIND_OP_x */
+	__u32 op;
+	/** @handle: GEM object handle, MBZ for UNMAP or MAP_NULL */
+	__u32 handle;
+	/** @obj_offset: Offset into GEM object, MBZ for UNMAP or MAP_NULL */
+	__u64 obj_offset;
+	/** @iova: Address to operate on */
+	__u64 iova;
+	/** @range: Number of bites to to map/unmap */
+	__u64 range;
+	/** @flags: Bitmask of MSM_VM_BIND_OP_FLAG_x */
+	__u32 flags;
+	/** @pad: MBZ */
+	__u32 pad;
+};
+
+#define MSM_VM_BIND_FENCE_FD_IN		0x00000001
+#define MSM_VM_BIND_FENCE_FD_OUT	0x00000002
+#define MSM_VM_BIND_FLAGS ( \
+		MSM_VM_BIND_FENCE_FD_IN | \
+		MSM_VM_BIND_FENCE_FD_OUT | \
+		0)
+
+/**
+ * struct drm_msm_vm_bind - Input of &DRM_IOCTL_MSM_VM_BIND
+ */
+struct drm_msm_vm_bind {
+	/** @flags: in, bitmask of MSM_VM_BIND_x */
+	__u32 flags;
+	/** @nr_ops: the number of bind ops in this ioctl */
+	__u32 nr_ops;
+	/** @fence_fd: in/out fence fd (see MSM_VM_BIND_FENCE_FD_IN/OUT) */
+	__s32 fence_fd;
+	/** @queue_id: in, submitqueue id */
+	__u32 queue_id;
+	/** @in_syncobjs: in, ptr to array of drm_msm_gem_syncobj */
+	__u64 in_syncobjs;
+	/** @out_syncobjs: in, ptr to array of drm_msm_gem_syncobj */
+	__u64 out_syncobjs;
+	/** @nr_in_syncobjs: in, number of entries in in_syncobj */
+	__u32 nr_in_syncobjs;
+	/** @nr_out_syncobjs: in, number of entries in out_syncobj */
+	__u32 nr_out_syncobjs;
+	/** @syncobj_stride: in, stride of syncobj arrays */
+	__u32 syncobj_stride;
+	/** @op_stride: sizeof each struct drm_msm_vm_bind_op in @ops */
+	__u32 op_stride;
+	union {
+		/** @op: used if num_ops == 1 */
+		struct drm_msm_vm_bind_op op;
+		/** @ops: userptr to array of drm_msm_vm_bind_op if num_ops > 1 */
+		__u64 ops;
+	};
 };
 
 #define MSM_WAIT_FENCE_BOOST	0x00000001
@@ -344,10 +456,20 @@ struct drm_msm_gem_madvise {
 /*
  * Draw queues allow the user to set specific submission parameter. Command
  * submissions specify a specific submitqueue to use.  ID 0 is reserved for
- * backwards compatibility as a "default" submitqueue
+ * backwards compatibility as a "default" submitqueue.
+ *
+ * Because VM_BIND async updates happen on the CPU, they must run on a
+ * virtual queue created with the flag MSM_SUBMITQUEUE_VM_BIND.  If we had
+ * a way to do pgtable updates on the GPU, we could drop this restriction.
  */
 
-#define MSM_SUBMITQUEUE_FLAGS (0)
+#define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
+#define MSM_SUBMITQUEUE_VM_BIND	0x00000002  /* virtual queue for VM_BIND ops */
+
+#define MSM_SUBMITQUEUE_FLAGS		    ( \
+		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
+		MSM_SUBMITQUEUE_VM_BIND | \
+		0)
 
 /*
  * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,
@@ -369,6 +491,52 @@ struct drm_msm_submitqueue_query {
 	__u32 pad;
 };
 
+#define MSM_PERFCNTR_STREAM	0x00000001
+#define MSM_PERFCNTR_UPDATE	0x00000002
+#define MSM_PERFCNTR_FLAGS	( \
+		MSM_PERFCNTR_STREAM | \
+		MSM_PERFCNTR_UPDATE | \
+		0)
+
+struct drm_msm_perfcntr_group {
+	char group_name[16];
+	__u32 nr_countables;
+	__u32 pad;         /* mbz */
+	__u64 countables;  /* pointer to an array of nr_countables u32 */
+};
+
+/*
+ * Note, for MSM_PERFCNTR_STREAM, the ioctl returns an fd to read recorded
+ * counters.  This only works because the ioctl is DRM_IOW(), if we returned
+ * a out param in the ioctl struct the copy_to_user() (in drm_ioctl())
+ * could fault, causing us to leak the fd.
+ *
+ * If the ioctl returns with error E2BIG, that means more counters/countables
+ * are requested than are currently available.  If MSM_PERFCNTR_UPDATE flag
+ * is set, drm_msm_perfcntr_group::nr_countables will be updated to return
+ * the actual # of counters available.
+ *
+ * The data read from the has the following format for each sampling period:
+ *
+ *     uint64_t timestamp;  // CP_ALWAYS_ON_COUNTER captured at sample time
+ *     uint32_t seqno;      // increments by 1 each period, reset to 0 on discontinuity
+ *     uint32_t mbz;        // pad out counters to 64b
+ *     struct {
+ *        uint64_t counter[nr_countables];
+ *     } groups[nr_groups];
+ *
+ * The ordering of groups and counters matches the order in PERFCNTR_CONFIG
+ * ioctl.
+ */
+struct drm_msm_perfcntr_config {
+	__u32 flags;         /* bitmask of MSM_PERFCNTR_x */
+	__u32 nr_groups;     /* # of entries in groups array */
+	__u64 groups;        /* pointer to array of drm_msm_perfcntr_group */
+	__u64 period;        /* sampling period in ns */
+	__u32 bufsz_shift;   /* sample buffer size in bytes is 1<<bufsz_shift */
+	__u32 group_stride;  /* sizeof(struct drm_msm_perfcntr_group) */
+};
+
 #define DRM_MSM_GET_PARAM              0x00
 #define DRM_MSM_SET_PARAM              0x01
 #define DRM_MSM_GEM_NEW                0x02
@@ -384,6 +552,8 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
 #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
+#define DRM_MSM_VM_BIND                0x0D
+#define DRM_MSM_PERFCNTR_CONFIG        0x0E
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_SET_PARAM        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SET_PARAM, struct drm_msm_param)
@@ -397,6 +567,8 @@ struct drm_msm_submitqueue_query {
 #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
+#define DRM_IOCTL_MSM_VM_BIND          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_VM_BIND, struct drm_msm_vm_bind)
+#define DRM_IOCTL_MSM_PERFCNTR_CONFIG  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_PERFCNTR_CONFIG, struct drm_msm_perfcntr_config)
 
 #if defined(__cplusplus)
 }
-- 
2.55.0


