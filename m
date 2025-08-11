Return-Path: <linux-arm-msm+bounces-68362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B435BB207E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F54D427D66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB6D2D373E;
	Mon, 11 Aug 2025 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBJYPqC3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E52D23B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911666; cv=none; b=sRdtTHCGooekCLVuZCzMR1Rh+sKWHfQBGs4GYN2ArohRUdmW4gSdeFFs6R49MOei3S42FRsxwoMncQRwa3I0NiKMemYeWV5DmREKcFZLdP8SFKqJqyRlUInOtSHATtgFdUxoL16v8GdR669y4Z0OY0vQ17nU08j6vUX6rdaopU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911666; c=relaxed/simple;
	bh=U+J+XLR+6ekPSZrj8pxsuPqEj3REqQNGk7AxDkssPmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3YsYnvaOXZM+hHVxOpZlmEyYZeRAWEOavvlvS2Q0YUXrtLj2qXvguLVBow4ODatnGRn53pgAWmJRR4hmB2h1T2W/i47Ws3dV+y2cqLqovyz81xAddhjpuXXSQZ6BoukMtF4YqfhZ20jDxAosGrrFSA2GEMOBbYkX0FJTyrgp7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBJYPqC3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dFO5021869
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fyLS4N2oFmF2UHiHGCjHJxCE38PIq/B8p4f+c32zQI=; b=WBJYPqC37sqXjgTJ
	zJ2c/zO11jThleKKz5jYA4agRwC/ZU0Tgghvp7SHMuvN7Efc7lulsqxe3VtarRrJ
	PjBdm3FfZ60ydGoEs647Qa/pFM76G8mebyFEvZYOfOijWb1JrUfQGqPiHw8KjenH
	/cARw3yK+w5B6PGtHf0d+7RRh0KWLqJl1eMRZvO3p+on49umkL3jPlZLbfVk56UA
	JmCzkTWcS0BiM2LgpWxDXBRzie1j2ulGdqXb3sEp6/leZNX6+ZnZ0XN3ojFCLTMk
	kqJDrcl/XNQPL4HBL+yz6mZJDLilsixIQdbmK1RITcUWlKBRcJpVo+unXVUMyMs+
	JtBFVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj446k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:27:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af1219f29bso3743891cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 04:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911663; x=1755516463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fyLS4N2oFmF2UHiHGCjHJxCE38PIq/B8p4f+c32zQI=;
        b=wEEARU4eQpaoYAWA/YY5U81D65p1pkRyflmniVfllkffRqyeo+gHBiXWchCteNeMkX
         IIQNydq/56WmzJQcNX+Zh7Q5V1zbA91pWXxO/GJ3AmP9dTAymEz3LyK0shKJ+NVuBt16
         mRZcGP7u3PYYRRUhEUWTWjyHDELyXJM79dPcwMTuerJh3G8t3521kQKuc7H2cM6KPybR
         FUXGDBP83GsiGGXKo6CSSuDnjS2Qo9TbYu5tp0v60sDR62L57ADoeBPBztFpa06vk2FY
         kftCw/et+fjyQ9IFdVq51rHTqgX4mAQnp5yM+h1Upy1QIRTPVp4ljp+Pe2TjlpUvcf7G
         hFiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdGyT3o7l1hHj6dXzBT9TNR3qLcUdm6M6bjCcpUibypnBCcfO9iuSkuZROARlMKxVk0WRZur9fKGjGK2z7@vger.kernel.org
X-Gm-Message-State: AOJu0YwQcTwRtTpm1Wm8ZX0XjIEzrD6CSRXw/oIWaKPQQhlQUt8gYiLq
	ry0SmlyBxz5AtJCEwUzl9MJhotSaLvrHeuIimkpe0FGSI6bcZBoKvDUPKHXlAKtRPfRPSVcH59k
	qVXh+7DgPQxAirudhC0u63v2niucHX9X5EdYYcOH2ue6d25mk/nQaJWHyG8+UnDDVcAmy
X-Gm-Gg: ASbGncv66axbRVPWOj/U8aGgpDOjm3zdWTQT/3Bj15OJ/C61tswxfwdj7JzFSlUrDRI
	8dHeI7FrzhTGv6WbOkMTEWlUsWU/0eOjNxTvCmQdyXFsfb+NAnqKGvZ6PCiOT9xtoEmnuJ/z5x6
	zD2vPjX+/P3FVsvenft7CdFxNq3rhkHO/d1Eh4+MlCkh84LPGHEFcBpYVmAOa4tveZVMGPnuDJZ
	35VW7C95Bqf/sd1/y8cPH+04cizVU8v1N6h+2LycVelEFE+sq7enTJYGWVJKONBuFJ0EBP7KhQG
	exWI8p2m75TIBJml9CRuyZzE/A/MNmzYBKO/+y7u1UznWjxjemJ3/TNTil1X6ACUff5SL9AFUja
	C6/Hq13wulzSHvfybxw==
X-Received: by 2002:a05:622a:44e:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b0c18ff1b3mr53726941cf.2.1754911663342;
        Mon, 11 Aug 2025 04:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJgFSDOS5fEjCuyG5NolkHlckR1ubFRcXPAOC/JGl654XR7C52OV8G/dlGBHR8wLM6zvgBnw==
X-Received: by 2002:a05:622a:44e:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b0c18ff1b3mr53726531cf.2.1754911662717;
        Mon, 11 Aug 2025 04:27:42 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af93d62bc97sm1729893366b.80.2025.08.11.04.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:27:42 -0700 (PDT)
Message-ID: <bc5c66f5-2f75-4371-bfc0-452d69bc16e9@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm632-fairphone-fp3: Enable CCI
 and add EEPROM
To: Luca Weiss <luca@lucaweiss.eu>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-7-e83f104cabfc@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-msm8953-cci-v1-7-e83f104cabfc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX6K3VqWdfj8lC
 WGEXiFKWaMReBBNnJFtTITOcyQerxWG7SQb9qG9qlChL4he2UH3AmAcB7XEhWcWwW2vXzEnPwho
 l7yXSeqaQGspavyGbgSWnYyvycgP1uwMgZg8dSPYU9odGiwnQBC7qhScOz+ScTEYY3Lof/H7sv8
 7g3TvgMjAvldzWGmrwnPPmTaekwZncYejdZqpzJIjE/4A0h/GADmqZgrQQFIng8qEJQDzUj0c5I
 C93tOwDQQALy5xKa1G4gEXlRuiSZ442AARWxOplKVQqQobABWI+w4pUhfMgdnyGQp95IrCwO6fk
 dnC71XMp+ytVwXRS9dvV/t7/PLe9KP29l4dmCNrM9V4AVLG706EMcMi/6QuuOeFWV3Qt/F/yREP
 G/g8DIbN
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=6899d3b0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=RAyH1-HTb1k6rVK9-NMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: 5rOnOF1Zpjsox0jZUgeuTNU-_unjjgXE
X-Proofpoint-GUID: 5rOnOF1Zpjsox0jZUgeuTNU-_unjjgXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

On 8/10/25 5:37 PM, Luca Weiss wrote:
> Enable the CCI where the camera modules are connected to, and add a node
> for the EEPROM found next to the IMX363 rear camera.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

