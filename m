Return-Path: <linux-arm-msm+bounces-98811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDadAHZGvGkJwQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:54:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 553182D1676
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4261130F2FBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96862D6E66;
	Thu, 19 Mar 2026 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ep8bUYf9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CAqFGjS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8103831E825
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946465; cv=none; b=me1gFvmf/AcAuGIGHnKnBKhGYIOA89vNC9Fnc3iefVxciuRXZfkhXLL6LvJWu5arux/Ao4kp0FIMWZFR7ZOCdifilrWA636XZFdcDQxEab8SmvMaSshdQakuDnCzZGt4RhffJF1lBJvcP8aXjHrh9sgOpfYIaK8RlCp0qSD/djQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946465; c=relaxed/simple;
	bh=gTU+NK+xwXht3jAJSVyEDCEnH59+VmsHfxhdE65PoI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ip8Lgr+1XTlA9OHKLFkWhW0eRJHPq0CYYNIqyD5mKd7RipEywwAL0h2fGmOs3GGkYRPXuu1vvOTJ5D80K/WF/Vz/5FKd3Xqin1uy+PKWWVMDJfsFKeBaC5rxEF+gvWjWVwBmRx45HI3TX0bWIn2sBT80gX+kaR85UOu4f2kmPdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ep8bUYf9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAqFGjS/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JFqDUT3771092
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G2WezGyr5dgk9PNvU7r1hTN9
	zFO7rnukB6Er6MUUn4w=; b=ep8bUYf9ZRAMEpLqB3fpyyKumKSf2DNGVuwOZvCf
	oNvssSRzSOLf1tSg1ElV+OBh9PZcUgE1axxVGoNWb8NsnbpGkeBwIQK4bS79Rehn
	5f0kNWbQKp9SCMiZUyC6cbjgj9Q3/V8zX7qpyjITLMnCSE50WH2UeIDbTZhVZOmi
	lAcURwidgtrn+uQ+Wv65rMJtnpwxwY6XWamnyUnHtlqKjPVs1dqnl7mlbWH7pGis
	sOhu65I5Zq+TgBlKf3Zz/rdXzLEZ14TeGXVPA7tAJM3vH3oZ2Qddf66YbjbmWJ7r
	B+ddtX5adE6tJSejvUa67bJy2gjqFAXOMpYI+0yo7ZIMsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083rb1bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:54:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090cc6a7d2so88316001cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773946463; x=1774551263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2WezGyr5dgk9PNvU7r1hTN9zFO7rnukB6Er6MUUn4w=;
        b=CAqFGjS/R1NRtiN9mlma/H6U4P5ecj9+rF2wQt6MjHm8e5XTulgwaacZ3i1IFc9jD8
         YQ0+eH8mSlvoAtr1SbTNGEM/Gei1z8zgC0KHvRKtb+zHc7cBLWG+8MLq5zJ6MwrdzX4e
         g6X/UzYRK9ZuZuyho8LeP56tZIO+nyubKHqtQqvw9XrjxmuOJ/F0hqoOdhWIn9JAHJR+
         J3Mbu3zCmQGM8QIR8do2UZi6zc6/MLULk3axrW0DlFFNh5fWO7jlXPTOObjfy7h03fvC
         ZiRF2PzH129RHtzcp9VNvnVzOMFSndf4U2ImBpCdejlFLEMXaDC30Jau+/1pAhCvdfQW
         2QZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773946463; x=1774551263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2WezGyr5dgk9PNvU7r1hTN9zFO7rnukB6Er6MUUn4w=;
        b=qpsn2Pa/Bjj6pOucGOI99r9hwyGP6MPSNFEjUp+fLd8SVzB1rQHpkOrkfTVjwBkHvc
         /CUlHsiBRyTGMXJdQAZP8ju9NK7nnpo/QANoerBPe5X4cp2f30uobrW9ctm5RC30Awu/
         k9wf5VspmHSRcfvclTxuu/zU/W/x8fjs3rqDNdS4H92ImrBh6B5k+GoagBYlyGLSHs+6
         R6/5M0BY3NgDFc/xv2R92QGYG4HsFQoUAL8l5dvEKc7N8gmgezhPXg//01Ys+/mCunYP
         HwfI5kqnsY/wBfvODkCIiP2gJYwAKNGa2sng0TzjZqak+wzWZbtzOHUlsFJh+UrnexNe
         J9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWgI0ZrxUEQZLdQEd3XRp3Dm8C+qEhsQBDBcV/+7AuXktwzs2qKgeWUOWGYokgVCpj8+paPHwQi93HXbr7O@vger.kernel.org
X-Gm-Message-State: AOJu0YzMOovTMeecfptN2suKb93kxdf9u1VvIOoQjaZfiknKDCPKx6Z3
	bg9D/AyCZi4kY+9X9fBmcTVkY0rn5L370J7jV+6tJc16vh70HxGg2rAvpqaNgFUhnSy2q4PmRLV
	vC2JpgQYMcAxiTOXJpNLb5E0yn3NRBad4Y3K3ceslBAfxTImb9OHI/88mYYCVnCGwvY4x
