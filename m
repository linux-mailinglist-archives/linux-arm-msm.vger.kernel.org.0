Return-Path: <linux-arm-msm+bounces-115128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uF8oLTGDQmqA8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:37:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DE6DC221
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:37:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f2xtbmOx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U8yPcouW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115128-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115128-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A06FF305B121
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049893769F3;
	Mon, 29 Jun 2026 14:15:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AE232470A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:14:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742500; cv=none; b=lxq2EVZDfovIM+l+MMiP2Bm4286UP9r2gng4wxM+ookgOE9FMLEf69KubHe1XBwWsNCJYErmercZfx/BGuFSFn6oK/LY9LtCagPYEBtUGsPmtEC3RXqoqg/VkXoAC0yajK4iKkHOtkRE43E7iEAg+fHpFvlq8KXwYmJ2+wcNKJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742500; c=relaxed/simple;
	bh=rIK8guqorKUAxx3yYVIzVRNVeLbkiV4tmneWYVrJyA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kI4xY+GAAgvPpcc5R9kv1n1We8slWAvv6deM03tmyESKCcwpPVH6p1BuNZdrQGxzrGeWUgurXNjPZoi/2jWmRSfVB4UrOktNqeTbRP7DEzUXPE2VF3d7z7BUqet+UaRpOc3N7eTS/aUofdWyIw+6h9I4KfuQg8MevUFEKZqdqMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2xtbmOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8yPcouW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASuOT2601187
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mXOc/0OFazrbfWYsIAIDhd
	aWZkbisaVyCd5gVB6RUjM=; b=f2xtbmOx6jzRy9FFwW0fcX1deQbTuKkf/8XDC3
	ju2LAZG3I1fdIG8Jpo53Vwq+seZ1NeJvu9k2Ye3PsfwvPaA0GI5WR/A9QyZwzpOT
	bfb7vzpVjD+Ilh4UBdZpyJC7rDSuBm26Nnha3btgnsk8Bybv7A3tQmojdVSxPXE6
	p/F9EnaguL30WyeAocz06VHpY4cAxsldAziZR2KSp3hcDz6JRocsLQIr8Wtw/G88
	9MI9VP+FE/39hrZW5zvyJIprme05FslUZZ3dZPLJms4o0b75w5Swy6dUW0BT9Q4h
	aX2Z42LZIb5ONGb+rXlg6yQZD1t9hKpY72hiGwNnHPJHkolQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw97gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:14:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efad04d884so29263436d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742497; x=1783347297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXOc/0OFazrbfWYsIAIDhdaWZkbisaVyCd5gVB6RUjM=;
        b=U8yPcouW/6is+nnzqoLGza/FnmzTJv9DVPGwc9URstsl6HOhG9pthCLHZ0fIEoKdBV
         AOPlBCRK/dSsgqbYJCCwChgSUNrxShIBFr9oLOzEEg1B7U0w7WLT5igxpq7tD1qwStgK
         JHEOpeWDE+qTdRveOfYtKCbqFtohTriy0RagWkefd43DhbUuJt/8wTtXKfXj+JFTKntE
         fIzVIEj58hEnJ6PA6erM9kYXjFwZD7qkWFHk/VHt9AVcA23C4N/IuPJpR7JHM8VXdVVy
         hT2G/+Pp2MXGUAEX0KMyg5tp511Ynv542Yw9MEWz91WsP5IG8hHP2JF2+k6mPBFJrLDa
         Ehzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742497; x=1783347297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXOc/0OFazrbfWYsIAIDhdaWZkbisaVyCd5gVB6RUjM=;
        b=GRN3+sYReEfkFAOJXeYFfBXhHgv0Bj68rgUr29AmfPK3W1Gi8tfAOaZhud4Zq5C+Da
         I4enNKW6i5i+rFJ50IYzry8jejCsXCFYkR+cdJNf6sa0ceYOINqGqJWQSvBJaYkExG43
         JDwBrwjP61jxaS6ebs2z4SpCVGQeBfakXfckIil+1vS5MBHKWdwHdpyklfM4vZrs7ho0
         fD2i09E+gnYWwdWYCaK4YrJo0babe/rmW4y6B3e6cJalHoOuJ2S/xRUvdhGFgOnU/Ff9
         L6GerafmquHpeEqTGhQEDBkxOI9tfsGugqn6H9UgF34M5y50hfAqg9Mr3BUfBtILSGpf
         1EWw==
