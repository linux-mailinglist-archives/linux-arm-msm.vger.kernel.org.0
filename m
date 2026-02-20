Return-Path: <linux-arm-msm+bounces-93454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP5wFkkJmGnI/QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:12:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C88C7165311
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 08:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9474B304D16D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 07:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4388C2D238A;
	Fri, 20 Feb 2026 07:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZjrIxvlb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GfcV1Gwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE15F2D5932
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 07:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771571285; cv=none; b=A6tNi7KsRiUeDizzBfW2qNIebwu56DRpdwXYMsZOTP6qZihMjFoeDtmtdPS7AswN/aWBtJ2AxvmJ+JT74rtWNsTeh86Y17e/YjEFsv+OEMlFw0AHGw3MxTVS+H729GYgGp4h+RS3+2WPiHVK9YPKy6ADbNO7fe4fI+r1W1Titbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771571285; c=relaxed/simple;
	bh=8hHq0y4yqjJXzFG++LTN+ocSd+DjIB8+315KMSLtfBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0Lo/8T78Bm7LRYtFfAUF8oe0raHAVbSqYu/78gGTn/pTnkOkOiDyFcQT8a1RRK1EIPC1620PC44yf1pMMRizlNJwBHnjNahTpbznQoQg+xhgPtpKDgT4V+3/CSfnH/WMBLvPaWyH4OUrqUpj8gsyxgyl8kx8M8u6Fr2lsqVHwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZjrIxvlb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GfcV1Gwo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RmCM3154473
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 07:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VLhd8JXEVDO9ThhHOsBw5LfzKqFkIBqhG+HhAyr9PQo=; b=ZjrIxvlbKPwrbzop
	8y5VrS3raHxn8fvIT8XkqJzMKp+XnOXx9ROFEIjdl7fVYLEgFDDj2rLFjB+TsW01
	3w4YnvxJJX92pj9qsAJ2Sir+3mbWI9Sws2k9TUtXqfhRj8puLAo5Jw6y+ceUQSgR
	hRFWeml5UH3P8cvlbPFKnd/BAYV7JYznWAtnlQvmfHGpmgnMOcaXAoM19pa6ojVh
	QzCnIudZDfOuNIXcFjQ4U2PBKyKcBQb8qKo3x9NUa9lDKDCw0rWsYIn+MR4BlltK
	SYFic7pN2FgVeWpv4Z3rnoVQ/GpwWVsUZ5QMRVTHDjyt2ntTpVnRZT+D1nuw7ViW
	i4Bajg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh7bg83m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 07:08:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6e7fc97c25so801136a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 23:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771571282; x=1772176082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLhd8JXEVDO9ThhHOsBw5LfzKqFkIBqhG+HhAyr9PQo=;
        b=GfcV1GwoVfQeuHgh4DDA4Amtic3ZEr8AzfQjVXf/5QNfVWcukA/h6ttWS9SWUIRcDs
         6pmT7QEx9eL9rVpc3Vy2U0VOxa2960Z8k6grBbxJ3Zd3QSt2beJo6FYKtrsb3A//4Zhl
         17ijRnc2oaMturD5fU2m0YFDE98Px8r3ZKgsWc7DIOsPdkPDgkJNK+wPqq47focU1qFA
         2Wrjpx2NnSH+k/jUrqUqqHCPQ8b1VAeMnH8XE4px6Q929Fv6eqU/rliouXIp/RbVTzVW
         jrx3KjKRtX8+1G53fRYTVxrA0c9QEqC557ULohCO6eG8M1+oRColFtNJskJEmoHgWe6F
         AjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771571282; x=1772176082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLhd8JXEVDO9ThhHOsBw5LfzKqFkIBqhG+HhAyr9PQo=;
        b=r4joSvu4rGSy7Awu72OITrfWTUTw797h9HpBRjtonBPiZnxCsCew++WD2V7kwpvug6
         CxiK5JCIHaToFzmd72NGAVASOHeSq1CZBs5bBLEn5VRj71Oesp5GW14m0p55ciGfHS56
         +wKXMW93D5hScB4bYH6ecRTzfqIT3XV7p8ttcFjqdBHFFjAX2YkOBliFFavtEMAF2J90
         5llRb4JdpNsfmB/Un1Y9ioKT8sE+wqLf5Ssj4Xkm5ykLLQWqL9qMdpc6gURT7loVv4Gg
         GFToRkuOPN5h63ANqhjrDqjUEFM42i33Er0pyOebvCSNr0NznhICaikcs149rd9i2XoR
         aK+g==
