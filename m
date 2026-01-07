Return-Path: <linux-arm-msm+bounces-87929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5AFCFF4B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 19:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A35D835784A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 16:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0DC3563F8;
	Wed,  7 Jan 2026 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XP3RdLZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxGMcKyR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C204F34E74D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802431; cv=none; b=j78Pq98EjaK4yWsMoebiTlAqgK1ad/94tmSn5m1MQXwL0SvhPKTsZqj3I2GS1YUMNBVReQYmGMlf+j2ZJB9wcAofei4ZF+AVTBUoAMdMkuNuNv5bvHQUtjc6i6uEdftU4Cglc2Tv+8nVjPKdIGnOrijetVKysdZSQrqtJQa/5GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802431; c=relaxed/simple;
	bh=Xw8ELvSCrRosD9sofuOOGWikeQaTd9RciqW+TMiyFxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgqjsKvv5lThSedEOHKGKCKGiOWDiNta3n41JWfb25GyPnYIEyb+MdRQQWvcf9l/UGMj0VqsYlsvh7a295TdrtE1/GBIUoSn0eHFztD50t+Ey2aUw3S1ZvFddh2RwggFXUTDSQgu542cgu6RucnhkAJccpoZQeEGMFrERfsYHRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XP3RdLZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxGMcKyR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079efDL2988464
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 16:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OpUTT4AKvk1DAYuJpTpagouL
	5okdKqW3MjX1dmuWCiY=; b=XP3RdLZcwQgoWLS8OR2JKvcFC62ISnPii/qodqGH
	XFlf8rPto8VqeqTZvpy/9LpoUNXaIWMMnruqOKjAJo042lYK90GIf2aLFV/YtSJ6
	YYkcjWGcizpXPCT1k7LcaSgDq7CoRPR4rmmGWEW9SIc/WxDdoMjcYAeho/Xf76Y3
	lySyaVQvH9m2Kjw6HO4Wdg/lNAScXvRdDFCv1V3cNSEbjDsDHpR3m6NX3onsJxbQ
	NL/7j/SC/UfYJQUHmvycWxqYXtcPIhF3ccWMrz8wweXXhozrzwMX5FqpT9fBz9ml
	5CojbzdmhkZyEe7+A8uA4/U+1VXiB2+Elcu3v123Jh/6nw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2ns79b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 16:13:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ffb28462fbso23467021cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 08:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767802410; x=1768407210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OpUTT4AKvk1DAYuJpTpagouL5okdKqW3MjX1dmuWCiY=;
        b=WxGMcKyRxM3pRnmG4E62c7emPMWmqZsDOeruCUaBGUeEiy8naurq616JcMwrMcoyPz
         CzdgmzIwdaEpJj2lM0YIc4MDAKn+t9rgX92X2c2GDgi/WlGc6kOJbxkvQm2IJjA6JLfb
         BHPaM0BZ0qDynqMs9d/2S0DRTG5OOQRKXTtSbZ/zcKj2ARTOvJLhI3wj/pqFrk7OIiCU
         NC0i4aZtoXzKbqTY/54HFTP+02Olr/8Jx25RCx3yHeY17bUC+ygtLMLVWfRwJ2qQk6lP
         Pkuj94rsAXuLWf6Najv/cRWG8b9unOewH/Imx+2ZPFch4DJmmjndwhiwvdlMpSJ4OiUn
         eIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802410; x=1768407210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpUTT4AKvk1DAYuJpTpagouL5okdKqW3MjX1dmuWCiY=;
        b=BP8SS6ZGdx1BOuX/SSLHKcR9zg0L491kg13uEUhf0abHaSp/Vh7Y9gHUBVbhwhKb+P
         W6YIEdzvsapUb9en7s92G0grAFIx4wqHI7RS+YZcdpF5puq/xYz19tOoxtwzcdJz5gvv
         ElXB0VVxg9KJKcYF9tJvXalgdjzZIFpvQLBneIW9yBMJYIWt+iuqakRXvbXQWuvdCTgm
         0WnOr6tHUd/8lEFkr6EaNmU/loH96uK/C3xIuO4GuLdmZ/GghprRKPCKqC2eNaQRYA4P
         DMFHbgHp9uLkwexwLL4S2ZyqPF/ztM+SCGAiDEhR/OULubmzJ4Z4RCq0rynBBztSORok
         757g==
