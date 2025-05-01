Return-Path: <linux-arm-msm+bounces-56361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 466AAAA5C1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 10:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFFD29C1806
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 08:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA4626A1BB;
	Thu,  1 May 2025 08:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY2qu8m1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2243F265CCF
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 May 2025 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087865; cv=none; b=j//tOdJ95JXp7BTj1MHhGpoQs3bJ71lkpL+YAk/BwFjC+REe8NSozwvXdUtQjYwaDyXnKBW98WZjLB0xYbXOmwDCkYSEl3ARB0ZvYlZ3Jo/dZ3L9JzWCHJJr0waOyuQCLCaC1u0eQQrYZIBEP6EkUUrCp3vMVQuB2Qu2H6ddMCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087865; c=relaxed/simple;
	bh=4SV0SWjjN6to74Ybm0U5EvYj7KZjdi/ydl2GGsa9zMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sz6z35XBkAWctWIIS3fyTtorhw+HmSSu8W9dXTbwqUpJMY1CHz71WgGqDbJNO4IyOygpFw28LMZyJZ1wThTTKFBCV/ZsqvOUU2PdHnwYDtA6brs+seGN5dn+HyvPxxoUCLmvA3Wq/Ur1EPM/X6q33VNwr7o7HTZQKVYcHY4mmJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jY2qu8m1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UH0OKS012204
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 May 2025 08:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ53eFcOacyOAm+jXnQpdZtxz9kOeIhYOC7j2kMJ+SY=; b=jY2qu8m1X6hSNi17
	CxNR0kONJEiMG3GE+/f20utQJaBfcdQ6dPTu4EIV5dGJb9dmyj0xR7TKJQ+cGoGH
	CUCiJxrzBOZvsqAPxq1namQ4s5YkG2oNh6PVJJmyTxO9YSD7tkbHrVGt+ijSXUn7
	NzXJfcTeHpmFG8IThOecK/i9YdXROO/8ke7hcNeQbBriutYHGldwnxgtQUHkXOrg
	lL2FVdt4waPQoBUsB0LRlg/rOd1KUPQm3Qzl3vCW2EhwRHwcY9C5wRO03bzBas++
	+teqycKSivS5McBZM/Lehbf0d6LM+QJAkYjti6YcPgs0c+pLyKmElQKlIN2bKmBt
	XEN5bA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3vq4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 08:24:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476695e930bso1854321cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 01:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746087860; x=1746692660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ53eFcOacyOAm+jXnQpdZtxz9kOeIhYOC7j2kMJ+SY=;
        b=qtI8pp+As3U3Y1USjeDr5QdH8bTKZxNxqUi6sB5O8mIXN7WAenQbHJrT1R0Dwn0tb8
         vempmRNEwQxOLQR3hb/fdI7w3nLB2rT3r0A+rozzVIP+anEUip90BeqRpZGuyyx5jqPE
         ONRrJt7ig0T+WvqioDnxLnupB5rnAkr0YYyz61rJxpVLLIylXA4lNHif0YKr0OeERLPG
         KHVTf6qxKBvcboDRTLOIZEqwspuFjMwieuoXJT9lWpDTDgBQ+bH2D5KGdpXe/OfLSLef
         kdbI8o8FLr2KO8VG+wCqBTBoxeHkpGTK/WBCVsfh5svIgUlLyLTsVxACmsmwu4beOeKM
         gUMw==
X-Forwarded-Encrypted: i=1; AJvYcCWYMO5a72nWxGwDhj26KjDaqrzZwBOHexGXOxaue6jF55BBSp49YUYI2DSBzBNhKtZnHj29Cnk5iIB8UGmc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0MbjdxEDnSK/29Ofg64Q4vDKaDXy/25olIouFDSqDyLGeB3N3
	pAk+9uI5mVv4ufNelN40B5In2T9bFJ/4AISOfPI7J6eP9ZWKCfwJSFOEGRBxc7u6P35HdVofPic
	iDAzDoNBhNDdLXE4wY8PGB/7XuVvvVzLcLqkIbdfLIQOYfMGjyFcs3DBd/YAy9JHK
