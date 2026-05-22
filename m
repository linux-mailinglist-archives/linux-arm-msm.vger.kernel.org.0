Return-Path: <linux-arm-msm+bounces-109222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LQ1JHugmEGpoUQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:50:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C135B1780
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5886C3009F04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47ADC3C5528;
	Fri, 22 May 2026 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyS96uHt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FWow4lY/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8653C414F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443294; cv=none; b=pMPIyRiv6Un3Eza73roCdXJf8ERSvTMwlIOYgprn7Pjwz5Dq0Bljgsk0u92E8mugQ4p/1GS+niaY5BhsDuUBKy1s2VptyRnOKlUvnzZ0QqvC8CxtEro+IfApQotaisWeOlrLcpfBxedncxNaP//S7O5DIYb88XJ0H4+QaaRaA4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443294; c=relaxed/simple;
	bh=fnA6TuXjxoD/qV1B06x19WzNk1sYIqRGpslMrz4epBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1/0HjpuwbQ5fWZQwdzD0t2j9ovAHFoHsnDbu1iwu6zTbTFR8kSIQpKckV4C58hhVYSTpPl/HOriOrDIPRsN3zcQMLL+wUJfXk1Z7QbnCcjUZvWfFqLQfxm+w3SLiK0WJf/KI9ltodIQ+qcCLJ6sQ620Olnfo8vPYa2RVikqt0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyS96uHt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FWow4lY/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9C5i93005097
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nxeYY6u/8efyIE6Ut3SOnhqR/Qrg6Pv6nhSejVY4/Uw=; b=KyS96uHtCkpE5n1Z
	uc5oOH2s/296hUuAs+RcnFf5CRcGGR0W1W/RqqXGXFjFSrCdXpqIS9TQpFRfaeu2
	M7avenXbaIkD36PAsueW5xEC8uNDvHthDDNVtLilgy+0nWZzwuVz666xJIK/j/Ju
	Yi8+/sVa5vCxoSxOIrHUlwGypi5MT08n/aXvSeBo8kr0wYhmiE1/vfqg0nZKrcwg
	iAcRaxhkUC/exClJOVte+fVM0XwOuCpagD46sVONTbrrOm0HxydVxvmc5Csfdy9J
	FVfvpNuMDJCZOAvRJ+3DiSFZBu9muHQ0KjxjoaGirewuTp69oeOZculMhDZjVrS6
	0/QqWA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt9d8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:48:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f1b94ac9dso27251971cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779443290; x=1780048090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxeYY6u/8efyIE6Ut3SOnhqR/Qrg6Pv6nhSejVY4/Uw=;
        b=FWow4lY/160LIc+An86OAeZoQBZq5ytgpJNyeF69bMPhbCb7Hsi33CavswpILh3qVc
         7vzvkC9EbNMra2mVPyD5QhNm9ZfJrfs0tmOA+Pc/EI3cqA1VQNdzhr7RglgB/P2AcoR8
         85O6IqdHrLCKS3/wKuvB12quJa4zlG6qmQr0MnPJ12Yoab+QVvDhAQuTQ1SIqcFkQFmY
         B8jB3+cPQroCcMEt2sBD+ByjAtUTfxg9gfQugOUzf1s9ToVMoFXc46Twe/DRIbU5Nd/x
         jpk2La1i9VEmJ2ocrErDwAmDfs2JoJsGujV+oYhBJ9O30CwG4XguJcAtsFfSCcY26fT1
         hdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443290; x=1780048090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxeYY6u/8efyIE6Ut3SOnhqR/Qrg6Pv6nhSejVY4/Uw=;
        b=o3qDbQ7ezvRuJpLZSg/NO8j+1zw+rdmhNq3KswFfMkOZwGfUeo3OqGPfIuRWx4sGFr
         AEeLyz7myol8HLk2n/CnHcF4x9bFGsbOUEYNk2YQCxQaschMAcm/nRVQGoI+aQOjGMMf
         f9B9nMJwzIt/fD2ucyINcgbd6rSsXgn00qwz+uBeO4weI/zb5FNYeHSehHODuZcahm3r
         fxe6OiHg8jp0EnGjpXkkIO289eXxrUTipOxwGyNhqvua6Qdu/YPcks84YE6LMHu/ptu+
         fsnX14KC2BQEZrWY9BDuYcdiF3WqjnE3X8Fz+/UNcuyAY6jdqrpwugnAbZJx9Do563PL
         wbpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zOEUJy6sAOUTDHwQuFaD7zn2z+YhdDd20bjCh+GpP3XYf0xdWSfUvBCCtp2j5VH0BPPUqbub0/P+ygEg/@vger.kernel.org
X-Gm-Message-State: AOJu0YwcLVZ7EFC70oHOGZnr1BJB3Bq5zlumPkRezrlRBfhS3k54MmT1
	OO+paniiqZFn+Bhx1F+jNHBGUn0ZdogEW9dItoEuqZe5sX1cA/gyJzD8E0LiN6v2FuXx4bVOxi+
	9aBJ26FlO10TpYpcZJ3mWt6LBOF99W5NA4YCADVVcgDQd2Xx4rYyC5ldWP8y9dNaJdfar
X-Gm-Gg: Acq92OGNPeIhNu93dQx+SHHo68qasebepFUpQoom7IkbD/MtgesK+tUJ/A/f1zPby2Q
	K4xq0DZ5pZybmSWDJ9UcXFVscH4UgWbERe4LlBgBkHFKbU9ao8F1g0G9q53tj4Ote9D7qc4NeWp
	yY1/Zj/7Fc73+XZPbKGRbdyWk19FI9pdyecmxmOyE1NCgzDdMFH873Fjbztvnyz24JzmbTzJ66Z
	PB9JGl7+9RbbAbXMfm08OqeBuPOOUh14CrrSb2hmRJyEvFo1QfFOIp9WjLWJfQZzHhxkjPKNK1q
	jRr9g0vO7CucWmgTN4IzJTmAL7mwN+Zx3S7DWKM9JSlTsTvGdB1JXIGgccGj6S+oBQT8RFfcfT+
	rQ6CjzSwi7ABglmwtmMGnVfQv9Z878UJ2nCRdgQukKMwJng==
