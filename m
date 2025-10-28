Return-Path: <linux-arm-msm+bounces-79232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D55AC15D4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8768C341C5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451BA28D8E8;
	Tue, 28 Oct 2025 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guackWGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQw53Ua8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54C7285CA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669233; cv=none; b=Sctb3P+A5FM0yq0kW1YuGiIKA/wY2UOsmiyhjJo7O9ZVRWeQ4nHP9WjSNXXSoDTkOUEHQViJR0xbLTdPS2e6I7WGRsQlpeO0U6cVewu5gmLQQVgKNXfbv4stej97MgpphGX8zmGS0fsRJY5ZFdTd20KgqVbjRYwsulcbXbfjWXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669233; c=relaxed/simple;
	bh=eOTE/km5/N3hc+Vl51e5oupuTDoNIHQBwinbRvEGD50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUiBFLaPlFy0t4oq4H4CQKmGEUM7arvn0MiP/BMPLjfauU5Br0WqUgIDI9y7/89TRN7xjJyt1Xst5CGQmfIwJ9Yp80gZplHkGL8y+wjQzvIXIiulmyNuhAAenesqslE82L/rCN2/vndGztlNTDhYQp3eKHuTa05jkCp77Px12e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guackWGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQw53Ua8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEnl9b1936819
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 16:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUlkwC6XcdB1g2sKWT5DXiAU1YeZiR8gHbTuuonsJ7c=; b=guackWGXGQou21pa
	1jencdN8ab/rjP74joRSmFV1UfzjNV92alviYyIm77aPFlNmdpsbc94FPf094/l3
	EyBk3U1qvXPVrtF3EqEdjGboeeHD0cUtX+Ae7prGHJY89cUZgR+x9nYZCI9/BGst
	oHeOTcKeuNYkO5Hp++qSDoHaBsIJze01FaxNPKTllvNtweyjLwXIgOumLUh8u4Jk
	TK/R00vj58ujV3S2OviWZO61grvLJS86WMGJzrkaL+KsfBEG+SR5bvSpC8G98I+Y
	VzWB8qcvuLYCcw2kti705m1YsphFP2MUwPTjAnkVM1rPizU3eNb8amMFtmEMK+Ma
	1wXc+Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pjfa5q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 16:33:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so9862376a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761669230; x=1762274030; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUlkwC6XcdB1g2sKWT5DXiAU1YeZiR8gHbTuuonsJ7c=;
        b=VQw53Ua80VJ8dTFWqgBpCNXGDD74O2h4JXGswx5kHNPfRg6QonOGwhkFsNYBL5f4aG
         tkpzEkKJd2/j+Q8NIGAYmEpkCa3KLx+FLD/X2UZ2r2FYK1lD6SfE2NFeq7jy0sobiMZf
         w9DiHS+WAVc9xLtWs0PNYyLUi3M2hmjm8HZ4ggvlbdztVb9tN1E+yptiTuX/mcjbq0tm
         glwzfkuJ+9JxP+ZC1bBKrHUeHP2fYoc8hZeejDqc8TpRgfTD0CXIvP8APcqkg0fvplaX
         mpdctHxPHcYvKb9vNbMzZjVw2kgLBKkHBJu9t8RzV2qH9BYDzfSc2vUBZPaUDhkcIqCv
         alsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761669230; x=1762274030;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUlkwC6XcdB1g2sKWT5DXiAU1YeZiR8gHbTuuonsJ7c=;
        b=dkVLlWkbfQV1m8f7oYFxUmCuhnTffSJvEIDoxfw4C0vx+5n9k4Y8dqh9T5XVWJpJcL
         v1sjleiEp8Y9DnOFFioJSo4TuzGXE+jFNK4zpQES9df8e5d9qx12ljnfv/aLL/ZzkT0P
         thOw/l4FcXgW2t2B8ou7VZM79zMRkHFk8y7ckK3tZzYjOOZj0afKwGmgUVSlWDSMx0tH
         P1Sk7gsja3KwJrAV8jrjdLfhtJspvq9/dOeI6Mnv+7g9Toq9UqkZ1Bgm0OvK1FeEoYHu
         ASCGaguFgqtaYB0oVR13lr0mSEMLZQCnVp9Ay7NzO5Uk1EyRUocpFSFwRRTL5qo+nd5X
         7yDg==
