Return-Path: <linux-arm-msm+bounces-111267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IvUHDVjcIWo2PwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:13:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 959E2643225
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:13:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ie40GLMB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bBqBzsnP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111267-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111267-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80C4F30621D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 20:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DD83B8407;
	Thu,  4 Jun 2026 20:10:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CD93DA5C1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 20:10:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603841; cv=none; b=qNXk5acRKc0Z+HBmrNcpCANv4ZgQbJhFMyqPcXyoeMNTnv58rdNQ6d6lFC6BHMdC+p0AoRpRZsZIJ7HInANahr1vVoosDEgGZvN2di3N4Z0LQkjjHKInkZCPL+1jWaKaV5xiU59q3E0NK5Syo0VuvouwxfTOpjDO2ef/TdgoQcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603841; c=relaxed/simple;
	bh=ijwte7kFHE+i9nN4DbulJEUNnaV+CYGDPB3sho5jNd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TeA4G4ELtZjiTiJQCwWhTbDtNICHE3cgEJgfoUYcGGKwkPwUUqAyA63Eso/EwIjg6YlmFu+amaeHMENzEiHNyVygeo4RUAN92ajaiiT/CxJp8sZfEEGLq8IGrygX//Bg8/72SRim2kcC5e3CUx6KlwdSUKu/JEghbrE99FkaxFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ie40GLMB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBqBzsnP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EOwZK140569
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 20:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ia1skyxQmkO7JqYCXK2wWQZtv88kEi4DeIduMmc3/kc=; b=ie40GLMBF0ujDd3p
	BkqF8GTZz62fxeG+88YY67NZbwf/mcH5U9+rj3nUvRkatHit1GoP3kmGyVH/QCsh
	Nt5LV6o0iIy/MK9iwucC3Zmez96CNPkPSoFrSP1QCspMT+lE3+PSzsF4HR1rTeZh
	ABNRkbDyWQqiTxUW5gH49nbcZRnHCAIE0Ahp5SRzZ5iH4nOpHYTEsxTb/mbu6VHC
	zy93nUrCZe/Fc93pZ7gW5pn/mQ8McLsQ/1p/p2v+ZnrlGdEQHXGLYOB2Eau33Ujl
	6gB2R25Ao7AIB7bnAPjbbJwA20y3B/mY7wA8SZGJ9zY0Sma/bZFcIjjeLm4jecnZ
	ElzZZg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyencfsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 20:10:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422ca754d8so788451b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780603838; x=1781208638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ia1skyxQmkO7JqYCXK2wWQZtv88kEi4DeIduMmc3/kc=;
        b=bBqBzsnPwOjPlcvSHhSFrbcEXgB+eQnaA/nzDaReaC76hBdrucIUcZxGfBodAYXy5e
         CcnV0royQR7OYVur/R93GgwkGcxPV8SD94KqPp9jaq5eef/dtyeisFumfIwpf9LfeLqv
         f1ASv7W3qBIH+LcdFWIg9NS0qzVZ7nPd9usuqKnFEuM0twju1VLdHzW+2JEYVlZrknGG
         F/KIL0fT5hdydj6q2QUp3fVY/341Sl1nKJ8B9Yq1TcD/NgEZ8rFzpPxJpSRP8i7rfPZO
         pjpGedys0WabFT/atzinX9nSzogSqeIFKrTluqt8XJpFgwKsPL4Q03RrYiAbGbryO75+
         vwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780603838; x=1781208638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ia1skyxQmkO7JqYCXK2wWQZtv88kEi4DeIduMmc3/kc=;
        b=Iwv0ItvBLmeLS4drdEpnQvXeFZ8zVw7stwU69x1H+w7CMyA7wiEjpMOhK2JyF4Tug3
         gAsfMtI5EWmlNMrjQ9t7KIidd4xbp3anT0MSaNxBSO9dgLqEnUZzDZd4RF6o9fSDYHBn
         fwb7QFxm2gxb4BXzQwkP+TcI6scPpxqqMGKvHIpswvYbRovAwzSc3fawNvb+Kc8X/CcM
         7ZnfMuDGzWjKWp6MevZyCh3oDrdrZu1Q2SGCRhJrMdLlTqhg4AdOVf7ELEyEA4NsIx6G
         mZAT52/Cwc8tBfiHuxLMQ9xYZ0N0QjQatP6GuiE9Bg5akw1wxp8XMAbtA+2d/lnT5Bp7
         fDIw==
