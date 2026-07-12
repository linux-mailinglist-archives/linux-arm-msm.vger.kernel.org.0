Return-Path: <linux-arm-msm+bounces-118540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qIm2KlZUU2p6ZwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 10:46:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352D7442F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 10:46:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ZJWBwY/2";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Uww/Zk8T";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118540-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118540-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96C5B3013ED9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 08:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D97399342;
	Sun, 12 Jul 2026 08:46:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E5239656D
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 08:46:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783845965; cv=none; b=WyOheD/a9Cv8HHRmf4PEzhWp1E8vmCYqzMNel7NUiMa0SBW1kubnxWpJa2AYs/XgEajymI3m3cpRuGlX5Jyycv2zlBPOSUdMhThMaCh6b31m6j2ZShC7lNuINn+y3E3KZnt0XDCR9PsJJaMmnboqk6KVl0qJ7iftcU89e6sUm2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783845965; c=relaxed/simple;
	bh=zWHY5hZ/8Ox8s31q8zApgayyvinHfRJ82OuShKdkkZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwKAl+f9G5gUH4eB6cFJ/kjoVJpQnKIloJ2nWh+6MQ7dNdafg0eroceH8rr13XBl0uBXHbgTk6jRTxYUYw06oBaHWG2rH9rXIdQipN00g7FSmCST1oLUxiCwLjO4jjgb/RHOUO9WsFI37Go4seUQAAykNWT2rKLPBVMrKt+EaV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJWBwY/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uww/Zk8T; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7THsD1903596
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 08:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xf+qvVGz/Rsik4m6OuGXL2+Wevl0zm2bIBnoam/yT74=; b=ZJWBwY/2zF1me725
	90VJ/QBNnyioXyxDHWnp7KXHE8WW2sN1f62N6wjE+8iPYpJi4NO+L28xvXpJ3IkD
	fYeds8VnVfdRTrVpSCVONzu0tNLvCYajb/+Me6YLuZzicbZWIujftU7ik+iwHg2U
	/AOJl/tge6f8XQOdpVv+4AYQ4ziVgyScAWfgww6anajW0gl4D4F9kw42QfsFWCd9
	+h+xdO747XHVL7jnvtCxdciMKGSn9kd9f4j27SHtjRoM35E9+Yb//rpph7dRV4GD
	2x6aQK30vBaTegOiSp24/PWHTRQDbLypejsefj5XywdOmaB0rNf++rZUIPcJ9O6j
	DshVsA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe912geh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 08:45:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso497578a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783845950; x=1784450750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xf+qvVGz/Rsik4m6OuGXL2+Wevl0zm2bIBnoam/yT74=;
        b=Uww/Zk8TwLuNsUXVN8zW2gX7XxAiKH9aLyTJgVQ2tLRYfMp5XOUYWJyWltrGnvAFi+
         ey9cyHJ/kHoLXKW/diWNqHewoTVXmsMsuAQY6o+neQgG7MMN1VA31IJsfSgBzs/JmfKF
         Zi9STE/kxcOQJ/IdrqYBAsz4gh9+MlU6I32bj5Yl59uugMAlSRgkOHHn8MO6msDMOj39
         fjHJj+KXc+mJv8tj7rHVcqKg8M/VWkc6GcOLBkXSfre1Az/myXY6LFcdqiRPLxNF+7Uk
         BfB8ogstne5WqKCSmXkxRpiKU8rkh9JVKu+E2BQxFlLWuUuuAGJ5MCtLqcSZXT8nQn3A
         lz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783845950; x=1784450750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xf+qvVGz/Rsik4m6OuGXL2+Wevl0zm2bIBnoam/yT74=;
        b=bBqD9F/EGl6gV4G6v6wEQdaglV4ORVy1lrLb02CrVwt1IxTQs0nPbPL/ln7Z70uPku
         rRQ5mB/4Vn9LPq4fDfnYj2fkeogqkWDTvXpoRoqWufIrCFU9J/dNRM3xyp1dvGTL0QUz
         7GHi/fQU5D3BQa7EjKWCzF8TBQAyqfGQk0YAAbnwR1AW2ouaIzlwPdf/3Aa0/9/a3X+m
         FDxOadjmIy1+gYXsqv8RdCSI4Nd9zAycHTGYWlvE8D4pGqe1lklhRRJHnIcQDKjntAiS
         tXDo3WOQ3/MDOVaqpe7wcDoQvHte0NaVP5DmUDpfslxotN28njxfHU6pUMNLsr8FW+gL
         k3vA==
