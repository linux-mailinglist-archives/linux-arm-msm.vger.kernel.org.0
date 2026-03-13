Return-Path: <linux-arm-msm+bounces-97299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLCIEk6Cs2msXQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:19:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E227D08F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57F603027C90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5206A30100D;
	Fri, 13 Mar 2026 03:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WV7P26Hv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EfYyJJ13"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11612299943
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773371977; cv=none; b=Ug6CxyP9KexnZAiiR+1DQkoXp1+gYRmF1ygBud8orwBfnLhIEwIcmLqK26jk/7kY6aH5t8fdutKFDq4X0SgoBawBT7TJxNnbzTmHhuJwc3q37rLGSqigr20gBgw3P6RWehHvR1RvvuqXrnhSozkNCoqYsKw7qAC71weFdf9S+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773371977; c=relaxed/simple;
	bh=CiC8qHOaeBNALSJh7gf/TtBW+j3ihZJAqzu0xdHcnZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsJPK8EPlqE0BLi5lqVXPktl3ihU6vHtd5iUrSvdNpJgM69l2Zp3eI9qFZduDI/gvIw7qlb8+Sircs1DO/HaLRIwKl/wcT6PmyHRWjN6LgZfJoSrZlyTM6lRG2KTa7EU0RUPZzth0pDgb7te5l8/ZopK2lbrUYCWebiiGWYmnNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WV7P26Hv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EfYyJJ13; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CI80mg587738
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IkdggySVelhlaYJszvwrmrsidn2lkmBIuJN6ToyHIbA=; b=WV7P26Hv8mb707hW
	RdxiRn5km7NBV05+SrCAtBFtJQAvJHVy3Y8f4vBpn+lNKf6doKjAkWvO1Iyu/GTT
	roBCRSWKQRSxhRl4htskpt1wf3ZSL5cN3iRbnqbHf80UlKtS5nw2XzhFlbriW+w3
	E4cotpGscIQGAbOSmNha0xMcuLfH3usUr5LEefJ8th4kEWuHywBk6Ck5KWB0xRO0
	YBS8kmr/901U7dRU3nY2ecHeciUlPtj4h5/eVhB/p1KR6o6J8PKIUBMi+NF8kF3I
	xdfiu4/wAxHtXvE+X/1oVHWa80SKAzM601peInQNYWyyLAhtP5UlW3BLJAOQiNCX
	J2Bcsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q4b6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:19:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509070bda13so156486181cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 20:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773371974; x=1773976774; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IkdggySVelhlaYJszvwrmrsidn2lkmBIuJN6ToyHIbA=;
        b=EfYyJJ13YKMTMEW9lqZZk0TZWXmxGu0itJjfFYNgPUSEpFGs1491m0rEiJQblDR1QE
         fVR4jU3hwf7Ww+hmzNsOvVg4Vwlue3B2RG029HflPsWKJm/1qD5DdDyqOzn2vhgvFMGA
         kcjHaXnEqLuk2ekhdFw+Om4ZsMyXZIp1pK1sUMnigUZA4nzKEXz/Ye/OvS1RPDe/Zupe
         cVk1rSkxdMKDtI9kSSxqHFhIdMHMOm44WjFnkJFAw3qO+QLD5Hcr4axJHQ+TqARTnxFo
         k3q5gYlvqTn3I818qGyMmKR98BhJHQjGLmi6TFd7cB5FHb4Pa19rbEz9Sl+1DYITxY2L
         pdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773371974; x=1773976774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkdggySVelhlaYJszvwrmrsidn2lkmBIuJN6ToyHIbA=;
        b=FdwAZ+WQjlz2ZIdkxknrhl1mEDDNrwy6h+fAuJ82mvvXwzlJN/M52oY0LfWt/Gs1Ek
         iCRO5zN3/8YWr9KIGx2LSb7H6aLwK8UMPVu7IA3zED16kPWCmhz3KDnLJBiBlZD8rE3S
         0lO93E3YUF+YJJIjLZ7M4HgKDVWxR04XREWDWsiz6QlGGDQSE9OuF/RDua9wFnmuV8qr
         wDDirEdyapiUN4oq7c7jyLWbj9YgrzJzb/B5pmP8uXPjOUgbEYUltEAn4mCfjP04JzSs
         O9aRdYavEdBWECzFCtmf/XhnJd0XkYDHpouphrpD46ZLpFb+kIwfcE/YiEnqBfVCuWaO
         uSlA==
