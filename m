Return-Path: <linux-arm-msm+bounces-95229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA0oNI50p2mehgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:53:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1EA1F8873
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C803930BFD70
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 23:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4383750DD;
	Tue,  3 Mar 2026 23:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIy5APdd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UP37BS/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E6374E6B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 23:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581921; cv=none; b=iYtVln6AU3NaXMAy4pmZ7Sr63SwKKoLDAyu0GsQdVfeXvbAYO1v+2Wh9rwmob94rFXqSBO8O682kG3uoKCB7WrxraSK/sT/XklDh4ODzMePqNbGB4IjyYSLpEiurKYzOaEs7DfsZ9aCt+zeRK3nMyA2225M0gg39HgJHkD2EPxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581921; c=relaxed/simple;
	bh=I8eU/d2roCtu7Pu6iolnaBtNLMHgMKFUi1xQowaP9Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRhRZZk/IdNPOjPipG3yGXOYce0VH7sEvKC2g+uKMmSGZuDHdSBnzPRenZOPh89rbXpBMV7vOFjlsEL9Y0ICSKa56XAsR2O+G5QsCrGn/4CGU4iuJ9rupH64Dg++qH/NYq9i74/eDRJr/9LAXgOn4pSiV022R/aZniEvI3tC1mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIy5APdd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP37BS/2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0P6l3708671
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 23:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CE5lYpP2aMiXtRB/B3W0vuQdbhu9XMpSGv7rYRroDAM=; b=HIy5APddJ9u4c1Xw
	Mu69MPWGx052oDqrLJaFBcZ67LEKt7cp1OElVNA84/Fi6widK5zf6Es3YJr9iBOb
	AOkcq6grglkiRRvv54hfJDsV0Xr5wmBFw+LzY5Y+QxwXB8bMoiu5qs/SjHY7j7Kr
	w01T2TVZkiheX+PkE9wERgvunXTKS2KJDv+aHdr0TjRi4LtZYydbhiT2y50K8JsH
	N+fbirHHZ21YGpNKZvQhdJUc5BYT/J4Gf0HZvXBfLw9FjfNNNMi8q18NeUaDiEVI
	TR7Z5izlD3xR3LBw0RpO/drb6a50Gp5a3vaLSW1xT3TQbWd+eQQ/ah32DTfNisxQ
	Xx6pCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm3k5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 23:52:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506b4005ab7so672552451cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 15:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772581919; x=1773186719; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CE5lYpP2aMiXtRB/B3W0vuQdbhu9XMpSGv7rYRroDAM=;
        b=UP37BS/2GYH/YcmWZBXQkN3rhRFE8Mlk7/852B/i7edtfEtNP6vCf3E/+5J9m5tWRl
         04ahTu2rpFBQkYhQLvjjTyCnLrviDVLLEU9077afU6xSaF1zdMufPXec0NaG2ypEnlN+
         glazkIjlw7sduRbWTjhS2xb2guHWAPntoZYN1Gz9iIdZ/B0eN40tN4G6GqHkPWx0ejWd
         2UV+E5oLpQDTQq8cKPsQ9yXL+ldjK8a6CE3nY0lBrla0gQCTGMzFUF6A0CdC41A3NvPP
         BQJlg187ljtLgVwMtkqY/uIDKhgpbaxHQfZeOXkViuhKXhbKKpOeyk5hGUohPJHuUR/I
         HEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772581919; x=1773186719;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CE5lYpP2aMiXtRB/B3W0vuQdbhu9XMpSGv7rYRroDAM=;
        b=pLCDxKgn5uTlCgyOeMy3MUnuo0yMF8QLJc01tWXIDHNv/5Zw6Xny7eXZLzPrJ8WXsi
         qqvcDm3kbV7Dtcq9yAutUQtHKyUVuzXtZHQ4ak0B43PuAfk1oBktJiV90m/d7WRlajP1
         9MB+Y+V/znEMwKjB+hAd8Kqskt/W0/Yg3G46wXXzhTFiPl74woPuIpPT2psxcRWWgnBQ
         LaqiHUbLg3A4hOXjA2LsAshaAV/iOPOMS14zbb50pFXbJG0+h8vSoMi+jVGeFDZom3Hv
         a/kgBJ83g8OgOJTj9+piAfsBSUT+yZV1kal3rGa6ljclquO25sBPZnwB273x8yMQ9/qG
         mOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxYWY5YUSlZs3CmdSKaDOxwZBFd5/86ssfl78SlB2tJztLOdEAZMMonGXnNKtiaJj+RH26D6x3WRoIGch4@vger.kernel.org
X-Gm-Message-State: AOJu0YwUo1oXeLhCRI8vvzjsAFzgWxNeG/35Nf+CSvD7aiRxjT1v+0me
	YfBkhAE/xwIB/NLHTsDvAyPAw739fzdoueEiCI1VUjJvlLOlZ9cZUWg8EB4SwKAFh5e1eBmEHd0
	h/b3CWuyhBm/fXtiBW8rhh4Cec3+tZeiHVVRRpR/poQiYrdDBcpu+kP6WxWIU4JMR47TD
X-Gm-Gg: ATEYQzx/EETpdmuN7nzDqItCBF24esf0he9Ws/WL87ZINInh6RKgRexecfp51CFl0iv
	aABsNvpaDVAjTSI2aAjgtpQPpWahJBqXd839yBsxFEq7oyqs43bayBXaxvwXB988FHrWyzWlmJ2
	/XKlCB18sJSyfyIFpn6ysw4l8r+C7cwlhhzlNGL2ORxt4XAwYq9Q7ISkFVh+vGDGJ2BR2OwO2ah
	BCCXs+a5ldOfwR9tvLDVUrNrwUC8bHsb8QkvpkNDl9BSebq4RygMRzgPhnHzEHiQz3RjnlIqHLh
	jXfJeWj02g53Ggk2lpo3E3qHdugSbqtykwa3sqsuVCLNCm29z0h6uj5e7n4nnRYayUqDLh9KBws
	juBqRdJf0iYL7nOLMk/NW1TrdI3Xh9kQRovHVrphMVqSyyLzvyhyBzRoPM0kjhwzBfnvRe4j5e/
	Bms22ZTu4+M7ptieK/hou8KYeQRbFicIZLz30=
