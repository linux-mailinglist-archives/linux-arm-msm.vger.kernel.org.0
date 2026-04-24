Return-Path: <linux-arm-msm+bounces-104420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJPoF4w/62nvKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:01:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0ED45CABC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1566730432DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE52359A8C;
	Fri, 24 Apr 2026 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+Mx6JYq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eeq0OKdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5841535B657
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024767; cv=none; b=jgdL2IQ3kTwhUl9W5JsWS4nyHTUxMUU+yDpNCS8nG/d6D5pJXbweAYrMYs1FbqjM62OZEZ+j2sILqD5lxPGJTUN/JQQ1sOG6N7lSWNUvy2ZtJ1QW03GaCS0cJvOwM2NrH1X7cIwt3YFA7AZUUtAX63S0Tooj8V5c3BuFC/fHu1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024767; c=relaxed/simple;
	bh=wLHY1YKwTOtJ5TMOu7Sc4w4rQ5+KEfPEjuD58JrY/gw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TS8y1h7CrOWZ0kxI7vKmjnFvEakrCtHyLtD2V1AOnJT+uvikAgoqu4EjuFR4I+phm76l2vKK2hgODpOFG4VnrBh3U0FWkSmVAUaPjIFxodNFJTrGveA5cAdi3IysPmMOg3qT9uBbHhwsZy40zALGaG/DmeXE7W/kyNIC+KtzE7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+Mx6JYq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eeq0OKdG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9G7h3518552
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tFUu7w/Mdhl
	BRhU4Ur6TRUhTba4EbTByy053HqbjsgU=; b=O+Mx6JYq7lRFZnEvnCHom8+ViqT
	vUb/8nKJbqqYoLFxCdnrkK8qkmQraq9eE/UikMhzqK4la3A2hLQbgfUv5nzXr2vM
	xcVYWE1e4ttib7gQ3oBPEtQytC862/CO3HyokD2leb2Tnlcbj1bnhe8UZqrD6w3S
	pLeOiuoMKdVVvDPtwuO2CjwUzMOfF5twIUdWyMQXf8PSwO2wGrrWi3u38x4Go7Es
	v2fcyINrSoIJ77DNWoVBdivKa4rpuhEcf+gEPdS2ZYJnFeD0+KDBLqehq+NjYIys
	Tjmzv8rU/FvHx70clezLYFEVcXrj7+XuZVItDK9QGbjAxl+JNT5S8Hml1UA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fnhfqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so4927876b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024764; x=1777629564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFUu7w/MdhlBRhU4Ur6TRUhTba4EbTByy053HqbjsgU=;
        b=Eeq0OKdGyP+xY6JPCrE//PNS6hxlwhgl72RdCYkSs7zQ7QZF9PLqTvVGcQxJCA2aoV
         y8PF0LR7pzGvn+yRrYUCorh/zgWvyXViyJc83UvoqjfD2V2lLhiWYe5yLcixY7eqX55G
         Qt6nJISi9ih+SMacIZRVfFAua9NmAmBFMofb9azOy9OQxnps8pyCmxyhF6xOPGIwfK/D
         UQNqoawzelBpZELOOq7r7M1sfBvGl8/O2WNReu+l9y/+9V58odhAfBBiXz3rQ1DTqCEA
         dQ9F1vwAqtn7mnVtz4VPAk40qYtj90DrGc/aXBYxNXTr0B2dp9XgAJEhjvR5s6JX1Bzc
         uHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024764; x=1777629564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tFUu7w/MdhlBRhU4Ur6TRUhTba4EbTByy053HqbjsgU=;
        b=L2SfvxC1TcuTIcpElaN+bMWRTeZFQGcaJNqYKvO8di1svzrpg4CEsSfoD9UzYbBA5d
         GxP3fS2fg70KpgRbuEVRGaB4BUgtcXnUOnL+oHfEyPoX6Q0kd9J3V6jKAswK5Em3/nqr
         sF0CsawMh57nLhQd5RkXNZjEY0pZErEUCRc79wBCKnZLhtd1KpDYCxAFOG/8ZswXSVDN
         g2kJ1DUaSECvqm+aIfGFZBiWo4pu1SdGeK0VDMS5C99/iuijKM1nAiJbIZA2vKLgMpME
         A7+081uEJzcJbAkmyfy3/c/Gt7J3Xt/tnMRTTcL9UBELkuKl4GEMDqEidGb2Iur95dWe
         MT7A==
X-Forwarded-Encrypted: i=1; AFNElJ9j0iG5UqGzZ5oI5i0s0BjHQvTLLatUcP3qGa6vL+F6+sUsKBWN/M35IjyADv3BjMYth9J+6FkZMF178xbB@vger.kernel.org
X-Gm-Message-State: AOJu0YyINDuNmUuO8oLuHgPpEV5Xen0Pm4aEw1mgswyAeU1gKouhJHI2
	PwNBSbDk8yuP43gK9wlf+9r5jBrWpONe/iPi+LV/tbjb2yLYH3hdJdXIlG0xCd0Im8NaTP21iUW
	Wc+ik/snFluXDG0fkat4zb4TmaLpGgEGokDJbO14x8e0djKb7eNr4CCKZBlP7U+37/7Al
