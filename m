Return-Path: <linux-arm-msm+bounces-109579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FgPGGQFFGpSIwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:16:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5D05C78EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB585300E5CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764313E16AC;
	Mon, 25 May 2026 08:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctBjD0x9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dezYvJzk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292C93E1239
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696992; cv=none; b=uGPD4o1jRAiKT6mzV4kkVRgOIqnnDHl+sq0X53B6irFac7JOabkw/eODjKMpryuYvFrML3WXo3sBRxyipynPCCpuVIZ1IHGIeHSWtxomvBYp972X8feFMt5JZn43pyTkAZJfMYiwJzlXKbUNyQ0OKMjo4YQQIuibySL9771rt8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696992; c=relaxed/simple;
	bh=u1H5ZoHH70NN7Nw4m9+q3wdk6mfYfC3wp71/mHtilxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Densv4z7nD9lIfad5jUS+WncMiQfAuE0T3hY02rxWSQ3sn+ienKkL8Li8hsbJAX9PKb81MC4OomShmi17JSMLDw/itwc2QfkE/jx/pP9y9fUw268VwEXo4J6YeV/cJnX8MR75nH+InbF5Bk/+4CA7avsdeHPypmsf5oEe4W0QN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctBjD0x9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dezYvJzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7Qoph3064409
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PzwDc42oSGK3wA8tbXCjeEPz
	RyLZP/AG0iE+6Xq9eIc=; b=ctBjD0x9LC09J09cPaX0KfmqpZxW/9OirY5FgEZI
	SU/Rxw6roTXO11ufnW4IeJwchJ4rzZqjLjmWyZ6mhX5TvGh2k0RK53+vCuz86SzU
	Wg4xXAvaVuS3f66Ey8Twjp2cTp0aRW3MPsxyDScb3fj2nx1TLcMvutXyCBO7uHOu
	yEXQGIHYcTldGzM+9N6TC+UDGV7cwhib9G4SehuKybwffjhgnchXDBbcb0zY6kjL
	5MsxqCKAG384s82RXLvJkXdVrdvbRqKQMJ+M6vt1HgZO93rfcb6A/4LkmWi18DJd
	UCA8qBnu8Ke4C96fK9+QfQFtwHjYK9r8OytfqfnTM0w9Zg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1gg6f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:16:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516ccfa109dso63324151cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779696986; x=1780301786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PzwDc42oSGK3wA8tbXCjeEPzRyLZP/AG0iE+6Xq9eIc=;
        b=dezYvJzk8yLQ9V/aY/ghzqjxLgckHpCUUm7+fMJ33o3+16M5BKTGhB3btuF4mqslLP
         Fr+KWejrkw2XVXgKcF8JnZ6mH/K+InERZCl3Xy8JAuT5ryDP0zyhZVi7goH78LkyerwG
         7YvkT3NLU6YYRDbtCYJGfUGIuHpqsWaF2JcrYdAEt84tSnwLCELe1rFQeiXYUna+luVP
         Ov1Yh8o5efgbATdRE6TrVGpj7oHYpWHlQy2XjkfM/oJ1LqTSh/RuVuylfzvK0gmuTyNj
         xhtmLumCORvv0Ygsf3CNTgz3c+HMvOhFIAWVKsfqfo46CX+UI6VagUCTmgprbCIck7+x
         1zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779696986; x=1780301786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzwDc42oSGK3wA8tbXCjeEPzRyLZP/AG0iE+6Xq9eIc=;
        b=cVjYU1xNpdfdE+xbRQRkfm9HhmJ8SwqDSt8jkhbtl9ft2dcgw2OzYz2VQSlDJyqrgo
         KKgDUszOeDgTaj4nAHgNamKCiqqqbYq5bpnqFFLbNgZ4gGZI0MYKhmmpE7wOp6FydKnh
         36UD5Va9ShTcCKy5B8utc0Hc4rRHGYiTSxfMtt8rl8Fwv2cYJUoaBPE2wfVGXVOy4+1F
         aDHAm42Gu/4Xce+hPtGY8GCqaQ3OPMZWDtqFzacFj432KTS8sdFd19tvNkeZr8ijda4s
         2Dtx4TlBLWXZkOjj/f2LLyUcWxwJXJPPnJ3zqmV2ZZXo4EDDRI/LPCTpF8080vYsjTVT
         Vnwg==
