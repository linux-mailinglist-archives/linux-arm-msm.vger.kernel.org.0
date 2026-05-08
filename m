Return-Path: <linux-arm-msm+bounces-106652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OwwA0LD/WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:04:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4034F5765
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D238630B2BCD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71327355F42;
	Fri,  8 May 2026 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCUWnA8A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APgA//FG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EF63128CA
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237848; cv=none; b=FRCrgMaXZBEBMkOOFhV+4fc/p4GabldD+XkTl+hkoJwZ8OVkuuM8cpFSOGfd4hlgxVveJjwE7QmZ353wOABITK9mR/QfINFEYPyfmrr63AZXtZl0CUyv0Y9I2ypyUM3GSFsws3SUyH2X9nmkgJwqvrr4W6wzX0XjX/UF3x3Q3Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237848; c=relaxed/simple;
	bh=t3UEkdbU94HVj5nKi8Cl4Rw7eUN1E66WhXCwZhA9aww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NuROZKWzhQRM0M7npUhvDp8ldWUlprZYmNBWt0vX2g9mj6II053fT02ZVpHmF/LHKC7X5Vl2H2MVl6Pwr+hoMNlHpV/uQNghWMz3nrqBUwqXA+Aili0oy3ZV/lFI8xHDw2ikNz2avVUuXLhtkh2sz3rFUpSadLDo+eObewkKy6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCUWnA8A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APgA//FG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648Ahilr2199536
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=; b=RCUWnA8A0Dkc3BhJ
	a0N5CzTaw8w/EP0tJAxJlGPPrWwnM/aQuUGHWXAyqqlaS01UKiJje03sOlFv+IJw
	fjmIqqMqYSUIf4GJ+cOb6FZNUgZu7kNQuOi5bpxIuuJaHDt34PN96IyHIA2dS4S5
	l9k0OXs6frvBS5KmMmb88C3q1YNTH/yqIF7y8KrvCrTMERYomiBcD7HXu8lSfRQx
	xb5hNCMLDR4qf4wCa/tO6Rr9lfwFz6UkduS//i/P69dT5q1ZgzzdRrXheIljKTsX
	ylMi3cl1+raD6AvWyjnmNn3OIedqM6X6PKjZVUHxUR529uy7Z015Gdfnrq7Z3ZOf
	qV2G8w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sjys2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:57:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63121ce72cbso157063137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778237844; x=1778842644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=;
        b=APgA//FGHEASdGED2fRanXdAVHHlx4ZSa8+01LMO4akpiR6/PJvCAjpGkpczF156R4
         gtFborMfPB8KHBuN8RUAh4mOQA8GtZIgHmcwUF5z3L9pR+Jt8V/gmFWbOERRTG2NG1oJ
         LZF8BfNkMzdDnKBVxFMRpiFgpLfi8N9bxJKpIeWMmrz20W4UbOop7vRxjN+cjzX8rQ6S
         xvgQe/ux50vH/yOB981sMp+jSSZLIyS8f691FILrKJnN11zWybKYwUznS20dypP2Pzys
         YfWQ5Js07AGqdLDZI/DuViueltAAvRPkhHvy0R3tHdgZVNXva0da2csO1GW8Mikcf9Fz
         XAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237844; x=1778842644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=;
        b=HUG57RowEwwAYCxMxpsbT5EqAvpJ6TisB3GhlZ92Pj6PvLXhQXGT40I8+LzXE3Qscl
         TkZTVmXIX0v1P0UVedYuPCeKFyZuEYMiyAfHLQ09/AVVpxcXwvaDdttyCyLVDjQO4T+V
         14gWI/8W03/NTEQqbhhLpuSvTRQ45Lvp2+S5WrPc4JlXvl7TNeXmuSPvFZSb5Vzxy+H1
         3sWqCTHkJw/NYYh3PQejGCTe4FmRgbhR7VDyDlYIZhGl8rxwPuD1MKmLWjnu98jjlUNc
         iPW0iMAfmJyTMQz+NBZPISOWbhDtMrB/lxDJ38/cIXfnPolgHBEHRkVUbjM/WBe/3k56
         dQ0g==
