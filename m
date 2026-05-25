Return-Path: <linux-arm-msm+bounces-109583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JZxMs0HFGrGJAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:26:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 480D15C7BB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4BCD301938E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B0078F26;
	Mon, 25 May 2026 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjYCOS8+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PY5lnjBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A093E16B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697588; cv=none; b=uwpnT1XO87ItnN33pqNlcRE+RZp7hhuwfE7mFWuRI63XsF9TByCLL2i0I5Z+jnG4IrlMEaeozkIxI6cKh6nFtwLSrOHS6YC7o4TgTrmzR2ZL/wd0sHRGCR+TLrNE2qfK5UBvaT5pvLPpd0kY2Bd82XL08IFwFztQMCO9JYzuwMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697588; c=relaxed/simple;
	bh=xauWUNsT7as7z5T8n0zFAHR7jZ+/NGINK9ziCfU0KYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMl6e5XYIi6N/FlhZFyVNAxvLuiotFL6NbrMNzZwOo01CSIpsXtO5NyRoz/ekHHdqg76jtVZelRDThRt9ECOjC3fI1BxON0LZH1hENOH6/IGV0PjwVieOxm9mkURiAm6a3yRKRV9oN1kmrlQ1WVo+ekc1Uvum0Zqv0rM7tNf7Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjYCOS8+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PY5lnjBW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P5D3c2121317
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7rBXA3gJaShhZVzoaIiw/kiN
	lXbUmYwN5ampbliG8NQ=; b=DjYCOS8+soCUdDdDWw3eLkhGaXtO5FeKmyDYv4yX
	kh+1z3f6ZAXnsSCmq7RDVVw2Xxoey+hqdhaL3/hV4uQbTkhlzRalj/9ikZsm1sCb
	jT5I/jWyC5Nh2AKTI75RsHTcErc8XgCvD+33cjDP4DlqDPJjEECAKJ6K7byTQ15U
	A5fmFDSPViiJagRsruG9SdDOxNof9aOB59OWQXumxBxBhsa3+949/U2Ktg6tIgmU
	dOK6tVeSHuIAysH9TkFPb5vk3dkP+fHATrYRc1uew7P3Gy65rzP+bvbc2u6bM2Bk
	0H8nqz1qcPG0hZ8piJW8LG8o9FbGgdkwVY8j5swNpuEoBQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmp5et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:26:24 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57536338b89so6592841e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779697584; x=1780302384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7rBXA3gJaShhZVzoaIiw/kiNlXbUmYwN5ampbliG8NQ=;
        b=PY5lnjBWzRH1jKqAhBYLRZ0rCzZDvZdEHZuINIL/FoveB8eGwH9RrGhS7gksrt+hqK
         DvtjElMu8ZBxHKHuZ4b7lR3Yo4fUjD/yuS7D+oHYEzb+Pno9iV0vSypGKUwYXMP6TNe5
         bFj9EqAcG0537fMI9gFc0V2vY61+Tea1j9a2ap9EqfHnV1lMmSvfyvJIqUhsTmqZtrhD
         ClZ2P692hudK9ud12CTrtenkJLy0/tQSQUiny5aehyOo3kplHwgtEV4PpoAzfK7vwb7w
         aYpYBnkku7t74wIKXYDQhTLT7nUTgNPrNKxd6SkySpNRQFZIqEewKvak6/XbRB7tXKMP
         Hvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779697584; x=1780302384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rBXA3gJaShhZVzoaIiw/kiNlXbUmYwN5ampbliG8NQ=;
        b=T8b13hYT1tpYAPQMwN1OXT/rfUU6fPyqrSZe7GRR0Hn1emL14LOvoxBIqYI+1V4UDW
         kApu/dccnzD2LzA8FJFsJBPLI3EJeQ6EYCAce4g9AxdJL6bEcf06Bs1udZKVSv2IJuDg
         MXalVR+M8W3zq6i3iyFSnJkCjBf8zffEpPNsuE08nTCfBu0P0xRqTGMgEl5RBL5CVk8f
         WcEABXGka98iVEPm2o1uI/714hRFi14JqSQtrAEF2RTu//M73RnL7EkYyuC6qewOcFoY
         rXaGRH0AuR/C+16a6TInIZIVhHEf9r6gTKtZT7koR3nKt9egMZU67dhSd0IyYglbgBN3
         YmHw==
