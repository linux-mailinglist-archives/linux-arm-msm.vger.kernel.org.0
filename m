Return-Path: <linux-arm-msm+bounces-102804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEtOF7eG2mkO3ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:36:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 066FB3E1132
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68B0F300C0E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BEC3BAD82;
	Sat, 11 Apr 2026 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HO6LDDWs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3RxuJK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B33285CA4
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775929012; cv=none; b=lec2VudPzffWewEC7BYCKKUgt/Y3lTA53o2O2lkw8CtMITVC0mmgQivj8eUzfgsOq7LXzce74wyK0DuQZBf9yJwXrI/C1B6hseF7ZvEW+zsRWO6mZNld/Np/rf/sd8z0S+nDVIdSfK84yJBzq0yqQpKUsEY+9ZM2ED2hLjIJbME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775929012; c=relaxed/simple;
	bh=lhKLO5jYpli7gowUkg8Y1dcZApUNmkNheNkXZTyf9Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/yfUb1XWB57xJXtzZU/NMdJUc2GBsMzbq0CQ7rXZlG88OPcTtxBoZghfqo06Z6NOxLhOZibbKh+oeLX5HWXXz8+scg4au3mJkFWEwlJH7LragdlkPoSqxgLfBfz2rK+qhkqOFWZ+LR/Yz8xCbw+Swm/UUyAQCgX0wawARmu3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HO6LDDWs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3RxuJK8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B7uZNg3336122
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=092FG5gBJ7FcCA6OMLl6+2Cg
	GW9zz4afSlLEnZPEulU=; b=HO6LDDWsGdRG6LXFKJcTslKFVd+fWpPz/8ruG7jz
	fAjD896bE60nEb3x2YmyerZTZiX8Yu9Wd3x5QUqL61rb4LyWbbAwKMdyzc5SxGN3
	7tuCxNUv2Yclwa+tRtjj4QsNnKcLnHyNkiHJcxtu+RCvoB3E+W0sc6ECfKlDXL9g
	tkYtco/u9Tkr5DAOB8tjJG3ioNGRocMRcfRxxnyQTdXzE/W5y8UU9Xh7JnHEIY5J
	z/eqFJYiCLHGhAy5J8JeppXN1CUMZiSG4nfyHleQqbbdvmGpVjxGa264EeSwWxD+
	MvJuIEick7D9IXi8DD8t4VVFL8mEptAVpF/3JNDr+Dyjkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbp8t4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:36:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d76f460b2so71977851cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 10:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775929008; x=1776533808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=092FG5gBJ7FcCA6OMLl6+2CgGW9zz4afSlLEnZPEulU=;
        b=W3RxuJK8gNrlsYtQV1yjS5GCGAPrIKd3c8cWnALybg1nYoqj0L9ejyfGCzxDZTZBO4
         rhT9XH2zBfrewdMJNEvihmipiBhUuvUeboutFIAGf03LbNQz4kre7mjfTPqg8nUX4XKf
         6VEjJ+25+jnshAIHJU+WAmfCTiHrnPVRYeulHilpI/kvRgXkLt9hsAjucUKsTYRi7ODW
         sKjx+SrDfPgkq9itqRkZw4eb07ZBVfuqtSUD05iPuFKceZ08vvu744R0w4s7ZyHfyOEh
         ZjcsPc0OyqC+4uyS2D+3/4sZYkkKgdqS4eDUJ0lC3AL+4sc+EvIZfgNP3AQ5IQN1GlB5
         kdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775929008; x=1776533808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=092FG5gBJ7FcCA6OMLl6+2CgGW9zz4afSlLEnZPEulU=;
        b=UWewqh6ySHBg8iGiza7yirbgzIPoWNfADa8yQ6d0BwJcBwp+PHbyo8hzUFk+wFOiaD
         Q+nBlgVVbR2KnjsndrDd0JHHIuMMEqt4iN2Bm/h4KNKH6w/oJ+qx6/GlGSoEhhQZSu8g
         Qe/9+r2J4LZVCsMkOHahbAAPnqsg1hyd2U7fSomxYGuRho6RDFhv7S9/y4Hl8r5q9V6v
         7X03Ty4UrUJtnet4HFfLsGz0Jo40pFjcDorvIljekIkAilH9DDf+z4z2ywNkXz2uTjos
         tkcHyp5ttbCg+U9aCGCvfi51eWI1XXZYXYvUtEaGfmfR2Z1+it9RMEbRopTi/kbslYmg
         ZaWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZVhLYSV5r3+Y3ytZ0CwkwmkWf7xdm+xFOi3jfA0Jqxzl4M1Y80eb8FxN1NihjsH93BDAD1I8vBNrmZTj2@vger.kernel.org
