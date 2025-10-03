Return-Path: <linux-arm-msm+bounces-75954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F86BB83E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 23:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00BA43B0B31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 21:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6185C276024;
	Fri,  3 Oct 2025 21:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmPOTqhg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5637274658
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 21:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528519; cv=none; b=LSTmPwucWnSSS/okxuVedWvAyEfJFlMz1w4i6S39xD9VEIhwSo/3DvMoC/Ya+UsUyTkV0Cj79JmfTdoWS7WnlLv7D6dBlDfxouY4jcSnokTzW3EMajtLOUnrEZa03szgeaO+xIb59irPs6puC7VfUdd10l0ClmKCrs3OBGuSpMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528519; c=relaxed/simple;
	bh=41HHN/qGzJJn4ee86gwGXwwgMCmixPoE3qhczvV5OcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRtEfhAdzhyawvkkmMP+9iMQjisSpHz+U1SlKGcCNX/r1FeAmixkudivhyy9SUueXebx2/CR06xydns3ohezOgjGffXSvqsh2b9sehHkkokTDai+7CidIbrLrjXQu0pOAUS0Ks9kqhTJ1rEQ93k6Fg8PA2ep09TlAkuzNa4cz5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmPOTqhg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AUIIH009721
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 21:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WT3uPbcX9tBagOLqEVPeVmh7
	jBTPX0krG007D+krSn0=; b=hmPOTqhgNWa1dQLixXBrMJILuKpvcp7ChcpkHbbO
	ISbhAX7J/r6jqhWz4oQGepJ6GMcm5PswwKehMzGNczgqjWxohucSfWEGNKcTlNA+
	mkW67QOcSMotqhMhUnhsMbdHXm566u0kiBLr0XtDJXh+EAHI/JK/vzJ6KOn7oiRo
	PPCsDFnFE1tlQXjnUoDPxOq86i3ZhX0O5ZwsLCwm2G2Kd2tdQgqIsFWii6wIDkVB
	1I9AUoUvHpmL0PHUGK7Eb5Jw8MtXFi0jl4E8bg9JZo0NKeR/dCcmf2kGN/TSbqvR
	csHFRPg2ZfmbOkf+OtfN5RSiK2vn5/LrKO6AD437xd+nLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93huq52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 21:55:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de5fe839aeso69001451cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 14:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759528511; x=1760133311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT3uPbcX9tBagOLqEVPeVmh7jBTPX0krG007D+krSn0=;
        b=sZbTlJoA1u4jSa8TfoyjWnsgYsukuNm9/A/nzwSkYjimKqNcpCSSziXMVK7OolsfDo
         uS5h+EDkRcl8D1gvCGeTgdonDktuOFiGNj71I3rKFXqYH/Xc86AxPvZurRN3S8yoJIGa
         unzRzHcAkXbLrr1b8VOdIb1LM5xiML2Z6E6PBsQd6bCso2MKLCE4OYK8r8dpf6oUYn7x
         0il6nvcdUB/f0gtjfF+Pj7uJ7AJOLfRHVzL4dxbsR3ak3CvjKiYzfxNqoLH8R7i0oky2
         xM+/fO30zKPWTqRQFTlv3eGmGtSkleCKe30e3JDX0nOLuX2kOKmifjA8+ol/MKgVPm7W
         UQQw==
X-Forwarded-Encrypted: i=1; AJvYcCXaJT2SrlU+uMTAenxOvRe6lIySHEjvzZ7N4ZmaqrwaS/cpkjBuJVLH9bVRKatEgS9KRG1yu5t+AFThObl5@vger.kernel.org
X-Gm-Message-State: AOJu0YzbhX5vdig5VJpjV2oVyZKMpthBHi4/lgnzTxcgo4sVTOS13F0E
	N1uX7QrBccZME2GpU0nPOOWzQWVT8TDKnHIN5Hb6MXCQmsruB2y1a1+r5YniLAW4Z8UA2QHFcxC
	WA+/SaqXtMOhcAONm84DUS84knX5T+pOruVtEXfOHPLDaLPVBTBMuZwBNwUOwjrY2lCKZ