X-Received: by 2002:a05:622a:6116:b0:50d:9138:3322 with SMTP id d75a77b69052e-516d43f5402mr26315341cf.7.1779443289728;
        Fri, 22 May 2026 02:48:09 -0700 (PDT)
X-Received: by 2002:a05:622a:6116:b0:50d:9138:3322 with SMTP id d75a77b69052e-516d43f5402mr26315241cf.7.1779443289307;
        Fri, 22 May 2026 02:48:09 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc3652b34sm36909566b.28.2026.05.22.02.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:48:08 -0700 (PDT)
Message-ID: <24f84ae8-6099-43a1-91a9-b50a0aaeb3e1@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:48:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add QCA2066
 M.2 WiFi/BT support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com>
 <jetl37zsfcs5kl4b7iarbngrdu4ebp7ag2cvpqvkku6tbl6r5n@qozh6n5fq7f3>
 <CAFEp6-0A=LrU44pu2rfUqXW9k9peSu=b2qq_FVs4WZUj-g4pDA@mail.gmail.com>
 <n6kl7y47hztf7tgtdxhakpekwkxlleggv4sbzpsd2ncpill6ii@bdk5esjubv4t>
 <CAFEp6-3Gbd1gzfeu5xdfBJixL6JXaoSFkRUsBjOji0ZEOHHyvw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3Gbd1gzfeu5xdfBJixL6JXaoSFkRUsBjOji0ZEOHHyvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10265a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=aCkQYJryizutyd-nL94A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NyBTYWx0ZWRfX9Ybj/qSOfWZ5
 FtjmhnM9FUstl+ykNYYB/TOjL3TMmN7K+SSYSWD5rD4jxFn2TflAjm2qb4VGjhkZquPT8b8uzio
 4HihVJrd8aRYILKYupZDQkf1NPtJU6qW7sM1veNF/cNj49V2xuIh8lqnbEnBxU0xbEtMy1IFtwc
 NyLBMNbvDqEQgeomrE/9HW1rs7W8o1HJAjS+8gIID5SxpH2s3B3kMXG5A/4FoSbvpCM0NcqBn7F
 S0WJdBK7qi3QcVHh7CBmMwGCkjcupIH6K9ZB2qy4o4vglD5WBaZmWnvZs6PTsjJsCRWk5LpcVV1
 4csjyNwZfwe1GI704o/N4X3WIitPoS7bKOjGcnCOkz7QCQCcy2YzHphR8SjmhMaXIv0SSWrKw40
 8IhXcLBd79VaDzrYew+hiiPj/JL99p8wMYj+I60ZWFykJTeRkodkGySvDZx5Ipz2tHC4QvrHQFN
 fzBmuPiksz4BVWQCh6A==
X-Proofpoint-GUID: qncH2Z7t0qrZT7FltcFFVmzrbTauEZ9B
X-Proofpoint-ORIG-GUID: qncH2Z7t0qrZT7FltcFFVmzrbTauEZ9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109222-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4C135B1780
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 4:41 PM, Loic Poulain wrote:
> On Wed, May 20, 2026 at 4:36 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Wed, May 20, 2026 at 04:29:40PM +0200, Loic Poulain wrote:
>>> On Wed, May 20, 2026 at 2:34 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>
>>>> On Wed, May 20, 2026 at 01:01:44PM +0200, Loic Poulain wrote:
>>>>> Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
>>>>> Arduino VENTUNO Q board. The module is interfaced via LGA and is
>>>>> compatible with the M.2 Key E.
>>>>>
>>>>> Add wireless-lga-connector node using pcie-m2-e-connector binding,
>>>>> connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
>>>>> the Bluetooth interface.
>>>>>
>>>>> Add pcie@1,0 downstream port node with pciclass,0604 compatible so
>>>>> the pci-pwrctrl driver can acquire the power sequencer and enable
>>>>> the M.2 slot before PCIe enumeration.
>>>>>
>>>>> Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
>>>>> (gpio56/gpio55) used by the power sequencer.
>>>>>
>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 65 +++++++++++++++++++++++
>>>>>  1 file changed, 65 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
>>>>> index 93ed575817af1c5e903662c209ead629fe202ee2..6fcad77f320cb82eccb6f07244d185abfb1976d9 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
>>>>> @@ -154,6 +154,39 @@ vreg_nvme: regulator-3p3-m2 {
>>>>>               enable-active-high;
>>>>>               startup-delay-us = <20000>;
>>>>>       };
>>>>> +
>>>>> +     wireless-lga-connector {
>>>>> +             compatible = "pcie-m2-e-connector";
>>>>
>>>> I think it was discussed that LGA can't be an actual M.2 E-key
>>>> connector.
>>>
>>> I am not sure I followed this discussion. Do you mean that I should
>>> introduce a dedicated LGA/vendor-compatible string in the compatible
>>> list of the pcie-m2-e-connector binding, or that LGA-based designs
>>> should not be described using the pcie-m2-e-connector binding (graph
>>> representation)?
>>
>> I think, it should be a separate, vendor-specific compat (maybe using
>> m2-e as a fallback).
> 
> ok, understood.

Oh, I reviewed this before looking at this discussion.. yeah Dmitry's
suggestion is good

Konrad

