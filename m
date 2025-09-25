Return-Path: <linux-arm-msm+bounces-74900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E6AB9D47A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 05:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D196E1890E6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 03:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AA02E092E;
	Thu, 25 Sep 2025 03:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvxnQNSC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E41DE4E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758769746; cv=none; b=u+UHHdzr38dVFL6JjcqKAVEoEnqifbhz4c6F0XBSQFKbleR4FWe7s2c7pdI/fPrnWUdkDNyN3idZxuYC1wlaj7Bo0qrVl9bKZrjfJH+Fd4YtgWSDVUPruaFKirS0i62G616PIgSjKxnXMx1DrgwJ6W3xZe55qY8YmhZf3I2RkOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758769746; c=relaxed/simple;
	bh=Wpq1EF2/MC+MMyWi+/4FoTAIE4BeeN2Q8DcmVhhEVIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T15jcB+1tIRbWDzEvT9d9HWXIK3GlqqpYP96pO5Q70e3Ue8vhoq5TA4jcou2AD9RQn4SZ6oxqzZehY1OJdQpNfOXOjOcr6WAdZC/xJryp/O4ZJ8BVQek5f28MuWmnx/1gkkdsuePiMsXRx7W8N7mkiqn9Zh/qQT0AUUtd2JD8wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BvxnQNSC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0goXF018382
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xxZapyWudFtqXj3PRC44LC7g
	+rW5KB33WelvpZxqWZU=; b=BvxnQNSCJHvelW6XJwzbJMIEuw/uq/zNAVy6+FXQ
	+Bnoj2jWL+UWhgExZvPYyV5bhfxAJoT7zDKW0vgTKZwOx6LjcAkv0L9XFZl5itZP
	EzkInAzyoAZUCUm/Hsi3l4MCV6ptqlnvqaIATCnwzXBTDjsg8JR7gqZJNaWpvOY1
	hsw21tJg+w06fJayEAJDPj7sHRoItxnKF39SFDUrzLdYknwXORUPusYQquUWY+mX
	Qb0r5qxHC7U6AuxfBVxzhFNuONyYRswwQovBgejzIFSRbJ3lycCbyN1hAvOaZ69U
	44yNuvmBJ4qOhPjsCxmp5KrBpIvG/qSnUBCdHyC+/oR+1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkagxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:09:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4cce66e91e3so16439981cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 20:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758769743; x=1759374543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxZapyWudFtqXj3PRC44LC7g+rW5KB33WelvpZxqWZU=;
        b=A3Fq+oKLqAqHNbJp2YUF7N/wp7fDnI67DYFR84pc6JEjjqxwxHf4UedsCUEHYumsmB
         6TEvkoE21IV0s8JKFTtkGsvJQWlWFCTgdzuIewz3qf/L5+gatExBKcH39FfLLURRUPuB
         UvGZUYZPxcTKW4KPm2EUjw0zGRsBEzxcwPrrZ7YgtzZjd0zd+wUVoq24qvFVYySuTv0I
         SJWv07ThiUraHsI6DmKJIWkkxxxjuLMlsMDHmlOrVzFAcC3hV8nuBsA15LtUwkQTwQsy
         Q8ZKfBoUpFYM8K8bcwzBYVdcd0BPUhHCdxYk6aZ1HIZB86BvCmSVExcKxoe1PGola513
         p4rA==
X-Forwarded-Encrypted: i=1; AJvYcCXfqoEU87fpt9OLKyZ7XofkiFu6M49GNZh4iMPEitNsCLH6tu7S59REgKMotzPsx/UWWZfm3Fm9nyHn/8ab@vger.kernel.org
X-Gm-Message-State: AOJu0Yyplza5rvEgKa94R3mnkY9+Fj3JhijFICj3pFAdnY6tjQ7LZFrm
	LymodTqeebeUyDxJ4bMf+h3WG+edqvmbjq2MHBX/QIy5ogkc6K59l9UzltDr9kbct6hSkOmssMR
	D22rDiJX5h4JXdRRtppLSQ8GOh9OE7kxYIE7X+71CJ23gJezN03iZRSIfxYai+KTsw0N6