X-Gm-Gg: AeBDietltJNYlZO+DmAiI/Fun5Ja8+02t0FpyqYTwytUVNVYgKjmefz1x4CJ3HwmFeU
	GikInxZZNp1AErMD8zwjTlndq8KbS7MNcJsRcaFBEl1xUmxSnL4XoPNRw7jJFxi86OiOI4voljD
	k68PCA4m+9UNtEBUL/Dc9ojnC9bpNiHEWSrGAzi/7vcg4Tg2t1k77yoV4JsRmUkmhENFfxgdXL5
	T41xXCVJ/CVRbKnKeuEllkTzvJbhc79Tg5N7TrEjPSbCcsarlf7rMC5CLUuyfuj9SiqvegKIlWr
	+WYwoz9/0bmRLONmeOqRpOJpz7z6hf8/Ps9I1pO74Cw2jBDGc+oDvOnuuiBNDlCB52c9L2gURzD
	7cZYGxB2ya4pM+PkR+AtW/FBqV7YjyxEH8Mzh507S2ilqOSHBuFmRPd0MSfpl3WFP
X-Received: by 2002:a05:6a00:ba02:b0:82f:4cc9:1854 with SMTP id d2e1a72fcca58-82f8c93cffamr33456241b3a.49.1777024763938;
        Fri, 24 Apr 2026 02:59:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:ba02:b0:82f:4cc9:1854 with SMTP id d2e1a72fcca58-82f8c93cffamr33456210b3a.49.1777024763420;
        Fri, 24 Apr 2026 02:59:23 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d35acsm23679702b3a.15.2026.04.24.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:59:22 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: [PATCH v10 3/4] misc: fastrpc: Expand context ID mask for DSP polling mode support
Date: Fri, 24 Apr 2026 15:29:02 +0530
Message-Id: <20260424095903.1622565-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260424095903.1622565-1-ekansh.gupta@oss.qualcomm.com>
References: <20260424095903.1622565-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb3efc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JTa3dIKMUYn8LlmgGFYA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfXxiO7IJEX9H13
 HfyDIb6zsf7juEftgDlwTQ6cbI3DiloDaGHkvmDjU6OplcxOeYKDQ0uIw+DLafNJAhsSEQam0Nz
 LBRBiZtkWtyvyWLKzyK2tOAMfpJH+AfKMQZ2l5035aEbpwsEowlOgYGX63lG8b8G/yzHfSL6BG/
 XJxCeeVI585lKQhZ7uJiZWQMoT/gl4ROy+S/4ul7Z7sSd+7yHmXGUA46yWYfd6lYk6ykiwxHqfE
 qnq2ypuJ1A5qY2BRdcZojkHdeHhh/dp7ALi6q/g15WKjWD+UyJoJTK20BHKfZEOfRKFPvtMzhAz
 hAuvbnN+HLS5wgQWGcTg5J/1HfzK6Rmyz6GlfA7P4ETnUgtdtG180tY3ze9/MeTGLLUc7bA5PIW
 6ueLJOZmXMvlrJHfFtvvnQ2dTQgGpwbqsOY3ogNV8W6xbaeLyHxAXJMK+Bg2azd7VniAtt2RYhO
 TuC7sGN8wdickJI0ahQ==
X-Proofpoint-ORIG-GUID: YEYBeV2GIvH-vEG6reXYGPoGpDwB1IDZ
X-Proofpoint-GUID: YEYBeV2GIvH-vEG6reXYGPoGpDwB1IDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240093
X-Rspamd-Queue-Id: 8E0ED45CABC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104420-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,quicinc.com,vger.kernel.org,lists.freedesktop.org,arndb.de,oss.qualcomm.com,gmail.com,kernel.org];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Current FastRPC context uses a 12-bit mask:
  [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)

This works for normal calls but fails for DSP polling mode.
Polling mode expects a 16-bit layout:
  [15:8] = context ID (8 bits)
  [7:5]  = reserved
  [4]    = async mode bit
  [3:0]  = PD type (4 bits)

If async bit (bit 4) is set, DSP disables polling. With current
mask, odd IDs can set this bit, causing DSP to skip poll updates.

Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
byte and lower byte is left for DSP flags and PD type.

Reserved bits remain unused. This change is compatible with
polling mode and does not break non-polling behavior.

Bit layout:
  [15:8] = CCCCCCCC (context ID)
  [7:5]  = xxx (reserved)
  [4]    = A (async mode)
  [3:0]  = PPPP (PD type)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 3f5d5d73be5a..c4a3547a5c7f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -38,7 +38,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK GENMASK(11, 4)
+#define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
-- 
2.34.1


