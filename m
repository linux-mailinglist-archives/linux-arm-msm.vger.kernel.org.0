Return-Path: <linux-arm-msm+bounces-75861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23546BB5B26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 03:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF4C94E3EE6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 01:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C881C6B4;
	Fri,  3 Oct 2025 01:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnNKf5L5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115310F1
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759453313; cv=none; b=EPxxgv05ovSYe1kwUqVM5KWRc/us6yuattYu4r2Vb0xzy0zvrDJmPYG/wnI8JmvrJCQqQ8sZ7g9QBgZYpmoTwpS4u+pNtoT+QnL2yii+b3iK//8/WlBl1fEU+QxfJBiMQtMWr3miH7Vteqr5WIAINnwI/UKL90pYNEkV9vGvrK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759453313; c=relaxed/simple;
	bh=kcfQngdf9mp5K4iH0H4erth5pO86ZLztAKVx5whRZgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvwBnuDjs5F4oMWqniVgn0tGsReUA0/xy/5mQG5xbiLOMzdLPT8Xryqb9goq/hxffUhijue695rXLP9lBPO13WCY0aUX1IfjJe4u5QZDVIdqYXis6twFTx0gMBCsp1RHlPZkGIKif8yN1VUF8mR4TlPCo4MMxSdPjvKVXO7cNh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnNKf5L5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592LeW1G012289
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 01:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dh9YkkEp3hAIulmgUloRVWSZ
	ugF2SH1EUCN+CS8/kA0=; b=hnNKf5L5zafCeUF3wcfyAkAjYDE8usBD8ybTanxV
	DRCqdYB6G0l3eWXrcoTjvJpdQXaJsyvprbLmBsm07xWYa2ev2SVGNg1ubYMuLvYJ
	janwBUEjIxrAIL1ZXW1ksM3qG6WsAps5hAUL7uxh8h5U65CQ3BYCbkUgtbLNF2+G
	yX0mclnl8xKKRNcXe5i4zwIZs/wf7mvJpEcdW/R9ynsNHCsgZGzfAXllohoMNXO5
	NUU/LwfR3K7LZQlNAQ2iglKJ1TylpaIMXN7i8OAIsritRJLnKs6GYph1XOjlV9fj
	xUOqRM91pjwZf69m14PsKkIbkQQtKIKcsM9n/cSFqWJGFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80u1kkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 01:01:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de2c597a6eso65372931cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 18:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759453306; x=1760058106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dh9YkkEp3hAIulmgUloRVWSZugF2SH1EUCN+CS8/kA0=;
        b=Q/TAknU+lFFGs4MvAc8uWUFjnEVRoD8na20w1qQXOA9K50/QDSTnvWqkWCYbd2Al0C
         R8sko1P74LqCQ2pnK2/A8gGeKq4uo3puvNGTTlaoYPzYikYAlcr7qbFtpevhx2/ZECRV
         8kLguwtGiIMsNcCa/PL6Zn9kBWVBL4xsQHliHTr6nkQdIyYeSs4akjzW+XW5rh4DHEfF
         xRnm3vKFyQpNp/QqYpc9qLkZWQ0foRX95M4FyZktgqw+v7ctRNGkZkhAYNQzvbbigXZH
         x1Ezp9HlU9THJuATAiMbH8mlSYH/v/enI2a8/B1zXQXace8xJdi8H+d/Km0OdBDKPhEu
         0A2w==
X-Forwarded-Encrypted: i=1; AJvYcCW0DkWs7S731zTwl2rtOGfkDEXYGZDWW0NeO/Gwk05lc7Y762JhHauPvv6XdSuLfS6ImeMmDTLlfDSZ8iYl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzof6BBJbvK6LF2V59j9rUvc2Wmv7w9hLo+jWxIcibNOzpQwRSH
	MZA5EiUvsku9aQd/YF32STPQwUn4ZovWsR/KfhViMJ0x7NGhIIBm0tONHKccKHF3ocHE4ohYOsY
	/J6YKA+VeD2rSnwDCUAEzm3J3jTX+gUX4ffDODr/woC5K9r2zl4m8tc19+PCixgHZTogw
