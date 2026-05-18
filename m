Return-Path: <linux-arm-msm+bounces-108280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JA7HQRlC2qUHAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:14:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CD7572BAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00B2B30A6E88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36D0392C4A;
	Mon, 18 May 2026 19:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XP4jn4lZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wr6YbJV3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39C5399360
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131312; cv=none; b=QT+RvGKaR6Q+g5f7KbBlXpqX/Oggz3/IIeEmW/1s00Em5X6UALyDIr/fT3xbvDbBbrT1rmLPGVRDrt/sLRdSaMt9vZdcij2wFw0pU+yhM0J6ysM0mZJCD/XrA2KL4R1s5s8CaUxecsw8EFQWj6rD8s4ClID7oZVAcjlQ3tGjnQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131312; c=relaxed/simple;
	bh=8mip4aYW915pX9J0+2O7rm1fdDX8AudK3aRzsfX3xKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHTmbWY2Cvm4S1eZPduToLklSIPosQSLiIx5zPslKHOTWl+dx64DgeoDz9q70s0ROjKdInQqzyr+I3qogBxBF4qV5T8U6SDLE44l6fiMtUTpk1/zsNPOEk+BkAtmS+SeIi82ykw/O7afm7VmK2SyH5hwQrCHF8VF+v+psCVUsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XP4jn4lZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wr6YbJV3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBwOmv1251996
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xuhe6ygR1yI
	ktoZp9sFxJLTtkjCvrYy2WoD60aoQU8w=; b=XP4jn4lZg0eGMGnb3Q1Oan5wdhV
	cTt8vbwIl28me/s/cNJQ3cUBD2vzFFFXhk3nSYcNaCvAfb1RF8lTUmbKnkapf+hq
	dTTuLcj1N37QMhBkWOyyZXXTXEsQCUsGQHD3LdXwuLPUx/J2PCyJVPArfLQRbiOP
	2ZGj8ulF4dxMO3Tf5RxbldcDo9iMHHGIEG8+Z1Jy/MJobustdyrTaRPJVw0A8pv/
	VgfwScaDiwNivBREFe/XQX92VTGWGDeMZJS9tB8ZKQYZUVP86AQYJXPSpCTjjNVi
	MdF1bvYAdbz4J1Hd4yYK/oA1dkNXIc+tuQRkvS/o6a/1YMequgrFTXK564w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0hqae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so40761835ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131310; x=1779736110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xuhe6ygR1yIktoZp9sFxJLTtkjCvrYy2WoD60aoQU8w=;
        b=Wr6YbJV3mYaG/6FNOSLdZ8oRgxgjmPnlLXqsQKZwFyigvw11l1kE57pU6Js5N+4tPS
         7tiHw/4Dqf2OvMihKjnPtauYLCzxgH8a9CiA/F8zZPKfkKLTrnF2+1l17ZwxzeqbKidn
         8cTNkM45G9KEhLONsX++aOY5ikJBwd0aBLS/kfWRN3YwjFAmueGH6IapSZsXcxOnvBGt
         h9rotTZ63nJ/ITWqAzNgsoSIz/QGEzknzLMP6eTK/GHKvsNf9xQJjXfsqXiF0oNl7je0
         855CHRHxtKA4pYRlw74EGfZtfuTNzs+fL9thTY7LBtfTJIcydFOjV8FD+hyGesJL6EK0
         6MRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131310; x=1779736110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xuhe6ygR1yIktoZp9sFxJLTtkjCvrYy2WoD60aoQU8w=;
        b=nJMUFJe+Kh0+i+TEc/x46iiIqfEG3pcQwPn+Mu5DTy4n0Oojgm+E0ct+kDvqY5vAc8
         e1hMK74Qe4TvNHJ+RnLb8CBwVeNKpUsV/IPhyJMDYDOpGEKP/HipCI7Su9DczzuR3288
         jMGaJ6mjdzLCI56GmXNtVMsJaRuSLOq8T3vNGSwMRbZGk5QiPW+y5Ld3Y//uMDIrda1s
         YdIryCCWsQndggETsZGZEq/nyu9pPaL/5S2vX8dH/Oqc8WzEAYX7BU+uGo2xxdzA+1vW
         +MCsGfud+qc4kx6nZY5ovcj52hIFTFvn10mN54BV7zciw84Tp7z12lrX/0Slz88NT0lh
         7cvA==
