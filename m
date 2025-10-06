Return-Path: <linux-arm-msm+bounces-76024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED21BBD7A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 11:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 97007348EBF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 09:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F161F5834;
	Mon,  6 Oct 2025 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLeQpAO5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68676168BD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759743816; cv=none; b=JijvtJrI0t5qwVbIGfJCmf4IqArRPEVCV5dQG5BXb2kCbHuHOc/dTX8GkpA52YcC28Cc7eOpdQKdpUemI+qiokmGMJQeMJYWnbmYGAQ4/5CEBET4nSwh+vKqa+jO/efgATbVHtsOzuHriOUX/QIOsAtP3yaFSVLHhPOiSyvbHqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759743816; c=relaxed/simple;
	bh=3VAOb8Nrbi79Vo18vNteD/+ZcNN4/z5L/Addy7FvvvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4Rih3wkB2aE0S8s/8JEyQIhZ0OgY+7IqWV8CoMGLufKuoDL8pGsmnvpqgbtXoGH2NKcUc8TqVJUnvdWp/WMhsJwOw7NdzA/ZnzKXjywKBKIM2c7L29UclGY0PNHd/lt8l6TwxKfdenE6mCij+QSrBJWB/R075RRnDI2RkPsEJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLeQpAO5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NJbNA018627
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 09:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQIe8mny8lpWTJQXbYK8gsz6F004+u+gJgZcpGlIaik=; b=ZLeQpAO5b+eJvPfu
	nRZcQ7gtc8UaS62u93vdXEq/zYhKi5uqAlek/nu9ZviSzqjhXjRlZsXzeBS4Xy7y
	vdJesuzGXEpPekQg4PcStE/kVbOtOAwYQO9DdnC90Pz2IJltQ3t7o4qWQc/kg97c
	DZsQn6f0IYXoU5Pdg1tZv+x4xbAlICP18cbGN0TVhqqTjuO533qo1A5yZa44Rt+N
	8PWZIfEddATyRP6oX+oN46G1lpoaBgfGJqC5g+07T8sZPojR/QVfwQnqjBT6/lQJ
	Zupuvu0KaS8hBx121Al0AOgerijBOZ0SsJ3oGP5rJ/Hru6R4Bh01M3G/EPTkrbHF
	1rM9CQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ju5xbg4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 09:43:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e6d173e2a2so2497461cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 02:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759743811; x=1760348611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQIe8mny8lpWTJQXbYK8gsz6F004+u+gJgZcpGlIaik=;
        b=ZSYfiiRVBrKWp15KIFRjYXj6uIXmJ8ZTOvauQ/tfTarabOG9SZBBw29WFexS2WKE6e
         Z6JBLI8zMLEwty0sTzVk889MUw/CU4ZNNtlQ7JJU4K08JR1RaB/Or4MwW+Uo38kb38LY
         SUtRSCvwCG2AoIwgvBRe0e6scd5IJM975xYR0pB9J9T3jAMMuQMEEkUZJhkAgYf9g7VF
         QVCH5Njgj0PVwtrqNpZnazIYWSzHc0T4yheTzObqowT5vTRLqTaPI+nCXVf1L1ccTcx9
         5euv3XQRgdDKrTka6efPlnJo3Wr8/z1E7SWQLmyHgOxaTjVqdww2A5NeIMYdcYfYhOaz
         Ybpg==
X-Forwarded-Encrypted: i=1; AJvYcCUjWvkX+ZuuieRF1c3HVGyy8x41XwUw0GvRMz6F1d9EG0jsYNYd0k0VMQn+kNyjsL9ubyvXJCMAlvzYavDF@vger.kernel.org
X-Gm-Message-State: AOJu0YznxEitWcqvyYiou/Yr9z6jpGLgAdG7w8lXwZLHNw2x2ZLNgE+E
	0EqfoMtArtAT8lMd5qAyZGXzNGuCH2+IYtWxOu8olEGYps8HtVY/O96TRiWb4kaVpiwVtyox6B1
	4n/Rk8trghQF+XsVr5z2YxJi4nc0/yKGCUL2PkPrlh7U8RGpjinXw6ly9x9I37g7Z+Pwh
