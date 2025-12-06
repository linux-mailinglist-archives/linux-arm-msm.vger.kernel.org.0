Return-Path: <linux-arm-msm+bounces-84531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACFCCA9E33
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 03:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3819C300C5CE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 02:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62B62264AA;
	Sat,  6 Dec 2025 02:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gb4QUNNh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4aRuxTO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557BA22AE7A
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 02:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764987077; cv=none; b=BJR/LIiApFK3Bp7gFPkmk3fECARiPtt/tcDC8pQDi/ZGrjwMrhlha05bDRnPSXwc9Lt1e4oW1/oradfqw7RdD+mLtVpJFDX/yYtRUX7vSXUQk//8OiEkgtenqd2YwfXjCyqampNyTC2nRLauiw2kM5/IlE1+gBrXKRH5Y1GsWD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764987077; c=relaxed/simple;
	bh=x+U9tS+e0THz8xr64Aoo0N5Tbkttz6dX6tU5sJ8+UsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ssq9RrJjiuJkIcWBZvxO2lwCG9uwrPI6C3miFlbMLf6E7OWA9sSSjNXMYSiahO96wP+XDlPF83opYnHu7Z7RPEwv2j5vYYCrBdm3yuESoelDu0T/7r/bONDtgz5sWtFWy7i1+104Y1yUJHkSJx2B/ivMkIi87kYtB0fpRXAkMc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gb4QUNNh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4aRuxTO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBP7D1075766
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 02:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HvNQOfKbO9RFDYeuz2gybVEN
	gK3IMZF711m7vFLClV8=; b=gb4QUNNh31up/8ecEXbcpv6opENxEppOfpQ9m1uP
	0GtRXL7GEm6M0s/P+BoUeKkmOmaFOfsFYKwwXYpf1sCjXwIQCRLEJii5GyXPz74B
	TD8viEvlilA4w32eW9JTHLVXEjl+C0uMo+BhdDRHy/kIdx1/nZmP4V328Bu7VouM
	HdQOqeCWZzr2yEG4ToB3nt1+VK+FB0eo+ttrQ1npLwPKoUA7uOFW36AGZUXedL0t
	wzt42mpKl2f/SZyM43uocrHEO3YFf7/1eKIoEVGHyiayWwkAb/4hQs3SLklzE8VE
	Ff7hGhGAuhmi3ajioEkcnx+TYQC+6lboSh3nA//2pdZvEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ngsrsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 02:11:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b6a9c80038so20411885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 18:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764987074; x=1765591874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvNQOfKbO9RFDYeuz2gybVENgK3IMZF711m7vFLClV8=;
        b=c4aRuxTOFpaD/6jTruXCtte5OSPrEq+sybRdVxMF8V8Gi6US04aYC3hwA2U/53tA8N
         aoRoB+cxZEbE+MqD+zT8cTFZrVrBwlog929q36V16o5c7pOeuJ4Kci2ngnzTFqgd5LgC
         4tUXgKOCx1SdV8FylgynN9Ve2o8aJL4uF46ghXDXU/K4mWrfrUqlcoejNcRcgqHGH8mo
         CFMAqGukDuiwxVMmkka4kyIpujxZ5d5WPWJCXY9eKpmvspODUEYQSmoycEy/Mr49PkCZ
         kMe4kNryRclB1BzRxrcY2x0w2+UkR1h2jUPwa0pHJNx3kv7Vf7O+nWa09dbksTR8mXXa
         c5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764987074; x=1765591874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvNQOfKbO9RFDYeuz2gybVENgK3IMZF711m7vFLClV8=;
        b=mpv4Buc0PZCYee4qo74Yc2Wg1tmm3LKix/qhCWNG7qEUAcIgzb+cuWJqMF79jsE95l
         89C0oEhlWq6YFZfsH/s7ZbdRTAjzETlinAhexK4r8GikFqDt4mWwcjCHsySUPi787Hwx
         6etiZrMj3PFDE7Sx+ISv2x8Woh3zuf9YziAxCqhaDrZbH7BiEexlCwb3GaXSCzAtVYN+
         LKug3fe8mZAjMZg58ILSI4xqAoVNBOh+qRzOHeDZV5aANk+1UibSCI33lBeU5Uyh05UL
         f3J/uU5sIr4cB1zfAuHx3thGImokrC1Y6gZMu+NUytywqb4WSxQ/VYxzbwBtHGuiLZYE
         vX6w==
