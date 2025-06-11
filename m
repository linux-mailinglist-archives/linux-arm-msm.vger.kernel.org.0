Return-Path: <linux-arm-msm+bounces-61023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10660AD6402
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 01:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A13443A9D19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 23:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1412C3249;
	Wed, 11 Jun 2025 23:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9xHw1ko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE3224C68D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 23:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749685835; cv=none; b=hFatj95EWpLbFfL+DUk1mAgA6rWn8uBVzGvVafhCD1mdQXITQ/C9gKqiJgJzOkuMt6nADPzOZ6ULptNavT+NepOX5jzDUBbdgaYQSgdBckxjiVtqfxBb4zW5H7NNh4+bjHhp2XGQ4L/ylNawlv5z+sm8HA7XXfHhnfXNaLF/qAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749685835; c=relaxed/simple;
	bh=n0e7INgVxB4HR0E5dtVq3apkvTC42DhlTc85mp9u8JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe/k7d9cWg8bpoay2Qp1L/YK3i+TJCuc/khnAIQdGN+zWp94YQ6BUaQ7MpaUEDB6kBjczh4b0henQNLl3M25yTaacyMv/OmgodMFKu5ImePVM/FzEdo6qTy4ePZvR/uMxRDq34HU2OO6pD/ZZQ0cCoY3SNQYqv/uiepqhJpq+pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9xHw1ko; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BIiZWB011156
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 23:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjKLYbO95DLdnG7w+lxTMGvN8HI3D7bK+1IxSfQZCLo=; b=X9xHw1koVLpFyh4G
	fIOl3QFoLERch0lLyavYbajddEtmQM9Hg5RTa1iDpIPaSCHOKok/CVhQHuoBQiwx
	jdTZz82EsAsBB/s9jYgjZ8DxVJW6lwlgkMVsyXhEarnSSBgrkV9vJxzX8JQGUVAE
	YJbe6Dnvxg3DtbOm2Si0+06UlD6Ca60NEsUwDXV4SejyIzZidJTqJEmz/RT1iQQg
	aRdS47aY2uHQ9cvyJWMdCw0axk/caVkmtWN0Hm+BYjllkWP5WefiMJDBz2vC1OLa
	QDv1EeUnO0iILYZNc8KKYdX3MFzVffc9dhZ+SeLfTuBGmy8qU5S/rmQQ82qHEd2j
	Um1Tqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpxbcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 23:50:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e6f5so97758485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 16:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749685832; x=1750290632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjKLYbO95DLdnG7w+lxTMGvN8HI3D7bK+1IxSfQZCLo=;
        b=oe9aMlXddFI9QguYxHr8Q3jZc1aUggdkTH2yQmnSln9He9CM9Pw9rXhjd2X8QjcuMb
         d7sUuB52+O5HuC2MffsUq/fu3QkTT1nOhTZu6uglTwftmWsfYlmJU+pO9kHIe7cwomIR
         efdxRg/C/9IGzDRzi+Ge8ys+mwUCV+Wfx0Ecnxl2UNW75R/1xwcWipWvT9DrKTVnG4nt
         ntB7d/wl/QOWZzeiAQrgyAqBH8xYFwnlFsPtaQzmIxb/VZJnVJlme6Z3Zncdczf7K4Rw
         9+Wx9OJBLd1SprAGFOpGyqrQQciSaymXnFrD/0ncORCmVDuaFpGeXVITbdi5MtB8kd96
         EKYg==
X-Forwarded-Encrypted: i=1; AJvYcCWi3bvJ6Z9ZwIjZWC3U0bjhV+q7B50q56vygQMdSYA9N4zpeVYTBLfAbDYQKqRYI1CSo6iAitb/C/C0QZVZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0RB3Rlzz1ChXs6AOeVgTLLuCJbb1yfdr0fx5e54O/z5+YtMkJ
	ehrxRAoR031gqA7RKizH/R5y9+XsiXKMRVrch65iXJqXJcRZH0x9xEiLEVbYyiVJkUl6r6eAAsw
	K0AfYl6ec7UoleRl/wBa3nChuU3KZiXehFVZm9wA6Yxuvx38MAmZrYw6wYiFddd1LLrl6
X-Gm-Gg: ASbGncubnPKGdfQ6ntalo9aBpMo9kBFLekGqLOPnCBGXrIQsqFLpnMmhp1FZccFvm+o
	S9JRiScTgnxVrKFbIpAgjb5i8tAP64TEVlG6mF+Pzn89qnlXnbMWRyxTLefZNvztCoXjFFqgo4r
	5BZj1+122bSQvX617oXVM/qq4LVwWAVkwImjho3YVJuX7x+rOaTUoQ95RhFkd57+CkFZSAGmMyk
	g0CWu05llsipiSfqRfAdag9iqg6cSnO1z+m3NyPWv4rGQ3ZX7Sz0BDOFZ2n+91Sr0bhLhIarpKt
	8rkBfpyk5rjIWHBwiejPupaIs84yBTtv3GrSazYYm8cQ9rs38w/H0XZFVSAhMX4OAi2E2jczUib
	TJcJGy1/M7kGBvs9yl1wNcfEJoX6PfS1bcUI=
