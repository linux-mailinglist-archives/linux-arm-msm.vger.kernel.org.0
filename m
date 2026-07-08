Return-Path: <linux-arm-msm+bounces-117759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2OE4AVp3TmpLNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:14:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDEA72887A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:14:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DZXj8jRw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NW92N1A8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117759-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117759-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89C11322F0F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B6221D00A;
	Wed,  8 Jul 2026 15:44:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D7C33E35B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:44:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525499; cv=none; b=WqStLH0ebCAf1VIFKdcWsQ6ZqkSHPj9hOc2t4EZMk7rf57Bz0sZnK+73Sf1mXL2LSX8MpXS4du4MsRWNyc+VZkaFFOSxRPiNmhIY+4rdFGOuDgVwO3TIj/puNkoFulPBTG7bHPT922ShWI2mg7vK1hyom5UfY8N5QnbA4uQ9Des=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525499; c=relaxed/simple;
	bh=bUSLiGRQFh0ghEbicPP7GtlWPZsKF3rpw03IA3Tz9aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rUxSaP6UcqtT4+LhbS23unREbs0EzGAfDq02EXIqUoOPapjnb56i4p/vpIkY5LI2gJ3BJtRaJyhwahxPgEJ7OAQZiXWPRjHoBU4/jVCz1TW11GSYhcCmKauOJD4R9lmBDHo7IYco45IJc/BKEn7vciHB1uSN91YEl2omuBA4sog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZXj8jRw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NW92N1A8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Wub2753651
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VaAPWEY/g4XNfXsTs3KtueADcs7Yb9r7IABv5t6GF4c=; b=DZXj8jRwtKhmSvmQ
	NoUcfZ9TjjbiWd29t6o5uU/JxIupxagsRtrQFqH/jbM1WmC8Q3nB6mREBB2151rK
	HsuZo6zcZdEL977T/7kFIC7f3On8Lwg4o1egngp+jSJr3YsqM2NZdDsEb31orvyu
	CLfYiF/MkV9TCy2bP4ZEnpsFxKoMdmKXSwD1qfwO+dL3vhhGcw/4laysvDRyqEmd
	8dQ+Nq+8y3Ra9Jo7onR5iyxxJqwGE1KqQgz9xKUMbj9M54Wm87Z+9iZOtZdh/Qr1
	84wQy4EvnbZ96Swg50Mwbyy3qxSevFq+ozRquet/RipvU039chn2sYyeOVuNKd/e
	BJzIuw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hjhpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:44:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc92c5373bso12898616d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525496; x=1784130296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaAPWEY/g4XNfXsTs3KtueADcs7Yb9r7IABv5t6GF4c=;
        b=NW92N1A8TY80zVpoaA1yECeMQI/2+KpjHXuQz/APQavw+XPOGFzZwtUHKywVUwAPRv
         iu43l8FmXv+o0GYNrqu+s945N6XTaVkz9dM1SrtrZztISB0za8pdnO2EvGNmcFAgBN1L
         jDKJbjXl9mJoMpSa7bH3Oct7SpH8LIoH1zRDyxTU6g+ZD5XShRRxbsUS/tdCJhNwfKaA
         TVqNautZ/n+SOU2VclEJ7+6XIcNVTB80s64A41sJDIWgGk+id6AdCdjZZSyek42nOorX
         rg8BO8G1F5Kp1IMUdAxgf3wgIv6NeI5RBj/kpVc9XjHrSRIDYWrqcu1Ngy4MyQ+jzJyz
         jbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525496; x=1784130296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaAPWEY/g4XNfXsTs3KtueADcs7Yb9r7IABv5t6GF4c=;
        b=VQ+9OP6GlRn8Vda7s6FSK+UD1+WJUgNuwsBEDGwHS7NPaLnb5ukultyFIPYqKajPJm
         +Da5QXxB0KZFK2Evj1RK6PC6EgEmkETAVnGC/Zwsyqt9OJOTP/EfC6BdVNk4Dlg6ylNA
         HdP63X8QHHfrWo44DI+qVAxEcn+RRO63D+jWyvPV2EvTLs/fS4gs6C6L4JEyxpdpviEa
         /CFv1NcHHqzen4sR1BdvCW8FFZg/5lE2n17bIOcyScv2GZgCcZbScwoMqciLvYqDtfFq
         GaXuek8IXAdPZcOoyhdyJ6xbcUJa36FWJVeROdlT0fp9s3bsESjJdu6H11OOGk4opqUr
         gleA==
