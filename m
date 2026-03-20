Return-Path: <linux-arm-msm+bounces-98856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKYQO86mvGlq1wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:45:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E72D4D79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D3E930F3BE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 01:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B5730FC03;
	Fri, 20 Mar 2026 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NnoABeWU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WYmN1IjQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286653009F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971146; cv=none; b=P/mYLDR95Jc86IXTra4YurrFJMOVG1vp9bAVC4qbYoQR5E79o2w7EsX2LXt5sqvONpmRIUdNlERURExBjsjuiPT2ibY0xPWSMrXF5fbNyJ63zfCdVnABLoaX+1F2plRy5YC1E5CVr52ra244oWKwc5Ozkev5Lcl7GOIm/wzAeH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971146; c=relaxed/simple;
	bh=k4+97ReLAmm69r37+7k6qat6+TOXjZWSpYx4Bzx9zfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKY1tf3m0y4YsIPQ8m6TpA5h/p1eQ9IZ/QlAjXhUWlDrcNC8GJZyb1BPN297Ylvie9qWgASxIczbZ7yVyed2lurXCg/1SEXF9S18oaphf21tSjd38Ha08XJwC9arn9gV+xOq+z12MHRV6L8ZSOW+11q8+UrlnYL4FL7zfoQnOX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NnoABeWU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYmN1IjQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JMkH2b4144798
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBL1764W8XUWZ4XM9UO2GrKnJG78q2fZ1dktl30bcIE=; b=NnoABeWUdrKXpEKZ
	3awbVgyFriKkyWydIJOkeZS7mJcP63+vF+NasaLpYX6bkzEMz8La0w/4n1gQZ/wy
	8Gtb8UfFOHjyk6Fg8+WcNx+Ybu/kwAoh5KA39UCzxzMWnR4ZJAJjZq9APnRtkzgq
	DUy9U1HmK1qMelU60NJQi7Lt3c1YKkZQizADv0FxKVVFAqeA9WV35UNwMjFKMbFf
	V98gQhnhvxJx8GIMQ7JUTo2wZBALUvefv0V89R6ng3uysn/3VAi/JxKVwV1ue57B
	bbdGzKx/M2HX8d4O/MK4ZF6Y4aEYQJ7kZsLzFGwj670PEFJCqVDeY4YLVNv0Fuq1
	pvNsBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0t7urbpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:45:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509044f54aaso114358371cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971138; x=1774575938; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CBL1764W8XUWZ4XM9UO2GrKnJG78q2fZ1dktl30bcIE=;
        b=WYmN1IjQtIThyBc1rhWOgHbgq0qXKvfuj6JiD9i4bod4hRs4CTY1n0PBodEFogLrKp
         kL3+yl8yTRC7osEH1icNUTBHYAkgQJnA/71of/8Mmlutd2T8F8znaOwdVldKwQwORBN3
         DKYv2MDHeV62r7/c3cCNueE+AyOgaj48jIHA4Fi1Vx2DQ78sxboe3pnJMoe/S/qTpFU/
         S44atNOdG67UdkNMa60L2npMZBj5vaXgLKEK51DDaSTolMPqgvjPSnU9g97/1rufTrwJ
         f5wRWIHjBmYUdBB9WkrwBejM2z0F4GKo1hP+u7UK1AOYjrXt2/JZFe7j0JnizrpmbKWw
         YANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971138; x=1774575938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBL1764W8XUWZ4XM9UO2GrKnJG78q2fZ1dktl30bcIE=;
        b=QJuq2esDqubXUIrb6i0m6OWOGQqY/zuZebwIOfY3lBqSm9VP2MZyrUWPUHnVqcctge
         XQuhmki5kzeglMFKbb6KU/0FUzaF/nxX/gvktkROp0kRQHOyhmKMi4XVnDO5ZlNZTkiU
         rum51fciIei2HagFXDugHVnxD6pr8QA0CVsBFypTmKXUL3snQEoprm13bBT0OOvavdb2
         MBYYe9ucYODIxbYzw7rCEvYmUJMsaP+gU+PIh7gtoyHOHt58bgEHt9pBCy+BbvdAoCOw
         KThFZPfwfxMeaHr8jYCe0vExkOQunCAtIXkeI5DtOErFrIxSH+BWs4Mib0EL5PmyLkyQ
         xvew==
X-Forwarded-Encrypted: i=1; AJvYcCVeWpwb9OD9gNXW+JWUfdvPnHubm3JSe0qyg2yfCjiuxok10QMvfnxmtSbWLgCAjdMtNxy3uCU7xVWjwh6I@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73VROLsqR7I8XZp5zGXPP3IjANuwBWjvfws5zgKg5wQfhkL0y
	npl5yexONAxmdkIIH01NYeGk0TdMlJ8aINmUYZGRqPE2fcFhcW7+tqit4LopKolGOY6VST/kRnC
	jH7cPXwNBonPyg6rxEtJc90Dw3NMHZVnw+mkmGgMykDcHLnsqAbugdmkJ2tc9VKguYT9j
