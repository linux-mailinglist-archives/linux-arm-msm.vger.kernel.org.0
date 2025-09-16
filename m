Return-Path: <linux-arm-msm+bounces-73719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BD2B5985B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CF107A72FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 13:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE6631D731;
	Tue, 16 Sep 2025 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osr0DlN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592CF1FBEB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758031043; cv=none; b=reG0suEwqSR9UFMv15lwht7zR7Oo5V17fd7A6fVzrYtBnHOw7EhnAsJRGmV17uS+ubBdAo4RQ8v9aNd6w5C5QsCS2MpQtKIxEWOfyJF3YJmiQSnYMHzbsIt3NEoyR0QfWM2oGa8k9AbgKpS40ZYvw3xj+BshXg5eecFv+2Ls+Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758031043; c=relaxed/simple;
	bh=EZixtvrl1rqBKt+UGIfg0P0b7+HT9wRSGmhgvCNmej4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMo1MN42PlupEZfnulvzmEzjwJvt1WtrfRhXm/iiRObWb9+3yaxg/R/ty7JgfUzJ1GruZnaiRsIjjj/+rLZGZIgb2aVCM86lv7vbaKDpLZqPgNIh3wEfa79zJ7MJwi4uxjeqIBc7j0g+nNI2daXe/k5Cmph3My514rmPEJEUVHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osr0DlN8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9xOXV005291
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 13:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GICyQL3CHMsQbYNvbBfWi61BrYKwCgI38BYL5tUJcxo=; b=osr0DlN8eEm/LYjO
	p2aYTKBFdbjlOuhYriHYjC1HEk2yWXuZwszWVhlsMiyFMa7/6HXQgHm17j/88u7f
	xB2rvfha76uO0oRf7CZCH/aR3/sN5gNibwnsdlqceYyDUpp7DnhG/ztMj9LZR6vM
	MmzwxO554+PvpfcXtrrybhcRPHiPWjKYMRg6/b5sSi3HpVQWCIda5yChWm0t2884
	rrfaRZeLwa10BJ0vR1jTFJiV9Sj6yljg/6DoK1CTewzuxYl+358L9AhYgNTrQ2qj
	c/ZXCB9kIB5K3M4KSjC8lhUbvziMTDYhcjWKW3rLbq1yD4Ye/CSs7eirFcmWfgmr
	x/MVzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n4r84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 13:57:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b822016cd2so1425511cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 06:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758031040; x=1758635840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GICyQL3CHMsQbYNvbBfWi61BrYKwCgI38BYL5tUJcxo=;
        b=ZW2paaOkgNKAs5uIHIATeNeMzL6mrk7en/cAq0JVcV+fL1gOzV9QOW/872QbDl43So
         DnuNV63pHhxo3Yz5ZQwEOGhQHeiU2YMboGWKw88rx5tymS8S9icIsbS8nwXbFK00WZeI
         lhpTAMdoSOOyc2/SkvfCFFSTqrZYkauUspyTxCeU0D2F96+6hh3VCvd26F24ChDJITYw
         pi3cZDWZM3UVcDdchk0WZQ4D+1lTY4CZRpLEy4iV5HgiyBA9+pAMoWWQ43lFY3R4WjGv
         /Zfy4hbexqt0i1GDPhS3qYHVGKPGCC7F2IcFGt2OIsgVYymQV0e/cBe/uoqIQelkzBAz
         dvvg==
X-Forwarded-Encrypted: i=1; AJvYcCV3PFA/IA20rTz8WrCYN2okWfPiASbLAgmUM4lalpIhxkvVqLKF8N5+dSuvoOVJqjyPjFNJqtDakePaWTT3@vger.kernel.org
X-Gm-Message-State: AOJu0YwmyOdievB36BmDq44NmguR3V28AI5lU2iGwkET82kftnAxTfjO
	Vh7AC3xhLNq4NaSzQiq6GKaKXEOleYNJ+pX1SFeIcvwYepeX1bp35TMFHdZN4mw998p6x3yEMvz
	JBBpsL3JTLmLb12OdyFLFs2xEFMTJ7oa6+giabyjgjEj8VRkwKpdQ9zdnlup6z6MMlyjk