X-Forwarded-Encrypted: i=1; AJvYcCUPqQ6FkVKYd7aS8fONA1TIULTVPeadVTvX2s0tr5pBxhDN/2c1Km5HcdYzx0xX+PL6qix/PfpBGYZZGTcL@vger.kernel.org
X-Gm-Message-State: AOJu0YxZKYCt4GmulOSINijQIRDXKz4fikvh5lep99nZiC7FsJbzhaQB
	wwSQDu1bgPBDerfb3IrO6kRYJvYGtJYJ7oYeVCawmrvxLwAf/iKHTVF+HMcrc3yZg75c9oNGIYs
	Ydx0xexiy0G3axPxzC3/tX606L4O6CWhE3yzQ4Cy7FageTwYNkZsq84iKaHZeKbXnWl5F
X-Gm-Gg: AY/fxX70oTZtL95/j9pp0/Fxsh3rdo5iFZ0+HZ1FHxPNUW4ha6H1hRiwz8x0r7FoAqm
	ehLWdfEP3acIQ5EfirYCWXvgxnSUr+/mzyMw7rZeIH5LecyZ3lPyljO0n4Ql+l1Jj5Qj+R0FYoc
	F3wUJb65DBmeezgBPaFAof3x8hOnq8NO62n9Malqv03Hi0PfcDQJFCFvPrgNaqUDxuZ9ecfC0Dg
	WZaBe5zu0anhckrMuF1MPrifimxWZS9zsITV9C4Q4Xgnx32erPhZ0yEfKq0oNudRBykDgopZbSh
	Iva3EjyT4dwU72V17rkLN6KxT+xf7nUcJVeY9eeuKFy+kaO74sU+OOA7iGn/2Oe5FhDk3bxeD9T
	5LK35VELYb6kmtIZD+5YOama+NYnqQk9FqrLcydQ+iO6dL7qlNNCboi5yvQSOcZbBUreQjshvMq
	s3JBwW1uLzG7EUuRjF5dV6aT4=
X-Received: by 2002:a05:622a:488c:b0:4ed:e064:1638 with SMTP id d75a77b69052e-4ffb4a44fb9mr38411641cf.40.1767802409943;
        Wed, 07 Jan 2026 08:13:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHct3+CQG/jeWcyHoC2prjawsf5LsarToPv0u0g/W97n4bZyv7P1C4jn8aQYYuNGH4PaNFEQg==
X-Received: by 2002:a05:622a:488c:b0:4ed:e064:1638 with SMTP id d75a77b69052e-4ffb4a44fb9mr38411001cf.40.1767802409295;
        Wed, 07 Jan 2026 08:13:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d76013sm1424707e87.94.2026.01.07.08.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:13:28 -0800 (PST)
Date: Wed, 7 Jan 2026 18:13:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        bryan.odonoghue@linaro.org, andersson@kernel.org, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: Re: [PATCH v1] serial: qcom_geni: Fix BT failure regression on RB2
 platform
Message-ID: <vapb2r5xbrchobhtvwr43wdqbtd2pzxkfhiyzltipvpdkmaqyj@zkabog4sf4g3>
References: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>
 <CAO9ioeUsLwOs2RqGPcbeuOpHg4zuwwsstjJnTCH4-oRL=ss6kQ@mail.gmail.com>
 <be79091d-3b2d-41bd-9303-2c8a64dde9c4@oss.qualcomm.com>
 <CAO9ioeW=7z=LchdOOfdtujCGJ5Yb3BxeLA_w=ktYQjgpyv2RaQ@mail.gmail.com>
 <36d8fb98-562a-43dc-8b47-b4f6d29475f1@oss.qualcomm.com>
 <c0fd52a2-56a8-47cc-ad40-8c14c269445b@oss.qualcomm.com>
 <741df2ea-03fd-4af2-9a98-20d68658edcb@oss.qualcomm.com>
 <xrghvkbjc6cd6uk7qyvxylgr3veqsfbrjr7palmqqzhfvknb57@h4wvly7zzwa2>
 <db421081-7e23-4088-91fc-8d6aa83931aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db421081-7e23-4088-91fc-8d6aa83931aa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX4P1Ors1K3ITo
 zc5rOdkx4DJ2uglvSY2y86WEHmOoNoUqvoiqcikPErwpwRqXyUzLjklHRIU81PCESeGgpfWB3qy
 FdncvMap2VjT9pDA78QWZJEQNDnrvv+/6u21y7Dx+eSdG7pfPyycM7rJeO1cFxYY8SjyZHmb+Qa
 ezkJuyeRfkaQj/m+/n/VcKjs981AC7do6chm/pzyyoRFoHz5+9NcHQcrPP9x6MfZoaWbkeXbIV5
 EmmUORn2xk9aptBC0byCKg85zp+JdRWrfQshrSSt0yGq8l5nRxrUh9C9ZHGcmI/kYRDwchTytyf
 /ukBaK35mcAI/wV1kChlvPOjvRX8mbgvduDebZsapjrLlQsPL93Wk5lUdcouIfaIDF+wt93QI3d
 dvey8qUR5sKqRjy+IP0IoKOE4a8hwWLKC6L9b8jGzIhY74GvotDHm+vGjjwIxj3BKlW6OyyR4BN
 MXd1GkBzNth0jIBexzA==
