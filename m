Return-Path: <linux-arm-msm+bounces-76037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3379FBBDA57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688013BA4BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEE32248B0;
	Mon,  6 Oct 2025 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS8QOqeg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9AD2236E3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745703; cv=none; b=RLGW0WuMweDfnra6einSgneMZ2nhuo7/+hQ3Xbtkkmkhsm/gLMd3YnVrBfMs5JwCAPgIeC7AAPFNXYho3cvMgtuT3J09jh22lxncJdvX1ztcYa5wB8QZbBeEjWx2zN5YzwQSH1TNKac9SI+tYJqsYt5mbNaEYpLWpMhsoDCZQRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745703; c=relaxed/simple;
	bh=+lCoSswREYBVYg7PAwHQiojcdE4ZRJ/ZZspRoClzGlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4oJ0YgdUQIQKZitpqDmKYiSGdsr2qecutOkzrNII3lMnOOAWBYvcJnd0xCPCv+LqenzCGtbQfwGfsy3qQQ3dNf9fds1dQGegoBL9+ZB8dqMQMPIZt99Kj6P+ENHRnQpYZ6mLxl6X8Yxn9/0dlGKUY2Z7wD7IZQIo6NTJaqVqrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS8QOqeg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595N0RJS026536
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aIDY01NnRK3ZSR2DKX1nbVIhaDa8uzVxxaZaHb2mwZs=; b=TS8QOqeguDZh9Glg
	J+LrqbpRc7WdvzTGHd2wDv3yc0JIh33yU1K6pDcMUhgBdIwB91FQFcRtzlwjMUoj
	TZtRT0+MPqkwGVvmNAGEWayNV7Ajibq7K+BqxMpIkpKElDvqu18gwLdUf8c9QxMN
	M0hMBCGtcltvUsiAe01UKg7TSxl+HOAy/qESqIcgUs1gIRyNsL1wIYauPl6LuOrx
	gOq/8Yh7Avk+/JrRqHTXcQ6ylj9/66sVEekNWYZKJxF2pC6InubI6XUXfcasUrkL
	/qLeG73Dq1uI117JWtR20D3njYckp2OI2lQFqJIeoQ9WNkxic8lCH/KKoaPw81JO
	lQHnPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgkms0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:15:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e231785cc3so20520781cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745700; x=1760350500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aIDY01NnRK3ZSR2DKX1nbVIhaDa8uzVxxaZaHb2mwZs=;
        b=OR9t6JiSX+snfFmxEZ0i3+g4Kv+to7PXWWvgNoWQlC7xvr0GH3JVh6loirp1FnKfiA
         Hlwa5wvWCrdaYa5iABEqtos/QSVtk+pjI3wYmdxpvlH0aPjHudBBTCARljYiMe7mZv0F
         7GfHHy3zWvbyN/VJCDWXtY2r5nRk92zvWwxrWZW5v01kGVIZpCYV3IqGB7ez+3dt6wNw
         v/g+pfZDL0Mrjls7qDNm8j0fc0Eo22p0eVY+WXi8FLH0NXssAOft0WVt3XNafUk+MTxg
         rViogDmkLdzniF/ta4wb2mjITlEAQNgCL2ZndDkaJgAH5yrRbs5RhTC7JR5/LqhubbWW
         +mTQ==
X-Gm-Message-State: AOJu0YxSsBVRNOTUu0oy35BTk1C4IrusgQsiOHxogdbNj3WK46We4qJK
	zOKi5RGqPF4QHLjb35dlggo7BqlFg82mUDz59DXiBFOppG8EQ/NjN/9rRELYa5/jhFfIG2+/1hH
	vKV94An4f5vFXjTPtsFG2e+IEMDiwZlMXzSrKBs6foOtP4yXt6ABRJ1HIKeg3uSyZPPBD
