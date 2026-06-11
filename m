Return-Path: <linux-arm-msm+bounces-112705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /KCgMy2OKmpJsQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:30:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E01670DC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:30:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ibH1AWNM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CKIAYAbs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112705-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112705-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C86973008C94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F20621B9F6;
	Thu, 11 Jun 2026 10:30:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04B03ACA51
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:29:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173799; cv=none; b=j/faukcaZQ264LBWUB9LXcWjCY+vazBY0S4QaXD9zKZOfcktgCHDQc0ie/vlgLZvzW3wGWZONS4nXUAsu9Zd6FyG37Av874HOGKRiFIfPppOElnarOUFM0a0glpXw0U1Mo1mQLKbRvgOehi//TTIo0DS7wmboM1Eb/7dPKA3ks0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173799; c=relaxed/simple;
	bh=6BtBfy3blHmdDbzQ0mHVTFkA9pNVSOFmH6q84PkUHjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PL42C/yguc2tLI1mRlSTeVrsJGiPoWydjfhgQoKktFr/r5amOESRRupB53UkGBZmpadsgIW/ijTzPfDA/m6eEx1pEtwH9rRCJ3LV4PHB1lKwPy4kBMYyxPXsMwT5WBgHNBx1K3D5tO9dJ53ED93n9+f+B7RMT8DlBcv0sihfu6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ibH1AWNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKIAYAbs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xC8r263635
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsbX8LJfzS1TZMIkwbo3ResQeTNTfuQ6Cs6WQoVUlHE=; b=ibH1AWNMnqYf4733
	LM3sye481UJUyBjAz4Y94Pl8IXMLtxnri52mTXTxtJZihbXU4FmaO1gxGWNKAD3r
	9xdVnyRYvtg3rCPxCd0NRuxZK0dTMOGFxtFITJ8Bdn/yeb+NSneRS91QI8Tx+m14
	FOHZg09oek6hql1MrQplonw93stutFwXWdoENOxRTRhgK+J7L1vEtPJe3HAgUXVS
	RTMMPQxF64ONp0qUmauT3WM2aFZQnqLNNXCRcnnJZwK2BRLSSwDEK7L6LuDA8cU2
	ZTMjGFDCNbthikmmh4gD3ZkcJnidVdH4DKYG9hnLCjqQ74PWKwWwBIu+jCfhPVWC
	ia3MoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6utxdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:29:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176891d0a9so19897341cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781173797; x=1781778597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AsbX8LJfzS1TZMIkwbo3ResQeTNTfuQ6Cs6WQoVUlHE=;
        b=CKIAYAbs1CoiFkGiy4nZC0w4VhpvbMYgBFhzgLbMqnvoG00kCiZ1E/mMCMCDkURxb4
         3tz2O313sHFXejEl//uQl05trklGYNqvmAoGkCP5AVN7Ka8HwojKmZtOHfbDlV9FDnf6
         PZGa1aj+XpklWdRnTrRqkM8Vytg4w1Uxgl5GIazQrRmKLZj7l/LWx6uNaWjR49Mn8Rt7
         i5kmBSgn92OFbK9+LMwGIHdBHFY4jqPL5/AzCRgfkBnh4X+l1qv/qmyWaLIzod6q+A/K
         k2WLvQi1yF3eeLOw3jFODZctNJC9kCmpQrOVuKluvVFMwuEtwAugKMcEWt5VFGKcXRBp
         GdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781173797; x=1781778597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsbX8LJfzS1TZMIkwbo3ResQeTNTfuQ6Cs6WQoVUlHE=;
        b=DRxD8QjYvO48NGlrf/QKpEgMgVo/5RHFWxd66JweNfI65Z7k0tDQTnewUaFJ1TGpN3
         2rQmnS3l0kP0L6gWCHcgI/l4VUcrLSMBbyP6SCxSRKDhNxBH8y2U1mVvpt+R3KEBLnsc
         ceJQI5O+DWNn0mkPCKAB1zz6a09rvnDEI3J0mBpvqsTFNQVP7i+sgxaN9H+i0TFVLbSR
         FFuW/mZ/F0/IzJIfCk6u5j1frbHG3+GHaKXLp2zYdLjaw/rVSN+uvRiH6j+gtImsQrzw
         Z5PSYd90aB/391FD3fAG3WnLSuS2JzO/lj2R46ZyQhfx29UP56Ap2r6q+C+q+G6bY51S
         IKGw==
