Return-Path: <linux-arm-msm+bounces-83080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09523C81106
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 15:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5862A3A4E05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 14:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD8D271456;
	Mon, 24 Nov 2025 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQhlgXhb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqkABjkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F0E14B96E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994902; cv=none; b=kFJHEI30Tr2YLGHUXSGnQvbA3/w9awk8dRDusehJlJ04U/0wqEwv0DHSMUyLOYvqrvwUxWu9Cqi7OZppioaV3hhx/dA/CC0teTQQ1LNXGSqAkzu88rKknerECm75NGKh0sfxrG8Esh5eRsoXqIbfJc67tlOVZesG7YkD5uxyN+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994902; c=relaxed/simple;
	bh=YuXTblfA5NTX74Sznhyke7LKxxTrrd1R/1FB7J7tf6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqaP72fmAkNzznUcdRpKrVGwwNzAH8Aea4AuOaihvUqYRn7GXBqt7ffcmQrBS3JBR+yV9EEqg6loeEVbiYD+zUuUGhNnYTMDSGQ46joe2m9KNI7PpMw0e2JMtcsjskxfrqYDKzG+kgS5ZEEiP/JX2/1M0/34wBeDsAlMSQz9cD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQhlgXhb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqkABjkb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOB381O3884734
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zn1ySOe6Byh/9PRZkzUMYzqR
	PVFn4sNhD9BZkVhXgqI=; b=HQhlgXhbsC7tr3vgXrZoPRMwrIcIqvXjG7B+fl8z
	N/+lMYO8WITcZQQGUcp8mv1ceKWBOKqGeE/u68BhoLcn/5EoYfqhG/ira8Z2HTi+
	JFP0COdlKrhtSI89eO8yk7BqnMoF9+8ccAUf1yKcdzYoJlf1fUXUjnDj1pbFZy9Y
	5OvE/ksW3aq4OQWdCpqqD/A1FsjtP9q5yjyKnqLTl1pK4FEGE3jWGQ47cWWQssZ1
	dW53e93hWrpZiWHVxmNn0VfJDJ4ERX82UnsQVpqc3QP2inUf1Y9m39uYt4B8BJ2n
	xi7RqbxU9K+WgttD8eHeeVjZpw9zfFQUrc0/RyBSwvbcMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp568hjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:34:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so183444361cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763994899; x=1764599699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zn1ySOe6Byh/9PRZkzUMYzqRPVFn4sNhD9BZkVhXgqI=;
        b=kqkABjkb0lZpgAuvcNCHChodV9gWAvjUd5EiRifJ6HzwLrYCBCNy1nsPAG7Xzw5ca8
         jfBGZRvpeFV3OeM83v6iynEMgFBIxwA/p1OcqHE33DiLO4kVM2Nh2SsaWaGsn6Jbyq9J
         dicSzGn7b38zTib1exqRKKEc2I2cXEHr1T62fvoG7ozs7UpWAqYESzhPFLkbjVreocG6
         83JwIfWnZaQpPpZtxRN3+vGKo6ahpOue+TXXLyY0IkT6Xgmu782ZUbAnomC6bQKP7Jl6
         DdSqFXjjDYQSiJiqxnCe5nOlS/tvNXWt5xOveNTyIKtLEGEeEQCjxwx+bBz6bdXloEz9
         IwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994899; x=1764599699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zn1ySOe6Byh/9PRZkzUMYzqRPVFn4sNhD9BZkVhXgqI=;
        b=DG5t4BrN+ApQvZXUaN4zye+gELdVdM7ukXgxWxZpRP04XX/V4BEfhrYtiENCBQpfOY
         RY0ib6V9CmMBVTVlTiizFTnqHO++gHPcsJCuwmNLBkTYZSdmcrvxFYUia1Fq/kvgE5By
         ZV35MmJdgD8HTMNpEakn4dV8eoEK0neE75Uh3F+3AgDiym8lEZk7yJtJS/ZVRLW6yFbL
         t2nsiamImGXSzZk3BjLK6jvVDpn2oUsE5Xv/lFOXICnpkDHYasTFE6XlepleqjOaXaD8
         /hxls0UyCUE1fvjryfSteA/b3PebZytGIGTn7wZtrfTTpMZfTHu5KK31hVtYL8LW7nlp
         HDDw==
