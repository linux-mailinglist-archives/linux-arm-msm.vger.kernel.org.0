Return-Path: <linux-arm-msm+bounces-112995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J/LMK3E5LWp/eAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 13:05:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BF67E686
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 13:05:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d+0kXTNF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LLsHKpje;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112995-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112995-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D531300679C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 11:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDE93D1704;
	Sat, 13 Jun 2026 11:05:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7953CDBB5
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 11:05:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781348719; cv=none; b=grkuEQOIw+rBLGr+at55O1iLmVZ563NLWRmIRmOWRNcp/X8btmccKxAlH1qH6peWjhTHTnYNZnpfKFzrUiq81FFVh3TRfFugxVXnKtX8wvQklttf3ZpCOp21W3H2+xJfb1zz/UwMaJB8/+w5gEVQPHAfcydsIM7zOEB877L9bI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781348719; c=relaxed/simple;
	bh=hFuLzAKLku9zjjLmyY1LU1Y3IkgnibQ8as7e14dCSpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qou0gE36crFXw/6Y9YRiW/g08pXhuVV1jD7a0XJpwqBJAfKBzXVSOo497O0NA7oLe2Q/rRg0LyZX1cx8hIgg0AnUP0jMtpy3kxgvj36BDyS2O+1fZI4kLKYEvPcT58JTHu0whwRVSTpUEX0GZePcoX0sBv/AQQgiO+XjMM0tt4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+0kXTNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLsHKpje; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DAwLFE2801268
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 11:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fRqve/iiEi4xLe1x8p2XFeA1tSQCSNKv74uJA29YfFI=; b=d+0kXTNFVgiLRzE+
	p0EZbjEhCmptGdcfghbY0edkgREO5wWW4mkF+qxGEEFgU05qKexaKw+J2YIbE/Jj
	7WzQbN6Fl4jlgjttjwrsuVCovdW7fEYk5XTcowxWAuAtSHUw8NFGXIDqPDfJQ66F
	2QE0nmM3wkyJT9cqAXdbTPZEUTfEO49cCGMcKi9al0+vOgSS2bgoy2oFJ/CR6q6w
	qxpzdDsyUycixWla2S74qN20ZjTgFZD/llKZt5sePyJ5HRchOo3o8ssmt/QyHTL6
	I1xlM+gd769eNTsx3dy4sFT++VPAu+0DXps7Mm2DQOoNp9FTYWCsJdHWkjppGp2A
	dxTZqQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6runw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 11:05:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85d9f0ace9so1922860a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 04:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781348715; x=1781953515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRqve/iiEi4xLe1x8p2XFeA1tSQCSNKv74uJA29YfFI=;
        b=LLsHKpjeQu6OhkG9dnxXSyAD8c83lLCc86oTgHfeKlb1IHK+GZbrYS1UXCGHi78zXq
         YSq17K3K4eyHQ5EiitCjDmnLeKTuCL94TQTPoBEkgLETw1EAXH9guSJto0TEGW5bAEkN
         +I7VehrIeteLr06M2hzYN4n7wolE8VxfQFI4iiOdOoiPMu/r/ie1Wsnqc7vycY8i+aGi
         2Toqn2IA9mQyX+Yy53dJQyZp2riQAuOsjMR7d9swt4io+Dux5thvFxQAeABoEtH/8Hp3
         BFi6jWg1cDxQlJbjhRBBWIKc021pFuYitnCdB6GFrySwuScJwLFCPqGxbs1nGZcOi8FR
         TKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781348715; x=1781953515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRqve/iiEi4xLe1x8p2XFeA1tSQCSNKv74uJA29YfFI=;
        b=e86R2uxvfqRhuGmw/Q2BAuC822Akj0cJ/M41SW7esR6IwRt0jSam3spGBsdNaOmip1
         u4wVKr7cqO/BRJPwFsy5lUTNDGjKNjKLqK9X65aKnK5Fs/6TPy79gU1ZxAD+KMfVtc38
         843imevcf4GYLaCfCKhz+qF24GehpLEGcEz4pTAZriF/4bolNHE4ryap8aAMYjxIcfF5
         Os3gJq/IveVoSocu21EMZCs+UWHDMX/0GDfomg8uUmE2aY1KFe7gg5rcNai/7znnP2H3
         0XmH+oig8EbOfptD9HG48U0jP3hQI91vIF6EJZkGbXSDdn7rgK0tFhCfphzT0DtiP2RN
         oObw==
X-Forwarded-Encrypted: i=1; AFNElJ/xj6A+qyaLRli2b/zwcJWJkwjclKUNqqeEkU//yHjKBUZXmDpikaSHAEdg2zq0HkqMWJlUtYMdJ1oPFXjx@vger.kernel.org
X-Gm-Message-State: AOJu0YwhsnADDtROrqi9wAR9BcQ71SUsZxG2nI4p/2oNwzskhRxBKVUO
	lGB6Syh6Q6phgZwrW1T6/XlchgmQglvn+KjI6aAfeRmRpPX6i8o6+Cn8dE6ei2kvGXWvlxBaGbX
	jDNOG73q3f0F+K+EZBl6XRwo/l4EegodTWNwBhMfUyLjLah7nOO+GFHRREZoxWVw8D5kK
