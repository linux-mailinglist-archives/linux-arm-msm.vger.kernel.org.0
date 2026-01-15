Return-Path: <linux-arm-msm+bounces-89150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F0D22DEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17F863045DF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCF4285CAD;
	Thu, 15 Jan 2026 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgUjZs1w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3/YDqKu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C56F288D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462378; cv=none; b=RnJRI/JSI095voFxlzDwexLFiBwdgV3yJhyXxp6VXJSSB6JA4k8HWctUSKOLgFETGprlK3z2VedurRU0bpDlDaqdK2RuxZXW5qxJwF2mAdjotgMzSg8NIRIfkO8kBogWvYrxc8DcronNpHiBdz74rb2QDb8CLelNFFYKq5MkjjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462378; c=relaxed/simple;
	bh=ZGwd+3w9Yjg09ZMx7Mygkp0vWF6KVHpTibl4b1LJLYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0D0b8LvWdrwPItTYInsi/uA2jJIsVr+aNs/V7oRll8FGmgRxtKa2b6h/7L98MrNR2qOhQAqaVSAfc0FLPWIi/ux7zL/uPky3kSz3Xi68u/APDztX5tWGqIcmocecduwOuo9FdZ6kZL700KGsuk7Z4nX62BjXvN2DE+DJmOlIp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgUjZs1w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3/YDqKu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fojM3419549
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SLbbvamxepGgf/u6fPpyriqtoBuvPW3/6gwPrefZUJ0=; b=cgUjZs1wco8p0ZZy
	hoCmGo56ZXdg5hQZ/wR1qZ03CTbHWLuWHfNj/KZzrl+hn8eWlZw/kKTpMQ8bY/RH
	qxtpWJjUifgXhols/Mrt1HYTT+ioHSQcNq1yeS746wNN3U3mUBwIPUAcQwgf/NlE
	feP8wD7TUmR2S/6p0UNpNr6zWA/4qFVzbGXjTMNCrKg2TW3wqsUMycBZQDvujikn
	5+u8SJy58EUMFoPpqoXVJ1uZ0EB3wr0B4oSeZwKZXUQVkU44lSNkuAXnvNE1Ucyq
	wI/oHlt4Tm1KwXA4QR7GTDwCV7F9YKDWwQ/tY0vP0AvWK8ouk9b5VUlunajZoyWA
	KO8GSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj89jvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:32:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a0ec2496so57252985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768462375; x=1769067175; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SLbbvamxepGgf/u6fPpyriqtoBuvPW3/6gwPrefZUJ0=;
        b=Z3/YDqKuewO7h6SWgocdDMs+bZ1fJtoUfi8zIDJRUjM81MwpVw07cSlsw32rPUAko/
         OloiqH8WV/bxD7fw3ZApA4a58LMaTe351gY/pBdtbAZKLueEOsR9wVCULhu6ji8fhSYZ
         9L+cmOjXYjH05myXFGx9nfTo3QYd8YdcFxCQ9rdB9/NCtu8jETvP2OifppH/TddH4ehB
         JL4cxqWu1P3iM4MroavmvQlTVeLBbZIZ7KaenM6yn31gGBt5PT23Sele9iwt9Kr57n9i
         Ugmmc8/Uv/J3+jOPhaJ57CbHF2gnvEhx7NhA7GZAMSrHgt+/D5ISUjQpmbR3KbA7gP9z
         VRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462375; x=1769067175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLbbvamxepGgf/u6fPpyriqtoBuvPW3/6gwPrefZUJ0=;
        b=JBU3uSTWhMj8z0SartHPHH+bGcXw6NEYYU1tdWx5Tq9uz/xB41paHH50qWfaJWJSR+
         j1x6LhaIKIpGu9qL7dZCLtHkdNgiaz8llVIQiOEgsAzAxQ1Q5E7obGlyfp2FH+3IxwJz
         SFoFx7vB7xQ9DHZpzGsLAKiMpcOh7syIN3A/eZsO2InTcNJOOj+Q2tC2z0wsjLDVNdlM
         wgmQqgcmPqwMXX+hNWByZzF8EVluT31cR1Ro/yyq5XzNXguX5R6H3e98DICGWWKvglOs
         PUR4vXlg0v/f4Qe1oFgsPka6YBa3SDTk5+60ClB6yaubhSFTNA8bOCM1nwgpOrUOrxmc
         wMGA==
X-Forwarded-Encrypted: i=1; AJvYcCXdjD4PQZWY3l445O8CDKQs/9OWGKZwYMhhA6PPl+LTAEykL3/L+4xhKKOlRuo9VejZnCsKxAD68ijn979w@vger.kernel.org
X-Gm-Message-State: AOJu0YxveyhUwpkXdbyKTHfESsHgNkQcQcQwziMpKK6blfbMec/fReit
	g7I7lec8ekuTbpEs/0WmGm8m7ixCBPOxim+aWLaMimre463M0IbbnA0pxRe5QLCHmx1DFdQ1ZnG
	ZSxw8mtnKXpCrYo5GY815Y1UZh7qU64yILY3vJd6wnNImXD46X8Y2ZXRBdqgVsGkh+dyf