X-Gm-Gg: ATEYQzyNBC6hDIA5Oi2b2/vkqBN7L5Hb83gUTmn5/LER90SdEYFffLHFLoZLXUhAdn2
	NgYC867XqSeAw2N1vzoYCe7t4aMJUcL2NbbX5l9D4pRKQ2XU63pTCYHUcJfnYPiAJ65jbwubrvc
	XO7tXPylQK+AlSqLdNneMG6ocZ5TkIuPGGscoygFmvyvqD1mp3YMjyGpi74aPmP45hyeLCkvZKk
	MWIff28+V1cwAztxf5MVH4B/odbkGz14aIdH7w/K/9Oqz+AQpHhIlcOxlKTpwM19+yjptFMfw4+
	4+RdQ8xm/ex/kdZi4zvyPgiub4NZ5A6QP3g+eqwC3O1kYxsdiEGuUENxcF5Y6oyMV1OGvK7Vjli
	32UDzKvb7RobikRkVsUBkYNrlXX5Ubv+zthF0FVIBd/aCUbCZFNZI17nPwCtz8r3kFALoPRKSOV
	cf/ae4yMpzk/+Z/cCbNrs9UF47ttax9o7I604=
X-Received: by 2002:ac8:5713:0:b0:509:49cf:cb07 with SMTP id d75a77b69052e-50b374b1806mr20881871cf.33.1773971137762;
        Thu, 19 Mar 2026 18:45:37 -0700 (PDT)
X-Received: by 2002:ac8:5713:0:b0:509:49cf:cb07 with SMTP id d75a77b69052e-50b374b1806mr20881561cf.33.1773971137194;
        Thu, 19 Mar 2026 18:45:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9753c7dsm2623321fa.13.2026.03.19.18.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:45:34 -0700 (PDT)
Date: Fri, 20 Mar 2026 03:45:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jonathan Marek <jonathan@marek.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width
 calculation
Message-ID: <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me>
 <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org>
 <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me>
 <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org>
 <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMiBTYWx0ZWRfX5UPFN3YH8YoN
 AJW8QO3YmFFt7B3fW8bT18eaAjjYq/3ffwp9MLwgZ8fc9ymYLtfJswN1QFGZLl1yJ15ck9RxXN9
 XwVqFSwKpgNZyyqLzopOuHkhKEalwNp2YtT1Pvaqvg48ZoJE8DXm4++dDwJN4CXtgfK/HFA8HlS
 88V4ZGDyC5SrjcAa/J90EIQKSRHJIX56HBC/yCoAvuHKx5HOLf1QulEU5MpiEo12gko6CbAaGDw
 amYQsA2vCnVRaNnMbSLcX42Qc42vxEJOXWAGdiLtJLXOBfWt0vYjKU62aKc5Q2EtNQ90UvTj4Kx
 DS32Pr6+NHGT3X/6d3ACQpGdsDc+ojUM1EuJFZk9DLi9CdUWH6ZVMiF5tjY7gu+1GGKODf96815
 MgnNjGByXGgez17NG4kYZ6U3PDTEU7SwYdMDI3wTQJ7oNTTIcEvYZeLNhyI48IZr8Nr7RGB1+3j
 yooe+nfE1uWhnIDmRww==
