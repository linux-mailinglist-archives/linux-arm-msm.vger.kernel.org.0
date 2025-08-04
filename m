Return-Path: <linux-arm-msm+bounces-67712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25552B1A920
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 20:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD428620600
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 18:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53CB21D5BC;
	Mon,  4 Aug 2025 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sxb6XvFN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65555217F33
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 18:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754331753; cv=none; b=aW2HQnXgwmoc2C/an1TzwRlA5kiMDiZlm/bMSYaDHuEhVrcAU58cKKT2/kL7EZrGAmcO4Hzku4KWFqu6T4/R4UZkKIL+6Dcph/SYE80pmEtiBYD8USN7C6jDBCYo/cMMGiF+vqdSlWWRHzD6LNuEHtkFC1oMim05wSbXRWDCEwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754331753; c=relaxed/simple;
	bh=JKj8bw+mKnuVFjEQ11Gaa2fcA7Zn2gHsTNk2HvijlVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjsleY9/APRIYtHBl0LcEQCZFJKAj7LtNSS6Pg21/xRJyz8sHwHj8y0HHZNQKb5biMg7Xbd1LOTsMcBnWSQTvvu+nwm/FjFRwODzN3GxeYk9QKeJSKY7x5rCrCfeKTOeGLuE4xZTHa5dnbW3bmSWIYpxSEWT2qrv5Y4IbCw+k9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sxb6XvFN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574HVpHP019447
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 18:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9FsS+VbJFYkkKuzM+RPQd9H0jMOTQpUPWeQTeryYYo=; b=Sxb6XvFNA+/08g1K
	pA8/1ZpKlwgZzqRYuem/Tx9nK9LnrBMPukx4OUZMhi7RiWmMCcahD56cAkVdQNRe
	FrcN/OBWAACmxKx/RYtzNKaxpOcH+354owz2QytcgJ8HUt4RC9b73hf871s5AwZG
	+4sLYp+h6zdQa2/81ISoNflqURekvSvGcNUsq0byz63vnKl1lquAoGHLeq09zmeZ
	rA2Ck/eEFgJWtvAi+Go6MZU0N6ZxLm/f+ps3xnj0lZihzg5blwmDBNBFYLNLnXz3
	dso0z/wXyCdapE95KXTwiKNkuBZ8w98DzARmDX+nnmT5797fEIcJ0lxDo09WhlGZ
	GpuLCg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek5wpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 18:22:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31eaca81eecso1344226a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 11:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754331751; x=1754936551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9FsS+VbJFYkkKuzM+RPQd9H0jMOTQpUPWeQTeryYYo=;
        b=i9tNbN7oZ/KkC0/MH597UhqHRilVN+Wy9vXl25WEbQYq6YwhmOCn6oJAlEN8fmDeqW
         2k5oN+ySWzr6+ZjdBLKgl5fgDyAlkLxGJHKHYX6M6ZN6JDXhcrEUvQTIWkVNm007K5N8
         tPcNrn74SuwsJtSrFWKuCOoFlu2Q436wQfhx+U96/2wHdtB3BfzdOQtK1jW0YpRTsMe+
         HsoWqUmtwcGT/Pj1nhR3mphlFhiH/p2RzXmeiiofJElL39jXMADFIMAfB7YgOg4EvgRZ
         oOkD+ja/7mCh9b21GlP5i+d01KgasIltnwopjjXRI3mZc68JogGGBR7t6Gg2d/W2yajU
         PO7Q==
X-Gm-Message-State: AOJu0YwJ7ixBsd+epy5gD4ThB86lKCrf8bY1VInJJtbzzYro+fFZdGk/
	nx8j3SZYn0n8g1BVsLtYRPWmMg5RclzeWssoVqOzpoiMrlyskElMIttVZusp4wopLgXGO1loXq6
	jiw0RwCj6kvB/pwJpSWDUj31lh1E2h2DIpR80Ruc8uFA80MtAoCNDHl/LMvD4w+Y3IteV
