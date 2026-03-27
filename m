Return-Path: <linux-arm-msm+bounces-100439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNikEVffxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:49:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD44B34A70D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ABAD3064D1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156F6391845;
	Fri, 27 Mar 2026 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8YtDxxy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJdLeNqS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AF8391515
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640889; cv=none; b=G+xjX41EnchrJj97Ii0v8iFHex5kyOjoURis+xMKz5tiGxzJFFMWVTuThO25hH7r08dk5LCk+bWFlhslQkmN6pZjUtbDBIwp/yTyMRaPDekPdisg4jPXX9Mjzix9Zj21ZXVFxpvpCgJMs6BjIEN13iVR1UoxRcSKOl6poL1m90o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640889; c=relaxed/simple;
	bh=NEtgko5H0gKowadyQ4fnz4z6Uvu/2Z2urrxPiIfHOOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dpuNPyabtcx5iWliBJ3pWka+ltosCFnXhROOomtCk09BSa2lbIoBd+SStM0SVAoH8rB6JfohQYOlcjcPRHR7U8ZW1BM9Tt48AqR4sXoGtTqa1leNSghYSEq3Z1VRF9uPirsaVvfREYp3XNS0+cbQajQhVBOm3VoOYpVeT4RygeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8YtDxxy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJdLeNqS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2hOm1458603
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kn1lDIgQd3VByYsW9FmcphaYaDwGxy32eDmbdbcDV4I=; b=n8YtDxxyX9cc5WRJ
	3WIvrO31j1v+syMckBhOzmD6FrHiphMb4MZ3AC8NoI0t85bTTu6fD+OqpGQW4Blk
	o9+uTmhjg861mOTBk9fk4S+RvyLfgc5IiIAWpLxuJLPF78iKrldkDDu7yKdO6sjw
	pE7aB4mEy+K0TL5XcN5JA44aJIqtYxdeXhIG9AMUUTzPTyrZnsS+JYB2Bb8LBmrm
	XwVZ7j9464js+WttMdcsGfsUa+NwKFvik+5OfIF3UKNh9XVKrBhxTUcWXPUwQGzR
	GcfyYxa/VUni3CBtp0p14bY0txPGJpHSeTw9FPdYwK/IBX8k+O4caqoRynVxsZi8
	PWv1fw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6m5x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso77375021cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640886; x=1775245686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kn1lDIgQd3VByYsW9FmcphaYaDwGxy32eDmbdbcDV4I=;
        b=NJdLeNqS5YatEcf04c1lZCu8e5/56xOoav0jOja6TsKBUd6rX+wttAxcssj5sUX76A
         IzSXLUivauG5R3omW0FD6NQb9COfoD30dI1qBH46EbMA7cxg/Kf3blswGwhSZJTKgV4R
         cdEkoZG216OW/veImyE2PpUk2J0SIQcSRfTtxQk1V7Bd/Qiez3R8F1Pf+uds6P27QijE
         hi2b9OHVEwRjblfwCpzHkw8ZNDZdlrPiGL52cla43GmBxgaBSil2zreDFs4w/QdtPock
         qEq/c+InpKGWkIIEV0LhGGaBVJmTZF0VJ2tpEJ6is0nAXlg8gWzZnZG44zvfl0aT0f3R
         AF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640886; x=1775245686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kn1lDIgQd3VByYsW9FmcphaYaDwGxy32eDmbdbcDV4I=;
        b=lMq4jukTCQ5G/p//E83dFskgLjQNIx1fePepqD+nJ3V6P6y0kqDhjUz5CmMfTRWplr
         5RXP91e9AIeOUlg/DlAFQk3MBKKvkGbpv7eLxZ9S5gB0BuUXAy9XvYiHuyeD6yKBdmQ4
         JdbbbT2idZJTpHTlEunE8oOLsKCoX6QPTdpvI7FtzhEweaOOb/giOH2b86IqnisVKHbB
         AH2NtohsFFDpkSG9f4+1haOf5hE6kX2cQbNkeLEV5zvlyBSGgqbzc51LPwjdru3jkqKe
         qqkgrGFc6Gp2w/B0xnX73EBgx59AuGV+WNSa038Cv3N563ceM2JcTItyyxXYjHvvYDw3
         UHQg==
X-Gm-Message-State: AOJu0Yy8JM8bJfrQgkYJX0yV5rN0QBxqA4ublkKQZznTWxve3bfUXi98
	w8UgdAJEOMW+OmzxznXo2+3B29YCOnO5K0EVxSP0cxtsV8Y+XZbvVxGkBSyEzEQRzxrXxt+OqiN
	RvCvDh1Wn3Sad00CspgFKOw1P8eQLH5clgyw0YfTxqg9RGQo2It37YWeImINn7zz8r95s
