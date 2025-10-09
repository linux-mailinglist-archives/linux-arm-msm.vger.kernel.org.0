Return-Path: <linux-arm-msm+bounces-76654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA3DBC942F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 15:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7340D4FB669
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 13:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999672E2286;
	Thu,  9 Oct 2025 13:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jS2WKOgm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264452E7F04
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016071; cv=none; b=lq9USgNxvveSJLb4fJv3QEFk19evhzH57HC9PLVm6XTI0etyyVdiLhIK17cLDqHhrYv9UAqkMCXHhaLNP079B2mLPExdlC2oXL36tIDEVeJ3CoA3izO+nIWnZVshmtCKui7z4XpD39YMWmlaNlOfQc6XANDIQDbNhVX18zrTebk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016071; c=relaxed/simple;
	bh=CflrvSQqC55Xi0uH5xmW2ZjycV8l2e80wpk9aEoXhME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irIHqXbb8gqtm7bfD0mptXHwzwD5Xpek+CORG645ZFynLL/wy/txuS/ZSVYrcJOKPmFUO46S+sAfSmdmG0zQXM9M9hsiux/0aZ+UGTp21kjzgo6og6B6h36ut8sDJt21LiFzgyAoR+SFF6WS2DZef/hC/7/9oQlsl/TUIWf4zfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jS2WKOgm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EM3Q023286
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=waw7/BuUtSlk9S6varyqbKPD
	0DkWdx5X+6wL+I7Srvg=; b=jS2WKOgm5Aq/aoIoCdC6qCG0oajAKzEYIJjyewgc
	n+sxPwju2jNt56GsjBbjN40guRNMlYdjRNTHh3frfUl2Fb0Kd8Bhaf4mfvqg5kjH
	2pXMXLMFITJb+O1RyUkKSzbm16b+hGYRSYuf5O5Xx4g6abmKJt1YghCcLyRUWnJB
	WMbNr3JWnsvXaz9fsxFLi9xtpkiojNwKLANMLT/Zzh/McV2poSnxeVpwBR/sBCPm
	tDhvoDcZekonznD4kz2RZ2+zFip0//LVck2mFdSQGQkPqwmHYwO9niqlF9vXray0
	coa3E31UmDV73Mhk/ky0AFhD4eOBtJtJFUeMAQxrM2wyDQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m2xjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 13:21:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de5fe839aeso35012641cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016068; x=1760620868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waw7/BuUtSlk9S6varyqbKPD0DkWdx5X+6wL+I7Srvg=;
        b=sUaJVtggOZuEp5Ank+WGVsFyrvEcGl4ga+4zdtj23/zkjaNcTsn2MQTx8AeWw/i+/3
         GCCAdS2ZD7A9V7ju4JnRgTo53a73Ngr3YPrm7KbXK66ef0cskx+jmTSYz5juDQZG8R3q
         5dfkM4s/ECTNhoXxGI0N643Kau5qsVlKTYBPw3ZQyxZ7LJ1GqfPAfaktRZpPbjGOlreo
         4X9rioZvMFBb0ZytZURtzimzDZ7VbBzy7qSD+rEFpxBsDYlQru5u2XXQDo9l2y+N4MoG
         d5HT/8+nKElxDNE1PzcE1lWAhRHfBKRfetbKofcw8b2BKtNImoTt+tXTu/TG2wR+nUgV
         QAsw==
X-Forwarded-Encrypted: i=1; AJvYcCWBKdl1j7LMiscFAii6FjvQRPn9i3yLEW39jNMiy5B2b9JjkxkCNCeKY4Go+iy3Wf/gjOPxmyqLywOR8o8h@vger.kernel.org
X-Gm-Message-State: AOJu0YyOEr17Em9VZ27WL39u1hNMrEpis+jUG7rzhj9tYwxxuwAg+U5N
	ixmzHAUWkQgBzV/Ygp/onLiqzp2l0OQF9pfLtgDoABWquoLAE2t/5cqsJYjbidGScOX67JnfeKZ
	o1DKlIJ/S6a3TFm0h+o8hCJIj1KcHOXwepNFI3EZ2NSx6SyScCbcaFVE6wT2/Sd9uRRbh
