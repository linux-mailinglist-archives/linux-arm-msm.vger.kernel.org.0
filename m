Return-Path: <linux-arm-msm+bounces-82101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 898ADC644DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A004234D96A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94600332919;
	Mon, 17 Nov 2025 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naEH6W/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VuiMWbTZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF872D323F
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384107; cv=none; b=EnorPKJiIyWXop06m3waWIHOFzug5eNuucT5CXcA1N5J1E++abzBkFF7ezoLi7O5GxP5Np15+clb9q8MaLJEpSRY6UuLSFojS+k0UGWdEw3VffS1x65Smunp4QclPia7Ltxv3teO0EWDsicNWiczY7Jotfwj4lN1NTHFrCZ0UOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384107; c=relaxed/simple;
	bh=/ViQXVPETgm9i+UC8rUHlH316+ODP/Jsj7gqftltoPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXSDEH5P2KMU2xEa/eHvSdsSVlqDHKCNU9pxcy47XHoky0RpAKYdYe+OcL2sg6vHCnWuX6m4IFyEuH9DnuUpB3lytfdCmb0ioBR/zyHfbpQ8iKsJ81icQuOor7ROe3yTBiLmhAJkWeQoekqJxzuWVBxfc7Vsb3WVkP1+HL3iHnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naEH6W/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VuiMWbTZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB9PA63042681
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdcENZOZ9B7OMEu7ofl+EL83OBr5cRjNFZS05TG0eoY=; b=naEH6W/Z5wJRo3h5
	6yOD1vojhaBFleiBn+R2Kt5cuvlovXuBCXdAd/SXbnGXsKkJE+sdvvsua41q/JzZ
	EMUiXJ/FV7iIyvkTcCNj5ihQPnRJb5Stp1r0pj58pdVP3ZzQ1NTL6VvImt33K3s7
	ICGENOD5rmevp9mRUinAwwaoUC3BUaTrPtZIWC7g8L7rPEn/r0T8pZbv/iXC8hxk
	dhcfNr3/ucrTJS6REFUkszrJpGa1NEZeUtvK8iIji8kafbdg7eNZ7sxhP/zBlfqR
	/a6GWKEvMnSK1euLyGTOAjTDTDFxOD9nHSZF+hLa78ccLhT/Jm5ZsS8hOADv4uCW
	qyRHPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh04rt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:55:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee05927183so1552701cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763384104; x=1763988904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bdcENZOZ9B7OMEu7ofl+EL83OBr5cRjNFZS05TG0eoY=;
        b=VuiMWbTZfB2Ib6Rd3vTP12Y9rUsF/rHfBHvn8mjVk3TT+XXGHO/OJght9prJKlMhOx
         nIB8XX0Qj2gE8VvbXInvQECoCbrBwf4Sw6kAWV2FSgKcdFBrCylkOda7H8W6i7FE8sew
         SmFx2hXnoIZUhSVcOSbQG1Thjw+Hc6/yAGhXrhmYxosu3Xz3Nokx5JLKz46BvuWVS5QD
         x/Agl9Pv82AkXhvUsF22aipiFXBuPiBfOHeFcGRMuGKg4tomTc1g+5BAebwA5U95eFZe
         MrzRUlwn0EJsf6EKtTCRAFz6SHNPhs7zEbE4DyslAuxXwy9LdebfZG4wfhXalgrPXjy8
         Cm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384104; x=1763988904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdcENZOZ9B7OMEu7ofl+EL83OBr5cRjNFZS05TG0eoY=;
        b=gvZv+5tqBNi/2VoiFlI0S1vP7e16ipogcDcgWoEUC+dUJroH/KVKrRhoUMRG4J8idC
         WCHiND94gYRtCCzN8KRR66fLFx3k5IjrG5qMBqlR1DFMhbWOmPeNQwj5G0PYrDnSxjOL
         JEgbX+PbSl9Wy6Sx8kVvSvv5FB1CqWNOmqz+TnpBggg4bgJsSeT/vdTS5lGy5IdyiTUd
         9tXFbIfl4PSS76tUcR5W5CFvV0d8Crf8znxDSrhz7qKhBmeQ/BBeudCKvSn2kC0Wsze2
         tbjhaJYKt4lDlUfB60s1hwPYcVwe7JfigDuKVdsgxgKaSRwk73/AIqhzN1F2s5LnVWuC
         qyDg==
