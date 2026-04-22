Return-Path: <linux-arm-msm+bounces-104013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMAmKwVD6GmZHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 05:39:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 171D8441D62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 05:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0B453010156
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 03:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2D43A4F23;
	Wed, 22 Apr 2026 03:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVvrjGa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="alrv5u5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB9F39A058
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776829186; cv=none; b=CCZHeJwTfD4hhgcFn+HRMWaQsBNmTz3JqExLBlCi9pD5KMNalOKDRNOWBw5eSVKt7QhP4MTo4Kh2uGTewhfPqrsl3bWtTj2r8ijtffUTTJxJNUYCBjWf0NvnstjZHFrLS81oYDJNTysW7oUYUg4DU3ML0mzTOKFVZDa3FUMIOgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776829186; c=relaxed/simple;
	bh=Keh27owh9hIsMPXCAo4PsupivGcK8csVAuaBMjckgEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyKK2unnX24ck0CCr6fAJ8G+7mfyfvuV+tdzxK6h1xcDF2m2cW58YFBfclKRvCbgFenEL/YYhTPvX+g6h2OhUY6FDF0+nE67k+2v1rjpqJH/Oa1tB9peKbsLlqXk2olVOybJCt+4SzAIsKWArWZYFGOGHZMq/FoNU/6ZsTf523c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVvrjGa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alrv5u5F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZrEX163911
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lf3oiZ9B7GXrBV8eOzokgu9O
	Y13K6aIvRgDfejReTdE=; b=eVvrjGa8HRbuOefO9y5ezfo9E6s0WptDN3K/ccx8
	gUQ5135DiCuY/FrKBZYOuwDfxi0uJm0pHjN3/DS66asCfxi+lAoGOkb3MB6AY1f8
	K9io/1LnbGXPz5k09d667DRjF9INxZa+d0Rb7nRwkcvkm+7ZCFBUiYGMhLyQuKOG
	uJ3UBiY7hqbKli+Dx4dIxKphcjKXCJfEJLJlTyOhPmgk/YAPtBD+bwnPB5LlORiZ
	WKs0a/CWptOo9roGgSgyo0iVvrgSg1vLP3EqszkaAe5OEdY/q6ucIw66951PRCjU
	QlE3t41945Lo4ZV6Y3SQM67UudAmtVgVTSK7s0zGoJNNdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhhedg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:39:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50edf01172bso63530231cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 20:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776829184; x=1777433984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf3oiZ9B7GXrBV8eOzokgu9OY13K6aIvRgDfejReTdE=;
        b=alrv5u5FYy+Xy8bzsF3eqtVZAKa2CZExFTQ6ryg9u2ALvOEPuCmY8DZyFHdfoqEzb5
         WIPOT/DTe5FzW+W1EtXdARLdNHrj8Nz5FTw3g12MvWsDEHefegCAH0PpofK+fvi2tz19
         I3WZ+Yp+klDN0yhhK5EgDZp5l1bEECtc1hz6yk4U6HyrnHwvT/mPlL5AFSSojmQXMz5e
         IOYUlAO1JPD923lSjRmH3cTC7SgmECr/ZruepS+7yPtHYadGGnB9iZvfFIOyJ3csg9ZV
         FlltC7ljd+xIJct6K1YDGA9tF9OikBdtgamnlmVUEauHVqicnH6DIJ33/w/FAwu25fIX
         Iogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776829184; x=1777433984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lf3oiZ9B7GXrBV8eOzokgu9OY13K6aIvRgDfejReTdE=;
        b=pMqSN84PCjoKFgcoRd//tQVg2LGkMloGueS9It/v0UNaAe71CayO3zU8GMASl2//7k
         bS58/H0gbRmBDxDvFm0N/rn31GB9sWF/y2bWk1+DIk6Qtmvi37SvTNAk12JfxMquH+ZJ
         6d3zeELdelZy5FB6MDfHK0UTTAjsPrLxEzPrpL2YydXGX6iujOd3VbW114sE0veP1LEN
         jhWUSzTrNtBYRGlMkfy+c3VZ9tzdqGfiIj/ZLaCwSswpu+QjGbjq7j28x7fkQDVe+5Uw
         BXGTVOD3tiPEEs6kt2Ovst/H2kzICz68+7GrHLZ3uFxppnJAS8VSX6XlAxOr/GlTuU9w
         JYtA==
