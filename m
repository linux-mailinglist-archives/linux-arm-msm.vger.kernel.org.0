Return-Path: <linux-arm-msm+bounces-113155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ssIWCF3VL2rYHgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:35:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6D4685604
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:35:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="n3TC/Ii7";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hcisMqyn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113155-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113155-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 885073028F2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9523314AC;
	Mon, 15 Jun 2026 10:35:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86A02FF147
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:35:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781519701; cv=none; b=IcxqyMaxzObZvuJH4VP8DFTz3RsjVgP/ftsaJ0GYLV2HUTpPYJhrK6nJU0gl5/tmmR2VM6v4aaITCeTdmPEsZ3wCb3EJjVGo1mvajS4FoAZbSgK1aqy6y2m5MjeKaohtznybYmeCvV2YjneK6gd5RRlDPd1KGVeBSomQkrbPP3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781519701; c=relaxed/simple;
	bh=ypBctaFL7zGGiToTo8r9a8VYheJSEu0MfATFvA99hvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gn7GXvk/lyN5QTF4WoVwg37HOxa/OD0oObfYIZraxc6x13cyF8hiqxR3jQZ4NGsSJ/RSnx0+jf1wjSf5WxYWyEOH4vD0RqCANvbukwlxGuF7BHKShI5VzBt7Q6IsikfDNMz+l4LMVAL4lXxRaw1V7TtPvN545AzueY45YDYg8Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3TC/Ii7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcisMqyn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAIbLq3900268
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hVyefM75Zw370S/eMkrghTpPTfewflO0/F6QE0G56A0=; b=n3TC/Ii7lkQow8q3
	/MnBEYSCoIk5ZB8W7nj47y9dD2AqiGDhaoGGnYMzvGAgDAclQAc8Ks6B1TqIxoXQ
	4WbYSH9gqlVST0nsnPVWsQ29Kdpw0Hm9ZBsmJ1UDqUN/kSQW6hyaMoY9lZzTs5fZ
	dz3+2uiyQd4iPoQR6Lm/5ahnl274jejy5LdduoJv2RgfwHQzrFG8+d6DzAXmbAkV
	pyp52ZCO0w1WsYk9Sboh3lF3Dl12xNNKahwYOcnmaDkCeih5NVzfnP6wbF+ftTca
	UysG6XKo+rVLcl6YludvRrDi1BxP9jTTWXJ3J2iqsBEzT7L6o81gblS3HJ9KodSB
	D6q9ZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyd87cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:35:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91565f8c589so572647785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781519699; x=1782124499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hVyefM75Zw370S/eMkrghTpPTfewflO0/F6QE0G56A0=;
        b=hcisMqynZRxwMHGUXMEjWxdlXr5d0I/hWK92VUipHqexp4gbZ5TfZQYVTwrBWKTwPV
         RVf9EB7lQ/eNjYFfNUdSQHr/S7pplLRElb8wYusamonAQvSwNdvy0pCVCDEVZ+E70HFz
         y+Q+aUQ1+GmQLhOWQmI1f0qE+jWHguwLSCe1NqBxHrgKr+k6ZLVlmcrOz/1DTO3HCqWR
         7i92S57ukNWrCwLP1YUc7Y4UhMLxpLDRBHGHqty64TXX9FR8ZZuLhGKGEsGBDEy2aC7M
         zM4sj1sqTrwSNnkvNsBg11bFtNmb1iKc1rpE5t6pX6QZ0oru9XSYOlIyShJUcHEkkxJt
         eDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781519699; x=1782124499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVyefM75Zw370S/eMkrghTpPTfewflO0/F6QE0G56A0=;
        b=c5+Nr2ACoA40tHZ4Nk0GoAY7h2CHHAzhKdQ4liaXVyjioacimyA1/6o8cuf+ZojhYk
         68zoDqOtzrRhqsnH8MdqbCgjMXXXID+r2CYfv/HBBrxzM2vpdlspjdDmleuccJIupv7F
         S/7UG11gKb+oXkf472WVfHAqYuGhkS2yI1DLX2vFkYVBYGVoZ5uF2cSAhgXTDeZYdG0r
         oq5bJqyE20veB/6Ntz1mPsl57rQcO4cF40LA9gqRGywo4WTaxRZWZ02vdbWA6f5EQxsy
         7BrIsRElswZxRUbT7edpCm1ayhtIt5c2mk2yUxASX8JKQTRYNLhvYAASqp5dF6j+9Haw
         lEDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+JeVJWhd6EL4xOXNISu4ux4gM3No8Blo4ut88H3mQ6lAXvvcSig5yE16JFYijZF8UjfxMoh7lio8KnT1NM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9G6fePn8XzvhnqldLeWAVt3MPv7/0+eBuTqyk5X4Cu7eTBM3v
	ry23yPriHdVSXskYltjUT2RQI+ZnL49H976D3mI41zuWoASAP0RRpBB+tZAJ4Le5K3mEzzJlHui
	9QrkNJvnaV7U9gKfjH7xZdCRt0XAAMIIyzQsYgUbW9V4SWCt/kCTlkm614gUGRKsVxS0T
