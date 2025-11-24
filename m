Return-Path: <linux-arm-msm+bounces-83144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF9EC82D45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 00:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2917534BC3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 23:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D15F2777E0;
	Mon, 24 Nov 2025 23:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTeFSQCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrdmlG7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AEC274659
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764027726; cv=none; b=fLU6xiueYUheRJWlbxcTxmuPLHr/jwC2ADHZSvNkY9j82LQyqp9K7I2ZF3WakgrCDxloM7xO8EBh3tWcNuR9Vxn0CDRkguAmOjjMAB8ENxFtZEREhF9x+YpQyAE+We5vptn9jVnC+yhFgav0e9QZ5J/Rrl+XjEIq9y/EuhQryoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764027726; c=relaxed/simple;
	bh=kk0tPV3mHmCi59wW0nMku4WD1N4OJNP402FeCin8WfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcnLtanPm+NzBQsPSwcNGQ/9qW7BmJOSH4sz+T5IwcMkE5CjhsO1BrFH9rOdDjt5NjKYzl1tIvBQNI97K7GCkEQ4CCVSmyH8fhDLyT+iO9mNNuaLHTgTCo0wBExeHP452ScgitJjndv5b4RdG7B6O+anjy5c0Ek3TAzzDJ1PCsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTeFSQCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrdmlG7E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOJs8Q21126825
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 23:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RnvtIigtmuFi+SMEGrDr8fGe
	6ral46dzE9aXYnwhprw=; b=FTeFSQCwGjvRUvrhVLskjr6Pg37HRVT8dSKrpLuY
	jRMfVoOsE0OLv9hFno9mvxqeNUJOS7Ih5rwenMfKbd+JRS1M1nqe461E1s7/2tEc
	OQxVBc15S6OnITahLsJkC4H/1zuVZy8mnpY+O4Gu358NvI444DDbtU6JmY9orLub
	XQ4gA33VXeeZhDRNz6BYH6ycODu2LFHyAD0V+Px+i4Qj9i+QGHhAsQzwojWEpLMd
	K8hTR8bTID0vfHa1x6fyZ7xIts69U+cYkH4rXVP30jPeSXubr0lML69u3egqqnBB
	pz3vBld2nQKSrtvTn/611X8k6Ybn0wzkuQPhylmPFBQfTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amw9grj1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 23:42:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2dbd36752so1286989885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 15:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764027723; x=1764632523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RnvtIigtmuFi+SMEGrDr8fGe6ral46dzE9aXYnwhprw=;
        b=UrdmlG7Eq7M+KREdX861tqVN2+6udoRgB8wsvenhZBqeOI0O0j9BTW5E0T9S5znVL1
         BcI3YC27WC8a2t3yQzV1Gk7M5wLJWYHoUvrEZqdRmAojSA3Iw2n0c92eAhzsOlTLBDXR
         2EDjn/UhO387c/N2FxQZAIVurn2Fh7yQQ4UelOfzZqzfxEplXW8kghYJBhA9Sj9dSnnL
         P9JCIYRGvklbLdYFmcTzBbL/kwf+tXF3y3qUgud7VSNDQnnXfUlraWXxph3xqSV8hjLa
         JUPv7pRwjZycqrX3kK97Ri3CEJ5go1WSqbvcGdYfTJR4gmwFsooTs/dVa63v6PP5DZiw
         wT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764027723; x=1764632523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnvtIigtmuFi+SMEGrDr8fGe6ral46dzE9aXYnwhprw=;
        b=HDt13JItKClKFxX7owZJbkDT8avCdfv48/fDEwLmXq43CWgk2MNoAf3GAIHl/QH2AI
         aAY4r6GO2QqXw0SwZg7bmrJtkTjIEXEI3UArEqo/F1dp3OGkcj+rVqBc+F7bfcObvDGK
         KosytuZ6KbHfzWe9pRu94F+ju7J9OvzPVq0f6yEexYyyqU4HqgouaChdZ434bAQaJqDm
         q49evCypgHnYj/BKNT+QfTyJdOaOm4/bkezB2byYRhrQLvK/NJYkSKQbYr6XhIU7qqjk
         /tGqw6PZda4YczC+UCNwzYrywTLV0dIzMHhcU3XYrEPSNkqZ2eO0zv+JedwW7LUZQyr9
         L+uw==
