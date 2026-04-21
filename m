Return-Path: <linux-arm-msm+bounces-103972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P04F0ak52nX+gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:22:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EB743D468
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3B823010213
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 16:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BAC34E746;
	Tue, 21 Apr 2026 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYzbPoPr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZ8qa1gX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B3246783
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788543; cv=none; b=WX25Pru+LhgLC59IqBfdB73w5l2lq/uvJAiWbdDW5oxi8h7SoLo+y7oPdY+bQTxBfAigszeaoB+TSkZW71GprfjC4Vg1w1gO63nE+Gf1MkjISaeSiTzNkNc14Sx5zHOHftGRowKPCwuFY3nUUMGuBMLy0vAk6a+bY52STB3z/HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788543; c=relaxed/simple;
	bh=lDXxPD3nNoLHOTvbcG2w9LytsrlO8qZts+21p2vm2g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2Prkcri6NfoSM21r2wQDZ8fqwgNFG83Ymb77aHP4EcKZqqw9fDpnr1Nu3Yjzdj6ZBPS3I2awL42x5+pTgUyH54DdCC0X9gjWT/GTIXpRfo9vDeRbypK86XU5gtE0DexiGAx0jRYkH6S2L0HEF2b8i78f5Y30glohGSfLzVvWOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYzbPoPr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZ8qa1gX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA2jKl1809737
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jfXnen7U69qkupYkJDpGagy0
	EqslxjpwMG2ZX+ZP42k=; b=mYzbPoPrhwbqYd6J07BMSYvmfyBagtYAvrL4EM1n
	U7UumSHKuzVhEza0KbDNmdXq3Udw3FRIiejRCBrqQethC+3KQf8fEWgeF8XyeRio
	1Onl5/L9fz5l81YDMzlYpx7sBa9TNW2hwjRTbyQ6dEB18C+gfnb4oCXgd7uk942C
	0WvKgKf6iXPo7i8+IF/QuXqAv7fQRCBegyI3RFM2ect02m/9Pk/7P4BQhZDGwfnr
	S4C1a6ygSn9BFtoM8/LaWgmeDOzk0LUNOB4iMFp5x9T+th6PicDpVUJfe25kxlWG
	cnirAxFWym0c2FhDMADFyJsIXKdxn9K/CxAGvctitfvClQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp74xs8vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:22:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso47734971cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776788540; x=1777393340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jfXnen7U69qkupYkJDpGagy0EqslxjpwMG2ZX+ZP42k=;
        b=VZ8qa1gXVTfWNUWrqsDRpnNJTBsYNMcVQNAVd+lzd1kvL9sLO4Jfk5uWbOiJv+UJcR
         uC2+/agyD2pc3/wXMd2O1HyGoCxvYpFuDQKczzWX+8u8qpsaj1iNESADv1dsS+2kiRDN
         6HUKg77HweijxJqsz3K7WqFsm56sNu0VXqbb4fYJRvUGv1L4LA3uzne8v60q5jUSisuZ
         onStTu0IXpf+BgyiPQsoeQS0RV6P4AlnJapBQ/ND/V4aO0cd2KkkOoGj0ehfrUGO+wdg
         ETeRxnL5O6mrYqDtq3lvLIdvtakxldU/IcSQYvEIfXtBF+MJFTgBzH+KSWTba40kVh7d
         Uqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776788540; x=1777393340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfXnen7U69qkupYkJDpGagy0EqslxjpwMG2ZX+ZP42k=;
        b=lKUZtiH5dSJ/S7JhM/RIcqvd1Pnpp6CE73CusOGdWp8cF8cOJ6vsNNnM5Qpv1kBTL3
         60k3b9J9tqB+q23JsVWUv52m54ubzM+5d5z/3owuKP58qqsO8XptpS9VesleO4AlQTBg
         DsHYC0mYYXM/JafRvO5bd+ftJxON6R53vC8LPwg/3nsQeVtGkpBoWsBM83iCB00idWGC
         86tifoWi09TlMHpcMsXi6NRWK924wGNJ82OXdbN0BgO4qewz2kuYmA9jXWB/GO7ebkPm
         rg6A39+SiV+BvlXDb3apV9hcGzsun+bA23lypbjzBSXLYOz3nglDDHDGYMZUIeCDW0M9
         GL+A==
X-Forwarded-Encrypted: i=1; AFNElJ/KfyDR/4yUK5qRudLcbzz9zQy/hK4DgkyGBwzSGLD3R1QyLahnjMT+SbiY7JUqcg/nK9xJSsCxXiHbDgVW@vger.kernel.org
X-Gm-Message-State: AOJu0YwE/nkg5R1yloW37xwdJPZaqZCPsjIR+YNlvvC6h6eli/X3iUVx
	dzUHh6UuYzosyrvfeGfKm5RhJAE2YgcJFNoDbHMyR8TB807/m7vCfT0OtKtFxQsRg5bszbpNyab
	/3C7vb71Xol5jEjeb1OUwF4pym2G2PjJHTmGUSYB3Hse/OpwE0XCeZDglgTqUJVOyvv1k
