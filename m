Return-Path: <linux-arm-msm+bounces-118265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BD7EDV3hUGpg7AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:11:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41273A918
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:11:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BPo48QFM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Fb7YVxra;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118265-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118265-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4317C30D08DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712C542B336;
	Fri, 10 Jul 2026 11:58:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC2A3783D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:58:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684696; cv=none; b=hvltQ+jAfUVSZleiFklBwFfafpeV9dbsFBjXFPXsnEHdl6mlBWU8Qh+fcTQcymApE2YBpOFLV+KTfYk7lWBzcXCuNND2+viUWBocn8InTLXsvwIC2y/nA+zopOO7SijTqcYnACLdH77BTOu49SZe8ku3RUGdad7Maq1boGATRbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684696; c=relaxed/simple;
	bh=VkcTWxOAtWwnKxhTtrukL1zBH5f748SBMo4QHBtBX98=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gR+/ig9PIKcbCFKCya3nJ72TIDE86rMtP6T24/qaZ53IK2XUI8RuUlreY25IGkOesCgzDvxXaQ69zjLB0B0NaYhfdMR2o5YEvolxVU2ojr8GErUgliMX+f32Eo8WVK19RVzCDZSu04OWDDCExX7Yv2wvlU+QWxLtImEZCv3m3Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPo48QFM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fb7YVxra; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmPwg471748
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkcTWxOAtWwnKxhTtrukL1zBH5f748SBMo4QHBtBX98=; b=BPo48QFMZtCWxEAe
	1X6yGesA6w9PKpuTL0A8pXSddiV7D1yXPZ72Tp9DcyyhZ9GNG9Z6TN2/cC+4WWBm
	Fgri4sJpV5EHQt7mWtUiP09O2PdMOAYgq6fvdmO6XiQHNhKED1kKNveArvhRyp9C
	lGy3YaUI2cxQIrlcz8rCUHGBuJlKTwOL2oNzDcy3VKq6ko6KFJNyAyLhF3jWhVrm
	ZjDXEFCJZIeOZShFM8gQJhDFHNTAIah5NvTjw+S20o8cu+n81XYE7/XTpGnYt2H7
	iScaKhjh9rm7SL/bTzms1FE76H5XT4hf/kf8QktIXPHO6TiKikJ1XMLa9cnWxnvf
	n3Z84g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dggdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:58:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so1112026a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783684691; x=1784289491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkcTWxOAtWwnKxhTtrukL1zBH5f748SBMo4QHBtBX98=;
        b=Fb7YVxra8FWmwSwwO7Qq4KJ8nfbUBuTkFISa82uNjSpnJjPoAXYvJRlM/6iw3kPCq5
         QmsMmx7CnSfXIHER7aBSRel5BgXx6pn4R/ZiW99lyWgx15A/41Ndh/ZwL45+LWKs6mTC
         hT4oW0eOPhgM+wG6GlzAha5Z3EvLdPvJ/sglZ8OKcI5I5ZDSjw63iwnkM0VgC3M3tkQJ
         QiLc6fVpQ7jOcrsY8UzmoSBSmQAiGhhJas0wMnrC1aqNFbRJOPA2eP2YwZTiiqjnCaNX
         T8WPhe3rN//ykvpDX77FrUVGpWbX4fHJjHdcJ6OHOhOzv4+VEQzmq3iAzJcSa8Mb4Oj/
         A9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684691; x=1784289491;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkcTWxOAtWwnKxhTtrukL1zBH5f748SBMo4QHBtBX98=;
        b=JRNS/mlym8IM0liwCxnrGVWxUooqN5lGpdzwzNvjSr+B0Crq3CTYIZi+Fq3hZcrL4l
         Hh52Sx9lFpz+5K6DSwA3a8z1YZm++7DvvGTI5bworVH14230m/3CmxF8N+hAlXZ0F18E
         LSe4AzxdUzHDX7PPtLHxYULF6E7XdGeTGSNYMHnd95QYRPE06u5JXUzLOcc9Xuddd7GB
         f1aohLbw2dF7X/heKNHcZj6TTh2jk6wyJWR9jUE/vz3Mt8HjnOYwc67iPd3/qUR+pp0c
         4ElxUAENVCH6Gm5iEDQhhzWXuxNMzllBu/3BFn/VZVWfrlIb86ZXIvAjmat9dOkLuXdE
         uS1w==
