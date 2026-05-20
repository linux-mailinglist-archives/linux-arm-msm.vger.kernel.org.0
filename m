Return-Path: <linux-arm-msm+bounces-108695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGMvGU+MDWpKywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:26:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9358BB8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2313730E30DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40B32FA0C4;
	Wed, 20 May 2026 10:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0qpEo8i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijV87KfV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B280363C6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272460; cv=none; b=jvkCLEtJvjmFtYvxBZ6BSQ1lNwHvL9/DAAWlZzaeHtNWIEGcqJj/yxLEbIVS+OZp16lngLKJ8ieKeLhaa9feyYGqlC15LcdKwZ1s+tY/ap/XF8sqZnU/AhlJB/RKx/WCcwhkMrSEUTNrJhkfvlVJRcts72YR+ViLh0R7qDW0ZEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272460; c=relaxed/simple;
	bh=eXOoEgvyTAu6jXlH1aWCjiNUmroNbu8hmqITlkieD7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUpTsxR2K9IBz1sr1xz7HBB7NqgiC6n07F6mzQBq0E/jiUo7IKZME0dfnP31hRIeXUxatw7CPHnfg8D7IW3U4bWWAdXyvLsTOV0CwYUtKJKgxF59AFNfxQGvMVmI0pakOsSZWwgRqx07Z0L0lpMcZcFhW0mCxYM8PswKrYEmcm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0qpEo8i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijV87KfV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6k1Xj629575
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kGu9iTGWx42JekHQzxcy0M/x
	7MV9NKa3kYQaa8egCrE=; b=X0qpEo8iPd60v6e9nMb4T9d3vvZ2mIYPU+sug4pL
	mqlJf60SlpSafzM1rb9GwxxSTBG0KFu/CmJ6LFLrZ95swt6EKhWMA4zrzxcDalsn
	guqwfNY5XVn1f+H4ElLPGfaJ1ef4WY15XVpnRkxqMFfF+5E2Zy6ebsWJ3pMpwQLh
	oanVfrK5FvQM2Ou2cZT6vETEVMLC0ll6byAMb4dd2PzNATDSZ3bxeo7IUsfD1/Pl
	MLBus55N+vG0sVhwPfRgMXz/YsqjQKdl/V391b1m8foPRnXHDRv8titlsdqYZ6DI
	s4Z9RO664BF8CVRwkYKNNAisBJ2bg5Zw7chaKHGFrPVlzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nva6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:20:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514ae0e3ad6so112055611cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779272457; x=1779877257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGu9iTGWx42JekHQzxcy0M/x7MV9NKa3kYQaa8egCrE=;
        b=ijV87KfVTAL6sEH1nPURPcP3GkJYk42H3z/MN7YDGLGR8hZ7NCxZ1bPX6zFUmsmfNW
         mq8S475nPnr1hI9ImU8tgNeg3S8rbSJSa/f+h+9gpIFltZV2t1Q946bh/vqjBIH3k9Cs
         NQ3CVirh7/un6JuDJGdmHlyj4fz6fLRTI8HSvEr8PdEMnNDEDF3BG7HK6zFlgZYAt6QD
         WrK2ic2pQoixsbsBfw31VJd2oEecwY9dWEXrrzwozHXv/x+SY+jiVtMByJVKIwjkEvVQ
         taZ3tSU5vV7Y6hckpavabaMa0NSlxr7k8yt0cJ3oNdTvxyMyLvfWpTrq7ByplYrTptH2
         sY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779272458; x=1779877258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGu9iTGWx42JekHQzxcy0M/x7MV9NKa3kYQaa8egCrE=;
        b=C7F36HTTngLXMkfN05sEJRv77OvdEbT0ziw08WxUkZ5pXTvkZeqWgBsvNANhNR1myR
         XU8Sgz6McitvHMzlQ+UOlopoM3hlJmd3R4J+2BZajkuBRtawlEPFbdmSaUmddbgB0Sf5
         x7GOoqPP+p4XqL2IlUcuwZvx9S+MlXT4aV+yEpwLLAVvAGzL9dxXpBpT/lmp0T4RqWB1
         ltZgLVbtk8WYEd4iWxlV+TQX+OHrXIEr9Qoae9DrxLQtg9zBrkwF0vqEqH6KxLaCz9cw
         YB+qJN+cpfqGQBgzjpqW4Xq921OqBltLAVeozbfWNxOIOBFaoOTnDhi3dpdh31wykf/C
         GAbg==
X-Forwarded-Encrypted: i=1; AFNElJ/uP9oKEauBQ6sgXilpRRsDuepXEKixRWn71N2Imw2CqQ+h+UTjzyK3RtoWW+1+Sfmj7lfYOPymAFjKjAz6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk19nYNQfhWGTHeJUleFhDMx6PgvxevqRdOfQJ62Ze+DIYL/WC
	m7gI64ZEpgcZ/p+FTra9ZJwA/KVieKVIgDJBIK7qWaOsq633q9EKoFIYr9HmGSqmZHAKbz3wst1
	+8R4PNPVNJ5bPxXsyngU5pOWG198mH+ZrLxJOYYbzYF43Qqzd4cUnirkeSrIJPUPpOShX
