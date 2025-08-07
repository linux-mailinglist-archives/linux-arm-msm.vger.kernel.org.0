Return-Path: <linux-arm-msm+bounces-67997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6FEB1D6FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 13:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C757166B8F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 11:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9C5224B0C;
	Thu,  7 Aug 2025 11:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRMyYURi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7ACBA36
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 11:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754567536; cv=none; b=JEpKU4Yo/uqeQGoZqK1v3ETR8dngPppNJ5PjJy6siZtBp8JDiVrkVW0N5izLzGBVuo2AKEM089P9hMWAE9p8+Ref7CenU0Qw0wLNv69VT6eDlMaP0ntm3tLxCVpvMPv/Rsy9dBtg6orji/+NDZkZ6zF7cSbmtSdPd5tXTDjBdTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754567536; c=relaxed/simple;
	bh=/yvBXdbIwoLc822AzkSPvfOLaLpqfBJuZaXWMOxZE58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9vQL+eQ9wOD0H+o4WmFaLk1NnK/v+WtqYmW3Uy0YkRsze1/nP1nZmnv4wFXHO+9/jNKAWik54elkvM86fq9sVAT1Ajmde2v3jO2+8sEzZRgdplTvwIojrSdilbCAAwNmkZAk9nV3de7GK8X1G9S8xjPVGB8kFzbounnmKyxumM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRMyYURi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779Cv5o003594
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 11:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TtuB2QJTT6Kh1FdqGkLXhi3vASIByW9GukBZ9YBsj4=; b=VRMyYURiSM8dHaYi
	+BTWCuxcoLUo1hsvNDctwhIoz0DFw6OM6LiCz959EY0A9OamIwU2/riNjT3OWSHG
	kQK6DxH9POe3lP6FD3c5jzYS8pZj1n/NEZG3SJ9g5VF2Q59ATYudITXqdo1/YygP
	EMGUsBfHEHcATI9bhXYrb413s1FFJGyH3Q/QP6Xeis9qVZUwDGg3gPRrRO9DdfnH
	CGZ3n2kArVTRsit8BpdtmYoCVJ1RuE9fpndU3N3Uk7riwD+5AM6FftJI+/Pa/K4s
	z8TNKdX7fRk+GEPhv1xIX5RqZyvCptaaC9aI2fGcBvJa+l1ciDLQ+IYpzd4toqb+
	c5gq7g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyae4m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 11:52:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08898f776so21784981cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 04:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754567532; x=1755172332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TtuB2QJTT6Kh1FdqGkLXhi3vASIByW9GukBZ9YBsj4=;
        b=ZnJMdL9GGrq/8HW43AWBAoaA1q4L6MOlp9ReqtksaREFRT86LTk14PybAYJxAFPfTs
         0oCiAJz8p3/k9APviT9UdcKBZwzxC8FUPeayqyOUs0eSMSEu7gFejJBtKqLU9uHeqpQI
         MgyAPVCXVmTZ2mNbLxUSz5ky+uV0W4CV0kdc2Ko8TxKsZC0V86tzPZztLDd62OXjJdr3
         a3OWKmMCjMHwMqUSaknkW8DnWR4SEoVZXZU6TNkKxYIjQlJYkvtGIGOmG4/5PBt8GZ8w
         kqzy5rfv4U/Ixjm4rBV9MU/KJZICu4/7wt0m/U2RUvTlbAYDh1vdgA6b1dIxCUFRf1Cl
         yJ9w==
X-Forwarded-Encrypted: i=1; AJvYcCXHnPaTolYSv8VojYWYjwXAUrLhCIjL6sNq772iLxrfeW/rNO9kQzSba+k4RLtJEL5rqA5wM9q8WckzAKUi@vger.kernel.org
X-Gm-Message-State: AOJu0YzV/uElOwtqfn75QvJXcI+zCX13l+zLqbhdCnK/PXORP6IwGuOF
	NDMCcO2SuTziMwoI8Wvgc96cnabkzHiuYRoZZgo4LxjZAXledbZg/7gnVGuBDCkNpyY2HyKjROy
	Rxif4VRghNMmVxFgqMFwLjvy45nRdLP9Nlqik3WRk/ApxXenFn2JNusP/iJ42vMLxdExe