X-Received: by 2002:a05:622a:11d4:b0:501:4858:a6d0 with SMTP id d75a77b69052e-508db3dd455mr2777381cf.56.1772581918941;
        Tue, 03 Mar 2026 15:51:58 -0800 (PST)
X-Received: by 2002:a05:622a:11d4:b0:501:4858:a6d0 with SMTP id d75a77b69052e-508db3dd455mr2777131cf.56.1772581918485;
        Tue, 03 Mar 2026 15:51:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123581491sm888398e87.25.2026.03.03.15.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:51:57 -0800 (PST)
Date: Wed, 4 Mar 2026 01:51:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
Message-ID: <44apren32murp7v5lsntsqu6hpfc55lblj6cykamryylrmvgtr@e6zzqy4rjqz2>
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
 <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
 <7q7czu7kwkmnnx3ntuduxf36lkzod4mph7ky6334xarbipivcp@3jfhc6ahdhbr>
 <CACSVV029s0xBDgUXp+g+JjKJQu-jv5n_nSCQHyXdtfDgyjzVFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV029s0xBDgUXp+g+JjKJQu-jv5n_nSCQHyXdtfDgyjzVFA@mail.gmail.com>
X-Proofpoint-GUID: NaIwH-TR56jsKRhcmEbwO7Ef_XsRduMH
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a77420 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SOO4GjgBUA4BacKhc9gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: NaIwH-TR56jsKRhcmEbwO7Ef_XsRduMH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NiBTYWx0ZWRfX6ns8luwjNEsa
 FWRXUxmbXWnHdzUNJYWqe20jIBvcPwJ5ACGFBeHtKAC/A6avcGm4jBJ4Ngv6rEB4YEOvJWDc+eh
 xdsJS++ziE8O0Oosq+Cu1U65JcG00SRsb5h8h2o31ie5nI4OuCGWoAQsRL29c2w/M/0cqjoTV2c
 rpAeFD7ERjzceBdf4TGbG0dedTgC7PR2NIHQROpLGHDiQzrVlL04xmcFfS8DM34fYRW87g4eu0z
 FjpzhaZ0LHDzmOnguGmGnRjYUTOq34RUmgW8JmpvwmeycxOS7Ihc5bVgVmTjT0+8PCoYdPkU082
 6RXWlPrxGTvtpDR+0yRnl23behfxNxbDQ33nizdcKZweXbt/VIp3es/DIvxVh7D1XxqrVv6tzgZ
 9Y5dVrQHQxHzGTVPYHqr11ZuC26sqotu8b3p/zxmUHQjODyy4f6VaupIYqOWVNrsVXJ4C/DvGY/
 xPXtSvTBEwlURWX91Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030196
X-Rspamd-Queue-Id: 5B1EA1F8873
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95229-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 03:38:35PM -0800, Rob Clark wrote:
> On Tue, Mar 3, 2026 at 2:32 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Mar 03, 2026 at 10:35:46AM -0800, Rob Clark wrote:
> > > On Sun, Feb 22, 2026 at 12:32 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > > > > On targets with multiple display subsystems, such as SA8775P, the GPU
> > > > > binds to the first display subsystem that probes. This implicit binding
> > > > > prevents subsequent display subsystems from probing successfully,
> > > > > breaking multi-display support.
> > > > >
> > > > > Enable separate_gpu_kms by default to decouple GPU and display subsystem
> > > > > probing. This allows each display subsystem to initialize independently,
> > > > > ensuring that all display subsystems are probed.
> > > > >
> > > > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > > > ---
> > > > > Depends on:
> > > > >       https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> > > > >       https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
> > > >
> > > > What exactly depends on this patchset?
> > > >
> > > > > ---
> > > > >  drivers/gpu/drm/msm/msm_drv.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > > > index ed2a61c66ac9..65119fb3dfa2 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > > @@ -54,7 +54,7 @@ static bool modeset = true;
> > > > >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
> > > > >  module_param(modeset, bool, 0600);
> > > > >
> > > > > -static bool separate_gpu_kms;
> > > > > +static bool separate_gpu_kms = true;
> > > > >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
> > > > >  module_param(separate_gpu_kms, bool, 0400);
> > > >
> > > > The patch LGTM, but I'd prefer to get confirmation from Rob.
> > >
> > > I prefer to be a bit more paranoid.. perhaps switch this to a tri-state:
> > >
> > >  -1: separate drm devices if there is more than one dpu or gpu,
> > >      otherwise, single combined drm device [default]
> > >   0: single drm device (matching up pairs of dpu and gpu if needed)
> > >   1: separate drm devices
> > >
> > > This way we aren't changing (or breaking) things for existing users.
> >
> > I'd rather break things and hear about them being broken.
> 
> You are assuming you'd hear about the non-obvious breakages
> immediately..  I don't think that is a good assumption.
> 
> To be clear, I'll NAK any change to the default for "normal" hw
> configurations.  If you want to change the modparam to tri-state so
> that "weird" hw configurations get split devices, I guess I'd be ok
> with that.  At least it limits the potential fallout.

Ack :-)

> 
> BR,
> -R
> 
> > >
> > > BR,
> > > -R
> > >
> > > > BTW: have you tested it with X11? Are you still getting accelerated GPU?
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

