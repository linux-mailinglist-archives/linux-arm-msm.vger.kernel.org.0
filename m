Return-Path: <linux-arm-msm+bounces-72418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D376B47A94
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 12:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CD31189A69B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 10:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435DA259C98;
	Sun,  7 Sep 2025 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcHGEupK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07736258CF7
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757242669; cv=none; b=srV4T+Dd5dLNLLLhh37Yn6iyt+9HSwLX0lzVcGXIqzgZzJaZzgy7KZ0d1XsVFqlLayWaZRP9kMkWGeCR84ThJiAYT6RITw9ji69PFzpQMYtNZFyQND2KgOzvEGq5pi04EAk61AutwZ2WKkWGQIAbITxPWVEfBLdQAcV3CF6MsBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757242669; c=relaxed/simple;
	bh=RPSfmxAwtSFuCLXc5bdEwSA4YdITVnQp/8VJP3TNPz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M23RkY156sTsczD3MWzLE2P8whpllnACcv/6xKUby1ArkYVafsq1sSQejkPIKCeAl+I8WPe09kgmaGMMvCZo4WFV2ZpQPnbWJ/wB0J6XP1zXJAqZ05/M9Nogn85yBcH9Mi6Wa8iR3NZ3FKSfKzUoEhjNhW7K1fp8oJxMDvD2FqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcHGEupK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5879rIc7009637
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 10:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Utiwmvf7x+ib9aisS1Pi13DrFz7GSmiEyGwpkMiTHUI=; b=HcHGEupKcXYaoVUc
	QoJz2YXnCAJB6vwcxdVSqlUcYD9PyqGiHfH/BPE31XTRUDQfzpQJoI9IEPOEJhDj
	UrEOzbgoLxuK+2V1pqipwvVQ6/2oHylhtzNoklEGJpFBzFT6Kfhnoe0XmwmwbUtD
	LIgE+FGlDcvebMANa5dSwvRIV/F0/XAO2jBpQ94RMTIUwUeyaAQF2hXPPy4nRUb+
	cDG71JBruJnAXI6cHa9+YeI8B08IcwU2C5Bj+95CLCj6ybR+22QUp6DtXfqouRn2
	zc4lem4XcQUCKgtlfLs4Awdc1sE2ing+r2QjJYl0sZRP5dHXjJ+VhF1GV0+9vW4z
	pcYYiw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8t2my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 10:57:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-728f554de59so101834196d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 03:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757242665; x=1757847465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Utiwmvf7x+ib9aisS1Pi13DrFz7GSmiEyGwpkMiTHUI=;
        b=Y7gZHvhZ0gEo83zmqescVRac6qflLvY6mb3Rx5OPzgQv3EdxhNqmribRf6RiUzmuSs
         /wgncYBmz6CnrZpAuxJyEMjJjBF0czvDNK5vfuDV2wzZFOt+BvaLrbKeVPD2jOfJ1xJc
         Rjft7548yQG3uJtmdH0CJYbg+lKr/+YIFHzSQW4rf/oeUqAA3IycPxmAl2P6y8fqGwB1
         P/8N2qCqu3gW+l2cJgbFDxoM5hJFxu5ot3+mVEu+oMWrnZIeMzxSIDEWnklK+aPOHEL8
         oZy++452BcKY1500wiOjkV7z7qsLoGOTkyZcZRRPCI/e8rKsd+8S3SBC+vepp8TSp+ZZ
         JFsw==
X-Forwarded-Encrypted: i=1; AJvYcCUvtbb0d6kM03B5XTIJAoWPJS0bq+DB/DPE4Z1HolMZmxHX/E+1iABttnAiYdIuHcEZCY//tYclMkmjM/14@vger.kernel.org
X-Gm-Message-State: AOJu0YwS0Ud11VOinrnOXU682MAH/8yHDQW6Z8qD25kpJcG8TYJsqec5
	5yOBJV5cU3FJg6bhhvapYfi/muTice/Vp5DjlMFoMkNjK0aDZ/WvmFV9Fr9npnZj0t6/rvrbQDM
	eSBboqCeg0B5RT0T2ZkgVnWZobg5uI7YvyXRF9TN+fCJwcMh+q/C1gLYTGY7cvK2R4o2q
