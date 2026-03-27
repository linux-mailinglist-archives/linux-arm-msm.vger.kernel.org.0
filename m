Return-Path: <linux-arm-msm+bounces-100430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI7HIOLexmkoPQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:47:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2732434A599
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06E5D3038EBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C0037FF5B;
	Fri, 27 Mar 2026 19:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2jqdf3R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dy48YoTg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9DF331A57
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640863; cv=none; b=g7O3HDVkTEE93Vg8RsMbSqiGMurOW+XdT61wGRrk5lPU40/LehEKn05NgBAa/6W2xc9xNjPjWTBAxQNxKYlhM0ER6ptA55Pz8VKZpMATnEPWqZT0a/RP7kdAED2XIVDfEtVbRZnXe2Ekff6gyrVRu76rZzJcTuJohuPCCfs0bG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640863; c=relaxed/simple;
	bh=WM3abgIO58rFjR8x9AcACXB9XTWWJP5x/7mSQTIszlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DhhJqbtMmdEbSaPtV3mW+ROYgvCqbVdXiAXyiW7qjwRFE4QK5IeKfNQIWUJud2XmDoR8l9lDW1GZ105tFuHCi54nAycl6GvvGAmlfB/fW0jQoVGSfPO76Cv/KS1WJ2sfdg1ile2d9spxy+H9lJr7QjefZnduL+hWv+8NdYgbAR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2jqdf3R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dy48YoTg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2NTn890109
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOgN7bT9dhwG5NgoHHwQkQ9JAHVz6IIhTde9ZM7+iEg=; b=S2jqdf3RFYzBUGlb
	KJ7MaUheo32Fs2SfVETqBdpsBUuwPBdc+i6/ztPYk+wgKVxAPRqftEXUWIWjuUjL
	STRIpKGSF16XcnITupA1iUNl1E5x17N1Bqiiz9gzBe7KvL/nOzns1VARno/f0uN2
	mjpBl5zJzwwQnSb4cbcQPDVYkRD6WlvTX3mLUKPG6HnMNk9auYWTC+/KmOhkKrNw
	zPQ7lM0k/hpmgfFYVxXbANKgIwbznMMFsl//z3C+lcPRmdFAB/R/J81luD1Mtljb
	xLJwuSXuIk/Cz+8ooI1IN5cJWvNndjyx53YNHoWoBJG+ERDNtKPxZI3LNzNianlm
	olcYAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vf6rudv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093b92f327so55617761cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640860; x=1775245660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOgN7bT9dhwG5NgoHHwQkQ9JAHVz6IIhTde9ZM7+iEg=;
        b=dy48YoTgfIm7ckcdfnDI7OlQp1ZJFEPGzPeT5k5Z0c/mp18qBP5S6Bozqny1sNaBPX
         94eIn1vycnbBz3alRmVFJLB0qpHTFQPE9gFR0X4t8kSx18SWJKHQ7dQy/uumdtwQrllq
         AtopxDTGKm7nIBRZN+QPa3qxKnWyJ2nvRaE3/J58a7aeZeq4FbBl2yXFV3nofVmBvj5G
         GcwlCDvx63xeNrzoLyQPjVf0R+L27/kRJk4nNQ4llJ7nVHB8+A3PwjkE13ByLwbz40kW
         34/VfFcfII4Tkuc48PeQV1oMkEtWx6laEX6LcKowx2yyXsyfWx3slfUXyrEN9bC2j19P
         SLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640860; x=1775245660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aOgN7bT9dhwG5NgoHHwQkQ9JAHVz6IIhTde9ZM7+iEg=;
        b=cL/55r3GbgQBlCDVlmKhv4cF9hlaVT3KiKjfpMaVKc8a9hm0ET5iznumA2uGo7M+Kj
         Sb5sx4YFvHAX1faMLEW0Yz+o9/aXyUO9drqtSGFC2VoYbHKNVSNc0JRaDFiCaqw9Snc5
         zlsuNVv60iAFHOcCiVx707fGQAtyyBI4omhrMrkHmvfz/IAJ2mmjLBO5SVNh4xdRcWnG
         bfwvmxbmAjAXExjqWTIHDkG/nX5eqEWkZVqJ83KBQn69PYVrW7DFEWIHXLO/bYNpQpMC
         uSqU7tSq77/xxR4VxCCzDTWiWqLHlOIBUf6wQUayCR40lyzdcV4QtW6Y5lyn3lRfc+zu
         RzXA==
