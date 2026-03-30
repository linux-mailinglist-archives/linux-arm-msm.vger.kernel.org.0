Return-Path: <linux-arm-msm+bounces-100755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFd1IINSymnq7gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:37:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ACD3597B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D5623024A64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C873BADBA;
	Mon, 30 Mar 2026 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZZ9jOsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxUsnFt4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD573B636C
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866842; cv=none; b=ovAqULxWphpBpNV/Uid33H+ve4B6v1rz/26anIpkR5A/KaG5/F+PD7zx2LeY4pN7wEHU4br+WEgnw29DXzZGIHrWvhsQajGPN2HIyMcZYo22KOAnWjKqT7h6Vtr4dxnqqM8GveTPbrwC/92BRSLbu7FyeqTRQR+mPZ8XuG8zUGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866842; c=relaxed/simple;
	bh=tVVkhVYaj4KBy3zNBPzKOfkl+CnI+JGk4DNOTUlVj2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgJwnTiaSt82YWQ1D3dwlxr8noONLNPs34AM2/5pUGMVonls30bA8zMn7b4wt7Pz9/9ns3iOUIJXz8nQae1x6u2D489gxL0zP5XL/oKLUO5Mb9soq/HHILZjB5BST0IHO+YH+HjWzCue8lAqKUkZAfn9KDwMQ/Xku6nLIJ2ZL2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZZ9jOsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxUsnFt4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U78U6J4162040
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k6UFRPpSk6O7FsltyYeNMfVq
	bWSgj0v5jSe9gEmsb1w=; b=eZZ9jOsBH6bmI+kMymxAGJxEqFSjVdN+9U8c7ps2
	4RrCoGOLcZLAqFxfnPWandOFGa7270fhwtK7OV+HA425e4eJkLKU4hdPiXzeLVCE
	nVk6lk2ZKHT/PR7ssglJKTqIpRZpD+EXqylSUtxForcjPgR+Y9uymzFeed9EvfaI
	o5b9XEe/ul7JaMV7OkdVJ75xp8S1rOPaqyERCKIxWb59teK5xcdqegMe6iWI96bt
	b0xdPZGKMWGOIibv6HyeOIe6mJUqOD0o7xM4BlYJbzBUov5mgo+8OitlCjZimlN0
	9+1FTP8aPDc3Yw1feebwd3rBIRoJW/mesVpa2D5AxX9IJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7mhartkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:34:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b34223670so78153071cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774866840; x=1775471640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k6UFRPpSk6O7FsltyYeNMfVqbWSgj0v5jSe9gEmsb1w=;
        b=YxUsnFt4BIkEWjp/ukgyvtXjejwKGw2w7tJI7hqddrJRGtbZKI5pkqL3hWOZ4gV1zO
         HqF9fTjEVqJivuVU6XXio79Tb07HHxpv6Vwel6qWSQRxvY+od5TfaENXSyXe15Qey5Mh
         WZc9o/rKN20xDA3K2J3e1V+LdAbrsKE5vib2FWcwQ2d6b8tDrFkPuIlyMaWx4FSyD1x/
         SOY/apN4JzwjnXl3DAZRb1pgNqOyAFi8WuglgE8hzVeGDbiMDHDjYFBAqtjWREg4BNap
         5/B+0AMKOVQt2L+5RUupMCr4m3fyj7CEzzA+1/UM92nj69In10Pv3tfXZB6M96OCbtVz
         Rr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866840; x=1775471640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6UFRPpSk6O7FsltyYeNMfVqbWSgj0v5jSe9gEmsb1w=;
        b=R39mpIrTI7FMbj4r4qN2ehCDgy62pldDtNZSy/ZlXJLf3lLdKZZOQJwfSodXB+jKjG
         mWm62iN9SBSgvobmxUfTGl5ca4hMsV96lCpZvcr4DuTfRIVeM0Z3YOG6SlBdtQqOjEJC
         G/LTp38xrYkhgZb4npMP5U4xGgWUrkVdSE8S0QkVFjmG9qDhcjhLLLU1ddNoLQIz2N1+
         qOtmfW5DUFfxiccHGV9Wucr3dgdmXmg2Y5y2BS7d2RYDQ5/hLwdL7ExhxbY6UNk6n9On
         uOn3Buxm/Y0JT97V57ppCjZpH2wDpRMnxdGasF//4iyp9xG9B1d0s/2s9GHF/3prkQIP
         ASlw==
X-Forwarded-Encrypted: i=1; AJvYcCXBT9yaHnm3wC2W34Eewo8D8EqC/R3fLwF1MH75u8DpkNQPxUCvtiI3tZrJYgP5VqZ4DAmG654Uy0tgMB8z@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm4GJoCsFe0WPZS7f7pfj/KxwB609nAzgP28+UMtX0JONUVlVj
	RDa+ryH/bSIgsZDYpSURD8yxbXruRPp/aDSHZoffzzp1td1MbEXBJ3TazJSsEEswm6N8WD+BBTa
	0QN7ZkfP0vSLPpSsdsErmqXsHfBxDc3BJnpLDZKR7LW2q9JlooCNkIUcZHab+Y75OKn4G