X-Authority-Analysis: v=2.4 cv=CYEFJbrl c=1 sm=1 tr=0 ts=695e862a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=K7YG3ynjBNmOUY7XFKwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: PrHtJR3t4SnawRYwZQROQxkhar6BZMzl
X-Proofpoint-ORIG-GUID: PrHtJR3t4SnawRYwZQROQxkhar6BZMzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070127

On Wed, Jan 07, 2026 at 07:38:10PM +0530, Praveen Talari wrote:
> Hi Dmistry,
> 
> On 1/7/2026 5:05 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 07, 2026 at 04:28:22PM +0530, Praveen Talari wrote:
> > > Hi Konrad,
> > > 
> > > On 1/7/2026 4:16 PM, Konrad Dybcio wrote:
> > > > On 1/7/26 10:24 AM, Praveen Talari wrote:
> > > > > Hi
> > > > > 
> > > > > On 1/7/2026 12:52 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, 7 Jan 2026 at 09:06, Praveen Talari
> > > > > > <praveen.talari@oss.qualcomm.com> wrote:
> > > > > > > 
> > > > > > > Hi Dmistry,
> > > > > > > 
> > > > > > > On 1/7/2026 12:24 PM, Dmitry Baryshkov wrote:
> > > > > > > > On Wed, 7 Jan 2026 at 08:48, Praveen Talari
> > > > > > > > <praveen.talari@oss.qualcomm.com> wrote:
> > > > > > > > > 
> > > > > > > > > A regression in linux-next causes Bluetooth functionality to fail during
> > > > > > > > 
> > > > > > > > linux-next is an ephemeral thing. Please reference the exact commit.
> > > > > > > > 
> > > > > > > > > bootup on the RB2 platform, preventing proper BT initialization. However,
> > > > > > > > > BT works correctly after bootup completes.
> > > > > > > > > 
> > > > > > > > > The issue occurs when runtime PM is enabled and uart_add_one_port() is
> > > > > > > > > called before wakeup IRQ setup. The uart_add_one_port() call activates the
> > > > > > > > > device through runtime PM, which configures GPIOs to their default state.
> > > > > > > > > When wakeup IRQ registration happens afterward, it conflicts with these
> > > > > > > > > GPIO settings, causing state corruption that breaks Bluetooth
> > > > > > > > > functionality.
> > > > > > > > 
> > > > > > > > How does it "conflict with GPIO settings", what is "state corruption"?
> > > > > > > 
> > > > > > > I mean the issue occurs because the GPIO state is being altered during
> > > > > > > the wakeup source registration process..
> > > > > > 
> > > > > > Altered how?
> > > > > 
> > > > > During the runtime resume of devices, GPIOs are configured to QUP mode. However, when registering the wakeup IRQ using dev_pm_set_dedicated_wake_irq(), these GPIOs are reset back to FUNC mode, which impacts the RX GPIO and leads to Bluetooth failures
> > > > 
> > > > "QUP mode" and "FUNC mode" are tough to swallow even for an insider.. How
> > > > about:
> > > > 
> > > > "qup_x" and "gpio" pinmux functions
> > > 
> > > Yes, you are right. I am talking about "qup_x" and "gpio" pinmux functions
> > 
> > => commit message, please.
> 
> I hope the commit text below should be appropriate
> 
> serial: qcom-geni: Fix BT failure regression on RB2 platform
> 
> A regression in 6.19-rc1 causes Bluetooth functionality to fail during

Commit abcdefaa ("Foo Bar baz") caused BT init to fail....

Otherwise LGTM.

> bootup on the RB2 platform, preventing proper BT initialization. However, BT
> works correctly after bootup completes.
> 
> The issue occurs when runtime PM is enabled and uart_add_one_port() is
> called before wakeup IRQ setup. The uart_add_one_port() call activates
> the device through runtime PM, which configures GPIOs to the "qup_x"
> pinmux function during runtime resume. When wakeup IRQ registration
> happens afterward using dev_pm_set_dedicated_wake_irq(), these GPIOs
> are reset back to the "gpio" pinmux function, which impacts the RX GPIO
> and leads to Bluetooth failures.
> 
> Fix this by ensuring wakeup IRQ setup is completed before calling
> uart_add_one_port() to prevent the pinmux function conflict.
> 
> Thanks,
> Praveen
> 
> > 
> > > 
> > > Thanks,
> > > Praveen Talari
> > > > 
> > > > ?
> > > > 
> > > > Konrad
> > > 
> > 
> 

-- 
With best wishes
Dmitry

