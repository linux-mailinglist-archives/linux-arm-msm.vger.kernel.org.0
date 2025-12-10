Return-Path: <linux-arm-msm+bounces-84883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE5CB2216
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 08:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB78A30072BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 07:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F552222AC;
	Wed, 10 Dec 2025 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUPv0jtC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HrioXzWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37204244694
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 07:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765350017; cv=none; b=txmYte4K3t2VJKIoyops48w5aXtxDFwrB0KtR6LhOWKzJeiJztL45ps3Tp3bJCB1h/UbzLcYgwTF37HxgNyure8w8dS46Xz6St+Pfb4QaTRVQ6qZXgv7+aGsA7Q9KtpLbEo0a/pWr3nlc3lmVgxaOr7vZZUE5b8u/kD15b2B5TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765350017; c=relaxed/simple;
	bh=rUmcIlJPM8NvWL3GHufkoMzIIX7U/SolxSRdXeA4icI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7N1OKwvVdP88DNlaBM+xrs/5iIuSwi2CiSsHgbzxr51Ce1AiVSgwkdtM1qw+RhQ2bfIFgOgBavYhPrqKe3HXjaP2lyyv8BrI8ErlS7wmn/HftumszWIsH2RvaHkVXR4GBLm8zasmQ3+b41qWmqhmnwLR/p2WdEGrmbQSXezogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUPv0jtC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HrioXzWE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6Do6o1953999
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 07:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXXmJgIAlrzTswFyFBD/MVsLVO8F+Y/m0cm8jzVc/lw=; b=XUPv0jtCs4KX7TBO
	5cYJgr4sw9J5U4//NDv6y7buEEi1zkCZSq/Hl4KEuDhH/qEuQdKXcua0zujMl2Kd
	/zaH8RXUfUfgkIEpBQiHZuT8WmE/v6i+Och37c28iepFzo8ITAdbyMwnliBZAORJ
	5b7et8FDsU6GpXnoSPbh24o0r8bhDg8Ju1+EK1gxrcs96UZKEE/ILz8SEEQkE+n7
	aNs8ZjSaITSBy3Wpin3CQuHnWVFd3F8MUW4m0UJe6TDrt8c0X9fbbonokPVrAm1D
	5l7v8TkX+4MLYjNZNeNkvGfBT+p1XysQEUBi3a2MZqKQnh67tEAKYXQyvsARJIYu
	5fhbuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p2rnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 07:00:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3438744f12fso16948008a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765350013; x=1765954813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXXmJgIAlrzTswFyFBD/MVsLVO8F+Y/m0cm8jzVc/lw=;
        b=HrioXzWEy3H9zl6mD7yg1vCWayPN9trHQ8ntUXZBTRkZw4SPT+bMvyiPRD2mbJZaVN
         9QyLfSFb9x7pLPKO8wb1S6P58tzIEOZxWyBCOC7VxCntd3su7CRkK2f2c3uMmfupzItq
         D5mVE5XnVcNDTMjJVNzI8ag8Lhk5ul+jZwZGXnbdaNKsrFU1VyTJDhyOuVsnWVbmZ4Oc
         hCdKZ6cXjfI4heorD4XqF1Nf94W57QWf1AVFwFRPQ7B3o3ADjXMic62xKczFTtubGDxq
         uPZTiSmMVT1/eCGgdpdNqgxpvt3emJiyIlcPOWAPdIFGLuBGbiE4gqDRFVOWQZVAakbn
         WoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765350013; x=1765954813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXXmJgIAlrzTswFyFBD/MVsLVO8F+Y/m0cm8jzVc/lw=;
        b=jHSFh+9BGhgbtwHcdlicMX3JkMn97IqSazdOINERqz/rNL3TrFcFVHP5PDij6kKzak
         GIJgIUlkw9n0dTpwq+zO366bhInjOG2y3X1UQ/fg+QKD2LG7m8zsxTmhu8cyyrwuwMGb
         /GrUSyBwSZygV7xRbadcXRkp71gFH1Egx3JQ0j8nHfCbfy9DxzfWlj/dTp510A1HEV3U
         6ahsueWxfzfWseiLNyR9b47MiemH+81avmQxAuPlRKbWDDuFL1HmnI9gmtpMpClGyF4b
         BW1v9RsQToB/Gx+Gu+1vCqyLTbLJK8WJEESX71L4Q5o8ovmxOcTy/sHvQBWRg25blns+
         O4NQ==
