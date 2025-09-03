Return-Path: <linux-arm-msm+bounces-71891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BD5B423A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 16:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEBBB1BC0765
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118A03126DA;
	Wed,  3 Sep 2025 14:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3a5ReiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0AD30AAB8
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909693; cv=none; b=ToIJibtIcfqjj4Nid7J53X1Dy+si4b77DgTSkygAE2q/PEDmBgW0jJg4qAIe8h/CUFOpTCHdZTKh3gJ71O577iWNRbdYkpeS0Tv8GMJ6WnGzwKHj+1E1ynNtoP9SuiF6SHUEYMiN2+MsevqfvTs/0Ck9ojBI8BHlmkF32SwGJ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909693; c=relaxed/simple;
	bh=5NUgSP3WjLO6mB8O6hOC8kcnm9SKM1MNi4rpwYI8aGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJkh9eqyDtxHdsOhmNhIFABRHOjm9+VJYgOS9QUYnDOpupZKcRkn0YX4qxLo6jBPInDkBCxzoDY1vR1JK60kC3cT+fqCZ/w78WQjqHztQIpyGUZvkUkJMcJ6uX5szgH0CTkkgRick2ZljWUr2riWSCD6o7PqfGmLcGvfKR+6VzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3a5ReiB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx7dX019972
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 14:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L4ipgqdEgcAXkAp5KqyDjRVuxiPGqDPMl7pw6aWThFg=; b=C3a5ReiBCOLW45Gc
	HjTLXDz+uHmjYXpAGTUvy97HeadWf+ADlF7fCAGMTimG9UG6XKIqthGVtSAFHe6u
	B1KNG4GT2a5JGBdzr5IYJ+mIAsYLs+qwhnRHCODe54iyH+sCY+qlqCPldruc+qtv
	CR/SxEJ059yU1CxwDHEJ5MaZLVIq5QyTWG5IoMHbmdxqOtRkuOUjuy1HIskiMlZL
	CxXG6EHt+Ha8IaCPOSadBSq1YC7q62Lr20RJQuslSgewzmiNZYAKOrFmpcWn8hA2
	yqPZAnR2CscGnP+G8qwv0U2P5d5Uqev/PKxU8cFaOs2mOOVp05hmbu9F/rDMnSla
	LVbOGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk93ta9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 14:28:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b335bd70b8so47229541cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909688; x=1757514488;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4ipgqdEgcAXkAp5KqyDjRVuxiPGqDPMl7pw6aWThFg=;
        b=bKOvYm0MHj1l2VLpIFLxf62cUDSIntTbTFctoTLf3ATu2+mpmKLEfW8w1UWrWJeSA3
         HyOzM2CyPs2oWe/ww9KOGExFA2q3LdfBQTMVeIq6b64JnQIKmXkMdwgSLiGEQD50Koch
         rvljFOHWvSKQPZ82GBbs70egcrskhy9cpYUWOUbUsOCiVmMxISt8u4BavVJRaCKP/Tc4
         bERkLnvzBiUzAyepsAjT58rW9TgEmisoC4DF4SAxxtHJtBqtxkMgLuPVylRyx72X1Y5U
         +pba9RrByL3VPwRSO0NTi4pQ6/wvuoUH4dcX00Wr56sG8eGzLrYCa2e2mWSY9RgLirKZ
         E1ow==
X-Forwarded-Encrypted: i=1; AJvYcCUyqbcLE7I868G6aWH/K/0/UYMJfT4Bym/yEP838aT9LzrvN2gPzSvEuVA7F5cN74seSud+hrqUF9E262/Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzeYofJ8fUE22wGNcKzpq5DHmo967wtHK9XrOOuKilJ0CQk1mr6
	GN4+VVbiDYnLYDA9CEubJ62QVgtiXCXfUtnEtjUUJwGPM6GLAlqfZFMyxJzGQlnvU+enKsYJWyP
	fIapHQiGAA9b64iGCDMx/JkC6XteKA9PPhxSCBuGdrcoDrvwIGKkTmZoJVrF+fpXwe8yU
