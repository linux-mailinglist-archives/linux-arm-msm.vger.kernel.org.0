Return-Path: <linux-arm-msm+bounces-62627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D47DAE9C1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89EDA3BF02D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AAB2750E9;
	Thu, 26 Jun 2025 11:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eEHn/wCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59B9273D75
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750935831; cv=none; b=ba4WzKWVHeFIu6QuRPAI/6+Ncgp1Tyb0FYSsL84BU8zxGLkN8Ys4qVt1YTSAeyXFHTCnSiovfwebW2yW8+ejd9KzRdKisiqgCpdMp6h7jpFATDm4F6WLr+yhmbb2syIfRTfU/ktCEI5ErMSLoXUvIILITVQehOPY5mdQ27hNBjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750935831; c=relaxed/simple;
	bh=tuGT8XW8rHBbFXu3KFzBBDY3T/l6VMT1FnYa6Mpkjoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTcXujMgPGB3LwmQ748VjJJ4tsFHKLQy/zeppZXIB39WZ5a8DZjq+NksI73uqAL5wU8NWpj0LEGhi2OnN2HYjoZXaYKVIqE+8108k1fRsjLpB4G1bmSqHvTDbOQpJ1wK29/KldiWduy+c1bQjaJi2WvM+4ia5aQ4z8UIvaQqie0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eEHn/wCD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9Ustj019124
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EZwk1pKkeLiyo8jw2Ozdj+04
	ebjECh2JuYWqOTipUaE=; b=eEHn/wCDOprb+hLZaCBpTjpQ4Lc39cdJ3SrQ7tu+
	bvk3xc0MtqKLpTaJUxpqGnpOL+UgWrJ/2O+3aS7t/ZOLTGIu6t1qHhm/O9aT7Yl4
	8T551wjDWq353tIAKkplzcnAq4+AzKsQO4xe48auVRpcsazwxBmxcOoUtGhpG0CN
	+w4i94ZKRjAKkDoKODqcIc7JbyzTCcxLdRXWw8nnQjOkGwBMj7LapQ4EwIZFS1BU
	VQRK+jMnJXQbxOpiOaO31tsCL7ZAWubGUBAAfsnKhI0E9/2SJbw5Ae22s19tkXqF
	WNh+0tFDe02zUt0D6XaVOHMxB0N7wH9QjDlz8+b8aQTUyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdcysu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:03:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso121335285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 04:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750935827; x=1751540627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZwk1pKkeLiyo8jw2Ozdj+04ebjECh2JuYWqOTipUaE=;
        b=NoauZ7C++YyjozmOuTq1MrSOxQl7TZLfu8fT4TmYr7TCQ4Tqi7JbB0bfcxEPqSLBBi
         lfDXQjyqogOjVB7uwgCSj2snqRHeo//fvjJGQI7UpASFNYq7zbY+WJBJfOEayRXm98r0
         uMH2imMI3kP7x5TYEv9xe4dqysIQ9Nl9oCfY70bi6rLeDTzzAtpeGjVYV5JzxkLk5fOW
         0SCNr6EPB9aXFEg0IYV/6gGtHKxlynVI53/JvVe3lKHwlGOn2ujda7otCmjxnU75tJwE
         WZrMQM4ijx4z1IHAeWBJPln1dVQ6isJ8pPfUKODEbIbAEA03HvcbO4mjENghLVcHEmW/
         d9ng==
X-Forwarded-Encrypted: i=1; AJvYcCUWbJ6oIDAQNwQUZT4l4Phycm6RlnTr7sCj/EWJtwrcpasg7ZZrRgK06u2rJUDJS5/eEubn4DODo9nPoIP0@vger.kernel.org
X-Gm-Message-State: AOJu0YyGauZR0Fuuo0Ao4KERFebd6Sw6Xi5yxbgvlraJITnTiSdVE1Jg
	vqjlHDDbmNHIifJEyhR9W/FUQ2PDWIDhB5yN9X785UafcObG9jpBS9Cy2lJeQkGYjaLWVhAcXGL
	kQu2sGjsoAE1Q2NR0+mu4camTyc2wNjI3G7dx2316CcKs8eEmdeXXcQG1IS03R0Tc5Vtw
X-Gm-Gg: ASbGncsgbr6nLb2FiBZN4M/7aaX6E4Ik9D3pY5C4E91JKufm2kYDLYt/ZRS7X97Brfp
	HH3aCPPV3PahWJ9wRCByBzAYdBPFVLTzM8NlzkMKNQNE+WxWvJEKFHk1BRu5xzEF5Wz32QHDbDv
	7Ewa8xffXqY6l0zfyf3bwyKyfZBUgBHEfELac8k1LYYwDn4YWaYDJSfv6DTwPWcU3eovYzDMgDv
	n/Cy9dKJG+ykuk//Uf/x+Odvrqk+w3CZulH3uc7ouH6+7P5z8gyMtg+jFLr/hz0ywInCeLIvqAQ
	p4QUthvTpVemeqzObFK5A3C9cO8sxQkfDnlWHC/aRoUSwMQiA4Z22DkfKvW9Un5Zbd+7EJoJatl
	o/uFC6ggip4uGcHXX3o+e6Zrox4FUYJnZwo4=
