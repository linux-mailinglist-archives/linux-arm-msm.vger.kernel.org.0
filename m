Return-Path: <linux-arm-msm+bounces-99359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIt5MJB1wWkQTQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:17:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5840D2F9AE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93AA03178C7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB56E3C3428;
	Mon, 23 Mar 2026 16:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXANH8GV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSqn8Z2B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E143BE64A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284324; cv=none; b=pdIR6j1JQM26dT4lSHh+z5CmXhR+uXvGL0sTKZUxkB7B8bkvL4sBY3zflwOJrplXoxeTs2NU+y9m6ow2W2xQZp34TMtmRnBAncEr1Q0H8EXddAI0lvlqi9Qq+L7/mpyV6Ejz78leuup007R5wImYHJGVbTEHjr0S17LdCV2TxqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284324; c=relaxed/simple;
	bh=0AXgh7r8UHMnA9Zqa/LXkVlVLU4WWT6w2XAUUJqorWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUyw6ynh0wdphbP8wKz6sz/p5yN+WocEceO3p/3y6TM0vtM1HY3TDbyrovxYuLDmXMKg+vRC5id8ioDm5agutBz9DiRTzojJKwQ2Kmi+4hMZ/1IQSdtEgLUJQq8CXlmfoDJYqvCRLBrmV/m1yCi1DusNMuGBR4LCjEFyKFB5Ttw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXANH8GV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSqn8Z2B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGSuC2827954
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kj+XAZN1TFt3Nwfgt300eR0N4IQOJ3Hc9ynUXTnwTp0=; b=kXANH8GVsr8XcV38
	dzEshEDfmAP+C2peT7j1blXg1V7Oao0GFS6owsA1AyuZs/SjUOiO19Y/tPnMwww7
	6l7g8LhdE2p2qfNtKyJyKPx4G2XwgwI2tuGL0kwi0vDvl0hTwzcSJgH9WwaeNRiB
	41jb3Xit3KmDv01llheLFRbNNzwtieZGlSsCqaOKhbEyw81L2qTwBh3KwIuM9t8F
	MyzdLmeE2pIJ8jIyq6QLMt2Vb7OtgazJG0kCKSVLpCstvJZ2e8a2FWjaehBVwIFx
	Fqsk/NKMd5J53d8nHXySy7yPNGBbleuex4CUfdKlp8X69aFdpupVV2iQd2VbaHzi
	RGwBBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r20vca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:45:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50911c94db1so16548911cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774284320; x=1774889120; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kj+XAZN1TFt3Nwfgt300eR0N4IQOJ3Hc9ynUXTnwTp0=;
        b=HSqn8Z2BAg/zQRJ6O0AYQV20QJFZjpEAUw8dEU1x668N2oMY5WWfFDqRZ1ZMtdY5Pg
         vGf9/AdkrGa3uT20/0vWIua4WoVGq5kvYC2KjXeXr3n5Eu4BfBYHg3vcQoGJ8XvF9dl3
         JOrwqLyyx4be1VLNA9+zzKRZzbu1WRkP3iwYQ1ukWQSU191rgzGT/HJt5jwY4YBZqfkF
         JAZgB7g3hEvs8KX/p/JudafHC5uo0FF/Pi5nrpiRUV73g62Q8jddpgxIwk2faxNH55eF
         +aKMWkOp1pQ0GvUd4ExXWU3WEJs2sZDGVZLnHv7eGyZAlbQI1l+rBXrm+CLHZ/dzCr2p
         XilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774284320; x=1774889120;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kj+XAZN1TFt3Nwfgt300eR0N4IQOJ3Hc9ynUXTnwTp0=;
        b=cqyo/zvu07KATOzZj9pPOQ0+KfVZGOJK4PBFVKJ+EnAyFUYM3I46sTQwnQ8qCKHCPB
         rpq46u0dThNjXLPbRsQqdEw0Elynr25PssK18jMwlAkqVyWPBm2q2UuZYmBXYe0PHlpR
         W/WRJ4r90tpmtnFTaHmq5Yzwhyl7jt5SFpjTyTjWLYS6slwLYCBdkMuBnaOKnAJeLLLQ
         2p/gUx1pI4k7eYU/m9zDnHiMYTD0fIwQu+3OPWnoh9RZYNVMJXryPSjpCqCkqn4H8fmk
         K5qoSq43LcX4J9fK8iY4pjaBjV/MbKI5KGZft58dLrRRQFXKu/n/q8bCVmAYQjAZO+nK
         /YFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgSt0XjK6j9KWgz/JXTsiw+DJxwAiaxgebLn1PfdtpTL0foPyeG6dusnByI2RhPvzeTqF6Zb1QlEcJhxz7@vger.kernel.org
