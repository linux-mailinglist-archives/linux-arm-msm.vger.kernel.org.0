Return-Path: <linux-arm-msm+bounces-110501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGKmJOcVHWqIVgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 07:17:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE16199B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 07:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C5B03010BA1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 05:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF4332B103;
	Mon,  1 Jun 2026 05:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfH4QDxN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMDp2Z2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C1D1E8332
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 05:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780291038; cv=none; b=X5//xfxlB8KgVPRigce6LcZPWRkGsFbaHBSfL55L4mL1Sq/yWP19pT2KNzjiWmuHJcDXHW5kfvyzvsyIPpE8Xa+F3y8MMkyuaAF8SPtB73hZHU2c0wU3vO1sXmk1/W4mT0SKjyJMXscIMiK62XgmBmd1AIsJ65mCPPclDOFXEQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780291038; c=relaxed/simple;
	bh=6gsGCN9fywOATamR24kEHpzEum26tdu1tLiSViwkxpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBS5jPOufOpRXI60+HY4/c+loiH+albNY5n8puAyYne1KwCQqBXay8qMihuFLHdLDSIxpKLDj6B+g3x72FYnU9hp8Rjck+xAdD/8HEv58Z1qmi4wgbB7GlR4FU2nnabTJr5XsDnWgMINx0KIoyVGX9+dKyjg2RyQIp2kpcpsMsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfH4QDxN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMDp2Z2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6514I1fP1413774
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 05:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhDV9pl06TXs/rs3qAQNP2Kc91MF0S9ipRtDBoJkiVI=; b=TfH4QDxN1b645pWo
	JhC33efiy8Mhk6eu/lAtEE9GPc7Txr07P07e/YmpdG9Jgi0PSqLxrqK8bS13NQdF
	YAJSbTuOmAtsIQ2108+RfZ+RyK0ODulz/VuVHIlusJlkYAs5wdSGOV+3EmvnJ4vc
	2WMaO0eYwhPMRA9E8hA5xt/0Xce2mi61UJNX6wuHFqB+9rF8UoEbbMZd7zVK4DAe
	B9tiaFEsttDAqzx3cCsFVU4FvwaCr0WsoEWLiW3QgB/FMTSD8HBfxYbfHb3O9GAj
	nT6jhF2Y2bJ8bJclZ1Ex++GmsC7MjeK1uxOcDE9TmQpUbhwxrAMZi5FfLAPHaVgT
	oMdUnQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8ppbr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 05:17:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so18962905ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780291035; x=1780895835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhDV9pl06TXs/rs3qAQNP2Kc91MF0S9ipRtDBoJkiVI=;
        b=NMDp2Z2AxHfDMPV1xJMWIin79HhPd0kIrd91Z0WlqURfa9trm73dZm2zzvZWNkk9RA
         3x280SXhf8S3DVs9HqEtBidpVtUpu1tGKYYo5WQaLhKb/shC3KoFVhq94K8+XoN0c9BH
         11zSxLlUPcd5fOygLDRQpmDAH61rVyt7EPHcZe/CSR+V84W6vZP7hsikjKDYwxkE28eG
         4vHu+drPa0O2YWKTyybwAZYlQCrRFH4HdTKSULVy2ZtYW13/kFd9Fn7Bt+9ApnE5LtOS
         fgAamyEUZCx5gODuQZZTK/KtkrIFa7JABS15pEzB2/oI4jowBuTuCoYlxIfSTULJ+64E
         9wJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780291035; x=1780895835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhDV9pl06TXs/rs3qAQNP2Kc91MF0S9ipRtDBoJkiVI=;
        b=GV2bSev2SfsHpZ2w7hstPty4PcQ2HtRzn3L7sayXiJIOHnHwfQQfkdh9momxkca5Dg
         4ueo4h9Il/SbA9heqx4gvw0DSDf0LdxHdglMNTbaO9hhY1FODG4En5kJ3R8wxWaddT9a
         wxtbHPHi+hTfBmCi9LPKHhQ5/BHnDR+VMjYZHc1AnB17QN/uDdcqqCb/rrhJNlGIesSI
         yShMso4xkGRxFhN3J0cjuEs1Cht2ZJT/8yPwTxSv6OpWJQD3NYOhNdlaOHlpeVCUqkto
         ks9Z+omsAJmhOyG0Iy+7UY+5BvYiKV45qsCvElZcoHvo1RqYJGy+Siibbyyj/tP1Vp6A
         l+Lg==
X-Gm-Message-State: AOJu0YzMf2of/8n36Xr/4yNOa8mzsbaYfyogh20tA7+lQRRyifg5I6+y
	H4eJltBRIRxlBFkG+TD4VVYoDO4B/LfRX37Gx/8J/j5zHmGvgpHOqfknMNEIIhv/ckykhdzRO85
	oDn2H7M2h/lxSlg117qGs/fO60sbSzetxFD1scMZ/LbVspe6P1BE0VKnh2vLmw/wGiDAY
