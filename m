Return-Path: <linux-arm-msm+bounces-102838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKWlJhTl2mn26wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:19:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA583E21F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 690E730093A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3735D2877E5;
	Sun, 12 Apr 2026 00:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMvI7ZiN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SO4SilKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F003828466F
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775953167; cv=none; b=a2NmCZrEC0wwjd7PeFNNNlr6Poue67dk6DHYlLEXqomHzDw2EkFUXQG8umd3jjdSO32wBr6esrTXHaREXhO0wfjXviwnvBfg1pCfgiSkn4V/DPJcGuyka9MSc63uOWbQ2n6qeXMmqu4jZLilC3XgqG+9v3kTF4l6FKt3Ag7/XTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775953167; c=relaxed/simple;
	bh=2uyACCa/ISA0dqbTjmqPWsOkASucspuA+T/KH06ekLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRxuBSjDaOFPeWztQ/kpxP86Z6vEBeXKrl4q7WXReRgh6UCKvSw8MH1ZFvXi6q0L74NKboD6/0v+GbCNCb5SzBhwBahjXvXPSboFXN3iYpS32SxSRYf1WbbaQbbfPMKhwedIjiV6+LNVItpxQvgOBizt6l0WjXzg/5NsBdJdUHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMvI7ZiN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SO4SilKg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BLglPO1735200
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HG34mRyRdzGkG6Z2EcYGRJjv
	Yjv6kPKsvntW5JOtB/U=; b=SMvI7ZiNOllJZYbCnG3Ur/rSm1+htlFqhMZqUorX
	P5m+n3lAy9/6HqhvptrmYiZdjSvpxV+Cfng3DISrHpEkUsOMvY8BmNq7FldtnRgv
	dX6TZfVanNTPc7yxCTDnWFLHexVvIBKVBNL28lOatAaNvXgbbMqP/M48uHpe8Ws4
	o2zzaw8gY9xJmppn7yLcQPGk1ih0KWRV6wxdh80zZCb9KngLQbYH3Uuh936Lz8m6
	N2VkLNrNf4505tYM0vt465i6BEX6e+wkHhgfXv5mtfDJrmb/cxazEGeu17XOh5/N
	aL9qNbiWz7ggWa9Y4J+sW3mi7P548ApvYQKxpzlAibPjxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhshax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:19:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8dac6233so62092291cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775953162; x=1776557962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HG34mRyRdzGkG6Z2EcYGRJjvYjv6kPKsvntW5JOtB/U=;
        b=SO4SilKgqckjrLKhcbuYPFMWhbb4cHBj1Wk4JuNqSRpZpjuFuV02EZZ8KMwAFCnwLJ
         XV8p9luH8pdqR1TJ/nYIijKEakVxZPVQ1MFf4C74jxqbtJmql+RRf5khdb4gfJrwq4fw
         ecIre34xA9WpgnpuetLUGjpDyKZ0cFY38UZIdyJn7corXvJJrQ9qrCSpHmglrbR1DZaa
         D9CKwZSYXnL1dlBbl+7tkpYC0Jp+YYuTW4DucAeLca0OqhwQHJ+EfYyWuwP4YYrt0aTC
         4XzqzS+0I8xZpys711po+SDAQPMgMXWjZxRQdZWTOgKHdfefEWAvmpFkIG5pd7Air4lJ
         DwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775953162; x=1776557962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HG34mRyRdzGkG6Z2EcYGRJjvYjv6kPKsvntW5JOtB/U=;
        b=A6q9Q0dNac+QGtyD7hF3P6YICzdD5qyOvqNJSDIZv/1B7KQzOgfot9yTRVdGgtrtJJ
         o/Il2hiSIzdCx0BJDJlrznSBbaSi/v1Rk0NBVtjiwmNhQqfG8po2AbqC/2ppbC00Q/MG
         KxRTo8tpeiK1KnCYp9Mty/JiLViChKeWr9JSrS79cQldsCKoi41i73JnnTapKRxxz0i4
         0enXU5xtGfHCv0Dhgzkm1zTRUumXCBN/W/pLubYx+dXydR1z13RExgtVgpb3fgwE6wpJ
         dBUrPi6yvkM6Vg5/cpfY69Ke0KLUVxWnGn01hoEFmlLzE/9usKKObHgpNwlzKHLSVIU1
         AU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTz4ISFat1Z3876HNop0kODlx/ijrldrgCmiSRi+SNZplNUTtWCCtibzTaodaDVPVLvqT8phO02BKVadr2@vger.kernel.org
