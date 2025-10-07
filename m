Return-Path: <linux-arm-msm+bounces-76188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B437BC100E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 12:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AE17189DCC5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 10:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568D62D838C;
	Tue,  7 Oct 2025 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hU22RQAO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D648A28F4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759832666; cv=none; b=lhSokT0FSFxBPmBb5mukHoVkHlytlqZNAWsUAMSajW59Cn/zzOra5frhJq65ryw+XMM1NjMmfPhA+J4+nAyUP3KxnrJrBXZAgyN+T8XsYS2nYu9Dorwzv+kk7xjackh9Ic1QDbfh0gMWHLZEHF4znYl0oKh5Tnus2ftZnuVOa0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759832666; c=relaxed/simple;
	bh=Hz0Lw9XoJxxpUtx9lMNm5Vj6GKjcPnXjgaggtSuRo28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H07lZrU40CKjjq2V+eAMDREQyXGNZumc/gX6snKNhGI0Wr6W9nMVobucGYzkmwed5ETNJ3Lv97yTRyO4ZBMCFvOkz6Bh+xp+Xb2KE7VjsaDoydY2nK5tbUYUum+LCPKKUAjMDsIO3/oaeXJXkK20aXSOcJa8ORR0jr88BjDE8+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hU22RQAO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973cFvZ025798
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 10:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hz0Lw9XoJxxpUtx9lMNm5Vj6GKjcPnXjgaggtSuRo28=; b=hU22RQAOLlj20ycM
	Lbxfz4cMeFzA0X2Ot+4wz3AcNfmsC5lxP+YqcYQqJRyjxRwBi1dUV4AgDGHT+4aB
	81hRCV0nIgmAhXehfYcBEL8gv2qDdblLL4a96ufjvUAfxTXzpe+pHwBNHye+NcSQ
	JsEVjKFN4oGDGQfzy1p20pESqAPrFYaQNt8xAUePTMRGhUeYtT/5MAmaSbHjaffC
	PiIThhhvXnaJAMmwGvsIGVZntwV/y9Ws++NNiGk93spi4n5lErcoqY7+oNG7OnCp
	89v5Qa+SV/5GCutVILDVsDQJvvwsXqnnd6sQUbwNWkT9jT1pcieHlQ/1uoIOsfxr
	Z4N8Tg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0jmjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 10:24:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-873eac0465eso22847186d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 03:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759832663; x=1760437463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hz0Lw9XoJxxpUtx9lMNm5Vj6GKjcPnXjgaggtSuRo28=;
        b=NWm45kGj7smZFUyVOf6A6dGw3FAC0OzNDNLtbTyJT+rS/LicjUgKdejkeZDoqtWb4d
         v9r+QYhS1cO3TZAvx5UchT9dNgzG5WdBa3vRkI3hLGghYqWdq59sIEOAzvdcfWn4lOnx
         O+YMrU5EY92JUuICXsaKV53u5wc450iFSrjNgNgyW6f4xnGAB4+nt8wdllQNzkAeLUyN
         wY6W9g/7UbawR1WY6DlcmeSyEFa5p+e56B7pPP5kwHlntfJyupi1CYpF+icxVig1iCmy
         J2lsKQLqER4EjQQTxOQ3q9g7ilzh2DY7MjdG4A0cAc4c2oxq8YqBKR1dV/iYmkgh3PET
         beZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd9reyBIHWgU9me/jYJrlr2krpYhcVFrljL4MZDF2/OajGK218+L5Gv3bNL4WuHT1cOVpUEvKN4IRdWTxq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxq6LgvgVK3xINXVWLDojohx2JEZxCpsxBd93cY8w32uQ72qZB
	mQIFhZat5dXWDHgbR2JBuAikpddrZEnS3ubjOrMT8SMQuWyHaErU+bioHSSU7joB7yy8KwFNFGC
	fp9uKU1gTDHi6cdT/yZKSL1Jc29xPEI5tBMJuAVdEiFu2AzsTZId8SeiN30KZD2sh7Ifh
