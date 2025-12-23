Return-Path: <linux-arm-msm+bounces-86388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6105CDA15F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B842C3002FC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC514330D5D;
	Tue, 23 Dec 2025 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkMZFz6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDj9WU/C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7480F3002A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766510502; cv=none; b=YU9vjfvVdFFdyTECOemXzDmJY6po81g7cq/YwKCllgfzd4ZtHV1/yI7oqHVNTnWsO7v+igLJ7BFHk825U1AojbzAJLno5EoNGQwNvZKRkGgZb0CHh9CmvTzM2ELeIth4tzqS1RC0gCkmYPdlWWjqlHq3shQYGemIp6gKrs6GngE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766510502; c=relaxed/simple;
	bh=CoMoEecSSBERhrqvr1ZygzBkaq182DqR/svbL54/b9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kHWcTU2uJRIa/QpkHu36IfKSSK6yy5OqX+SvN1MWy27Jx3bbNZXfXIJIN3we05+kdzEIq3VIqLXuyn9gACHhMQTwfHBKbeO4yeRGWglkSXD+i639v+XbYfRMpxusaIH3859QBeFgLb7x7uBe5y50SLFnY0ZsBVEOjCH7lfCoamw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkMZFz6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDj9WU/C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNAwtIn1357349
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yvRjTU+PmPNvgLfcc4mS+/mO6tgUa8Oejx14Y3nmC0M=; b=GkMZFz6nu35MhaS2
	1mUBMTYdFQthDa+5yC9qoqKoHcH/F01aYkV2DhyeTZTQGL0D01DknpBkkig/GSS0
	2omgdTWcYBVmAwH4xfgLo9IkX+xjXroOM0LisayXx2FXB19k1SoW6EpBdnWeGsWH
	CasQA15XFUc93IyERcaMqVHxC70sCDv5OXVtlKWgVL9dRl0ebRHBvByY+XiWGdU2
	AkSjiguF6KllelqNfYHRiRhbhbbXSaikK2m0U69o1M6kPWNcwZZN0EmyX4LNkTOb
	ZpTNvlOW86zH4ek5TSX0MhuzlgwUtEmExCGFcqwVowrnfQNF4u97Mahd/IU3WSK9
	7MOfZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc41kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:21:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f34c24e2cbso16535621cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766510499; x=1767115299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yvRjTU+PmPNvgLfcc4mS+/mO6tgUa8Oejx14Y3nmC0M=;
        b=KDj9WU/CqjOw9uiSUGOOqCzNmRKuhRvJ/CO56eL4yPRnIlSruuEb8WUty1L7BXpRwG
         QePITf6/9UZIqqHQtNlIteOkvxfe4mPJnnqSxPhyza7KnHV0z+w1o30h6Wb9NvvrcoB2
         UiArdqHcb8mjboEvDqqiuwFQf/aRhdoYZeztXYDRbN+b95/L34pMOz5HT5oeqSngOUms
         yGtMOhBoUQ+5Tje+B99KwymlEscu8ocpKMZmgRRnHftCYkSiKpHdwHD6RkBCZXIwc6Ar
         B2ZZ1y+wU8iijDXve8cr4W8SBAsujArPDifTj+l0sREKEecagKMlFSgJef03ljTkvXIy
         l2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766510499; x=1767115299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvRjTU+PmPNvgLfcc4mS+/mO6tgUa8Oejx14Y3nmC0M=;
        b=PZaZZ3xoU1qTorutMQ3McBF1Lf5hWJSKdJJWx+wP2l/BhnPu1Mr7foiPdI7JxEVWMU
         0TmkV8HX0ZOYJ2pR8aPVdOoOJKGWsJ0HwOTbexj3A22w+z8+LFxpuBewhz9EX9wHS2Aj
         DDq4gLHrbwWiLtRd7K1KlDtOG8uJEVBi3raR0S7OMaPRyiHMtELMqRg6S0jd7YVfwaXC
         HPAUprRzOdv08cUKAnFzih+ZHa7cOOTy32z+CIRKfA48iGZMnEas+jAp35IiHL6cOCHf
         Qj+PB64CpZUrl/tOqLm5qPDHn1exzNLtqrxXZ6+MuAHbnfJEE96VJ7SaQOu8DjdGdmgt
         PKog==
