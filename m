Return-Path: <linux-arm-msm+bounces-79622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 056BFC1F237
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 788BF34C64F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA600333757;
	Thu, 30 Oct 2025 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bC4frffJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iRgZWjnH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514B531E0F7
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761814590; cv=none; b=Uxm6N8ke0jsKfW6UaaXxUs8D88OGwvnO+YZJALR5Gf6EjjfzenVusR85O+rmhgUpKuxSZf+pfF8Chgd4rmFLn32+G7OIk9vx/RaZ0D5cnCv+qVjit+a6e/EoUjxXj5RLRLnLSSE8nodT6RS9ZKe6E/Y+OvN953Uy8XxOHFId16A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761814590; c=relaxed/simple;
	bh=mQ9SPQWqJ9nb33h02PdJR2O/iR/fjBb+NSX63MuC+Qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=T+MRmw9Rn6f2k0usvF+XwXn23uuKPoOqBT9Sx2mchNDY9wLIqyC0S1CNvTNe/sBcscuXZZZLs/+Nw6fKv/cCWbLGSS4hkVddv1M782SqcyJwqtdwUGttzImWZHnpNdpt4kptMXkn3ezncObwgEYMEMRBqfj4hgkBMVs8JsaijkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bC4frffJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iRgZWjnH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7jskK567992
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 08:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQ9SPQWqJ9nb33h02PdJR2O/iR/fjBb+NSX63MuC+Qg=; b=bC4frffJ3qnz/8aW
	5tm0i9yNhLCn6Bd2MctK+hw8vdvpkI7Py2Jpn0uOuUKtn2HrSHWWf04PaAJQUAhD
	Fdlof2MtUXmuZy0l/Hs/5DzR8bXrF0ZARgfHNk5FA9jrf8+4oSntrtDVk7iDia1m
	GuH1/YFX3YMsjcw5uweBklyByKn+do/8KPo8svh0fglLqFalakha1GCF8Adkzuxs
	Bst/49nVq1TH3hvHxvZ78guLDGrSY5/gEw/VrREJF9JwmBLNjdOBOeDhE/+OW8QP
	Ae/47RtgJ/BqmxCobMHoETMs3w13sNzSOtS0UFSWdAwDgT8CW6Ks+Xwh/V+7qXw4
	+oX9Ow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3m0bk5fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 08:56:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-883618130f5so29463085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761814587; x=1762419387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mQ9SPQWqJ9nb33h02PdJR2O/iR/fjBb+NSX63MuC+Qg=;
        b=iRgZWjnH4Lxcmyq/Me09Aim+1r/Hnpu8Fj9W0NksuVbw+q843ZO6oVBgqZpr8IJ/ML
         GGtZX8axL7l33VqVKVRae/qyrg/WF2KIa+Al+g68eEb5aPP0X4Fwuwc0a+V6CV6NgjVW
         5lOla+GU6TkKDFvPly/X3+9v/N61pbnX25ijL5RF23CPANfQeU7dpgwkvfdFQRmUSz1R
         ve6GpVJNaGpHkB6z11NIBjo68vJMnolfTtNFuXlgAp5f6k4tNzgv5l1v7okxubzV3O89
         tkiOq+P4iFn3CUkPAA1TkPuduMHCgj7zEfKX9F0to56PIKBAwdAZQnqKMX107zbKEkl2
         9h6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761814587; x=1762419387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQ9SPQWqJ9nb33h02PdJR2O/iR/fjBb+NSX63MuC+Qg=;
        b=j9vVzrenSWcubX/2V9VdqRwAfKFZRHLbaBHYqYrGc9HzTprYDI9a+4aaCUvvgGATbe
         MNV5paRhlLVQPcPKcIhnCgpbPgxlOQ/LWMK+E4ddZcWJhnZvFEN5B3diDUYUbEKK3taw
         hztRdX3I7I4W/ibd8b5RZoY5RQ/6XGZcpGf31mzKgWXnjRwu5E33KTtG7P4tI/SzNrZy
         9cSbtHVDN8o5LHgJeUuJ0SOPLoWuPr+T5FzNwT5QBDPnP7//wQT0/bmYpwaDgqBcvy/o
         qcWbRWfZTZc2/Pehl3CSzXNOYEhjOxCsLHfRPGAA8IbOGARqU5nLOaX0fp8gbOSea4NN
         4nSg==
