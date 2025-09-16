Return-Path: <linux-arm-msm+bounces-73649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE63B58FCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51AA42A7A48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 07:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B1C284896;
	Tue, 16 Sep 2025 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZqfDEOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F36284686
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758009551; cv=none; b=nIxFaqbYSD2wet5Gpzn2Qjs3gtn9XmnBOH1svuXG0ikznxWHloRvZ8TBRKnTDD79Mpc4pMeHEZ6E5X7wM11VOfPdwuF4nCihd0iEd1USu//cFhhpsMXthAg7ovJrdq8KexLhFVOEO4J2diUwXCFT+aGyZvf+hutPMnTMJF5SjVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758009551; c=relaxed/simple;
	bh=luXA3BAxwfQykxsWgqlH1n5LzWlMt8n5hBlB3Owwr/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fco6q/xP3r6PbLIcBVzF9uCIbyBpw7inf3mYwyGBP5X6+x7JWoUuVf07bYzEUNqx8dY61/l7b5qNDyFoAVDvmolAT9n+6C54MpqyJL3jQheBrAn2KnAp29/t6+PUVoXCZxOxDuTpdjjzAtGoJkdigw+/xZ0wCKoPswN8J6PBK9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZqfDEOl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3piEY012544
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bl6XIkWkFljciR/SPXMo9xgXQdmc9fkaHnQt4AwcHd8=; b=aZqfDEOlATWoThDM
	ovnK8QdibZ7MoP6MD4xtyQjIMUXl5SGGabYbOV0MOFfRcCtNDw1M4lwluURmWhKm
	iRLViQFxuKsDeTUoEFgpX4h6P0Qc4V+g4S16QTRdV4bozcGIXbbcNt8bNR0iOQ/n
	KXurKArH5gI0jOf/XdBpKcVmvJV9dPPb3YChdbIrJBjRs9+rUT9Xre3Sjv7DQimj
	11KucwtHUmvuDfIiZlVI3rRoBs7AaqThTRrwHVk4rrW/daJfMGJ+7DTBmG8r37us
	yipYnAwNOOG+xRAvLiIFtQG3HWw3Ox/VKdnogaOKwe2ZLYuvm1do6iwXRFfuel2k
	VGCn2Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072qyck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:59:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b79d4154c9so7838141cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 00:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758009548; x=1758614348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bl6XIkWkFljciR/SPXMo9xgXQdmc9fkaHnQt4AwcHd8=;
        b=AYoLUrR6YplP2prYtbvDVlVAB8ohLpIErfQwyP37gaJ7xzs8cLU23cqMD92PBWZ/4x
         dxK74cGnOR+meusxXc0pu7G3PSh+9GgqH6ikL/WChqSgYeh/sYMoRWZPACClHSXJxZDO
         2CCuOTfeAZ55ctPDvIYHPcwpNqtCOR2aeaKUGO/iC35+iuJkgOn+CopHseil3M6uvsy5
         n0S6dUo71UFpYiVFk1X6c6sLl9s5DiDd/rdrM4lAs3+/QdrLu6+l4/hwMGhjHQkq4dX8
         //30ZbEN5CnvEU80BcNDNJxmA05X2GG04gRqVOKZa27tgB2iNLRlF7rDuWKr5aDKmbMN
         W5LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQejQ94Ncvslgl9KADtTp82KYgRai2E5nLExgBRxEmf5A1GsmN5rQjSbCbKz5xeomEawKH/bPZCMoEpKu4@vger.kernel.org
X-Gm-Message-State: AOJu0YwvqtyKzxfmvFt4EPrXHN1eEMqzCP5ZUjl2BBrsLIo/Da6lE3Wk
	JloPxK0/K6r9dDT4WZPoBFIU4eFfSDNzUSCDCWl2dg7nQ92xH/kwNmmQDgWw89aDad9rTg4o0YX
	p80hpTXjnXi6aBOe1buEL6JtUP1ZjVUf8YO1rCLcUjXAZRwMMx1j6uqqiiIM5bKLJoIU2
X-Gm-Gg: ASbGncvdrZhFTFaHNzDXcaRS3PwgXO9PQPeRhQlIBuKHsDkuPstqZ2B2y+JE73BADEU
	CRDEI2Cq5jMIOuALm+CtFT0OPQTM0wYU1F6yuJ0TMZgLhpSqoD/Au30IXJ/nmkntcvYOxqBxDSk
	UUrFtrKUZnVtgKlavzErVcOLQF4Cepv/ovpmQc17+xWq/p9RcpsuNYPv0rhURHiWiAVCQ5Gp1BK
	PS9QvM/SC2kkra6bEtEmLsE1NLfpFec1rvZtxFqsW5kQG4to7bIEKm/ocn2QLI/A9ftbn/o/kuC
	NDmHLA/Z2UTb9nxj4cF9vLDfE+F0FQ4NUHQgpfEiM6vcnEE5xF8dV66EB6AmVdYqYaphwD5zRBt
	UYKdMnv+VrGzDElj2Lwq4uA==
