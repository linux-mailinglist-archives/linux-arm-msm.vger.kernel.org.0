Return-Path: <linux-arm-msm+bounces-85892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19875CD00EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CC1E303ADDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B13C2D3A6A;
	Fri, 19 Dec 2025 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRjh5YLK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOrPr52M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF4C2DFF1D
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766150663; cv=none; b=HcDgVxwTn1wHk+lyn+PSrPTe+N4TwppXJjhfFje90rNa13xsO6W86BqKTfM/07Iq418qayCkMefNsrFvx0oKvEWGqANxJ7wkWM/nAykoK+MUtZrmhdOY9goIfIujH+bA9BfVs9d0BUBLSs8aypmLJ7R+ZUvFrGbjAs+sg5pOdLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766150663; c=relaxed/simple;
	bh=O1DBKijpRZkah3PEswHdJSFmYvoIixTUjc+QtdW5NCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jTuZDC1X5Sy0qTj8VyJdl0IvVQK1KJQVS+83S+wfK9rUi1UKwR4UNS3x9XTYRA3uDVOWHdKnp48tX50/f7FVuPNihVlcdHeJ1Ln3oDmv7z3xe4KACouo27zd2oNbvLKP/wNLm6gkE42C4DO4v6F/6Ey5y7bufH3Yn7Chz00CHF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRjh5YLK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOrPr52M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBhs654154970
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PN0S9nUzmphwgXWKwQ35sb6kpRTq1MvBLzlcbxFESVw=; b=BRjh5YLKMdZQPrxM
	26ZE5uEgDcEq4OjT/Pwo7zXFvhjgkSqjA4eqs3eJRU/E/4nBgrrL+LVcifvKDyR0
	mKPNfisybKIdkUJ8K9QtJgLQNh9T+iRXjqIo0D7rolKnxfqXCiFTMr3XwtLzwyBj
	T5OS1IxUb/WilgQYGl1LuKqxHcec8x+7KKayuP2SLAv1oaG2QLArRC9ddjOx7nJ2
	0ac011bncACHEjLpcLrO4oZPN4SO89gZxgp9W/iDo+W2XmqNl3bGRcUcODUrDLcN
	AOAUzIriYa0HOpP2zmM1iwUyuiutg3l0eYr2sXDFCz5ScNlT37OtOabRlLE0+YAd
	qKl1PQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ctsky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 13:24:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee05927208so5572151cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766150658; x=1766755458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PN0S9nUzmphwgXWKwQ35sb6kpRTq1MvBLzlcbxFESVw=;
        b=QOrPr52MVAymZ8lY3cCMgROCf20gQXbqsERqXGZ4hFLMojebZI0EGJFeTc/tJPd3OA
         rU7BthO+CyioLASqgAqGXS/EL1IXPX9xZuF6lUtP/Crg83wkeMTQhJl7YhURcmRFf7+0
         IN2hDIa2/XUZcYYh0/sYp1+nUKoElgCYaOOM59MKSRhtHOqWQeQ8ZLiQKmVNa7GjdwJy
         IKuOWTNnHiboSB2wkJTQBzs6jf+Qo1W0vuP2XY1wuOAHdmHz+8osfGpEZW0JHhbBIDxp
         oV+OOK/35KBeoUIUu0C+Bqf5wtSrP+isiVLWse+5PGGEchpFZAjMzTVBFEBivFiZO4qd
         nVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766150658; x=1766755458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN0S9nUzmphwgXWKwQ35sb6kpRTq1MvBLzlcbxFESVw=;
        b=CefLSKcRqq7aIqKTlH/LRMrkdFXG1Wl8+9voWK3F8+HSEquWqGjT4ruJ1IaIwr9kGB
         SEMXg5IIh4T35eE6nnh0DyVbZrz6M/7mZNPQ0L/hMl2M6MJ7Z2wCaFhqzAZEtySypm2C
         IB0Dsyn/km5/kIZb9ZcBqMYPNqlcz8jMm5uVEe0Q95mEW59kXafZL712/O7HVgVpqIq6
         aTXAFDgW8Zp84fT96MAS+uKsxpud32g2KRZKToEGGpPCF5+RB74iBtAmqGcfSSeTa/tv
         GubXhEV6OCmry+j+sjhkcTtpVgp81qA9AMHOdCHRPjvznx/3/YnJu19PRH8jYoBA83mB
         YVYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7cSZbNmWRaf56hPxK6KpfHhIlSjiz9HwS2Kc/hEcJ2OHWS+vW+n3dF0ysnjsaiktSz5Y9veo5pzP26bDk@vger.kernel.org