X-Gm-Gg: ATEYQzyAlteCqQNaZi4T0MmLiKJ6OeV0bjiBRmFYR6w3x2fErkcMeWZNYeTsiOrJANH
	nKF7o5cFljnWjk1pr+80YmIx+5by5v8GuHF8nhu8r0rgSICBWwiek4MaBdzOrLsKgt1fZNmiA6S
	WqmcXd5q68FVlJjrA2IhgyIM5WQ8A9a4Lmww31p474ama1T42wlMNtbI+kS0HvoyLmByKCHGQVr
	qZ+B7J/UDUVOLjFZlFkM7H3a/GFL9muJdQswv/8mf46SgQb8O2IPfxWaMrdq2feV1bi3R8CSbbW
	fVNDG2WPGQ0KTM8PhtReezc7bvqGA4L1ypNg57OFKMKjJJXhnaDAgUhcBlKTi213SJ3tPlPsh+G
	zoty1IM+r09/Ov7IWF9oHnsL++ql3rJEHjOsqHieo4EdxsiuO+YcWWkHO0gKCot0j6bBJ9Qr4L4
	7/0YaA+jW6hSIVkdfSY50l8RNo9e+P5+NRwvA=
X-Received: by 2002:ac8:598f:0:b0:50b:31ad:32a2 with SMTP id d75a77b69052e-50b375b76a2mr4098561cf.65.1773946462630;
        Thu, 19 Mar 2026 11:54:22 -0700 (PDT)
X-Received: by 2002:ac8:598f:0:b0:50b:31ad:32a2 with SMTP id d75a77b69052e-50b375b76a2mr4098211cf.65.1773946462070;
        Thu, 19 Mar 2026 11:54:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207365sm70334e87.42.2026.03.19.11.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:54:21 -0700 (PDT)
Date: Thu, 19 Mar 2026 20:54:19 +0200
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
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 2/4] drm/msm/dsi: add DSI version >= comparison helper
Message-ID: <5626aicmljavjep2sscge3olxrwwur6v3sm6di6c4q7yuhrqfq@utx6mmdj3erp>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-2-85b99df2d090@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-dsi-rgb101010-support-v3-2-85b99df2d090@pm.me>
X-Proofpoint-GUID: EQ0cbDNIURPWfLku6Oab5ywpD_qMqWAh
X-Proofpoint-ORIG-GUID: EQ0cbDNIURPWfLku6Oab5ywpD_qMqWAh
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bc465f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VDRd5MJ2I6Cixv0V3c8A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE1MSBTYWx0ZWRfX/G+GfBrUWAdV
 df7h2UCFB3Z399r+dJnMHtnGO74Qpflvkxurw9PkTo0JFCHAPYnjJGszii92aN1Rf3vSNjPgaun
 UvPWNfHfr00Y9Upy7lo9PDAQoRILDaRYsYTH2CjYiQLmv3Ir8YWDbw8jeXY8ogRqiKD89j8F3BB
 aSaJGbAFnIo38WW7aoF2QJCi1lL5rjL3TD65GyHkqy4rIfJmAX29rlfbJiVAWbWecA1fWJXBUc+
 LKkVzV7OnMQnFSWpzvCDTQ4MEvnJtAVVauxVq2IPLUSBOwXV2DtZmBziyl+wdrGz/6FdEUwXYJj
 YhnDVrjqZzVEetF/eGWegctYLPfZoCsqja3efmAvy9Tzw28DnBDdnRAkFFOavRiw/+Qb1ge7314
 3cA7uxPjLYL5VM01EBEoD0cKtFN6cenrCEKlSVVUnKjle1Ftw87CswW+AwupcujpxEcpVn8IOMn
 SR1E+t8vyiEQFPMIX1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190151
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
	TAGGED_FROM(0.00)[bounces-98811-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.958];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 553182D1676
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:57:52AM +0000, Alexander Koskovich wrote:
> Add a helper for checking if the DSI hardware version is greater
> than or equal to a given version, for use in a future change.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index db6da99375a1..6fad9a612d4d 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -782,13 +782,20 @@ static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
>  	dsi_write(msm_host, REG_DSI_CTRL, 0);
>  }
>  
> +static bool msm_dsi_host_version_ge(struct msm_dsi_host *msm_host,
> +				    u32 major, u32 minor)
> +{
> +	return msm_host->cfg_hnd->major == major &&
> +	       msm_host->cfg_hnd->minor >= minor;

I r-b'ed it, but there should be ... || msm_host->cfg_hnd->major > major.

> +}
> +
>  bool msm_dsi_host_is_wide_bus_enabled(struct mipi_dsi_host *host)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  
>  	return msm_host->dsc &&
> -		(msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
> -		 msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0);
> +		msm_dsi_host_version_ge(msm_host, MSM_DSI_VER_MAJOR_6G,
> +					MSM_DSI_6G_VER_MINOR_V2_5_0);
>  }
>  
>  static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