X-Gm-Gg: ASbGnctsMZryvGpUJSsrvu3H77ijBWxAhrPivrIaGUVsqjdXmzJgeBdRGn1PNZF0NJg
	o5vyCu8//iWJld0SEyzKp/65Ud2WQeaJl66ZC7Se2N03YH84RBuPaxXORlAI4sLVl+HcWbkyxdL
	mSJDJMUzcYdDCE6bNzajiHztcyNkWhdaUERZbE7IYVpVPnAWSuiOtC4+HcRp3BL3Wt2w24IkS0h
	UXJE3VCWFPkaftt/Ro2XX8auGHx2ByaJ+ODaC4EcWjQTaG4GlemLw9gDk48gcjkUcX6gPNL8vRi
	q4GUixWsWiaQBMdtFfpvks6m8fOisJOc1xiZrCbwpnsXmQWm/QOVg6N49rzn6x1iVe5D+Amx+ty
	zyGX29SI0vJdAcjq8UhezeyVDUdI=
X-Received: by 2002:a05:622a:258a:b0:4e5:7716:53f2 with SMTP id d75a77b69052e-4e5771655famr95826141cf.8.1759743811153;
        Mon, 06 Oct 2025 02:43:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUXXbxMxFQqe0X0SjTWriB86v6b78P31OuJJMWbMygO3fbIGEmAAsmk5wn/CxtoooibO/WIA==
X-Received: by 2002:a05:622a:258a:b0:4e5:7716:53f2 with SMTP id d75a77b69052e-4e5771655famr95825931cf.8.1759743810661;
        Mon, 06 Oct 2025 02:43:30 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639773d4d8esm4041553a12.30.2025.10.06.02.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:43:30 -0700 (PDT)
Message-ID: <c8dca827-b089-48e0-9dc2-a5b6e3c5b88d@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 11:43:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
 <20250930-topic-x1e80100-hdmi-v4-1-86a14e8a34ac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-topic-x1e80100-hdmi-v4-1-86a14e8a34ac@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FooIPmrq c=1 sm=1 tr=0 ts=68e38f44 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=eg4Xx4S7Erm8exKiWv8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Hd8wFPy9ruq40Y9WvlR63xheeDpAF9uV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMiBTYWx0ZWRfX7mS2o6E9Gr3+
 klfup3nt5Ev/IY+HNxuFJpYshjp6TPiqsHiWD+/gDf2VAqlaL+rlQDBHsO0K96K/OYsCD/qQDQj
 rRrYjP214CQ4MHizwzvULtwSBsv0XN6EX4i0qallhp80Np5Q2h9HAPCfxuUvwxwgMLYAW6Wqib0
 IIQOOs7gIVjDW1NF0iwsxPd36REuP39/mpP7QS2vVT9BQc+QtM0u/hecUV+eaMpl94a/jfm7LwZ
 U7oWk1Nmh8AxwfUKPEX0FlMKFA5vSbc/EDBCHz66lRClMrkC3SKDRkm21kRlHYQRhH7qnpCfTIJ
 Ykbdf76pl6MhzSS088CdIqQ7/Xb6TXEC1CVwUS9M5MLgxcFEpH+rTk5n62+fiYOXqlixRhqeoAj
 IANNhwtqqeLIa2Uvd0LRiVxsgu3EfA==
X-Proofpoint-GUID: Hd8wFPy9ruq40Y9WvlR63xheeDpAF9uV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040022

On 9/30/25 9:39 AM, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> The layout of the lanes was designed to be mapped and swapped
> related to the USB-C Power Delivery negociation, so it supports
> a finite set of mappings inherited by the USB-C Altmode layouts.
> 
> Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
> connector, DP->HDMI bridge, USB3 A Connector, etc... without
> an USB-C connector and no PD events.
> 
> Document the data-lanes on numbered port@0 out endpoints,
> allowing us to document the lanes mapping to DisplayPort
> and/or USB3 connectors/peripherals.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +          endpoint@1:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            description: USB Output lanes of the PHY when used with static mapping.
> +			 The entry index is the USB3 lane in the order TX then RX, and the
> +			 number is the PHY signal in the order RX0, TX0, TX1, RX1.> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:

Can this be described in a somewhat reasonable way to be non-compatible
with Type-C properties for more validation?

If not, let's just maybe add a comment like

# Static lane mappings are mutually exclusive with typec-mux/orientation-mux

Konrad