X-Gm-Gg: ASbGncv40eWw4YlYO9afmKYI/BzhRGb7gq9EkWfaZGrrk6B6vB5/KnDfRJGVU1gt1WS
	D8ZHGR2wjrOjcjFSzvaVH35LflPvyDhY+miX8DnC/59A3X6EpIbWspuyntBwU5IFSpn0aYgEyh/
	gGUwQUIrHkqMvmiMrqLcl+NW+8iIf02deC0daJE1IWaoLceTDMmH0rTURA4NvOeKhekSAkudvm3
	y2zmxqEos/7jZGrWY6KCXiG3hYZVh3Rw718uRbXPaIkVUsWKY5GQKBdhD5ee+dn9MNMj57qu2dO
	iOfIjZ1hYE9RltANJiL63LzLj6zBNhGaf17ga3GnIbySLMg6WgUOJTgZx9iauAycRVT0IrvD8LN
	hKrBqMxhD/mWpBr0dAJKi0lA1cNfKZFK0xk1QQcQgesC6NPPodZvF
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id d75a77b69052e-4da4bbe54e6mr28268731cf.54.1758769743187;
        Wed, 24 Sep 2025 20:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjD6roAMh62lhIixQNgSFreoILQwURlIwfNhtYVCV+e3dpo7i11o2BA0fnbYsIB373kLxg8w==
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id d75a77b69052e-4da4bbe54e6mr28268491cf.54.1758769742726;
        Wed, 24 Sep 2025 20:09:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313431271sm281762e87.20.2025.09.24.20.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 20:09:00 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:08:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: airlied@gmail.com, broonie@kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lumag@kernel.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, quic_abhinavk@quicinc.com, simona@ffwll.ch,
        sophon@radxa.com, tzimmermann@suse.de
Subject: Re: [PATCH] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <5au5p32oyouifgmqlnl7unm6n7tbxq45wpwpqx57xoepiucmxw@tjqlbh2a57yk>
References: <6mq5morx4kuwmxa3dhpxf42uqedtveectlbeodl5oj74rqk4gy@oweda3unauqj>
 <20250925025714.20121-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925025714.20121-1-liujianfeng1994@gmail.com>
X-Proofpoint-GUID: INNDvawpW6BSWi9Kcnn8TAS_UzaSgRNb
X-Proofpoint-ORIG-GUID: INNDvawpW6BSWi9Kcnn8TAS_UzaSgRNb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX7MVQOXBOXA8k
 PF9IgPqu14d/0FNqhyGJ7+tKJm48eQ1OKXX/9xluRFAWl5Ov66bnWz2thQ5xELryjsa/MNnLRUB
 JN80S4rbxt4WmsMVdrjgTJygJHEiH/a0acUHpQPPsOZtVawmVwiiGGYFZPRFykXksfz5G1IfEMF
 paTNaQNUNBlPa5wFd4CIwKm+nPe0XPPCt6UorSIGII8R5mwFDRDB6AUM8yetC8P4+BiREZdVs7I
 ztco7896kfQfDDLPcfyjiLmT6bRgX63NcgwAIZWmtNdRCXi45QEEhCMxRMMOGFPdVFamWt/kTQ/
 dfX820oMlutNtaQ/Ix1s5FX8BqUs2szIKEQvcF0O94Wp7xPKzZVRlTCHnw6AIj2945k6tz/Rlt1
 idmLmxNX
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d4b250 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=5y6PCNOKMUJiDNq-dWAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On Thu, Sep 25, 2025 at 10:57:14AM +0800, Jianfeng Liu wrote:
> Hi,
> 
> On 2025-09-25  2:18 UTC, Dmitry Baryshkov wrote:
> >When does q6apm_lpass_dai_prepare() happen?
> 
> q6apm_lpass_dai_prepare() happens both before and after hw_params/prepare
> of hdmi-codec:
> 
> [   14.055198] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.067225] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.089925] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.105988] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> [   14.106027] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.122707] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started

From this log I don't see, why the function would fail in the way you've
described. Could you please post (for comparison) a trace log without
your patch?

> [   14.132017] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.197843] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   14.633992] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a660_gmu.bin from new location
> [   14.635452] [drm] Loaded GMU firmware v3.1.10
> [   15.929293] rfkill: input handler disabled
> [   19.406507] qcom-soundwire 3210000.soundwire: qcom_swrm_irq_handler: SWR Port collision detected
> [   19.415672] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   19.465864] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   19.581446] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   19.693965] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> [   19.694012] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   19.706621] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_prepare() started
> [   19.722543] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> [   19.775071] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> 
> Best regards,
> Jianfeng

-- 
With best wishes
Dmitry

