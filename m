Return-Path: <linux-arm-msm+bounces-80289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCF2C30EEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 13:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28F218C4AD0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 12:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA702EFDAF;
	Tue,  4 Nov 2025 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0lTtuMK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfCcmA4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286D92C21D4
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762258438; cv=none; b=I9W/18hBRtU3zKrllJC8aZXDiq9RZ4/zZOAARXFis6iNQ8/KhhnToANB03jE/I0FTQ/C5G0gEiw9ckImOTVZycR/hWorPmU9BbuBxzLwJFGN7oHvudJbKc0jqSUyJDMx02gjVJ+ZGQ8PLSbG6sihRx7gz8HcilDp9zKJAverpec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762258438; c=relaxed/simple;
	bh=JE7DOtpr7ITJlPf8byrRLaTgyDpLMDlPpNKa7BnbAaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foqE4kz/H34hc1PyWECa61Ikynujl5EsqzmC3WV/TB6nCazMS8TTizEVmNtSr9+F4nqgDu45AUXea0pa7rQvkMtQ8FnNMXsSVWgnm97Ci+Ovgcka5ef83LyTUDigmDz/5/n6VzgWFVNtsBdAOkBIiCQXTPOAYvKIqnHVfiqVha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0lTtuMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfCcmA4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A48fikh1488891
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 12:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6bQ2/OXa3s0d++jskzDVbMIDhfmlWkdwhbo6GHDRt8=; b=O0lTtuMKRaVw+kkt
	IGYhvZAE1FirDAzLs7//Pi0pqIbYcm607gnhP6aauo5gQ701w6uEoKOi02wKKYBS
	TcK+sXoEXIaGX7/oV+D4fQE0Y1+clJB7w6yl6daU6srsRIOl8Zo84u3yvDlu5Vst
	kjfoTPK0z+SA+/ZQ/scad8c8gV7KR+HGjPRpg3JIXvpyjU4AwVWuH78COMahXmGr
	9pU0AEFAIyo7fEcW7DSi0vItwRIoSbFJYxh4TKlFNJo2Q1pqrv4wrlPjk/s/cUNN
	pyfXln6+AvYKXh16jn+lg0GN/nz/JksyUmloh6+HK7p2sTFhlwWwphU0/WxK5XFJ
	kbviIg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7c7jgxmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 12:13:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8a79a3e23d5so105624985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 04:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762258435; x=1762863235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6bQ2/OXa3s0d++jskzDVbMIDhfmlWkdwhbo6GHDRt8=;
        b=DfCcmA4jOkedeb+E3tQxWviMt5R0LsEYTRwhaoE9TpVM0Ti0YZWJOIRwjvUWR9obh2
         wVptF5sfwTyyxu8Zf+yg9xpGxfVDjIeSpMJS3xAI906wG0bqaDP6rNlgcm3zCZIZoqcp
         lK8mhkku9YQ8S8xiXCSCspWC/4+CXK7eZuUo0jdM4/tdmtf0fNp7r0U4fs6kkR1Yxyt1
         kUOa/gOOWmtu1nFK/r/3rxA0QGNGgI5q/zn8sKusH8527ci0EfOYq05P1InRKlu42Rjr
         b98+YS87PgZYiqa4+oj2EMlEGVQNJa2uJyPLfXkQD4GULpSvSHSDnqDsB7JfrB+3vxTv
         42Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762258435; x=1762863235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6bQ2/OXa3s0d++jskzDVbMIDhfmlWkdwhbo6GHDRt8=;
        b=H+D3MWO5eCKVIAdHdG4lauCkCG+XDcHtD51UWYnyGTrC/jGLvQpILKZzVJmH778CY1
         TN3IEvbtOshSjokklU/7/tkA+2zbX2KCCHuATrTT++EnRHf4Wq8uKB/PLMq0ItsJR28p
         /k70edPNLgCyoWTvRTtUdQJSF1/mXGyb5RKFrUDLARYoBa7CsYa+TwVp6rZxBDblnIsm
         gOzw5Xn/GSBQjm5+MaytkkaZIBNjgT4HxmGDqc/aoXvvgyfs/1uJAkUybjw8/arFK2P6
         UQPfjEHWqbxpN8ZYvsT3VjM31BfCBzK4UMsCPA5loD8QCp3NJWosTYWxwHhRpwr+N2TM
         0Bpw==
X-Forwarded-Encrypted: i=1; AJvYcCVffucrJ2bWyHLt9tuIPE6kHWUifwRtDytjSF26aw4wXbpwRT94zkTND51FuoYS0zXY5RS7l7DcKBKfzOe1@vger.kernel.org
X-Gm-Message-State: AOJu0YxnyypCc9sX4RJkkNv21CQ8pk4guPyCM2RkGFqaghy2HMRTD3PW
	zW4Ez5+5DswIY/s4Onp+ilGx6fuwcUmjMsBo+jBE6mLZN0LvPn/hZmPoxM2vuUFehFGohuPpmXe
	UHgzyUGQw0KNKzNLsGVgMw0SOqqAiYWVCZRmDZ5j0+OAPO6w8AGPH9nlz16iSQzBYnB/8