X-Gm-Gg: ASbGncuFgJ0lvtDQGje4OHsv1bKHwm/eAZ4g7A3RdV+wY1LQ1mMfBTJMy5gnio7YVgi
	TrrQYiP4gCD+asD3daAEa0X6akvcg+8mAQ3NuJzctRzQx3nmIqGVr6G1/mG0HX63ls8AVnPEdAj
	j959GMyZ7+xVeMxsYmabVPnKlexNqHqtv9G7MlPvxsgcIb9W/d78swISx3e0IaFAy+8byVZzLWf
	LGUm5L3EQkkG9ZaE5aSOHux3FfQTRFhe6g4rFm5CxINw0EB8pBUOTx1ckjhgoP3zF6wCtMnXo2c
	RleRhqwK2Uvw87DCSmSfRCUBO0BAKqMC0AA6Y+fVZjkQVS3fIPjJQsg2Y/J7oAA34jX5GJqBw+u
	bRAv12ERG2z9swripmmzQcE5WrMh8foJ5urbNolfBhm9FJeZK98mR
X-Received: by 2002:ac8:5a8b:0:b0:4b0:7e8c:64cd with SMTP id d75a77b69052e-4b0912cfd4emr93040501cf.4.1754567531550;
        Thu, 07 Aug 2025 04:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyfdrXA0GgbZGVmCS8cmtFoVgaAqjV7ozQHp8Lv5vDiP6EsF+5Th8qiti06L1chxeoNHrQrw==
X-Received: by 2002:ac8:5a8b:0:b0:4b0:7e8c:64cd with SMTP id d75a77b69052e-4b0912cfd4emr93040081cf.4.1754567531027;
        Thu, 07 Aug 2025 04:52:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c99078sm2582655e87.102.2025.08.07.04.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 04:52:09 -0700 (PDT)
Date: Thu, 7 Aug 2025 14:52:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <s3rr3p5axi3iu4zvgwgjyhjtxmv7sgp6bqkmsgv2l76p7zxu2k@rxzbblyr57an>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <aJHqpiqvulGY2BYH@trex>
 <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
 <aJMMhIqNupwPjCN+@trex>
 <0248afed-b82d-4555-8277-e84aacf153fd@oss.qualcomm.com>
 <aJNTigOMy1JFOxot@trex>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJNTigOMy1JFOxot@trex>
X-Proofpoint-ORIG-GUID: NtxLuRqOI4h6HH9bN6c7Ui99kbnkhnnO
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=6894936d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=64HPk2-XXqlZgG7pdX4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX3JCXp1sX54bM
 hR1AoCygcgwRCyWQRnHRuTuvAIy56j7Z0IB09pMVHy6HbO0RWqVXuk1+ckJeIVrfJaHC6Pju5rn
 gn6YzenjXbmrYcbXQ9XJ80zV4rAZTGnEO6cy4c1O8pYLImTxvA/u4OWUQY2SxWfCC4pMr7ZtDlI
 0MnC4UOGPw+M/UnqsXPmfLEtM1r91X9m7VLQOglwTpOyT7zm33K/HaE9gnIQpzvaooFqsgf6qq2
 vqukzqSHMTU/XHSi1p8GxvwtWsGppLtgm5ZkUDqIx/EdN2H9JI+pYltKYKfzyvs27JUyx637j9N
 ucmaUDcaaEf8+x0kOpcd8swUjKZbvtF6Fuf9C95A5JxJ+40bIfpeCAelL6axU8B+WKTTqvymUnZ
 GIoADIqB
