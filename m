Return-Path: <linux-arm-msm+bounces-58725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2FDABDCF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D55A188BD7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 14:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA41242935;
	Tue, 20 May 2025 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVFm7eyd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A702F2E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751366; cv=none; b=ubR9b7Mp40J0Ng+IwucZxB1hrFwPb/oSOrsKJEd2IdZPKN/ueQxqzPeNtWU7B0KPfxXx7DqxmtSsTHlWwhd9s2J+ThmUGmcCIHAbp4Z+26ir5CHYcJRu5j7UolcunskxS2bBZ87BH0AfjbjU2vzzNmcxa4WJJiDgorciK3pDLU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751366; c=relaxed/simple;
	bh=ejS6ovgsQrYlFQ3gRomd+Ji1tifZg7j6PQr7o/pIqA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEYnolYVyI+OAjtWPfC+nZ3cepcAaCYJc6/nAAtt6R1j72HUnhTN6wJ/imLCHBc8ld5dvnYJL6fWucAjSc0wv+3a7fI5j55X5qZcZVgEQ4B1iXQfsV1XJmSvObrNAyURtajx6uSkNS/UFkGTi2X5CwEm21N99b75z8kSkC49bzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVFm7eyd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDrW4Y032102
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTvWyp6sTsoPovqd27mbVAax9KqDto0mtErtu24hwf8=; b=dVFm7eydEyKaxevI
	vfIkMyHij2+KG8/TJdppUEn6/PAJrcB0JRS2Q55gC3y45jHO2eyObmQMmo/2retX
	i2BbeUhagfrA+Dmuj597YjzMVP78MXaDgfl+yIZmd2J2558VgIY0nPg5O2X5xMPp
	xs6pcB35a29K+qIsG9R4fXd+yt6nT0oCMrxZ8TNzxKysb1SCB7TB7kXtbAqH3Ulo
	GQYBfbaD4KPzOiP14qMKeGF7xA4NON4vQg6fZ24Fur76iVEybMXt/GfdFmUnUS+Z
	6z6RZxuqhr8y+M6qAK+LzbKNdxvkxmaplJiFuKiL8qAby26gXS/0su5A6+4PLOa2
	ysvvjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atm9rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:29:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5466ca3e9so108057585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751362; x=1748356162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTvWyp6sTsoPovqd27mbVAax9KqDto0mtErtu24hwf8=;
        b=FKYXHkPaolv0zxi3AOoWqyF5tHAXIZmI3lZQ/Ea7WKwWZbWxdwjfixvNn5aDs002f2
         e5GmBSPPpNADTbq74KzWff9FHYPY7oOZ8bgzL1+Ic8t7Fg7i2wVeJw5GB2TOpTmQqRqo
         B2HgOFHn51xRz6cM3UNC/BfKagVDQUbraSh0VUpFt23VoQLQ0ODBcB6EZB/oppu+oRDE
         QpUjCcHIVcm3wCvxW3nko4o9ffNwAaXaJREtFden/zkzkYGx7941Tv8NnQOLRqFU5xrh
         DTYLv6nF850arzUs1j8jHPqtNn88Eubn4t2Ta08z0dLUV48UBwyquCZWp5xidy+7gEUX
         Lk2A==
X-Forwarded-Encrypted: i=1; AJvYcCUkzfpLFCMREqGVS4AFtW47IvRDzHQk5zhHLtCZRfGgraL7DvxqJFatCIkxN0bRQwB8zEn9CVVSfTuOoX9T@vger.kernel.org
X-Gm-Message-State: AOJu0YwcthEvLfYeG+KhLpasnaEmVKW2aMzgyWTKxQ72lcBTmR5ZyocR
	Y3vt+XAIXn7kSgAfLn8lomRPItfsTETv/9DbX709nRvlztE2DsyvPMV3rKWCDP9UtwXBRZwWJGo
	I9s3g0c5aJAF6PQfu3Sa0faIVGbdZ2k7VCCNNaB965RNEkOQzCVGMLoRxq1rXQ2gkZsz4
X-Gm-Gg: ASbGncsrwFZ4MYHcoAZxbdW8i+6krXOV0ToVtQ00lhfHjmOLVxrz8vAtbx8YZH2FPZN
	dY7Dyc7u3k/vl6GnKuJktCjfJSp+74IHp3VxWnjnn4yE3z4Q2XJm3irqGEc/sOGiA9140sER6CZ
	1K2ws/jZ0jLV4Xzry3ZPHwAW0vZhVQfWKFm1WgS+fsh2ROPgsdlC5fms53ul1dKW4n1oNfRVbD/
	NvSkb+PKwi1DmoquaIuviU44rREQ+sZidynQ8Tx1RuT2kr2yF9Q3OcMxZXmlaOLZys9DWVhcTPv
	fpd50SD0cRMUEnkaQGguocfIyuIMD94PxkzIeePqxa+ctdU7YTbJTyQvFfFJ3z1i7A==
