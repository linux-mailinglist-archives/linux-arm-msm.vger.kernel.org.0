Return-Path: <linux-arm-msm+bounces-118562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RWDvJm+HU2qFbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 14:24:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 033D6744A07
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 14:24:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lMeZLylZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PnPspF0v;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118562-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118562-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF7E7300CCBF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4542C3A7F7E;
	Sun, 12 Jul 2026 12:24:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076F43A63F2
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 12:24:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783859050; cv=none; b=KA20IVBjp9fgod+/vgwwMfGleDcfYsZCPNPhm998aeP88hGl10PB5l89brk6Rx/s1WbiZ9Cx3jd1CKqr7Tned8lRBIR4HJT9K8YmZ1fPA/0iLlQ4rWjj2GZtBNn/CE3Jq7AmgdMrIM8EQ34CZMRof5hmd6XY6xsXrnwVjgzFbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783859050; c=relaxed/simple;
	bh=d7IjwGB1xu2ILnjGvFwJ9k9VjCw6U6t4/RzS01qVIPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZrTZJb9HRbYTTMnvlJws/7OY5ySGVB9gLWWiNq8vRIJr19JHDtzgf9rwLjLXuomnWRP3EIt8hG2zwWqzXM0++i14ZsjuFFlKLJeKOAuLU9nJQXDXU02StPXtqchcS7rc5d7IIqJHfSKGlWGKMA6fX/X0LPA/dL5tkuNWtMARaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMeZLylZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnPspF0v; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAbtKb2386275
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 12:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ku0BtO09ZIOFIwV9SszCQrDP
	YcMG9zj4q6CPevAQDII=; b=lMeZLylZsarWccW/f4mjnWAN629a2FAti260pN+G
	E9XFg+weZcI8nHRjpXBnF8WU55XOktmATuJAYitFyJp4/u/KeeckFgmwxhsQwHSc
	GzGCvxEJ/8d0JCP6SjcJrTnvvgB9Q/5xvNozY7yi4S9sPb5v6nfWd1y8P9T7RH5Q
	KtVX660AQZEOxHacy9RVwFDgOJpQxcmk7FzDSdtQy7B7B17YZ4E96kq8bgorhNfz
	TX4ZYh3Ef7ES7TwKdlKZOwDpTh9zpNCvndx5gThuAcvAwkKx7FwxdH7uFFjGZRDU
	4CLoKGGD1KauifNlGavLnWJNIavlt+TUWXodCAf4xi8Rkg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8vaq69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 12:24:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a9764f0so33223801cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 05:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783859047; x=1784463847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ku0BtO09ZIOFIwV9SszCQrDPYcMG9zj4q6CPevAQDII=;
        b=PnPspF0vYihV/aDTTRH+scYt2Kr2KEZCDfGT9XKSF/hHy1mby/Yw8O9ApqgWt8ffLo
         QFPpqucNuHMavbuUJqV8POgSnd5vOkglphWXppFSRHz4ujwsaQpAxs83oVOv+X1tBkFx
         xHux4p6VMDuP7n8IL5nfZEJ1lW58KEZpkDESMJza68RXjpNgKzM7IsK53o8g3rPA1JkW
         zVnb7vHEk9Gg+C550NtT7SEDOZrb6hUSGCEJKTkN1IwfPUP2jFfRyeNFJAJoGEckTxSH
         u5iGOstXaVHEX5KbvayPfgUe4zfw40wPlVC/QzONwavx7uL9qzTCdN8wjao6A1RbwBJd
         WGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783859047; x=1784463847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ku0BtO09ZIOFIwV9SszCQrDPYcMG9zj4q6CPevAQDII=;
        b=C8+Q6YV1J7Vd67yQH+4LyJjK3vn39B0/6VLsE+c6j3a1sTI0NfuWmVKgWOEFWrokzW
         hWcLGPm3Y264uNAhgmiqK1hMTgf/iIgpNQi6gwYQMlfY+l8wG2NLTHWNmFzMlUiOVHGj
         OH5c1ZsY2GljFofD5gLXfx9sI0UP1nvqP9M7WItklf+aU5UOvsWtNUVWHEXZAUte3D1B
         xDX6AoKikub1t0hLSmHI6J6eCjgAGDr/YK9O16varS+8ysLMB8VOORxUYoldtQ3azSut
         4B7/WLK9xPgOatcI6+h+X2UKivgubzP1fU/0buYp4aVitjoiY0oW3XK6WPcIqzbBQaJp
         SNyw==
X-Forwarded-Encrypted: i=1; AHgh+RqR/KLhjv4uRj0M2zneDg2WhfWXDtcA0hyZpdDQ/XO2a3jwPR5hyRfwgOEakLF6bW20dxdx3BM5dq8ONfcu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2xGbsHrq5InrOH8twTjKE496AXXfw5V5kG3k7l/O0KGa8srIV
	Lvx00w4dudvVnrxDlEuLgBoDjHQAe0O6oNUK9ZX2Is3J4qr7m1oVpQX2VbKIOJmp2ilX5V4oJaV
	56BvmD3NpOmYF8D9IpX1CoFNVi+XPDICieA+yHt3sxBIcLzDuZlsQ4bRfHqii3Q/8o6R8
