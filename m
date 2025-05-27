Return-Path: <linux-arm-msm+bounces-59576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F614AC5544
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 19:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65E743B7190
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 17:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD4C271476;
	Tue, 27 May 2025 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAX7QMoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14A027E1CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365436; cv=none; b=Wj8ET9tLqVn+X2K9cstCYA82hIeYKolmemfRQfxBVw2ksIE4+ojwwbLpdtAgKV6BBvU1pumkgxro+ou2YIshE2hs4u5DXt0b58lVw+8bjZVO0HCXiOPwC564C6hg8L5LOY+P9KlGlUm4gf8KW4j5wBrNbzr7uLaCrmRlMcY1WQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365436; c=relaxed/simple;
	bh=D/exj8D4Mdt6FJYvJh51f96SRZVSyPsguFJ4c+GikA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUnpNmk1I/8HhVWNyajhl98vOZ+xXuemEBZYto+552KwYMr4hw7Rq2PZkZyD+lILJ4PzGWPpJWrZxZpK1OpzzHlkNXU+fVWLAify7eIHVy0kEFsUcRvBHbUlNCEgilTXIIOQ/C0aRQZpGtDsBvMoeQVcijsDlU+94BpxssyhAN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAX7QMoy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAEtQ2032267
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 17:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fN5GCmNGnguuUfY6HIS616UzD+Rz36jMub2o4gFIJoQ=; b=pAX7QMoyiVE1rY9Z
	+cKXPpiJ98pUzTz92OcGDPCydeOAXwvebWP7QHok+kDYdfdzki/19s9jOgDF556F
	Y0sKH8EIvRhxDrtbrbnYwDxhmdtJY+wlI6wEAuWp2hpHj9cbU8iNmJU5v5nBK1eu
	J34qCPZjcchBCurdEjc909jY4kpc1plvTBAZu0lb0wx7KOYTLhqVzDZZScp9n2VH
	xrRs4rI2YRo0H0/+3RGD60ngh3+YcNwy1MXS6UDbwJlbjT6CbB9Mbl0Cr8Ao84Hk
	JdkEmD5qE+OFOZ48YnC6lAN+/ZzLUUZbLgQ55BohYDY20fYtMNalhx+1mjWJoWfW
	m7VuJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5qqfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 17:03:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53d5f85c9so107253985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365432; x=1748970232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fN5GCmNGnguuUfY6HIS616UzD+Rz36jMub2o4gFIJoQ=;
        b=cOCqrptLyfVIcFUow4c9d2lJ5peQfke9AJjoopBUAIMsMjZYwOujd1NWwOgczrPgtv
         fs+HD8WNkCKJoRQp+74AqJEvVohMtngjgb6fVphkMipX8TTCTtH+LYtKv5hZowsjd3E9
         w7vqhLMYv5dN7TCsuusmiHDGhshpq1TFDJQHlmqVp/3isFAT4oQABoq/SNuuvzJ7YpZC
         RgVWSmSoSaZrW8E02ycRlcLEGhIUe+/i1dxpO9L8rte+dET0nDMr70AxkaxttaIdh5+l
         /3uKHj61HqmXiJhU2NHKQ71ilT+CqItxJpwFIZ0xln5DoXNkKRnKhRLVk7hQiyEaspj7
         1wkw==
X-Forwarded-Encrypted: i=1; AJvYcCVDaAOP4Cy1bL0lHTFbJAVIZ0aCoW1JBrqfKxfpMnUN738mQWzztXtBAwV0DRWaM+lUOX4UcL2jFlePEQ/B@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3IGKbc9RpRbJSBvqpuqy79mVsOywysKTSqwJedFILibmGCQfP
	6okE3RH6U73AfYhTomMGF06KK0arRZ5/UcV3XmlRLRagsFG/3CDoYo9ZEd7CR6YPQvsXsTtn8fR
	rZ+v+/xSB73mbLZavuHlDhoLpuOVaSXZTi/wow9pOVACnGHxniCn9IxkFEGeNX+K3j5DV
