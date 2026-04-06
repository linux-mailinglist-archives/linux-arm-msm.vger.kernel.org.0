Return-Path: <linux-arm-msm+bounces-101926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNS8BPNg02lMhwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 09:29:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB553A201F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 09:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F91C30048F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 07:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2F6354ACE;
	Mon,  6 Apr 2026 07:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyQWfkVD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmM6ysUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D559E2DEA86
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775460591; cv=none; b=LGeKudqQyg7d+0hVN+L2Ak8BoTXK0V8ICo3MhHOn31QWY0q1GCmK3vMQyXoIIbtEDdIXIAJwEgZE0GjBZSpOavnoUt2DC2wb1omUFCSEmM104PnyGuO2XBPs63B2XmJkgYeaT2cUocuPAPNE48oOYcSa6/dYz+F1MrdVlwfnXvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775460591; c=relaxed/simple;
	bh=QN5KldYd1+uFod0woVvjfeFZ8kyDw7udiJjsHsGxIlU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kCv57umRvZcPXSL3MHBK1zJLLwY5T/UhO4O0gz7KzU9yApJri/ap5l5WNLa+ingM6PoO8Lvdg2gKs8MHpXG78uxJxQzzk72hVLu33JkLUrgnNviO6n9r4Gsn7jZm/4cFhkbUJe1bHn6alb/XaO3f478LReKerCKlPn6Ge28K6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyQWfkVD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmM6ysUY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6363S9SR1580581
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 07:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G80EJy28BYwA6nOEe/oB2Z2qDbtqNvwKYFonsnpZaRc=; b=DyQWfkVDsqqkZ5en
	e0RGDHs7955n4mQY5R8aeMJNerMpRSjvFXpQP+FCLmV2H+zXMU1F2wdSrFl0jn8p
	v1cbLYw6F1at06DL6S6JgaORnlSnpP+9O8FilmVXnZtxZBFtizgnYcLeQkYNjHqU
	GfYG3iSY8pudAlElFYyhlsiQqiLfnhZcB4EmVFDMSsbTwYuM6PUAnR+UXV1c79Nd
	K5URqptdWxHfCRzw0XxOfKthu3kiAYoEVQF/Cilg3hSMNbZVmciiAGSo3R1wpb1S
	xydqhqnW8H+FoOcfcFseAegVN4VH3QevKTdJjN1xmkXcrvR+G2/XGe/j94MqRNi9
	JOL8SQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauthc8m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 07:29:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0f4e632caso56338265ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 00:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775460588; x=1776065388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G80EJy28BYwA6nOEe/oB2Z2qDbtqNvwKYFonsnpZaRc=;
        b=DmM6ysUYwDV+Iwp7MaEuJlU4HsG/96gxfBB1bW7C04r/QKH43UErLhdSMwL6gLh5Zh
         1608eiZmyy1VeZ0Nqn6WPtn0X32o4vMr2WDkO9ndpJm6G7PQBM2dqzDF8R6RG2un7oWa
         /jeKxgUV/z1c22XGCTsXG8c9RcXxrMNAn+7o8dO9GNCb45l0gZkG7GL7EpHq14Vr/kbM
         zuw3acmp37rLpQcZlHA+hJOejIukmz64WeCUXJ9PmP3ccTQTCJQpynoRXwUFC7Lljm4D
         3GZrmniQr3lwpnwf/eHy2rQGMbdgk77S4WCE3kSFVie7fAH1gEJOQEqi5S1/3CT/UQLG
         0EkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775460588; x=1776065388;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G80EJy28BYwA6nOEe/oB2Z2qDbtqNvwKYFonsnpZaRc=;
        b=h8m/KlQAs0Gpox6AagJXJsx14T/ROMEytF1xRb2yEg1uh5sgjRw9FS+YAGYiTVubX9
         TjSm5f49ownJr/arSS39gjcrmm5buceLxjrXMdJhsvLfCYY1wOzl4zccGtNcee5fNVzd
         aW9ETzBvm938SXzdz3ug+izW799HLoiTPlKm2CRAzoa5PXzmEfFLARKc6z/XCprHextO
         dAu0JnYq1UnXnalT+q9TtKWOW07TBOqiVYMS2380cR4C6Bmsa6NMHH2+WhVXifxhnT6z
         VJUYndqiD8iO6uS0b33QmTmxiJ346YDBxF4a1AuavpJgZPPTe3IFooH2yVqWCs6plXD4
         VzrA==
X-Forwarded-Encrypted: i=1; AJvYcCXlSkuEZBC9XtfQftxSx0kVJFL+sQeM6q9H1cxUXGXTnJHtScvKMO/a/b5B77NTy+YggMpes4DIKHPtHQAz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy/5MF5gLIMJcWt0UBxcueaiIKlpyP8dAKph+Qb2b1qL3FV2pS
	AdtNZ/YhurF+vd03rIDLnB6+BIZi7cb6l41EB8T1jYKnauKM+3HObYPdrZplGEllMEm9kZc6fk/
	3X0bMyZ8gaAwh4LX2x5MOm1FAQyXQWHV31S/pb1n2x6U6qk3SWXWqhMHacbwBlkt79fWA
