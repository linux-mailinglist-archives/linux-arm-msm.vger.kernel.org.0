Return-Path: <linux-arm-msm+bounces-83961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD456C9754B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 13:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E9D13A3AB7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 12:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14EA2D949E;
	Mon,  1 Dec 2025 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfSegWom";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgEzLYwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2549A30BB95
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592915; cv=none; b=Hd+xWAhFgQXI1nDtBz/U+JfLTvhO9FUlOpqduk6iJ2cFxKiJ/aTikXJWfJ8gXIBG29kBoCuenH+brOQOrZyepy2lrsRcO+GhdzohfkjuWZQbnJJU74yszg0Yp9kUcO5bV8aqwvreWI/XvljCa0ddWCpwt+g8ZUTLjZ8uuibOzmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592915; c=relaxed/simple;
	bh=fWDw6+qdb045VDfrfsusUVHCedGA4zHWbEtbTShoaas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWC4lo7ZJw2csS2YjvZ+y9DAy/cr0HkFbGOnCK4N/O1Bhuv7JxqwPABkXuUdLze36x98ZbJhJpbfRwLmPLYPOqPQEkVdZnqyKUzm9YHcnIKMSrQNVTnNlKBrD2VEgtBupvnrB6z10l+mX8wvz7o8VfIkogywSknUFmApIYdsWSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfSegWom; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgEzLYwx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18OTKj4060566
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 12:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	efxguySsNIbSl9hBDOqgLLXXN2ezOMoBT0kkasWh2J8=; b=XfSegWomeJRUX9WQ
	3PPNCaLGV3jSWO8NK7EO2iWSlknFhQppCPSDiRa6pCnTLSne43fCusrO4e9MqepB
	tV3JHigZkGZd5Xh7aAa9HflEpvNZSDw9RnFqvVcu//WxcfOKHsnUnRULEhvD74ow
	66HmB7spE0JdRn46sx6y6WL4mRX+mJpODykNBRALch2iQWN1lZ7+1WzyPnuKjcId
	t8si/APr84N86RmDVsQbZ9D970YeXiynm2RLowsQ9c82EM6OfuYqyGwJqqLd+Okb
	8mLxLOZdG39/UzOiRp93atJ7q1V6yT01hNhzEM4e9d0OrQxYoD8Br0l6gMkLF+JE
	0Tn4yg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7fwrqtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 12:41:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5e1fde1f025so413286137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 04:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764592912; x=1765197712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=efxguySsNIbSl9hBDOqgLLXXN2ezOMoBT0kkasWh2J8=;
        b=WgEzLYwxCukxibmcIAhvK7fFo/XMOuTT6l3MNBYMuH8UFCM4WyDXbJ+U33S5M+AQOo
         3hfkKevcHErN/MNVmye3rYiUY7ybJW9DdM3hCwftBgHzj52ul3NifeYh1o17sezEs+Zm
         7LWfjS4J9DyPPYPGCSqK1JiOaYK6WrUm7Pz/70TMS5Ygx9H0nwYhZIxCCEdZWBLfjfOc
         BubklvjQ/Xbs79eHLe/KRXfY2YvbHfQzpr9wx3FLbSxLREOZQ1rWyHlZSuC5gtCMxBn+
         MRrWOaxaJm7GpqfAPqaiIL7IYoeUoFu/IC6hc+Hvp/jgLFvCFmkuCYYaypn4fYM+S9AJ
         fDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764592912; x=1765197712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efxguySsNIbSl9hBDOqgLLXXN2ezOMoBT0kkasWh2J8=;
        b=WYd2powGgdlj/kTpSIdNBidfDK3Eab8ZjgkQ7ewtrIdTMeKOuGHC4mEtNJH+vXin7I
         ZnAmAOfEdsb7vRJa4OqVQZV6yyiMnZv61aR8+dR/hpe+WJQA69XIqo4T/hSu40inakBw
         oeUudu4v18SCReR03TTOSjTr4ulcIlqWujLm3APDTTNaNoNEbi9QyppIxWL1qh4N3jb1
         PNUYa7hFG+bAA8n2gBkdwvaETsXSIepv+gOwA8tyaJkqN7QHWdJSBT/RlsXgXlSviT+/
         Fo/7ELyiflLrSV3tfN3+yikge5onngAZAlh/j/Tkms6vI/35Y05HB9CyLwha23NlxyGR
         4Nbw==
