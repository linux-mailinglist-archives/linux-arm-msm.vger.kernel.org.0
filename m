Return-Path: <linux-arm-msm+bounces-109785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M6zOO1/FWqtWAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:11:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 446155D4B38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C73B4300C5AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0AA3DEAC0;
	Tue, 26 May 2026 11:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ieXacd1k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkPCT2FR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E033DD87B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793899; cv=none; b=N4te2isiXn184xIT5WR9IT2d/8P34Hp0GtL74DzmjKdUXZFaqN8PoPVwWS5Oxswj1KJuTdd70fJofDujFZjmlzPi7FHCVI7YMrnq+F0cUWl1W/ArVq19pIY8uXzZ/ePAVvQzkrVG4ZC2pbsnxp7PPcEAmpyPVbcyOAWN1oYdvdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793899; c=relaxed/simple;
	bh=xJwkAFzBCgVE2LEdHMFAQiZLbcIInQtlHCiLCIhnIZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nD48bCk4vcfyh8Q9oh+cBra5/WkWzT6RqQNuqVIuuVdTLpFK1TitI0gYIYMt/B14NTqDEjPET7Em7QPqENTDbL0geF5MxyUfEjQSw6av+ag60moT/cQjwxBDxGpDwAbuSVAWOMx+z777EEd/z1wCyD46AsKQGn/G0ztbW7BxZ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieXacd1k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkPCT2FR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QAAT3K004544
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WnPeFnYm50V
	ptjiqnHaSpsB7Y9ad0zWN9mmwwejDdiY=; b=ieXacd1kjQV1C42FyHkFDsqQtEn
	kACdYNlJ11If5SV3Y/M4Dgo7reYLEDmuzrOHpOr8mmkJagPuU9Aq77QCD6t9NUcx
	OSmhMJKJ1CKi5nd6oyhuIUXgbLG074OF7LypFU9R1tfGSpUN+Iq986bMmRKup0pb
	dQtngw6iS0DpDoM07RzyjCB4dBcbAehKxFwCtNobXxwNGkrXjz5zlEegf1hG4IRu
	4c/Go+4HYcxY2YnKsUrCg4iFBxm2oSMamiZLH5IEEstSNOWEva3sBRAvjjhqC4Sp
	YADyAD4PRqD5qb0QZL+noTk5zmS/otzW9K5pogRrzgKkMxZtm6+Kcl9qkcg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm0352f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:11:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-366ded5ab5fso20344187a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779793897; x=1780398697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnPeFnYm50VptjiqnHaSpsB7Y9ad0zWN9mmwwejDdiY=;
        b=SkPCT2FRR70yGGsxb/DerJe2JKF7uLCf03cp64/0lSUNFi1g1hHaoEK095EHNWBACJ
         /Tzgx+gT1fDiJ/Pxl8fMDHVad3kPRcNc7QaUOqlCrqychPRFeX2TVYr0Oc35wCAr7Dki
         pnMP9Xz0OOV8+vn6idnt6g/nMiIFF6Dx8Se8mP/WYRaAFOWwhT1QGW95A88qZzBwwDe8
         639kyEOMcK+DmQRdA4AwZ2ZGnnWPXi30adYNzzate4Uhwh5DEcfc1xcuHTeRjlxBNsBt
         x0LO/xuA3x/xtkKhaPEkdWHTRpJ7YOBKmZaXLn6rvZTe2d1m5ZYQvu6d/Sentrbkqi8D
         0bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779793897; x=1780398697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WnPeFnYm50VptjiqnHaSpsB7Y9ad0zWN9mmwwejDdiY=;
        b=QRQk7lzcYslPelWFJ17vf1o+RChXwvU0mGDZPzK+mDHIxjGWnI5Td4/Z3gMeFLLUPK
         dkOpkbNWNOhyd9Iw/yQnll1V+b6rzfnzNrkdM2uhQivQJR6DES7V7t1gw2D1n8iYKFVq
         uDwxXDEHEG1Sr5iCF7jpT1z25gAu5PzGFO+3JTl2Bw2PsQmsjlO8mDa6F6BN/Aig5/b3
         yg3I1rwGc5Ne3ePjCLYjti48IJ8hPJCqtsLyiRsjcArNcN7oy3ixNupB8TPnjVbz9ECf
         E2sBicvnNZlPCQBRlcjNtOqEZiEBJYMRGHBAyNUEXqMhRJ9ONju9FMhSxunMXvAg6KdN
         iBhw==
X-Forwarded-Encrypted: i=1; AFNElJ8OPKgDanCYw8YLKoL/yq1qq4klYHz2e73Vq4zHOAjSQxpqcLY25HmzPfYDNuEVLpqPnPHs/Dgl6U5qQsL5@vger.kernel.org
X-Gm-Message-State: AOJu0YyiWvNapGUT/zwVp2Cn2ADj5DDQhbWw0tfXxh0nC2TCCC1JqZ1q
	Px6sOSKKVnjhHWF4/qK6hz6XKRGNqK1QHc9qrKx/htTt8jtqUcgD80zK8gjPYwFSaW7sq3jQGRt
	jLz0lZiMIE7bHqnQ0XGc619+0eUDZZKuls3JgzigrTKWPg15JkI/1NnKEiIRD/OH2jtjJ