X-Forwarded-Encrypted: i=1; AJvYcCVag/y8m3c83NsM+HttfNU7Xex4mORROQsEDLVKPDErUqPHqK74kCrEzzU0hznSwOdBDFMBr8lCSCU8ugqS@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ1S+KD27GGEnDtAZKQB7M+IUJRd3930IblGJQroJum74ImSfV
	uecysqkby+Afb+oyJXmW/ENPpKol0a9kyFLCksLrBTHOvAStTGALrMM7CDaDDMpOPvlljHHMvSW
	Oxo8Aom/kJTy/hLq1R0Rpe9i9F9IOwCANizPoh/fFhxResLrYyDDYdjhxOEUHws9ml0Bs
X-Gm-Gg: ASbGnctcIR2c4nPP6T9Wa5SXHNOOT1fU0SX+TsG6ubwhu+VXRMIB9AapzacxPuXbhg8
	m2Ay0fY+gV5Yrj8UY7k3DbvOdDdkERq3674jTMQ6xeRWuekq+EPKHyKyibgpacFrmBlgnRxxGuC
	9taQkgekRUFTVLa9jSbNadV5V6GTncic0HYYb4/vUfsWddrNLgb5yrN1gHwz4TCrmz3icQmyu6P
	wURO+QbAPzRLEtQgFi7BDJ9S8fu4PNhwd9+9/UC/zOpsN+73P71hTlgemIb4kwtpYxpKsyWEaMH
	ISsfkpklJ+liSnW7RP/+n/8baqj7nyM8P8vUpzXkGIdXZDcJSlGdg0v73WTBYwF1SzCP9nYdf7b
	/ZSDzmeM3f9FaxatHhJfTtngA+8Yyz4kHCZkiTXWcN3O6azg/4NsR7Pge
X-Received: by 2002:a05:622a:1909:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4ed15b4bc7amr53127451cf.3.1761814587413;
        Thu, 30 Oct 2025 01:56:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHiDuxaYh7vyo+gohvs335rda5TGL4pOK0lbfpdxVaIF/d/DHkaNxZ3rX/BWO6ssfKQEPATA==
X-Received: by 2002:a05:622a:1909:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4ed15b4bc7amr53127311cf.3.1761814586877;
        Thu, 30 Oct 2025 01:56:26 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b705877106csm155603566b.14.2025.10.30.01.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 01:56:26 -0700 (PDT)
Message-ID: <9343108b-7796-4783-afb1-afe758f78414@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 09:56:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] cpufreq: qcom-nvmem: add compatible fallback for
 ipq806x for no SMEM
To: Christian Marangi <ansuelsmth@gmail.com>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raag Jadav <raag.jadav@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251029133323.24565-1-ansuelsmth@gmail.com>
 <20251029133323.24565-3-ansuelsmth@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251029133323.24565-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5W6kif8O9RGm5387sUrCy0FZQUS_sJq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3MiBTYWx0ZWRfX9qfWXn14wYkV
 UPIXXydNNjU+2HzRl6Cy/vEPjnaJA/who33egaTJDQAkWZDAbpMEgubxNKprAmHwjhoEkVAFuLs
 sGmNlVxHh8qkL2O2jS6A9+/VYMq/3uBLCVxEnl+odjQCWhpr3kuh67MXZkkbDe0c/DsUTbZ/mFZ
 DrwuocDCuUwdkDDUtV/3ZFIjZgy7NUhzwpl2zMjMNPwaGSBLQ8yHm5K4VbRoum8zVbwRDubQnq8
 Eg9jURlJewWqocI2exWdcZPGqHygpCifMjBs3z95NRFqbzQJ5bA7UZLjk7/Ael6hhEfbIV8fwya
 u21yNDMNaYCKwr8Q0RLPNsXcEonJYtM9+u5tvnyhybmYfU26PDLwmqZ68v/HWqCFcqiw68glNQn
 Oa79qPf6nIS3XFAWg4bZQpIujM77pw==
X-Proofpoint-GUID: 5W6kif8O9RGm5387sUrCy0FZQUS_sJq7
X-Authority-Analysis: v=2.4 cv=YLySCBGx c=1 sm=1 tr=0 ts=6903283c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=dsqsQVcYGt_M5tzRwdAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300072

On 10/29/25 2:33 PM, Christian Marangi wrote:
> On some IPQ806x SoC SMEM might be not initialized by SBL. This is the
> case for some Google devices (the OnHub family) that can't make use of
> SMEM to detect the SoC ID.

Oh this is (the unpleasant kind of ) interesting.. Is there any sort
of uboot/kernel tree for these machines available?

Konrad