X-Gm-Gg: AY/fxX5CGw+HO8PYazKYHYYZJtg3/QkgcJH9/PfJTIX61wKIGbMUM36LvC/lTC5+mGf
	LZvshJA1IdT5QWAkQ6n82fTJeccbEq8o+WayS13Qaflpx0mdizVXi7HgoSxu37zv7l8FCAR4EPu
	A9CXXAWJ4+FJJ99iJB7wtn7bkjceeR2InFg5Hk/cZ+bF7L/76wil2dE2Y8sTfs06r6zsVpE1X1w
	Qlc72SpiejX5AdePM2hffCEX/t3aNdpELOzqPZr5DEFGTFBWnPQS0b5bHXxlMHeKrAi4cp2bbfK
	Pj64cjyGoacDM86pr124RzzDQTcig2g6nLjErkE+ApVuXTXn50n4Dd8fa8qFuEjvzw74vUO+qHU
	EAQijEyh+NTN4bwvaqkYYJB6wJoqokSBcYXugPZGib6TP5qWzVNdhxfgyp5SSGLUjFSlAL91f+k
	0iLl7/mO++YG4vfEYjSaA5ZoY=
X-Received: by 2002:a05:620a:469e:b0:8c6:a341:ac1a with SMTP id af79cd13be357-8c6a341adb5mr9865485a.52.1768462375269;
        Wed, 14 Jan 2026 23:32:55 -0800 (PST)
X-Received: by 2002:a05:620a:469e:b0:8c6:a341:ac1a with SMTP id af79cd13be357-8c6a341adb5mr9861785a.52.1768462374663;
        Wed, 14 Jan 2026 23:32:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1041258sm1402887e87.46.2026.01.14.23.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:32:53 -0800 (PST)
Date: Thu, 15 Jan 2026 09:32:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: qcom-pm8xxx-xoadc: fix incorrect
 calibration values
Message-ID: <gsbzq64tvhac4u4ybeheryenftay6gprvaclcy3fgsrfsonhkz@dt2jhhbgbjzs>
References: <20251028-pm8xxx-xoadc-fix-v1-0-b000e1036e41@smankusors.com>
 <20251028-pm8xxx-xoadc-fix-v1-2-b000e1036e41@smankusors.com>
 <7558d070-762c-4c81-aed7-1b087d131483@oss.qualcomm.com>
 <6f68327c-73b2-4684-bc8a-156714b6e3fc@smankusors.com>
 <b4a86788-fe0e-483c-93ff-fe993edb3181@oss.qualcomm.com>
 <drqbd4yzvpcj5mauyees67a5vyfr4pt4lgm7npsye45smn2f3o@yyemg6qho7ut>
 <60245ae3-c489-4dea-9252-3a200fb6f6e0@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60245ae3-c489-4dea-9252-3a200fb6f6e0@smankusors.com>
X-Proofpoint-GUID: I0yYAOPakUZVXotBHlOE5OKCFrl_cPbs
X-Proofpoint-ORIG-GUID: I0yYAOPakUZVXotBHlOE5OKCFrl_cPbs
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=69689828 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OQN141zOAAAA:20 a=9AdMxfjQAAAA:20 a=wxLWbCv9AAAA:8 a=fyqex1xKnRbniVvmEpoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=QJY96suAAestDpCc5Gi9:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX24L5tziXINCu
 XI9wYEg312inyIy1epTZ0GX9oF3fUUmP8+RpIx27n8TEqT/luEDF+sBirB6ev4LqRKuskGggJw2
 ZWxiM6eDKSA2HKEkUVykW5lu+TtO6c9ldmt52c9+0iMvIzmMxyHoaHh1VwSvj67VYhYX+2ZuWkI
 VZePN1WnrflyskYhmlU6dPGN1CaVpcm4mRI7OWHyilZq4dpUxWk18d2/H4VOygo5MjCAk1AndZ/
 DUThs/lAoGON7M6seGRF9ijLSrgYUtBufAdYcnCa8rjTWa2JsDepogFQZkbmF4OGkjZPPoSAt1X
 XJqG+aUWScz9AAQajs+fMHZS5b4++nwFVVyTjNX+TazjeuEkYaOjdhr6v9d3mUhZRTElHjuFF9d
 hfmJnuIqah1p0BUF6g4vg/mu1tQVzjWky0PVbdY+CKuAyXifZFjFtg8Ych9LQkXoNxSuAJQ8gYq
 xNm2dhpLaqEn1oZkBiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150049

