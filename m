Return-Path: <linux-arm-msm+bounces-114994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e3leC+JWQmol5AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:28:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8256D964B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:28:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Cu3waHvS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P7BNU0GQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114994-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114994-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D20D031505F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BDA3FF1D0;
	Mon, 29 Jun 2026 11:21:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520283FF1C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:21:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732085; cv=none; b=iEnLxjqRCmQLkAN9F5RCor9Aw4F3Nv9+2+xJR9yW6s4yPgWuh7+7/9wm9gM7erG0NrDmo+a+yzBogTCJzpYCxf0Ruwm735trdNMYVwkGV4ocpfo9W8+6gQmBlg6ZKCP0gTr/4yieT5hqovfG0HPVzzdvEbPn4/AJPIfu9g1Tqes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732085; c=relaxed/simple;
	bh=DwKXwX6baoOIzTXJrJpGh5Ew485gFGr7gK/rfEbqA+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZlxkRx4vn+rkp7Zej/SY0Gqk9S4J9jz/sZJmX8yi8tv2+r/oKfR0sY3KiWk+IQIbEaQR9z9NdgOvBilVXxOeh2VNafWK5ga4utx48TQ62IQI3G3pTPJI1DFTFuost13Z8fX4CLvplWNbDJAeGNK87T1YcWSP7BWvYKBqJBg87w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cu3waHvS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7BNU0GQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASpXT2601110
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LXOilQQrt51TOYTeVjRcNsmOe1jgvaX2sVFJQ9kcEWA=; b=Cu3waHvSC9aa5XHC
	Lf0BecL03csE7Lr2SUHnjqCsvBYGdtRBM9GIdAujBV5WHi/tjoivVFX2L1l05dEK
	4xZRnizC1CwRau9dMrcgGX7TrC2G4L+sIrDydw50xxz1xA7Gpcat8vxehVYbb1sj
	rk44nE5ogiqnuzr8Z8yUGGa2o/aalpiyWf2xNb2jLF3VfCQvJnovgmX0Xb6kTZVx
	fZohAecFw0wd/aj5NtB2rgl+4SoIrpdAIs3ZCHxUN8BLqHR4GUyoD4MrJxuN6ha9
	p7A7Tqohyo6cKLHkoMJHeovVsS2YgotIAO6tndQl2hB3kkib2bfGudFpq7p+4l8n
	zYbp0w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8hw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:21:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7386e55c63cso35223137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732081; x=1783336881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LXOilQQrt51TOYTeVjRcNsmOe1jgvaX2sVFJQ9kcEWA=;
        b=P7BNU0GQwVrljoXKQ+wKd5Hra1mg4zyAvbwWGoDZCmxH5rHSvN0whWFPw0BzIZaPUT
         95PInaeZWUtmbnkBnut/TLZ01bqDwJzEHFkuOyDZ2gwVjodzhLvSuhXDCdQa0kecJtXj
         kIwV+XdvnZntA6AT5HBh4t4lxAUSRCY5HOZv+rgIq7r18epAB1ynQ4y/dzaU7DieWz20
         IIQTi1zDIh6+t85GFpSQgLOycEUhVmJnq980kWYyx6qvO3GoaKXqKZWis4KrKq1pZstH
         QHnu4AVzB+wbJ6qubNb53NgJETec6XKdbZHVbOzYxg7U6umkMCWPm6uyZt2ZBjUFzVf2
         GLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732081; x=1783336881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXOilQQrt51TOYTeVjRcNsmOe1jgvaX2sVFJQ9kcEWA=;
        b=sm47MRpVYnq3/0VTHeDdR4+Tt7cnTMJezXCEvfXv0V2OeRGvJ0bWLVnOj4Qw+Aq7La
         Q09Ge04KHhOpBLnE5ruypVMpGbuggnYp9jYoAcYwVI7bEXVDslJGcGBUmRQlXgVg2ptb
         SqTFUi+kj4RMpTJhl3+fttX2a0YI0YGXA07oLDGFOTV9PZOf7PC32KDNytFQBT/1y++b
         b/6WI3+Qi/7F06k0vRQGCO70IVYWepCvdHZmG0YgIMHspuSxEqh7EewGzFXFeBgqM3PV
         LMf06gcQwQOSSCFIDG7iIcazVoOMveaaK6L+DIxaCOjMOzG5Y+cUBtFW3ScDEHkyE3jW
         HANQ==
X-Gm-Message-State: AOJu0YyOffyVePtrmAkdMPDVPthTGsTHkfor6O8cdEaqcgMoFTQmuAm2
	tCR2pR/B2hopSXBFMQ2eveicbL6pU+DLvdK9IS1Cp+k5b/ZgWMeXLs/PQHT11T7yOG+VyJ977p5
	xPrnoVyOC1YxjprDF07SQWL8qlw/UIcbpBnHZ9vag06nnUScOG51vUAaeeueVSbVNRZm0