X-Gm-Gg: ATEYQzz1UvH95iHDUZYnzTTmju2RdHC3WI1Kqbbt9Z/d4sbDczeqyuh8Yddr4ELsXDK
	UsY45f35BDD7p9rMR7fO313MNQ+AXk5uXjW+SijeTEtTYOeWjZxHlsyKQUajbahIxdvoLfH281B
	eBbsLO4cYcKhl/JXrMhM3au94/705rrLQ3cQlN3SnWg9dEmz3WQe6ofXIXZWb4Su8vsrBaJRsQr
	5E2tCx7n7OuwFbygf1T9GOOsBIf9TtfD0am/PyKjSiyPCUJFN0j/aIcSCB7TZmnrC++7EW+KEI3
	YAbwNmwJOq9wZTWghRVi8GYjdLkKCqyppuTkv2CZaidmzlBasWAgLTdlKiOALsfkEP/hDW3EjsU
	mow2/FOWwkmw6w2tEZJYKfNAamEaq6q8GpkJ+p7vTPpuEPZxwyfPQ/bMoxOrjUsxsgYFWonb6yj
	05RWgxTpDWy+TlEX/693SAzQR/YKT5AHhh
X-Received: by 2002:a05:622a:2593:b0:509:1a72:e332 with SMTP id d75a77b69052e-50ba37f5c80mr60821551cf.16.1774640886035;
        Fri, 27 Mar 2026 12:48:06 -0700 (PDT)
X-Received: by 2002:a05:622a:2593:b0:509:1a72:e332 with SMTP id d75a77b69052e-50ba37f5c80mr60821171cf.16.1774640885520;
        Fri, 27 Mar 2026 12:48:05 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jun Nie <jun.nie@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 0/4] drm/msm/dpu: Support quad pipe with dual-interface
Date: Fri, 27 Mar 2026 21:47:45 +0200
Message-ID: <177463970774.3488980.2908819740590107753.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312-msm-next-quad-pipe-split-v19-0-4ffa2b06c996@linaro.org>
References: <20260312-msm-next-quad-pipe-split-v19-0-4ffa2b06c996@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6def6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=pWIBXgJe2REoKf9fSU8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: wIyuoPhsfTVWxey1RKzu71qThA0ldURG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX9n4BNbVAVCbu
 CzNnSn0kzBtovpp1nAz+x92c4JCw0+u7S896AU5NnYBCPX1DG9AQbeU4x6Y8bs/4sevwkAT5b+H
 oqXiLtjvi+sVr4j7xVO29Aj+Op8TLrxxWaxSP691+7E7c/nOhwhYmDXdHVearXLMST8g2cgnNy9
 uWN+87pMaGjpEOm1egEicKa4WOzCXe3oPxZm99YX6zobR6Jb8KU5P3wluwbyZvAV8VkTtFK0Gh3
 Rapm5Wq2boitfDFHaYK0BTHmLCh+OJq19gEMt1lzR4SEM1n3WSrcDoC7EyeAymtklWHmwwj1caM
 XVSTbhrW1ViBQSj/fviqdUhcmbJjaVihdWfXSX2Vq235Tgr1kaHvu7c8uSpnVp/YPK773GggBtD
 kl20K4TUADcfQyYmqavGis73sLQ0ZaQyv/k72E/hnD1RvghofmNdXeLgYs940c5gPRN9raqYDl4
 n7Omel3MhJdoc0cNHdw==
X-Proofpoint-ORIG-GUID: wIyuoPhsfTVWxey1RKzu71qThA0ldURG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100439-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD44B34A70D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 16:28:09 +0800, Jun Nie wrote:
> 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> And 4 DSC are preferred for power optimal in this case due to width
> limitation of SSPP and MDP clock rate constrain. This patch set
> extends number of pipes to 4 and revise related mixer blending logic
> to support quad pipe. All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
> 
> [...]

Applied to msm-next, thanks!

[1/4] drm/msm/dpu: Extract plane splitting into a dedicated function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/febcd37fec12
[2/4] drm/msm/dpu: Defer SSPP allocation until CRTC check
      https://gitlab.freedesktop.org/lumag/msm/-/commit/25ee10927752
[3/4] drm/msm/dpu: support plane splitting in quad-pipe case
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9c171c36d83a

Best regards,
-- 
With best wishes
Dmitry



