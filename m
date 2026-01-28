Return-Path: <linux-arm-msm+bounces-91032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPDTHbQUemlS2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:52:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7968FA2525
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DDD783002907
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950A535F8DF;
	Wed, 28 Jan 2026 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfBBawZZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLw5eay2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365F3354AD0
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608365; cv=pass; b=m41WpcpR9H3/jR44BW7Kgof/nZ/Mg/4JRxXKDp4AiGWOCL79Mbglq/E0V7Cb1bKneE8BIsL/KZ0cZyCXv7gWOWUo0hyJuBvEksdCViOHoG9jLeqVyK/jCavn2mgmtBfkpNE0ojl8Rv4Jy/jiXSL8n3zWRllFQReLOaiDn41Rf8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608365; c=relaxed/simple;
	bh=Y93P93K94WqtqUA0rE0D/WPyc6jldcBts3ZVbQ+pVEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXi3TpxK1FoUBHuADnHtuTJs0z4mqZ7xD1VNfovjJYqK3Qmh8Fka25D/kC9kFmMhapupflu9PvgjAHW+VbOkzzhj7MDRmjCKKKdHdnZ5zyvCnUOMrZsG1wnhMgtkaskU/tIRXdZgW2wY+jEV130fwP+oV9TbFbXwKkZz4DZ1QAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfBBawZZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLw5eay2; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92W9v254579
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Qu5/t4JMF8+TRz/2kOJ8aI/
	iXG514bygfwsHZf2oT8=; b=YfBBawZZcNthAaX6+S/ZFhLuDBZsDSi1vR/X/G3k
	PcTbcm+HOj22l7gY7OgQoUzsgjmv0GolXDjVfrK+9zhKAU24mEt3JoTvx4j+flM/
	FgZtjPrXwf/uTLlsGTS2Q9l5bUusEACov+62sRw+wBgSpDLTogG6X0shnjcn2I9g
	e8aQN03vqnvYMZ++I1+GMxKIUZ+CA8RrEYkipMBLrh+NIdaPjE74uxTX95ECON6q
	dehP5NnU4/RP8W5QXuj2cPz2pBZaG8RO2MfMpdxewZHE9LwpwwqfNNeOK8r4rCsV
	Y/9ti7yDFi/MA5GdNZS3/t3HmaE96EMCO3Dl+JdH7l2D0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y3kks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:52:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so7015815a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 05:52:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769608362; cv=none;
        d=google.com; s=arc-20240605;
        b=USmZwQthPtfd/S5w4obiflB5tS9tXGuxFQyXs2MJorbYL+i4y8ycmJtj4MRINuk9V6
         i6o5hpn09tneT509IQd4hISDNDJjKyi8B6/J0OLYgWHxIgZh+HfEdigXUnJf1jmDKgWP
         gqXZlzhGYQE50MfHewVKdjvT+cVt0C3S+RpIHON/0PWqiY6lHwYPqx9Y9qSGfj/N+7ea
         qW5Hbu+nQwvAjX08gI5UWadqM0UL5qj7h2mbwXIzUWsjQ7SYPyZM8V4/jkMoBF1G0iyD
         9hLc/HT2f31OjOwyaybyqGC7KzMsCY8FmUDeO4SR2l6ccIGgtIFXc5++RhpRCOZ24yc3
         3ENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3Qu5/t4JMF8+TRz/2kOJ8aI/iXG514bygfwsHZf2oT8=;
        fh=Izxlf4cHkKLXofHWNjd48fbJ6uxEcJQU3BfY8pwyCNU=;
        b=AugHvm/2T+hp20up24YOPWWO4yv0XNXQ3rdKe9Jb7X7nsVyMpfAbF6Lkt45hW3JQoG
         NKm4u9wPkGlB1b9X31yl7MzdlvwjonIoqs/SmSE/Ht4D2xnSi+iGsKPucpTRJUZPFW6+
         QBJYwFbfDOfzMdpLkCqTNSveUNf0SmF+xFZhCDT+GJ2ZRMSwf8vCEqYngZfz4PmTP6bn
         M1F6IjT/14Lq77wvRYSCkBoNxC21J9wiYvNvxJkRDEHvBoITRq39JIIrDf0Sn9sOqGbM
         tmjVkXNzmgsDPO8tQbpJvLgGt4op/oop748P8KAc3vSKOeG3foxusu0oY1VhrVMfARWz
         MTmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769608362; x=1770213162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Qu5/t4JMF8+TRz/2kOJ8aI/iXG514bygfwsHZf2oT8=;
        b=ZLw5eay21jczE9rXL08ntPo4LDl91rdlmxsz6IInrsPctEdUFamrIlSriYUxW4NZX2
         OBO7q758KCc6MBbdc2j3zzmYjfp6Io2l9ASIxyhcbVuYFzSTN7JJJj5F5SzIxWu8XylO
         vOhI/1sD5/fT50d8cBaYFk/DTHIIxlKXrlau9EDCV3eazHZMdgGq2a5LFm4Q/yYf4S2j
         Gj5SlYGnkwn5s36tCfgXBCT9SjTJjW3umAPsRd7a2RDQxgmyuA9CZZTjkfFzH81BXICX
         EvdNR1DY1OItoTMfHwoRl0yJyrvsWs9nPJTqNBLh+vA8bfEBqd9HovO61aywi6IiW6rw
         ZQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769608362; x=1770213162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qu5/t4JMF8+TRz/2kOJ8aI/iXG514bygfwsHZf2oT8=;
        b=o8xDtFUrY5jfTG/ZP3RpaQweqNxye8Y6YFR4mWz/ozQXXixhi3lm4NnWjktIWyiUtu
         bho3ARz0wuFHJQUAHZ+juPkrZ/gV32+V/paMg2dEVM5u4wrD/8POJr8hSQ6+QgysLECa
         Ww9wejt4cZow+SLELd/3ChIR8mHrC9yjPwsIH5BYLntsCTQgbYm8M8sRKrg0qMfa+tCL
         h6nsiuPpQ/vI4Dz/bskGsrw9BEsBIE45QuJqtkt0BlNv5rtcdTZ4ldyAfWh2ieyPbIX0
         kLLDwnJ+X7vWGu8X2iBJdmOifVIPUE6QNhdCjmEYX1Gbs+hLuVYFC4ObjH/2eGXwvWzF
         jkUw==
