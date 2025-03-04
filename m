Return-Path: <linux-arm-msm+bounces-50127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D3A4D693
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A8018889CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 08:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D49B1FBEA2;
	Tue,  4 Mar 2025 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvUG1PgG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B151A1F63E4
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077368; cv=none; b=Zd67CymC31efcpuADq9CDXd7l5KsKFAv1t6lxy/Gku8rEbUqxgEHK3Db/LwaecEbckixi6Ws/4LcYbsKSMXts7fFv0BTw5pK96kfrWw83o+gNczI27f18EaJio2k3ghFsoiB/44hKjEOePcA/i9h5rEFH+IhIZh/2pKlRwcGjt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077368; c=relaxed/simple;
	bh=XgA9qqbw3UkE7vJt7EJN9UvDMWDyIUQzyLjlUvqTt0M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHB0eWb1iLxzStfKWo6yN2EA4Uf6P+PR9ii4XKjX5Cpehu+lhRPv0Oa9DdOTE8iSZNrMxOWrknYfxGUQmwDwjdO70SJyAX/yrgxZwgufxA16rP7BDBU+FDA97pPwSnC/c6x7Qq1KZbU8+zuamT7xczx7eBGvO5evrqyFCZImL60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvUG1PgG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NX768021653
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Mar 2025 08:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XAMOM7rvhCYgMuIw3HT4H/aO
	fsEkoZQ5Aqu4Fze2AEU=; b=jvUG1PgGOVC5kQ7DsFZlnFb43l5Lntg0lg8RuOxb
	xcqIawn1FrIoBG2AnX09O/3fL80pZ7MzN2EBN15To8lm2KF9O6jjFMDcQUkgd42i
	Qik8A8DLDoHf/jnBB/22laPT7G7F5l7ewrhymH/V2AW/e5UbL36g2yo/aU/kAZsZ
	uF5bKgXUxjfjUHsD21qMr/s6gr/D5xDAlg7aaVsUvbiO398Nn3WVCBC8W6iU+J8l
	gnpMM7NpuJYhfj3Ko+GiYNzQWxk3d9O+gmDP2xztPaQ1fnJvUot74YZXyF4VzDjd
	te7Dq0Mtfn7c1ZOOSx5z+k1jiAdwXAuFrUVroUqgP2o2Pw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t16xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 08:36:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e890855f09so129846646d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 00:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077362; x=1741682162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAMOM7rvhCYgMuIw3HT4H/aOfsEkoZQ5Aqu4Fze2AEU=;
        b=mp8rQeEAR76Xl3RR7xTiOw2k0sYrLOzaXfBOzwl31704PcKl3wIaJqjqvkqWmiJvNA
         4UD0rsr4LbDyZwizASkY5rTCL4xHo1PiCMB8hM4qqhCYSuvtyd5DLAI4J/f+BSjkE7LH
         XgbQ3BmlYi1fwSANpaEcCyoSInzdRJ3Q3Sl8bjDfJAHQEhr//KPTMyyU8tViIdqxM1yf
         vQj/Bw1eQkKSM3QKl+LNFWBGmzvfiWZXkOzcNQLgWcMUsP6CDVsAlBGOSTgkXWlz0+FX
         489MIWKtVztOqb8rMzCggetiOMt332NOTwzRH4RoAI2gTWTEwNLD2JY8gkRAYOj5FCSp
         ThmA==
X-Forwarded-Encrypted: i=1; AJvYcCU40SPkn34Br/e9ZZxOa6v4qwf2WlUTVa/39aHU2o5yQwa4VxPkaFUQbo07ajxm5McIcOU+h3pcTgBVXVdi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7fMWbhaVOkDPXL7BSzIOOYiqmYlLG0irN0zpm35XYSfxdsvTS
	IB5ukDqqkeb1jEDmODX/BqdDJm7YWyP8ZTUI7xuVTT5DNPYnYD/CTqhFUHnfbjzJKqFwaOwdZGA
	ldJETAYKRr8wRIu+R0S3474KAVxG1ZNtu6yVcH9iOYsmKAwaiHNZX73a2Bezsn877
X-Gm-Gg: ASbGncutxkNiqR98QiJk3XwIydClLuwXcZgvWyqi0sHu00zskr4itRveCT6xb3ek8oX
	y4Slr4Py8JtNAvivVEiPNOhpKvw7sACUhu3yJffB983/jEzM6KwarHH3S/iT1IgkD58ObywUtoT
	xht9fyxsxp1lOZCr9q2KdNeJ8mFgvynr5ZwH2jDy3+l1HjHWf/OtD+FJ73UEhziPqVD2UYpBd9Q
	vNK8cF+VwTySuvlK7iBVBgT7BAo3utWPUFRGbwuZNlOYmxU+Tvvm7uVIYB2bU83J0hmMs3rfX0M
	aDrTOqst4Z4rYKBnGxBB9dao65a/YL36VDoRo3NLsUueFs6w
X-Received: by 2002:ad4:5ba3:0:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6e8a0c87592mr237230246d6.3.1741077362667;
        Tue, 04 Mar 2025 00:36:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYTjjYAGqBjSa8LYcj6moKGc25A1v1rHHnj0+thRYs3Enml4DGKp4CuJXYuuPTy+m3iTBSkg==
X-Received: by 2002:ad4:5ba3:0:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6e8a0c87592mr237230006d6.3.1741077362372;
        Tue, 04 Mar 2025 00:36:02 -0800 (PST)
Received: from trex (54.red-79-144-194.dynamicip.rima-tde.net. [79.144.194.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796051sm17265067f8f.12.2025.03.04.00.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:36:01 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 4 Mar 2025 09:36:00 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v14 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Message-ID: <Z8a7cMmxJuHIhgjo@trex>
References: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
 <20250208225143.2868279-3-quic_vikramsa@quicinc.com>
 <ca8e6569-b466-4f83-83af-38c51891d395@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca8e6569-b466-4f83-83af-38c51891d395@kernel.org>
X-Authority-Analysis: v=2.4 cv=I/ufRMgg c=1 sm=1 tr=0 ts=67c6bb73 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=cl0az7d0LwC7qAhl51RXhA==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=-c0S-HA5VnWDXXpzp3AA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: XNbvPL6fMymibq0qc1qUEf_3gJRqh7IC
X-Proofpoint-ORIG-GUID: XNbvPL6fMymibq0qc1qUEf_3gJRqh7IC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=805 impostorscore=0
 clxscore=1011 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040071

On 03/03/25 18:13:20, Krzysztof Kozlowski wrote:
> On 08/02/2025 23:51, Vikram Sharma wrote:
> > The Vision Mezzanine for the Qualcomm RB3 Gen 2 ships with an imx577
> > camera sensor. Enable IMX577 on the vision mezzanine.
> > 
> > An example media-ctl pipeline for the imx577 is:
> > 
> > media-ctl --reset
> > media-ctl -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> 
> AFAIU, camss does not support SRGGB10, but only SRGGB10P.
> 
> Based on tests reported on IRC I think this might not have been tested
> correctly.

I acquired SRGGB10P (10 bit packed) frames from the camera despite the
pipeline being set to SRGGB10 (16 bit) samples.

so something does not add up.

> 
> Best regards,
> Krzysztof

