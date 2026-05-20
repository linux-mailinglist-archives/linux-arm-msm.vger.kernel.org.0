Return-Path: <linux-arm-msm+bounces-108673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCTQE3SIDWrBygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:09:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A9058B666
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEE373045E3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8A13C5546;
	Wed, 20 May 2026 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1SR1EeF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLfavxzS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03B63BAD91
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271487; cv=none; b=EkxPMxt5UFKn5bm5pSqrYgDNUMaJDF6YLxCR3d7uknAOWDMNR2G1us07n9b80Vrm+1XDr4r9nUOIpezm2o8TDRkORzUjr/sl4VcPn32zcDd8tEwCnE0A7KYVQsrdz43/PtJnsJThPn5OjKGTxoWxkgvsXPv50TZaFcADb1eHN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271487; c=relaxed/simple;
	bh=7bX6cKydqlLKq+aZ6OGqGPq6vprZBaJQAym3gPj6g/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jS7yJSI5Q8mscNt5Ai6Wl6RPp4MdAoEZsoo+dDJk0HdeZ1wYYffrrOOrKCt1hGWfTxBY+hyQK79tncH5+U+csM2/Cg8sX+aJ2XFPzTW9V2/u/K53w1VwNqiiNeA7MuwZfRcrSJueRDy0KfpIXRcSprXTiOp6s1hm3o8yflyWOAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1SR1EeF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLfavxzS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7qqgb1637044
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dDZvjKCBPo1g7DZhZyRN4lACTVrjxsf6J5Jrfia13k=; b=T1SR1EeFL3Fhb+57
	QAkUpoc1pytr6ujYs/oRaMwh6M2zwXVfHGzZSVf4KVg78Gft45yoZEh4cAhRrUKj
	s3QcMFTda5CEkfEbQ3p8J1+t16laFxPwvAZOuPE1kADaOW1ikB9QS+aF3IiBZ1HT
	oO3pXFkaIUF21Cl3IMVrI8bAr+hquuLq48fzhhCCvYjE70vISGGjc6Vbd5rhZTyz
	aZrKc2ZLfSUiXyKBpOQhG9dmCw3jtIEv3hR+FvvbMYcBgswxoWGl/nfBnHXLJZ3g
	IwYgvOEDaDqZVGSBFOitXhRy3mblEjDgsIFqRhNhHjV1lfRh6En9qe/fuG4fStYp
	JLruHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sc2e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:04:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90f04f07227so108859585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271484; x=1779876284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dDZvjKCBPo1g7DZhZyRN4lACTVrjxsf6J5Jrfia13k=;
        b=WLfavxzSOcnZ4xSgPyKOrtYMZya7ihBKlGiByyOG6uVlDdkHlRVHANl1eLSZDhMS9y
         SFjfZhST4xy8wC3iBBpiXmxj+u4A9x1GqS1ODHJabrCLXzEl1Dr3i+kKOghyx6XTQZwY
         sOhsMkl3OqFEd2jSVVF1J68OQEPdXpUc1oMs4SMtwtDOwuOrZnZ+pz0PFkYT1KJIpEo/
         oyFJ1o96YoR0j2tsTFV8i4DTNbVac4hVoIOC7mNIJvd8biuvo9JPmmJnRRbv6wD5F/rL
         lT8g5tRQ4A5Ce5wACykHSSts5eKY7PT0sNRfutCKQ3qgE5NSA2OX169NvBI3w0ZzQtpy
         Oaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271484; x=1779876284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dDZvjKCBPo1g7DZhZyRN4lACTVrjxsf6J5Jrfia13k=;
        b=ih4SW2gOIO+MdSmRj1nAa2JnbH118xkz5nI0hfoGSWwN+IU0GWPLxvjN0VHMNohx9m
         QLZFUeULwY5SJci1lLEaeg30W7J51vdPNPD0jYe1cs9qBgSfn43Ru27n7AYSlBUtIlJY
         elskcVP+IZamdHc7btumgPXmXrY7J6CQFn1ZlTwWl8SyD3n25PfJDXKG2tjGnrSrO5+5
         u40UCoSz7RA6AbwV9018vJBuLjuaX745lIxAwuWN1EnEcs8W6qH5GYJUpzZ2B8nKdhc1
         xVGguVCSLDwr7z1L6xPknAeeIRcdzJ54OZYSBBAc9T9CbZgaqLRaPRzHY5kgGRyDqt6N
         4jMA==
