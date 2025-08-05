Return-Path: <linux-arm-msm+bounces-67768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A42B1B1A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 12:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868491893482
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 10:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2991259C87;
	Tue,  5 Aug 2025 10:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aws6MzIz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392DA251799
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754388155; cv=none; b=Br1hTjXorLKz+ckoStRtrCrARJB8P+9gyMFaPD7Lf256U3fcweTJ8xArBxocP1okkkLvmehUPw31Ie/9zr2EVcSHAyz+cuJKp6SbmROIV7F3kvmit1USz85kxRS5HW/NyYBiuDGI9fBOk68fTlMmi/zu9+IU1oW3bBvhDG4yC0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754388155; c=relaxed/simple;
	bh=UQfs52X08rztvnVgM1FhOc9rwkKBAgP7cDsq7fD2YqE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzIIrlw+++uiDG4Z9nC2L8Pywvmav6RWYWpTeMoJ589k0aiBoIeuMVEPVP0TBt1k8GLHUZj+8Jzjsqn4b77H4fxr0Zir3wZVNv5G+VkNFnyoVcbQdwA+1OOGycNFKgac0P1Py9EmzhwiKvQvP2MVlu3NbZTy3qQFAkHLkfCwKNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aws6MzIz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5751SD45012758
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 10:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r/pN5KRlZzw8ea1w7A8SZKyE
	RmRggaLryPkCmJYXwUw=; b=aws6MzIzuClxtzyT+DV1mLZr8MtAqM43ffErt9jO
	P5+Iq1ORKuAVfbvL6oEr2wCTRHr94eHd6ZetIutgGZfXz6NuVKuuGOzF1lv+xLr5
	DmV6Tso/7PobpC2PVv2uTDaNXVc8iNhckyrNje/pwS7gUr2+daXTePw5skS1Com5
	xily5cnuaJE9zVaAGN+PIg2Vmz+mmaMkluKCwyVq0LfR/6erQlMYwp5JVyH4qx8x
	T65XuLQ4OUpu5EdOBfaJzIDgIIdVALeyf/Aa/0a2no5Wl1pYLOQ/dwLrljlfMxKy
	owXj0TicAY8rQJzehffzgKb/15IYxibEAehUWyWG5sHblg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b8ag192j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 10:02:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-4fc078a4ae1so6726699137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 03:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754388152; x=1754992952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/pN5KRlZzw8ea1w7A8SZKyERmRggaLryPkCmJYXwUw=;
        b=CsDOrC+tdx0WIoH4id3j3zhWeqbEO/HMNqf4gtA+6G5QtP4q0FUdc1w9AWziCUbcle
         k7HiVF6Qak4FXCGK8J1Je5l96RF4olseKv+yHmcs2cPkZwzInLe9jQic/KgSatj+Q43P
         /0VnSHxDO/qPI6HsNfprKyLzAZA/0M2r/3/FPYD71j7ujA5l8uxoTF0zhBXv3wemleko
         N7iFsKLWeK9psRhohcyl+cRfamxYpCk3Cmu9HnMnWrZfPpSc0FzWs0+s12h8Akc4d46M
         TmPuXBuartlTOy0EflyDVEBDziYSexC9qP423SWcGUT0I+IkuvAusffUmxOHxhImbw/g
         TxDg==
X-Forwarded-Encrypted: i=1; AJvYcCUIdA0b87lFd5W2OxhvlhjU094w6XmzwMNqIJjHymXqFnl7Q+Z62T3YNw0V+lCDtVwY6jtp2UIG3+qxYhlH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkhg1HGsKJ2DUwcFge8nF5oY6JylFFNdIerJKyN6ueipIpTYC1
	JAJfyzQBMZjo7fDMYoozORScgqxOhLVi0q1XEsDi/7w17F3m7e/MQ2ytd6fgKERpXkQZMsL4GX4
	NvwVOrJyCD/ZamdSkFXBqb9gDo3UrJABNaGAi3zqV/7VJYPJI8cEbXVuwVI5XwvH7UYf3
