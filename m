Return-Path: <linux-arm-msm+bounces-82971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7426C7D17C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 14:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 72F26353654
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 13:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFD0223DF6;
	Sat, 22 Nov 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="huLfRaLt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQTWoA5u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D98199931
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817978; cv=none; b=uFR0fETWTogfm8o4I3k9fUkA6he5x42uqyaJVUAxuE42jSDy0witFdWm2V4j05HjqscWv2G6uriKvnwVYit6aSNM6RynN1VAeN/MKwQ6QjCLkus52HirED1NT4vDBK4uHMy8oQC2fDMP0M7jqZZwK7CXkn1NKv8VGIx0tp4iSlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817978; c=relaxed/simple;
	bh=YkyIFKvR+hRerJW1xXovOJfrCvBuN6M5sQz+0HIfP4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/fkLpQeZqK5cLtNljk2DweEQj1p3zN0sAKYyrcxbkvPf+oQLjFQf3XI5FZOdPltPztZu9w9ZfSkn8ulgoNmjgwGURlzAWOsHNlzU5Aka2V67GWWKB54RKIE4r7MxjLBUEW8nF4iKrGH1bF9xAa4ML4x0kJ0lh2KFE59DlsdGp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=huLfRaLt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQTWoA5u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AMCd9XE2607428
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p816i1l2ZUk+XpL8HTMV728bxJNiG/n+hICNaw4PPk4=; b=huLfRaLtCRg3wG5i
	9Jz6fXdrwLCSsGeNh/djN062Os8Cw117+qSRGjvkb2tmDKPbuwMDABxuBqUCwGY1
	MWYh68Z0tHsspNbr9d0Is5h3G3EzIBDg+d3O2KolmRv+JlASsmrL3uf16xzK5w9p
	ok28lGtmSCNMbYpcRDnTYJtR9OOwM8zX+ocJ18isrNg7NDVL/ZP26uTiObQHDHMZ
	2AwSWUqQPYwOfK0I56OoQoPIbhdiPMA03vzBVmkeIV7Tk1h/ZfbwrjKdkFW+XqNr
	l2p029gfDWlKkz0TRzhAifTMtC2Ac8x6mnHm5D8tkvmWDCni8qYVEsL/Aou7UJnZ
	I6Gw/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak685rqnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:26:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee05927183so6116971cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 05:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763817974; x=1764422774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p816i1l2ZUk+XpL8HTMV728bxJNiG/n+hICNaw4PPk4=;
        b=LQTWoA5uba43iAeKVzI5qRnffWA3vgfBu48KCdE0xaruxc18sOi1fG7Otv1w2IbSjX
         GSs+oo3lwnYN9R9JoeSAi1kaCCSra6353auSQplfAlL8FfF6gM2f7BANOi9HHC9pBc5S
         W6j1b9YMIDvpSWUtOfLeYAqBM26jCxNr+XqbDZ/8mLuyVr2032bgplN17WkXIqcZjMi+
         TIwcrWn3xmJJH2k1Dru3/Ys4nIp/2OFuyJDsctozsJicijqktaYWrsKjbaHUjZSEx5ri
         pK5tCl+ys16TO0H00HSWzc+uXCFctyzwNcJ6IHi+SAwXXJQ5dwwIdtAWpRquUiftpVEM
         0qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763817974; x=1764422774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p816i1l2ZUk+XpL8HTMV728bxJNiG/n+hICNaw4PPk4=;
        b=sVk7DIdQH7SlSbdV7x9HEw5STFaSiUJMypugwnAhOWbl1EzAtGGlHFMzfhvfNXG6JA
         Ep3+L8+APnNWIsSiqjqwDPKj99TxSHkDsFK/RuQtvlXkHEl6DY+LOLQ6nO93X84POBpz
         mqUBvbJawHbZUwlYFJZ9aL/iB8IoluinkAFNd3mlFIXFSnA9J619xSoEPQxNzDsjZxu+
         uj9QCIFdFUa8+b6yFSr0HOo1545UjAnufro7wQObDCbjYAklFU/TK0N30Mo1JfgcirKk
         rVVCJ3sovXtlYA+Tu9vCpB1GEMxAObTrRWlmiRUUrlhXOWhjXDHuyZOWFvKq3f/3RTDn
         rhkQ==
