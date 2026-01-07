Return-Path: <linux-arm-msm+bounces-87861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E8CFD765
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 840A730022DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE3E308F05;
	Wed,  7 Jan 2026 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrIl92/S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KotY7IFj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE7314D05
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785731; cv=none; b=mJmZNnnpw9giIhqK8D31I/dOMqZBFnzc1EHrxVmAEcA9gqYJyZs2ZpvwMFagGNwE/FbEe7YB/CD/Zbb9TNN7kMJXqOByhTKc9n0GXC8xwDwzgoWAEnrJ3XYF7f9XzTugOQMNN3qF5CdUls02GDB1V2WSgVsU39Ko0eRobFHWtxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785731; c=relaxed/simple;
	bh=XbB4SSzAH710AeSM8VJ4fE2Ww+ULlSMVhqlAd76SuUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OndrwtP4v1jEjnaDiRK4JXX0Xka00bsOAdzACw3BfUmSWqmCvwUB+o6E6/ZttOVvBZ3pVtwdyGfrTV/YlioTdXRYhWkTcFwD8EMxGcddd1WQAKJib2LWA8I0/4ImDvqMTChXGd9UUG6DkKO9UtL++qG7aN8z/724j6whdOB2B6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrIl92/S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KotY7IFj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607A3K6W3889006
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 11:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FwwpRO7eGODj3ZilF25XLXwG
	MQeLcxrTcUmY0b6KrNg=; b=nrIl92/SIiF97F2M7eeXHC9xu7JNC0sO6/wEuoI/
	G8fnM+kNX/FWFkqy3sTEBg8JPIYtrdtHnw+PJ/ofM/DFpi66nmVWLD/HNRzwGrmW
	s1yp3fIueIcG59eJcZzvvF0QPk92Yb61igVSMIqWg25jF9LzS7yg0jhCWvX7r2Kx
	f6EHweB1A9Se/kmXdYE8athueowS0OBMrxnEFLS2aX+7o1UILH8Od5dbKz4tM2NS
	ZBknukQZQln/hr+2V6R7vxDKq2wz5/igTBVlcBDTWzRZ1E4f3uFMHPxD3i0a9n2k
	MJHjFFg8xRe6VphAQRpQInSBSQjfZwg29oYyNNoKh0IFVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0k517-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 11:35:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9ff555d2dso545187385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 03:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767785728; x=1768390528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FwwpRO7eGODj3ZilF25XLXwGMQeLcxrTcUmY0b6KrNg=;
        b=KotY7IFjB5HganU3siyzxxNRzl8PpxGmay06VKeMx8cfLKPbTi+bMYrMmsIH+S4TKy
         HqkiaRyaiiVVASPv7VShECWtEfVk0PgSCAsXT11W20Ad0VmZlmdwAdc6JA1/og+Zling
         GCovACnsO7DBNYVFgY2GgMqhspgPp0jwzcw5o4+5BVM0sL6w8J6ZEnz5kgxhZkpbK2Zx
         hfoENSz6bz8w711NvLLQwZHyjyvr5Hdh7mMF13wSq4teAotTxfu135k9yckKWk4RtxW9
         xQqFGCR5CK7aTj+9heLlgTCxa0JTVbdGSlHyKo5/Orhs2OexgqzO17VLDr4nvR5cVXjO
         mZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767785728; x=1768390528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwwpRO7eGODj3ZilF25XLXwGMQeLcxrTcUmY0b6KrNg=;
        b=p02ZDggSCjk4pUf2UcwvAcNj5PVEorw5F80a6IppoBmrLDAMwZa/1NgaXaQlDGwGTx
         8PKstyHzeX2wSGWp8W+vKkK9Qn2L2zxoSO5wVVoBSAQPYO6rVxb485ee+pLo8fTi8i4X
         Q2ltWO4E1hQRr4tIUwCa9sFMkFMj1jdf8pIN6m+13EUBEStyVvYufthuS79G4diOjVlC
         AeiPHvuwXEpXtSXMWWj9YMABPDzGvaRkxXQ98XyIwpD0POYCpnlMOvFOeglSNVUtRrPA
         g0aR+SKnbHpKmBGVOcglG5JVkAvYRvCKx1gPfDPOOt6ec3pa8e3oPlewEoGV/pLDnQnz
         v8qg==
