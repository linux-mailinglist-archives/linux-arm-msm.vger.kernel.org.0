Return-Path: <linux-arm-msm+bounces-81992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C3C619C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 18:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 00216357762
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 17:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF5C21B91D;
	Sun, 16 Nov 2025 17:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOJXfdNa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jc0SjpmV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C93B2A0
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763314786; cv=none; b=uSrbe6uzMHgBo7+tNZA1skJZ8g0jG25aSY/tMhcqqKHeTHXKKKbKqIC7fBIB7u10ath08nKruOK455IyExaWoBHkyjFCuuwsrzxSC/7n+tVLFJTSgLh5piZHspwNbXHXYJEA8vmXLwMqU9ilR5dpDFKoZsFc0e7mHOfGeshjy5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763314786; c=relaxed/simple;
	bh=UMZRbYGRMMqPgl5hr5BhIPZDHrrYm5eEKzKud1Clk6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHGY25SfV467+I7o6eZ99dEo6omUCPqQQ3I0Y4IcTELcZG216qL8ZmfmgX8w/9EVV7ya80yvzf7sx6oVlI2f/QNhD0p3+seaDhuU1VGt1y70FpJMf9FmwXv1wSmfc9TQ0IoiyADgpll0WqakElSIFxpFifnNiINazyt0OQrvKy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOJXfdNa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jc0SjpmV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AG7HwiH527957
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MldI9AmQq64mlgS7nRI0iDby
	8L4OntQBivKHBw4heJw=; b=MOJXfdNaVY2EnZv3jpwbr6iBVSF8cLsbwLO/Ek45
	UHjmYObUV21sZr/BDyQ9d1/j4Mk0Bkfv+VQjiLNYHhr5VLNAzue7s5qFxs1R8R1e
	9Kk5quV/NAHv8JrRMO648ENt7EhHLE5HZ+1AGLxhwJHlmmH9rdBVi/3b6Q5SWIg4
	tTIDkgOB1SRNGjT3nL5qWt8h+kyDUzP/fkrHdi65hDmLYJrRik8NrUE1ON3Ub2D+
	6nH8E44IuFZuLYjCxchLz0LN9s/8NQfcA7GQOoJnunxw94iaNi6juitiCQBYl6w6
	L2CYFCJbNWMP59wBwOreQlvqSctsWVxzToyZEMkBD8TocQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejk1jdq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:39:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-882380beb27so7882026d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 09:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763314783; x=1763919583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MldI9AmQq64mlgS7nRI0iDby8L4OntQBivKHBw4heJw=;
        b=Jc0SjpmV4lNMLROv7Muj83+/HZUny9ZVT9E5wK+//Of+H4cAxzlCT1eptq/NAtdAT+
         SyidmWYLnDsqLDjbkMxE328z6P/dnu7OyeI6OAq5+cllzNWAyFMCkEg8MXI4S05H1rJQ
         szNabrIt/IuMyVACdgoBJWyFVld0RkO3qRv1ooP0by9xFYEncBGqeUYw3ArYbDOth+KD
         Uqp/aMaT4S5xozny9XrJCTo5g2EljisVFmk1bGstsCX/DHbH+DIcSvR9au9MuFGWPmr+
         5n5jMH9rlPriHvM0+noBV6c+7MuOKXsHxusR6L2NAAxFYEiAR2w2RSYtuobkGmFUUSIj
         vZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763314783; x=1763919583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MldI9AmQq64mlgS7nRI0iDby8L4OntQBivKHBw4heJw=;
        b=UJWrCNRYZKrLqa7RMM31IfqLpk0RYhAP1i+36vgzSIiF0uv/fhUnBDIRquJw2L6NDc
         A2BAt7GYnIP424PsEn4Tt2sH4UrvvmaY1ma8roUFcxEfX0SMEodxTL9x2VevHfz+e8ql
         rWWc9+HRWup/Ecv2jUl9Ywz2F67aJ6El7jlJ8V1zox9AUxlYfie3uqdWIaMRZIr+QJI5
         FA1GCJ8MNqOR8DyiXSm2Y1rrhBNM5qWDdmaQClHmIGef9EemOX8cq91r3bjFsYlH3Tyx
         f99RSl3FSZWgzGU8KSmfonRx0olaD5bFaPBsjE450RT9ojpVpu0IweuLW1d39CDN9rWA
         5omQ==