X-Gm-Message-State: AOJu0Ywq6rzoB5KWEf0Bti+Q7NUwRxhelCHg1qFvzT46BP4Kez4sp7Iz
	haUiWGvUw8F6d1akltROMTVGPKtRv3oDYTuwAPiruvF9/azdXVGNeT2ZYClWdJLC5lCC5IQ5IrY
	qpbDmUMpCCwNAmyNW1RGWjcM2+3HO9GGzfbOLX9y4ZdHEwQrYVaM0qf6/qZUGnTKKz59W
X-Gm-Gg: ASbGncs5OGGxg6goTbVftmxA4tLHo+r9EfsmGdb6+g2sKnD9wvfQQACdnZVMJ52FUSF
	hmbNHbBpKciAApTmijSBek5Zb+na6xkwazV1xry8Z+UjjTjYUcwPMhb3Tt+OgHhu3dgUm4Sr6Ql
	Cz/mh1r13jiXWCvT6GHP69ojx9EjEnH91lKsuMQ7Bd2kAiZEuKE6b8iMdlDzEFHSxZTks4Ebfaj
	l1NxIq5NqAZdXKM3ZtF934ykfsiLIXSv+9pez4+bGi4HDq/3O+tiJqFLhqM7AhL0mok0y4Am/RT
	hbpqkY7mfUwzIxNFcKqyZ0WRGx16Tsi2gn+6xFB3S6VVOA6J040Kgt7FaVb0c1520Rb/y2mw/Nz
	F94/jVcbR+HMJZISQ5pLH/QzJ2VI/IThfg31RPpF3v465P3XuduILK90ipQDdtEHDweU=
X-Received: by 2002:a05:622a:1306:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee5b857d6amr46533781cf.11.1763817973716;
        Sat, 22 Nov 2025 05:26:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBwKWs6nvulDhBOSmKaGQR0LDQ9X8bhB7WLU/5pQciACkOc9xbwVxBLOHfNzYoih13QUt6sA==
X-Received: by 2002:a05:622a:1306:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee5b857d6amr46533491cf.11.1763817973128;
        Sat, 22 Nov 2025 05:26:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43e2sm718730566b.39.2025.11.22.05.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 05:26:12 -0800 (PST)
Message-ID: <bb816e13-23b1-4a2d-a384-84efaa3fd575@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:26:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/a2xx: fix pixel shader start on A225
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
 <20251121-a225-v1-1-a1bab651d186@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-1-a1bab651d186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Woom8Nfv c=1 sm=1 tr=0 ts=6921b9f6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=u8D1gFNLbthjCoXLUvsA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: WkHqQElgsq8MmzTjG1HJLe8z1txKjaVY
X-Proofpoint-ORIG-GUID: WkHqQElgsq8MmzTjG1HJLe8z1txKjaVY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDEwOSBTYWx0ZWRfX1tBAkaQunhgh
 ZUVISOv2Wp4M//2MF7XnwzBU8jBkNBkyu2+REHWO4EDdoGFaD8gR9TummzPj9xw35aX9DfSFuZz
 NJxsINlGEdpiWQgScIAQG10oVQd7Fj5Brp1PSPNXwNfyNcy+fMQlC51ab9r2PJL9FZUuRdeChh1
 0V7bBTcNbhyOiRwUoC9qSrXG5CxkSQRFjhNH69ZvGlxGlficwQX46VMFRRbDW3WjtqnUx1K1Iz6
 k/jVdhw7rPhvXcMPNSLO6zrVWgIWBJeSZ1fa6PYtXbjn8JFLpYtzoW438Iuu7KIR7Oxe///+b0p
 NjKUBsShLk+ItB6Bj2FVjorc/90OOQ43/6O1fjEeZjZwOlhEce5QirGhaxYYae3RNxSvR6oc95n
 RFn5+aQoGhekMevxvP5h8/FTn41pPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220109

On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
> A225 has a different PixelShader start address, write correct address
> while initializing GPU.
> 
> Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