X-Received: by 2002:a05:620a:568f:b0:7d3:c688:a58c with SMTP id af79cd13be357-7d43ba6f184mr401136885a.6.1750935827246;
        Thu, 26 Jun 2025 04:03:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj8zoi5S1oYETlxpiEWZ4hcHqwoUim29NF3B+sYbbnhwtnWGNdD7ekpAbc188TtZRy8dUh3g==
X-Received: by 2002:a05:620a:568f:b0:7d3:c688:a58c with SMTP id af79cd13be357-7d43ba6f184mr401133185a.6.1750935826725;
        Thu, 26 Jun 2025 04:03:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e0c153sm1967091fa.29.2025.06.26.04.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:03:45 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:03:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 1/8] efi: efivars: don't crash in
 efivar_set_variable{,_locked} in r/o case
Message-ID: <zw5u5c2itmpxq34d22y5wmtr32d4zsmjj5clf77ryeqs5jgd4v@t3wjfyj43yra>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-1-aacca9306cee@oss.qualcomm.com>
 <aF0bLtnABcGTi0wM@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0bLtnABcGTi0wM@hovoldconsulting.com>
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685d2914 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=CWZieSLx0XMgBVwFOAsA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5MiBTYWx0ZWRfX9L9qz5X/lI+N
 ZSFLbD+n33LMqj/oi0FQN9t8VRE7zrq+RhWv06Z/bL1um3ItE2IyAF/wYy5XNvJv9A3Vtw61ZAr
 HowfBGySeBfPbg0OooRokQIRvJqEhm1WY5q8THkPeKMnCpemdlcIUWGD4n5lFsr2hk3YMyYUJBY
 fe2n5m5Efex0T7uruh+3SNyS9hKEy2UCk1LPJiZv3pZZ3HhTr+kUrs/+qzsbdPOXkLDCVpxcIAL
 HDiwT2fYKUrLWM7SQg/RW5250saegrSmUmijiCD/DY2EBSQS3YuYILl+Y525MenYA7wFb2Ydp6W
 iU1lj198vDvoexvpvgt+n+hruy6hbHTPK/6fpeG1fi9ppgEbHvBX9Ua4XTczIk+In+mu1iptU6g
 6lkNoKIX1R4efY4Ke+RQBEHX/vq3YrIay8aEg2yaeZol65eE1cUM/4Kh0jumfxj5mwyCtrcu
X-Proofpoint-GUID: XA89whVouqA9kTXNAdaL80ttkQwijfHd
X-Proofpoint-ORIG-GUID: XA89whVouqA9kTXNAdaL80ttkQwijfHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260092

On Thu, Jun 26, 2025 at 12:04:30PM +0200, Johan Hovold wrote:
> On Wed, Jun 25, 2025 at 01:53:20AM +0300, Dmitry Baryshkov wrote:
> > If efivar implementation doesn't provide write support, then calling
> > efivar_set_variable() (e.g. when PM8xxx RTC driver tries to update the
> > RTC offset) will crash the system. Prevent that by checking that
> > set_variable callback is actually provided and fail with an
> > EFI_WRITE_PROTECTED if it is not.
> > 
> > Fixes: 472831d4c4b2 ("efi: vars: Add thin wrapper around EFI get/set variable interface")
> 
> I don't think a fixes tag is warranted here as it currently appears to
> be expected that the callers check if setvar is supported before calling
> this helper (e.g. by calling efivar_supports_writes() as efivarfs does).

It is not documented as such. So, I think, we'd better not crash the
callers.

> So should perhaps be fixed in the RTC driver if we agree that supporting
> read-only offsets is indeed something we want.
> 
> Are there any other current user that may possibly benefit from
> something like this?

efi-pstore comes to my mind.

> 
> > Reported-by: Johan Hovold <johan@kernel.org>
> > Closes: https://lore.kernel.org/r/aFlps9iUcD42vN4w@hovoldconsulting.com
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/firmware/efi/vars.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.c
> > index 3700e98697676d8e6f04f061f447391503f9abba..11c5f785c09364f61642d82416822cb2e1a027fd 100644
> > --- a/drivers/firmware/efi/vars.c
> > +++ b/drivers/firmware/efi/vars.c
> > @@ -227,6 +227,8 @@ efi_status_t efivar_set_variable_locked(efi_char16_t *name, efi_guid_t *vendor,
> >  	setvar = __efivars->ops->set_variable_nonblocking;
> >  	if (!setvar || !nonblocking)
> >  		 setvar = __efivars->ops->set_variable;
> > +	if (!setvar)
> > +		return EFI_WRITE_PROTECTED;
> >  
> >  	return setvar(name, vendor, attr, data_size, data);
> >  }
> 
> Johan

-- 
With best wishes
Dmitry