X-Gm-Message-State: AOJu0Yz21A/eZWY0aNmhLbx9u6zGh6m8zRRNoTNxPDZEpKa/FuKg5HQv
	EFqh5mXk2chBsgvOMdvUVQ8OrjSuyvPTtOsfWO8PUGNBB402JX0Kp3JZ+1YfEwo+3OY2+njBjpE
	4PxhTwcIMO3bxe0bhv7zFB/gik3Tzj2RkmoL/TPGSd4QfHxMS1QAeZBkVPsx5jsy/otyaYN9DI4
	fv
X-Gm-Gg: Acq92OF//dxrZZIvqYjj0HHK3XMUTh5W2NSoPWEAbgoH9Xd+Xr/l/qwmm9GPONGF025
	ZF0GICSZH06YewOFZb622NQrOcnOkahAZwR4OkHBlpAb4HXfVGBxzWhWFi0hCPxKdhk2oeiji0P
	+G4K5+rSh53Tb87RMg8loUqhKDwUToWfkFlM+FbgJI+f2r5S2W0H5WYJniaqHDDXZOJuKP7tZmX
	UZvMHmIan6ZjNOXUJXXK2ZvZMkhQj6WAKF8zQw1MF7MRpoP9lkVEMpA8Yrv2Dpo1kku9CHtKWcX
	sCePRKo8jIWRsppHzBFrMNqGzKgTqEh1rLMVev2X+qTdyB898AVujNh9wr02g17shlmAip5feiT
	Gvv9C8nHIohhkD9A5ZPiwnHEdvJUrAcqUs/wMSNNpsKlvdM0IbHWvpURJ
X-Received: by 2002:a05:6a00:4008:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-842b1007fe4mr217716b3a.31.1780603838121;
        Thu, 04 Jun 2026 13:10:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:4008:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-842b1007fe4mr217695b3a.31.1780603837668;
        Thu, 04 Jun 2026 13:10:37 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428290067dsm6721425b3a.53.2026.06.04.13.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:10:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 01:38:22 +0530
Subject: [PATCH 6/6] drm/msm: Fix task_struct reference leak in
 recover_worker
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-assorted-fixes-june-v1-6-2caa04f7287c@oss.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
In-Reply-To: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780603799; l=904;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=X3vJeCumKhjjotRl6yk2pCMRTx61cAms8ve5tuXIPwI=;
 b=MNquq63XpQbBR4dEKjskl1CiKb+qtEacdlCYU32SnWmRLXACBNuc6h1X9R0rKCo68B1hhUVxJ
 WYHWX94jP+iAQ1SQJHj1Bzo8lcKhms0Svb6GrNBRovKuhfK4w0WGYZ5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a21dbbf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nKn9kxNhn4xvKzSdCgcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 7yzfYJRjZJ2XhdsolgrptGKc8f-0tR2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE5NyBTYWx0ZWRfX87XAK1rA1XV3
 6gVWkYskdjYmvyjTNXz/Qk8abUMCO4kVSLXAds2rZHey0TLoXeS5Z8KuVkQuq7Zm8sPVO6Ksoic
 GxX0C3AtLpj+U8su8eGspbG2I7bcsJGlxvN6KFPYXQ7sXbPGoza2pEBQd5JYUaLT8mglD2hvabd
 6lpd43XmrhEzKYGs9sxdGqIrJpd4NGxG/t/tmKgiQkBIA/2Jmb+SOXcFY/l7kj2hd+EGK26RkF7
 4tQlSxJKpoHqBIqI/ibPB95c4Q8l5N1Do50RYoJgCwq2YAgnwRPZ70LknBgpCACyrMhczM+yYV/
 RUc4U96fvIiFY/aU0KVfMC3kquIec40G+74duZncxOxHUIVHyGqO6VzzptdNqbB2CTCW52VbcBJ
 isR5DLQTl/9YEeFczJmoB5lS+rZHBvgT/ZTj53/w4EiYk156P4JS9SEJN160AHRp6c3NEMRuhTZ
 vvhBEcqwfO3BPboQckA==
X-Proofpoint-GUID: 7yzfYJRjZJ2XhdsolgrptGKc8f-0tR2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111267-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 959E2643225

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

get_pid_task() increments the task reference count, but the
corresponding put_task_struct() was missing in the else branch,
leaking a reference on every GPU hang recovery.

Fixes: 25654a1756a4 ("drm/msm: Update global fault counter when faulty process has already ended")
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 48ac51f4119b..03c057856065 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -505,6 +505,8 @@ static void recover_worker(struct kthread_work *work)
 		 */
 		if (!vm->managed)
 			msm_gem_vm_unusable(submit->vm);
+
+		put_task_struct(task);
 	}
 
 	noreclaim_flag = memalloc_noreclaim_save();

-- 
2.51.0


