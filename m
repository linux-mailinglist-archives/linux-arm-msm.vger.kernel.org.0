Return-Path: <linux-arm-msm+bounces-55144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF062A98BC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 772F85A4898
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0121A08A6;
	Wed, 23 Apr 2025 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8i7FCPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE11A23AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416029; cv=none; b=rXT8BJhpGsQgyrBSB0La45w4MVtcpXeuNJqTgAhL64ABR2M3TIBLd/f3CagRWQRjty5qGlc2Y/iR/4+f+88vlVhY/Ux+EfphnjIDRbHvC9ANjSs0BQyyHRhhs488Q3UOQV9XrIO7eCD0cVoYU1/haL+l7/Ae+1GRc2m4S5i46Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416029; c=relaxed/simple;
	bh=z+eeHIGXfgSgRilFbPbJz13oi5prMWhPbgRl6hzE+CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nP1TALU4Tjr/wXxpX0b5uV4hQx0YOmw10J6vYbS5TV990saaQ8IprD1EtCU7+2TcbE9SW3XoGZYvvwaF9BmQBWm3jWn2PKhcaDRU4T7PuGezqHxw2f/9m8W0yInDFrEv7+sB5bu2biSk8CL2YDo5mAmGRNmNmXu9OTYLYhcFuUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8i7FCPk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAIN60008439
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rccJ163fvQMfzFmJDE9Su9bT/TBQ12k3JHUMjdZJ29A=; b=S8i7FCPkAFszRCcm
	0E5n7TrAYzL6Ya7GMYVKUEoTr9irVJTcLmn6oF9XqUus9aedNsFoiIhvg9442OCi
	AFXVq/HwiYB0I16TfSxL9E4KeJcial9AJCmIN5S2Z2uzTU0SJ0D01nYPVKHOzk+6
	L7GsprnTCxnJsJPcehkNWqdX/oorIjHFz5WI61CAq025XsolYulP4Fnu7wHi1xNE
	Gn7WZ5oQqZJDwuX5h+Sh1ZCMZ5ZlvLTQmdmTTOiF2rr05ZwHjOxLtYTBAVngAaeu
	s8FSngApsCaUi0IAZahyEriLS6BUIjxEDCwvLKPtBYHjjULWSZwXoYi7+mjgmcvG
	Y0yi2Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5aa8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:47:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f0c76e490cso14180316d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416025; x=1746020825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rccJ163fvQMfzFmJDE9Su9bT/TBQ12k3JHUMjdZJ29A=;
        b=W16IKarq3V03bohwZJmY3S69rlcQTTKWK34JT4loBbdNwkjjYhyaoJ7B9zjtb2CTxm
         Iyctw+2E4E/ocUHQdt9FmGTG0zBd9hXj2aImgx+w9DSA+N9u5aKeDUDXZHvN/ZtSbgbP
         g49b4PnWG2liVVsD1XdFYLqs3OMoXOwZUjonAGvkksZ1oP65OE24O+tAdfSj8oJ970vj
         BOiJwPv+9jaI9S9nRde0n3BypARYZyzIb5IvkTcfhL/DA22sbcbOMiBPAeyNNWPk36Xo
         VREWBffhPTllTj8WHHTyBc63/Jqm8mLs/LZdkbfizE5bN27Fpl2XbT0svJcmRFuNgGUv
         xIfA==
X-Forwarded-Encrypted: i=1; AJvYcCWOZOinFd8TNUZdQgACIDB3bMMhBW4afczr3nPB/lucZnACegQmmgfL+xbqn4BMzfGTp0NwVdPCjDmEBj7j@vger.kernel.org
X-Gm-Message-State: AOJu0Yza59ZpZyJR04ZuU25X+DY0XdgcxZBCfJt6fSLs+7byLsPWLBtg
	AdNOEkHIJQNRy+tNpclqONbIH6OrWIqMlgtJwJtfP9ZUKIk0GW0PYgQ4JztrawH8nDlJZmojYV9
	8HOnYX21IizuERknM/Vsl9v4OXG9HdVPlLc95quA+0Rj4PjATWrcn4Tj5LIB7XX0r
X-Gm-Gg: ASbGncv3abotHgdnthWnoOSd2BwBQyw9W9nUf1BWgtyJjordyVPFLLDH3nGf282RkkX
	STESCwsav6Wg7TDx6I0b1N2TA9PJ8AY2vWTprg8MQt/oKr3hu3WGNnhQxBegTtWmojMGMfdj/bM
	wFPcPPe6bAinZ2nKuXCZkX+0NG6cBVQLIkRQII3Xp5KaaET9Rs6e3e4/VPFiJ1NUP5zUyXB/0LN
	VU43gixpAu3cqqy8ecD2dNpSVG0ZICEmL8mLZLVTOS4JPYMxIEAkJQ7NoAaGYPFeWuiEGK6ebZ7
	32hRTBpj4JAz2TMAF89kbtjOv5TUvHKHyGmUXW7f5pCk+mNDjCLQplsJztWdGrWerRQ=
X-Received: by 2002:ad4:4ea5:0:b0:6e8:fa58:85fc with SMTP id 6a1803df08f44-6f2c45382d9mr136299556d6.3.1745416025202;
        Wed, 23 Apr 2025 06:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8MdGQu9WPimGQ7gmBVWx+jYMYlEXhb+dpoDUfI0QxS1ZXNaNpC8Lyx3MI8nCs2MsAlqKO+Q==
X-Received: by 2002:ad4:4ea5:0:b0:6e8:fa58:85fc with SMTP id 6a1803df08f44-6f2c45382d9mr136299136d6.3.1745416024610;
        Wed, 23 Apr 2025 06:47:04 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090826cafsm17949051fa.69.2025.04.23.06.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:47:04 -0700 (PDT)
Message-ID: <1adda022-b5d2-43e0-8cf1-de8e72544689@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:47:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-5-quic_nitirawa@quicinc.com>
 <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
 <317faeaa-3130-4e28-8c5d-441a76aa79b4@quicinc.com>
 <CAO9ioeXnnbNzriVOYPUeBiWdrPfYUcMk+pVWYv0vZpJbFeByoQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeXnnbNzriVOYPUeBiWdrPfYUcMk+pVWYv0vZpJbFeByoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NiBTYWx0ZWRfX1BB3STKg2gml DrGm0H6BW7Lq4nX8vaOv47MIqH0RDIbP7hfkZYEcXZFVv+3DoeOeQSzfAMfar6aCtEzJeWnWcNr sO5j4AxlP21pV8cdbUCCMCZgtc3U/H8oun/08EseUziy1C3voS33t0LE4rvqDPcB5h1PapNnrod
 D2CvE0HzbfcVRU0UvzMnEezVlXwIHlMrEy9C3d2IX8MCJp9HqRvhdGtf98RU2tK+43uVxrKFnb9 LKypphhByaC9RaT768LijhI5R6AoYMDiHH+DM77ALlE4rKhJuqRPv1+X9Y1GRc155CcFE3kgMWc 8nSkWvpphZ5/aO9vQtjgdeflC9qoQbxSm/ZVIae8yJTc2zhoyZnnFhpQB5efhSToHhHAcLMglZL
 f4Ck9Yv4Eq6ZK6BPaKSK4QR3Qe/LLz+v788PYN+7pJTtGbsXyiD14rvVUQM6rYecsavphKwq
X-Proofpoint-GUID: hmtDSSx2_hYcjSRG_NWt2HFjGcMYB0OY
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6808ef5a cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=9yGjJ7AVWo4BwlzXCRMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hmtDSSx2_hYcjSRG_NWt2HFjGcMYB0OY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=883
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230096

On 4/11/25 1:08 PM, Dmitry Baryshkov wrote:
> On Fri, 11 Apr 2025 at 13:50, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>>
>>
>>
>> On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
>>> On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
>>>> Refactor the UFS PHY reset handling to parse the reset logic only once
>>>> during probe, instead of every resume.
>>>>
>>>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
>>>> qmp_ufs_probe to avoid unnecessary parsing during resume.
>>>
>>> How did you solve the circular dependency issue being noted below?
>>
>> Hi Dmitry,
>> As part of my patch, I moved the parsing logic from qmp_phy_power_on to
>> qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain
>> about the circular dependency issue and whether if it still exists.
> 
> It surely does. The reset controller is registered in the beginning of
> ufs_qcom_init() and the PHY is acquired only a few lines below. It
> creates a very small window for PHY driver to probe.
> Which means, NAK, this patch doesn't look acceptable.

devlink? EPROBE_DEFER? is this really an issue?

Konrad

