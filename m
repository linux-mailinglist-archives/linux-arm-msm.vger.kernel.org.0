Return-Path: <linux-arm-msm+bounces-75101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7ABB9F528
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9156F4C842E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90ED71DD0EF;
	Thu, 25 Sep 2025 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Shfztjga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15D51DE3DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804381; cv=none; b=lH1L/QkP0ATA1YgHQ1sprvnkEnPvkK3NE7eqZGb8iX1yHCLuJIkGDOyU3BH2oVrId8Am5Qo8oH4abE6Z4DMmPXZ6GZMYA4kGbIxJ35k93MLEQuG+9qib1nOyDkhIWO4fFvPXLImig9fetCy/Zd1XgGHHGNFzGLM98StVDQC7AzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804381; c=relaxed/simple;
	bh=b7+0FUqc0MYeklzSPwrXmiQ+m53hAJ9Fa27fFR/T4ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9m45nwK/HoeLM3a2+OdMjzjjKPKYDOLRgFHva3fQEpnK7s1yKBuaRUCE2zAGE824URAZysjB6/E/UMwSkig7Z3p5Qo9/GpGObVUVIRNVyDSOKHTa0DqJQYti18F8MuvsJ8Mx/vTbHHGJRc6YE7oZGdCyfI1uCyOgdyeBtpmTeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Shfztjga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9lH67025119
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBfKcPb+IOlBSzmdNVDaaI4Kshn4SPqfBYjmmQnheSM=; b=ShfztjgaO75BgNn7
	pLyJaT5YjczOEprODBf+Zz6e0usexCvoR0H9cKQyrREGlXfUGh0dn4TO7ywgxrWz
	AjunhbAt8yAiwjGQHhbH3MFe2SdOMgGiIx22evpvPtXw33leinyF6xfEhXLR0hnU
	ZocwlauamUiMIqfeHWJy/p80t754unpPNXPxppmT9xXr6GX9kpGIN00Aou5qQtDk
	o41cb8cnsNBYT5SKyv7jQRDjiA2I/LmDNykiEqXdqkriDfQ9uUHu5XwZW200+DtK
	C28cIbm62A2fwLs4r6l/+nY1NcAees5pDcntdahKmwZsSFwQHzi/1JS/h2cr4L6G
	3fW6zA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv1846a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:46:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d40407c6acso899091cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758804378; x=1759409178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBfKcPb+IOlBSzmdNVDaaI4Kshn4SPqfBYjmmQnheSM=;
        b=lzP9QbNC2kL2NuBnje3wS+fdscjkByjViv1SehteAEmawfhuVaf1yI5PHtdsLx6UpG
         J//HgxsfpuG0OAA9wCxZkVLxQ/WEzlv/fpniV6rDGH4v6koHzcfnyhrcJMNmwqh4Sqtf
         h6OVs+xEaZBnbcBMVxjGjXcx1d6S+WXMgX3dKBs/tMovKW5oUpdGqK7RXvT3K4nTsHIl
         xZIwg9RuwC5qz9mjnonVWEntjohKsu9vZbOKYI3bhrTs88TpvbX+1hw/F7pVB8LcXwPN
         cJAeKh+81FFlQFj8mYtWl/JUp8k6gtchh116X5AscWRviGIwwjPaR18pVNdrO/UoxEdZ
         eQmQ==
X-Gm-Message-State: AOJu0Yx+GDngd9RXzIxywpgSUs5J2qUZTmRVs7uC01kmfP85Ekpj4RWU
	T5xfCNm1UPvzcbmZ07sa1o5miDp64M1ozvMjotySYW5SFfZdkDiFG/kAZVjgJ8me6OKhvfKme3s
	9CP5RvTgG/bKPuCpPejbqUx1xZwCYvyXx0ZVv8scx+ZeDwq/JYtUOQOMMVZ3Nm8sE94vE
X-Gm-Gg: ASbGncvl0OBywBWNMCfsT5g9Wck9RPiTabPFgZ39XIGzAzy90UgzDcybSqqixo31qkY
	/CpFvAApUhQCOrOYm9ZnpRcfuQeClYwHh4alpe0STchCVpQvaqRzEx5TRma6m8k/JjD3e4v6lMv
	rzcVeDC0vvFeAeD9dIppYEPizxJVxrxcXGhQza9o+A9EmIzF+3Ly9+aKkmQXo2JV06KmcstJfuq
	WDXUcvxWbioQsFp78xHXLK6klUcb4SINoOACssozBRzCVAHQOKYCOcbPS41zU/jsxaoZq7to6Fi
	bndvcUcnUDNyIeLF5h+CGSThPRcD/mU9l0IvGmW1uAYpsbEmCOl0EJ/oIXOLFziwm8T/9tRpsSL
	v2Tin36D455tOOtsMT7w4lg==
X-Received: by 2002:a05:622a:1905:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4da4b048343mr30697671cf.9.1758804378065;
        Thu, 25 Sep 2025 05:46:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd5JvjjG2pBr13XQCrzkjzaC3gf49ULTcdScWZxwe/IXNnSmnRT5xxpfNzh8Shpav4MIBYKQ==
X-Received: by 2002:a05:622a:1905:b0:4d9:5ce:3744 with SMTP id d75a77b69052e-4da4b048343mr30697331cf.9.1758804377616;
        Thu, 25 Sep 2025 05:46:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d1210sm163567166b.9.2025.09.25.05.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:46:17 -0700 (PDT)
Message-ID: <623d9895-4087-4419-ba6d-b03c55b0ba50@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:46:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] clk: qcom: clk-alpha-pll: Add support for controlling
 Pongo EKO_T PLL
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-8-29b02b818782@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-8-29b02b818782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MWKuXM8ZpQy8Nyn077XP9KJ9EsJaG_uH
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d5399b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=J5jK6kj7L5UlLF6NqaMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX+vG1mgxWxKh+
 /UzUDt3l+iJ6ufgltzA+aJQeLknn4XcO4ofGZb4w+KieR53HhxsWp7wEckADbtS9snKX7dgg1aL
 XXY15jW8U645i2C50QqbVlFbpjecFs7gZe8m1Bi/apf9Rsph6N/vJTZk5BtudU2HWRjnGW+8Akm
 EaFO406CFw78s8m+RVpd6dXITmB2r88G5aZXS/kerJgb5/YLgL6Kl+XqkeEYzCDunwjI/xpXD1I
 peGlCvhQvsC/vbEQVXtxwYN9LBfnllF6f3B7Z7bK0i8QgwIwz3BiGJNJLA4kyPSkxKhzbHP7UNI
 iNGUn6uImjf18gBdv6WFnNHq/XB9W5IhwMXylGHMnIuIrPDwRgA+dSEHeXEaNeyIr7JPPGEOc9f
 1bkbT12d
X-Proofpoint-ORIG-GUID: MWKuXM8ZpQy8Nyn077XP9KJ9EsJaG_uH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On 9/25/25 12:59 AM, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting
> the PLL.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

