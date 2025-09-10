Return-Path: <linux-arm-msm+bounces-72943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 564B3B514A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 12:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64584189D17B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192C12DCF4D;
	Wed, 10 Sep 2025 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIWW5xCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF462475C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501843; cv=none; b=AQIszOaRu0m2k/RXovDUX/ni6xJ4hxYagsemnGBkWM1NaVFpUqGYxt+5sSabFagK8+HijLJO5M3Gs6G4ulGGsTIMIy67TWn5pReDT8cbBjjaoDO6ubmPrbCggwzH86oQtCiO8bDwGWMYr+x2+W0aGn5AOV8VNq+X6ezseST3jyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501843; c=relaxed/simple;
	bh=GHR8dlv+537EvAqrl5fzNrzJ0kc33AB/+gWTIB98rnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZWQNEMwXUqnhR+b16MA/3fgoiiArzuoQjKth0TU0ba6yWL7e6BGq8GzTMRoH25jknobncVKh9/SSAfjH7wkrdpBoXWSGrcOmBysGf1FduKgbnK01hRB0xdXJxbvNlOa8CIhVXY9VzwNWUViSDpAU8CPb7I/N+M+n+0DhGUzVXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIWW5xCj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFEv9031246
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 10:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VLrbVYuWBuZbmXNhwxf9odJPcM2JY5vCi7vwVIAzE/0=; b=PIWW5xCjS09BawAn
	v7bQYHBsVubmkWnyc84WZxu7VifUGnD0/QMeawM050oawTVJwOTKvsZiJwefkq92
	+OSeIbJwO8gEzmKKANIJJX3LGCOD6M16EUaIcPaPDxRxZFYpFvFrPRDsiS7Oiqe8
	GmaLL+eQLBUVzeWmVERV3qauzVNOFE46FsDIsre4fYgDSgl+Uw64+BlPLYdaDVfp
	qIKREhSyHlMjAbrPZt7VNDqIV0046Q/so+0YInC+UE/3Vq8tQaFTG2oJPS/db6IT
	99RRVZ0TzaTfRAGkCop6P7j2HD4efT580UV0n0X3MV9b9EDjZ8NCXg5fdcfpRdMw
	neJoiw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t380110-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 10:57:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-775f709b3ceso1102305b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 03:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501840; x=1758106640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLrbVYuWBuZbmXNhwxf9odJPcM2JY5vCi7vwVIAzE/0=;
        b=uZgVEH34y8xyjqanCRLCGSe/rn2iS7QHOt2Jnl3WJ5B83my1QfhX7iQxKvg+ihV/gm
         ktQm0t0bEmZ17KLtBCmbjlbH3fa74OwktqMmHH4fzYTsNq5YOfutxnoy5Ju2jgfdEq4p
         ceSbaDRdN+23xfbSkyFhyAgbIhur7x2LNye2ESLbL0GuOnd5WQGbCzy6JssajGfNs34x
         eoCQngkuXHYCvBN/exjKFoOGdUDOBLFuuMMayaYyG8ZqUiGNcIy8EWOoFxSkD/M2yFR3
         B6sU46xw3qI6PqErylw7qeo2vVblLgRYPo+GKk3r1EU0jLNV0ZMY1a+8h33obIwezD1F
         aTGA==
X-Forwarded-Encrypted: i=1; AJvYcCW/ohBEq6mOTtXHStaH/BWO66tMn7dv3s/g6332+47s5GDaG32twmcQffxv9jxjtiUIuImHg3x4LfK9WVE6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmy0q4s5jCe7Sns1RwNr+weYgN9qPAgVTDcnaS1sNxe0XtSRgB
	KRutxk0DMSFUsXkReKGxAjqXlqEItNEt5HSWd0bSom5JTmZHxn3WMnilehuBQxtkoHGyH3yyngR
	dq5dIMc9+vZoneDoSxCxd2u0awalERDBQyXIQxVKMYQDODCeGOSFkmQ81vd3Uw4TPFmTO
