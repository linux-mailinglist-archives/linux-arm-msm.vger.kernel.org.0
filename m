Return-Path: <linux-arm-msm+bounces-81298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E6EC4EC70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 16:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 80C8134C40A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 15:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3427342506;
	Tue, 11 Nov 2025 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAPnnkBW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyB3cW3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288FE3659FC
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874843; cv=none; b=uhWmQ/02v3iTFLlYwqYhILbqlSpetsGfxeVRbSC59QYDe7FQjlGeUSCXsgBYyetPizt7omq0adYjyTAVPFMRy0bKfdyM0CEC8o7u9aBkBTqfvoQ27JsFYDsWqXzTmSors505NQ8rbAGO2Prthuue7P2eRYzM6Y7o1DcBSa8msWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874843; c=relaxed/simple;
	bh=bU5zpPHPsVJu3Zi2/jYd6pKlJGiH3hqZ+v3AqPgSrdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHu8+yelEU+pP0+vJ0lgKwZBQoW/BI0rLSH/6quwp3W/pAxPCwuweSa7Whws7PxV62F8Yq9K1O1IJVAfMLPNflBtDIjzFJoR3CTzytUjCsBsq2XL3dPDfsOLVpCtDQaLp80mAwRQICOAnOs9V/VX5dJEM//JzQ177SeriPMcInY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAPnnkBW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyB3cW3M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABCm43j2540216
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 15:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XyMhRazRo/qwa+YX4Uby/IyavwjBYRDEhF1Ft8RepQs=; b=NAPnnkBWq50DLqDh
	SwYOAx1NTr+g3xYlCXKnJNW6bYRdqp91/IdksQdsRspRhVHxJb077yDf3TmIgDdJ
	bpkbg4QuAURRbm69tKb8uUL3V+DF69o9cne5gdQuqrDlOoxBWgl30UfLq3PeHncF
	0RhEbvnPDiVQQNl1VP2dKMD2ePbxwFqqEMOXA/PzqBodlaepSZCriSh9PKt/7pl/
	THWOTPa+TeC18y+CaTvaGE5tiQMtks4s5cIOQkVtgSW3DSquXGJswOpC3i3u2y1x
	ENxNFM+23MArsj3IeaG2iK+gBuKo6jWzWeJTvY6JVftZPv/yWGDXBOx8cwAumnRN
	/7O9tA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac5fggepv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 15:27:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b259f0da04so444136885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 07:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762874840; x=1763479640; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XyMhRazRo/qwa+YX4Uby/IyavwjBYRDEhF1Ft8RepQs=;
        b=ZyB3cW3MCYOjI8PNC3gXMR98NI4Z8skuxVD/GkGJTjUbE7zlVM8+TE3Dx90y0/2BkG
         cUq/26W+zc4R0+NjbCFXnngPxZ42xyemYlBorNck2O4fbnBgZIcuwYQ3H74/KP4uaLrv
         Piq65ia2oWW0gMyB3XTW9/vE/LIWL1DpzOYxCbDs4c5rsXOXndo95HnJwrYvH61eTrAu
         C4f8vFk7vj5KioNvm5Bjtnz/BStEHxy0lPrbw3IuLk/XTQUClQxmrwvaR6Pc3AkGx/US
         qFhwP3zPeMTymOk7lHgeGr1M5XlgFC9+kqtzt25pQQVbMcaKXzJUkkYBdOcWRsQF8Yfs
         JfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874840; x=1763479640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyMhRazRo/qwa+YX4Uby/IyavwjBYRDEhF1Ft8RepQs=;
        b=cJ/bfUabLq5Z1OE3vZu4l0jsdSNr3MP4f2u/VKvgPF7SnlO2/Rqj+ZnX63Z7gCCQYc
         j1ZKPcizmyrO/nuMk6IGKyiLun/iXqax5dsrpREV+eL24/GiiZtFNzcOSMCK5evDbNUX
         HBJZNmDxjgEzQ9WTibX3GsTSTzOiF496bu49eE9u8XyHiXhoZ5P9IkTZuuf/+C7XMYLY
         vc3fRcnkIHu+YN0NgIVuX5PqcNy4SEgwjIwzj9uBGfg+c9yd+5OJYn2pIhaGPrONJAtQ
         oxfHSRPOBpMT9dBki0/yPgo3rkrilXMOyqk4NAe9XexxT+aKf9dnYVKsGFK7knygJBcM
         S8JA==
