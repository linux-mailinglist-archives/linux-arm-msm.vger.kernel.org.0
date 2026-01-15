Return-Path: <linux-arm-msm+bounces-89156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8FFD23247
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12E64305C624
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C26D33507B;
	Thu, 15 Jan 2026 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7K9OY9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kly9Irkp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2429B217
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465791; cv=none; b=FfO6MFDMzDSFLtcTvgv+ImnsTLeKvP3mZchyG//fmoukZahu68eH7Ezu7NBn/kydneaU35Oql3FqQNF61SM+gEN4aON0Rpacc72FdTHbrXWxIfUpjk56lqXwniauV51D5mJC71CG14N4sBM/gocTI6I5hi08QI7UiJ5uNPa84+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465791; c=relaxed/simple;
	bh=kFYArw6kA3ak0O+0DSJcTc6oRpn6IstRIU9gS8rLTCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i9DZPJ0jb1a7wFWntPTzFHt7JNiLuwAdF4Qh9vhybu2lpE0V6/643ryUCFGiTIKrBKXxZ/qAitfy6gt0Qcxw0uz507PLrrj5BWk597OXGr88dYAWu9Im5592RJkOjTW90g9fQyvO2q8TEXZfkbtt0dXKw/fYUIXlW7Yva2NtSr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7K9OY9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kly9Irkp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6foxP1170721
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gjM0kaavbOL
	Ce1K3pLI5wzYI8dV9tn4xiVQbvJTgorA=; b=Q7K9OY9LXLBfPW2UdgGJqwWByaT
	tUOaOgB+54qFJ3fnanp5m8+lSTn+zP31zBW18qwyb57/vmUheE3sQr+0N413IEti
	F15QCJ210ELt5ug3bt1u00kkMhcB4Ija5l9N74t0Vr+FcNngJYwCVCYWXVO3DFdF
	yq+cJg4aXA8GP16cvGZtR200bJlodB98ZwWreYjqqSDJWMvzC2Y0ZgcjAmdOYvAN
	m1LzFj7X26khhLhMNzvqlZe/VLzkwOPeVZP1gSbmGW7N8HuqY/1eFJzMQa/LcM8c
	r2uQWqqrlkeTwsq1aOrzKqOEw24X2orFJUF91PebyfjnGP+7w8GboHuFe6g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84a6ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:29:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c549aaa796dso1172658a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 00:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768465781; x=1769070581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjM0kaavbOLCe1K3pLI5wzYI8dV9tn4xiVQbvJTgorA=;
        b=Kly9Irkpd38nu+1kFNyzMhD+aW3zyG16ewIpVyQ9eQWmkchnjsJvI4YFtRAaipNGr0
         Zq2uRH/IKx2xlhagnExv6wNAz56nJdmgyROVQaEH/YkMdh0nD1cBHtVE/yhGfmdRrbh8
         /ryl5l+PHwMrtvDqOPyVg40Y+TaCCB6ZfVidxWae33i3qomEuM5SX26VsfZ31U05n0tb
         n/kUqBcD/XaBrdGr7KoCHGx3LiMZ1mb6/O9I9FL5N+ODLscpoS5qA+TQEvaeLFMjwBxa
         hV5eVO7Hox2KnSHGSZW3CJocdr0C+OwFtaGTKwD82Yo1pMO4WMKOKAm5TT1g5yD3xqpK
         voUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465781; x=1769070581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gjM0kaavbOLCe1K3pLI5wzYI8dV9tn4xiVQbvJTgorA=;
        b=kYj21+LXZbkoOWZomEl51a5vT8XA1/5bM658J74wm0kFz3SfKwrCxjvW5V0DUfWXuJ
         TmkMREJVEramOS8W/pJGJYHc1gnyJNt/eE1IazrBvXicSlbD63qTl1hpAQUbrj42YY9U
         ryxIz9DGUi+FPAQhQ49a45gw3wHfaaOhY8pOvhgLRqxka/LAIfes6y2u0se8opb+JL1n
         IwGUNimnzQs/CW9OqQ2e3V9v5bLrPVY/OxVk3xvoppHdR5Tdow7kZkrzADDviuirIR5h
         bGV7q9Wx2l6X8GMP97Bll11grjdjT3Y3vnyrpVfEeRUJdQqdZdpknf2G3x3CFjxwzPQg
         uoDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+q4ZB14ofJOZwwiy/OIZyvya5CgYfS1+IjZH2TwxMQnDrMu2xsR+8Sl77bjBWfGo7nX4AejWLrWM439cA@vger.kernel.org