X-Gm-Gg: Acq92OFP1FhIvykwUfCFvo6r+bfjHiOiSV+7Dm8Q42lAcRW4es++tVtG87f+0OZT8Ea
	szqbtfpPlQvOQ2rFCuZAguDbUb8bvkdQ2aey9VQTVx6apLBZjwfG59jk5xIzPjA7biFUoPuZUPq
	xHzg6RZY+0qBHkRz4+n9NitqI/1DqS2EyJUQDROAEjo65jTkxcd2Q1Kz2ApESBBMmhAq6vvgkf8
	6T9FXzh01fbcdgGVeP+YhPwqIM5mcxSy6qgnMY9nNNrg3rz97naYFpOItyqHsuMaqgL8Z76Dosv
	ph2mACVRZMNWZLZZMzI6jTu+aOGN8yELyonH3rYWnYYoMvpdbliexAQVvi5ntzyUh+69u7EC4oj
	gXofkLJEg2cAYlnVh17tJo4j3ABGN/YPX2Hgy43jRFpdYRGK7A9tCStTTyI2BHx0AAyKICZB5B4
	nljaZ9EXZbEt3HahqZwg==
X-Received: by 2002:a17:90a:c106:b0:369:7003:4e2d with SMTP id 98e67ed59e1d1-36a676090bemr17128824a91.17.1779793896575;
        Tue, 26 May 2026 04:11:36 -0700 (PDT)
X-Received: by 2002:a17:90a:c106:b0:369:7003:4e2d with SMTP id 98e67ed59e1d1-36a676090bemr17128775a91.17.1779793895824;
        Tue, 26 May 2026 04:11:35 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4ce6bsm12104253a91.11.2026.05.26.04.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:11:35 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v6 1/5] misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
Date: Tue, 26 May 2026 19:11:20 +0800
Message-Id: <20260526111124.515-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526111124.515-1-jianping.li@oss.qualcomm.com>
References: <20260526111124.515-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a157fe9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Rm9GPb-2FwNFOyaWfJMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: yIclJ0HYuSwrJ_TChvRe1FPC4UJqInvu
X-Proofpoint-ORIG-GUID: yIclJ0HYuSwrJ_TChvRe1FPC4UJqInvu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NyBTYWx0ZWRfXx1d/p8YZC0AF
 ivBGp0dFv4PnVpU28lFGILFLLn4jUlWO2kor/lKT3Jvp8BJdPk0lwe60Crcd2eS5/8IaeLNeT8z
 MCo9LOGqKje43W/22XAyKFm2dEfyO3hJgeO0GHfF6IJamZk/aq0pT/JnH67dSZyV7MsvlCa8X6k
 Ng+uXgbx+pk+NNlWFBiYIuq81LQqPKaRUx1+Tay2+J+RiY2IDakv58GrwcRcs6GaTd0HMAeHGDf
 qPD190xTq1phGNwDrV3RhIqw6vPQvOLTR8w0/jwLN1lxpiziel6ysYvjik02AYfE+eZNgI14QuD
 C0zjvMC14fCwvH6TCrvlmh6ht8Ycfmh9w/ohjrSkD/DJ/sw85Qg2/BEsQqjhvX83LoYSUebuDvT
 qJMoOgIFbBaRmeEKSUnGQHxjtAolzZ3LY84b1/CWShgjQD6M9yULG/2imy2A4iPWdb0YmMrVckz
 F8Z059sDUw7ErFg2Fjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260097
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109785-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 446155D4B38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

The initial buffer allocated for the Audio PD memory pool is never added
to the pool because pageslen is set to 0. As a result, the buffer is not
registered with Audio PD and is never used, causing a memory leak. Audio
PD immediately falls back to allocating memory from the remote heap since
the pool starts out empty.

Fix this by setting pageslen to 1 so that the initially allocated buffer
is correctly registered and becomes part of the Audio PD memory pool.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5524354f3ccc..80a636962357 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1373,7 +1373,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		err = PTR_ERR(name);
 		goto err;
 	}
-
+	inbuf.client_id = fl->client_id;
+	inbuf.namelen = init.namelen;
+	inbuf.pageslen = 0;
 	if (!fl->cctx->remote_heap) {
 		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
 						&fl->cctx->remote_heap);
@@ -1396,12 +1398,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 				goto err_map;
 			}
 			scm_done = true;
+			inbuf.pageslen = 1;
 		}
 	}
 
-	inbuf.client_id = fl->client_id;
-	inbuf.namelen = init.namelen;
-	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
 
 	args[0].ptr = (u64)(uintptr_t)&inbuf;
-- 
2.43.0


