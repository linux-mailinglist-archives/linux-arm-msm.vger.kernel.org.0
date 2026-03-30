Return-Path: <linux-arm-msm+bounces-100756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DEcJjtTymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:40:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 122963598B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FE373022F7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EAD3BA24F;
	Mon, 30 Mar 2026 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/7ivxdi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QugNsTto"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746463BC667
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866943; cv=none; b=MWPtQkljXPwt3SqnzfxYlVK5QA1ftw+q8usIQWy9NaQKgXY7fR6hzvpHSxR9tsIK1osEUx1BugURp4JzJg9T4xWHvDusIvDIZhI5+Q50spSeDMT7qrsY419tfit59W4t78+ZUc8quQGw04IQzx7Woi36mNgYZWXayHPtlvqM5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866943; c=relaxed/simple;
	bh=mqyUDfmYkXWZx0A7dP2ISFTgu3ct4v5ISm5y4UdI/wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmddbC3qr1g22Zml5gs6plKbGUuGUjKxUgvHNe/ShARNnvLXo0z1SPYezGug91tBdYLf3junuuCCVDwFmOsNa0t+/KInAuhnRm4Rw1cA2yzgAiHZBrs414ClELiniQN1+cI8RorPA7+xOAkMJ+zyPK5lfJUjkT6926MkdP1MQ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/7ivxdi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QugNsTto; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA2bLS2194795
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LF5RL0x0hzV9Gp5KGKo//rmB
	+Sfg+4q53JxDb2IIUYo=; b=O/7ivxdi/0oZotB2CO40NR7Xpp8mJVl4EstodScX
	4d8KobJBJdMfX33NUObS0l6oXslWY1eCTTsZYFHgT5ps2WGp6NR16JxpVoEqeGOG
	wi/WBxE5V0SXKmXXcDjZvpImjPPlYWPIslOMsTVpofwbzyq9AEld1KEf1Nm844NB
	gGE4wd4JhomCogBpn7JhHQ9E5A3WqAh1X2gXqL5ZSMfk41B5o8yDT56pX8UWEEUI
	febNNgylw025+vJkY86fZIc86/JwTLiKuqfgjvEFJ0JPDGG5NkCVJpnEvWXmf5bk
	qysKmJnf24VLGDPT062VCZFbupBIeXckehENJZqnKbJMdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3pe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:35:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509219f94b0so6428941cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774866938; x=1775471738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LF5RL0x0hzV9Gp5KGKo//rmB+Sfg+4q53JxDb2IIUYo=;
        b=QugNsTto3uOrE3lMeLbEcDjACyB40i94jcqgDtOEblsW2n8/7VFyNg9ghex64Fvwjh
         kY8uQ2yhHcP6/xses5T9qtloc84wfa8H4eXUwS/lQ+iYrsVI+uZ+XL717Edno0suMVex
         kOTbRJuLDZ4HTk7K507PLhNtNSDJkhWGZQ/SYrAH3OGOYWsjTHmcdLIpugzFs2I2PHo1
         kkji+XJXmMkJ3ucjD+gqQ5FaH6D0gvuFw3pMRloCLZNq9IYXIJ7wO18m3o7BUZYUC+7U
         n+MpkFDf1/+y+/z9UX6DSNnbddtaG0YN0FhaVm8naipBJgUPMXvi2FdxOAB2RQYT3iTv
         mdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866938; x=1775471738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LF5RL0x0hzV9Gp5KGKo//rmB+Sfg+4q53JxDb2IIUYo=;
        b=BsvT2tiwwUpU1SybOajYAACeE7TY48zyJAQAga+wCVZk5yOQAJMWSkYJiOav8p/5Pj
         dOyVTQPuE+6yC2kO5ehXlcTioD/7I3YPfEgizqtnoVsFUWd7PtjK8aObSxHgd/FL+Z7Z
         oS88wLYttVcMn/WIAD5jUUcW/3g9wL4RScesurrGLBWkj3AFqf5vO/cdh8gCWrJu1OGX
         TbpCOS2lU1KTuMQYyQiRqHlre+6HDz5VMNG2qet7pPlLcM9SQjqGt5UKI4oX6mAbKuOg
         wokMBC5dQArrEQlEbUwTtd1zjjk+eG8z4lnuipw6jcX1YuHYMh4RahDLVlpKK6iQBd++
         E3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUyK4Qm85EATRpbCKXaJY7tdGjq5MXl1me/qnbdaVGvU3XdeBFMxFB7L4EJ2ITEes6LZfOt3V8cqdHMfzqq@vger.kernel.org
X-Gm-Message-State: AOJu0YxNgQo1nIE5/5xb45j61EclaG6aJQrM7taD9RHXpwu7MBJ5xEXO
	XF/66X7fsB2LCS4+3v40IfxnAQau9MdcT2cDCVBjjCosAXzJR46nzjRgFmdsmgmSX2WdYnXWbUr
	wLvwUO2e2UkpEoRx4qDa/kZx1QUzNsPiAMO5DLskNtzjycUfoeBCATjKynY74xN1fT4AQ
