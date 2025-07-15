Return-Path: <linux-arm-msm+bounces-65054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90797B0615E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 16:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32637504722
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 14:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C8826B769;
	Tue, 15 Jul 2025 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIKczXHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB41226772C
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752589698; cv=none; b=jDtWa/GhOysf4md2KNqSAsDTtr+1R2ixZ3xfPe3RleeYpDAYdqybs87A3LkDSAf+Bk2qJ57s6YoMW6n4TP8gZdI1NJKDsLJ2/g9Ga5Pl1KykjZ8/g7ru7meMKP7b7CBdxi3NTkANPMp85i56Avu77ceTroIvqofdioGGF12Nsws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752589698; c=relaxed/simple;
	bh=TDZRt8vujcFrXp8325zzooIkVrGQbAyR33qzAjuGeA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHG9V1Q5sE4F6GlwTsjxhs5RSMj07B1dG946JXX5j1X8l+koabuOdMXdBTtyqtWoG/xkniVG+X7pueez87nq4CwSFTWUeVJVGtT0TFsnRR4Dika1k0iG/V5RCQDoO1te10RjjX5gAf8IRsLXelcMLcYqbDQjMgwnUGMLJbeTmfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIKczXHS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8RK98007444
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 14:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSFaumHypqTTcwYiUvNp2N7DCB9NOl0z0cIbJaXbtxA=; b=JIKczXHSlYwtlPo5
	cfnuvh/3aWstmsfCfxtrFNwRlmSJrHb5eHVszCxvCXypRM/xDPbPi+Es7MQTchC1
	GV8K31gkctCkl11tTx8S3GEl3rTOgUVRDkYFQLhD7lX6lriblaOJ3yjofDRJ8VR3
	r55ceWb/LF5YJ0w5VGKRfM8ejWQws5GD3qk8N4cimU1ji3+fDxOp831a2Z0u2efL
	VrXOGCP25xmJMiRj6vIM7I1494tD2QopXMhvOcEkjWxRXtRE+33ADCIMfIQDyndj
	vtp8jyKxYy/PA0G2U3btLeOUluk9q2+I70nmamTxRTE2DVXt1X1CkaYoh4eCi7kj
	DXkE9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut8dxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 14:28:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7df5870c8b1so51052585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 07:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752589695; x=1753194495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSFaumHypqTTcwYiUvNp2N7DCB9NOl0z0cIbJaXbtxA=;
        b=q3CYmb5gm/XCtplgO2k9yQ7WezYyfN8ywhlUXNYabvNtRN+Hjw60Hk4nOanCwD5eEb
         omht+iQ5W0P7GxtUQefsdDK7C9zmZCUu90v932wDU46D79II1tEBjPwLuCiJEW5aOhff
         GiZZ0Ds3wku+X0jXAhDspvBi+VgsFvdxiVBh9iKM3EQ+2IUsemJh8qutVXCcslKJar2r
         m0m6MryyXegK6h1tG5vYFiduFK+FpxLburoIgs/25z2c+s1zuhAIrTbl7CUVT0gWQSOT
         t0AJAm9yrmagQlSdAzfmJZXf1y5nt8SSFTua+MrjYg/S+Cvf4A5O2enDUWgYCcwBlCns
         2GOA==
X-Forwarded-Encrypted: i=1; AJvYcCVq77gvoMK8y9rqfPtBuL5z4lXAVo6xmDAFc04+/1BI5upQ+3uQ4YQUkhy04iifFCqmKsWhKKY1HT4Tayxv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3jyctUpsIBCBSAWfuu6ggTmTBenNstNL9iYfeVajYN3Hq23HS
	MD2xbJP0MFxU5Mbn4NVBqggMKaMiyIKYFOvN/td0utWyYR5nLejwADu7PgoHwl0zRXetQ0NjjU9
	0+nBcDmiELGI7/CNlA2jjKDcKAvaMEoMM5FSw+Qr9J/1TryMksPRRnkitdCjXU2K/kMyW