X-Gm-Gg: ASbGncsPyp+FZlLNhhEF27b1xingk8TD2omaIoe1zYtSFvkGrViX7Hd1DRApx+j9wRy
	XCf9kp1HJuzjs2iH3dn1YEaFDZSCVrj4MYTgEdNv3Nphsgw7rcwqGHImprIxlIrWePCTcOrNhli
	XKsvHNz+Z8KOqpqfa1J0RkHrKPdF53/AV/uGpEav00pdvXUZaFDFBcQWG9fvZ44NI7ZXgPJ/U9K
	5rJqVdQ4lPMaZ5yqHf5Uo+Wl+maNzBnk5h+r7e869W8xxfvR1hndY28e249BNhsYdUQdsfQ3H/2
	Z1MwyCkNdS+oj90Vayzwmjgh8AL7vXOt3yg6wmaif61jE080oVfo+hEKfeDRzvdFSWQ=
X-Received: by 2002:a05:622a:13:b0:472:4c8:64c6 with SMTP id d75a77b69052e-489e4e6d39fmr33056531cf.9.1746087860196;
        Thu, 01 May 2025 01:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ46MXi0EjwqtJAjYukm21R5nakopvue7J6cRNX84FO6gEnUuzCCno+YAn+6cIgvTftra0vA==
X-Received: by 2002:a05:622a:13:b0:472:4c8:64c6 with SMTP id d75a77b69052e-489e4e6d39fmr33056451cf.9.1746087859869;
        Thu, 01 May 2025 01:24:19 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55afa1sm7690566b.131.2025.05.01.01.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 01:24:19 -0700 (PDT)
Message-ID: <f65228d7-fe5d-46ea-9331-2491cab778e6@oss.qualcomm.com>
Date: Thu, 1 May 2025 10:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <20250501-fp4-usb-audio-offload-v2-5-30f4596281cd@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-5-30f4596281cd@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=68132fb4 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=HmAel4GXUpO_Sf_o3M4A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: CJICU3Rtmfy1553YhpPWmQIWuoWenISh
X-Proofpoint-ORIG-GUID: CJICU3Rtmfy1553YhpPWmQIWuoWenISh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA2MyBTYWx0ZWRfX8iTnS2nvseGq KalLTn5XahtLb04FmTyK3UD5PpnyHVU3Lq01NQJMxiVl+dzn/puMKt8NY5Wiy6vzO0jl/yHKPd6 GX/5zcvBatzygGpW6ykT4HqeHy/OOs6SLNQJ7FK2oeocwLhfTPDstQt5FSV7LgyxJCB5z54RPv0
 eX481ovBx88CPe14WKjEcO6BNvyqnVNx4n6GorJdo8V/s2zK69j8ZBUgWmwBRhIGNnekMK8NV1j 3N5H8W+8y6pebQlXrp86oqJUeKamjWqInnc0Rg2C2gD9WxhjAP7cmhINUvSMKtMN+MJNI+oYDgG GvQNsxTonfo7RHBmv0rw/MfeindoFc8A1ghiYM6MMKk8zv9QngEPTDOOn+WqB52NkthFjU9rPTX
 K6eCC8wGE9TJCIGUZtb2sfnhNULzJO9PN1V8MoaZ7BomxD621hnDPazRqwddBr/uVpyptOc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010063

On 5/1/25 8:48 AM, Luca Weiss wrote:
> Enable USB audio offloading which allows to play audio via a USB-C
> headset with lower power consumption and enabling some other features.
> 
> This can be used like the following:
> 
>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>   $ aplay --device=plughw:0,0 test.wav
> 
> Compared to regular playback to the USB sound card no xhci-hcd
> interrupts appear during playback, instead the ADSP will be handling the
> USB transfers.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