X-Forwarded-Encrypted: i=1; AJvYcCXwBvkxbd/TOkrj8iSVQ7wMWSd05k9F+ahdYLS+G1/CSA2PKuC/C2PCFheWm9JYQIYEd07YbkEtQTLql4vU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6obwMrvs2JL3MQPiV8mXspEopajJWT981rDlVbrCzvozj7vBj
	IsNE8mnZh5kbBARFP4QzBQdkymvfrDWhfULVomwpM4+qfzugFOJThxh/okJ0mFsg0k+C9QQjeNv
	CWRvh5W2z8JC6SxElV6yfNslWhKg3JdXtqzqIdksCAnR1RfrRtuLSyeqvDEz7T1egPJT2
X-Gm-Gg: ASbGncv9WPWbmV9WpYLFI4D/le/+FIwXxxDBKWwR3Vb/9ZA1plz408tjBIvMeStPEgF
	PlQ+DlCLZkAN2Qzkj1pjkqwh+rIwUvpFg1QTwPyy+EXwXK/w9To+Ngo3ZceWWhQa+Wn7+Swcjgk
	o+QVDCLKQxVziHXZMRRV/+UTL1n+34Oe8OMUWbsbmso++CID7k7sZGvY7Abw5LmDrfNWuKKz7/3
	RlPe2Jo36u3nHHO7tlvO5vCaBjzUtpoAhc3Rm9wlaRotnaMRs0cGfPYDxJC9BS4IGNZ/NRk7CUI
	nxNkmCVINdGp6kN3JCe1vwWxvOizow2UbaqCsIvdlWK93ExAF7siR72UC0r31U09KZBlIgF+RfT
	hNAJV4l2Fm6SnzLBwCEoJ8wzA/j5oFI2RNa2zfYpzw4m67DvHADSIKRByKKRisN+F+a7lbM9pIz
	zCSnr/+IcJYCTP0p8Yr1EfsQ4=
X-Received: by 2002:a05:620a:450c:b0:8b2:e418:81b3 with SMTP id af79cd13be357-8b33d26458amr1727523485a.22.1764027722667;
        Mon, 24 Nov 2025 15:42:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFN7eucSuwhqdLxkfZJHbghQw9Jmczymf6l3dRsf/D03bLDn7c2y1KVw9kSU8AGW9FG4UapqQ==
X-Received: by 2002:a05:620a:450c:b0:8b2:e418:81b3 with SMTP id af79cd13be357-8b33d26458amr1727519585a.22.1764027722124;
        Mon, 24 Nov 2025 15:42:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596a710f00dsm2746715e87.0.2025.11.24.15.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 15:42:01 -0800 (PST)
Date: Tue, 25 Nov 2025 01:41:59 +0200
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
Message-ID: <ii2ktbb6xcjmy7ktbrdoi5am6wuizhwvmwy4gtr25ykmszh4df@p3rsknzzrzcp>
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
 <af3d3295-1340-417f-8682-7d7e2bc6c812@kernel.org>
 <aSGXu7IhPDNSkYhi@linaro.org>
 <280982b8-ce86-45aa-812b-ef1bf6e57e3d@kernel.org>
 <tceqigutnu6xqlprxbbm667szlnfwlhfgzxxroj6xldupk2ejt@4izqdv22rmku>
 <1a5d8d8b-a866-4112-a619-11c18547b63a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a5d8d8b-a866-4112-a619-11c18547b63a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDIwNSBTYWx0ZWRfX9YuRjPbJezV1
 VvcJMA1fdilPFjai093eNZ+xzej0XOFNEYDzA0B2prQNDn+n0d944bYCAp62GoWLVmMPYghCidi
 EtPHQdxkmeUGggXFARb38oncNEVNqc/ZJwotSZeWIFDhBUEU8qAu4IweGxjXEjLN5Srx9ZF4iFV
 uUjVJc3i+n6pZG/zAk9059tf+XfYdW1BeNF8p7FT7dik8ZvXVz/l+rrCZV1UWoxRRGGQ4tJyJD/
 yECMt48GhWmpadlfkq5dbGTru/3MG7tsOfTKGsYl3pFNK41rvYOhDjMmkIKoR6JDtg5BlDbIs4V
 IwHeIAKYxaIwWOIt43/3O9sDH7XbCJbmE8FXwhqBUgEZXHw4qCnTVD8GVUGMleS+3pHQWOXeLrC
 nv73wKMoTQbwf/ceUSVfhoz/NYl7sA==