X-Gm-Gg: ASbGnctqEO2hBVQt8lN1xZ+pKQUfFK1rin6dCIYwYfGxrBsYEemhSmpc+Hfg5YTFCg4
	I2WZd40SxR1235v2Gy06DoY38kMvNCQGQ4Eql+BiYSUj5i5UbCM0P2M0vS58V3QsheVghifVfYl
	kObxNF06wA1wZIzT24IrxpYL6OlfOsEyk6Y5JRuWhxdfIRZXbNgA5bJOEzavXOcTLlqU703t6dG
	NA+uFEmF3sBtvu8VGLFy1kkm0JU55ra/NWNfIGJ7BDIgKuKCJh1FbDJgq77eyo3lEWsuzyMzU6h
	wzqu20LwD4XHmeQAFdS0nCx9rJL7nuve1nAr4dfzzRW33+QJroTmRytSMiT3trs59h5LqM7Sytr
	tvVVqxfvb76cmef5VgKGsaLFB9ow=
X-Received: by 2002:a05:6214:230b:b0:815:e14a:1f44 with SMTP id 6a1803df08f44-879dc6b708amr132820156d6.0.1759832662361;
        Tue, 07 Oct 2025 03:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5Zrt9GJ0jEKgSzWhbAu8xtMsQTKHzxXFf3iuTYiuMvNb+I+Lvf727ImsmH4W3gKxk48yO2w==
X-Received: by 2002:a05:6214:230b:b0:815:e14a:1f44 with SMTP id 6a1803df08f44-879dc6b708amr132819936d6.0.1759832661751;
        Tue, 07 Oct 2025 03:24:21 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881011e9sm12024316a12.25.2025.10.07.03.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:24:21 -0700 (PDT)
Message-ID: <64719a5b-0747-4f3f-9bf9-c04900a5e0e5@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:24:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/6] sm8650-hdk: Enable I2S for HDMI
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
 <20251006-topic-sm8x50-next-hdk-i2s-v1-4-184b15a87e0a@linaro.org>
 <DDBPGIDN8SKS.2GF6TZC6KGXVI@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDBPGIDN8SKS.2GF6TZC6KGXVI@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PSVXabkrwfAjoi61AfZxi60SqkL0A0cE
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e4ea57 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=T-gaThBTW-us8SvG3JcA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PSVXabkrwfAjoi61AfZxi60SqkL0A0cE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX2srnQZLg7nhj
 v1KyN9Z/ndoOaFWCZKALZ9OVXOMFuEyu75IoAkjjGyKLlbUGwobjRyQZHVweft50sl4WHLV9nIu
 8b2tGPIvIQm2WGiMyx7Feilk0KStd5kQtnWZ4M+h8hMSxn+MY+fmDcEEwgqnuTkcFaQNVLds5f7
 Mw9qQPQguV1hbAaIMGdVymjw/z2lzS/DjzG8bTkGjwTQPQYAmvHNkFw/LSL/ms7zklYHNZamqHW
 EUlhSgE1YmoQZy6DwOnn2iQq5t7YInGafA3UjbEWd/k1pBzwUJONNzrfZlczIrXcbR2Of5RCKU2
 /w7Z89sW78+eZYN8oBToOuF4kyywc5Xs4B9rpGCn4fyzyDcKL7BcAc/RjlMncTL73UyxZUbhHs/
 s/Wuk6DVrBrzJ66QWYeMlMB3qafZ2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 10/7/25 3:39 AM, Alexey Klimov wrote:
> On Mon Oct 6, 2025 at 7:37 PM BST, Neil Armstrong wrote:
>> Add the necessary nodes to configure the right I2S interface
>> to output audio via the DSI HDMI bridge.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---

subject prefix (patches 4-6)

Konrad

