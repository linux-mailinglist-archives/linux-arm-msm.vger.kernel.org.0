Return-Path: <linux-arm-msm+bounces-83930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F8C95E9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 07:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1448E3A1CDD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 06:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B840D279792;
	Mon,  1 Dec 2025 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oR47m0iw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnuTBIHe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF3D10F1
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764571756; cv=none; b=XKPn93hygseanX4rLzRkVOMo2BCjX6jh6RTFba0XGr7oyTPIoW/U1lc6ajr1mMpe7sk+PNgtFaifJieLEbWoBG4J4JaTHMIBklgeWUoRYUXAWMJQBT2fD41u9yHvcuYxj+zSmnER7NEeepUhV3sCmR13PX72RQ68ezVlzc7fs9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764571756; c=relaxed/simple;
	bh=E7OjqbqS+4mGY4npTVkgGtLx+Z0bKn4/PegCW8SEls0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IJLd7fzGthdE1VWzC957S9FpOEtBpWQeKvkGJtgE3Dvu/8Ic/vX1euaTwfqbxKl9GTrjzmO+dJUSTBHAOJNqhFn6K7BYRipXps/qAU2fwrSebG4Ur9H4wzhn2pSqWgF9wL+dvWwA4JwmJ+xd6KM+o+9MLoceaN83x3lnL32ICuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oR47m0iw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnuTBIHe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUNhp8B2289606
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 06:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gemHNmwMJPMQ6RzPW/H1gwr513AnLQz12AEpe511/UA=; b=oR47m0iwZztUqCg3
	ZgmZBRYLQGhZsQEIaiOZDyg1BY6nHFyXX0fXmM6trez5o34qzpJBPEkTeYSf0eaf
	96uP7pgUu+RO1K2Ok8UbmBhv4H39MA9DcFIXob4bXFpPX/PgYcio12ypiBkU1EoU
	VwabeZ+GYHrQpyKsHOAjPQqAoDnILsni7FjRfDTynyf7pMrGp48c38KxxfSqxItf
	aRqAwW5CSOeZUdFnEBnhpDFiGZ264O5y42lWmdPqkO4xfCU2B66T8WaxL+C9En1h
	D22DDBL4Q6w39kD8hNZJjywl1nuKEZ9GVMiJNGIxKlENI2lhPbd672IYoGCQhpcS
	XQHjcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt46bm4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 06:49:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2958a134514so51564725ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 22:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764571754; x=1765176554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gemHNmwMJPMQ6RzPW/H1gwr513AnLQz12AEpe511/UA=;
        b=DnuTBIHeZudZ3ahhskYrd7YAyaRLB/WzZI8KWs0TpmsW7mnsTw80O5n+vjGNty2tYq
         m9ObIg+J96wcVBdoKuW3eGdKJZxCkZnaW3CqJ5C6KoeW3Lwq/1jWjNc6Eqa4njGd2oLk
         H6pxCW3LPzRFu9xXC6YqCTnGCnqjRG+foikcaXWiyZdtYLKEn50TFgh11Z6CHEzmooDq
         dFe5hIo05xMx6WIpcnPWZMyBE30MNBy9dx5bYiPbaKVUYw1Hj1Nrfeq8F+6VubwmzR0b
         BQ6gKTxDBA6r+SkieMze2Bd3+LYvORqy34/Xij+EbgOVB1Q+IYhJeRbab2MRYv/fMhXx
         sFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764571754; x=1765176554;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gemHNmwMJPMQ6RzPW/H1gwr513AnLQz12AEpe511/UA=;
        b=ceKhDEdnrf6Vqgm2hJKwERG4Ouzt9PEVwHWiRg8fBd0BOhMZg/ElSI594CpFePRv4C
         lC/fz9Vqlc54IVpCTnCq9vxYaFCmZayOc7YrVzPrAUG7jaTiXeycUeUfO0xBLu37oKmA
         FNNdHu4mFCcKWgfte3mN8pHq1H1KpdcilVWpEc6hqiivRac2mhmtwIKCSq76NKaz+uaO
         hl9KIDmsVs6hkLMgb5KNSbKCHxr2RTgvFfz2mBI/5/JJdUc8W8aUXrtczOwwVuOWW4DA
         3Jg6MvqKsw1+uqe0kGGvF+qhdXYFyb4hrhfP3dLOVe6mlUEP7mu1xn/zvdmdWQUyYObr
         Dokw==
X-Forwarded-Encrypted: i=1; AJvYcCXEZ9cVDr6+w4afvHlMmVGiLctZZFo1jq4zalTgAx8HIYbeQE/4k34eKRRvfw7jK4bwf5twqLqf+gkVl0D7@vger.kernel.org
X-Gm-Message-State: AOJu0YzAY6+WRr7Jn9kTItCjNmUxVclJ4jH7+j3HzJFaLIxctmVYwdAO
	sVh+bEYNfJdqLug3Wwu0HhYUxMu5yzQTrgyJtxcEi4Ouc08FlxjIIjcw3MDbm8waALpNsEDq/9/
	H4oCRMk+uLLAvcxmzCWtb4RDIpFL/57OsAjImfXnzaJKxJRmVRkwZUlf81b/8JdReTK/MKtpCTe
	0q
