Return-Path: <linux-arm-msm+bounces-109580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JzJBQkGFGpSIwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:19:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 853895C797D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 010E8300F153
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3B03AC0D9;
	Mon, 25 May 2026 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJXaPUEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGTnfh0s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679853A3E67
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697156; cv=none; b=nnSt4jqZdXCJ/tsyANeC/zhiaWXX4nstIwWGkj8JIW1CAoQHsnKkUKNcX/FpG1RkNRmlyNACmlCs78AaY7yN8zWYGcKYXsb+GTDQ9ljESQjJjrcsWfG65MiAa7wBpJ2aerb7t8Y4/A61JUgVhP9m0XuOyu+2A7s4LsPw9fDWOv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697156; c=relaxed/simple;
	bh=L8o/5hplm6lPz4rdkJ6CnWy8BocoGJ5uPzrg87XS6aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYqjzQTGaGirDyPXpqKQBLvVh+S7Zqorcit8eHe8SFUOqB3Lrx66GWJqfSB8cxQOFHPjsyCGa3jW+ROG//po0lZGnFwBiCrLQgF3okNddMbl8Go8lRdsEH0Qj5CJ1efpOTjdjib3u0Wijt1umeKG31eYYGAqRuOl/7Rdd0Yfams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJXaPUEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGTnfh0s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P3U2Ja012691
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jr2LPD67oEe9tTsajAyX2eh19LrOZ2oQSoyeTJxvAZ4=; b=KJXaPUEbKNCMnFj0
	f3IhHQJvGF+fLDP1oo/OA/zQc5/jDVYwGPmIaENAmbJE3IgWWLd1efmlQgSZLRn7
	whmOjkRDr4DouNkdwAxBVML0tT8wscTYOd4G3HXOMpXXY9ITaJm59IpRG1J0zqvr
	N+MeYQ1euLIoJwfVRr67V8n5didQwI/d15Y5t+q9EIivQTjaKah94F5HHcCnG46Y
	YnUF9OBvTMSOx00FL7FLubutso4oD5K/jSQBtnPHtU3rC2gJDOKbLaKnMD6XkVuK
	QxeozXO3+YUOnUsrLiX1/uNH0+DVtjZqoZkBE0FDUZ7zbbRX0QjNB7HZxxaoW51P
	136rFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7nr1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:19:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc70cfbdso54238361cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779697153; x=1780301953; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jr2LPD67oEe9tTsajAyX2eh19LrOZ2oQSoyeTJxvAZ4=;
        b=OGTnfh0sZAXHnQscqpjxRWEkHi4UUWWzjO0X9rhqD2Yk0bTvXSVRWA+tjs+qR2lBxI
         H37YkSbGfDjeL1afik4hoJ0sdBqvibBrUSMIXClzbtewtfLZea4Va63wtnOU1ULDdnKZ
         uysVLckUEo8J/3o6nuZZorUhTlTdWHCrEGZWvbJDC0qRKozPVTC3ZtQBFkJHZ3PxE5c5
         iSECwDwuDIT1Fu/Y/KArD9SI4TxlTTfmDOOyWIvuExeZNCxkfjwVZjthtJLUfbc0N0nJ
         tqbi+MO1QESifkGr24YRLdxEsubBnVyk7HbGeIokXAgd2DerKiwOZVGrIlDMPpEozSy4
         XuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779697153; x=1780301953;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr2LPD67oEe9tTsajAyX2eh19LrOZ2oQSoyeTJxvAZ4=;
        b=pDCcJ3sUNkit1JvKnOM/YnjJMZy549uXeiB3BuzeFXPqPqNJ5BLkzY4/NSdEXjXf2l
         d6MumUm5MgaSWAmI5FuFRM2i9TIwMaSV1ADE5MV7SewpwFS3IqtOXO3+m26VMGcfSXT/
         5ragnNZq2PCfcJvEaR/a9rTq/Pw1TkL47VVJbTlxKj6qKFoLx6qDJGher8Yeysj9USbl
         numsmBUkDrjHu+OSqb2z2jEWRbFuenEBKPOgxUIec4cnBSf+RfIlhTRuZDjOhy8laO/s
         ZXYg9Vcp9M6x9nkLKWXSzadJifxkoOAP47M+2AFH0wbnIWZvltV4Gr5VXm0vNvhfNmPB
         fQeg==
