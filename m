Return-Path: <linux-arm-msm+bounces-106836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONgcKMZpAWrRYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:31:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF7D5082E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1327C3001332
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 05:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F3436605A;
	Mon, 11 May 2026 05:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIeNlnzo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CroqFvqq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5690B353ED9
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778477506; cv=none; b=IDKTfNNtH1njpx2B+t3cmwCWZEUEjhag0KS3nXRSxMZLeXJcaEQ5JREm+wUKXOHNPDbBUS0xRF17xiWdQMfcfaDzTpykq4eX23lo9KwcXpPx8nKQjg9bJe0A2mjcfwauVDd8KaXsOkp8XSNZsXy+focbXnSlc/lZu2J0WtcQpXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778477506; c=relaxed/simple;
	bh=x1m/G9nmNnkUnlKOrvcAt6Xtf2zAg0FiFZK9a39pDM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GotyHo+TdGuauVOJPvDluAeZxispgRdoo9cJpMnh4jCiWuhTr3vzO6ZV6uQNvHHXBo8kZJMVf708yP7H/v8yiVg+BpyVAAy+vKsHu1r2rvryR7YCZmiQlFvC3jY7ir3EAKFCpjusElb1usH96SmTAF4ADz5Qu+RkO1qnSSQAQx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIeNlnzo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CroqFvqq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ANual4682408
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QmMPoRGigEI/xvrNZWGAsPqPg/OsxQyRAFXhN57HcOE=; b=KIeNlnzo36SBceP9
	dIi8uGZu8bKunJJtyhE/9l4AGi0vP1NbKiQKCM2I/85vR+cinX024F9BE0x1hlNX
	HxTEHGCtKpyNytfOZE+Qg8aFHHP6GxQ5YCrVha4n3AsuJ+jZoE3Q71gcuKV56kHA
	2r5++q1PKo+a+mLOwA0Wro1kxd3oEvg0zqIwZjpVwrc3nhaDHCc2CHLuCAYpjkuw
	LXiN0lxfxL3UEn/kvNuyoGXRc65igkw6cBPgQWGQudvMzYcrhAT8R4JE1CpzSl4W
	v7Nu5tXAeOBKTQWQOkdQb+lfwhoXc0H51MLOKu58J3AqgxTZQF4/UV/mMDESD9RH
	yk5bWg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wpechtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:31:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba268cb5e6so28176345ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 22:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778477504; x=1779082304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QmMPoRGigEI/xvrNZWGAsPqPg/OsxQyRAFXhN57HcOE=;
        b=CroqFvqqp58MMnXVLCydD+rA43yIjP1bThVH+9zRSR91zgwKefmfxWTKcIuUmrckq/
         EnMV6FG9qfqw/OaqgZH+cKA2XzSch+bb2zEpcPbo2J+Z58+x6oq5fWgfmFproz0aZdg3
         ch6+ZtTCJKoog2zhc93hI2sQGaH3ca8rT0hvimFuhwTpB80pTX4pVmet3sIna47UQE+e
         HsBZC8EHh4f+NOFrfKEDzKA36GMWtyby8FIejg4vJ+cskGzZdcac/r3V0Mn2DraNxyAb
         pnbJi48ugqBQUXIe9fr+La3ZCLYRDKvaKzCZ1zEdA9aNEl7aWc4eukhaTW1bUU4gzrKY
         TiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778477504; x=1779082304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmMPoRGigEI/xvrNZWGAsPqPg/OsxQyRAFXhN57HcOE=;
        b=M5ISDFMYrM0uFJW86QiOi4SCIExvwzlrFrQZHy0xraYJy8ipgKnvA+zTLp9rKixEOG
         rqn0Hd2VKex6DiiwJE8g+GD7Q0thNZRJU2SK76bl7sK5AWlwylJvQQUhcchCYC7s0oxH
         pvfVsODulHGBTqlKiFy5Llgi1UtBiwbRebwm/BYsF+6T/QPwafW4Ey+hv5PDJRU105dn
         vVyr2aqHD1wB7Rlt0XXOHB/HAcF3f8BYlpk0rtXVxWnp2aOlYJA+kccphxw5o/pY3g4R
         Nc4PV8kXyfyohx917n1ASi7XdYhLulcgZfbFDcHvJHp4cqCaTkgUmRWyvYPwz2kK7xl0
         8V1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8fNkgn23pGYcLXdJXbgXDbUpW6BDda3uDWiAjuyOBHWoq3uYRe4k4vwJbd/wA15plUsWK7Wu01Z81KZ9jx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbh39KKnbaOCjA2ft1LoL54+iNye02bCJriGu4CjzJfkDxN5AZ
	H+XxIqLSQB9+B8GNtMZVYieINOclDz4AGoHvC0CeRNYOXn/YaSNmvO4oprSrGj+wqMxQSLevfy6
	BgdaMuvc6FbHrsof2xj0ptImvcqCnffCFvB96sWr6OhPb9Q79ZWufM0TyjtoVFfmtNwz6
