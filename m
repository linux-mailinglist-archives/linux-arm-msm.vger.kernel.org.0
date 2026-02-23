Return-Path: <linux-arm-msm+bounces-93570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sjveJwesm2kF4gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 02:23:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7271714CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 02:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC66A3019468
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 01:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00E412F585;
	Mon, 23 Feb 2026 01:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ud7048ej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a49xyR4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A827781AA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771809796; cv=none; b=pM68zWIPmQ9iF7hAGF+L9prihjMJ4Q0KC99DpNTbGswaFps7LDwMO8/p+Z6QxBB3kmrqOwfeGh2sS7Vb2tGwVkxVF9q5x136RkurrH6hyqohwgdujAQkEt1feaDn4hF3wiWU0kjq+p1VBlGQt6CXesjWH/BZH87fQWrX2ptKExc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771809796; c=relaxed/simple;
	bh=DYo4tYjgfxycOgdc8/cxP1OkA/yMae4ZsLKLUld4aIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTp5un8XP/FfX7s7XqN6HZvPQo1x5Ko3a0B2mZsE+nbVHqUcnSQHF0HbtUBhT2AEnNRrwaCGeOfavHhUkOCrS8ZWQ5ewM89P9wNgdY9PbqFcg7RJT9LtkK1pBIdtqzA2PYXkKVhk8T9CU++WTKCan1ajSFe/whSTiD3J2FqHOeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ud7048ej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a49xyR4m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKPLNo1710276
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIWV/5G0cokkb/ZR19QELLZ7l/8kTWWB4xWhDTbzvGs=; b=Ud7048ejNeHA4vkx
	dBfiqeKBe3ezm5lg13+EriNcftbqRh2pNfrtbDX0xRWSH9giXlonYlx4MhbCzJqm
	Tf1ZefGJxA78yDCLulCwRkOCmbhJY8hISgzm+fCyj7t0JjbzzalfJ/HJtHGO9rHJ
	zQMbntVc5jPeuoskFC8dT+6pGRdpObX0/RSAye0f5yDSLBhDVuOdKMam+m31gmH0
	cuPJEoXzwHTw4HUnxv4Hub197Zndup7eE7MmW6S/6llMYeKjQ53Qsc9i2PjjJKa5
	3UVo+8laPmWcCWwvyfphKneIam4tGj3+4kmH9j2Stl1LDejXcaW1thmuddm4IJ0H
	G3dAfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wau2ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:23:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so522191985a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 17:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771809793; x=1772414593; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LIWV/5G0cokkb/ZR19QELLZ7l/8kTWWB4xWhDTbzvGs=;
        b=a49xyR4m/0kfpIOUoQriC1oEwhxZ8+rG/N5U8PWqcbVvbsRSikMIt5xg+9tME167fm
         J/cNhxDlYxB5pRvIdqKH0r9KVKE8LNGEtXVS4e74zEs6dmrG4Kryz7B6wGltk31jkKJV
         2f8P+Vfrabs+CE3YSVUnifeEjGUYZbI5Je4u+Esbe7XmU+UYMfjKROYovBtSE8CDAY/k
         7o2TJAHagNubZ67y7ZRwIqUCIKORqKlx4W6Tjfzr4kXIGY5VhZT07NjPzFIGw2SFaRF1
         CCYLfGeZmoeCqVo4y3OQsCNlttfykNx6PcZzzmr4xgXPv15EoC83KRt1AWDnfy8Vlrrl
         BXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771809793; x=1772414593;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIWV/5G0cokkb/ZR19QELLZ7l/8kTWWB4xWhDTbzvGs=;
        b=FBEwav5Kh/VCBfuW8UqN8uh5xYH43nB82GRggYMN6aoX8nDdQoi7HMVxgPhy6QDbOe
         E5k+yOfIVQcuv/v4dPns7yF/OD194HOCpQsPHWL+H6smiCmlT1g+aZKfzwJXQY4q3d8y
         Z3XUFUlHWE0zw/AyWoXZJriwoNxiZWnKy8xWwCai6ohZ1umvYNFBQJ77pphTp5G3QxKK
         gbteUuJIavji7YeWm+Gs1Ewh0vysF91AOK0hNYA+XOzV2j6jkYTDgDjINZEdSDt/vnDM
         9eNGWoRlnBxKmDRivYWMft6Cg5pFi7JtUMrGlNLAn6+kLxNZOQgPyucPHcmOObZ1xydU
         YMqg==
