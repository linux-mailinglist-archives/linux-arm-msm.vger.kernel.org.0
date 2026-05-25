Return-Path: <linux-arm-msm+bounces-109581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJCCFOwGFGpSIwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:23:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9C5C7ABF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 655B53030F6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55133D5C1E;
	Mon, 25 May 2026 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIsx4X2y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/WFRrq2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101743E16BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697283; cv=none; b=WCz4u4QlYaGTvEMvWyIq14PkxqyKIJGxBt/NfXK/iwlUUluCncbClN/ijxWElexcvrWigenPY/sGTYaK/KSKQUKzOwFS++hhdd1eHCEcZX05ed27g3yoR7JKPABl/YqVSQorQFmG3N725CAYGEeCnQwtuTSpv8bE/n425Y4zI2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697283; c=relaxed/simple;
	bh=BMYk+8apNT/otJvSQWHWNuUMqfhgWqTwPeu7ZPb/03A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOHlqzMLnlusS2mSwa8dA6wM6Pjn5+XHiPHod6G1f8eZNmGzbvIygjij0aBi552vaPNoLjq8iMDYMzDUCAMP3vMlBT9TY443A+PIGabpcIswmnIOnM8ZVvOeou9Q2D1/reFQsooOJHeKa+LHA+JEWuQn/DLHWEh6nBnmiq/5lhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIsx4X2y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/WFRrq2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6rdM21394960
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TjrkbQZDflEL6zuLp9X/6/i6
	fJIOaLkwvYVvs3y6tZg=; b=GIsx4X2yUlFG898unqJswD3orf1dgH6JqESD6ls/
	hzOVJR469ozwytYoVxxgoPHthGJ17rTx/GQqy6mNOo6XTwbprWMQgmrwfW101E0L
	DElng1WyD2zBrxXfoNx+B/WJz2HW+7O3C9ALmTyXo5YzOn2lwNRzXIynMNoywatS
	JyulfKQKueryHambX3+SJpcXNzUINJK4C35wLh8zcaW42aDpWbDSxid+VR8DU2yB
	QxmhcZe8MaX3mQY9IRyAP8o0EWp/Ut2e2RVQds0wXFzx7j0lVb0R09hxFvGx+8m2
	t1YZ4eRtKkVp25Ie4CHbf06JhaXLXD5xDNKLyICRtZ7Zjw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txnrqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:21:20 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fcbf9c0e8so14952817241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779697280; x=1780302080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TjrkbQZDflEL6zuLp9X/6/i6fJIOaLkwvYVvs3y6tZg=;
        b=e/WFRrq2/2pSnFFnycs925kMaaPAeqvVEJcOe9sh9KjQ77VVhphX71E2yJ7fZSTejV
         8V3Zf5OxicZ+mWx+uu+xNQVL/XT+jM/CBysBuY9dAxCGG04wmUm/X8h0npOGGPRxUHHS
         6oAtweHHeXtyntOmawBF4BQ+yIBFBnCrAt8vZlAahVVv79+Sd4DDYYgkhZrUlSrbByuX
         E+o9uf8YHjj7E+ZpHdVyMAfGUj2++/PowqnT5MoBdDDEj9XxOyMahuOYnGmKFoLQlhT+
         kevUPnLeD+yOw3Wvp6k9N0Ctx4CLAYQzbG9VsUMh3m/FglwW12YFNexYbZ5VeNUrHPrv
         nkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779697280; x=1780302080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjrkbQZDflEL6zuLp9X/6/i6fJIOaLkwvYVvs3y6tZg=;
        b=XJpO+bu0Ye1IjoKYxBt3oafPgoPonhrJfp8v+4wv8yuNmXbCskDTSaOcwm2HZfNIgn
         1OU0FP+Ny0K0b9dxlchvrj/Zic/J+gnKGW1335htRwpiNuPe9Dfz7csySNGCnZo9PrxI
         sNReLcI5ngcnzAmYGR6IRSf1C4J0mNFIHcFvr62tuyJOY+hnEe0VmiJy9EUoZb7+HKR8
         mh5BpUlJr2iQjO9LRU3ghXrZYmmvLV8+kVL+Z3aLi9NGb/HbcJ5t6srd+IF1HxT65SOY
         wqIOzHXmi6lApHDS8VgMW0hWczy9RNQ5lgnwMzGJLWOqznUFgueQ4/gdXU85U5Qf+6R1
         1CnA==
X-Forwarded-Encrypted: i=1; AFNElJ8l4bYPs/gdpXCezz0kyRclFTjZSlYLzpYOrgShn9Qo268H77xfw8iV+sEZWgUYc+vMA/lIpW0BwiMWvTgO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0CtYvF6CRjW8/gkXDpKNq1drJtux8jF1RNttC9OVVaJRZKuDE
	Ohw4ENiQen2pZRksbd6rbhd4sSEmuKp3x0lRcPa49pAFHmQ2PyJ3cSAHC7HrUg4lOkiS95Dfyoo
	LLrhPjrOB3FdkE27y1zVzB8TzNWujJb5BzjHXzsb6kvxSe+VZDOTLdCUFIDK6c3wMrLX2