X-Gm-Gg: Acq92OHB92auC5uuWrmLQwt4kRj9R59bQx8zJkUjXlg2L/oCNz57N/ZqiANXNsFxPDH
	1NpuHk1o9hnnHeEy1cS/+MoqHfKKrNuYmn/+N+kpB2lxpfNVXUM64nwcaTaryJZdeAhmdkSBHKZ
	Iu615pmKOq2HhATnFeutKyu2TUsxTUrwjWKm58aRW4iREgDzTbEBh6USp1/ryq261MtzzOdNRNj
	/+xHJTGR4f33qLxqUlPAha3A0iWWao9blV2r/jZOFHO/OHjWhYvayfUFCGnYXCErfBQY+AmH5Jn
	42cZTS0s6EMp7bt0iawMIHwE6v3dyhHheoS4wcHalW2blvNSEHx4sr/O9gaFvPCOMWpKVbSSKK5
	K0ZUcxxO+7d7g1ZmTWunau/6u2RgOZkONK3SUwcbTa+534IwaiVO0
X-Received: by 2002:a05:6a21:7a8c:b0:3b3:1a06:e5 with SMTP id adf61e73a8af0-3b78416b85amr8312211637.33.1781348715519;
        Sat, 13 Jun 2026 04:05:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a8c:b0:3b3:1a06:e5 with SMTP id adf61e73a8af0-3b78416b85amr8312188637.33.1781348715107;
        Sat, 13 Jun 2026 04:05:15 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9bfe1sm5037247b3a.12.2026.06.13.04.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 04:05:14 -0700 (PDT)
Message-ID: <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 16:35:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
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
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDExMiBTYWx0ZWRfXyW+0Yj08Cf7y
 AdMclzcFDIC29gY0IN6/8VIaOhUzwWEXOx9VxMgLqfwTXqyVVga9yJss4Gzecm001B6nUHoO62E
 bE9Mz1ZHa+COTfj+CAPayEhj6xqrZhE=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2d396c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UvbFL3pLTf4PkRdXo8wA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: FtjIpa9R0rV4it8-SxbBYJwU8q_zOlzS
X-Proofpoint-ORIG-GUID: FtjIpa9R0rV4it8-SxbBYJwU8q_zOlzS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDExMiBTYWx0ZWRfXwhCbSefvRsiS
 paP4N1ztu28vR5yqsw4qtKZfJv9FOz2HLMZ4HnUQbSLCU1Hmj/6Wz7Z34TqlPxT8O2/mVVhWIp6
 CwhmJcd9meUWPGZExo1yXwnKCGxPVhfNi09hpV1ACGTg0kwrSlqc52XCzqnU14QT8xyMLMOi9wA
 NXlxZ2ZOFyeUNjXSfr5ZSnFaEoiw06yjvF5cduR+0qK/r7wiOyCYgGY6/ax5GwPG7pBPvYexbY4
 +Lug4o5c92K6GhLcnUlRDs6HpT+VU7phXDQafYsEfXDiK1WChdWNT6gt9J4HuOsHsK3IhL+9bQW
 FRvQNNt+iqJtkhFaqa4zGzAj+va5N5gu98SoF/TSQWsyjMJvDk2PTzZ+YSqh1GE/7qBgR+GHhvT
 aa1QKPWFsmwrzIQmAJVMwMIkSVuPD+fC+TAPhWJiDXtyEfU3SQEt6+hoqRhQMdOVf6iY/48Ju1N
 K+ZgDBl6I7Dj4KGrRUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606130112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112995-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 492BF67E686



On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
> On 12/06/2026 15:52, Gaurav Kohli wrote:
>>
>>
>> On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
>>> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>>>> Why? And where is this generic property defined? You cannot just
>>>>> sprinkle generic properties in random bindings.
>>>>>
>>>>
>>>> Ack, will add why part.
>>>> These names are matched with the thermal mitigation device identifiers
>>>> populated by remote firmware over QMI and define mitigation devices are
>>>> exposed as cooling devices.
>>>
>>> No, -names correspond to values passed via DT, not some remote firmware.
>>> The remote firmware should give you interface which is explicit and does
>>> not need such properties.
>>
>> thanks Krzysztof for review, We need tmd-names because of following reasons:
>>
>> Following Daniel's series [1], the thermal framework supports
>> mapping multiple cooling devices per remoteproc/device via indexed
>> cooling-cells.
>>
>> 1) The thermal framework's cooling-maps reference
>> cooling devices by index (for #cooling-cells = <3>). Without tmd-names,
>> there's no way to know which index corresponds to which TMD, as firmware
>> may return tmd-names in any order.
>>
>> below are the changes post new thermal mapping changes:
>> DT: tmd-names = "cdsp_sw", "xyz";
>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
> 
> names property are not to instruct drivers to register or not to
> register something.
> 
> I don't understand the problem and explanation in the binding is
> basically non-existing.
> 
> Remember that all lists and indices ARE FIXED, so driver knows exactly
> which index means what.
> 

thanks for review, shall i use driver data, which is basically pas data 
structure like below:

static const struct qcom_pas_data {
     .crash_reason_smem = 601,
     .firmware_name = "cdsp.mdt",
     .tmd_names = (const char *[]){"xyz", NULL},
     .num_tmds = 1,

Is something like above acceptable? and this will also help to filter 
tmd names as well?

> 
>>
>> This allows cooling-maps like below:
>> cooling-device = <&remoteproc 0 ...>  // "cdsp_sw"
>> cooling-device = <&remoteproc 1 ...>  // "xyz"
>>
>> 2) Not all firmware-provided TMDs should be
>> exposed as cooling devices. The tmd-names property acts as a filter,
>> allowing board-specific DT to select only the relevant TMDs for that
>> platform.
> 
> And driver filters, no need for DT property.
> 
> 
> Best regards,
> Krzysztof


