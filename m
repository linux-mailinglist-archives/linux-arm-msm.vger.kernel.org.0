Return-Path: <linux-arm-msm+bounces-108009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HgVMrOMCGohuwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:26:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B43C55C61E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3FEC3019118
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 15:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DAA3E4C70;
	Sat, 16 May 2026 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqIhJgqZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bm0w5f1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE413E51E4
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945129; cv=none; b=SRLxwj3PjRsIzq01ZYjmZfBYxfOoZbu2DMJ0uhTYu1ojddKGn+EQREwoyC/liGpWWGqfu2PafZU84hAb8x6CIy+UC4NGX8Aru6N77Nz3NFWQqmh2CgS/tQodlRevcacdEAQaE6+2dCtGGXPleUqIFYW8UGFZl9N69t3iKdBSGak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945129; c=relaxed/simple;
	bh=Fvji9RcyTiKfG0dkZcO4wvvqyBije/EDEjAzZvg1BTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XmwTwdKGljqKcWD68lhDQMqR8LsO/QqifF70IJmyU0qvOipP22Y6VahBacR0w22EQSSK0njufFNlHAPK4SbHnPfVipqShfjHmJS5xodppVwXavHgkR+9p9aZjF8wn/I2RvZBFes/LJaayvo0ND7wPLxAvw33t5Uu2BXUEpvUeEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqIhJgqZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bm0w5f1m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3gqQn1904307
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WX1w94r/QaasPpQANeeI0L0VSU8y7Cky6BlJL4HBZNc=; b=CqIhJgqZI9rPdB6r
	oIgtww6GX7bMRomjaA8N1kYcZs8iW77PgXkYVTSlHYtfbrbjicQj4ec6XIrrK0+G
	/BoDfTBHJf+eg6BmB+BXSIXj8ijfb4WRbYWSrfrYMNikW6P+1bs0tO9ZJx5Zn5O1
	MwQAdWBgu+yDfO06GKjW+2E04JyMWS6j2rd245twIlchQE4e/9TEbm4s961NRscn
	RPScDQyd2zkJaN2lmRXnjoC9OI0QfsSu+zbiye6qHtLqMgrE+6NQmvS+kj5v/Hhr
	UakF6k0ydlcPAmTVzForqmwy5+siPoXBo+H0FOxun3NRKi2DD/7ymkhubZ1w5zih
	TkRf1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gwm94x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc70cfbdso25156531cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778945126; x=1779549926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WX1w94r/QaasPpQANeeI0L0VSU8y7Cky6BlJL4HBZNc=;
        b=bm0w5f1mi4qovp2MIgiO2Mwx0LEDSUMb0eQqzoeizQh7CZcpbzK9BC5D/ZIhPe3/OM
         gu/R08NgpxWSQu3cfLFMaf1Qhkj1QdCUivPpk2u92GYFoTuROfwrTsKHFaDX7Eer/J41
         HseWEAUXqPeOHqJsBLaXIXnHeIc+y0t44RcLywAXKQivzmG6BrEtsUK34o8ss6FtEt/P
         YfwUSoTczBd84Fa6m3QmRGJHNtaIte9HCdVB51qzDs4Md/4wFFaecVCUevtiPIo77gHr
         H9w6Q7NglUy9c7JQ+CFYWn+fBl6Ej3M9sAYd5Tn9aXS3F5u6rlfiTsAm4x2eUUeVH8b5
         BdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945126; x=1779549926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WX1w94r/QaasPpQANeeI0L0VSU8y7Cky6BlJL4HBZNc=;
        b=D8dxwUb4y2w//lqZEcm6FnEzyLtU9JkUya7NXVPXO4Ft1S+7GQSMfFEZhyxy5HJsSf
         tolWImYBXVhgqFZOxoijQ29lmPikiGQ1MsPC75CYtLV69oubu61n57ZZW5L5V4FPPAHV
         8dvz84hEG9cZQUhwzla94imLs+JzMViu2SvQrdxthfFZ0FEpOWwV8e50ulmsKecXAqmR
         cOJ4M3iboR5H9sP51AHaLKa4mWHQuBDMJX5CLnA664dQPqG+wMCzz950ejWayF1JjtYK
         blyvKZrRDsrCs7OybeGGS3XuyCLT7ZzqUU3ru1vRQ9onxBytDuxk9MoeEtzxeCAr2ZFi
         gUIg==
