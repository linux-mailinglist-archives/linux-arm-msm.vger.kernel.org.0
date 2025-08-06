Return-Path: <linux-arm-msm+bounces-67917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F00B6B1C69A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97A5A18C0154
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 13:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4CD26CE2C;
	Wed,  6 Aug 2025 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqzHMc3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEA91E4AB
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754485649; cv=none; b=KPSR4RNLgWsuqvAhqkwEc5sRkthastu8r9G3bmTaM8bDYiQwWt/20H56A4Oi6VhG5A9RE1jy4nTrUrAZ20n1rz4Fh4fY0dyqZ7ULlUGcAVLYPrTmSSfUsbXTp0vRBIcGe7hZmDOG0U75ErNYDoprw+FiaNnxXayQo0703JGoHgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754485649; c=relaxed/simple;
	bh=aYeJJMheOEdjV6tYcETsLaUCoj40eP9v/azCo6hYPzc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1PD8Vbt/JmPPFLQPBQFjB8lAlqPG8LS2oyeFUN6GlImUW4cjco0Lf8MI0vA0CvaN2FB/H1a0EQMDHTIlqKCr6ATwMXIoKQz9mhFuoxy+iHDp68aFMr6yoeJUrC2R5IrvfaJEyf1FEWLKiLypNwiWlFJ0bCXDQCJQlcDSZNyL9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqzHMc3E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766PXA1022161
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 13:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aUJd/u0P4u2xrS8qlnxXVGpkugZ9tcch8pBOz945UxI=; b=AqzHMc3EeM2kJ7EW
	ilj/eLNuYP6bArxLaakiXHUaD23h59Efb6Ky9bbpfwkl+rKT+SxFNe6nrsvCDkf2
	jDVeAiuZctGdbXx8Laetk+P0PytuDFN0pknhS0Pw8C/hL71VULYd42IyihBwI3T+
	WW63+rDgoH27Fj6HV+WtdXFkPPvrbdYOASj4WfnoKbcgr9Gx5FC1sTRZ4Eb192ks
	FrFqI2/kRtYD/RXzVWvliJNjuMdPgei4nAjAgnaqMX9QlIrPHT7s6h+DlEBu8Tg9
	A/PaTTo0GoPwip0uyjg4YH5nyLj9TZTpn6QhWhB0SigqsmOkQw1bktl4egtKzm1H
	J//CKA==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8aq2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 13:07:27 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-88177a20e0fso756313339f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 06:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754485646; x=1755090446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUJd/u0P4u2xrS8qlnxXVGpkugZ9tcch8pBOz945UxI=;
        b=MXfvbG/yEI4ZNbZYVtMhPAiu2wX/MNQOX+VJgodLsRxCx5fjiFy+g2UlfP/bf6LFDm
         LybanoVJMvZSAb7YUkukW6zuFsTngpgMcHU8yVmvjdzr0+Jize2D/9sy3lB0uvQCHSpM
         KUoEdUTSBWxDOXq8rRE509xEsuADnX5JlJ071+ELQo+qQvsrbwOMeHJjLmPkAyNByebX
         FkTu9MqIQ+fFVd4d2KFZXmKDCl8h03b273P/NS7xhAiTXn55Fz98r2tyia8khi4NpRsA
         VkTfLAUGhVuwMSy7LXSqoKmUJFgwxj3oNBH44vFWxJUk/0m8eAN/T6+Z8TiYuCLLdzyW
         RkhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhCqLi7HeUQ8N+RQntYrq6YeF4MXkEEVYbvbO2McTFjidtidRDMutB6KdHbgoiYsDHPzSba7Z+SAXsHn0W@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+OT83XG1RY0JakAr7h0EE1tw2poQ8Q2d9JUD8RHc9eg/aVFO4
	Z3KB9PTlnyzSkayY+kUrFLrwd7hKXBkMfZy3ZpBgO/vHxPdN9YdbeKb/ykKt/z/NQUVYHF92kBb
	tIvl1/R7Ippk0Sh8WRLXxgxzpob0qDeJHCeOwbt1iDgDEY1Rhf8LEh97yORJVT+0k6fMe
X-Gm-Gg: ASbGncuYfSeh69LwKXxItxo1K8e7sAxMjzqkueH7uG65E6M0RgteRNX8x2IlyoJl8y4
	9EvdRJ47/gJcNI8H8IhiD77fjWMusMs0hMw1Sijdy3WVqwsMjeMz037rJ+hBObCFKczGPThjkq4
	DHfRu+yNQoHi0nK2qMpjS9iVEBfPR2axwGSj5bYjhsikWdAXdJdJYiwYjlFB6bdXwFrwst1kKxC
	vCGqqwO7SFMlCqJI9ldU9MaNUFCGsLL5h2TjDAxoL2tyX40M0QA68M00aZ01DiXMmYKrfpFvuCa
	Yo08QWd7Mn1TVrEw7PSO3ZERME4xJXgq1nXlyfib6KOrS3IXtre3TLrQeGKNJxHAHsXH7g==
X-Received: by 2002:a05:6e02:148c:b0:3e3:fe5e:9b96 with SMTP id e9e14a558f8ab-3e51b8ec632mr41719925ab.11.1754485646295;
        Wed, 06 Aug 2025 06:07:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWtia5YTXIWsB8teOlyMifK/iGB3a9CpX0BwSJO8pUmmxHJYLjKu71r3Cg4hIyRpYWnfn7Ow==