X-Gm-Gg: ASbGncu1F7qp7j6DI+EMOU449Ct9AFwKTt659ldlB4OEBcsiGJwmK5dZ9EY+fy75VpW
	9+WNDnZizELNQaaejYtlFcUWOJUALV59hmV/EKA98kmRcu/H+JKoJjFYtWkLY979pr5xpV+lAA4
	WQQacVbHyru6MlXDvFNlou2U0ukPlVnwWHz5Im+WSqBvQbIH6iLA8dPpugozfvqnItczD4133H5
	kkbqujzUn6ud2DjKVmY4SnRqZJW/OGf87Wp49C6yAkJDBikeVoxgwTH6bZZGeWHqepw5+oPZhGL
	CnKiRsL3rZh2i8DoZ9CY45gxBUlv6lga6cr2lYcIJVqTnVs8Kc3ujmlWiK0ImIUvkG1UFMfLQwU
	=
X-Received: by 2002:a05:6a00:92a5:b0:772:59d2:3a49 with SMTP id d2e1a72fcca58-7742dda745amr16974632b3a.13.1757501839775;
        Wed, 10 Sep 2025 03:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd6cAY5KUWWKRCtZ5BO2LMkzPi8rG6m9xuEQDohogxbjye/JxfepADt3ID1u913pa8j6uKwQ==
X-Received: by 2002:a05:6a00:92a5:b0:772:59d2:3a49 with SMTP id d2e1a72fcca58-7742dda745amr16974587b3a.13.1757501839259;
        Wed, 10 Sep 2025 03:57:19 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-775f4976bcasm2333665b3a.100.2025.09.10.03.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 03:57:18 -0700 (PDT)
Message-ID: <d7937258-9cf9-4887-a117-58ac3d4473de@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:27:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Qualcomm CCI I2C clock requirements enforcement
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RQ_DJpEWNOr5OmDokndiAH_xh3_5AUfe
X-Proofpoint-GUID: RQ_DJpEWNOr5OmDokndiAH_xh3_5AUfe
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c15990 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3WXPGMdjBYCeSjfzpvMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXynjQXmfkgUZq
 C+p6Z3+lAw4BF6vo85PP6/UpUTyxnU36aAl6kGc5UvezBnlHRIzuJrUzHDn3Wqbgsf0OEZpWM7T
 Bcw+SJE+TGTWsVAzKTvuqK3XYvQeg6M3a9iGjtdcyUw/JwDBVxTUcdOVPBvTrl2ct8C4Og4Xg85
 /7sk9sCaQl5PAt8BMzhcgsPfsgidUtC91LpCp71jza7VLCK3Z2MkiqKVBcL5UNUTy+LXkh+wexD
 JnkEY29a5DFSeR0LXuiTQ4BBeOueulINkQyrj0gpc3uqJLl7ChqpqsQ1XLQM0LqssRWD3XZqNim
 iAAbBlBuSognDl8fQ+/GyqbaloRy4zL2oygQ8QbnBCdwv+vjHJ38GVwH5yeQwDbePU0e6m5XKpf
 MbWGMEug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066



On 9/4/2025 8:01 PM, Konrad Dybcio wrote:
> The hardware requires the faster of the two (37.5 MHz as opposed to
> 19.2 MHz) clock rates to hit the required timings for I2C Fast+ Mode.
Should mention "source clock rates" to not confuse with derived 
frequency/timings for Fast+ mode.>
> Additionally, the magic presets for electrical tuning registers on SoCs
> supporting that faster mode ("cci_v2" in the driver) are calculated
are/is calculated> based on that faster frequency.
> 
> Moreover, while its unlikely that it would ever exhibit as an issue
> given CCI is a slow & tiny core, we do need to express a minimal voltage
> level for any given clock rate, which is where the (optional -
> backwards compat) OPP table addition comes in.
> 
> This series helps ensure all these requirements are met.
> 
> Patch 1 is a related but independent fix, can be picked right away
> Patch 5 can be functionally merged as-is, but depends on patch 2 for
> bindings
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (5):
>        arm64: dts: qcom: sc8280xp: Fix CCI3 interrupt
>        dt-bindings: i2c: qcom-cci: Allow operating-points-v2
>        i2c: qcom-cci: Drop single-line wrappers
>        i2c: qcom-cci: Add OPP table support and enforce FAST_PLUS requirements
>        arm64: dts: qcom: sc8280xp: Add OPP table for CCI hosts
> 
>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  2 +
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 16 +++++++-
>   drivers/i2c/busses/i2c-qcom-cci.c                  | 45 +++++++++++++++++-----
>   3 files changed, 52 insertions(+), 11 deletions(-)
> ---
> base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
> change-id: 20250904-topic-cci_updates-800fdc9bada4
> 
> Best regards,


