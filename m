Return-Path: <linux-arm-msm+bounces-28343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5B794F7CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 22:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C355B21F8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 20:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BAE19306C;
	Mon, 12 Aug 2024 20:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nxbBOZxa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747A192B91
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 20:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723492943; cv=none; b=dlUjQeMf0StFRyFoxGBl42Yi5kHk3EndUEltDY30sh9YExfoI+iYOIeKiRUlRxUjlb1QrqEF84/tQwFPS2bGeqoKe2PY60aEDvbpLvsfqw0IBdY8/OgE/G6tbrwEHrpS3xijtrgl/lq4aQ6/4EPZoM3CiHpj9SZTkGgB3TL8Jt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723492943; c=relaxed/simple;
	bh=rao0u9gk14XhE6Jr85jlF8D9rpvtnfpk4a+EAA/gmIA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhKHQhMk5HKIZ+l/1KLjKuleyOd0K4hrnIPJ5BJfwx+ZP9qT8U3YaX57RisXruLH7BPHriReVgqYb1+Pf2K/1pCkC4z7LzVk5BzMZFGRtx2UwA+Rmz9btVNyfq+02a/orAogEftZQof+zZ1EUXo/NOMgzktgOhC2ERhL90MMK7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nxbBOZxa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSceS003151;
	Mon, 12 Aug 2024 20:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKPiIdjP6keIkab3WQfDTW2IhghyuSp40KwoiJZCtK8=; b=nxbBOZxa88c2UZKf
	thj2Zsqzfc/wacw1jsh13EBPAmkY4DYsqKks1ij2QM4HFx0OROr/tq/UA/yt+sHV
	BvMZ4JiZqzUZloB85XggeL2t5m3sTv9gZhS4kIl4wY+E6GbhIP34jp0umCQ9la11
	C6x/fmuy3EnmTLWYY5K2+kz5oZInJW+y3mTOgBu0nOI7Ku14LoymiMLrAy5jnVM9
	kQVeyU6B5B+ovvtGKO1ewvLtlOht6TYEfc/wnypfl3/ZIcBJJfYBtiaqY7iAGGUA
	k6lPYcVKZXHR6V0Z/f7D0UtBKZZbWU44qzcUY5Eqm2qKgV+OiO5hSYdLc4b4rxIM
	SC2gAw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x17sdcjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 20:01:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CK1QNk017118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 20:01:26 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 Aug 2024 13:01:23 -0700
Date: Tue, 13 Aug 2024 01:31:20 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Connor Abbott <cwabbott0@gmail.com>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/msm: Use a7xx family directly in gpu_state
Message-ID: <20240812200120.zqd7ozduvl3uxfln@hu-akhilpo-hyd.qualcomm.com>
References: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
 <20240807-a750-devcoredump-fixes-v2-1-d7483736d26d@gmail.com>
 <20240812060854.xvtae4o6kvfnuxcx@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7EoVw0JGqjk9j7m8uT2R+MPzAuwGn7jB9hAJ7uvPu7ZfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7EoVw0JGqjk9j7m8uT2R+MPzAuwGn7jB9hAJ7uvPu7ZfQ@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _A8w4IRjYyfHalEcEW0HPr_xy_tgUVfs
X-Proofpoint-ORIG-GUID: _A8w4IRjYyfHalEcEW0HPr_xy_tgUVfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120149

On Mon, Aug 12, 2024 at 07:25:14PM +0100, Connor Abbott wrote:
> On Mon, Aug 12, 2024 at 7:09 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > On Wed, Aug 07, 2024 at 01:34:27PM +0100, Connor Abbott wrote:
> > > With a7xx, we need to import a new header for each new generation and
> > > switch to a different list of registers, instead of making
> > > backwards-compatible changes. Using the helpers inadvertently made a750
> > > use the a740 list of registers, instead use the family directly to fix
> > > this.
> >
> > This won't scale. What about other gpus in the same generation but has a
> > different register list? You don't see that issue currently because
> > there are no support for lower tier a7x GPUs yet.
> 
> GPUs in the same generation always have the same register list. e.g.
> gen7_4_0 has the same register list as gen7_0_0. kgsl has already
> moved onto gen8 which redoes everything again and will require a
> separate codepath, they only have one more gen7 register list compared
> to us, and I doubt they'll add many more. So the kgsl approach would
> be pointless over-engineering.

