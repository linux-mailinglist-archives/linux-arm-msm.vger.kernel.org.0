Return-Path: <linux-arm-msm+bounces-51305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD604A5F89F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 15:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3315019C5ECE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 14:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BDD268C5B;
	Thu, 13 Mar 2025 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOnlQYMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAFD268680
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741876611; cv=none; b=FTA02lkHs3WtcJ+xF/Mtr6Zx7Rk+IpQy3pA1101W39icbiNgNf8F2NjITUqM2RPftOPN2fFXZ6509rNV/djgRrnJwrnZABVXTbWHEnWzk3r+NfWeWaQdLPsZUSaZxQBD77vhGDZkHSe93Y5B8yOfi1siHK57X6nfhNcBaLNL0Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741876611; c=relaxed/simple;
	bh=fcmjexBjqgsbpWuTt8xiQDxio5fQOv40sLnyz2huYyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Olt7G+tP9EorF4fdA4Yd9CD/dn11DzVyCE+dzE4zbFMNHg2SQIizbDuqBePqzLk/JvdZkmLfp/qz9GMRRREm3wDsTPY0mdP8QjBzl6rG/R5OWN9WstOxawS8QhD+vM+WG8y/UquhBWQhKpCwIB9qR0ib7qkbto4nzmNc4SZ56Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOnlQYMV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DC1ONC008648
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 14:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iayw8L6OX7w5xqy3B7BuifNHp7uwUgTuMGxBekIniRE=; b=LOnlQYMVTahsWjbi
	rVEBFc9qK85ziMo4ChS2xBAlNqXqTBl5SIq81UVC5F66SQg5JmNIWTnQjoFng3gM
	ZGetDtXF4zhKhU/qLbxZIiXV8LU0BDGnpJOsSQ+8W+sZJD1rcklDgPf78nMAJW8Z
	/3UO5ZbbFkCVyqFxiqySACe5RYe1ovHCrzQahNL8qFtvHepAPrgqukq6RdfoZxaF
	9cAf2yZGbbYOvvLySXY0NYZ99kSvh2IwsE99yuhHkN1pREtDxwb1/PHxngxIGCDS
	/p8KyrfW4f007ltqzS49AN4WgakqOpF6vGhlLL+r8q2KUC4N5s3ZmmlmornetAVh
	/FbpEw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg89w9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 14:36:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e19bfc2025so3162546d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 07:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876608; x=1742481408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iayw8L6OX7w5xqy3B7BuifNHp7uwUgTuMGxBekIniRE=;
        b=V7XC4R4kwWCjzrQS5XwmmXOeVawcOZ/4eBumPb0VtLMrdymCG2snd796zfF5Pfctif
         2GrWhYogpVJe62P5+zFfMMvo1MlZ/WH5RmM41f+M1b8xColcJJu0mfQyIaKr8FSyfW//
         od4jurP79nQKhv38BnQpROVzF9exlHMa3SIXzskG0FL+AeSIBekwtUWRhpChrKFR7OWY
         rYSaZdisFRSV62V0hTzek53mYget+jIThCK6Atw/yzU0uAbAK1sTaE8BwH+9HYhD0vVC
         8ACab225R62jH3qNCuymknbEy7fz+PO5a5fgIlWPsOVZFC1/0oxiJaJgguSHvZKw+ZoO
         3UIQ==
X-Gm-Message-State: AOJu0Yzo9YdACTl6WcuVUhdrKKWPrZws3hXUHwDPJUxUm57HFpLoEgr1
	QsJvaR+AjR61qpjveEl7hnM8WPr+yo97K+qWD2yBnQ6nji3jbcLuHAqmPH9jsnV+uSy6cZR/fet
	e1DJO8x0k1FaLUBa2QWw6igBqxA4bvFZexDWQJd5+Z/j0j9d8rg7OiEaGoRMrsW3J
X-Gm-Gg: ASbGncvtNOgtW4xkCwlIZNiKlcooLaQS03hflxqW9XvIL0ChKzuEjFjDCYv0Qqqhu/U
	hv9fr0UyOLOlgOqkgY/dr4cheT9tcFZZGgpPiBsbK9boiuLRE8j//rYoD7vMILZwc6m6ZxYi/aL
	vv5k1bSgKCNfrl6AAfa/r26pnW9SLklFasa9HzmJmfVmy3fS7kt0reYAXsscqntDrhDeTbdincn
	Xvj+IbkWb4GzVuRnrSm1i4jgIFbe2Gpt9U4YxJQXIQdSaE1Pnp6v7+5sHdrqGsG4LLtWosh1EFx
	lswMfoKM1of22+IbiA2hEF/eeUSbo4PZfJDlCCb6pu8MTUvuA1gJc0Ezge3BwQktPtI9kA==
X-Received: by 2002:ad4:5c6e:0:b0:6e6:5cad:5ce8 with SMTP id 6a1803df08f44-6e908d5cd3fmr118537756d6.6.1741876607912;
        Thu, 13 Mar 2025 07:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtErHMVXuVhR9/1k6bEnfgqC6qn9DQ6fe884e1yhVTkqGYcXJ5LojlhftI2iNuNv3u6p6Rwg==
X-Received: by 2002:ad4:5c6e:0:b0:6e6:5cad:5ce8 with SMTP id 6a1803df08f44-6e908d5cd3fmr118537536d6.6.1741876607455;
        Thu, 13 Mar 2025 07:36:47 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149d0df9sm87916766b.99.2025.03.13.07.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 07:36:46 -0700 (PDT)
Message-ID: <2fb1ddf6-0fca-4bf6-9970-728448f893d2@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 15:36:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ARM: dts: qcom: sdx75: Add QPIC NAND support
To: Kaushal Kumar <quic_kaushalk@quicinc.com>, vkoul@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
 <20250313130918.4238-5-quic_kaushalk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250313130918.4238-5-quic_kaushalk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d2ed81 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=ncw13XDXEW9X0_jSTFUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: jVjcnJLeQ3A_3MA8fLsB4CNIV_JzYje0
X-Proofpoint-ORIG-GUID: jVjcnJLeQ3A_3MA8fLsB4CNIV_JzYje0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=842 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130114

On 3/13/25 2:09 PM, Kaushal Kumar wrote:
> Add devicetree node to enable support for QPIC
> NAND controller on Qualcomm SDX75 platform.
> Since there is no "aon" clock in SDX75, a dummy
> clock is provided.

Alter the bindings not to require it then, instead

[...]

>  
> +		qpic_nand: nand-controller@1cc8000 {
> +			compatible = "qcom,sdx75-nand", "qcom,sdx55-nand";
> +			reg = <0x0 0x01cc8000 0x0 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&rpmhcc RPMH_QPIC_CLK>,
> +				 <&nand_clk_dummy>;
> +			clock-names = "core", "aon";
> +
> +			dmas = <&qpic_bam 0>,
> +			       <&qpic_bam 1>,
> +			       <&qpic_bam 2>;
> +			dma-names = "tx", "rx", "cmd";

Please make dma-names a vertical list, just like dmas

Konrad