X-Received: by 2002:a05:622a:1819:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4b79ae7518amr65238671cf.8.1758009547491;
        Tue, 16 Sep 2025 00:59:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmODftrEEwDnmk4gqtDucReWHiHbxT+KlMqX2icp9tsQ6afSGP7fT1h5VI8YPit50d0g7z1w==
X-Received: by 2002:a05:622a:1819:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4b79ae7518amr65238401cf.8.1758009546833;
        Tue, 16 Sep 2025 00:59:06 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f416db508sm3528606a12.32.2025.09.16.00.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 00:59:06 -0700 (PDT)
Message-ID: <5736df73-c90e-4f11-b461-c38da4e811e1@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 09:59:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] power: supply: qcom_battmgr: Add resistance power
 supply property
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-3-6f6464a41afe@oss.qualcomm.com>
 <gk2ho7ugp35kb4x65meqsm3aufnry6srr4p7jspf6xyn7ywzkh@vd5ca7txjdk6>
 <0cf4b0fd-e468-4aab-9ec2-38da93435557@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0cf4b0fd-e468-4aab-9ec2-38da93435557@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX0cef9SCR6Fgn
 dMZfxRVvQF1V8JekPjqo3ZyEnbw4dpEnnshgN5LaC6/l89tU5ib3BPgNQ3LI4F74y5f17RJb2rY
 A/S7aGupCr5Fr7Y0f/kzYRtc8tNiuoCrmJEF9h4jdeVcq8sjeJ8Nf7BH/YOpDoBAj07QvqqNjSU
 C7o8FlaXe49mXM/FbjljkdiTG23NAd6OWDRqHTdS5KWRXDBzZmXWcyRK61BAPqKTtmQMgdumVJu
 9pa7KqfUaluvjoVTL3V6aykA9n1HJ590moz64fZcmn0PgabOm2ql8i9oHhvcl2OF5lhFKGBEZsH
 wEOfNXV1spcBw99o8xnE3RRFketu7RPipgcXsT1x/djR2T1gazu7jH0M7VXY0tBgrjXnwogT/oM
 YZVdiiRw
X-Proofpoint-GUID: 4bGs5vcYVncuXjQOBR56nRAbC-IgGVIg
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c918cc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=mNYpJT6RAAAA:8 a=BliEHdnzWw9z4Hsov9QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=eybOJ6GWDyyBfQoUqdmp:22
X-Proofpoint-ORIG-GUID: 4bGs5vcYVncuXjQOBR56nRAbC-IgGVIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025

On 9/16/25 4:31 AM, Fenglin Wu wrote:
> 
> On 9/15/2025 6:18 PM, Dmitry Baryshkov wrote:
>> On Mon, Sep 15, 2025 at 04:49:55PM +0800, Fenglin Wu via B4 Relay wrote:
>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>
>>> Add power supply property to get battery internal resistance from
>>> the battery management firmware.
>>>
>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
>> T14S is X1E80100, which uses SC8280XP-specific sets of properties. This
>> patch changes only SM8350-related data. How was it tested?
> 
> I assumed that Neil has picked the series of the changes and tested the charge control limit functionality on his T14S device.
> 
> When I run "b4 trailers -u", the tag was added on all patches. I will remove the "Tested-by" trailer for the patches with functionality not applicable for X1E80100 platform.

+ Konstantin

It's quite common to see someone leaving a T-b on the cover letter,
trying to say "I gave this series a spin" and then seeing the tag
appear on unrelated commits within the series (e.g. bindings or some
cosmetic fixes". Maybe some sort of an interactive (opt-in is fine)
dialog for "which patches to apply t-b/tags to" could be worth the
effort?

I was imagining two options:

$ b4 trailers -u --lalala
> Grabbing tags..
> Found:
> [Patch 0/n] Very Nice Changeset
>   Tested-by: Foo Bar <foo@bar.com>
>
> Which patches do you want the Tested-by tags to apply to? [all]: 2-5

or:

$ b4 trailers -u --lalala2
> Grabbing tagsd..
> Found:
> [Patch 0/n] Very Nice Changeset
>   Apply to Patch 1 ("soc: qcom: Fix all bugs")? [Y/n/a] y
>   Apply to Patch 2 ("dt-bindings: foobarbaz")? [Y/n/a] n
>   Apply to Patch 3 ("clk: qcom: Fix ABCD")? [Y/n/a] a
>   Applying to Patch 4 ("clk: qcom: Fix DEFG")
>   . . .
>   Applying to Patch n ("clk: qcom: Fix XYZ")
> Tags applied!

As I'm writing this, I'm thinking option 2 offers much more
fine-grained control, which is always nice to see..

Konrad