X-Gm-Gg: ASbGncvQFS/UjoV/rp2JSdt84XGYLSHS7KVgnuT1pe8tgNjiGkEBcDMekSUPdd12bkN
	SHhxGgKSMKFsKIZ9l7QI2yinVuQxVXsTP7FR3zdeQAc1Qx9oYUGg06+yDSteLH04nGQZ97TW6hj
	rBXBMMApZqNjEOsEgaAGuSBdkEeQWi0XGD1isyyE69fThhPf7imtCHriTGJMmy24GqFaB3kDvtz
	kXSP/IsM4xWNR8ZCUccl7vHtGHbdkG1MrK5LEn9iCQxAdQok3A3cD0q9EAEmj2S2IzeclpGFxbL
	HJA+ifWQr2mMHxvXKP8vMdBjao1FnsvAOSWBA2cj9zYKPLaGISvK4ROO4r0IZP9HJAGen7XrHvN
	MQH4ZZDAksXPn14twgY3Q6y+JABKs56NeJ8hRPw==
X-Received: by 2002:a17:902:daca:b0:295:59ef:df96 with SMTP id d9443c01a7336-29baaf8aa2fmr238442045ad.13.1764571753611;
        Sun, 30 Nov 2025 22:49:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIipze7/wBgcpTJG7Vd1ABhMvxy6/K9lj4c34zLYEkFy9oY3AG+6j5+ogR9LQTyz7j/Ytkzw==
X-Received: by 2002:a17:902:daca:b0:295:59ef:df96 with SMTP id d9443c01a7336-29baaf8aa2fmr238441685ad.13.1764571752937;
        Sun, 30 Nov 2025 22:49:12 -0800 (PST)
Received: from [192.168.29.77] ([49.37.155.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40acbbsm114608055ad.11.2025.11.30.22.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 22:49:12 -0800 (PST)
Subject: Re: [PATCH v2] mmc: host: sdhci-msm: Add support for wrapped keys
To: Eric Biggers <ebiggers@kernel.org>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, abel.vesa@linaro.org,
        linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251127073048.2759159-1-neeraj.soni@oss.qualcomm.com>
 <20251128175559.GA2000@sol>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <e09bf9d9-a6fe-fd9d-b0c8-5428f10005c8@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 12:19:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251128175559.GA2000@sol>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1MyBTYWx0ZWRfX0UzMJGneOFhm
 LDp1yUbfilBlFLX/YwPcuVyV4kIkHNASOAyPkAqeRxmsXcJ1o2ngj2ci1ePSCSbCEIlkf3i8Mev
 AII3U/thcroJfwGCDK+NVWgTM8OOK0rKET1l9RTzmahh0JoUw6f3fXcZO3eb85UasnZ8uC8XUFs
 Srr71u4x3QgKW3+cKOTXnPKXGHuAk8Ygx6gKzjVG7wQTZHNgBgSgIiwGH2T1XcXfMz/1TtF110m
 9eEPgv3QqnpMVm13SP473iI7xnr0ipb6SpE+//OXANsIenXUGpBxDGX1wXDKtD658QzXgnFcjqg
 H1smNB4M8XjCmIUmWY30N30fecSH3zoOOR3FbXX3TaIKtBIXGFxKYHy6wE/HlljaTSp3UoDjWXo
 F3kt/Gj26uYitYBKN6df/3fQa/4fJQ==
X-Proofpoint-ORIG-GUID: g-QmaQK9kgNsRplB5P2wE7WlvhM2O1-t
X-Authority-Analysis: v=2.4 cv=aO79aL9m c=1 sm=1 tr=0 ts=692d3a6a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=qKc52UxUbR90Cc+7RLwjqg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=90dgnz13A4KOmbfFnlkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: g-QmaQK9kgNsRplB5P2wE7WlvhM2O1-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010053

Hi,

On 11/28/2025 11:25 PM, Eric Biggers wrote:
> On Thu, Nov 27, 2025 at 01:00:48PM +0530, Neeraj Soni wrote:
>> Add the wrapped key support for sdhci-msm by implementing the needed
>> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
>> blk_crypto_profile::key_types_supported.
>>
>> ---
>> This is a reworked version of the patchset
>> https://lore.kernel.org/all/20241101031539.13285-1-quic_spuppala@quicinc.com/
>> that was sent by Seshu Madhavi Puppala.
>>
>> My changes rebase it to use the custom crypto profile support.
>>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 
> Your Signed-off-by should go above the scissors line (---).
Thanks for pointing out. I will fix it in next patch.
> 
>> Changes in v2:
>> - Updated commit message for clarity.
>>
>> Changes in v1:
>> - Added initial support for wrapped keys.
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 51 +++++++++++++++++++++++++++++++-----
>>  1 file changed, 45 insertions(+), 6 deletions(-)
> 
> Otherwise the patch looks okay to me.  It lines up with the UFS
> equivalent.  Can you also provide details on how you tested it?
Sure. I tested it on sc7280 (kodiak) eMMC device and will capture the test steps in next patch.
> 
> - Eric
> 
Regards
Neeraj

