Return-Path: <linux-arm-msm+bounces-99030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLZuC+nRvmlEeAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 18:14:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6152E6772
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 18:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25308301CF84
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 17:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD183333730;
	Sat, 21 Mar 2026 17:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGSzzgAQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LG1u+LrG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A72430FF2A
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774113209; cv=none; b=H0lg8eRybaa/qdE9Z6ita0S/b/jZMmNW5j4fR38bPSQr5bwbO6FMhUpSqy7M35HAa1CzOMO57OHLIfOQ7arYYQN7IWB+byDYB9C0ckrkoL91aMQ7YGIlWt9y5Nb3fSUOj3My1bGg9Ss0iRAMu/7IqPvZ91ovBdKvU1ANQ7UV4tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774113209; c=relaxed/simple;
	bh=cEpeK/EQp8Ga6cicqBJKqpm6GXMGqpApCOqIQcDfjKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZM15tFABFKwArlePeKaSajfQbJzZ5bfYOEzjpNIvtOnlnqFTTX0pS+GIDOhvlffPtKk5PIIM9P9Vm+Ce0lvbq54JXrX3vGSJyQxG76iS/HFt6QV0JEdlXKDewgCMuVwEmOQIGZ6scXFgR21qV8gpQc/xD/6ivQOlNBht3onH1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGSzzgAQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LG1u+LrG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LFL32h757469
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 17:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFf7aXwCd58nYJo9hHkhjmLhGi/IQ+sjJ88oicm+khs=; b=XGSzzgAQIUIsl4y3
	4NMSUDU9lhahsw8T83hP3QZ7CjU2mdN/0sJAoO8N2uWU5EUlKfI9ppmCxpmHZge1
	YZpX1aYUmDPwpiKydZqqA8uVfny5i9kBgxj8Xxw0TXdIIICaDns8GWDNTWlxfSay
	wvwp2xLTEFyZpufSl4M+daK8PCPk8ldCqFCmjL6GZlj4Gqx7BN61Xnaos1YgRzvp
	Zz8w62PDGr7ZmjBk6oPA0f7bfWC+zZYktX0sTLHjRLV5pXFnyZVZhyrPijKc79ZQ
	uf0W5ynA5yGR+aLSpOyFb1ylvUbSgrUHey8HKZej++JVP0ziEhnJGi95TfDZBnqF
	Othokw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e17n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 17:13:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b52a2d70cso6458661cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774113205; x=1774718005; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QFf7aXwCd58nYJo9hHkhjmLhGi/IQ+sjJ88oicm+khs=;
        b=LG1u+LrGVWrzrr1EslQfRluXXK4B/Pj1upO+9g9V1XvvK8CnMBZmppwdfI2xU8BCEf
         lSAHBiBW2kDEpOzVrUeCIxgd9Gf5mIBruxwg4pPiXf3an4VYGpSv8zFu4zrsPyIOlSz3
         R2furPvAWyLoE4wenmR08QUvd4rq8dFi2ntc1w6iROz0cHK+F/REl2eLEPcQp0ll5whx
         hVW/sp6DMlKDiP1rOBc9TgHBJ1DRTPX0fVji9vByZWvmrmpoi/AUPghgipBdcvdorDtQ
         AM/RCHzrP1YHLM5kXhagfopNf4rAne1jbF/PfwvW1SRVOQZdUzC23um4OykM+PSs8JQe
         /c+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774113205; x=1774718005;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFf7aXwCd58nYJo9hHkhjmLhGi/IQ+sjJ88oicm+khs=;
        b=YrNBTEjTAyIVyGREYSLvkjybA+ElOz7y4sFd5enaR06rlZDELlHjKQID0lnmsBg5jr
         4vNFqm/hXA9YtYQ5m2fUMPz4+nZZzBOQhCTk4TZO2ry/d6g9V/mFsQe+TVlQw2wnOrqt
         xVKRc1li5/drwZtINEDvp1HWcnOtRhM71nd0RUS1tlDF0cT1+pIjbNVn8EhD2UYDyiaq
         lDK5ENRPo5/ODkBlpr8arVgquIkZ6WtVcsw+TGYE2ERIZTxuFM314g5ws74ApPSx4v+g
         l7wDYz7E1AF5U/X5AqtMNVhqdndekaxECHC8wcgn2HEFEJdfQO8AhkOe6HNECBEHbzdj
         lHTA==
X-Forwarded-Encrypted: i=1; AJvYcCUttEXUp+J9Gqi1eQkF95yEWf5CVmqGzCNVy0NNoq4jn5zu2wdub68sScqCLeXR5ewC8uYWNW4H1FElAzK3@vger.kernel.org
X-Gm-Message-State: AOJu0YylXQ+/95FUG1nhoDKSRNS67ArEm2WnTFkxnQPLmKJ9fFs4Iyp3
	D+TeIKH5E56ME6OqomnhBzBkmDzBcq5MfB/HU7Nu9CfTA/Yw7dQCNJD6SgH32Ic+IIXlB6yApgV
	FF+avUajnJyRWXVB1txEapgoXM2+Rppyw/etFX6zvSUdWOlfeX5MBGp08gYZ0FGHMo9I1
