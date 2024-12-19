Return-Path: <linux-arm-msm+bounces-42825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E29F839C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 19:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDC35188CB90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 18:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440611A76DE;
	Thu, 19 Dec 2024 18:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STJER8WZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A3E1A3BDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634683; cv=none; b=VQbNQozfcA5pRr8Km98/HSvs5jL+AbnElyv0bl1pJzQCgyVgPSvmtGUSFi2EaE2ke4M0cueNCmhCDK6OsR3r3QldLKcPb6DSmltgKGVxT0QXCMBo4uT0tNzcEHMoQaqOFA5BmZgqJp0sgxgJFHtyZybU5u4Vkp0A6TYEccXyeLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634683; c=relaxed/simple;
	bh=zpE/IwkIKQy9Kprf1R8oiWxam3sKYFsPPtlhOYQmHXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWW2IYbU7droiMq18L8rtNkmUt4c5oYbXUXaAshY8USdN+ZYDsCDGCZLQ07Ngccn/TletUVugJ4Sn4d8OhtacTzeSdyjvXfP7CVUIOmg85JF/wf2qtrSy/OsLI/bO0gi4q6GPbM9S0EL8MSSuvctatdXrTxY3RvntdvvnUg8fAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STJER8WZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ8kZ8C000508
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BoBfjKJGGBGP1QIp7p9Tygch719/YYaqks4CRbMKW+M=; b=STJER8WZlvshyQnL
	1eM4PRuI+IAujdc4ubqMz+Mg81F0VWJaCm5Zr/PyTZQ8kp3HPbSXEzta0JeDJ06Z
	IGrgN4EKGb6rAFGOSw9m9HZ+pVgzDzAGXsOB1BtFbVUTpUBO/1F20tbaDdSPhdiC
	heJCw2sFcjjSM7cxImLVeMMUlcLqN91tUDUJTVnST1Q6B6jgH2+z8mbALi40fc7l
	utL5uA36r6PwZxNTxNgHXrhqreKz9D4pVtDIzcuNeyZya9CJhEeUUMkoPHfLppLG
	J7nWRfvVTJ3ashJmzUWis+wL+S5rwKQTk+oJbr6yjVwk3CmPNBJnb/YPEKLoD8Wc
	xfeLrA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mg98ske5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4679fb949e8so2687461cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 10:58:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734634679; x=1735239479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BoBfjKJGGBGP1QIp7p9Tygch719/YYaqks4CRbMKW+M=;
        b=tZZaDSaHHNisxBrdPEOFyR6emS4uKZLX6zfBGo9jvRESfzcqbOTrFHbVPDWCj3f6MZ
         vwDyp4rSIyEqFoXhlgNLILwCgkrCULMGaK0r2A8Knn/a42MaXmlsaupItnyNyk0yhcB8
         Apsc/LBJbG55ZFZTWKyxi1Xb9HnAO/9Xbm+UuDrCEtTE8THa7EoxBpqp6a7UEFh4Lg/N
         gRhKCB61fBVhSTfx9JUQg3u7jcAgz4XNP8sUnCQ/qG2TgzVlZvEWFfEVSJPzzpONQzBU
         26WXRugb8va6c4AwkVkHCFKkKUzfqL1EK/6EUhSXAojiVa0v0QvDADMvDvcHXioqm2Sf
         M+vw==
X-Forwarded-Encrypted: i=1; AJvYcCX51D184e5e+lZj4zMwSKz1aowfMKZsZTfvHdjLEdEQzz0tlIpf5lqooFp0D7Luc9wjaDhrpXaATlfXl2fY@vger.kernel.org
X-Gm-Message-State: AOJu0YywSV86lNWgbqobRhnuBVfgZ9gmM040468LwWtW3Tus29SIMcgc
	sdULrLg/gV+WmyQlCKZIIBAs5Dv4Pzsxqm1HFnLgdkxzUYUeBZWa3Eiv2NTCSyF9BJ3XRw4fkFx
	ukw27vGF5ohiVYepVKZxlZhqOQBJ2yXF8keTBQKWwk6BU/TOmXIb/ta64lJysCyRQ
X-Gm-Gg: ASbGncudp0h4h9xU23USuJNz36T1bIRm842Zs1M8zmurd91S+IzgN5NEbgHczhhFVfP
	RwT1IqIR8tK0LLD8PlCGHgbtsYyBMTAFqrVXSLHMl9mUx3qRN9hZ1d7ZsCcSpdWFBuX5uS0RBqm
	ehliIATxdCR4CS0XQDDHCzzdqSrI6sEFRZixsh0FHHF1vWec6HyYFtT2PuV8xzxE9l+HHPCX1rE
	oKlO6gitI/25hhq+ZByxXCr5yzpVsl8hvEIGj1xTvuerbwa6J26fC2nu4kbWu6esaJl5HuvdPI6
	GjrXnyiq5vm5UBdJWMtU9GRXryc+Ack24w0=
X-Received: by 2002:ac8:5810:0:b0:467:613d:c9bb with SMTP id d75a77b69052e-46a4a8eb7e3mr585931cf.8.1734634679424;
        Thu, 19 Dec 2024 10:57:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzzzhRK/H5Q4ZYWYihAa5ttJ5U9egSrme2IPWXLvYMtQK/O0ViHiGIF3Unj/8RkkxSajfAFQ==
X-Received: by 2002:ac8:5810:0:b0:467:613d:c9bb with SMTP id d75a77b69052e-46a4a8eb7e3mr585581cf.8.1734634678955;
        Thu, 19 Dec 2024 10:57:58 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06f847sm91464366b.202.2024.12.19.10.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 10:57:58 -0800 (PST)
Message-ID: <bb04811b-dcdf-4c95-9999-b1dff7abadd7@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 19:57:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] pinctrl: qcom: correct the ngpios entry for QCS615
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
 <20241219-correct_gpio_ranges-v2-3-19af8588dbd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241219-correct_gpio_ranges-v2-3-19af8588dbd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u1o-HC2GusgPobhAlhvvHf91I2zEAu-u
X-Proofpoint-GUID: u1o-HC2GusgPobhAlhvvHf91I2zEAu-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=853
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190150

On 19.12.2024 8:59 AM, Lijuan Gao wrote:
> Correct the ngpios entry to account for the UFS_RESET pin being exported
> as a GPIO in addition to the real GPIOs, allowing the UFS driver to toggle
> it.
> 
> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

