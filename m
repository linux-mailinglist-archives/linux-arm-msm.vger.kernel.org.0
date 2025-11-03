Return-Path: <linux-arm-msm+bounces-80100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D402C2B8DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84B053A3F37
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406E32E7185;
	Mon,  3 Nov 2025 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0R5NJ7/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkAKbcjF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FC72D7BF
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762171064; cv=none; b=aWiEAGdPyEVMjAnUSrbSJfflFaKZwHTe0Q8+ayxU5FNXKXNCkXYgQiB3ijkhRLrZrKrnX1MwVDjhjaZS/dOvtYtDSlT4+7hYLt+bDA1HeNabbcLOwVnQbZoZDugHdteQHkynMiYLXxgsLJ2TK+7jYCxCqFWE9gpC/uG4RYwnROM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762171064; c=relaxed/simple;
	bh=oHY99jjYa6TWW31zX33bJ4FY5tuInY+gD9LEWXUtXDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJN0RZecrSyWt8Y1aUV+D+kNbUS3KVM3NtBFLY9+gJago2pOx6YdujU2fvzns/yeYYK4XFcAcAjvjFXUEhMKKY+6yllSlAMll1RPnoshTpN3aYZqR+pBAxwo/us7wOq3WRPii2sFXiLCvnyU99DA6/nwcSPrTr4EtPI1DRp83Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0R5NJ7/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkAKbcjF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A368Y5Q2269733
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 11:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alxYb+mnVL9GtagxOSl8WvoR8PNmqIcBklK5uJRyQw0=; b=U0R5NJ7/TwNTzKUj
	u0k6eLAjjitaZfLzD372FmCiTwkeHuTUumbtAK90QtcCWhkXqA1Xug82M0FMxGpB
	ZoWiIv8pG+z5m8/UjB29vmVQI4+gsgQlATgEUzmqJRIXev/scGWJEbv15JigVcCE
	RBz5XdTEQorm0VQvaN5rhwNrvAUIH4zemRsqYCw5LL8k/etKGBiuI0LO2HsKN0rp
	6ogYhs7UCh1v8liYH2mKbU7BCuXTJVOT80gamGyq20/XU0CIC3cXMcex9Y79g34c
	FlXFoL5EKqATiGE1rlKjVLyU/NatjvUPskunrki6p86nAKthcoTS8l7pGuxYFG5Q
	MHmgAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pv79128-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 11:57:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8b86d977fso19131291cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 03:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762171061; x=1762775861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alxYb+mnVL9GtagxOSl8WvoR8PNmqIcBklK5uJRyQw0=;
        b=kkAKbcjF739I2f43Fh4WaG2BvJUtu89zaGzj0dGp3noJ80MOZNrQW/jbGDcRA+c/Vv
         jYooXvI+CKzd6whGWs38z+uwEv6WNnK7NmxWY2bbKUSsAbze4MQTTir++8OwKXL44ObR
         veTgVIOSGovM6tpfwgEYm+6rTlhxpHtyKNVa/P9ewub/qLnvqKncW6I1bCp9fsxKzeIl
         hT044rKShJMtjvp+0Co4o9hrdj4ey+9GgC/EfsmsptYBtpRdQe2lBjBpngF9YoFdPBVc
         rhJYF8GApnHRTsLBrWJYA+0pTdiQfSct9DEbaNVOnUtR+jJd9tCGgr0T+BnD/7L0f3G1
         yQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762171061; x=1762775861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alxYb+mnVL9GtagxOSl8WvoR8PNmqIcBklK5uJRyQw0=;
        b=I5W+c9+3oQMUhk08+qvgvjeVOjqpLvJNPGyO9dAIcKZKVI+VVRvDay7OMDzNAsA/iQ
         6K04nJbjGgZd12ZbcICOfQmhMe3oEpHmGPAwDyuPflJZmOwLPKXQqWwyQnECk/nXN8a6
         X1xfOFSAggEcDKAlZB6m2kZkTdz5ABLWT2J3r4dAXp9UlW0LtXycMwH54BIVxhYdtc9h
         AqxqHcHrP0DAzOFdo6lX940WprCTUm7ZLvZAsou5cmp4HY8Q0/uVuAZ1ShVis/50m+wy
         ONZfAJy9cGv6+8NE4Xi3H05W+7ISHOJM/P+qDvhURU3vjB5jXC2UjvX4XaSG6/3ROeO5
         AV0A==
X-Forwarded-Encrypted: i=1; AJvYcCVRzmt1WTZsl1YY1RqizYKx0Bj/i+o4epcUPiPV/GLNIc8owcqEM4X7aR7+O15E3BuFD3x542HPLStCHXpL@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ1cc+Rnis3Bb2AxdYMAeFxVO2JRLNMWuPlkEVvzFP/YxYFCJc
	vQuT6CorCbpcGHhiwAg9cZuyPY/vVs/JCRZbh0dvSJayk/PcjJ6mcGdc3Gu18v3riSIF7lSF9eV
	0w7AbyBlxAzf5MKkUcWC4doEA/N1xRR9v1Q1+6+R54EdV3x75uwgHuRSoEpOAnROYhKYX
