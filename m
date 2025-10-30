Return-Path: <linux-arm-msm+bounces-79676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAEEC1FC36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F111334E27E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6BD2E0915;
	Thu, 30 Oct 2025 11:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sdz5w1Gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPKG45LN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A20B1CAA85
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822995; cv=none; b=cGUxEgiLfrs+2jHb2cWVETUJ0O5bWwSa+wYfsxnnos2QR8GGlMGY3WeoaLidySTAHqF6+l8s8+qninU1/gliXtrgyRsD1zsBTKs/18Hb+2BKnPve9GJnQpiEiEdcJ4SILCvTZ/YT5yQPSq0O83sFxGHAcXDYn58Qlvab6ctZ25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822995; c=relaxed/simple;
	bh=DRfRYtgUYqxz8TUV0m/TBZ6HbgED3u2tIokjfT2eR9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8jXUQhDk5sbobM+ZnnHoEh34I9g6i5/6wnGAZ8DQCDVDxgShoXqUT3wMo7/18niGWbYh0Zb8MkTwBu7QQWkEBIxfEaG6SksMPCo6jEXJN1Mbd5LMvHBafpWlTeSO+fu+4f8/wmF+ZYUp9m/PbXFV+JbYvrTVGKH28Ejk0PdWZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sdz5w1Gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPKG45LN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7AneI1501800
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEvXH7NyTRQr3w1mpQQJn3NxfkM6XT+NGTBGigfqyDg=; b=Sdz5w1GhnLODA6su
	wrYYdFXi7sT4fBijAWsXTaRFSOEpVFOrZYxhwTh6YBVmaT51rzZEXNqKzaH6Akts
	U+WxcX1y+y9u3DbPjA1/6KaV0+Zaa2mgI8V+y10U2dkiahe9PgkcrscidaFj5Pz3
	VM+fTfASA595rDvoHQIxFISyVY27JU0PFAHfN5mZv6aAHuA5Ass90U5e+A3N4UXM
	qlWLQDfmWt4vI+ANXsy97iME9Hn7Y63Jk7iGqhqabbBgWLiTO0OAykSO3hHeEYbk
	cHdDv/rxtFvUNv4kTlSEgbDbjdC+1AAwudKWmVTlVLv3bjPxV2w6qo4srpF+2gQN
	uUoMMQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3t1jt8sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:16:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8934ae68aso2199191cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 04:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822992; x=1762427792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEvXH7NyTRQr3w1mpQQJn3NxfkM6XT+NGTBGigfqyDg=;
        b=OPKG45LNTOx/vTu/MOKw4PQ6I9LgVSFLAl4/tOMa8j7/KRpNptz3bs3+aEJtcG4zYj
         sau9WOR+OSRA1XjWKCLKe3gYH8w6R4L0CpuPFNAR/KnBQzbvYMVYDa62NnMiy/wwUwUW
         IfnuM83cdNS86fHLvfJu1mJB9BZyg2RFx+tXFJ54HUvPboSVrxhH19vmDIk24rpHEk1w
         by4q7uoY5Nqdhd4G/3DKjL6A590Fl9qiAnoHjT2g3Bwz5mUraXBz0U3yoYQ6xuFTx7Pr
         UQsUHFbMFsYwerI6ZFOVrmc8XMU7/ouDmW98g466AmAo+XaUPAShMp9lL6a32EX/jVOH
         f8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822992; x=1762427792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEvXH7NyTRQr3w1mpQQJn3NxfkM6XT+NGTBGigfqyDg=;
        b=HI4JdkR564ytzbg9HeBbZX9rLkCb01FBnvk0B9gFjwol/w4YEKFnXXJxGakgao9+B6
         vdn84JIcLQrl6PHnrvGgxAjKXY4Teiw8Uw15hMgJrC/ko2/KtQYJbNpRyAG6uSfwtFQ+
         tVTgFNpDKk+dXQUT8OHKasWFZwod0wX29r8DfVDM8LfcQsnh6E7OuQ7uwumGtsEu8cQa
         mHsfIXEKw8VAUG7nzAVUjbe13ZtisEee0AqMjjTw7PrYgfihb0M6PNdh4xeEB6BDxUaX
         01kKAKIR6h/F404YqJgShOGwKPF7ExN7WcD0fF83WVa1CrGdraKriXaOvDSiN15HwyEa
         a4FA==
X-Forwarded-Encrypted: i=1; AJvYcCUzvZUv7cZYcd0kwEnOWVLC+IJd+EKXxS5hgT499EJ56FC/oRqpA5fyvjIsRpezfPZnnokao7tBEPQwVec4@vger.kernel.org
X-Gm-Message-State: AOJu0YwVza1VeiyMzF8vm6fvbLDGSum9C/bl8yK4rsWJ9T0wkY1L8d89
	iTAzacRhGbbhdUpnFKHQ3wUq1PGDjC0MbI6fFOwdM4Ny7UPAnbmJya/3SJkK2nQnlBeoGL6Zg/U
	voSx5EQzS0H+HWwG04+X0Ib8dnMX1vhbAC6ELuIqHgtRhTwaWinum2yRmS/5DsbxPss44
X-Gm-Gg: ASbGncuUWLG119PdWOS49bBAfbLWJOB1lYq0dWb23k+Q5vvO/qiqCESxIOOXQpMx7gS
	OPYIYP0VwOsdLPqxgxHK2SxfAHRUEqDLJuPVdgcbBVLddwJjPnkhQyYbFaySgdXhShtuA0ZMdZi
	pzNpml+G7QHsFMqTd6s1zwyqNqzLghjPhfbLFxddEDmnFxnfQAWYl7njecoqQ2LObvvnUXGJaxc
	OKHU7tHK35p2s7zuY4uFBx8I7WrMTLEYkMTRhTPjOa9Di38aYNT3zHTqn4IlbYUT5IU/xJTCf/7
	4tItzTONd9rQfdg0+POvwtjl5cKR1dt+2EuXeghRGPR62KUAsBZLBPAtPNSdMG78oZG9FriKWJ4
	Hor/i9xLtvcLysXCtJQkI97HsznEewYYy2NKggHVKDLc2Ql30IobQ07b/