X-Forwarded-Encrypted: i=1; AJvYcCUR9pvayXZ/dqZJI327ZU92oc0GxEFEQQW2WShAOslHVR5u4Ey8J5S/KEumiG5Z/BQjpZQHWtREdxUi6ah6@vger.kernel.org
X-Gm-Message-State: AOJu0Yztw27lfa6xuhbcgt9nLkHQKdNiv/QEs5giWKiwJmUO16zCr3/p
	954gUA0n1ocOMP9VYZZEqXxU6g3Jl6BCwcMzcvM/zBKQnR6qTRawb60jBMic9036sTNUwW9uN1a
	xXRBMin9dJ/BSOIzcnbiuwHh38tHJV+lRAL8GqBvykoaZv1kOZ3hkZWltmvBfUHTM5lYg
X-Gm-Gg: AY/fxX5N9TQc6yjUVmbAOGqyq8VrTWf/4G2iWeUZneBKkXIsPCVGFOEvNp4CvwO5Ifi
	SKvajsGctxtm8EoXLTSFKKUHK66QjPO5dXvg5xx8loiJwYPvE+EnTw0EcfNgKEH8HcjjamNaDio
	lBWzTDxcNDL9HSnlWrBX2SsrNoiiBLmGfxmOTEzI6CMNE4SMlJD1vGmsMc9dU/Dc0BqCXrR0E4v
	/AyaJcOCUdXC9gIGSdY6Isn0Y3+XJxTjcrXN288TLE10sQn8cL/Bu8vNSUVHWmV6jS86HyxguTt
	5kkb+R8BKzPd3Fchf0QaD7o132ZtL5rGxsySL/hMTZnZh1D7TjktgQA9e42mgWOJGlscNh0hU43
	rIq+nRmlJjNL2vosxMxfxEOqc4eRAFub8P8tCI1yJuh8gWkVsdlfoU09WZhvRhCMc63YGMTWJ7H
	1jx/5fH5zjGz7vyWnsxpYAgA8=
X-Received: by 2002:a05:6214:5f03:b0:880:4eac:8689 with SMTP id 6a1803df08f44-890842709cfmr27293046d6.57.1767785728267;
        Wed, 07 Jan 2026 03:35:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGX++BXAEFwbmR9rX7zsBYcSmLWKcpHWl/2KnWQjRsdmrkR6JgzHf10dk/MNBY6k0ZJfJVSjw==
X-Received: by 2002:a05:6214:5f03:b0:880:4eac:8689 with SMTP id 6a1803df08f44-890842709cfmr27292616d6.57.1767785727756;
        Wed, 07 Jan 2026 03:35:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea81fsm1284912e87.15.2026.01.07.03.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:35:27 -0800 (PST)
Date: Wed, 7 Jan 2026 13:35:25 +0200
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
Message-ID: <xrghvkbjc6cd6uk7qyvxylgr3veqsfbrjr7palmqqzhfvknb57@h4wvly7zzwa2>
References: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>
 <CAO9ioeUsLwOs2RqGPcbeuOpHg4zuwwsstjJnTCH4-oRL=ss6kQ@mail.gmail.com>
 <be79091d-3b2d-41bd-9303-2c8a64dde9c4@oss.qualcomm.com>
 <CAO9ioeW=7z=LchdOOfdtujCGJ5Yb3BxeLA_w=ktYQjgpyv2RaQ@mail.gmail.com>
 <36d8fb98-562a-43dc-8b47-b4f6d29475f1@oss.qualcomm.com>
 <c0fd52a2-56a8-47cc-ad40-8c14c269445b@oss.qualcomm.com>
 <741df2ea-03fd-4af2-9a98-20d68658edcb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <741df2ea-03fd-4af2-9a98-20d68658edcb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: u2tkycORggJgM6NGlTw2JqG2b-iCrAGS