X-Forwarded-Encrypted: i=1; AJvYcCUVimGs5IJKBM5UI+v0WW5QJzubT0JgvqHgyQlD7fRflOk/5x6VYL8g3wwx1dLwVSuC7g1VKIKCNKhZ4NjU@vger.kernel.org
X-Gm-Message-State: AOJu0YwpIn/fJiuDIjJnW9kUkmJeZR8UBdAcpKU1jFuyd4N16zLfevaQ
	uEdTQllXasD+XzuuEgm6+GbF1GeasJaLIVAyynqJzrgle4V5W+zfpTetxaP4IqZq8cL/aI+w6yi
	xJzFI+1dE6UzxdFs+RinCa/QFLbxT1cWrdoG+WhLPjQc4k2aczi3EgV9CwswFrUxxn+b5RjBwTe
	YRGYlYrRIsYTG0bHJr9DyB5zSt4bOTJU7jhd8alwLPXK4=
X-Gm-Gg: AZuq6aJblYoZAqJ00/tpZ1zWtiNk7gBDvkMQFokE+zsYLFM8UY1jeti1Em4FK6g7vwV
	HaeFDu5Rh9KbgzqVkC4K3FwRX1XE2FRO0ZdgNNTVx5uNMR7uSUf72RMJF9FrfCvhHGUUmCEZ7MY
	quc8mwZGeXv9dfGGiZPWzr1wB13meR13zqiqi9e7CRXb1bRrC6KXYNEnxtLHNCMgihlbk/37KET
	cu2ds+V
X-Received: by 2002:a17:90a:e183:b0:32e:3c57:8a9e with SMTP id 98e67ed59e1d1-353fedae45emr4748320a91.35.1769608362329;
        Wed, 28 Jan 2026 05:52:42 -0800 (PST)
X-Received: by 2002:a17:90a:e183:b0:32e:3c57:8a9e with SMTP id
 98e67ed59e1d1-353fedae45emr4748296a91.35.1769608361830; Wed, 28 Jan 2026
 05:52:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120180052.1031231-1-morf3089@gmail.com> <20260120180052.1031231-4-morf3089@gmail.com>
 <afa20489-adaf-46bd-b3e7-c763aba5d7c9@oss.qualcomm.com> <ac83f41e-08ad-4ffe-9f0e-02f8256af65c@minlexx.ru>
 <f8097212-6388-4c4c-8f5d-a91df99a18c5@oss.qualcomm.com> <e6bcf45e-9eef-4660-8630-a7be1cbca61d@minlexx.ru>
 <kfjw3opjwwndocxqqjn4ya7sy575kpgo7otulsxqotznl5ctro@ewdaumkmstdk> <9980751b-3069-4a77-bc4c-0d5ce42305f6@oss.qualcomm.com>
