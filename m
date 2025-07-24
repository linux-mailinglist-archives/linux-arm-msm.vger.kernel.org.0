Return-Path: <linux-arm-msm+bounces-66514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4286AB109D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6446E5A4AA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CA42C2ACE;
	Thu, 24 Jul 2025 12:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/5S5VVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B73F29B8C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753358477; cv=none; b=dZnT2BiI1rXIajoG5Ukj7FKG0bjoa0D61zln46PZrM+/pCFQV8WzTJW5RJvc5fEhzy5ijs1EcsN+N/jf5SDsghZejSxA9AQSD3ZHjavWnduhl995PCMidEwIOjpNDBo/LspZahagrnf9t3p8FCI9C5z6kCiDiwRvt0Z0QSTujfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753358477; c=relaxed/simple;
	bh=9uu1S1qj04g/juKK/9B5wbVnmOsk3FvMiKkw5w2j0+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvRCYeGP4aaFQjk8HWjPFPcFfYgkPou/54Nml02nwV44IWkrAk627vTGXQId7voVcQ/CytqD1qPzFLcJjWgVb79OGoWWFSGpmqU3PE5/jwAJDvCDvuTMC4lfVcUPgfMguocDa8j4uxJW+dpBePpaACzfJZ7MshdEFum7W1hM15c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/5S5VVj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O6doSK028522
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WrE6w+Y+/lZU3NCVD/cyIQyDMA0J81+VswNVXgVvAE=; b=M/5S5VVjf1KTAqru
	xFleTf90vUOlmPvX/YZNXPtjcgzVwMXKbqFUEL8q+xNpDIhmm6IZ9PUFBBqNKM+A
	0k/UslC5F6JYKuzyi5ptSDvi60GrOoFZqWDeEUe7IrIse5GxHHYTrbrf7At1lt2C
	TUCaONH0Y3jnN3fC4EdsZvXjIWjSuM0Gg2L3cIP3jHzeqtFgVWWTp/EEtwKLJPZP
	CbS4nNYu1kOcPqya5d4D1/dQWJBpYeDPIEyEy/zNaSlQBqaOaSVI0SPl4uI7ayyh
	yDuafSFmHQNy8se5qkHue75vW1zx6sO2noT+nDK0+Xh+/l0VCpJP1mO0TJAwszou
	GWkV4A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483frk0xck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 12:01:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4e9ba1b468eso183458137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 05:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753358474; x=1753963274;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WrE6w+Y+/lZU3NCVD/cyIQyDMA0J81+VswNVXgVvAE=;
        b=GNXs91Os9JowJxj7ZiohzG6ykh6+wtgKx9s05HNGN1HT9MqyHksk4HUBqI1PuJGGLY
         KA3p/7R4Lp70I2Is6xHSFbDZMpIwgUezJxTpUy50cXzuniTcDXjKhspIKy7ytpHCXsPE
         Vrk4itLcsX9tOvnukSxGmq1CjFEfPNW4XzoMH77i+QKIGZAntF/6JGbDBWkh9LSIzR8b
         WVU5LbZOxaqJnXHmy1mCk7xX1aLBzfFMdo7wpTq2rWQtjTGZQyyAYoDfRPJSK0lOL7mq
         J9t8wPgSVOR/rE5A3cHqt/SCUEwxDsg67DR3n+A9xpZ/F5cVu9PwUtetdXM87saVcQIB
         qqvA==
X-Forwarded-Encrypted: i=1; AJvYcCUWfOreajufCtaF9E/3JiiNU8GzOe0xK0ku6V6IzMXnhiizYazccXtrgLO3VsAL5nnDX7XGpE8xXoFQw7ij@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgp1nl10RolAbB3KUYniaYewStADLiPEQcaZTaoFQ/g3urm6lE
	G6A1TH6Ea+PhL/S7dbKhYFH8UVw+ZC374UzgCzM8xCIE10ESoGbSTCIht0SdgCETWHM3Y50xrf7
	8YH6dzn+UBGmhE6XNZDBmmzbgiJwU7tMV4zGyJGeI9kVO8C/B6WC9+u7jbRisLDk7vorK