X-Forwarded-Encrypted: i=1; AFNElJ9N+7BYywJMmoRC4k/ws9r5hdH0ExAqC3P9qHHUM0/8kOiXk9QMMYQIZYVhYRnH/FfDNnmdMOcqm6coNcog@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwu7AB8k0G2kZ3Jk/fpqgA7runyFusm3/s/FkfBni916L1tynq
	lTwcgjoWIitKwAuWWXpPry+Kprs5WfPqEBWvILQPhnuL49su9U8VavCex1k+NXq4o4sRXbfAeJc
	Hq8Ck1d3yzrw4zsdxR+lLOXt2KuZR0QsaBXcqawMQdFWTyBcOKS/byVlZ8sAQFY2JDYYR
X-Gm-Gg: Acq92OH2gV7sFbkZvbyMvtFEhYYMM6JjggrXqLrj8UviPKptOokA/9tK74iDb1lwC3p
	BTm7oue1WMajgeSGQ51ZnZmhdCkEZoLBP/hLU1YcNpp6J7QEct4rAD2Wba1f1mmeY0Gmu7FYafo
	9CEmnQnIauCyy2b0eqrdp+BWb15Iu5ZB96VzIMYNo6isuwfQbK0QElfk0e7MzRjtGjzSRsKRPoC
	V1WPFvIJb+qF+coPYSKdvKSdsXCQWrydjcZ4ykJi1AQOM6uQ/PqbSJTAY17ABll35HNrItT+jTg
	RjCgp2KuF7W/c/GORGJV6v5btA82D8KUk06boeTxvG9/fS0KxmH+qDH7d43pJDGmsJYKkRVGUsZ
	HQqoqSyOycv/XIVwav5A5Y9LzMPr7dDQ4YGX8rrneIuZt09aFGnNJh6lUIKBGb74ZbBj9zRJYN2
	+g7GqMCN85k/jqhbDU8L1tOVidY4kXRJKbV8U=
X-Received: by 2002:a05:6102:3fa4:b0:607:4fe2:a644 with SMTP id ada2fe7eead31-67c7dc589f6mr5897457137.6.1779697584205;
        Mon, 25 May 2026 01:26:24 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa4:b0:607:4fe2:a644 with SMTP id ada2fe7eead31-67c7dc589f6mr5897450137.6.1779697583774;
        Mon, 25 May 2026 01:26:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32ceb258sm2511471e87.48.2026.05.25.01.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:26:22 -0700 (PDT)
Date: Mon, 25 May 2026 11:26:20 +0300
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
Subject: Re: [PATCH v4 00/39] drm/msm/dp: Add MST support for MSM chipsets
Message-ID: <mfskwrfyiaq3zzro4tv2vr6rauzovrzy6qxai4ydjkwoo5lu57@2z25w7xwqbxl>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <bmkdeyquoyvcwcgucijcxmgnip32fs4gyqe6gvponokwiu55cf@7ncsbggx23ar>
 <c5934946-d2d7-4bb3-86e7-9de11db5e85d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5934946-d2d7-4bb3-86e7-9de11db5e85d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4NCBTYWx0ZWRfX2294Y4R4kh2E
 KKIzHKCdsll5FAJsvFOOGKa3ECmllkwRyeShDArb5eIB8yclt+Kt+aCxkYQw24Jy4WhApbuLvDj
 JETPjIYxSlVwEVy+qh5+pmVVZ2Z7qY62+3GNOiYsioIk93WFLOwK3ctqxamfJ5OqOaUuwfgsl3b
 /Prd5eFBpHcX29n10WbTVLwK/9wPbuwd0N4d2gR1+msUPnpRX+omQqhUa7ZOXOGGzDxFlC4sQU3
 x4bUcGl4ghiJ+OYKZRel0fQsGs5KMsZz9z50qji9+p3xNQSDG7Nz6+dJqqqD/XOW/L+NaGwXdwL
 doHB1Lz1ob1VvQnTf/eHBAleSC13gs6ZfJwBK05QJgZtfEffeQHDp8NNngcl29Gq1ohM6p6xd+V
 Uk662/SAiGbLcZTVd/IADGWsDWYwaOPYmxRR4uDMXH5haHJTmMP9yrMSa11w+Im25uv3kTMHBkg
 GqvaZRcv0GkXQ/i+Gvg==