X-Gm-Gg: ASbGncu+7KS8Wm3qJBGER1IBzJDr5pn9VXdD8dHXWubxFHFhwuEmdexCMO2lMDCYXM+
	WdvGzGjbgpx0H2uLWV/BXsBdj8snWFDvBZxoX8brX1a+6qX30bkRH0u1pFtdXNSCcA8MeSJ2Rro
	kLTAfGShbHOGwpRo6SRU7hKRnoljISy0VgPejiiWK8PMJnSbo8HrdX2F7if/PvF3beXmD2tQrzg
	6zHKhejt84GA42c2mRXqiSl5zSjrZC6ftDjXlY+QeRWl9JbBsKVlcUELmskq08ouvOdk5AYvIUf
	zaCXJa09epMXo4N+CLuXkhSTg7dfVPyjV7Byrz4WHBZXirB4z4JrWXxtjplB/MAaxg==
X-Received: by 2002:a05:620a:49b:b0:7cf:85b:4b2d with SMTP id af79cd13be357-7cf085b4bd1mr14854585a.15.1748365432588;
        Tue, 27 May 2025 10:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDevCtCl7OkxCN6/99TDwIJJTrAXaSCvcoslipOU+QfWt40Ux7PUXxxh0fu5f697QezV7y8w==
X-Received: by 2002:a05:620a:49b:b0:7cf:85b:4b2d with SMTP id af79cd13be357-7cf085b4bd1mr14852585a.15.1748365432068;
        Tue, 27 May 2025 10:03:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b059sm1900573466b.10.2025.05.27.10.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 10:03:51 -0700 (PDT)
Message-ID: <e40e3078-cfa7-4927-af6e-f66a5dc4861a@oss.qualcomm.com>
Date: Tue, 27 May 2025 19:03:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: sm6115: add LPASS devices
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-7-9eeb08cab9dc@linaro.org>
 <26afac49-2500-470b-a21a-d57e4ff14fa6@linaro.org>
 <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6835f079 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=IU-kIAO4L2lcGG9yRekA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE0MSBTYWx0ZWRfX14QDeruLtMxF
 ortBoKlTx4AEQb6VvvoUb/gG5SNTPUaZAGO9Qe9li7YWsSGvjmhT2ZNtmsM2Zl3uwSi92LCjV4D
 zeG1JcydDaF3mMBCd68GEXFiIMQzJSFh2ODaKPWmRV+ND4S91KgXOVjndsJK8IEbal1YEsstvRI
 YTNNQ20cjKVecYZQMyxl9E88zMbc+dkwfOAI6Kq2u/3GhSCUyzE8rjV3S92bvI4sAxwT3NW4DlT
 06znwRZk/GzAmw9Sy3MrQxRsMXm9z5hSYCfVniPf+JS8kwawDJ98nIV+DF8h+Vuj18/vlU/IPtz
 8+azbD1c3kD4X8Qw7LxjVa/g2dTopDAi2PFNUd8AtFUQCzjhAzdu41xQBspxmwm7QgyoSqqOO4Q
 M5bDe5f0i385dFG0/OpeehLNh2hhQGMRiPRp0S6TXnsnE3+3wKL7GlcI8hFpd8bSIad8iYBs
X-Proofpoint-GUID: t0dtiQejuwko5TV39XHxSytTajNdIpCA
X-Proofpoint-ORIG-GUID: t0dtiQejuwko5TV39XHxSytTajNdIpCA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=856 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270141

On 5/27/25 6:32 PM, Alexey Klimov wrote:
> On Thu May 22, 2025 at 6:52 PM BST, Krzysztof Kozlowski wrote:
>> On 22/05/2025 19:40, Alexey Klimov wrote:
>>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock controllers
>>> are required to support audio playback and audio capture on sm6115 and
>>> its derivatives.
>>>
>>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>>> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Just keep one CC.
> 
> Question is which one now. Konrad, is it fine to keep your oss.qualcomm.com
> email here?
> 
>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Missing SoB.
> 
> IIRC I took Konrad's changes but at this point I don't remember how much was changed.
> So I need to switch to Konrad's owned completely or somehow indicate using tags
> that it is initial Konrad's work.
> 
> Konrad, what's your preference here?

just loosely mention it in the commit message

Konrad

