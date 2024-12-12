Return-Path: <linux-arm-msm+bounces-41864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 618639F0080
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 00:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F0B128771E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 23:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C541D88C3;
	Thu, 12 Dec 2024 23:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m35H8QrU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819F1547F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734047380; cv=none; b=hGy+vlRO+3VIE/x9nyamhcX+NkvGUO5i7HzIi2UfiAy5uVbVWqWdbkDvYeYE5veGTDBJoympvHpMYkW9Rg/CB8E8s3Z38QsDc6yt+X1dzaU173S4aOWVs84/YkEk5vSgiWfX3UweFfgX5omX2EU8R1WXij93fyV2lCDk4mjWbXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734047380; c=relaxed/simple;
	bh=URBmYjMmyDex9nMoXMnWsSAzcfTL+mwozsx0zYAHLvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZhzkIMCqdOFRQk3QPaR7BKbUxu45qXtaFyXWujTkVe98swk9rT76CnqSekBlHNNKbhyrn5flssk5Qq63KrUk/+YOn11914dc0+z3AYgquzskgmx0JP63NSjqS71L/bXyHQ0fX81sQ0CpicvmrzdBaUGXBeZy53v7Q818scoyBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m35H8QrU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCDEijw000539
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0QLS2uYSHAYK/Fhp2TxaPsUSttT816uFB65LOIdQ0E=; b=m35H8QrU57mQjKTw
	tEwlyuGsAGqFlHMJdYkyKA8MGwn6Uc8p209Ato8j2vMSRX93VGTId1z9C9n8rDye
	BWRmMxe16C6OET9lB49XxcEsf8keg0acK0A+uwfS+GvGqxz3NaVNqvqBPI8hOTr2
	kvW1KfnoClzxaaFIgXipPRkA+GtaMjvmur40G9tC9A0z0qUU28KrVTLPI1noMCAY
	cZZznbvVjhvH182PgMi8/2nz82d9tOVGqpj/62BRmnSUlj+682aCum9EZ/dmWhbr
	jV7H/dD1+rw+onnfbdVtLuMSKBf1uuMy/WWL2Vl4eiHy7VcwF570AXCMsY0Jqomh
	lwRGBA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes312t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 23:49:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8a3cb9dbfso2683606d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:49:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734047377; x=1734652177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L0QLS2uYSHAYK/Fhp2TxaPsUSttT816uFB65LOIdQ0E=;
        b=MybjMLZGR9FYJALaa3PJTN9R3IiZtah3InSN21HQs/2Sp93rMQzYREBvJ5EVbZ/Jhd
         ym8Fr+sodZGb79uTauzx4LHTsUzXH6r7Bfkcr5EjqIaGiVs1vtboAX9+6F3K/HNNmLKP
         JF+cKfA8VVTazzWX7VRyDL7VQ3V43moeJY2yzcp23ZfhTIt1z7xV+4Hp7MwoBPaI9qyy
         oE7RRzx/GgsP3SlizcuTZRGFsSUPUwbiGMHuDt8qfrPualewBZ+4Ti3aPwAq/GuGOu7s
         YxjdARaezgUqetqh3XBhpYmUaOXnLSWGV3BfLbnGiQInsseRn/sa7YEYzACGeR+TMF4s
         1QOA==
X-Forwarded-Encrypted: i=1; AJvYcCVSKWJChZQP6UnD30yKZLs6ZeQBjU3JFP3hKu83LqpPmlR2gWYB6wQ4Gp1UA9J/Xlu1bWltr+ZNfQU+tflM@vger.kernel.org
X-Gm-Message-State: AOJu0YxjAYwmmgBnjhrSj5jUwb6m6h8b9TISepgikrIrvF3VQeFA3QcY
	2P/EpaHx5jIrxkCHQVoRuZ2WU1O26KnX77vyXWMrDjnz50e0Ax/3slBWghWsqzvNVyQsYazdc2e
	+Arvw9pgLsXdcKF+qhQ9X5vT8DdYVif09OdonIvNN1N82q7YEun7rGDVodrGCOXyA
X-Gm-Gg: ASbGnct+quk+w11y6HQZJEoxR10cEc1wdTsyxUiQcP/9NKc7y5M6C76h9WTHrOZc09t
	Y0SJzss0JAA5UoAQQu74a70fZaUq91BE81nOx17iAJeZ8mdBFq8DdkiC1Cv+D7k2t7aSBHhoRZ5
	sAeVpDhtutiDK4wCV4Bi43DIhFXqXLZK19KMKq4n/hK6OSP0k+BxL0f8GPkukPVQkkyiSQVu67M
	tM3PSNpAFvWTwRJqbIKkvHOA6hGUO84fxXTW7iTbe3HedHVTqoCr4hlMxYdI15lPd5ITBTqk0Qn
	cPUfxQiGSsNQclN2Gpwjp51xZ52ALMlhuwam
X-Received: by 2002:a05:622a:102:b0:467:61c1:df39 with SMTP id d75a77b69052e-467a57f68f6mr3227591cf.11.1734047376643;
        Thu, 12 Dec 2024 15:49:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5AzZKeD73oYNDuNinX77d5Sgi2yqleUPr1NZ/mRZDEOxdKMTgqhc/82eGWxfy6eHLUiy+/Q==
X-Received: by 2002:a05:622a:102:b0:467:61c1:df39 with SMTP id d75a77b69052e-467a57f68f6mr3227401cf.11.1734047376274;
        Thu, 12 Dec 2024 15:49:36 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6801060e4sm688426066b.158.2024.12.12.15.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 15:49:35 -0800 (PST)
Message-ID: <da7590e7-bb18-4983-9d73-fc10d42c740a@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 00:49:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: x1e80100-microsoft-romulus: Fix USB
 QMP PHY supplies
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>,
        Xilin Wu <wuxilin123@gmail.com>, Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
 <20241210-x1e80100-usb-qmp-supply-fix-v1-7-0adda5d30bbd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210-x1e80100-usb-qmp-supply-fix-v1-7-0adda5d30bbd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hKMpWj5AjcwUFmsW1uGiOemI7LMscR2s
X-Proofpoint-ORIG-GUID: hKMpWj5AjcwUFmsW1uGiOemI7LMscR2s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=840 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120172

On 10.12.2024 10:07 AM, Stephan Gerhold wrote:
> On the X1E80100 CRD, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
> (i.e. USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2
> are actually powered by &vreg_l2j_1p2.
> 
> Since x1e80100-microsoft-romulus mostly just mirrors the power supplies
> from the x1e80100-crd device tree, assume that the fix also applies here.
> 
> Cc: stable@vger.kernel.org
> Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

I'm just going to assume these are true.. Can't really cut power to
these to test as they drive many more things

Konrad

