Return-Path: <linux-arm-msm+bounces-86826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFC2CE69AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBF9530380EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 11:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9352D661C;
	Mon, 29 Dec 2025 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CuAO0k/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmEU11Nn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582CB2D592D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008918; cv=none; b=txL4+0jQKsZBSqPKvLhvMAKT986RdvfpL1FoLXvBz2VbYBmfxzls8O542SSgA3iSRHJWeqM5IblnX5g14Zm9NPGGgUBMhBIi3WR5xZeDwSWTRrcAGsxv88ugb9JSxaBXKL/k3rx/2enE8UC9wLjXY0K7uuS02mXqEP48iwE2N4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008918; c=relaxed/simple;
	bh=nfGKOnxXXrdpdlQUOwhs4XUAyaXh0DDZiajPljdkwp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJ1tY5yBN/wjSHrfkLoOEBkLF2pVvNXQbmgMybf59aH0SuhMQ+K/JU6LY8MPL1vhHQ4SZuJIsSDAMzfSYMlcIbuA+Svgi1mlxE0idOwBaW2lywonbLZe4LsmR0kn3KlS9J7E1nIxlCTdaV18Q1EHsVpvdZDwui2eSvXu36jNGqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CuAO0k/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmEU11Nn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA0VRD4153869
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6pLjLJrFiUbAE2U6jsZwO/RLEVLAwFpUy6cDdi91Bo=; b=CuAO0k/8qX7YirEh
	Cw/KTLT3ZglmvPAMVFry0csnDdPJgI6KmmMz1o3NCU0oBt6X6uGxIVxRss6UCx9L
	fZ6n6ec0Q7fq7iTjdJJoCxIC7xZcndhA/jazwhvGkSb6fxxyYKTq2xhss2MmnEog
	WN02XjN0tK2lOasCY7ziO8Mf/qBusvfIg0OETxnTuBZDElGJ4DoUkGMf0fJMiqC5
	11YIa9jg/wblsqIZ2uT/ZKjylJJK0OMEWJ2jOJfDpGaeZocIbf1dmbZEVY7rKfow
	POV2wcw3FuCb+30o5yAsHN7DJKAUfzcHteJBmMC0hH7/jHsEg19nZRIhVJpUEKt9
	30RNog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bv89n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 11:48:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-890072346c2so10521886d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 03:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767008914; x=1767613714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6pLjLJrFiUbAE2U6jsZwO/RLEVLAwFpUy6cDdi91Bo=;
        b=jmEU11Nn/nvxnMZua8MyPuL4yEZIXQkPVgaAmMLJCCF5XynnOiYB2PikixZDlxEUSl
         fRoK5jtS+nfSIkj3qC2ZyeBZvQZYdAyEuxS+UJtcmRIN4yveA1LEmwCKFNlkuUpneV1e
         M2+J9pjPZVpaCc6v2OCrYuqO9aRDBrwHhFGggDL+DtC15GB6lKPaaNBpo+0+rpRmmxyY
         u6KRZIKFwvMdJDj0xXYAp8xaoeNstjTuddJGGHmCrSzdPNp83OQOK3xjYC5r1ROBzNwr
         AT+T2GvTLuy0Y1qmYNEKmjaHhNUflMRxIv+MKOJf8tLl+CDCR/OA/zOoHmWriSO7wT1C
         K1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008914; x=1767613714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6pLjLJrFiUbAE2U6jsZwO/RLEVLAwFpUy6cDdi91Bo=;
        b=b13orDB6nab2oirOjM+60dpJKPLwSlUCM3dxySFTm2kBtF4RtYI/ixKjIGtUXU/iSg
         9zUYmBqvQL9R6te9a9IAoWPf3XiatZkX2hSinwEauYS6FMq7hsbd6ky7EZMt7XbXu8NR
         hxAinSv+pxNK/sBjP9B87KGXGIyCQSJeSIxWJcIR4i4MB/01IwsCyZMgb83nzJhe3ene
         KFFnt4NJlBTsLrvjHjOtuOJwPQ3mEC9WioJ1DpRQGmNIh/Y81MlVVrjE5B8hg0aVSAI4
         Kj2Iw2SK+3Tck5/TAE2ARNntCEIYwHYgKP5lZjynIHNHkDAS9rf6H5qo/bCuafrsEcJh
         D7MQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3ZX6rQmOhQBrxFbBnJUU0+Rkinxsmqt7VzunFPismwSGu12rm3CCfGtvjyMlP/sKjcqgV3eBG8ZXD4hLp@vger.kernel.org