X-Forwarded-Encrypted: i=1; AJvYcCX95sUiNXIPPFbn3cESUzYq0ua4jgob0aZaRz/XDICrzWo9lQEI86KTjUKCnVBzlXFlBaag90pqZ2PMCjFM@vger.kernel.org
X-Gm-Message-State: AOJu0YyEOSBodipA0omffS9hV6adNTFmLjpCJsBW5PRjzQ3g2mwC4ffJ
	Bjmjlet2LPnmbj1ewYguJ0V7jTWEyPtpXsdCJGrq9+0ciA/lQPzZhcAYeOi7QTWbeQcPF1pw4Jx
	46bLQafbCQILYSqQxNgSFLY8T4Q3WSYoF56bsJAOPiaIvNBUipgR04vSZpZMqV9Pfqk51
X-Gm-Gg: AZuq6aKE5f+BP9/QM0lgE5TJS3O7CThvDEnOlpXFPM6gm4ijvGREuePxOGrTGA3W8OO
	2RC1CGkg2pk4/S1NNePhweTb2UBh3WWws9KJlqIbCeXEvy6jCi7hunUmkbtwUYwkECwkiB9ialW
	DoYhaGiAXoxNowlMIKa804TypDkB1IJZgbzI7OxUdpv/5S1Y/EpQfnllyX6d5votQ7qtJGSG8KA
	6IYheS/Ij8cXRojwpShSAz15gKE76wC1YvrgDtAmHVzfKV0dmTplyCa1Pdym5sTqJXFThkEH29E
	jGl8Px3pVgkMi/xBgOc/6bXzKqt2nOng5sCeR/lCvaxJfgUbaO3X7LBwhNjKY+3qf9dIPYAr6yW
	CFWxSvjRB6kfFCCvLwAEEFGJGl9lmglmjN6COEv6Cmqj5X2f24g==
X-Received: by 2002:a05:6a21:3391:b0:38b:d93f:bbf5 with SMTP id adf61e73a8af0-39466eb3506mr18203650637.0.1771571281803;
        Thu, 19 Feb 2026 23:08:01 -0800 (PST)
X-Received: by 2002:a05:6a21:3391:b0:38b:d93f:bbf5 with SMTP id adf61e73a8af0-39466eb3506mr18203638637.0.1771571281345;
        Thu, 19 Feb 2026 23:08:01 -0800 (PST)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a546edsm21922234b3a.25.2026.02.19.23.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 23:08:00 -0800 (PST)
Message-ID: <52c46cfb-891d-49db-8d84-b8994bc9ed9d@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 12:37:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
 <z7y7gpfhrxgsxsqlsxmkwyr3zemvwpnpfuegv43ne56g5rsfl4@pehu3vloqjsy>
 <ec672f6b-2b8f-4241-825e-4b3e6d910762@oss.qualcomm.com>
 <xdnbcpwm6cibkmy3dzyzmllqaax5rihbdevdbi6nl37orblcgi@glmdzirllpst>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <xdnbcpwm6cibkmy3dzyzmllqaax5rihbdevdbi6nl37orblcgi@glmdzirllpst>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Voguwu2n c=1 sm=1 tr=0 ts=69980852 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=GaVuqHfzAwwAF55UOU8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: M8VUaDuDzQxA-ySbqtmCBZjYMWORCibb
