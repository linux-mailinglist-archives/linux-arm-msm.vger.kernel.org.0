Return-Path: <linux-arm-msm+bounces-109346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJRTFdRuEGqgXAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:57:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D15B6900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8764730B5AB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B409A421A0A;
	Fri, 22 May 2026 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjj5laBc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTqN9SQy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF81413227
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460716; cv=none; b=rAInJ9Zv4mMAi662u1DxAPZgUjonlB3lgYj/LVtxDP0ZjJ4xTTkbepK9YyxgmckF42NfupHfxZ6TciSv0H21bYTWNb0k9Jc6cLUjzDi5HAD+eSDtFXVyWEgGGUyzn5a2Xh8Fawf0B7oku8+x/FMKV/axv8jZvd04BgrTDK+izqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460716; c=relaxed/simple;
	bh=YvekbRLcZKbWbo0gYpRV5pxnSMLGn1+cnnVQTCuym3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOrxBO7366NfIrx48BUqTIqL0HOfElxGL7cKziXG4y5kDkfZ6IDQBRcP2Iabab65DsWyJOF4S2V5iZNZxF5aJWnYtJifvBuSismhKj/yA+xOaPT4fFh7Ys33vGuRD7O+ygQ3elXjODr+c2dPpImjilWk0v7KDWoiJWjj6fpzDE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjj5laBc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTqN9SQy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA482B3947382
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9OhurB6asiJNpRraM3RP9SYn
	VtMyAnZUk8kyafxuTVI=; b=mjj5laBcx8tVqDQ8knKZYEaIbqdFy9Sra4mm0rsT
	CPlgYV88h/MJoVURU4awms/6It5tSVJC5A4BOGdxt4D7XXLOTwU4WGILC2NUB9hH
	dFP3dVlntQxiP4InzgpAVaexJF95w+n4iSl2x2L0o0vXyOmeNz3msZ7AnQJjgSte
	vrndW7hDIUCK3f/dflSIGPyfxbX/S7Ahm+onD+FZIj0yeAO9qj00XDuVaUsg3cs5
	AFEXYl5pW2XI6Ey4JsSmcr9EiT0YVtqmlX5Bq0Ftoo5lmJJo+3lMF6U4Tjm/NFRE
	gdkvB1jQ7qTkpvljIK1kwJS9Y+MtEnOwY6aZWoYVLJovMw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngxh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:38:34 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cfe3d4c16so13051502241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779460714; x=1780065514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9OhurB6asiJNpRraM3RP9SYnVtMyAnZUk8kyafxuTVI=;
        b=FTqN9SQy3uYc4r5ELWmTa37FgaPJJcm7bEAeBVUi2fujb3RGjtuOH5IqGO02kRg/Bx
         KIAbNOHTlVE7gkF/ZHUT05WVtfTtqqfL6uz+uCms0zhPy5Vq0bhOdbg7XTwsiHYCZ5kp
         JoMc7WVLX0m86wW9qLt3/W72jIfM9/9F6jRVHU+zDnSckL5qeW5sNbiwIc1t/ZCrMi5f
         HB8rJNRuVrXk1Q2aQkynnA8AdGomdRXZ19RhPXRf+sErVB8WB6h/RBvXR1RKf2lxsWYz
         25u8oaMvb/C/PiBOQGWPEDvA9UuyZvFFYLyinwafv1kwLY1EsIDpgcYtzmYNqLhwaiDS
         YTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460714; x=1780065514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OhurB6asiJNpRraM3RP9SYnVtMyAnZUk8kyafxuTVI=;
        b=slv6nWqn/+rG7IC6Xu7oYKK4McRiUSv+z43tV6+IgPby99+2v6aMZjW/duK3ee0mXc
         UNZlkVdklv7mvXcRxRm65eDHa8oTz+wRlJatB83r711YQSh7vTLhsBeXogkgz9gfjDlK
         HgQcZDR+NvZi0gVvdNQgSrNWzAydZK0ow+DFA6qG14EKQmo4ooyWv8rvRUBWphiS50+Y
         sUQVISsZUlaCMu6aicQpwiENjsoRIvbDC5AcyFWVhJyRnb00oZC+85+gO+1UFzWdv4pE
         LccU6PJD2XfL/lVkDgxusnckZFyAVe2ztmePO8H+62lfiZwg0o79ysGM6pRotJdWBGkN
         0fOg==