X-Forwarded-Encrypted: i=1; AJvYcCUX+i3r8Uvs9FUjCkNIHDzxLavQMEqs0Bw/3n6hsM3S0Hq6g/1BJjJdHgqAXLj2ip0tZ+twIzXe43sqI25R@vger.kernel.org
X-Gm-Message-State: AOJu0YyMtN90ntmGvftKIvRwzr6ydVbI1n6rczoId0+GBAckJ7Mb36xa
	EzVg6Yu0wtCbjZLpljC+S9kqMS9FFqSIoILPrcvpZSwo0c5AxFj+J9DaPr5hbBcKEU9RNc0G3gg
	5i4qFfTPMNl7qhtWRfujnctGM6vAPAUgSUazNkuXTzOPydgK8WL9AC9Kl4pB6AP4IeIVy
X-Gm-Gg: ASbGncs5B7fPfp3RF46rcEkzwy5wPxHq1MwFbmoT6K21QsPFd84c8a7T7BR9GtURckK
	S8WUnkTogMpAmbebaGLtf64yAVWNOGUO+v4w1IM481SJNIhMi298jjgP3TBu0R6iN4cwfp9hmOP
	FEwMupHV3URtUi9TffAv9DucQ8E7+vMxNtZrBmh7YmtC+Wv5RQFyowYVZXA/+AX8DCtoTtO+4ov
	5cef+zn76DQBmlZAgjpkHksOrbXbPS8yiEOrKtN1KnWy7rbrfAmTTQycYjU4jIlCuG3nas6o7hc
	WM59KHF4dpZmmhY3LT3nKs+BrAygVos87dCPHfyKrYD0jE8GvBn+f2YIGjyzVi3piHtGIPVM0R7
	MQBiqGqjezXzVvSguY/o20b2li8+nJAGLMz+FdJxajl3rlchDjGgv1x0fCtyn6XLJcS19Fsx3Qf
	+4je+5j7kKnv0oFXwxdPSfX/Y=
X-Received: by 2002:a05:620a:444e:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8b6a233156cmr172726085a.14.1764987073947;
        Fri, 05 Dec 2025 18:11:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZPNMyTxsMzxfytNMRMe8+8/wii7QnaK+HU2IBoABH8YBoCv8QBteXW81W3/Io0PTJGnBKPQ==
X-Received: by 2002:a05:620a:444e:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8b6a233156cmr172722885a.14.1764987073443;
        Fri, 05 Dec 2025 18:11:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e4d7sm1979656e87.46.2025.12.05.18.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:11:12 -0800 (PST)
Date: Sat, 6 Dec 2025 04:11:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v5 06/12] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <jj6kmfd3cr3k4hiylzkhrwzt5b5vrrndcfoo347n3eyzj56tc4@66fv5bagydyz>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-6-80c1ffca8487@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-judyln-dts-v5-6-80c1ffca8487@postmarketos.org>
X-Proofpoint-ORIG-GUID: Qw1O5cp987txRr6ZlO4KngWlJY5cDFjq
X-Proofpoint-GUID: Qw1O5cp987txRr6ZlO4KngWlJY5cDFjq
X-Authority-Analysis: v=2.4 cv=DrNbOW/+ c=1 sm=1 tr=0 ts=693390c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Gbw9aFdXAAAA:8 a=xAAzZAXW8IgVFa-X7UgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNSBTYWx0ZWRfXwHbJYXQpQnXv
 OKr1qXVf2Hv5/WLIq9lKkbpLVcdGsUyZFcd+a4HMAxx150bU0I2MI4gLtnnb/8wBv/XttFJqXOs
 z1xZn5QXZLgClCcWdcKQ02PbXBf9WvdnW3lSMFWeHzmR+s6qCJTKNkt6zK0d1TrB3XDS0YrGIZL
 bhkbizd4d2Abg3/8AMptkf9RGcmijhNI+hiKDcWrvfSgYmHKjiFyObKwAWGEmqu0+t83SBqZVEI
 u8JSf9KEPe2C3oP9aSVkErh9ic4xANDHQ9MTV5YGlXk8pC49ke4l/RkmDVefuTzw4qbteCqIcgj
 iXpse5+pEOhbmbzPySL+dgnpCWokwSzOWw9Y5OdopKIM+OulWTtbOyA3wPw2N1jiXIqb5umWMfo
 ej3aR33kRoS7QJ70X4v0X58UokF3Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060015

On Wed, Dec 03, 2025 at 01:40:55AM -0800, Paul Sajna wrote:
> Add paths for Qualcomm firmware, including:
> ipa, modem, bluetooth, venus, gpu
> 
> Enable adsp and cdsp nodes since their firmware is present
> 
> GPU and bluetooth are confirmed working, others may need more
> testing/fixes
> 
> But regardless they will need the firmware paths specified here
> and firmware added upstream before they will work, so might as well
> get started on it now.

Two separate commits, please.

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 20 +++++++++++++++-----
>  2 files changed, 25 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry

