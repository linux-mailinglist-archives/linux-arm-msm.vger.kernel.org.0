Return-Path: <linux-arm-msm+bounces-79248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3935FC15F45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9FAB33558B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE6B3469FD;
	Tue, 28 Oct 2025 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PF7nbTOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/6hl608"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFDB347BBA
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 16:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670312; cv=none; b=ePLb40H214P8cEtxNOKr6psm19PZnLEw3rOKyNqBx4RlnLm7+k3Yatj+wvz/MmuQuyIAO0dRV59OlMNREQEeRKYtV9eMHcjZjK0MqcdKcywz/FVuzKseRAuIwluBS189iNaYWG6TJqc6+hjKh6f6pG95lmCBk8vlDmWe9f2Syvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670312; c=relaxed/simple;
	bh=RapU0c9b1iHJl9YbwoTmwcITqxMavrj3HpztlsX+eWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZgEM7smKx8kjgPQfRahIPjLKpnpmPrkI6PSq3LjdLoe5YUStFOk2KUVSJtkyjvs0LM6K0qrgUu1imAVkW04wAFQo8gnLC4qRvV8fdfHjIkXHLyZtNNtlyc/eWWnnvivn59FBTbLsoIpk1svgGjZLo7W9NH/0A6/Egmw9y3iP3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PF7nbTOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/6hl608; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEniKU1974303
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 16:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i9C4HsulAXnn2OnJrBxI/dWINcjpzXYPZD87sN+8Dek=; b=PF7nbTOxluk1bO5V
	3owJoXs6AoHbEix3yQp52rP5kEU53F20nn6o3WI+lIJYd1JRhHqOajCNevku2+zx
	WQ3xKVVvDy+SBZQmbyINL1m3vbk0zJkeM8iokiK3N1Gk77i+hehqtjnx+aACkPqc
	lJWgIEQJO5CKiYaBrBmVgk5FmlMtHOP6UyqGiORyeBwlAbu0PA9pXEnpONZ4zZQP
	4nikLz/y4ns22KlIGgF4mOwObEki5ivFeGq7H8MDsdr9EXop3v4tue1YZbZ1JKrB
	Qtdw4KpJygQNhXJBusOGh9blrVYk8gGnZK5jE49BnSNhCQuWsVdx1adSQcphtfw+
	E05AIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pgea7tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 16:51:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ecf8faf8bdso124342171cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761670308; x=1762275108; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i9C4HsulAXnn2OnJrBxI/dWINcjpzXYPZD87sN+8Dek=;
        b=e/6hl608J+7Vc/1DWK9hjyyh0kqh8w6Yn3aRo/1UqlAqXbvIX8wC/ripvmdxhvpqZ/
         f8kWFOI86yPz4uWkm3CqytGuyUjRsZPTrk7f5GYNqixJTSFvdd7HggpjSU7RP9L/HVOP
         XVARnbhhvsPKMC73HAvBknC4qBpDpbHb4iICGOuXNTd92xiAtIpUNmHunGpFwFtOIeC2
         t86mfB+nD3PxJAO8w0WNjXxqhibDuCfrpnxwVLvE4evKCkD8mOiBRqqSK5Qdc9g/VBag
         u6dhXTjvOZ08Lsq0Yw8OBCpieG03Auya1bfNNMOwjU3TiDPUH4TuSxRCN0tOuHiJyl73
         ldFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670308; x=1762275108;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9C4HsulAXnn2OnJrBxI/dWINcjpzXYPZD87sN+8Dek=;
        b=XpJj+mQpyiQ21jjuI+sd+s/8Zx5IOxMNQBArifWAZywzQ/qNz1HLEkF1NX9GQ7+EGu
         ORsNvbMslmIbgKl142xNkkBOnvpcmimOYwApxysXq1F0SbD8+6DSP3chahyocF3+3CTA
         pp6iHG+WXI2ONr3MHIN2HSYHYgXGHvQMSI4KHvJiDGhNHfek7xuiw+pAvtg3J+gabg20
         Oq4UbK0AV8AL/Kp81kBGBtNFJr4W/G7y5p/j7e9ps0lrqPSDFT1FJamKvtymQR5gAl5G
         CRZpCxo5TnCjr1HKHcTeSyFvx9YOiJTZHN6FbpcMcK8OfZOl56mYd7DopjFeJ4IFHZPC
         Uerg==
