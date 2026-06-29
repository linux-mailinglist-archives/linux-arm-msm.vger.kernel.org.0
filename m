Return-Path: <linux-arm-msm+bounces-114876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5tJbMKEnQmo01AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:06:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 178436D74B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:06:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lgvgeeg6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TDiI+9sL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114876-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114876-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7443F318E6EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4FF3E1206;
	Mon, 29 Jun 2026 07:46:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15D33DD50C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:46:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719172; cv=pass; b=blvPIhtRdQrVmt7Jri8Kt6ysU+wkNwOFyuG7AzeJ9/jgl0Zp+RjL7jI3bQLBM8JRytOX8PRCuxsc3fPKPOn2I5Q8Yc9+dDAdh01sewzImoUr9m7o18AdBMDvqlFwvyvfcm3uqBWRzSuBTKq6zHF8qoeCVG/3X3HJgcAOO3P4cec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719172; c=relaxed/simple;
	bh=6tHTC7dMaWLutqIJyz+8sg1I2A6BctzDU8v6IomSqhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoPbWcZn6DlXRMRTt5qzh7ppjvWomsccvNTG+Gv93sb7qdKlVXzZ1pkFIXlHuyUC6vs4KSe/r1qxgmLQ3xozWlJnWXVO/nJyx6mGiN0v6hCcrEUqNOAAcfMZSm4Phe1P0J81Lvt+y8hnlfQ/ATFEz4rFO2uBB/mNJkToIwypGN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lgvgeeg6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDiI+9sL; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rOgh2151782
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aCQLcRC1jMG+f6yczHRsyvOb
	Q/+zkZyDP00/2XGZBZI=; b=Lgvgeeg6WRX3ChCWVb7Zjr+1lEBKPEhEWoTwRy0X
	zrB4ISZS9/UrBNid1MyEO0gkCm2UhgGgPg3JP2PuXfTR2LYGBjeoWnxCwgn5P1y3
	3J+dWClruo1XSmzkbyKNp1cOR1VHfwoKTIzL1bkPV3BxjqDazPV/ENeYkziIPHcA
	NBXVdkjKOlJPabRycshqHHbJAa71i9fNU33FLWhWHkyTumR+AoCV9BViPtbh7BTp
	oACAW0SGpY+uZKSgNIr3LdNG0U6IKgy9M7zq1fXF+1/F3o3yGWPqehpTEuo77qH5
	qjqdCkxNO8HTKAD5gjT6hisZk0oZtcdk9urq8dvISvphIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuwcam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:46:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c804e38c65so34136645ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782719165; cv=none;
        d=google.com; s=arc-20260327;
        b=K4fJyc45C+QYExwXulk5jOFCDDgDiwW3hrzdB9cqE/SuNAKf5cr2DqOVi8T5/nLv8o
         nvjsqSkpPQTi7xq4xL/S9ZlGjI8eQdFxhitxVxd0/O0+2p5SUN0lVeK/D5VS9J8MR66J
         f6Oy79MbrRSv0zqH6OcyNW+J/d77hwYr4o2+lYBfC2r3YGkrttSOHsI7IjXG0P/00rr8
         SweJ9AecaqPSeMcGAY3NTGKvyjSMrEAL5CppUBwO0QwWIRsERgcFWKu25H09nRyuoM82
         060YJqFPR9fwSOIRTv+6fMZl1qvz8siJgrF0p8O4FlTunBNQFtlovMMSwN/YIDD5vr0b
         o/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aCQLcRC1jMG+f6yczHRsyvObQ/+zkZyDP00/2XGZBZI=;
        fh=B78PqGtoX2IY4Hu0Z0bfgQOAu1Pkws5ift50Bkzs+7w=;
        b=IGDGLAyZK3aVAcmYFOZUuXIzPESZJgkVaa10dbdAKTqFxS1wK0CPl4JbGtZuUE8zzR
         EX54a9kZsThtR2PYwwbroYrp+IMGs7TkKyZEIcrWjYdkmbEuXSFf3LffdxYIPbqNZrSK
         1zcswV7NFwMromTu9C4w9hniy3nwzcg9wwDsCLGLdB2nt8iIK4UFc6fdin3AmF9oIC3O
         bigiHK94QFoXhq0bXdpk4u9tCMVCDK9j3B74hRhR6xJCo+VNCFjT3oH/G78Gj6AU0rkm
         McO5SaAh2IBQ7Iec0J1tzFE0UxcteCgu/Av/2tkpbafQJgs5AfjF0jyeDpX40LAgIpUo
         9vbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782719165; x=1783323965; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aCQLcRC1jMG+f6yczHRsyvObQ/+zkZyDP00/2XGZBZI=;
        b=TDiI+9sLnJVTbF4GjGCZmesYFIgIwvN3Jdw98tYbw5qJEzztl+OmICY+e3zR3T5c+y
         weAutzS5j7PUrc/+T8aeNh20vW3/TSfhcW2ODkTYwv10C+HfX7D+heAZOtFeOl4ZV3va
         zJtioYmmUlXLwKBdUaZBs3+8igPoxBGC1I4I5n7UQd0nD+F0RtsibO0WRtdBin0txgVg
         WmjyTSuks9O1LZIgE2P5jxcUfxrHgfuLUiHq8EHc4x4z7rz9XRtikp8blMBAD8Etcqp6
         RdIK6eiV1+zlfGdH1+qPFNJC9RQPPaK3q2JfffNGmYn2zqk0UlHmU5lO+LCltoDVYwSM
         y68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782719165; x=1783323965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCQLcRC1jMG+f6yczHRsyvObQ/+zkZyDP00/2XGZBZI=;
        b=q9e7/sNc6QbfNuCuAQbsKprYfkML93w7V4SvloX//SlDnFL8UrrFfda4Q2Hvc4Lsj2
         9IgRUnft6FfO+4rCE8eby785af99qyXRQFILqc/senDP6XJO23Fd4ir4jYxOanoUE1ZP
         NKwjossuR5eXlmZYa1KimSoxFwgIsLwTW8IcVWEK40ZV4dmPsWT2jyDgNiG0VIpJ9kiA
         5p+m7B5GSkw0CjFGVZkDErTekf1gNnj6EDR2ASIn9EJmcLHp5e7YrbX0Q/XAcHFmiHoS
         80do5ac+KeASVtmuaUf/B/KM508HjkDexBs5+00F8jiGzFWdooajMCF+EPL73GzN8zo7
         HE0g==