X-Gm-Gg: ASbGnct2w07UYwEWecm3itdc9mLLGHf5q/bQ43kLTYeYbWNEXF3XqdpqlOwIB45UkIw
	9OK31wzvqtRteIkP8XAZ0bWY7+NhqQbfX7poR0+8K5mp0De6/bA4dftjAIVH++0UVX56/oQMxgP
	V/KB2xjM6RHUq3igB4csxJR4lK0OMXfXDQjp74N3ZqFHlxj4yoqtnj8IxvWn4+7zAncWPhXwGjv
	9Gnj4ZMJjGCPcdjvobbNkNt68mAQRrJsh1BqIDaMKDLD1vRYOVOkYHo5c7qLTzhIXDGxlnpI5uN
	zVik1/sAgw/gtFaXurceoNYyqbmcHYwnqM5R0tMrg5p2H8jf3xFqbN4JI96qcANblsBc2Rtt1wy
	SIydbZSLvZB0LVphhVnNOBGG3xPacqk944iSg1Q1+mJR9m2IANwcL
X-Received: by 2002:a05:6102:5a99:b0:4e9:968b:4414 with SMTP id ada2fe7eead31-4fa1521851fmr2754522137.22.1753358468134;
        Thu, 24 Jul 2025 05:01:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETM2Dk540eywCV0gAGXNNbz9noJyr0KH7DW1dRdy4yZ58LU0VXkl2WQyJmUeGaYGW1uVpMTA==
X-Received: by 2002:a05:6102:5a99:b0:4e9:968b:4414 with SMTP id ada2fe7eead31-4fa1521851fmr2753800137.22.1753358464426;
        Thu, 24 Jul 2025 05:01:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53b2288csm325180e87.23.2025.07.24.05.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 05:01:03 -0700 (PDT)
Date: Thu, 24 Jul 2025 15:01:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
Message-ID: <tpervpypkne6lasl3fn3v52xutl3zfuytalo3cveoe4us63rrb@p2w4cvt2jf7a>
References: <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq>
 <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com>
 <CAA8EJpoLLDXFQk-ViuaioKrECzMV0aUrcOj4v+Ufs4oHY53mrw@mail.gmail.com>
 <064d3eed-c2ea-4b41-85b2-d2a5a922f8c7@quicinc.com>
 <ehgjdszjr34xppmkrkicb4pnq326nor26tqu2ekop6ew2j3y3h@pm45aiipzuc5>
 <48c73675-a73f-46f1-81a9-f701a2cf00a5@quicinc.com>
 <c1ebdaf1-92bb-4f73-bca9-35246d7c10e1@oss.qualcomm.com>
 <ca83b841-aea0-4233-93fe-02a7b5985af4@quicinc.com>
 <1a0a5178-fcf0-49b6-8e4c-1393c0f4f229@oss.qualcomm.com>
 <22848e2e-bd7d-486c-b481-c624d230d327@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22848e2e-bd7d-486c-b481-c624d230d327@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5MCBTYWx0ZWRfX7U/g/sG84uRZ
 VUhhLdM1RCB0f3Q5CyWfTGpsZwdxJKUlH5KH1DJmCKcgo4Reni6PPDROdOLQ/Ju3CFzHAM3MEUH
 Z6QoNI1esXV/HRY4/V2cH9xOBVdauh9+36Pu3uXe3PH3Jp0ZmoDIaQ26deqwjbd1dMEEIyIph+Y
 CmG+zE7SMog5os3O7H5jwrkGjpqzPfGc6QaBQaK7x/jZPkzP25T/vOIKBO/wXqJzjFZtQH9fesP
 WNQ/Tr6w1/BqFTbe2Xh/59W3/Ggl16ko3AxurlEPmAz+TMYQgqRiKHKVhynoJkb+8ixQVR7bl+S
 /uYqmCPaWbQwkOaxqFu48wxcag3CDy8uqPjPoFhaXJ3xaSuEVo0e/tLXy3pc+jgzi9c6Q2AiJ+Q
 yWAw/QrRr47ScR6bT2pWig1ewDgZR9tpfXOck+G7Xwla+7Fhp+zippicRgyruxotYjB72/RU