X-Gm-Gg: ASbGncuyYbp/Q1WP7l18Kjp2Hi5NlZAPpE45RafzAce8rQzBoHJQxVgqqHAfsEoi/yt
	4GyxLWfGZ+NVjjQuFfROCPcOyzoRGPA5pOXQqrIxN5f4VcEsbHwVaNgqVE2oDPlZgcsCXdS0JJa
	DKGIiIUFDGVYlhqLSJEFjZahL6+ggjd1uRKTQhnHSgm8XSExR501Dm0J/gV6gFDntqvNu5SvMqD
	aoNisktCJI2KoyNNJGZyqE8QNFH90XByyL32UeOlZPa6bZZvd1dpTDWBq23N/QqEn7PgAQL5sZ1
	3be0a2yroz8mmx/4Ptsp78iY6fDm4wXtBDQiBG0hV9PNNiHJO0WhFcMRQIJnAF3hkV+9iaJ9oBC
	lx2VHKbby0dtB92v2/9aB
X-Received: by 2002:a05:620a:454b:b0:7e1:5c99:28ff with SMTP id af79cd13be357-7e33c710490mr98812085a.5.1752589694702;
        Tue, 15 Jul 2025 07:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKtfxTcgBGxnij43dQLyyxr09RRQ186qIQ25P+J4kz26uLidPi1uYyo+f55faQ4w2EfKpO5A==
X-Received: by 2002:a05:620a:454b:b0:7e1:5c99:28ff with SMTP id af79cd13be357-7e33c710490mr98809685a.5.1752589693998;
        Tue, 15 Jul 2025 07:28:13 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9734c06sm7386643a12.51.2025.07.15.07.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 07:28:13 -0700 (PDT)
Message-ID: <6220dea5-32e6-4ee3-ae83-96405362783e@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 16:28:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Remove sdm845-cheza boards
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>
References: <20250715-topic-goodnight_cheza-v1-1-68b67d60c272@oss.qualcomm.com>
 <f6fb3492-7e92-4893-8088-8e1353905ad3@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f6fb3492-7e92-4893-8088-8e1353905ad3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=6876657f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=z3venpNmMx4ABpSws_cA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: LcO_GqXjxn0qNUtTnEtZGh_bqIkmHP1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzMiBTYWx0ZWRfX4qZKwweIgdIU
 DK7TdCZiBVN879Y6sUxaiwOqNB1yTPsf0iKfS6NXgOduUj9Wjzeicd0ddyQkZvXyucT0x3Xxwsc
 kW/e9bu/BFNllCPoBUl+YqjRUK/L6kC/ydT4U8TuPtERJL7MTfNAHQnMRG1lbrc6tGGzTpMdcQH
 yYCrsDC2F3vxT0niQkGfQJ1ufxLPQZiltR5oXvW6YPpUJiMNCMw/fPmg97FpKn26N0gfTNErVLL
 O0lfYii4Nth0C258efHaYAYeVBz4cfoBdSHsljlTF077FTn+DxHO9IRRt3iZ2ylTE6d98OOT43f
 qWYYRuRl3nBtQQUdTohkSCrlBtuLcQx7zWGY2xZyN7uAgUKoYSTTeUwmtUptIJuR9Wx/8+c5cOJ
 QTaYWvOBoHpt+PGsoz0T7ocI/3OCxGR4e+9F9iLDmzscw3eWqITN7+GgD+kRNVi6TQg7aMKX
X-Proofpoint-ORIG-GUID: LcO_GqXjxn0qNUtTnEtZGh_bqIkmHP1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=782 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150132

On 7/15/25 3:45 PM, Krzysztof Kozlowski wrote:
> On 15/07/2025 15:26, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Cheza was a prototype board, used mainly by the ChromeOS folks, whose
>> former efforts on making linux-arm-msm better we greatly appreciate.
>>
>> There are close to zero known-working devices at this point in time
>> (see the link below) and it was never productized.
>>
>> Remove it to ease maintenance burden.
>>
>> Link: https://lore.kernel.org/linux-arm-msm/5567e441-055d-443a-b117-ec16b53dc059@oss.qualcomm.com/
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile            |    3 -
>>  arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts |  238 -----
>>  arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts |  238 -----
>>  arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts |  174 ----
>>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi   | 1330 --------------------------
>>  5 files changed, 1983 deletions(-)
> 
> What about compatible bindings? If this is the last user, it should be
> dropped as well (second patch).

My understanding was that bindings are generally good to stay..

That said, since there is quite literally no more devices and I don't
imagine Google randomly deciding to build another batch in 10 years,
I can submit a removal too, if you wish

Konrad