X-Forwarded-Encrypted: i=1; AHgh+RolgP8JdJren244Bc1sS/DabzrHlB6wYXXrKcHXu2qxjnKhbBo0bJmu4dU2Ckyr7QUWiBWkK7o4emluVShk@vger.kernel.org
X-Gm-Message-State: AOJu0YzZWfwjjXrnmlZZmUdJ9VhozMj/SJ+eazFNGOsws0pg1lgJxCh1
	VHHSQ0MOh0FHvi7fnpN2IJKFlUiHEMcJmApe+9BmgNFwEGD1nE8CwsL6lc48WTM4wFE60gbEB9r
	/ixJgEJFt49W53RV8GoPXfpJPGpJRoZRX26unTS4oGiTPSXAnOwWs0od2x9rHts+oEWu3
X-Gm-Gg: AfdE7ckZphrpAiuA1hVEaVOD8VI+qnHBwWqPhHZtYs56UKy1a++PA9/8Wor2r9qOi9p
	W2wP8ae2W2j35vjD7TYsCDVffXPoaUiuOatjZeo2H99j5STBFcBic98MYvmwunfvA2rhlty7fsX
	nJLSxD0kr9FTJZIZl1GM802EKuezvZ4BkFXWYKXpoxBoxMnS8irWLxydpTJTEb9em2PPD7vAj1z
	CnGafBmFLWDTxUp6axSreOyw7vOFMo+DYltr04XION7Rb0DJLQGx9GnD/nvP5TU6lG4XhFyWqjD
	8cUfxwS/1mC6t9VrD9VF+RMIvG2q+tCVDJZ3vP/wsUff58NAHEel0b7PDuC53tSeLxbnTcJpc3J
	vUcL8fkujDLcWFZQbzSBw6gzYoH4WK9ZkvpXWLBZYGH9rmC+Qi36QbEGWrv8Wgnd0AJdocJ85us
	jzBrTTiY4=
X-Received: by 2002:a05:622a:4890:b0:50d:db76:55cd with SMTP id d75a77b69052e-51c8b5492f0mr31842151cf.52.1783525496144;
        Wed, 08 Jul 2026 08:44:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4890:b0:50d:db76:55cd with SMTP id d75a77b69052e-51c8b5492f0mr31841671cf.52.1783525495521;
        Wed, 08 Jul 2026 08:44:55 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9ea0asm7782436a12.22.2026.07.08.08.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:44:54 -0700 (PDT)
Message-ID: <0e9de1c7-2e39-463f-b4db-f228f37a8a13@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 18:44:51 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
 <dd34b44d-396e-4267-b383-e4f8d20f8ef4@oss.qualcomm.com>
 <fffc51f1-9137-4951-b9b8-9f7f263c7878@linaro.org>
 <wwk4nyczcecnllwivqd2lgnbpzboumtwigk3vmundsvgqtqpy7@duq6zdulc7sc>
 <74608907-dc8a-42c5-b188-0bdb08d6be77@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <74608907-dc8a-42c5-b188-0bdb08d6be77@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX2QUuPLjKzFF8
 9/fRgdGljyEM+h0jplLBk/+BF6Fc+ikUl3H9BBYOm1FGf1kmIjrqsm4JB0rIx6h+4fZf3G0r4Q5
 iOhnNAF4jzDckP/Wa7xMrb/7gQaEmxpFGFfRFCGgjPdobnCLmwm9aCJ7KCyASPhECMlCcjZ8D6s
 LjEjCsyWkiKNHVJuJFZuoQ8/7SfTwZWrrS4xGP9Jp1O+KL4SLsRoyoi9Ws+kCVt3RkldY2Y5oMs
 wnfMi7dWTYMAhCHKaJDJtini8ehIZ/ODofa52UN1g7D9cHbho+IF7Kpj23k1IFVdeZBmbxqdL2I
 HjebA7QBO7g5ABIDVWi6Tsjj9tf3f1cjUiZ+BWSqFjAcFKN8ch0Eajgm0SN+md/Glk7S3pkb3t2
 LW/GCngP5mdX1BUjmtSCVCPlBaS7eFvc6BLZUbzpVZwyARdiTuaNXKaHth1tX1iVZwSupEnMQJT
 l2k/gIbqACVUARr9xEg==