X-Gm-Gg: Acq92OEA4GCHDwWB9iTGCB/SrENxH27kt63n4Xk5mvDboPYgqyxz9acxf4GaxDVwVZM
	YfS2hDvbJWy752PAOfUmdyXA7bMBX0CsQ+nuVwfJSUaZHTfGdJ0rntkLFFaoAgcCAmc3y1//MY9
	FlMGtAqzdnluGb64DmrM3uR5rXy3r/BM5e+rji99PvSH2+CXIIKy6FNXc62whbj0O94kpD9GXhZ
	6lyAF6LLCZKzTy6yhpKBK+FeB5gtmDC96rjJrQ7aJdnaHP7hPKIT3voU1bv6CUcbm5IwW27Ox/G
	BEyRbN9DL+NXJDcx/aNxIlvaZt9vJh2M+J3w2eEMPVi0vK7HVRW4n10Ly9hZZ8wR2X4+f3fCcfN
	wPl3KT2jhsIn5tz3NMrg08sD5U4nq5avT4uQniMk2OhHii7kXg3PzFx/4ZtqOXLsbP6ARCMC425
	ynSxZNzVs4/reX/bjTCU44+N/nHk6sa5oySms=
X-Received: by 2002:a05:622a:198d:b0:516:9b05:acbd with SMTP id d75a77b69052e-5169b05adb8mr130033281cf.16.1779272457465;
        Wed, 20 May 2026 03:20:57 -0700 (PDT)
X-Received: by 2002:a05:622a:198d:b0:516:9b05:acbd with SMTP id d75a77b69052e-5169b05adb8mr130033031cf.16.1779272456990;
        Wed, 20 May 2026 03:20:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm4824045e87.3.2026.05.20.03.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:20:55 -0700 (PDT)
Date: Wed, 20 May 2026 13:20:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/39] drm/msm/dp: splite msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
Message-ID: <q7fz2sr27esg444at45m57auwivfcmffjk7ij665de7vsyxtc2@2ww3plm2hqna>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-5-b20518dea8de@oss.qualcomm.com>
 <omw63f7fbqiuw2t266dq5drk7rz2kohydpvbbhcrbfiehb7lzh@aucqhfaliams>
 <57f574d3-7000-42c8-a5b7-88f1a73efd50@oss.qualcomm.com>
 <etjni6nlx5a6xd4oqb6ow5ihxdl5zcdtcofmo74pbdt7lilnxd@q2zqgiqycjt3>
 <c1eb178a-4cde-4a4a-bfd9-e3b0ce4b52da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1eb178a-4cde-4a4a-bfd9-e3b0ce4b52da@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5OCBTYWx0ZWRfX3fZPMcjbvqRq
 UhoEy2EGFiT8vWYRW+O+xc/mMl1+fWj8xyWRmx66llpGWBKQehEqnG7a2UjkrXpK5Ae/4OhVHPy
 p+77fjHDhUBpWvMlfwPP2eoCq+0PdrmE36mh1oj12B0mrEhWFC0JrYWlSrvizH7Da6cWqo5A/5y
 4oTom6YJv/rOOVX3O+Q4ooOt/LMt2p8pPpgeS94u78VFHr388f2kklcMg0SfjEmKsTYMM0TkFJf
 pRprWmxruNBsaYfksoOsQ21rvR7TeW16sGgH8RyLKC97kT3S10WYhvwF6bxjHO5LDYUv3BM33Cu
 E9IqTSbPeXY/k+SWLzYtusWWQIJHkXvD+5vT7IZPrZY5tO+aT3EntghJtW224Qy2QNSGegXVBLd
 nCTHQQ2aD0PYhKoflJuTEUp1m8sNjIdi62tn5hDFmddDwlmlQl0bFG7HVVM4pol80TI5rR5l4o4
 4qoWLxsLVu+X2FgX7cA==
X-Proofpoint-GUID: itqFt0cCc8tkkUH2KvWYl7zaT3mHSwMZ
X-Proofpoint-ORIG-GUID: itqFt0cCc8tkkUH2KvWYl7zaT3mHSwMZ
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0d8b0a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=OFC9lnTRAqHNnf6JCLsA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200098
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108695-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCC9358BB8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 06:16:05PM +0800, Yongxing Mou wrote:
> 
> 
> On 5/20/2026 5:23 PM, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 03:46:36PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 4/12/2026 1:34 AM, Dmitry Baryshkov wrote:
> > > > On Fri, Apr 10, 2026 at 05:33:40PM +0800, Yongxing Mou wrote:
> > > > > The DP_CONFIGURATION_CTRL register contains both link-level and
> > > > > stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
> > > > > all of them together. Separates the configuration into link parts and
> > > > > streams part for support MST.
> > > > > 
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.c | 43 ++++++++++++++++++++++++++--------------
> > > > >    1 file changed, 28 insertions(+), 15 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > index 476346e3ac19..85315467b5d0 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > @@ -388,26 +388,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
> > > > >    	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
> > > > >    }
> > > > > -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
> > > > > +static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
> > > > > +					    struct msm_dp_panel *msm_dp_panel)
> > > > >    {
> > > > >    	u32 config = 0, tbd;
> > > > > +
> > > > > +	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> > > > > +
> > > > > +	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
> > > > > +		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> > > > > +
> > > > > +	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
> > > > > +					      msm_dp_panel->msm_dp_mode.bpp);
> > > > > +
> > > > > +	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
> > > > > +
> > > > > +	if (msm_dp_panel->psr_cap.version)
> > > > > +		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
> > > > > +
> > > > > +	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
> > > > > +
> > > > > +	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
> > > > 
> > > > You have an RMW cycle here. Please document what prevents it from racing
> > > > with the concurrent msm_dp_ctrl_config_ctrl_link().
> > > > 
> > > Here protected by mst_lock in MST case. Will add a comment.
> > 
> > And in SST case?
> > 
> Emm, do you think this comments fine?
> 
>   /*
>    * RMW: in SST, config_ctrl_link and config_ctrl_streams are called
>    * sequentially on the same thread. In MST, caller holds mst_lock.
>    */

LGTM

-- 
With best wishes
Dmitry

