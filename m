Return-Path: <linux-arm-msm+bounces-107145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBgdAQNdA2qE5QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:01:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73660525545
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 106EF309B9F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693F83D5C1B;
	Tue, 12 May 2026 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWb0GO9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evWbaPEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41283D45FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604670; cv=pass; b=m61wM/ZtyS1ek5C8upS71uula3QWzANyhA3VyxG0MxojQpVGN5n+RvvszXbMLn85OVaJvWya0dUxC2lxsUMs2NKxijpJOjYGr8mHfnHiqRTq4zRgAVOBG9P+U2IT2zhDVR+cLLET/eXDyPyh2wWgcFmYWHTf/+KGimdralUibms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604670; c=relaxed/simple;
	bh=v6DQSkAsCB7h1O5GUUmXb7JuYhjQSr5ijQSwSn93qnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMu0CqaO3z5qPGTHVM/CgVJrHx7a7lCPrLXnPiiaDPrddeD4mTL2tdy+K3R0heSG0EU1GQxw70RHbGys2TKx4wRMceEIeLPrV0yz2R9iLnTccVKMTPOrXJ4UPj4QxC63ZYkz0w+3FMYuH8K3Ni9BRaRD+VG/0zzmq+qRFJIZvFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWb0GO9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evWbaPEV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CEYZO31733326
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hh95mjXYy30eXCOUsuZ20ibf
	6b9dwOWmLBkERMnV35U=; b=kWb0GO9bJKGYNOWXsE5BHjLzMgArmstjmumyw0sB
	dWz0vVDDZGPb4o9XjKnfvhddhHrt8RhmpYDmoLw+0/EZmjDurWKE4SVA9pIfc6Gy
	M97neAIAgP1COOsPZIRyvR/TDbQZ/l0x1fD2LZXACDXI+S5Nx4GFd3md3hvZh3JO
	bBwJjILdZQlO0uIZts95xl6Ak2qUMVTeJauTPXDPrgmpi484UOd+4BoY4ZB5+ML6
	3eWE/89xcAED/TtF6feNe8/5spfsXA22kEKdOikSCsVDWtdDo+kKgv5Hcd3H0UYh
	70RHwgGY7xKezgnAjoeIqvqZjvzeLgKC4JDsxRD+g7oFIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e463dgjed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:51:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7c904d476so63080785ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778604667; cv=none;
        d=google.com; s=arc-20240605;
        b=JIT0vc8fjLHFZoEQVOc2JzIhtOC8Ss6P4B8K9bmawPotc9SzTvagFxTX9lzjzcWVIu
         y15ZuJikrd2I04LOPIVJxZw3RNCZUUcxU0/sy6faNO7lRAlDmNQuYyTaXa+EaY/0ZNrO
         trqiZWR5WbW6hl6EP39+Tm1tyk+uPiNza52y2ZFsHC7f10XwNNV6/HjjzutZNJ0NwRMs
         LpA2f0SMPwlPmwgy9xYLZMGAgL0QfmAhKehr42fe+Q2d+Me169Z/2D4sBOHGgm6TiNFI
         mnp+YfO37leKgR/hToXtqQTZ3vZQZvQxdgdOhrnWTDAlkiV2T4qnSoAtByamdXdw1Vzy
         nCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hh95mjXYy30eXCOUsuZ20ibf6b9dwOWmLBkERMnV35U=;
        fh=j+TnH2k3wGoXvYgBWMs2WOrGU/6pXiJWvQkKSyxbESg=;
        b=QQJNXynwDR3ts2rLoidgESY7yyahmL7CqOnWDaOB7uWhzcs/Ecz6DBDZEFESKOFuPY
         jZTbTaUgGBTj4BJKwY2Hg9qbcdcTr9R2MOCDO9TwmC2O5Noq/8c1NICQMqrpnUoaPr8j
         J2cMqlrQNzkfYSLokzoZoT2LWryt27A51T+gavf6eQ15wmpaF7AljQ0gfGP+w5pwYvlP
         B6BrXl3EBNGWdS1fB/CD6Ho4ceKmyIvPWP+q/Oz5v45OPWQR3cEjHau4PBwtu/D9N4dN
         MQSbhytsOXcIs1Fuh+R1MFPRJ8WqLJlMPzJgndxua9t4tiPfl3F7Q3TORCLp7nxby7kW
         EBQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778604667; x=1779209467; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hh95mjXYy30eXCOUsuZ20ibf6b9dwOWmLBkERMnV35U=;
        b=evWbaPEVuOf588DAKuWru0+Xmq+fPqVTKB78Mmah4HJoNWZO3qMnL4/EJx86EITRAu
         X3rIMYg0NQ7j4cisbRSWMx927loenWdFwjwnfPA4IW4Onvdx/K1HTJhKt+q3G+8uSRN8
         u6ZvUBYsBWUyzqbmvCq2bgIhlsXPzLrr9JTh476GZxDjLnJQMYU0YX4pHkui16/TJabC
         7yoWI7uLBoJIRjTtjh7/pQNpRFDbC4lhmyvp6CMbp8yfvZH6xMuaGpG0P1yH8Td7lldv
         AYp1Q1piJQEkiNuijlaXZBgigq7Fh0RUcjA3SQniMg1JQ3lYGkSI3O/XSGAT0e4CkoqS
         gG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778604667; x=1779209467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh95mjXYy30eXCOUsuZ20ibf6b9dwOWmLBkERMnV35U=;
        b=ZUifcOSRVT//HzBXknIUA1q0BpiQwedEA4dinuvhfIGQTQPdMiNJhU/syFUlQeWkxI
         SUSoclkNnSz/TdeccqAt0eK5LiS+GxERntELZB1Xo8Ow/y+limUWXF+LFAguJqjhYdoe
         MCnp/qaN3tCoIVKxH1arGWCc6kduzxvVBWSy9VvkSHh8/LYC36E9C/AU6YMtgGbGXoD5
         3Vsf2kPxktmRqhvj/Zkh+AhjzosHTPeLtzz9S9MwMKoE0J8uAqkUN7PREXg02Ts771cP
         i4cK04l4p7qsxa5oNZNOk4K6U0XDOnXzoke8axrTJxBPNtimEMDZYUkyxCK+CjKCVECd
         eT+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9fRzxS1AwrVMztIqOANnoXPQZTVIV1ILwyYAObIThgFXrpHYEE0dlrMu7YYRb6eTYnIXkp/dOFxGWlWf2X@vger.kernel.org
