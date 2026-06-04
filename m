Return-Path: <linux-arm-msm+bounces-111261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 14Z4GzrcIWozPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:12:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF28B64321E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:12:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mn4RYwo3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YYjuu1Ue;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111261-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111261-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12D8C3020A63
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 20:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BEB3B8407;
	Thu,  4 Jun 2026 20:10:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7A93DA5C1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 20:10:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603811; cv=none; b=rHpiv1lT29G6EO97TWscNClUX35m+5w6CHTe75NVQgpQGs1lSqGhfj5VWgDuoQCyMH5g223yam3MwXU4zuZ47W3BXMsgFCJV/M7ZoMpZxBQQFCBdlN2CvGXWspjDVbuBOCbwzmUo5F4l+GUOybPJIBk/mTPNg9O9fqtoebK0NNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603811; c=relaxed/simple;
	bh=mW3/AYYOxPahGK1I/u4/xLMfbTUSvBOizXao0/KjA5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HVM4C2wZhJkbUSISMTAxtNCZfTE2b2EYwBEDPv5EK0T9vUTnrJX5ieACQdO+uH4j7c3SQwwAkcfvUcuHzdLwd2tWUa0rJ78iGiDnhrXICtUY0fGjKxBNu8D0v1K645Efu43NKDeA4FRHSXS3Bt9MiiqBLp1oCMqNg1psAH39r/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mn4RYwo3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYjuu1Ue; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EveTo140423
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 20:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5a1rPumWL5TM1aoArxsrWg
	V7GTojVDnL8YPP4sQcz2M=; b=mn4RYwo37zG2OiPFUmCzdI6DmQKTLKyB7b5qtY
	rvFnPYTrCxwRJy86VwEjYs6lShjMeeiHUJlvSPklxdqb5sH5/6kG4ryLbHnKO57Q
	3bF3/9e5z8quIl1zTT3d3aoDxYB9ctDFv2M4eDgFhLljZ7p3T5DBj0DsVmzpzqGX
	dtJXjxY4xkYb5CVGzLmxOrkjAtKc7ItswxBf3YfEj1PmByIubvTCuGM9mdsKYPOn
	gRhz99+rMZ0zoiwPzGz07hmkU9PR1ogGxbuWWxapY3t1IeR9t/o5G0+VppMSEDUE
	6rEnQWgkWEDGsjxavC1U2UILAAV/JzXyI+1MvLhKxXng+/aw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyencfp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 20:10:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842308adb3bso1540563b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780603805; x=1781208605; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5a1rPumWL5TM1aoArxsrWgV7GTojVDnL8YPP4sQcz2M=;
        b=YYjuu1UeJ7POxTFH3skQkPUftFmd7eyrWqqxwi4Qm7Xgwynxea2+8YLcXXBsCE6aSG
         aGuHSvC6Nwl9wQ1vGb9yq+9EyXBSmeNvKuIlfw2cEfamTWCbmsr/eRqmMmngsesw7pa7
         gXcjV5D25MBytxeeV3vXBkfA0f4JF51Xj5Zwgs4mNelhVSGglVAAzS5CVokjvKr6Yrff
         G+eOIlKeS9ZuzMUn3QDtrQRcip3izjj3/WZnr1BZ01/4J59XJSVVb7ikc24BW5LFHegD
         R8oEFtMfxHbwkGMAdGZJQeVhKNkCPS66UMJQAVvaiRTLUlf+yp3jK/Mmok8woMEMUTvN
         315A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780603805; x=1781208605;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5a1rPumWL5TM1aoArxsrWgV7GTojVDnL8YPP4sQcz2M=;
        b=CXiQQWbNIERV7oQoRJMRyawFw2d/6jSPfoz0jpv6Y6yzaQgFdsZZiG8fomRZspJyoj
         F6vV7B8qr1Lx0Nz08w6BhTE5ORpmKEsPmHH2C/JQf1J1kS10dRiydz2EHCSN0wEgpjW6
         jFuN1xe3NFHl0WtHsM9i8a+cHL6KK0MLf4RBF6vpYtwJQi+LXsa7iMqm+4s1WO3on6k2
         Mq7bzQ4lRYVChT4I1j3zAeMlOwuMW/gbsFEydHCd0FJJ2sLQmZgO+iRkFcyiEwkAqRZS
         7zZOcqee7OkvpCxnn3C/sC8Cx+fTWwFQcE7gFBs6b/0RIS4gQ6exHlimjg93I8KHJWCi
         B9ow==
X-Gm-Message-State: AOJu0YxGTHcBZZfhtD8JPqT5e/JE96bqEPIvOmZXopuzHhnWAKPfX+DR
	0DEG128jhgPDASI8oLCXPYtVh3qWW6mjnyiKBdVnGFYGwALj4IeRPWkfU5B5VqXy7M3C7DSenK0
	2kW3Nzw1w/mrY7WXGINu1FyZmfygeZldStoXe3eQkxvR7pojmFGBRUKRPlNcxc0oZaOwW