X-Forwarded-Encrypted: i=1; AJvYcCWtAJRccPoOqBqAUcOgoNyVStcVpmcQqNIwPIIIy6yFWou0DvgqIX1EYKRCNbp5yxVJJErOAOVtaTAuJRaq@vger.kernel.org
X-Gm-Message-State: AOJu0YyKvcgBgosVuoFllPvlvt/5dy8X+rVDu3VavUPmkMVjKBU4kuy2
	uSjxSdDlJIFc1kXlWrDmeaKpAJGpbRu/iHl42gltItu3asI3PazVsbG7VskaaOfAUXMRNNVvtvl
	4XEjxi2mAC3U+6DlVgxHRfsTyZOR092LLXors6dQVOzwib9CLS+47dT4mJi5foBDWFuC4
X-Gm-Gg: ASbGncuPOb8ZrWH4MLtNO/xCp0x2zPRhstzBd5VFrbTZSAsWj4zClcU/3QgII1wQklP
	kB/lG98wMnyawrFuJI+R/lxnbw8eGMANMoZpXnzmhztXDBp2fuw1HOM/dDZeOqmG32QHCq7VER0
	0ayuWO7V+KEtRhWQPuU1zfunF/lmHZL/I3FgIS6FGad3ncPfniyinzjNDvD66pTz01q9G4GLyPY
	aahWm01Gypj2GVFBfpGGmOGOd/UgWv0oTewZ04sBFJbKPjBHgltW8L4DHBa4Qg8G0EqyJexezHj
	MJSYLg94YPz8CsWOZwyqDDL6S+sL2ogO7C8uHCDwT8w0a2VU+sh/qSa7WbpwUTiyRowNt0TjrMK
	S9lcPLGz8/i0lIrhq3/z5rbYei9yn1nUkHLDWH45PSLX+8WGF/mCFeoQrIG4Q8n2gYcHAn8EFpX
	jYcSpevbjs0M/m
X-Received: by 2002:a05:6102:945:b0:5d6:155c:33aa with SMTP id ada2fe7eead31-5ddc466ad31mr3702297137.16.1762874097555;
        Tue, 11 Nov 2025 07:14:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdJkveTEY1J/ukmmCrn3GGvD4NI1L7VolRvROA7q3wFctCerZvbwGp+UbnlPjyJfLWbnGFHg==
X-Received: by 2002:a05:6102:945:b0:5d6:155c:33aa with SMTP id ada2fe7eead31-5ddc466ad31mr3702274137.16.1762874096968;
        Tue, 11 Nov 2025 07:14:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a014348sm5114344e87.7.2025.11.11.07.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:14:56 -0800 (PST)
Date: Tue, 11 Nov 2025 17:14:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Amit Singh <quic_amitsi@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Use 'edp_hot'
 function for hpd gpio
Message-ID: <rqufdgme5cmtbvharugka2zc6c4g4am4j6enrkanc6uaxdbr77@dlptsjv7u7lr>
References: <20251031085739.440153-1-quic_amitsi@quicinc.com>
 <nzg7auudxocxnpnjsc2emot7sgh5azvucl72jqzgqsp4jhzint@hykb2xyx66uh>
 <c6ef0324-c932-4c80-8252-97dd3ee255d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6ef0324-c932-4c80-8252-97dd3ee255d3@quicinc.com>
