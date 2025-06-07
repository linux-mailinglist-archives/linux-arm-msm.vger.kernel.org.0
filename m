Return-Path: <linux-arm-msm+bounces-60535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4FBAD0FBB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 22:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7FEC3AD77B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 20:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFD41F4192;
	Sat,  7 Jun 2025 20:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbFN71i8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7681F0E25
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 20:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327767; cv=none; b=X0bCO0bPg3/x2RX65vj7LzK8HlShnogWCo7OewiJnfCA33aywks+L0t5EoL6AUNvYJuDQ3gZ1dq07ZNZLI6/opaS3UlUMQJUFZ09lYACO4GAUA+ABgO4B5LMa4au5P3BwCj4ztfWQ9tAo2/h241LMowD85rru0l2I9+aia0xpxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327767; c=relaxed/simple;
	bh=AiZtyPMh8GiT5mWCJrUirjBFy0Orj4P67aITlzgsZwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHIJMD/1KPaa57SI/qCVZln2FUYrcJCJ2b0fqzJ2hg5wuoYCpQNwDN7T7JT4VPDDCjpNRJS6gm9jqp2U2FJjJjabGkrVGGrjU2CLVi4VHJpMz6fu2+MyVAXGn3VwmriQY9l4iy5AUbQxWe0e6KN4TIVM0Ttie3ptIT2oQ3XwWIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbFN71i8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557JZRB0026968
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 20:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9fQ3VYWbG/BAlQYpAZbVI/9a
	TrC0Es4DqbImtN5V4o8=; b=GbFN71i8pj5WsNn36/7wqa6F/WJHtKw+lb9gseEj
	X1/7nVmS/faKqnMZMM5Ruz5ZJB42Xb0xKmu2BJ/9NM0FJa4fQKscZXDQKfRD98AN
	WjRAOKuynpFQQN+QQgwZ7T3rmLQhk09e/uNKc04Y7TKHyJ8lr00DJWj4AbtlKJBk
	1UTCTiIMWdPkR4+njEmUhOBNe2NPu2K5Q82UwSiMYxQ5AZcfyq//pJC3y8rXVhEK
	MGkHVA6VUTfD84wZ0brbX3J8WulBfMuDAAdK232OEm8WpCdHvabPDDnL1260pjZ/
	NUBbQu3/Y1xAVa1ZxQYLVAHOkXaU506ynu43FED9JOSHsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j170x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 20:22:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d2107d6b30so411829585a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 13:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327763; x=1749932563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fQ3VYWbG/BAlQYpAZbVI/9aTrC0Es4DqbImtN5V4o8=;
        b=WCf6+YQg77HwXj5v6cQAE2qmBd3SOkXnLKaWY0GqvkVpuwS+nfIg9j/mG1g0+u/3L6
         37DePH0kw5OW2yj48RtkPmudkgHS2QtdahAWc+dJRlEE8cAAcHjAeh/l7OHfVDgyYwwm
         aJDu6BR5BEcaMw1P3b4L7Ao/uBTr/dVqDOvcKiGLomtKJ3UF3SSM/92dMiJkNIyM3W9W
         3LEkTLNPwFRQCVhO7Jg3lTtwvA+AUwj87RHzw15pGtRT/7ygPSLxUEk1gynnyXmk2UY3
         DhH7yFvteKpZ50bdJwBxST5HIqF0JkZe+qZe9XsguNKB3umVM3retfC10KtGdwJhY4XU
         Tzfg==
X-Forwarded-Encrypted: i=1; AJvYcCWXJN75/rSrA3sHbKyshZaRgJylMtXWmoEbVgUjXMDW0dolrb1VUey17Sj1EFXT+4+lNjUNUa09a0E7A0vG@vger.kernel.org
X-Gm-Message-State: AOJu0YycxaPp2/99T24EfJUZ3ppdxkk363dcFkraqUoPmWr+XRRcTLL3
	UBPDi1AwHzR3X14s6DKJMdIBhLRSl81n/EoKFk2h7+tNqvHRkqH2Fztufwh9qwIABMacC970dG/
	bEP0gR0WIoYIPj5ojQ9OnsaZdkPhMiXFUbBkKc3RO5j1DZ40fwppeZP5/14UZvZTxCmGK