X-Gm-Message-State: AOJu0YwcLbvZyFHclVPmC2KD3DrwWXYcr/vgDYgw5T5CUgtO9dFR4o4P
	BD3xZf6NzWlSD3HQMn3bZMBPXtIY/UgWYgab/Hxrv7T4c9qM0DkRJKpjp1SEVOndHfnHaEsc5YL
	7s70+nGE9PjU6Y5cGEj/VLfNL9pi7tePqNb2qj6ZpfoGVq/bKKPLVXoI5pDIRjVFTaZKapKu+sO
	xeblIrlpaoVarkWz6YKHaZ3jOvGsitlklz+2BLui5tljg=
X-Gm-Gg: Acq92OF3Lf56MRuqXYPl1Hrbg2Rgdq515F+QV1TSyK01FxNrfN29qmjSAK8SSvuI9/q
	PQSwGk9h9g29Jq9QO74Wo7Bf6lMux3PDY1+RU5ECidShkpaywr2BY1mrtOJwYRBAWthUVAxc2SF
	Iyw8H45o5mG2SxF7nbjtl7y7mu6dotJLj4x93DXowzOcpHusXlTi85qiNXxydYhfJiP9IjwGXlh
	Og=
X-Received: by 2002:a17:903:287:b0:2b4:5cb8:99eb with SMTP id d9443c01a7336-2bc7aa36833mr161237315ad.27.1778604667341;
        Tue, 12 May 2026 09:51:07 -0700 (PDT)
X-Received: by 2002:a17:903:287:b0:2b4:5cb8:99eb with SMTP id
 d9443c01a7336-2bc7aa36833mr161236815ad.27.1778604666774; Tue, 12 May 2026
 09:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com> <e55b33c1-7a74-4190-a7c1-5116f8d5915b@oss.qualcomm.com>