X-Gm-Gg: AfdE7cmRROPpjlInLSD502qcjH4bjw7RFhFVg+J0bq2fSzRmXblesk4y9YSvYtGmS2A
	7y6rwF+KyNO0+V9NMHUuI9J8eJ8K2iqLqLI8UOcvzgteYEjUH5qYjSjdrWFIfmnS8E0paBNI9ZM
	NcdIwnSXS2d67diXqR+30VtnxZIr2YkYbWxZPOZz90I+xHjeFHIoJ1ekcJir4TGFtMPkUG7Obn5
	0B3JW2U0561q8dO0FyH7dJx4i4sD8SvhctjqX0FNfBj4Ik07z3FucP7a0QB/T55p2Z9uwMxhl1Q
	3EHbMnx5JQrTBLSFwebd4IwjdhAsu9vaVzq5x+F1jCMxfAcvOQ5+Diw5raeMUDqkMulOzJya0R/
	6rwDdLx17bfXktQ7uYaeRXKyXnHAd9VYo+KTWdaj0Ce5bRSQF3/3Q8or4Uvn10ZnZWNwFt9J/iB
	Z7LJSt2cTV9WPr5vpnH9ZgLKSh
X-Received: by 2002:a05:622a:14d3:b0:51a:8aec:9bbd with SMTP id d75a77b69052e-51cbf1bb1e5mr54165101cf.19.1783859047274;
        Sun, 12 Jul 2026 05:24:07 -0700 (PDT)
X-Received: by 2002:a05:622a:14d3:b0:51a:8aec:9bbd with SMTP id d75a77b69052e-51cbf1bb1e5mr54164841cf.19.1783859046848;
        Sun, 12 Jul 2026 05:24:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4f967sm2033717e87.25.2026.07.12.05.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:24:05 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:24:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
Message-ID: <wyheslzmyi3wsocqtvjpiqjsd5kl5m6at4e4rxoa7tj3ej4cju@vpua43i3rtpe>
References: <7GAZnP6jPoRrcDnaVzeaB98cONLhtvbiEXV1yD5MJJrA9pCnC9lmlSiCGA8vlDezSXADjmFiqo3ZdClO5SxCFA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <c5d190dc-1ba8-4cdf-ad8d-2f86fef4c93f@kernel.org>
 <JSezSF-U8ovzmiyYmssD6k5kLWpRmD9rhrVrKPD1NLY5xKvjkGwoNBtuKpc8t8LhkFj4TSb9T8-gUiOXny-VWw==@protonmail.internalid>
 <f0fa6acb-2d70-4154-96e0-09e88af129e3@oss.qualcomm.com>
 <1c652464-32b7-4411-8ed2-2885234513cc@kernel.org>
 <95a091d8-1b6b-4510-838f-2cd26ad54eff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95a091d8-1b6b-4510-838f-2cd26ad54eff@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: c8UnZaZk6d3r7Ty9ezaCp8_3UmUlYxXV
X-Proofpoint-GUID: c8UnZaZk6d3r7Ty9ezaCp8_3UmUlYxXV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEzMCBTYWx0ZWRfX7MxKI9+B2XrI
 /9xl7MBkNHwbtWFkQW46bLx8T2zf6L2hupZ0OEH90SCAHxZxmx2I7pixZa6I9PZijxShf7DZGcX
 Ev3vYlu6O7Vi4dQ8kPHZ2FcQ57khXNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEzMCBTYWx0ZWRfX/qT1sPBGmpV2
 b59JlTYtYLAHBiuzJtBz612nUz0yXkQMjBFRIge6pG6O8P/UfxBxoWsRjK2HRxlXYBWN3MiPG7K
 bDQrgFsGmNFksaVDq2SemiigAD9xLesExcWuVudbCqp6ioTAUboEa6M3/hkylypE0LznYJm56ka
 AYobd1bHJAEXnzupFCLC++xaSMWF8okiK4uoGUCZyU9NYttOac8giJJCyOC5xGVwQQT7K3X94oO
 gupbPtANMJwEa3a/xxYHrwUb1DA+TZWUDPc4dmk5n3xO5+DPjUn4jF+Mp+iBirSTS0tjQ5Gaajp
 y4TJTT9jhG6MAvY01VKPQvrutkt1yLkZT/Wr6FHqoPy7MPzo52ViN9QcIXmoAl9T+d+CDd60lfS
 VxIZmTi0Y/BpQlEgMRVScTFW6KaP3hJLx2XV0oGNA+VeObjPUEA2gqln38cZwoQwpohAamznkQi
 wLw8W6wb9qvk+hZnTLg==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a538768 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=-WXgZBn8uEdDJsb7MhwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118562-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 033D6744A07

On Fri, Jul 10, 2026 at 07:32:35PM +0530, Vikash Garodia wrote:
> 
> On 7/10/2026 7:08 PM, Bryan O'Donoghue wrote:
> > On 10/07/2026 14:36, Vikash Garodia wrote:
> > > > What's the addressable range with sub-nodes ?
> > > > 
> > > > The original problem you were trying to solve was the total addressable
> > > > size - this other problem here segmenting the linear allocation space is
> > > > adjacent but not the same thing.
> > > > 
> > > > Without digging through all of the patches here - my question is does
> > > > the original sub-node addressable space problem get resolved in your
> > > > proposal here ?
> > > The proposal solves both the problem we have so far - total addressable
> > > size as well as which segment (or range) in that is_not_ addressable.
> > 
> > So if I can distill this.
> > 
> > You're proposing two objects in the DT one for each relevant IOMMU SID
> > and then the driver will register two different devices to get the full
> > range addresses ?
> 
> yes, alongwith the _non_ addressable range specific to that object, to avoid
> the device crash.

If one of the subtypes can address the whole range, why do we need a
separate subnode and a separate device for it?

-- 
With best wishes
Dmitry