X-Gm-Message-State: AOJu0YzQAYwAJBY8XsX37TBGn2Qir5YWrDmyaBazBz1OXFkmr6UrlWXS
	KKfhJBtvZXLrm/8J6crntZrj+Rtg/xJzXIOsXTYy6q+ZoLUioOCb5Tpar49Dj8v2hLWN9RBxE83
	TiHNaIvIzT7v8+Z9TWsK3NmRZ2/zkLyX9ccYxP2yJ0x5LlF9Lf+MmuRGvNus5dV3mTYfO
X-Gm-Gg: Acq92OEPcujQS4FWpDjK+0eh2fydSo8Nwg2LZyp5MYFuFSXueTOTUEfjiCkSk2du26d
	lgvW/YBVQ1hJdyJEBd0aIa+Mpkbu7R3aN40NoqDcOoVa//xhIlYvpj7LNjZI79P7HAkQa3EEzAI
	fAsVkfJck3/ZMd1zpgBq1+9PtaV+OMJVfs6zur/nALyBtyXizontraP6tHx0ZPI2J62uND9Q9Ui
	lmmGme5iXvSwp7pnd1iytMVDYqLPAz0XvBC7LFqoMqk9Qc8qhjrcX32QS8myn7FwUePsdPdWNk7
	KPtqh1WnQd/bTIfuHn65VYuddncLEsSlUraLJqvGuhb2oEppsTz+vw9ozoLTqnPUHrlrtEQCxeX
	e4emMcGZOvrCxrHoF3iChgwms6JLXeifc
X-Received: by 2002:a17:903:328e:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2bd7e7caa36mr123418655ad.15.1779131309835;
        Mon, 18 May 2026 12:08:29 -0700 (PDT)
X-Received: by 2002:a17:903:328e:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2bd7e7caa36mr123418395ad.15.1779131309401;
        Mon, 18 May 2026 12:08:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11cbdesm158941575ad.71.2026.05.18.12.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:08:29 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 14/16] drm/msm/a6xx: Increase pwrup_reglist size
Date: Mon, 18 May 2026 12:06:41 -0700
Message-ID: <20260518190735.16236-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OSBTYWx0ZWRfX/xCHu5EFyd/P
 F/bpgP8qu3Pd+JkW0gHgeu243ahyaswDhB0/nwncK/ZqGfmWKMgQ8aG8wjOsQAUhbdHQGezBIsM
 KN+nsRr2TXEjYcUIrH4eLFfJxcIgqGXo67Yaf2rB4gm92M5wLb0P2mt5ga9gTLUUZRR6eC5NT7k
 urSx/teCDK+jJ9ZW62gTX6cyb2DReyFiNJ3IM6YQ9OmLEUt4j3qKsSsxAx6ZPIVjzL8ZGgGnzW8
 1Nm7yYVPgfICnfHaKwrKshA9KsNEDyeiv9XsUjhm18de33nEW9UEGDnw/Eunina0nkUY2868mX7
 p2EXBevQkBOLbRO3GnfcAInpRlM+9mCMPD7YZ854VWK1eQ5Ue8DrX601vemx3al9mL/sPIe+ouv
 uGwF6DyKoyoVY4DznpAIiOB7k/pP4W8zpwmAmChmKmNXomy3SCFmwaHBo2EQ699jdbhyPwFAUMO
 UK7gqU6sG+hjZOFvmeQ==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0b63ae cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=bkW2Msa_OoTtud3PmHQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Ns6hUd2NMp_wEMVW6ddm4O63ZNqabrZs
X-Proofpoint-ORIG-GUID: Ns6hUd2NMp_wEMVW6ddm4O63ZNqabrZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180189
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108280-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E1CD7572BAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To make room for appending SEL reg programming.  Without increasing the
size, we would overflow the pwrup_reglist at ~190 counters on gen8.
Or possibly fewer, considering that some gen8 counter groups also have
separate slice vs unslice SELectors.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a329d20033d7..61c6b0e781ce 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1183,7 +1183,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
 	}
 
-	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
+	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, 2 * PAGE_SIZE,
 							 MSM_BO_WC  | MSM_BO_MAP_PRIV,
 							 gpu->vm, &a6xx_gpu->pwrup_reglist_bo,
 							 &a6xx_gpu->pwrup_reglist_iova);
-- 
2.54.0


