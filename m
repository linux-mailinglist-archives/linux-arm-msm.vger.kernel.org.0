Return-Path: <linux-arm-msm+bounces-99695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM/sOfGtwmkyggQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:29:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B433180B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FC8A312B9F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 15:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42654035CC;
	Tue, 24 Mar 2026 15:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsABJsDJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hgy0CHXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B81E402BB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365281; cv=none; b=gbdFqSNeX8Qxw3rUxoQbE3pPEsy3BNAFi7Tgq+L6dMXG9vZxQBh//gWUp1ly36Ly3626zYQmF9LU5B/tjZVeriiQQyhnpe4pXbOoxg8gueEFvy+Uu7AgnHjIpaRMoI8S7T8yMmXILoWFknQXj7uukvVlFvVVGmFoHb1a4EXjAAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365281; c=relaxed/simple;
	bh=+0Msw2IiBwdvvih8mH/Ec6kci4sF7N/JTLM7+9HfjPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRzF0p4yS7piXQJNfFd1+JMlSuTdcp2TK9xjZ5dYIn9+pAo7ZT0gyX6YG5X9r4IUsz2olfuIVkkgWDigzl1esvBPsxrE+90tLYSx/80SqcCRzo2kShq53xo10QnEyFOv3A85jkgqvogiYYQdXgEji2CGGzahAIUoD1z2LyqXlv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsABJsDJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hgy0CHXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ODXOH1146492
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5lyBSfEzVjBjyepyepbFSRgh9rqS3iMe6uh0gGT5Kk=; b=KsABJsDJDbjTrv6D
	5dg4audenIHNcV8vGwAbViLj6O5qiamDV+wBUU0ENF7UzVSot0sT6mna03ATGtyw
	bD96SpP2dOCtbaPZR2tCOgGOjSxYWHrpzqBiT80+NZgXD5/pvGQgK7TaI51nbsdH
	8IoXgUHy5YJkUuxJ2GJNboMrv8rXJ7nKnB4ZYU2E0Z20l9CRSf8W+0sBYwT7xzMb
	cFREHQBa5FAxJ+xKSmuh+m6sUyfOMpdJ5mt0glfyV2ZWxrygwahMhvR19Pupur38
	1L9WEv3bYvOoa3otx7YerOIIpgxotLxfHu/p8FQzMy1AG3fusLA+YxaJBTG8cCGB
	CGXrDA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm8d7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:14:39 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94abae6fee7so288956241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774365279; x=1774970079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5lyBSfEzVjBjyepyepbFSRgh9rqS3iMe6uh0gGT5Kk=;
        b=Hgy0CHXlfOYRhR2szZUVZMWi9MT5v8wKl2jk6W5udSf9KhDhmTRhXbWaKGtxbHEv4S
         TfyNTPb7twzYzmjmrkWfOKqISEscGiGkxhUEvEXljp7CTcwCfBmZJQ2OSeoNmbpLy8Hk
         XpUMMekGIyfO3qxLqRyxwW2wWIGOg5HVhLAGjRO04peZ3Yy2PJRk4vLeGJXwOEec0CVH
         0O/WZsncc8JnhEq7Wo0RUbjzG6B4txEheT8eEXyIXY4XBh0hT6G+hkH0ziZc4S/lt+Il
         4aeswOG5iKRNNyI2h/9jC8/ydM4onzuVPKV1H1/gJd9tc/SHh8YXdcDiaJIRigwpMmiF
         6pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365279; x=1774970079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5lyBSfEzVjBjyepyepbFSRgh9rqS3iMe6uh0gGT5Kk=;
        b=Rifj24pbRsEpKiFdLMR/nrnPYflxN5IA8rtJB762Vtfi4BUjEUzJSNT89sotMPuL68
         9YdMwH/ywPYDA/ByaAG+8yUGCHPL2e+oMJ3JG63j2AwsJXQFLRXWmoXBO2kZtsbKxpC8
         wQE1qetpGHa3U8f44ECypJzESBaP661GfkIgjJBvE+KjnMfLyErtk3Zc43/erqe1DaAL
         ReiPXN5k0JwTDjvFgLYcBLQBnJsPaeOTXtWCVzLBufmjT3fIpXrMSenfl3Q9JDXbimRo
         oalVP6ojg+hl0GO41x6tG6udwnvbQ/mnQY9RVJLz7jzHkwIlD+YCzi7vpdQy0nf6tV1Y
         WvLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTGxt+jmsyBMgIhi4ll9Wsp1lt3AolplmP0kPyJa11g3MKcSegs0bNRGbxzSvuCBD5LfkzsBNsC+zDF3jw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5C3pDmY1keI9yJRezjxx9J6G16gvT9LGroulbHAIpl/PEJmY
	g0ri1CDiFEYRrOmuH9/RL2iGvra97A97jY+nkj1FBpiD+sV9JRjY8xFCERG/urWtWQ4j+9finhQ
	kDs2dAW1nsmDJNx7cS0m6FWoztuQ0/OgklrVVXIRzNekBuANpEYTmu3rLX6ySokTPnvbu