X-Forwarded-Encrypted: i=1; AJvYcCUstAEwvgPX/37TmqfFg35I79DTUndzFTJfgBBA1edq32ftqJtouUHGedvrgr40d1Xrf2DCerJl/dFYBrq4@vger.kernel.org
X-Gm-Message-State: AOJu0YylmWZ2AS8Dde3S84/sX4uR1FzJYvwtBLsbSMa6gc/g27sDZrTr
	WtHag6Hc6BbhC14gfxcfK3vYFx9cuCcMus2VZIXDg1VbloxVVY4OagbAAeXnS9Ok2X0vgbi1mE7
	x/M5T8vX4IBAKy7HKcWleGuRl7YSsDhuLfySI5xv6najgqRkMnLkCILalNrbn5zVt0JB+qrj/Zd
	y+
X-Gm-Gg: ASbGnctUV11K/N1KuLsyqK0VUXy/9afIFAZKO1+LselRmjtWtxl6QxFQWqZax2lmjt/
	hosjbSBFwf1+Fg3HZ3r2+NIdVceRXFgCSGZNkYNBcxbxwS4TJ2QtzoB83eNuscfw9woM1SeSsrG
	uPBNscxmuQM0cpfx9RKYLjWllSmDLcYbu4mVhnw9EroCKxj3iWxqszwHzDNiNbn1njUKPID1U2t
	nvRj3l39cABWKZB297iu50pjZUgTvlTkX+GF9M/RVGENAVUuKb7eK+8H8WCQ/CGbpOtJmgvd/vy
	yAAwGDKbuYDJAW3i30RjHr5qFTH72wETcowxyGhuk792miCxNd7B+ioF+xUGMPpMBZb2l8YMFjc
	2JzWYB2YUs5gQKaORYcPWidF+RhbtvRy8WOu/jztHQD2M0vKoK2lh5/c4gN5XaYjL102ojEGFrO
	mQj9NxK81YBPN5
X-Received: by 2002:ad4:5ba4:0:b0:882:6797:3a67 with SMTP id 6a1803df08f44-88292594e31mr126466036d6.13.1763314782703;
        Sun, 16 Nov 2025 09:39:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJvbJC8bEvServvR3ZCrEhqk2UPrhktM1B5AiQWvW6nMbLmcIwzLV/C3tleNO47Dl+nfnkfQ==
X-Received: by 2002:ad4:5ba4:0:b0:882:6797:3a67 with SMTP id 6a1803df08f44-88292594e31mr126465886d6.13.1763314782232;
        Sun, 16 Nov 2025 09:39:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804056absm2529442e87.82.2025.11.16.09.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 09:39:41 -0800 (PST)
Date: Sun, 16 Nov 2025 19:39:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: philmb3487 <philmb3487@proton.me>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: qcom,ids: Add SoC IDs for SM8635 family
Message-ID: <t2jknxsvcfntsy62psf4loy7ujryqvdqugju7ozdyvoui2aaxa@ncaixoepzqsc>
References: <9nTdr-7UlyytB3d5Iz0IEGrAAzjPipf4NEiZvLMmpk9OmCmRuL346OxjZgpLkLdG7dFYE_rj-5aibg7bhYHrQmjwo1e096-2IGhfi1rKglE=@proton.me>
 <66d58b6c-aefd-4848-882b-51770f7020f3@kernel.org>
 <Q4eaiByBMrzIsd0C_0QEVlu5wPEW7kRn_1zqqWiu-Jmc7wHjVfBTftv4oiLtGzJiN5dYh0tCagJEh0A-2siXiRjEe3y6QBBvEmGoiExRvfo=@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Q4eaiByBMrzIsd0C_0QEVlu5wPEW7kRn_1zqqWiu-Jmc7wHjVfBTftv4oiLtGzJiN5dYh0tCagJEh0A-2siXiRjEe3y6QBBvEmGoiExRvfo=@proton.me>