X-Gm-Message-State: AOJu0YxiHQ/RdtBLZ18AnWzQTDniDC/PTeqDsUN3CK5u3BQgzmHkABDN
	aHXaIwbryz4YUCeCpjnZMCTzJxD6casdGqvWQay2t7BstODfAyM8AbxMSXWFoZzTFX6ZU6rGVJp
	8r8K2HvWHQNcCCXptFm7OSY9YRoIxtdrwWYs+9AftaZiCA/lC2qwjb6k5Z/eYKSDdPqkv
X-Gm-Gg: AeBDieuc4iqQzYqZa25vnBNMIFLXt0Yg8/SZnUUeZanhWzgCCLqbNfjCDntNDErlEy1
	G5hXIkXlO6keFCoCRJRJP8m3uIJw/6G2d9Nfeccfa6TPNIdXvjCYkC5vPzxEEJDR5ZNhsa3LxFd
	lPscLgaPtlwFOZSLOOz+h+HcGPdU9zR34p60w7S8QPqPomCe9bH5Jk2t+vSuijmV9VNbcvh7n3F
	gytL4jGHJ6qfQ2DARmbefkzPLKHYugDKxqiuSsSTrFuqDT0RWIeFbLOs7q7VmtBtqJiA811RqyB
	W1z+6xt2hIyCfsBH9uMBhPWGsicYFwKNmRxGaUK9y4gULHC+9F8wP55VFegFgTk9b+occcpVAu6
	znr6d/TKuAm9yCztfPBAnRycISrMdt/zzqOMF0C/bcO8wrhTeA1ehd2OEEP+qnGMPqeO2TPzbZQ
	qw+0veq3xXj6ZSFlaYlZj7jiBgFFpK4XraQmI=
X-Received: by 2002:a05:622a:4d3:b0:50d:a248:68e1 with SMTP id d75a77b69052e-50dd5ca6348mr116165981cf.56.1775929008015;
        Sat, 11 Apr 2026 10:36:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4d3:b0:50d:a248:68e1 with SMTP id d75a77b69052e-50dd5ca6348mr116165581cf.56.1775929007583;
        Sat, 11 Apr 2026 10:36:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefcc2asm1550367e87.70.2026.04.11.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:36:46 -0700 (PDT)
Date: Sat, 11 Apr 2026 20:36:44 +0300
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
Subject: Re: [PATCH v4 07/39] drm/msm/dp: split link setup from source params
Message-ID: <2ecuv2mhrwcut5vc53wbosg4wmjea7gdgugs7ady2ychnrjzuy@6lbbumdgh22j>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-7-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-7-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69da86b0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=U2n3WS0MpVb9lCSYAfQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: h4YPkG9n-giI7CYC0dmZ6QEScIYtPmVp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE1NCBTYWx0ZWRfXw8FxhiF9/yKC
 G3pWNEcKtV+8Uf5vrjxNPdU+wiE4jYdUy8MoSFPZk+IdXgcOPz2rMIfh8SjzIW9xFHitWeu2wrY
 u6w2gpvyY+USi5ckmEuxAlTnm2G3ZN7C6abU4RGFwJJhe1XgXE8DIr54oj0oy2IE5eyNYnJPbhQ
 5DZZdGihRS/CD0GrPRYiZUNOOl2i6KtWHLBI2sncXMvWpEzjTI28pCLF2chioujI14WjajquSzt
 Z++q37jQ17MNLc7PNT8n7iy27mWUtre3HfqVOct44Wy/4zmCsjTMU5KTlUx0qKjKf8S9b13uAve
 zQPyFaSEIEWKrCjjJCLxdoNWCL1/WBqPXewTxQxGbIMdWdNos2eA65sG4D8nYOLhzzz2JiNiOpT
 UbxmuL0/iqM/o+qtODhUcWmirix1vL9Bu/N2OHT6qAhF/lYdflmOErFQj7qYxi4xDwXW4muuSFW
 wfZxvWHAj1xncHJf9hg==
X-Proofpoint-GUID: h4YPkG9n-giI7CYC0dmZ6QEScIYtPmVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110154
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102804-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 066FB3E1132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:42PM +0800, Yongxing Mou wrote:
> msm_dp_ctrl_configure_source_params() should only handle stream-related
> configuration. Move the link setup out of it so MST can program link and
> stream settings separately.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