X-Gm-Message-State: AOJu0Yz63xZQIAg3SB2kRS6lGSk0cl1uXKVxVy9PfblFZrprQL9AQjyu
	1XzK5sj1CruaMmJ7he0pW42SOm9JToFyFoBCTlpGGfJDYMhD7O5bP+c8/kr6WfTVCLq2pk7PxyL
	KM+sP96+COrs26ReDLTqWy1M4uy6wG9D2nJzYn63emIHJ8pFfFJ32jC/K5FBejQakRJX/
X-Gm-Gg: AfdE7cmZcF7a5E80woqE06TaSGOQVU3D6IaXEKxklVAw6QZrsn1iCMwJlmPj9CZwHmL
	X4klYlONN32UJMxLcg26EpbFe+xtBD+xkc4Pbes2mVK3McywpP0biAw9CtDI1Gwu9GHqwmvuXNl
	0xLt7Pa0L68ETjNPtfsNuwWUjuiJ0BA5JP5+GVRhL4GxEjsBmNPiQAgjm5CIaSZYJG6PUa3EIlm
	+ENxYrRLMawzvaTtWw5Yj8ykPjWO37qR1KNxNXqC5sWJAMPgNwQsksx3hvN5ZxTY1X6P+GtzWTl
	z0owjTx3iqEseurGqRNO5qb3pxqCVtsPxz0nw1tANxHhHl3ErfXOkfuo4jriR2ji2/IZswp8G3F
	/4FdWJATOBo/XL90G91AawnZcU80s8HMQ+MCWDACxxZG/ILulctJrSeWWxmIzKgOoyKao2g==
X-Received: by 2002:a05:620a:4410:b0:92e:5cfd:1550 with SMTP id af79cd13be357-92e5cfd176emr227486085a.13.1782742496597;
        Mon, 29 Jun 2026 07:14:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4410:b0:92e:5cfd:1550 with SMTP id af79cd13be357-92e5cfd176emr227474385a.13.1782742495677;
        Mon, 29 Jun 2026 07:14:55 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:14:55 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND v5 00/25] drm/msm/dp: Add MST support for MSM chipsets
Date: Mon, 29 Jun 2026 22:14:21 +0800
Message-ID: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260410-msm-dp-mst-35130b6e8b84
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=8318; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=rIK8guqorKUAxx3yYVIzVRNVeLbkiV4tmneWYVrJyA0=; b=uzYlCMvkP33408KUGPc5J/5jm1DNbVzNewNySfORXWxbzQ+pXmxMpngAOCa73zvynjUhnbL7N e7zIA5vLjmFDw5tstAtKmufZtcyP8SH6OtaCuP66uo6p+AdRmW7j5aB
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfXz663cq2MbhZj
 kfgIHzRPT9LxpairMgMbTIuoFUaQ0IC3N3th/uUssWPgcvDxxE1P1tZjKH8xX5+4AuIqLIgPnip
 CRlsK0tnRWJzsTWiKd4tzthJxJ4yTlk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX6rjQHBCyIt9y
 sQHR5K2A31RMQULhXdQw8fEUIL0+m8uPmK1jXoCDeZ9urFYBen2/d5kKCTQks9+lwGeOYb6lFLU
 7uD/6S7tGuhuWtzAG0WRSZf7BfasyiTLssy4L01jWcCEs59bHifRTbqmpFN7A7RPhsNDbSENPJL
 dbNHR7YvCWy0/bE0QZ+laNTpH0keQVE38uEqp25cjU5rDoHRb/rRlsI1sn+dzv66T2eN0pbKhgr
 uRv8yO1k4nvubI9m2YAsy/mJKucmO+21zgy3qwXN4dgTOopXeBB0Uzo/tyH+4t/czJfJpN8XzRj
 fbLjdzatnSQ8og96ne9t6rci1AflnZiN88KSZCL3yIUsRy/rramyWhDYOugL32kmqWNhm5ETJ2U
 11NVCbbwZSrCbeX82DPYDsNkeX89OcQKXhkxR4V5sg5PH7rYObitg8a2o0XiZYaesft2Yw6zGTL
 9Gf90HUpxyX9Bj832wQ==
