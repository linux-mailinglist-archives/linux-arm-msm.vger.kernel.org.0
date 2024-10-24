Return-Path: <linux-arm-msm+bounces-35722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A59D69AECCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 18:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 650612842EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 16:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AAE1F81BE;
	Thu, 24 Oct 2024 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tj9gzG3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397C533EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729789095; cv=none; b=hq7hSlamsN/g/wMQGV/WEgywOd6Po1DLNcbQAc1uOqteA+JgXNA9IkmcmD+HDDeZdLuxuDFqvLS8K597uh0Y7yyBDqS2fFYtWNUdaI17YqpxBvtLb3YRLNdJ261HV6K4UTD38vx45v32p0WyuSosl08Fru+r+32VJmTOQ394SNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729789095; c=relaxed/simple;
	bh=1ukhixbsRM10mg626bcx8W+5wyHs3c5XfsQxfCNmfJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P9cnKzu+4K0luG4uEMc/fhIwJXqHJUMWRhAzMTLtlWSNbsS+J496dXw4EYM5L88DiY0L4nS11rmOzbAE3RcX0nwCte1p2q0pwcX9xND8mOyaukykHUKmLYLJ3AP2w3ncUUg16qwe53SZjGP5S8GrQdQYMee9fQ2Z6HwUpCKbDos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tj9gzG3p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OANKf0004988
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 16:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKqKzvww689YAw2d/2F3W68UpNZy8tpNAmm7bIbGXSo=; b=Tj9gzG3pn4QQzh5F
	+MxZPXG0ntDXue3VFE5/6gOpec9dtBmXHJkW7CkfdZN1Nz1MOELVYvCyA34Q7bvK
	UAFhjfgJSBSIZ5xEexlnFiszBFpKtxftqCeN0B7Vqokm/r8QGlEuvI32kR1xWocI
	LDEIXHnpxF+Kq4zUAMurEy6s3zZinMD1Pk2zaPyXWOYrSy2170p4hvl46b0/eYip
	b5vTxefJpTGaGyWRoc73CV9Y+UB82dN9Mzt4VVjFLv9mmdMYjRcZNvWKzMlBp5wC
	j1hqZvLPVJnfxKbaLH/gXElkNXsKqfgzczeCyIz7iWaMRYvvFaPy8HQ1jMoSG29R
	lFJubQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em686bby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 16:58:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe944435fso1368636d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 09:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729789091; x=1730393891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKqKzvww689YAw2d/2F3W68UpNZy8tpNAmm7bIbGXSo=;
        b=suPo3FS1N9CnYXKkv8fJXCxfJ6gNbGCvml3zKemxNdzfDEoL/Q4EZLYgCOrPbHcu09
         mxAHn3OWs+8GA0gpli5vzl8Ayzs7LcFgqcTMsw5rtL2ZAz8+wixZn48A6xViGbZpSlk0
         /+WbhZlkkS5ry+GXKRf36UIHzTvHwmhfsxU+GkmB87rzqB24VETCw2A81H+Y6gjiz23m
         liZz9zw/mviRXDGUH/HOs7dEZhjZIgxTRWKvTuHWy4nbb9xYpD939+5+ib3CaKRyiSVo
         knsxY94wxrnew9Dlb/BKeRmeeQWrKcN4vb6PMnKJNE+dx4NjKeoA1wklM3RPIWxwVsEN
         3s+A==
X-Forwarded-Encrypted: i=1; AJvYcCWAtlAwSmfNUtC687Uv8NIGJ+mcLc+u8f+6CfYrRTp2ntGbXlTJ2s4JxALPXpkb7wzL0tkrBvOrcLmRX/Fr@vger.kernel.org
X-Gm-Message-State: AOJu0YxT4u8F5/3sK6RufWQ6ciJOIjGnZv3QiMAQtVlfVbyoPDlj4iVv
	iqpfEuXKw2j67z+U98cbPBajUwljmq+hbvBPcKxFAMwUdAbYQ3xBnyP99eQmWei4YlNSdBjlZ3L
	Mc05UmxBtkxitLPW7lVwAG3xAY+fB5vjcmm3FAibwpWBkPUbjsX4aKZO+/I+uLsft
X-Received: by 2002:a05:6214:ccc:b0:6c3:5dbd:449c with SMTP id 6a1803df08f44-6ce3413a69fmr42215216d6.1.1729789091253;
        Thu, 24 Oct 2024 09:58:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHagPfwGhymYTLC2DieUs52AhME0l1R+evfg3zw/XQ9ZepjC8tChIg/HK6pDSWSb3nqIiI5IQ==
X-Received: by 2002:a05:6214:ccc:b0:6c3:5dbd:449c with SMTP id 6a1803df08f44-6ce3413a69fmr42215006d6.1.1729789090937;
        Thu, 24 Oct 2024 09:58:10 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6547esm5941232a12.37.2024.10.24.09.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 09:58:09 -0700 (PDT)
Message-ID: <882d92d3-57fc-4f71-a48d-6e53b6b6fbed@oss.qualcomm.com>
Date: Thu, 24 Oct 2024 18:58:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100: fix PCIe4 interconnect
To: Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak
 <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>
References: <20241024131101.13587-1-johan+linaro@kernel.org>
 <20241024131101.13587-2-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241024131101.13587-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rzoSNZaNcIJqOPWLtI82D56h21BKmG1V
X-Proofpoint-GUID: rzoSNZaNcIJqOPWLtI82D56h21BKmG1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=745 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240139

On 24.10.2024 3:10 PM, Johan Hovold wrote:
> The fourth PCIe controller is connected to the PCIe North ANoC.
> 
> Fix the corresponding interconnect property so that the OS manages the
> right path.
> 
> Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
> Cc: stable@vger.kernel.org	# 6.9
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: Sibi Sankar <quic_sibis@quicinc.com>
> Cc: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

