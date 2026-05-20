Return-Path: <linux-arm-msm+bounces-108788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKsqNjXQDWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:16:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FC5590A14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AD9C3128D26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA293EF649;
	Wed, 20 May 2026 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXQAb0CX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7MT9dG0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64F3EF0AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288693; cv=none; b=AxpezYrK/+qu2VgbeUJpJWCq1Sfh0FQLcB/iKM/NdXAN3InVTdXjqiXsUxJaIBPXn2mP8RMu/JDvAHOww4wPH898pVnYi83p82ziRnNTOrK3XP3fbehISilw+ar8Jc7uR/XQczVkBpVSkUzRt6U93CLavyHpZ20Rweo40z8BCZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288693; c=relaxed/simple;
	bh=AbLKvmfV4ZLXMCCJs/BPfAUUoqn5PKxTORgcyw+lxck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dn2LtpmkGmfuxf0JWUOVmQJw0jZwqUBg9NoNFaKLVddqu/XmwCaLUVnxbahysemTPjJZxFpnNY1JeMswDsAL096WPd46BlMf5J6NleY0U3xgHjQCdNaHXnOoYhRq2V+P40nvDhuh3nAVYzBP25I9WI1eqFGQeDwqsPBrwq8Apco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXQAb0CX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7MT9dG0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2M24826564
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zBklFj2t+5xCEM6rp+gL3G
	mHPa49NsPXvTRHaBqJpUA=; b=hXQAb0CXKBABwtcmRVYq4ZGW57hf7xYwa9Euhf
	S1IG4f476g6lfudWBs9nGfjUT6nqYgktEHrWDk81/yXn9Oc99K2CVTBm1AyQiYtB
	XZQjEgLVS0inRe0/+Qf+SM6V9lGzgFOACqq/drD0QtI+eFenyDCj9jLy8eeQRfFK
	k1vFZOstQZdq/fxUIzBQFvH6OLsxzSxg6TrbB8hB+jX2atdrX7QMJ0oFW6OEszA6
	Fzxqw3KaNwyiLnHCX7uHp8L4fQcimOI4/nwCFDmp2YxTqLHoiQY2FLktC7ap85Bj
	kQr/f2BLNQRzJo0LUJu64Y6bxOf4MB9qg5ir1EPTNd29DtXg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecag6dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d1fd7dce7so1965583241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288690; x=1779893490; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBklFj2t+5xCEM6rp+gL3GmHPa49NsPXvTRHaBqJpUA=;
        b=D7MT9dG0RZqX/YOoJoVYzrIOQymb0Dyyas81C36yesTpxRv2m2Nfcutbi3TYAGRv6K
         z1KnBShfqYfAKouU2MY+h9slYHiLB5jIUrczobKTMoLWiEfGKVibC+3Y47cHQVUjo7Bj
         PqK0rbIbdNWDsDFQRQeLp6wPmE47XQw2Ll7UrmkBIlqu+/E1fbF47XgSP1U3si/KUvOA
         MNkZYgR9CGb88UXXOiJViZs5Y9XnZACgs2oIzpQjwNADnAGpS938IwcEplRNUAoJ0xag
         7y67NsGJJ0RXVY9hLIIrnpeMxoG/w9cDMdOdjVpYYWVlh78DmGtoIqLQSEhlsnTGm6ve
         ElVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288690; x=1779893490;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBklFj2t+5xCEM6rp+gL3GmHPa49NsPXvTRHaBqJpUA=;
        b=N2qzwB7s+mugq4tFhST+xVJTtwxi8PMxm+2PTWT4X/5YjQlSx0mUzriPdSASYixWkI
         6jWaFs0vJw8O+OERHEzmPnasTZIBqbQD9QPTz+iAnYPTUZN7NbRpkfGkggbNAU69OpKY
         kpusprfAD5IEaYMcuv4ea1N9JPXKd/fhKtnuD8y/l+XeQyOpX/KohmCvlpszC1fE8XQ8
         CopvFzneS2DLh+zhX/fxIeTqAJaVf9PK285qt5wj38qPVR7kg/TQtdVgMose86qXwSt3
         CvfzYObwALuMZ45LTUe5reI+/6QSyog6GlZlHfaHtg4Aoo2Rm7q0tgbWspInMZxU2FKY
         kmqw==
X-Gm-Message-State: AOJu0YxilC9TVf1IAeG2uo5e34uLOQQ87uLUqL+t3bmwxbRSrS3gf+FX
	jHaL/DPonaaMkubhTE20VjIcZBLglC1PhYb30H0iqJD4qudgzsbvU+YxMYHmBVzWwfJl0zhvjNK
	fT7HWFYlBLcZgaqwDvpDqDZfyCNrPGShU14DOV+mi731vsGY3SJu7D156HtDUVOY/D38i