X-Received: by 2002:a05:622a:49:b0:4e8:b910:3a7f with SMTP id d75a77b69052e-4ed15c340c3mr54346321cf.13.1761822992063;
        Thu, 30 Oct 2025 04:16:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNH0/G04cXM4zXhXAtmihNv8SAEWKC/gCapUSD8HUGSNuEAisqi1Y23cPEhSyifAoWpOj8ug==
X-Received: by 2002:a05:622a:49:b0:4e8:b910:3a7f with SMTP id d75a77b69052e-4ed15c340c3mr54345961cf.13.1761822991480;
        Thu, 30 Oct 2025 04:16:31 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853386d8sm1697324166b.18.2025.10.30.04.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 04:16:31 -0700 (PDT)
Message-ID: <bcff0cc8-8950-4cbc-9af4-8e5787ad0253@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 12:16:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] cpufreq: qcom-nvmem: add compatible fallback for
 ipq806x for no SMEM
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Raag Jadav <raag.jadav@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251029133323.24565-1-ansuelsmth@gmail.com>
 <20251029133323.24565-3-ansuelsmth@gmail.com>
 <9343108b-7796-4783-afb1-afe758f78414@oss.qualcomm.com>
 <69033de7.050a0220.34ea6.780b@mx.google.com>
 <c9801322-2184-4f04-9459-960580ecf6a7@oss.qualcomm.com>
 <690347ee.050a0220.21ee29.8092@mx.google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <690347ee.050a0220.21ee29.8092@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Eq9fo2bbiTjQJwZhbi53iFE_HT3CqEpC
X-Proofpoint-ORIG-GUID: Eq9fo2bbiTjQJwZhbi53iFE_HT3CqEpC
X-Authority-Analysis: v=2.4 cv=M/lA6iws c=1 sm=1 tr=0 ts=69034911 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=Y_B3j33kTYjxkw6TFJcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MSBTYWx0ZWRfX7Di/DaUtOBMz
 7eeo+lH/c+inR2UnHZl5QTwOvKkp8R83mGlKVmTB/mgnMnJ/9QRraTeZv2QyHqfDNXJM+Vhv7OW
 dHtXup2v7DH1bjUfLv0DAdCnn/ZM0ied17okhHS00SlcISjAzlKSeLT8XiMnJRUAT2r87cXZ+wN
 7Ke5RmQrTv+YbP1Obi4IeE6EMyOUMFc1/mQCwemxrBSOJxxLhWvMT6TokEb2tml3K+toMpBxxiF
 qQhSvi0ww96LxuQULATKyxJvtlrhYvewJRGrqKbB1/GKJwN8mlPtxM2k4KcygbNHvwajtA3qp7C
 ZJ1uP9a2jcvMxqBtHGUUqeGeMTVkcaEWaevyu1v8QR/y66BSBypzH0W05wtzoWI15HIebvOEJ+O
 amVV0OaXTXECdEkbES1AlmH+4UETMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300091

On 10/30/25 12:11 PM, Christian Marangi wrote:
> On Thu, Oct 30, 2025 at 11:54:41AM +0100, Konrad Dybcio wrote:
>> On 10/30/25 11:28 AM, Christian Marangi wrote:
>>> On Thu, Oct 30, 2025 at 09:56:24AM +0100, Konrad Dybcio wrote:
>>>> On 10/29/25 2:33 PM, Christian Marangi wrote:
>>>>> On some IPQ806x SoC SMEM might be not initialized by SBL. This is the
>>>>> case for some Google devices (the OnHub family) that can't make use of
>>>>> SMEM to detect the SoC ID.
>>>>
>>>> Oh this is (the unpleasant kind of ) interesting.. Is there any sort
>>>> of uboot/kernel tree for these machines available?
>>>>
>>>
>>> There is some sort of source but quite confusing. From the info they use
>>> coreboot and chromeos.
>>>
>>> Looking at the source they comment everything related to SMEM
>>> (confirming the fact that they actually don't init it)
>>>
>>> [1] https://chromium.googlesource.com/chromiumos/platform/depthcharge/+/refs/heads/firmware-storm-6315.B/src/board/storm
>>> [2] https://chromium.googlesource.com/chromiumos/third_party/coreboot/+/firmware-storm-6315.B
>>
>> Hmm odd..
>>
>> The patch itself looks mostly good, although you e.g. assign
>> qcom,ipq8069 -> QCOM_ID_IPQ8065 even though QCOM_ID_IPQ8069 exists
>>
>> This doesn't cause any difference in behavior within this driver but
>> looks slightly funky
>>
> 
> Well yes I did to simplify the logic.

I'm fine with it I think.. it's just a small hack after all

>> Should we perhaps do this patching in smem.c instead, in case other
>> drivers try to retrieve the ID in the future?
>>
> 
> Well we would hide the fact that SMEM is not available. SMEM gives
> precise info while this operates on some kind of fallback measure. If
> someone wrongly sets the compatible and use the most generic one
> (qcom,ipq8064) then we would parse the wrong ID.
> 
> Also looking at the user of those API it's really just cpufreq and apss
> for ipq60xx so maybe not worth? (we would also have to add additional
> logic to fallback only for some specific SoC)

Right, maybe this patch is the right approach

Let's see if others have any reservations

Konrad

