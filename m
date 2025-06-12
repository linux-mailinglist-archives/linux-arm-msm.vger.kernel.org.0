Return-Path: <linux-arm-msm+bounces-61135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB1AD781E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 18:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 061D57A2F51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 16:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D67D22333D;
	Thu, 12 Jun 2025 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHQaHIsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F44519A2A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745547; cv=none; b=gL3p0qMMjVlrruLaGaxfLj4kblu/Kphp1pu2lOj01xPkJulGrjxHJf8Xno1gLT7bSFEXOzUD3GvGsBm/3Bs3daSR2E0xubFO+mKY58pCoUzjNqOqQ6bmEhFwdqiL6/MZhsk6Y74vqb0uh+/h849A8xAtosPMsJ/KnTh77lxCv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745547; c=relaxed/simple;
	bh=8rrBYPyWqQoqXB+GFbUbuEWRPD9YSsFzX9jkx/0RWJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jTd0yg8sGjL2z4HedlWHi04nGBSNGdRLr9Wc4mvD+twzCJb0/LMtntx6M/bkR2/5hngdS/Vjc4nwczFOXWElVrbSVWyJ5HSmStB3RNl5KAcwr1ta6RabKYYUE4drcai14c2HMx416AVUq/QaaccE08KD/QqjcFjKjFur2xzO18c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHQaHIsU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C8DWDl027360
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 16:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ydLEewNoftAqiRDnk4x5l1LukBwM7hRFg2xX+bZK0qc=; b=ZHQaHIsURA+GbiBo
	CByvrEhHHs2wE/v44skCgFwwllnAB7Zyi/a5GOWfIOM7kxRp/wAlmd9GtYbACjRM
	dubp46kznRkt0TWTgFy4IhlBiYXT+pMUetfZUMH1l/DNa02nmEUlIbB2Z8IjWR6i
	K0MUXFs0qn/I8K1HGpSCoA0ooAkj0DlD59wZrsoPtSJAIDTaHoNDrV5Sv7cEZZfy
	KCzEnPWv46/y+QYpHFp2JUs4Z+OE+invBib27YK+B44kh692MPe4rb6sqLt5MCp9
	hdyS8P9aL6963304sslgI9NWO9MuYpeQ7PpGMXrRH17Nhhpd+MHfw3LBJr5AoAPk
	RsFtRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhg38c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 16:25:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5af539464so30669385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 09:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745543; x=1750350343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydLEewNoftAqiRDnk4x5l1LukBwM7hRFg2xX+bZK0qc=;
        b=Yp6+MopgEj5vX6LgsfpXIlUZJcb4miXizZlWaaVzIf+rHm/BgyhUORCZYsTlNJehWT
         1pmJZAAqs1qCKcYK/vj4vNwR9VPRkc5YbPqTLaxVxW5p9YQTNmetFja/LUVmVRCO1Y7O
         hsrCLGJbq2P29W2TSagxt4+btsBU4Fsd/wglyjM+Ey93J8C76To64XBPD6H5/1+aQb9v
         bgjQ/gDa0HrIyW+SgMU+BQx47Q5aXGcr7c9TFBahFk1UbsgFXlgDMYIrT30fHX2EG51A
         RtUunPaodDctlrbl2JC74WJKw4CVn/wAgpZ5K92tNpEkifDGb2HsLhVzWaSNSsSSsXOK
         DpAA==
X-Forwarded-Encrypted: i=1; AJvYcCVZcvvlq5doIefRTYsvcgfIHRRQXt/C619wH+gQjyX4mUjwVGchhKEN52eEBKNbwYZgYB1GH96ij4TBI0rd@vger.kernel.org
X-Gm-Message-State: AOJu0YyKgcJOc6OTBh6jtrhhfrU7l8gTFm9WaQt9rJNL1RFFZeo6K7nS
	tTD1+6HkhqN3fM9HqrC69+NyqxXgtm1r8I1XIsSzbAi2Inh7U/gSENMKOChqC8+kvDKreuygJLp
	1aj/Etpr4V4/YK6Cia0OXvBjhXb4FanphgbNGN3I0S9ftIFhVAbHAvBr5T511r1JKDa19
