Return-Path: <linux-arm-msm+bounces-109637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FkwHbgvFGqUKgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:17:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC01E5C9D8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CD25302DB5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D2337DEA0;
	Mon, 25 May 2026 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+iK/DyH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xb5WP7tI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601C337DAAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707462; cv=none; b=judJ6lovMkSVdQhyFVPvWAOKM2g2S50oKZRVrLHz91kY81ppGNYkHno+Gh96ZhBTTz5QCTU7vsFN+FNMDqif7K671D4G0kLf7VbwmHzPX57oGrg6lHd8C9B3zm0rujm/uNcWkBebBbluptjqBk0hmQR0JDV1w9LBSIBYXCYuk8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707462; c=relaxed/simple;
	bh=C7CxNZZJ37Fk2MC48BM2ref9I5ULxaqdo5KY9rRbaN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKrDYokCaozLqsrqq2+vuYELWlNJpGBVHKDg5GK8U7uwxzaL58vn4ihIVG++AMqJ+slVpFaVVxbjXjNUsSU5TN7aYi7qjtTgfxwk1uA4Lql7s3j6D6yH0R/hjDq0ANhW722YmIyEfr7DuwuYWLQsY9WPF3yyhqUhBjX1So42rh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+iK/DyH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xb5WP7tI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7QNNf3063423
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rpim49/9WdkusfcuWPLHC9wP0WlUFMokl1OdzIGRcNE=; b=F+iK/DyHgs9tF3/R
	xIgvMdE+uOa8maNLI2O5rZqGacAq1SQKCEkuofJGLatYr79Cl42YxJDQT3yFhmaG
	W1hxabQzGBzPNP+HXTz72nn9zmcgHFmv4u09VE6ZxJLeMYljt6yMoMn6wsk6OsH+
	eZDzz8GLZkBE5Xt4JWRzrjfFdkGiQOt7Mq6C3c/UJ6tPEwBDCtysSATEcVJwiwdR
	fPU2wR/nfQSqSL33qi5J6EGVctxmuOIV5YNiblDEhAU74LEhUOUwrPid6qoRQNwf
	GqrTtZ2VhWlnJEQ68OSsYeQAS2Z5t6q3m12B5khvrMoB7hMJltkkFxJLL8BzhAlS
	eSDuHw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1ggua2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:11:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c82751074c8so14185205a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707459; x=1780312259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rpim49/9WdkusfcuWPLHC9wP0WlUFMokl1OdzIGRcNE=;
        b=Xb5WP7tICeuc54+PYHRAEq70NIYEkFOY8x1ANfsonw+v0EqAGxYRz0EghCEIYO26UD
         ijcMWUp49pU2qC1mcuNsjqgeWrkzdhwJOg1cfwlUB/Is3BHkCVM9kHXrKvQPrI0asXTT
         U3SCCfp17mHEt7d94+bZrVsFvf//PW/T07KPUdZDWnTcsSpo0ey2K8NzRFKi0DyDNUsl
         U07y00FsxcFv/yau6fXK+8KzmMNPe47WhhulCHRs/I5RsCZDO9c5c7vwFRfLbo5o7TFG
         +GMz1Nalsn/ExCcudVkoo8d7hCNTXHqKOyliP6YywHF8PAJPviYHv2MkUYr+AEObsxnU
         TQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707459; x=1780312259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rpim49/9WdkusfcuWPLHC9wP0WlUFMokl1OdzIGRcNE=;
        b=FvZ1817E2RzWjs4Lqc11kwMZC6OZX9TdOM2A2u8up3tNAIsCHQ/8VwJ134pB/lbs5A
         03jSvY5SUp9KO6P6IsqM5RIeENxW7UYTERgawxb4CYipZcEVnVIeXfA+/2KsNMY9xTFy
         9eZPurevndVMpeOcU/Z1qpjoIXzQGtRe1Dt+y99INGuL+nQT+b7+FfYPIw8f4IDCJhyb
         sJPi2f4TzJHKMcLRvZsibmy1HkkscJoNkvd+JtxCBTTGPC29+vnmA180Egi4wRMRid2i
         PgYVRHWqdhHw+zfLBPYE4WaHMW//0hqvJpaqNFPfqH9uv4sgEliMEBYpTrIU7pl/2RG6
         iBtg==
X-Forwarded-Encrypted: i=1; AFNElJ97RiN8OdM4EIEEtXEZu9B9lX91weOjXGkSqpbeNwCECnNx6cIssDwK7yhL3VbE88d61rOBbTgVYf9NW96d@vger.kernel.org
X-Gm-Message-State: AOJu0YzCwoVkM2PNvbfc0u0lcbNBLBVENZprQLwX2cWd7bbjWSHpLq36
	gzhf6Vy30eJZcrKxVV3PaM9WXxZA/3j53/IBtV6oXyKMnVyiq7N3BwGPhrNuObHYOWCw3gKqvgf
	tSp//3l6d+DlgmMdTM9XjdwRkvWMvmsYNNS0oUwIWVoiWcQPdxMGmMglCKtphW/mYRg+y