X-Forwarded-Encrypted: i=1; AFNElJ9z8jIVCb1b/A5UL5D4IMGcbm7O/y/f5HO7GGmZf1sPV2FTbmoE5uJ2leLZJA3109i8R6Au0Y4UYB8iNCbt@vger.kernel.org
X-Gm-Message-State: AOJu0YwktqnCpR+qLVUVO1O5sz0BVVQG4sXXATMvrOT75haFBuL64NVY
	bJ2nrhlelLPL1IxA5RYo1j0jDobzFUoIW9NRVfTCIZ+TxBJ5pY1h0Tsbbh0bbmwdozxpFHxjAvt
	+J6ulOe12Bz92wlXW9kLKx8wA+S/zUFBqDgbSRTd3x0PnxLgyjvHabE9lIMT4bSXVRact
X-Gm-Gg: Acq92OG1Wvho0T7pLn3ZKjb0EStk2HqEI6sODZNdx7vFrncw2ldcTfWzmkrXOn6kTtp
	Z0PSfqrEMiYs5dXi05+4Qv8oLUaKtVRowrJ+naEumyWb5Qru9KbjephqPa8q7tb9u0vVClmZDl5
	C07rR6yZ8F5BqtmRMuZIj0ot9eyAWc0QvSttLnFecComW0Uz8AkoZQNCQfBUAPGtfU/dUYeCJmy
	S3DSTHcaxyEFaZFl5rI7Ri1W5W2jPFbo0jYwSQWwr0oNdYMpbH7uL8q9tkB7MxSYCzkO9LtrZMv
	+GquD1zrk8yaXA7fGm0pjC926uzXawFONCJmfVzry1e9eZeJ7qtoyByK7kWRA2M+MX9Wy9i1wX1
	XxGK46YJDM0qgqCA4dzNgxi2OilNQIYKve5+XX0Cmkevd5PGPuXEz2FTHKHDNzrGYHSFa6W72KP
	Tzb9k7rC0DXYCQcAbgQYxe9lATwpef1Q5G1D5RehXIg4xUXg==
X-Received: by 2002:a05:622a:144a:b0:516:e3fc:ed8 with SMTP id d75a77b69052e-516e3fc1314mr105077331cf.46.1779696986376;
        Mon, 25 May 2026 01:16:26 -0700 (PDT)
X-Received: by 2002:a05:622a:144a:b0:516:e3fc:ed8 with SMTP id d75a77b69052e-516e3fc1314mr105077201cf.46.1779696985957;
        Mon, 25 May 2026 01:16:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca5e9f0sm21947981fa.10.2026.05.25.01.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:16:24 -0700 (PDT)
Date: Mon, 25 May 2026 11:16:23 +0300
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
Subject: Re: [PATCH v4 14/39] drm/msm/dp: introduce max_streams for DP
 controller MST support
Message-ID: <35ihusx26kilj57jz4pvb2skjfp7illtdsx6gpso5icwaq5ppy@wuersq2gjjkv>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-14-b20518dea8de@oss.qualcomm.com>
 <s32w4u44y4jhuk4c4qxsytat2pdiskzuvbozklhofpjh54r7pc@2i6vvbaen2ur>
 <0e39dd9f-9858-49cb-a052-7d0791b694af@oss.qualcomm.com>
 <p3jfi2cxevvdtqathqrpnxdkzrwuna3hojovfjvdni7zvjec24@pyvaubeq77qk>
 <33ab5c3f-5a6d-4d81-b310-760ac519bfd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33ab5c3f-5a6d-4d81-b310-760ac519bfd1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fM85tJ7Tt-ZNRYd_CcgoHr2mJF7lp65l
