Return-Path: <linux-arm-msm+bounces-83073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11575C80C6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 14:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F8DE3AB6A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 13:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81943224AEB;
	Mon, 24 Nov 2025 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joJjGqsF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYBx/42F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B9119F41C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991099; cv=none; b=LJON6Syf4HdzDcGn4aE7tI6A8U2uSH0kfxxArhcQfHhG1fg8eDxedz7nC12vHmfsVPRSMw6My58fB3oN8s8s+Tt5sR6nGlh30H39TQgWEbU7ZPzaSeTXg2x5J+L9JzfuxGlXo1fuXk92LZ+tLncrAMYhEAY1pJxc2RE2UknNXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991099; c=relaxed/simple;
	bh=EnAuoEJFyD1JRhQnaIvfmqHGAt2c9T6xflej1AjNLt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5JwtPJ+d9DEW921sd3O0m4xawewrwMvVvLjBvt+KAJN0OvB32nvsbXrA2wc6iENbocig9NGUX8Glwimz986Swd9G/Z2hFuNEWUfIb1VJ1U7aqLE4+I9BBOA6XlAcMjRMgS7YXdn+EFkBckn/BL7pfSq9C2CqlFUxwpnZVAI96U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joJjGqsF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYBx/42F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO7TCmv3112050
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 13:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwqYipmpL/YQVltcrXi93I++DdSe9sQYH/kQ48lusaQ=; b=joJjGqsFPYeVWiF+
	87W417dL718epTf66q5v38JyBqUef6qdx54JCkc3Fnaod9cv+UyHPg551rWz+hPX
	l8kRV55KQf7W/aOjBNLcP/AD2PQx1SBxCRcael4Ez94bUPCY+46RNZsOQMg6yPsF
	uD2wjwExSCUU7mxA1bu9HapVQdN40Vxp5gyLwsbuQXczrwtH+q0fV13MmDf3qQFz
	/ArLVBw7AAi6TUx8uehU2R4cj5jkFRvcgxXzGJOK9cOJaLFnB1Xh21XX9QzwTzwC
	ZRxBGDDlKCQM6cipLGhCNUkxTZvWK2LFLZArExYq9SfLeMAGQ3i6p/6GHFBkoIrU
	q0MOkQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amk10h142-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 13:31:36 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-55976a7c782so487606e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 05:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763991095; x=1764595895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwqYipmpL/YQVltcrXi93I++DdSe9sQYH/kQ48lusaQ=;
        b=fYBx/42Fo524n9rLkzMNhZDwwZp9EwcUN+QZgEFFV9Gl+NgN4y8PyMgAQu+f8L6DUY
         8/T7M5kWrz/0dmO+P1pl9zEU8x12EgZ0h6Ju8Lh6PnpxdlWwr4ZrZxN+weFapZfOa46I
         gTxlXQsG1TXcTMb9sT7YQg8MNfJmj/WvzEiMKxet8J5YGjZAjvtkFJl0JPeY8ihd4xmF
         axGUF/KaUxGE48Go+N+22eLXfudITznkaQau96/kxeZjhuHibnl9ycZjedO7ZY3L3uaZ
         NW0mixBl+0PqRgPV0uP/l+y4X9MJDF6S7Y641fOAOxYo7Zs7Xc5uPFQq+ie5QYhShGDI
         q83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763991095; x=1764595895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwqYipmpL/YQVltcrXi93I++DdSe9sQYH/kQ48lusaQ=;
        b=oxaJAtsoJ9K7KwL6QLVkGgAhXOP70zXBUJreboTYhEXzZj6uPcUo3kG0MEpe/fkvu8
         0Urj6WOvWeRwvAh70475RduMczNXI3URphxISg7m1btboy6HkRFBKUCsj77UmX7VO40e
         zK3j8U8C+SF0WGJoQqN84dsnAJvHWUTGCkMSsxJNe5eeLpUa8UW+XSai1PtL5Jlg3AZr
         hFDdhXdPYkgNxZapGXDlxEitfNpfrQ4N+zvrcoiaevoHHB99NfMRSlH5oaKzCTN4BFcc
         iA0ytdVVgOgR+ySY7rsPAfZ0cRr/u90KmZKkIpgf70SXNbhPav9mfjai8tF2g7/JYu1+
         vpzA==
X-Gm-Message-State: AOJu0YzQmtSyOUUucm6YkUzlPABDilb5VkAIl+AErFLySHadsQHZ9QvX
	x/wGM1hNAO4q7qw06KveTj7ZxeEmuu/5Jp4qKFdXFcGBcmv3dPOJ0pTcM9/gPaVvuErMF5Mp0zv
	PK4ld3g6/J7tjE8Fiy6E9Uzll/RB/6as6vc8AxoB4BjYzc7JGOADxwDmSjTNYxByMSClM
