Return-Path: <linux-arm-msm+bounces-94209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DKzHKa8n2ktdgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:23:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 980621A07BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 115ED30086A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F8F36EAA6;
	Thu, 26 Feb 2026 03:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8gUm51b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ljs6/gLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543DB313546
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772076192; cv=none; b=q8WBbai0QXdMQghgP77VQFJeu9sVj+T3cdV7LNKjCuG17zNM9cM1pqTQRpF6rVaZUDysI9oFvZ4aEBJsPP5twpFTOX7T6TYB1y4d20dyCngGuL1qwQTpialw65e5YjFMIHopiU1EDdvsYHBFyDnWviqv1tWjB5F3pI4vbSYkntg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772076192; c=relaxed/simple;
	bh=+YCdfGle4wy37eldufrM4dpIG1gsTTueTnmoup2hhBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbqHEuC5JB+sm/huKvJGy1K945XMhKIyJ0JV8wXS6TFAk42ZiRzoS6FZFw6/hQjeMNyyqyb70ZfqJbtzW71PvP2baBjWUUDqE5422pLENOgfknEwQ6L1JPbvKDhP6Us1OCuDn30PAJCoBf9L2VcsCXN50qfBPsjxi5QIa4oDevg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8gUm51b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ljs6/gLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH2Nq03101004
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l809sJe2X5L8/bMHsjXk4sQu
	NcfnBFCceD/9FzjoPc4=; b=Q8gUm51bERcU9xNKfoJGPZe5rNnXFUc4c4pacPya
	9rTvTdNIL4p7sCG/2IAPJAQtilLVvZm3w9kY7imBZr3qI86KhBvGVVirMm2+wkZ8
	LwjHUYE5iv2MheQV9WwsYCf+ks9VVg7Eolndow6Rhlyz5GvXRKUlEl9MfyB+HNW1
	6MIziYL5CxyLXLpwIs5jquvooiwpiQxO5xcktCAyAlAoouiXUtIEc9ru/2ssryJw
	XM/Zgu8vqTL71jogVdE9xFKFQN7ax4lHc2DJdbHl/PDzw0I7jPW/ZRisiEAG0tT4
	P8j4pW8H5VCmgyjWZkaM1OEj02EBn4sCvxc5w4WBfsHFAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj54p9m83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:23:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506bac14430so78674071cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772076189; x=1772680989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l809sJe2X5L8/bMHsjXk4sQuNcfnBFCceD/9FzjoPc4=;
        b=Ljs6/gLdp1Se+K+jkfV3kquUdcv731BWyUQ4DrZgjDbVybIPXI6eprL/iV/tj1GruJ
         x5/n4FpsW35tL0dhrI5wuxcNPjAs4FQRajEKr6peWAhqjacR5WmeS3LxCiIrn/qpf6Ls
         7dL4ti1oamBuKbo5DZQjf1on1UECQCuYUjqq1l4WUsE6/BKrLpkQNKVhxCljCz6ZGy7C
         7MtuWFgCUookCXGwCIFsjP3b7crI870ISQD2cyn5jYNOxakSsBjEkWCYQTf6fZ6F8A6S
         jKdVSiv4Qyz1Q9PFFmNCvId8U7ZcQC/YDO2MYKfD6Km3qzecDAHr5deXptJqq4j3/4tT
         WqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772076189; x=1772680989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l809sJe2X5L8/bMHsjXk4sQuNcfnBFCceD/9FzjoPc4=;
        b=iHjs8Gez8Yyj3qhRZeXNQ7LqhwPFYJbK0PJ/2+H74IrzFEFmxDvlkOxNw1YSkTXU4I
         Q5gmPao5ivvDZ98qAkzY+a4HBlsNYYsmHynLUgjBQmnn837hQDdLfQCQPXcma5RYR2g+
         bnYraA1GOnvBVcMIJhfqLAKF2pwO5yE8ozR3FxtT7oQqjlA2/ayvShDkKmSiVnrm3+Mn
         v40IibKbEVzO1g6PV4ejQmkUTsMdo1n1sapZnWtPS0k9p4q98dlYE/KrMU6lYOAajs9J
         2rQRRlx0EyLWV1aq+hNnL/s5Y6v4X1u49tbgDocQNKPzoS47o4BNt3lwu02PlvYZcHBJ
         O6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXfQ10T5ls1C9IgfpN6dkLyxOH5FjfKRFRxW95oqqOfhzKDgou2AmvwvrER1xzgmZIKMDGvLkZue68QLrdT@vger.kernel.org
X-Gm-Message-State: AOJu0YynHRdDG3tGOWHvQriJIV/j4OYAix1PR8HzH/6vxHVOtJ5kvAau
	TiglMYCdOCudTbz0CVYDH8HIEw/FPKEmH4j62VnWGO68GhJqu8dMsG2nwGA1X8UJpycPWf7fHVg
	2/xtkGU8hz33mkP3agFtoS8JP8nn/szfE5mY4E97ZNNo+ZncIfQfuLbdRheTjkUjPWbLk
