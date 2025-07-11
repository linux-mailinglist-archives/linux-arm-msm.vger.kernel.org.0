Return-Path: <linux-arm-msm+bounces-64560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F5B01BC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF9FC8E03BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7095C289E13;
	Fri, 11 Jul 2025 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6k/UOfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD423ED6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236127; cv=none; b=GLPnqmja/7NftTuyRqfhDsoQS+p0IpB/PrmJHJ1j8HvQij94H9DXHM1OrXKlwyBfEYUH227lx0ZrL95m3a8/TyoHWBr7cj3bio4xEC6tneUVRXloiE4AJBC3dcOTmBUFfVxbS5XZrmAG/2VbVtiuMPIZHlOgIM3YgKLKBMOueBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236127; c=relaxed/simple;
	bh=Xjn5ySGEMA9LsrxbMTZ6SdqT5i31QukUV4A0p1xnku8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VO1hX8IZ9s5zCbYG8Cp2qCpEBt/JZsQG+kxTPEIhLQHeV8DXeHYfLzsZxdjzbeqjIQdNfqFxVKFESQ1o4XZlem7GaQ2H6w4ISGovK8u8m8z3os5MTmcb7SsYFcUYkIX96dUA3UW4fWANEkBNOMNm6dyCcgXc6Iryb+fhs1NV2s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6k/UOfc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAgpRe003829
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WmSJVa8+LyzMZ7AuALMmZArLhe9+Oxn8lyjPgHFxns=; b=g6k/UOfch29P5CwI
	pqtIbwhQNYh5wJ/FG+d5qTLMv3uOF9J4rZS8PlXlw4ARvQYZ96QHgm3DQFKi2uAz
	v8rd+pwUwbnPMKXl/IyIel8uZh8YOw2CcTn9SZQMGQyQleDmkft5vZE2lYuss0/N
	0HZWFHax5VC52ZJguWDzh5L/tBw9jOjjEMpR5Lieo0mOqKVvvdSTNqTuckwroswg
	MvPwRtZeg1AAEOXG92f9aU+B5xtiRvfVbzo2fVY5JIr+qidvo+E3IboRLrDrEVtX
	3H8NO0Ot3lxVFcNUvMbC+TThfLfawJliw6yrbBHTNGmVZCRiUyfBfZX1oqLCpCda
	FmRWPw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp0k0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:15:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dff19eab5fso10429085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 05:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236109; x=1752840909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WmSJVa8+LyzMZ7AuALMmZArLhe9+Oxn8lyjPgHFxns=;
        b=PU4lZwMA4RtUz3dkCcPR7VKR3MyjL9O5wxckK6AwG/lpw1gtZOw3K85EY5Jyleq/R3
         oo5FQv6J/LKljVZ4glm219V/QRO0y33aAkNPR+9SjaWGzgDsNyzscPrOg148XzrOVBdG
         D2eOIO2+3z/mHiPYg6Cj5u0Z9yiW1mRQYCKewkZq0+ImO7csJepaX77bcyc1Y/c7sdWt
         dPtUc5i7aPntzJQQr/voqODlIG4vpa9m14vnPQ8IT/ZV8cjv1kepjhhVF3H5yrPIgD4s
         WS6xonpbouhF/D92B+LHvaCaQY8Uy+jPGGv2dX85g0/7NQscy67SmDF+dkXFGx8hIAxl
         gXrg==
X-Forwarded-Encrypted: i=1; AJvYcCW0+90CHz+JxgnZQIhm06Efgm6p5Q7had0Gx/BC83JN0mGipuqv1fPjvEo7d3aoa6qI0BjcqQ4Ulmw51SI1@vger.kernel.org
X-Gm-Message-State: AOJu0YxzjRM1gB0hJyTWkTTqhVwpN6/bC4GvEZVEn1LAK6HpT0B4++zM
	BnjGLNLsC5+7549n1T1VE6oUFjjwjBs8jlGxV/NMc+9ml3rveXO6Ei4JFMVKNzmJY11/leQx+gu
	47snPM+y9zxsSI1gKAf5+5nRQwWvQTO+FMoQp6BhchEMMoKWfxS3HzCqlUH7EPtB6sy1u
