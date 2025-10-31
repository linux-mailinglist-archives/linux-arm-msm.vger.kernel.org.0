Return-Path: <linux-arm-msm+bounces-79886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C85C24F1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99F151885837
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838C9347BC0;
	Fri, 31 Oct 2025 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxuhDPyn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxctMC8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E73469E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912728; cv=none; b=IiWR/4JWBtkF65+c2LSe17MhnQV0jq0n1dX0PgZTSAdJHrR9sl2ZUcIF+kPF+NdVLHxb7LZptjFDVcG1NgdDkpGCdaRbdMYox/FWqIzkspINy/JB+IjrrS3XNIDLVpAihJQw8IV0PLhN+RThlQUdiwUyDv4qJh0cIBCQkEj5Hik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912728; c=relaxed/simple;
	bh=histqgWYWRJzF/fRVEEH99JEM6BEShvYwzywG0nFBU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ng+GW9qofQew4TBJZ3qitttP/BjYZr9Wa7zXv6DN5MoPapRnYeRmz53hDCLXA2SAyOPmZfTn40bwi4uanX5xCyiPuiyjdhFm8rVRIU79++koKlp1icEajdUofQxIhDGPkH85RQfmMeDAYGhuLMVcyUKh0MOX5O+Up5fWAe9LBIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxuhDPyn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxctMC8S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VA3qke2558892
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t0ntCCJGokp8wjeBNRQ5jO4E
	1nDyS9ibjhGJgiXXXCc=; b=pxuhDPynTe4oatb/be/N1kufH8tqBh8BbQmUFBc+
	Umae1vEejTxvazmw5bvc+rHDy6X0tdczjJq/396cXHR2D1eZbWcpYCcNjHhmdSNF
	LC1jiUmQa3FR7DHngMBz09YZ+OR+le24Hkt4/7DA7RUAOqaAy1rGZmE8d3nBAr36
	VRX1BOc6HJdEUORYGDWcGtja+amIz9ACOq3Sn9yRgGfCpQXAzMi14saO8+P1xJhT
	w2JZ8V676+YMrKc/jV3fkQGy5P0EfXnrPbB/AO/dekXxSWOZ0p1wPP++V0z0R+cs
	vi1X49No2SxHc9HfuRR2Fq0cDjcQp0Eslg/3yj26SrmlDg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4u1graex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:12:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-332560b7171so2462217a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761912724; x=1762517524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t0ntCCJGokp8wjeBNRQ5jO4E1nDyS9ibjhGJgiXXXCc=;
        b=HxctMC8SnZOJ9PZ1n8ODxwYZMkQgUnenrWXRZ9vrltF1VnwgJeQwu6VsOFlkcOA/el
         bimyCac1jBG1PGT4n12L+hWfGneqWUurFqxLEzO9o4ZeSR6Fxn4GYqQg9w6M7a+Wjg0A
         VRFmY1vDaRqtJnYi7GazA3nTev6fIPz3v+a+oZyZyhMZZqkyzVDAyZ4ctk+lUA8vuO1c
         lbvFF3WI8DRGBsoKqRWpHsecCf5ke0ozpp5Kgd+j+DOVBk8xl84oj+l0dqEKsN9Hp+Fb
         dFt4F95BO7sdpc0OdvWpeO9NalhZd9JHkQ/5uX4CKzbJHo3hwwzzSk+mWAACXap3LaxU
         /WsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912724; x=1762517524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0ntCCJGokp8wjeBNRQ5jO4E1nDyS9ibjhGJgiXXXCc=;
        b=TjW9b/wPOo8qa7a74uDQt9VqWpqNkSr0JhTPlYt/yrHwMf4VhPpFTbY88CU4HL1ZQs
         skLksx9jLU8kbXdCiEYcI83lCa7SdtYAybDcXoCU7HnVaIErm8oTZkcy2Wyl/gzPgjuw
         +XSQSm13sxDvIoWG9S5ye/RPQ+wDGN2+Jhegh1STRT5q4nfvsNonJVsCX9euPsYiOJuD
         7spUyBkcRlUBgjj3sk+YUWW+/ibfGAa6168gvWhTUsLG052iUUHh0uAWm2Q6YmIYEqwE
         el8eivvAve+EX09ZdtMwrK4N9Hl9CrSjyfG618N5x8eKm7RGHweEfgdpErzgaw7Ufnrq
         k6IA==
X-Forwarded-Encrypted: i=1; AJvYcCU/WyoAZ4CYNXOfwkTmUdNAYycKzOwnVOoK/gTpcI4LzpB4KBkJ0SvBwitSWmu7jRC1FkaWyvbij4l3IA/R@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmj/Zyzku2GtHiSnbS+BX2CRB/5/rhCbeuSy0vM1x7sslkFLss
	Ass8iE+wz/Af/+hRw+TXlQk4QpGKOd4yBUgKRJdPmw2b5QOe+W1yqcjVlkRoWQJMWC5COpLP64E
	i64w8nS+em5NRofil6QivHLZa8pBaD30up75OA9UwLRhXfFMW/HHieZD3wOzciTw1H/VCJhDDeY
	CiS90=
