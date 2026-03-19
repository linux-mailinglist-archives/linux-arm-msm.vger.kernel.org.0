Return-Path: <linux-arm-msm+bounces-98702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEPjAHrMu2mXogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:14:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3132C9510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8CC73013D6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BA33BA236;
	Thu, 19 Mar 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qq1aFvM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z67Vvhda"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F39379999
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773915087; cv=none; b=td5aF9r3m0g2q+ecJucai2uOwN7iutET7NllBeAXWWIn22FiuEqX7/0w+OZqxvw7EZjYkyxFkc+M+tGMWw3OKC7CrMyigrP8U4V0HFml9Jh084yZD3PhJ5TJTaLvw1k/ShYCnIa9vQvQOrZwlvfEZkpeUvhWFb1SwBuOAA+OfPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773915087; c=relaxed/simple;
	bh=XOZUY27ypCNr0S+rMw9sTrGvwCbDrhILYX6co7i+zrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRzP1svYq9s7hH3Vj7pvX538hTwE+ihzhbanZMwSMubd/xkifOTokYIPzGPs/GqzCk7bsmqKmuG5oQKTzQxlC5in+IjsZFtCKIK0W8RQC1XvQFnuCRYZnLwjNXHRJAA0pZ5sekZdtksABoL0iOsnyLBeS5JOnb0Zk1R3xcBDoqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qq1aFvM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z67Vvhda; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J741IQ770582
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEUcGY3f4Gqjgww8Sex94zRcZTYG2w9tuzC3vEsk9pU=; b=Qq1aFvM514N/5omp
	MeOX0WZX7jktngiWpDBBdMivzRD/jxJFe71DEaEnlXDmVqdlJPoRqMcCizM8keOX
	iDRqbR6dS/l7EkAfdVTV2Di6x7ZZjXraKHTvhLJV71Hu9gdKv1kSyoYL8EX6+dJV
	PEBuL9+BbtSdWd2iHtN9rV+24hKz3BDbALbRijKL/WyMMhK1HOwsGdBujL0nCaSz
	5pjyMy2uCLR/IjwO5cUyYV8PvTNuleaAomGErNrXGMwQ5I3fFQefjm8iL8cttFgB
	CnSH0dPeoFr1tM8FFF9wMGQsHI32UmUZsvj3UsFZzOOc4zEuvnYpKUhaYMeIc8uC
	glXuRA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00egas4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:11:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c471045c9so6045236d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773915084; x=1774519884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEUcGY3f4Gqjgww8Sex94zRcZTYG2w9tuzC3vEsk9pU=;
        b=Z67VvhdasgU/aROjG1wgxkUJEBf2Ylc+nAr2Fh7sFNbQ28QbwIg7BxMztBCCKvklfU
         JftSF8ID1lYRvZBPLL/gmrKLKxrDb6Pkx4YznobWaoUKE8mmW02ewbjrmwWOa1gO8IMt
         qhBLaXlvdMLJwwTa6aFjR0VpfRaTyxvHHVw/hAKQTEPXmuuVG1QqkTkuBRqTDTItneQy
         3aAklQOwVgRnQaI/WR0YvEPMelyg9YzuXxwLKHfYz2AlDQCp2CK8N/j9/oe4okffasDB
         /J+hGcroDOs5JdSeIB/hk6sAXsZzeUqHePRlzZG34CM7SHLNfRjL+M8qkiJEgzKRXs41
         7Npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915084; x=1774519884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEUcGY3f4Gqjgww8Sex94zRcZTYG2w9tuzC3vEsk9pU=;
        b=MfR8Si2vkt+WTBlHVZU9pe9D61FNcvm42OvQE52yqXr4YhVlYcY5o29N89UOkXVuZv
         cYmbdu3moHqbOs8c2qV3U/picOX4fik7fKfWw1IoMd+qUf11/G+vI3CFIVZEytsBKC3Q
         83c6o22waLDt4nuyJZlWWYFwWn5wSSIIFKKXPHd2eb1UXQIkT4dI9nl2cOqPyjWXI3Jv
         C6yHPszsa+yzRlX/030AcfUn4pc0LjuysbuRdSGspn6QYOiLtoGANvyGs0vLDZvCHBV1
         zthgvpWfF5DuqQ3WAzOaPLJw0lJ7tCnPxTWfvC76Yax5MHzGO1l9XIEJNJni2kp7rdqz
         oUlg==