X-Forwarded-Encrypted: i=1; AFNElJ+gvGJFN1/nQ8nSp2UWDOSsh965Z2AhSAkcUukeMMXxkMbuVsJT8iUqg9/9wOMrH87JWhwCrxHRH+mD9AgG@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/RWe5fASihdimdkkVJn0kgus1ur9gfGxe6fLX/pc4VXndJE5
	zXhCLfFYujDNcEq/oFTQUxxBWQ95ISFRr+/i7Fzef4mzsIqzg/UjywXEhpoEP69WKUe84Jq8y4M
	G2O49pJnGXc8jR6FYl421PaZ3GvE0HrDR5N0ztyUccAZ5R7GXStFg3EMTlW/HexE0aE8v
X-Gm-Gg: Acq92OFKkOgOIzD5mpBWWopnmzRKBHVKLpO+RVAj54pvsCpgAwNY71fNa/7SCkdav72
	bZVLFkT+q7kMBKABebFVmg6ZdUDF9m+NFYq/lAxvdyuIVWt6hZpxeufkyABWU5QLTrAxu+jzJJW
	Q6yBwqJFam2GVMtHNtOZcjVVyDVJJi97b43HJ6cxPTVWaPAat3obGKueHCbtMiD4LBRSwvp4EUB
	BOk0bml8lU39o7f/qJyhoPaJYV/R8+yaDPCaVJ0y2a8qDaoUhRmS7OjF1/2SwODxzIHIpuS0p6/
	/TBkRzeLlAF8PRzHOlZNSu9SZG5UYk29au1tJYFWpyxP0iHhzHdsN/Gm1WfgH8gR/9gPkJusKb/
	8wyBNniIfNiI7B2L3/28dF37awoL6H5vPB+iy4wjQ8iZOUqH1jIbR/6Rw
X-Received: by 2002:a05:622a:1dc4:b0:517:5af6:77f9 with SMTP id d75a77b69052e-517ee1d207fmr22539601cf.3.1781173797053;
        Thu, 11 Jun 2026 03:29:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1dc4:b0:517:5af6:77f9 with SMTP id d75a77b69052e-517ee1d207fmr22539341cf.3.1781173796593;
        Thu, 11 Jun 2026 03:29:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm10778203a12.15.2026.06.11.03.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:29:55 -0700 (PDT)
Message-ID: <90de58eb-b440-44ee-882c-cb52d0f816cf@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/msm/adreno: fix use after free on error path in
 a6xx_gpu_init()
To: Dan Carpenter <error27@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
References: <aiqNktNfXiaPhje3@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aiqNktNfXiaPhje3@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a8e26 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CLLU5E3UPER3H5ubdxMA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNSBTYWx0ZWRfX13X1KZsCqyjV
 B3bmhclTAC9YR51sUZ0F2u0Bpo1ksampMp8KmLDL5mhz64tOy9rvc1ACFCkewMqRnvh0+alSk2y
 ifph6hYRtI182zLns1TiofThVeAWBOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNSBTYWx0ZWRfX8Z/3H6+XPijB
 bVyPkjwrC+8lf6Ta3zAYnXLXbek7M6LzQOuaRtcLWvORX1jkG28vVl5XMH5iYNbh2Qv0aeGc2dC
 Exid/VdzNN6pmfpdjK/cqVEIPoYuOkR15dpgJ8TKktgbrWdlrun9wMsZD0qxTjIchBWtk8Wzs11
 fxWkcboD/hj4my0DeOmSp3+IzlLG9rAGheWl0jSmoHJuDuRSRO3enttIEK619fEp8xG437w9ruC
 TBv6yEJmrjSM8lqLBztbsqR70TyWIBI3jSruSeZGUO4WKrw8Kkt3duxYY2XU2gd1xjTCBBZbcZM
 7mzdXV5vHPKyTeEQj3Io7boTdiaoB2C2SM+QO/AdHfM3kIsBPbELZvzSb4n9wcqPVpUGjLluh6U
 1RiDfjWxtOAteeZ9dl3tQy+eAiCdoBvcw676Cw68X8fyhs5vbw3bCBBWuhUVpR4dudiX7R+Oa8g
 RER4+NQtoRlkbydwW/A==
X-Proofpoint-GUID: GPypZqo8i-qI6IwLasA9xDUMAH6oFF5r
X-Proofpoint-ORIG-GUID: GPypZqo8i-qI6IwLasA9xDUMAH6oFF5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-112705-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:harshit.m.mogalapalli@oracle.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,oracle.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6E01670DC3

On 6/11/26 12:27 PM, Dan Carpenter wrote:
> The a6xx_destroy() function frees "a6xx_gpu" and so "adreno_gpu" points
> to freed memory.  Preserve the error code before freeing the memory to
> avoid a use after free.
> 
> Fixes: d158886cba08 ("drm/msm/adreno: Trust the SSoT UBWC config")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

