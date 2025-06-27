Return-Path: <linux-arm-msm+bounces-62793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88718AEB875
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 532D91C488BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 13:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBC02BEC3B;
	Fri, 27 Jun 2025 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JywYaVQH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEBD2D6600
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029629; cv=none; b=Q7LChLX2hIXJuWVjt6g9uV+S3/npmQphfvxgvVFV0jj7Ku3kqoGh/nfDZyj/sS/0+iztLm3RhpTLrM+d4UpRvKoTvTY+Y4WLuWD97d9Wo7i9imp+KYPtBLxNE0psq7uiwSSCHI61Ze9OiY9jfI3ljhe6YDCHQfZntMsMZO5M5nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029629; c=relaxed/simple;
	bh=tg6R/OxBEXFdnuXFE43TcWTsroZknzNNCoZ8QfLjMNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQQxXfapOKL0VidwLHJoY4gDGvIT77phnwufIwnHjRDhUp3NC3GwBpNCnDyqtlCcfVnSjLhlvYgONOjDIXG24H/TX2lmMt4WukNqFnmDZ8+FqVvhKR1rFbZ7Grh785/gcjNeepCVJE93Bg6wIcbbCPn/M3NFikFd/06kenO1w48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JywYaVQH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCMaP2014518
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kOUX/LASzquhlb9ZqFy8fIjM
	n0teZEO5MHWRCaUTrxQ=; b=JywYaVQH2xpBA+Ok0aU1EP0ExUHBMUZBKgrR3LNf
	SQksZCScvWtjwOB/RR++LZkdiDz1NT+jBCqKdL/rnBqfw9D/RBXypRTnT7kCU/3i
	9/dbWTlK0kxpykswfFZy+sOsVMuY87euqbHCE1IlA0Ae0oXv62bkyMwlvn/n5bRw
	ZZawutGCgLdklBlY7Y8QHffk4AiAXqMIKOWbeZJW9w1OCl6T2DZAmyJncDOfxpmT
	sYJwQbu3asBc0dYc8ZZHEwdVtpcbluNzgfL62KYHiA4hcjbC+gnp5G4g+XNwJUsV
	uG0XIQgN0a1TxTVoQ5QhMHpmS8OtxjFubNJBZRoyXec3Tg==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm25gew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:07:06 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3df2e89fc8aso17632555ab.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 06:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029625; x=1751634425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOUX/LASzquhlb9ZqFy8fIjMn0teZEO5MHWRCaUTrxQ=;
        b=nmGPwxBR/T4gsa1g0TnSmqEg6rnYYMH/Jd9cE8LMPemHkv1mTcD8G4vRbTC9VG8ovk
         3eOMrhMTZzy7PwbMwlmMR7Ar3BCt5+62ylzmv5UcCIePO9kFwNPGzNuSoRE2rLm/F+mM
         d2X82MlJfR9MaGhwwpWz2iqXVuw3+329wW/WmfcA/ZF9SkUI600zAhja1KX+B7NVN4Bj
         02DpQAqnDSCyZGp4Tqp7/GjO5pyXa+cFGQBGvbUVl9fDiE9Utm5MP2E18wrxsuFmtROk
         XM8jGlTV5/+x3zjF+lxOw2o5K3ZluvKmK8nNmohkVkj26sgdpvMotP8yiOES95aAJsvd
         mJZw==
X-Forwarded-Encrypted: i=1; AJvYcCU5qxl/RGcB1pEqXvlclSxEndqcBRJfIASefQtDfxXgrUd6NzY7rDm2J40pwjuXY9M7aXKKSFt5YAgg/aCV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw81rqR3rGjmG6Qiocjixu32oO4t4WnEhS0ErJsAMhLp7BzNXnY
	c/asRAOG8F1CDItvqJlbwQBOdJDCQOpiXtPUWSyGdSq3oV90IYFQFq4x2bNt32oM9nYQI3db9yA
	t1Cilr1qJCLcVsTSkExSmKt8LuwKxtQjWta6lDEHu5t74QzJnQHkZ6b/4zBLbs3p59S+nCVi1Lv
	ECQt+2aQ==
X-Gm-Gg: ASbGnctx9thqgMRCVgYLaVoD2m8ShD6x6biA2qCNmyZpgYspu+VlZBvVUO8DbDorPJ3
	KGAt0IUVeM/B0o1REtSvcKOOF0rxpQsZ083UOgdJGRm0SbHlbr0FHS0ULVH4rw+i74RlfO6M/pO
	QBju3EIv97a2IRXFCglvCt3v0IRvo5C+qrK4q7gL2EPnPmlXZwiP5NvUaZwVnjCl0Jo0HiZ+0lS
	Z1h8gIBVtAuDkbbD3Xh/3moU5SHgTdiQpRwnCR4kH2d6PcRxWANH/wtzoMqG8ndPIJ36OkG0265
	fR2FcaVkWfrJlkTtVkivp2ER2PJexKNq29TyZD4aIcgT4D89YH/VkKXzsjdk8x71JzLciL0d9mB
	/5dVpfZfRG8zkk+DnGTV2j6OM4ql0gfLHv1A=