In-Reply-To: <9980751b-3069-4a77-bc4c-0d5ce42305f6@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 15:52:29 +0200
X-Gm-Features: AZwV_QiekXIAfL_Qcoauq4fZOFUeAlEEifzxtb_8eK13VtWO7IT3Ge1V5nPZtYQ
Message-ID: <CAO9ioeXpKiqW8uEFAx80EmPrs_gnuvTtKws4EAGkqXTscXd2Aw@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: fix
 regulator and SD settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Gianluca Boiano <morf3089@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: AHfqXP9blgUENTEZ1mI7YsOJk_nemOjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExNCBTYWx0ZWRfX2sdFpm4Iyk+d
 O/qcbZz8lrlZYdT8C4Qm4L0vtQdVaX5FRK/Q/2bqVWz1aOW5Iw93b+goqZPrGyCbVPSGvy+UfDj
 EafXQebbKFMUa/NisMKIUvSV+24wUZw3Zo2XCFr4rw64XKNsM1a1uyBw5jaiMwuXyp0Y5mNk/Bs
 O/gGMcv0uGgbHZ8FXYFKV8+W3udg75xv9y5NLvmzmWx92zTNtsWCRgxjBeALG1z6L8LzHbE8IVK
 iWV3J9ugbKbuInMEAGOggPljIV91oCV4S7X6fbvTHCD3MMtbE9RewtrHQtaKOK+CxWzns5UdxRT
 XBMt9ptqrZyvkHdoTbb6QDJEHCzXmPlcp/0v9z/NZWBOTyhN7yMqGCpaRBCK87cOm9t2/251qe2
 f7tpQmpfW79EY2UJcH/JnaIV6USfrwJzLt3BN8DhWh1fcsAOJL22yYsfkcPeW7VO6AQXhZYgDIc
 D7mURma92vnUvYLATQw==
X-Proofpoint-GUID: AHfqXP9blgUENTEZ1mI7YsOJk_nemOjk
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=697a14ab cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=rC6OpnOI0FKPR0jp5UQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[minlexx.ru,gmail.com,vger.kernel.org,kernel.org,ixit.cz];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91032-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7968FA2525
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 at 15:24, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/25/26 12:10 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 23, 2026 at 11:11:50PM +0300, Alexey Minnekhanov wrote:
> >> On 23.01.2026 12:26, Konrad Dybcio wrote:
> >>> On 1/22/26 5:44 PM, Alexey Minnekhanov wrote:
> >>>> On 21.01.2026 14:27, Konrad Dybcio wrote:
> >>>>> On 1/20/26 7:00 PM, Gianluca Boiano wrote:
> >>>>>> Fix regulator configurations to ensure stable operation:
> >>>>>> - vreg_l10a_1p8: Add regulator-system-load of 14000uA for proper USB PHY
> >>>>>>     PLL operation
> >>>>>
> >>>>> The driver needs to be fixed instead, as it should perform a
> >>>>> regulator_set_load()
> >>>>
> >>>>
> >>>> Also change done by me in [1] with more detailed explanation:
> >>>>
> >>>> Since the commit f05ab10 ("arm64: dts: qcom: sdm660-lavender:
> >>>> Add missing USB phy supply") previously untouched by Linux regulator
> >>>> l10a is now used, but it exposed a bug from initial porting: when
> >>>> booting with USB cable inserted, or booting without cable and
> >>>> inserting it later, board reboots.
> >>>
> >>> FYI this shouldn't be required with the upstream driver, I don't think
> >>> the core calls .set_load(0) and RPM isn't notified of a current
> >>> requirement change unless that happens (qcom_smd-regulator.c)
> >>>
> >>> In the power grid, I see (current values representing the peak):
> >>>
> >>> -- USB2
> >>> VDDA (3.1 V - vdda-phy-dpdm-supply) - 60mA
> >>> VDDA (1.8 V - vdda-pll-supply) - 30mA
> >>>
> >>> VDD (?) - 11.4 mA
> >>> VDDA_DVDD (?) - 35 mA
> >>>
> >>> -- USB3
> >>> VDDA (1.8 V) - 14 mA
> >>> VDDA_CORE - 68.6 mA
> >>>
> >>> +Dmitry poked at 660 in the past
> >>>
> >>> Konrad
> >>>
> >>
> >> This is not needed e.g on sdm630-sony-nile-pioneer, it's booting fine
> >> without system-load with USB cable inserted. Maybe IFC board doesn't
> >> require this too. Seems to be xiaomi specific thing again?
> >>
> >> Alternative is to not touch L10A regulator (comment out vdda-pll-supply
> >> from qusb2phy0 node and face the "phy@c012000: 'vdda-pll-supply' is a
> >> required property" dtbs-check error again. Which we don't want to do of
> >> course. And schematics say that vreg_l10a_1p8 is connected to at least:
> >> VDD_USB1_HS_1P8, VDD_USB2_HS_1P8, QFPROM_PRG, VDDA_APC1_CS_1P8, VDD_PLL2_1,
> >> VDD_PLL2_2.
> >
> > It might be that there is an issue because of it being used for APC1
> > too. I don't observe any issues on my IFC6560 board (where it is also
> > connected to APC1).
>
> Wait, what? The same line going to external ports and the CPU supply!?

Yes

>
> > I'd suggest adding a dummy fixed regulator node as L10A and documenting
> > that it is not to be touched by Linux on this device). We do this for
> > some other "system" regulators on other devices.
>
> I think that system-load may be fitting, but it needs a comment

I assume, it might be RPM killing access to the system regulator.

-- 
With best wishes
Dmitry

