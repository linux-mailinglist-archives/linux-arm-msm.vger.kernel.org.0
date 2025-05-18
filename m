Return-Path: <linux-arm-msm+bounces-58332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC653ABAFA2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 12:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFE3F1881B5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 10:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3771B2153ED;
	Sun, 18 May 2025 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyHLh0E4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091F21771F
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565912; cv=none; b=OW3tEPZeFv04YNLFCxso649/PJ62pPjUa2CtJZWcZPa12py8LCLT+l9/Qfz5hVXADm8ZRieTrJtteKVdl6m9c6RDp5A9U6JdSJR9pF45YMZwYrzDULSdzYgjKVLtSAq1EZ0Hf2TrYv2LXlM7cu8sV2It9TDORxvoiInKlR6dVhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565912; c=relaxed/simple;
	bh=Kf1RaFNUgXQV8P3hFgMzRJzehXqOmieKWtM+BxPAu2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFxSZhN6VOgIh169AkMO5lL4Niu8jmnGagrR2gaN0ylNnkhiE6No30fqLJB01EL4VUZD9qzgxHFG+QXnMGUThsIJqa6+W9DNw3JUiil/XOzOiQASbUB6heygf8RZcnYSKqXnhl6SAjgKq47gpctEeWbw9f1TCIH54NQkHDaNjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyHLh0E4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAqt9F031701
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C+kAhzs70HWO1mZC+/wygNfV
	TouKKuehRfxHw2wkEf8=; b=oyHLh0E4NtKKPiUoiC86tFhbXkkMe8QpCOCaR3vU
	GITYLlXl68cwTN1heBxqCYCIuUhCyEsWsfpjAqRuox9zS4b3+yyd5mO2QCvYqeWg
	xajvGcm5OkKi/s8QzMPZj4JJ+Z3D8c4sJBE7oakYp6d7eMVYzkJcgJF6mK7QhlEm
	EZZngxvIC47S4mA61pu+jq9CRXPuVeYOATBHINVYIGHrPbO2daMEa3bywyHADZGJ
	E0DtOuD7WPzvec9Vck/+qAzCNTXv/08OgJYVON2QlC0e8rNmUe02WHld206VyB4v
	eQvYeEDjcx6jW+szLW2j3Dtr65XgJ+yUNSnvmbRLk6pqKQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g1u3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:58:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d448a7f3so4603776d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 03:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565908; x=1748170708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+kAhzs70HWO1mZC+/wygNfVTouKKuehRfxHw2wkEf8=;
        b=n8gldtmQX0xQUd3SMbNgVs1NidDt3g1PPtE8SiqyI85CwIthx46CUVhb40GlxmpBP3
         q8loTbwcLtxbH0yyWgR8qDzcxnB93MY7tHi4qxgiyhR98GLnY25yj8avJRi/VR2uLXYN
         UnWw9yyf+JDPcIC/sniQPl66HRTwR7gtBp/vVSO/5LFIlYIVevFWS88XYuf4bWWSiIyA
         hs1rJQs6VMgTJ9KCEjTqyZj120Sr8VfY8KGAStcIZxBwTfw0hzMyM7feAcd42vfFksnu
         wC6GbcvYNU45Ataff9L7WhjQ06pdkrsoqEvhv+rf2iHtBw4AQPUpVPdQzEU9fJM/+UdS
         eNRg==
X-Forwarded-Encrypted: i=1; AJvYcCVeIQb4nefuDNNxLXjTRg4xycDztRgfypIGGuyTURB7XbNh4ZR9vYp/l6m0lzODErdqtWIgC+aF08rZcaWR@vger.kernel.org
X-Gm-Message-State: AOJu0YxubCSev0owhuQEkA0OqHYxtrl1WypaCe12Mp32tNP8CSaVuAH6
	wOQ7cD63y5mNdnnRoxP3GNW9bZFadN0RJGcGoo6BmtyNP9UJATCTixusFsC+PohO6TFl8LeeJ/X
	haDP83P4c4xD4JnxLa3yKz4WHK9lK3p8Ukg3aTLQTfgDhAjibCEqcoRXEu7xsZIin1YSc
X-Gm-Gg: ASbGncsPHITotOi5RVDqocHMPDsMEsxfZk7HnlK3iFMG371ijkpoQdPUB3bFRyyKtqH
	zNUmeO4QHE95IJQvbHOcWBNpVwWse/9FBqhVliJYYV4+Kw5KvZZEOlwr8PXPufsoyYmIp1NNVIC
	fvGlnHNU0wj4C6aQx/vfqNSZCMkIP0F0c2YBjoyxHcmSNs7YAzh8aVN/pfwqEyPxlu1Bv3wXGT2
	a2Ulov6xw+I0cGlViOshN1SyRA8X3e3Vgs5nj3V8VS13XuRpefRWSx9cc2saZmySF3fcKUOjAoj
	t9iS4D6Ak0AitxHLJLv7yTZn7Sgg/G26fQPwT85yeREHfQlTnFSpFNL0j6u4Rick7hDtjvc0meQ
	=
X-Received: by 2002:a05:6214:20ab:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f8b080f716mr146093666d6.5.1747565908554;
        Sun, 18 May 2025 03:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWwPNf6b4oHQwVwY5J6NAuClm/OnyCb/hY8gSkEcTMvpD8A4ZCc9Gw1UENXkTw1ZvfEZtpEw==
X-Received: by 2002:a05:6214:20ab:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f8b080f716mr146093486d6.5.1747565908199;
        Sun, 18 May 2025 03:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cae55sm13842111fa.45.2025.05.18.03.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:58:27 -0700 (PDT)
Date: Sun, 18 May 2025 13:58:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sc8280xp: Add SLPI
Message-ID: <tv27xnenkg7uc7webgr6yqhua7xntqvjv5fnatmngfm2sjlhqx@rdoxt3ng5wdn>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <20250517-topic-8280_slpi-v2-3-1f96f86ac3ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-8280_slpi-v2-3-1f96f86ac3ae@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wQGxtRk_0KeOTVpQ2BRutLXmsYe8AKPP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX5TLS2zo+2VVD
 4/YLbmfMfE+rmfWLRyUUFvOPrYfcgCnhdywNa85YwYJ/3nATlwadhrisv7Fu692Q1kT3RKs8jp3
 vuYfGZ2HVsv7d0iFzr2Ov1uh9dCMS4AEg/iYk8I7v20eCWbnQgQdjN27l1grErcgUdoDIaBqoso
 iXDB1qCcbPBTfFk8JCBW2GF1iNWLMYVDZTIOJ8qgSULbgNvDFWcqWrrjai5V3n0BY580phFAFHL
 BZz/DGWtzbaFatBl3ptBU/mzEN0YrPlVhx8hvEJvpLlSj+Ir35LZ+IRfAydFE9KlwCbyeTYBNlA
 9RTfnmC52ZotcMlkHafPn8a7xQeTxdjTC5a0Ey4ZdJ6Jgfs5un+wb48nMRq8PGYbJXD06VbUADv
 TqxndrzT4N/wiNwYw1Ms9Q2sN6aohzLH4juxDW1kELupcBYmR7Rtszmh1mZeb7tehFCBmv6+
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=6829bd55 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GJIz9k70rp-aHLqeSlwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: wQGxtRk_0KeOTVpQ2BRutLXmsYe8AKPP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=786 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104

On Sat, May 17, 2025 at 07:27:52PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 99 ++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