X-Gm-Gg: Acq92OGLW9J9XG3XlfmpdsTQDMeofZAVENJKDeGO4cqPzT5ibS8A+iVa4FNnEzsMAlR
	MQ2W+djrD147op1OvB06emP9CsR/21898KhhV3TdGn5jFCAeU1ExUr2su5/Td/fVjo0E5tue4qk
	zAFZEZhSgxHFP5K272ndlErno7a3H1x8Fwj/1AqA617DVZpl9Eq1X+xg4K+SKFMxh6Vm3PZl/qb
	uvJzllQv+FwmHlpWC0DoL6umyKn5yKK7CQUPuzQVV+iXnouOceAbY/B4JGxS1sETM+ysv+kkYQx
	G/hGMZIsTK1rBiM02oUWayctSWL8ZLpz1qkcOyKj870bfUKgJ3ByFmrQHOxQSJ6oc4smDRI4qkJ
	u5j+2Y/PgiE4F2hE+qNUu2dHoSPSQUj6oemQK9ScGYqTYTJJNnVgtXsp9CflevNvqnATE2oh1Gb
	aTLZOWqU7EBro0fXV0oZCZnQFRz65L+r0EoIU=
X-Received: by 2002:a05:6122:da3:b0:56d:9e98:4676 with SMTP id 71dfb90a1353d-5760c09d17bmr14071499e0c.13.1779288685175;
        Wed, 20 May 2026 07:51:25 -0700 (PDT)
X-Received: by 2002:a05:6122:da3:b0:56d:9e98:4676 with SMTP id 71dfb90a1353d-5760c09d17bmr14071298e0c.13.1779288683878;
        Wed, 20 May 2026 07:51:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/28] soc/qcom/ubwc: rework UBWC configuration database
Date: Wed, 20 May 2026 17:51:07 +0300
Message-Id: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFvKDWoC/3XPwW6EIBAG4FcxnMuWARXw1PdoegAcKmnVLqi7z
 cZ3L+seujbdC8mQzPfPfyEJY8BEmuJCIi4hhXHIQ/VUENeZ4R1paPNMOOM14wB0tidHI57G+EG
 xdgitQltxRvLGV0Qfzpv2+nabIx7njE63T2JNQurGvg9TUwx4np57kyaM27aZXJfjmqKUvvVlj
 dyVErSTqIS1wFAarWSphDNCKWuRXEO6kKYxfm8NFthStmMFq3fHLkAZ1S7LHrjn1r6MKR2Os/m
 83nPIz8Yt/I7403fhmai1l6A8N+D0A0LcE3xPiEzY3MgrxkDW5gFR/hIVk3uizIQDXWnRcuag/
 YdY1/UHSKJW59sBAAA=
X-Change-ID: 20260211-ubwc-rework-e6ce1d8eb520
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4647;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AbLKvmfV4ZLXMCCJs/BPfAUUoqn5PKxTORgcyw+lxck=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxbvqdTZlw9lMjbtYvI5tqA7XrSH/Ypq5JcyNd7Aeb39n
 BO/uBt2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiVRc5GBZJvP8syjb7pn2n
 b+nVtk23frY01W5ofzlHM17ZYt6E1zVZfO2WW44J/9rsub75ZN61n1J91loueW/YrhnttXgY85a
 X7+Uzk9tMeydxs87rVsv+sv3JnDk67BvficfUiIXujtX3s+Hp313vv2jSaf/ZTqFOL08WnBPnsT
 o1T6neLeWvb/Umu47K2wsUrOy7Ffdp6Gn6p996FXFlqZvgVRd55tjudpU/j5k750eekA5cM9/Nm
 FXe76XwtD8rrSvucVY0XVkfbKSj+9B6+ZOUDc8zBGxNDXpWSc30vRpb4Wk54d9fw5vJuwWKP6zo
 tTJ8a3ZxTe1f5Th7n4USc4RK9c0Lkk6ZqLJIG1R1Rc0CAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: c0V9oBuI7GgQkt3OEq-N8izJYG3Soe-r
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dca73 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7hJuk1173Q_9pT7ms5cA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX7tUs24fkzpPv
 31PeifRxBvfmMXzvQNxPhsqZ1ATQx8aBfU+Ip/o5hexLN8NM+cL5lc90TRrP7EkuIsA/2JSAeTR
 Xx/bFisiYgLcgapCb2IM/rsAlMmKZqulCeh6obPgB4uAkhMX/0zNRdwgP8QjuhHP0mpjbF6IDnp
 SSDOxC6Fhodsv7EPT6mksriKr0ZkBgUXOrZvkW1TJHBb38kJFNcRslaGWrm9y/tgHfjZ0azsiIy
 q9rtIrTQUj+gUGYS2FC8s/ktWTJjd+A3xXbSAaVtuSIQ9h9J1qsvyeZMXXY44s50Q2OCWsuR8XT
 29/S2H8jv34Qlhmc8F2j1Ed2MLR3vjGhkkv3E+ZHBRLk9Z2BVYFMwn4RAs3CnwqTexjL0uGYNTl
 jkLVyoM9UqkEvdUwCaa06asdPU3wg4+cvyMB9xNZRBejOI+8jCJdModfxZxKYqiXbtraXhiVqtu
 iSFjqR56+oOUZQsAHsA==
