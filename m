Return-Path: <linux-arm-msm+bounces-111493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 04l6FswMJGpH2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:04:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FAA64D4EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:04:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MlN41s9K;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q2T8NFZI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111493-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111493-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B035300DF7B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE5A3976A0;
	Sat,  6 Jun 2026 12:04:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF4537B032
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:04:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780747461; cv=none; b=fg7kHahwfkCuV7Gy/tx2uZ6LwQ24GhK9RgGa9FigQdHC6z2YFQQ2JlqLS7gPM8MfLl+xltnPw9F5UUEKfwdUWL5Q7HnZ8U+kimREmlZnN99yWs70VZcwLlh9TzO//iKYW3vGNmNPhwvqjAwDSsMuqOupWuOK0l92rv9ceDWkDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780747461; c=relaxed/simple;
	bh=qXhp5aTTYAWqyuIfDC8u3iGfRNtccvQMoUDoPTI7ziw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQHWiaLQ4DNyf7w+piqZ7GjKwt5fjZCpyver0/fK+iUne9hHT5KXxqrW0tXrPahSvoNxVlZtIu9P5eKjYP8XXdx8t+2HPczwjSIau24q8fRrXMnNBIa7UdeOMBBTTU6gOlSIkKFYHWRlbhXvLsos/YpEVBxiEEk0EVvIj9BoPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlN41s9K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2T8NFZI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BEYY81328576
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LgC2ILMkGYF/Iy0bZh6M4/Rm
	05l5mA+X3cLtGebpi+A=; b=MlN41s9KJW3HgOfVbGVxyUN8E8pzs00TpoNSSBzD
	+fi0PXUS4XxHJuvjII8pe9wdO2CpJH/3CuxWPRsh6MKWRtxoGNnwt1hjfmqGpOYb
	vbyyoheyBgokITw/ydDU45PAwHe1daYzzISUAVkUDPVvXkHBK7QTJjb1gAGGUH8o
	ZZtYF7KfJojwAlqEGR6h/J6XsMnmn47K57Kebg2G7Q8nGza7eaq3gmc1DWEU6EaT
	Tgf7Z32uQs2R8LA/tzUhoW5Y9aNy+bYtVinSuRmUBuM1xNdkZtxjx5kvg7NwYMqL
	73mzkXlSbls2fJwhkdKQls9FkOHm5n1RpU9t8si/vucw7w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8rs0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:04:19 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963c12f125aso3191922241.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780747459; x=1781352259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LgC2ILMkGYF/Iy0bZh6M4/Rm05l5mA+X3cLtGebpi+A=;
        b=Q2T8NFZIRfVmrZ90EOAiHgj+yt4OpLRbE0Fa+sGYUiQvlZAs7fj9PoH9/QHFdNTKtx
         MUl6BqQm7u1QTRIvBU2bUzhKCasYvGO9zOTc9cE+9HvELXpNQn2EIkWXt0JbMgRrXImv
         7gGqfKm68gfi2siuVvF4OpYBOUFxVeFmRUjGeiE9OAyOd8S4WIB7Mo8TOlJ36HlcEMk2
         f8ooMnqizUSw3lXjir1lbniAxArpMfq+xSbJAtMM5WWCFmgGQCHMxFgzOlLWig2oJs9p
         quG15syVyj07TGZZRhdpxia1vyOFLFpWukl7MqbYWh7BdwmpUihHjKOzZQ2h6teO6UCz
         Yo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780747459; x=1781352259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LgC2ILMkGYF/Iy0bZh6M4/Rm05l5mA+X3cLtGebpi+A=;
        b=jX8LuctvJy9+gv0+Er/dFtPD+NZYlkLN8uC3yEY1CGvRqdGbNzskylaqFQpxCZ2VcO
         J+t+PgAwS2QzNCiXyKstJ/9miLNiDaRNzMZiGGRmpF6S44wGnJmHqQs8fKHGSKGd/s3F
         VIgsWL9FQN5nJSp8WDw9qVsdTj5RzEhEpDp4+Yoms+tQIkYUWwbfjz3kjTuuOA0l4pI9
         bgazPO7ZwPkWpvCX/vbVJwLMjF9Jk9Skhmyl9HH3Lpa2a6PBNPGY5c9AQaq0hafkoWci
         KgJgC4srehtRv2t3dG+3nnH/BoPmaBmZYi0b+El9t6zZqugCpLOUyGH/O2cWKxqNOjJQ
         E/8w==
