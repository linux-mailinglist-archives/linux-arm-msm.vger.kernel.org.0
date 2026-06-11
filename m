Return-Path: <linux-arm-msm+bounces-112657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TgbYM/Z4KmrVqAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:59:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C88236701C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:59:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OlsAmkFC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CKGRfUuw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112657-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112657-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 123E730091C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676383BAD8B;
	Thu, 11 Jun 2026 08:58:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2048C2EF64F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:58:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168299; cv=none; b=ENh/4N+zRc6UZW+biKdcEcKZZlcg2pJ/EzYhrumpZtg8qnR9z+AXhLryplBJufyFSicnyiRcpq4baHdLOtfsbWe8Zmbgr00T7HkofV6kmnQqTcrP86W/vfEiwnSpOryFLzFRJm82vWVgvMly20mgjDouL0eVSpu7987W/vLqh4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168299; c=relaxed/simple;
	bh=ubFETAO+a3w70T+gsV4lJe3JhKVw3+NojPxTy7c9xX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HL6FPVGBNq/x0DT9nVp/7IemTP2NnAij7axZj43T34VLqFFCXoZjGiPuLwDzxsuq+wdw6pY4VYeU0l3Ns41KrugixNwkHG+L0yD9S896BF9tpt4WUYfpsngiCrGpwryKmiQN16f3XuWUGrRR9ctzgtJurHCZZ/FVwVUAwMVwFgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlsAmkFC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKGRfUuw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GN883863656
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITeoqfYyx5/TvB3iCArGaMCOG3SrwvleWOuIq8Gn4js=; b=OlsAmkFCv2uh0ops
	HH5oB2YzN6BpvyWnd4AIoo7SlZN3xyx3c+PyrtLMrzVVgkPTRdEnnbbQ3cBQrzf2
	Z2LoEiTQnTwuMynkIZaMfmZbLUtqnVljpzGgtDDnfxvcSiUeUEoG1cLD0QHCjFrH
	IO/Fp41FeuXdzd0bbMI4J6yjlaVPP7BIjkA9woYkPEnMH7f8+Vv4vFRqpdPJChvB
	F77DufTQwzQK3L7zsYqJqLiVqLMgvNoTkxD8F8Y3nfCafnXvS+x0CoIQmLZ8UGKm
	nsTREaVva5/Z6KwGACLMW7lHdofjv8xwH5yacXxtDNXgbZfFsqs8hFgAnmUIqG+6
	2qjWCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjmge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:58:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9160006de85so24023285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 01:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168296; x=1781773096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITeoqfYyx5/TvB3iCArGaMCOG3SrwvleWOuIq8Gn4js=;
        b=CKGRfUuw9ktnYOXSEXQNsLwIWvY7bTAvr7C83En/yM5Fm4DYMeZcHEY2jvfZAaKGew
         WZmT80gzromVQfEIrrtxK9O/Vr7tDoL8oIntlaAnadKtd1MDWj2Yxon4bKVnxfEuztNB
         YXRzTeU+L7mqlpbqXw6c1T3WuGcpSdoLuFKS16u3K0Z9YseCgpFeaJENlFcVJe4El0bN
         hj35DwQH0WBoEke1q/msBcAVKqsJByJgVSUwYYPQ8U7RBN2ul2NCQOa5rml/hWPkwdM7
         tAQPLoDwbD46S1aOMHU+3DIS2H5DZqAIBAIwqdcNEwYThPYPlyMTtcmfe2Nlv7A6ffdG
         /6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168296; x=1781773096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITeoqfYyx5/TvB3iCArGaMCOG3SrwvleWOuIq8Gn4js=;
        b=EcLpAF6AMG0gfcMrj5bPpjHGB4JLCQNCSYFtZKZJAoJ5/KsLZJr5Mm2oEKjnHJyaw/
         TEAGzWR+29FUPvRNbT8SNa/h6koYn8igTMqrLXs+rq9cRz3JDpj2r5VHsAckluxK3zjJ
         pFVeUHd//OPVrc0CYzAHQ9AWQyOjY9T/hNGHOIdgigFA4UNgIskY9Iu/e06rOX+mFsI8
         /tz/Zq1TIZV9m60ZtLkEdZLzWLLJMOXgsdDGM60rHSMvbKNph3/+w67Ox+wNaZBd+Dvl
         3y8uxqpYbD5jkXVDsPotXRcxUfytlRpnhMLWsVzrxr8G9bw7y8E/q744vkVVWjRVnlpa
         dEbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/drlY0FsvL0o3bmER8IonUjmFV2HSmcoGb+FengiI9CfNC5Z1HRiGyVEa6t3YllsASBCe2cqCQrxakzne3@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEvFIx/pqKWvFN65dGRqili/S5Ioqcqk1BqRHPaCZ5iD1kCEs
	vtf31nf9aQVf2w+nFll8JX1ZK1KOhB7ZA6Un62sDxgXbbJRaIrUklxQahum/NW7+7CaZjWgjUe9
	75/FPMagZqxPpmQBRdGJEJ8VYHLnJAPo3X3PNt+9O+gAFwUxwXt18rQJXKCy6l57ZuBAXE2Tolo
	7M