X-Gm-Message-State: AOJu0YzUI7+LBAWhVPXtsGasaLSp2jnLttxAbtrtU4ET+p+48nhUFrje
	KmNfRutdH+40NVqdwiKDnzWDsQScBaz4urN69DPjUwtB6UVRGl2JJZmA9PEfeokP+fyUopuZopA
	ttDIMMKZeh676SG+ldC0l8YkQB2pQJFUfXRcgiBN2W0cB65JRnnoYcCwcSaxJrPf2L0xQ
X-Gm-Gg: ASbGncvaAbp1W8pQj8GjYWEPo1pHznFqDM5mLkgat6lXKvYgrZZGph27F5t27+Bu+ZD
	Kdh/9gO7z20E2Rx5fAq1P8wPIbcs1K6vP5Gviu4EbtE0Geo5/NCYNdUJss21SGXesO2kXMWGHKf
	TG7S346oqVHsff3ouyxvALWH7cE4pFJzFkl8W/hGy/IXOF9mQ2ML88xk1BxWEjDB3l9+nnotB77
	8XnYibS9wb1C3WGhBOKg5km4726jTYFLGINlAQ2AcxhofIzkONM3jqlAzbNP6RlW26VKViQDwPP
	NnAaYPwDues/V8dzfFF7jvSho9p2Imzr9RUKSTMEFW9I8BvfynmpLdzYc5SFVuh1vo9orTu3AKa
	f0Q2ICKyixPmFi7WpQwrKLn7FGeWvzccUaVFtNBwohm9fVgU5HgMkjXZ8
X-Received: by 2002:ac8:5d49:0:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4edf36e32acmr108054521cf.10.1763384103727;
        Mon, 17 Nov 2025 04:55:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyFG2DBhLfyxJtaVBKBZsfbbQ4NicKzSiY21/zQKPNc2lzz4cBWrQJ90YZ/edIQgdmGnAR4Q==
X-Received: by 2002:ac8:5d49:0:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4edf36e32acmr108054351cf.10.1763384103351;
        Mon, 17 Nov 2025 04:55:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734e9e0f20sm1090820966b.0.2025.11.17.04.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:55:02 -0800 (PST)
Message-ID: <188c5c73-4a91-4f3c-a45d-fb35b171ae63@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:55:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8917: add reset for display
 subsystem
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
 <20251116-mdss-resets-msm8917-msm8937-v1-3-08051386779b@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-mdss-resets-msm8917-msm8937-v1-3-08051386779b@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691b1b28 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=G8-SSAS-OYPV6Zknk1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=YF3nxe-81eYA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: ijSyFqt2yntSrugH7Q8__BYr0WJvBpe7
X-Proofpoint-ORIG-GUID: ijSyFqt2yntSrugH7Q8__BYr0WJvBpe7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwOSBTYWx0ZWRfX1fLZATUzsI7c
 q1a6ZC6NIN7JN8C6/xmaSaeAd93Ptc7uppShn71SPJrsZkWu5+AgaI3ArSorC8ciczO3zy9Xm9K
 Pc2oMSprUwmeEfFBimkLjJgUqtit0jiOdX/AMpQLf54wX8xwzt4zvOQILlKtFKa9JH2YyZU9j1g
 dPYIRWMv1zJJWMcnub0Mc0M/4idKkqVXoCoKXuchfDG+f9t4sNdkfZ7YilixNeMWPQ6mzMab9Nl
 WxlwJGhXbFAj7SZYlDgBw3nrNOeVN/pltx1dhS28y6TXyNdRu3LOWxXQ7hcUKgngrSKbMmiobSu
 ukzxgObE/ibqo5SMkSXSTf0JaKK2Lg3JCNIph+SOmYpqcAlySnKoMjhAm5Ssvam/M2PK8bFi8Us
 OqPRbPpjpju9ZjaJ/2rGrpxTx1YAYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170109

On 11/16/25 11:10 PM, Barnabás Czémán wrote:
> Add reset for display subsystem, make sure it gets
> properly reset.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

