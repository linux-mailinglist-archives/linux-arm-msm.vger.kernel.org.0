Return-Path: <linux-arm-msm+bounces-99798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFcxJ4eJw2m8rQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:06:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C59C3206EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D771E3068A3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 07:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C311F364047;
	Wed, 25 Mar 2026 07:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0m3F5br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5/Pdszz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F43E303A37
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774422397; cv=none; b=hIY/Dzyhe6uLUBThvpltMA9+qqRgfA549RB2aP/Rf9p+h6f/VjjicW61N41C7DgH1Ev+sSpidEXa7a1rdeTa0cESttScTpKMTj9R1lAN8IkX6bRhKukeY8GCkuomY4dOiZkb8AXZEj3yafDMI4dL8IRsBPCJppMhRw5UQ4a7XzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774422397; c=relaxed/simple;
	bh=jDZXpI0NalqoL+zn0UWvL4nVQ7ubhdhC5Wlv3Vb4wJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOZZQg9vOqvc1cFn3dydY2j9KljOL/gK/eVOlc5iJOfKVcOlf16Mn+WFnpcMQPKnu6GSlmvt3kqaL5Mt9owJoacjpsYUNtGB0Z/K621GlkXHYNMicVGZbeAlOHgHxt6J4ZYa1kzvCx5Ypdd6no1oiV4TZaQQBuNE+yyN0Rwl+lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0m3F5br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5/Pdszz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4xMGR2807976
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rQsKwSTJPFyNadQFvKFExVIv
	rmCLGMcz0vINVo0Po1s=; b=L0m3F5brvM58NyDoxlUV5OVWo1Jmej53m0CksRk2
	d7xYJYzAzCTsf6dALVssxvAmBjHQ58BM0efr51a4SfNSYzgt934DCxQN6bfSehkS
	zINpH9s22Q12DVReWnso1p0P4pm9QZ1mgPuHg+cTIRsQ2TqHEYMVU2expcqGhNR6
	YkQlfy6Wqy3rd7+uTLNpsW9CNqAKnq069HlEYoZSD8TTVvFpnwQfiToUSxk59VaM
	oHufhv/vnZjJJcoqFhcPqzdMHeAv7cS12NIa+4MUdEL9j2yCCpm97X4wQ7QdRHqn
	gwFqff4iulnucegoIQrymBFi4cTG8n4irD1sPINtVw/6KQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ekswp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 07:06:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso18237201cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774422395; x=1775027195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQsKwSTJPFyNadQFvKFExVIvrmCLGMcz0vINVo0Po1s=;
        b=M5/Pdszzi3ATDTkfcE3Lnyh+K/EG4zO/sG1jKa6UbBT2RtHMZ6M0hxUQc33E3/ctdY
         extQhW8mojaO205kgNSs6j5eM1254QbUvces68hHsVdtuIJD1h/h6Vcw+1uPHZhfpgdG
         vPTteqazzmwg733MDuTqsYbScR/5tOjR8/qpBrTGimHaP32uz4i6uuHkiJuq7SKzMeFb
         QmmNgaM0i4EAIDTAF6FRokQXVO/xA3REu4x6evamnsLlG4sAW6NClV/FxWWHoc3hw49g
         mcaks6uaFt7zvExpu14NbeItOPHgegT3t7vo98ATVXRTTo+pBujLxfhCLgWA5GJW9ADR
         pTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774422395; x=1775027195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQsKwSTJPFyNadQFvKFExVIvrmCLGMcz0vINVo0Po1s=;
        b=jBXd5wxWxsslHR1VPVW6I91QpKWzT9VwiTt88i2dYTOnFhV/7E7xVEDCuEzjBtUg+E
         yIj1Qm+D2lZrorNor2AYYsSetZYLzIbEUUXUp4GFJiLwYmowiq1P3xfTHzPMmWvRwdBD
         BVnw/zoLf7zNOtMuyaJg8WfQ2im5BZNQ3Lesxb5bWmBlI0TekvHXiNYxUgyiMGAeOpos
         Vp9o/xEbBs+KfppieoFcCyZoJwnudbP9qw2m4q/unkg/RJMHUCuBfGEBleO2vG50XTk7
         B4OdH0DxVx38/qmp42sHy4GKlxfZwz7K/oA3KC/HXtxKtljxl1E+mH3Gm4B35q9qbBG4
         KYww==
X-Forwarded-Encrypted: i=1; AJvYcCW1avYi9d6dAjgsdtMMizh0OO3XJBbj/Z9L2kvqTiJ1oCHo2Z7sR/RxnEJ9pF+P4vgt8g+SEs9r/mePEk4N@vger.kernel.org
X-Gm-Message-State: AOJu0YyaG3A/Iqo/5uJErhG7iyUikGF50poHN+wg5PaVXo+KQUjfNFA5
	fIQ4yhEJXGQcq6TohCbNnkssjfEx8nc4jpDvM+G5EXRpZoU9ZsmpDMKXjDaj3qdeIoMsFi1uKWR
	q665qCO8AjRi39Mu7hQZhcIZ3E3V6Eee8G31GRJQEOnCR7dX4ijmWVXIDcJ/6KMDLf201