X-Forwarded-Encrypted: i=1; AJvYcCVQWpdNLenNDGwru7cvCK34rwramDa1GkEe8zb2UQGGfjZiic5r6Oo3X4/D6Z8N9mqsba3oi5BdwTY3w30M@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJFny+OXYsuBiWb0e+vixiRPeqGtqA3vSAq1B6hzvaLthur3W
	P476eHOGT/vTbbSr1/3TNFVaOqM8cmWyCvB6c3pBcGw3bmxkoSnbwJHB4G59jzkKn5qhFRHiPuy
	i9nWIJfFpQCWo0Jd5dxPVXfr01ZQ/ynGvRafgX586f6Eo4btQP691ly12oa86aDpwzTkX
X-Gm-Gg: ASbGnctYlhS4Rx77J2YzNGBvm6rGLDJlKWXaEjxeWU986bIsDQPCgPK7QN4BYJxTdOS
	GlBeibz7MKa0PGG6VB1YZp+kDKD+S5yfvYWHA401I/DKruRfa1t99L1OTp9XBsasAO9ukxugCIC
	QH4+xYIenEp+m3Jb2Tn8813XrHDav9EHCgzw8krs5haQ4ZGSPqco/Vd942OlrHDxDVOYrANnrbS
	NPMgJLmM5iBrarl7+l2sSHS3y6QOOEPVhP6P7A6QP6tyDbwtusRlDgol6uzPpqyNUkkiQkNqPMU
	VIRqQFc92T52YJmTX8H0dsfBdx+jtFEcA9lWZHmHBWVcmoxF7iHpT3koZov07sU8fyLg4rLLRsm
	Wg1Tm0rs4KqpJ3eJQknxl+ixP17Qo/+bFHbPZ4l8sv5Tn7p4g1I5varnl1XjS8FIl5/xI0do/M6
	BCOxzqb+wIf9DMM54mfohm158=
X-Received: by 2002:a05:622a:3cc:b0:4d2:4df8:4cb5 with SMTP id d75a77b69052e-4ee58a445b5mr187001791cf.4.1763994898754;
        Mon, 24 Nov 2025 06:34:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsvFkvnisiXad/8yuRQokbbLi0sqsZdsu0kXS9a46eRqjHT7rOlNQF8coWzbKzpfg/LL9DoA==
X-Received: by 2002:a05:622a:3cc:b0:4d2:4df8:4cb5 with SMTP id d75a77b69052e-4ee58a445b5mr187000931cf.4.1763994898055;
        Mon, 24 Nov 2025 06:34:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6baf9e6sm27547161fa.26.2025.11.24.06.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 06:34:57 -0800 (PST)
Date: Mon, 24 Nov 2025 16:34:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
        wse@tuxedocomputers.com, cs@tuxedo.de
Subject: Re: [PATCH v3 0/7] Add TUXEDO Elite 14 Gen1 (X1E78100)
Message-ID: <tceqigutnu6xqlprxbbm667szlnfwlhfgzxxroj6xldupk2ejt@4izqdv22rmku>
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
 <af3d3295-1340-417f-8682-7d7e2bc6c812@kernel.org>
 <aSGXu7IhPDNSkYhi@linaro.org>
 <280982b8-ce86-45aa-812b-ef1bf6e57e3d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <280982b8-ce86-45aa-812b-ef1bf6e57e3d@kernel.org>
X-Proofpoint-GUID: N0G5x2BwRhLQzAn2kq1jPRQfWk1PuWwM
X-Proofpoint-ORIG-GUID: N0G5x2BwRhLQzAn2kq1jPRQfWk1PuWwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEyNyBTYWx0ZWRfX9pNf/c2t865Q
 trTKG/7znvgfxBzB7JotTh9+G5A7uWOC0PN3ycYeIve1HcDw3QXMZJWU9iVF8UpUb0sQPd7fzZR
 yaf4iaHysbzpZvKRfZ4sq4bB7bb+82LFXBwjnKBx8P3iQEM2ePwsZtvOGMzYNZ2eLUdFPCnxtKw
 DER+r6u3MqqLvy3ekx5rsdC66ac89MaZuuEsZWZndxYjYACp0ow8JUgAKRYt8zNXy7BK0JvLk+v
 XzfuOvsNez+2NpETpXS3OKDri2Rm0Y58kWnQ+EjaCqtNSb8os0Uwz6Q5fdhJCDLB2jrEh5cOZkV
 Ct83gYXEOotNTYjWMcOVKTyXk0mM6P2BbxBRAlNCHSGGEjQkFFh1AsjyX4fFID2DGRguvZ4bHKU
 Xgl42XvKaXX/F4/Q6VQSEMqP+Ni6XA==
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=69246d13 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ZGtfkgJT45ulUFgaLlIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240127