X-Forwarded-Encrypted: i=1; AHgh+RpTp2rxkwOAbKxJYZKHmCD8XgL0vMPpSSzBJeGDwgQaxz+O+yLmJg9twqKVY6qHlSi9IBitL5G0lvlwFk8Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8O327ean3tIBBb9d7lIUuF0iOZoceZ0C8ZS/jgdCMSDF2/C+6
	D97E7rI0Pym+oAzPwWKNc48uW9p/J/BlVlIIxZ7lPTdCz4k+raGIprfOmzLhu3Oet2JG3mkuOsc
	Zs98rd+AAfZg747B17i5CtWpuF7TjUynCjU+ocaqPMy5A/uVG3gC2x844qKoajyLEfrKwWrZu4O
	Tv
X-Gm-Gg: AfdE7cnjzeF8d+Sn049trmt8/IUczMSw1PkiB0QNvTbvgBmyiO9Bc/LVdmPs1ZVOZtq
	Y11MPGNgypot0z7aK7cczTlnMhGNejvDA5YrjEHIz8ZrJgduulVnTiSaj4SmPrHV79seVMY55PE
	a9XSGoooCJOaoxYMjybecmSEI3YIcpCCC4i9gu/jw3iCNWhIWx/sXzFC+OwmwQ8pXMDFT+TOjng
	XVN5F26b5ZYas0tE1j5yWWkyRaRh6AmITtBhTiauogd4T55NcWaXXuI7fHtA9H6kEnlrbFZb+c6
	EAOP16Cvi9/WrTrVn51qdSktxdOkdSBb7v6z+PltwSyANhMW6B0GrXpClaUioOZ+Q+SPTu/ww+P
	IggDwXCL1jQyTyB/MBASvqEbjVrjgB5jArw3WwQHwRzCTqHFAXA==
X-Received: by 2002:a05:6a21:e083:b0:3bf:7fa5:8922 with SMTP id adf61e73a8af0-3c1100092dfmr5538567637.2.1783845950582;
        Sun, 12 Jul 2026 01:45:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:e083:b0:3bf:7fa5:8922 with SMTP id adf61e73a8af0-3c1100092dfmr5538544637.2.1783845950089;
        Sun, 12 Jul 2026 01:45:50 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.92.133])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm62094370c88.12.2026.07.12.01.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 01:45:49 -0700 (PDT)
Message-ID: <b1b896a6-aae1-484b-ae1a-5a08efb82c4d@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 14:15:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260711125740.3083236-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260711-mauve-skunk-of-contentment-f51be0@quoll>
 <6438237f-ccb4-4143-9ac7-43f5dcca955b@oss.qualcomm.com>
 <2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a535444 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=tlK9sNgGSfv7srgBb5RqhA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XwPME6NCRsOL8v_XlRkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDA4OSBTYWx0ZWRfX9bfNZzjkV4WK
 Lb1ImaS73zZePNJZdjfXdjN1+aZVOjh6AvAVp9euoLDbztTyQpljllbKc1YchXlL8I0sIUQnYmf
 lNowNCsQcfSaa/8++25S9V0QurB9urk=
