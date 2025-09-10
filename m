Return-Path: <linux-arm-msm+bounces-72924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F7AB51158
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07FE64E112B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F9F2D8766;
	Wed, 10 Sep 2025 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcUQ7a3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4AC2D23B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493194; cv=none; b=Nrg4zbPjpIQELVF5/JUO9QxI0OgqjP3BLQSMG0+aqtXn2qPr6SeNN+67x7sPj8L4G/Z4CLVrfcucTJTe49MaL+FE9EEpF1pV8KOMtvRE0cBco0IEkIW4Ic/fr4oOp5TLe6P4k7TRHhzBzSWBneANLnY3mDTuGWBv36OuIa6b4Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493194; c=relaxed/simple;
	bh=DlbYRyEexjj8zwCKt3P7KTXIhWfFrI732ELpZqO1BK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MGdmFDCjpCscWM8m6WnmQ41jcFX6TowFHNSjurpFyv5iHWpEaOZAPDOECNiQ9GjoHVlMg6jXymSeyOXLp672pAziy3gaLtobJDHbBLHPXh2ah02RstImEBdawcO7w+ot194oi1bZn7pNDkrtrMn8CJvNGgLq3p8QRfXkLFT/WCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcUQ7a3A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A7cock013054
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DxMGn1L6bdanOBGg3S871xsvM7GU6DH0il/8SlYbifI=; b=WcUQ7a3AjLuXIVmF
	nWTcbBOsbzu8QxUIZgY7ZRDVQZqUjQyXrwwdm99BXQCx2nxjagdIMoSy0mAw46sU
	fzZoWx+lPCXprO39Aa7DY2zwvtHz16aVvq0lOzKpWHeMfQDJ1EZ+1tZCt2IykxPV
	64D+bbuea25tz2wKyTMAEm1kWSbDP7WT6vrzwoFWH6/XfqTLFvXGIkL+Uh1+weMh
	8ughICVKVY+Ff5BMBYOAGhhVQmziNeGsHuisltrDj/85lz852yq9e8yqFvclOoIr
	zevksYVUHy3T1vbDXxDfmvMaXNpBYcqIIR5e4DKnTEooA0U9Q/J0MelCOGzb5elf
	2f6n1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37ymq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:33:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b612061144so6942701cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 01:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493190; x=1758097990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DxMGn1L6bdanOBGg3S871xsvM7GU6DH0il/8SlYbifI=;
        b=LJnptN4hFBna3UWjf/lKJ4XQM41rsBFFsgkF76ykOUeekU9UxkkVD5ZZdZRfy9VUvE
         PEdmKh3x82RsTGl3PyywzZNZ+biIbAcCY2gjF2gOZN/6lN5BwvqSO6qpgwuJW0kLKPIV
         Kx9EasvV593MrFylRuwUFRUqwwbLH6lcatJx1bRZ0ZmDL9DbMTUGaAW87f3+9x2j8ah/
         50PsYtoGo91yAeskwimdw5TDdJ9Ng2oQaFXtNvRzVgEya/YAs7e0lc35cYezmi7/jpG1
         7HhLr+DbEaoqQNe1vWpCuO215WIlmn8+hkL24eVutJkKVYx6fJAJZdz3WlDXuFktJKqq
         6evg==
X-Gm-Message-State: AOJu0Yyi03O5UJ8YW8nEtiRrMcdeiwBPFM6NOz6o0EdeXwepyMe6ov5g
	4GmISA2FPJCxnNs8Z6kou+pzueofxobXzgxq2ExJZ41fNZkEKwls+QQyJBpUOKWkJ4uqRd3o7mJ
	ngxCtbvthodcli1e0M2C4/ybe87nQH516EnpQGtOo591JX/ifd5xiXS3OJ85fWCtY7WlA