X-Gm-Gg: ASbGncslI+IhHriipI1Io2KIhSJNYjrmh6D4vS2PMB1n08cjqmO/FgOVv2UyJm8V/B+
	oMpKZ6vOlu0TkMlhBdo/bXDMEzrjSetzYRFM36uB7azZddlmYmulnX5aX8adhTEsKLPyY7vHyHH
	uw7dVM4Oa8EvL885qzM2oyuDrz9+5zwbX+T0P0Ujh4J4x8BWDs+WX6VgAL0/ZgqIKOL9pqum7xj
	nyw6NfEc881TdkIOTWLXwoZT5oWGM8nMwqe6cnuev4qKhu7hLIMe1prdsOZrjOSYb9YG3NhCw8P
	yNcOBkyPw6DDKXfKm6vnZlltb10nc9jNMCVGux5BQ5BJiMtgY0gIUGwVPfKnaIk0LCX5xA==
X-Received: by 2002:a05:6102:a53:b0:4e4:5ed0:19b2 with SMTP id ada2fe7eead31-4fdc2243659mr5411380137.9.1754388152100;
        Tue, 05 Aug 2025 03:02:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLQKUVXH95EUZeQRDU0eF0Ohtf/ON/jVpxNZP2FzfGcVyv6l60sKTLIkYICkYA8jVIdaoEjA==
X-Received: by 2002:a05:6102:a53:b0:4e4:5ed0:19b2 with SMTP id ada2fe7eead31-4fdc2243659mr5411335137.9.1754388151721;
        Tue, 05 Aug 2025 03:02:31 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c470102sm18416825f8f.53.2025.08.05.03.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 03:02:31 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 5 Aug 2025 12:02:29 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/7] media: venus: Define minimum valid firmware
 version
Message-ID: <aJHWtaLung8Ubdh8@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-3-jorge.ramirez@oss.qualcomm.com>
 <a5c292ec-e59b-49f0-9681-a990128cbdfe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5c292ec-e59b-49f0-9681-a990128cbdfe@linaro.org>
X-Proofpoint-ORIG-GUID: Q-kahhPSALfMjnWEjzJ4Ph1Aoo23bMRH
X-Proofpoint-GUID: Q-kahhPSALfMjnWEjzJ4Ph1Aoo23bMRH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3MiBTYWx0ZWRfX/yWrHZj+4lwj
 JsV9feASXl4nNS9Ba7zKWVX/FGcXVoSIMB7mFQU9dowBbvu2e04mQkqDbVSIqBG8sZQWhyibsvM
 Y06FhJw6QEjvQBUHvHbueCCMfLMdfds2gSDSCDCeXec2aPZ73Ti3vmKU+L/3OTwJBDU2Yk8X70R
 c1dOMnPOJ6ucBK6XPvU7zanRd7H9QoQ/hXj4mMwFYaVa5lnvc7qW4MvJHvRKROA68ZNzKipSX3D
 Gso2/jizuqLpPro0ZwgliRE4hAn+YWATBqmazdKsXMbS/aoUEVH9Sdyz4gRKDfLqOWl7YQoNxhk
 2QAk5hP69ZO0soDl6jn9vFL5wjgHKk/wSTvGMXXMXjCP+WnYf1WT8vqheongC7mzCWkOY4TNfsg
 CfOQ3+8DsiztKKuHApDZ0ogqETJeaaWL7z6Ve54KHyrdurLcR99W4gWhs+1sAMRqfVTfLlrp
X-Authority-Analysis: v=2.4 cv=aJvwqa9m c=1 sm=1 tr=0 ts=6891d6b8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=GmUu7VV6tgk2skhn_1sA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=953 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050072

On 05/08/25 09:29:55, Bryan O'Donoghue wrote:
> On 05/08/2025 07:44, Jorge Ramirez-Ortiz wrote:
> > +	if (!is_fw_rev_or_newer(core, ver->major, ver->minor, ver->rev))
> > +		return -EINVAL;
> > +
> 
> This is the sort of error case that deserves a kernel log.
> 
> dev_err(dev, "Firmware version %d.%d < minimum version %d.%d\n, etc);
> 
> If I were to try booting venus with an old/unsupported I wouldn't know why
> the probe was failing.

ok

> 
> ---
> bod