X-Forwarded-Encrypted: i=1; AFNElJ/5Q7lH3LmDyGkGKQ0Oc2U92e3bhjb0ALl3irhvY8pZZLCfrLH4d46fjvlyLpSDxQ8qPUR88bfBbW6qBU2I@vger.kernel.org
X-Gm-Message-State: AOJu0YwAFAZFyrM95QHbYLjzBgD1/rTgQBd91v6OpuZyDUCEn+JCqcwj
	J8JffXcD5RypeTQCk8yJ7pkPYCnK1Iic3p6dooOZq0mt1SC/iNWL9Y1O666+hIgATfxXOdE/NG/
	b/qT5pPz3xx9Jrk3Sru6OvhOr2Re5ZfnBoDmZE5/diR8LqBHPwsX62SnCSaxh9o9ianJu
X-Gm-Gg: Acq92OFR/e6fujVB3dGZ5QckitdcQRZZjHpdnIWavOjw5Q3pfjXugkiCbCgM3hDX6H+
	wtTtcebPDxY+uCHd/JXliE/eEHFO+6Ezuj6HPbdZW7KO/bUxzs0l4HALtB1BpOfLFnzwSvw1mPT
	My4UaaLetlxGStHrxG5skRYpiQ0ThsxAGuJIB9erD+NwQpXEsfMjV4Xtp/Dwe0TySvZCOu+mAa0
	sftgirkih+zQz0xgkEGg1CgNgUt1aW/TYLOSyNTWD0OUrpPO/M8iSLn5TbW0px/AeoI3R0AuQWi
	5ZLg6t/RA8DnpkZiBAShfIiS43+aQvbrt2mD5iWnq49FEI/uBHZQ3Ylq2e6FJszcB3bzyMi1g/R
	nFxQE3mjqWL48GLclqQfaI9a4ANO7EavKGLhkPAqF48eNnWKIfx+SwUd1LN2niSxKg+lAopffEu
	7KPZGtU4Nl3O7tPVY5LhstB9YExHHwlgA1/F/jEq+jlvvTEg==
X-Received: by 2002:a05:6102:148f:b0:632:a084:c0f7 with SMTP id ada2fe7eead31-6ff084a6d6cmr2724902137.17.1780747458841;
        Sat, 06 Jun 2026 05:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:148f:b0:632:a084:c0f7 with SMTP id ada2fe7eead31-6ff084a6d6cmr2724887137.17.1780747458451;
        Sat, 06 Jun 2026 05:04:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be04esm32468731fa.25.2026.06.06.05.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:04:17 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:04:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Fix stale rpmh votes after suspend
Message-ID: <vsgz7zf6zenvkgsrvclnsn666aviayecrxrcfnlqpf3tha7ecw@d5hacce4qc5v>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
 <20260605-assorted-fixes-june-v1-1-2caa04f7287c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-assorted-fixes-june-v1-1-2caa04f7287c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nCoZvwOUlk1Oq-totYjxFbDiMWSYRtCu
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a240cc3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=npCoGp_I_a_DEMxlm3EA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyMCBTYWx0ZWRfX0yfotkhZnN1G
 4Ka6A+FHUMSx1SWQXqf+1nM3YlB9OPKrMO6kNyrIZQ0X9WZnytciwCySKYgV9uViXcu2fTtPS5C
 6+pVVV1kvUKX/RVKeAuo2gqZ7iLd6ARjNlLPwElEuLVR4NxBvpcLhFaO3Q/+QyEA+vAMxAHRfV7
 +ZfC18sHwzlH0ynwm9YW2HPCjwrv1W+BMai+Ygq+KIAIws7be8F+PQA4C4qKn+v8VTTO/WtbnhR
 RLMoBYXzKvbra1rESYUFlBUeSdCdSL6TswZpFmVZ1Rr/5ThxSDTeLvsL5bNzlYtfu0DVvquIaMd
 E+fS6YE7t584bvtx4cTPfabGD0MBJSXxFNC+2jzumdUW3rlqyWinrY5IpWOFob1qbat993bgwps
 r9j8ItyLDyoLi+bMgf/pdj9CS6ijBJv4apKxC+aMDfCjc11umvZdGxrAmy5/xrbovEkYpXMWITW
 vX9dr5b66k6Hde+Em9g==
X-Proofpoint-GUID: nCoZvwOUlk1Oq-totYjxFbDiMWSYRtCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111493-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:shivrawa@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com,vger.kernel.org,lists.freedesktop.org,qti.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7FAA64D4EC

On Fri, Jun 05, 2026 at 01:38:17AM +0530, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> There are stale RPMH votes (BCM votes) observed after GMU suspend. This
> is because the rpmh stop sequences are skipped during gmu suspend. Fix
> this and also move GMU to reset state to avoid any further activity.
> 
> Fixes: f248d5d5159a ("drm/msm/a6xx: Fix PDC sleep sequence")
> Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