X-Forwarded-Encrypted: i=1; AJvYcCVmKX9kNsEsX3Eg0H2M5quDxoiwI3EsOfSJt+7mzAdHbkVF8IzCJqf/FOtGES/wPYngkhArYjv6DXKP6idP@vger.kernel.org
X-Gm-Message-State: AOJu0YxnnJsuGJxClbjlSJCFREz/ZmzzDw65J5DX6Egvl53amRFHlmY7
	0sXVzQzuv78D79AACAuDwW/uQuppK+nSmm83Ci12oKwyOHDVC8zRIakM0hxMkDVI3rzHxugGSbW
	SvSnH14iPPSH3k9Qo0xTwap/czE1d07S7SX001Gvbf1/RZu5XTtEVeIb59HouX+f+8IE3
X-Gm-Gg: ASbGncsiDAHb5yQjP/iTnuwPiRi+k1ZA5z1T/crblh25tqmu25ZPtBpq3ZAjPsMf+0N
	kmdHRSRrxd+M3Q3wndL+rrBmR4Qx8bedOf4rWoDdMVs0GY/BCcTaVdbVXAKsq+Ozl+w3dL2Uozc
	oJC8xzsgq0OhH3C/yPmgnmJpK+97mzGCDeRmNWMHBD13/JfELKCpzpfYL4qC8zDmdDfmw3TL6Hp
	9w84rKt/Y0o3K2Zv4T41wObQCM1sLqEsVXUyqzbD3CwiWi8f4CU1hF7/QqnFtv1vIlN1LOTFRBY
	WuqeH4q+LV3uyR65ll5umu8oaXpvH5mB6rLZb3TH9fjDoWK2bV5Bd2gYBFnSQCKo9xzrmNx9eu6
	NN6jYWnklaqsCBSQJD8ttmj5y69brL5xN
X-Received: by 2002:a17:90b:3e85:b0:330:84c8:92d0 with SMTP id 98e67ed59e1d1-34027a7b894mr5148799a91.24.1761669229964;
        Tue, 28 Oct 2025 09:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBwVsnIJ+qpjTls4rI4uT97ont7N/GI7L+kklzoYSRhy4gq3CY/JaWRK/RGD+wDT4w8EK3Eg==
X-Received: by 2002:a17:90b:3e85:b0:330:84c8:92d0 with SMTP id 98e67ed59e1d1-34027a7b894mr5148741a91.24.1761669229318;
        Tue, 28 Oct 2025 09:33:49 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71288857c6sm10705179a12.18.2025.10.28.09.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:33:48 -0700 (PDT)
Date: Tue, 28 Oct 2025 22:03:42 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
Message-ID: <59a00934-cb42-43de-ac5b-a9292b08301d@quicinc.com>
References: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
 <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
 <76479593-c47b-41a7-8349-5d7c1403f7c0@oss.qualcomm.com>
 <73955d58-544c-4299-a099-bfd9e5912a40@kernel.org>
 <636a1f99-acd4-4904-8fae-f159646cc1a0@kernel.org>
 <f4d80be9-986f-4d37-9c25-725eff7bb653@quicinc.com>
 <e03373d9-e2dd-48b6-93a6-554fcd623718@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e03373d9-e2dd-48b6-93a6-554fcd623718@kernel.org>
X-Authority-Analysis: v=2.4 cv=Ut9u9uwB c=1 sm=1 tr=0 ts=6900f06e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=cz7308oxQqenTtKe3SgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE0MCBTYWx0ZWRfX/YPxXrrHAB2p
 OyVNbIUpY1q3tC6hVuQUKIyTzZ/8ZyDESQwhngkWQWhUkD7upNGhPP2SeG5oFPrHBrBXULUwmCq
 E4T23RvPftwIwuvEpgbxKZBf2gfNXw8G4y6w8P7bq3RZluG/bT2SWVWPFIQCpW+Bdpcls6FfJqw
 sgMiyXeRFdo6uvGZce5+fkG1hdDkuyYx9aExkf5zOtQtpc0Ka66/pRphAfwWK2mvH+GWlGJzg15
 RjkzSPXBaDWX0+cjFjNjeo/mGVGQEUtLaCSVQi768qt/ojMG6ZsY/c3e8hs3vwroZTMfx7dUUle
 Fkaj153UameGmZeS3CzXoJNhgclnKtWhREIDedWs5pejWuV9/t6Gp6sJSXzAyK6pm5zlzFPgKul
 EqtP+MeW4naycdKoJFuakGAGWyK6yg==
