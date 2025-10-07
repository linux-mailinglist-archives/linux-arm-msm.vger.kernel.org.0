Return-Path: <linux-arm-msm+bounces-76209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6C4BC1782
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 15:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 403F64E21C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 13:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E252DC789;
	Tue,  7 Oct 2025 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbpAp+MI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C61255E27
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759843162; cv=none; b=bR7gvGcNfHdUq4hwdXf4V7BCqWq97zO0Jf/kYIGjy7t95rhOFHp7QH6I/BwxvwiuiXTUJxp5fV+FeuSD/pqplPebPJ+c3xGAK7tvxtspNG4VFaOLq/+Qz1X0cajrZ1d+HdXZmC4J8liQLQD7w/EWLHI4/mmOIUr8/b4W/7eJxTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759843162; c=relaxed/simple;
	bh=LnAHJdfLE8ObSWvVmW7FhZfRtelieJ3PBtAew1HGBgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fl56Jz7aodBSutMv9HG6hhh1yUTA242b3RrNe6PH3gmnPbuSALzvHXK9lldNbaLB5XAm23yx3DIM7JTIBktzlBIAlx/ll2pUkkFDTMh5lSuILPMlR5JFB6Tu+MoJpdDJUanPI07YKBFzxR2XRjjpAN5tVIo87YD4z25PP3fsDA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbpAp+MI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597CcT2A013397
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 13:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zDMLEOsZqI7VKYWstweTCTb87X62RrcGaFnWA3/+hWk=; b=QbpAp+MI7xUz/fOg
	3iiwHwfmofszZ6uUvzFeWdiG2oZVlhmgKaiIxep0GNjFDq/qdOroV7IqbQwL4SNB
	JJdLhSBFZIf14r1wuL8CtT0fdWdWsqjRzFY+Cya832F1iFBvSLUrUGXes/JJFHcU
	futz7zi6UaMygj9EDJY2oqO45tdLXThKm5JXpXMlg/CdkvAJ1naAuTas/1QyU5ow
	r7w3a9ZIBcpIUQlwvngr/C6mkofSiuZI7EAGlNWva7aLScmtaI3+yGpRbLHFBo+3
	1gwV6cs9G6jjrUBBaoe0JxvTvCR58Lmpw0kfgJLeUmhvPwa6heJfS27Sl4wbeCmH
	n2oiqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhq40h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 13:19:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ded29823ebso10933361cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 06:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843158; x=1760447958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDMLEOsZqI7VKYWstweTCTb87X62RrcGaFnWA3/+hWk=;
        b=sLrJUjYeO3JOxJFCYTCZSRhuTrLTD5h8O70ZZXW2QUktfrOadlL2XXGNWSgJWMiqMD
         6KqiyD1t2On3qNXrkkC7+U0QmcRJ+vZMwNAJX3PxZJ53RQsDQyMYXN5olJqwEPdGqFTC
         jOMyhk7TWH8Iv0YpLfS/GavVNXS9tNUP29zlWi7ieA/QzWBce40VJIch+rK4e6fGd4VR
         alOXOzgsoQW+mtjzTqspQlJZgTeGithYoIPe4n20pDfHHuOoaEuERLVEmdV6PZPzUmoD
         JgdNZ3NEljLcT8tGL3akHxOVqbhei/JHUxgYSpbklWagxcufxZeQOc89AgHyC73/ZcuP
         jWrQ==
X-Gm-Message-State: AOJu0Ywdf8x3XHl6fv7x7wA0plnxuWr0dpilnjGlzDtkyzhWHRytz1uf
	JVYb2Pr2Mwxmuq5Ze6JMsLbxFugGK/3ULTtWYOVXkWK6rk4DhTOFDqqLdgHdoo6/ILAWMqGxSyb
	zCwxqMjsKvfGfrqtVtrkkj74/j7eJTvk4oy9aUWpzsQYrEnFIv++9UW0zZUZeWh0+0/T+