X-Gm-Gg: ASbGncsCXsHrNjViRVmY9yjfVCsrCS15QkJ8Jx6Wi4NgwOJzTfwXOeCzAQdvZYSj1ze
	tQARv7tE0vp92sYIBHrud2g8Q29d/QP4xD8eAwWBDOd73BY44qo6KrA8MN76l2iCV8ZFgAk1b9I
	eKYe+25Ezbx6o6BChndwYaWJT0bGMOvBPCHY5zpihVfOXDFvuN5LCTv4rSwdFuXX0Wlc5hvbr6d
	5JwVGEmB+wSt4pfZb4legqWr/6C2kK1N29EsaokhkKXYYA69+bIEwGeLmqOEyPvUi+V6hUlImrN
	tjiDWikiyK/tz4nL7W1iNUa1G+IqVeohNKcM5+ynG6a4fvb3JiycOJTT5pH0ZEkYeVHvXerJYkI
	kR1eeIvIj9Q==
X-Received: by 2002:a05:620a:29c9:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7d2298d6f08mr1252521085a.44.1749327763035;
        Sat, 07 Jun 2025 13:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOXMP12xf26oWOoo8b6leKG3z/1PZIJuLYN/LTC+bX+rKHsCW3vr6YCquXQWmxLXKmHYFGRA==
X-Received: by 2002:a05:620a:29c9:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7d2298d6f08mr1252518385a.44.1749327762649;
        Sat, 07 Jun 2025 13:22:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731a17sm603347e87.231.2025.06.07.13.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:22:40 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:22:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Prakash Gupta <quic_guptap@quicinc.com>
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: iq9: Introduce new memory map
 for qcs9100/qcs9075
Message-ID: <n3et5jemuiin5c5pwi3r5gycnicxdhrwbmxapnsg2arlwabxcv@7b734qnxwaof>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-3-quic_wasimn@quicinc.com>
 <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
 <aEATe3pi1SsfZVI3@hu-wasimn-hyd.qualcomm.com>
 <q3hzryk4s7jd4kyavcg7s6d3oyzfpnjy4jhpeluvnikiglbeng@r4ydugwidgv7>
 <aEBzNnnyqt/aZ35r@hu-wasimn-hyd.qualcomm.com>
 <aEKnstzguH7f0A92@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEKnstzguH7f0A92@hu-wasimn-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfX6+PaHu4VxOB+
 wR8L6hDzmjx5osv5Gs7p5KXnurG+gdTaDuVdkrAEz1sT0UPnSw/qNM1nNNnZW4SxmREmV8Ii7th
 nVkbLZAwO6Px9+s1N+rNf5Q4lYAaXF1f3HO692G1IZApqPJfKXqu3AHcjbvO6eKLfC+VsafoSjI
 WBuJVyb96OiCqYvTroPqLNpv/7Z133ARZ4I9SSfuoAVS+UiAxR1QEP2v5MgMkfGu8TGXLgwYg6a
 r8ZeeaRNK7zMB+H1NPNTiTdjUU0jjiAu891aR4cyWM6VnswPjtQ2ozwV1WniFeeqaaBIdcjonzF
 AxqPhQK4Aif6+OBVG/wYkqD0YQJFO29edTAVRL5A9pMgr4Eka8FaIJ2c8alkzM7yVdXCT/pqqyC
 Br654/E4zDe8ATIUPpUpyWnsjuVOiQPRNS3m8756zAwVswG8gDnPxkQHQ6S9yyutzppazVpo
X-Proofpoint-GUID: hEB5G4o4y7HEOGjx67TIvkCZ7gKIx3Xo
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=68449f94 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=75EJ9CGrmiedGd2GwnIA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hEB5G4o4y7HEOGjx67TIvkCZ7gKIx3Xo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070147

