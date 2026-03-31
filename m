Return-Path: <linux-arm-msm+bounces-101020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFwJDMWfy2loJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:19:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D01367CFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D02623185892
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8B73A7596;
	Tue, 31 Mar 2026 10:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLT4vlyh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USAUCnh1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7963A6EE7
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951765; cv=none; b=s36krf64/P2Q6DZlCHwygRInkfQ8+gjksMmFyJmxLDqbrxIc1lBqcwb/wUY1R+21BEyb6DERAUv3tkCQYW6L1Rl9Pyn1EwXTnYKNIcjyyFVFQxWZsEMpOcMBXPhs1Je9Copf6a7pTmz6gKyM/ixnDi2WuVB8EzRgqYjVQOkCOak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951765; c=relaxed/simple;
	bh=i1PAKnGCcnJLsfppZH7sl9b19tpPCpbvSm/YXHmcDto=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Dx70mXlpMe5DVfw3y8eQISNLHsTetLLkV7uybwBdJRMZfyygbmQoQLNwBNHHlInpFcgLAz1i/DP04i5BlaGJOLBhcZE4fL+xxnqD7chNWnauJRiw7AC5dgNwuKp+hA6HQzODyowqCMoCV503aJ11mfHmqobDHzCzZjNasp+Q7d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLT4vlyh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USAUCnh1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V81D99430980
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5PxjqeUHEa6eLwkA5Rfm1TAmpNQwAWliF0o+hYRZHk=; b=DLT4vlyhYAUOZ7Oe
	ugaXYJ9zmCj03KcfX7/2wB3sUs4Gy/Bq+v/4mxY5oEfrW8UFIlpk6wiSifoOQdPg
	ErcX6GzG95TLk+GAIP3SblP5OVlFBHOsl/RIaOYSZJusDVXmnO3Tch4cRLUu/r2f
	vn5zGEQcpS+Z3tk9Ky+ZAXmXCDKne1DPXHPMSOF+sdoBXv0KsIanHrGQAcCemGnl
	OugGjqxCjENqZ6Myhx2Yi7wT+4OPSviFrYHIBcBEGPJcdBVVz2opaAdUahbIoBVq
	bPxsaWHTxa3+AD5qzm9AbqkWQVwXjR2hekXfdznuoyx9TSjPRrikwkiNb/4jPuwe
	Le3tLQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfhw9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:09:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093025ffecso172790721cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951762; x=1775556562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5PxjqeUHEa6eLwkA5Rfm1TAmpNQwAWliF0o+hYRZHk=;
        b=USAUCnh1vyGbdZjHDZGD19pgYrw5sFKLtrwyVv9sJAda4eSpOji1JTIFsxFjA/Nh5O
         MKwLXuV+oQTpfiLsnW7RNglU7oT3Xa5/oUZOVwdOItziS87J5CWR4eTU6Osj6255adJK
         RGPWcjKjEv4CpXJr3oN2Nx4ufpPyGnMyaGfKc+XkZd+fgKapp1DBfNexA7mIohbfQcC4
         xw2sy/jDMJpgt5f/p/iGofzyIFXCeF4PSugdR4AzjMSoxBHpSlJLPkrvsatW2vZp4rcY
         MhNQd66LKdi6Lj4Jb+14CvhyDj9IDE58m7Dq9QK+NvAFkKK+d6MQ3SfGjaC08/Em5o6o
         jpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951762; x=1775556562;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5PxjqeUHEa6eLwkA5Rfm1TAmpNQwAWliF0o+hYRZHk=;
        b=DwXaiDxHL8ATNuDvM/Fzp5eOudyJ5h+2dDHpexve8R86oEiP8EpSz+SYKmXB1QaUwo
         OSXozBGtnpvP5MJGEX8NcoeiePb7QSEv9e3kuvx/sjDrEoQUHzru7wklU7JASMPkG9Pn
         utbA1FJQYrZLaBTsi3g/2nzOfc73gyMnla9LT3aUO8L6TpeyGHcIb1CEFN03FuxMSgOB
         4e5541Thv8RLOB8V/BJ2JOIpkBCDZbTkHA/+65Lvh4ycndm6/rSzSUnig7goQpG0snb9
         IclZnjYTGmFxO8ugrjF9OQbSKSx7r1mVtb/MpiDzO3oHWvIS+sUTqtTnRN0VtF3JwnXu
         jsRw==