X-Gm-Gg: ATEYQzw5NuH3atZ4DtRLlc7MzoZDbfwh2eGq0Y+oOLSbvQIJ7s9IJ2m19Vtoe2hxkFf
	PXvBYqEuDKsLWEjpClaM7F57Q+yP8cjMiJUDd7QpP4ZstCDDYuzYhZUf7MyCnEurAVoyfNVPe65
	YArzp66QhBOBPFpjWAGzil/gWa9Y+BDznn4fDygNFzB6oKsDEYsQTWNSUlZzu/+NyHjdBjAJMTn
	F8tlukd0tK+TL/iDlbJJUnSTkMU0ayncQWqZWeJEw4Fa/49VTwZ5HUJ8ceUD0ep/elyQjJ0Oio2
	5sYco5H1Q8m15dWqP6+cALnb/FtQuazgqP+qnN7kPfkJr2+Q+QY0QDcnqH1atofY4Tn8nQrNviF
	jsrGMAZcgtpF7AHlZmTZkB2Ld7y+dxadSRkj8gdZrn6RX4Rku4H9cDBAxvIEtUEvcEh8L7ywPi5
	JzQhCFYfFlM6hS/0xbiIpmdLKZJtwhdObuolw=
X-Received: by 2002:a05:622a:581a:b0:50b:29f0:299c with SMTP id d75a77b69052e-50ba393eaa2mr175866231cf.60.1774866938459;
        Mon, 30 Mar 2026 03:35:38 -0700 (PDT)
X-Received: by 2002:a05:622a:581a:b0:50b:29f0:299c with SMTP id d75a77b69052e-50ba393eaa2mr175865891cf.60.1774866937927;
        Mon, 30 Mar 2026 03:35:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837349dfsm14156801fa.17.2026.03.30.03.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:35:36 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:35:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
Message-ID: <ex5zvncmnt5pmb5j2utolgbw3yewj4x4e6nu7sdrgzm7ubasmi@2jdubbxuckwd>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
 <ltlmp5ytl2f7no7aqq7sl54pwd4f53fuema23xnuwu5uthhbg3@7wamwvv22nle>
 <c71ea478-ed93-4f10-aba2-023180c2ed42@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c71ea478-ed93-4f10-aba2-023180c2ed42@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MyBTYWx0ZWRfX5ccGwCxPHsRk
 +xhhYnu5dcpG2h56kG2sbsyACAIMR6VEjMgy1Ut/JZzHS22xJOx9BXBpLoR6M3CiNaF1nn1xQdT
 rr26CuQVStQfcccrNgawB+evXJ9UZjUNzB4Txnk1BITRxV29jmwutTodzSTJUnh1cRVN5PJ+vQQ
 go2bRB+YI9anZ1PDNzaSkfgs8dZD2ytQJo+yhoPWQ1IUfFYAeyYdajgd+ACCskGDqyF2T1mm9r1
 CVwj2vgQv/5vax00SzQqer1mD2JPyrLEWGkrtt8L5hgIODHztidVv9O7YjWobCPqxignU/x1x6k
 dgu2LuvifhRLHjxd/H4aksHvNFoG0zNwdSp2YSYu3OXJZKHCzsxxQNe4A5PpnfXRQf6IKuP+y7/
 gRnup2XHBYL/Ht3v89PAcW554iu2wiBI2a2UA3PGxxS1F3ZFoIERYgRsrq+jTIacnDQMxpk5aZB
 joJESumZtFJji5jzt2A==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca51fb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3x_SqFvT9Ql7C9IDPiAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: k0n_ZendgnZ9EIu7P7tdomAfAikdrrVR
X-Proofpoint-ORIG-GUID: k0n_ZendgnZ9EIu7P7tdomAfAikdrrVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300083
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100756-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 122963598B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 05:57:13PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 1:42 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:15:58PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Introduce the `mst_streams` field in each DP controller descriptor to
> > > specify the number of supported MST streams. Most platforms support 2 or
> > > 4 MST streams, while platforms without MST support default to a single
> > > stream (`DEFAULT_STREAM_COUNT = 1`).
> > > 
> > > This change also accounts for platforms with asymmetric stream support,
> > > e.g., DP0 supporting 4 streams and DP1 supporting 2.
> > 
> > How?
> > 
> Each DP controller have it own msm_dp_desc ...

Why do you need to mention it?

> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 21 +++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > >   2 files changed, 22 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 78d932bceb581ee54116926506b1025bd159108f..a8477a0a180137f15cbb1401c3964636aa32626c 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -33,6 +33,7 @@ module_param(psr_enabled, bool, 0);
> > >   MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
> > >   #define HPD_STRING_SIZE 30
> > > +#define DEFAULT_STREAM_COUNT 1
> > >   enum {
> > >   	ISR_DISCONNECTED,
> > > @@ -52,6 +53,7 @@ struct msm_dp_display_private {
> > >   	bool core_initialized;
> > >   	bool phy_initialized;
> > >   	bool audio_supported;
> > > +	bool mst_supported;
> > 
> > Why do we need the separate boot field here? Isn't it enough to check the max_stream?
> > 
> If remove mst_supported, condition "mst_streams > 1" will appear in multiple
> places.

And so what? If you want, extract the function, but don't add
duplicating data.

> > >   	struct drm_device *drm_dev;

-- 
With best wishes
Dmitry