In-Reply-To: <e55b33c1-7a74-4190-a7c1-5116f8d5915b@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 19:50:55 +0300
X-Gm-Features: AVHnY4LEpLZ356PeoGutpKTnSDHrsLyZKemG03mKAjFCYSYmX5fM5Kn8y1O_gRM
Message-ID: <CAO9ioeUrCJQKV9M0UY1V3TBEn2jd45kVkguBaEe7sswKjHHWdw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] media: iris: enable SM8350 and SC8280XP support
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: rAgeJLeRFsGqxj0AZvmLikrSgFHkGsVB
X-Proofpoint-ORIG-GUID: rAgeJLeRFsGqxj0AZvmLikrSgFHkGsVB
X-Authority-Analysis: v=2.4 cv=aLTAb79m c=1 sm=1 tr=0 ts=6a035a7c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=lWqA9hb7cpjHTsjoHSMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=mUDYQMy1hxdww3aAYIDK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3NSBTYWx0ZWRfX4rb7B58J8RjM
 9CnjLaSThQIIVCZiGGhmZ1b5xs/NZgOYdnBkh2xfUVw3EFjBuXef4fKoE0YfnhmiOlpTOE6GEJB
 KPzXJZWFHEkspraiPPl+kybwbh3Xn4mwktHbs7kjz2Yo60QNsL6LDqFNcXFUJDptiGN+vdpzxWD
 tQM5eCsQ5ay0w/cUF9GR9XF4MDLvu1iqz5aGxOF5N+GiUM1aJ2Vu87OF05Za0RxjQAnuAqRsVaC
 J9Ri2/gDMGDJXPGJ3cgZ64wWGysKAyVXc4rnB4Sy1p+a+QRI7Eo0hVrvHzS7Poo8zn7jZPnZ66d
 cAGatfvx5T2o7xO1owrGG8lX/GryYQrg3lwMcHU31urD9iAE217VALokSgNgwc9rL6IolqBexiM
 QkfTw7RsHZupLWW56YgNdDZHJbVi1PwIoTv6MlFAeLka4ixlqMNVrVbOkfhXh2U2iu8/3o0gvIu
 M40JJhfCVa7XaB8Xndw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120175
X-Rspamd-Queue-Id: 73660525545
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107145-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, 12 May 2026 at 19:40, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
>
> On 5/12/2026 6:39 PM, Dmitry Baryshkov wrote:
> > In order to enable wider testing of the Iris driver on the HFI Gen1
> > platforms enable support for Qualcomm SM8350 and SC8280XP platforms.
> >
> > Note, this has been tested only with the Iris driver. Venus driver fails
> > to boot the Iris core on SM8350 pointing out the UC_REGION error.
> >
> > Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
> > SC8280XP). Please use corresponding firmware, extracted from the Windows
> > / Android data.
>
> You can push the tested firmware to linux-firmware

I'd prefer if firmware for devices came from your team.
Firmware for SM8350 which I have here identifies itself as
video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6

Firmware for SC8280XP (Lenovo X13s):
video-firmware.1.1-b158087140355883dc40b004032856a8feb5d565