X-Gm-Gg: Acq92OE8pPvoJ8E36v4l0yAJ9QCEwalg9A/tW1ULEUM40l9m6Q/yQOR3LCX3hC6dHla
	FWz7nNhXOKvi1eSsnjKfqbwdse9qYgY1MI1AS2u5OIN9L7PBQrVCbzGuvqLC+Zj3apDy5jBMeoX
	SHDAU6ZUac5LlBRCtLi8TF2sgtLtQvs61h9D5VWiDnhdOoCUijB0hYw6BOdg39tUJAtFxBB+Rkp
	tZiSaAbzA+0Nz4xJlXaC8Go1UawU7IRHb9F5qo7KbC50pNyFtXv/+3SYKQ1pVlLOQOO2z8ia9Ew
	HyhALdCZawBCHq0YFNFEavFGnWuD5Ap7dHrORqwijwwRX03tgJr64t+dgmvv1shm1DWw0wHcTZg
	PAeiPOGIOuTTqBOjm6/TziLj2qQlDpvVxz5sXakUvA6mbWVvciUw9moUp
X-Received: by 2002:a05:6a00:3e05:b0:842:54e8:bdd with SMTP id d2e1a72fcca58-842b0fb4de6mr200563b3a.40.1780603805399;
        Thu, 04 Jun 2026 13:10:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e05:b0:842:54e8:bdd with SMTP id d2e1a72fcca58-842b0fb4de6mr200530b3a.40.1780603804935;
        Thu, 04 Jun 2026 13:10:04 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428290067dsm6721425b3a.53.2026.06.04.13.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:10:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/6] drm/msm: Assorted fixes - June/26
Date: Fri, 05 Jun 2026 01:38:16 +0530
Message-Id: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADHbIWoC/yWNwQ6CMBBEf4Xs2U0KYhV+xXCodNGatNXdYkgI/
 +4qxzeTN7OCEAcS6KsVmD5BQk4K9aGC8eHSnTB4ZWhMY401J3QimQt5nMJCgs85Edq6a83Ftq4
 7T6Dmi+nfqngddmZ6zzpe9hBuTgjHHGMofeU5YpSIiZaCvyPUn6OBYdu+YJ5IIaAAAAA=
X-Change-ID: 20260605-assorted-fixes-june-61940864a97f
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
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780603799; l=1112;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=mW3/AYYOxPahGK1I/u4/xLMfbTUSvBOizXao0/KjA5Q=;
 b=x/KV7wrpPJrdG7YhLxlqebwuNBYoQhC66TqMxQoH+PBy9pXzAmv8gmWDcLPJIGRCBTtIVZnHn
 dcVdLiec1NjCb7XY63lkxUvXjUvedRZratO/IeuWNqdIa8C4V3ZFQSJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a21db9e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5WLGAYDQTmdPK9MYQf4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 9p4L9HApEzM1IWY8v-sfcXpAXD7lHfP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE5NyBTYWx0ZWRfX+GI+hcnksPO+
 46COMD3nnZbgxtSexIpbG4hzg7tAt6hKRt1xjMGyfHWqa8VayOWqnNnU6EONvhuan9E66VG/k0n
 T6Z+7UDEKzDcC7GL5aQh2GgN04GtoztJ4U7Cl846ddn0itS79YzCHpCasu2Uz9Eh0q+IQM3JKXK
 8S8U2io/7xUdZEQyZWFWFRfIE59Jskgc04jvyYFZWHtwWHXsfBmMKOOUD/ExVoLhrBdweRuHyYl
 l0zpZtC2dZkep9OM4kFBea4LMWG828glFCHrLdpJQ1BIDbSCn0IcPKK7naM2OtqaZA2CE2uFiB1
 AH1OXC/iLBfGVSNdC+JAVUtG07C3iQQP/pnm2xp8UjZ+p8UTyN+pPVw+seXVgsPaGt1PNWEHjkA
 Y2u6mTIqeAnsLTOojtEjHHOASmWbHcBUqSHZsGakGzb5JXq76G/2KIOy1Hj65Dc/rq9Fyz0moN6
 hDJihp1O29RtKh2AGIQ==
X-Proofpoint-GUID: 9p4L9HApEzM1IWY8v-sfcXpAXD7lHfP5
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111261-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:shivrawa@qti.qualcomm.com,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: EF28B64321E

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Jie Zhang (5):
      drm/msm: Recover HW before retire hung submit
      drm/msm/a6xx: Fix A663 GPUCC register list for state capture
      drm/msm/a6xx: Fix A621 GPUCC register list for state capture
      drm/msm/a6xx: Fix IRQ storm during msm_recovery test
      drm/msm: Fix task_struct reference leak in recover_worker

Shivam Rawat (1):
      drm/msm/a6xx: Fix stale rpmh votes after suspend

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  5 +++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  5 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  5 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  5 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 12 ++++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c       |  5 ++++-
 drivers/gpu/drm/msm/msm_gpu.c               |  8 ++++++--
 7 files changed, 39 insertions(+), 6 deletions(-)
---
base-commit: ef8274b9c19a4b614e10ce95553d0d363dc1c1f8
change-id: 20260605-assorted-fixes-june-61940864a97f

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