X-Gm-Gg: ASbGncueFS0SI+6QWifz8BUju2rviAMl5v/MqMaoyS5QLVVGp1pzk4eSexHTR+z/K5K
	+3ZVL5F9V/a5SYPkjCrUqomRtkf0b3Th3uoaRy8/ugIZvBMo90BTJYnsgiitfn6rbLy+ifaHeos
	wAduoAVQDS53s77G1Pz/lpcHOdAMRwZeILqZkEGwx/AoV9kKGnmEI7bSVl0huXqGcPROMaMYFZ4
	DJzZutF6BF19HzgYybVJch4cnZEzt9CNN1S3UpTMwxqHdQA+mEgwqTRPyqxRQgSA7JqhkTkeLHl
	cY+o+R4BEsEb49GNEuTD2L7sVOExgvoTDfeehmP2l+LAgC3QeaeyV6T3moCi1mL641HPiDepWCn
	SnQdUhAuhIepLFfnozM+5+A==
X-Received: by 2002:ac8:5f14:0:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b5f830417amr105966501cf.0.1757493190296;
        Wed, 10 Sep 2025 01:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELYkAW9euO7xNhHIImT1VuFKchy/KUizYQutBzWVi31b4Qahaje2/jd+ln7b6AU9wCDck/8Q==
X-Received: by 2002:ac8:5f14:0:b0:4b4:9175:fd48 with SMTP id d75a77b69052e-4b5f830417amr105966301cf.0.1757493189549;
        Wed, 10 Sep 2025 01:33:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334e86fsm127048166b.56.2025.09.10.01.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:33:09 -0700 (PDT)
Message-ID: <f20b174b-bfe3-448b-8da5-963693de8f2c@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 10:33:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: qcom: sm8250: Add egpio support
To: Sean Parker <sean.parker@viasat.com>, andersson@kernel.org,
        linus.walleij@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250904170613.68855-1-sean.parker@viasat.com>
 <20250909205248.16169-1-sean.parker@viasat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909205248.16169-1-sean.parker@viasat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 45SYGicOTzlt9RGQpJSM-ONAA01tpP2R
X-Proofpoint-GUID: 45SYGicOTzlt9RGQpJSM-ONAA01tpP2R
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c137c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=B2zXoFvHAAAA:8
 a=EUspDBNiAAAA:8 a=yEquWHxyAAAA:8 a=HbEANjnKo7ABX2ZL8B8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=VYVPV9JAioCtC5HZRjjr:22 a=_j3XSMEICZ-j_p4bQif0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX9lfUGdBWjT6r
 yJSv1l64tltyWVCK1nbfu5ynjLvr7YKFNRjtgZa+YhHMqaXTXWVS7wRnFl0civTZbcVhewc1F7H
 1CTJFmKXPkAh9WMADKexcQvM+X/a9QHGyAgX8imyWsVWQ3V3gIJ2jcdOAQBb3ZuwnXGcKjATvmO
 KpkErLXVsDu37aVwhpswpVwSCUswk3OMq3eYYE/AcxujkYUsRRYk3VH4vf9oK70n0Lo5q0+/cvG
 RTsBpcJjwtLv3RigAiYrd5OjvyikQQ4HQ+Id7Tlo5p99VAPlubc66hgYocIt6wxWYQRZZORDKZW
 1ty8HBu8ykAQcJ8BjFLFXqR29NW0Ml6uw8GOTCz4PjK2Q658StjL0AcxlhH7Dd9qw3z5JtT3GyR
 jROlR1cb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On 9/9/25 10:52 PM, Sean Parker wrote:
> This mirrors the egpio support added to sc7280/sm8450/etc. This change
> is necessary for GPIOs 146 - 179 (34 GPIOs) to be used as normal GPIOs.
> 
> Signed-off-by: Sean Parker <sean.parker@viasat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

For further/larger contributions, please include a short changelog
under the "---" line (which won't get into the git log), describing
what changed and apply any xxx-by: Foo Bar <a@b.com> tags you receive.

The b4 tool makes it much easier:

https://b4.docs.kernel.org/en/latest/

Konrad

