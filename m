Return-Path: <linux-arm-msm+bounces-61266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AA0AD959D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 21:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A981417EE4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197AD2236FB;
	Fri, 13 Jun 2025 19:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgjwVlGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861DF38DD1
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 19:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843326; cv=none; b=NnASOWHRE1gYQel10mL0A1TEWSA3G1z/4bJJxjWGh0Lggh7zQKIx6c6E9nWAt9A1jvFoAiWdUgc7uwdhpiLmV5ezPLf++THrqusHdqgyCDA45GPA7QSouerFsMZYsdVrJCpipGDaDuGf1EoQ2iKUgdrl0zEwMtd5ON6CXCRrPPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843326; c=relaxed/simple;
	bh=CxVcCuNKA9XI5R3ASHx9CRmZxlLWdMHDULPSfVRTboI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SGZEZlmLmbHW4rYzpPNS9hBX0ShfTzmnjc5ruOiEY0Fq1dVqACr+W9v5AT+Tw5YhZwocVd6mHtSpVvQdD6wbesqtwxtYUD8bRetJ5nOF+ra0HsgMKQTIKK8H7L9pX7xQH32mR/SB6XowjQ3oBNXVvJHM9cjwsH423nLC3AGEXxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgjwVlGq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DEgpFe027752
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 19:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sJ9x5HtZOfvSPdgXzzpXNU9n5skLvyOXtJDjWiUkks=; b=UgjwVlGqio9OA9gr
	LUSld1gsJ0VUXSnP7HMrWlvIE7mGDIyaL8djBy1/su/ioLwYrghWKHYlKu2COukL
	O/mFaciNY0UjNTqADQEPxFbNMXIRwTerML5OrDRHW6Ld+zmqhLkbnh/DMJFH+iKX
	0LvB9rb3bSuZGBgOJS7+MXjPTX+ZJw5+c8qX0iJ/vvrQvBi8YQmMxxDXhjoR9mVh
	ZnU12o4mSOF3Bv2HAlsj7KLq2/CwTMGYNMT2AhK6L3RODuIOSNuvkzqvnj4bAyNU
	8Qx6cJTgcpdmRQkEEwgv8eABAUPl8oK1IjPK4WMdSoceI/yQQThOSIcNdNjI67rA
	qrTsYg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 478nyv0j31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 19:35:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabbaa1937so5570786d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 12:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843322; x=1750448122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sJ9x5HtZOfvSPdgXzzpXNU9n5skLvyOXtJDjWiUkks=;
        b=MjB6nfbB/cU12o/xj6Vt+TPMy6113p0mkl/hZZlmvMkx5EhMDN2t8VU5e+6bsrMNtZ
         NFr9TeL5gMhc9tPOUR8FJFgZ7Ys66UcTTW/qIf6mXeQO9kZ30npzR0Y9zORmOx7pBPSR
         e3rcpqxbFHl7rCo15/sUrI0XLyE47hrZcM8AaN/m8jbBsnqHznIOOkBNoaFuzyFJB3e7
         27wGfSpE1xUSeLSm7wNbATkR8FSzdLmAF9SuNQlNBp0Xx2jTbRnxJaX4eO0n27DZRPMX
         4vR0/Hdby1HPw4Zk0nH/K51WLp9Q8Q4WrKrcacwq8xYP+CG3V+g+0/XNGIZWTrCSRl3q
         ZUrA==
X-Forwarded-Encrypted: i=1; AJvYcCXmfPWKFyjKcNgS8C/flkFtUFMw3HxOZcSiGx0vyryEf6Vr7jFjByzPgLGhhG7ZFmBkN1fiik3P0GLzrDJp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1fmRNr+x1GrS5BuBk3e1TBTzt5zdVyxhJ5X2IkBp9FGJxl+5
	DUj4blzU1JkRZH2rRrUU9ivECb2FMPdiC4lMNkL+ClrJ35Pi9gpdPBy1p8QPGlXsrLxI0Di4liQ
	2ivu1n8tFOFr8k7QZ4g8CCiJXj0JgfByNEuYqIm807sf/4hG4f+ArSSB6UfAQM3h0Gmch
