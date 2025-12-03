Return-Path: <linux-arm-msm+bounces-84156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C747C9E200
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F43C4E05FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C27D2BE05E;
	Wed,  3 Dec 2025 08:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIyYnDhX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d7dysJ6u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1A2BDC33
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764749112; cv=none; b=omf+3jg/Cyal5eML5qCxiwK8dgKQ2ou8OdrIYJRlmpon7d0MbKDSkOsSvGX7LXbuo8nv4/pd3hotCahtASgpX8YMuCyzYtHVjanVjH2ucq0RrF4RZJzojHwUvQqceBf+DLvwf7GYaQvjn6vC99jpTSb+6533+kgOd7DxKtTCsqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764749112; c=relaxed/simple;
	bh=ddF26fu7OoHCxWfHiLsK88YuEGEKsw998bh2yARA7XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aw9lDmeRCCpYml+8DgJe1wJoyzQ6YD4bFT1wxN0Ift/7R+R2ucBBtr0GpejRTnrpyhKZB+LEQ4URsVlGcORVTcFvJGpCK+IvIjlmzarXbBlufvumoa9UZs/AvjhgZPaFBikIlKgoL4RAtDNqy7k6hMAJkGyF4fhAV5XPIty6hZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIyYnDhX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d7dysJ6u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B354bQZ330606
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 08:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBQcUn1JYBoMQFV7rVnc2nb03c8mlvaQ9Dqq+zTyVUI=; b=QIyYnDhXzumKEOdG
	TjUfLk6r1SyEQ/qEzVcwvNk65l8TGDwwpdSr0rf30iHFT8rE5g45tLBIu2xJf3WZ
	5kkLTE2eyrySG5yEV0wEjJsp4cKImZC8nX2eVhCbn5BJxhZigXylySp/41JdS46p
	GjJkuKwdSpjZCkUts1B6HK3aX82V2+qJKoSIydesjN1+QOl2Y/dM50SdG3MOPzgo
	Wb9l16n/EEDZTtgQLuzDMyIByHgjUx6vGSVRbpt3VRZtopeM8nLQOlX7Gp8teqH8
	o1uqFqDNqYaqgyeFmUPCcbu9lO8aaMbOJM9qjJMHwjikoliBEDJUkeZEgmxKDgeU
	Nj6dCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at67c1wu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 08:05:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2ea3d12fcso1237552685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764749109; x=1765353909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gBQcUn1JYBoMQFV7rVnc2nb03c8mlvaQ9Dqq+zTyVUI=;
        b=d7dysJ6u9TywuEghFS8w//ptN1R22xnVQ2SDUj7TDIrd+eOLAam9UTUYssrIjSaA4g
         zK03zqsHD5TFl4stMYWHGl5Wm7iW5xleEzV1rPQM0q5sLJZVwPO66dRlCkeJgQKTyPiT
         1JbxTAvg2iZMP9rxYuGkYZH4yOzIJiyMtWJQrwpifYgYiiEw0JtLDU5cE5qrJ0SuR0Uh
         KCGT9h2s+HpHGkFSoH7KtrBGJYuX8N+0f88ftcrvBfWJj3uSPsdeW/xvq4ZYpxBLkng+
         k6hbqGKqzAtdGgSMmJbQ/+lQ5LH5gWdwsEwa960Z5rO29D9jhX7dACtYeOy1fp7q4Dfp
         bTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764749109; x=1765353909;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBQcUn1JYBoMQFV7rVnc2nb03c8mlvaQ9Dqq+zTyVUI=;
        b=piTIv1pfx4UvwB4Q6HwzPBg96G0jw8pFezYLbrXOLmlLpgMb7Sraj3MqB7qsh42cIu
         Dp/8h9/QaY53Av/kgexDVMfzd3G7jNpAg6CX/yQKXKJCG0ESNqPFsz+DuC/c56EfBpxn
         88fgcJXCPXh01TfpvWm6FLUQRNOqGSpZhBf9ZRn0vdkWAXZQvR928T3Strb5AJd42BrK
         dfVIa2ug4zUtmq2jcCgYK4tYa+FIZEm6Wvx476zkO3GnZgWk2Cyy8pmNkxoEqHI/A5Za
         cbzp8zNYpZinPkEwhzmd4+YmdfBzimxogefHsR1rvflgKPPfG7mEgSTza8Xnpd53YnMg
         z7kA==
