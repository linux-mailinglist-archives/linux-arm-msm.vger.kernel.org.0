Return-Path: <linux-arm-msm+bounces-91823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEdjFi92g2mFmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:39:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D73EA5E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75D0D3064518
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBE12F362A;
	Wed,  4 Feb 2026 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctbbKg4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDO3JSwD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482F2F1FD9
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770222747; cv=none; b=bqEJP9eCyJSXyaToSSgLco7tonJxbwjywWJwi+RAe0o248ikf6LcxalGj40ky0M/NQWVuQ8uTD571gHThhe7ADzWULIdNI3I5wi0gbBC8ngt2XOW3CAmpGB25CmO+Ak7U/cY8Hc26RYRoB+hreXsPRip+aWcMBDIxQWGI7gJWLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770222747; c=relaxed/simple;
	bh=/v+uNNItAFDssjN9spgIeJoAABxBqerp2c81ImyHwjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6L4h8pG5fd5zuA18mfDdpVoE+yT6wHHf/vugGKMg+B8UdNFzmqRzll7odf7sop5Csh8EDe6x7GP+lge55rryx51iX1jCuD1T7K/sTJwsdW1k3q1DV27qamYa9M4RqMXB7AiGDy1bbzOl6RlutyTQl5LdEUcZbryMfiIw14fYeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctbbKg4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDO3JSwD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614E4mdB950728
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QwEPD/jqCbRdfaU9YW/ilC0WxBkUaXrz5vurn7yTZbo=; b=ctbbKg4LL87hRKY3
	9syn1/CIzaodONUjpvoCFCMuYAmYoDdyXOXDqGReoSDM0OkWCLRsTpm64DuzHUVE
	/Ods4w6343ShQDZ+aRK6/ck15YZ86MyUjKwXCvOxW5tbcN0mIBcGPIbSe5K2l4kK
	fNI4PAj+VSVi9HvPZi0yEOhU7abAUcZjQ9wWTzaV3/rT4O1+mFvszG3gG6qlWMMM
	9CM5bhk1EELRtBLtgVJs5fyKnA0UTlYyf7vS9x0mQKt+VriK/3afQVTzsVZisNva
	R2MSS/kRJqfHdhe+fzfrHCoHZ/1Q15oEmmrsfg1Z+vX0SQqkEcPPgNIVGUE658q+
	K1SE6w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja0gv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:32:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6133262e4eso4390875a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770222745; x=1770827545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwEPD/jqCbRdfaU9YW/ilC0WxBkUaXrz5vurn7yTZbo=;
        b=CDO3JSwDwWMpAVySghY257WtBaQBRp1V5N0cxoJnP9Kv0AugTrbOOMXpb5Kl40CdTS
         F3AU+iD6l/dMo1qCqL+XBKqqu5fHPkPBdUyD2XB8jRCL1VVS5rvvnImSh7ie2Jjvicfu
         Tuq1awa7C36vMnLksLq3inPvQqVtJ81Jc8UycVp7TBbSLPtag9LQK1vy6JjQKhqeZKoI
         KQ8UvqYzj7kXZ8oPohgP30G8vz/hBvy8FMndsCKouo0yQxYa0uKc8J558GIj4kXy/rii
         3IJpfwcDCIHiJkReJ6FGwxw3YxPVexV6vD+Rp5fJvblkjQC7CUeXzAOWXoactl2c1iCS
         YNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222745; x=1770827545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwEPD/jqCbRdfaU9YW/ilC0WxBkUaXrz5vurn7yTZbo=;
        b=lABQqeSQw5TXi5W7Tsrcgy7QXGhS5VwFNsCjsvDphglJlFnwME7p899x5kdykApCM4
         NkGfGjQmXp7ppQSIV72xn2cmed74sW/lViYEogZrJk/gx/TKN8WIGMAe3qKZGTM/NWSf
         1WsjGAdH02fyTfJeKBcp+zsFEa6vrhabi1+9yGKv5ag/BZ1FQQZ35u2AD790XTR0ECG3
         3SL6d1Nr0v3A+hLITlheV3GPLWgJ+1PvJH4khaDjWjJXg3u9uI2aBfqwfh5U5THZo+9W
         PB4Bo0TkqmfFratG/4xXNNpvdAZazRPlfiq4/3f+uJ7m46yPxjDziwMglG1lFrjYSdQa
         3GoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWprA7LSgu0oL4yc29rjw91yEYby5Ah3QbVsAGWY/djURCSnxld++/8V0cSXIvuR5Xnn9f89ndrS49/DEOo@vger.kernel.org
X-Gm-Message-State: AOJu0YzUxWkGa1w7doLA8G6zO5gj/aWEKPPRt+J7uIytLWpft0rkYLNu
	U7fZGQo8eEjbPJFJjri/hUPp5quA4ZOyeuJ1oRIkfJzdnyeUMdPnGDnkEIeu9ONaBYvNpgJJ+3B
	+3nMqz7SvgLTP4Ryi/t4mhq626G4mcsKNNyBVponxdhX4Gtb//YiU4on97SfOaIWjO1CM