X-Forwarded-Encrypted: i=1; AJvYcCVgMA6nzVVjJXrGRQrkhXvxyWsbB8Z03ZxD4dN1xR1flXo+vYdaayCURwKITbrhpzmZLdz+2tkM2YGVt93/@vger.kernel.org
X-Gm-Message-State: AOJu0YyHggjHjiNjtbx8sr1irmtkw4i5x9krS5hoS+jZaBNrJf6YtCQq
	14c6oPD3uNYlcaoAecD6cEJFkZSH8kFN8sRmPtXxvncXi8R7YsUonN0c7fAXvW4wSI06evCGxgc
	iQNZPAYsOcsVPtq41aUJZCNbSbmTU2P6VXAQF4QJ4CjpSBKSOsdlvUBe7DdNWTnSoKVca
X-Gm-Gg: ATEYQzxnbUYwysHWM+uGIero5RLAHeym7V+49cAJ0879a8vAcNhwGp4FC+HQbKjVd8a
	8Z59aMKJviednrvJAR8i9LmFuUtu9XARuKKYWGvoEhExHHCPav7LzJyetOyQl66l+aZbCDIo/kj
	iYN4SYRBmxVeHelLreN1QZ/ymq1iuDaFJLL4IM8LFvdQ40H2763VVIdOtWCUWhqcAguQVfetIkR
	7DUyp4cLc4wHH0iiey3Me/OMKDkw5Y+b3sGVUW8FT2PGAk11j+4eV0JsqwnFvqGB/2hmox2Rc9L
	6m9ZyaXjCzXL5IzZhGfceesafR2Ji9pUKB3EM61gowK8ZSGUKPba9HHLif0s//jaCaV/xFYe+tg
	vSrYSxhqVpKWR+XVP1zyd6+erJseu80oi94u234obUZ8buiYNgLgKTU1PpH/f2I3OSmWFnU/0Zj
	xu6dLRhbz/GwG4B+ajLx5c99iDQF3Z9S7h
X-Received: by 2002:a05:622a:1c0d:b0:50b:9024:53bd with SMTP id d75a77b69052e-50ba3818262mr50765071cf.6.1774640860288;
        Fri, 27 Mar 2026 12:47:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0d:b0:50b:9024:53bd with SMTP id d75a77b69052e-50ba3818262mr50764731cf.6.1774640859839;
        Fri, 27 Mar 2026 12:47:39 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:47:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Jonathan Marek <jonathan@marek.ca>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: calculate data_width like downstream
Date: Fri, 27 Mar 2026 21:47:36 +0200
Message-ID: <177463970779.3488980.7047844927903667944.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260322-fix-data-width-calc-v2-1-d5f28136bc4e@pm.me>
References: <20260322-fix-data-width-calc-v2-1-d5f28136bc4e@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X/Zf6WTe c=1 sm=1 tr=0 ts=69c6dedd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=-uvraK2mi3rOfbV3l6YA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 9vJrecoETh_GZSspDafGhp23I3eyjMVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX12wiu43H0p+Z
 Tvlc7QNdkPGSaRbC7AjPS1QqPBtWVNbT/VV2VIyl7v501MLaMHGKvfUU7FfWo1KCeInDYS/Mhic
 d3J0sQpNwAw+3srmeHiDkLfmrOzIRah7TmrgONoLvOd1rhGVHr2yWrxW4I0bC0oNP+uM1840dtc
 15jQ3FGqH8D4FYlILI3VFoToTYdjr3aSu/C7b/10FV7zbNGy26qDpYmjNZ3JiOwrAX6yrWiQX6I
 r/GO9w1QRIzsYq68hQZpAYU/gSYMiNaa98CJCVloJhJD/RVeZFhdFdGD7CggF36RjKF4gnDGWSp
 fqO6P/gkBSnVItpJnNaVLNkI/oaZMRPxAIdXAbb6s7kdtxz1+DH9HqPKgPbgDdi+Wm6dhaUp6fQ
 9f0f0W7NfWNGwDHVsLUoPL9A5LoGRkFkvcrfBUp2tX5X7xuxEHI0t89GkupyGbm0OIrOtuDL49I
 d63kEx2g5rxfYVAVdLg==
X-Proofpoint-GUID: 9vJrecoETh_GZSspDafGhp23I3eyjMVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100430-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[marek.ca,linaro.org,gmail.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2732434A599
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 22 Mar 2026 18:48:09 +0000, Alexander Koskovich wrote:
> Derive INTF data_width from dce_bytes_per_line rather than
> timing->width when DSC is enabled. Use DIV_ROUND_UP to avoid
> rounding errors.

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: calculate data_width like downstream
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3bd3d4999f6f

Best regards,
-- 
With best wishes
Dmitry



