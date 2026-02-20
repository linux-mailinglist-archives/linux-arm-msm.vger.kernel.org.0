Return-Path: <linux-arm-msm+bounces-93490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJo3BZ89mGkWDwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:55:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C08167116
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3C3130D287E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C69733F375;
	Fri, 20 Feb 2026 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BueSl0t8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOAoSrj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199B233DEFA
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771584684; cv=none; b=ZuqPCfsePK28JVXKtTaHWEpOvzajI7NpjgZ2HSsjr0QIIunmE5R7aVTOngKJdjZo4Lp5AYcZ/2gVrhnE2476NIzAPtm0jruGYq7FDCNNjHr5ynPk5se0xvNEVmeTR2O3YZWNJLwJSjgbIMR7KG9cgbeaumDWfcW5oUjdAxil+3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771584684; c=relaxed/simple;
	bh=ks6OJSw/UwvvF2/JUxSnt1Tii4VaTCXNdvHN7i3pd2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSL51UELBt0cjriEPqcriAdS8xJzagCaHbrLcsEmtDyQzpEU+NRtjV83gLe3jQBOr/mQgz231jeP9e5tPUbY5DP/TZmZToYgUfMIdaJcL6Sc3PZ3JEUEfiGA2Ag8/8HbLDFKHjqvGWIPl5Euc7igU3vtXrcbJBEViuq995G0oKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BueSl0t8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOAoSrj1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rt0x2552884
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8sjIgXFVYbyhkWb9bMVXULx3YRL8NxHkkz55sJrEfA=; b=BueSl0t8sjkgfsHn
	wC7Y86DW8R4z7S7OJvfXyn63FWvSwGwK7Aw5kaTXqbRl5sKFXMyMsSQjnbxCWTmj
	rUjY/rIZsGmuO7o1wqw3c4Tg7ZdTlD9bfxLX1mjDVt6igrJywqilZSzEBkveonSZ
	pPGjO7qbXLMqS3ugXsM8Khq5iBz5CQ6XxJQnIGdnU1nbG6tJhSlTxlDWeAL4k8xn
	2uPaXcgiHZxRGsBDjeLKnQ47M6LICWxs9vjuiUFFutKhAvUvfaqE1MhwjaQ0Sv5w
	Yer1MYHRQdgD8QSJCOA57odnydXR4D9mIlw82J1ENBp7hW+JGkMAvt0ehRHAFrT0
	MVO47A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh7t0sfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:51:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50fb0abdso212850285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 02:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771584680; x=1772189480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8sjIgXFVYbyhkWb9bMVXULx3YRL8NxHkkz55sJrEfA=;
        b=TOAoSrj1pNkW7zgtDRYPw94vSxGl0hqBTtX6EvM23ImSfc9jflEHE49s0yAvsnyeVf
         xOJjXJNEX/+g/UGB2pRQvfoCQQr833HuLzGW3kznQ9dfMC2o+WY+O7nENcCZOzLRsHsf
         iOc2OeDgfCv42QJjcAZufB3piORJ8iF855qphpPvnbK6V95GBqQIz0ctFMMK/8yAGDnf
         NJeNnE5/MZweEa+JeUzxfpdTb7LNtV5jX5f5+VD+HMCQ5EWv2PfoJ2l4pSJmzM4MS1Am
         dfwmHXvC9KDSa1chIGbJxslEnh6yW/txijue8KCXqZvyoFhNUr6a1OnRad1DZG3QTCvT
         q6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771584680; x=1772189480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8sjIgXFVYbyhkWb9bMVXULx3YRL8NxHkkz55sJrEfA=;
        b=hz+m2SzbUsNWT+Rojr7X+Mm05xOpWkhhng0nEljagJIvpf5x2z98wdeFZ4KN2OjRpy
         m1adYM6zybX0DVLpwPBDmFAWDikZ76DCDHuntY7O4TKl9ky2M+bRLNAi9yCnobQw/qmM
         lYkv2RnTYF8+fkQndovsygBOJ8VKiMrAyrHFTTmj7fP52v6P+6KrL0VxVdGoA5t1jSZl
         rZgAp86CqdXeQffMicaBzWT5fgn6Qk6cKdlXWsx/nsyrWvdhtS9PQ7WgSqOgafp0Z9kK
         78UBdhkRiLHh/skOgeGWo5OmDHGLu5NQIXoM5nnCNE53Eo7w0zBstxpW1MqL9oKb8ypc
         2+xA==