X-Gm-Gg: ATEYQzwXrApoK8lPwtEo4AogXqqIFrInI5kyP5z5p6w2/qINCKfoXN238t5fuc7rt7l
	3+6VTYT4uC81C760lru++Z3DEK6aqGTudchsviAEEnr54m3b+89vLO05nE7aXc5UTZC/rf/2rtI
	EtY7toDYTYiDNbwea4xcpPg95XUI27FuOE6IUBdaV+wXNMGbMsQCNF0rL/23r5JTjHOpAiynpE5
	i/vXyQBGtFOiZTRGEGUUb6VKdMya/HgOEAfAuafnauoJzMnNqFcJtj9MM/1EqyP+aYyANbGCcnL
	/zVjOIMbujRb/w7V/zbzNZWpPxsBDWYYwqh8ccS4V8HViWc5u/PecRrNsJ2DlbCCwWSLxtVfZiC
	ahC/FTXiKK66zHe1g76WAfD13Jk3XiZaWP7ZtKnew9voWnIWLLfpCGtLxzHwu8RSERbECYfggmr
	otA1HXr3XqXNgZFT1X2px8sp+7xN/zNoDt104=
X-Received: by 2002:a05:620a:29d3:b0:8bb:ac44:bd3c with SMTP id af79cd13be357-8cbbd00ceadmr388232085a.52.1772076189419;
        Wed, 25 Feb 2026 19:23:09 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8bb:ac44:bd3c with SMTP id af79cd13be357-8cbbd00ceadmr388229985a.52.1772076188996;
        Wed, 25 Feb 2026 19:23:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109de960esm259514e87.75.2026.02.25.19.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 19:23:08 -0800 (PST)
Date: Thu, 26 Feb 2026 05:23:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
Message-ID: <omcgpkrspwf2hcjymclxo7asvvydotnlg3ijhmcycs35n43ee7@jw2bzwv36xht>
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
 <5fc6f252-a161-4deb-b88c-da7729f5a8f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fc6f252-a161-4deb-b88c-da7729f5a8f7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyNyBTYWx0ZWRfX+Dc5+4pJTuTm
 M2ro74pVhUK9v53GBlXzGQT5vgEG11pmwew2MXciiCpm0d9bi2pk15oiIOHsIlEG4lHMkgD98am
 cIdBMNX62qtb6W8yIV87CTkdQgeVzNU2+VMYZJk7qr5hTbpkKXioiMqQleZR/H6nu2hE3dQ8px5
 EVlA0VIicR3qVxTyOgDXVIFK8IASABRLG+GDXD2T0t3T/j3RsIWKnEBSVDwmxU2UjJFCTx/KCtf
 v7HnJd7n7jzkM37KbwjUzAOpJQnx5PX0HLOS+11cn/um3cm+PftYSMDm5E7JnGlQaELUsGzv20D
 WFT3N+FOemFZdCOqoqdFj1arER+JrpBEXbaBE+ylvpfR+qOBAXU5/Mm0559KvPVXPRXl/IdcarB
 nvIxDvhilHS7OLMQuSOOcVmL7kDQ6oPgJUI8JKArea6i8APnXNr84XMxW89iYuWFhU77LRNE0cL
 X1hUL2LboRXr3wzpVYg==
X-Proofpoint-GUID: C2b-LjDmZTN6Cmr4C36nDiMfOp9EIt-7
X-Authority-Analysis: v=2.4 cv=I5Bohdgg c=1 sm=1 tr=0 ts=699fbc9e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RtnwlOK4scfKGIiRCQ8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: C2b-LjDmZTN6Cmr4C36nDiMfOp9EIt-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260027
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94209-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 980621A07BF
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 02:58:49PM +0530, Mahadevan P wrote:
> 
> 
> On 2/23/2026 2:02 AM, Dmitry Baryshkov wrote:
> > On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > > On targets with multiple display subsystems, such as SA8775P, the GPU
> > > binds to the first display subsystem that probes. This implicit binding
> > > prevents subsequent display subsystems from probing successfully,
> > > breaking multi-display support.
> > > 
> > > Enable separate_gpu_kms by default to decouple GPU and display subsystem
> > > probing. This allows each display subsystem to initialize independently,
> > > ensuring that all display subsystems are probed.
> > > 
> > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > ---
> > > Depends on:
> 	[1]
> > > 	https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> 	[2]
> > > 	https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
> > 
> > What exactly depends on this patchset?
> The dependency is as follows:
> As we separate out module loading of adreno and mdss with separate_gpu_kms=1
> autoloading of msm.ko fails. With change [1] on bootup, msm.ko is loaded and
> gpu card is created.
> 
> The main reason to bring this patch here in upstream is for enabling of dual
> dpu configuration in Lemans hence added [2] as dependency.

None of that describes why they are dependencies (i.e. must be applied
_before_ this patch, which otherwise will be broken).

> 
> > 
> > > ---
> > >   drivers/gpu/drm/msm/msm_drv.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index ed2a61c66ac9..65119fb3dfa2 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -54,7 +54,7 @@ static bool modeset = true;
> > >   MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
> > >   module_param(modeset, bool, 0600);
> > > -static bool separate_gpu_kms;
> > > +static bool separate_gpu_kms = true;
> > >   MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
> > >   module_param(separate_gpu_kms, bool, 0400);
> > 
> > The patch LGTM, but I'd prefer to get confirmation from Rob.
> > 
> > BTW: have you tested it with X11? Are you still getting accelerated GPU?
> 
> Yes, tested today with X11 app(xterm), GPU rendering is used.
> > 
> 
> Thanks,
> Mahadevan

-- 
With best wishes
Dmitry

