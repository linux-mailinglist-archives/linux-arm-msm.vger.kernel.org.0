Return-Path: <linux-arm-msm+bounces-91064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJd9D+M6emlN4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:35:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 689A5A5DC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B99830E1526
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA503148B6;
	Wed, 28 Jan 2026 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Muz6DEl1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYT5wfZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC830FC17
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617709; cv=none; b=BcDQz/GNWHnGw1Ryu+gtagoKJRiF953r1dEsZahzgr763l8q7ZOwwyr2OUQ+U0k/bZdZtCji3y/hgyRvljP1iydarUnX/Tgo1pcbfIuO3ljq+0y4RFsBerMeVuaoPYk+8QxS0YGhytQxaZwdD7RpZxLXP5rREjXkonGn17xTXVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617709; c=relaxed/simple;
	bh=ig3ngrFA4mAHXJcNkY0wk6vaVPcE0rMwCYUvC6IztUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ARtIsJ05zfLacnDFPg6Pi73+x6dCf61grDH0+TclUTKPk+CJJb7TXGXSGd9HzN69sk/F+T40PkEW0KcZ7Zr2Uhp7oWHRkgqfTlT/EU3MSIgIJkAD74kuiCDJnZbolWl98gWRCpM80WI8YdUbDCxWlS9mGw81WQwqptFvE5xsNgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Muz6DEl1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYT5wfZv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFWgkW811675
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XknSPNViZAXd0IPLbcmvwfJ3XSfTBpfSowx8Yw0ymXs=; b=Muz6DEl1M54rU/B+
	tI9R+h8ezE8pq34jYdCJKiqxUlGJ2LI2iU3VwOv1dwZkhe7Ew1eL1ay12hPUxsfY
	LD+IitptweyPz2TWiEPeM/BZW0lPvwEbnOC+0cvIkCjWoxWsv3odXwo5CmxFUaa4
	bTp5mj2CNskZ9gCp3ANNIhBse5IeK81dw6uGkt49Xq8s9Y8QfHZYaKUaW3IWgPrC
	78MKjrUwnqqwDM+X7wgNFZ6TRBekSFkzxdUvJPGw8lcViMPAyfSfriQjX0p2ZpEv
	UbBNcNXe5QQt/tPc7uwgiZvDMCQD0kvx5Tx8veRN28+2X9UOd2iKZltv81FtS1iX
	K9ODNg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbkdw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:28:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b62da7602a0so4812347a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769617706; x=1770222506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XknSPNViZAXd0IPLbcmvwfJ3XSfTBpfSowx8Yw0ymXs=;
        b=cYT5wfZvy8GmOFAEIfz/HDsqZ/2ANHwAVDer01FKFQOp7olshpJBSfgd8Acflnww9z
         ekt2IImnNiBeuiicbYO9rBCABJVmeHieOSg8IpcGsHiHPqRN4zM3NbL0QrCfS1axyi8O
         hvP8eYx1dxUh2wgs8X4PIBc4C3vJfbJUqrb6xkXbUIO4MDQvDEvWosLtSlsB+hz/Yn8o
         gHcvr5os63JquZyO3uAFEoUlEAJ11yooYqBllhXTxw1es6mF0C5vmuGIUzdnNDzULJl8
         Fa4OXQ8ZbtBxK+OPI4L1ZKYdF/Ih1rb/x6S2sPWfpVTEQiJ+yEmSAYeUJARbXLeADQmu
         fiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769617706; x=1770222506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XknSPNViZAXd0IPLbcmvwfJ3XSfTBpfSowx8Yw0ymXs=;
        b=FXdWfybQ/yBJsuJntfwXBEZTwmW5PKqrI6oz0yhgiODVLjoQRETEJMwir+I3PC9gWD
         uRa/+SyP9+5UAuc33ZJkplUyWJDTHMNnMiwCyzI2qhdKWvvjgHkyAFGwP0PspNTU0ZNz
         JGWhheNKSSiddKkJ3jWqXwZjXJP2NQj/MzQJtxdi7SFZHAKq4PIDAx6Dla/9srb1Td4Z
         3/HDJeYYgqSsiBSpUVIYa68Byxm/25Adt+b465i3b2wGGdVXqhsWWzDcUxnyCuH6ZOLa
         bH2PYWcXfPbpGtc5Zmu55aDHBt1xMnTymdGSnLCZnfJr19PkLycMfytzkQ6hgPY0tbRq
         DCpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4knIaWZliOUfCQzK9Haws/FYXeUZn25b9AeVL77OVVtQ3nbcnsl/lppzA7aXG+X1ndjWj4K2q3CUleiv3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2bL06CU5ilOfq+vPeRMZ0V1qn6HSkoLOSdmo6w4p/VdsLdpbN
	5ilQKBrueibnxid5zi7pjigjPMu1GdA4eBASXUtUvXrGxE9HcOGKzJcYCQVzDz9OdJP7ivCEtd8
	nClTlbtOLyDyNHr4qT4lbORKH7PpfmAa/FBDnFuz37iqN8ok/kBinRTGSDK7SPn6p42Hz
