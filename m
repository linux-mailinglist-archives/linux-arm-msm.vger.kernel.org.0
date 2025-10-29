Return-Path: <linux-arm-msm+bounces-79311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D814C178DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 01:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 481F61C8188E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 00:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8809F2D027E;
	Wed, 29 Oct 2025 00:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c42zwcBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awTYaufP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35D12C3276
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761697856; cv=none; b=nIwiIcaPD11x4ioF7RZstm0Mow9PSUXvhU5YlklDhJ9n5Cpq8z12YI4fMamkenW8kjmh6CoqazGN3cZpmRpZkJNexv/b9ocGZoxNlcEl3M5dMpU7G7MUULeA3YTq8jnx5CnULMx6V8NN8JNjKetaAFEc5Z+zScI18+PRTZNQjKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761697856; c=relaxed/simple;
	bh=vD1FNylVI27BhcdTuI6IA/Bp22wHmgL9sOtPzIZmtPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4jGks0KCgdErcK+Op9LBx7WJSdOxqmhE36FFgvZVDoRRs9DfMYKCtBlnx9y4kFNlCTnGpjGpETtaOrwuxLkLzjGVCormSb868GanvcB0qPDRmMoOfZ3hErbcs9i3rINM8D9IvMPFgkhpOSAwkglLjXbnuZZYYbTqJvUpm/gR/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c42zwcBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awTYaufP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJr55v2511527
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BA3mJgJEALDSQIU7lzkJCNPe98ZeA1NlvvJIGteEvDA=; b=c42zwcBDAPLZdF1u
	rm7Y3eie3KqdnqllpJIswgqdZu3BXIkUFqJFdU9XgoJgNd3bnPRnFaKyZCi+O24J
	94mhNFH50rJ10UJfnxKvoodqMfG1PjKrUxjnzc0FHZ3PCifct8LtKR9LtqgBHFsj
	divbCHAV8gjOjTsY3TWQdopUfvjm0CSEDiWM11WwWGEPQHirMfF7BQH1YCufGiEP
	85u+89F6fXxKrxTnhLdCmT3AhNX8DqEcfSh3OKIP9DGucnyLJYkTRWdzo49gp6OZ
	6oEYi4ypzPj44bNQI3pyYfTmsLg05ymnQooqI52RcE2sVA2t7/+0nskUp/y2X6sP
	H8TOCA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34cd8mnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:30:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c146f81cdso180820106d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761697853; x=1762302653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BA3mJgJEALDSQIU7lzkJCNPe98ZeA1NlvvJIGteEvDA=;
        b=awTYaufPzN2tOFb+qkTnGfp5gCUai01PwohNeBZ0nZMeSSZ5hbLtbEQV2QHcI6gMsC
         i71zncnoCjeYOKHDWMgaxI26eJzC7lnnqyb6WXKrc1hrpBaYmqKEyQL7wEuPd1ypiisr
         hcgQyxsAiyiEELeLGgrjvwxUOoGUrWsdPLe/owoVuCoNLgKnHVge2K065Ndz8mImbrhf
         ebhCZX4MXRO1ldKPgKEWyTNV8L899koszm12QHMp5hYCpk3ObTc4cF0Geh8xzfwvuniN
         7LdAqS/jDb8mLemSNfj8Ob+JGO1evg8tk2+Hs4vrHs9UeFTj6tJqQpcWD9fTMXbU65p4
         tmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761697853; x=1762302653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BA3mJgJEALDSQIU7lzkJCNPe98ZeA1NlvvJIGteEvDA=;
        b=Tr679z1mVDavoSGCF9pIMNftEuSwWNFvNmtg6x2hoQS/tj2Nox9r4m8wO245PZ4N4G
         3Buopn4iUWi8isdC7czgQMj5Qg5En5nS7XxE3imp9tjljDH5YIcMe+pGPZ9++mondHVz
         sDOJ1J8HdqA1PJOczYbqNj2MmSAVKhhxjtFCukjMhj+wT4O/uDJjS7ontoBU9Phy6Taw
         OHep2xIqoOYt3IJXSn+Eh/RrJ7qQK5XqjxrkOAMzZOecTBgW5DffVx38NOWt24i68szF
         KgAyL900mkzdi9ScU9KUIDVwOAZC9osJxUTpwxdSWEgrZgQ+Oeo9FlStEg8qH1PmuC8x
         ivIA==