X-Gm-Gg: ATEYQzxLFEK4c6gIAMhfZtNyJfK15RVopDNJ+RxJGkEDOEKT2ZuKBWbL3mt2L8lCR6q
	u1CknToLJrxAE0mtdg5bXRlQw4DYoabdCJokbfwbUnskiiOJIU9LcIbKg0XfwBsuMZfBhYzx+jB
	yCkCcxujAkoK25t+53KfZMGxk9jXIxpvcGTzq0LU3H5Lh7olgWTQk4+m4znfHsyvs//H23fsBwK
	GcfNe8DWbxr5au4WccCzHQalS8MVkuZP7udfCMbAwgnWB1L5yuAJ2mzBz+bIhNMME1DUDF+vc7L
	FMMY1Yua6/eb0k6DLMeBVJAtWwVqKl49lpSuTmijLRzhoiIzN3q4tD1XBaf+fGGc9aj1KLNg8tF
	nWvm4CyBsDvW5xZGSBoraUJWxP9JNZO50sxszuIhKFDGxEyI/oIMD7Hoov+ohFhMJrSko22lotO
	KAPEjswAbJEbHD7pLRhIn8+aFMd+2V/APyDns=
X-Received: by 2002:ac8:5a8e:0:b0:50b:47ae:8abd with SMTP id d75a77b69052e-50ba3809620mr168990881cf.2.1774866840126;
        Mon, 30 Mar 2026 03:34:00 -0700 (PDT)
X-Received: by 2002:ac8:5a8e:0:b0:50b:47ae:8abd with SMTP id d75a77b69052e-50ba3809620mr168990471cf.2.1774866839717;
        Mon, 30 Mar 2026 03:33:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1443f23sm1626352e87.42.2026.03.30.03.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:33:58 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:33:56 +0300
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
Subject: Re: [PATCH v3 11/38] drm/msm/dp: separate dp_display_prepare() into
 its own API
Message-ID: <eemnyjrkvubsyuwvpdxtmrxkba64lxrpucdim5nihlfzijxbvk@hirj2yjvic7s>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-11-01faacfcdedd@oss.qualcomm.com>
 <rsywfefrwv67umbi6xeybelsu5u6xqyklvtarnoluu5mzz5u5k@bkexqpdd47ew>
 <52455b77-fc3e-40bb-9462-8a78238bde0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52455b77-fc3e-40bb-9462-8a78238bde0b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MiBTYWx0ZWRfX0/89gQEIWORF
 HoLFofSBzLoEiZo0ZAVpzFR0i6j4DIQtVRf8GerYaScqbl4JjARb6WuW2myPqVd6pTluUTc2nF0
 H3n29pu4IihognZM3e9tRMa+rPGqQHL0vFx+ZbAgJVOqFjk5GWLwsNdQe031XGz18aeIWsUeP6W
 xzAhApfg2UITbH1du4QRWbunJ80aoJ5rdTy8fF/jT+MbLVEG4PvFnlzgeijiBhB5wKRwe9lufzF
 K86bb9nZm7OTv4xNafZVXJGWIVk1bbIJ2UFH2Vt6j9qoZQGEPH510808zuiA9IVG11CW/s2Aapw
 svBWJ7cwfXhVeUcUjBMzoHf56g9llJrPeu88vsj0W94bZ5Y7vSqIt3bDRiyNgNb33SueUyx3URQ
 RTEKr0oMF/p1hM0BVdiOU61PEypsMUW8b9vS1ewfkusiViQ17ePXh9rGPgPjn1mkXwKb59qK3gA
 uMsLWUBS47UI/Xoe5hg==
X-Authority-Analysis: v=2.4 cv=Fbw6BZ+6 c=1 sm=1 tr=0 ts=69ca5198 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=BmG4Nd5KL32AyuSnXtcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bpcv9RnG-acDLn_NtdtJq7rckWWBaUJd
X-Proofpoint-GUID: bpcv9RnG-acDLn_NtdtJq7rckWWBaUJd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300082
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100755-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9ACD3597B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 05:46:09PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 1:39 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:15:57PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > dp_display_prepare() only prepares the link in case its not
> > > already ready before dp_display_enable(). Hence separate it into
> > > its own API.
> > 
> > Why?
> > 
> In the MST use case, this is expected to work as follows: when multiple
> sinks (two or more) need to be enabled, dp_display_prepare() handles
> link-related setup and should only be executed once, while
> dp_display_enable() is responsible for stream-related handling and may be
> executed multiple times.

Then you need to write a better commit message.

> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > >   drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
> > >   3 files changed, 15 insertions(+), 4 deletions(-)
> > > 
> > 
> 

-- 
With best wishes
Dmitry