X-Proofpoint-GUID: fM85tJ7Tt-ZNRYd_CcgoHr2mJF7lp65l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4MyBTYWx0ZWRfX+mUv85AE60zc
 XL+1p5XiyKhT3Hq+4JWeql6bVCsrvFX3KX1N74CyacwX0R4NxHTzy6mpnBBJ4i2UWgoNzn28Auk
 KcCglycVS4oda0Vsb3hDfbbI/1nd1+IqOXejJ2zASvQ94PZV8bTJJSrPwozg5SUUxkwusaGT5Iu
 5AQPuxEMFWKHN4n/kcNw2N9oWUCGBahPzPOuLLHvN7dyWyHf2gcvPZLDcab6weIZZHYZ1pLIVRw
 w/8GsupOxga7U4qYVIAtDfAYWLyQln3Vb+8RUfo2ONPQinSNAQIwnGLOPqOmAKav9Tp/0yXlUXx
 8uGDovxiAT/zYKlkOpQlDU9fAVTR7reB2Qu12xko2bUFYmpITRu0MbZBSZugi+IM9bimxnDTMrK
 Y3GzpA08CDzmCUj41pNhCfOIyjvoJu84Cnw+gwdV8H7ET9PtkU1BQtmhrjPpEE6vLBYmLbRT5xa
 qHiBKsC11kOKwSE2/wQ==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a14055b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=COk6AnOGAAAA:8
 a=2bpceZPf395pHnZbQo4A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250083
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109579-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,quicinc.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA5D05C78EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 03:58:06PM +0800, Yongxing Mou wrote:
> 
> 
> On 5/21/2026 8:07 PM, Dmitry Baryshkov wrote:
> > On Thu, May 21, 2026 at 07:34:32PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 4/12/2026 1:59 AM, Dmitry Baryshkov wrote:
> > > > On Fri, Apr 10, 2026 at 05:33:49PM +0800, Yongxing Mou wrote:
> > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > @@ -2740,7 +2741,8 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
> > > > >    	if (rc)
> > > > >    		return rc;
> > > > > -	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
> > > > > +	ctrl->num_pixel_clks = 0;
> > > > > +	for (i = DP_STREAM_0; i < max_stream; i++) {
> > > > 
> > > > Why? I think the code was fine with getting up to DP_STREAM_MAX clocks.
> > > Sure.. will change max_stream -> DP_STREAM_MAX next version.
> > > > In fact, I'd rather use that instead of the hardcoded value for
> > > > determining how many streams can be there. Think of the old DTs which
> > > > didn't have extra stream clocks. We still need to support those.
> > > > 
> > > The current logic only assigns num streams to dp->max_stream when
> > > desc->mst_streams == num_pixel_clks, otherwise set to 1 which mean sst.
> > > I would like to introduce a switch in the driver to control the number of
> > > streams, rather than having it fully determined by the DTs.
> > 
> > Why?
> > 
> 1. In some scenarios, even if the hardware supports up to 4-stream MST, we
> may not want to enable all streams (e.g., LeMans: 2xDSI + 4xMST + 2xMST, but
> it only has a 6-layer mixer).

6 layer mixers, not 6-layer mixer (the latter means the mixer which
supports 6 blending layers).

Even with 6 LMs, there is no reason to prevent users from using the
hardware in the way they want. Any artifical limitations are NAKed.

> 2. Currently, the DTs for all platforms have already been merged, and for
> some legacy platforms, not sure if all platforms MST will work.

You are a part of the display team of the SoC manufacturer. You can test
the platforms and make sure that MST will work. I should be able to help
you with some of those, maybe except the MSM8998 / SDM660 generation.

> If my understanding is incorrect, please feel free to correct me. Thanks.
> > > Do you think it would be acceptable to use:
> > > dp->max_stream = min(num_pixel_clks, desc->mst_streams)?
> > 
> > We know that num_pixel_clks <= desc->mst_streams. Otherwise DT is wrong
> > and should not have been comitted. So, the min(a,b) has a known return
> > value of num_pixel_clks.
> > 
> > > 
> > > > >    		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
> > > > >    		if (i == 0 && IS_ERR(ctrl->pixel_clk[i]))
> > 
> 

-- 
With best wishes
Dmitry

