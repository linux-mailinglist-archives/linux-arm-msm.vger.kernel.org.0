Return-Path: <linux-arm-msm+bounces-117369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Eu9MOcrTWpswAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:40:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 131AC71DEE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:40:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="MiYr/TPI";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y9VKBHVV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117369-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117369-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80840300D4EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 16:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82098433BDD;
	Tue,  7 Jul 2026 16:40:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D92C181
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 16:40:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442405; cv=none; b=WtuaBbuLNG5XOQldqp8u4VAn14YigBo/s2rw3x/IC+d3eVAWEDOD8iU8KwuJK934x4lXh6v/BO+mL7oIw9AVi4Ve/gTPWf8PI32yKe5taF8W/SaXnynZgLAbQSIRAXm3/7/z3v+XYGt14h3MkzGjBRTvV4yCmyEApaPfY5J4zwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442405; c=relaxed/simple;
	bh=1XRsvNIGdAMhpe6h6Rmr9ffQO30RuYSohh6zIGmdAfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcsuamTpKVDNfMnIC0yTRj6yh8TkJ2YHFEHQZv6u7nl8QzlNmx6shT6GtQGmo6Z0cQoK1L7/oFYAz1iqLZRozVN6bDScXe8YmUqxDZdf/lf6cvB3JIAviZa0EE1gfvYv1HLOMCeHPmBGREnKTOfMracdeRGPuFPqKcjyULGzNl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiYr/TPI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9VKBHVV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTGgp029968
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 16:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ngMJFXW0MVpSyT9cIuB08wDD
	gujyroBQVzUzKlhc52Q=; b=MiYr/TPIV1tgnI2ssrts3PiyItGY+zxGj8RBOb/N
	1US8orSQS1Kqkf5lDLxiYel8uxWhE1agG5lZh4l9NrQ1+3s3uU1iu/VQEr93MVLy
	hLqRCwJEW2fTBgHh+GNsCmTRW0NE+TllBeUgadAL6gokqzklRbdaJk/4GDfpKVaS
	GHputQFD0WBQhDtgOgcQjtX3N97uCAAqy2nFq2EYtzlm1iqSm/Qqzu8Zs24Dk0Fx
	qg0cPK8IkgftVeeByYZ39VmtZm+mreJ4g+8P+NdkDKHnkoDGrdFPyJKu3opDXq/4
	EQnaEm8R8JojofSQZN+MI6uHIH2aGXhvJf9hoINEC8deWA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj7bgwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:40:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-739a588fadcso1100362137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442402; x=1784047202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ngMJFXW0MVpSyT9cIuB08wDDgujyroBQVzUzKlhc52Q=;
        b=Y9VKBHVV6OtObTeC8LPoa/cxQ+VYxkrzQhByh5Na/rOr591GMouVJjQaOf730Q1pPP
         QYeTeF0nOhiF4OEkQb/VF0V3dz8YJEDScY5/N5DclTEI6UvyQdCNJpGMy4Dgm3qovTpN
         eZSSC7jwZZSDTvieLMTcO+EdKGUK0rwQUzo8khXIgFAaSpSBwMAhXrs+cnHd3x+1EgPY
         Qkyg2lCP21TIF/qSi9wyBUYDqM8nJkZmQ9xWQ7/4TT3Bk7mCJez/zMjyolBlQjR2BKQV
         Sj3kZIUBIEPl5++LsWsBpDm7uXUcdDCuHPqTh4fK2Fx1c1ePUvo2s5rGUDTamJCHPq1x
         yWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442402; x=1784047202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngMJFXW0MVpSyT9cIuB08wDDgujyroBQVzUzKlhc52Q=;
        b=d7dm6C4i7qGTP8ohPQgMm+3DejNob7h+Fauq7/2N23hrV878pEFu3xNNUdi4oqnd8l
         FvBoo/jiwC9JTWeTHIveCH+Xwa19SVtMdK+3k4osSxNKKwqk76q8Ly7Pm9f5Lp+5O7Gq
         guov4/loVdquWCQ76/zLffUcgf9HavLWFFfi3g+F7BTYhI8/D/DChnFoQnplul7Sm/W3
         mVib+m6Vm2MTDVx4OgmzherFcR62sTCoj8QgNvN3vQmIST9RFqLlLnUFS/0cWOC+AzZC
         VjH/CYA8hJS01pxp3ug6WwLF15NizbPF43K8kFD4r8eUoW3Tzlui8mdF1FDpX2/ZyaPu
         QSkg==
X-Forwarded-Encrypted: i=1; AHgh+RoKEB/PJFVs+RZ0V7ND/xVSzLi3hL/+EtmRXH9KcnqJUdF1o4PjA8rcIUqjjx82/T/XKOICLMspYO/4/pbW@vger.kernel.org
X-Gm-Message-State: AOJu0YykMUPShIVuXmgJf1RiM+SGPD/snrYZPCgdsUjHq7NrLa7gth+Y
	Rw9j+wZm2lXRzmYf+ZMIpM/StdvpwDfnyVfRCaVRmzmT62pKcQxaCn2Xv4z5Rw2Gz3EK4N1nitD
	+asC+l6i//SOBcNbBe5kYLMVBO2taJC1lxJUuzn4ZDuFyI4/B+zvk69lei6mRzh6+5e1A