X-Forwarded-Encrypted: i=1; AJvYcCXyrmKc1uycu2bmCgEoIKMqZry/iPuw2mj7QSXNkZKTVbj3FHaUJNW4Ybgwfmz+jsX006KJ1cMgtKFUTDn8@vger.kernel.org
X-Gm-Message-State: AOJu0YzOFgAKnDVii51jzIOJrXQ7l6rrppJlsdjuzDTwMfIhOitV14R/
	y3p3D1J1U3Q39gkIo/vXRGl5NRxw5u4P5ExGllWq7sAmKqdKh10jllJEaWfUqabzeNw2IS8pzMU
	X2+JE8CAbc8fZ4Xmj+AikJlZalKpn3jUuwSSxXevUuYdx8C0mSyHEz/WyrKkkoyOIvlIX
X-Gm-Gg: AZuq6aJb49bTRkEJH7kf1QFjXGQ26zu9FGBb+YUNd6/vUiWAZWwI4rEu5MStqFTdbPp
	qBf5vHUHvB9iQN8eSSrtbUonm32Jyh1/fQmy2LEChQZ+qgPG7Q//VHrqCEhuu2+f7cf39FEge9s
	4QMmot3v+KAFp9fwkiFdQ0Hxv4Tam7XYJo8cBuTerMs6XCn64Pz8bwgYZxZ3XZ/4cuM5vb/d/ut
	HzyKa4/7XYrzbGGZBtypcnOZvnkaJgUqL4ZuFyhHbcjGxFar3HTBmUCuxJKt0YBXtcoaX5pFh5B
	kyrGrwgId6sm2sR4WHplJS7gg0LG2mllDmsQ3qcpSddyw4SpGuC9VWcQD/bGNHukwbu7zEtIfxi
	6avGvVBw1svpg7RZTsYgr1AFZPRdymWL4P/VkM8K5AWzgOHk2oomyARtrXke7YSK6squvLzAOpP
	+C6bs=
X-Received: by 2002:a05:620a:7006:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cb408e956dmr2404929185a.9.1771584679734;
        Fri, 20 Feb 2026 02:51:19 -0800 (PST)
X-Received: by 2002:a05:620a:7006:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cb408e956dmr2404925985a.9.1771584679248;
        Fri, 20 Feb 2026 02:51:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7665345sm664435366b.53.2026.02.20.02.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 02:51:18 -0800 (PST)
Message-ID: <a422e087-a91c-4bb2-9d95-e1cefc9a91bf@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:51:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Add
 battery temperature node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Jonathan Cameron
 <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hansg@kernel.org>, Jens Reidel <adrian@mainlining.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
 <20260220-bat-temp-adc-v2-5-fe34ed4ea851@fairphone.com>
 <85ce1f2c-f5cf-4e97-9611-4aed03f69cd7@oss.qualcomm.com>
 <DGJQ4WLIML3H.GAO7T4L3MCJM@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DGJQ4WLIML3H.GAO7T4L3MCJM@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RA2FHET-Nz6n4Rjiy_WrzXZFgOMeV_FB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA5NCBTYWx0ZWRfX/32U3Q0HIOz2
 xsWJqofZ0IysXmFtaViwm6M33syr6xBSv+M7dAAf3KEcphX0KquWMeL03t4RJqRjkg7km4k3rKi
 E+uXrbqpOVyEr8DG+QiFOIagsxsMrcxOuyuO/jzRw9+uOajeYSI8ZnwPVz1NCMf2CZxAKs5gGGB
 WEA7k67CruF1PTCHVoReORSJfcY+KrouyXFQrwOK8dFIleikqBTsp6rKCVI4x8Wx2A4/KpdWKx7
 6vpBZY4Yd3aYhMaCmcScFKYji9IRw2J+hoxIcQrg0O12ij1MtUwUxHMpCfsT4GBHIGr2fisuvSE
 lomGkooYvcvqStg8O5tq3p+zQWGC2d+gbt4eP2JWYLGadBK5SsohsgMCJjHv7Wt1AZ/K3sMI2pe
 Zu0xlPEJqNJz8mw+F/u0oQZRY/F9Ozq4sOsifi+fqRyK5rKByhDvmdofPpKhEDUoPbvdYjrJSUv
 vYoP5eWryy3bgOTGBTQ==
