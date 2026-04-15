Return-Path: <linux-arm-msm+bounces-103282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dkBpEx5332kATgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:31:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6418403CF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B90230FFA0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18025379986;
	Wed, 15 Apr 2026 11:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNuAfwfF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4BXjSQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC70D340298
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252344; cv=none; b=qVpKBSiHMR4G40HJfFfNrbvuOPqOH9/hwFQdoY7VxFSsKCvqkPb9x6RuhWe24slLuY+JVGFwI1GlSW7mIvwH5cfr5gZcJ+wOiVCgKLca7B9T6dOqNUyBW5XA4W9eykRVOpQJcNZTWlbjGqp08hA2NEmv9I/LiZcmKJDe33FIYXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252344; c=relaxed/simple;
	bh=fqGiXwv7TMUQTJi8HRdgDj9tkcWqqY9b9ZpTnTA2HXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nWc8HKHmgVUGZkcGucIRdNagJ+zbbLT3EU5mlwO0jwiMLXKiHtG94uXNyb8YEUt2UJDOvmKSUEACIeH0e9ltWk38bRsrWgJ/SgIfg8Ci7KtOclMeM1OCsDtCBQLENrlglJodLKBOu37MeJzmJDVTyNPf8c2KIF4e/RmjXMNBRwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNuAfwfF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4BXjSQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8wViG2005539
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ISnEXNmu4DG
	VhMqbwORuMrVkS8MlUvvf+D9exDaKuko=; b=lNuAfwfFic9oteZQ2ytXZckml1E
	OcFEYmslPzLZp/3QOgYO4BlGlxBMgrBJKvdVveGfQBB6U9WMLF5r70FL/lANqYiU
	/feszuvvqEwZQuzAA7CE7LfC2BiRCkWWbiI42hudpNDoEJC5YEfFdrt8bGpTwpQ2
	h9uxWdLv70vbVBw13dlmtIztDhVNRCXULl/rG+969AAOaXpAtRDwGI1p0c7o1TMY
	zC7jEXVI6yans6+4WXPEvzWSN1Vvrz4mVBdG7zvUVPkxL7ZerjsEa22/dtrsWjH3
	CM8AbsQblsQBvvRvUHDY1aqsgkemu3ikJjftgTF5BY0Dnwb+xoQLJ1+ePhA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjufbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:25:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so64913965ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 04:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252341; x=1776857141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISnEXNmu4DGVhMqbwORuMrVkS8MlUvvf+D9exDaKuko=;
        b=Q4BXjSQ2VqiO1IEo6wx5hgVYQNuEWsICxeodTH6g8wNk9FcvRhMfdWdlX8avupD86B
         UhEyhEjlWl+Sp+oekiPs8HeTg4aiCXE97riKo7XWRb7IqchdbaIxpew//so5gyRtEm/L
         9IuW7E+APQU1dJtxXJkj+Gg6zw++X/Pgui7uiPphqAKWnoOehviJ4fLbcEm4ATcW33L3
         df2ciaNLdHRjhonPwB0GWSVNwZG1Dw3yC2Ry1JIeBudBNvto91D9nk3R2iJCtXeZAe+3
         fsA9GbSAr3RB6MxnBiV+4JAMDCYioxVZXKeDcfASyQnq7XCm3miUKyY4FZues6vPWNiM
         zphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252341; x=1776857141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ISnEXNmu4DGVhMqbwORuMrVkS8MlUvvf+D9exDaKuko=;
        b=RRV4M+wNfZLe/1A4PPNwyefl1WmB9To2AgSjRiQiE50OjUwmbbCsRhX2+tjmMMQ1cP
         tq7aiwCjjbrhebPWkk/ubMkjw2okbD7QFIMc5TenbMMWmoARNEXiCgiGspHk2z6a1cM1
         YdepJnDKhP+hjCnze5A9/iwtAIdWVVT83ia11YBrbIsSrj+4LHwp5wJ2Uc6hTwGbGX2L
         IZZjZ1gGkBwfNOV7/v+os2zcF77UqbDxXtO/wkL3Ke/C+tX+wqVMZycbNydyLVtEMZ25
         fBN80JPA3HCC6jnsGN3hVWt0bnwYRUToaYf/Yx8pXosVZDVEeTEGVbPFX7gdUnDBlp2S
         wbDg==
X-Forwarded-Encrypted: i=1; AFNElJ8pok31GTQVtzh+yRbpuVlleKcA5X8Zz86KYdFuV99zhffKBABy1HxDcmQo3d/zlRocs7wod1Qh0slYQ0ej@vger.kernel.org
X-Gm-Message-State: AOJu0YyJWamhSHqFO2hH7LNSMTiqCjEwLl4bNjoAsHhgJlqBhscwfNkf
	LPRFFRvIvfMNRf/oOSMokZ/hoEJOYC0efy/9CmCri20SYMWET4B+/mjWgHZ+1dR4vjxqATAz6xB
	Pdx0rGmOZJbYLWB9QPK4a4EPQWTRq6RsIBBi21zbol6mt709arLCObekBKSNnh1dkrSTn
