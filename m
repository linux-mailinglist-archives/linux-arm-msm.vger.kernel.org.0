Return-Path: <linux-arm-msm+bounces-50221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1CEA4E81E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04D861896413
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0324D2780E2;
	Tue,  4 Mar 2025 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jubrd4tS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B96E27781F
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106928; cv=none; b=o6H4XxR0BFB8Ugd64kTQcpjrIurUrpD3EXsND9++X3vvpV8FdFzfVjq0AoC3kEjDomygA3CS8YIDAq+790HIO51LxWMc/GMlvZeAKQlbIPOpX2GoNcS97Z1cmGBEwtSf/C/u/QatIaWJYae+J8iTSCa9bIe2i5Em2R8G+c9S8xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106928; c=relaxed/simple;
	bh=sd3DB5QAo14h5zLM+vWzziyxgeu9gXug/Wqkl/V836M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqwjWATzf9g+xIVrT2Yk66ihB1rzohw/mQ4AQbGc8QhI5ybu/gWE01fqiE1k2953/KO+bVLDIMFKaKUwcctcf+3cAxubKp9y7O1GrmF2PM5z4RPp/ZooGWqm+pTNVUe9E3mMQlY8v2pTgvJKMjvn7wy325or9yYu1ne3WKiK7pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jubrd4tS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524A6h0m001781
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Mar 2025 16:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gg8kGpZ3MAusVn1q3n6ecqBdb3hu6mGJUnWrCE8von4=; b=jubrd4tSj4b+OvuB
	4ALyGT4PlRgXWsHH3zIyTkDb0nwIQ0FuYEK4sqXErixAInEsqm45ln4HbWYyVX7E
	rRaEEwQ2GIAFPnpVMWpgnx6rrRgIHXENQnH5C3/9Fc1nTcj3d/Gq5aFMj/5pdcG5
	wWc4ZU20DaePo/yBPC3lg/aIPSvEkJ+hZ6G/MKjb8MO+rZWm+e1yZv0p6PlXPkvL
	vMzDNBHsGi/dcKiejlRwZoGRWoBQbC18AUst82ZJN7DGL2qGLS5WjqnBGWZzOtZy
	/E2ifAqV+XpycXaCYaYURXmwP1HFVXvKz9IckqXtvg4fh2xp4PEAn+OoXi2OSBtf
	o9KOxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vjjfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 16:48:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3c51d8c1cso33971085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 08:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106925; x=1741711725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gg8kGpZ3MAusVn1q3n6ecqBdb3hu6mGJUnWrCE8von4=;
        b=GnkblhuFgTzpJNEnBLjYlSzWVZFtVgT5Hcra/rznXgK7qnjINYlTzXCBmrKNP4dZEd
         hluQ1uF3niGkKCqYXNyVtZIXx8taSqF2yNcO18ztCjXi6uk2vcxy3XHEx9xuAvTOnyph
         ldMk/IEm2lFA/bJ1Vmk7O3S7w1t004B68/z+okKBTYD+qhGWzI/MShiymcatUgO/UQFk
         1e2oxNZLtYrc5ml+i8VbkjXjKXdoLMm3BcigRNzGGH8sF9zpen6SNbuIhtwQcRiwr0d+
         P0Ljgq0idCjbB886GhAawZkTgLURfQYfCp62eRhxG3bcKVoUMG0LQUfcGEA8mq4OB5GX
         +4nw==
X-Gm-Message-State: AOJu0Yy0qP14+lK7poO/vyQX76vwVCPzV1DhORnrzuoEv3DctTCj5hvF
	SiACUwb/U3+qvNAX/LboBpu//agVXHUxas9M/7dD85z44r4/CkT3MtISShSZSbyE7c+AB3TbfaP
	FeojGAqeH0/ZOVdprQk2x+mAPwgZAEjz4aCiBBvsvGAR5CN1vG9EpJsDru4M6tZrn
X-Gm-Gg: ASbGnctrBGBIre9VR0EjQe4d4EiiQO8l1lNRuUFMbCXsV2/zCjEAmoWQYWFZ2JbAgmo
	rpLHiEGyhl7AX6S6a0O9FcRruEP/lFR+xwFp5US8OCHKk7AIFdgMhsRgDJpddGCuxlyubYGVu6f
	zMUQJH80VouPkUAqhYaZDRyOBSxL+yn5B04fNyzWjT20Jzn5pnnYy8JqJeNyVzZyvFsAG6BfG5r
	o6SjFL2mx7M7/yPBH/eJSvP9Y3ml9+wUE5f6r+4u1Ql/pyqBtKNZE6IDkle5opE53774JN/fP4w
	Pfk3XmG+n/3/q95uVKrgB35p3XCqU5L1j64iluPJIt5mKJGjh4mHLubAXoMAoCg1g7OeiA==
X-Received: by 2002:a05:620a:1a18:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c3cd61c237mr169167185a.7.1741106925395;
        Tue, 04 Mar 2025 08:48:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQvuQvClwiwFMie4FZTFPdTyWvzcou0+abmlXxIUtcYhhNTelNl/VTqgUaWtUDHiiQfW/r8g==
X-Received: by 2002:a05:620a:1a18:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c3cd61c237mr169165385a.7.1741106925089;
        Tue, 04 Mar 2025 08:48:45 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1e152fdd4sm256004166b.176.2025.03.04.08.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:48:44 -0800 (PST)
Message-ID: <9cb0c042-759c-48bd-9776-0b2dbae928ea@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 17:48:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qcm2290: add apr and its services
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
 <20250302-rb1_hdmi_sound_first-v1-3-81a87ae1503c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250302-rb1_hdmi_sound_first-v1-3-81a87ae1503c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -vUst6cRPSR6bsC7VnNMdvOjJs_wm6m6
X-Authority-Analysis: v=2.4 cv=LYfG6ifi c=1 sm=1 tr=0 ts=67c72eee cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=4ckOxxuvsnspfostOZcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -vUst6cRPSR6bsC7VnNMdvOjJs_wm6m6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=514 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040135

On 2.03.2025 3:49 AM, Alexey Klimov wrote:
> Add apr (asynchronous packet router) node and its associated services
> required to enable audio on QRB2210 RB1 board.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