X-Gm-Message-State: AOJu0YzrSbDfJGE8qsV7xQYZsVBFd3U5JuybtvEKwEMMfaIlt16Pry66
	W0hY7hvJpLb7vXI3AX5vGMUQ2bLNGWq+l3FbRsklriJ8d0ujU20dwMyjs2Ttt2+1pczD8lfoQtL
	j1wkl356Y5gU7jlp1fbhr7H/oYozeNwg7mt5AJJK8Gp1g3HY1p0TdGlnG2SP8/w4NgNir
X-Gm-Gg: AeBDies8DR78/ySujYFyU25RFDers/Gr3+jWOZU2ji7ARaaPtWQVYQjc86kA5T6o2Jd
	rNZoMu76pcGIRsie7NGQC8FdK4yREgeTQhdKluIyXXwdtAd5844L3TAM0T3+x76FthDl34Ei0UI
	wYSWBMwg2U66ueTP9iIVpP4uKGPTL48PlBW8pK0gtJ+K7+S3Gc58pKCER8rX64yH36jUBmlwypa
	jzOEhcZpIlM4Ry1WRtn1CK5NH+kpwZYH4tMLxMitrnvpznu0hWmQEU2fgSgpkefPR9M7rSgi62N
	WecjWDVBc29XHzpbHbspHSacKOipXpXtIPheuov6XVBysSs7KdahOxZBul8St58l9MIivcp/hxw
	rYDegV6BJOZGHFZnElqOBKqIamHsQN4M/eyA5Yn6F6M+lXRImLpv2+QxuFjTVJzvHY8qhFSIDmH
	88J+pXhmiXRyoSHQy61Xiu66H4KaP9tpig7vw=
X-Received: by 2002:a05:622a:24c:b0:50b:4c64:4730 with SMTP id d75a77b69052e-50dd5abce85mr125292641cf.15.1775953162175;
        Sat, 11 Apr 2026 17:19:22 -0700 (PDT)
X-Received: by 2002:a05:622a:24c:b0:50b:4c64:4730 with SMTP id d75a77b69052e-50dd5abce85mr125292181cf.15.1775953161683;
        Sat, 11 Apr 2026 17:19:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef07a85sm1679336e87.79.2026.04.11.17.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:19:19 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:19:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 31/39] drm/msm/dp: add prepared to manage link-level
 operations
Message-ID: <xwapwx65ra3gwnjd6rcjjreymgrfokovor35zd5mc2tbjmpbor@64x23imgktba>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-31-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-31-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwMCBTYWx0ZWRfX/BsUAcxWw1TG
 S1BW30r7xYZ50HbL9HsG06SnRgjO1UTHnlIr7Ih165uuPezE4smijNWPbNnoxr95UtUjC2YelOb
 nv2RuwaV2EP4AkiKV+fxu5OuDI/NzfiuuuuRNfrqJqYs/bTtUt1PWppf3NmDPnUK3uiYlJAsg4z
 7Yr2nFKLpuza1ZHwRK9YQ55ZGwstZpmlkdUHbP393KhqGk8JIYl7BMTwJKjkblEo2IrDsDy3Ynf
 o6Xm+xLXZXoTskPUO0WdOJ0rZsVP4O8hk8uNrph59R6zst4AG2CqwyN2vhH7kmHT5SHYA/o8NPs
 PIl7Whh/bbvfqAEmUU1UFud4Au7OozoDKHsFV6t0089BiTXY6y0UMN7IT4VoqPWSEq+f8vyfAZw
 rJUQeqRHAc4UpBKezYbgwI/eqgBlp4xWINfBA7iyznsO0VVxVzsdb7pH0D7pmuaTsjfR+ShrjFm
 /H2sP1R5JnoUSgtU+Mw==
X-Proofpoint-ORIG-GUID: LNMC5NtV1pOqotHoYmZguIXKjfkUSlBe
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dae50d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Gm__qMjIzjNoudeQ8KAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LNMC5NtV1pOqotHoYmZguIXKjfkUSlBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120000
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102838-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 8BA583E21F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:06PM +0800, Yongxing Mou wrote:
> In MST mode, multiple streams share the same DP link. Track a prepared
> state so msm_dp_display_prepare() runs only once per link and repeated
> calls are skipped.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++++++++++++++++++++--------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  2 files changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 5f3ef295d710..bda76319c459 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -22,6 +22,7 @@ struct msm_dp {
>  	bool mst_active;
>  	unsigned int connector_type;
>  	bool is_edp;
> +	bool prepared;

link_ready

>  
>  	struct msm_dp_audio *msm_dp_audio;
>  	bool psr_supported;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