X-Gm-Gg: AZuq6aLT+R2JHg8AhGjEw3Dw1pCceGzSTqvqo9GgGQ8tw0VUyn3VJBkYcbS0iD13zq6
	KyAloUNYzF6mObmohQJmVyg0VeYUhEA13JBeZLvKOt7dnDZKeRan+A78jlYXjahCsY3iiFzmy8E
	Inm2I7LypliKAFjJYtNExpGbwr6X067vx2Pk2QANDrO8yhOcfq5OUWEbk0PEdeVY4Z39gdDjS34
	zdg8wJNTBiRfBCUXb1vop0m6BoP1fSJe8QE/Ahp4oVgrxbh3pDjg2zqb6c/+VVWr+FUuhZTfMh/
	l50xEV7HaMddRNCMw9UDG7ksrxvCVsBQriWO0ObU4DDbXG2sq5rgd23HSUBeK0m0PyzdqDzdB8/
	doBcoIKoFMcYsW+hb7qaPJT+kAlq+poYhWu3/6Y6ErQ==
X-Received: by 2002:a05:6a00:908a:b0:821:844c:5a2c with SMTP id d2e1a72fcca58-8236918034bmr6186833b3a.28.1769617705798;
        Wed, 28 Jan 2026 08:28:25 -0800 (PST)
X-Received: by 2002:a05:6a00:908a:b0:821:844c:5a2c with SMTP id d2e1a72fcca58-8236918034bmr6186795b3a.28.1769617705203;
        Wed, 28 Jan 2026 08:28:25 -0800 (PST)
Received: from [192.168.1.2] ([49.204.110.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfcaadsm3282553b3a.37.2026.01.28.08.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 08:28:24 -0800 (PST)
Message-ID: <700e3ce3-776f-4ee7-86e2-40608deffc0d@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 21:58:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] spi: geni-qcom: Add target abort support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
 <20260122151008.2149252-4-praveen.talari@oss.qualcomm.com>
 <64961e27-e316-47d1-8ab4-c4868754adb6@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <64961e27-e316-47d1-8ab4-c4868754adb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: v5uvuPms3MnVrPkka_raWC1fo0R4DmG-
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=697a392b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=hmzEZbfuJy6/QR5cQt8XuQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UawHs-3MIjIE-ZuvvMEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: v5uvuPms3MnVrPkka_raWC1fo0R4DmG-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzNiBTYWx0ZWRfX8LqeZGHRITCP
 bQSb0nmfKkPt6jBu6DUiPOc7Sc9nkjlmyIbwzw/DbxjYx1dJ2RVxx264onYEd+Y13EPSafrUcN1
 dvoFaofW/rdzC5G5jwbz6X/tknUVdeSNQFL3zJeQXNnogj+m0OcNqzwmhnJCq3odesdN5Q4aqzh
 JqKdwljf86dMk9J0zmGTthyzJbGMNu6Df7WFyNll9t0bAogPpGokUkbvy93gg+yJs4rVlbG0hkD
 kAlUhNS2/NqmkOhsX5PReiKegJ+192TEVnI4fIUmdKkx/bCRQtYiIoIJvyb6FkR6daG2eWS6Aws
 s2Ay8U38m2be9ExzxD3ryb9p6y7gWM81kCFK0OwZLdjMROIkXIOckHIEY5EHlyWRQsHfyp/nNRN
 jKlmJuRpGklo8Kdvo7UWt0cJ7nXXQEn0WulyiGbFf0RnmzNFXtx2t5L+MVyLoNGhm4PQ952+Sz/
 Qp4Wia+TZUBK6b0Fnkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91064-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 689A5A5DC4
X-Rspamd-Action: no action

Hi Konrad

On 1/27/2026 6:51 PM, Konrad Dybcio wrote:
> On 1/22/26 4:10 PM, Praveen Talari wrote:
>> SPI target mode currently lacks a mechanism to gracefully abort ongoing
>> transfers when the client or core needs to cancel active transactions.
>>
>> Implement spi_geni_target_abort() to handle aborting SPI target
>> operations when the client and core want to cancel ongoing transfers.
>> This provides a mechanism for graceful termination of active SPI
>> transactions in target mode.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/spi/spi-geni-qcom.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>> index e5320e2fb834..231fd31de048 100644
>> --- a/drivers/spi/spi-geni-qcom.c
>> +++ b/drivers/spi/spi-geni-qcom.c
>> @@ -1009,6 +1009,17 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static int spi_geni_target_abort(struct spi_controller *spi)
>> +{
>> +	if (!spi->cur_msg)
>> +		return 0;
>> +
>> +	handle_se_timeout(spi, spi->cur_msg);
> 
> I can't help but notice this function never even dereferences this
> argument

Yes, you’re correct. Since the argument is never dereferenced, it is 
safe to pass either cur_msg or NULL here.

Thank,
Praveen

> 
> Konrad