X-Proofpoint-ORIG-GUID: Ijh65W1X5ToyGIxfqtG8H5se44i2QW97
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a1407b0 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=2xXovNFYb3zsjleF0pEA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Ijh65W1X5ToyGIxfqtG8H5se44i2QW97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250084
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109583-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 480D15C7BB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 04:07:52PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/12/2026 8:34 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:33:35PM +0800, Yongxing Mou wrote:
> > > Add support for Multi-stream transport for MSM chipsets that allow
> > > a single instance of DP controller to send multiple streams.
> > > 
> > > This series has been validated on sa8775p ride platform using multiple
> > > MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> > > 
> > > With 4x4K monitors, due to lack of layer mixers that combination will not
> > > work but this can be supported as well after some rework on the DPU side.
> > > 
> > > In addition, SST was re-validated with all these changes to ensure there
> > > were no regressions.
> > > 
> > > This patch series was made on top of:
> > > 
> > > [1] : https://patchwork.freedesktop.org/series/151522/ (v5 to fix up HPD)
> > > 
> > > Overall, the patch series has been organized in the following way:
> > > 
> > > 1) First set are a couple of fixes made while debugging MST but applicable
> > > to SST as well so go ahead of everything else
> > > 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> > > of the work as current DP driver design had to be adjusted to make this happen.
> > > 3) Finally, new files to handle MST related operations
> > 
> > General suggestion. Please reorg the series into the more logical
> > chunks. If you are touching enable / disable path, then continue doing
> > that until its done (more or less). I'd really like to be able to merge
> > at least a part of the series in the next cycle, but there needs to be a
> > logical "halfway done" moment. Let's define it at the "all paths are
> > refactored, all booleans are in place, we are ready to get MST parts".
> > 
> > I've not found a use for separate bridges in the MST path. Please split
> > the functionality between the MST connector and, maybe, another private
> > object for generic state (like connector -> encoder mapping). Other
> > drivers don't have this issue because they have fixed CRTC -> encoder
> > mapping. MSM doesn't so we need a separate way to store that. It's sad
> > that we can't subclass MST topology manager (or its state). Maybe it
> > would be worth changing that and letting our topology manager handle the
> > assignment in it.
> > 
> > Also, I found a set of warnings while trying to build the code. Please
> > make sure that there are no warnings.
> > 
> Got it, thanks...
> Does this mean I can send a subset first (rebase on latest linux-next and ),
> for example the first twelve patches? They are mainly clean-up changes and
> do not touch the MST part yet.

Yes. Keep the version numbers increasing and document in the cover letter
that it's a spin-off of the MST series.

> > > Note:
> > > Validation for this series has so far been done on the latest linux-next
> > > on LeMans, covering both FB console and Weston.
> > 
> > It wasn't. I couldn't apply it to the latest linux-next. There were
> > fuzz-based rejections because of one of the patches merged some time
> > ago.
> > 
> Will rebase it.>>
> > > Broader validation, including additional Type-C DP use cases, is still
> > > in progress and may lead to some follow-up adjustments in the next
> > > revision. I wanted to post the current version first to collect early
> > > feedback on the overall approach.
> > 
> > It's nice, but please keep in mind that majority of users use Type-C
> > rather than native DP connectors. In some cases your lack of Type-C
> > testing affects the design (e.g. for the HPD handling).
> > 
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > 
> 

-- 
With best wishes
Dmitry