X-Gm-Gg: ASbGnctMmOvw2iHgt7MjTpYSh/kNFURXSCHeyby5n2xWZUOAu6v8U/+PxxO3ZlQemUo
	lZ1u2j/+iAiagOXv2I1kN4TJD+7DqqFEnQhSZMQCq/yODbqp4E2wK6H2AuZU5FmrZbGqMeHLPH9
	bkTrFE9sXqzxYAsK02Iv5uB5b4GzlDS6eG90gxL+EWgn3s1b0O1d3zPWxlDQ0KhC6n16YOG4t4y
	OBCo3kHITqZvrQHbrnlXuG/rzEvSZCUYKM2FJjTd4YzESxlY5TGiMDhR8eajGUx4yMU3374Uwo3
	1frvM4Bf6slXdI/EwgwImwyUQ/m8bwKsTbE58ErwDbwrhs+3LQ7Cn7vqRMp/SWUpSb+0b6x+blD
	apViCW+fhLeKaBCGfRvpcPfpN0pdZDZDsZRe5YBYAQpor0eWFDH0B
X-Received: by 2002:a05:6214:e48:b0:70f:a8a4:e987 with SMTP id 6a1803df08f44-7393ca985e0mr52736966d6.44.1757242664786;
        Sun, 07 Sep 2025 03:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH67snNXBDbOrGPpeIUXj3nTtQsTDZBXe0/FNWFzMKo22DEE8TPYZk+Wta8WeNkI8sjpu08A==
X-Received: by 2002:a05:6214:e48:b0:70f:a8a4:e987 with SMTP id 6a1803df08f44-7393ca985e0mr52736756d6.44.1757242664396;
        Sun, 07 Sep 2025 03:57:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad4e2e3sm2850443e87.147.2025.09.07.03.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 03:57:43 -0700 (PDT)
Date: Sun, 7 Sep 2025 13:57:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
Message-ID: <eoqcx4cjrfuf5a447c62ydrrvxncbya5iw3jgpvfdeijp6be6v@goctbvocjywa>
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bd6529 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=-TsAvhh9eNYMg2Gy3vkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: uxOp5Ba9qpFLFdZx73kqOjbpiOA68DNG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXwpbZZrRY85uJ
 sjQh4YlcmXIlXZMvkwdr4OM7g0NLJG38YQ5ndZ2UNKuA1HipQyK+VJfpeRgKtKPtnDrwBs5TdCA
 +EhCLNNBvnhdO7hNhcfuSJkRc7wVPVk5P0u6O3uEyOqZ6tZXePm2GgVzuuwdNQ29rpIsNyrGpzN
 u/oc6G2RzxcOk2dM8788Y2GR7ITg4qm1YUEmCA0NpTj3deCFcyLRKFBNz47zzhYP8FxwYgl+/3X
 e/NZHjAoaezUkhZhq9nLiQTbjQp9jdVeEuTuDD/ewLLK8CrpetUx4AGeM8AAsHjYcXypuq64fnE
 sc8Zay3mDMhpRtgZr6f1kQUPYPcUthXSscumnh79SDKO76a2tfCHY0ytnQXJFK6EeUHFuHRfkFE
 GxIOE2qn
X-Proofpoint-ORIG-GUID: uxOp5Ba9qpFLFdZx73kqOjbpiOA68DNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On Sat, Sep 06, 2025 at 04:24:29PM -0700, Rob Clark wrote:
> On Sat, May 24, 2025 at 10:15 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> > > From: Ryan Eatmon <reatmon@ti.com>
> > >
> > > The files generated by gen_header.py capture the source path to the
> > > input files and the date.  While that can be informative, it varies
> > > based on where and when the kernel was built as the full path is
> > > captured.
> > >
> > > Since all of the files that this tool is run on is under the drivers
> > > directory, this modifies the application to strip all of the path before
> > > drivers.  Additionally it prints <stripped> instead of the date.
> > >
> > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> > > ---
> > > The files generated by gen_header.py include the source path to the
> > > input files and the build date. While this information can be useful,
> > > it inadvertently exposes build system configuration details in the
> > > binaries. This hinders binary reproducibility, as the output will
> > > vary if the build environment changes.
> > >
> > > This change was originally submitted to the linux-yocto-dev kernel [1]
> > > to address binary reproducibility QA errors. However, the fix is generic
> > > enough to be applicable to the mainline kernel and would benefit other
> > > distributions as well. So proposing it here for broader inclusion.
> > >
> > > [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
> > > ---
> > > Changes in v2:
> > > - Corrected author id
> > > - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
> > > ---
> > >  drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> >
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Rob, WDYT?
> 
> I'm revisiting this one, in the context of trying to re-sync
> gen_header.py with mesa.. but it is only changing the contents of
> comments, so it's not quite clear to me how this ends up mattering for
> binary reproducibility.
> 
> That said, since the generated files are no longer checked in to mesa
> or the kernel, we could probably just drop all of this if it mattered.

SGTM.

-- 
With best wishes
Dmitry