X-Forwarded-Encrypted: i=1; AFNElJ+wSkld6kmqLKRsb3f2yfktO6gNdgTDGo6bSTUrJgLkjNP/9x13vAl/Z9V2TqBhH064zL5vgPuI92XlVwST@vger.kernel.org
X-Gm-Message-State: AOJu0Yxff8hRh6HrJj0Ka6VYiRSYglQkSgNjOrLMu2Hj5gRpO96XFL/O
	BWhHTIK/GzM30CZZovzxcid4jZGyqVjox/ZqmR6Lw/rJL5/xvdRVVjIJmUEPHNgff8BYgBeoYg7
	dRAL/nADXBApSm9aBR0hz5Dqc0LyiGXenQggtjmDiL9l0yHJATubJMV8clRHrP4O5NBF5
X-Gm-Gg: Acq92OG4DEfehR6ELPfOhDAFPCm4UTHuGZubolN1hnYdMPD1PBpE1nQBeYmvlB005jc
	KTrUjD2JIASkuZWKEZ7qNCoNqzZKRwsSKGcVrg0KfG6QVagC0utvteb8W6VrnEG3jR7eUM+mwUf
	MvPbZ0Ay5IRAzNyT3ttgfGOcQr6OeIbv1hpTZqxbg/rG077j2M/3SFT4FpeeOsU+iPZmBmFg7ca
	brAzr5/mNC7vDXpS9D2v2q2W57Yt65m7kCGfc7/RKd316WthiRmzRilRlNs+4i1bRT1WRJocI/f
	9uH7GY0BuhIyBHZZ0FVlKFh8voY7sG8eTagPRQ9k5lkTQrPFcGv7zdTKijxFf8LLoVuCCr1npVz
	G0PPhxZKdUPZvMEIgUSMydCv6E0fMFsZ7g/lq/18bFvej0fwNMbqGAzLFFULLnPfOIfBUIPf3b4
	mXdna3bUynonhRupJoae47nYbRaYj7viG1+cc=
X-Received: by 2002:a05:622a:406:b0:516:f4f7:3325 with SMTP id d75a77b69052e-516f4f737b0mr44874811cf.35.1779697153240;
        Mon, 25 May 2026 01:19:13 -0700 (PDT)
X-Received: by 2002:a05:622a:406:b0:516:f4f7:3325 with SMTP id d75a77b69052e-516f4f737b0mr44874561cf.35.1779697152648;
        Mon, 25 May 2026 01:19:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2c6e3sm23988181fa.30.2026.05.25.01.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:19:11 -0700 (PDT)
Date: Mon, 25 May 2026 11:19:09 +0300
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
Subject: Re: [PATCH v4 15/39] drm/msm/dp: Add support for programming
 p1/p2/p3 register blocks
Message-ID: <233pa7rqxl4plfk44utgdb4jizoonaur4ypr4oyytbzdz76bwm@rt3jibbck6lr>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-15-b20518dea8de@oss.qualcomm.com>
 <zputabw52nsba4ddwg7gd22tyouobkmlpq6blos7w3kx457otx@gitmjwroo7ou>
 <55081f4d-f1a9-42c7-a1cd-cdcefc008668@oss.qualcomm.com>
 <qslmbwi3xwdlc5fac4yjbxf5neckmiuy74en2wiccv3gos65ey@twcgc5wrayrh>
 <083fc602-7549-4abe-a11e-51dae9fd0c8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <083fc602-7549-4abe-a11e-51dae9fd0c8f@oss.qualcomm.com>
