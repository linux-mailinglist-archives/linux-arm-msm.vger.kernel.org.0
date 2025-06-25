Return-Path: <linux-arm-msm+bounces-62444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7306AE8245
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A65477AC8BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A081E7C03;
	Wed, 25 Jun 2025 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbOfQnnA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675C1FF5EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852887; cv=none; b=udBVzBBbc1mLpDnhD42rcNyP9njDo1yZNNmJpU9Xsc0/ymMrZa6TBqTdkI76BopTNdPIAUD7UtTFgc3kU/W4M/o6hiSnrTWzGSiqE7qoEuuKQzPsmgYF5bG+Q7y2ZxVOLTmTFK4oesLtAxXsZXDn7nRofKwkN/58DSAYqVzsrWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852887; c=relaxed/simple;
	bh=4zQ0UL1wqdDM0i6fhX82EgPNJoEiVKpXy1BKVN1c4CM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ce6inTUXR87efVkikFOF/ySPVz2JbpaXCFGETAMgKUEZV0Yz0j71ms7yyZ4EdIxzmagDfeX/fblZePapT6JcKM6XpD2wD4F6fN0muu+DEitlNV8X77X0GiB9HUcwvQgKoseWygUzSTfgL9LXRe2IPgr/GY0DBgRfXNx1qARUOxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbOfQnnA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5lW0i015282
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8OEorVaCRE0cXO8xBCXvfigA2psQBauzIpB05z6ctJc=; b=mbOfQnnAxMa07JR4
	c60nDr78GXjJ4IxNRqr0QCKexEIojCMFnebeW4VmzD2UI0+Wmv6oL4igCUhUkcgn
	8dQljTCC9Eb2ghucMLXkmj5cS3aZfUb8UBCYBQp42mgiC4M321VJugWaHtJyO2T6
	9apd4bEYJQCCd9nqEcQnC/EkVpvDb3ftW0IIFu5Dy9UWSh7pbdnYNl/qkpp+bJv1
	F8b/YWkGGIaBIctBuKi8xWZjiInn1SFdEIOfWSomYd1jQpc8DEzw+NTab3kKOo48
	OYayc/oYeH/h88p4Q+PCvQ3oi/CgGnU2dTrmD1W0o397uhLO2JJW3hWW1qFres6y
	qI0L1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5rug2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 12:01:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d094e04aa4so193227685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 05:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852884; x=1751457684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8OEorVaCRE0cXO8xBCXvfigA2psQBauzIpB05z6ctJc=;
        b=CK5PFYmB7+tXg+37hSGNxJqu4vgl0NYXoi1bKhZy6/DODpMgmfy2ODeW/0cmvBHi4b
         szqmG02A2ARNJ7sk3qPLlFxI2/YzcovKI6FAxTbvaVEmGnIukPgQJPHRSqHoyeHUpK+V
         pCCYnt3bNw1tQuhvd6GRqKbQo5wwkBl+J/kHJby1AIcZ4BCXRHNspM/gH44trlumaIyf
         FH7byojmeF+g1IS1ORN89aIlFGFin3c7OFbRn03KPFKWeBkDLkNi3twTkc3EMDx8OAU4
         s2KSEks7Mh73/VPgI1y2glK8+327kVT5QOolngtBO0b7HtfYPLWT0QGK3WQUtjd3eLKa
         xKxQ==
X-Gm-Message-State: AOJu0Yw7yX6B1efY+VQYmxeHaBpsk/vAkdFBlcD6NfKIewJ67kEEX47z
	tZzdF5LFIklpsRL5P/Rjf1PkCBBEo36NKUdguE9Qpkbo7wubOnbkCtwOv2yfOVhhBy4TMz9Ymvy
	+zf3Uu8n2N1rpGWs1P9yYH8o1/TDn1RRwEV5zglcm7D+oi5zKTIdiQGmMiTO+uG0pQYZf9H1rPC
	Oe
X-Gm-Gg: ASbGncsCy9RrP+D2ccsX2jLrarxqCShT/IGM4vJeZwku5g9oyOFwa3VIORhJYphV5HX
	t4F7cABWldy89iAK/SH5vubyKoB9h7UJQTe1i+lAjJ+7Q6p74Z2bTW7k+i0bYSuC+vFiHpV/p2Q
	m2oqSFGhIWM5LpHHZsY7gp/Ip5OjVvqM4/IWorWIKEspu98YpEwamWmxCZeku97JKZ4WYf9onij
	BYu16Y6unCMeUhgm2oA/6khlvfXrIPS2xTuhO45kCRuHjHCP6jwUziRZi7b9kSjulljJ+AV+R7f
	O2/Jn0bDfqUMmLR8rG2U6uacY8+NwmJoFb6Rs68dg7IsL8OXiKGtTQlk+Sg+lzRcoLcx6iLI2Pg
	D8MM=
X-Received: by 2002:a05:620a:2b95:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d42969a198mr110761385a.4.1750852884110;
        Wed, 25 Jun 2025 05:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGKSvGYhxFuziebMeRs8lQo0eQVL8Cuz4WpchhTnfuGoh6+aLI0eB7yKb5Db/OPDNfTIWH6A==
X-Received: by 2002:a05:620a:2b95:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d42969a198mr110758085a.4.1750852883399;
        Wed, 25 Jun 2025 05:01:23 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b9fsm1028312966b.161.2025.06.25.05.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:01:22 -0700 (PDT)
Message-ID: <4e44b98e-4141-45e8-b4bc-9e9dfef4b544@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 14:01:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] firmware: qcom: scm: remove unused arguments from SHM
 bridge routines
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
 <20250625-qcom-scm-race-v1-1-45601e1f248b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcom-scm-race-v1-1-45601e1f248b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZsnLfBglo9nG1ABt3599ItoL0wnaT4hr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4OSBTYWx0ZWRfXwqvTPBiKxNEc
 2aOIT50bXqi9PHXkLjing61aoYnW+tl31kThOnsvdijUSa9/3SEWcrWerzHZBsuuAlBB8y+IsEw
 L+tXrDyVU+1b6Xr300IAYuHQGEK0/SxLCdweHjMi57lEFTL+zcWmsQsCpYKA2cRrZheJtLNOZDR
 UXGoO/GPSa7Abz7HqHvSI9KJVqxQBfIqjraTs6CRGhWz11Twz072GqleIJWS4ncOyIOBXAi/9tn
 d84bjr/tZSXMxR98g+Sfa010TPbXgFh+hm+Cbc1cMGBCjEryCj4qCDkoG5JFExkB7lImJ7SIpHg
 uuJVZh54gX8wIfBnntABH7m3dyIGUkg/GltKWCKSWqEzF/V4rmwVp8sATah1xA3EAEvXGa1zD+Y
 wZyd7Ga3NrEdWO9+h2FGziRKBLYHA1to0nHTM49oSptrG5+NbjslIfgUW/rR9OKmjdWMl/Mm
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685be515 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rJ879oiodxo_ZCWU8swA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZsnLfBglo9nG1ABt3599ItoL0wnaT4hr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250089

On 6/25/25 10:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> qcom_scm_shm_bridge_create() and qcom_scm_shm_bridge_delete() take
> struct device as argument but don't use it. Remove it from these
> functions' prototypes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