X-Proofpoint-GUID: KqwjL_hAQelwpjttBCGSRNclGC9vNDcb
X-Proofpoint-ORIG-GUID: KqwjL_hAQelwpjttBCGSRNclGC9vNDcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280140

On Tue, Oct 28, 2025 at 05:17:44PM +0100, Krzysztof Kozlowski wrote:
> On 28/10/2025 13:27, Pavan Kondeti wrote:
> > On Tue, Oct 28, 2025 at 12:07:40PM +0100, Krzysztof Kozlowski wrote:
> >> On 28/10/2025 12:04, Krzysztof Kozlowski wrote:
> >>> On 28/10/2025 11:58, Hrishabh Rajput wrote:
> >>>>
> >>>> On 10/28/2025 3:10 PM, Krzysztof Kozlowski wrote:
> >>>>> On 28/10/2025 10:35, Hrishabh Rajput via B4 Relay wrote:
> >>>>>> +
> >>>>>> +static int __init gunyah_wdt_init(void)
> >>>>>> +{
> >>>>>> +	struct arm_smccc_res res;
> >>>>>> +	struct device_node *np;
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	/* Check if we're running on a Qualcomm device */
> >>>>>> +	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
> >>>>> I don't think you implemented my feedback. This again is executed on
> >>>>> every platform, e.g. on Samsung, pointlessly.
> >>>>>
> >>>>> Implement previous feedback.
> >>>>
> >>>> Do you want us to add platform device from another driver which is 
> >>>> probed only on Qualcomm devices (like socinfo from previous discussion) 
> >>>> and get rid of the module init function entirely? As keeping anything in 
> >>>> the module init will get it executed on all platforms.
> >>>
> >>> Instead of asking the same can you read previous discussion? What is
> >>> unclear here:
> >>> https://lore.kernel.org/all/3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org/
> >>> ?
> >>>
> >>>>
> >>>>
> >>>> With this patch version, we have tried to reduce the code execution on 
> >>>> non-Qualcomm devices (also tried the alternative as mentioned in the 
> >>>> cover letter). Adding platform device from another driver as described 
> >>>> above would eliminate it entirely, please let us know if you want us to 
> >>>> do that.
> >>>
> >>> Why do I need to repeat the same as last time?
> >>
> >>
> >> Now I see that you completely ignored previous discussion and sent THE
> >> SAME approach.
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
> 
> 
> So where did you use socinfo? Point me to the code.
> 

Okay, lets go a bit deep into the socinfo part. we have used
`soc_device_match()` API to detect if the device is qcom (`family =
Snapdragon`). It works. However, when we built both `socinfo` and
`gunyah-wdt` as modules, we do see that `gunyah-wdt` gets probed before
`socinfo` because the driver that registers socinfo as platform device
which is `smem` probe is getting delayed. As you may know `smem` device
gets registered by `OF` core directly before the whole platform devices
are populated. To make sure that any configuration works, we went with
`qcom,smem` based detection. This is mentioned in the cover letter, sure
it is a detail that can easily be lost. Now one might just say go and
fix probe deferral problems. The problem here is that `smem` platform
device creation happens differently to other devices which is leading to
probe deferral. I can enumerate the problem in much detail, if that
interests you.

Please help us understand what is the real concern here? we don't want
to call `of_find_compatible_node()` API on non qcom devices but it is
okay to register drivers. It is still not clear why would non qcom
devices/platform which care about performance load all modules that gets
compiled with ARM64. Needless to say it would load lots of modules and
register many drivers which never gets probed.

We are in this situation because the gunyah overlay does not apply on
upstream device tree [1] , hence we are creating the dynamic platform
device.

We are adding this device to support watchdog (thus collecting ramdumps
and supporting restart) on devices where Gunyah does not support any
other type of watchdog.

[1]
https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/

