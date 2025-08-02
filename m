Return-Path: <linux-arm-msm+bounces-67511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C9B18E9E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 15:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32485562B74
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 13:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727DB22B8A5;
	Sat,  2 Aug 2025 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fff7fVi1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B751F5858
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Aug 2025 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754140393; cv=none; b=OkZjGBPc8sbxNaWDNmTCcs8hGoCK8Z/h/LpkbxQjmOvUni4KrlBVOLnAOwZ0dCb7V+HrzskT6/D+YUpjm60CSaegnyIPIqTMtd+GEe3OPjWHqC9avKyAQgFo8heH88mpTlY0Vmq9IW2m7+jLtF+Pd4oebLRlZEg0i3Vjv7IQ8Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754140393; c=relaxed/simple;
	bh=FOFETKz3kkjbXDU+YM8QmeuyyCBcPUFYs4R5t1fFBC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JyfJ9kSInP8JuWbFWoMPZPQZyufsJ7aX4rq5prfO/BFoKl41wcIurN+K7WEhhSoCaOPT4uum4RULzGGYirsVDIiHQ0icHs54oE/eRpwPtDGEHIdMyvHt2bUKYMgn+47X3kWttBrrlVYFKyZlUQocOXelfalVuvC2S+5iZF/kVpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fff7fVi1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725h7Gh012794
	for <linux-arm-msm@vger.kernel.org>; Sat, 2 Aug 2025 13:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=RwyIruoH357mBYmIQWZhwXtNEOPEWuLPLWx1UxajN4Y=; b=Ff
	f7fVi1dnNIrwXb/iMeIqV8CbfLsqBxJjIEsHJwM2pWSvtK9UZfZQP8Sb81Dsjwz4
	F/I5I1OD2CTRle5g1kzdIFsCDW8uACcl+G5XA2bVPGHlEayfgHbAsVydzLcdVSCd
	tl5qlVyIFIA5OFRTjUgxFgdrZ+QdkFxQB5G7H5v33Bklg0F6KmgLyqUwCn7HNmLT
	NcO/eTatKODfF0psNXdG0QHpheBvhQAEI/ogq0Pkdberpozom4xdZiNfU5Pui2OC
	x8t63PTD7SJtTNPx8LvFM0k1NfkuPBy6o7H9bfDsav0wujnHxogPji85Tp5drpT3
	K7bOovCV2VTUZUgxNaow==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc0pue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 13:13:08 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-421e4901a49so307010b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 06:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754140387; x=1754745187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RwyIruoH357mBYmIQWZhwXtNEOPEWuLPLWx1UxajN4Y=;
        b=HOIGzOVkncGCDspOt57Ncir6gTVb1M6dwDO4sci5y2187i7wr/zmhEFdhq/zP1NHLR
         0ku5krs8kavMFwNimI5kf67dKVOZM3oZhievP/n291TnF5j+9ZlUfjXGVQ8hMcw65kPG
         hUll121G+hoDG/FVzSweyOCeLIaX16ezYYsgpccG2mjqHo8M8MN+DiIdCuupI1T7wCg6
         xf5fp7dzNLZ1brs+d3C8ufHyozgqlYhmqztfVGarzpcx5+dvuVLHJuXiDh9a8KcHbfyj
         YAVEq00Cy8/NrWEgAWA1O1HqIO1iwabR+qRWtEMzpi1O7sOWfAujkXJ9pDzvoqOGoESs
         oBjg==
X-Forwarded-Encrypted: i=1; AJvYcCV3u0ZBSTeGGT+uoT5vdCGY+olOcSFY7+2Vzvs9EkpkDTkfIcBK3OX4R8OaDT7b7tk/Gljy9kv/tnlm3F3n@vger.kernel.org
X-Gm-Message-State: AOJu0YxgdOIcazZj+wiUZlRYZ/hWkTsAVtHWau6i3525aovVpQ2kflcR
	fSsGhTsK4zGNRPsyiK6y06kGZX56x8yeYiZwmsE+SNPHYi1y8ViG8C7DvUjSImwlbX88fyXHWRN
	N4NgNyERNdbvtnY9q876h7MaC8qaQAfrMhDcP6l3AySf2EdTBZ+D3KONfIuKWcokReBi1NJXc4D
	oJArMWIgFIAM0YsHK7mamj7NuWXHmaDXZmTDAEHC9yJMI=