X-Gm-Gg: Acq92OEnIXMEoK/I0rWI0abVdaw0my58dyXS1MohfRZt3OXqsbiGrAop0T63uNig8bp
	ydqu131KHstmaBI1r+6KXvzUO4EUIxuYF+Dv3CwtRNtpQVu1euZCihQHv1NuSaZeQ8LsJ5Hztom
	DytxqN+/fdqYtzZ586Z8GnnKCEyeif+XjrLl/SlBaMGN7bQDVYcR1a8aRLLgkQzBUdQtA5x2JJL
	SqqQ6Yd3UDWMiRTNhpO+lJWPT5RBfkz+k2EZfWkA3+vg+9wJj5tCj7xLJ4RpVzi4qQcCfG5Q9ne
	iBCSuqNDamIwAQgpBpWc1jRetfDaQyzbudbb+C7PRwatOcNt5Ekqk1DLDNxdK7hYr33FYLezEy6
	x97thXML2+1FyqlhvD2Dv74i1qGTFP0OaxuwEGlBQrvsq8gAMgLlD7YQ/9/IO8dNRBwXq2AxosL
	Zg3rn9f5BBmmnEsm64T2yGgFaWcH0B7I+A5bY=
X-Received: by 2002:a05:6102:5e88:b0:631:8665:350c with SMTP id ada2fe7eead31-67c8a823e5fmr6571024137.25.1779697279789;
        Mon, 25 May 2026 01:21:19 -0700 (PDT)
X-Received: by 2002:a05:6102:5e88:b0:631:8665:350c with SMTP id ada2fe7eead31-67c8a823e5fmr6571016137.25.1779697279405;
        Mon, 25 May 2026 01:21:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb3839sm2500749e87.12.2026.05.25.01.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:21:18 -0700 (PDT)
Date: Mon, 25 May 2026 11:21:16 +0300
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
Subject: Re: [PATCH v4 16/39] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
Message-ID: <zeuil2bs2qlqajen7edk5e5dveeyje3q7srxgfkkwrq6ylmzaf@smko5lyfrtnf>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-16-b20518dea8de@oss.qualcomm.com>
 <exhugtt2cf2zjvbing6p5q4ubyiealzj5ijcdrmmp2s45liz5q@7ccvl4euerkq>
 <753dde5f-9032-40ed-832b-0ecba7228d1a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <753dde5f-9032-40ed-832b-0ecba7228d1a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4MyBTYWx0ZWRfX5dkXRRCfaQ/1
 leBgu3qZjCvHvOGIf8pPaHZ3x5xoahkXsqpm08PtY/aYPfd9HYJa4GPwpbe8DVghK3S6F6snBKP
 0lmkyrYxHAUQuyLd+gMIhbqJQgdrfDreKBp15Y3qp8Nh+BHhKlWWYuDBj17QtKCzho0SULf8jwR
 iS1ZIhqUJvjyoSXf6KubPsqXF5iNrvA0iKcvcc932AcaSB28DLX9HKQWPLFEbzoYNSkTy+KfFlU
 qkkrXRgyNdpk5uJPb2XZ7jGbYxGidZSCfMgMVGJnnU75N6kfSvSy6K7iGmVvVMky9u8PBHbYGd+
 6HM5hX2q7zB7/R8GQ8pjg8J9MuuOBrv8puYZHq6VDum+V9UvZadQX3YUn3kLxkOxRjNagUfAozk
 5quIMS3pVywf4njv1jTPN2jAVoAtRBgeXvj1SVTvTViGYAZyRPqL0wOeZL9QFr+6Vl0XPjCzo3y
 WyZrKSx9x8fvBZUcxUA==
X-Proofpoint-GUID: vYF_fMVpnQHR5W8DlEOfApCnm_azLQgh
X-Proofpoint-ORIG-GUID: vYF_fMVpnQHR5W8DlEOfApCnm_azLQgh
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a140680 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=yTU8BwRFjwlpDGFP9tIA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250083
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109581-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1D9C5C7ABF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:06:08PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/12/2026 2:12 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:33:51PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Use the dp_panel's stream_id to adjust the offsets for stream 1 which will
> > > be used for MST in the dp_catalog.
> > 
> > Please start by describing the problem.
> > 
> Got it, thanks.
> > > Stream 1 share the same link clk with
> > > stream 0 with different reg offset. Also add additional register defines
> > > for stream 1.
> > > 
> > > Streams 2 and 3 are not covered here, as they use separate link clocks and
> > > require separate handling.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c  | 24 ++++++++++---
> > >   drivers/gpu/drm/msm/dp/dp_panel.c | 72 +++++++++++++++++++++++++++------------
> > >   drivers/gpu/drm/msm/dp/dp_reg.h   | 11 ++++++
> > >   3 files changed, 81 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> > > index 3689642b7fc0..295c1161e6b7 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> > > @@ -332,6 +332,17 @@
> > >   #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
> > >   #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
> > > +/* DP MST registers */
> > 
> > Which register spaces are they from?
> > 
> Here also from DPTX_*, what about this? /* DP_TX MST registers */

Why? don't separate them from the registers from the same space. Also,
please, name them uniformly. Why some of those are REG_DP1 and others
are MMSS_DP1?

> > > +#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
> > > +#define REG_DP1_SOFTWARE_MVID			(0x00000414)
> > > +#define REG_DP1_SOFTWARE_NVID			(0x00000418)
> > > +#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
> > > +#define REG_DP1_MISC1_MISC0			(0x0000042C)
> > > +#define MMSS_DP1_GENERIC0_0			(0x00000490)
> > > +#define MMSS_DP1_SDP_CFG			(0x000004E0)
> > > +#define MMSS_DP1_SDP_CFG2			(0x000004E4)
> > > +#define MMSS_DP1_SDP_CFG3			(0x000004E8)
> > > +
> > >   #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
> > >   #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)
> > > 

-- 
With best wishes
Dmitry

