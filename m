Return-Path: <linux-arm-msm+bounces-99360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEpaKJiCwWnATgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:12:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F22FB064
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA2AB315F101
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3292B3BF673;
	Mon, 23 Mar 2026 16:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b17pxW72";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bll+XrNB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D77E3B8D5C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284511; cv=none; b=uaDSyoeg/mAeI3o14au5JEoHbnj4ATUUOpADoJ6nWVJdzNmQcTMfT2fMZMgnddN/6TcYiCcgOHd0M0UKIR3sxzv0xOnZhaqkRqW0XwslUra50wJRyuMspvAvgO3NSqJPthMhesVYltdM+xK9fGe/IIk66mq9PgBQwMWa3F6BIog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284511; c=relaxed/simple;
	bh=S3kvsCagC0heScIbIAqYoaZ453//ir6DYMnoaWLMx9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHSFoo5+oRQW2R/FElO/CKopNkf+FisKscQI3nyszkoHz+VTd8cjkgy4kSvwv5L4ydcqMTIAH5yknqAs/CYjVh51BFiS95MosT4XDuPPQecWvYbV1HKgdcfJcsPhu3Bh0qKz630bJF0bHiWo9iW4k9ILlSPwEPLaeom1yOvc4EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b17pxW72; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bll+XrNB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGZDA274906
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8+rg6T95L3e6cdKRmvOpy6bF
	42FLdyllOf+gYk+r2to=; b=b17pxW722M9j9oJ/IP8s8dtAYi/yBx5wKXEUHUS0
	x6SDLEFeAGIKIzOjzQGV47Oyk/14Hq+SkQ+YZnSykJ83agwW5E7/TypkX9sv/SS9
	NXzpT9o4aKemyY6vdkrSppvk8xpn7yCti0MHAaxU6x2we82FEwIgFUrhFjzL/n6z
	WHFaGQEFN5DIDiQ4rl/GNRAcAu1VPsq/BeYjfqUsyGsyeQcS4/7DiV6dUl1qitsc
	sOOV+AQGbeOBCBap7egEMM9mw7vQZdLiHfH27hbxaI0x4qSb/dtXVrLUnJ3DMzgS
	5wC5ewTZi/tkuC4TUInCM0zDWnsc1hdPgm7gOpWaGt0xCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jghx09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:48:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4661881eso5464091cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774284508; x=1774889308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8+rg6T95L3e6cdKRmvOpy6bF42FLdyllOf+gYk+r2to=;
        b=bll+XrNB6cIGVZ0vCiTrp+OF0X4HDYI6+4s3tNSeV6QX3hjCYVYLh1m//hrPSthEKI
         EIq/8cEoQ/y3WafRqE2RY1vE60koPwO6OPq5gyazE7BGOawwBYEhUo+fOO96eYfT+FIC
         hBk1ohfnb3WiioSlJ2Md+V4ra4PoCea2pMHu+3RxbNTUulVBEeWfZpPPnln5f7cQ4C2W
         iq+WTa3Bwh5AQVLvXYCjMHgSdxYZGM+ehDalX4baetf44/BWsLWTvt63VXRRCwQgQC2y
         /8QPN5dyY+rQBUeSdQTgybHO7bQSS0xY8BdsoSsHowEHmTu7b7/5oUVtyLFf0kJv2fXD
         ba3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774284508; x=1774889308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+rg6T95L3e6cdKRmvOpy6bF42FLdyllOf+gYk+r2to=;
        b=rFkp1CVbbfwTz98spqinmHhKMxIuLanUhAmq1xZldhqwXcvs8GDyEkZALRwuAAkVWO
         I9fa63Zda4cIgXgvS3X4+rTxeCHdUora9Dgz7DGIT+D05ehIRac+I+bV2owqOSIhiCtD
         ebaTBs+R0lroHoER4oXtouQAPKnbSLBGi/6XJce5c67zLnskDhT9WqCFW/6Oe3O0naTG
         0vxur96SKP0Trepa80lYdd30q7ckABUn9gC02wmrGESsntQyPMXABfWyNTcIg3aWbYYl
         0xjyQ4PtVBzLveh+a3g2jdAL2wMSASXidcxe7Ja/wx8dtVWB/oeDc3EuozUQ3NbacDdF
         b8Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXOfqHwhbxMnSTxW3RwZoWxZNBHRd6ifCkCaNutdkIlH0Zo5FA2iRbgU0DJAtVenx0GIdyXCv5Fntu+lrAT@vger.kernel.org
X-Gm-Message-State: AOJu0YwaeY5O1iWlqfXPsjBmqhQ2BRjsyVtpCTrR/wpyJBtfthJcpHC2
	bdGVsAt3+ZRl15vac+jzF8FhDqeNkgiR2rLjnJhdE5jvCHULzw9MwbRpAPdlm7KMS70bpAnpv43
	J7O5pHVaveLDrIPrpCb/chQ+n2jmHoFD844RDygQV30WLQGmm6LlSCat1Ti17Jy4AtHTZ