X-Gm-Gg: ASbGncsES1Y1Brq6ETue3JYuNrHoS8g0orA//eyIQPt20GOV4Juu76Ra1nkYsY0ax0K
	ToVAkVRf0bdbBN/dy8mk1r5mQwwMM629XcmX6a/9SduSFZaUplHCsEkMMPGiimJp+C2I5AxNcVo
	rXp1NcHRYe9FDyZddvRpPgphMyYHa8QUeWlrQ8hsNqOrHzmqWz9juP
X-Received: by 2002:a05:6808:f0d:b0:409:f8e:72a7 with SMTP id 5614622812f47-433f0356347mr1718342b6e.33.1754140387525;
        Sat, 02 Aug 2025 06:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWQkdajOA5XCw4IsBRRfjdIHkUjt/VC0wsWR6Nzln9EEWN+Aa4GjnIjQVDxxDcbK/En0vwGMd3+BZR/+Qkc88=
X-Received: by 2002:a05:6808:f0d:b0:409:f8e:72a7 with SMTP id
 5614622812f47-433f0356347mr1718322b6e.33.1754140387107; Sat, 02 Aug 2025
 06:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aI3C8c4iR3PmIMGE@stanley.mountain>
In-Reply-To: <aI3C8c4iR3PmIMGE@stanley.mountain>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 2 Aug 2025 06:12:56 -0700
X-Gm-Features: Ac12FXzxLB_zJXMDBnX0oji4EfdrWmXO6C4QFI5VAFWsuljcbouIO7FFpZP8jEo
Message-ID: <CACSVV00Bv+P2rzi0Wpnxba8VCTiVT_kK3voRZEZJGKrupSbigA@mail.gmail.com>
Subject: Re: [bug report] drm/msm: Add VM_BIND ioctl
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: IKY2l8AartTEtxbAdG_K7bNtDHs6L2bo
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=688e0ee4 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=KKAkSRfTAAAA:8 a=h7oZlVOF9mIUhsnAhVEA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IKY2l8AartTEtxbAdG_K7bNtDHs6L2bo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDExMCBTYWx0ZWRfX1bkMjq+Xgk/9
 xXZAFomoW21JfpsXsQ/bprK/xJLPxXtx1qJXlyrRZ+zbh60IMFwHmy4kaVKRzGL0JiuGC559Ed6
 oJ2gtjwMhG8UPr38ZiT836uv2Qq97R3Br0EpZoo5NKsDWek9+9OAsai7DDVfA+1bxhgXeexkcjc
 mcnLyqkYslWXrRq06pTerMopTes6+H4F3cUkKG8JDC5NuRAb/X3PBfCm2YaBZaJ+GZNJaOnm0oU
 5J+etNFVwfI1mHonwVooEEConboyH+t6d7v7MJpvZe7n9CL6V1mJU72twW9nIzmvwPVTSq6URkB
 p1SXNAseHU0z1m1p8TLndZIK6Peov5h/LqGpY6bCgl6Kr/1GTjk4g6wDbUtKF/A6HuKKdDRmfM3
 MyhEtmeotHH3obZJ93xNmY1O+on64jaWCK/QuDGGh+4I1G6WNd9+aDoDTOtESAjPJKXhWmh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020110