X-Proofpoint-GUID: 1DER-fnclCV8GhO2UnwgpGKogifAKl68
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a427de2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=uKobFkzxL6-HA6XF2LEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1DER-fnclCV8GhO2UnwgpGKogifAKl68
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
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
	TAGGED_FROM(0.00)[bounces-115128-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,patchwork.freedesktop.org:url];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F9DE6DC221

Add support for Multi-stream transport for MSM chipsets that allow
a single instance of DP controller to send multiple streams.

This series has been validated on sa8775p ride platform using multiple
MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.

With 4x4K monitors, due to lack of layer mixers that combination will not
work but this can be supported as well after some rework on the DPU side.

In addition, SST was re-validated with all these changes to ensure there
were no regressions.

This patch series was made on top of:

[1] : https://patchwork.freedesktop.org/series/167458/

Overall, the patch series has been organized in the following way:

1) First set are a couple of fixes made while debugging MST but applicable
to SST as well so go ahead of everything else
2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
of the work as current DP driver design had to be adjusted to make this happen.
3) Finally, new files to handle MST related operations

Note:
Validation for this series has so far been done on the latest linux-next
on LeMans, covering both FB console and Weston.

Type-C MST support will be submitted shortly after this series.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v5(fix comments from V4):
- Dropped early refactoring patches (v4 01-12); restructured as
  "move link-level teardown", "factor out _helper variants", etc.
- Dropped v4 39/39 (platform MST stream list); use DT pixel-clock
  count instead per Dmitry's request.
- Patch 02: Remove artificial max-stream limitation check.
  unify register naming (REG_DP1 vs MMSS_DP1).
- Patch 05: Calculate ACT wait time dynamically from mode parameters
  instead of hardcoded 20 ms.
- Patch 08: Replace start-slot loop with direct math; fix commit message.
- Patch 09: Add locking annotation "Must be called with
  msm_dp_mst::mst_lock held" to msm_dp_ctrl_push_vcpf().
- Patch 17: Rename prepared flag to link_ready.
- Patch 22: Move drm_dp_mst_atomic_check() call into msm_atomic.c.
- Patch 23: Replace bridge-based MST DRM model with encoder-based
  approach; remove redundant bridge layer between encoder and connector.
- Patch 24: Add drm_edid_free(); add FIXME for bpp negotiation.
- Patch 25: Use dp->plugged flag instead of link status for MST plug path routing.
- Link to v4: https://lore.kernel.org/r/20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com

Changes in v4:
- Fixed most comments from V3.
- Rebase onto HPD refactor V5.
- Fixed casing/formatting issues, for example: “mst”.
- Drop .mode_set() and set_mode in .atomic_enable().
- Rewrite commit messages that are unclear.
- Use the same API for MST link and SST link writes.
- Use the new drm_dp_dpcd_read_byte() / drm_dp_dpcd_write_byte() interfaces.
- Remove some unnecessary payload fields from the MST bridge.
- Remove some defensive NULL pointer checks.
- Reworked the patch order to make the series easier to follow.
- Add support for more platforms.
- Link to v3: https://lore.kernel.org/r/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com

Changes in v3: Fixed review comments from Dmitry
- Fixed lots of comments from series V1/V2.
- Rebased onto next-20250808.
- Rebased onto Jessica's HPD-refactor branch.
- Fixed formatting issues in commit messages under changes.
- Removed unnecessary one-line wrappers.
- Relocated MST-related .atomic_check() calls to their appropriate positions.
- Removed the logic related to slot checking in .mode_valid().
- Link to v2: https://lore.kernel.org/r/20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com

Changes in v2: Fixed review comments from Dmitry
- Rebase on top of next-20250606
- Add all 4 streams pixel clks support and MST2/MST3 Link clk support
- Address the formatting issues mentioned in the review comments
- Drop the cache of msm_dp_panel->drm_edid cached
- Remove the one-line wrapper funtion and redundant conditional check
- Fixed the commit messgae descriptions of some patches
- Reordered the patches and renamed some functions and variables
- Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-0-f
8618d42a99a@quicinc.com/

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

