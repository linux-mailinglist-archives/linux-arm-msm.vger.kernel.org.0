Return-Path: <linux-arm-msm+bounces-93765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5QQ3JfmYnGmKJgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:14:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0743117B5B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D78BD304E0EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833CC330B22;
	Mon, 23 Feb 2026 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iRHSSZKw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ViEwNqC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A08324B1E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870450; cv=none; b=sacOSVvH6H0ixqbg6GXiZlY64G/J01pTWcYIiwHfh3jiky9jtQ/Gsz4H7gPgRlU2eJWf0/wZXUV42G85S5WqXEGd46g/REUkGlnrvscQj4WrxVAVXy/7eSmaOSXumVE75mXiT+xA+4g13fFbao0mhjZwzczWVFC7F60PL58QO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870450; c=relaxed/simple;
	bh=t5c8HTVQFFK6SR65sLMMRCj/tKPnC2Vs90IQgfid574=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUXF15go6oviiWzYh2mPHIfFB8DzwVYM0e95m9hynBNrjK/VZ1R1x10CQS5p4nYSdcdYQ5unwTlFGgNkwbibEu08fvFpvLsSRv7sQ6+2dprgFzieFXDMHAUfj/6OAjKyutYtcYzUeH8YfH12gprm9cDAPt8X98QaIUTmLSois5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iRHSSZKw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ViEwNqC6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NHxmZZ322212
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uMxCXETim4pZgjyQEJ9B41Fp8Ce2XQixYnJKPqTI2og=; b=iRHSSZKwbjPahLlg
	T6knaUfDb+t1XH5kjmEcBh5CdItxGiHt44lnR/MITxPW/gO/FY4Ob9uV6s653OYl
	g3zq+iucOEjjE2bU7J1ZQSuLhPQk6UbGp5cnCHzSDUS9BGv2U6xRuWFPU+FLpbUo
	xiYM0na6fNQ2F5GlSNQvCl4EIO4dTXE5xZp+79YRWwswni/t8QT0WNMUUZcaoRUa
	Q/ybG1sOfznVLTm3hhUcK5AC5VCoUBKrFDpnReRPVoiw/HxSLo9xpfL1IIBgWr8x
	5Ll60oweA4nRFXmD7acUvm0Hn94ENpqAyX25gmSn1oQ9AthWac+CJXIpkNCQVTw/
	MXe9BA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y1ewu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:14:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb37db8b79so2092570085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870444; x=1772475244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMxCXETim4pZgjyQEJ9B41Fp8Ce2XQixYnJKPqTI2og=;
        b=ViEwNqC6LF7nMdTROpdGOpD7vAuE2cW3DSIhfjs4zdYLoZ9gIwbYZ7Z4zQDRz8piev
         y8Gd9g7+SLlUujch4Cs3H96wItRJS+AwRrD//TXruv91fp+Tw/KnbYIjP7KCGogaJ3gf
         LdVIxikoFJld3U1kBZgsiOO0LG9q4oJ6btzyUmvvWp2asCAkPFf3oJ58Wf8CVdV1N9YT
         j+GRIQ/8aLW7oOYVj+nos8Kb0pXZl93kvbbyT5QPGGQuWh5kkrg5A1y/QzXc8CJ59y45
         sQRM4d9i3FcPAIV+Xr1/6hUYW6ndfDdM1Pr1Q7JIRisg2HhU2NbnayCtG4V745M2hRIB
         Bk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870444; x=1772475244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMxCXETim4pZgjyQEJ9B41Fp8Ce2XQixYnJKPqTI2og=;
        b=HJhGzUdAfzTjP9/JSMm26gOyUi0jfw8JWiNUDTI2qXaPMPhfvKJlx2704WfRqojiAd
         3sXumqfB01RD4T0d4xSz6qrkYqjxnOqGQ+7IUUs6/wU9EFN0n+kdyPctpyDh74g5MNzc
         VLncAHUTAtOdUYaZMysGo8RJK1mTNDzO+OvlIIJrdq0Uiqh7Pjd26nXUSIiLqDXg3MWt
         oei7ZE41SbdLzntxZKr58MN2KQ2X/WbKTfE2LBcaj+Q+40b4wQf5IwciZ4EA2h8OidBi
         ISFcz0Zbnzj4srEbbTctx7uvMQjBzIdPY8itSNCbeRsPX9tcPzIY7s+mxXsVf+R5qnLg
         CPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWADGe6+3FLxzBSYBqhMgVnlH7mf5C5l1/yDZcJFtIL2jqVGpKoIXHKcR0yoMTJ04LnZcumHp1qJHne/7cR@vger.kernel.org
X-Gm-Message-State: AOJu0YxJul8tQDzpDMmJizMvaQtRuCtBjTFihdbDSPRRjMR/ANagiPUf
	RfX4/prKu0Yt+LZ6kwxMSnhJn0VGxsY89AzSKrfTPZ3+BktH34JuMjG2fpcZjzdmYTqdWMtQitS
	xypM6ANQogA9HODKgmS36oW08Ezh9LMpMpGwZ8J4nHUt0bDxnkJ1E6jUjSlD7JDZVv6H8