X-Gm-Gg: ASbGnct2gdl/z/mvz0d3WH8T+N5sS9ygsfQ1TQ407J2sRE8J2DeK/sBeW+zmN9IYaHj
	xvJCMFSVZVV0qvRw8SDjT5zm/SQypegqctXddzmcFzSaPPb5cbm1wPhx5WCtlsCJIjEMZJ5Lz90
	mpaa5lOn5SU0HafZVYkeeRmolJtuktdTtlv0V11VPufro/L8LianRINL3WbRpnChCYG3zzhNY/l
	2ffxOiWnKhofXu3IA2jn7Vr7Pz0/rmWraRbJ/tTuhjIu2yoTvD0sx3Bph4CpJRIFrAYXO7gpDCQ
	5tW/JDDSPAoRoequgVZWnpQEoo5H1I4Uk6PzzOhbjN8+ksRQqJo/4Bx46JF6kdjgBWpxz/KIgMV
	/zt4=
X-Received: by 2002:a05:6214:3986:b0:6f2:c10b:db11 with SMTP id 6a1803df08f44-6fb47793f60mr2998766d6.6.1749843322490;
        Fri, 13 Jun 2025 12:35:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp+7e8UZQ86JloHzUxMiaR0mM1Dp9awUto6a7J9KV3sbTs0TzjrH3O/HbjpeZUBgtEA5FfSw==
X-Received: by 2002:a05:6214:3986:b0:6f2:c10b:db11 with SMTP id 6a1803df08f44-6fb47793f60mr2998516d6.6.1749843322057;
        Fri, 13 Jun 2025 12:35:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897ac25sm174065766b.157.2025.06.13.12.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 12:35:21 -0700 (PDT)
Message-ID: <91dde259-d8ac-4585-8c22-d3d772c2c340@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 21:35:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: pm8921: add vibrator device node
To: Shinjo Park <peremen@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250613193244.17550-1-peremen@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250613193244.17550-1-peremen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6WzM4S-sBlnpsYSy5uIRatSI5EM0c6Gf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEzNSBTYWx0ZWRfX2C1ZbnCKGL83
 YQ1gMPQiYqSVP1FEZPzFW91AnYw5rzqK1q3n1/f8nCowZrxaBtYvVYzx6JDg4ZVdYklwo7aStg6
 S+6gu542Hv2L8d5loZwYh5ZKwF81aQWWyQTT4wMbyL5ye8y5tUeRte3Q/SXlKECaNxn5e2x+pY0
 ikHbV1w8NcTgr13M5C+1blzX9onrbrJ0nDGoq/YzcJBtZ3vkZ+JFukN2C1bE31WfUafdtS0dw+J
 WZmLoMbw8wPSbkBn/pNnH02qeBPhqCTxtVpqMpid8cBSrE146LKfme+j4MBJ4G8nCrHAiblbC/X
 4B82ScFxKL9fOZfAFyV3Cv4TJgvKjPsxoJR3dCkuzZCkqvB+jCD9JfSTPTr/y9Derw7/w2nabU2
 VSExO1GCUQEJvKh7SCBTxpyd1o1mBm2k25xDDj2qq4QCzuMaE5JUw++NhV6QSL9FJacVA0u+
X-Proofpoint-ORIG-GUID: 6WzM4S-sBlnpsYSy5uIRatSI5EM0c6Gf
X-Authority-Analysis: v=2.4 cv=FoMF/3rq c=1 sm=1 tr=0 ts=684c7d7b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=EI79PUSdYkFRhqYvSFsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 mlxlogscore=844 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130135

On 6/13/25 9:32 PM, Shinjo Park wrote:
> Use the same definition as pm8058.dtsi. Since vibrator is used only by
> some devices, disable it by default and let it be enabled explicitly.
> 
> Signed-off-by: Shinjo Park <peremen@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