X-Gm-Gg: ASbGnct3OH1AN0vP/Jm/DPMVltBiCvw0J5dUTBukc3/MiS2OEaBLKFEqAZyPk+bIBI7
	Ur10oMCyef674F9tt09TNWrHS4nf2bt4t/AYzy+6w8EGn+r7sr1Z+YoDbKKu9B3oxs/BTg05Bez
	uJ7dD50a4zXR3af9XUU5t37Fcb9H3YytIrDWeAcf3O4DIcQax6VJ3chPHz1yDxj8tUbL0YN+Ob5
	8fc2MFFqCNlmM26zN4k+BHCxlNakSloqQCVBawXV0+wgDAlyeawNkKjNXvdvPwNDQBqJPuNn9II
	pwVSYM/NZASZ9cGc9xQpuPLnpbyzTTzDyl/b8n6J0qe78oL0o/mzUdlZ1WLQazs4hIOFeLkserU
	Y03LIgZa3nfJIYbpTtkP10hcxYpRs3mXVm7nxGGIgG3DTBgCLj5hlwMWOUg==
X-Received: by 2002:a05:622a:513:b0:4b7:a2d0:6a25 with SMTP id d75a77b69052e-4e576aa04ccmr18451041cf.33.1759453305944;
        Thu, 02 Oct 2025 18:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9BmvqzosoowW6VCyy3rFX0j0lkiT5wpoPj+C0NBulvC0lFPDrWnzziuy/9w+RwBOQ5gbZ2Q==
X-Received: by 2002:a05:622a:513:b0:4b7:a2d0:6a25 with SMTP id d75a77b69052e-4e576aa04ccmr18450401cf.33.1759453305371;
        Thu, 02 Oct 2025 18:01:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118dd2esm1299405e87.80.2025.10.02.18.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 18:01:43 -0700 (PDT)
Date: Fri, 3 Oct 2025 04:01:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
References: <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
 <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
 <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX9AIGDVwk46/r
 I3VpLf1Ue99OjgDw06z7XSNQDxbdtaa8BG9i6AmqekikWRE/MnTtxb7Tt0aNSOOQktofaRYh3Fq
 WwFFyBLIbet1HzNmz96K1FHP6tZPRi6UyVki+5rBnVLOeoq/AoVXHEyJpcYnpd1V9Vau10ZYyaj
 +O2YO04iT4Zm5ph2cH25FcnCQIiF22DKxrUCCSvlDnAixTmz1kWG8g2NAthTj2fziXKVmVZRIMY
 NK+K9C1pGcHwy5g+PHglLxS4JeV1EmcKNcF0mVHdSBhREQkRGVtNmwC0GUKGe3ncDHPNXEEXTT8
 fYzCJ8mxG7VuyA/rn/wflAOv3avGxpan3mNtoErkgbPhvCKEdkas4t8lEhFq64YrCxCUEPN/AUA
 QXkfFmz72TXGzXIxqfbrXCcbUW84Mw==
X-Proofpoint-GUID: ZiAiT7MPK-GmaHoSKsHKxsMxI0vYUwyK
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68df207a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=clFx2iI0x2tc5NYfKV8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ZiAiT7MPK-GmaHoSKsHKxsMxI0vYUwyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On Thu, Oct 02, 2025 at 04:07:37PM +0100, Bryan O'Donoghue wrote:
> On 02/10/2025 15:59, Dmitry Baryshkov wrote:
> > > * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
> > >    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
> > > 
> > > WDYT?
> > Well, I think that potentially complicates the driver by requiring
> > support for both HFIs for the same platform, it requires detection,
> 
> Doesn't have to be anything more complicated than a reserved string name.
> 
> BTW you're right the main reason to support this is - in effect - ending of
> support for gen1 firmware.
> 
> But then in reality if that is the direction of travel, its in the interests
> of upstream and users to make the transition.

Okay. I did a quick comparison. FP5 has gen1 firmware, is vendor-signed
with the T2Mobile cert and I assume it is fused. We were going to drop
support for sc7280 from venus in favour of supporting it in iris. What
would be a migration plan for FP5 users?

-- 
With best wishes
Dmitry

