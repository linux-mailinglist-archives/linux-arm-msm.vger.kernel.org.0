Return-Path: <linux-arm-msm+bounces-73099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F98B52FAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65AA31CC04D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED652DF12C;
	Thu, 11 Sep 2025 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnd4J4Js"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA313101C8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588948; cv=none; b=WUOhJ/hP3XMOlFm4Las1AaHqEJZ7h0gudxdXWO/t/ShDTgE5n8Xii/ThPEphEqrWMb731iggpJUP084X58SaxH6Bji2wTD88zPszwISV0JAITWyYHkN/6S6mE6nBUE1fn4v2Ywk0gk01XLPfxmcnMsPyrXyDCldYF09fqPIPVa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588948; c=relaxed/simple;
	bh=6PtazfSv0JtU4MGfn7twfC4d1Ubz4rEjp+ULwoKKs5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCC/WZ+D7v0uXgkb4I9Gb8kPa6K90uh3LMMUjouDvItU4AlrIBeMwHHG74BUNKQ2vyhUGt57EK2FE+u1as9U28ckgTsn7AYqAb/eiKiJ9OU/ssoBa+gQeFFFGmhtpP+pZMLxJtLnSR2fs+41gSfEgDsp1iMG7KnlsgdC25eCUGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnd4J4Js; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B4kB3c019089
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qX5/kpkNqr6r8YgzRUeItHTqrwa2HlZuGNojlEyQ31o=; b=mnd4J4Js+TZtJlln
	zI5TVRWqkd4apAcebF+Ld1KMoZwWra0zVW0noP6pUJXXug7KMclyLVeFVp8r6otO
	Ab3EPTJgZWKzmv2xZZM/TYGMaVGfaeU+BnIaoBNcFgHI8vCpZOEthpXWEG+R6BxJ
	4sF4wDNPBOlJRy6DCufB/HVHhXAS3SwWqFqGPExbLaGEGnndH7rD4Ha+GvjmseYq
	llAO3KD19G7RwhuX/F+1QAmzcnQvIP3Vl8FNR39F6InihY0T/0Fk6jIcXrT6WqBF
	nnNNDzQvWI1gocpKPlLAyL5OYQw/RtLsxE3WF+RC90SZSaV3gq2AGJdo0/Dj4E2c
	K5jhVg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphs3ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244582bc5e4so7630925ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588944; x=1758193744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qX5/kpkNqr6r8YgzRUeItHTqrwa2HlZuGNojlEyQ31o=;
        b=N8GlE7xnJBazDBoAYhZ0bCeWRWlFwRG091/KxmcXHXVtUINzAPY/f+o52tXzZf+BzN
         J5k/8StFlsT6Rz2+KkvfuVK6JcZZ/+XhHLeim7kiZRO8u73fMQVNK8nkAz+x1rp0qxWS
         epN650vrIxZU6TPi6S1RaTcBAnTRgHsgo+VQFRhQI7uDyL3E95jtTFNjQnT/SisFYW9z
         fEjg9R491Fb63DcrriFaIatMfRSK0LwwDZn2gjW8Wh5zZGz12LZitfLn+Z89nviBnPqB
         KTeAUF9NQB0hBR7uqu3LbwL6o/HwIbtg2rPlmI54O4oF5NMV2agLAVIWBrU0YUKkPYim
         AeeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX27IafH8SKmE/jTDx55S0aBwE5nfn6OZ090MDJ81BPQf4cOea6Yw4N8CTGJ7oghGHqniteJdGAxr243ibG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh28GqJFIw+X4iaH33zXeW4eEUq3QzAEeJfmo/bc6rekx7veMh
	K3kWH+kMn3eM1ghrdvAQ5HwjrwD81xliS8eJTcyIqS7OnjE4jrQG4Wd2m5Ko9YRUzOeMuWADkZ8
	gWk4AXr3jZCW8S7dCjzpemkCos7jSdYaE5MSEXTct0gfDuz/wD6NJCo2sjavSIRY8edyt
X-Gm-Gg: ASbGnctOYco5vpsb/fyl45awmJp5j42Cm9k2pkyYQ7ETU/l0pKUxxaiiaJWqTFnO9Lm
	xdE/WvEusYD4NKKCusGP39g3j6cMopzja+q0V06fIEvxMSqEbHi2nXsKvQhGsid7EnTitAOkjQp
	EvZXnMiaN0HMyfRqJn+Gb5dfet8Ke01bbs2pdUdgwH9UhQUX/xTCFTrIqp8jXeiu+ZWKQgE2/hq
	2mgTs6tMdhaYmu9NUJly/G302V6ekF/D28eAzFu5qy15FCcybZtwwmeSc99IOjuhvrw6BDE4YBc
	fLZb1KTPFjviwSy6+EoHDPheGXT81yTXBSen/mJUvitUeS1oOKQ32pTSDNPI0RXRJMpeE0M=
X-Received: by 2002:a17:902:f550:b0:24c:be1f:c204 with SMTP id d9443c01a7336-2516f04e1a7mr213003215ad.22.1757588943600;
        Thu, 11 Sep 2025 04:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/yEiu08IqnfwVqXB0YZWENFFoz1mw6AI/afPUVw0Sc9Smj3Kv0QypfNOVTO3vH4qgyrKoqA==
X-Received: by 2002:a17:902:f550:b0:24c:be1f:c204 with SMTP id d9443c01a7336-2516f04e1a7mr213002925ad.22.1757588943112;
        Thu, 11 Sep 2025 04:09:03 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6ae8sm16362305ad.15.2025.09.11.04.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:02 -0700 (PDT)
Message-ID: <10c0d04b-2c8c-4cf4-bb99-acf74f420341@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:38:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c2add1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XTzX57vkho_joXVOt461vJ_UPypkAsh-
X-Proofpoint-ORIG-GUID: XTzX57vkho_joXVOt461vJ_UPypkAsh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX88KUVEk/jkK3
 ZrdwcITuyyPgUPUXI1OmCKy6U9Zy63DjgZISCxswmvvAby8NTP5eIxaIsdmih63Eu4Xg/Vbbcil
 a0XBBOzjXUDfpQq1bboAIFtjkjSqRKfq4xZrDX0zTcRLpMPYWZ2Pkd2eY+Vjm22kcihUPgeFc2U
 bcC34zVgtd1SnFzBIzdZzPnHsJ1gdHYe2fQ3bjyNmIliWNudAHKZL0g7KsaZrKz7rfC30q8Y0kA
 4Tf3IX3yhCb6eos2lBxqFhemGpj9MX770958kCcycuTWWpCzpjNgMDxQqm6/4csbduqCBB5xqdj
 Z4tUHRj+AjwbxaOm2KcqTKUue63fYUQjOyZgb7Rl//Jm2AsV6vt0NFs5bjMh/yabQ/kqSlcTg58
 wu518Qs+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM8550 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.
> 
> Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