On Sat, Nov 22, 2025 at 12:15:40PM +0100, Krzysztof Kozlowski wrote:
> On 22/11/2025 12:00, Stephan Gerhold wrote:
> > On Sat, Nov 22, 2025 at 11:16:25AM +0100, Krzysztof Kozlowski wrote:
> >> On 21/11/2025 15:26, Georg Gottleuber wrote:
> >>> [...]
> >>> Initial support for TUXEDO Elite 14 Gen1 laptop. It is based on Qualcomm
> >>> Snapdragon X Elite SoC (X1E78100).
> >>>
> >> [...]
> >>
> >>> Because the SoC is now outdated and some functions still do not work as
> >>> well as customers would expect from the TUXEDO brand, TUXEDO Elite 14 Gen1
> >>> will not be offered for sale. We would still like to submit our device
> >>> tree to the mainline kernel and thus contribute to Linux support for a
> >>> compatible device sold by Medion (SPRCHRGD 14 S1 Elite). At least in
> >>> Germany, this device was sold in many large stores. (An official press
> >>> statement will follow on our website.)
> >>
> >> For me this is unmergeable, because we do not take stuff which no one
> >> uses (no one can even use), and I am sad I put effort in reviewing AFTER
> >> this was known to be cancelled.
> >>
> > 
> > I don't think we have any requirement to have a large user base in order
> > to merge changes. There is already support for plenty of cancelled
> > products with only a few (if any) remaining users in mainline, e.g.
> > 
> >  - Snapdragon X Elite Dev Kit (x1e001de-devkit), shipped only to a
> >    handful of users before cancelled
> >  - All ChromeOS SC7280 devices (including DTB variants for several
> >    revisions of pre-production samples), never shipped to anyone
> > 
> 
> I discuss here the timing primarily and I don't know the timing about them.
> 
> > There are also plenty of internal reference devices that only a handful
> > of people have access to (MTP, HDK, CRD etc). What makes these any
> 
> They are still "maintained" and "offered", even if only for handful
> (like 3000 EACH variant) people. That's the amount of board of each
> variant, e.g. MTP8750, and all of them run some sort of Linux, even if
> downstream. So sorry, but 3000 (or whatever number it is) is not handful.

Where does 3000 come from? The Bible says 10 people were enough to
maintain Sodom and Gomorrah. For Herobrine we know that there are very
few people still using those devices (maybe less than 10), but we still
keep it. Cheeza was dropped after it was known that the count is exactly
zero.

> 
> > different? Ettore has been actively testing and contributing to the port
> > for the TUXEDO laptop, so if he wants to continue that, I don't think
> > anything speaks against merging this device tree.
> 
> I won't be maintaining it, so not my effort in that, but since you speak
> about that - maintenance is an effort, thus I decide not to spend it on
> cancelled products.
> 
> > 
> > In any case, I don't think the time reviewing these changes is wasted:
> 
> I am happy that you do not find my time wasted, but I disagree on that
> because knowing this is cancelled, I would probably not care and review
> products which are not cancelled at this time.

There still people owning and being happy with those laptops. It's
Bjorn's and Konrad's time being spent on maintaining those. What's the
issue?

> 
> > As Georg wrote, there is also the Medion SPRCHRGD 14 S1 Elite laptop
> > that uses basically the same hardware design. I'm sure there are (or
> > eventually will be) users of that device who would appreciate having a
> > fully-functional device tree ready to use. There is an open issue in one
> > of the Ubuntu repositories for example [1] to add automatic DTB
> > selection for it.
> > 
> > In other words, even if we decide against adding support for the
> > "x1e80100-tuxedo-elite-14-gen1", the same changes renamed to
> > "x1e80100-medion-sprchrgd-14-s1" would still be valid and valuable.
> 
> That's why you send such patches with RFC title and FIRST (literally
> first) explanation in cover letter WHY, so people can decide.
> 
> > I wouldn't expect any other changes to be needed, although obviously
> > someone with access to the device should confirm that before submitting.
> 
> You still cannot apply my review to that other board, so still wasted
> time because I would need to review again.
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