X-Proofpoint-GUID: u2tkycORggJgM6NGlTw2JqG2b-iCrAGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MiBTYWx0ZWRfX8fE6y+tpBNtc
 MKGU3rkNPclB1AtTZ9dMCC+Tg98krinm1H+ZFbcYg+Zw+cczqXTcPJCYd9wcGr72qUfzwWY8OWa
 /+7anm5yVS8o9LjDeHYruMXrIMvDY9YTPEzmNMbLz8v8oyCPQTqWoeFxQ9Lf88lCnjb62jqzuZ5
 Q20ARgrcHPLJIxGYZM9oMnOuW7KOpB5+CvAZBT7e61iqY4hggUpRCuE3b+7sDx/g2IhABLU6cvJ
 VuH/Rkx8BQGY0Ac7w0jxQob8henVecm6wiuxfVfKyJsQC0eWZLumiyJEBPyn3JaQAecE7I+aaUY
 e8OVZWvsF5ckAMdx5AEyIlhhpFIZuoFgFgNsjvKIk3CMFT3wPIq+qD/6xvkPdLgq9bjJ86uX7Ir
 wQoSWQ1H7q/NQNF8+CbTY08+WnjGfqqy6lhp+FFq+9Vnv+gSvPJPpcP18fpWxurMEaK9t/qk4jD
 2HcWO+yvgXxUP49PgqQ==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695e4500 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=wVai3BmpcAUrBI64PhwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070092

On Wed, Jan 07, 2026 at 04:28:22PM +0530, Praveen Talari wrote:
> Hi Konrad,
> 
> On 1/7/2026 4:16 PM, Konrad Dybcio wrote:
> > On 1/7/26 10:24 AM, Praveen Talari wrote:
> > > Hi
> > > 
> > > On 1/7/2026 12:52 PM, Dmitry Baryshkov wrote:
> > > > On Wed, 7 Jan 2026 at 09:06, Praveen Talari
> > > > <praveen.talari@oss.qualcomm.com> wrote:
> > > > > 
> > > > > Hi Dmistry,
> > > > > 
> > > > > On 1/7/2026 12:24 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, 7 Jan 2026 at 08:48, Praveen Talari
> > > > > > <praveen.talari@oss.qualcomm.com> wrote:
> > > > > > > 
> > > > > > > A regression in linux-next causes Bluetooth functionality to fail during
> > > > > > 
> > > > > > linux-next is an ephemeral thing. Please reference the exact commit.
> > > > > > 
> > > > > > > bootup on the RB2 platform, preventing proper BT initialization. However,
> > > > > > > BT works correctly after bootup completes.
> > > > > > > 
> > > > > > > The issue occurs when runtime PM is enabled and uart_add_one_port() is
> > > > > > > called before wakeup IRQ setup. The uart_add_one_port() call activates the
> > > > > > > device through runtime PM, which configures GPIOs to their default state.
> > > > > > > When wakeup IRQ registration happens afterward, it conflicts with these
> > > > > > > GPIO settings, causing state corruption that breaks Bluetooth
> > > > > > > functionality.
> > > > > > 
> > > > > > How does it "conflict with GPIO settings", what is "state corruption"?
> > > > > 
> > > > > I mean the issue occurs because the GPIO state is being altered during
> > > > > the wakeup source registration process..
> > > > 
> > > > Altered how?
> > > 
> > > During the runtime resume of devices, GPIOs are configured to QUP mode. However, when registering the wakeup IRQ using dev_pm_set_dedicated_wake_irq(), these GPIOs are reset back to FUNC mode, which impacts the RX GPIO and leads to Bluetooth failures
> > 
> > "QUP mode" and "FUNC mode" are tough to swallow even for an insider.. How
> > about:
> > 
> > "qup_x" and "gpio" pinmux functions
> 
> Yes, you are right. I am talking about "qup_x" and "gpio" pinmux functions

=> commit message, please.

> 
> Thanks,
> Praveen Talari
> > 
> > ?
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry

