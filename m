Return-Path: <linux-arm-msm+bounces-78604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215E4C01834
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 15:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 198543AD068
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAC9312819;
	Thu, 23 Oct 2025 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5H5SuhV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C921F8724
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227114; cv=none; b=oZTcM9dfepoqBZwFOHFTnWF8I++JAyHcbm8zMDd/QM3HjHlvxPiWOgGxieR/Ix3HMcDUizu8S+0U5iB2gQnferUVhMQvxdEOkmRjykJ4+4oqyoe67NuN3jL9AOpm+zB/p9KpqZKqg7Gj71PhPAlelHLrUOubZIq0hoc+UrKuOcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227114; c=relaxed/simple;
	bh=5qLhO8bMrQf3x0vI8bDztVOubuKOGVJZWSy3orA79B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDctKp0xr/hgzPwwDB2yGpBKwPwfDno2/DsPGzh6q0wKlgjylpdh65HfEnRfnAyk5fgExMizQtxmB+HgVv0LTrFcCGqHSCgYlXWhFY18HG9R8kAcncmKDnXkg6w2VAwiQPH09HbFutwQv973ku4eVMlo57VHbySpr+mtNgYgjew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5H5SuhV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7YlRT011871
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gpA4t0Tx9Nqg9KraWDRj8ETR
	jbLQkA+6OzZbdHhbozM=; b=f5H5SuhVn6fQKVY5wBCJno7CjjPoMoObJpu6VnbT
	VTuw/HTPb83GdmcD+z1HFCc6aI9L+oQrs6Zy67OiXDTy0FEB5mrulr8rklzKrt3t
	c3Txnu+YyFiwvxjENFq9ZYldPsPXVrwAvO5KCTkWsQFuURhVvZMvaXiiSp5K9Hc6
	X3JZAaupbqOQViy/ZfkCetESkAlv9EaGXlpvjX6tkqRi1PGeTxv0p9KavxwBNo/+
	sfbWdXcVybEjjuuyUS9tKTlBQgvL5em6w41jsulT7ZuQdAV+df5aPfVkQTUJxFA8
	aVB5wodPvNRZLTSh8H234P3N+U7vcCWOpfwqizb1TRLMlg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524asj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 13:45:11 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-780e1e71180so9740237b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 06:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227109; x=1761831909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpA4t0Tx9Nqg9KraWDRj8ETRjbLQkA+6OzZbdHhbozM=;
        b=FR3ZAizDH1o3DshqSnuCNZAOLvoEmE6aZrLvi8wkLWBX9e6TFXuZordl4dTtpckhhm
         lZ/qDBBrZw9CyOMnB5RENWDbdy/qB0owviFx3VW3VPDq9YPaZJKEibL83ZCAH/ZAUX06
         ME7Eh/hwfuK9Hnllg1Biz6jfThXkOzXGA33Zj5CX5AKM46QWRMlQI3Rq0rfEup3077Zq
         sk5KfQ2WCYMQD6IC2V7gxL7y3HYEeW9QLxu6B9P+K9wV+E3DRxC+m6192meSAkqhtiRP
         1WeCaQAs3mtrQzi4RQRR6bx9z+gH6XimlPAium9z3lsvLR6v+uvDGTr4wFqggkTqH2l7
         oFeA==
X-Forwarded-Encrypted: i=1; AJvYcCX21IWwt9SCRDZH2ypPhjc60Uuc0EWe86BBQuhp7OhYlLsRuenohbVvBO7P0pnV4b+cywxsvXpevy8JoNPo@vger.kernel.org
X-Gm-Message-State: AOJu0YwHjWPxz0ATd1QUqkQcuxTW6Kz7u5MnhvT1uh9Z9Lb484aEkyev
	Bu+0VIfKCSELpgf4WNFH+DEcO2trV3EEOZTxFriAsLCwXChZM1nes/vh1w637/X7DWZnFt9OQpm
	1Dso44krrvbO/wGHRwKBkXxUBxU7PXNaBOb/KEBeXkPFyJmg4bmmfUZIAi3e4d9Q1hSKPOFjQ9x
	+pmBT7fFIukbFVFaCbKxmBkT/U5aaMSWAa1fyYPMPhv9U=
X-Gm-Gg: ASbGnctPpuY4wk6LZ8lN7STlbds3qD9PuCu/gWNrLEoZa6p1GrcKXfM36sJ7Wj4lFAM
	feD4lne4LB/e9rGYq11SY/LHQo7NqHILMzFFUDpY4KzHzb+2qP0iFkXrfQRsTsmL/JnfDQ90tse
	pET0dkbFx/gdKqNany5V2nDuxC/VWIAJgAsa2TiI19wfUhOuH/7OMly89ykEAPL25w7+AsdA==
X-Received: by 2002:a05:690c:7086:b0:784:9e92:c664 with SMTP id 00721157ae682-7849e92ca3emr122441747b3.16.1761227109225;
        Thu, 23 Oct 2025 06:45:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlsKBz8BFpzpPylRu13d4ztAs6ML2XMao+85Qt9HQpK8cyVimN14rpj9+Mm2z3U9SypRLVu4wuwxHhyilsRBg=
X-Received: by 2002:a05:690c:7086:b0:784:9e92:c664 with SMTP id
 00721157ae682-7849e92ca3emr122441537b3.16.1761227108728; Thu, 23 Oct 2025
 06:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com> <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com> <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com> <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
 <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org> <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
 <41183580-b917-47c8-8612-426f3ae48e50@oss.qualcomm.com>
In-Reply-To: <41183580-b917-47c8-8612-426f3ae48e50@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 16:44:57 +0300
X-Gm-Features: AS18NWChk9540UMiZotHqZTODwm7O5SduturGp32FxDHIMAx4_tSI59RKYQrviQ
Message-ID: <CAO9ioeW8oSLcFAx6G1Ji0=uNrWAQYUHz7L7isFdVyF02v5aioQ@mail.gmail.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfXwbpgpI47NK9z
 bUGLA8V4N6jxipTgtNjzATfTNop4hrm6lNrueQlCG2A8ClLOAihrM8b+nKPunKHrJSTNH+0VAK3
 N+k5HZh/nhi5Gqc/NS38wWZm+dFMSkUjow9bYzzPBOTZ9AC3IoEp8Rre+HXwsBr4OxUj1yv1msB
 mCIdLsm6uNzhC12+L9PdnTjML+2O8RWC/DK/9j63PxXoRQ3XlhtRLAf3zwk2RqjgiOvD1w8Kk2w
 U4157bXorXsxAQyI1tOGbu5ASFdX5tW5XaS999Kh3T+0GwEBzFtWzgflTaQE/0PZet119Y8wnA+
 eMi/Rtvz3GdvQvfMq/Ze51vh4FrWo4J7/qUPrUIXuDlG85P21AcUoF6XKKQomijg4aD+bCERzEu
 QrUqNmgmBNhrGLgCFa4GYd7duoYGrQ==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa3168 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rC2YrvntRYF-RUPwMtgA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: cSMDFrsSp4JvDwgH9-_dym-L0L8ZVc1G
X-Proofpoint-ORIG-GUID: cSMDFrsSp4JvDwgH9-_dym-L0L8ZVc1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On Thu, 23 Oct 2025 at 16:31, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/3/25 3:01 AM, Dmitry Baryshkov wrote:
> > On Thu, Oct 02, 2025 at 04:07:37PM +0100, Bryan O'Donoghue wrote:
> >> On 02/10/2025 15:59, Dmitry Baryshkov wrote:
> >>>> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
> >>>>    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
> >>>>
> >>>> WDYT?
> >>> Well, I think that potentially complicates the driver by requiring
> >>> support for both HFIs for the same platform, it requires detection,
> >>
> >> Doesn't have to be anything more complicated than a reserved string name.
> >>
> >> BTW you're right the main reason to support this is - in effect - ending of
> >> support for gen1 firmware.
> >>
> >> But then in reality if that is the direction of travel, its in the interests
> >> of upstream and users to make the transition.
> >
> > Okay. I did a quick comparison. FP5 has gen1 firmware, is vendor-signed
> > with the T2Mobile cert and I assume it is fused. We were going to drop
> > support for sc7280 from venus in favour of supporting it in iris. What
> > would be a migration plan for FP5 users?
>
> Just like I explained, the iris driver would load in its place, it would
> retrieve the firmware binary, decide which flavor of HFI it provides and
> then decide which ops to use

Upstream-wise, the patches that I've posted for the iris driver use
gen1 firmware for SC7280 / QCM6490 / QSC6490, providing a clear
migration path from the venus driver.
If somebody wants later to implement support for loading both gen1 and
gen2 (which might be a nice idea), it needs to be implemented in the
driver.

-- 
With best wishes
Dmitry