X-Proofpoint-ORIG-GUID: thzs2kB_gquhZI--Jgdd8u6OYCfdzYRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEyNSBTYWx0ZWRfX1+bmiAiA2PQE
 Hdk4b6ZzZXZZE/44XAP5flICXW7IB94SPh8IkOCstMxAW8JWSYaeSp8ggj0y/f3tJT4QkvJEbk+
 KjJh0mmtnvChk7gIa1QEc/GIYJ60SbokaJzNgAyoWoAJtluSYNGiFSYq20CYjTVuCft+LKrfNjk
 H9MT9ooFdDSU5g/HT8L1ggYkbzymSD1OlV2iXoUM6RbSX81vMMhzPvU2VdTwsySZR9Q5O2evSkh
 y20OWHJas63B3tcBgmafH3kbPXn67XVat4zOvdkmB9Hv5HOIoz1YxwjvwaLyGQewv3QGw/FMcq9
 D5hB9DqBuC1T70oXYobL/liR533OJcoC0BjmjZa2RXZJv7jnWGgyiHUiHvN4/T2gQKZxHRPmx5+
 QfOtV2Djnqo/MHeuBKDP3DMazU6O9Q==
X-Authority-Analysis: v=2.4 cv=B5u0EetM c=1 sm=1 tr=0 ts=691355d8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Nr2CiOlU1OI7hOkqFEcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: thzs2kB_gquhZI--Jgdd8u6OYCfdzYRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110125

On Thu, Nov 06, 2025 at 03:01:07PM +0530, Amit Singh wrote:
> 
> 
> On 11/2/2025 12:29 AM, Bjorn Andersson wrote:
> > On Fri, Oct 31, 2025 at 02:27:39PM +0530, Amit Singh wrote:
> >> Currently, hpd gpio is configured as a general-purpose gpio, which does
> >> not support interrupt generation. This change removes the generic
> >> hpd-gpios property and assigns the edp_hot function to the pin,
> >> enabling proper irq support.
> >>
> > 
> > No, it replaces the use of display-connector for hotplug detect with the
> > DP-controller's internal HPD logic.
> > 
> > There might be good reasons to do so, but you need to describe them.
> > 
> > I'm guessing that there are still some issues in the DP driver's logic
> > for handling of external HPD? This should be addressed by fixing that
> > logic in the DP driver, to ensure that this (display-connector +
> > hpd-gpios) works, and then you should send this patch again explaining
> > why the internal HPD hardware does a better job.
> > 
> > Regards,
> > Bjorn
> 
> Thanks for the feedback and clarification.
> 
> We observed a specific use case where using the GPIO-based external HPD
> handling via display-connector leads to a functional issue.

You are describing driver behaviour. It is known that this part of the
DP driver is broken. There is nothing wrong with using HPD pin as a GPIO
in the DP connector.

> When the DisplayPort cable is already connected and the display is active,
> and we perform a system reboot, the display does not come up automatically
> after boot with the current configuration (using hpd-gpios).
> This happens because we do not receive a connect event post boot —
> the GPIO-based HPD path does not generate an interrupt in this scenario,
> as the line remains high and no edge event is triggered.
> 
> However, when we configure the pin with the edp_hot function and use the
> internal HPD logic of the DP controller, the controller correctly detects
> the HPD state after reboot. The internal HPD block generates the necessary
> interrupt, and the display comes up automatically without requiring a
> replug event.
> 
> This behavior aligns with other Qualcomm reference platforms where,
> if the controller’s internal HPD is available, it is preferred over
> the external GPIO path. Using the internal HPD provides more reliable
> detection and keeps the configuration consistent across platforms.
> So, this change ensures:
> 1. The display recovers correctly after reboot when the cable
> remains connected.
> 2. We leverage the controller’s native HPD interrupt capability for
> better reliability.
> 3. We maintain consistency with other DP-enabled Qualcomm boards that
> use internal HPD.

I think, this DT might have been purposedly written in order to show how
the HPD signals can be coming from the GPIO pin through the external
bridge. As such I'm really reluctant to ack this change.

> 4. edp_hot follows the Source device behavior upon HPD pulse
> Detection [VESA DP standard v1.4 section 5.1.4].
> 
> I’ll add these details to the commit message in the next revision.
> 
> Thanks,
> Amit

-- 
With best wishes
Dmitry