X-Gm-Message-State: AOJu0YywWFRsGnD0t3gGbglfJdCIN7UQbOJrhSpvrZe/96QqaO2XLiHS
	7tx4q4pRp7hBs54PzTG7QmohkYR88tYkJCun28xTBSKPW6hdCAKoPge04PCOwiY2zF6BJ4fvw/m
	cbvKyK6H8iXORH38c32pnD9Yzi5uMDFps7/epY37WtbwsGAiXq+SS312RTsGu0+6ZldMc
X-Gm-Gg: AY/fxX68Eh/P10sshr/gv7w9V6YKEBKYd/NTPfFBRam7v1u7TYReG5y65DxIHB31eyX
	4wBJUsMQzkK9N3b0Y2P8j63mQzkPsGZCgPhcQiCbsbBLs6HpN+cF0D871Rm91OZk2boX0GD9zUG
	ShV9OEWjBMDIq0cJUTKbezJte+U3jPkek6lVJGE3p4njsZy/esqs3sVKSDL3vW74Dsb3telgvbg
	+sZVjECO2IarkkST47xxGMHKGg+ihqwowcRWGS8P/PGAPDNapgJsVlPpeGhhk00GzxFcCSsaEk0
	VlR5ZuzNpVkLUyYQP1xfbpETx5pjBw4zH0787hHxjoSTuIOoTTPo0tg6bBpYRHcLnDqUMmI0PPo
	Lp7vgxfAaSnkUOHwOPCV/tbCsGRM3le90asi318ZdrhqYzzJrWHBHgFWvxv3nEs+WyQ==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr8304321cf.6.1766150657999;
        Fri, 19 Dec 2025 05:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAQTZER8k3jrnoeKYAUlmetrYif4/iAWP+Fg9AbI7ouvR5IbKvEBKFu7XRTnkrJk4vkJn3sQ==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr8303891cf.6.1766150657483;
        Fri, 19 Dec 2025 05:24:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm232466866b.48.2025.12.19.05.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:24:16 -0800 (PST)
Message-ID: <7038f5f7-e5c2-43c3-864c-e7ddd2e8c374@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:24:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: he17x4Pvral9ng3XYknA0UAfA60lXviR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExMSBTYWx0ZWRfX13yjYAdNKjqq
 HnAVJmnGtl1Wgmc5CGRkR0b3UGeWFllzoy/FwkUdSBBzZY70tF+UV3i02r2STgTCI9fi9Z6UDfH
 osyLQ1oJo/fAFQzZgKW6NC7fISpzjhI45ORPo1LWzypBgsc+aqUA54PRL3DX2i2GUWk1JXEfznG
 unjKQXnwD9HRMRJIEL+SUu/Pag4UOAksLeofeXvoFjN5mulaI6nLatkMSAdr+gCGqT+OImLyiiG
 N1+fqOaeKddxPkN6SN4sga3pGWIzHqdptTN00C+neS99SHu+pfVaCjH4W/B4bQU+5v1XjhNDPuo
 EiD91yVjo2UMIwEoVkmsvou68HIXfosK47W/xln8+TdrVH2S5KWUfrmt5WzT/FFoc2YDfNmqxMC
 s0Rjk8RGfi9hAHXZwBSrAm3aW86vVsF68VLQ3hR6cuey3M8PqzY8eWomRX9hshsHT3OS7jlsq6d
 N3CBD4SljZWBiidHZ8Q==
X-Proofpoint-ORIG-GUID: he17x4Pvral9ng3XYknA0UAfA60lXviR
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69455203 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6UiOb558mQ4H2NczljUA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190111

On 11/25/25 6:45 PM, Taniya Das wrote:
> Support the clock controller driver for Kaanapali to enable display SW to
> be able to control the clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