X-Gm-Gg: ASbGnctjm6TPWkKk0DFgZefnQhvksJ3VOH9rjPPC6n/9ww6cbdsDVc+L5mQbRe8SCh8
	nq+ryHowF36dhdtkdoJq+amAOOGDzTCTqRUehOL0GP6Mk9Y7vQDwfg3teSr41wz5LSs0EIfMv2u
	/uED/qc3T3FHV2i63+vnmIzPULzNxTzupkxHIuZmw4qLRFQ5++3+isyysUIlH4e0iV3azxdh/cT
	gSqa8p18Gwp+/xrSpQwKIPTEgbf+FHM7fXousVbqUWwk6s8h2ZWkKjRnmQDdMkTOsddlAlDgsUZ
	kusrvAIBxsRV7WB1IJI/RYZA7dE83ZpN2D/R10cbgncjHGUlkZvKBuna4fU+/ZU/E4c9xUd13pu
	gllLpKHMbksIbSHG8vtja/j5LzoFQXZgY
X-Received: by 2002:a17:90b:288e:b0:321:29c4:e7c3 with SMTP id 98e67ed59e1d1-32129c4e9damr3646472a91.3.1754331750823;
        Mon, 04 Aug 2025 11:22:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOU5OWHfOG0dmrlXfJFHVqdV/tQ6gpchrrrTUErDtERSvZxHbDFE9M+eso01gEc1fOlfScHA==
X-Received: by 2002:a17:90b:288e:b0:321:29c4:e7c3 with SMTP id 98e67ed59e1d1-32129c4e9damr3646460a91.3.1754331750334;
        Mon, 04 Aug 2025 11:22:30 -0700 (PDT)
Received: from ?IPV6:2401:4900:1cb5:a9d1:15b3:77df:1800:1497? ([2401:4900:1cb5:a9d1:15b3:77df:1800:1497])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da57b4sm15254085a91.5.2025.08.04.11.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 11:22:30 -0700 (PDT)
Message-ID: <ba553cec-8004-459f-aec7-f9a800342434@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 23:52:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: arm: qcom: Add bindings for Monaco
 EVK
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250801163607.1464037-1-umang.chheda@oss.qualcomm.com>
 <20250801163607.1464037-2-umang.chheda@oss.qualcomm.com>
 <267b2d6c-468d-4bff-ac06-c6755706a398@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <267b2d6c-468d-4bff-ac06-c6755706a398@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=6890fa67 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=JcbvZcPrJRGWfMKQDdsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEwNCBTYWx0ZWRfX6zq+L8S4iGWS
 t8IitEIgY7VSQZWAbGuuRLg77XAch+zCPXsB6sztrN7pwERS30dSNCtlKf5tNYxCxtpNpYKhq3o
 Kg4HI+u5PfXp9GtGRGmLrkuq9He4Dbuu5XTBqF/4SD3xtfqkZa/jgCIf6/Tdu7H4eapu/2Qc8n7
 k1Uq/6Qhd/+C0/2YaMXbQmWbJAii3NuhAQmB5nmozi8M9nf6LKWHPJT/pJwzyBOYvl/lNjvnPzd
 BLSKeBRR2xY7b2iA/IvlnCcKJRN2WwQrQ8gE3sCjuu6xPY8sGcagdUSxciB2Aqrr85JrsCzl31E
 U9NI6LEeY7LuE/SmY/wtaoFloOZ9fV3+iYd0quEXeR2TXsxHNHPMDl3bLwjrsPEXsBK2SSOjuyb
 yP0G5RllJQozoBQmiCnXYQtecQrPwPeBJgQVjz/vO8pIFW17wZEH7EnA7DVt4pAvqMRpbxFf
X-Proofpoint-ORIG-GUID: ZR8hE8tRW3bcBHa-ykWohC-bw2IanMjA
X-Proofpoint-GUID: ZR8hE8tRW3bcBHa-ykWohC-bw2IanMjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_08,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040104

Hi Krzysztof,

On 8/2/2025 1:16 PM, Krzysztof Kozlowski wrote:
> On 01/08/2025 18:36, Umang Chheda wrote:
>> From: Umang Chheda <uchheda.chheda@oss.qualcomm.com>
>>
>> Introduce new bindings for the Monaco Evaluation Kit (EVK),
>> an IoT board based on the QCS8300 SoC.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
> 
> This is v2, so where is any changelog?
I have added the changelog in cover letter, But seems I missed
to add it more elaborately and in proper format. Apologize for
the churn will make sure to take care of this in subsequent patches.

> 
> 
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
Ack, will take care of this in subsequent patches.

> Best regards,
> Krzysztof

Thanks,
Umang


