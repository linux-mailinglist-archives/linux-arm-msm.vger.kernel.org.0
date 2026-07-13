Return-Path: <linux-arm-msm+bounces-118686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JW9lK4ykVGrCogMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:40:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F800748D2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:40:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oHw0H6+J;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iYkXF7N7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118686-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118686-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 047B13005783
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7AA3AEB2D;
	Mon, 13 Jul 2026 08:32:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D8B3B14B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:32:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931573; cv=none; b=nXA4AeDKhzvWeyq49kqYtiRMZBdSzuz1KHQ5o/rgXFIbmaya4p51yLd0uh9El+XmXDEs3KnTARNFU/PiMzQtEk94NtBdNukK2kT4Z09n3wGvgJuDT2dPjQHstGQnIVslDhSOsf68a/RI0CpHm6+5+FeeyZny4zOhVFB7VG7W6YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931573; c=relaxed/simple;
	bh=izT7iG+kaH0m4tu0+8NdueVzy/iX/EoTNiE5/rPw5JY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojqI9cOurWBoLFlxkH580aRg1OnadMfyPilVIU68Eae5FdO5Gm6ZCkRVw0umr7/fVcR0o3Q0lFkj47KCW8hUIVJkd+8MdmmT75Rmwkh+fqBBV1zu/IpYZJNkkyl+Rq2QrLv0QDo14TnGtlSETMvpbJHkIXBnqMWcBABdGYXYIeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHw0H6+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYkXF7N7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nhwt648375
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orA8N+rUfuLziWiAdmDsk+WxJbTynnYWZ3oIdn7j9VA=; b=oHw0H6+J5xZGv9/H
	cYcjHa9QkeP6GovccH1Im00OpuN2zO2QZqbmUty7t0bcfod0fATzhPRkxGOaJluZ
	hSncl3RP84NXmP3QuVXOCVSLydo0nVawL9QgU+VEL/LxgsQvjA9hVWzwiwi6xcop
	9fWbCIwmscuPBQwP+w0zQL86A2egMhXtiT77aF2hQM//tnk5GxBfWCeguPAbQ2td
	Y5p92RpyFWZLJAbzC33iBy4g4ocLkODhi84WnoxHmGnlzIpteIiyCf4YLqYEA+6s
	4DCBpp0kLOJSu3Y5Z/lZesngIuC/e6CuA6rfl2rcxOd2vPE7s6mCRnJ+OUxxJnhI
	RMAiHQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr53kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 08:32:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso60063716d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 01:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931570; x=1784536370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orA8N+rUfuLziWiAdmDsk+WxJbTynnYWZ3oIdn7j9VA=;
        b=iYkXF7N7nrS/UUAvE77xM5Ey/jWqJMVUTzSfNSg98okeH5s7cL0dDDrXkhZ+lIBv9D
         4wn4j6iELmyQ9hgdg2A+4T97zVikiNpFZ7HDhH7yjwrNZIY+ubqrwGm2Gi/l8+eXOPbp
         /kUYhxG4gQNUrt2NhmVmhZXlpbPOmy56AvU6zH2CvLlC2Eb3ODrq0PGUy6NxkHQTpyzl
         LDLwlV65W8jbrHS+gqg6gYy6P4ZzyOghOPTfHe75JWuksrUv9SO5ZcDt2IdRKlTdLnxJ
         AdoNa8OWjM4eTHucxaKBxAhggcnTI2yoto8BXjuXafU8Ju0o5j/wccuuqXBeuAJDMO8g
         1wkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931570; x=1784536370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orA8N+rUfuLziWiAdmDsk+WxJbTynnYWZ3oIdn7j9VA=;
        b=BbzEd0tjI4RN39hwD4AnMBv7zyrduy9esruLz5xvgNU5HDCZ/a7uCDkkeMH3bt+xOG
         lA7sC6Dhq/wKQoBzR1ounNzR3f9+HRDIvzmwe41lfkDf+WFptsZcf/6nQVadzwel6+j6
         tscuTisqbjtH49Kz5lgjDt9JVhBUgCF86orSwhSlLfF/filXhOBle6ZZYFRabA/G0MF3
         TViQB3DYMLCs3MtW4QDSae8TtbD7JhLoOeyCyX589MSiZjEwuOwrkPZgI1rLTePP5cA9
         BNLibChYuAIYqFVPMqS1emKNcjGBMwllnLtdW+14SS8EuZdQoX4zJeJ7fdpsHG5sVlrH
         E3Fw==
X-Forwarded-Encrypted: i=1; AHgh+RrL9hl9eLACCODMbynDYv1nB7YPRTbDY7CRjMG7JxApN6unqlEoraSiMREc8S7KO6UEUNBZOlGG4TipJXH4@vger.kernel.org
X-Gm-Message-State: AOJu0YxqJw6mbckSTfisag79jm/Q2fssjk+prD99hZbuENiYCafLz/un
	/1UWtqa4L+tDvXZ0CeJhMfXKydX6nT752XO3JlAi3Adk4zRsMVqQMSyzh/+If1zKFHbg4npDdEJ
	nE0nRiVaz1vkbt74W7QPckKxRU555U3gqDeffbVoSxhzn+i20NGezRXsRyqstG0LQTpMynwqbXA
	K3