>
> >
> > On SM8350 with the Iris driver:
> >
> > $ v4l2-compliance
> > v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
> >
> > Compliance test for iris_driver device /dev/video0:
> >
> > Driver Info:
> >          Driver name      : iris_driver
> >          Card type        : Iris Decoder
> >          Bus info         : platform:aa00000.video-codec
> >          Driver version   : 7.0.0
> >          Capabilities     : 0x84204000
> >                  Video Memory-to-Memory Multiplanar
> >                  Streaming
> >                  Extended Pix Format
> >                  Device Capabilities
> >          Device Caps      : 0x04204000
> >                  Video Memory-to-Memory Multiplanar
> >                  Streaming
> >                  Extended Pix Format
> >          Detected Stateful Decoder
> >
> > Required ioctls:
> >          test VIDIOC_QUERYCAP: OK
> >          test invalid ioctls: OK
> >
> > Allow for multiple opens:
> >          test second /dev/video0 open: OK
> >          test VIDIOC_QUERYCAP: OK
> >          test VIDIOC_G/S_PRIORITY: OK
> >          test for unlimited opens: OK
> >
> > Debug ioctls:
> >          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >          test VIDIOC_LOG_STATUS: OK (Not Supported)
> >
> > Input ioctls:
> >          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >          test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >          test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >          Inputs: 0 Audio Inputs: 0 Tuners: 0
> >
> > Output ioctls:
> >          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >          Outputs: 0 Audio Outputs: 0 Modulators: 0
> >
> > Input/Output configuration ioctls:
> >          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >          test VIDIOC_G/S_EDID: OK (Not Supported)
> >
> > Control ioctls:
> >          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >          test VIDIOC_QUERYCTRL: OK
> >          test VIDIOC_G/S_CTRL: OK
> >          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >          Standard Controls: 2 Private Controls: 0
> >
> > Format ioctls:
> >          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >          test VIDIOC_G/S_PARM: OK (Not Supported)
> >          test VIDIOC_G_FBUF: OK (Not Supported)
> >          test VIDIOC_G_FMT: OK
> >          test VIDIOC_TRY_FMT: OK
> >          test VIDIOC_S_FMT: OK
> >          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >          test Cropping: OK
> >          test Composing: OK
> >          test Scaling: OK (Not Supported)
> >
> > Codec ioctls:
> >          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >          test VIDIOC_(TRY_)DECODER_CMD: OK
> >
> > Buffer ioctls:
> >          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >          test CREATE_BUFS maximum buffers: OK
> >          test VIDIOC_REMOVE_BUFS: OK
> >          test VIDIOC_EXPBUF: OK
> >          test Requests: OK (Not Supported)
> >          test blocking wait: OK
> >
> > Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> >
> > |TOTALS|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
> > |-|-|-|-|-|-|-|
> > |TOTAL|169/316|128/316|154/447|126/447|159/311|229/311|
> > |TOTAL TIME|242.251s|267.903s|293.458s|261.934s|203.009s|366.936s|
> > |-|-|-|-|-|-|-|
> > |Profile|FFmpeg-H.265-v4l2m2m|GStreamer-H.265-V4L2-Gst1.0|FFmpeg-H.264-v4l2m2m|GStreamer-H.264-V4L2-Gst1.0|FFmpeg-VP9-v4l2m2m|GStreamer-VP9-V4L2-Gst1.0|
> > |BASELINE|0/0|0/0|3/7|4/7|0/0|0/0|
> > |CAVLC_4_4_4|0/0|0/0|0/3|0/3|0/0|0/0|
> > |CAVLC_4_4_4_INTRA|0/0|0/0|0/4|0/4|0/0|0/0|
> > |CONSTRAINED_BASELINE|0/0|0/0|32/33|33/33|0/0|0/0|
> > |EXTENDED|0/0|0/0|1/6|1/6|0/0|0/0|
> > |HIGH|0/0|0/0|22/45|22/45|0/0|0/0|
> > |HIGH_10|0/0|0/0|0/2|0/2|0/0|0/0|
> > |HIGH_10_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
> > |HIGH_4_2_2|0/0|0/0|0/21|0/21|0/0|0/0|
> > |HIGH_4_2_2_INTRA|0/0|0/0|0/7|0/7|0/0|0/0|
> > |HIGH_4_4_4_INTRA|0/0|0/0|0/6|0/6|0/0|0/0|
> > |HIGH_4_4_4_PREDICTIVE|0/0|0/0|0/11|0/11|0/0|0/0|
> > |MAIN|127/135|126/135|41/90|41/90|0/0|0/0|
> > |MAIN_10|0/11|0/11|0/0|0/0|0/0|0/0|
> > |MAIN_STILL_PICTURE|1/1|1/1|0/0|0/0|0/0|0/0|
> > |-|-|-|-|-|-|-|
>
> Can we do this in the format which we have been following for other SOC
> ? How to make out which is failing and passing test here ?

Sure. I will fix this for the next iteration (tomorrow).

>
> Regards,
> Vikash



-- 
With best wishes
Dmitry