X-Gm-Gg: ATEYQzziQZeGtWdaeiQucHWZp6hhgXNAPycBquKrBh0YfLh9ITd/2SokeaI+KXajwir
	1VzsPEwWZlGCoxs59smmK6bKV7iu8Bi/oqxaBUop6zOGwMWRFW7vn6hvtSq4wh0CXPRcPUfqJ/q
	QwMMmv4nmOPvy6blOah0u1ZxTnfDbJTm+vq3jOPyrgBlrktp7k1y+zfd8G5eOYs0LD3WZ+wWsoA
	nOf6aL5T9bZTTAGhINmGnVJpkSTyJpoQSsPi3BGWB+WUjHkg0GojLPCGOJ7LJx4bXPnsbdl6BU1
	Fm0NAnqNQBDH37GNHZ3pmxZaiYG0QjhWGXdFdv5NYRJTkUh3pJ9sGqLaoSIV8eGb25upUPDElNT
	fOaKOAGuz3tktw29xFZFljcN/VhRiBuhfLrOOehx678/oQlKtD0Pdl2lKxLk4l15jeNScmfk4x1
	vVcmY=
X-Received: by 2002:a05:6102:2394:b0:5ff:c0e8:d89a with SMTP id ada2fe7eead31-6036ce74b50mr94090137.0.1774365278631;
        Tue, 24 Mar 2026 08:14:38 -0700 (PDT)
X-Received: by 2002:a05:6102:2394:b0:5ff:c0e8:d89a with SMTP id ada2fe7eead31-6036ce74b50mr94085137.0.1774365278130;
        Tue, 24 Mar 2026 08:14:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf7e4048sm4840089a12.9.2026.03.24.08.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 08:14:36 -0700 (PDT)
Message-ID: <87749d7b-b46f-400c-bc0d-932b15c7a75f@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:14:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
 <acHxosznN-xbWtjJ@baldur>
 <qfaaehigddfg2mawxrat5fp25zu4ioo7ebc4pnojsrzwwx3kk2@4ke3phfbmk62>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qfaaehigddfg2mawxrat5fp25zu4ioo7ebc4pnojsrzwwx3kk2@4ke3phfbmk62>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c2aa5f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=uPu1DMKTd49ALcYfVI0A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: vt4hdkFxMRqwAW9eaQd5RA4Wc8MxBmDi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExOSBTYWx0ZWRfX/ZtLuTA6tUCc
 dNqGM0ykO8DXmmRq1iYyWVkEYJQxOf6z2gNVaenjXr26bzdOvi8v+ryRs4sGoAsnJA6SQtfUbPB
 1PZzKsvQtG5MHPj7lILT+NHnV6vM7BiXxNdmOxS1RC69SNgllruWE14RUq5M067EcAzk3xpegJF
 0ZbLFSV9l0aJ2WjfCfFZjEwqcwXAPSdorwOcgLRgBZnNe8R/PwS9pW1gZxNADbQYMU17+0csP0y
 5bOXB/VigL4ozw1uE3cv0c5lFVNQoYO4gHxQv1E3LTSyGSScmW6sZXuBLhrY5KCWbS+vSElRD4B
 IcFdCnX9I08yHBD9BB9ftnX4yqDs/wl68H0mzeegVDTcQh0sy7ye442keuu8ksdi81ZCsU5J5Vp
 MLfYf2I93tWbAt2BO84TDFL0mUyuSl6A93ReuSs/91bOv8OlWh65XsbNbPBM0dqiffxSy72y8kG
 JGKaqVjwVv5Hwb7RaSA==
X-Proofpoint-GUID: vt4hdkFxMRqwAW9eaQd5RA4Wc8MxBmDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99695-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53B433180B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 2:45 PM, Abel Vesa wrote:
> On 26-03-23 21:15:12, Bjorn Andersson wrote:
>> On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
>>> Recent discussions off-list highlighted that the GCC should vote for the
>>> RPMh CX power domain on Qualcomm platforms.
>>
>> Your commit message should describe the problem that the patch is trying
>> to solve, not the story about how the patch came to be.
> 
> Sure. Will fix.
> 
>>
>>> Without this, RPMh may not aggregate the correct load for the CX rail,
>>
>> "may not"?
>>
>> In what case will it aggregate the client votes cast on the GDSCs
>> aggregate to anything without the power-domains property?
> 
> So my understanding was that RPMh firmware aggregates votes
> internally as it knows the actual parent-child relationship and we were
> supposed to replicate that exactly in kernel for reliability purposes.
> 
> Meaning, in theory it should know to aggregate proper load for the CX
> based on GDSCs voting, it's just that it isn't always a sure thing.
> 
> Maybe I missunderstood it though.

GDSCs are fancy on/off switches

RPMH votes must be carried out manually and in the kernel that's via
RPMHPD/RPMHCC/ICC

Konrad

