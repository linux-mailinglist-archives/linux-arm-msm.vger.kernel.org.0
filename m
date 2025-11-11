Return-Path: <linux-arm-msm+bounces-81314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E69C4F28E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 18:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5467534C965
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 17:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725273AA199;
	Tue, 11 Nov 2025 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p82Ek23U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXZ5vFMm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEFB266EE9
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 17:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762880483; cv=none; b=roD65XggMIj0qHoKpBAj8meuoaUXOrKiH3StJ2qUqGUNuz2O1YOmetf3QArFKBzZIrUFHNCx9XMGBUICFrVm6j8w2kBE46Pvr+yEI8fkZjewTxSMY2V48qDZzxWHmK1sRQ+1QmiESfRwp4XpK+In33zP2LvJ0ujdqyIYwYpH3oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762880483; c=relaxed/simple;
	bh=u2PBf+ScEvsZXo6Nvlx3EH1X8QQScTycOFmTK282ut4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoNR0bVs6PoVz2RNGSPAArUgKqydc5aQIxkkFEYONbu5+QkpwedDJ8dP4aKYE4GJE+/Q0DjLoGLxrETGNhhpR8O4cLT3fkm8BGJk+E1T/3i9TPlu5kRqJfliyKASYW0y9K6666/n7srQaXO4mEuH8XIVyyl4fH1jwq5niP/5+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p82Ek23U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXZ5vFMm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABFcL5b2854466
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 17:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ys8OzpHvw+YFE6Z0Rh9xp23o
	VtdDuiKWW3cIiRZWe/A=; b=p82Ek23UgaDsT2quw+612l8olAAMG4J9hXMKvu0D
	c2dhGympd9NMvPfdo5aksmh0XbCkooFFHroKr/kUrNpz094UjFoXYNNnWelH3v0g
	LNIf41jaMIJ9GEEbzFTsWWMRjdfTsR4K/gay+s2mmVCsj4/GXwy5DuyzQRBLTX3a
	S8Sh2+v46YNT8JcyXQcEqYwCn+O+y9RHd7TCZuwWnK9fNwdBRasa4PSCdkNkNAUP
	/zzughle3qzaEwV+55BpzKjuRUtoGnbgPK8W234ZjNRuX9GCsQrHsq8/NAijm0w5
	K542kQyRlgWZLY1JOZoCTdFM+XUsqgHAWyewUGlVLQfoiA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac7y0097r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 17:01:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2955f0b8895so15707725ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 09:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762880479; x=1763485279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ys8OzpHvw+YFE6Z0Rh9xp23oVtdDuiKWW3cIiRZWe/A=;
        b=YXZ5vFMmUi9n4I7/kjRkj4gkNrsIhsbN6umJ6reIuje2ULvrqvDUUkGgHyaeDhIXjz
         0mqqJ8BFOldIm7Ypw6WJv3w7uR/qDkF4g2kiYD2nesJtRIclXIJiwprtdVf9iefy6Bwz
         kch8SfiHpaEd0Ag8JUuK1bHmBho3H03IBOrj/KREZlmbUVTv0LD87ERulfrB3d6RA88M
         DNyQ9NIZlcQoZF9M6us/kEXqyg7//vt0ovkjZhnSyyXfSKqpjxBZLBLKuqUytOsykU16
         piiu5vZhhgHwwiF20NSYbfRZDMiZax5kYblylViFEXs7mkFjP3i37xuXfSZ3BzTSz+nN
         CASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762880479; x=1763485279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ys8OzpHvw+YFE6Z0Rh9xp23oVtdDuiKWW3cIiRZWe/A=;
        b=Szsp5viBiggteSc92pxCJMNEXxAcik+sf///GbhS3kDDxRAt+Hy1H0fIG4T0zSMiQc
         EOSMa0xuzXPEIGaqpd2euHkEjP2n3IoXzsjLkCo5tjQUoDDEjc++iBPPEZ0d0ZpdLsW2
         DmSQ6eOqLom4DzifapGcMDpHTAsylAjpySm8KSqrwHTq5XdKmitdxPC1C3LPpPYvmOW6
         Vml3c2i8rxm+q4fphyzC3oBTltPse8mOis6Wrng8MGZIgBzqa1yABMMTx3Ne6osTktwI
         1MhSsGbQdWGvsp6DZFbQMpFH0XC6N+sghWxvIUPB5CcZFby3x9YHkQAbQqdMB2ROsTgV
         yaWg==