X-Gm-Gg: ASbGncu5UkjpHEHF+T3u/nC56hDvjdbgQxD9b93duOdMlhgpXkdk3Ssth9aaJwJj7ac
	d0lyU27TdGXTSX/Z5mB0atN36DA25CZvk5mxKTVhVAC5DiUEVnDkfQjdB6Cs74M1pPgJWb/gJCM
	ucfMQYm/vzd4ds5gkaInXa4sVjJzGzRyShIhoXV8395LxvrCMbCOR/jb+WSqHr062ZCvXPIyB2k
	/kERovDt0O+a3hlT0KuWHb8PmUsTWpV7Fq+muYCAYfGiUIEWSgK9zBduRrt73Hq26Wo2CQ5w6ve
	XszHBkiKGlXkZuxO/ZbVPhmOCp84g7m1CMFFdr6jWUi9q4jOc0BguYk0wfzY/+NFHEBgLsHcktY
	K1/MQ9tOJbEaB33PIIwUmzVSndP37/F59yT3qENMJzMfsUimI9EptzdhJ
X-Received: by 2002:ac8:594d:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4ed30d790d5mr105607771cf.2.1762171060803;
        Mon, 03 Nov 2025 03:57:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEreTQ33rOnBxzlmoEkiH83sNkD7JuKXJL5dtc6SVCDjMEgtd9S2Nw+dmBkbpn3a8dQm7qmLw==
X-Received: by 2002:ac8:594d:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4ed30d790d5mr105607631cf.2.1762171060362;
        Mon, 03 Nov 2025 03:57:40 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b71b1a37e14sm51240766b.53.2025.11.03.03.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 03:57:39 -0800 (PST)
Message-ID: <549a6235-dadd-4136-86aa-c96400373722@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 12:57:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org, casey.connolly@linaro.org,
        christopher.obbard@linaro.org, linux-arm-msm@vger.kernel.org,
        loic.minier@oss.qualcomm.com, rosh@debian.org
References: <4krvjztwy56ycnbrynz2ok4hs2vwehdg4ta7rdueccgn3hgvqp@sgxqw4pvoq3j>
 <20251031092727.656939-1-hongyang.zhao@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251031092727.656939-1-hongyang.zhao@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ilf-ZLe1QkeEhOBWbeU1VM2s7zxWkWLB
X-Authority-Analysis: v=2.4 cv=A7dh/qWG c=1 sm=1 tr=0 ts=690898b5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=IrY6gKdsDF3dXQ76tDoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=j5gyrzqu0rbr1vhfHjzO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ilf-ZLe1QkeEhOBWbeU1VM2s7zxWkWLB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwOSBTYWx0ZWRfXwtpblzSdItzb
 AkCLLW5lNUVoGFRpSN1m3aRNAjpNCWVZdL4NAwD+SmkggZBSvnAtVpArZwPFd6hRDkEkpkXf4LW
 b/twpfPinnxBUqUErGigJGi+tem7g9Aptgj957kB6JI1/qlyK5SlCXEdMuPkCo8PoU/tNkFHR65
 Om3Lc8Bkw6Kxdu4NWgtYzQkAT1uJrwp6+wOPfRdfv+5KssXBn3pv8dGCxiCrhOQHl4KJlSroydu
 FXtmksruIKdCF0kU3uqp/bq/f+XIY7zUOwUds91g+Z+3635vJeJzFAqVc2Oq+aOy9HDreOwNerN
 cHju3dnt917XTmsE/kwnVdMRF50bN3BKj/CO/ebRmwqOyiCfmgULthFjLxripYDFZdo70scohp7
 EsZzyPDE128+uCFhbWd94F38wmpZvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030109

On 10/31/25 10:27 AM, Hongyang Zhao wrote:
>> On Sat, Oct 25, 2025 at 08:27:22PM +0800, Hongyang Zhao wrote:
>>> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
>>> QCS6490 SoC.
>>>
>>> Works:
>>> - Bluetooth (AP6256)
>>> - Wi-Fi (AP6256)
>>> - Ethernet (AX88179B connected to UPD720201)
>>> - FAN
>>> - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
>>> - M.2 M-Key 2280 PCIe 3.0
>>> - RTC
>>> - USB Type-C
>>> - USB Type-A 2.0 port
>>> - 40PIN: I2C x1, UART x1
>>>
>>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
>>> Reviewed-by: Roger Shimizu <rosh@debian.org>
>>> Cc: Casey Connolly <casey.connolly@linaro.org>
>>> Cc: Christopher Obbard <christopher.obbard@linaro.org>
>>> Cc: Loic Minier <loic.minier@oss.qualcomm.com>
>>> ---

[...]

>>> +			cpu_hot: cpu-hot {
>>> +				temperature = <90000>;
>>> +				hysteresis = <5000>;
>>> +				type = "active";
>>> +			};
>>
>> This has the same value as trip-point0. Is it intentional?
> 
> I overlooked the temperatures in sc7280.dtsi, I will remove cpu_hot.
> 
> Additionally, based on Konrad's final suggestion in
> "[PATCH v4 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts",
> I will remove the cooling-maps node (user space service will get netlink
> information to control the fan), and finally change to:

My suggestion was to fix the description and wire up the fan. I called
your userland service creative because I didn't want to use the other
word that came to mind.

Konrad