X-Forwarded-Encrypted: i=1; AJvYcCVcW8GRk2hVdErPl+4BPVBRh6qrS1MehfPPpP1cusKjQoVRwanKglc57a0itV/Vf0XmJiO/ZvgTnJXDFWx1@vger.kernel.org
X-Gm-Message-State: AOJu0YyGdTqil7vIqtC88u1cuyFBPnDy10XESOWxQKGiw02r0bH2NobO
	P7wxywZ3Xd1jZKDIhihN5DJiB1opqWQuyME8b1oi4wD5A3csS1K2AA1Up5HTd8P8TuEXGBwyW1k
	HY2oKv8vpADNReaGE666WBN7JbqvqdIDMK/3zma2T5JGwQtttylW8xv3OauH3RM7lf4vx
X-Gm-Gg: ATEYQzzSLYPFk1SbSjqo9DNEik5HfVf6qlclhDWqTlR9OpZEqPqky7wIpDoKsvC9dPU
	0x2ERiuUDx2GnvXmaX1B/sQHsR3Fd95HEZwl2FKSkGbyyk4MudBIKeZFSMuzURDguDGlbIawq+4
	jwU03y7DHMdV/Heyq8p0zBcHmCJHJAXaNI/8bINkGLHpCsoCXvUdCWQKTJJ1RGpApZOw2ea8E3U
	qa8BFgZRNWbTMLs7gzL/e2ECoCcXbnkZBD7fIpZQrtywdhubnK0MyxJg7VwcpGp6bsQuBE2d5yM
	PZ0XrCGPqjaOGZMj5cjWb3en+E28hUc0ozpsQEOfR2DVbYHDLVTHCZ5Dc5TI9NhOc1Xnrma9iNq
	121cij2us4D5THW3+oyAuyqP62KIXOuzdhJrEpZhtRafi9sHo86TOZfAXXUXri5sVf6716s51hu
	gMScBtkJW4YZwLjh6H60HSB9pfLqGv0Rn6beE=
X-Received: by 2002:a05:622a:1915:b0:509:1260:b148 with SMTP id d75a77b69052e-509572b2ed7mr28393651cf.26.1773371974186;
        Thu, 12 Mar 2026 20:19:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1915:b0:509:1260:b148 with SMTP id d75a77b69052e-509572b2ed7mr28393341cf.26.1773371973733;
        Thu, 12 Mar 2026 20:19:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162aadsm1304869e87.43.2026.03.12.20.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:19:30 -0700 (PDT)