X-Gm-Gg: ASbGnctZ/8wHOOFmCimBajAAieSOpZFOBLAY8wElWvjA2tbeAK9B/HLHLJJ36n8oHyw
	OMeYczo8GYpl0laLQq6bzuGKsi9pv2aC3bkUCfXt7quBpRFdavnqRMz9vXjL0uGN6oiM7xI5JnD
	/rDk3gDb2q5raTB9hHGi93at77yMSGfrW9r/EJC4E3ROvnz4GcdgOLyTT4t3vALRM9kvK7RLkRa
	sK6juB8UCIjUEUILjbzB7cyQCbjtFkV9UpxwFHm/LFpJXrj/+oARO7/IExpoIdalMfcGt+BrCDA
	oON17DT9OCwOBzywMZjZGk4vsxs4o5Z1zuiY71BlFmzy/WZ6ycazHyJvNDQazpPNHyiZw2cCF3f
	/QY7ebOITrKeNqV69CpYk1GwTzWx16uSOqndTshEuQYZ92/cj9YC2c7DPaw==
X-Received: by 2002:ac8:5f49:0:b0:4de:73b2:afc7 with SMTP id d75a77b69052e-4e576a50cc7mr55876291cf.31.1759528511039;
        Fri, 03 Oct 2025 14:55:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDhqAUHWqgc3GWJMbiaRjW8xbw3rm19fuPkKV681ZbMoiAFDWogDl4M0uVMEWO9gO38ZJtKg==
X-Received: by 2002:ac8:5f49:0:b0:4de:73b2:afc7 with SMTP id d75a77b69052e-4e576a50cc7mr55876051cf.31.1759528510423;
        Fri, 03 Oct 2025 14:55:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d6fesm2186913e87.73.2025.10.03.14.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:55:08 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:55:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
Message-ID: <sarhhzxs77gthpap3vsxidvut2bihtmtyjecjbo7dgvglwfd6s@yt2w4on4f5zw>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
 <38c70e06-f7bf-4ca6-8fe9-2a4012017cff@oss.qualcomm.com>
 <64a732cdc3fe9381e2f716be9e965fbc905c1416@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64a732cdc3fe9381e2f716be9e965fbc905c1416@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX5adB4VSTj92m
 f++jo6GYgQL8jItUKoTr8YMihmBi8K8rywIb2wnppkpkzAcDN++Xrbz/HCj3rm4yI7ruwWJLnyB
 gqNOE5BEI3ABLH7tbMvR0MOHJqecCRl9XjoihZUMk3yZHNX3/pY+iX/P8KI5eZADdCszC/KYlJY
 8JkVTOu1knfMynSTFZ6VKYBKkwgiIPUpGIWdUEpoYQjr7wKN0n4rgGATWQcePr+FEyhtuqcVJ5c
 NLRPXAOGsGZJ9d3Qc/+sHUJtGH4/qw6qTJJ51mTrlaIg7BLUmAI5CvPduQbiHm+h6971Poo7rQN
 08LOTK4yg8putfj+uHeQCQZTGfGl50ZUZXGZpLmJHmXojN/Z8T0H4uLPXXaMGhM3o2Dtui9Q2na
 2NMgmbRhB9QvxjI6MF9rIlRvIHII2w==
X-Proofpoint-GUID: 4AN8b4XGfKKt7FBsGLVyDUix50lMvyFw
X-Proofpoint-ORIG-GUID: 4AN8b4XGfKKt7FBsGLVyDUix50lMvyFw
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68e04645 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=z2rhz3lDxe_xYuXa6uwA:9
 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On Thu, Oct 02, 2025 at 04:55:44AM +0000, Paul Sajna wrote:
> October 1, 2025 at 9:09 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
> 
> > 
> > On 9/29/25 7:05 AM, Paul Sajna wrote:
> > 
> > > 
> > This patch will allow any values between 4.6 V and 6.0 V to
> > be set on your phone, with the kernel defaulting to 4.6 V at
> > boot and staying there until (if?) any driver requests that to
> > change.
> > 
> > Your panel probably expects a *very* specific pair of voltages
> > and any deviation may cause unpredictable consequences, including
> > magic smoke if you happen to go over a certain limit.
> > 
> > You should most likely hardcode that specific expected voltage here
> 
> These are the values used in downstream android dts 
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/efa8458f79dffeb380d43b38b9403407f87d9f05/arch/arm64/boot/dts/qcom/pmi8998.dtsi#L484-L485

Downstream frequently further constraints the regulators. Could you
please check the boards's dts file and the drivers (SDE)?

-- 
With best wishes
Dmitry