X-Proofpoint-GUID: ZrznqxEeDZOMs1sqFKBRpHai5OdanVAc
X-Authority-Analysis: v=2.4 cv=WbsMa1hX c=1 sm=1 tr=0 ts=6882208b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=6h7372fjVO4yHBa2uBUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=-aSRE8QhW-JAV6biHavz:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZrznqxEeDZOMs1sqFKBRpHai5OdanVAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240090

On Thu, Jul 24, 2025 at 04:45:38PM +0530, Sarthak Garg wrote:
> 
> 
> On 5/21/2025 9:11 PM, Dmitry Baryshkov wrote:
> > On 21/05/2025 18:36, Sarthak Garg wrote:
> > > 
> > > 
> > > On 5/21/2025 8:19 PM, Dmitry Baryshkov wrote:
> > > > On 21/05/2025 17:35, Sarthak Garg wrote:
> > > > > 
> > > > > 
> > > > > On 5/21/2025 6:25 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, May 21, 2025 at 12:46:49PM +0530, Sarthak Garg wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
> > > > > > > > On Fri, 15 Nov 2024 at 12:23, Sarthak Garg
> > > > > > > > <quic_sartgarg@quicinc.com> wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
> > > > > > > > > > On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
> > > > > > > > > > > Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
> > > > > > > > > > > This enables runtime PM for eMMC/SD card.
> > > > > > > > > > 
> > > > > > > > > > Could you please mention, which
> > > > > > > > > > platforms were tested with this patch?
> > > > > > > > > > Note, upstream kernel supports a lot of
> > > > > > > > > > platforms, including MSM8974, I
> > > > > > > > > > think the oldest one, which uses SDHCI.
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > This was tested with qdu1000 platform.
> > > > > > > > 
> > > > > > > > Are you sure that it won't break other platforms?
> > > > > > > > 
> > > > > > > 
> > > > > > > Thanks for your valuable comment.
> > > > > > > I am not sure about the older platforms so to avoid issues on older
> > > > > > > platforms we can enable this for all SDCC version 5.0 targets ?
> > > > > > 
> > > > > > No, there are still a lot of platforms. Either explain why this is
> > > > > > required for all v5 platforms (and won't break those) or
> > > > > > find some other
> > > > > > way, e.g. limit the change to QDU1000, explaining why it is _not_
> > > > > > applicable to other platforms.
> > > > > > 
> > > > > 
> > > > > Thanks for your comment.
> > > > 
> > > > No need to.
> > > >  >> I agree with your concern but for me also its not possible
> > > > to test on
> > > > > all the platforms.
> > > > 
> > > > Sure.
> > > > >> Lets say if I want to enable this caps for QDU1000 for which it has
> > > > > been tested and on any other upcoming target after testing,
> > > > > then how can I proceed to enable?
> > > > 
> > > > Let's start from the beginning: why do you want to enable it on QDU1000?
> > > > 
> > > 
> > > QDU1000 is one latest available target where we have enabled this
> > > and tested. This has been enabled to save power.
> > 
> > Isn't it a powered device? How much power is the save? Is it worth it?
> > 
> 
> Sorry I just did basic sanity on QDU1000 device to confirm its not breaking
> any eMMC functionality and we have also tested SD card on SM8550 as well.
> For power no's we have stared internal discussions and based on target
> available for power profiling with eMMC device we will come back.

So, again, _why_ do we want to enable it? If you haven't measured the
actual power savings, then it's obviously not a primary reason.

As for the v5 targets only, they start from SDM845. Have you tested it?
Does it bring any actual benefits?

-- 
With best wishes
Dmitry