X-Proofpoint-ORIG-GUID: c0V9oBuI7GgQkt3OEq-N8izJYG3Soe-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108788-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48FC5590A14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently we store several settings in the configuration database. Some
of them are incorrect or not completely matching the expected
configuration settings. Others are directly derivable from the UBWC
version. Rework how we handle the values in the database, trimming it
down to the UBWC version, HBB and several flags.

The series includes patches for drm/msm as well as for the soc/qcom. My
suggestion would be to either create an immutable tag for the first
batch of soc/qcom patches, which we can pull into drm/msm or to ack
merging the first patches through drm/msm tree directly.

Bjorn, would you please ack merging first soc/qcom/ubwc patches through
the drm/msm tree? Or would you please merge them and provide the
immutable tag?

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Dropped applied patch
- Rebased on next, fixing conflicts
- Changed SC8180X to UBWC 3.1 (as it uses the macrotile mode) (Konrad)
- Link to v4: https://patch.msgid.link/20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com

Changes in v4:
- Rebased on linux-next, dropping merged dependencies.
- Reworked A8xx, simplifying several corner cases.
- Link to v3: https://lore.kernel.org/r/20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com

Changes in v3:
- Corrected UWBC_STATIC programming for MDSS 5.x platforms (Konrad)
- Switched MDSS 6.x+ to qcom_ubwc_min_acc_length_64b() too
- Added qcom_ubwc_enable_amsbc() helper
- Reworked the DPU handling of UBWC config, making it simpler to handle
  minor revisions.
- Removed the comment regarding the best guess for min_acc_length
- Link to v2: https://lore.kernel.org/r/20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com

Changes in v2:
- Renamed MDSS UBWC programming function to make it more obvious that
  they are related to the MDSS revision rather than UBWC version
  (Konrad)
- Brought back the patch to use qcom_ubwc_version_tag() in msm_mdss.c,
  got lost in rebases (Konrad)
- Link to v1: https://lore.kernel.org/r/20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com

---
Dmitry Baryshkov (27):
      soc: qcom: ubwc: define UBWC 3.1
      soc: qcom: ubwc: define helper for MDSS and Adreno drivers
      soc: qcom: ubwc: add helper controlling AMSBC enablement
      drm/msm/adreno: use qcom_ubwc_version_tag() helper
      drm/msm/mdss: use qcom_ubwc_version_tag() helper
      drm/msm/adreno: use new helper to set min_acc length
      drm/msm/mdss: use new helper to set min_acc length
      drm/msm/adreno: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set UBWC bank spreading
      drm/msm/adreno: use new helper to set ubwc_swizzle
      drm/msm/dpu: use new helper to set ubwc_swizzle
      drm/msm/mdss: use new helper to set ubwc_swizzle
      drm/msm/adreno: write reserved UBWC-related bits
      drm/msm/adreno: set fp16compoptdis for UBWC 3.0 formats
      drm/msm/adreno: use new helper to set amsbc
      drm/msm/adreno: use version ranges in A8xx UBWC code
      drm/msm/mdss: use new helper to set amsbc
      drm/msm/dpu: drop ubwc_dec_version
      drm/msm/dpu: invert the order of UBWC checks
      soc: qcom: ubwc: set min_acc length to 64 for all UBWC 1.0 targets
      soc: qcom: ubwc: drop ubwc_dec_version
      soc: qcom: ubwc: drop ubwc_bank_spread
      soc: qcom: ubwc: drop macrotile_mode from the database
      soc: qcom: ubwc: use fixed values for UBWC swizzle for UBWC < 4.0
      soc: qcom: ubwc: sort out the rest of the UBWC swizzle settings
      soc: qcom: ubwc: deduplicate UBWC configuration data

Konrad Dybcio (1):
      drm/msm/adreno: Trust the SSoT UBWC config

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  11 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  93 +--------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c       |  50 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  39 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
 drivers/gpu/drm/msm/msm_mdss.c              |  43 ++--
 drivers/soc/qcom/ubwc_config.c              | 295 ++++++++--------------------
 include/linux/soc/qcom/ubwc.h               | 103 ++++++----
 10 files changed, 216 insertions(+), 430 deletions(-)
---
base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
change-id: 20260211-ubwc-rework-e6ce1d8eb520
prerequisite-patch-id: 47fdf46e2c4719c7e83bb10e7a987483ca388bbe

Best regards,
--  
With best wishes
Dmitry