X-Proofpoint-GUID: FW2DLcb-FKGO6VX0s7v4O9zrdfs51FMv
X-Authority-Analysis: v=2.4 cv=OpZCCi/t c=1 sm=1 tr=0 ts=691a0c5f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=SQj_zCYHFohNUILaHKQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDE0NiBTYWx0ZWRfX14+L3zruCG6a
 gQi5VgtfOJVH0ATWymBce/XqfauoL71mW0Z1k1H/aeE+vkunbogq9IP5Ds8mpxu1vFM2z6A82O1
 49+BS5wLwOSjrquKITvvLRXuNhfC8TBbTiEovKZlgCeODQ9N5tqSOPXspwrJOMqwSIRjsinYmdE
 v0zaEKmPB6fuMMw/Nb5pa3mfY0D7mpybAVOQ+cDhP3pIoQMpiG488D/zm0pM3sSS/TasaxppRd4
 z42hzon/QZgHsHnssaaClTq0vstBq2QRpAsGz9Ob48dzKP4sIX/dP5oVWYOGR1pDe46MwmtdDXG
 Mc2N3GH1O577bq1CNyr8CDhOWEsegilC9EJop43GGIxf9SQ6pM2CnHsSATQwJE9IygoVguvPTNW
 2mAJDxsGnSp6lmF45VBUgPXSiZEpUA==
X-Proofpoint-ORIG-GUID: FW2DLcb-FKGO6VX0s7v4O9zrdfs51FMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160146

On Sun, Nov 16, 2025 at 03:13:58PM +0000, philmb3487 wrote:
> I'm a bit overwhelmed, submitting is quite a complex process.

Please take a look under Documentation/process/submitting-patches.rst.

For example, one of the issues in your email is that you just
inline-posted the full patch. Instead please use git send-email (it
requires a bit of setup, but then it's easy). An alternative option
(which is also easy and skips most of the email setup) is to use the
`b4` tool: https://b4.docs.kernel.org/en/latest/

> Do I send an email to everyone mentioned in ./scripts/get_maintainer.pl ? What's the difference with sending an email to linux-msm ?

Yes. The different is pretty easy: sometimes people don't read the full
mailing list. They go through their inbox only.

> 
> I've never used tabs before, but now have to. I can't get this error fixed in emacs, does emacs support the linux syntax format ?
> 
> WARNING: please, no space before tabs
> #28: FILE: include/dt-bindings/arm/qcom,ids.h:286:
> +#define QCOM_ID_SM8635P ^I^I642$
> 
> total: 0 errors, 1 warnings, 13 lines checked
> 
> 
> Also I tried subscribing to the list, but then I got 500 emails in a day. What's the way to manage that, or if not, then I just don't subscribe?

Delete eveything that you are not interested in. Or don't subscribe,
it's also fine.

> 
> -- Philippe
> 
> 
> On Sunday, November 16th, 2025 at 6:04 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > 
> > 
> > On 16/11/2025 01:43, philmb3487 wrote:
> > 
> > > Author: Philippe Michaud-Boudreault philmb3487@proton.me
> > > Date: Sat Nov 15 19:41:12 2025 -0500
> > > 
> > > dt-bindings: arm: qcom,ids: Add SoC IDs for SM8635 family
> > > 
> > > Add the SoC ID for the SM8635.
> > 
> > 
> > 1. Unfortunately this looks like a messed up patch header. Please use
> > standard tools for sending patches.
> > 
> > 2. Also missing SoB.
> > 
> > 3. Also, missing users of this - you have to organize your work in
> > proper patchsets. See recent guide on Linaro.org blog how to send patches.
> > 
> > ... and finally:
> > 
> > Please use scripts/get_maintainers.pl to get a list of necessary people
> > and lists to CC (and consider --no-git-fallback argument, so you will
> > not CC people just because they made one commit years ago). It might
> > happen, that command when run on an older kernel, gives you outdated
> > entries. Therefore please be sure you base your patches on recent Linux
> > kernel.
> > 
> > Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> > people, so fix your workflow. Tools might also fail if you work on some
> > ancient tree (don't, instead use mainline) or work on fork of kernel
> > (don't, instead use mainline). Just use b4 and everything should be
> > fine, although remember about `b4 prep --auto-to-cc` if you added new
> > patches to the patchset.
> > 
> > 
> > Best regards,
> > Krzysztof

-- 
With best wishes
Dmitry