X-Gm-Gg: ATEYQzx8kvI9plGXfUj05kwxt0cAp4OkeIWJa3TkIMMB2uO8DwETVeDxJsjXSIBEtd4
	8J360fsmZXvGXikFYb628YAL8CYfSyd0xkG8hpeDF8fhej4BZueZrRnC0x6t6+WdT8hfNbHP99i
	e8GZnzISqA3EDEC0KeOEY8TZ2I4DciQTkI6CXO/Md2/3pVlD4MO1199PTfO+d1rM2D2Gvk885gc
	X0A6ckoedgAvLTNVpEuSxJ4gEK8RdzfiTkOBA+agBChg07H3QK4aKFaZ+lsutlniAwS/lMBp905
	SU2Fj3OkEFJRjLtZ8XHjhKlcrCtvOOH4fgxSogs9dtKyJTIwcYra1ZJbn2AsqRXs1sNO/XeG4au
	F6aiQ7fEZ7Gzn38XhD65DT0UEGnzNCyhfq4x4uNrCp7eZ/MFi6ren3xBcV/pxINTeVC5D2MwYxq
	eqKkbS9uh9sLwhlrUGgkVfE9WDcPczKYXn7Rk=
X-Received: by 2002:a05:622a:156:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50b4e60a658mr23830321cf.43.1774113205400;
        Sat, 21 Mar 2026 10:13:25 -0700 (PDT)
X-Received: by 2002:a05:622a:156:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50b4e60a658mr23829911cf.43.1774113204955;
        Sat, 21 Mar 2026 10:13:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cf9esm1214568e87.82.2026.03.21.10.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 10:13:23 -0700 (PDT)
Date: Sat, 21 Mar 2026 19:13:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 10/11] media: qcom: iris: use new firmware name for
 SM8250
Message-ID: <23y6nehk5z6z6lyclrmtllirzz47igbav3lep47xyomfnuqdo5@77nfhlqeyph3>
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
 <20260320-iris-platform-data-v9-10-3939967f4752@oss.qualcomm.com>
 <CACSVV00Es3dGirfe9aHKwvaZog=DtEx9-ZPz1YeuStKobcpT7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00Es3dGirfe9aHKwvaZog=DtEx9-ZPz1YeuStKobcpT7A@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 4pvy343KNrPRsTgQeqHfSeqk_Ulx1Hps
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69bed1b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cQr6lTdKrn-CZv5RVjkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE0NiBTYWx0ZWRfXzRgI+dK/wkhU
 2R/ylmKmXikvSInpDZ5fbtNf2FOg+Z5VYyVbC+DXRXIMREMhj7NcbpyLOOb1bQmsEQ8Dk25t+uP
 a8P03u+yPo+sKPUfxK5nQ5Trj9GX/z5zHO2zo5uONylBFIFsut4ykZpM9zIt3TCmf04faZkSqgA
 cUq6lkRmw9Pz45/q6ty4TXoUSiOV9oY5T64jzBQfzrJpLhyzNdw4TNGZA6a2DNQTRrA4HhwygY4
 KP8P5AtUYPASTq8rvtOQce5vxUooIyCfW4pN6gmkYF2BYYWHaNjxbzgKAeNuxvtkNj/8JDafS3e
 /7ZAWQXdFMpKM5xggEtF6VrIFyFhCcsT83w/aKh3lpGOVLAs+x98O9dRF/InDAKZGPQoo+e5P8l
 ScHdRZ65PVEnbEC9PuCHvC3TN6HkG61UGHxKze6Z9aCrNXLftaVKZEizzxJJcWX/T1OJX2uNvv5
 pKvN4JRv9SBU1ah3MkQ==
X-Proofpoint-GUID: 4pvy343KNrPRsTgQeqHfSeqk_Ulx1Hps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210146
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99030-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D6152E6772
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 07:56:47AM -0700, Rob Clark wrote:
> On Sat, Mar 21, 2026 at 7:45 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
> > since August of 2024. Stop using the legacy firmware name
> > (vpu-1.0/venus.mbn) and switch to the standard firmware name schema
> > (vpu/vpu20_p4.mbn).
> 
> drive-by... how useful is it at all to list signed fw name in the
> driver, when it's going to have to be overridden by dts for basically
> everyone that isnt' a qc employee?  On the GPU side, we stopped
> listing zap fw names for this reason.

True, that would be a good idea for the next platforms. Fot the existing
ones we have to support existing DTs, which don't list the firmware
name.

> 
> BR,
> -R
> 
> > Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> > index ab2a19aa9c36..692fbc2aab56 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> > @@ -111,7 +111,7 @@ const struct iris_platform_data sm8250_data = {
> >         .opp_clk_tbl = sm8250_opp_clk_table,
> >         /* Upper bound of DMA address range */
> >         .dma_mask = 0xe0000000 - 1,
> > -       .fwname = "qcom/vpu-1.0/venus.mbn",
> > +       .fwname = "qcom/vpu/vpu20_p4.mbn",
> >         .inst_iris_fmts = iris_fmts_vpu2_dec,
> >         .inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
> >         .inst_caps = &platform_inst_cap_vpu2,
> >
> > --
> > 2.47.3
> >
> >

-- 
With best wishes
Dmitry