X-Forwarded-Encrypted: i=1; AJvYcCV0WG+lwCxp/Ucv1CFz6wVPvYXZzzSsnBrviBEwMPHm5oycqURqVR3r/nj/i1peL8zii8afepXB8V0EKIQq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2salbQH5nbl/+J4bG9DwuR4E39rOn8KFdCeDV4NW1NcN7N9o/
	xEy/l4sWdqD+54PH1wO73PL+Klfx7wAlwEV36QhBBuTzf+5cKC90a0a9xHdZDMJxNDPk11OEMKm
	96yeBeJfaLVTimEVswSWwKCWbIKTTyULcIABzeyXX0EcxOhJ+YXnX1Enmrk6lT6oOICh37wukp1
	Z0
X-Gm-Gg: AZuq6aKoMNSUtexs9ZzCsn5fXKd4DIomD2fsJ8hO6ggQyzmwDBvtFvjHvb9lIeycbuP
	PwSRMhbEtH4mrFQL+8e6T5gUBtojph59c/tv1dkrLe9GDtSkHfreb7u3rWJ/U06igKwMwhB/y7k
	Tz8yM0MX9hc9ZtyK0ejUF0VnJkAlknBBn6iQbPY0JSLm4jqawONMWyUPbPhi3ukSoX5vMTxBoJP
	uR1WjSz9IHt69Lf7aPiGK3EN9nNFkwIDf7fRr0JjxDdewg3OVvrVB66G/ikKjaWg3YutOPtpR1g
	T4B0xSCw4gk8le53/mkCgo7S4EA8uuWRtV3Kafx0f8B/nd2beQy9vHO09iVr5H5ns5ylb9cVccA
	IGtW+D4TuL8oHEQIjn2WZOeNoDY/UBZgo1yhsygH4iE4AjVFmgK7vo+RCYJFOuAiFTSMRP1IjEs
	YBmoCo5dngRcNl0KOVqe5H07PeE3B485BftJk=
X-Received: by 2002:a05:620a:1927:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8cb8ca656ebmr956475185a.53.1771809793533;
        Sun, 22 Feb 2026 17:23:13 -0800 (PST)
X-Received: by 2002:a05:620a:1927:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8cb8ca656ebmr956473185a.53.1771809793036;
        Sun, 22 Feb 2026 17:23:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78d2326sm13184151fa.15.2026.02.22.17.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 17:23:11 -0800 (PST)
Date: Mon, 23 Feb 2026 03:23:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        =?utf-8?B?TG/Dr2M=?= Minier <loic.minier@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm: add missing MODULE_DEVICE_ID definitions
Message-ID: <hpvt4dv3id6m26i4wvgngh6u553oag2vqc74anhs3q2ud57aqr@khrcib37a64d>
References: <20260219-msm-device-id-v1-1-9e7315a6fd20@oss.qualcomm.com>
 <d3119277-3205-49cb-81c6-1b12d10c5ec8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3119277-3205-49cb-81c6-1b12d10c5ec8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699bac02 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NFef1q2CqZPfa1XFr5gA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDAwOSBTYWx0ZWRfX8+UOnH6Kz7h3
 LJ9BNHKxqQcAwcqwhSXSAUvjHlC5dHUrLsYo9LKTKuOJvRlT/QCkWWdoBc1FSIuoq2LwuhylJFS
 mo6pNV3uen9FjjpVRPfV2ROUmAiSDbfZLMdZcR0V+54voybjLMY5AbIGJu3k1Upwrwt437zToZx
 P7w+A70VmaHxxob6rTeXgQ8RR/IhZbGAmprR2m2qtPrR2glWgFkT0kgiRfxTmLnb6w6mj5PEB/e
 aIso6T/k8Q/mGPnrrQBzbOiwuOxVA1QfD1qwF1x8q3kqxyL889MrBS3GRU9Gxm2oZTE10W7T3Yp
 PC91cpmXDlZeiOYBdSGh1Hw5FT4fa9WsVqlYzfSf9TyekFcrEFEL4OP+nsDXA6Knvpt8NL4aqZc
 Itrlua1hhOdeU8GPoI7QrLBGrFRzYkN63tbgkdZOnLuLimq3V+8PO8RiGPIo7xOGsP0DLANHOWV
 QD23C/NC9E9mhJAWimg==