On Fri, Jun 06, 2025 at 02:02:50PM +0530, Wasim Nazir wrote:
> On Wed, Jun 04, 2025 at 09:54:38PM +0530, Wasim Nazir wrote:
> > On Wed, Jun 04, 2025 at 04:21:46PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, Jun 04, 2025 at 03:05:55PM +0530, Wasim Nazir wrote:
> > > > On Mon, Jun 02, 2025 at 10:41:39AM -0500, Bjorn Andersson wrote:
> > > > > On Fri, May 30, 2025 at 02:58:45PM +0530, Wasim Nazir wrote:
> > > > > > From: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > > > 
> > > > > > SA8775P has a memory map which caters to the auto specific requirements.
> > > > > 
> > > > > I thought SA8775P was the IoT platform and SA8255P was the automotive
> > > > > one. Has this changed?
> > > > 
> > > > Both SA8775P & SA8255P is for auto but former one is non-SCMI based while
> > > > the later one is SCMI based chip.
> > > > 
> > > > Only IQ9 series of chips (QCS9100 & QCS9075) are for IOT.
> > > > 
> > > > > 
> > > > > > QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
> > > > > > inherit the memory map of SA8775P require a slightly different memory
> > > > > > map as compared to SA8775P auto parts.
> > > > > > This new memory map is applicable for all the IoT boards which inherit
> > > > > > the initial SA8775P memory map. This is not applicable for non-IoT
> > > > > 
> > > > > Is there are platform out there that actually uses the "initial SA8775P
> > > > > memory map"?
> > > > 
> > > > Yes currently sa8775p-ride and sa8775p-ride-r3 are using initial memory
> > > > map.
> > > > 
> > > > > 
> > > > > > boards.
> > > > > > 
> > > > > > Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
> > > > > > introduced as part of firmware updates for IoT. The size and base address
> > > > > > have been updated for video PIL carveout compared to SA8775P since it is
> > > > > > being brought up for the first time on IoT boards. The base addresses
> > > > > > of the rest of the PIL carveouts have been updated to accommodate the
> > > > > > change in size of video since PIL regions are relocatable and their
> > > > > > functionality is not impacted due to this change. The size of camera
> > > > > > pil has also been increased without breaking any feature.
> > > > > > 
> > > > > > The size of trusted apps carveout has also been reduced since it is
> > > > > > sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
> > > > > > carveout and its corresponding scm reference has been removed as these
> > > > > > are not required for IoT parts.
> > > > > > 
> > > > > > Incorporate these changes in the updated memory map.
> > > > > > 
> > > > > > Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > > > Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
> > > > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > > > ---
> > > > > >  .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
> > > > > >  1 file changed, 113 insertions(+)
> > > > > >  create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > > 
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > > new file mode 100644
> > > > > > index 000000000000..ff2600eb5e3d
> > > > > > --- /dev/null
> > > > > > +++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > 
> > > > > The naming convention is <soc>-<something>.dtsi and I don't see any
> > > > > other uses of the "iq9" naming.
> > > > 
> > > > As this new memory map is common for IQ9 series of SoC (QCS9100 &
> > > > QCS9075), so we have used its common name.
> > > 
> > > IQ9 name is not known or visible outside of this commit.
> > 
> > Are you referring to add the same in cover-letter?
> > 
> > > 
> > > > Once the DT structure for QCS9100 is refactored, we would update this
> > > > common file there.
> > > 
> > > Can you refactor it first?
> > 
> > This refactoring involves changes in all the ride/ride-r3 boards which
> > are based on sa8775p & qcs9100. Even though we had sent v0[1] but we still
> > need to conclude on the final structure. Since, ethernet is broken in upstream,
> > we are working on its fix before sending another series.
> > 
> > Hence, we want to proceed for iq9075-evk for now and once qcs9100 is
> > finalized, we can use the memory-map there.
> > 
> > But to avoid this dependency and to proceed with iq9075-evk alone,
> > I can rename it to qcs9075-reserved-memory.dtsi.
> > 
> > Let me know if that works here.
> > 
> > [1] https://lore.kernel.org/all/20250507065116.353114-1-quic_wasimn@quicinc.com/
> 
> Hi Dmitry,
> 
> Shall I proceed with qcs9075-reserved-memory.dtsi or do you have any
> other suggestion that we should discuss?
> 
> Aparently, this series is for qcs9075 only so using exact (not common)
> name also aligns the naming format.

Squash it into qcs9075.dtsi.

> 
> > 
> > > 
> > > > 
> > > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 
> > Regards,
> > Wasim
> 
> -- 
> Regards,
> Wasim

-- 
With best wishes
Dmitry