X-Gm-Gg: Acq92OGkZBXCnuEw+j5514pfdnktvTJ0gTyPy7D+k/e34QvWAtKHWN2yxUEG2UM8K4C
	0mG4rDQPPPTqIYIDJDpI7nlG1BlqMPFxDc3VZGOtCE5W2QOnTzM0UUnT+hGQAAs74OKEqnh1I3l
	F7/q1RrbHKi6u1zXKg/cWFuw0NWXSYQZ0QFL6HQh9gAddiq4dWXEq5qQQkOq6LI0hVUTHb5dFC0
	zUPKARXMdc8R3fltbVoeXbDVmhWW/IRpurmh8JnJNlWoQyUJW5CSZqvS6UmUR8GzXrWdGMDGIOD
	66kiMzeyyTMgt9MxoTAgo+/TdYzmyIxZapaNWpUnoJqdQy7RDyMenEBfNcnVAg8kfXMdqoTK0sq
	DOiwdhhc6ZlVOLL6sT/kBnkE6WyckCeUnjJWFMqiwuhPFrnfyE/FHh7ZSewBbMsu1jVR0P6qn+H
	DKZHOCJ+3v
X-Received: by 2002:a05:620a:2894:b0:914:bdfa:c782 with SMTP id af79cd13be357-91619f2bf0dmr1784333785a.29.1781519699029;
        Mon, 15 Jun 2026 03:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2894:b0:914:bdfa:c782 with SMTP id af79cd13be357-91619f2bf0dmr1784331785a.29.1781519698620;
        Mon, 15 Jun 2026 03:34:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:766f:2395:dbef:b08d? ([2a05:6e02:1041:c10:766f:2395:dbef:b08d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263923sm33671703f8f.2.2026.06.15.03.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:34:57 -0700 (PDT)
Message-ID: <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:34:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z7Y-HP6xGqg5Jea-plm3_KbJXc-2uyEE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDExMSBTYWx0ZWRfX7zxiO9iwEq+O
 VNTzvZ+pUSq8BfycfDk/2KOLn01uJG/0Mfx4f6yIbqiZ3cD8Gb53bN2+rEkniYRS+MB2jYlsWdw
 1aPsIigO6eNl+/v/l6pLgyt/7noQAAc=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a2fd554 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=zPFEeeBhd_1xptEjU_4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Z7Y-HP6xGqg5Jea-plm3_KbJXc-2uyEE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDExMSBTYWx0ZWRfX8OQxq/GIpuj6
 sUsoohpRbVipp70srutj7A9jHOJ1yIBBrcUewcWPi//CRkniFtjf1EZUkF7kW0iwhqbyXFwKsDi
 e0pngIgAgQM3NwFfU9Pg1pxJ3ZgwagtWL+Ps4kAQHm52G7rYk42qEtMngcD1JbFoYCvPSUmbqE5
 R1EG7YSEKAG18Uhd1+UVx//Lg8qhb/upYPmS/aRufJSJKB8i6tTR0NWUOSFhrl5L02WkY3Oe6aU
 KlJHX0ghVDd3b0BoUN3pK0cy0QLtAHeqTo02z1I7rqpXLrzp0vpHCoLEq//DtIhY3BgMAl5DzaQ
 cRAOTNXhiZok4qinKQvLhPc7V5nLzFtRWExAzHyxeU5tRuTvE3z0b0SHevfFANAwvGOt8i4Aqs5
 UqxNzYL1qqyE7cExRDfIPekgD+tAhtPGsU7BqOVPkz5KCHhIYACrrFIjLwljevyMwAN+Em2TcWj
 x7RlOdjfTFhpv9+VXmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113155-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E6D4685604

On 6/13/26 13:05, Gaurav Kohli wrote:
> 
> 
> On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
>> On 12/06/2026 15:52, Gaurav Kohli wrote:
>>>
>>>
>>> On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
>>>> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>>>>> Why? And where is this generic property defined? You cannot just
>>>>>> sprinkle generic properties in random bindings.
>>>>>>
>>>>>
>>>>> Ack, will add why part.
>>>>> These names are matched with the thermal mitigation device identifiers
>>>>> populated by remote firmware over QMI and define mitigation devices 
>>>>> are
>>>>> exposed as cooling devices.
>>>>
>>>> No, -names correspond to values passed via DT, not some remote 
>>>> firmware.
>>>> The remote firmware should give you interface which is explicit and 
>>>> does
>>>> not need such properties.
>>>
>>> thanks Krzysztof for review, We need tmd-names because of following 
>>> reasons:
>>>
>>> Following Daniel's series [1], the thermal framework supports
>>> mapping multiple cooling devices per remoteproc/device via indexed
>>> cooling-cells.
>>>
>>> 1) The thermal framework's cooling-maps reference
>>> cooling devices by index (for #cooling-cells = <3>). Without tmd-names,
>>> there's no way to know which index corresponds to which TMD, as firmware
>>> may return tmd-names in any order.
>>>
>>> below are the changes post new thermal mapping changes:
>>> DT: tmd-names = "cdsp_sw", "xyz";
>>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
>>
>> names property are not to instruct drivers to register or not to
>> register something.
>>
>> I don't understand the problem and explanation in the binding is
>> basically non-existing.
>>
>> Remember that all lists and indices ARE FIXED, so driver knows exactly
>> which index means what.
>>
> 
> thanks for review, shall i use driver data, which is basically pas data 
> structure like below:
> 
> static const struct qcom_pas_data {
>      .crash_reason_smem = 601,
>      .firmware_name = "cdsp.mdt",
>      .tmd_names = (const char *[]){"xyz", NULL},
>      .num_tmds = 1,
> 
> Is something like above acceptable? and this will also help to filter 
> tmd names as well?


How the thermal framework will bind the thermal zone with the TMD ? 
(node pointer, id) ?