X-Forwarded-Encrypted: i=1; AJvYcCVfYwFPJ3SIzH0vE8sw26KOhqrnkwMz1yaT6MfFLpRiiFpKDv+iL7NdoDe132qrI0Q2pr5NK5UbkiXiSU+F@vger.kernel.org
X-Gm-Message-State: AOJu0YyN3WHZm5SownceEITNd/gPytHOVL2j7+PL/KeWqwu09KZLBL2T
	yY7CppA8ZkSXMMchCf/ev5Ka0pNMbvotO/1IskPYCXn2y8fWbqfXydTTMwMCl67b8joRjmn7TYb
	niWCoGdb60Ad6RJTxPrAs/Igph9wYRxaboZrliZupW+KP2YfOqpUH+Zc4/pfkXj1sq8tT
X-Gm-Gg: ASbGncvsleu/SExffXLRrgawSvBpjgZauZCCzKvza2sOYbDxvoVx/jzQvqYlDndKCbT
	5uniSxkvUCmZ6DFrsDtBigG4/ucSM5Ffu2IY+RmtO11MEEA7iKVm5YoAElPtwjEanHdj4UtkFRd
	GPR3OjY1ijFNI7mIlsAHHzSKUkHtx0Iq+YVIGUuVE78vYkL2KCZlphOrbKcTAiNbiFxppfhQeqH
	TcOhfcuy5b4s7zONepL/j7NLoQ81yr9qVtfXxv2OWajCmAYfAqu9HXn8RfZ1B82L/HoOQn8Cb4b
	7p+n7L/M/dHnXYGkHiKUHwrUxLLn2LbR9bkjhdZW0lOhmRcRoDm9rkXTt8tM6AAmqH3+FCT7naq
	RVuIwxhgGyms9lA3t3ouL/YwmEbTeypqX
X-Received: by 2002:a17:902:f785:b0:297:dd99:ff13 with SMTP id d9443c01a7336-29840842ef6mr57045285ad.17.1762880479118;
        Tue, 11 Nov 2025 09:01:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeS7Nfn0Fkkhq93axawBwW1Zllh161FgmCKufOMOr8fIgtNOiUp1YWsMAVxcanb8fNr9z3/A==
X-Received: by 2002:a17:902:f785:b0:297:dd99:ff13 with SMTP id d9443c01a7336-29840842ef6mr57044415ad.17.1762880478419;
        Tue, 11 Nov 2025 09:01:18 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd0eb9sm2244495ad.96.2025.11.11.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 09:01:18 -0800 (PST)
Date: Tue, 11 Nov 2025 22:31:10 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        hrishabh.rajput@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
Message-ID: <b7ed3445-d004-4c15-b8f8-b2f92a621471@quicinc.com>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
 <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
 <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
 <rt777beinysf5nuy57frn7okwglsl77xqikmvobao32bznhnkf@mzg243ddzlpl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rt777beinysf5nuy57frn7okwglsl77xqikmvobao32bznhnkf@mzg243ddzlpl>