X-Gm-Message-State: AOJu0YyPAoVIWbYYRiMAZZ8IuOElweL3cYw5NqxptqgyuyRAvKZaFm1i
	s9jvIMppIoQeEA+/KWbrhRd55vD23eJX4Y0cR+VWHfZFJIm+HDhQCV0ojCB+J+5ZZN3x7Jo3Cgu
	7ewmFxqa0ewimy0QMIwzfb4zZwsBT60dvq4wpy95SjgMc+u/qFFXZR3xWYvCeJgyZ20laleZHA8
	Pi
X-Gm-Gg: ATEYQzxSHEgtxplbfSd21nsBx9EenKMVJ7GAfg18FQa/ZRfU9M/eybujZaOGXUI0riY
	oq/ciMKdt85TRiAyWXhJHr7RDd4GUqypuxyN5bGkJ/q4SyRkGdowSkR9iYtRZgwqH0h9w7l7k45
	OhbDhkLvtw9E7YKdUu7iMt7jgQrF8cDHaYy2NZU1DZH+4gysKfx1oODs3lVAG27qZTe7O0vqAQn
	0yRnvQKjz1SpNSZuARMPUvsExi6DnRcJ8jzUdcMydo4PRGp98gxiK7Jrg/Y+8MUtsId9BU1cYEb
	ejRHsL1Dl9UsLt3cf0qWRWNaHw9BvyoOoLZiSlIUG3a6uCMw4J+yIpevmNPn/SXDNBptoj4I1GL
	Uk7RLc/EJMLsCnI+6ac7a49nn3jU3QqyZNRcs1+N3pL9yICEgP7Iobv0l/I6fq2a+XnyXP8fFhZ
	ZQ+8JaapCgXSnpBAAwJQOJKpzcxp0wwxByg78=
X-Received: by 2002:a05:622a:4e93:b0:509:2822:670d with SMTP id d75a77b69052e-50b373eaec2mr187522221cf.27.1774284320080;
        Mon, 23 Mar 2026 09:45:20 -0700 (PDT)
X-Received: by 2002:a05:622a:4e93:b0:509:2822:670d with SMTP id d75a77b69052e-50b373eaec2mr187520941cf.27.1774284319458;
        Mon, 23 Mar 2026 09:45:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207500sm2667386e87.41.2026.03.23.09.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:45:17 -0700 (PDT)
Date: Mon, 23 Mar 2026 18:45:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH v6 6/9] dt-bindings: connector: m2: Add M.2 1620 LGA
 soldered down connector