X-Gm-Gg: AfdE7cnF+IM68oEiztpTMeout9GPc/bs3s7a39eCXDcE9MVzkocxAGiqn2peo9S7Xpn
	FxsVvQaj/4Eweg7X2L0aYK03YFFAw1gP7Xf+W/Sw9pDc7uBj9gmEZvMNOdTijAKAe8gVKu2dF7C
	5pl2uLDb4TCRyKA9SC5efg8GsMPRLBM9LAEIm4XTMtQQesMvqq1NuKGFNzam9MwS9SZUt5qkj6+
	M+tRxOueAVpfypNzbLOauYZKEnxLPMguzvs0T8jP9q26xB5yx4eNGUoLHzB8loMak3mkb6GnXzU
	z3B8LDkYtNv42eA883SFGefjBR8x00IRCpiIiLLEE3zUCPYWrrrXJLgU8YVawUJd7I8RCEwkFBf
	XOMbV336v6bG2iEzCgiM63uP2XTFQm1asP2qfOc25TKxJE5Qdw8U5kYuurESSD3l47KS5VJfshe
	k5Y8hG33tNpVvzCInoi49aigTU
X-Received: by 2002:a05:6102:5f05:b0:738:be7b:add3 with SMTP id ada2fe7eead31-744b7ade412mr3295744137.6.1783442401884;
        Tue, 07 Jul 2026 09:40:01 -0700 (PDT)
X-Received: by 2002:a05:6102:5f05:b0:738:be7b:add3 with SMTP id ada2fe7eead31-744b7ade412mr3295690137.6.1783442400917;
        Tue, 07 Jul 2026 09:40:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb3aasm3792026e87.53.2026.07.07.09.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:39:58 -0700 (PDT)
Date: Tue, 7 Jul 2026 19:39:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Message-ID: <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
X-Proofpoint-ORIG-GUID: 0a27oxlwkPCI4eqqK1tV_ldFDXOY8U2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX5UsDb4A3q32G
 W/biCycSz9aZiZ8dfwb0dsepDnMb8aW8bDTlYJayhDw8h48u8uuQ6ieTMnKluipZqHqAvPwMNC2
 g2MpY4X7iVaiPLTPMagnvQNjmqRdlKU76CEJWTza4CSUbBcHKKdJZdYfITTCpQwloocvgd/rS2F
 b0nsSeXUu+54clM3GToOr8RHjgyuzWvLN6rbotkvv8qmwfmiGnEkwvp6b+kf0OfNIpqgUH2U/gk
 T+FgPt9W+C1uYlCLGQ5+zl5h7gmwCK8kYFTs2El0CjQJ4T1XeGy69jONrDLY3a1SulDbTc9Fs5m
 EMAimhFdtNC8qCH3jv8KGLEaWWFFzzttfma6orzlxjw9cEulIiU143yyfMnQmZaR+sg9eKvP6ug
 izHTSdvUf2wwoxGi96r41lEM/pw1IkbQlcve/CoNEhBylkky7ESRhC5LfgrAlnOcYgLdmjhbEyY
 X9hpC5QMEdYYkrCRtJQ==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4d2be3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=1fOCVGvR8NE8L1w4xeIA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX7ez8L5qqPPIH
 BCBoQY5pSssne9M3Y/LVg6O3Q5OsIV9Hv2HGrRnbWrH5R7sg138bt7mQggwl/HeFhcVYLVKvs9b
 nRjL9MmaVsNA/KzKbmdCxOIz4f/km+Y=
X-Proofpoint-GUID: 0a27oxlwkPCI4eqqK1tV_ldFDXOY8U2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117369-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,u2d3dnvl2phy:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:anna.maniscalco2000@gmail.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:annamaniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 131AC71DEE9

On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> > On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> > > In order to associate the SID used by LPAC to it's own domain and
> > > context bank we need a separate node on the DTS.
> > Can we use iommu-map instead of adding a new device using the same
> > addresses? You provide zero explanations, but it seems like you are
> > trying to separate a part of the GPU into a separate device, but it's
> > unnecessary.
> 
> What I was trying to say is that we need to map sid0 and sid1 to different
> context banks.
> 
> From what I recall, so long as we use the same dt node, the iommu drivert
> provides no way of doing this.
> 
> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
> and secure.
> 
> The address on the lpac device doesn't really matter. I have very limted
> knowledge of DTSs but I think we could just leave it out altogether?

I think, you were poined to the Glymur Iris patches. Another option is
the QDA driver being submitted too. Both ot them use iommu-map to
describe the same usecase - a set of SIDs which are used by the device
but which should not be a part of the defaut set. With it in place you
don't need to have separate qcom,lpac devices, no additional properties,
etc. 

I'd recommend following the same approach.

> 
> > 
> > > Add the code to look up that node on initialization.
> > > 
> > > Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
> > >   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
> > >   2 files changed, 21 insertions(+), 1 deletion(-)
> > > 
> 
> Best regards,
> -- 
> Anna Maniscalco <anna.maniscalco2000@gmail.com>
> 

-- 
With best wishes
Dmitry