X-Gm-Gg: ASbGncvWWojCWe3gcaCR2iYwB/QB30TR0J5akkiwQv2H2IKe4Y4+7JqTD7gNsprO7oW
	dXrwGExHHjaU9bMkq0j0zUYTwaATU8wfHZqT1DI/81LkXrG8dcb511vNzSQTHZPlBQvQ39FtuJn
	iS4eiuGhmmsiw1EKertXfCPeE1jHlmIvVy0esojNoAq8bJ4qEIfHvdr1v2ccPBEQf/wlTk9T03v
	TtJJJLYX3s6VrD5C791rASlYY6iF5OUIiyGjh4JUjTclTkuRZV/mFBKliP2Jo3WHcywHwmOxiEc
	gRuQyOntZczr5gvffJy+eMv3+mpC2OBeljZIDOnzySdo5+my4fGKqQW1frYXcN7F9eNN1BTso0s
	NIhxsxdEW0/eyCiWviZaV
X-Received: by 2002:a05:620a:438c:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7de989b3079mr130006985a.4.1752236109078;
        Fri, 11 Jul 2025 05:15:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9IlpHxAb7R4TrzGfVeGwtAC/FU5V/+FMIw/QGwRVWYeM3sTSRsEHYiAI4QhJLyZVlXQj3Zg==
X-Received: by 2002:a05:620a:438c:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7de989b3079mr130003685a.4.1752236108508;
        Fri, 11 Jul 2025 05:15:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82964f5sm293248466b.143.2025.07.11.05.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:15:07 -0700 (PDT)
Message-ID: <93082ccd-40d2-4a6b-a526-c118c1730a45@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:15:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] dt-bindings: clock: ipq9574: Rename NSS CC
 source clocks to drop rate
To: Rob Herring <robh@kernel.org>, Luo Jie <quic_luoj@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-5-f149dc461212@quicinc.com>
 <20250710225412.GA25762-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710225412.GA25762-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NyBTYWx0ZWRfX4tVC8EKPDh/Z
 /3WU0LAJMfD6Sy6KDPScte+xIJKr4ata/whvOXxJ1CySbtPWmu6ccTe+c4bNdK2VyLAa+Y4hROu
 23bpfhp9LK2Mrl3Y4c4vlNBcLSObewxTboCsmfGX5hmCWjpfhTavsIbHEp2h1iMWHOIiWW1rdeC
 gp0P9E/00BMixXeM0GFHyDD1CSMREAyjfKd2fm5U88bV4TZ1MV0siOtCRFi+qxzFOC2aiwQlyJo
 oiiyjeSLoFpS2nu2IzBXXUD/2IzBq2qkSOKmSBl0ePmvf8pAXWNyxuF+LvLNuB4NHr4gNJbBhuA
 83OB6yoL5r7gsTGgGfxQ8Iyfj3vAUL9DgoIXEEMBbOn13VSUnVG97TOPaovTmJGqUUt5opt+c65
 C3VLiebNAVNW55zfOSHAO+o0FzvqHnlwkZ0B6WOOpciaol1PRoRabnchybNoCXRYNCR9Uk2J
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6871005d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=icw32r7lKnDoEl_Wh00A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: pdmeTvgm7hgI4UC7CR60qIKPa6WUyOuo
X-Proofpoint-GUID: pdmeTvgm7hgI4UC7CR60qIKPa6WUyOuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110087

On 7/11/25 12:54 AM, Rob Herring wrote:
> On Thu, Jul 10, 2025 at 08:28:13PM +0800, Luo Jie wrote:
>> Drop the clock rate suffix from the NSS Clock Controller clock names for
>> PPE and NSS clocks. A generic name allows for easier extension of support
>> to additional SoCs that utilize same hardware design.
> 
> This is an ABI change. You must state that here and provide a reason the 
> change is okay (assuming it is). Otherwise, you are stuck with the name 
> even if not optimal.

The reason here seems to be simplifying the YAML.. which is not a good
reason really..

I would instead suggest keeping the clocks list as-is for ipq9574 (this
existing case), whereas improving it for any new additions

Konrad