X-Gm-Gg: Acq92OGqrDTkTzV3oj3Bfbx5tWbZourD+U6ejChgfm4uPh7zoPvjwPPIzNl9PGQiRG1
	Q57PYFhLiyqvjObJ03zfolsCbcAR1SlAJjIDwt7LOQKAZkc0xjJqpzZuuq192BKnWJVmx6/Ssfw
	TsiNLGqjEN9W1KxamB906V8HYmGPzuW4/iRKvtA3AzxCvy7pRUELb2G+2Ep4q4z0tFoubNhC6ZX
	icASTaVw7wDvJmqTOpoyfoWfZ+awkpS/88xwY27dfchIrWT4iKs3tjoA+MqhqqH6J6cqxPhILGJ
	mf2V1d/lbjbnW3vnOxedZIKoXxT7HJhnJfB3PUvy1p3T+ePIvZaNa0OhlAlRnWCtO+YYTo+X0OW
	kW52qhUh9Ck01nhmCaoFuFhJ0rGT0yeHmbg5rZB7UYcsUdAPKeg7pCPWy
X-Received: by 2002:a05:620a:808a:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9160ad70d69mr155517685a.7.1781168296432;
        Thu, 11 Jun 2026 01:58:16 -0700 (PDT)
X-Received: by 2002:a05:620a:808a:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9160ad70d69mr155514585a.7.1781168296012;
        Thu, 11 Jun 2026 01:58:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e67sm10678980a12.21.2026.06.11.01.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:58:14 -0700 (PDT)
Message-ID: <56f60746-c35a-455d-9991-7672d4f0507f@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:58:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and
 l9b_e0 voltage for SD-card
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin
 <ssachin@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
 <20260610111508.3941207-2-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610111508.3941207-2-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T0PJUK_pMpu04Pgyq7GxFlyoqMT6QVL5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfXyTu83FQWtV8T
 BSk3VvQ3SOPjk3uuW3MiERhnkFabUU7GGUyaW/SFAHhuRF1GdTgzU29K4hK7AMTkhXfOJNAhXiE
 eLzkkCLaPbnTczII8xNxTBqOQneJvQ0=
X-Proofpoint-ORIG-GUID: T0PJUK_pMpu04Pgyq7GxFlyoqMT6QVL5
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a78a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_FQnCXsvKZllb7IERd4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX/GSg8DO4s/1F
 NGdSwPgbi8oM3XK7RwFtQZqmLL8W8BRzbAfBvuANvj88Eek14MQfl5yW6dZyIoNWvHBC7fh6RSj
 7unFopqZOqTF+ezFavGDE03NEOfrX0TDkgVq1YDNAzqUoLxxEARJQJHESWNwoVCr7R5X7FDTW+G
 U76m3VHmWTaocvkqhSTQD7svbVmiB0JAYAm4L0bxHUGvgnTZ+S47m5t+2SgZVWrKVLkP1qLbMt2
 hQRBlEhZm767mE8QeYqwvCsdPFb80QQjNFOukxTD+5bWuNM3TtRp+W5NF4Vx5gjDjCPvoMoNc0z
 H/ke9H3izJuG4KeJM+CANFlmp6SdPEITNsgP7SxnHEwxwTakyZGt8SKEVdWsMYHfCzUIjX2EG8f
 5OCCBnIoLGs+U9DTZXZY/HQXEP3nMJqSwTNygfn7pLOZXayLEgL4o0NdxGv4mBbOn9cbWtsCyEA
 97QNOZRyj4SIlwZUJxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112657-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:ssachin@qti.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C88236701C4

On 6/10/26 1:15 PM, Monish Chunara wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> SD cards may need 1.8v VDDIO also to be supported, to accommodate this
> requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
> supplies to VDDIO pin of SD card.
> 
> NOTE - Since this SD card is the only client on this regulator, this
> change should not have any side effect on any other clients.
> moreover, SD card driver takes care to explicitly vote for the
> regulator voltage based on the SD card detection sequence.
> 
> Also for stable operation of the SD card increase VDD voltage
> supplied by `vreg_l9b_e0` to 2.96v.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

