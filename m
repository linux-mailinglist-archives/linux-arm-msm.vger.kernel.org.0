Return-Path: <linux-arm-msm+bounces-79233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CEEC15D9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 51FEC35552E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2D827F00A;
	Tue, 28 Oct 2025 16:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+TvbsPX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrIRZbrz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370692165EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 16:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669399; cv=none; b=a+asoPXUpCKV43vFESML87V0HtekLvv/Z1NV1aIYMAvxSoJHK4/h8VqJ2o+ta17wr3STCnjSPlK3oAxCtgKIRyNpTSfw2ogxdylU638ssLpO+8h/R4CfRP0bvCxUqKOsLPFJwORDP54H3hKM3pEpCOt9G8Rz+ZHbZNLhbCdXGFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669399; c=relaxed/simple;
	bh=R+kXUmWjWTHEBOQb+HjDtLqQJ+wEDFTkf+k25VZZb+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EENhFxsIQyOO3HTVlAeYU7OZoEOJ78izGjnrDA1q/fdyAuldSFb0LKO1cfz6Sq+aYoFCj1Mfedbh2I0hNwJbcv/DEORveUK7j1lcBbc7gkufBdWg8rY/Xg5Qfqrv2YCGWGF23Mm3MsWCiOlyhMypFiix2iWKgilZO9ZW95Z0cFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+TvbsPX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrIRZbrz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEnegw1965799
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 16:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IDy4RuHcBK/trnOXa9pH22wBSBIjqvvm5qYWgqrwY2I=; b=e+TvbsPXKIRsOvoK
	RdMMunjunk1nyEmmK+THzt7/rXnU4P3GRo2vgUImhK5tUpoNw1xglDEWS9K5PeUc
	/LIg55la+ak+5ObLLDITrXE3BkEieJIermNlhCCTyv73LN1ByqM4Mh7mvQ8FuRVI
	TjXG59mD6jNmVLab+Se8lGgfWtEcPZf5piBzW7vMEe+ssHPxOUTxzJ1ZKgY9CRnq
	Rc2IdXpIrWIO1fm8cMGPmzCO8c/hDt7adZoA9J32dmi9BGAqoO/Be8vka06zl2fV
	gDSgBOTE9HSlTzWYJPiIZhD0FZYJn00T+CNAFSfb0c5+dXgt82nKW6VzDVldD7Tz
	b7kDtA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2w51rwgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 16:36:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290b13c5877so126166875ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761669396; x=1762274196; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IDy4RuHcBK/trnOXa9pH22wBSBIjqvvm5qYWgqrwY2I=;
        b=IrIRZbrzW5xP3OgrZWqghQA0gtmUcoY81CYJUY04Kpe+KLUZoMoApMo5iLo4Qssa2p
         K26c8gwWlsG3VUk771GZVV2wfnI9g2O58Hka02KgE9KFxfyFeTWyiHnUTwGZJt3IFqTG
         vGHBSrDI+EmmWBafCtwU7B9ukYLpJ9WhVouYTOhBZlAQclBzSoHqyONBbR3++vxXFCWF
         MjMO4GMRrD4wHWjcDRjmyW0C+8qlxBDXWImiHdBHFRgzowZ08LOciOHNpwzwT6Z+5D1z
         TowzCHeCnOyQgoLE53lQgXHPQJT/o9D9jaMvKIPAVE8KxoH7cfjQAavFctYVBXQPgy5E
         OJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761669396; x=1762274196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDy4RuHcBK/trnOXa9pH22wBSBIjqvvm5qYWgqrwY2I=;
        b=v7mq5oKr4h9KxY8PguDqUzr7h7Xckh03Pi3fOkzECjsj0FnUnIk6YqOhg5vicdHn9F
         +mMzD3ZCiZZMRS8tCFF68WYrfwCXWbMnwbplgAZAaltNOmgUUtggOHthD9JH0NprwQLU
         VvceWOCt9DBAEZmek96NR9lRehlCkeQObU8NnqHk+kl2Ehey0U+Y4D+M3plxnLbrN/6S
         cojhriV4QIHtkPhJtx1ivQ3ZjrdAVvFWyxtYKGtA8Sx6q6XWDpglK1F0PZCm04KoN537
         Bv1VXIu90du1QIeYZ49/DkPjMekXrPF6R/Y7XKGceR8tinzzVC8BRAsi15S0HxpXfddc
         RaaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2xO6PcRqFouVRKpsXKVIfONF/BJEf/+JrelHC0dr05f0tagmZugdOseRBTBBT8Vyh+77kfW3cS98hzqYI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrdzpp5jOEwe0YJDNG3ID97nAJrv/a5VrBgTCXH5bqf2T+eYtJ
	kY6zrHNY+D8JEYKiSQTjqk4sZEV/M7vqkQGh723rgWm+rYYt7Tz2Ph4rJXCT8QeIY0nbUxPskVH
	M8e/pJor00r2zE1Y6krRRJ6yHy61BLJUCjHWHkYHRq/aCLeEgx0PQgJD4W2fvGcjNUbAW3UjbvL
	SPmNk=
