Return-Path: <linux-arm-msm+bounces-99833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ax4C3rDw2kVuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:14:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8799B323B72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8253D3169D0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE9D3C7DF7;
	Wed, 25 Mar 2026 11:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KA0XOivC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QD2UxRjv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8DF3C5542
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436726; cv=none; b=W1+CmfD4d84F3uZ0PGJUoQQlfqP6y4uHhLUUTKZPARCH/QS6sqtFWlcGDrM78G239i1PmkA+i5zp7k+Z+4f1ChdHU/hLMEK4YiRbbwTV2rELB183jWuGaX99tfcaXr6N608BdGiow1L3B55yjPGubwOeBke8XEYhuq0+0PrVOmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436726; c=relaxed/simple;
	bh=DdZ/ZUnusFbhhYOpV5G2tr4SXOKiHGC0MGelaMwo22k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GvMy8/UqGfzljCQ1tqbdb++oZpsHhbrORMOKPgLa6EMxl4YdwNpLvEiz0Y/CAVWlWOFY8uW76xswYS9K9waMdEAPMplIgX/jZYNCDkyTRSeo3TiCEWCcWFqbfut5WbCA/0TxSLUFsKluw/Tb5F2fKwt/dzJZ2Ug43rMfFrWkUks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KA0XOivC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QD2UxRjv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PA4FH52931443
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hMkn52yKbCKoN1Qw3j17Ra/1lNBzLvJdUY/gin3sns=; b=KA0XOivCcLVniXmU
	V4dr1DE0RRdLHnxxJS26o+5cD3EoZCguDX034Q+mB9RqpsVfTG3rQsmVqi0cCJND
	N1V+vASOeU7b2/s+SwFRoY+uZq85d1zjunlgUqF24nENegz21+w5/yYMsf8Fl0JL
	4lzCYzHIXXZGKIqfB5VaSQajgkDOHKvcuV3FuOPrVVtV3vKM2AvQ5LQTRoNRaXPg
	DNVppfLVmypdFYEfGlKcKNCvnX/ypvvEtGJi8l/w1LqT0peINepBTocLXewWpuH0
	fOyZMk7DRmfVFCW6BBgfQRaHllDiVAkIAbFJH1JKURzs5DD2xU3pS7GRlc4H7HHg
	sd5yBQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmpr7y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:05:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35842aa350fso31894164a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436723; x=1775041523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6hMkn52yKbCKoN1Qw3j17Ra/1lNBzLvJdUY/gin3sns=;
        b=QD2UxRjvIGbNeqhz4atsfqTuaYXSQXzQT2Gy1V64VGMwdfmXgi/Po+mdpsgJyPgm7w
         nqCHdjbbWqmeODOvWY7hPL70EoOWCSwFglMrJsIYpBTjdpL2wMHvacdMW01pZp9nOyNe
         Q1zqkPNCok0+FXqP9bUaBVarZiSPjk559bI4rLMZIbm7dJM6qiDRGTrz/eYDIRqJZCuv
         V+RjdnQ+Kv+YQfS9oCGCG95WkSVPofTwRcz+vIzlVeu6phUUbIk0A3esnwjq6yDXUkHu
         4pjCnRmI0jMzgmxFna2lKdeY+qjiyAI0NTB6BLoMAPrJzC8m03YYH6qodcyEalumBbSu
         KbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436723; x=1775041523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hMkn52yKbCKoN1Qw3j17Ra/1lNBzLvJdUY/gin3sns=;
        b=TzLvsu2wRd0jw9McN4t9Y7rlyxzNa1u6t6zXdl5nkcP05NN9FUu+2OhBi4FoXHo2oj
         EyvIU3hOKBd0MSRkFC8ip8kRN2CLCtIcXD46VVwBtWcQak4Sag+vZJBRdr+shEdZwvyy
         ck/PJTjfsSTtXcaPm3nTeA0ep7koCP/4ojqJiuqCfCrI6kdLbsCK4k+KHZlRxJvlCodv
         M3IxLkd8331ROZp9RDIoKs/ft6fARvrlgZFnPD40zz3Mkf9K2e2HZ4xDN1NarvEvfA2S
         2tTUUIcIQogOJG7H8Z+WENI4u6BR4l7vRS0ve0/be7k7kFvuOcVEoIXi9E9ULH5QoXEi
         FSag==
X-Forwarded-Encrypted: i=1; AJvYcCW8UNemv92+5AeidgDRbv9xRY8J4lOgJHu94P6fKk4Ce/DMRCcX/Pwv1+WrZHlBcWdEdn1u6grCGYwQRnF6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7gNNpkZT9zYY+Dva8fP1pTzIvP1+ElqJt2lJZvhFiR/qrDfBv
	mP7Kfpg59eSRcpXAPhGE1os74vJSGu1p42Y6lc5TWjXEjuj1tyQ4uuxaW0jzVvCHEPBrzQfVhs6
	kydUYZMAQhL9Jga14yrbKEO8QdiDkmnZzEJ7a8FKGzFE8NbRKhfqcNj0a8GMaU4iOLGkB