X-Proofpoint-GUID: rBP_4cxWiIKxdD0DGhMyueX8m75ez2Yv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4MyBTYWx0ZWRfX48DOq+IDFI0e
 W2l6wcsLaf2Kl0BH11sx4nUOUyJZF9rjvHolRyiZ5KnTNnBuhile/HWOZEx4oh2yyNbuBXIWEwN
 +8I+42BoU2PRCkGDyX9EpKpYC35h4xRcNK2r/YrVj5Fy9CO5B4MCRxFCbiPgbGjbqYOFQoLK+3x
 HS/TxqgjsjM9rtjl9DssVuERmbrG0Xk9/WLWdgE6eihy7F2iYrdiUrl5boUO7v4ulQd4+tJFHvh
 TPsmbWnjVk/HTO8+q2iXKN3RiTh8QGTKqRvbEWI5nU9u8eusof4BMjK3AAKqfB2/FOWKTBahhMN
 7ijKGgOnSM1gvzIRCb4uxf5lei7TIzDULWQMuUnbHQLZGpilwYuzWuVz/sUASo86qH2MlVnYs2E
 lc/sagP7y1S4rn8rDLQGnxKC2axORCPZsRvK2lYJGcl9PZQHrQEjTaVjZe9+/PyLCmWhqzTllkB
 6UBTz+7F61bqzU3AjSw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a140601 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=EjYkQcJriFt4rTJH55wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rBP_4cxWiIKxdD0DGhMyueX8m75ez2Yv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250083
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109580-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 853895C797D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 03:51:57PM +0800, Yongxing Mou wrote:
> 
> 
> On 5/21/2026 8:20 PM, Dmitry Baryshkov wrote:
> > On Thu, May 21, 2026 at 07:50:30PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 4/12/2026 2:07 AM, Dmitry Baryshkov wrote:
> > > > On Fri, Apr 10, 2026 at 05:33:50PM +0800, Yongxing Mou wrote:
> > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > 
> > > > > Add support for additional pixel register blocks (p1, p2, p3) to enable
> > > > > 4‑stream MST pixel clocks. Introduce the helper functions msm_dp_read_pn
> > > > > and msm_dp_write_pn for pixel register programming. All pixel clocks
> > > > > share the same register layout but use different base addresses.
> > > > > 
> > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/dp/dp_display.c | 40 ++++++++++++-----
> > > > >    drivers/gpu/drm/msm/dp/dp_panel.c   | 89 ++++++++++++++++++++-----------------
> > > > >    drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +-
> > > > >    3 files changed, 79 insertions(+), 53 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > index 7984a0f9e938..ff506064a3fa 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > @@ -85,8 +85,8 @@ struct msm_dp_display_private {
> > > > >    	void __iomem *link_base;
> > > > >    	size_t link_len;
> > > > > -	void __iomem *p0_base;
> > > > > -	size_t p0_len;
> > > > > +	void __iomem *pixel_base[DP_STREAM_MAX];
> > > > > +	size_t pixel_len;
> > > > >    	int max_stream;
> > > > >    };
> > > > > @@ -561,7 +561,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
> > > > >    		goto error_link;
> > > > >    	}
> > > > > -	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
> > > > > +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
> > > > >    	if (IS_ERR(dp->panel)) {
> > > > >    		rc = PTR_ERR(dp->panel);
> > > > >    		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
> > > > > @@ -769,6 +769,7 @@ int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display,
> > > > >    	}
> > > > >    	panel->stream_id = stream_id;
> > > > > +	msm_dp_panel_set_pixel_base(panel, dp->pixel_base[stream_id]);
> > > > 
> > > > Hmmm.... Would it be better to set it up differently? Allocate one panel
> > > > per the stream from the beginning and then simply get the first
> > > > available panel when required? This would require some minimal resource
> > > > manager, but then we won't have to pass dummy register base to the panel
> > > > code. Or actually allocate a panel when it is required? Do we need a
> > > > panel before atomic_enable()?
> > > > 
> > > In this series, panel come with MST connectors, Because the connectors are
> > > dynamically assigned, we don’t know which connector corresponds to which
> > > stream, so there stream_id and pixel base address are dynamic.
> > 
> > I read this as 'streams are dynamically assigned'. Connectors are fixed
> > and created for each branch point / real physical connector. Streams are
> > assigned on the first-serve bases.
> > 
> Thanks for pointing that out — your statement here is accurate.
> > > we have 2 optionals here:
> > 
> > What is the runtime requirement for the panels? Are they required for
> > parsing of the resources or only for the setup of the actual screen?
> > 
> > If we have 5 monitors connected to a single DP controller (via the
> > complicated topology), how many msm_dp_panel instances do we need to
> > handle the case, present it to the user and still let it select only 4
> > of them for the video output?
> > 
> It seems that if we move the link-related resources from the panel into
> dp_link,
> struct msm_dp_panel {
> 	/* dpcd raw data */
> 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
> 	struct msm_dp_link_info link_info;
> ...
> }
>  we would only need to assign the panel during atomic_enable /
> atomic_disable.
> This way, in the scenario you described, only the final four panels would be
> exposed to the user.
> In the current implementation, the panel contains link-related information
> that is required during the link training phase.

link training is a part of atomic_enable. So, what does your answer
mean?


-- 
With best wishes
Dmitry