X-Gm-Gg: AeBDiesIwGYhUW5TggFiJvtme+Essm0IUJ2QAq4dH0xsZ7AqoHzJRcE3ulzAK/UFlS4
	fcXY9AS2D5ff10000YHFkQKJhqx4W8/kWqYKcFNYtprBNhzAny/hGFauX8C6NFK2RBR6E4cIkD8
	btnPTt2siJJW0X6yL2uW71qJSfb2c7s+KX0nd1TEZa1HqumrD97N0OQBYhRK0q9BKRWmtyYkTG9
	gjT7SbrkEcVaEGwyWKeoP+dsr49uELDLlzr16bSWu/zg+tf8Aj/UFuUimCd8KaS0xTFxdl20RVm
	OS4Pv01/fdH7zXfSAoVU3hYyFhtIzz64nBt056QxF3svIVnuKK9zmZPTLo3XCMWAaNmh2IpLg4y
	qnk5YpNqLY34Km/0PK02906CFQ/d458NzKKm6i9ZLGfPcQplw0Q==
X-Received: by 2002:a17:902:e845:b0:2ae:54b2:27c7 with SMTP id d9443c01a7336-2b28186dd62mr122048395ad.39.1775460588271;
        Mon, 06 Apr 2026 00:29:48 -0700 (PDT)
X-Received: by 2002:a17:902:e845:b0:2ae:54b2:27c7 with SMTP id d9443c01a7336-2b28186dd62mr122048245ad.39.1775460587778;
        Mon, 06 Apr 2026 00:29:47 -0700 (PDT)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2a488caa2sm17627745ad.14.2026.04.06.00.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 00:29:47 -0700 (PDT)
Subject: Re: [PATCH] mmc: host: sdhci-msm: Fix the wrapped key handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: adrian.hunter@intel.com, ebiggers@kernel.org, abel.vesa@linaro.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403105949.1007447-1-neeraj.soni@oss.qualcomm.com>
 <x2mmttyg5t5qjo2tyrwqbynqylqqlulu7fhoyxl7vd54geubqx@qna6vzzr765y>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <dd2c0522-91bf-5375-f5b6-7c9ff5304fe7@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 12:59:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <x2mmttyg5t5qjo2tyrwqbynqylqqlulu7fhoyxl7vd54geubqx@qna6vzzr765y>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA3MCBTYWx0ZWRfX5Rw3RUZZ2USj
 jn9Ax0DM9/nTmPyfdIAaldkqiI8PaA8XMsRURrpf5L78QLM5jGaAAiNEaOD54dnFKERmUjp5TGf
 SOoXvAmOl2WIa9Eypj0DxR/qzw2sCq+2DYOwIO50JS05k4Hyyz0JTuTi//ylh/owFxer5kmFu4W
 DEDlABp8z1c+HUOgtXvhmwvtFYQRcjt2lXWCgWCzWN6+NiEMb+RlDvTCvqxR+WEBxMzJCm+JwSQ
 Xx7zfd6V3Ky59IWih9xPDsY2MCpsQcYwBBS09xlzOsi+0BGbvw+0MENsyrUe1Sok3c+TGNJpW8I
 3KTC/mmnpYEZWDROWsLan1ecHB6dCadA22RqN1f/u9VMLRrOhWCGKQYDTdTC93oVilzsD8BEvTd
 QOP+6u7jJhVnyewq9yT2mDHwvQxL3LmTlyWTEIgneAjcAW48Th6dDzI8D3QOz6FP+bCe0ziIdb7
 8wGuIgINaT8Vyx8ZPzw==
X-Proofpoint-GUID: KRmpmkZ92GNuD05yOxIvv0XXa7dKomM2
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d360ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8ToHcDrqECIu-RMY5UQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: KRmpmkZ92GNuD05yOxIvv0XXa7dKomM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060070
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101926-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BB553A201F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/4/2026 1:30 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 04:29:49PM +0530, Neeraj Soni wrote:
>> This change was originally intended to land with the patch series:
>> "mmc: host: sdhci-msm: Add support for wrapped keys". The fix was present
>> till v4 but was accidentally dropped in v5 while rebasing.
> 
> Don't describe what is being changed or what was intended. Please
> describe, why you are performing the change. I.e. what is broken.
> 
Ack.

> Also, likely you missed the Fixes tag.
>
The SHA-1 ID for "mmc: host: sdhci-msm: Add support for wrapped keys"
is not yet available in tree so i did not add the "Fixes:" tag:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-changes

>>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>
>> ---
>> The patch serirs "mmc: host: sdhci-msm: Add support for wrapped keys"
>> was originally discussed here: https://lore.kernel.org/all/CAPDyKFqRG1_1aYavfrA0Ss85B0kcTnjVBeqLgq8PUJUcSx5LUg@mail.gmail.com/
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index da356627d9de..df0a038269d4 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -1926,11 +1926,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>  	if (IS_ERR_OR_NULL(ice))
>>  		return PTR_ERR_OR_ZERO(ice);
>>  
>> -	if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
>> -		dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
>> -		return 0;
>> -	}
>> -
>>  	msm_host->ice = ice;
>>  
>>  	/* Initialize the blk_crypto_profile */
>> -- 
>> 2.34.1
>>
> 
Regards,
Neeraj