X-Gm-Gg: Acq92OF7tlbX5c0zF7mZOXbrVdvxv/vgHACXnRZG3qlSUVEbi7EF9Xy+GIMcRaYW46h
	OCHCatjAOt6npP/ElbEd6lS+Szc3DUI3MFHlPX0HugQ9VY42LiYKbjINsa/GIx5t6n5xfYRh6vm
	gVTmAKpKubcS/Xgqb4luhR2H5zIHmwE+DNoPUvENhPTxq/LLyzYIf61xeoLalXn+fyccAGUQzr0
	QHAbfd9Wc87GZkirTFCYFplS0JP83F0X+RtdI/a8u78f83iF9ecjUzZ+3s6cXznZIKg42+NwVW/
	/wqZyMONwj6CepoXFzlHf4rjtZDkE0e/Te9MAxqnXHPN/TQUfeMIXv08Spvuvl/V/W16yNWH5t3
	yP7HOIgM8M0HWi1yQ9rgpoMOgmrGbqmakffLXaTpfCXvr/U3HdoIo3V4u+XlyuJfi
X-Received: by 2002:a17:902:8d81:b0:2b4:65f6:e24a with SMTP id d9443c01a7336-2ba78b30c65mr155311455ad.4.1778477503908;
        Sun, 10 May 2026 22:31:43 -0700 (PDT)
X-Received: by 2002:a17:902:8d81:b0:2b4:65f6:e24a with SMTP id d9443c01a7336-2ba78b30c65mr155311145ad.4.1778477503348;
        Sun, 10 May 2026 22:31:43 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40597sm87503005ad.22.2026.05.10.22.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 22:31:42 -0700 (PDT)
Message-ID: <fba91089-6fff-1633-bec7-8815dcd02004@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:01:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/16] media: iris: Skip UBWC configuration when not
 supported
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-1-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e788yze7ZZFkmk7tDVLx6-szh8aYnkiB
X-Proofpoint-ORIG-GUID: e788yze7ZZFkmk7tDVLx6-szh8aYnkiB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA1NyBTYWx0ZWRfXxCFm6PQoQE+p
 Y3mlUfpAiBLlxcNCc6ENfhep9JJ5N8S0fAtDUm0KuwwR48d647TJvmJdmE5PuNFpwxzOAOtFoAV
 qJKgVPNvy63oTxY5Lfil3LNZFi3QIANH1tZQClC2+XtDaT6oBXV2D8LQoNJiKXkZZWfNu/YMwtu
 KxQZkml+EMxfYxnLEE3pNfAPfHLmTZWj7j8gVNB7xX2S+0LNM+4jot4CpXjYM4DWNjMuQ9tRHbx
 y1510CiHWE5BfliB2cYugJtJ4hvHrpvyJRBVsjzGjXDrFL//3ed62Zowgm4/+6uWxfaLaoklnWS
 EkV1c0fAMSZ2WqKicDCqgMLrEogOcjdt6LvA+rbPrnS2stY0TEHEfC/FkmHjXvfYFiWgFJA08iA
 Rc9GPVzLcPDEkgM71em2So/Qnxtjh9Ci42PcbnQ8zXe9ygai3+DVsxiwLG7ogpOF8KjHHJdoi4r
 6Fxm7rw9JiLsMuUvhzA==
X-Authority-Analysis: v=2.4 cv=EeD4hvmC c=1 sm=1 tr=0 ts=6a0169c0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IaWEfZ5NjuzTEUi6muUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110057
X-Rspamd-Queue-Id: 3EF7D5082E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106836-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 0d05dd2afc07..6e04175eb904 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> +	if (!ubwc->ubwc_enc_version)
> +		return;
> +
>  	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_MAX_CHANNELS,

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