X-Forwarded-Encrypted: i=1; AFNElJ9aK4tnsH+mNdbFRpcP/VxL8X7XzH01tW+mUfrSe5JAzEtOhYjwCthkoc4BduWE9vRmotggFafX2ZtsSWOq@vger.kernel.org
X-Gm-Message-State: AOJu0YxuUs2gJMfrO/ri5dBw1yt5tZUK/Wp2Tn1RtlXIHyZKDx8vtxcJ
	cIuWeyiFPSZK4dFQLLLcaAbi9VGySi76GwXYKZkJjA4uv/jVwgls7IJRFTKnFPVRN0e1ytRmBzL
	KsbJTkMQk9G3cAVE8hxRE4o0WeMhj66j91DUdL9mIcGajGXpsH5HZOMMZK2cUu/DoX5FW0SyulB
	au13l2og8cTMPMCVTWVcnUsJjNrsPJRWIQmRFh6PzOEkc=
X-Gm-Gg: AfdE7ckgdWE5uOqGL4C77+g/dXOcsLPj1e6W1ySNhxEBakXpLSn720Put8Cd9zXWF/U
	Omgqgk5OFaV0Dcwf17CzdxlcplaKTh/67JOH9wzk3bCGFipZ0YD7gKcrlP/8QUFHbosxdMT86wa
	gjF5r9/E8pYAeXzWnTVbJe6AuIY43WvHHcCnvXZzVIBq6YfmKiAIWDBWCSsMRfze776n70RWZxp
	FcFRuxPuXoEbSiMlbjvqBnGrkWZAQ==
X-Received: by 2002:a05:6a21:694:b0:3bf:6c08:fb93 with SMTP id adf61e73a8af0-3bf6c09147bmr8846522637.53.1782719165187;
        Mon, 29 Jun 2026 00:46:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:694:b0:3bf:6c08:fb93 with SMTP id
 adf61e73a8af0-3bf6c09147bmr8846501637.53.1782719164714; Mon, 29 Jun 2026
 00:46:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-1-449a402673d0@oss.qualcomm.com>
 <hwn2kjauk3xt35cwmv3ludr3sxrwklf4n65p2tziox6m7req5o@lldl2cztbqi4> <276e001a-00a4-4822-849c-f1c0879b81d5@oss.qualcomm.com>