X-Authority-Analysis: v=2.4 cv=PcTyRyhd c=1 sm=1 tr=0 ts=69983ca9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=ftgFGzw_iv9xBS2N3wAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: RA2FHET-Nz6n4Rjiy_WrzXZFgOMeV_FB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200094
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
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93490-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68C08167116
X-Rspamd-Action: no action

On 2/20/26 11:40 AM, Luca Weiss wrote:
> On Fri Feb 20, 2026 at 11:00 AM CET, Konrad Dybcio wrote:
>> On 2/20/26 10:19 AM, Luca Weiss wrote:
>>> Add a generic-adc-thermal node to convert the voltage read by the
>>> battery temperature ADC into degree Celsius using the provided lookup
>>> table.
>>>
>>> This will later be used as input for the fuel gauge node (QGauge on the
>>> PM7250B).
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 83 +++++++++++++++++++++++
>>>  1 file changed, 83 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
>>> index b697051a0aaa..7857003099a6 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
>>> @@ -108,6 +108,89 @@ rear_cam_sensor: thermal-sensor-rear-cam {
>>>  		io-channel-names = "sensor-channel";
>>>  	};
>>>  
>>> +	bat_therm_sensor: thermal-sensor-bat-therm {
>>
>> nit: this should be a little higher
> 
> meh, it's surprisingly easy to miss this sorting stuff. Will fix in v3.
> 
>>
>>> +		compatible = "generic-adc-thermal";
>>> +		#thermal-sensor-cells = <0>;
>>> +		#io-channel-cells = <0>;
>>> +		io-channels = <&pm7250b_adc ADC5_BAT_THERM_30K_PU>;
>>> +		io-channel-names = "sensor-channel";
>>> +		/*
>>> +		 * Voltage to temperature table for 10kΩ (B=3435K) NTC with a
>>> +		 * 1.875V reference and 30kΩ pull-up.
>>> +		 */
>>
>> I think this looks good. Is this data going to be correct for all/most
>> devices (i.e. is there a single battery sku)?
> 
> Yes, from my info there's just a single battery SKU, so that makes it
> easy here.
> 
> For Fairphone 3 there's two battery SKUs:
> 
> * (Fuji) F3AC with NTC 100kOhm B=4100, ID resistor 10kOhm
> * (Kayo) F3AC1 with NTC 100kOhm B=4050, ID resistor 49.9kOhm
> 
> In reality, one can probably ignore the difference between the LUT for
> either B value since it only differs by a marginal amount, but
> conceptually I'm not sure how this should really be resolved.
> 
> We could have both battery definitions in the dtb, and then the charging
> driver could determine the battery that's actually present in the
> system (based on the BATT_ID measurement), but given the design here
> now, I'm not sure how this temperature lookup table would be propagated
> to the rest of the system...

The path of least resistance (pun intended) would probably be to make
generic-adc-thermal consume an ID channel and accept a number of LUTs..

That sounds sensible since most battery ID mechanisms are probably also
ADC-based and one would hope (tm) that the values output by these ADC channels
would then be distinct enough for the driver to have an easy time confidently
selecting one of the options (or a fallback)

That said, this is just my guesstimates and perhaps the IIO folks could comment
on that

Konrad