X-Gm-Gg: AfdE7ckZ5rs/nvEOIZFOJOfscvtlvBKHARCtFL0perqV8iRWIdoJE5vvVfA3a3k3Yip
	DITzPOQD57738SPEPLP9iPbHUBCmioywJzs1/94qi0vBkK3Hro378d33xhFksYogdAAZH+5Xa1y
	czOVqrxJaorshuM6OMMMGMd1Aq06XsA3WFko/NIr7TxfoX2c1zS+l17RQ1xZZOs+sL5KpwI/CM7
	JWEOblA2u81lxyFARteraRJ+RxWa1hnWxNb8D/CUOBumQKOjZkWdCtxaRnwbkj71FrpcVSl5Fzh
	YzEH7vxk1h6jrnWhfpwB2UsLPvcmYPeHrCaeVv7L+WuC8nUdRTUvoaSPM4WWhqF8F/g9rzMxKJ9
	oabJla0G4gNjNK8DtqG0hSRHygxmcLe49EoPx8yKse38=
X-Received: by 2002:a05:622a:34b:b0:51c:88b:d7e3 with SMTP id d75a77b69052e-51cbf0c4b4cmr79278211cf.3.1783931570529;
        Mon, 13 Jul 2026 01:32:50 -0700 (PDT)
X-Received: by 2002:a05:622a:34b:b0:51c:88b:d7e3 with SMTP id d75a77b69052e-51cbf0c4b4cmr79278101cf.3.1783931570178;
        Mon, 13 Jul 2026 01:32:50 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm858900666b.29.2026.07.13.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:32:49 -0700 (PDT)
Message-ID: <30a35954-4d0c-479e-8918-9f7a3a049a5c@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:32:48 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <7479fb60-e14a-4c00-94bd-ecd5a493bec8@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <7479fb60-e14a-4c00-94bd-ecd5a493bec8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX1w/62oionFkT
 y2A6gXEXb5ZdFhmpqdK6QNzRscmNPDMq5fcDvcwU2OUozvNRZWqI83vBwePtS2kEdXrGQwPFmyV
 Bf58JvQFLTTQU0HNYZwZ6qHsnPrP26M=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a54a2b3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-YhuI8MAAc7Bk1R6834A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: rQ9nisB1ddIiU5lc-TO4Y25PkrQQP25k
X-Proofpoint-ORIG-GUID: rQ9nisB1ddIiU5lc-TO4Y25PkrQQP25k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX2eINjQ7wmtUS
 gzA5v+c1UZYyPKmbLmfmD8Xwd41/2AwkkGP1gX8AFBbp3hJ3dA2vKvMgJg6C6qlXwnDvXY4Rqqk
 iKOtWsBbSyiYZIe21w/5Tbu9iA8VyMFCE0+VIYa7N0rEBBj2kKNcdIgConBvf4/c1Gelv2GCHd7
 AEJ9b0jXwjyZDwy2eWAdwLgkyrJW9EVuOKGCo2hhkX1EvoJ6Me52+pQ4xTTFsbBK7s0kPQQgFTi
 xirq4fIST7Jy13FGbIu3ya1xZaTIpUIdwruFfO92Li78U2w+JQJ1WIygmgcdclPNloNj5VqkdgX
 XS8/9zuZrlZoYdn1kT//y+mLFl05t9yEu0MLjpzM12MRkaJQ6J7wtjrXe//YeJfGw45SwRyMnU7
 GbVCbTJjjvOohSXnVwSSX3gI8ir8/22O5Wu2vqHOExMnBBI7wAQfvSOiKw06qrcrQACy7WbqFFE
 EueErXV9vkzcwRKohdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118686-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F800748D2F

On 7/6/2026 3:24 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> This series adds support for the Qualcomm JPEG V4L2 mem2mem encoder on SM8250.
>>
>> The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
>> framework, with DT-described hardware resources and SoC DTS integration.
>>
> 
> 1. Here was NAK for v2:
> https://lore.kernel.org/all/20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com/
> 
> When I asked to implement previous comments.
> 
> Did you implement them? No.
> 
> 2. At v2-1 version I already asked you to implement comments:
> https://lore.kernel.org/all/c9006b67-aa43-41d3-8b13-f20dd2e544c6@kernel.org/
> 
> Basically now, THIRD TIME, you send the same and you still do not
> implement the comments I asked you at v1.
> 
> I treat it as deliberate action to ignore review. Me asking the same for
> the third time and expecting different results goes towards insanity, so
> let's avoid me becoming insane and consider all future submissions also
> NAK-ed:
> 
> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof

Apologies for the repeated failures. It was not deliberate. Inline
replies to all your v1, v2 and v4 comments have now been sent. v5
will address all of them without exception.

Best regards,
Atanas