X-Gm-Gg: ASbGncswyqvJ0W2KFxoTP76PuGKnZGuIifQsRg/8SgI2JudCI0GdjOFE/jwkT38BQ85
	fDIEP3vOzk+/TPbd38d/8E8w3FF5+NhXTVJAWcGD4kbOPHLvFn58+72oZlmX6N7VOOoVuzt5G8V
	W4eGdOGxkdch+2irMka5/rLcWfZa9Tsh8GieHVjBpJUEa+RbwCTVESk7haUdP3xGE5b3FnO+TDq
	PaWZUeSO2Kdyup8A+lb1R/01vrtqtZ5HYrpQatXaBV9wgT6p1BZX+b4lJ1lLsZS0bIBQrBszVL3
	iGPK+UeZX4xp1jUzqoyNgwjC1fWEbSItnQTyTkypWjk0xYg5XE76HO+BTjhLB6PXEEPamlEAoJe
	1chPJdTxlk45r5StCgA9+wMFlrH7w9F6SHhNHVRzkmcDuSpoWJHb/
X-Received: by 2002:a05:622a:1b21:b0:4b2:f784:f84a with SMTP id d75a77b69052e-4b31d853312mr177413331cf.34.1756909687561;
        Wed, 03 Sep 2025 07:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkb2TvZ0ILCgVrpH6pEb2ofnVtveugEN/WrUGyfbDS8L/ffVoWw0w7K8WMrbPeBg7z4t3u2Q==
X-Received: by 2002:a05:622a:1b21:b0:4b2:f784:f84a with SMTP id d75a77b69052e-4b31d853312mr177412541cf.34.1756909686735;
        Wed, 03 Sep 2025 07:28:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad523b3sm545534e87.151.2025.09.03.07.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:28:05 -0700 (PDT)
Date: Wed, 3 Sep 2025 17:28:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <fbwey76fzidnwni6nqh7qhtw6fsybyivraa7dmow47ga6tbvts@pqkwvoyfkwb6>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
 <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
 <2g3iwc2en6wh2ucrsth5ontzdwqr7tr6oplxjnfdjsy3lwyyfe@l76frwiadgru>
 <7a7c122f-50e1-476a-939e-9d76e34b1d6a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a7c122f-50e1-476a-939e-9d76e34b1d6a@linaro.org>
X-Proofpoint-GUID: 4WFo5NE7rzQSTWEj3as43JFan7zuRZXA
X-Proofpoint-ORIG-GUID: 4WFo5NE7rzQSTWEj3as43JFan7zuRZXA
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b85079 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=gVesVhWOi32bg9pDB_oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX+bjGgKsWgzQ9
 prHRFojwEOi6jCnr/+GqiNoOevcCiUKTgEcGiRnVIyQYB/vK6CT7v1TKIT0j5vKmOyyW7ahztK9
 vYjqyf85Uw/s8jSY/DQdFLonUdb0xIeApyLcr7/sX6q0Yp9oMBvDsv7ScWZGplaExg8u1N3fN33
 JQ0eC2JStoadRJs0DC92lCt4dEHIIA4m7jk8ue03o8ZcxYUO2eWayWLEJwnQM0iWOuu4LYRbQl9
 E/3A0Ienh9sVqlKeKnPcXugDabVR2ifhr/v7cYhVcFhQyoKSUTafWlCIGlDAmV27WWPOX0v9Zfn
 1TXsK072bk289Za5c3XL33u00GNAj8N/FepDigOYya40R8HN37YeFR1OxuyUenNN/rH/Q/faf/d
 FppUEqs6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Wed, Sep 03, 2025 at 03:13:18PM +0100, Bryan O'Donoghue wrote:
> On 03/09/2025 15:02, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 02:31:55PM +0100, Bryan O'Donoghue wrote:
> > > On 03/09/2025 12:56, Konrad Dybcio wrote:
> > > > > Can you try with this next-20250814 tag ?
> > > > You sent it on the 19th, so it's in your best interest to run a quick
> > > > 
> > > > git rebase --onto linux-next/master $(git describe --abbrev=0)
> > > > 
> > > > and giving the series a prompt re-test before sending, because there might have
> > > > been incompatible changes, whether ones that would prevent applying, or break
> > > > things functionally
> > > 
> > > I can't even find that tag next-20250814 closets thing is
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20250814
> > 
> > > 
> > > | * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge tag
> > > 'drm-xe-fixes-2025-08-14' of https://gitlab.freedesktop.org/drm/xe/kernel
> > > into drm-fixes (3 weeks ago)
> > > 
> > > but patch #9 in this series stubbornly won't apply to any SHA I've tried.
> > > 
> > > meh
> > > 
> > > ---
> > > bod
> > 
> 
> Unfortunately that's not the right SHA though

Then let's wait for Mukesh to switch to b4 (and use b4 --edit-deps) or
to use a proper git format-patch arguments.