X-Gm-Gg: ATEYQzxVeMLg4Cv9fylDJCvMD9GcYvX5ETsXwJbXUiqyA3IfnD7Q8Ed/AtpPT094MYu
	6SdUcH1bIKZtER1o4p6AnwNPy+N6Nx51SJFfQTQUnzJGkUD6Nm5CSsV/Kpa5acxqVEr/1bRhsm+
	mLo0zuvuAcQqeNUAiijNkSWakdiyu8IubVCc33r9iZiX7V4MBxUUft6MJwn8ZVQ7bKOnkwtftCg
	sD2OHBSMGkOTK9JPFgK/RyhaYZlk0NixE8cV/z/MP81g+CaIt+P7WCyOFchVYF3jvPZVnGzFCAF
	BnO6EGvZfP7bL+A+L35PwECL6bqlnoS+N0BQIkgswf+pF8kDfKCp1YvPdJIdPDaybjQOauHSzI1
	S0g4YFBlthC9N+s3df2bJsjKPB9sjhWjLb7vJuSfpoPA37rdwNLa2emWHosimcHT8oRm41NaprD
	HW6enXefoYNftvijRxE8LAQ1V5sVH7+KZXiwM=
X-Received: by 2002:a05:622a:8c1b:b0:50b:277d:efc9 with SMTP id d75a77b69052e-50b374f5bd6mr176063061cf.39.1774284508165;
        Mon, 23 Mar 2026 09:48:28 -0700 (PDT)
X-Received: by 2002:a05:622a:8c1b:b0:50b:277d:efc9 with SMTP id d75a77b69052e-50b374f5bd6mr176062621cf.39.1774284507620;
        Mon, 23 Mar 2026 09:48:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf97594bdsm26711581fa.14.2026.03.23.09.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:48:25 -0700 (PDT)
Date: Mon, 23 Mar 2026 18:48:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/5] drm/msm/dsi: Add support for RGB101010 pixel
 format
Message-ID: <l7p6mczksd332pdxsn5lttnzxljux5fqupnmnetfdox5kriqpj@rolh7x5zdxxi>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
 <20260321-dsi-rgb101010-support-v4-5-eb28ecebbfe8@pm.me>
 <nmC5g-yqiyxWusbu6f0dZ0s7W-bqYdVUT0fIX9h1MsvYrAE521869Ei9NAKzwxbz30rvdYJCVjEWexnaUrAx_63G2DtM2mVUZthU1VRUbrg=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nmC5g-yqiyxWusbu6f0dZ0s7W-bqYdVUT0fIX9h1MsvYrAE521869Ei9NAKzwxbz30rvdYJCVjEWexnaUrAx_63G2DtM2mVUZthU1VRUbrg=@pm.me>
X-Proofpoint-GUID: kctuFLMgDE3NmJgxwlnS0kWnWZjaAILa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNSBTYWx0ZWRfXxB+mFgvFKg7o
 kFLk6M4RR48wnuttkuZ6A9PARCyMArl8WIeawV1an3zMNkne+0nqzHLk4qhcZ+APxX8tplsxzjL
 x5PxN6xTMdL0h7hdfJYRsL+DHrapNWTgpXglEMLMTj4hK94FcF8LYwrZ75B+WyGlfbV5lhi1kXb
 UTLyORR09EkeI/xhLcml/xknMltugMUG1otDlppyHS+DBMKVuj6rNHO24PYlGVWGcAQ1rOjdNsy
 tKol3GyOnxK4TahsK9/0HGl3m+buf5bnkqdST+k9Anc/vjLW6X8or7htvJgaHN+EW6eerJe+vI3
 uOqC/tP8ybJk/qgMjGPf+8V4BLNBIxrrtO+sXzf9xlMvOZPsl67E3P3zNkxydqz8Jf25yyClpJW
 Bs0LR3Tr/TeXHnIp16734MTh5w7O6inbhkT+Fzo5CgUF1++MY7qewPoajqVSIWFFTcHzL8pbn6l
 /DSOxxQiDUCRZy0QcVA==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c16edd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=qC_FGOx9AAAA:8
 a=lcybLqEkPtajXZbn_A8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: kctuFLMgDE3NmJgxwlnS0kWnWZjaAILa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99360-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 087F22FB064
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 03:28:59PM +0000, Alexander Koskovich wrote:
> On Saturday, March 21st, 2026 at 3:52 AM, Alexander Koskovich <akoskovich@pm.me> wrote:
> 
> >  
> > +	if (dsi->format == MIPI_DSI_FMT_RGB101010 &&
> > +	    !msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
> > +				     MSM_DSI_6G_VER_MINOR_V2_1_0)) {
> > +		DRM_DEV_ERROR(&msm_host->pdev->dev,
> > +			      "RGB101010 not supported on this DSI controller\n");
> > +		return -EINVAL;
> > +	}
> > +
> >
> 
> Was tipped off to this bit downstream where if DSC is enabled and panel uses
> RGB101010, it overrides back to RGB888:
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/DISPLAY.LA.4.0.r2-10000-lanai.0/msm/dsi/dsi_display.c?ref_type=tags#L7209
> 
> Only does this if widebus isn't also enabled though. Should we do this as well
> upstream?

I'd suggest adding a bit fat warning here if widebus is not available,
add a comment about downstream switching to RGB888 and letting it land
this way. I'm more than sure that there would be some additional tricks
if one uses RGB101010 on SDM845 or SDM670, so it's better to let people
having those panels face the need to research those rather than making
them believe that the panels should work.

-- 
With best wishes
Dmitry