X-Authority-Analysis: v=2.4 cv=SY36t/Ru c=1 sm=1 tr=0 ts=69136be0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=uhQQHbFWYvhsl2siKBsA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: OOuZDfqhdfj4GmG8AOyw0zOFUuCnAtVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEzOCBTYWx0ZWRfX1eI1lDm/iVIz
 D9VgmazZv3uEfy81rs1jLvZ1IXP/9GMwJ3OdEBVqm6bKuRIw0mv/QFOy3kPgGt/c6MXZybtmQca
 cQR2TqzHWSNxR6m4rOd1l9i38dEw+AZloVbk+MeF8Li56uDnOMxgSkUTwRJoduUyy5RhLn6JUdx
 zciuwRfFTOjbz/6jdcYCM1LFgzLITzhH3BEjM9YjKDPP4ENqD18F7KIVEfJvYm+wYCskJERmIX3
 GS/JtHc740uh8uRgBom6C+qz6HfZ59ddwkgz9piejdK6JuELxTCX+oJvawMyUkDO12Wpy8G+zfP
 aQAvz8S33kNNpou96AxYO2SZLp9rh80rVKmLtnhwLw96nqT2Yv3FY6J2FgQ0JSBtnETntzSqc1j
 6FN0yOcvYpVFa/b5eVEeCXOq1jUAnQ==
X-Proofpoint-ORIG-GUID: OOuZDfqhdfj4GmG8AOyw0zOFUuCnAtVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_03,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110138

On Tue, Nov 11, 2025 at 10:38:27AM -0600, Bjorn Andersson wrote:
> On Tue, Nov 11, 2025 at 10:51:43AM +0530, Pavan Kondeti wrote:
> > On Mon, Nov 10, 2025 at 09:43:53AM +0530, Pavan Kondeti wrote:
> > > On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
> > > > > +static void qcom_scm_gunyah_wdt_free(void *data)
> > > > > +{
> > > > > +	struct platform_device *gunyah_wdt_dev = data;
> > > > > +
> > > > > +	platform_device_unregister(gunyah_wdt_dev);
> > > > > +}
> > > > > +
> > > > > +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
> > > > > +{
> > > > > +	struct platform_device *gunyah_wdt_dev;
> > > > > +	struct device_node *np;
> > > > > +	bool of_wdt_available;
> > > > > +	int i;
> > > > > +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
> > > > 
> > > > static const?
> > > > 
> > > > > +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
> > > > > +	static const char * const of_wdt_compatible[] = {
> > > > > +		"qcom,kpss-wdt",
> > > > > +		"arm,sbsa-gwdt",
> > > > > +	};
> > > > > +
> > > > > +	/* Bail out if we are not running under Gunyah */
> > > > > +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
> > > > > +		return;
> > > > 
> > > > This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
> > > > 
> > > 
> > > Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.
> > > 
> > 
> > Dmitry / Bjorn,
> > 
> > We are debating on this internally on how to resolve this dependency
> > 
> > - QCOM_SCM depends on HAVE_ARM_SMCCC_DISCOVERY which means restricting
> >   QCOM_SCM compilation than what it is today.
> 
> What does that imply? What is the actual impact? (Do I need to go read
> the dependency tree myself?)

Actually, I misunderstood how QCOM_SCM driver is enabled. It is being
selected by other drivers which needs functionality provided by QCOM_SCM
driver. So adding HAVE_ARM_SMCCC_DISCOVERY dependency does not make much
sense. Sorry, I should have done my homework properly. I was carried
away with `select` vs `depends on` approach. 

> 
> > 
> > - Adding #ifdefry around arm_smccc_hypervisor_has_uuid usage in qcom scm driver 
> > 
> > - Adding stub for `arm_smccc_hypervisor_has_uuid()` which is not done
> >   for any of the functions defined in drivers/firmware/smccc/smccc.c
> > 
> > We are trending towards the first option above. Please let us know if
> > you think otherwise.
> 
> What is this trend driven by? Is it coin toss or is there a reason? My
> gut feeling is trending towards one of the latter two options...

Thanks, we are going with #ifdefry around the new code that is added by
this patch.

> 
> But you're effectively asking us to go research these three options,
> determine the pros/cons and then tell you what we think, at which point I
> presume you will tell us what you think about each option.
> 
> It would be better if you made a suggestion and told us why you think
> this is the best choice - then we can either agree with your reasoning,
> or choose to ask more questions or do some research.
> 

Understood. I will keep this in mind while presenting choices from now
onwards.

Thanks,
Pavan