In-Reply-To: <276e001a-00a4-4822-849c-f1c0879b81d5@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:45:53 +0300
X-Gm-Features: AVVi8CcZBxmYWaIoIL4LytxUTmmGJMy6wbU3f0iW_j9dnLWGAuso1nTRnz7u_UQ
Message-ID: <CAO9ioeVq1UHC7w63vQOo2-hxZ-d=N+XPXrU8W4txXsDXqOf6gQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: shikra: Add MDSS display subsystem
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MiBTYWx0ZWRfX/o4/KoyFN8pc
 eJC/f1xVqnDQm2kFbjlFPnV8CCfCRK4aTZ18foYAXf2hTerA12j8OstDhHvyaJY469lA46AiJl1
 tQvxfFxiPh73rDiWL8h4L5lFQpJYI08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MiBTYWx0ZWRfX/oxBMEzn/EVb
 RTzs12R79CVJE/GQU38w+Biqw6+1R+PzQH3t7O6w6B5kD+Y2uOPoJwmP7mstq1nNybAfm8WVfUR
 bpr6zHkj8RMtrHyaPYFwNVJ3j3K/r4+oAOyFMecKWJjaOndbPAmxvOds9I17mef5FMKAd11ATNJ
 rzkp2XWxuvAAUT+AyWu3ZWDG81M1wLG+WMK3vLW3IbyiOSfdGjkfGI7+FZsxMdWO4YHBrNVCU02
 vfIh+wSHsotH0GVBlw/f5RO5O9YIyvmnyhsiz5biAeSupw5oZK6mXo7YIhNLSYoSNLzEZnNpDWP
 XlHgP26qHAvAHk8dAmF8Rh7X9kBwWHcZjkmGDNhzyIByDJqytfjACgF4y9QaI3m0qZB+g1zAK62
 RzaBDWVXdQ+Rnb7VLQ0g4woDNBParIlg2EThg7UwYQrl9lWq75a/+e5z1xM6a35+jIMjl6fwo9p
 QOlcs1nxW7dfQaP93Xg==
X-Proofpoint-GUID: 8RXR5x6YJg1aN7EPs2WAHTY8dNbWt_z8
X-Proofpoint-ORIG-GUID: 8RXR5x6YJg1aN7EPs2WAHTY8dNbWt_z8
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a4222be cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=7gqF0e2FHWVQxZ1fruEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114876-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 178436D74B4

On Mon, 29 Jun 2026 at 10:25, Nabige Aala <nabige.aala@oss.qualcomm.com> wrote:
>
> Hi Dmitry,
>
> you want me to use this generic power domain index ?
> => RPMPD_VDDCX

Which indices are used by the rest of the file?

Also, please , stop top-posting. And don't post HTML emails.

> On 6/28/2026 6:05 PM, Dmitry Baryshkov wrote:
> > On Sat, Jun 27, 2026 at 03:31:35PM +0530, Nabige Aala wrote:
> >> Add the SoC-level display subsystem nodes for Shikra: MDSS wrapper,
> >> DPU display controller, DSI host controller, and 14nm DSI PHY.
> >>
> >> Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
> >> compatible strings are used as the primary match with QCM2290 fallbacks
> >> to reuse the existing driver support.
> >>
> >> The dispcc clock inputs for the DSI byte and pixel PLLs are wired
> >> from mdss_dsi0_phy.
> >>
> >> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/shikra.dtsi | 203 ++++++++++++++++++++++++++++++++++-
> >>   1 file changed, 201 insertions(+), 2 deletions(-)
> >>
> >> +
> >> +                            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> >> +                                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> >> +                                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >> +                                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> >> +                                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> >> +                            clock-names = "bus",
> >> +                                          "iface",
> >> +                                          "core",
> >> +                                          "lut",
> >> +                                          "vsync";
> >> +
> >> +                            operating-points-v2 = <&mdp_opp_table>;
> >> +                            power-domains = <&rpmpd QCM2290_VDDCX>;
> > Don't blindly copy bits and pieces from other platforms. No, its' not
> > QCM2290.
> >
> >> +
> >> +                            ports {
> >> +                                    #address-cells = <1>;
> >> +                                    #size-cells = <0>;
> >> +
> > [...]
> >
> >> +
> >> +                            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> >> +                                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> >> +                            assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> >> +                                                     <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
> >> +
> >> +                            operating-points-v2 = <&dsi_opp_table>;
> >> +                            power-domains = <&rpmpd QCM2290_VDDCX>;
> > The same.
> >
> >> +                            phys = <&mdss_dsi0_phy>;
> >> +
> >> +                            #address-cells = <1>;
> >> +                            #size-cells = <0>;
> >> +
> >> +                            status = "disabled";
> >> +



-- 
With best wishes
Dmitry