Message-ID: <blhm4csjyw6r667cleljgzd6rpwagttjo5rau7wjrlnjakq2qm@ekyhc4jvwmwf>
References: <20260317-pci-m2-e-v6-0-9c898f108d3d@oss.qualcomm.com>
 <20260317-pci-m2-e-v6-6-9c898f108d3d@oss.qualcomm.com>
 <20260322233713.GA98177-robh@kernel.org>
 <to2mrizprc3hjufqbiplpqyek7f4uutqtn4hx4gkmdgv2rykbc@ybwwjhdec4nm>
 <CAL_JsqJXrHCJt770bJkMmAUhirSF3kHjYwSzkG7cXp7-eys8Rg@mail.gmail.com>
 <6aef3xxjjd4nbgrfx6jc6jt6rpqmttoui6hil5zqgdpas2j6gj@ie6j72orenou>
 <fsvmmgoe5wslmxebhrrwmdg2ldcmhzvj53gjkdfnfg2m2rz2lw@dcfboaakz7ae>
 <bguhzabwryayyqkv4ilzwr3ixwv6bzxncblo3ircz2wm3fs52k@66zvcrfcb4oe>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bguhzabwryayyqkv4ilzwr3ixwv6bzxncblo3ircz2wm3fs52k@66zvcrfcb4oe>
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c16e21 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=dFseMu0FTdCp80lU-T0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Ff5VXL1LTKjZZZA7xdCsQ0KP-94C4K7s
X-Proofpoint-ORIG-GUID: Ff5VXL1LTKjZZZA7xdCsQ0KP-94C4K7s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNSBTYWx0ZWRfX9VcpuKOWf7xD
 g90V+b09K7ONxjvFstrHjpPYWliIGKXbv5ENAmZpy6QOWyDs8LPNKVs09ega6yx+OVfSYzaJ3t6
 /6/dcHgPee6XTWPY4lH3TtoUwegDJrrT40O2XmNjryDWJzL5lYPKcmPu7nWK5w17cLhdJnITzmx
 h0OPM6P5tENq3xV2knaPE6TO/OzUJCirBVb9c/u7SLZ88+ZLgFOZKCIiLj+pLhjURP7yIt+Z98G
 4OYnW9bvrrorCYG55SNnTwcSU0KGcFvnDS47Q7Rj3qLrwLElFKtWK1laxtKt94yZxUNR5mPIBn4
 semCq71cqq+h1eFoEiYsui5t1MunmFo7tqVHjY7oGtj0mpI4Exey0R20DBI9Hy/IReEV3Q//5po
 ewUfUwQYhS9oJeEEhJyIWIK/HES19sgv4SE22UltaDEsGaYgfHnejQxQT+fykjpWlNWWlvY8fys
 NuIEPopaTHJjPJZptDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230125
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-99359-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5840D2F9AE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:26:04PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Mar 23, 2026 at 05:14:30PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 07:14:25PM +0530, Manivannan Sadhasivam wrote:
> > > On Mon, Mar 23, 2026 at 08:39:55AM -0500, Rob Herring wrote:
> > > > On Mon, Mar 23, 2026 at 7:16 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > >
> > > > > On Sun, Mar 22, 2026 at 06:37:13PM -0500, Rob Herring wrote:
> > > > > > On Tue, Mar 17, 2026 at 09:59:56AM +0530, Manivannan Sadhasivam wrote:
> > > > > > > Lenovo Thinkpad T14s is found to have a soldered down version of M.2 1620
> > > > > > > LGA connector. Though, there is no 1620 LGA form factor defined in the M.2
> > > > > > > spec, it looks very similar to the M.2 Key E connector. So add the
> > > > > > > "pcie-m2-1620-lga-connector" compatible with "pcie-m2-e-connector" fallback
> > > > > > > to reuse the Key E binding.
> > > > > >
> > > > > > What is LGA?
> > > > > >
> > > > >
> > > > > Land Grid Array
> > > > >
> > > > > > If not in the spec, is it really something generic?
> > > > > >
> > > > >
> > > > > Good question. Yes and No! LGA is not something that Lenovo only uses. Other
> > > > > vendors may also use this form factor. PCIe connectors are full of innovation as
> > > > > the spec gives room for hardware designers to be as innovative as possible to
> > > > > save the BOM cost.
> > > > 
> > > > innovation == incompatible changes
> > > > 
> > > 
> > > Yes, I was trying to sound nice :)
> > > 
> > > > > This is why I do not want to make it Lenovo specific. But if you prefer that, I
> > > > > can name it as "lenovo,pcie-m2-1620-lga-connector".
> > > > 
> > > > Depends if you think that s/w needs to know the differences. Hard to
> > > > say with a sample size of 1.
> > > > 
> > > 
> > > Sure. Will add the 'lenovo' prefix then.
> > 
> > Is it really Lenovo? Or is it some other module vendor, whose LGAs are
> > being used by Lenovo?
> > 
> > I remember that DB820c also used some kind of a module for the WiFi card
> > (which might be M.2 compatible or might not, I can't find exact docs at
> > this point).
> > 
> 
> I don't know. These kind of designs might be reused by several vendors. But
> considering that we should not make it generic, I'd go with Lenovo as that's
> the only vendor we know as of now.

... and later we learn that other vendors use the same idea /pinout,
then nothing stops us from still telling that it's a
"lenovo,pcie-m2-something-lga". 

-- 
With best wishes
Dmitry