X-Forwarded-Encrypted: i=1; AJvYcCXFMnpALDMMbx3BGulcJf5UVd83H0M/lNdUznemq4ewTklFMYs/0pKre9UaKOBnWK3xAybiazYnMKcTLc+U@vger.kernel.org
X-Gm-Message-State: AOJu0YyiucknrIXLcKsp4B1C349AokoXLrVxxVGv8TzvX4VHTX7x1O5w
	OXn6fLMsTTBFEv/zE36bc7a1c9QyZIJvkU8b4Lu2MhI2r7naf5UjhU6GiDZ3lWsMbHA4WNkO80S
	yziXr3Lfw1bHf1E8Cv3txzqKGerIFFSbHlY6LNuVgr6WA+9q5GSrtl0faDZxyk0WnCiHJ
X-Gm-Gg: ASbGncsXqZI/JvHQOWpZjnTMc2MOkytznhkUFHzhK1Qob0ROblSXL99zvMtno5Lj1zn
	cAeic25EpRherrXOFlKSbZgjlYJQfjlbAS9VMLsMEcN2mVrmyT7NZDvr27RRLKRDNQyaSq0t0hf
	JTVQAOMgLuvPTpuRglOQ6LOZfLVtrT4YauFaJIH780HAXi5vlNZlsp5A5P/1OU2mrDT/EO0+RTX
	hvgRDMhCIntUpjAiYiNiBu10gQ5fhu8s/U3vod0g1ZxgA1Nqrq103t/vtrWa5i1RfWho7udFx4h
	dMjs43pecX0mPTcPpROTWqcIckrLhkVaZ1s02V5Qcdyog60u6WQShaYRtDvmB5Xw99kpd7HwapA
	ltOf1GWNb6B33CzFI+XWwHYkgG9MWZ7kNfv0AXHeww7+OvXqwtkDkrTMjLTy8456R76emD05JIc
	6d6G/jy8c4tVJx
X-Received: by 2002:a05:622a:4a84:b0:4ed:542:bb38 with SMTP id d75a77b69052e-4ed150a9941mr5039021cf.74.1761670308009;
        Tue, 28 Oct 2025 09:51:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgQCsxZo2vWoOXautQIdSCHoqffWuFP7rAIohci6FYFBPiN70FLhSUPjD1x5V/JFyrFw8llA==
X-Received: by 2002:a05:622a:4a84:b0:4ed:542:bb38 with SMTP id d75a77b69052e-4ed150a9941mr5038651cf.74.1761670307501;
        Tue, 28 Oct 2025 09:51:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09204esm29835191fa.8.2025.10.28.09.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:51:46 -0700 (PDT)
Date: Tue, 28 Oct 2025 18:51:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <jaj5oxqcgckndtp7wwe6ukqbh4z5phe3pw3hnhp2hatgqffjzr@y7qevil4o3yr>
References: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
 <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
 <76479593-c47b-41a7-8349-5d7c1403f7c0@oss.qualcomm.com>
 <73955d58-544c-4299-a099-bfd9e5912a40@kernel.org>
 <636a1f99-acd4-4904-8fae-f159646cc1a0@kernel.org>
 <f4d80be9-986f-4d37-9c25-725eff7bb653@quicinc.com>
 <e03373d9-e2dd-48b6-93a6-554fcd623718@kernel.org>
 <59a00934-cb42-43de-ac5b-a9292b08301d@quicinc.com>
 <aa4faa81-6e9d-41c2-85f0-32045a8f9f51@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa4faa81-6e9d-41c2-85f0-32045a8f9f51@kernel.org>
X-Proofpoint-ORIG-GUID: VTwC20UDgGh-9rnClSRGFYjX3TSxUiK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE0MyBTYWx0ZWRfX9r6ktFUFuq/a
 Wm+K/uXCKSE5i1pfOeNltWKbK17dQC0a7ax3tAd/ZGQtm07ScAt0NiYwpwiQ7pmNiVV+YmI1nbV
 5ICP+wkOlhhftDZggTglJ3duKC62rM8MkmIBfcH/VJRqd/MbFoxAaNHJeJd2jjI8YQ3w9JIUzdm
 Iylnn5V+nvNEM1vbxV0kfZPaLgxLCAzxFeGDVim2+91ETaZRC8zZGyoouuKAsznT6qTJwyXa8Yb
 LMnzdA9gY+bFMq9su1npCyOkH1yngnWJQnY1f5swhOywTSsmDP2X6IfEdj/dsXxmgALd40yM1n8
 1kk574DQ1JiN8Hb1gJhHaL9bVOpgPV7RcuDlth5mv4qj2CBFPZCnrfIMuaVRJNKwvUJ8vdTv57j
 K9K3GCiL/35Y40BQQmTaXKdGvMAfPA==