X-Gm-Gg: Acq92OF4k/xp0764REHYl2fIcNBd1d2Qc+7I+mUhUYxkV4TK1hMkgUKTZ4mCncWUqvh
	sAbMr4hgT0nhNPTdPXHcx/PzdRqTh08f4pno0RyxlJek3KGcg0/yV8A9ep3fq0IU1VodCtQkU0M
	2RGAxxo3MiTa6OympjD7BBMvGPpJo9qGNuldbLARALdC+07iewSHDwHSVTKFKIR1D7f+Z2GyVsb
	uwTmRlFa3rJd95PMRJo+BmxVXhXGixs0D0RGVQ2maT/QFT9ChSxzUW2Ogitox68hfjeJhclthYE
	pGcs11nlflGINZwt5zBWvaamvfMjGKsxzDWEC6KotCBkkF51fenBIAiUuytON+ylT6+57sJ8pas
	v2erQxLJX7AR6I9rNdmuhsuyaLqYiMA8xW8mRZ+HCNH/N0cwFqDk=
X-Received: by 2002:a05:6a00:4c98:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-8415f32e0edmr13028185b3a.28.1779707459074;
        Mon, 25 May 2026 04:10:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c98:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-8415f32e0edmr13028147b3a.28.1779707458574;
        Mon, 25 May 2026 04:10:58 -0700 (PDT)
Received: from [10.218.19.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164e9e7a5sm11795662b3a.33.2026.05.25.04.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 04:10:57 -0700 (PDT)
Message-ID: <ba038bf4-d1bc-4e20-b4a7-ad24de760962@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:40:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King
 <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
 <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
 <20260524204537.GB110177@quark>
 <e36172c6-4424-4b77-9b3c-47dcdbdff05b@oss.qualcomm.com>
 <rb35vwvusd733s2zbgsitof3cpoyyfope4cpeh47xldw27ufix@7fm6bgr4wtkz>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <rb35vwvusd733s2zbgsitof3cpoyyfope4cpeh47xldw27ufix@7fm6bgr4wtkz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: evdvqh5GoS3lGqm8MAgNMA9jhCXTK5zF
X-Proofpoint-GUID: evdvqh5GoS3lGqm8MAgNMA9jhCXTK5zF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExMyBTYWx0ZWRfXwgjINWX8b0kQ
 lc8tqPND4+PcQBYdIyfdQe3/5RF+nC/MozQ6c0S/S4Kn4JQjNXYVIJXlhi1kotWUACxvsbUW69b
 pLmNCghT8FnyMkrr7WxM/KXFuLF/i3plRQTCbgXNwIsu+3sdsgJckp54LAWr0sGc/nOoPBgfWEn
 h5pEl6Ka3kgne+KnsbXspE/RgXrbLEWTab9Oe5n53hFzVn7ySIVaNAusxrPivVMtSsTvmskFwZS
 4uWUj4htNVy4aFQqjWiWgpSFokjyBjNkEVFEqB9dS4nTF0qKjcSr4cHGm2wHlzgybjlMIj9wzTX
 s0jlwYQrbWgw+SoyEhw/rLrlCRmDkqIbGrD7/CY6Gd9hv/gOOyHt7Ev8pwc1mzU0rvisCKdal+u
 Zez/i+NKj4eQ0Z+4pLR6qeS+rzQfuLAVxFBl9d/qaINZ54ZXfJStxiNd9PR2YTO1dv5hl/byS7r
 2GT+f5zJZlsgb6W/MJg==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a142e44 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qIDEVUpatm5GnGNPECcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gondor.apana.org.au,davemloft.net,armlinux.org.uk,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-109637-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,kcapi_convinience.sh:url,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC01E5C9D8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25-05-2026 13:41, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 11:59:33AM +0530, Kuldeep Singh wrote:
>>> This driver is more than an order of magnitude slower than the CPU for
>>> both encryption and hashing.  See:
>>>
>>>     https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
>>>     https://lore.kernel.org/r/20250615031807.GA81869@sol/
>>>
>>> There are many examples of it having bugs as well, for example see the
>>> second link above.
>>>
>>> That's why it had to be disabled via the cra_priority system.  This
>>> driver was actively making Linux worse.
>>>
>>> This isn't particularly unique to drivers/crypto/, of course.  This one
>>> we just have data on, so it's a bit clearer.
>>>
>>> I've yet to see any real reason to keep this driver.
>>
>> https://lore.kernel.org/all/c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com/
>> Kindly check my latest reply to the thread. There are numerous usecases
>> like DRM(Digital rights management) coming up and qce driver is required
>> for secure content.
>>
>>> Crypto drivers need to be held to a higher standard than other device
>>> drivers, as well.  The onus is on those who want to keep a particular
>>> crypto driver to prove that it's worth keeping. 
>> Sure, I'll be working on stabilizing self_tests infra for qce.
>> Kindly allow sometime to go over failures in crypto selftest and will
>> submit fix if applicable.
> 
> Why are not selftests a part of your default config? How are you testing
> the driver?

We are validating the driver probe and kcapi userspace tests while
validating qce algos. Locally we update all 3 algo priority and then run
kcapi_convinience.sh test suite to ensure it picks qce algos.

Please note, previously were not aware need to run selftests suite too.
Got to know about this once issue was reported.
> 
>> So far, i am observing 2 ciphers failing(xts-aes-qce and ctr-aes-qce )
>> with CONFIG_CRYPTO_SELFTESTS enabled.
> 
> Please make sure to run the tests on older platforms too, not just the
> latest & greatest.

Yes, will check on all the platforms.

-- 
Regards
Kuldeep