X-Gm-Gg: ASbGncuSl4BVrwckkB70oBKKs1SxaTWs2tQWnG+3EOM3hOqtBT0aMKw9ciTck1R73wF
	0sKYogmCW9SgSIFBmIjqri8gJWKy6K0x6nhkAc+fnYfXMyfc0x4etPOc53l4X+oL9OdsOuLCWu+
	mETwjIjY9XIu6bDnSopKc3pFGMAkIOkflwYamxbsAPb0YOv25s7Ur4p79viywKmZrLEklSOvR0f
	cDbMkI8oqLFxqRy4rRp8kKp1bBTinfXehulinh9RisECr0MIcmTzQaL/tGKkt82cBrd6oCBhaoC
	iZsKnXqNqAk6giBGAuqUreaa1VgG/UnBNKJtlyuta9ZoliGucRxLHcfQFvmWaZTZeFWgxZP4QZF
	i2yhD6WgLVcTvBN/s0JOtR73nPbA=
X-Received: by 2002:ac8:7f55:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e576a6332amr88117861cf.7.1759745700001;
        Mon, 06 Oct 2025 03:15:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBeef8DRHG2bi/HP7Cc1oF7kqYny/jUEdyQyquytu8JqFxYlckOVY1l/33cLCYd16NUFWYmw==
X-Received: by 2002:ac8:7f55:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e576a6332amr88117651cf.7.1759745699533;
        Mon, 06 Oct 2025 03:14:59 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a177c62sm1096835866b.91.2025.10.06.03.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 03:14:59 -0700 (PDT)
Message-ID: <a2c3eeec-b3ae-466e-b289-991b8658aaf1@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 12:14:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: ice: enable ICE clock scaling API
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
 <20251001-enable-ufs-ice-clock-scaling-v1-1-ec956160b696@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251001-enable-ufs-ice-clock-scaling-v1-1-ec956160b696@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX9366vOzUg0hs
 gyKGqKKQ03KuJme2vHZgeHdUskH44gGNKJYmSULtgOuk6i/YE2JAwXE+Pd05Muj4I0iuge/Etd4
 SoTVqZvvS6W4xJAVVCWwo8oBUGDTaYa3rlVhA+3v4Tnjhs16YmCUIdSfl/k3t9560kLrTOeVb9Y
 ohw286O5K3Nkgzd3VJm9+GR/kPETN6QTWh3gqvvH+nHsF6w2f5mBd4WY45fuDzfvKiKGf7dgoI+
 GBXWTzWOyd/ZEMSsq0IRmO9SkrP97aQUHniugA1oYOocZpjTpLdtSHJgNgdNx0UoA5X+jicJMF0
 SYFEu6/DZt98L6PLkF8Z6FaQ5+G8oV9ZA3MEG/CBTlhUDvxcwgp9SfiEtoIF67JhBBzWZFdikK3
 AsC3zGBnNoG06gbSkaUOQ3oOd2iHig==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e396a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=7E7N79Lt4lT18EohOwQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: O9Vt2T8N8B7YrGdR4a9Lrt2amQt8Osrr
X-Proofpoint-ORIG-GUID: O9Vt2T8N8B7YrGdR4a9Lrt2amQt8Osrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 10/1/25 1:38 PM, Abhinaba Rakshit wrote:
> Add ICE clock scaling API based on the parsed clk supported
> frequencies from dt entry.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---

[...]

> +	prop = of_get_property(dev->of_node, "freq-table-hz", &len);
> +	if (!prop || len < 2 * sizeof(uint32_t)) {
> +		dev_err(dev, "Freq-hz property not found or invalid length\n");
> +	} else {
> +		engine->min_freq = be32_to_cpu(prop[0]);
> +		engine->max_freq = be32_to_cpu(prop[1]);
> +	}

As I suggested in <fca8355e-9b34-4df1-a7e6-459bdad8b1ff@oss.qualcomm.com>,
you should really use an OPP table if you want to do any sort of clock
scaling here.

There are then nice APIs associated with that construct that won't make
you pull your hair out..

Konrad