X-Gm-Message-State: AOJu0Yx8+xKd9C1RGjeMcX6fGR6oD7Q+v1yKxw0h33zjySGisOw4pbcB
	rg7+KGBkAJf2N7rklzv59ei54JoDJ8sx2WloH1GnvhifjIMqw0P+U0Mh9HCFr7Y0KuaL0fJxf5b
	3d55IhFTfM8Q/PZVO1QO4Cx8uTEQZHugKY6njs6f6kKY/W0igxKtfpZM0v0ux7gW+mbYV
X-Gm-Gg: ASbGncvPQ/PER6SpXPGnRl1QZIcHOF3wbKoemODkQrBIiGUHdfQXQghOuL/kwyPxoHP
	gssxLJy8+l4hKjjnyJ0zbXY3LN2A3JSqERJM+1bSWi3xwHMOZBOO4VUjPf3AVw3RceIz2AcwvIw
	2cyAwLQEHEL1vKSJpC9bxkETl2v5jsTvHmWe1ngqlbUMpQLOPdRsqA2VUeLE0VGVqkqeLx103xt
	Q6LcmmnL9TYa6FfkHIUkZMOm9TRxHZB+DywaTTUuFroPYdZV0LyAf/bPrvYmCQa30sV0LXs1KR+
	X7d6n3zOH2n7fu6k7hsWQYWlSMOACYdARHoicJ5QTgyGjJGzlNRSO/APLLlwsXB6uuGho5xQCO3
	QNRlYlMIz8JK3kGR2bgpyIvmXOHCcBFd5TSz4oHvW5WVujCyIk+W7LmIaLZPHZNujlJY=
X-Received: by 2002:a05:6102:5089:b0:5df:aa2b:180d with SMTP id ada2fe7eead31-5e1dde61b92mr8252683137.0.1764592912422;
        Mon, 01 Dec 2025 04:41:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFew/hIB70b1KHsS/i5fEdNSchR06vLXyv46KJ/nhatuVYJMecxasmxd9pXWF4Ak6k3OjUlVw==
X-Received: by 2002:a05:6102:5089:b0:5df:aa2b:180d with SMTP id ada2fe7eead31-5e1dde61b92mr8252661137.0.1764592911790;
        Mon, 01 Dec 2025 04:41:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51a9819sm1235023266b.25.2025.12.01.04.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:41:51 -0800 (PST)
Message-ID: <adcac270-3668-4b17-b430-d67ef311dd7c@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:41:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: sdm845-lg-common: remove
 framebuffer reserved-mem
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-12-a5a60500b267@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-12-a5a60500b267@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX2kTbw7VtQ1yN
 axFkOfAH3NM/UEarNb4bmuFvt7hZd5xj64kS2GJsG8Xu8PIh5a3lm17ULQfeUV+0qGggieATnE2
 NuuaZMy5XsY8/Zv82q+Juu5gBv1Cl9TAg4TPbzLg1OcFvuijrN096BWpIjIOvPRjP2GPUrGudoZ
 VCFSqRQJ1nqecUh69GDX39QNfQiIQbhq/6bWQ4hFd3B7o4hHJaJnCHvAuXJByKW2XEB8sfiHu/J
 PMFSx5VFQLYYyy2D0OJj6KztTxeSX0R4JIGevuRPYH0Vk/o/oFySsf7M75yB2RpAsXnD+dTc7pg
 CXdUF1GqmOXGq4HVtdLWrnl1e6JemQjAIwC2wm9Iv+az+qbqtZooZ1pcvFJRnkdLrqPGrrvpB0B
 96BQpk8T36CCaxxt8R92GVssDcRWSg==
X-Authority-Analysis: v=2.4 cv=TbabdBQh c=1 sm=1 tr=0 ts=692d8d11 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Gbw9aFdXAAAA:8 a=9kGY3m0iPZF_axRxbP0A:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: DjyxXGJOf6PuuSjlNosgqDzxBwGtTAOm
X-Proofpoint-GUID: DjyxXGJOf6PuuSjlNosgqDzxBwGtTAOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010103

On 11/25/25 9:12 AM, Paul Sajna wrote:
> It causes this warning
> 
> [ 0.000000] OF: reserved mem: OVERLAP DETECTED!
> framebuffer@9d400000
> (0x000000009d400000--0x000000009f800000) overlaps with
> memory@9d400000 (0x000000009d400000--0x000000009f800000)
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

It's defined for both devices that include this dtsi.. perhaps you
could remove it from there

Konrad