X-Gm-Message-State: AOJu0YwRKHLob/6ds13We12FUZ2k1ZUAyQT6lTLfXM3u5gmkrTphOKdT
	2wFdKAe/WiQ4yYCT/l3Nt29hojjnG+7yLoq/JQlLeqdoygD3Pm7I4xAul6K4V5QRIh638dFRhmh
	9C4v5GpvgSJOvGGif6po+9SgnvRt9aTgPe6W7j/k4Gi3eZrSPaliGz4QcTOun2IhzivPr
X-Gm-Gg: Acq92OFOr8qCD9IeuSEieusIp99Q/NACi/khggbIIryKzJBk+AkB8wCzwZTptI3G2S1
	Ztgq34txEQB2MkOai/Nbx7ACoKJV2f3dt0G4ahiCYi6DiJfDR88bdx2rcQ0WfXVt2rkNELKHbw3
	VEXoK0KZresxJCc1E88Sd8LRbhg+g8yzxHRgVPkJ4wmSVf3rB8TeQmPQSeh5rnhtZE+cGHFOXDu
	xjaPyGPpwopka9VF1v573AKekoRZJ40FVkVTN9jjpO7BVEv9TRi41PC++pA11oW2BJ751Q/Cova
	SeSYEgLiPLI8C47UInKTuzTJIahsxpjbnJaOybeO48w/lqU6URJcb8e2NBWmdkdzKFw6+RaPMa3
	j4rPuIWYBGir5d+uxjl4r8AWT+w8cUzZ12760VoayP5IYa6zWRgyf0gaLH4OV9L07qXuwc4Ige9
	rHMr4=
X-Received: by 2002:a05:6102:6812:b0:631:4ad7:b365 with SMTP id ada2fe7eead31-6314ad7b6e5mr37440137.0.1778237844546;
        Fri, 08 May 2026 03:57:24 -0700 (PDT)
X-Received: by 2002:a05:6102:6812:b0:631:4ad7:b365 with SMTP id ada2fe7eead31-6314ad7b6e5mr37436137.0.1778237844149;
        Fri, 08 May 2026 03:57:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359db2sm65177566b.49.2026.05.08.03.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:57:23 -0700 (PDT)
Message-ID: <faeb57d4-5260-4d62-85c3-de51d6623195@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:57:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm6115: add venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
 <20260507-iris-sm6115-v1-3-0b082ad8eea8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-3-0b082ad8eea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMyBTYWx0ZWRfX6365GxWXjaSw
 wUMwj8pQzOOlqZvT7yRySCepD5UOtX0J02sw99lMoLYVMBWGJ5AwU1HeLmRoOV/CEveygCUYDp2
 NOhmm7l6F2cwh/EGbbOTDTcMIdg0YebPFykBtZnXl8fs5GPSF2U9eiRiGx04nGuLSnaTZy6Xyuu
 B77KTDYj9REEmQZ+UtDteWe0pD/uEkpLrXbSTqfpxUMfq3ZBe3eS3nW/uzLHrJJQGqEvT+hX4Nu
 WrT5dhrxJ6iU7cEbfCUyakTMrVqElwJiHBe/SmuCjO4I6kTgc5qnVwY2sZ7bG25h33Cc2f4pfnh
 SfrGoBqbmruCNkfFh4PUVr45HWGNb5tQQjf7mfDlr60vEwhXw+Eh1yvKu/pi+v5/G1sp7wLRfCH
 mBMwGntYLMnoz5pJYno6BxwY+ilQLFN3gs+gyY/3DXSnNIu5as0y7uRVfTJqLCxL0Wz4NsiGorl
 S9PEA+IbzsNHN07TV0g==
X-Proofpoint-ORIG-GUID: 6KfNmR_Byx-gtSgNwuT2YgjO4zKFfKuu
X-Proofpoint-GUID: 6KfNmR_Byx-gtSgNwuT2YgjO4zKFfKuu
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdc195 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=N9Plf5D_esIoL16y4e0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080113
X-Rspamd-Queue-Id: 9D4034F5765
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-106652-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 9:08 AM, Dmitry Baryshkov wrote:
> Define the video en/decoding device present on the SM6115 platform. The
> core, AR50LT, is mostly compatible with the one present on the Agatti
> devices, so it uses qcom,qcm2290-venus as a fallback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