X-Proofpoint-GUID: pMDshaiSXc6EAAs1EZP8dOShjVzS29fK
X-Proofpoint-ORIG-GUID: pMDshaiSXc6EAAs1EZP8dOShjVzS29fK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDA4OSBTYWx0ZWRfX2GEU4uWAeIFd
 kRssEYnhQOHv354ofWFuklVmRYP/UOPL35cdClo29G4uTfZP0CEzgRMnQwAEg2xgBguLOyoZXlj
 KCprpPohBWLz9Mt7EZvW6ZkceZX+dvNUXIYgUWLcxKW/D9btEYzNK73wmfwyLdbpA+xOJjsVCGb
 p+Oo2p7sK/rLH0mxiQfB0YYdZCxvHzOs3n1OqY8lc8p+knLvMX3UH8nFLauhO8eh5X9KAP4Rml4
 peYrEkkVkfYAP/78qnGHy85G2PGR1ekH7RLrFspWs4CNFluwj+O2ftt/UirHr3Xo6hNbKzq7E3K
 V2OYz0oost21ba7VR2Up50MMBSV5miynqRstnihO0zIfnl1ewinu/njJ8xoyZJ8FCYpvUomZEd3
 eTuA3V2q5o6Mpe5tdaXdZS7NTt7TRgJaOOth9rkJu623pLGdm+sie9u8DcZouwOrXsvZy4P8xTL
 3sMbp0YP6lME42v5lBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-118540-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1352D7442F8



On 7/12/2026 1:41 PM, Krzysztof Kozlowski wrote:
> On 12/07/2026 08:44, Mohammad Rafi Shaik wrote:
>>
>>
>> On 7/11/2026 8:41 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Jul 11, 2026 at 06:27:38PM +0530, Mohammad Rafi Shaik wrote:
>>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>>> describe Digital Audio Interface (DAI) child nodes.
>>>>
>>>> Add #address-cells and #size-cells to allow representation of multiple
>>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>>> per-DAI properties such as the interface ID and associated clocks.
>>>>
>>>> On platforms such as Monaco and Lemans, third-party codecs are hardware
>>>> wired to the SoC and do not always have an in-tree codec driver to manage
>>>> their clocks. For these designs, clock line enablement must be driven
>>>> from the platform side, and this series provides the necessary support
>>>> for that.
>>>>
>>>> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
>>>> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
>>>> introduces the required device tree binding support to represent and
>>>> vote for these clocks from the kernel.
>>>>
>>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> Drop my tag, you made a important change to ABI.
>>>
>>
>> Ack
>>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> Drop, you cannot test a binding (in the meaning of Tested-by tag).
>>
>> Ack, will drop Tested-by tag.
>>
>>>
>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 58 +++++++++++++++++++
>>>>    1 file changed, 58 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> index 2fb95544db8b..f3a8b12d7fc8 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> @@ -21,6 +21,49 @@ properties:
>>>>      '#sound-dai-cells':
>>>>        const: 1
>>>>    
>>>> +  '#address-cells':
>>>> +    const: 1
>>>> +
>>>> +  '#size-cells':
>>>> +    const: 0
>>>> +
>>>> +# Digital Audio Interfaces
>>>> +patternProperties:
>>>> +  '^dai@[0-9a-f]+$':
>>>> +    type: object
>>>> +    description:
>>>> +      Q6DSP Digital Audio Interfaces.
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        maxItems: 1
>>>> +        description:
>>>> +          Digital Audio Interface ID
>>>> +
>>>> +      clocks:
>>>> +        minItems: 1
>>>> +        items:
>>>> +          - description: MI2S master clock
>>>> +          - description: MI2S bit clock
>>>> +          - description: MI2S external bit clock
>>>> +
>>>> +      clock-names:
>>>> +        minItems: 1
>>>> +        maxItems: 3
>>>> +        items:
>>>> +          enum:
>>>
>>> That wasn't here and that's also not correct, usually. Especially that
>>> it does not fit your clocks property.
>>>
>>
>> The reason for changing this to enum was that some hardware may expose
>> only a single clock, which can be bclk or eclk instead of mclk. With the
>> previous positional const definition, such configurations fail schema
>> validation because the first entry is always expected to be mclk.
>>
> 
> master clock feels like something should be present there always, but if
> that is the case, then you need:
> minItems: 1
> items:
>   - enum: [ bclk, eclk ]
>   - const: eclk
>   - const: mclk
> 

Thanks for the example.

I will follow the same approach and update the binding accordingly.

Thanks & Regards,
Rafi

> Best regards,
> Krzysztof