X-Forwarded-Encrypted: i=1; AJvYcCXvNgN53HQTqxBB5fD4BogVb4kUXYoQDkLdjbId1pf9tdWDutHvVcSlAXapUadNYjhFHuCcOTHyQPZCTKFO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr8017o6dq+Ndohd3Cqx9Xs+4i8tLxREqjroKInFfc/ZUFjBW/
	lORyGlekjhYmHHMjfyett73C72tWskk8pV61CDNIve3gO5hsbcalQKBaul8zH3fN3DI58ogM/wT
	PURC6oURNtO5tuDaT/3jXbf+ZHtdFT+25QPblQXzyfE0sO5EXXbFmrOFUtybHA/1KI65h
X-Gm-Gg: ASbGncuAPr6O+1r93C8rfO2ntC2BEnC1LoqhZjomgmwQmxv/uEorydDHQISEUODPcaW
	4oalyX8lzNaXRdLQItzx+dQlNpcZz2RTk2Bb6Sj7NYhpsuxwO8AJudbqFGfzij9T6fxOUcr5QxU
	l/c9wWvOXWFM7mZnaWg5O5Eur8wjIXkYgBiEku3Ye2frFFvb9Ok6u7KS33FXLRYPI8NVrp091Wx
	qstJpMSb8HXj+JyIvwTx1vmxOOXqS3yggs7P6oSJKSiuht6ooxwBL3bsdCBgq5ho47WUwF2u3/6
	AETmsCVIruXKJ7qU7cj7FkFWmyvw5FwQ6/Mb7zFIT1BicZtjeziXUTX+AVhZHVaL/QRhuYZoPK4
	0U7cpD9BzHxh0ojPC6ZsoUU2Te4xk+tkITuD8fQ==
X-Received: by 2002:a05:620a:3945:b0:8b2:74e5:b13 with SMTP id af79cd13be357-8b5e554d9cbmr186310285a.32.1764749108745;
        Wed, 03 Dec 2025 00:05:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOF84ApS0Hh9GdkoAeoFad7cO109foNkuwxrapBasfwq0xG9U8jx9sSjsR9PdO13pioCRigA==
X-Received: by 2002:a05:620a:3945:b0:8b2:74e5:b13 with SMTP id af79cd13be357-8b5e554d9cbmr186307685a.32.1764749108330;
        Wed, 03 Dec 2025 00:05:08 -0800 (PST)
Received: from [192.168.1.29] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7a7aaesm33860835e9.11.2025.12.03.00.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 00:05:07 -0800 (PST)
Message-ID: <7f8b7a85-82af-4f61-a027-70a903d91ea1@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 09:05:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ASoC: qcom: Fix confusing cleanup.h
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
 <a3437545-a06f-436b-8cfa-5970f9f53fb6@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a3437545-a06f-436b-8cfa-5970f9f53fb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x4H04Qj9Xz4q9NIjkztBEhxnRhZ1pp0o
X-Authority-Analysis: v=2.4 cv=W/c1lBWk c=1 sm=1 tr=0 ts=692fef35 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=luB0b-EQZGnrpS2g420A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: x4H04Qj9Xz4q9NIjkztBEhxnRhZ1pp0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2MSBTYWx0ZWRfX8gvB+SEzvcYh
 QHVV74baMKinKFDrJSoVebb74b5BJUSpuG20uRuY9PS0tNU4y0gcHSWBWHGRnRkd5YkG8uEQPi/
 CtwbugGwnkzDPkA/PRsFZgPG7oXwkdDOD7IchCOzySxxkfIOhpufYG8dUMxRTeCRikre+7SQEc2
 BibqDZbCjJGDt6CTHOvzU/DEIT4m9umb66GE8fPNfcqk4HboAnF2S8QJXj7KY/pk8g1Zu3URQkc
 ug8dbbVW+v9EiQe+wpflhxTUtLe8eDh5X73xFWes4AWMpA5eZwWgUJGAT+gitKpX23pP04NbO3G
 FZNqLtxRvvNLV23fNuF1UIcvcgR+J60sXvdLajEuboCnBb/oDz21nN8XuT8cq6ZHKJHAd6DdEbL
 hTfHAFdR+41b9iNWyyFUfGHHaaMolA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030061

On 01/12/2025 16:12, Srinivas Kandagatla wrote:

>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (6):
>>       ASoC: qcom: q6prm: Fix confusing cleanup.h syntax
>>       ASoC: qcom: q6asm: Fix confusing cleanup.h syntax
>>       ASoC: qcom: q6apm: Fix confusing cleanup.h syntax
>>       ASoC: qcom: q6afe: Fix confusing cleanup.h syntax
>>       ASoC: qcom: audioreach: Fix confusing cleanup.h syntax
>>       ASoC: qcom: Minor readability improve with new lines
>>
> 
> Thanks Krzysztof for fixing the confusing parts, I do agree with you.
> 
> there are alteast 100+ such instances in just sound/*
> 

More patches then! I have a long flight to Tokyo for that. :)

Best regards,
Krzysztof

