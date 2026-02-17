Return-Path: <linux-arm-msm+bounces-93099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIAlK6E3lGlpAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:40:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CEE14A80A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D896B3027D98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B33D31064B;
	Tue, 17 Feb 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkET5Jnt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvWh3mLz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4A6302773
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771321246; cv=none; b=esiB8ZvrRZ76Ta/rsbkw49Pky6ZJ8UKZjxYXPMr2tiOnBZJiLi34CH/88+aLU0/4aWp/q+OjIfNsASMcG5X/IjJfOw6SXpDf2C69KJ+jtS7uo7mXU3Q0RIbadhafqD01Z4qOsg7V+q7AWuwM89mCdaUwyHZ9zbvzkcXFCkNTl7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771321246; c=relaxed/simple;
	bh=hOimr2d2tZx73UJ1+Xw3dYuWabJtRLfsZCxuOP1vCkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMfhaPHkpMe4TM82rEm4CrlKAR60TMyjIOWLn65twxTxc8TH9GkyURIQM3/QP0YAcYbT06UbqL1n4Y2dlEGtxRwJRxNEadleM4KNm+gd+SP6Jzo6DWSjEcmKmsJlFPYdM3poUrcbjcwXx9FqVtKHS4zeCWd1ZqM0g5gGKtMb69w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkET5Jnt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvWh3mLz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H7x7J5048800
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ujw0PToHhDmkklqSvcaQVys1ABQiR0+dQPTCTxt2vSI=; b=CkET5JntAHhOHGZm
	R2HGM3tvv99BF3bf1hBfS4o6nWW8yeoGXACFi9HjZsGswuTPzNYGgWQFhVJSjJ8M
	KStUbg17Mxf3i6DvyKgzChd7Kf5Rt2jbSyyE31ak1RgyF48YOVIaLqvrR8cPQoJV
	xF+uNzYXSrtv/js8W3KllB16mRlrtK7PA1ql5PQ/Mp4gkOZV2yhyOYBneKPtvr5g
	A1jiUcBCTF623AVA1LAASC3sp5Hb5kMoVQ0i2HxK1Z5WVLyjOXmDLqb1qL8BoRyI
	OM94CprYRVUsU1lQ5onB1zi55jmxC5V/E5hltrdHWITnV3kbbe5+CvLmnHUE8L8c
	aETznA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d81va6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:40:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89496f5086dso33413866d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 01:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771321244; x=1771926044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ujw0PToHhDmkklqSvcaQVys1ABQiR0+dQPTCTxt2vSI=;
        b=RvWh3mLzhCUy1WhB/ScuA6zfjpqXzWJ0kW0kkUsO2TGOoUmqODRyqiAII/r4CyoeVq
         N38Uy1RANfRsc/0U6YrVncFeR3CVTrQEy87Hc3o7LwCYXhKwdJuGkNfyV19bzTX/ZBxS
         WxNhXYt4a3eXzSjIPCm+FC8BQ2VpqXp6ljeC0ipY/dZ3dbwtLaNPlszeaN88lVLltAhy
         4WSULxWLRUeVLdXYNJoj73zdcvPKE3GmUdKojqJAuht3mGi3MnK8W2JOB40IOgBQrVaY
         kCGItB01GltIi5EoDU5/MECuBE1rGigWVepEXb0wsoxtbEdcbAqfkeqThhmkm4Ho24Oc
         u7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771321244; x=1771926044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ujw0PToHhDmkklqSvcaQVys1ABQiR0+dQPTCTxt2vSI=;
        b=GFfRnAMdBYXvnBQwxFiCFq2+kdj7zsi8aYIg8KGZ18MRAbmUJXNQbHlpAuSsn6OyAs
         to9oHzGSDPTw4kAW9Br4hpBTXLD8UlUP5hLtbBT7254y9Au+Pa1eJZ9qurrxvFomxJba
         522ZqAsgds3emYNCP/jZX019CcFo7vZJK9EYaD3YlAsNp+uYzqxvHceCU5VwYZV0XYlI
         BZOdcwiFvaOZybHPdwAPmatJnI5jTm8nHQpwSxLOgz1y46GGdke2/yaOeDwNrA6EcjJ4
         wb/LsFtuADzJghUQHUStAyYCu5zX4q6hsTxUXkfjoHp67Jig18yhiREDlV72k0WBuKAM
         tWrQ==
X-Gm-Message-State: AOJu0Yy7OGVK66c5cKfMK5iUmLGaaV2g17BdDwzhZY9flt9FMxRAFb6g
	Z3qrWajJVTvQNk1E8ErKWOhKlq2xW6n771Vc1bbPfx6x0lUZO4t426tHBtVpyJdFhLvDCdUpo49
	xQW0kVkgguDFXTsHRoyTPtK2ZeD+lodeTjQ9gg5EmqnTOHEacZ4ckhaqACIWDbQO7ZOrN