X-Received: by 2002:a05:6e02:148c:b0:3e3:fe5e:9b96 with SMTP id e9e14a558f8ab-3e51b8ec632mr41719225ab.11.1754485645687;
        Wed, 06 Aug 2025 06:07:25 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5852e28sm48063915e9.9.2025.08.06.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 06:07:23 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 6 Aug 2025 15:07:22 +0200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        quic_vgarodia@quicinc.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJNTigOMy1JFOxot@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
X-Proofpoint-GUID: NpLBPliTFrVS3PefH4CBt3n3Rys54kNx
X-Proofpoint-ORIG-GUID: NpLBPliTFrVS3PefH4CBt3n3Rys54kNx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX62q+S5q8YUbv
 s6a2GbJ1UDbyPYaZ6qQtTv9WvpAKBnqcy4kSPUHaqDXrVXPBL/GJVf8K5rg8xOfCf3nsQaVlxcX
 qJqQXQzXaftnCN4w9EgPDiphc4MPOIV4nNFRvxFPXF24J462ivO53PHfpQSIG5MZ0xAPwzMh7CE
 WBGx5QVu/+9XfUtt9cs8IWusdhyhiF3ugmV4OlSJdhadvrV1iCIoGi7+wKSNu23pN2hRnnSOI+2
 tFkdoRaI1nNlM7i/j43aLMOg5VXmjkxG8xP4YNURkQtZl+2qFlTXNylyUiPiQbhWJDGs4e7kxQw
 nJJjXFy3lvDdnHGz4Irk2Mrr58USAnyEkRr/jAQCyROrQtLmbD8jI2XMgF2pvjrnLtCTpiI+eWr
 o9aJf47I
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6893538f cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=ozpgGUE-rs04tbkcxKEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=LKR0efx6xuerLj5D82wC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 06/08/25 11:01:09, Konrad Dybcio wrote:
> On 8/6/25 10:04 AM, Jorge Ramirez wrote:
> > On 06/08/25 04:37:05, Dmitry Baryshkov wrote:
> >> On Tue, Aug 05, 2025 at 01:27:34PM +0200, Jorge Ramirez wrote:
> >>> On 05/08/25 12:44:23, Jorge Ramirez wrote:
> >>>> On 05/08/25 13:04:50, Dmitry Baryshkov wrote:
> >>>>> On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
> >>>>>> Add a qcm2290 compatible binding to the Cenus core.
> >>>>>>
> >>>>>> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> >>>>>> encode at 1280x720 (HD).
> >>>>>>
> >>>>>> The driver is not available to firmware versions below 6.0.55 due to an
> >>>>>> internal requirement for secure buffers.
> >>>>>>
> >>>>>> The bandwidth tables incorporate a conservative safety margin to ensure
> >>>>>> stability under peak DDR and interconnect load conditions.
> >>>>>>
> >>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>>>> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>>>>> ---
> >>>>>>  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
> >>>>>>  1 file changed, 50 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> >>>>>> index adc38fbc9d79..753a16f53622 100644
> >>>>>> --- a/drivers/media/platform/qcom/venus/core.c
> >>>>>> +++ b/drivers/media/platform/qcom/venus/core.c
> >>>>>> @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
> >>>>>>  	.enc_nodename = "video-encoder",
> >>>>>>  };
> >>>>>>  
> >>>>>> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> >>>>>> +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> >>>>>> +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> >>>>>> +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> >>>>>> +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> >>>>>> +};
> >>>>>> +
> >>>>>> +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> >>>>>> +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> >>>>>> +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> >>>>>> +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> >>>>>> +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> >>>>>> +};
> >>>>>> +
> >>>>>> +static const struct firmware_version min_fw = {
> >>>>>> +	.major = 6, .minor = 0, .rev = 55,
> >>>>>> +};
> >>>>>
> >>>>> This will make venus driver error out with the firmware which is
> >>>>> available in Debian trixie (and possibly other distributions). If I
> >>>>> remember correctly, the driver can work with that firmware with the
> >>>>> limited functionality. Can we please support that instead of erroring
> >>>>> out completely?
> >>>>
> >>>> yes, in V7 I did implement this functionality plus a fix for EOS
> >>>> handling (broken in pre 6.0.55 firmwares).
> >>>
> >>> just re-reading your note, in case this was not clear, the _current_
> >>> driver upstream will never work with the current firmware if that is
> >>> what you were thinking (it would need v7 of this series to enable video
> >>> decoding).
> >>
> >> I'd really prefer if we could support firmware that is present in Debian
> >> trixie and that has been upstreamed more than a year ago.
> > 
> > 
> > I share your view — which is why I put the effort into v7 — but I also
> > understand that maintaining the extra code and EOS workaround for
> > decoding needs to be justifiable. So I chose to align with the
> > maintainers' perspective on this and removed it on v8 (partially also
> > because I wanted to unblock the current EOS discussion).
> 
> +$0.05
> 
> I thought we were going to eventually relax/drop the fw requirement
> when the driver learns some new cool tricks, but are we now straying
> away from that? (particularly thinking about the EOS part)
> 

um, no not really: the decision was to simply drop support for pre
6.0.55 firmwares for the AR50_LITE.

Pre 6.0.55:

-  has a requirement for secure buffers to support encoding
-  requires a driver workaround for EOS (providing a dummy length)
-  during video encoding.

To support < 6.0.55, v7 of the driver patchset:

- uses the version to disable the encode node
- enables the video decode node
- implements the EOS workaround.

It was agreed that this complexity was not necessary and that we should
just drop <6.0.55 firmware support (which would in any case only include
video decode).

And so on v8, I removed the above.

Now I have v9 ready to post it, but Dmitry is asking why cant we have
the v7 functionality so I am waiting for direction.