X-Gm-Gg: ASbGnctiTUaV0i7lVLqbL27CWowlfrwwkp2KtANrqGLtlZ/lc+2UDBavFHFM8AFXbBB
	1cKGGuyp6dNJm//wxdznWf0kj+VpaZv+5DY4uMy8AbFDjctclYvFgyG5QtaTnySWdD5I+bZ0ge3
	F9LlCsLRc7Ao94EC809lblVRNzrFsr2Z6UtIYhGpji2IZN1Pl9c6ZaXAPo0B04kYWtmB0PDzgh4
	HBUsMGth67j2eVPh/B7KHarPqrRTi19pxRCKwo1FxOjnYuG9JUKpxlSLFfVFRYbNjUIuZqIZGa5
	wMT72J9NS3PZkrhm/ebLuBzpeSeFJ4J18BbbryU2UxCLz3E0EX109KDTj3Hgx8X3BXdPlKtfBq2
	1uhc=
X-Received: by 2002:a05:620a:2335:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ab3be49cmr284397985a.15.1749745543498;
        Thu, 12 Jun 2025 09:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGbawf1otBqjUtZgfrbADUe6fjgoE6GjMuzOjrH4tbFF0TxEo4dt4b6nlvj1kFmBcndUi/BA==
X-Received: by 2002:a05:620a:2335:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ab3be49cmr284396885a.15.1749745543082;
        Thu, 12 Jun 2025 09:25:43 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6086b1e4412sm1399475a12.49.2025.06.12.09.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 09:25:42 -0700 (PDT)
Message-ID: <33573109-02d6-48ce-bd84-df67b30f27b9@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 18:25:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dd6fd001-6209-4bd9-807a-4e9b5fc4cd5a@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dd6fd001-6209-4bd9-807a-4e9b5fc4cd5a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684aff88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=OLnwHr2Pmjrr7MKbipwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: yIAUTWxxJrw9e685uPaIhvcLC7NQdGNv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEyNSBTYWx0ZWRfX9pXLxbf4PCCQ
 25jXJFaq97UOIpmQ2k6LM0HdJllH98aMU4oG5FaUkHph7zsgVIo0XjigWdzhI3XB4ZcgjwBzcYE
 gVjL48SS4WA7LA69nvhJXk+0yTYIitaIjPwqjI4EC25LrBNj/EcVirIzaKMz1vmULhkqh2zBuKm
 PzN9OzmqD8C3+AQtW0fNHi2kviBRxHsoxkzBeyoyBu/n3l+pZBCcXL0rsa0ppHo+2AxXlo33GfX
 XDIZ5xOtxnQ3aUj5wUY0ZBoQv8wieca2tVdoA23W5DK3PY+XjcPvRT1YyZOGwzWKWsKCSrDaCWh
 8ioTPk9i44i/HnFTsmUVQMy0ae91uCucs0qocWFQ1j6xoHaiJzIL1wulgijeU+vY5Nt8JQEzoXW
 m5A/l2lrXsdAzirmt26ikyWnY6fal/ttkK7hpOU/ucxsPu8nvYTTPlIKwoh/STV99KE6cVIc
X-Proofpoint-GUID: yIAUTWxxJrw9e685uPaIhvcLC7NQdGNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120125

On 6/12/25 9:43 AM, Krzysztof Kozlowski wrote:
> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>> Following the new device tree bindings for CAMSS IPs introduce csiphy2
>> device tree node under SM8250 CAMSS, which allows to perform camera
>> tests of the model on an RB5 board with an attached vision mezzanine.

[...]

>> +				compatible = "qcom,csiphy";
>> +				reg = <0 0x0ac6e000 0 0x1000>;
>> +				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
>> +					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
>> +				clock-names = "csiphy", "csiphy_timer";
>> +				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
>> +				#phy-cells = <0>;
> 
> This is also duplicating existing ports thus you have a mixed MMIO and
> non-MMIO children which is also issue to fix.

Does the CSIPHY work without the camera ahb clk/TOP GDSC enabled?
(as far as register access and doing things that don't depend
on input from other components)

I think moving it outside makes more sense both in a "breaking up
the monolith" way and in case the answer to the question is
positive, in representing it as an individual device.

FWIW I'm generally in favor of what downstream does with regards
to camss - *every* instance of every device has its own node, as
it represents a physical subblock and has its individual clocks
etc.

I'm genuinely (not necessarily positively) surprised that we
managed to get this far with camss being a single big blob..

Konrad