X-Proofpoint-ORIG-GUID: YmsARslvlcJBBFts_u93nq5p2HF7KJQB
X-Proofpoint-GUID: YmsARslvlcJBBFts_u93nq5p2HF7KJQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230009
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93570-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B7271714CB
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 01:12:15AM +0530, Akhil P Oommen wrote:
> On 2/19/2026 5:49 PM, Dmitry Baryshkov wrote:
> > The drm/msm module bundles several drivers, each of them having a
> > separate OF match table, however only MDSS (subsystem) and KMS devices
> > had corresponding MODULE_DEVICE_ID tables. Thus, if the platform has
> > enabled only the GPU device (without enabling display counterparts), the
> > module will not be picked up and loaded by userspace.
> > 
> > Add MODULE_DEVICE_ID to the GPU driver and to all other drivers in this
> > module.
> > 
> > Fixes: 55459968176f ("drm/msm: add a330/apq8x74")
> > Reported-by: Loïc Minier <loic.minier@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > The Fixes tag points to the first commit introducing OF-based GPU
> > matching (and thus possibility for the headless GPU binding). Other
> > are not usable without the main MDP4 / MDP5 / DPU drivers, so they
> > didn't get the Fixes tags of their own.
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> >  drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
> >  drivers/gpu/drm/msm/dsi/dsi.c              | 1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 1 +
> >  drivers/gpu/drm/msm/hdmi/hdmi.c            | 1 +
> >  drivers/gpu/drm/msm/hdmi/hdmi_phy.c        | 1 +
> >  6 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 554d746f115b..4edfe80c5be7 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -302,6 +302,7 @@ static const struct of_device_id dt_match[] = {
> >  	{ .compatible = "qcom,kgsl-3d0" },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, dt_match);
> >  
> >  static int adreno_runtime_resume(struct device *dev)
> >  {
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 476848bf8cd1..d2124d625485 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -210,6 +210,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
> >  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, msm_dp_dt_match);
> >  
> >  static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
> >  {
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> > index d8bb40ef820e..3c9f01ed6271 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> > @@ -198,6 +198,7 @@ static const struct of_device_id dt_match[] = {
> >  	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, dt_match);
> >  
> >  static const struct dev_pm_ops dsi_pm_ops = {
> >  	SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index 7937266de1d2..c59375aaae19 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -582,6 +582,7 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >  #endif
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, dsi_phy_dt_match);
> >  
> >  /*
> >   * Currently, we only support one SoC for each PHY type. When we have multiple
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > index 5afac09c0d33..d5ef5089c9e9 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > @@ -441,6 +441,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
> >  	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, msm_hdmi_dt_match);
> >  
> >  static struct platform_driver msm_hdmi_driver = {
> >  	.probe = msm_hdmi_dev_probe,
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > index 667573f1db7c..f726555bb681 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> > @@ -204,6 +204,7 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
> >  	  .data = &msm_hdmi_phy_8998_cfg },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, msm_hdmi_phy_dt_match);
> >  
> >  static struct platform_driver msm_hdmi_phy_platform_driver = {
> >  	.probe      = msm_hdmi_phy_probe,
> > 
> 
> https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> fwiw, there was a related patch that I posted recently. We can drop that.

Ouch, sorry, I forgot about it. I'll pick it up and then apply the rest
of this patch on top, adjusting the Fixes and commit message.

> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> -Akhil.
> 
> > ---
> > base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
> > change-id: 20260219-msm-device-id-84b95d22c0b0
> > 
> > Best regards,
> 

-- 
With best wishes
Dmitry