X-Received: by 2002:a05:620a:3195:b0:7cd:31ca:d76 with SMTP id af79cd13be357-7d3b2a58bfdmr198251585a.33.1749685831927;
        Wed, 11 Jun 2025 16:50:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFseGq/J3dqksP8dXd/cymzXG9fmBAoH7irwZknLQOdL01xeRG37+7d7pXMTZO5pGH7IJ6dww==
X-Received: by 2002:a05:620a:3195:b0:7cd:31ca:d76 with SMTP id af79cd13be357-7d3b2a58bfdmr198248085a.33.1749685831517;
        Wed, 11 Jun 2025 16:50:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3304f39csm321391fa.20.2025.06.11.16.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 16:50:29 -0700 (PDT)
Date: Thu, 12 Jun 2025 02:50:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v2] dt: arm64: qcom: sc8280xp-x13s: amend usb0-sbu-mux
 enable gpio
Message-ID: <bjh5q4kmctc6umyg6iti6j3el5iuaaweqxqk2mrzlj35h263lc@wkdecz3pgltc>
References: <20250610-x13s-usb0-mux-v2-1-598454e6ad64@oldschoolsolutions.biz>
 <aEffYQND8eUgJbua@hovoldconsulting.com>
 <64d963bd-b38c-4f14-bb1d-f7e89dad999a@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64d963bd-b38c-4f14-bb1d-f7e89dad999a@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684a1649 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=lRGrZvPa4QksXueXqpIA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDIwMCBTYWx0ZWRfX0Vs1IG5Sy1O/
 TsjFGQwm4AbHAzK1YoLA0sLlD3njHe2TGNkdzhjaQCVD9LXKcexqMasNxnOep71v8PE57er0Fxw
 A4baCl6vUhDhXPkpO65ESJkwLIX3g0jus/vWm1rHHjioZWjV9i31Q8+kUyJFRtDtwhW6GD5Txgx
 u15XC9glZ4t1b3Yu4GLnAMNNMZfeBFdN2dvEvcpGacUutknTjsiqam1u0ZJe7Khr2TR3+fg7yQa
 9NpbKDIufBPiGxHtWHr+SIlVZH8qZJk66HXsFmLMQXiAziuv+3aNSRT1Wy8y1sUVIyzB2IFnGAX
 PqU+ilAcQo4cRXvby4XRKyjKC0ev3B8/WCH9bAFkRHV7J3p/CxXwWmwDn7hRMUiDDH/ibvpPKPk
 YAVUYyAhJMrbGPAwRLayLHBaK7kywBM87TmKD0t+5LqZTmAgeyBYyNKwFgEIZGzw/0h8cZ63
X-Proofpoint-GUID: yN-rzpE120z8WO3MWrSUXhu5h4GH0Sdb
X-Proofpoint-ORIG-GUID: yN-rzpE120z8WO3MWrSUXhu5h4GH0Sdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=715 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110200

On Wed, Jun 11, 2025 at 09:25:20PM +0200, Jens Glathe wrote:
> 
> On 6/10/25 09:31, Johan Hovold wrote:
> > On Tue, Jun 10, 2025 at 07:04:46AM +0200, Jens Glathe via B4 Relay wrote:
> > DP alt mode works on both ports of the X13s and "resulted in
> > gpio165" makes little sense so this commit message would need to be
> > extended.
> 
> Well, that was the problem. It didn't on USB0. without and with the 4 lanes
> patch.
> 
> Observed on Windows Dev Kit 2023 and X13s, what prompted me to look deeper.

I have verified, on my X13s (21BXCTO1WW) DP works on both USB-C ports.
Moreover, according to the schematics that I have, GPIO 165 is not
connected.

> 
> > GPIO 101 *is* the OE_N pin, while GPIO 165 is not even connected
> > according to the schematics. The mux may still work after this change,
> > but you'd be relying on it having been enabled by the boot firmware.
> > 
> Schematics trump any other data, of course. After a lot of tests and some
> wild
> results I could narrow it down to the display I used for testing, iiyama
> XUB2792QSN.
> It works with HDMI adapters on ~all other displays I have - with and without
> any
> 4-lanes, lttpr patches. And the original GPIO. The issue with the display
> appears to
> be something linked to how negotiation is done by it on that specific port.
> 
> Do I need to do anything since its already NAK?
> 
> with best regards
> 
> Jens
> 

-- 
With best wishes
Dmitry