X-Gm-Gg: ASbGnctzyEA3uYhp4kt6++Ku2na7qVfNPi6l4mQiF2pRIfx48cuh/KFSlRO4t1Pe71w
	+f8dKJn7OUZWKGnztfIU5IjEaKHk/qi/VsHaBQGiprIZAqLd6+4TWow5CLIMjdHSP2ebrbDgAhb
	RdxXgNvZTKdQg/OvPHD1dRfkhkckDixdPhFqDGRYqquKGh2ztXqz0ZAyG3MMkbZSE5cYSUV8wcY
	Af3q+Ryfp1rbZCrBcUlf0PG2ca48Md1vvv6sPiV6qkrDtgBQmx6tOzCaR+/25K/UB+mLlV9aSgM
	q5yKEzrjq3fc3KrM/ML51WpI/M+w3tKRgio+FPSzeV32NSll3v63LxnKKtDj7nZ3mPRtTrrX8sz
	Oida3xFCN6SsQYLnL1EABznLpGDeDdwIo
X-Received: by 2002:a17:903:18a:b0:290:c94b:8381 with SMTP id d9443c01a7336-294cb35ee8dmr53022565ad.7.1761669396238;
        Tue, 28 Oct 2025 09:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj7rkOx2SsV5XGl9//9NqaBw06fgF+m0ijFKwzmMNh7Gb5Vs0Bz9JOF8R0r+XLduxQT6z9xg==
X-Received: by 2002:a17:903:18a:b0:290:c94b:8381 with SMTP id d9443c01a7336-294cb35ee8dmr53022165ad.7.1761669395585;
        Tue, 28 Oct 2025 09:36:35 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed739b81sm12694276a91.6.2025.10.28.09.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:36:35 -0700 (PDT)
Date: Tue, 28 Oct 2025 22:06:29 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
Message-ID: <6535f199-901e-478d-9eae-d7977e328048@quicinc.com>
References: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
 <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
 <76479593-c47b-41a7-8349-5d7c1403f7c0@oss.qualcomm.com>
 <73955d58-544c-4299-a099-bfd9e5912a40@kernel.org>
 <636a1f99-acd4-4904-8fae-f159646cc1a0@kernel.org>
 <f4d80be9-986f-4d37-9c25-725eff7bb653@quicinc.com>
 <321f5289-64c0-48f1-91b5-c45e82396ca9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <321f5289-64c0-48f1-91b5-c45e82396ca9@linaro.org>
X-Proofpoint-GUID: GMf9KSA-ygEthI5LQyQMVX6XqKXgDdrW
X-Authority-Analysis: v=2.4 cv=YMiSCBGx c=1 sm=1 tr=0 ts=6900f115 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=m0pS8v8U8c8UNkmDbbEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: GMf9KSA-ygEthI5LQyQMVX6XqKXgDdrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE0MCBTYWx0ZWRfX7lTkp8iFBBtM
 rc78hc8s/7qIzszkrpeO6hdTQaDBVDVzZMHXtmUnzEpxH1QqVqXHKjigc5kQQbYiiJw6+254SFD
 he3LPAiGB632T51rwP0yW8i9aHSaBhzwDRr5YMLeqVbQu9wH3SNmrj3u0gtOWOcL1XinAg12A/s
 5T9tEte/y4VNzZRcVv0JWbHFz1WCckB0Pml7+yNlbXMKRzL4Axjdw2j8Uk4Pasw3iNjT5C46yZX
 QGcgb4dVbl1rOCe3a1LHhiKL5Jue8DZPAjqbMgWnUC55iNckjeLDEZuqM2uoweyK9RPNBcxCYXB
 JxWu+73WdpRpitYNFEtZ5qG4de8B6u557YllDRS46Ac1SmI/Qu8Y0nF/HF4qIIMjNMA+elUpuJu
 O+RhEj1Z3H6o0CAqlUD0dJtaTSOnxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280140