X-Gm-Gg: AZuq6aIt+wjG0gX3diO+ZgtUAbJtthTZO9RL7DPo5rFK5wv+rj8bcpjalsMeaTISZJ5
	/pNeZtQoBpi7F/28eS7yXa3rQEPEo7Wtkogs0Z4NAZQ1bV8OfJ3fpRSijrupKf6PlIOEtA06j/h
	YiyGL/V7V900AwbenrLIRQ0iW5ww7Ito9DaSoYAXtiVGLkM1gWxXZXNc5lpz5mtnqynO+/hYDFv
	TRWRCVuxT9LYeBRRBNFHNJU62ST4m/pVdhTB/IZPXTYvdZtWa8XBbFTG4v1Qlc3MNcOiuYVnTu/
	2KSgC5HnKSFuV1VKKSvxwhptV2BkvPsmpgLmjoxVtQEBq5SI4D1GgX6eP0TGvGkWijrK1H7VeXg
	hEaAvlRTv2I9Br7IQjDVbkyKJBJSOhiHC+ZUhB5yT5hW7SkDN
X-Received: by 2002:a05:620a:1a85:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8cb8ca7fbd7mr1138922885a.65.1771870443625;
        Mon, 23 Feb 2026 10:14:03 -0800 (PST)
X-Received: by 2002:a05:620a:1a85:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8cb8ca7fbd7mr1138918385a.65.1771870443184;
        Mon, 23 Feb 2026 10:14:03 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43970d4c96csm22839756f8f.30.2026.02.23.10.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 10:14:02 -0800 (PST)
Message-ID: <7c7ddd2c-c700-4453-a6f3-7d070016aa1c@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 18:14:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles
 for pm4124-codec
To: Rob Herring <robh@kernel.org>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223133950.221234-3-srinivas.kandagatla@oss.qualcomm.com>
 <20260223165636.GA3988149-robh@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260223165636.GA3988149-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1OCBTYWx0ZWRfXyC+6aknrzCot
 sybcVudoRjbJrK4tpnZopZQOWH7nCgyIg+T53n/oK6wP1ZxWStD8e/acajiesSsgr799ynDz0yN
 b+jwZbka7H8COnE8IbHsXrMWPWzxhrXP2/pL7GXwOSYHNF5dvDr3YhILLVko/33DlTmZ036Hg2I
 q8pZ5VSr50WNHBUp4dhGXjgHR9nZBwBzd+Ejf3XOpzSYhCgKXveQzfRJpEuSOPpxcgRV92JzKBJ
 UxCpapx41MUq/dWF0waprxBmx+vPwL2i0QDTCRJhxMvXh44KkdG/JwdtMEA7XyUTxnv0qX6rLVm
 ZXls/F2jYnOeUMT9TH7tWGwJOFHx9GKEoGY3ZCOXvLfmhLOZH6jjHsE39i5/Lc6sR9p+5TBTm1Y
 KDu91OT8Eyej02DDkhJuMhUeMRSUMBZx4wO05bV1SHmEiQuYN4FTmsi6pHYfSIc1dF7tzk7D6wT
 1ZxhrV48JgKeZ0cdKOQ==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c98ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bMBjfq_dd7qU7rFTbikA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3psVzq_yB-oOm4LsvdD0FPQig89wQj60
X-Proofpoint-ORIG-GUID: 3psVzq_yB-oOm4LsvdD0FPQig89wQj60
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93765-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0743117B5B1
X-Rspamd-Action: no action

On 2/23/26 4:56 PM, Rob Herring wrote:
> On Mon, Feb 23, 2026 at 01:39:47PM +0000, Srinivas Kandagatla wrote:
>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>
>> Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
>> Audio codec has TX and RX soundwire slave devices to connect to on-chip
>> soundwire master.
>>
>> Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
>> properties in mfd qcom,spmi-pmic schema to complete the audio codec support.
>>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> [Srini: reworked the patch]
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> index e5931d18d998..f58a85562c26 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -145,7 +145,11 @@ patternProperties:
>>  
>>    "^audio-codec@[0-9a-f]+$":
>>      type: object
>> -    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
>> +    oneOf:
>> +      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
>> +      - properties:
>> +          compatible:
>> +            const: qcom,pm4125-codec
> 
> Don't mix 2 styles. Just do:
> 
> type: object
> properties:
>   compatible:
>     contains:
>       enum:
>         - qcom,pm4125-codec
>         - qcom,pm8916-wcd-analog-codec

Thanks Rob, will do that in v3.

--srini
> 
> required:
>   - compatible
> 
>>  
>>    "^battery@[0-9a-f]+$":
>>      type: object
>> -- 
>> 2.47.3
>>