X-Received: by 2002:a05:6e02:1561:b0:3df:34b4:1db8 with SMTP id e9e14a558f8ab-3df4ab3d2a9mr43205655ab.4.1751029625327;
        Fri, 27 Jun 2025 06:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE50hw8i/Szi+Vi9+TVEvYSP86FNNUfbWZEopTrfXXcxIjLifGRpkjO0fFOCbyvyj5vIC3A0w==
X-Received: by 2002:a05:6e02:1561:b0:3df:34b4:1db8 with SMTP id e9e14a558f8ab-3df4ab3d2a9mr43205145ab.4.1751029624832;
        Fri, 27 Jun 2025 06:07:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2403edsm451530e87.14.2025.06.27.06.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:07:03 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:07:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
Message-ID: <lrbqjf5zxxyjnyfwwk6wniauffi5a3hgkg7jvboybvmrwxyu52@56onam4vvhz4>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
 <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
 <6zut6hiwig4qanrmloqvibx4tmpb6iv23s3hp7bb4ja6jzzia3@wnre6i3mukbp>
 <DAX8BTNMDC8Z.182KEGJF2XRDF@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAX8BTNMDC8Z.182KEGJF2XRDF@fairphone.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685e977a cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=62jDj0fiULz5QxSi0P8A:9 a=CjuIK1q_8ugA:10
 a=mHQ74H5e8mo-RpSg_uaF:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: pLjofg4YmBoGd88WQQNz-IZu66pg86j8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwOCBTYWx0ZWRfX07r29so/CwiO
 9SorrjWmPsgBdExBy6eWy/dUv7aeE/LbQY9sl+t0cbnRmNpLuGtmwdcyMqW/UJ1tkycIQM6leOQ
 Sr+jOjxncRUv5dwE5u/lrmZBFq5yQtaFClBZFEjvmtmRrr8r77zrXp7oK/cVjFd+AdfBkvUl8GV
 9lTD8rJKnUZMSPdjPA7GMM1yUnVh1f/iFLwfxkv4Iu4wmCB1TwFck6Baj8FDgDwV8biNmjZTIGp
 6coZMDDdrkSUAaj1yyU2lNMvHwyTyQ14wfJPkFb5kluQpPHTLI5OhOd+ySa+Nc2xAGeT3IieHGP
 5xQ3q7vGGrMonl94ONwaX2m79EKm1vYwqXg+wKcZQlYk/oC24/+lCQRXwhDy26cl+W96LR5IAb/
 +X0H2qO5t7wJNc8GX8AtX6Vghn74TkqtbBaP02zC1omUtOCxiPhMJyFWzTaVHJl7o9CqtkfA
X-Proofpoint-ORIG-GUID: pLjofg4YmBoGd88WQQNz-IZu66pg86j8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=995
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270108

On Fri, Jun 27, 2025 at 12:05:08PM +0200, Luca Weiss wrote:
> On Wed Jun 25, 2025 at 11:03 PM CEST, Dmitry Baryshkov wrote:
> > On Wed, Jun 25, 2025 at 05:01:29PM +0200, Luca Weiss wrote:
> >> On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
> >> > On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
> >> >> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
> >> >> and the devicetree description for it.
> >> >
> >> >
> >> > Please use PM7550 instead.
> >> 
> >> I'm happy to not follow downstream naming conventions if being told, but
> >> do you have any details whether PMXR2230 == PM7550, or PM7550 is just
> >> another SW-compatible PMIC as PMXR2230.
> >
> > It is PM7550.
> 
> Ok, will update in v2.
> 
> >
> >> 
> >> Also we already have qcom,pmxr2230-gpio upstream, so that would need to
> >> get updated for the PM7550 name.
> >
> > No, leave it be. We should not change existing compats for no reason.
> 
> The compatible is not used in upstream dts though, and cleaning up some
> old naming for the PMIC would be good, no?

Then, I'd say, just use pm7550 everywhere, making the qcom,pmxr2230-gpio
a one-off unused entry, which we might drop at some point.

> 
> But I can leave it for now, and we can potentially take care of it
> later.
> 
> Regards
> Luca
> 
> >
> >> 
> >> Regards
> >> Luca
> >> 
> >> >
> >> >> 
> >> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> >> ---
> >> >> Luca Weiss (3):
> >> >>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
> >> >>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
> >> >>       arm64: dts: qcom: Add PMXR2230 PMIC
> >> >> 
> >> >>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
> >> >>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
> >> >>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
> >> >>  3 files changed, 65 insertions(+)
> >> >> ---
> >> >> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >> >> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
> >> >> 
> >> >> Best regards,
> >> >> -- 
> >> >> Luca Weiss <luca.weiss@fairphone.com>
> >> >> 
> >> 
> 

-- 
With best wishes
Dmitry