X-Gm-Gg: AfdE7ckq7V8FO8O5/M7nH+6qf3TexnWxEVv0aldAieT73UJfxmlqhiT/SrsFDsUc6me
	kgDRjfCr9rfz531VwMGJFqwlhRduXO46jGVFf07XbaWltQ7p7ycq/df6TpUzWYdI/60Smm0OUJY
	/kyPWw124F0P5xbpbNu7lret94jgOG5WmcLcvzOj98cL3zhcP6b03luuC6hpDBmb8q12utkFqiM
	bzAtMrnkglTZ1hLUGbCEG1ZGCTxt55+LiGRx/615od9uXUafRTo0t3nPoTLSJ8VuY0ASNF7nIWo
	kwmF/ZtiWqSfprMRCJMk6ZuyVVJcvinJt/f25HuaDplnLGqyowmZtI+m9Wg27lIbYQXw0L7e6ty
	Sp9TCn7mtoe72qN4gz3W30t3EAjldIE2UMMc=
X-Received: by 2002:a05:6102:5121:b0:739:5c3d:605b with SMTP id ada2fe7eead31-7395c3d68d4mr228117137.1.1782732081652;
        Mon, 29 Jun 2026 04:21:21 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:739:5c3d:605b with SMTP id ada2fe7eead31-7395c3d68d4mr228109137.1.1782732081236;
        Mon, 29 Jun 2026 04:21:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698481d0359sm3239926a12.30.2026.06.29.04.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:21:20 -0700 (PDT)
Message-ID: <b0d0c7ff-fe41-47d9-bd53-89b111823c2c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:21:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: Register cooling devices
 with their name
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede
 <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-fix_cooling_device_register-v1-1-c6e518b0bbd4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MiBTYWx0ZWRfXzj8Dmi7y7/B9
 PA3C06UrY8IGLoUD4ly8b1sGyQx8+FDGlbEAUe3NBLM021ppQzCeiDVlWFEfcnDlaDBXIoNj10Y
 hknzIdK9sdIO2gcH6zQ5ZCw+QVU0pgg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MiBTYWx0ZWRfX8AEhPSnF12gC
 aUefuEoDjyUnfkWMHzCvdZbKySs8WuqyctUSBTFY2wLL8L5Azowu+a50y33QgZc9f/zXgH2/JXC
 GCjn4KMEs0n1Ee1elVIfQkjPWeFPEDZPyBKinFEqHhqYO+VTRJvA3V3vsqrCe1tWov2s/mrh/c5
 KDQ4OWZPTeOyv4GWd9IaHpXj8vtrw5i3Gf7iPGS3wFA2askbaomLz6mRKQnjkR4l87+AxtwPeW4
 UYFBpDyEh9schA4GBGkvfsK/cD0DmHZ/V3nG1HNZTPYPOm8eEch3ZPKm29nQMiU3ii96d2LpmCm
 ipkvryUKzj5XiXBpjdpAhWNpJhFSIOEgyD/9q1ZNyyJ6hQT1BqcCcoUSFFbIDzXiPBQImH8gQxo
 E4iHTKD+bcie3ynyubjhe2WD6/3DuiGGX/mWnI1Zh/0DRXxzzdoiR01ZtZ8U+fyLvmOLwDMFFdl
 7fIHU43sdHYImOzqvHw==
X-Proofpoint-GUID: NJqWG6mFc49UYeCaLoGlR9DU1e-hpulx
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a425532 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zNzZX6S8Ja6Y3dQqPR0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: NJqWG6mFc49UYeCaLoGlR9DU1e-hpulx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114994-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anvesh.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:bryan.odonoghue@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:maccraft123mc@gmail.com,m:linux-arm-msm@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C8256D964B

On 6/29/26 11:16 AM, Anvesh Jain P wrote:
> Each fan is registered as a thermal cooling device using
> devm_thermal_of_cooling_device_register(). When the thermal core gained
> cooling device ID support, the helper's prototype changed: its second
> argument became a 'u32 cdev_id' and its third a 'const char *type',
> replacing the previous 'struct device_node *np'.
> 
> The resulting semantic conflict between the EC driver and the reworked
> thermal helper was resolved while merging the drivers-x86 tree into
> linux-next by passing NULL as the 'type' argument, dropping the per-fan
> 'name' string. As a result every fan is registered as a cooling device
> with an empty name.
> 
> Pass 'name' as the 'type' argument so the cooling devices are registered
> with their intended "qcom_ec_fan_<n>" names.
> 
> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/qcom-hamoa-ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index 45829f2786b7..12196d56b60e 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -391,7 +391,7 @@ static int qcom_ec_probe(struct i2c_client *client)
>  		ec_cdev->fan_id = i + 1;
>  		ec_cdev->parent_dev = dev;
>  
> -		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, NULL, ec_cdev,

This seems to have been altered to use:

devm_thermal_of_child_cooling_device_register()

apparently as part of:

f31c00c377cc ("Merge tag 'platform-drivers-x86-v7.2-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86")

Konrad