X-Gm-Gg: ATEYQzwkHRIWFlWWfRdOZhvy2iAIuVDckCqeFsqc8PEMT4NTUXiE53C5L00FWCAp1zI
	WiKB2V0IbiDnPojK1LLA6ksa8DXkT8db2wlPcv4Idy+67rUOTo5Fr9T6LVLpbUuIPgxnzkDjOH1
	7X/Ci4JLs+ZwypWXM8r2Ik0d5E/aDzdiCbQPmQD/L5SBGTBxaF84pQ+hJzaFsrjtfR/gBkhT840
	Ncng7WmqtRphQWsu5gk/+5GMORQQHrU22tidNGx7EuKFhBGFQArSJiaTlEstaoc6MnxLdWhetou
	cgP5+l/dtgmk/VV71afFYYxKfrNBQkBnqhHYvK32hJ/8DseIR9NHijD+rWNrm50vwR/l43Eg32S
	AbdAlXEXwTzLXdKZ8m/Xu3AyPg0BaaVCk43rqFteD+KHABsWTt3lu/pcxb/EG2WhmnzdOmmkisg
	3YaHorrhVkv8rTVxsaoBxmdDPXvzPXdChEH2U=
X-Received: by 2002:ac8:5cd0:0:b0:50b:3be7:b04 with SMTP id d75a77b69052e-50b80f01b6emr35059601cf.67.1774422394500;
        Wed, 25 Mar 2026 00:06:34 -0700 (PDT)
X-Received: by 2002:ac8:5cd0:0:b0:50b:3be7:b04 with SMTP id d75a77b69052e-50b80f01b6emr35059231cf.67.1774422393873;
        Wed, 25 Mar 2026 00:06:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2852071edsm3641505e87.49.2026.03.25.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:06:32 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:06:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/ci: add new jobs, uprev IGT and mesa
Message-ID: <pqa5xua2shwqpkmwbu2jitz2ogpbmgcd4wizb4nt6qtxstubse@4ltbfdvfpqxj>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210071138.2256773-1-vignesh.raman@collabora.com>
X-Proofpoint-ORIG-GUID: pb71DvMSzix2lX-RXeUj4DYp5EOZzXQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0OSBTYWx0ZWRfXxth/9o1kh+iW
 9t6976LR8ZcJfOaCtM6zAFuluxarzKQ3KOj+6e1DzPo8xco/GKCKj7y6uTyk0g5/uIUK8L63aoC
 4oE4KUCaoP3K6AjLQnln73nqZpy0YSERMrfvAnCBnoGJ8M6d5MIZQPHdms4t9e2/hz1CeyIy/4d
 5tm5D9mJ0qxYJYe3yph0LDkjX54nf3i67LKdsCurAPJfcuoZG9XHDIWKuGVwTifkpmL5WqD5PGY
 +xjXiiCARoXZJgfCRwZ/0XMbkNJMueXlTAz6h0r8XpMR3lnPZJfHooEjy0NnXaBzcDk1WP70BKq
 RV1tr8KJI2LF6kSi/RwkNqo3tGIOJNcyUtJXVbIT+2PWYsuPOt8hL6v4Z+MLwXXDwj0va5C4K93
 /UJ0GSc4YczoXWDbX5bYMGdyf06vaXlBL7kasit6Y8gmsEK8QDYjqgixsw6pUpokIoPOhdOPwJT
 8H/J+zn9tLR13i1A1WQ==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c3897b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=LmRgrdqyE-cJMQzL5zkA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: pb71DvMSzix2lX-RXeUj4DYp5EOZzXQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250049
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99798-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C59C3206EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Feb 10, 2026 at 12:41:29PM +0530, Vignesh Raman wrote:
> This series introduces new job to drm-ci for testing the following
> devices:
> - rk3588-rock-5b
> 
> Other updates include:
> - Adapting to recent changes in Mesa CI, such as:
>    - LAVA overlay-based firmware handling
>    - Container/job rule separation
>    - Removal of the python-artifacts job
>    - Use lava-job-submitter container to submit jobs
>    - Use of the Alpine container for LAVA jobs
>    - Remove bare-metal jobs and disable apq8016 and apq8096 jobs,
>      as these have been migrated to the Collabora LAVA farm
>    - Fix issues with rebase with external fixes branch
>    - Update expectation files  
>    - Various other CI improvements
> - Move bare-metal jobs for apq8016 and apq8096 to LAVA, as these devices
>   are migrated to Collabora LAVA farm.
> - Updating the runner tag for i915: cml (switching from hatch to puff)
>   to improve device availability.
> - Adjusting parallelism in jobs (sm8350-hdk, amly) to better utilize
>   test resources.
> 
> Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1601024
> MR: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/213
> 
> mediatek:mt8183 fails and it is reported upstream - https://lore.kernel.org/linux-mediatek/CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com/#r
> Few intel jobs fails, this will be investigated and a seperate patch to update xfails will be sent.
> 
> Link to v1: https://lore.kernel.org/dri-devel/20260127104406.200505-1-vignesh.raman@collabora.com/T/#t

Picked it into msm-next, thank you!

-- 
With best wishes
Dmitry