X-Gm-Gg: Acq92OG9DL7+fD1BHfTMV/VvRi7WRIi/2L4Wpe8wi/1tgnPxjCDBd1luEjqYZxt8Khg
	l6mNVTHORmZABXeErFQTsU6lylyvN/UieFH4zoaczHDLNJXV3c1PFC1XDgngtzlz/D8in/TGXth
	cSyHaI8Ye70x155fV39w9VGZgPV+5ensa/Pf29+rS8zlWZEHHPWnR7CaO9O7SVSPRUgL5opvVwl
	Au6pfsG/byUThgR1qNkpVv/SVtTHlr8r9x8iSUPtFTd0WJYJRyrIc3HQDOgNAaCOpGSs44Td0YU
	k6+Cu4ySuA/CAGlsiz2mBSJgRZoy7OhBGUYMZ1S9JoJkCwsV4AyAejrF1x0aWrH6x2Gsa5v+Dvs
	Hn+MuLj+qw5uTLnUdwJae3wQORJDCIRPlvMy8uQITqp2xizpsNiy0eI6XnQ0RIMIet6Ns+Ht9eO
	ECJqYwXnwETxqG3WHsqsG47z0f
X-Received: by 2002:a17:902:ea07:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2bf3685df7dmr109697365ad.31.1780291034861;
        Sun, 31 May 2026 22:17:14 -0700 (PDT)
X-Received: by 2002:a17:902:ea07:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2bf3685df7dmr109697055ad.31.1780291034415;
        Sun, 31 May 2026 22:17:14 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b01727sm96486175ad.53.2026.05.31.22.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:17:13 -0700 (PDT)
Message-ID: <155c7b48-6fa6-4f25-8b0f-4e9081d5fadf@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:17:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] pinctrl: qcom: spmi-gpio: Rearchitect for flexible
 group support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-3-3a6a025392bf@oss.qualcomm.com>
 <20260530-fervent-snobbish-silkworm-24ddae@quoll>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260530-fervent-snobbish-silkworm-24ddae@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: inQnbLLVHage6GNNmK72slSpQPBBuzUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1MSBTYWx0ZWRfX+xHnrr7IxtLV
 WT2RgytZblnmqT4aooEAsOneFPEa9gscZ369HrLE/BhKVYEEoO5SrWIiz8hL+lUWMTiKGAN31wt
 8bXnSFyyzby9qa5urfyANzdnmVdX3SUBaxG7Xc+5uiVirvK3A4nKMyF85eZ/DaEpafTUeBEnr9m
 YeaHYhgFtu47byk+fenvfyePd9r2ej6RzA9xgGnJJ2E6yvvo3xHIua5VWKKn/qKgnzbf452Ifgx
 oRdyfpY1TP8JhNeh8itiwrlH4EMMFKCyjvoQIrEAtGSafGM2esLxyehmzapnITg0jXtIQZdKXgK
 tD4mxJ9qAoK7RgZZWgQAHtVMadQqDLTqi4yHY0uaTUmW6rv6T2R+psrz4NcXM65lRNtLgvcdzj6
 5aEV7mnWl0IlqDyBoHVwfM72bs1O3FfflWb6Q4C8IZodqWa73XhlOl+dijbaTvXj1uDzJ3nTiaf
 5s/xiF918i9BtWkxb7w==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1d15dc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=43zHNb41aA7duc6R1F0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: inQnbLLVHage6GNNmK72slSpQPBBuzUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010051
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-110501-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2ABE16199B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/30/2026 6:31 PM, Krzysztof Kozlowski wrote:
> On Thu, May 28, 2026 at 06:05:37PM -0700, Fenglin Wu wrote:
>> Currently, the driver treats each pin as a group, and every pin or
>> group can function correctly in all existing functions. However,
>> this approach is no longer valid since some PMIC pins only operate
>> together in specific functions, which are limited to certain GPIO
>> groups. For example, in pmh0101, the level-shifter function is
>> supported only between GPIO pairs like GPIO11/12, GPIO13/14,
>> GPIO15/16, and GPIO17/18.
>>
>> To better accommodate these new functions and restrict GPIOs to
>> those that support them, rearchitect the driver to enable flexible
>> pinctrl group configurations by utilizing the generic pinctrl group
>> and function APIs.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig             |   2 +
>>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 377 +++++++++++++++++++++----------
> And now make this built-in and RPMH as module, then build it. Does
> it build?
Thanks. I missed to add the dependency in patch4 which really adds the 
rpmh control. I will update the Kconfig to make it depends on rpmh and 
cmd-db drivers.
> Best regards,
> Krzysztof
>

