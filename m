Return-Path: <linux-arm-msm+bounces-113176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qKtIFvzxL2rGJQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:37:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 504F668645D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:37:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R51mfMBx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xtfox9wT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113176-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113176-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96E79300FCA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C913F7AB9;
	Mon, 15 Jun 2026 12:31:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7356C3F4842
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:30:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526664; cv=none; b=A7ljUu8p/lIMwQkCaZ47HUMr0aMy4NpJVoQc4frLMEA5m9ldccklFh/LBKdit6yiM2ipssIAFYv/EupoYxm7VFo9Yh6NxBNjailWR2NiUxW0hti4gYN/GQvlms5hYg0RQ189H+94kOJiY+9u6r1clM6i9nhGz+di2qKSwTylaJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526664; c=relaxed/simple;
	bh=4nzEpuGwgNL0R2NblpKrggs9ml7l1I1ZGGJOsujlLzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIeZl3cF+huApv7ORfciCAknSdt8sKn4f3CpqRr0HodPEGcsM/PD0L6QAJrzQiMBGpaDIRhuvQLKNt50qOk7klSp0h7Fk/opBmk51dol5fEUHxKj80iTjqQ8VT2RYYgvEkqW7NcketEmNQf3e48Z1fJ/Ag1ibPAURWzbFGrANfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R51mfMBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xtfox9wT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoXrh3972394
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KiXHBkLlgkRaXk44sFimwo5t89c600tXG9f+rJEMgMI=; b=R51mfMBxrAYMYcOE
	Xy8Kn+eR8j/pJLt7NGydvGed32wbCQAW0d8UEsEsl147osIxIdl3VrmMiA2137ag
	rnKtpFD1XuDtDKXSv+ltL1OvXHp+7bbilNTZ155ZKPnSdfPIN5uuD1daEPctXyZf
	U2J5OxjGpYc+5WGI0hr9WnG6LObZV+aZAt5uDaUUmoiJzG0+21PHeWOkCgfTAUPF
	4HjLBmTP8FSWI+ugJCM8+1BXK+E5tLXiuqNanewOk1IGN7iIP/xJtrWkadwJxGQ6
	Tzq2Tp3oLmmMt8Z++VHpFVo6QxEUuRYlbX8mb7d6m9xr6gHlyPPc+R7/5X8ChaSN
	y+BWLA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyd8mq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:30:53 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-486417cc069so5059312b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781526652; x=1782131452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiXHBkLlgkRaXk44sFimwo5t89c600tXG9f+rJEMgMI=;
        b=Xtfox9wTXyK6qyXmcZohBI8xZUiAB7i9YuVmSNSOoGgTr1eybyljf18rD9SkkMf4X2
         3HVevz4ej+semuMJ6lHoG/K70+yKpnlxGJGQSnjQOrLH9+UGHmmiy6EFeihpzVlhJw8/
         MWP85JJ+9wloHOqm2cBnK0SCepz90PMFI+vGR8q0XVJDg7YeSpU1fhd8+qL8rBajAL4h
         5Qsw3/YlE+gNfc4RHEmKqqAGVD41FF5Yn2ZmS3idI/4Qe8tUc1BqBa6IkOxz0QKt+Tk7
         f2oz4bAH6kej02wMHmizUCh+nteUGfZnwnpaGQom9gg7bE2m9ro1J1GMgiVDQoDsH/BC
         pvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526652; x=1782131452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiXHBkLlgkRaXk44sFimwo5t89c600tXG9f+rJEMgMI=;
        b=reh1FiF/ctZA9FPy0iQ5GaY3CFQOgBpxDQVS4KlR7xqqd3T3Ma1MiAJwd0d8DWh3Do
         ZpMmfDn57RhDYPJ4Vyg3jHGyzWAmZdkc+Q/wwGzFyu+uDlkIco1cof/O6GwV6uNUnXV8
         zlkgWC9FgXhpNO/VxhGHM/fL8HDnVvhZnfhGM1s7T1/GOYp1CUNr7RD4VZK2WWfMQ7BK
         gvkYLlfjSPXui1LRnAh0l9NkqKpZj2TsqOSJWQWyfAUyY7dbwvARbVD83ElHKT0QfiHo
         FHeuy1dfwSgCrqeWNb7SVhZ+TcjCbMzLwBukuz3yyzWdwtYquerYztmD9V7XxRHhs2rq
         iQkA==