X-Forwarded-Encrypted: i=1; AFNElJ8D6FAR7ET0D12Bxx2PED4zTHDGKSy5j3ow43x0IrfCCHoC3RjDLVRa9KuL0FHMz5bgxb5bbvuV8H+RiMNy@vger.kernel.org
X-Gm-Message-State: AOJu0YxvW2a7MoYgEmpAuPP9pBchasZtx6Xm3l1CkCQSoip4JxVM3Gvh
	wHH1xw8jHY68s2dEBpyd52adH6VL5hyLxK40uVhEERjCCfxUErpujgxROLpRjSpv/sBcosbiBA7
	nJezUuumzu8bvdWR7pOo4gLROLVuugTvz/rREy1bitRb9/yPXsdhz0Z1yjYoGXLZpkKWF
X-Gm-Gg: AeBDieud8gC+Gi1EN2OpxJo2n0pEc4S+Yg7kWohquAKOEEfgPc3P0dMv9vkENuEXrNA
	Ddk/3TLkvOjmp9ckfx4axsgKlPdd+4Dv786vuuYhHQJHA6pOSTlmMpnbQxXx7UncnisdgmJHj+H
	VotDgNww35T6uuwTl4b1guGmaZrzkD+Rs5JBPeFKwj1oDJMy/ks5wYfxJkAE4jjAMRxLf9fxEyG
	VDP6Q807fiXDRZpLLnYuLhtOAXwQqRpfc10hw+emLwvGbWmqc+Y4y5IqsHitMWjEQ/51XAMu88h
	0m29WUvEBgdAyytyuDJTEwDp+7tPACXc7EvcSS7uZsx77ZPLpgVI+xPOfWa1dp2tHPTMrhiYgxg
	d/Asotn/cw/HLDWvvuorrvcLqU3uFkUBXWl9L0zU5mGiQVOsNVBZaKF0ualXG+Ff4/0qoKI1Z6D
	x6gGRQ3h3W1lFLOILv0OUbzTdcFN+7j2xJiel2EQOUSGp+Kw==
X-Received: by 2002:a05:622a:544f:b0:50b:2640:22e3 with SMTP id d75a77b69052e-50e36821b69mr311781331cf.11.1776829183901;
        Tue, 21 Apr 2026 20:39:43 -0700 (PDT)
X-Received: by 2002:a05:622a:544f:b0:50b:2640:22e3 with SMTP id d75a77b69052e-50e36821b69mr311780971cf.11.1776829183482;
        Tue, 21 Apr 2026 20:39:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebea2sm4028793e87.76.2026.04.21.20.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 20:39:42 -0700 (PDT)
Date: Wed, 22 Apr 2026 06:39:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH 03/13] drm/msm/registers: Sync gen_header.py from mesa
Message-ID: <qpvedddi36ihfldioqep7alve7ah3lbsk3txkru57e22f4ud2h@rhxsnu2fovot>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-4-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420222621.417276-4-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bPRS0lLr4HGEddbzaSzS35DOHCcxWzvs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAzNCBTYWx0ZWRfXx5g8d7CwUTX5
 eDjLDmqGePfTqkWhw0MQ8VKYzUWwF6FdEoaK3KIZRmbacIbSignfMQnGzz9zkEofARlYQYJOrWz
 z3qtWpc+DjV6Azk3YPTZNUJyhK5dSdF2PCUMuC92G6Ufi3qySTHRCS/SCdCO6XYmc1hZtR5iPcU
 lucyTtZxv0nItnuUIv3ONZzewtTizdT6QYPIDifCP9THnWb/Jc4Z93yhR74jo0zx0hm9xpJMxfB
 wMPGKge97gQTw/X/eToQ9VxLeJcmvqrY4LeTMI3bWj3BILrYUGJtwFbdWMBwnHvZ4qp7jPJE8jm
 EmU9eAOqFEizir0X4lk34qM49DPYhPkhRXJyp89E2F6vwsigruV3e4Jj49+2V38kLPrdmfDQN57
 0R8ZmBdvWmfddqwfplcqngqGcoPjU8b78Fw7MwEwX2t2s1t7z19FI3do23BKIvmH79kBJVafRCS
 Vaum2DB0DAMZUVy3WxQ==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e84300 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=9RIi00WSWFsP0q8pkWIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: bPRS0lLr4HGEddbzaSzS35DOHCcxWzvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220034
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-104013-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,google.com,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 171D8441D62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:25:25PM -0700, Rob Clark wrote:
> Update gen_header.py to bring in support for generating perfcntr tables.
> 
> Sync from https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40522
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 2079 ++++++++++---------
>  1 file changed, 1146 insertions(+), 933 deletions(-)
> 

Syncing with the MR is not so nice, it's a moving target, but I assume
we don't have a choice...

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