On Tue, Oct 28, 2025 at 05:30:48PM +0100, Neil Armstrong wrote:
> On 10/28/25 13:27, Pavan Kondeti wrote:
> > On Tue, Oct 28, 2025 at 12:07:40PM +0100, Krzysztof Kozlowski wrote:
> > > On 28/10/2025 12:04, Krzysztof Kozlowski wrote:
> > > > On 28/10/2025 11:58, Hrishabh Rajput wrote:
> > > > > 
> > > > > On 10/28/2025 3:10 PM, Krzysztof Kozlowski wrote:
> > > > > > On 28/10/2025 10:35, Hrishabh Rajput via B4 Relay wrote:
> > > > > > > +
> > > > > > > +static int __init gunyah_wdt_init(void)
> > > > > > > +{
> > > > > > > +	struct arm_smccc_res res;
> > > > > > > +	struct device_node *np;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	/* Check if we're running on a Qualcomm device */
> > > > > > > +	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
> > > > > > I don't think you implemented my feedback. This again is executed on
> > > > > > every platform, e.g. on Samsung, pointlessly.
> > > > > > 
> > > > > > Implement previous feedback.
> > > > > 
> > > > > Do you want us to add platform device from another driver which is
> > > > > probed only on Qualcomm devices (like socinfo from previous discussion)
> > > > > and get rid of the module init function entirely? As keeping anything in
> > > > > the module init will get it executed on all platforms.
> > > > 
> > > > Instead of asking the same can you read previous discussion? What is
> > > > unclear here:
> > > > https://lore.kernel.org/all/3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org/
> > > > ?
> > > > 
> > > > > 
> > > > > 
> > > > > With this patch version, we have tried to reduce the code execution on
> > > > > non-Qualcomm devices (also tried the alternative as mentioned in the
> > > > > cover letter). Adding platform device from another driver as described
> > > > > above would eliminate it entirely, please let us know if you want us to
> > > > > do that.
> > > > 
> > > > Why do I need to repeat the same as last time?
> > > 
> > > 
> > > Now I see that you completely ignored previous discussion and sent THE
> > > SAME approach.
> > 
> > Our intention is not to waste reviewers time at all. It is just a
> > misunderstanding on what your comment is about. Let me elaborate further
> > not to defend our approach here but to get a clarity so that we don't
> > end up in the same situation when v4 is posted.
> > 
> > https://lore.kernel.org/all/b94d8ca3-af58-4a78-9a5a-12e3db0bf75f@kernel.org/
> > 
> > You mentioned here
> > 
> > ```
> > To me socinfo feels even better. That way only, really only qcom devices
> > will execute this SMC.
> > ```
> > 
> > We interpreted this comment as `avoid executing this SMC on non qcom
> > devices`. That is exactly what we have done in the current patch. since
> > `smem` is not present on non qcom devices, we don't make a SMC. In fact
> > we don't even create platform device/driver.
> > 
> > Please help us understand if the better approach is to just register
> > platform driver here and let qcom specific code add the platform device.
> > 
> > Also, please help me understand why would non qcom platform who care
> > about performance load all modules that can be built w/ ARM64. There
> > will be many init calls and platform drivers registerd but they never
> > get probed at all since their platform does not support. I am not
> > defending our aproach, but trying to understand the rationale behind our
> > approach vs alternatives.
> 
> +static int __init gunyah_wdt_init(void)
> 
> will be called on ___all____ arm64 systems which uses the vanilla arm64 defconfig,
> while we could say the first call of "of_find_compatible_node()" would fail on all
> non-qcom platforms this is still unacceptable.
> 

Ok, point taken.

> The solution is to attach the wdt init to something only probed on qcom
> platforms (not the module init, the _probe_ which is mapped to a DT compatible)
> and very generic like socinfo which could accept HYP stuff.
> 
> You could also setup the HYP WDT from the qcom scm driver since the
> communication is smc based.
> 

I think we are trending towards the same approach. Similar to how
`socinfo` platform device is setup by `smem` driver, `gunyah-wdt`
platform device can be added.

Thanks,
Pavan