X-Gm-Gg: ATEYQzxKHEEhmts1Hso+ISKAhPHNCrc7TahNH7HYvuQNp1jYNAOw/IuuneXc3U789/E
	QZKNKaAdwqeezWxd2NLSQqT5rngIJ0k+2XH1s02j4vBPhYCVCsZaguguvwfT92/FIOBbJqLO5e6
	eEf/kYJYGu4gJRvCzHQaUvaR7yfeGADxk1bNOz7aVtu5gNDnApj8gXcepnkfJ55CzKZrSI6dreo
	19Mo2ish9VsOJDZwNmfsb+9ciB4pAjUYWSBdjEHiqNu0NfUJ3tJon90JoOyGYx8kP0iI4lqDPiU
	lPZhHwC2C7UjETMxS2PlLGIPtthlzENU1NsxU0pMklwvnzWwBPhnK4U7UdKE7LFNKm1Vw+2+gEb
	G1VYxvrRKStIJRKykb08xV88IFbFHAtpkLZdOFpN7sA2Mvdn5KdLuAw==
X-Received: by 2002:a17:90a:fc45:b0:35b:e4d5:efeb with SMTP id 98e67ed59e1d1-35c0ddb2b13mr3005200a91.33.1774436723034;
        Wed, 25 Mar 2026 04:05:23 -0700 (PDT)
X-Received: by 2002:a17:90a:fc45:b0:35b:e4d5:efeb with SMTP id 98e67ed59e1d1-35c0ddb2b13mr3005165a91.33.1774436722567;
        Wed, 25 Mar 2026 04:05:22 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0e8ffa83sm911900a91.4.2026.03.25.04.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:05:22 -0700 (PDT)
Message-ID: <dbdc6ffb-7fd5-4223-92cd-9c1335d7441c@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 16:35:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: kaanapali-mtp: Add PMIC support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-2-70bc40ea4428@oss.qualcomm.com>
 <yz2lrc26oi2nm3hcr6x3fcst33xy63dqb6fild5l22tropffkw@og76e5s6futn>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <yz2lrc26oi2nm3hcr6x3fcst33xy63dqb6fild5l22tropffkw@og76e5s6futn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX4ZGKAVEd6BCu
 uRVVTIl19geRCQD5kANzu2Smqi7pj2hn7Lr/ehmR3934scld5BR9q57alykibelzMlmleNrGpqQ
 Mtj5aMqRhmcodIvx5trHUuRDKmo4um1rXOlpvqANUc5BnWy/TD7yoCYmr6nzJ4rQ2chGyR122pd
 mt8RPpbqpk/Yt9/q972T/hgofDagsfbaoET+l3LIENhjEHPRwW9uY6Z+QiAMBaRtS5Frc7a/3Ph
 usKZfHRnTOpzhNuOkq1NCAf8xGruUy40zYp7xXHIN3pBnAdYOzL7o7nyoFpk+p45dnKJ5ELhMGD
 ZKG13miFqpBiCAJP+fTw7XxI1kl1zSWM8ehApj6H6gbXawMGNLLQL6YpK54uQ5/TfjdDc2w3B+1
 vR+2R9EZp7ckN2IUw/5XnrjJ7iYZj8vHbwgoMHPPMTyZ9VCP9kl34uLaEaOebufskFstQBH1E6X
 61Zu2d2SoJUdZ5ymCQg==
X-Proofpoint-GUID: xx1cO-s_1gVqSavQquiaG-phi-rpTMlW
X-Proofpoint-ORIG-GUID: xx1cO-s_1gVqSavQquiaG-phi-rpTMlW
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3c173 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IV-LjLlVNDjyXHgx9hUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-99833-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8799B323B72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On 3/24/2026 6:43 AM, Dmitry Baryshkov wrote:
> On Sun, Mar 22, 2026 at 11:19:42PM -0700, Jingyi Wang wrote:
>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> Include PMIC files used on Kaanapali MTP boards. Add configurations for
>> keys (volume up and volume down), RGB LEDs and flash LEDs.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

...

>>  	};
>>  
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		pinctrl-0 = <&key_vol_up_default>;
>> +		pinctrl-names = "default";
>> +
>> +		key-volume-up {
>> +			label = "Volume Up";
>> +			linux,code = <KEY_VOLUMEUP>;
>> +			gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
>> +			debounce-interval = <15>;
>> +			linux,can-disable;
>> +			wakeup-source;
>> +		};
>> +	};
>> +
> 
> This is not related to PMICs (and doesn't use PMIC gpios).

Usually volume up and down pins are both under PMIC, and it seems best to enable them together,
so we end up enabling these in PMIC patches.

Since this patch is already applied, maybe in the future, we'll add them under the main board
enablement patches, or perhaps should there be a separate patch for input pins ?

Thanks,
Jishnu

> 
>>  	sound {
>>  		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
>>  		model = "Kaanapali-MTP";
> 