X-Gm-Message-State: AOJu0YwY4Kqp07Cb10ZX54xMkv/lXT24StIWOCSDhRChFswmVMQkGyQp
	X4mQ/lOEnS4QeFlbwSWEwh3VUSRFe/nSuD+tM0Lb1z0lB06ZgUwTfpD7TAX5xp5uJYwwu6pph70
	1/FM1t9mfoWllc27M8O0e4DM/ZOAYGDDq0NaZ7NwlfsjHp/aImPoxjh0+hyKhPEMUZXS0
X-Gm-Gg: AfdE7ckXCLcBNeeqwD7nKDpAf2DIpZqduv63OPyMPf3Nf7lk65Mg1FrQ/JDAgoDltDP
	IZYPKiY8DaxRsWjG48EWdeOOL/R/Xa7WDjnfZemR2J3nCKngtv+sfl2i2lNNoF7jFHgDeHsENCd
	50DuN6SBZ67AoYbt/Eysdk05sx0AHsj8KcohiXA4cSnHb2SoJU4kKPm+WfuLIXlyBsnxHhP1krl
	DOGBICwAgb5c1crhphGzYGuKEcD2pQZoSV6QLEeeMGXAJZg7+ijvRDM6QbFWUuvq2ZbAsxcEjw6
	kS2khabTMrLgZZcji11FybkIyLc/6LAgJ2ydTHNYR1Emd/E+yity5I+4b0QxjbSSmgAdOYdf26P
	GupNO0YN0Ymr5KFR1wMcuI8ut4V/2wLWGM9fABVct
X-Received: by 2002:a05:6a21:6e8f:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c0bcea2f17mr13367391637.44.1783684690632;
        Fri, 10 Jul 2026 04:58:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8f:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c0bcea2f17mr13367356637.44.1783684690107;
        Fri, 10 Jul 2026 04:58:10 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm40949164eec.10.2026.07.10.04.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:58:09 -0700 (PDT)
Message-ID: <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 17:28:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfX9gkRBJvzZ4YS
 u8pTHUa9YY4S0Ch3GOWRUSv9LfYU3A2FGKDe/Pv1IrRhvWIltYSSMCVcxQP6/gSKKp3tSww2lvf
 4YPFdw+/rlZw4W8VsBqpMast7OF4jVs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfX7Pkn7cX6YBD9
 ONSR1/XaYk3gPp491PurfNM6AmxkgdnaV9UVXDoWhICp9e2UFyhtWW1Mdckg4HechQO3hluj260
 fb+t14mHIolZIN1oxRgnXL4pyFrCdPJDh7brtx9XJyq4y+GvdI1amJPmrnDDyJjPiQBILVya+xk
 ZCktQwf+okLB+2sfRpu8+4K+LsxrbqGQ29/3neEEeT46IJlZPzh5vMsY2tz2JIt424rubby5G9k
 w/GH5S6DGrTT2vAvzHzt4COmulIfw6jI14oTz9FEBZ52qjcQMFPoIdEKQptQDh5joqdOdRE44uz
 yWhAzt0Lo2trGjlQtL4D8qVtGLAq9YzxjQMDNfQI2A29ahyXtavcB9GF0NIdr0LjMPLsnOv+BYc
 NKLeWuNPhqJwoRaWuWiui4eN07BGpMOIXwyZbOLS+t7PX4VKA5SH3qsl516S9LPREg91g9BCGn4
 ZJACrv7PKe6iE0RZkwg==
X-Proofpoint-GUID: PHP-9ZH63ZDS2XoF5N8Nd5S457-t3E-E
X-Proofpoint-ORIG-GUID: PHP-9ZH63ZDS2XoF5N8Nd5S457-t3E-E
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50de53 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FW7Uz84xZHR0K0vXMAYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118265-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A41273A918

Hi Konrad,

On 7/10/2026 2:31 PM, Arpit Saini wrote:
> Hi Konrad,
>
> On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
>> On 7/6/26 8:04 AM, Nabige Aala wrote:
>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>
>>> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
>>> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
>>> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
>>>
>>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +    panel_bl_en: panel-bl-en-state {
>>> +        pins = "gpio91";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-disable;
>>> +        output-high;
>>> +    };
>>> +
>>> +    panel_bl_en_suspend: panel-bl-en-suspend-state {
>>> +        pins = "gpio91";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-pull-down;
>>> +        output-low;
>>> +    };
>> output-foo isn't necessary, the panel driver will assert it as
>> necessary
>>
>> Konrad
>
> Ack, thanks for pointing out.
>
> Arpit
>
I just checked,

Normally the backlight EN pin is controlled by a backlight driver.

However, this panel uses MIPI DCS based backlight control with no

separate backlight driver. Since there is no driver to assert gpio91,

we control it via the panel's pinctrl default state..

So this is platform specific pin , we need this to enable/disable

the backlight.


Thanks,

Arpit