X-Gm-Gg: ASbGncv+d4JOsbqLMvWYuG9wRO7vnzuvo9KI3v3GQe5X114OThVy20GYBXYoNo3fGjB
	7HPrYAnwqjnDZEesNGyjnXJHS+2U/xM1EDp8OSmrs28wUT/SezFk8IV/Q0y7TiJp2OdOMrpA57h
	1yO+z7+3awMtPMVxr4Q94lqOYduj0Xd6OChPGOxOr51c6xDqc/lmZNYvXJya4FQry3PtF09ZM63
	M8O+b+icw/4+Vah7sLRrUXfCvz/o6/Wz51uVlVt7AhyAKHWzeRpZfNG+S4qOqgZh4v1NP3K1Eva
	cnuQdSY7A/G0C1LmqitYl/ojkPfacqIDN1X599GHZKaV3ufvfXcDUkHS3TKSzT5LWZdy6ORr5Vm
	IwZ83dFRt51VRdFT5IMs6UxfthrjSO58N
X-Received: by 2002:a17:902:dad1:b0:27e:f03e:c6b7 with SMTP id d9443c01a7336-294ed0982fbmr89140555ad.10.1761912723484;
        Fri, 31 Oct 2025 05:12:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFkkeZRsiuTlC1EpCac6wkygqEXe2Ou1I4f8XHFqwZycCb3yybQhK+4zAvwptAWwbxS1hO5w==
X-Received: by 2002:a17:902:dad1:b0:27e:f03e:c6b7 with SMTP id d9443c01a7336-294ed0982fbmr89140035ad.10.1761912722819;
        Fri, 31 Oct 2025 05:12:02 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268b553bsm21984775ad.39.2025.10.31.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:12:02 -0700 (PDT)
Date: Fri, 31 Oct 2025 17:41:56 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] watchdog: Add driver for Gunyah Watchdog
Message-ID: <09e8485f-f512-4069-be9f-3e94fb142aa3@quicinc.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-2-7abb1ee11315@oss.qualcomm.com>
 <13d2963d-e931-4e51-b875-a1650b899bb7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13d2963d-e931-4e51-b875-a1650b899bb7@kernel.org>
X-Authority-Analysis: v=2.4 cv=Lo+fC3dc c=1 sm=1 tr=0 ts=6904a795 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=SWRU6URpa7t1zXFJtNkA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: LBNPeI3oIDIBWt5rnal3J42dCajqhV4J
X-Proofpoint-GUID: LBNPeI3oIDIBWt5rnal3J42dCajqhV4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDExMCBTYWx0ZWRfX8gusbacxjFeG
 z5NdFVEpmfYWbjK2fX6O7XAyUK1d7UA/5as1DG5TZ+njWX2Xm16+suG7RXrc1okr8QqKsXBGLKJ
 XnTXJTgHGeF3nwA1eE08IsuPbnMWj4gPI8O3erg6RGVJ9bHmW2UgEjTlnrBhNItPgKbJp9r38UE
 fAsMwnjY0XiXOkhcaGBFnGc4nf2ObycK7aUPSOm4OcWxuEBl/8iVtIIzAe53IsLVc0lEgfhErFD
 sv28Y+Ks7D3xUqXqtVF9QkouyxbGk1qm6AzgZvZDgH+CEAStxZcSPAqUWFWQZ+x3l5jaZjymkGD
 z/fcqiCZ6xoeeFoks6gI9R/3PL0FxLxi3JmaBcF0LOuP9pwG7yybfsfgIx5bonFGFkv5bh0Q0Y3
 +uK4/IxxfzP/UA180uXTfZg1oEaHxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310110

On Fri, Oct 31, 2025 at 12:48:18PM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2025 11:18, Hrishabh Rajput via B4 Relay wrote:
> > +
> > +static DEFINE_SIMPLE_DEV_PM_OPS(gunyah_wdt_pm_ops, gunyah_wdt_suspend, gunyah_wdt_resume);
> > +
> > +static struct platform_driver gunyah_wdt_driver = {
> > +	.probe = gunyah_wdt_probe,
> > +	.driver = {
> > +		.name = "gunyah-wdt",
> > +		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
> > +	},
> > +};
> > +
> > +static int __init gunyah_wdt_init(void)
> > +{
> > +	return platform_driver_register(&gunyah_wdt_driver);
> > +}
> > +
> > +module_init(gunyah_wdt_init);
> 
> 
> Heh, what was my last message? If I see module_init() I will NAK it.
> 
> At v3 you really ignored entire feedback and this one here continues the
> pattern.
> 
> NAK, please read how Linux driver model is works.

You mentioned in your previous reply that

```
If you call any module_init other than module_foo_driver I will keep
NAKing your patch because it is wrong. I explained why wrong already
multiple times in previous threads and other discussions.
```

If you are referring to why module_platform_driver() is not called here,
Hrishabh answered that already previously. Please see
https://lore.kernel.org/all/ndwwddd7vzjpgvzg55whdno4ondfxvyg25p2jbdsvy4lmzsfyy@jnn3wywc7xtp/

If this is not what you are referring, please let us know. Thanks for
your constant support/feedback on this series.

Thanks,
Pavan