X-Forwarded-Encrypted: i=1; AFNElJ8gNmGHalTzbmrfzgAnXwQ5YGMoIK4+DAKNyLpQ0EJPiMI7Gf3CLsOkC+l9TG2mhkSLOImonP/zkJkP7boE@vger.kernel.org
X-Gm-Message-State: AOJu0YydCcmXj96JxHi2nM1Cd+PMua3xdMImuWJBUTEj4IVkUPW7KLa2
	skZ6vUG7c6ZD9l2OtqX3soHmrAyO2flqO0aGF0xUdukj3E5w479Bua3CewvGqvV4wFB+nvJoDcK
	f/jzpH/SLWsS9V42wD8uyCFy1vFCMGZxQlsI5gr3naz8ZJUvHQvAvokb8xRzA4mYfNer4jlROJZ
	xx
X-Gm-Gg: Acq92OGoXkgV+wPcyRJYbdDUL1UXF/YIApOJtn1OizOTpe7d1Gubb1UKKfyDH/t+fw4
	mqZRdygReU4gf0rRVhrPBHcZB4/CNIH9P6zjulszWXCvPqIodqns0zqEQDBM9Wipvvp1yBUuxPZ
	Dfvn5joF+2gwLQRS/utdOACofyKbQp3tyEwIizy4vNcntKsxzNTmd60M4IdgebbtvFIb79OYcjF
	VWz8Am6ForYIeosla396ckfV8MR8krunZsoX/+7KZVHxcQvmRqrf0jiDNDArFtVTPFfSaxpU2C4
	VZwRMQGC8f0dGA2rgREpqLbm4ZaUw1hroCT0ngVSBUwg2/1bu1PoGePaIxxzsVPWI+WmeFcbC5B
	+T4pUkJ+0a84IADlTvszey/o9yk5GlhdJtdM4mThvUQ36KjHCVdcJo9vJXcSjyiTBKgcFFO7PeR
	Bgl3RIP8ZGvr+DFQ==
X-Received: by 2002:a05:6808:6f91:b0:486:7e34:ebac with SMTP id 5614622812f47-4872f608696mr9488778b6e.42.1781526652562;
        Mon, 15 Jun 2026 05:30:52 -0700 (PDT)