X-Proofpoint-GUID: Z6Zo9PKZ7Pxnnj_QJk2nbBJt3_fN4S1A
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e7079 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=HRVC3C84EGBQM4B1i-YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfXxIk87AflUhXI
 IFurNJxtsM/79zvfagrCsar1HnDeJqLPrAu/+uyDgCd59mG9OItRCCCzmZXUi4pL+I3vmJdVRFZ
 cvkM19dKw+beoxzsnT5l/TfLvWN4Xo0=
X-Proofpoint-ORIG-GUID: Z6Zo9PKZ7Pxnnj_QJk2nbBJt3_fN4S1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117759-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EDEA72887A

Hi Vlad, Dmitry

On 7/8/2026 3:01 PM, Vladimir Zapolskiy wrote:
> On 7/8/26 14:35, Dmitry Baryshkov wrote:
>> On Wed, Jul 08, 2026 at 01:28:46PM +0300, Vladimir Zapolskiy wrote:
>>> Hi Gjorgji.
>>>
>>> On 7/8/26 12:32, Gjorgji Rosikopulos (Consultant) wrote:
>>>> Hi Vlad,
>>>>
>>>> On 7/8/2026 11:47 AM, Vladimir Zapolskiy wrote:
>>>>> Hi Gjorgji.
>>>>>
>>>>> On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
>>>>>> Hi Vlad,
>>>>>>
>>>>>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>>>>>> <snip>
>>>>>>>>
>>>>>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>>>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>>>> QCOM_ICC_TAG_ALWAYS>,
>>>>>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>>>> QCOM_ICC_TAG_ALWAYS>;
>>>>>>>> +            interconnect-names = "cpu-cfg",
>>>>>>>> +                                 "hf-mnoc",
>>>>>>>> +                                 "sf-mnoc";
>>>>>>>
>>>>>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>>>>>> position about the need to remove all "CAMSS bus" specific resources from
>>>>>>> the device node, they are found and should be allocated on parent's side.
>>>>>>
>>>>>> The interconnect has functionality to handle bw requests from different
>>>>>> clients.
>>>>>>
>>>>>> Yes the best will be to have camss interconnect, so jpeg and other hw's
>>>>>> to vote
>>>>>>
>>>>>> on that (actually it is possible in icc framework) but what is the
>>>>>> benefit of moving
>>>>>>
>>>>>> those to camss? Is it not better to create camss icc. I understand
>>>>>> you want them to be on parent side. But how to vote on bw? Most of the
>>>>>> time it
>>>>>
>>>>> Let's concentrate on hardware bindings description, no APIs, votes etc.
>>>>> at this point of discussion.
>>>> I agree but there should be an API for icc voting which Jpeg need to use,
>>>> currently it is fixed to some values, but voting need to become dynamic
>>>> at some point of time, because it depends on runtime parameters, resolution
>>>> format etc.>
>>>
>>> Sure, but I believe it's quite clear that any software implementation
>>> should be discussed only when the hardware description is fixed.
>>>
>>>>> There is SM8250 CAMSS device, which serves as a hierarchical parent (or
>>>>> could be considered as a "bus" device) to this new JPEG encoder device
>>>>> and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
>>>>> get hardware descriptions as children device tree nodes of CAMSS parent
>>>>> device tree node naturally.
>>>> I agree the device tree is best to represent real hw topology. >
>>>
>>> Well, it's not just the best, it's the only possible way.
>>>
>>>>> Copying of the same identical information about clocks, interconnects
>>>>> and power domains from the hierarchical parent device to children devices
>>>>> is not needed, and practically it only lowers signal-to-noise ratio.
>>>> Here also i tend to agree.>
>>>>> Since information about the actual defect in hardware description is
>>>>> reported, the problem can and should be avoided, the handling of a better
>>>>> hardware description and dealing with any kind of complexity will be done
>>>>> in the CAMSS and/or CAMSS children drivers.
>>>>>
>>>>> If you need to get a bit more formal point of view on the matter, I'd
>>>>> prefer to see descriptions of hardware properties organised in a tree
>>>>> topology rather than in the originally proposed star topology. By doing
>>>>> it the system complexity is reduced from N to 1.
>>>>
>>>> Maybe I'm missing the whole picture of your proposal, but I want to add my
>>>> point of view on this matter.
>>>>
>>>> The JPEG encoder HW block has no dependency on the other processing HW
>>>> blocks in the camera subsystem
>>>>
>>>> It shares resources like camnoc, clocks, GDSC, etc.,
>>>> but does not share anything with the other HW processing blocks. For me,
>>>> the JPEG driver should not have SW architectural dependencies on CAMSS.
>>>
>>> To move forward there should be a clear answer to a simple question,
>>> does Qualcomm JPEG encoder IP belong to CAMSS group of devices or not?
>>>
>>> If no, then JPEG encoder device tree node shall be located outside of
>>> CAMSS device tree node, all resources needed for JPEG encoder device
>>> operation get their descrition in this stand-alone device tree node.
>>>
>>> If yes, then JPEG encoder device tree node is a child of CAMSS "bus"
>>> device tree node, and only resources specific to JPEG encoder device
>>> are described in its device tree node, because other resources are
>>> already described in the parent device tree node.
>>
>> 2c from my side (for both sides of the discussion). Please keep it
>> separate, if the block simply uses the resource which is also used by
>> the parent (e.g. there are no special requirements on the AHB or sleep
>> clocks) or if the device needs to actuall cast a vote on a particular
>> resource (e.g. for this to function at this performance level, the MMCX
>> needs to be at the turbo level OR for this to function at this
>> performance level it will use 123 MHz of the AXI clock). In the latter
>> case the resources must be described as a part of the device.
>>
> 
> Even this "description as a part of the device" might be not quite
> necessary in whole, let me try to explain.
> 
> No doubts resource usage policies specific to a child device should
> be naturally described in child device tree node, and it's applicable
> to any kind of hardware policies (like opp tables etc.), but a list
> of needed hardware resources still can be obtained (also by a driver)
> from the parent, whenever it is found applicable and unambiguous.

If that is the intention than that can be done without significant
changes in the jpeg driver.> 
> This is to separate planes of hardware dependencies and policies/controls
> needed for hardware usage.

Currently JPEG is part of the "camera peripheral block and support" (CPAS) in
the "camera subsystem" (CAMSS), CCI is there as well. Then maybe we should move
i2c-qcom-cci into CAMSS. Note that CCI can be used without CAMSS, and it can be
used for some I2C peripheral devices which are not camera-related.
Also, to reflect the exact HW configuration, maybe we need a CPAS sub-node.

One point of view: in the hardware configuration there are no dedicated
camera subsystem block (CAMSS) registers (based on my knowledge).
Those are a group of HW blocks belonging to the camera subsystem which share
some resources, including camnoc, clocks, GDSC, etc.

So, based on Vlad's proposal, the changes in the different drivers will just
be about where they take some resources from (parent device) or the current
device — so the changes in the drivers will not be significant.

~Gjorgji