X-Gm-Message-State: AOJu0YzWSBc15Ie9GwXRk5Q+OoZ332+PB3emcN/lkKGmFOQ0bk7gEyZn
	NfRrTHsBM4txwdT/U0qg2cNEBX6nQ59ZmlfG9kpvnqcIrCdM002bZiYknOt9gHn3ctlks+pk1tk
	wy5XhZqnK64dvUmKjboxyZPCaNOX5dggajYU+taDPoL0scTB3QD1zusNXGw5MSjz9vncC
X-Gm-Gg: AY/fxX6cep7MvA0ah5J3+GitaPS9qrI6zCpuV7/eZWKKJZxjXUIcibgwUU500tYc/S0
	kx+Hfeg3zAViT5TPU26AAHu2I/DEBPXW6CALWcaOe2CZvu8LjXfVt+YUYtVhOUJBVNmdmwHzaBS
	6uswxFwk0Lur4Q47vXC2ZsV9Qzxup+J7z/2PuqHnsXkrb9u3Rrjv0dXFaluvrzsO+93Y6e3AM8c
	3R4A5sgoVX7lGJZMk+5N8LYYJ5wFFSn7SclD6fcHjfFuMsAIrk9a4+Q4jZ40zVYlSMClcgFjRAa
	Y+IrKkkO4kCfV6yDP3W+y11s9wXtSbAAQMa9Uablsfw7Dc492C777NXWTuw4FnRuSuZWqdSqw7+
	gC4tm3Tkypb7vOvVtB2jMwDA42LZAd8uQFbLxhgen
X-Received: by 2002:a05:6a00:1d0a:b0:81f:1610:709a with SMTP id d2e1a72fcca58-81f81ce46f9mr4520957b3a.5.1768465780917;
        Thu, 15 Jan 2026 00:29:40 -0800 (PST)
X-Received: by 2002:a05:6a00:1d0a:b0:81f:1610:709a with SMTP id d2e1a72fcca58-81f81ce46f9mr4520930b3a.5.1768465780354;
        Thu, 15 Jan 2026 00:29:40 -0800 (PST)
Received: from QCOM-SocCW5bzXR.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e69d1e7sm1773296b3a.58.2026.01.15.00.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:29:40 -0800 (PST)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, thierry.escande@linaro.org,
        abelvesa@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v2 2/4] misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
Date: Thu, 15 Jan 2026 16:28:49 +0800
Message-Id: <20260115082851.570-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NyBTYWx0ZWRfX3q7+GAUvzADY
 D7XGYl3qVBZFoCbEv2h2lg5uKHOz6UXxCw6c8SPjQUnBs7hXkSNqr+osUQ/wudG/d39Y0yqy2hB
 Bj1zgfsIe66ge0dXLubBUizLU7nqE2AxMZrmL1S3SXRT3w9t2UPIk28bQJByQgQo8yS59cXPqGw
 N79GJqn7LvIMjpP3xccSNt7ecnk1jz0eIY1TdmnNF9KSOY0fjc7CeWsvO22yfcuxI+XO1zC9aVQ
 I7JlYdzwWplbuycVwQCVSun5mCtWL5cJHjpKzEx5zrS/av97dDGyyA2RoOu95zjs38qI55yeyxV
 JfEO0Vhw/2GXuwsiQv9qpcuq8LpLN5lG+2aA861QXo/tr3Z+DUUZ0TN94IGPiIQeG5DDRPiYmA3
 riBbEsCcmUWKg/SKQFLrj7/RqBQVhp9/IBnsYQJVZt3fr2kgyW927ZxZWa+8Fpk3h/5cLriWQ72
 AZTWSLcK03XgmZi2hBg==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968a575 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Op9FgWJ_R3wbKKMAuNAA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: aHbP40aVPG-xk_092BlWvxUEbamp6YuJ
X-Proofpoint-ORIG-GUID: aHbP40aVPG-xk_092BlWvxUEbamp6YuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150057

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

The initially allocated memory is not properly included in the pool,
leading to potential issues with memory management. The issue is
actually a memory leak because the initial memory is never used by
Audio PD. It will immediately make a remote heap request as no memory is
added to the pool initially. Set the number of pages to one to ensure
that the initially allocated memory is correctly added to the Audio PD
memory pool.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 515a43c9d95d..4f12fa5a05aa 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1328,7 +1328,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
@@ -1351,12 +1353,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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