X-Gm-Message-State: AOJu0YxsmzWhhPqnbGO5qpkim+RcX7xNYV0x72IYJDOx0LTX6jDMkD27
	91ryHfuP8HKbvfoRlTyN1vp8OoCQ0xwxe/YzIBHH5pgqQd22PpBMsgnTKgRCqvDHf1C8bPBbPdF
	G6MZk8+rUHlJwoKHzR/KADB4D74cMyene6UqDAiQgfB95nTvDjEGGrfTspxvu3qimJDxt
X-Gm-Gg: AY/fxX7MVZM6kYuH3H5mrFIQbuskt+tm61Z2DmvdSc7ErmJRHcdse23iX5njPYVaFsL
	jyqL6sryDAmPjMqX/AOxONLOZj3U+7/azSUcmd26vGOOtfILS4KwmJ8RXJLgIWcdTQJwwadczYA
	ZuMJiei0BeTWqBH+WGpxrxvkcH53a7HC80L/Y3gnN4r84d+MhDSxLYHAFumzmlezR+UjfM/vojl
	GrUkaeluYUjn3WRJSnzVHEBxXLtriLYsu82mgz4mdmrOaz5fm18UQj5OWOHtB0V27Y+qSTcgyDh
	TGOqGgYBhdAvHt+8TuHxZpb6eF9z5rZtRqiqCyTnsfQLxUG9Xm8mrSEbX5GpEH07c8iBKNzRKo4
	V0dGxG7f/268//yQNM9tIeUK1FdcQNPrG4WZa0IVxjJtXPtvuQb35oYxCLbPQTrXcPQ==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr336871421cf.8.1767008913774;
        Mon, 29 Dec 2025 03:48:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNlXPHrw+87xPczjAyHHJCHq5687dQa02ZCgEwbyXKTU5UGiHsqq1xwLX0wezJROhFK0cxxQ==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr336871141cf.8.1767008913320;
        Mon, 29 Dec 2025 03:48:33 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad8577sm3297200666b.24.2025.12.29.03.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 03:48:32 -0800 (PST)
Message-ID: <8c015da1-27dc-4572-b34a-43eab6e3d5fb@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:48:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: x1-el2: Enable the APSS watchdog
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
 <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-3-1801c55d2883@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-3-1801c55d2883@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -WtLyXTvLM6qQkCxQ8dLL4moHlatBhUh
X-Proofpoint-GUID: -WtLyXTvLM6qQkCxQ8dLL4moHlatBhUh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwOCBTYWx0ZWRfX8gKdB1YnqC1f
 EWDypPuMb+G94UtNso1KQdZ7HRxppslpSzojdN/YeIhzMlPhtucvDHrSdOR3eRsx8aUqyQiTmVj
 zgaO0K/1LPpikrWDJsjtOKaGqrUiiYidXmM1QApTnETS3YJtAHBlJpyFGmrDBzCSVoR0kEgUIBm
 /pIcRsVeSTW2VzgAHw6GjRXGDhLg4IwW/jW+Ah8DUJpkRdf0DlS4JADBOU/Myypqd/0+vudQrle
 FO8EUZEyTIPlvmeWcnRvxcl1MRxWVBgXAXPhE7rkk9RRuOwa+uOsJHICzTcjKOK45TMCX/Rb/8h
 JwMUlXL6XMkxccb41I1wn1F114TQhngObg0RmamoNO1IVyvSRnnsV6QvVP4WkrYbMyQFclJghnT
 NV72HyD3Nal2waOY8iAntac/hP0fN01mYcds7MN5qBQhSLSeoO9iE+lz4cnUw1ze1SpEJ6o4jCS
 Tez8Yf62FfRwsVPYhsw==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=69526a92 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZJLRl-gtoie-yrmA93AA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290108

On 12/24/25 11:45 AM, Abel Vesa wrote:
> In EL2, the APSS watchdog is available. So enable it in the overlay.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

