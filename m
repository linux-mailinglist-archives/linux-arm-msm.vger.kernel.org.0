Return-Path: <linux-arm-msm+bounces-91166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFJgENJHe2mJDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:43:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99935AFBEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2961C3019F2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E904387589;
	Thu, 29 Jan 2026 11:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4Xn5jK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cu59CCnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ABD38758F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686976; cv=none; b=fnWVhsunvcyUrxs1weasIamD4mUDCEDfjLgDNJqR8B2qYSyaj2txnalgAUCJnaY8tAcaWkfwL50T8saV6Sy2pAmNnx8whrZqPep8LRjcQl9ElQep61k/lAS2hr5MmX9v1X5s4hbIlPdMoj/j/rvfgKw0yYNb4HSafk85s1Dder0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686976; c=relaxed/simple;
	bh=uhMJwo9qnCZ7V/o5pEE/2ShvJ7VM40bR1IRAG+SSFS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8doXbFk5e6fThVLPaG389666WBzwdhcKj2m5Ir0WKxM/JmUi5C5Hj9o8/6pu3KHPCb7zlvuruSXboKDZH8axQsa6mBj7D0CnsqEhsOzWhzBwmzfu8CbMfc0yBbprZ029Y6A8OgqhVhKBxjJb5bzoRd9bmfAmOWHz5HPyhZCi4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4Xn5jK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cu59CCnQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAPfo53642239
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urC/IggVeMYwCukWXNwxhNuF+QGmXdBzmKXgl/kHCS4=; b=R4Xn5jK9WvxwIp2m
	B3097Tv3tBnt7gZzEe7A0ULY0vK98G3IWtezWayvjz7i3tmUDtyNIgn+YivQOUY7
	+YMevMy2969Za+aOD4mvF9RCO27L/lcZELaJaShtWLW8DZfK2BRIW8o027CYDvMU
	BrWCDqlexHBagID8omcWpUDqBit518mw2JLUiRZ1SQUmmKLFeGCXthVKPVl6/OEQ
	qC9AT6UxNdSHe/Hbcx5MtXWKD0iJflD+Y7fG4SfrbnfebwiWpzUETlo4U4JTRKiV
	HlQkc70Hjb7wH51XdUP10Li5BJgJkyjo2eqQt/jb+imhq6CQ2eCcsrKcmLQyI405
	Mqltaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05sr06p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:42:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c709a3a56dso31883785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 03:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769686973; x=1770291773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urC/IggVeMYwCukWXNwxhNuF+QGmXdBzmKXgl/kHCS4=;
        b=cu59CCnQj0i8LaYZNN4XPU8aibVLzSPxElHjHiILSDmWVJW864OVoY4bmNLfkkv0o+
         vRaVkGXPqlMd2bubgcWKT/YJ1ek6nAsh67rcHLNxPREDHEa0e4NxOyngR7m/o9iC7PaU
         H5wyTgq0jR9w6CdmxiNMgPgnzgEVWVWgV2MitgX80Pg5reI2wUvJ80gZ/RuupZJtqMJd
         6G8tzY+Fdq3ERHMrScmfEMf7+fi7ZlU+cDuC+C5wYZ1DQAZe4PZwS1OT+lCT4BwKkiCJ
         dpwR1XjQ3F/dNg2lhinvyNQV/uF+lq8TS+Qkm+VLaf4rxHEAPSSYSSVhIyzRTNd6BHeY
         zgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686973; x=1770291773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urC/IggVeMYwCukWXNwxhNuF+QGmXdBzmKXgl/kHCS4=;
        b=rlBu4gWitZmkZcwmXCA/CEzAkUijuDo4e+MhwOJhA3qsK48lwbzy78w17iZfaEywoK
         jL3+rKHUhZ3f159P2mPWZ/w7bLVMLtpYx23d5t2kiq3i+DD8iLGryZM9ERVEQEn2Vzu5
         DWqTk+tY6deSTxkhIUPPLB7iSvDPwOAMMmb5aVGrTkYpOdgZKDHz1pSACE37S0eLvjYu
         4Gj9l3oAKO1IN737JpotDe5YpQ2vbc/kyOxBbvOjVvWD97jXRbErF4H5D/fYKwZ+j8Mp
         WlBecMw0oZhNWbEKwNLBJQ8nXjgNuLaZkxszBIWS8a60+UDC1v2nWXLsF+SvokdNy9B9
         RRWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo885DKfQqAh8WaYiz1q4LeY83qQdTMqiGomMxRZJFT7kVFgpF47mRdvWSI7xrD14SGBbiwoyN8VbPSeF/@vger.kernel.org
X-Gm-Message-State: AOJu0YxPLYl8R5RdMlnXTp2f2KuSvtfC++3xG2O2fHkeaKV42oGEIvyo
	8Brtiy0YGoEAH27GzcdpkgX7Gq5FjR4ou5RsYbx/cogMhjtgm5AgZISQajd+ggGH9UrX1JPO4Rl
	ah4fuVYEwDsyR92K0HQu8pfH+LWzj9ookvPdZd+lHgxz9zGlPx08P6mb9HTth3hpkvC91CBmxs3
	h2
