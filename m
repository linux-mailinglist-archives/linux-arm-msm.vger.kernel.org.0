Return-Path: <linux-arm-msm+bounces-71768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF9CB4197D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFA417A9ACD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5245B2ED853;
	Wed,  3 Sep 2025 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/QHDpo6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C57257851
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756890044; cv=none; b=DmQSnLPlrLnCTXrr/8iO62vkDxULYdgOFqmC7lcjf/XYw7anXb+QicuwH/tzfk6WHq1o67np+hyyCIkSvvTzYD99dRZR1hgOxh/1K9ZXI6+o6fxe7qeEZOBhPaTpUFj2oXkupKznZCSTeneGxhPe8BCL8fvslvck8YqC0m8/HSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756890044; c=relaxed/simple;
	bh=SbOOxV6Xe6CCn43EVipuJCMXzlrEjAWOJ8RB3sOYs40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjujS3YknKkbOlZXaqTY7RiXfRdXXikMDnqQwHZBSI730BT0C3nGiyu0Opf/DjKKzdbXBnmpaqOJu6VDmcVHmJZC9AlXrfRt+ldxY/X4b7i6caBwP4pgNmk3T/lZ6IRQnMxIKUEKsfiuNTs34lHZ+3/NsY7sevoSgeMx0U//GSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/QHDpo6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832Aj29025386
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 09:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+LEakHcMi5MUQWyBYBQ5DPF7nqZWUcEjlntDch+SZE=; b=m/QHDpo6ewiGGnsx
	V6Ae1JGQA5xNOELboQVqUHP360hdBoyxKuB6UsUSUzYLGVLIhdAQcbhAB/7VuTAQ
	sXKLF7bjKErAg0G/YpDnzQUMdqw0PgX4xLzHCfLoF2YnoxsQ5/hWC9ak0HloTQ77
	ABoxg0pMmRNe7eUog8wMsleDrOsreXlzKVkHheyHcq/dYhwAktK+4B2CQ5fsMU66
	gv92CKC4FcszhmM8dv+nHeQoKmiW2hGZ9TSE0ZS7CjCF/n2Tftct/TyIZblFF+Z3
	Hi9ICIFEq/lyTuoLybwtWuf15zeOsuSqluEK3tzOkYRB3RREZAlMtnRGZiqoXZAR
	CQ91/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv314c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:00:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b35083d560so27466641cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 02:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756890040; x=1757494840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+LEakHcMi5MUQWyBYBQ5DPF7nqZWUcEjlntDch+SZE=;
        b=MER4SDIv58M7ST3vp8Z6UHa2vC+6WxMgMfxBtbnPpFnSoY3QKS4buAQbgAAEP3LRni
         nQhBDXqP0L8RoFBGECVjUAwlEF3g+0xZ/wnH/lxhhQ7/kAecSbOCY19uZ2+oPhrAsXIZ
         xxzex4Yw7O7lGEnujd0x0t/4/qc9k9JZZ5/MtUyj/+ZxfO6tJiPur/HbVZrf2bLHMe/R
         0qO4+cip/5OIsV2UKWOZllLDbKI6ZHisffM0HdBxJ8QFvuIgarEM/gtlSVDwwu5r6Qo3
         K0FY0y0pbXu2snVHAd57fl75iHFhbRnVfWoF+Olxg2UWS19e/jYwrgWKvTb6KjdV9hqO
         sTNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF6yd+CV9EI6FFT2aTuVJIWDyjRSLXruUC3QXHRKwBvDwDCrogmw2VTw6nJcsxh4XO4nph3IfAzbDXF4G3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjm1l/nfgHbHw+txXDBd5eFEzMRmWdDjKgco7/buTQa/FxrF7F
	xoj36Jm1mHEPJPFNg1xHZi9PsmKwbsIy9FywGGOhba/DYYuQL+KJM9H9oAJcJ2ff+2unGF9xe6Y
	Tx0Ur5iqbttdM9/2PqCXHD2KuKTCzv0vFn+9uVNouRv+DScZYtiEVM6jdHj9WEKj+yaaHiOgY8K
	/r