X-Gm-Gg: AZuq6aJaId9o+iq3feS2bNIVcvLE71f5WCxL2D1+ZAx/kWGic28hH2QeP5HjBcMekG8
	6C+OgE8gAG1heM8sxlONnHA5a1otFgvfe7ybf9NBx+9P8BoEoT8YxkD6F3DIwlwMRQmcUdeFNiT
	sHMcQ2H/AC2+0jZE6OCJKxDo8WiXBhIt5lIn1TAbjUoeiGy83pO9KCme4uq6w4WY2ZOWrawbyUn
	uDIpf8fdwXqivFzxCmaHSCce9QeJnUfXp0j8exkn2D7PWUmCJj2z6DvnHYiBvwUruqdcMC7GGGC
	gvecSMHIrvSDYfyEEeNLe46D6hzYalPvK6FxqhdoMnvNxIDLxNcmUOaD+WCeZfgKK47t1ZzUv3r
	0R72Bnx/EpgmMA5GMgxbHRJPhooksmFFOjPlSsHxM
X-Received: by 2002:a05:6a21:a42:b0:366:18ef:abdd with SMTP id adf61e73a8af0-3937206a59dmr3942900637.2.1770222745476;
        Wed, 04 Feb 2026 08:32:25 -0800 (PST)
X-Received: by 2002:a05:6a21:a42:b0:366:18ef:abdd with SMTP id adf61e73a8af0-3937206a59dmr3942863637.2.1770222744818;
        Wed, 04 Feb 2026 08:32:24 -0800 (PST)
Received: from [192.168.1.4] ([49.204.107.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c84c72e48sm2544895a12.21.2026.02.04.08.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:32:24 -0800 (PST)
Message-ID: <ded49af5-0f5a-4eb9-acde-7cc73db76e60@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 22:02:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] i2c: qcom-geni: Store of_device_id data in
 driver private struct
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-13-praveen.talari@oss.qualcomm.com>
 <df7cbe46-153e-4959-911a-14600b3bea21@oss.qualcomm.com>
 <cf2b7624-eaf9-4ba3-9b2e-81be3adbb53f@oss.qualcomm.com>
 <37905097-ec5a-4922-a34a-7cf0ddce33f4@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <37905097-ec5a-4922-a34a-7cf0ddce33f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nbAkq3740XQkYejrJG-E6Q7dKq7IJYPi
X-Proofpoint-GUID: nbAkq3740XQkYejrJG-E6Q7dKq7IJYPi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNiBTYWx0ZWRfXzkaJFjMnsD0e
 97KmMfmMZ/oUSOy0W+7n7EhpxPboVMmK1E3hcORp16TCMBhUsbccOVHpxU0GAQp1Vt5eK5NZfEF
 SlN5iimlBM8TC286JP3OpPjlpMmi9LSYzmE5chIbEwFQum1jX9LoXPLjhpslJshjqX2/LN7L4yT
 tBcwtVdQE3vfA5dkV9KApIw6n5g+7wsdHCES7n1rkBrvRB0z5Pgh6iYZgfkrZfhpFMZ5I6qg83q
 sQh7hvO8QEoTCjQzJNATKZPB0DLeZ3x85GwOBT2K33SKvl9eABrkIYNMoVGHSrG6zm7ciWoVSs5
 +P+7E4Ns1/3Z9uYPRY52XFbFQz6jPIBHc7uNk+MlmTJTihmKTPkTvuF9AGlHlWZHizI/WYGo4bw
 3Vdw6qFF11bmvHbz664TqGv0EUSXDc1ogt4SShiAKwSBAxYDQKP8+YWpJpnYuWes54m4VE4I3BL
 vMuhL4nn8k94T46jbXg==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=6983749a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JMgISmeAsz0pT9/O8qDBbw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=g4BVqhDYQOQbTQtDZiMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91823-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0D73EA5E9
X-Rspamd-Action: no action

Hi Konrad,

On 2/4/2026 7:17 PM, Konrad Dybcio wrote:
> On 2/4/26 6:04 AM, Praveen Talari wrote:
>> Hi Konrad,
>>
>> On 2/3/2026 5:55 PM, Konrad Dybcio wrote:
>>> On 2/2/26 7:09 PM, Praveen Talari wrote:
>>>> To avoid repeatedly fetching and checking platform data across various
>>>> functions, store the struct of_device_id data directly in the i2c
>>>> private structure. This change enhances code maintainability and reduces
>>>> redundancy.
>>>>
>>>> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>>    -    desc = device_get_match_data(&pdev->dev);
>>>> +    gi2c->dev_data = device_get_match_data(&pdev->dev);
>>>
>>> Because you dereference it unconditionally later, this should be
>>> null-checked
>>
>> Initially this was added, but based on Bjorn’s comment like there is no possibility of getting a null value here since we are already adding the platform data to compatibles
> 
> The ACPI match entries don't have it, which I think gives a good
> example of how easy this may be overlooked
Sure, will update in next patch.

Thanks,
Praveen Talari
> 
> Konrad