X-Gm-Message-State: AOJu0Yxir6xqK53pt0BCfOvENQwRLg4Lw8taAtebcEf4lfosu0AlBn7r
	+ve+uaqZhEH23uB9w3coazGuK0WM5fh7TOagyDDiGa3glRE/TwhrUPYvdAwk8XEZxcL2d9BwAPW
	Fsv5P9wQTnp/uUw5Emm5KwYDvdy00teDMivXF1ZDYXPnNHm6rtoWrNaCzoh4gqgrUBcR/
X-Gm-Gg: ATEYQzxRbsBibBBZV+gFKdUxC9m2qeMJY9sixvUgUJ8x4onhwSql5VkdZ1HvNGzlL0r
	oQG9Dicpa70J6UWTFczKuxtgCSK48FBh/Wb5k0g5zkXdDAeKSIUKYnbTC1+IgKxaMorgL9ddPn8
	YA2bzKYExOVVv+917EceFCJZ9lVkk6dL+4vL/2IJzWuAfgtRTHYP5esCWaVDSWBcY9Av6geitdn
	0OFJ59pxoVOJuXtqPVJs1hEt+VvYprGTgrmgtYBsxbnBC3MpEMSgjOoJGl81+1tPdcUFZOIPCWd
	oZiGZadnsVQxEQf4MZ5Hzi79XZodvOjLNlPfdulKHt0A603inanBGZynYkjn3wEUa4UKnm82Nik
	Q9uz8+m4gUySULgHrWE0Feds6EA/eL6gWn2mllnl1MV9jWGGKBr8DpkZg0JZiGwITvqNIR1fLkB
	gAm8U=
X-Received: by 2002:ad4:5745:0:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-89c6b4bed89mr85523876d6.1.1773915084175;
        Thu, 19 Mar 2026 03:11:24 -0700 (PDT)
X-Received: by 2002:ad4:5745:0:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-89c6b4bed89mr85523586d6.1.1773915083703;
        Thu, 19 Mar 2026 03:11:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b980cad9c11sm224042066b.12.2026.03.19.03.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:11:22 -0700 (PDT)
Message-ID: <c2b89cb3-dfc0-4793-8b0c-8ada5e535207@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:11:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: monaco-evk: add lt8713sx bridge
 with displayport
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260319-lt8713sx-bridge-linux-for-next-v4-0-da886ec78fe3@oss.qualcomm.com>
 <20260319-lt8713sx-bridge-linux-for-next-v4-1-da886ec78fe3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-lt8713sx-bridge-linux-for-next-v4-1-da886ec78fe3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bbcbcd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=43412JA_M9IFo7LN_h8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 7aK4sLOyZbDBYp8WhZBIzYh-4zx_D4yK
X-Proofpoint-GUID: 7aK4sLOyZbDBYp8WhZBIzYh-4zx_D4yK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4MSBTYWx0ZWRfX6hMJlC8cL6Du
 FRnM/J7ubvi7RQBqFRWYEsfbsJXxsL+RdasSDu/nzWpv2D/DHbxIFUWI6HHv+dK0aRAhnozoLFv
 AIGTHM197cop8ZYgUHoKXpt5en1yDHCQVTJutG/4medvPqZJlIOrTswLYT9WSq4oxYlKLlrhvXx
 pGD7UTDDStUenNXk31D5Hciqex6XkKsMaFUy/Mq10gW5W9Be7A9nzOZI9mmgH+LFBjJYg6Ucev2
 NLR5mUmw9G3bszcNUzMoQbVj1j1EBk8RRErc97GljRHMSZ6SqWyhnXVrtIXGG1FDOFFacJ97WG3
 kIeSfINsfxyIxII5ZlsA8GDAB7GxnmZGjd6yPC4u91StmUaNR7Rq7wcWShsmAC9pgdtgRf6TIpz
 sxXBhp5QnEeJ2j+CZw84BCAQP8A5dc/8//oTtRrhCGkt03QwbiWo5mVbu7Ur32iAZfbJ+UDU1tt
 h/Fs/MJ/U4vES4qqIvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98702-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D3132C9510
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 8:08 PM, Vishnu Saini wrote:
> Monaco-evk has LT8713sx which act as DP to 3 DP output
> converter. Edp PHY from monaco soc is connected to lt8713sx
> as input and output of lt8713sx is connected to 3 mini DP ports.
> 
> Two ports are available in mainboard and one port
> is available on Mezz board.
> 
> lt8713sx is connected to soc over i2c0 and with reset gpio
> connected to pin6 of ioexpander5.
> 
> Enable the edp nodes from monaco and enable lontium lt8713sx
> bridge node.
> 
> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +			port@0 {
> +				reg = <0>;
> +				lt8713sx_dp_in: endpoint {

nit: it'd be neat to have a \n before the property and the following
subnodes

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