On Sun, Jan 11, 2026 at 05:31:45PM +0000, Antony Kurniawan Soemardi wrote:
> On 11/1/2025 4:25 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 31, 2025 at 10:00:25AM +0100, Konrad Dybcio wrote:
> > > On 10/30/25 5:57 PM, Antony Kurniawan Soemardi wrote:
> > > > On 10/28/2025 4:44 PM, Konrad Dybcio wrote:
> > > > > On 10/27/25 6:29 PM, Antony Kurniawan Soemardi wrote:
> > > > > > On msm8960 phones, the XOADC driver was using incorrect calibration
> > > > > > values:
> > > > > > absolute calibration dx = 625000 uV, dy = 4 units
> > > > > > ratiometric calibration dx = 1800, dy = -29041 units
> > > > > > 
> > > > > > As a result, reading from the IIO bus returned unexpected results:
> > > > > > in_voltage_7 (USB_VBUS): 0
> > > > > > in_voltage_10 (125V): 0
> > > > > > 
> > > > > > The issue was caused by not setting the ratiometric scale (amux_ip_rsv)
> > > > > > from the predefined channels. Additionally, the downstream code always
> > > > > > set the ADC_ARB_USRP_DIG_PARAM register to PM8XXX_ADC_ARB_ANA_DIG [1].
> > > > > > That value does not include the SEL_SHIFT0 and SEL_SHIFT1 bits. Enabling
> > > > > > those bits caused calibration errors too, so they were removed.
> > > > > > 
> > > > > > With these fixes, calibration now uses the correct values:
> > > > > > absolute calibration dx = 625000 uV, dy = 6307 units
> > > > > > ratiometric calibration dx = 1800, dy = 18249 units
> > > > > > 
> > > > > > Reading from the IIO bus now returns expected results:
> > > > > > in_voltage_7 (USB_VBUS): 4973836
> > > > > > in_voltage_10 (125V): 1249405
> > > > > > 
> > > > > > [1] https://github.com/LineageOS/android_kernel_sony_msm8960t/blob/93319b1e5aa343ec1c1aabcb028c5e88c7df7c01/drivers/hwmon/pm8xxx-adc.c#L407-L408
> > > > > > 
> > > > > > Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> > > > > > ---
> > > > > >    drivers/iio/adc/qcom-pm8xxx-xoadc.c | 10 ++++++----
> > > > > >    1 file changed, 6 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> > > > > > index 8555f34036fb13c41ac720dc02c1dc39876e9198..a53d361456ec36b66d258041877bd96ab37838c4 100644
> > > > > > --- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> > > > > > +++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> > > > > > @@ -503,10 +503,11 @@ static int pm8xxx_read_channel_rsv(struct pm8xxx_xoadc *adc,
> > > > > >            goto unlock;
> > > > > >          /* Decimation factor */
> > > > > > -    ret = regmap_write(adc->map, ADC_ARB_USRP_DIG_PARAM,
> > > > > > -               ADC_ARB_USRP_DIG_PARAM_SEL_SHIFT0 |
> > > > > > -               ADC_ARB_USRP_DIG_PARAM_SEL_SHIFT1 |
> > > > > > -               ch->decimation << ADC_DIG_PARAM_DEC_SHIFT);
> > > > > > +    ret = regmap_update_bits(adc->map,
> > > > > > +                 ADC_ARB_USRP_DIG_PARAM,
> > > > > > +                 ADC_ARB_USRP_DIG_PARAM_DEC_RATE0 |
> > > > > > +                 ADC_ARB_USRP_DIG_PARAM_DEC_RATE1,
> > > > > The PM8921 datasheet suggests a single valid value of BIT(5)=1, BIT(6)=0
> > > > > for a "1K" (1/1024?) ratio, although a comment in this file suggests
> > > > > BIT(5)|BIT(6) is also valid and corresponds to 1/4096.. I wouldn't be
> > > > > surprised if that is the case
> > > > > 
> > > > > The previously set bits are a field called DECI_SEL but are otherwise left
> > > > > undescribed
> > > > So, do you think we can leave the BIT(0) and BIT(1) as is? I have a feeling
> > > > that if they aren't set, these changes might prevent the APQ8060 Dragonboard
> > > > from reading the cm3605 sensor? or maybe not?
> > > > 
> > > > I mean this one, since the driver was originally tested on that board
> > > > https://github.com/torvalds/linux/blob/e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts#L67-L79
> > > +Dmitry would you have that (or similar) board in your museum?
> > I do, but I sadly I didn't test it lately (nor do I remember if I have
> > sensors board or not). I can try testing it next week, if I have time.
> > 
> Hi Dmitry, I wanted to follow up and ask whether you’ve had a chance to test
> the APQ8060 DragonBoard though?

No, after reshuffling of the lab it's still in the box, sorry.

> 
> (Also happy new year! Eh, it's 12 days late...)
> 
> Thanks,

-- 
With best wishes
Dmitry