X-Proofpoint-GUID: M8VUaDuDzQxA-ySbqtmCBZjYMWORCibb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA2MSBTYWx0ZWRfXwNUp0zL8mx0Y
 QvNet8E4OYo7FNAlmBpHaKDCA3iA8CysA6aHc3co0S7OC6/UkrCACuxCfCXcbO9h51bxDNAVXBi
 R/r4EX/su5N6lKgt2qAAvidsmB1QZn8IrskdrLIAKEMRI+h5QAvPuessWl6bUTyz3bPx9XcjIif
 wgSB94ICOgJkQKugYymKMwcnSoortbDpqGrqJOuXoobmHLzNSQqsLLG+z9ezFqwaS1QEXzowjOC
 ceBMy4cPA2t6iSO6TbebUi3WX69n90ggWMD19zj8yREgVFlqeY+0rW+GZV4SJRno4X6UuSBphS0
 eGD+kWdduzicmOOBz8GE3wGAxWB4U82xColFJPRcDwxIiGMRQTdpvrP+4PaX/6rqmOT2xUK6a3i
 3ittqIE7Fws2tHcNwOcrK5/WFow5U02dzoI1oE67+ushHFftjMk0AUgncAisg3gZLVZnP2JqPZF
 hmdhsLJFzFgQ06geCvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200061
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93454-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.52:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C88C7165311
X-Rspamd-Action: no action


On 2/18/2026 2:26 AM, Bjorn Andersson wrote:
> On Mon, Feb 16, 2026 at 01:44:40PM +0530, Umang Chheda wrote:
>> Hello Bjorn,
>>
>> On 2/13/2026 1:33 AM, Bjorn Andersson wrote:
>>> On Tue, Feb 10, 2026 at 04:08:21PM +0530, Umang Chheda wrote:
>>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-mezzanine.dtso
>>> [..]
>>>> +&i2c15 {
>>>> +	#address-cells = <1>;
>>>> +	#size-cells = <0>;
>>> Do we need to repeat this? It's in the top-level i2c15 definition
>>> already?
>> Yes this is required to be repeated in case of DTSO -- else seeing DT
>> binding error if these cells are not added here. Seems the compiler is
>> not looking at what is present in the Base DT first and is considering
>> the default values for address and size cells and throwing error. Had
>> to add similarly add for PCIe node as well to suppress binding errors.
>>
> Understood, no concerns then. Thanks for helping me understand.
>
>>>> +
>>>> +	status = "okay";
>>> I presume this overlay is used on top of monaco-evk.dtb, which already
>>> says that status is okay.
>> Ack
>>
>>>
>>> That said, I don't see a "clock-frequency" in either node, so I presume
>>> you have an error/warning in your kernel log about this. But unless you
>>> have reason to change that in your overlay, I think that's a unrelated
>>> patch on the monaco-evk.dts - which I would like you to send, separately.
>>
>> Ack, will share a separate patch to fix this issue.
>>
>>>> +
>>>> +	eeprom1: eeprom@52 {
>>>> +		compatible = "giantec,gt24c256c", "atmel,24c256";
>>>> +		reg = <0x52>;
>>>> +		pagesize = <64>;
>>>> +
>>>> +		nvmem-layout {
>>>> +			compatible = "fixed-layout";
>>>> +			#address-cells = <1>;
>>>> +			#size-cells = <1>;
>>>> +		};
>>>> +	};
>>>> +};
>>>> +
>>> [..]
>>>> +&tlmm {
>>>> +	tc9563_resx_n: tc9563-resx-state {
>>>> +		pins = "gpio124";
>>>> +		function = "gpio";
>>>> +
>>>> +		bias-disable;
>>>> +		input-disable;
>>>> +		output-enable;
>>>> +		power-source = <0>;
>>> Does these properties really match the TLMM binding? Please double
>>> check.
>> Double checked on this -- all the properties match the TLMM bindings.
>>
> I do believe the logic is binary, so input-disable == output-enable (in
> contrast to the SPMI gpio binding, where those two are configured
> separately). It's not listed among the valid properties for a
> qcom-tlmm-state object, but perhaps I'm misremembering how the
> dt-validator uses those properties


Apologize for the earlier comment, I agree it applies for the SPMI GPIO.

I will remove input-disable and output-enable properties and add

output-high which aligns with the bindings.

>
> But there's no "power-source" for TLMM, you should see an "Unsupported
> config parameter" in the kernel log when you try to apply this setting.

Ack, This property is valid only for the SPMI GPIO and not for the TLMM GPIO.

will remove this property.

>
> Regards,
> Bjorn
>
>>> Regards,
>>> Bjorn
>>>
>>>> +	};
>>>> +};
>>>> --
>>>> 2.34.1
>>
>> Thanks,
>> Umang


Thanks,
Umang