X-Gm-Gg: ASbGncu2WkFrUGlo+LZv/ooeDbh6uFIP4JeKXRLQ2T6J3yCicfENU0FrBXl4/wiOzwf
	N4SFo97Gb0S2bXE6ExvS0iIYbkF32tjKBqgtD2cMHucp7YrM1OvSowdkPkW9ySHOEtAanZpGhFE
	AVNLxIxMIp3IzXsmvFYyzHAWTpDjlawqsFrbAJnc8wMyP+Xmlb3zRfmKkDJQge6GjALtIOecldE
	kvLo+b5mWEJjGR5+tj/YbGkfytOxWNJvQdpbteLuwyOIymjCnVlcMc7vfC2767aVpqjKoPeSshh
	7dgPDomQTZgLNp676hE3fcVoaOmB0gOhjf3gic54/nIARdcc7biYuWLL+NPonymrA/IXcwkhnFw
	0diVQnHHQCUHhdghGgKv461OUkEM=
X-Received: by 2002:ac8:5f91:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4e576a4b14emr132692841cf.4.1759843158057;
        Tue, 07 Oct 2025 06:19:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/NXeouDxTbHwgWa2d0D7fBgPvLyWgqaq7L3tSbrQ2CaTdY9AOHfPVIWwQCrEHUSq2nA0hqg==
X-Received: by 2002:ac8:5f91:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4e576a4b14emr132692161cf.4.1759843157313;
        Tue, 07 Oct 2025 06:19:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a4bdsm1396017166b.49.2025.10.07.06.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:19:16 -0700 (PDT)
Message-ID: <1cd3fdd3-af27-48e8-8bcc-aad7262b139e@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:19:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: pmi8950: Fix VADC channel scaling
 factors
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251004-fix-pmi8950-vadc-v1-0-3143ecab99e9@smankusors.com>
 <20251004-fix-pmi8950-vadc-v1-2-3143ecab99e9@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251004-fix-pmi8950-vadc-v1-2-3143ecab99e9@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfXyov9cpRa1uiC
 FB9CgttV2AukV6eOPJYlgGmd3IJqzjI4Msdp/HHHFxJa/s7rNeR9fruHbAMNI1gN2pr8Rg+X/kQ
 rmXL9iXJ3v2eoENFtiE+ytkIzxMW+auyYuH8Ew88jX7iegjrxW7p8RfNYJhvrsIYtW+yq9nm3B0
 vCvFSXcDytyF1r1cn9bVY0wDvGa5BYrFbvvbc4lLRVxSFDc8zw6TGt/w0/E3t1dYdDIdyzgWDgw
 DAF+2DLDnNa6XCEApOAzhLZya9GHC9+lD3+fZYV9ljxT9yjDCshsPboPDNBI6ovxCL84oj60Aes
 UxaF55RTB9Uj2r8RM2B9opVTefuFvizkUB4LV2sJiJM284Q7NzoUGgntRNQpTTUer2YDVNcbIKn
 DzzIRAPo/GPVpyVyIDALYS7b55Igsg==
X-Proofpoint-GUID: 2lXvFiJXxSo5abBj6h6bQshVjnzHAuAL
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e51357 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=jy5Z_zf4QHJ3AEBhBnAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: 2lXvFiJXxSo5abBj6h6bQshVjnzHAuAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036

On 10/4/25 3:12 PM, Antony Kurniawan Soemardi wrote:
> Fix USBIN/DCIN scaling to match the downstream implementation [1].
> 
> Downstream defines the following scaling mappings [2], corresponding
> to mainline pre-scaling values:
> 
>   <4>  ->  <1 20>
>   <1>  ->  <1 3>
> 
> [1] https://github.com/LineageOS/android_kernel_qcom_msm8953/blob/e6b46fc6f52e754eef5ce6265c7d82a3622e0b0f/arch/arm64/boot/dts/qcom/pmi8950.dtsi#L55-L86
> [2] https://github.com/LineageOS/android_kernel_qcom_msm8953/blob/e6b46fc6f52e754eef5ce6265c7d82a3622e0b0f/include/linux/qpnp/qpnp-adc.h#L342-L357
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