X-Forwarded-Encrypted: i=1; AJvYcCUac8P7n7RoU+XoM2a4fukwsevzjJBG933PjuQSIPPnLWGBFKSmK1DpfblXru92j59NJXI5XNgDt0XpKC/a@vger.kernel.org
X-Gm-Message-State: AOJu0YzFM1GtheGCFBV3bu1gcN4udkx9W50yV5CGLJd/1t7tjin+5rev
	SrttVDKapt95jiZRWodN5IvM6z5kAAIIfvjE/rYleNU5Ym6BBKRXOFhsugl274F+gxO8Aqf0BNE
	OvaEM8iRQKi73HEKLZgduF+bNI7XtM03wRHrW1YnrIxESmwQ3Yh2osQbqZTEvrsyG1qi+
X-Gm-Gg: ATEYQzxHDN43cEFGq1LZzIZ7iM6L+kYoai7YKEqXnpn4wVodglm+EwNfSYpWd/2shLQ
	Xtd4mkSADdqmxCHFU/edHtVkPD/gMhSZhY8VfL6jlholGDJnkNYejRp8EkgW1G1nGRUN0G1KumL
	dEsNivvXnYiR52FSlY7IgRO7OLOIufFwclCIbfzSO56TbWTJtlsZADrDNvVRhL8Aj61cWOH0B2g
	Xh/lOM8Bhqx9rsq1n/QjE0xOJ88np9FG6l7EGKM0rMlkgepaWNKd46sN/UHLlyTjbU/S1vcqmFF
	qia9q2QFl8wD9JpqSgacbNRIoswbDZGtki0sxQc/pdKAklM8tQ8M0cYrjKoNtNuLdZOAExZL+hr
	+ybvTIaJX2qfNORFW3dBeNtN+b9CjnKEh5v9V1IRcsuzgtMrZ
X-Received: by 2002:a05:622a:154:b0:506:2041:13d6 with SMTP id d75a77b69052e-50ba39655d1mr207868601cf.50.1774951761820;
        Tue, 31 Mar 2026 03:09:21 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:506:2041:13d6 with SMTP id d75a77b69052e-50ba39655d1mr207868281cf.50.1774951761447;
        Tue, 31 Mar 2026 03:09:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e72da6csm49983705e9.0.2026.03.31.03.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:09:20 -0700 (PDT)
Message-ID: <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:09:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb9d52 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oW2FW_nDJJYFMtiP85gA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NyBTYWx0ZWRfX4044eh7+FHeU
 uEfROX3/UYUPQDbDyMx5gMaSIpwSG0sz3bTR2D8Xadr+kAQEnC4pUqKbVZiTwXHRonXnpcnEkD3
 r7Zb35keH5psfMrqCPLbgLMvnN50MeohVhBBiMTf8RtHdgU0dYFWzu8uMSzIMNtgW9lcJZ3C8z+
 xftD6bUBBjuKiEORCpFoSathY0OxnNpKUJeAd629FJ4l6bgUqEn21nINPlGMQ5VeUTxyLhB+P8L
 GNktUUA9/2XJS/9wQyhGiGcLNx3Aa0JmBPYD37PnN1Ojk7811NdLHIPWU106/hAttmICIbNfhy/
 USF3pgQQomB6c45ZHQ0A38qQ14bisQsqYJn9BOI3fLyKkcKahnIBQOR55JEv/ol2hb3gpe6+1bh
 MjOsIO4bgPaqtzTNy0FPMkHmW9IaVygs43H6dZ4nbDVzaGHacALV65mnoyHzVCgk4GCSeDRM7t8
 eUe6D6Ay2xXQ7xos2bQ==
X-Proofpoint-GUID: BOKrCiiTyn8NbtyBe0cle8e_cTvOxE5J
X-Proofpoint-ORIG-GUID: BOKrCiiTyn8NbtyBe0cle8e_cTvOxE5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101020-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0D01367CFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 11:33, Konrad Dybcio wrote:
> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>> and is not modified: neither by the driver defining it nor by common.c
>> code using it.
>>
>> Make it const for code safety and code readability.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> --- a/drivers/clk/qcom/common.h
>> +++ b/drivers/clk/qcom/common.h
>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>  	size_t num_icc_hws;
>>  	unsigned int icc_first_node_id;
>>  	bool use_rpm;
>> -	struct qcom_cc_driver_data *driver_data;
>> +	const struct qcom_cc_driver_data *driver_data;
> 
> This can be a const ptr to const data, even

None of other elements in 'qcom_cc_desc' is const pointer, even though
they also could. If doing this change, let's make it consistent - so
shall all of them be const?

Best regards,
Krzysztof