X-Received: by 2002:a05:6808:6f91:b0:486:7e34:ebac with SMTP id 5614622812f47-4872f608696mr9488748b6e.42.1781526652092;
        Mon, 15 Jun 2026 05:30:52 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30? ([2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea963cf8sm203208835e9.2.2026.06.15.05.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:30:51 -0700 (PDT)
Message-ID: <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:30:49 +0200
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
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lgX7RH2_69FECc9NWAUvpSkScyJwGiU_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfX1soSLwAIARYD
 IKvomLJGOzRfA6u2DigVqFZ1gtkkRVpYcFzFvDZlw4kaxYtio4tDuckSbQWSS377aZNOd823rAJ
 QNHSFzm5b9y0SfN6tE2YILLvmRJIgFk=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a2ff07d cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=vdW527L6AYu-INn279QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: lgX7RH2_69FECc9NWAUvpSkScyJwGiU_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfX4NYQdMMxhslE
 ALOrLG6uWZwTMoEyLvFovNSR73ow3RhdsWZwJMXgLJDvOvgFHosddB+eyf3xbPYEzlXlO5R8tCF
 mM4K+jH3cgCeDPSamEzaomOJMHQ0pds99GpOXS0a+CES9iqbXCywtz92TkfrJW5e8WC+luFo7Ib
 3j+nmnrk48Bl5Hhkg/Rx6JaDZyJJ6GX7aYOXRoTB7w4MywaroytLWY1M4C8q+5FXOGZ+EYDE/UX
 Fr59AG/OVli2qgazCdJQYsL5L5bMAj+6nQYc92ACyZ62qGbMUjQn8XkSkwAprKZH1hcnXJavk52
 LAnU2jI4t0B+Xje0i2DJLfuVp5nAa9OqKwozqKQFqPkPvxtcIeepcBpq14fkGh4JbXBBIzendp8
 +PaxhMi4nsCeyawj+3F/2YzaSFyodmBTmmBfu6rzx8Tiky0ASRkQ/SJsq1oiHJuUUm4mTGfmQpW
 sULb2o0KzRsXUXDVrNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113176-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 504F668645D

Hi Gaurav,

Le 15/06/2026 à 14:12, Gaurav Kohli a écrit :
> 
> 
> On 6/15/2026 4:04 PM, Daniel Lezcano wrote:
>> On 6/13/26 13:05, Gaurav Kohli wrote:
>>>
>>>
>>> On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
>>>> On 12/06/2026 15:52, Gaurav Kohli wrote:
>>>>>
>>>>>
>>>>> On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
>>>>>> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>>>>>>> Why? And where is this generic property defined? You cannot just
>>>>>>>> sprinkle generic properties in random bindings.
>>>>>>>>
>>>>>>>
>>>>>>> Ack, will add why part.
>>>>>>> These names are matched with the thermal mitigation device 
>>>>>>> identifiers
>>>>>>> populated by remote firmware over QMI and define mitigation 
>>>>>>> devices are
>>>>>>> exposed as cooling devices.
>>>>>>
>>>>>> No, -names correspond to values passed via DT, not some remote 
>>>>>> firmware.
>>>>>> The remote firmware should give you interface which is explicit 
>>>>>> and does
>>>>>> not need such properties.
>>>>>
>>>>> thanks Krzysztof for review, We need tmd-names because of following 
>>>>> reasons:
>>>>>
>>>>> Following Daniel's series [1], the thermal framework supports
>>>>> mapping multiple cooling devices per remoteproc/device via indexed
>>>>> cooling-cells.
>>>>>
>>>>> 1) The thermal framework's cooling-maps reference
>>>>> cooling devices by index (for #cooling-cells = <3>). Without tmd- 
>>>>> names,
>>>>> there's no way to know which index corresponds to which TMD, as 
>>>>> firmware
>>>>> may return tmd-names in any order.
>>>>>
>>>>> below are the changes post new thermal mapping changes:
>>>>> DT: tmd-names = "cdsp_sw", "xyz";
>>>>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>>>>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
>>>>
>>>> names property are not to instruct drivers to register or not to
>>>> register something.
>>>>
>>>> I don't understand the problem and explanation in the binding is
>>>> basically non-existing.
>>>>
>>>> Remember that all lists and indices ARE FIXED, so driver knows exactly
>>>> which index means what.
>>>>
>>>
>>> thanks for review, shall i use driver data, which is basically pas 
>>> data structure like below:
>>>
>>> static const struct qcom_pas_data {
>>>      .crash_reason_smem = 601,
>>>      .firmware_name = "cdsp.mdt",
>>>      .tmd_names = (const char *[]){"xyz", NULL},
>>>      .num_tmds = 1,
>>>
>>> Is something like above acceptable? and this will also help to filter 
>>> tmd names as well?
>>
>>
>> How the thermal framework will bind the thermal zone with the TMD ? 
>> (node pointer, id) ?
>>
> 
> Hi Daniel,
> 
> thanks for review.
> 
> With id only, in this case instead of taking tmd names from device tree, 
> qmi_tmd will take tmd name from pas_data(driver) and register with the 
> cooling framework with id only. Please let us know if this looks fine.
May be I'm missing something but:

  - The QMI TMD returns a list of names, not ids
  - The QMI TMD may return the list in different order than assumed
  - The cooling map index points to the name of the TMD in the DT
  - This name is used to match the name in the aformentionned list
  - The index in the list and the id in the DT can differ

Krzysztof , I don't get why having the TMD names as properties is wrong, 
they describes the existing TMDs on the system and the cooling maps 
index points to the one to be connected with thermal zone.