X-Proofpoint-GUID: NtxLuRqOI4h6HH9bN6c7Ui99kbnkhnnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On Wed, Aug 06, 2025 at 03:07:22PM +0200, Jorge Ramirez wrote:
> On 06/08/25 11:01:09, Konrad Dybcio wrote:
> > On 8/6/25 10:04 AM, Jorge Ramirez wrote:
> > > On 06/08/25 04:37:05, Dmitry Baryshkov wrote:
> > >> On Tue, Aug 05, 2025 at 01:27:34PM +0200, Jorge Ramirez wrote:
> > >>> On 05/08/25 12:44:23, Jorge Ramirez wrote:
> > >>>> On 05/08/25 13:04:50, Dmitry Baryshkov wrote:
> > >>>>> On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
> > >>>>>> Add a qcm2290 compatible binding to the Cenus core.
> > >>>>>>
> > >>>>>> The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> > >>>>>> encode at 1280x720 (HD).
> > >>>>>>
> > >>>>>> The driver is not available to firmware versions below 6.0.55 due to an
> > >>>>>> internal requirement for secure buffers.
> > >>>>>>
> > >>>>>> The bandwidth tables incorporate a conservative safety margin to ensure
> > >>>>>> stability under peak DDR and interconnect load conditions.
> > >>>>>>
> > >>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > >>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > >>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > >>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > >>>>>> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > >>>>>> ---
> > >>>>>>  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
> > >>>>>>  1 file changed, 50 insertions(+)
> > >>>>>>
> > >>>>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > >>>>>> index adc38fbc9d79..753a16f53622 100644
> > >>>>>> --- a/drivers/media/platform/qcom/venus/core.c
> > >>>>>> +++ b/drivers/media/platform/qcom/venus/core.c
> > >>>>>> @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
> > >>>>>>  	.enc_nodename = "video-encoder",
> > >>>>>>  };
> > >>>>>>  
> > >>>>>> +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> > >>>>>> +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> > >>>>>> +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> > >>>>>> +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> > >>>>>> +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> > >>>>>> +};
> > >>>>>> +
> > >>>>>> +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> > >>>>>> +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> > >>>>>> +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> > >>>>>> +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> > >>>>>> +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> > >>>>>> +};
> > >>>>>> +
> > >>>>>> +static const struct firmware_version min_fw = {
> > >>>>>> +	.major = 6, .minor = 0, .rev = 55,
> > >>>>>> +};
> > >>>>>
> > >>>>> This will make venus driver error out with the firmware which is
> > >>>>> available in Debian trixie (and possibly other distributions). If I
> > >>>>> remember correctly, the driver can work with that firmware with the
> > >>>>> limited functionality. Can we please support that instead of erroring
> > >>>>> out completely?
> > >>>>
> > >>>> yes, in V7 I did implement this functionality plus a fix for EOS
> > >>>> handling (broken in pre 6.0.55 firmwares).
> > >>>
> > >>> just re-reading your note, in case this was not clear, the _current_
> > >>> driver upstream will never work with the current firmware if that is
> > >>> what you were thinking (it would need v7 of this series to enable video
> > >>> decoding).
> > >>
> > >> I'd really prefer if we could support firmware that is present in Debian
> > >> trixie and that has been upstreamed more than a year ago.
> > > 
> > > 
> > > I share your view — which is why I put the effort into v7 — but I also
> > > understand that maintaining the extra code and EOS workaround for
> > > decoding needs to be justifiable. So I chose to align with the
> > > maintainers' perspective on this and removed it on v8 (partially also
> > > because I wanted to unblock the current EOS discussion).
> > 
> > +$0.05
> > 
> > I thought we were going to eventually relax/drop the fw requirement
> > when the driver learns some new cool tricks, but are we now straying
> > away from that? (particularly thinking about the EOS part)
> > 
> 
> um, no not really: the decision was to simply drop support for pre
> 6.0.55 firmwares for the AR50_LITE.
> 
> Pre 6.0.55:
> 
> -  has a requirement for secure buffers to support encoding
> -  requires a driver workaround for EOS (providing a dummy length)
> -  during video encoding.

If it requires secure buffers to support encoding (which we do not
implement), then EOS workaround is also not required (at this point).

When we get secure buffers support, we can either lift the requirement
on encode side (and add  EOS workaround) or keep the requirement for
newer firmware.

> 
> To support < 6.0.55, v7 of the driver patchset:
> 
> - uses the version to disable the encode node
> - enables the video decode node
> - implements the EOS workaround.
> 
> It was agreed that this complexity was not necessary and that we should
> just drop <6.0.55 firmware support (which would in any case only include
> video decode).

Limiting < 6.0.55 to decode only sounds fine.

> 
> And so on v8, I removed the above.
> 
> Now I have v9 ready to post it, but Dmitry is asking why cant we have
> the v7 functionality so I am waiting for direction.

-- 
With best wishes
Dmitry