X-Gm-Gg: AZuq6aKSlov6apNMULWbeTrmT+PlSjYHfy/HbjlPRGPHzeasRQTxTF7jYp5zKMsCIqi
	18GjVZZaooUXXOzreT0AaLcvRT0RFocXWSLYaXMwWlyka0QmF3QUpR8AQwhDlgxDvdxGv377llV
	Nc/e3tMFF1d5RHNlms5hSBIodeft5aiSlw0rthrK7EFrrxu7n+mfaZCxboWF0k5eTTOD1UbvFuj
	Z7QABd5bB8cB91b8VusH7qyyg6KmTDo+JKz634Kw9U/dyh89EG00f6QEfIFAnNs8nW80jhQj9WQ
	H3nhxW6b67hvKNTLt+GpUMt0S6mYzFoxy5tZrB+pwUmWbUvdpX5tjIZHLbWOo7USSX6yUkcMekH
	wPbEOguC2fl6wCcIPjHPkQIODlfGIAwpTSw1UywSTKjCpIr2wc3qHhaYUPCe6hBVqtEwY3c2sOV
	6ONpo=
X-Received: by 2002:a0c:e006:0:b0:896:f2d4:1df3 with SMTP id 6a1803df08f44-897347c6a3amr156200576d6.6.1771321244368;
        Tue, 17 Feb 2026 01:40:44 -0800 (PST)
X-Received: by 2002:a0c:e006:0:b0:896:f2d4:1df3 with SMTP id 6a1803df08f44-897347c6a3amr156200406d6.6.1771321244013;
        Tue, 17 Feb 2026 01:40:44 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769111fsm340524066b.57.2026.02.17.01.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:40:43 -0800 (PST)
Message-ID: <65ba157c-8a7f-44a9-9bcf-abb8af6535a5@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:40:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
 <957d7896-cd01-4864-bf07-e6dbdfff1273@oss.qualcomm.com>
 <2d688258-2e2a-4a86-aa98-eca31627d418@oss.qualcomm.com>
 <af15dfbc-806e-4731-a7a3-6832a781154e@oss.qualcomm.com>
 <be4fc7dd-e7c4-4f2e-ab5c-543d8fedf7d6@oss.qualcomm.com>
 <eec690df-5ab6-42b4-a9f1-ea8588f21713@oss.qualcomm.com>
 <88ba2bd9-e7d2-4a7e-b48d-1eb4d3d40aee@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <88ba2bd9-e7d2-4a7e-b48d-1eb4d3d40aee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=6994379d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=QtLaxJc4UxdN8FgP6j4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OSBTYWx0ZWRfX3wEOcjYTTvhz
 n1pmeMvwb3N9z+k9EOpaSYXUBIv+Qzxal0/cm/+lIyEtobPjV3pvoK2wpqlRNSnuAVChqXaIkNn
 HgdXxdkQ3808+n/uAeR4mW9XZ+/INf8irVpEwjMVx8N8nay/k/IWhIv9Z3ke/OuLWNCVIC6Z3vT
 RUhRBrqNotdRRGc+Je/BLueMapBWjbDWtH5y9Cn4qIlrdzQbxQbSXSRmNUD9/5fr3JWFk2SuCl+
 XqeP5NScQpD4C2CQd55afK7sg6kFQP0quqBAf2WDLew5hnbwcJtPV5kMyCErsSMvJBN3D2z0TVZ
 OuYlnoQUMQek1h1lU6Hr3OehEQnHrRMhYklsBfhFEXUlD7+sP9SSLKqfZdnP6Yeu0G7czpVKxcf
 HoALOVmdxHQTvsA/rWsrx2mb8ZEXM49PXrk4Y9NHC+1mbbuc8pXViNqy6bgtn6eaVmaRWPXbtyi
 AWnCV6WgFAxpnTiQeJw==
X-Proofpoint-GUID: h91SfF0vadOFx71Vavod9J1eYxSYGwXY
X-Proofpoint-ORIG-GUID: h91SfF0vadOFx71Vavod9J1eYxSYGwXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93099-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27CEE14A80A
X-Rspamd-Action: no action

On 2/17/26 7:43 AM, Umang Chheda wrote:
> 
> On 2/16/2026 4:44 PM, Konrad Dybcio wrote:
>> On 2/16/26 9:04 AM, Umang Chheda wrote:
>>> On 2/12/2026 9:59 PM, Konrad Dybcio wrote:
>>>> On 2/12/26 4:50 PM, Umang Chheda wrote:
>>>>> Hi Konrad,
>>>>>
>>>>> On 2/12/2026 7:10 PM, Konrad Dybcio wrote:
>>>>>> On 2/10/26 11:38 AM, Umang Chheda wrote:
>>>>>>> The Mezzanine is an hardware expansion add-on board designed
>>>>>> There's normally multiple mezzanine boards (e.g. a "vision mezzanine"),
>>>>>> is there a better name for it?
>>>>> Does, Interface Plus (IFP) Mezz sounds good ?
>>>> I don't know, does it stay Interface Plus on the silkscreen or similar?
>>>
>>> I checked the board - there is nothing written on the silkscreen. Internally we call this board Interface Plus (IFP) mezz.
>> Let's keep using that name then please
> 
> 
> Ack, Should I also rename the DTSO filename to "monaco-evk-ifp-mezz.dtso" ? 

Please do!

Konrad