X-Received: by 2002:a05:620a:4895:b0:7cd:14b:554b with SMTP id af79cd13be357-7cd467c0835mr1061653385a.10.1747751362232;
        Tue, 20 May 2025 07:29:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4MIcwFME3fzluDpcCr0w4MNNLPjzHGz+1z4WA1cnE5MqMZfKL4v0eGPZNm07L4mDAE11zzg==
X-Received: by 2002:a05:620a:4895:b0:7cd:14b:554b with SMTP id af79cd13be357-7cd467c0835mr1061651285a.10.1747751361733;
        Tue, 20 May 2025 07:29:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e674sm733754866b.24.2025.05.20.07.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:29:21 -0700 (PDT)
Message-ID: <a49df292-dcc6-457c-a565-984887687341@oss.qualcomm.com>
Date: Tue, 20 May 2025 16:29:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] SC8280XP SLPI
To: Johan Hovold <johan@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <aCr7UzmK7XCjpsOx@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aCr7UzmK7XCjpsOx@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682c91c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=IX2s_8XrF8Sh1HtkrDgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 55wm2OqifBuTSoLybTsidwN0hoQKh-iV
X-Proofpoint-GUID: 55wm2OqifBuTSoLybTsidwN0hoQKh-iV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExNiBTYWx0ZWRfX/H6o8sGYimyq
 VoZUaJTQEFnuRTimgl40KsojdWsWLzN/I8wbLFqzp21eK1jy3+4NYmM3ays05I44g6rIE+nHb+V
 PoFTCrUzOfKBhAnke7iC7N/i+sftI4F/WuJzh2XbJ8Ky4Ev07strkYN/I73hkB3+Ad8IjYmvmOR
 lxCCMMrFq8LQBYte3f6O8oRhGBgKy9ABFxNK99DiAh/OsTQPUxeHqCtHTg1dvP9lTXWHlnx1fn/
 ggiqFbxsLlsxM+R4V++rwAv2RrUrM15a/PdbVZrgzD+0hR70h3AN3XgEb9cXor7wBW4yX4xJyCh
 FSc2Ku2krEtG5fYSYCpjufO+5paFkevv5hxZ12wycgE/S+mD6tjocPbQQ8/olB4Y4SrK345EVHM
 1hpdEgItilW2kzgiL98nF4uLdoKGMZrIxFcFGaFVbMzum8HTIwZWVIAolPbb0H/5vtePAAxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=802
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200116

On 5/19/25 11:35 AM, Johan Hovold wrote:
> On Sat, May 17, 2025 at 07:27:49PM +0200, Konrad Dybcio wrote:
>> SC8280XP features a SLPI, much like its distant relative, SM8350.
> 
> Please get into the habit of spelling out *and* explaining internal
> Qualcomm acronyms like "SLPI" so that your cover letter and commit
> messages makes sense to people outside of Qualcomm.

It's difficult to judge which acronyms are known when half the words I
type on my other computer are TLAs..

> 
> Also say something about whether and how this is useful for anyone
> currently or if it, for example, depends on Qualcomm proprietary user
> space bits.
> 
>> Dmitry Baryshkov (1):
>>       arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: enable sensors DSP
> 
> At first I was worried that missing firmware could cause issues here
> (e.g. drivers not reaching sync state as with venus), but Lenovo has
> indeed released the SLPI firmware already.
> 
> Are there any other potential downsides to enabling this (e.g. before
> anyone can actually use the sensors)?

It's probably only upsides resulting from keeping the rproc in a known state

> 
>> Konrad Dybcio (4):
>>       dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
>>       arm64: dts: qcom: sc8280xp: Fix node order
>>       arm64: dts: qcom: sc8280xp: Add SLPI
> 
>>       arm64: dts: qcom: sc8280xp-crd: Enable SLPI
> 
> Without firmware this results in errors like:
> 
> 	remoteproc remoteproc0: slpi is available
> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
> 	remoteproc remoteproc0: powering up slpi
> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
> 	remoteproc remoteproc0: request_firmware failed: -2
> 
> but enabling for the CRD reference design and requiring users (read:
> developers) to copy it from Windows should be OK.

We shouldn't expect non-developers to have the CRD on hand, right? ;)