X-Gm-Gg: ASbGncsD2DvAlGyQGAe/yDGP8iXrid69B0hZeh2CudzG7aF2U0k7H2sKPlNQj7QTX9y
	tkulMwtP/aYXhdQPGrB5BXd3V2hZxA1+2nneF9VrXOBHF2c7wjzvvxGKpYAXLmKV3o7XVcIzj/w
	Gq0rsUPdxerMaXsQCDU3O1TAaM62QeNHdBx695UQBGEaLaET0FgmLOTg4rdXy3wgOI5BOEu5fsw
	5yBg1U172M95TsP1vrs2JEMgoGF9+DhbKJi/Qb4XH6TZUGRc/Fm9SHdrH8/8kCOT1FkZrhZss+B
	9DReP3X2VaopQE8ikbnNzjKpMbAYDxE+oYCt0YIE9ZPxRZVwqlq3z+qUA9JgbmQLmYw=
X-Received: by 2002:ac8:5789:0:b0:4b2:d1c5:ee8 with SMTP id d75a77b69052e-4b31dccd8d7mr171353971cf.74.1756890039890;
        Wed, 03 Sep 2025 02:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG1UDc3HGeDuXiKdWk0dURpTABwshxbMsyQ9pUNYSRcUghr0tBI4RwEEBCyMHDrmUtaG/ajQ==
X-Received: by 2002:ac8:5789:0:b0:4b2:d1c5:ee8 with SMTP id d75a77b69052e-4b31dccd8d7mr171353561cf.74.1756890039313;
        Wed, 03 Sep 2025 02:00:39 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b940bbc0dsm75958965e9.2.2025.09.03.02.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:00:38 -0700 (PDT)
Message-ID: <e6ae9e25-1a92-412f-9916-4c92676b8c5f@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 10:00:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ASoC: dt-bindings: qcom: Add Glymur LPASS wsa and va
 macro codecs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250902140044.54508-5-srinivas.kandagatla@oss.qualcomm.com>
 <20250903-diligent-tunneling-angelfish-bae3b3@kuoka>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250903-diligent-tunneling-angelfish-bae3b3@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX29VZ767wC5cu
 49VCSPomjYT0q5NHBbG72fR/lNEheTmlfuHOpy7/6+6wvjpdtyiIxg1xSQxs5AXx6XjietsCpDW
 66P4feyTTl6Rm4TluUgt125AbdcxFaYJL453uQJcYa7bt4zAYaogIdohNAlKZu94Al0L4iv7iZx
 Cu669/NIA20HskBs5xyGk8xIncxoX9Y6xicP4VlnoliBqS/559pxyGK4oE/fgFLCQ5fvgkT7beR
 S84czzZlo8mSshA38OB2fXsAFUBYpkrpMQD3T2zhu0RXb8Tqqqf7Gvzd017nfFqbH7oQfhBFae3
 Q/KGNqubaL5MwYvceiwA7dzP7pFgNOHy5CHZ1aBL2OJROenRXE2HvuDoRcTzzO0ncUeajhPZ4bs
 lKOwnrN/
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b803b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=cQA_P7Yw0F7ou3pLjNcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wNRtYJeFNWQq7ZqXrIO3sDdmXZksrHUf
X-Proofpoint-GUID: wNRtYJeFNWQq7ZqXrIO3sDdmXZksrHUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031



On 9/3/25 8:57 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 02, 2025 at 03:00:42PM +0100, Srinivas Kandagatla wrote:
>> Document compatibles for Qualcomm Glymur SoC macro digital codecs
>> (VA and WSA), compatible with previous generation (SM8550 and SM8650).
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
>>  .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 +
>>  2 files changed, 2 insertions(+)
>>
> 
> What about tx and rx? Not yet ready?

Correct, I have not verified tx and rx yet on this platform which is why
I did not set the bindings for it yet.

TX and RX codecs are using SDCA so its possible that there might be some
delta here.


--srini
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 