X-Gm-Gg: ASbGncuVGt4K127gBnLjoVcwdXhrrL+F4F7vrglvSSFb8BIKgZfz2hW02YgkzZ0JPID
	swKWtnvObWViSHncrmYj0SPyIT2BFK9NzkiIDIt0MZ62lYtVY3XixbRFVLsgWNJkD1X+1gKzU+w
	mKtURzA5cRKJNp6Nx7FmQfYHN5Tpsp/M7o+glI6whN9VhvdceQai2KgxF1EZH85k97WRVKB4kwp
	981JndenpTC+03oIaowY1kNm5TEh47sW3c9CysyLPaYcMfgFM6HyhzOAouKBjjKQyqIWn1f3l2X
	qbBXuOyknE+7Cbw2LgAtzizDyelaBY2yxTF3V0wY8sYuGRm/jU3iS/nipK6juBS6it4O+jPxFQ7
	LqWbXEdpA24uT2MFAdh1wlBjBZyUVlLYyLBKoeFL5ztY1f00GXrkGblUc
X-Received: by 2002:a05:620a:4493:b0:89d:4a69:1502 with SMTP id af79cd13be357-8ab98ec0098mr1526322085a.3.1762258435403;
        Tue, 04 Nov 2025 04:13:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElJoqWX2xrJV5ag5CnmreVfKvqZQk0wt43HdbcV3tEqeG9gBU7GfIBlEbi5qoANhqsgYZfbg==
X-Received: by 2002:a05:620a:4493:b0:89d:4a69:1502 with SMTP id af79cd13be357-8ab98ec0098mr1526317685a.3.1762258434614;
        Tue, 04 Nov 2025 04:13:54 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d3a336asm197311766b.7.2025.11.04.04.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:13:54 -0800 (PST)
Message-ID: <1bd7da17-ae41-4d86-9f80-960f68821ee4@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 13:13:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] cpufreq: qcom-nvmem: add compatible fallback for
 ipq806x for no SMEM
To: Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Raag Jadav <raag.jadav@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251031130835.7953-1-ansuelsmth@gmail.com>
 <20251031130835.7953-4-ansuelsmth@gmail.com>
 <qael7opoqary2n5iqefxxp42v3qoudfhfvcgjyxfe3t7353zge@ahgvniscxl7v>
 <6909eabc.050a0220.54944.cd03@mx.google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6909eabc.050a0220.54944.cd03@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEwMSBTYWx0ZWRfX+vnD69JAImsG
 AAX5/re4OkPi+HDqRVqYsroxEsf55nBJtaFZ+3OOBRSAuCHM2AXCzxVsXbsIts02aNCqPZvDUS6
 w/5Ek3OpVbEqxFceopYhVzywk/rxnpZ/eD04ZYFUJ9FDjpLxKBO9MtG8Qo/1pCrt7ZstZeMJIpO
 qLprQ0OLu0UmAJyhkegCdR55cAtgIITlti0V3ajzeI9CSf5LWCeVRmpDaDaqZjz1vURKtCAGqsD
 J2wtLGMffBtkhMTp3eBeEvRfu3e5gnJbBWb2/n/jOwBEYBAJdfUjyTDmq0qMU/J1CUlZnUUJISg
 MOQ6meFrp+WVEH0p9/RUwD/IWn+YSF9JbBPMSGwm/ngCNGDE4OwhSVRkX9k6wU7CS5UGkepGjOc
 okRxr8QvX1H68yfj2ZJ144k7r2dmMQ==
X-Proofpoint-ORIG-GUID: 8ImhCf31APgp7AlUGq-7uEchczsmb5Bt
X-Proofpoint-GUID: 8ImhCf31APgp7AlUGq-7uEchczsmb5Bt
X-Authority-Analysis: v=2.4 cv=DvNbOW/+ c=1 sm=1 tr=0 ts=6909ee04 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=CWkO6e9Jn2YNH3FdQYoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040101

On 11/4/25 12:59 PM, Christian Marangi wrote:
> On Sat, Nov 01, 2025 at 12:42:55PM -0500, Bjorn Andersson wrote:
>> On Fri, Oct 31, 2025 at 02:08:34PM +0100, Christian Marangi wrote:
>>> On some IPQ806x SoC SMEM might be not initialized by SBL. This is the
>>> case for some Google devices (the OnHub family) that can't make use of
>>> SMEM to detect the SoC ID.
>>>
>>> To handle these specific case, check if the SMEM is not initialized (by
>>> checking if the qcom_smem_get_soc_id returns -ENODEV) and fallback to
>>> OF machine compatible checking to identify the SoC variant.
>>>
>>> Notice that the checking order is important as the machine compatible
>>> are normally defined with the specific one following the generic SoC
>>> (for example compatible = "qcom,ipq8065", "qcom,ipq8064").
>>>
>>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
>>
>> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>>
>> And as mentioned in v1, this (cpufreq) patch can be merged independently
>> of the first two patches. So please merge it through the cpufreq tree.
>>
> 
> I will send a new revision just for this patch so I can use
> of_match_node()
> 
> Should be ok since it hasn't been picked right?

Yes, this is desired, even

Konrad