X-Gm-Gg: ASbGnctQFq/V2d0vrD26IRZ/e1nBKMxemsByNoluDzLeaDCqQMIPY0BMlE2hLdgVxnZ
	VSHAuCwtNCYI37VLTOC+nJ6JMf5Yh2c0t+L/078GAY4rSsx2yqj2JhFbSQFAxU5BCK7fgrqou1g
	IlVVY1UwahcBW+iZEFuRDJ9T12JeRvTBVNTQ5teD3dkflPNlBOkP5jp8cHowG00Ut6l4D9R7SvK
	LFXzDXkEcelNbqBQ6l7E8dVnhWZPOKg0kqIq4sXsN8g0GH27EYD900400ymwOzEVwV0UVa3uTpB
	b9RuPA3K/kYNIzOAdPZmLpafxFH11Df7nAcr0LHK73rJXESfdpjoJjDpGrnd6eTepVFxXNKWTzv
	gW6JqiowPg2k7qZmVectP2A==
X-Received: by 2002:a05:622a:1ba9:b0:4b5:f68b:86a0 with SMTP id d75a77b69052e-4b77d06cb12mr133428561cf.5.1758031040183;
        Tue, 16 Sep 2025 06:57:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx/IVvun0KQAKtNqHCv75Rapju/SmJgazDgix/mPxZhD+7Qis2vnTHkkgiNCjklXyICvOOjw==
X-Received: by 2002:a05:622a:1ba9:b0:4b5:f68b:86a0 with SMTP id d75a77b69052e-4b77d06cb12mr133428091cf.5.1758031039594;
        Tue, 16 Sep 2025 06:57:19 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32ddf93sm1149921166b.69.2025.09.16.06.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 06:57:19 -0700 (PDT)
Message-ID: <4d83b7af-ec45-43c6-aac4-148580a81924@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 15:57:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] power: supply: qcom_battmgr: Add resistance power
 supply property
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
 <5736df73-c90e-4f11-b461-c38da4e811e1@oss.qualcomm.com>
 <20250916-almond-pelican-from-vega-a8d01d@lemur>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-almond-pelican-from-vega-a8d01d@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rdbof7ajUs4NOJCm9Vv8TbmmhguGJ0q7
X-Proofpoint-ORIG-GUID: Rdbof7ajUs4NOJCm9Vv8TbmmhguGJ0q7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX+v+9REzbnz8B
 zsm40IqfANh80H9MCEjnZeosQa/HTbdooHPP6IRAe8aVyQlrUbJakmMTXqPxwgfd6mCUMI6yfWu
 x4jh43jNRiQ+E7YdiSLaFtljG5zIgW6SJtfrwsz8q75inlU7bp3x76/qpNUp2k/2jOmufxpYvAm
 MyrSOPq0Q+gka8Zl3xCmV0zVCCcgQoIkGHeB9W3t51noBoPv+d+8DjSXmVabNuExkUAsad5wwCo
 jT0QTxu4zEJmoHCuicZn4WHj4Fs+swIHcspcaYKKSTSNXgACE6QjpulyY/gFE2gCNZAxah2d0KJ
 u2e3GmDSiei75SNYpXkLbDZz3j8+zHulNRQ5xiMRJ8dFMbEkOYtQ8NzDikTXpnyIzKV26KZXce2
 E1X/w7jx
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c96cc1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=-oxkEHOTVg5AFfsLEusA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087

On 9/16/25 3:37 PM, Konstantin Ryabitsev wrote:
> On Tue, Sep 16, 2025 at 09:59:04AM +0200, Konrad Dybcio wrote:
>> + Konstantin
>>
>> It's quite common to see someone leaving a T-b on the cover letter,
>> trying to say "I gave this series a spin" and then seeing the tag
>> appear on unrelated commits within the series (e.g. bindings or some
>> cosmetic fixes". Maybe some sort of an interactive (opt-in is fine)
>> dialog for "which patches to apply t-b/tags to" could be worth the
>> effort?
> 
> The plan is to add interactive mode to a few commands, including to the
> trailers command. This will open an interface similar to interactive rebase,
> where you can mark trailers as accept, skip, or ignore. That should do what
> you're asking for, I believe.

That is amazing to hear, thank you

Konrad