> 
> git checkout -b next-20250814-test next-20250814
> 
> Switched to a new branch 'next-20250814-test'
> 
> b4 shazam 20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com
> Grabbing thread from lore.kernel.org/all/20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
>   Added from v8: 12 patches
>   Added from v9: 12 patches
> Analyzing 60 messages in the thread
> Analyzing 163 code-review messages
> Will use the latest revision: v9
> You can pick other revisions using the -vN flag
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v9 1/11] tee: allow a driver to allocate a tee_device without a
> pool
>   ✓ [PATCH v9 2/11] tee: add close_context to TEE driver operation
>   ✓ [PATCH v9 3/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
>   ✓ [PATCH v9 4/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
>   ✓ [PATCH v9 5/11] tee: increase TEE_MAX_ARG_SIZE to 4096
>   ✓ [PATCH v9 6/11] firmware: qcom: scm: add support for object invocation
>   ✓ [PATCH v9 7/11] firmware: qcom: tzmem: export shm_bridge create/delete
>   ✓ [PATCH v9 8/11] tee: add Qualcomm TEE driver
>   ✓ [PATCH v9 9/11] tee: qcom: add primordial object
>   ✓ [PATCH v9 10/11] tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
>   ✓ [PATCH v9 11/11] Documentation: tee: Add Qualcomm TEE driver
>   ---
>   ✓ Signed: DKIM/qualcomm.com (From: amirreza.zarrabi@oss.qualcomm.com)
> ---
> Total patches: 11
> ---
>  Base: using specified base-commit 33bcf93b9a6b028758105680f8b538a31bc563cf
> Applying: tee: allow a driver to allocate a tee_device without a pool
> Applying: tee: add close_context to TEE driver operation
> Applying: tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
> Applying: tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
> Applying: tee: increase TEE_MAX_ARG_SIZE to 4096
> Applying: firmware: qcom: scm: add support for object invocation
> Applying: firmware: qcom: tzmem: export shm_bridge create/delete
> Applying: tee: add Qualcomm TEE driver
> Applying: tee: qcom: add primordial object
> Applying: tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
> Applying: Documentation: tee: Add Qualcomm TEE driver
> 
> b4 shazam 20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com
> Grabbing thread from lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 70 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 0 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v2 1/11] firmware: qcom_scm: Introduce PAS context initialization
> helper
>   ✓ [PATCH v2 2/11] soc: qcom: mdtloader: Add context aware
> qcom_mdt_pas_load() helper
>   ✓ [PATCH v2 3/11] firmware: qcom_scm: Add a prep version of auth_and_reset
> function
>   ✓ [PATCH v2 4/11] firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
>     + Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> (✗
> DKIM/linaro.org)
>   ✓ [PATCH v2 5/11] firmware: qcom_scm: Add shmbridge support to
> pas_init/release function
>   ✓ [PATCH v2 6/11] remoteproc: Move resource table data structure to its
> own header
>   ✓ [PATCH v2 7/11] firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to
> get resource table
>   ✓ [PATCH v2 8/11] soc: qcom: mdt_loader: Add helper functions to map and
> unmap resources
>   ✓ [PATCH v2 9/11] remoteproc: pas: Extend parse_fw callback to parse
> resource table
>   ✓ [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS support with
> IOMMU managed by Linux
>   ✓ [PATCH v2 11/11] media: iris: Enable Secure PAS support with IOMMU
> managed by Linux
>   ---
>   ✓ Signed: DKIM/qualcomm.com (From: mukesh.ojha@oss.qualcomm.com)
> ---
> Total patches: 11
> ---
> Applying: firmware: qcom_scm: Introduce PAS context initialization helper
> Applying: soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
> Applying: firmware: qcom_scm: Add a prep version of auth_and_reset function
> Applying: firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
> Applying: firmware: qcom_scm: Add shmbridge support to pas_init/release
> function
> Applying: remoteproc: Move resource table data structure to its own header
> Applying: firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get
> resource table
> Applying: soc: qcom: mdt_loader: Add helper functions to map and unmap
> resources
> Applying: remoteproc: pas: Extend parse_fw callback to parse resource table
> Patch failed at 0009 remoteproc: pas: Extend parse_fw callback to parse
> resource table
> error: patch failed: drivers/soc/qcom/mdt_loader.c:22
> error: drivers/soc/qcom/mdt_loader.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am
> --abort".
> hint: Disable this message with "git config set advice.mergeConflict false"
> 

-- 
With best wishes
Dmitry