X-Gm-Message-State: AOJu0YwoDKKqXADUFm0TbHPU2w1N+O5FfJG19pRLsJmHIiKfHoCFpaPh
	j1JiXn0mGzxPcqNwalY8UCecPhO8qWai6oHq/UKhpBo1flPgY8vGnj4II5sbUZrZRZ+eRtZX+So
	MfySTUNUVtATS0gIqxZSBOWS78W9iUxtF5EO8+lU/Q8UOKZ6+TfhjCgXLZGr2SPBCBB4s
X-Gm-Gg: ASbGnctfnCT6WdcrS4/X5HsAp84YCM8izsD/ML3su7i4oMyT8u8l+xF8/gTuhZcxKRy
	6bXf5B6d9gofT1S+hlJfoPWAPxVyYqWyty4amDUVoW1FTUZGMWBZCAV3Cczv5KTOiPRPeMRTDH6
	lr1XdIg/M1rnwkFuUOPvr9vQdopATlcksS0BqZ+htIeswTQ21EzLF8OFCTiqQ/rIkJjfCo07dkr
	BYlBFj1axCGmAjhz0LJC5BLSmnIh02kVNQFTH/VzGXrL9L7rXkfxrFAunv43IZXLXq9Es7U+DSJ
	GVHget0aELDGm/D+wD6say6dYlMVs7hyOmsof8rgEZeAKLVzegc2h1qapsAYkjjQsjhrqfrm1j0
	UAP1RL7VBxiG5alTJAftA1hZAUHgUNsQQzEHC/8c=
X-Received: by 2002:a05:6a20:9148:b0:366:14b0:1a32 with SMTP id adf61e73a8af0-366e2eb8437mr1455323637.64.1765350012879;
        Tue, 09 Dec 2025 23:00:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWagaxJnC96AYCNL0/D8CTLUP5DQ6UVBIWEeINoy2090Julw4wBdbucvsVEIc65wrN36wFRw==
X-Received: by 2002:a05:6a20:9148:b0:366:14b0:1a32 with SMTP id adf61e73a8af0-366e2eb8437mr1455284637.64.1765350012439;
        Tue, 09 Dec 2025 23:00:12 -0800 (PST)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a2d19492sm16643326a12.31.2025.12.09.23.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 23:00:11 -0800 (PST)
Message-ID: <e4a7b827-9687-4952-9625-16df3a2bdb8a@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 12:30:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: qcom,prng: document x1e80100
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20251210-trng_dt_binding_x1e80100-v2-0-f678c6a44083@oss.qualcomm.com>
 <20251210-trng_dt_binding_x1e80100-v2-1-f678c6a44083@oss.qualcomm.com>
 <bd5e550a-bd31-4785-ae95-f14b28c6ff7f@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <bd5e550a-bd31-4785-ae95-f14b28c6ff7f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zuyh8ZxZVGMGpxjQDdqQeA9VfqluccbI
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=69391a7e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LOCgFY8hBHcYmJJ69lAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1OSBTYWx0ZWRfX42d5mkp+P1q1
 PcXeH/VnF5Y0OebafTsAg15NhSEMmerd8+AV5yWzhzTc66gsJYBwena5s9bX72kaL/Xma144sEY
 wNFMROhhmziXDxs2amebUsqqf0IMR0I4rSCwMCqAQDSYZBfyaNQ2onBMS5vLjdyvIU7qvpKFDnT
 4kwINELGZn0yfTfE65w6UJxIJUyT45gyhsdnekGoGCwNHthPnf43S3JNUSv2mLexB1supyFRmct
 LFYYk47oInE7yzvoENZcBgJVnDE2zvPuvA2Ad23mQ+EcDsRqXXOUjtrwvy+q2tpzDIJJqZOquea
 bxFi/IlOktMCs9wYFEb+9H8jERDjOSgr5K3Vj/LmeJzwHytbYdUV8if1QrVgxkp9/RVPO75xnz2
 Wx/Yw+tVlzeU4ivbDJ+herSZ/3mOhg==
X-Proofpoint-GUID: zuyh8ZxZVGMGpxjQDdqQeA9VfqluccbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100059



On 12/10/2025 11:14 AM, Krzysztof Kozlowski wrote:
> On 10/12/2025 06:36, Harshal Dev wrote:
>> Document x1e80100 compatible for the True Random Number Generator.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> 
> 
> How did you test a binding? To remind - kernel tools and make is not
> testing.
> 

Thanks Krzysztof, looks like b4 tool just auto-copied the tag to all patch-sets.
I'll remove it since there is no real 'test' for a DT binding.

Regards,
Harshal

> Best regards,
> Krzysztof