X-Gm-Gg: AeBDieuVyRetXF090+5UVVIBUCHBQBOEP4/ouQUQP5XnSGOYI38Y/MYj5FAhDfpYERO
	0ZvhEDk26qirrY9kLFnEGHu5eHbVUs710m5XWh69pGJf0Ua9cnXRJbq8tMlbOWWxi1ilhAHZ7TA
	vL6zOmMpbYDAFYrAi507JFPX11j44Lk2/iD77IGBaT3BLtetoYGDUCkobKPs1blGTqAB69KbZQz
	yU+x5ksKXCUKFD1KD4TFLpE6O4Yxn0qEmJl1qbHY/llARejRXrL2CVgCTvw6rJuqx+ey9ySzLHv
	ShBBDTBOF7w0qAuQCPGFSRd0Gx6oFM0mBTD7k5wtUz+dBUViY6jI5+8Ua0eYWcsSCMlU5vV+yPh
	jJTVxdDUBRmCsCfC2Fth3F9D/PRjMHbY56vw9Top7g1bD/x3hsXDTjMyd0wKLn1Qq
X-Received: by 2002:a17:903:283:b0:2b4:5b9e:4edd with SMTP id d9443c01a7336-2b45b9e5280mr123918895ad.9.1776252340590;
        Wed, 15 Apr 2026 04:25:40 -0700 (PDT)
X-Received: by 2002:a17:903:283:b0:2b4:5b9e:4edd with SMTP id d9443c01a7336-2b45b9e5280mr123918545ad.9.1776252339875;
        Wed, 15 Apr 2026 04:25:39 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782b6fd8sm26794325ad.73.2026.04.15.04.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:25:39 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org
Subject: [PATCH v8 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Wed, 15 Apr 2026 16:55:27 +0530
Message-Id: <20260415112530.4083240-2-ekansh.gupta@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69df75b5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=IPuuj3Sbi4WKP8RQR18A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: c1af1LPTR54rgt8_7ux9Hm6YHEETVvXr
X-Proofpoint-GUID: c1af1LPTR54rgt8_7ux9Hm6YHEETVvXr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfX3PJQjr/qoiz2
 T/0vd2oRdn2rHUYcGsdwcZKluXgS1WkUS4DJ/l7yNQ7ybJwwL2JblmwLdCrwP4b0e6OhtCrRclh
 N+A+YLDhmT4Syt1qLAR+ajYclygsJ9eQ0I2lsmsTLWp6EZbcfrnHNHMVjviMioH4dx8U97pn5ek
 eL1t9lS0gMZ2ANo5eWkdkCPqZ+XXqvcKpreV3ghbHTuJw+WCFTvtNwPJQbbmlYnOi+owD1Hpze8
 q9zTyReiooc8Qzk3Y6Zn7imlE7rqSa/f/u9iuWapTCcxipvxfe6EWuLKXvZtaZpMlnw6+pDmdEP
 lX3in1JlLKygrahR3D8jXVsZ53bM9rCpVUBnZyH8trS4PefAhkxfatcbtb4AiBlQMU8QEubANii
 pCVqvVnNdwumndLPswQ8coqSildeeVzurfeTBTPbFu2zpplRfA98SgG352I4JMwXcjCBWataODN
 X3iZ6AimCImmgN4z63Q==
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
	TAGGED_FROM(0.00)[bounces-103282-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: D6418403CF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The fdlist is currently part of the meta buffer which is set during
fastrpc_get_args(), this fdlist is getting recalculated during
fastrpc_put_args().

Move fdlist to the invoke context structure to improve maintainability
and reduce redundancy. This centralizes its handling and simplifies
meta buffer preparation and reading logic.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..a9f507a88c67 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -233,6 +233,7 @@ struct fastrpc_invoke_ctx {
 	int pid;
 	int client_id;
 	u32 sc;
+	u64 *fdlist;
 	u32 *crc;
 	u64 ctxid;
 	u64 msg_sz;
@@ -1016,6 +1017,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1118,18 +1120,11 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	union fastrpc_remote_arg *rpra = ctx->rpra;
 	struct fastrpc_user *fl = ctx->fl;
 	struct fastrpc_map *mmap = NULL;
-	struct fastrpc_invoke_buf *list;
-	struct fastrpc_phy_page *pages;
-	u64 *fdlist;
-	int i, inbufs, outbufs, handles;
+	u64 *fdlist = ctx->fdlist;
+	int i, inbufs;
 	int ret = 0;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
-	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
-	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
-	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
-	pages = fastrpc_phy_page_start(list, ctx->nscalars);
-	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
 
 	for (i = inbufs; i < ctx->nbufs; ++i) {
 		if (!ctx->maps[i]) {
-- 
2.34.1