X-Forwarded-Encrypted: i=1; AFNElJ9+d9wuxqdOiK3hZSz0wOTvJuwwElu4oA2TDTa1n1j0sO9k0Z2AuU0NLXg39RucCbxx8AVLD82CBm2680Wt@vger.kernel.org
X-Gm-Message-State: AOJu0YwUCqGtprR0014y3vaFcnB1+aQF3UNeR1KJsshL1CprhNss7VsA
	U3G8RzRESvijUKGih8yIfL+KPS2tV3zs0MGQpUZTO92fAtKbJqA1Bgjae84XhzTwFztJpdrXEiW
	F4sixcooDLQmQx0VR30+E6sFcei3yoLYEN7l48jQxoW/uc8qDb2N4yVIRvzHe3L/XjhQa
X-Gm-Gg: Acq92OGpIcs25QbPrJMqYOdRiPWOIHfXvyPeTIQ8UKQFWxsv3U3SM526o8U+hnsRfWe
	3e29batquit4FQIyMx4bLKcOfAVeyqIVOjAPBVecHym7JVoXeSr5VeCzF5mRx9GhQZUtQACmzIF
	KO5cLyuw3VUVqSlqz18DZIAg1AvrJRnj+0dSJMS86uqa4w1cf6+A6yZAfyTMT4FnhNH5+r8tWg4
	blVY1EEw1vamYSFnQHR9fy4VJ/Yu0m81u7z2NjO1NonGKX7VcJz//C+x4hQxOHKNd28b1EimIZR
	N1MkSvAO32XASlgm11NF5LJilcFWffL58mAlQ1MGKMXDP8FW+bldi+D9I34+bFeIb5vzpwwnllm
	tzXoXji69JWBCFXO40sKjOvgDVogj377K33uuq746BQlzSbV5zXOCCnZRBodqyQ7rVd5mIcuY10
	elvnZgL8CxncIYVmiEev6GmYI14IEucqANnwA=
X-Received: by 2002:a05:6102:390f:b0:62f:31d9:7bf with SMTP id ada2fe7eead31-67c898c2df7mr1789515137.17.1779460713817;
        Fri, 22 May 2026 07:38:33 -0700 (PDT)
X-Received: by 2002:a05:6102:390f:b0:62f:31d9:7bf with SMTP id ada2fe7eead31-67c898c2df7mr1789494137.17.1779460713399;
        Fri, 22 May 2026 07:38:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc45f38sm3538921fa.42.2026.05.22.07.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:38:32 -0700 (PDT)
Date: Fri, 22 May 2026 17:38:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/10] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
Message-ID: <q3wtsw3djk47izq7za5p425wuxoykfsejpm5hs72jtbytnrgpn@in2o4iza7svk>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-3-0c8450737d64@oss.qualcomm.com>
 <c67ee441-83d7-4b66-ab19-c2c282c1b354@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c67ee441-83d7-4b66-ab19-c2c282c1b354@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a106a6a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=oLIU8-4u4Al-hQoLB0UA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: chrYXOaCkvaGPy6C6pBgS4VguwbZSsmj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0NSBTYWx0ZWRfX6qaYpd7H/cpF
 5N8D77D9eq05mFsKUst49EadtgQ45ncqmryBt7YYoohp95LkyxvqdSv4jY/AY7HrIA2YJgYVZR5
 A3khymryBt1dqCSuY2NEbaWb3HiNrUXGgEKis/q9t2j8epUbEdJlGtTxhmX1y/DJ5BvPPmK70H3
 lSrtxvgK6k+uwHwG054x5oGFuvGsB0qAl1i0BhYAQkBlkrVgLhCKMH7jrKGh6lS6W6riZ3zTQbg
 B8AP5sO5zQZmkVN5nMNWn4lVeCdelyRFecdUu7iFRp2Q21Ktn6EumVeqqm0Bj2M+nCi5ch2CRt9
 j54WAx58XOhPCjjCA12L/G/dQn4U4mABKfoQccPj12iF38mpxVmPMzv+ILYmIWWM1cXfeYXhOf6
 I6UKU6TQY98lpf707j0B6gX2Hn4vwXzMfC0t4R/jIkZK6HZSQ5+M/wFBi6jQZR6mctsMzTSKDII
 16OBP/mIvd3hFUzsxOg==
X-Proofpoint-ORIG-GUID: chrYXOaCkvaGPy6C6pBgS4VguwbZSsmj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220145
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109346-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: B65D15B6900
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:30:54PM +0200, Konrad Dybcio wrote:
> On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jesszhan0024@gmail.com>
> > 
> > Instead of relying on the link_ready flag to specify if DP is connected,
> > read the DPCD bits and get the sink count to accurately detect if DP is
> > connected.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> There's still some trailing style/documentation feedback here from v3

I'll correct most of the feedback from both you and Bjorn. I'll leave pm
calls as is, without using ACQUIRE macros. I will think about using them
for the whole driver rather than just a single function.

> 
> Konrad

-- 
With best wishes
Dmitry