X-Gm-Gg: AZuq6aJRhUxtusABl55A0qLIoNbTDMx6/0P/3tHNPynuVmEIqSCeT/PvxsFeJbP9GGE
	jzwJLn9DgzknIJCBdJDRfQP6Ih7/wCfri0aJEhzktSD02NXKZtqaMAgvXL9YKSmJdgD5+WXPCKO
	vHHC/2gYyxEUoDwM+y6gVYK6oKWA/M9AclUz6MS0rYsz3V/6ZOYvUb6cJ2tewdtamJ3d61pOLyp
	Hbh1kVh4/SHW+qYlT7hNaz7psHgjva2VVa4098QrE57mG/sJ54Bc/WPkBvQpeqIAqPt9rIXpOQL
	j8LVT8RsoJRS/np+y/VycUjbhKl91awutTGdLLjiLxLUur+aGCjB7wnN8oGC8x7/wyz+QgcWKvQ
	E2swJ0XjS04i+vCnSjUrbPbr3lO3w8yticqjjLahx/fIERbhG0grPT/kSE7Rk3/SsRL4=
X-Received: by 2002:a05:620a:909:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8c71b40d0demr249894385a.9.1769686973417;
        Thu, 29 Jan 2026 03:42:53 -0800 (PST)
X-Received: by 2002:a05:620a:909:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8c71b40d0demr249891585a.9.1769686972920;
        Thu, 29 Jan 2026 03:42:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ddcf8aa71sm112265966b.14.2026.01.29.03.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 03:42:52 -0800 (PST)
Message-ID: <7c0883eb-3147-4b83-908b-b5c0ff909481@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 12:42:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] spi: geni-qcom: Add target abort support
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
 <20260122151008.2149252-4-praveen.talari@oss.qualcomm.com>
 <64961e27-e316-47d1-8ab4-c4868754adb6@oss.qualcomm.com>
 <700e3ce3-776f-4ee7-86e2-40608deffc0d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <700e3ce3-776f-4ee7-86e2-40608deffc0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3OCBTYWx0ZWRfX10Lnb3aRQvkt
 LwxNhqcUTSbo+f+sCqlzCWGtpKU0rz0JwhCGITqyAetx8pUvMAWrMcW2mhTeds17HlDPlTJGp3o
 jRqiQJPUVuzm6v9jL6wxD25HwWw0GXh8+LoE8dpgEVAZ/3w1Hq5XfB9df8v3xJ9ipcDwd2uyOJa
 T9KaVs10heen3bppXoDEtaFRsXjs3FhwKeAq0gw9Z5xERGAeV5pDZwBqEEy7GSkRkOixhSZx0H/
 i4etuFHHctcfcZMxh4mDqxk1Rz4Eko54ZLp32gBAoIBa42Zcle6gPjzglX61TGVFo5s3Qhg8+ns
 uv+0LHaq/l5BVkVgdjVvIEzsWGAvqs/VeHd0heUJX8XN3mK9/u1D/j48xp6sR3PnCg+H9BmeRFJ
 HhHg6JqBllb9ipX6uX0TP2HFRU3g4ix6dDQDmSz7NR+NQRdzhq8d0RghUrTiHIdiV9a5Y33IbXb
 jHmsjpnJwPdEJ4l+vvg==
X-Proofpoint-ORIG-GUID: 3JCSaKvSml55Ihx9cmT4Y4s_K5KwCxQz
X-Authority-Analysis: v=2.4 cv=UsJu9uwB c=1 sm=1 tr=0 ts=697b47be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rYfZC6WfGBFJvMEZbqsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3JCSaKvSml55Ihx9cmT4Y4s_K5KwCxQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91166-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99935AFBEA
X-Rspamd-Action: no action

On 1/28/26 5:28 PM, Praveen Talari wrote:
> Hi Konrad
> 
> On 1/27/2026 6:51 PM, Konrad Dybcio wrote:
>> On 1/22/26 4:10 PM, Praveen Talari wrote:
>>> SPI target mode currently lacks a mechanism to gracefully abort ongoing
>>> transfers when the client or core needs to cancel active transactions.
>>>
>>> Implement spi_geni_target_abort() to handle aborting SPI target
>>> operations when the client and core want to cancel ongoing transfers.
>>> This provides a mechanism for graceful termination of active SPI
>>> transactions in target mode.
>>>
>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>> ---
>>>   drivers/spi/spi-geni-qcom.c | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>>> index e5320e2fb834..231fd31de048 100644
>>> --- a/drivers/spi/spi-geni-qcom.c
>>> +++ b/drivers/spi/spi-geni-qcom.c
>>> @@ -1009,6 +1009,17 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>>>       return IRQ_HANDLED;
>>>   }
>>>   +static int spi_geni_target_abort(struct spi_controller *spi)
>>> +{
>>> +    if (!spi->cur_msg)
>>> +        return 0;
>>> +
>>> +    handle_se_timeout(spi, spi->cur_msg);
>>
>> I can't help but notice this function never even dereferences this
>> argument
> 
> Yes, you’re correct. Since the argument is never dereferenced, it is safe to pass either cur_msg or NULL here.

Would you like to send a patch removing the unused argument?

Konrad