https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/graphics-kernel/-/tree/gfx-kernel.lnx.1.0.r48-rel?ref_type=heads

Not sure if there is another more recent public facing kgsl code than this
one, but at least this lists 2 more snapshot headers we will have to
consider in future. And there are other a7x GPUs and a8x (even though a8x
should be a separate HWL, it is good to have a similar code structure).

I am not saying you should do the extra engineering at this point, but I don't
think we should move things in the other direction.

-Akhil

> 
> Connor
> 
> >
> > I think we should move to a "snapshot block list" like in the downstream
> > driver if you want to simplify the whole logic. Otherwise, we should
> > leave the chipid check as it is and just fix up a750 configurations.
> >
> > -Akhil
> >
> > >
> > > Fixes: f3f8207d8aed ("drm/msm: Add devcoredump support for a750")
> > > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 ++++++++++++++---------------
> > >  1 file changed, 20 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > index 77146d30bcaa..c641ee7dec78 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > @@ -390,18 +390,18 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
> > >       const u32 *debugbus_blocks, *gbif_debugbus_blocks;
> > >       int i;
> > >
> > > -     if (adreno_is_a730(adreno_gpu)) {
> > > +     if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
> > >               debugbus_blocks = gen7_0_0_debugbus_blocks;
> > >               debugbus_blocks_count = ARRAY_SIZE(gen7_0_0_debugbus_blocks);
> > >               gbif_debugbus_blocks = a7xx_gbif_debugbus_blocks;
> > >               gbif_debugbus_blocks_count = ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
> > > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > > +     } else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
> > >               debugbus_blocks = gen7_2_0_debugbus_blocks;
> > >               debugbus_blocks_count = ARRAY_SIZE(gen7_2_0_debugbus_blocks);
> > >               gbif_debugbus_blocks = a7xx_gbif_debugbus_blocks;
> > >               gbif_debugbus_blocks_count = ARRAY_SIZE(a7xx_gbif_debugbus_blocks);
> > >       } else {
> > > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > > +             BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
> > >               debugbus_blocks = gen7_9_0_debugbus_blocks;
> > >               debugbus_blocks_count = ARRAY_SIZE(gen7_9_0_debugbus_blocks);
> > >               gbif_debugbus_blocks = gen7_9_0_gbif_debugbus_blocks;
> > > @@ -511,7 +511,7 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
> > >               const struct a6xx_debugbus_block *cx_debugbus_blocks;
> > >
> > >               if (adreno_is_a7xx(adreno_gpu)) {
> > > -                     BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)));
> > > +                     BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
> > >                       cx_debugbus_blocks = a7xx_cx_debugbus_blocks;
> > >                       nr_cx_debugbus_blocks = ARRAY_SIZE(a7xx_cx_debugbus_blocks);
> > >               } else {
> > > @@ -662,11 +662,11 @@ static void a7xx_get_dbgahb_clusters(struct msm_gpu *gpu,
> > >       const struct gen7_sptp_cluster_registers *dbgahb_clusters;
> > >       unsigned dbgahb_clusters_size;
> > >
> > > -     if (adreno_is_a730(adreno_gpu)) {
> > > +     if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
> > >               dbgahb_clusters = gen7_0_0_sptp_clusters;
> > >               dbgahb_clusters_size = ARRAY_SIZE(gen7_0_0_sptp_clusters);
> > >       } else {
> > > -             BUG_ON(!adreno_is_a740_family(adreno_gpu));
> > > +             BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
> > >               dbgahb_clusters = gen7_2_0_sptp_clusters;
> > >               dbgahb_clusters_size = ARRAY_SIZE(gen7_2_0_sptp_clusters);
> > >       }
> > > @@ -820,14 +820,14 @@ static void a7xx_get_clusters(struct msm_gpu *gpu,
> > >       const struct gen7_cluster_registers *clusters;
> > >       unsigned clusters_size;
> > >
> > > -     if (adreno_is_a730(adreno_gpu)) {
> > > +     if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
> > >               clusters = gen7_0_0_clusters;
> > >               clusters_size = ARRAY_SIZE(gen7_0_0_clusters);
> > > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > > +     } else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
> > >               clusters = gen7_2_0_clusters;
> > >               clusters_size = ARRAY_SIZE(gen7_2_0_clusters);
> > >       } else {
> > > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > > +             BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
> > >               clusters = gen7_9_0_clusters;
> > >               clusters_size = ARRAY_SIZE(gen7_9_0_clusters);
> > >       }
> > > @@ -895,7 +895,7 @@ static void a7xx_get_shader_block(struct msm_gpu *gpu,
> > >       if (WARN_ON(datasize > A6XX_CD_DATA_SIZE))
> > >               return;
> > >
> > > -     if (adreno_is_a730(adreno_gpu)) {
> > > +     if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
> > >               gpu_rmw(gpu, REG_A7XX_SP_DBG_CNTL, GENMASK(1, 0), 3);
> > >       }
> > >
> > > @@ -925,7 +925,7 @@ static void a7xx_get_shader_block(struct msm_gpu *gpu,
> > >               datasize);
> > >
> > >  out:
> > > -     if (adreno_is_a730(adreno_gpu)) {
> > > +     if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
> > >               gpu_rmw(gpu, REG_A7XX_SP_DBG_CNTL, GENMASK(1, 0), 0);
> > >       }
> > >  }
> > > @@ -958,14 +958,14 @@ static void a7xx_get_shaders(struct msm_gpu *gpu,
> > >       unsigned num_shader_blocks;
> > >       int i;
> > >
> > > -     if (adreno_is_a730(adreno_gpu)) {
> > > +     if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
> > >               shader_blocks = gen7_0_0_shader_blocks;
> > >               num_shader_blocks = ARRAY_SIZE(gen7_0_0_shader_blocks);
> > > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > > +     } else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
> > >               shader_blocks = gen7_2_0_shader_blocks;
> > >               num_shader_blocks = ARRAY_SIZE(gen7_2_0_shader_blocks);
> > >       } else {
> > > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > > +             BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
> > >               shader_blocks = gen7_9_0_shader_blocks;
> > >               num_shader_blocks = ARRAY_SIZE(gen7_9_0_shader_blocks);
> > >       }
> > > @@ -1350,14 +1350,14 @@ static void a7xx_get_registers(struct msm_gpu *gpu,
> > >       const u32 *pre_crashdumper_regs;
> > >       const struct gen7_reg_list *reglist;
> > >
> > > -     if (adreno_is_a730(adreno_gpu)) {
> > > +     if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
> > >               reglist = gen7_0_0_reg_list;
> > >               pre_crashdumper_regs = gen7_0_0_pre_crashdumper_gpu_registers;
> > > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > > +     } else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
> > >               reglist = gen7_2_0_reg_list;
> > >               pre_crashdumper_regs = gen7_0_0_pre_crashdumper_gpu_registers;
> > >       } else {
> > > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > > +             BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
> > >               reglist = gen7_9_0_reg_list;
> > >               pre_crashdumper_regs = gen7_9_0_pre_crashdumper_gpu_registers;
> > >       }
> > > @@ -1407,8 +1407,7 @@ static void a7xx_get_post_crashdumper_registers(struct msm_gpu *gpu,
> > >       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > >       const u32 *regs;
> > >
> > > -     BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu) ||
> > > -              adreno_is_a750(adreno_gpu)));
> > > +     BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
> > >       regs = gen7_0_0_post_crashdumper_registers;
> > >
> > >       a7xx_get_ahb_gpu_registers(gpu,
> > > @@ -1514,11 +1513,11 @@ static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
> > >       const struct a6xx_indexed_registers *indexed_regs;
> > >       int i, indexed_count, mempool_count;
> > >
> > > -     if (adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gpu)) {
> > > +     if (adreno_gpu->info->family <= ADRENO_7XX_GEN2) {
> > >               indexed_regs = a7xx_indexed_reglist;
> > >               indexed_count = ARRAY_SIZE(a7xx_indexed_reglist);
> > >       } else {
> > > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > > +             BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
> > >               indexed_regs = gen7_9_0_cp_indexed_reg_list;
> > >               indexed_count = ARRAY_SIZE(gen7_9_0_cp_indexed_reg_list);
> > >       }
> > >
> > > --
> > > 2.31.1
> > >