X-Gm-Gg: ASbGncvtwSyXxoi0v0jRkxZZvfRKqEoUgUNpy6dFH1+ThpYl3CkOKcRTlqlW7nGIK/v
	1Xlwk0XViFD07mz3JHdE4V0BR/77mkLw7DWaN/evc2X+NcbDrB24gAIGHU4nkqrJc4wLrCc24lQ
	QJQSHDvCa+bvelg8S+QpB2ZCSk76+FaV0zor60z+XwUgp30GB+/g3PtzfpmdrydJv0O1QH3i+8m
	ckEJveFMBMQL7jz/FPUpnEeVYIn4hJhrhtyMzRXyDPUR5WhK6m7r7B4f+AzFY7YCuadE8F9aPjW
	Rny/Y30+DWU+qtKvFpEJb17CrZbRjEiUtBPRC0vghrnxzNUWQGGIJBQwgkP3VRogDm/TLjFRtDl
	FSyUx+GzT4Xkh/PUg1pMoS/CQuHJNNIHdqgfmzkxSgdCpBp7ltUl3I+yM+g==
X-Received: by 2002:a05:622a:11d5:b0:4e6:d2d5:c7e8 with SMTP id d75a77b69052e-4e6ead767famr97687901cf.83.1760016067646;
        Thu, 09 Oct 2025 06:21:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu0n6rRRsmUXdCk2v7oNX+QOVKtkYVegxJUOUjhbLvLoTCMRKVA3rX85gHWp+4lwdo4BWRLw==
X-Received: by 2002:a05:622a:11d5:b0:4e6:d2d5:c7e8 with SMTP id d75a77b69052e-4e6ead767famr97687491cf.83.1760016067125;
        Thu, 09 Oct 2025 06:21:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac22780sm1052707e87.54.2025.10.09.06.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:21:06 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:21:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Message-ID: <bmsxmwfdwx7wlmngaqpvz7c2nudcoukspkxgq6zqh2mdlolfxg@fsdbafotp5q2>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
 <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
 <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8HswsODOQZKw
 AFGr3Wu+N+3m2ZpgxJi3To4bAPK/IrG9nTOiLcbcVhoM9YlsSQMymZaLCwrrMhLiCVmyk4riFoP
 6RSvCvL0U9OSP+6U7a2jmHHwS0CGqtjyDK78mgSRtWEw519TnTDdsEvqyX4lw7k2MibOLRzWfT3
 UkYLOceRHo+DDSaBwPm5tvZA36z6dUjmeE9IMSJcCeAH5XJIm/4rhVJX6726QcMV8JNKKLvw++i
 cNCV2qMNGRcphdUcbOnfbBHCTIJR4yxfU80xZC0OCl6RWwKB9+joPdx+HwwGwZx6T0DXSs8FtmP
 qEZ7CKTzUXW4VHLhHC3HWRoThfoA3SuSayJqB6hbhD2yRDt+5pyLXAtQNLApLgsAKiRYWVqF3t1
 ft00CGBIOFKBoLnUdqLGhl/GI4JjIw==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e7b6c5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=qNVazfFkpqTu88eF0ZoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: nUerHptRBOUFCOs9b7baopFnE3hfnsZk
X-Proofpoint-ORIG-GUID: nUerHptRBOUFCOs9b7baopFnE3hfnsZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 10:51:31AM +0200, Konrad Dybcio wrote:
> On 10/8/25 8:57 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
> >> From: David Heidelberg <david@ixit.cz>
> >>
> >> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> >>
> >> Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> >>
> >> Signed-off-by: David Heidelberg <david@ixit.cz>
> >> ---
> >>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
> >>  MAINTAINERS                                        |  5 ++
> >>  2 files changed, 83 insertions(+)
> >>
> > 
> > Please also describe, why it's not enough to use defined compatible,
> > samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
> > panel-simple-dsi.yaml
> 
> panel-simple works for 'dumb' (perhaps a harsh word for 'made with
> just the in-spec DCS commands in mind') panels, but Samsungs are
> widely known to require a ton of vendor magic

The question is about the _schema_. I think it's fine to have a driver
for a panel covered by panel-simple-dsi.yaml.

> 
> Perhaps the original change was made with an "oh it just works
> surely there's no drawbacks possible" attitude, as the panel
> was left initialized by the bootloader

-- 
With best wishes
Dmitry