X-Proofpoint-ORIG-GUID: 3q09AqfcUw9Sb7IzPpc3EXjWILznG6uZ
X-Proofpoint-GUID: 3q09AqfcUw9Sb7IzPpc3EXjWILznG6uZ
X-Authority-Analysis: v=2.4 cv=c/OmgB9l c=1 sm=1 tr=0 ts=69bca6c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=SUsfgI6VF5ffP_QSSRUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200012
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98856-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.974];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 574E72D4D79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Marek wrote:
> On 3/19/26 10:54 AM, Neil Armstrong wrote:
> > On 3/19/26 15:40, Alexander Koskovich wrote:
> > > On Thursday, March 19th, 2026 at 10:13 AM, Neil Armstrong
> > > <neil.armstrong@linaro.org> wrote:
> > > 
> > > > Hi,
> > > > 
> > > > On 3/19/26 12:58, Alexander Koskovich wrote:
> > > > > Using bits_per_component * 3 as the divisor for the compressed INTF
> > > > > timing width produces constant FIFO errors for the BOE BF068MWM-TD0
> > > > > panel due to bits_per_component being 10 which results in a divisor
> > > > > of 30 instead of 24.
> > > > > 
> > > > > Regardless of the compression ratio and pixel depth, 24 bits of
> > > > > compressed data are transferred per pclk, so the divisor should
> > > > > always be 24.
> > > > 
> > > > Not true with widebus, specify why 24 and because DSI widebus is
> > > > not implemented yet.
> > > > 
> 
> DSI widebus is implemented, and always used when available. The adjustment
> for DSI widebus just doesn't happen in this function.
> 
> > > > > 
> > > > > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 ++++-----
> > > > >    1 file changed, 4 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git
> > > > > a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > > > index 0ba777bda253..5419ef0be137 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > > > @@ -122,19 +122,18 @@ static void drm_mode_to_intf_timing_params(
> > > > >        }
> > > > > 
> > > > >        /*
> > > > > -     * for DSI, if compression is enabled, then divide the
> > > > > horizonal active
> > > > > -     * timing parameters by compression ratio. bits of 3
> > > > > components(R/G/B)
> > > > > -     * is compressed into bits of 1 pixel.
> > > > > +     * For DSI, if DSC is enabled, 24 bits of compressed data are
> > > > > +     * transferred per pclk regardless of the source pixel depth.
> > > > >         */
> > > > >        if (phys_enc->hw_intf->cap->type != INTF_DP &&
> > > > > timing->compression_en) {
> > > > >            struct drm_dsc_config *dsc =
> > > > >                   dpu_encoder_get_dsc_config(phys_enc->parent);
> > > > > +
> > > > Drop this change
> > > > 
> > > > >            /*
> > > > >             * TODO: replace drm_dsc_get_bpp_int with logic to handle
> > > > >             * fractional part if there is fraction
> > > > >             */
> > > > > -        timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
> > > > > -                (dsc->bits_per_component * 3);
> > > > > +        timing->width = timing->width * drm_dsc_get_bpp_int(dsc) / 24;
> > > > 
> > > > It would be helpful to somehow show that 24 is 8 * 3, 8 being
> > > > the byte width and 3 the compression ratio.
> > > 
> > > Can you clarify what the 3 represents? My panel should have a 3.75:1
> > > compression
> > > ratio (30/8) so the final divisor of 24 would be wrong for my panel
> > > if its the
> > > compression ratio?
> > 
> > So my guess is that while the exact ratio on the DSI lanes is 3.75:1,
> > the ratio
> > used to calculate the INTF timings is 3, then the DSC encoder probably
> > does the
> > magic to feed 10bpp into a 3.75:1 ratio over the DSI lanes.
> > 
> 
> That's not how it works. INTF (which feeds DSI) is after DSC compression.
> 
> INTF timings are always in RGB888 (24-bit) units. Ignoring widebus details,
> the INTF timing should match what is programmed on the DSI side (hdisplay,
> which is calculated as bytes per line / 3).
> 
> (fwiw, the current "timing->width = ..." calculation here blames to me, but
> what I wrote originally was just "timing->width = timing->width / 3" with a
> comment about being incomplete.)
> 
Okay. After reading the docs (sorry, it took a while).

- When widebus is not enabled, the transfer is always 24 bit of
  compressed data. Thus if it is not in play, pclk and timing->width
  should be scaled by source_pixel_depth / compression_ratio / 24. In
  case of the code it is 'drm_dsc_get_bpp_int(dsc) / 24'.

  For RGB101010 / 8bpp DSC this should result in the PCLK being lowered
  by the factor of 3 (= 24 / (30 / 3.75))

- When widebus is in play (MDSS 6.x+, DSI 2.4+), the transfer takes
  more than 24 bits. In this case the PCLK and timing->width should be
  scaled exactly by the DSC compression ratio, which is
  'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component).

So, this piece of code needs to be adjusted to check for the widebus
being enabled or not.

> > In dsi_adjust_pclk_for_compression, the pclk is adjusted to take in
> > account bits_per_component,
> > so I presume the actual DSI pclk _is_  timing->width *
> > drm_dsc_get_bpp_int(dsc) / (dsc->bits_per_component * 3),
> > which is your 3.75:1, but the INTF needs to generate timing->width *
> > drm_dsc_get_bpp_int(dsc) / (8 * 3) pixels
> > to the DSC encoder which will emit timing->width *
> > drm_dsc_get_bpp_int(dsc) / (dsc->bits_per_component * 3) pixels.
> > 
> 
> The hdisplay calculation in dsi_adjust_pclk_for_compression (which only
> affects the clock rate) seems to be wrong, and I think Alexander's panel
> must be running at a 20% lower clock because of it. dsi_timing_setup has the
> right hdisplay adjustment.

That function also needs to be adjusted accordingly. I think only the
dsi_timing_setup() is correct at this point. Note, widebus / not-widebus
cases should be handled separately.

> > In any case, 24 _is_ 3 * 8, 3 being the DSC compression ratio on the
> > INTF side.

In this case DSC compression ratio is 3.75, so it's not true.

-- 
With best wishes
Dmitry