On Sat, Aug 2, 2025 at 12:49=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hello Rob Clark,
>
> Commit 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl") from Jun 29, 2025
> (linux-next), leads to the following Smatch static checker warning:
>
>         drivers/gpu/drm/msm/msm_gem_vma.c:596 msm_gem_vm_sm_step_remap()
>         error: we previously assumed 'vm_bo' could be null (see line 564)
>
> drivers/gpu/drm/msm/msm_gem_vma.c
>     521 static int
>     522 msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
>     523 {
>     524         struct msm_vm_bind_job *job =3D ((struct op_arg *)arg)->j=
ob;
>     525         struct drm_gpuvm *vm =3D job->vm;
>     526         struct drm_gpuva *orig_vma =3D op->remap.unmap->va;
>     527         struct drm_gpuva *prev_vma =3D NULL, *next_vma =3D NULL;
>     528         struct drm_gpuvm_bo *vm_bo =3D orig_vma->vm_bo;
>     529         bool mapped =3D to_msm_vma(orig_vma)->mapped;
>     530         unsigned flags;
>     531
>     532         vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vm=
a,
>     533                orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va=
.range);
>     534
>     535         if (mapped) {
>     536                 uint64_t unmap_start, unmap_range;
>     537
>     538                 drm_gpuva_op_remap_to_unmap_range(&op->remap, &un=
map_start, &unmap_range);
>     539
>     540                 vm_op_enqueue(arg, (struct msm_vm_op){
>     541                         .op =3D MSM_VM_OP_UNMAP,
>     542                         .unmap =3D {
>     543                                 .iova =3D unmap_start,
>     544                                 .range =3D unmap_range,
>     545                                 .queue_id =3D job->queue->id,
>     546                         },
>     547                         .obj =3D orig_vma->gem.obj,
>     548                 });
>     549
>     550                 /*
>     551                  * Part of this GEM obj is still mapped, but we'r=
e going to kill the
>     552                  * existing VMA and replace it with one or two ne=
w ones (ie. two if
>     553                  * the unmapped range is in the middle of the exi=
sting (unmap) VMA).
>     554                  * So just set the state to unmapped:
>     555                  */
>     556                 to_msm_vma(orig_vma)->mapped =3D false;
>     557         }
>     558
>     559         /*
>     560          * Hold a ref to the vm_bo between the msm_gem_vma_close(=
) and the
>     561          * creation of the new prev/next vma's, in case the vm_bo=
 is tracked
>     562          * in the VM's evict list:
>     563          */
>     564         if (vm_bo)
>                 ^^^^^^^^^^
> NULL check
>
>     565                 drm_gpuvm_bo_get(vm_bo);
>     566
>     567         /*
>     568          * The prev_vma and/or next_vma are replacing the unmappe=
d vma, and
>     569          * therefore should preserve it's flags:
>     570          */
>     571         flags =3D orig_vma->flags;
>     572
>     573         msm_gem_vma_close(orig_vma);
>     574
>     575         if (op->remap.prev) {
>     576                 prev_vma =3D vma_from_op(arg, op->remap.prev);
>     577                 if (WARN_ON(IS_ERR(prev_vma)))
>     578                         return PTR_ERR(prev_vma);
>     579
>     580                 vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, pr=
ev_vma, prev_vma->va.addr, prev_vma->va.range);
>     581                 to_msm_vma(prev_vma)->mapped =3D mapped;
>     582                 prev_vma->flags =3D flags;
>     583         }
>     584
>     585         if (op->remap.next) {
>     586                 next_vma =3D vma_from_op(arg, op->remap.next);
>     587                 if (WARN_ON(IS_ERR(next_vma)))
>     588                         return PTR_ERR(next_vma);
>     589
>     590                 vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, ne=
xt_vma, next_vma->va.addr, next_vma->va.range);
>     591                 to_msm_vma(next_vma)->mapped =3D mapped;
>     592                 next_vma->flags =3D flags;
>     593         }
>     594
>     595         if (!mapped)
> --> 596                 drm_gpuvm_bo_evict(vm_bo, true);
>                                            ^^^^^
> Unchecked dereference.  Possibly if we're not mapped then it's non-NULL?
> If so then just ignore this warning.

Correct, the !mapped case will only happen when the shrinker evicts
BOs.  The case where the BO (and therefore vm_bo) is NULL, is MAP_NULL
mappings which are backed by the PRR page, not a BO that can be
evicted.

Would adding a WARN_ON(!vm_bo) convey to smatch that this case should
not happen unless something somewhere else was rather screwed up?

BR,
-R

>     597
>     598         /* Drop the previous ref: */
>     599         drm_gpuvm_bo_put(vm_bo);
>     600
>     601         return 0;
>     602 }
>
> regards,
> dan carpenter