X-Gm-Message-State: AOJu0Yw9yzdKOaHqF58RrWPcP05X2+f6Yub9e/PTdwnDEVdpPHms4qpi
	CjXt9EoEFgYROMaqpKfnC3+A1R7hOy5zw/yNr9l1J8izK3P0Jv3jptRoQ6hZSSKsVS9gptX1qeM
	oN1p8abASM7IsjQIUBqpCtu4aJTzecIXVbdtG3WZwzZnJ4vDYYzHvSUx7FLSgshfVH6WZ
X-Gm-Gg: Acq92OFPKg2Kd2Bv02myaPK+wB60Fxax0eMWnZUXZibnHfT7NLYgTExo2sZt0GoOXvh
	d7aQ/2tJS6kDGEDirU/7GFq153LbF7ta1EUMI89FbzTbuahmjhS57mjBKyBBs9FEvJgGf9iaDiU
	f/6KXBYv4qgOSHx2x5otBdOC5LAjRm/32H5ZeTLZ/3YDzdyg1AQtdwuBusBi2zulPqrzKUblifd
	IQ1LJby2bek+A2msS08ZRrKoFPmX6oTputS8elF1hk+vMNrhFy9p4Qt4eLDhduqWtxyFAKdQhtk
	qI8W9zGBt9pZNfZFBM0ARzp7enAdBY02TDd40gQtjGaaRBctf2BuwOZralneKfEofoDnVa3tjte
	sUzEhIABvSdDswl3PFZANwO8M6ckYpvmJvXbd5ZLAG8n6nFKbdYK5oe5882yPuhCUZthz0hRAf0
	mpKJQ=
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr221402961cf.0.1779271483987;
        Wed, 20 May 2026 03:04:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr221402731cf.0.1779271483554;
        Wed, 20 May 2026 03:04:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311670b9dsm7624144a12.21.2026.05.20.03.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:04:42 -0700 (PDT)
Message-ID: <20a0ba34-0558-4a80-9b7d-2fca13a2f05f@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom-soc: Document more of existing
 legacy style compatibles
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
 <20260519-dt-bindings-qcom-soc-naming-v1-2-005d29d261ae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-dt-bindings-qcom-soc-naming-v1-2-005d29d261ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfX8+yuRGxXCR1L
 S+5kJluAmR8iTX2KttEaKvkugqnJ3ttAe15/6vDbf5S48BOKUZsLM7NrwBFo3oSmEXzBW3GHO2c
 cO8eLyyDMRidot5mGn/gTbs+cPlSIcPpGADYxpuv1MMviGOlqDhkEydi5cX4h9CApY8dr+7E5x0
 PDeAECtIbj8qDXX1YfeuFLs/rhAWQB+93nKevmNpi29cvrEFYQIiDlZiz961/PCbDLMQsRjD6kp
 01lvKsQi4Elyb7QueHWN/uy7reGmecovbN5G/Pkzp6QJi2WNlnm7sY2yFxEQJ3iqHCka3xQW6Sn
 H6cbU7wHJa28Xm0S6lMHJnzBponAzyAaPJqftckVcPwV/PNpNEbD+1jrN94bzslICwJhyANnOr5
 0Vj+zgLkBe8KMglzNUj5QjupBb7zPsGALwYqj/OEpYc/ND+DKinYa2Aj4nctsfka/H5NwjXEggZ
 ZuNNoL+Pgrj9SrHHkvg==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0d873c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BoalkX-kHbwzbhiszqwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 6F1Er3bHA0AMz1kUCbCO4F2lx_-FboqW
X-Proofpoint-ORIG-GUID: 6F1Er3bHA0AMz1kUCbCO4F2lx_-FboqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108673-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5A9058B666
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 10:03 PM, Krzysztof Kozlowski wrote:
> The schema misses several old style compatibles with SoC component
> trailing in the compatible (qcom,IP-SoC):
>  - qcom,apss-wdt-x1e80100
>  - qcom,apss-wdt-xxx and qcom,scm-xxx for SoC with code names
>  - qcom,kpss-gcc-xxx
>  - qcom,rpmcc-xxx
>  - qcom,tcsr-xxx
>  - qcom,usb-hs-phy-xxx
> 
> It also missed qcom,ipq806x-ahci.
> 
> None of these were flagged by schema, because they were used with
> fallbacks and the schema checks only for single compatibles.
> Nevertheless document them for complete picture and for future change,
> which will apply the schema to fallbacks as well.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> index b5f3a750cce8..d7d64e0e146b 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -40,12 +40,20 @@ properties:
>  
>        # Legacy namings - variations of existing patterns/compatibles are OK,
>        # but do not add completely new entries to these:
> -      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
> +      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"

There's also x1(no letter)26100 and the new x2 ones, so perhaps

x[12][ep]?

Konrad