Date: Fri, 13 Mar 2026 05:19:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
Message-ID: <quybzbqxlohu6kiqmno2wzyltwejnc2vebxdgvdl3fdib7zg7u@wz3bkop7psu6>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com>
 <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
 <CALHNRZ_RU+uHXfUtSO+8pKOYfBuK9jbYgqWE70WMQ=5Qz2MvvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ_RU+uHXfUtSO+8pKOYfBuK9jbYgqWE70WMQ=5Qz2MvvQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: L4QXNGzzSTH9YscEj4i22-0orAzxFh10
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b38247 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=f7PW6T25hXEc860WGvwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: L4QXNGzzSTH9YscEj4i22-0orAzxFh10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyNCBTYWx0ZWRfXyOOPQBXEb5Nd
 FEiPKrLbH5NAoA0sg7E8IkuW0Rq2FE8Pj9sfyN8XaUwyN2pj/sGWJGxoNmVp/mE1Gedrd64NJMN
 oZfoDJAEJVE4dH4Gex8PMfhkQJMkPWfR2xsyFATXAsgiei0xfi+iElAA4V6uhFs2YQ9EcDRptj1
 I6DjzQJWpSCxVwpLlbAwEJ0WacOI6j1Zq94KFYW/1YaQ7xghPm2qWU6Pju8YkzmatHmjjjNpmRF
 5sosX9Lky5inizGqBnHYdtC8kyCv1AWlH76EuBgVa/FJmvnIEvOXIf/HSltvxfSb3YXcd1jIgY0
 n04Yhh/FHS+1VCBkTnC3TfHWm1kewKt6bJoaSE8YZT71sIgNVvu/inV5+NIh6/6H9xq0kN3l8IY
 gpiRnZGcKEuat30fQrVXLfSvAOX0pAqfbuB1JOvm7NJ+NP3nTtLCyr8s22H+nUpgBxYqlMzSrGu
 hZRaTw6AJw70d2uNtwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130024
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97299-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 497E227D08F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 08:39:37PM -0500, Aaron Kling wrote:
> On Wed, Mar 11, 2026 at 7:49 PM Val Packett <val@packett.cool> wrote:
> >
> > On 3/11/26 2:44 PM, Aaron Kling wrote:
> >
> > > From: Teguh Sobirin <teguh@sobir.in>
> > >
> > > This adds a base dtb of everything common between the AYN QCS8550
> > > devices. It is intended to be extended by device specific overlays.
> > >
> > > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> > >   arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 ++++++++++++++++++++
> > >   2 files changed, 1778 insertions(+)
> > > […]
> > > +/ {
> > > +     model = "AYN QCS8550 Common";
> > > +     compatible = "ayntec,qcs8550-common", "qcom,qcs8550", "qcom,sm8550";
> >
> > Huh?.. All existing -common files are .dtsi includes without their own
> > model/compatible, and the compile-time "dtbo" support is only used for
> > EL2 where we want to apply the same thing to many many devices without
> > polluting the tree with extra glue files. I don't see why this should be
> > a "common device" with its own compatible string, and not just a dtsi.
> 
> My use case for these devices is Android, using a single base dtb and
> variant dtbo's in a single software build. Given the aosp boot image
> v4 setup, using individual dtb's would require different vendor_boot
> images, which would require multiple build targets. This setup allows
> for my use case, while also having individual dtb targets for a
> standard Linux use case. To my knowledge, the final device specific
> dtb from this is the same as a dtb using a common dtsi.

This needs to be explained in the commit message. But do you need then a
model/compatible in the default dtb?

> 
> > > […]
> > > +&i2c0 {
> > > +     clock-frequency = <400000>;
> > > +     status = "okay";
> > > +};
> > > +
> > > +&i2c4 {
> > > +     clock-frequency = <400000>;
> > > +     status = "okay";
> > > +};
> > > +
> > > +&i2c12 {
> > > +     clock-frequency = <400000>;
> > > +     status = "okay";
> > > +};
> > If the individual devices actually use these busses, better to enable
> > them inside of their .dts as well I think?
> 
> I can move them. I think the idea was that all variants do use these,
> but for different hardware, so might as well commonize this part. This
> part existed before I started working on the devices, so I can't say
> for sure.

Well, the only common part is the frequency & status, so not so much.

BTW: could you please uniformly add an empty line before the status
properties?

> 
> > > +&iris {
> > > +     status = "okay";
> > > +};
> > Works with generic firmware?
> 
> I have not been able to verify this. Unfortunately, there is not an
> aidl v4l2 c2 hal for aosp. If the expectation is that device specific
> firmware is needed, even for unfused devices, I can drop this section
> until I am able to use it. Or maybe Teguh could chime in if this works
> on ROCKNIX.

You can use ffmpeg to verify the unit. It has v4l2m2m codecs.

-- 
With best wishes
Dmitry