X-Gm-Message-State: AOJu0Yw/OCANZi2vbyyl/nV0WXHBjTK8BGSn/a7WJ/LM0cTxD1oQR1pS
	Mzrvwdu5sKzPlenbdOFTE1qUVP5CV2flyqCF7crGlz9C7wPOIhOy9eFpgNarZUibkgsRoNTvny/
	QMvC9LWCNtIjji3gbTuKdzqcnkclDXyqBORXMl1anlSBqo2woZJK/qYU9t9/nXzEhND2k
X-Gm-Gg: Acq92OGLNoK1LWyKaLVc6BnZlugxaHuU7IZ6OksMy7W6oOGM5qHpyt4G7I1bLxwlPl4
	l3pSrA9fYLcHJXlwtnF4v/nS/oBRahbhXJiHi0WcAvBP0bC3XkWEL0smRujh79f8PQmpLTdV+Of
	/Aj0PVvAkmmNYP3GdB5d9XUYxs5skSZhrnUshyAL1+LYaHWdYAU/8coIRIV82svtQqn+gcNYhfH
	Pcifg7LDglTIxj6ElJucPyx5D7Ngdi8ROLBeuVZ+BneErWZK4ZHYNtJQXq3xD3HaFKO0FvPQL5c
	QyIx3n0xViE6CH31AXV8I1JU3I//cWYnXVijwpM1RF6FgUEZGlrSvTDUWrp73SoOT23wuaWdBB1
	2ulJg2qHoZd/fKjy1Dcgz6JC+BWBlvxSjuyJnUBRnBhD1wGh795YbW++/7oLzUfT6WZ1NaGYalY
	tec26m2w8vrTzbBgVLYx70Yie2nWEBkPKRCyU=
X-Received: by 2002:a05:622a:8e1c:b0:516:508b:bf4d with SMTP id d75a77b69052e-5165a276f74mr81299031cf.56.1778945125947;
        Sat, 16 May 2026 08:25:25 -0700 (PDT)
X-Received: by 2002:a05:622a:8e1c:b0:516:508b:bf4d with SMTP id d75a77b69052e-5165a276f74mr81298701cf.56.1778945125537;
        Sat, 16 May 2026 08:25:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm2057972e87.70.2026.05.16.08.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:25:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix UV scanlines calculation for YUV UBWC formats
Date: Sat, 16 May 2026 18:25:17 +0300
Message-ID: <177894506981.2448625.3862253591759722502.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414-topic-sm8x50-msm-dpu1-formats-qc10c-v1-1-0b62325b9030@linaro.org>
References: <20260414-topic-sm8x50-msm-dpu1-formats-qc10c-v1-1-0b62325b9030@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JFdjVyzvAS6PhtNcvFm0OQ_aVMo8BBII
X-Proofpoint-GUID: JFdjVyzvAS6PhtNcvFm0OQ_aVMo8BBII
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a088c66 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=bg9aKFcPh1BOHeFtNEAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1MiBTYWx0ZWRfXxnD347jq3ca0
 amSUDJfn3gnmUbjMUMdnfzP8IcvUMZyBpg9ieDpsXHc9T9lzeZqRsMAzuqUkr4xTlMu9rDoki+v
 goTWJlu0oYAlpUuHDsK736rtXYKX5mQ02yoL1A1PQhgCtC7iF5kmLcf4RGwOydoE50D6JLqd66G
 b/VEJ+Tu3o7nQxgBTlYlPX613zcy3ZEdaJzG1Xe1JeFnVSPNeBiG6B4UT4dmtxvJEhzsri5zOWH
 BOnGoQhKiHLaV7IlLWod6ti9roS9qaOADORdtTDBqzHZdmJy8NVBFE5zMcNWDsZpTNd/fcigxiq
 kSTeQydlZVm0dK7it3huFQ4OfHt0UYWms0Q7mAVfcRu0+nZ/GCWSOhHSFvZcpOVpfhauTB4TK3/
 1IZZj/sRAz/UupIt2DQFcWJLNvgb6YYClPel35uuiP7C0cc6iuf/ScLNLqFIqGeEaxIKNtcWdgX
 bo6JyKtou6vkbhnFbOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605160152
X-Rspamd-Queue-Id: 8B43C55C61E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108009-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gitlab.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Action: no action

On Tue, 14 Apr 2026 17:14:30 +0200, Neil Armstrong wrote:
> The UV scanlines is calculated with (height + 1) / 2 unlike
> the Y scanlines, add back the correct scanlines calculation
> for UBWC YUV formats.

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: fix UV scanlines calculation for YUV UBWC formats
      https://gitlab.freedesktop.org/lumag/msm/-/commit/933430f1709b

Best regards,
-- 
With best wishes
Dmitry