X-Proofpoint-GUID: VTwC20UDgGh-9rnClSRGFYjX3TSxUiK9
X-Authority-Analysis: v=2.4 cv=fLU0HJae c=1 sm=1 tr=0 ts=6900f4a5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=qhxFKX_6QV7TjQX2OZUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280143

On Tue, Oct 28, 2025 at 05:40:33PM +0100, Krzysztof Kozlowski wrote:
> On 28/10/2025 17:33, Pavan Kondeti wrote:
> > On Tue, Oct 28, 2025 at 05:17:44PM +0100, Krzysztof Kozlowski wrote:
> >> On 28/10/2025 13:27, Pavan Kondeti wrote:
> >>> On Tue, Oct 28, 2025 at 12:07:40PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 28/10/2025 12:04, Krzysztof Kozlowski wrote:
> >>>>> On 28/10/2025 11:58, Hrishabh Rajput wrote:
> >>>>>>
> >>>>>> On 10/28/2025 3:10 PM, Krzysztof Kozlowski wrote:
> >>>>>>> On 28/10/2025 10:35, Hrishabh Rajput via B4 Relay wrote:
> >>>>>>>> +
> >>>>>>>> +static int __init gunyah_wdt_init(void)
> >>>>>>>> +{
> >>>>>>>> +	struct arm_smccc_res res;
> >>>>>>>> +	struct device_node *np;
> >>>>>>>> +	int ret;
> >>>>>>>> +
> >>>>>>>> +	/* Check if we're running on a Qualcomm device */
> >>>>>>>> +	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
> >>>>>>> I don't think you implemented my feedback. This again is executed on
> >>>>>>> every platform, e.g. on Samsung, pointlessly.
> >>>>>>>
> >>>>>>> Implement previous feedback.
> >>>>>>
> >>>>>> Do you want us to add platform device from another driver which is 
> >>>>>> probed only on Qualcomm devices (like socinfo from previous discussion) 
> >>>>>> and get rid of the module init function entirely? As keeping anything in 
> >>>>>> the module init will get it executed on all platforms.
> >>>>>
> >>>>> Instead of asking the same can you read previous discussion? What is
> >>>>> unclear here:
> >>>>> https://lore.kernel.org/all/3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org/
> >>>>> ?
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>> With this patch version, we have tried to reduce the code execution on 
> >>>>>> non-Qualcomm devices (also tried the alternative as mentioned in the 
> >>>>>> cover letter). Adding platform device from another driver as described 
> >>>>>> above would eliminate it entirely, please let us know if you want us to 
> >>>>>> do that.
> >>>>>
> >>>>> Why do I need to repeat the same as last time?
> >>>>
> >>>>
> >>>> Now I see that you completely ignored previous discussion and sent THE
> >>>> SAME approach.
> >>>
> >>> Our intention is not to waste reviewers time at all. It is just a
> >>> misunderstanding on what your comment is about. Let me elaborate further
> >>> not to defend our approach here but to get a clarity so that we don't
> >>> end up in the same situation when v4 is posted.
> >>>
> >>> https://lore.kernel.org/all/b94d8ca3-af58-4a78-9a5a-12e3db0bf75f@kernel.org/ 
> >>>
> >>> You mentioned here
> >>>
> >>> ```
> >>> To me socinfo feels even better. That way only, really only qcom devices
> >>> will execute this SMC.
> >>> ```
> >>>
> >>> We interpreted this comment as `avoid executing this SMC on non qcom
> >>> devices`. That is exactly what we have done in the current patch. since
> >>
> >>
> >> So where did you use socinfo? Point me to the code.
> >>
> > 
> > Okay, lets go a bit deep into the socinfo part. we have used
> > `soc_device_match()` API to detect if the device is qcom (`family =
> > Snapdragon`). It works. However, when we built both `socinfo` and
> 
> socinfo driver. Read my first feedback:
> 
> 
> "No, your hypervisor driver (which you have) should start the module via
> adding platform/aux/something devices."
> 
> And then I agreed if you start it from the socinfo driver.

I'd rather not tie this to socinfo. The socinfo is an optional driver,
which is mainly used to provide debugfs entries. Watchdog is much more
important. It should not be tied to debugfs-only entry.

-- 
With best wishes
Dmitry