X-Gm-Message-State: AOJu0Yw8fUPFyoW0HH72vCj+RI93nygtDGBeAiAaii2/68XDG1WBGXUf
	mpboPSoVyhor8LpDQjCSdx+wJDNYoFMJ02F3xQG0DEqBYErxv+5nB7np7ELwZEsdnl5LW4HLdgE
	m/WeMpJeS+Ktc8jaZYcNzbTeqlWY49JQ64UgYXOepnUWVr1t3sTSQo62CASyUXmV26eEH
X-Gm-Gg: ASbGncsIOxCMp2t3wzm1+tfs1u6NM822z7mDqb25191ZKd7nQtKVf0rn/ZoNLtgDU/v
	3hfXhBEw32Qmc9YvZp3x+XnVMi9NTfrC7veHzxRlLtYLLkGLtzWOLat1h3/uwSJYN3Vr0KCja3M
	QbBDbKkog8S6HkIqPnOl6GeT3J6/pZXX83CsllqAOf4PxQGxStGM4zCsPZVbFuytI6LiC48wTqj
	lfYAHfzuVYPwM+gVJP2IN7TH210L/gvokoLUAeQAxz8HrBh81zZ1H+Q0Zfx5Hf0BI+7/Uug96o6
	iCgL3HdlPc3d7ZCjlj0r+WJ4C5ULN/NZ9g7tP6xnHLGBtpgfeqF133Uq03xUGB7lKCDRLfifdhw
	xvZiA1v9OvzGJDqxRw3iLLc/u2oCSR9mjgFDVv74nB8nWYY10ZvnRXvZU9hOjsFt19ntLQcEyjc
	dPOWZlCXywKISQ
X-Received: by 2002:a05:6214:2385:b0:879:d13a:109e with SMTP id 6a1803df08f44-88009c125a4mr16066536d6.58.1761697853309;
        Tue, 28 Oct 2025 17:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyr/bWQydXn9qOo8x46NrfEYfRXvfQLrxprPj6QzPNkBQLdmOHSiqC1X0kLR/y0Ii3Ai42aQ==
X-Received: by 2002:a05:6214:2385:b0:879:d13a:109e with SMTP id 6a1803df08f44-88009c125a4mr16065856d6.58.1761697852700;
        Tue, 28 Oct 2025 17:30:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee092042sm32141621fa.6.2025.10.28.17.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:30:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm/msm/dpu: Fixes for virtual planes and 1.x features
Date: Wed, 29 Oct 2025 02:30:43 +0200
Message-ID: <176169780824.3761968.9764192918741349867.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dzspsGrpK0CxOl5S0GsUGHq936Zyjt_t
X-Proofpoint-GUID: dzspsGrpK0CxOl5S0GsUGHq936Zyjt_t
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=6901603d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=aMyzyzqXAEIezWvZdfUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMSBTYWx0ZWRfX43ME2DGM48bz
 M9xAwBi03qGcX3hoQMAT7wIZSFuFke7wcp56PAWHbuwcUYEWVM01Jr9oktqafWZa6Gf90J67Idx
 2yRkDT6gmSJA1GolscrNADy8JKtJQDyW8mfQ+i3hy4+RE2a/Hvry5u593IVJH8iZtzqmPIKcssu
 TZpUHPkPEXx7rVzgTcbNXdyiN6zCJ83JXNFa8bblUl55mlWL3sAIHHzs7P9jM/KSRuTOP92LwXJ
 IYblT/7zkPFGHh36nzsjnRFl993Jx1t1q6Tj2enI0fI4VpwRgK1eXwg55v3k5/nNS7RlDzUfoMT
 3Ki2jKEY8oKmHV5VTk/UZRU/PKE7VN5VryWMHnVu4nUyzmEtDwFaNdRX8ewtXMGisq0u6cgYXWx
 3Uee+Ypg1KboXyh5T4g7/02bAEBKBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290001


On Fri, 17 Oct 2025 19:58:34 +0000, Vladimir Lypak wrote:
> This patch series fix some issues found during testing on MDSS v1.16.
> 
> 

Applied, thanks!

[1/6] drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2319551e97f0
[2/6] drm/msm/dpu: Propagate error from dpu_assign_plane_resources
      https://gitlab.freedesktop.org/lumag/msm/-/commit/23ab0d6228bf
[3/6] drm/msm/dpu: Disable scaling for unsupported scaler types
      https://gitlab.freedesktop.org/lumag/msm/-/commit/425da3305972
[4/6] drm/msm/dpu: Fix pixel extension sub-sampling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f8bed917542
[5/6] drm/msm/dpu: Require linear modifier for writeback framebuffers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5e0656b12534
[6/6] drm/msm/dpu: Disable broken YUV on QSEED2 hardware
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bbc65d1bde82

Best regards,
-- 
With best wishes
Dmitry