X-Authority-Analysis: v=2.4 cv=H53WAuYi c=1 sm=1 tr=0 ts=6924ed4b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WmAht5PVCZuJh6zDFJ4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: N9ccFLQqUPt_oavEgI9jukIhPfdJqQxp
X-Proofpoint-GUID: N9ccFLQqUPt_oavEgI9jukIhPfdJqQxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_09,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240205

On Mon, Nov 24, 2025 at 04:09:56PM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2025 15:34, Dmitry Baryshkov wrote:
> > On Sat, Nov 22, 2025 at 12:15:40PM +0100, Krzysztof Kozlowski wrote:
> >> On 22/11/2025 12:00, Stephan Gerhold wrote:
> >>> On Sat, Nov 22, 2025 at 11:16:25AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 21/11/2025 15:26, Georg Gottleuber wrote:
> >>>>> [...]
> >>>>> Initial support for TUXEDO Elite 14 Gen1 laptop. It is based on Qualcomm
> >>>>> Snapdragon X Elite SoC (X1E78100).
> >>>>>
> >>>> [...]
> >>>>
> >>>>> Because the SoC is now outdated and some functions still do not work as
> >>>>> well as customers would expect from the TUXEDO brand, TUXEDO Elite 14 Gen1
> >>>>> will not be offered for sale. We would still like to submit our device
> >>>>> tree to the mainline kernel and thus contribute to Linux support for a
> >>>>> compatible device sold by Medion (SPRCHRGD 14 S1 Elite). At least in
> >>>>> Germany, this device was sold in many large stores. (An official press
> >>>>> statement will follow on our website.)
> >>>>
> >>>> For me this is unmergeable, because we do not take stuff which no one
> >>>> uses (no one can even use), and I am sad I put effort in reviewing AFTER
> >>>> this was known to be cancelled.
> >>>>
> >>>
> >>> I don't think we have any requirement to have a large user base in order
> >>> to merge changes. There is already support for plenty of cancelled
> >>> products with only a few (if any) remaining users in mainline, e.g.
> >>>
> >>>  - Snapdragon X Elite Dev Kit (x1e001de-devkit), shipped only to a
> >>>    handful of users before cancelled
> >>>  - All ChromeOS SC7280 devices (including DTB variants for several
> >>>    revisions of pre-production samples), never shipped to anyone
> >>>
> >>
> >> I discuss here the timing primarily and I don't know the timing about them.
> >>
> >>> There are also plenty of internal reference devices that only a handful
> >>> of people have access to (MTP, HDK, CRD etc). What makes these any
> >>
> >> They are still "maintained" and "offered", even if only for handful
> >> (like 3000 EACH variant) people. That's the amount of board of each
> >> variant, e.g. MTP8750, and all of them run some sort of Linux, even if
> >> downstream. So sorry, but 3000 (or whatever number it is) is not handful.
> > 
> > Where does 3000 come from? The Bible says 10 people were enough to
> > maintain Sodom and Gomorrah. For Herobrine we know that there are very
> > few people still using those devices (maybe less than 10), but we still
> > keep it. Cheeza was dropped after it was known that the count is exactly
> > zero.
> > 
> >>
> >>> different? Ettore has been actively testing and contributing to the port
> >>> for the TUXEDO laptop, so if he wants to continue that, I don't think
> >>> anything speaks against merging this device tree.
> >>
> >> I won't be maintaining it, so not my effort in that, but since you speak
> >> about that - maintenance is an effort, thus I decide not to spend it on
> >> cancelled products.
> >>
> >>>
> >>> In any case, I don't think the time reviewing these changes is wasted:
> >>
> >> I am happy that you do not find my time wasted, but I disagree on that
> >> because knowing this is cancelled, I would probably not care and review
> >> products which are not cancelled at this time.
> > 
> > There still people owning and being happy with those laptops. It's
> > Bjorn's and Konrad's time being spent on maintaining those. What's the
> > issue?
> 
> 
> I think I described my issue very precise. Please read my first reply in
> this thread. Joining discussion at the end of it, not reading it and
> then asking "what is the issue" is not really encouraging me to discuss
> whether this is a problem or not.

I had read it before replying.

-- 
With best wishes
Dmitry