X-Gm-Gg: ASbGncuPCSPdD6iYFeY0U7WrVrxYbDeYQyUCc5dEVb4BNMjrSPmQnaM5NAJrU8MxgkD
	SHfuLaiM4nlN/anxEAuWIURCcFWtfqlDr+Mn+ZI7ignsdoJLySlCJzpYbMJUPH9ztBeX9G/mmQa
	82QmeRq7QtQJBWkeUkRRbrnnrnLC/5jqSijwIPL+ui8NS3DWVgRCpu6A+gNDBTqQuYpNTSpZqEj
	5IupcgPM64O2tCBPBJ546oOo5yiArfkcTFzY11aaISYE/nxhWIJwELqDT0qS86pfY4ipeTe+xkj
	QPLjiK7+/byouN0qrEE84p+SnjZylBuA7p/dFbVSYb+2d/Z4OpzuqALRWhb3efPjHpC9ThnyHAQ
	Rpx+z9kaykYQb2MQvp+GWch0WcAZE0w8sfrLKpvkMCDbiTIG+1v8MVj6wpRFgD0XM174=
X-Received: by 2002:a05:6102:f07:b0:5d5:dcc1:3bb1 with SMTP id ada2fe7eead31-5e1e6ab5701mr1657627137.7.1763991095315;
        Mon, 24 Nov 2025 05:31:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR8WQYIIBYx0OJ8QrzSt0LVy9fMGvVvqn4AlMJ3sEgBjmm7njyHSM3dhUyzVZcq3PAN5QePA==
X-Received: by 2002:a05:6102:f07:b0:5d5:dcc1:3bb1 with SMTP id ada2fe7eead31-5e1e6ab5701mr1657570137.7.1763991094783;
        Mon, 24 Nov 2025 05:31:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ff3c6asm1279950266b.52.2025.11.24.05.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:31:33 -0800 (PST)
Message-ID: <1c50fd96-74af-4096-b53e-4feb3ab59f06@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 14:31:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] phy: qcom: sgmii-eth: add second regulator support
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
 <20251124-sgmiieth_serdes_regulator-v1-6-73ae8f9cbe2a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-6-73ae8f9cbe2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XhayFCWFXJYo6lzBxCnvdlNBRN5hYkFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDExOCBTYWx0ZWRfX6DP3Gi56mKn7
 TYAOSUzvt9W8V9nLRaCw7Lw+ovdgZnQwfx+6Uh8oJyhxk0xXCbtv/V3s/aMAakPodJwa82xphpG
 CT6VovIa3U4lhbCUDXmqi0f4Vfe9C034ugiE+xd4aRv9P+OpOO7Yfmawq8vjAA2NDhf+bTfFvtu
 ttTLcwkJTB5ZjAzQ7z2EhIAFjq2kwBs2HbeEZLwRcmsDY145TpQNDpPY+RsNKVICLZPYfv49a/a
 uiAfXlFIRxJ1HAo4Awy/1r8jZNpQiDd739uZWsSK6Cr+o1NhMlZFbe229nivMjp4Ohh1TDEYBvt
 m1cdJmzxXk0P6KYz0MP4JVlMGvShWfqH9G4xKUvUv1vlPekMplCzrtvgxHMnu+In2y9WhbYsW0C
 yoGQeLldsvXMHND/omiexWacPA3rEw==
X-Proofpoint-ORIG-GUID: XhayFCWFXJYo6lzBxCnvdlNBRN5hYkFC
X-Authority-Analysis: v=2.4 cv=SP9PlevH c=1 sm=1 tr=0 ts=69245e38 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=figFMop1lUmvoXQ8gv0A:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240118

On 11/24/25 10:25 AM, Mohd Ayaan Anwar wrote:
> The Qualcomm SGMII SerDes PHY requires two regulators to function
> properly. If both of these are not enabled, the following error is
> observed:
> [   77.105651] qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STATUS timed-out
> [   77.113447] qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes powerup failed
> 
> Therefore, add support for handling the additional regulator in the
> driver.
> 
> Fixes: 601d06277007 ("phy: qcom: add the SGMII SerDes PHY driver")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

[...]

> -	return clk_prepare_enable(data->refclk);
> +	ret = regulator_enable(data->vdda_0p9);
> +	if (ret)
> +		goto out_ret;

'goto return' can just become 'return'

[...]

> +	data->vdda_0p9 = devm_regulator_get(dev, "vdda-0p9");
> +	if (IS_ERR(data->vdda_0p9))
> +		return PTR_ERR(data->vdda_0p9);

Do we have any conclusions on the load discussion?

Konrad