X-Gm-Gg: AeBDies57MiniLVC2VT8K7VyGLxGuQuf7drxWqzxyG81JIk9wdPShK0TQmYyj1Uh42f
	//6HyITRKyccvmM/ZYOy00irnmmOS0MG7cA3mXKgKaM9oldf8UFRZFtkUh2GVORkaRYJhPTcPZC
	6zVQmdrKx4NvGx4lHNby1VKDfOKxmu0agjzP5ghHhQQGvL31OAN+vyOuQ1hJqk0czJvOSJFITdG
	01mEo3BTp9WwF0TGVH1FuVgCmUC7ZOofBhgoEeya3vsxBRRzCL7Cyqgdy9yOOJR1sy+v+KsFnDz
	ia9qDJDTEdls3FqB1fgDyuHaI/gBt7pU9TJq2vu4n2oRyr0hUTs+O/tDbUI3BnunZUcAzdiEExb
	7McJviXoIILNJR1vw675q/GMQGUjG1PC2fmkmmmnnQmi3gHhoxzP8rlIZ2O0prfzkIeBr5mtJ0h
	vELo10yngx11Hc+xXpHUrhDhRvZLpQ9Jw7gpKP3JWc4REJiA==
X-Received: by 2002:a05:622a:2612:b0:50f:bd79:2643 with SMTP id d75a77b69052e-50fbd7935aemr12704751cf.34.1776788539789;
        Tue, 21 Apr 2026 09:22:19 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:50f:bd79:2643 with SMTP id d75a77b69052e-50fbd7935aemr12704261cf.34.1776788539358;
        Tue, 21 Apr 2026 09:22:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a57sm3724808e87.57.2026.04.21.09.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 09:22:18 -0700 (PDT)
Date: Tue, 21 Apr 2026 19:22:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/6] drm/msm: fbdev: Inline msm_alloc_stolen_fb()
Message-ID: <uraxpqrs4fsvtemystbrl3bqbifudd3zdfxzycrc2e52jcefjo@m3yxmehmkt6t>
References: <20260421125733.209568-1-tzimmermann@suse.de>
 <20260421125733.209568-3-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421125733.209568-3-tzimmermann@suse.de>
X-Authority-Analysis: v=2.4 cv=Vq8Txe2n c=1 sm=1 tr=0 ts=69e7a43c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=po8OidZPQ8zUZRZG6y0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: CdspXZOn_F52ylOXJm0Wz11piA1q6lwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE2MiBTYWx0ZWRfXy62661NSUH38
 MELtWwOH++7emVQWkP+Pl2BeTV8lJ/7FhTcyNqsXgZ3qoYgIaKZwTGukqvftV28DA7ZrIIoVENG
 +JeTMDdZ4vkb3soPavAn4i2eON0l2nOMlrvQkTmLVLyVwZ72O9EPNIQktqHHHG4T7EaraYGBsLo
 jevQiywHcR15oqyEHompNV4AJC0oywhsYwycAqVszKGWGLtdTvQM6iOo4l7UL1rpk++GsauJHrY
 waisezYyMFCPO1b6t/5clAjLDprlJVAxVgO8jNCm9OALe3qhmEawm9hNzmggVqZ8AyvZPsPesHn
 6yPSloYqZ73xsUppcCCOOAvvKFZv/vtIR0q2bbxWhDZXXKFRzAILHroSqdyN6OxEeNGx3JquYRr
 M7uyJSmEeGj/okSuaPSfGgbYdezPBB5hQDGAbWgtt1xPoUWfeePbVSHE5qSJaMurG3gIlrZazM4
 zbQ0nwjkwxbgdJHj2JQ==
X-Proofpoint-ORIG-GUID: CdspXZOn_F52ylOXJm0Wz11piA1q6lwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210162
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103972-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,suse.de:email,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79EB743D468
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 02:51:15PM +0200, Thomas Zimmermann wrote:
> Inline msm_alloc_stolen_fb() into its only caller. This is necessary
> for converting fbdev emulation to use client buffers.
> 
> There are some minor changes:
> 
> - Handle errors for the non-stolen BO in the respective branch.
> 
> - Fill mode_cmd right before using it with msm_framebuffer_init(). Both
> will later be replaced with client-buffer interfaces.
> 
> - Set the modifier[0] to DRM_FORMAT_MOD_LINEAR. No functional change.
> 
> - Integrate the error handling with the existing clean-up.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_drv.h   |  2 --
>  drivers/gpu/drm/msm/msm_fb.c    | 46 ---------------------------------
>  drivers/gpu/drm/msm/msm_fbdev.c | 44 +++++++++++++++++++++++++------
>  3 files changed, 36 insertions(+), 56 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