X-Forwarded-Encrypted: i=1; AJvYcCWfvyFRTCX+EwX+QLe6DFwM8GBFIXhPTYhDOOl6pnjv+xudaUcyElcFzUMIbeVHiNaAW60V6SK4vV4h84SR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzts+KT4YiJAOp2kXRhGG8Awr6Npu072gVACHSG7znEdk1Zezi2
	bdTmGv3GZR7ucYdJbco6Ng/VpkZBnn4h98DHjHorY30vaZ3fl/8sjj3x0Mg8mvKa/5sU/BUZayN
	dII+YumUTueAAiB9kArWZgjLg9THuESGrJt1WUTwJd6XQ2Y01yx6wopZnL9PtND1epRsE
X-Gm-Gg: AY/fxX6dxU5sZY3vArz3sUavhynI5hHjpVdfPmymP+UZM+5GvfHFj3BzsJiS4hg1zfj
	Z8Yy7DeS7tokD+RynsF+e4LZOq6MQ02do9TZvAdlMFG/0T6GgCoeNLNlp49rjW7fXNQKjJPscy0
	c4CfRPl9uyxoM7hvvXxgq3clquUIfuUHqsPFtldlfhFadFqZIQqirjWQXmmvQbH5oLbogst44aA
	69Rsg5m6EG/2akT1HZPj8jwOB3em1DdZGx/WpU++5fvUkiIUD4Sm/fmnvJ6VJ8l97p+Uu92ms1T
	7gNlaY0Y3qcLrQqTm5+FbZhrrp3VvHQvpsqMAHHTHLufn7N47foFURisiIRQv5s6HqVAztNhJ9r
	Opn9IpfnuakBNznk2VlMxD9b6M6u9y9EFBx99+dtjrcbCaLy/ZRL4wIsTkFxtw7CHHw==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f4abccd72amr177113121cf.2.1766510498533;
        Tue, 23 Dec 2025 09:21:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmOv+fVOW9+roCPKFaOZUgXIpfrUAKVE9KKLB6DNuPSBXgkQryav5jdygB2izS64TY8jES8Q==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f4abccd72amr177112591cf.2.1766510497897;
        Tue, 23 Dec 2025 09:21:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b82e7sm15320088a12.35.2025.12.23.09.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:21:37 -0800 (PST)
Message-ID: <cd342f94-8dd4-4a6e-8afa-99be22e9a420@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 18:21:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Use hyphen in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223152559.155703-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251223152559.155703-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WfqLAfo3nUsOUUCbX17QWwPaJm0qvu7Y
X-Proofpoint-ORIG-GUID: WfqLAfo3nUsOUUCbX17QWwPaJm0qvu7Y
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694acfa3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cxglbGFaQTsLusRpAB8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0NCBTYWx0ZWRfX8FVFNNIWuzuC
 0BjaMlEryRpXQQcaDkwtPqhdjHOEL66axHyQ1xBuIThbTL5ctKClV3uT1MbGtKIFAdQzXOMPVOQ
 2IC+iYyXUidB6ZufwGjlSyAyL0dB+o6bvJfeB+UlJIyCY+53ozR0ul5zlDg5/v9Mw5XxzrhzzTD
 FIpRz/bEKEkrUu0nGPYtLLJm6W4rBvxkxBGAoE+rnEynuOI1LTVk4N7kqTdsW4sNk6fR2w+pd8G
 IDsbUSUo6Tp6DZF91JIRLNJ+y22Sk3Y6Z04OQvUeUSRsOICoaIzYsltLyIHy8LtBqjqM3KynikI
 gj8rsIUi3sCov5vkvjxyHQrbbui4U12k8OSq8rS0HWvsJCTWhkWOBKCLmlkRMuk3JAqole4ZHp0
 pRjDkhsZiIeppWuWzrxZGtvp8uipITUqEwR74YobKUedCFEbueY6guduFH1VhpXCVb1H+dfrSf0
 ZsD/TMN2VvHABumr/Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230144

On 12/23/25 4:26 PM, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Patches done with sed.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