---
Abhinav Kumar (19):
      drm/msm/dp: introduce stream_id for each DP panel
      drm/msm/dp: introduce max_streams for DP controller MST support
      drm/msm/dp: Add support for programming p1/p2/p3 register blocks
      drm/msm/dp: use stream_id to change offsets in dp_catalog
      drm/msm/dp: add support to send ACT packets for MST
      drm/msm/dp: Add support to enable MST in mainlink control
      drm/msm/dp: no need to update tu calculation for mst
      drm/msm/dp: Add support for MST channel slot allocation
      drm/msm/dp: Add support for sending VCPF packets in DP controller
      drm/msm/dp: Always program MST_FIFO_CONSTANT_FILL for MST use cases
      drm/msm/dp: move link-level teardown from display_disable to display_unprepare
      drm/msm/dp: factor out _helper variants of bridge ops accepting a panel
      drm/msm/dp: replace power_on with active_stream_cnt for dp_display
      drm/msm/dp: Mark the SST bridge disconnected when mst is active
      drm/msm/dp: add an API to initialize MST on sink side
      drm/msm/dp: add msm_dp_display_get_panel() to initialize DP panel
      drm/msm/dp: initialize dp_mst module for each DP MST controller
      drm/msm/dp: add connector abstraction for DP MST
      drm/msm/dp: add HPD callback for dp MST

Yongxing Mou (6):
      drm/msm/dp: add link_ready to manage link-level operations
      drm/msm/dpu: initialize encoders per stream for DP MST
      drm/msm/dpu: expose dpu_encoder ops for DP MST reuse
      drm/msm/dpu: use msm_dp_get_mst_intf_id() to get the intf id
      drm/msm/dp: wire MST helpers into atomic check and commit paths
      drm/msm/dp: add dp_mst_drm to manage DP MST encoder operations

 drivers/gpu/drm/msm/Makefile                |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  40 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  30 +-
 drivers/gpu/drm/msm/dp/dp_audio.c           |   2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c            | 473 ++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h            |  17 +-
 drivers/gpu/drm/msm/dp/dp_display.c         | 394 +++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_display.h         |  25 +-
 drivers/gpu/drm/msm/dp/dp_mst_drm.c         | 583 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  14 +
 drivers/gpu/drm/msm/dp/dp_panel.c           | 197 ++++++++--
 drivers/gpu/drm/msm/dp/dp_panel.h           |  20 +-
 drivers/gpu/drm/msm/dp/dp_reg.h             |  68 ++++
 drivers/gpu/drm/msm/msm_atomic.c            |  14 +-
 drivers/gpu/drm/msm/msm_drv.h               |  19 +
 drivers/gpu/drm/msm/msm_kms.c               |   1 +
 17 files changed, 1718 insertions(+), 190 deletions(-)
---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260410-msm-dp-mst-35130b6e8b84
prerequisite-message-id: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
prerequisite-patch-id: 1d440cb9fed2bdd66d8de0e1e20475f0fe166973
prerequisite-patch-id: be0f4b80697df7224c80362b161b8a9f0a542184
prerequisite-patch-id: eefa6e6353df301420feae1da704a9db2c2155f2
prerequisite-patch-id: 9e9095f82dd6c131c9f3c1de4fdb8a62bd65ca24
prerequisite-patch-id: 3e635f008f9b56823101abd9253905f078fcb3b5
prerequisite-patch-id: e39e0dc124ed043c7a419610ebe03ad105da27db
prerequisite-patch-id: 945af39213cd4241e1a5929fada04a9286aeb5db
prerequisite-patch-id: 898ae7e4582a6b31492c223e7dd167fb9ce78096
prerequisite-patch-id: 3887553893357c1ffbda99eb010801bc2166cbad
prerequisite-patch-id: 7ccd961fa3c6f925659dee7d7a5bd167c8e7331b
prerequisite-patch-id: be2bf918e0e87ec2ea999927f36bd172c498748e
prerequisite-patch-id: 6aacdabb2dd0536dc04da04f8419ae39e35f8b19
prerequisite-patch-id: a9f27eff8f643ff445810b17d670891928f5b416
prerequisite-patch-id: efd300a2b52715153b8c1c7407db696eb331594b
prerequisite-patch-id: 950abefc4862050ef606404977fd27c5dd2cbb2b

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


