Return-Path: <linux-arm-msm+bounces-99375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPEDGr6PwWmuTwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:08:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E872FBED6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95E87303707F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229F83370E4;
	Mon, 23 Mar 2026 19:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvafPpLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FuvouBzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F11F3358DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292824; cv=none; b=XHVqQ5R7aIXjWek6Onfl94INSsWKVI/cUjPCgUEUtszsuzLJ1tjs8Th32OfKI6U92J7T97as3Tk8e3ooIicHmBpQl+AKFKJ5U7XKRnU0SGpnAtwTrxypJ/eAbpxIFYjz24Sn1e2qTetvZOc7TaBR9dqUrxvxNZMe00blbB0DKdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292824; c=relaxed/simple;
	bh=NPqN3ef6T4XQ8XsQoY6vLNnQWsi7nWTan7dZRyN2cKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAXDSNwgS9LzEoIJJMCiLHWEe17V0ql73Sgx2veMm0kJ1LdMo/mmcxvW1SDGnzhx65XV/mlSwVHjrAqVEOjfaxBX4U0c4Pd/FrQcL7Z3LNXpEIxUknK65JMsarShu/F1RfBZs8xDwmPieloIoPBEqT/nb8YlodqWAtNnBt3G/yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvafPpLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FuvouBzP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqjrK2832502
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+D2WRk3lFemX8K3ZZyxgtii4
	UkKBRon2zEc6y/X3nnw=; b=KvafPpLXcLIr77YPaV0PI/mVc/JXejkP3OdOfxLP
	HMNJsS+KzZtrbS6Rnex4qQ+FLrkwSEwwOi99calR+kSSEx/bS+vKqX75yyHFueo0
	oaqjTNxkQDPLl5yJq3EmffjDSUu3pareh8/rn9drwEtpxj37sAoGDFB52q16w2id
	swDcp5BtuZP+FI7+yYZ3Lg4R1zdo9aypUF+Px8SSL1Vmot4CZoR8TMQCWbc5CrUG
	6qUREdm8kEHHeztcgtAs8O9sLoaq+lzBQxR5IRk0ef9qypEbI1zBOwRgkwjhxZHq
	Rp4tO37c9MwatrYl9ZTx9OdfgYcln/ELWj508Vjq2sDlhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jsa8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:07:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so228377761cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774292821; x=1774897621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+D2WRk3lFemX8K3ZZyxgtii4UkKBRon2zEc6y/X3nnw=;
        b=FuvouBzP46P2XNVvqIWSZIOvtKfLkEFuYDKT47WzV/kWcp84M6Xfqh1PRKdzyQNp2L
         YdiMlwJhFs1RIgKWCtnwowLVe/Riw/Vgs7k+nTShWY/IR9iIEM15hecD0t8GIwJVm2NV
         egIE9AZgT0rw5Nib5A/zeabBRM7HtNU4147G4tzv5DESCZ8/KCoL8ZXHD8SpYZZHYcXv
         4rGPdHf0do5bE7ssNWg/bmf9m4ZBwTOM0JaGvnYfRO73Bgt8DjYW73f2HX/0Fzssc+Lr
         dR9486yxb4H6glt5yuqey1FZFSk7VVVq6eGJTfW38SaTapjgQTDRKMHiAAByRgVXZhRI
         QLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292821; x=1774897621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+D2WRk3lFemX8K3ZZyxgtii4UkKBRon2zEc6y/X3nnw=;
        b=iuK1Yhr46zihsurdPcMun8y08RbixwZEqoZK+k1i1Ml3q+e2dZPh8TdKV6rRE/95OR
         pBEAeOy/djVxMJtIH+s/aUECEjgFtGpvGLN8TKxbKhizLrmrpRWjtaR9pKi63FRps0ss
         4SNKrp145AAtZE9bifQN1sVxyACazVh6HQwSlAprFOEM8YJuRC5goc5cOBCeCshn8bYk
         ziwosmTgbBwvCe+kE6gqh7ifwaPv03DSe0BO8kaN2FMg0Qh6k/yVmy5kYv5WN9mY6oGo
         P7Z57wJIacZKZBNEyPVPcYtjbq6KvbTW0qYB2zMPY2CH0XSySYwh5QMqBgNcMy5L+CBh
         uxLA==
X-Forwarded-Encrypted: i=1; AJvYcCXLNh1ui4Qc8lNWP/lmda1K4wuRBNbOrxAVSsdI1dd0evdudfXa//fypSLg0Jlhxed/D5Gg6Sq1LgTW+VAf@vger.kernel.org
X-Gm-Message-State: AOJu0YxmMYz/BrhVpgqCQO8i/0dvrokxLUqQUYCbgeCWaNyfy+Wwd6a0
	GxdbFmr807zvsUkpHA2QBSKaA5cwADWrC0ZMSUv4+HNhzqZzZzUqJme39G8dY95AkVmGQHGIvZD
	hw07jgVFgDQijW2Oi+Zi54Ub4yUk177l68AI91fZem2b7lWEAKozSJwNvqyKy91fpILNh
X-Gm-Gg: ATEYQzxL/2/NrBaczIS0CiG28UGRzbGbfbt5zFo7MkTlq71P3uoZEBe40EBBRMRUnUv
	6VT798TbUGTQkh5jgBchk6waXeu9k0qq7k8dvkNIxcmMqw7KorjbGfEs959cmlDkc9+fIPB4VLv
	sSm2/bPVHxGBWc+p1wBYXh9XOCuNtbrJkJgf//QMQwN5P2C1gWj/eZcHFeKlRqZHaQADfSwSLo4
	102QSaKtc1r0uJihaVjJpH/DLN9Uf1iLknn9YLVF2Jc/YWNPQ/Knr0UrAJOTh3KhXXE07+LwzVP
	6OLD+ym1AtL+pY265Y6y8OecY+bmn2FjGlJgHmdvDMzCZ8l9dqHlMxed7H8ttn8tLjGzR2598lz
	w7XVlU1ExRDJHwK+XPtSItBsNbEccyXGUCyASlVFvz3sQNEsnPIs5cfhTSlu7la6y1di1TIxYWs
	JKQ5PgiU9DrI/nFWaOCaNFKNUG4u44TjuHSFk=
X-Received: by 2002:a05:622a:8349:b0:509:e46:84ea with SMTP id d75a77b69052e-50b6eecc75cmr9871671cf.34.1774292820800;
        Mon, 23 Mar 2026 12:07:00 -0700 (PDT)
X-Received: by 2002:a05:622a:8349:b0:509:e46:84ea with SMTP id d75a77b69052e-50b6eecc75cmr9871101cf.34.1774292820286;
        Mon, 23 Mar 2026 12:07:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f68sm2596318e87.52.2026.03.23.12.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:06:57 -0700 (PDT)
Date: Mon, 23 Mar 2026 21:06:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add model string
Message-ID: <srndqldc5c3hr3vozvndl4zt66jb47b3iwyjghiqcjg2uoespg@yxg2hvugjrwe>
References: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
 <rdglzhmncexfcvec5hyenj7jx3m5hsphjlxsaeq2zhi4z4arml@bjeqghbbaoa2>
 <64f43d77-7c09-453e-8d7b-b4e0e5f05598@oss.qualcomm.com>
 <gmeo7kiryfh3qxspzidpwknxgmxqeqr6on2glrjj4tioh6apv5@p6rxe3jw2rkm>
 <0a44b9ea-9f2d-496e-8915-45186433dc1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a44b9ea-9f2d-496e-8915-45186433dc1e@oss.qualcomm.com>
X-Proofpoint-GUID: LQNQgLMpkZ6AKLVxCEyYDi_btDhArkDK
X-Proofpoint-ORIG-GUID: LQNQgLMpkZ6AKLVxCEyYDi_btDhArkDK
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c18f55 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MelL_d3sNiTB4l5edtYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MSBTYWx0ZWRfX8D4ggJtG3Iph
 wKy7C8O0WuIHYZfwcorfwPINwMyMgn7PbiemF4dTY0kCc0EM5jx5HNo5Ovr+GwxrNAZjsc12JCH
 57TcpkiB+n7ExLbvGTClUjNLm2wE0yKqPvqlh4qkMq296XtUMGUJp9ARzw4iEB7PrHhSvdP1PEe
 gFkNpyMWHuPtcmzzBS/zC6Otl9u66e1YUgMW9uzf2H5MWWy6Z/z+Ft7zHHdE2isqDd3FVu9SgPH
 UxkwF/k2FU15wsK/NvBfmLbVWTBxJYzOdpaErYZnhtV7q7Lvxdbpjy+kltMAPx1E7yWbX2cgczk
 6RMNXn8YHe1eSLWCeHMA9zhL9LbqcadDoRJQMDDRwcmcv7LOVcGlzzO6nu5SXBg6RmxKFbXCiOU
 EFcjyO7oeygVIn4gwcBl08gT87oQPrbwZizyV2N5yoMKlQFvQ1Yq/CnaalGcs1WouYl/vPGfchP
 bYSnU6d/h2+P6OCvIaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230141
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99375-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15E872FBED6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 10:33:45PM +0530, Umang Chheda wrote:
> Hello Dmitry,
> 
> On 3/13/2026 11:23 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 10, 2026 at 02:09:58PM +0530, Umang Chheda wrote:
> >> Hello Dmitry,
> >>
> >> On 3/10/2026 2:07 AM, Dmitry Baryshkov wrote:
> >>> On Mon, Mar 09, 2026 at 05:49:35PM +0530, Umang Chheda wrote:
> >>>> The RB3 Gen2 Industrial mezzanine DT file lacks a "model" property,
> >>>> resulting in the hardware always being reported as the "Robotics RB3gen2".
> >>>> This prevents applications and user-space tooling from distinguishing
> >>>> the Industrial mezzanine Kit from other RB3Gen2 variants.
> >>>>
> >>>> To ensure consistent identification across all RB3 Gen2 mezzanines,
> >>>> add the appropriate model string.
> >>>>
> >>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >>>> ---
> >>>>  .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso   | 4 ++++
> >>>>  1 file changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> >>>> index 619a42b5ef48..7d6e425dae89 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> >>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> >>>> @@ -8,6 +8,10 @@
> >>>>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> >>>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >>>>
> >>>> +&{/} {
> >>>> +	model = "Qualcomm Technologies, Inc. QCS6490 RB3gen2 Industrial Mezzanine";
> >>> So, what happens if I combine Industrial and Vision mezzanines?
> >> H/W does not support to connect both Industrial and vision mezzanine at same time - only single mezzanine can be
> >>
> >> connected at a given point in time - hence probably the above scenario would never occur.
> > Industrial mezzanine has all LS and HS connectors, so it is possible to
> > stack Vision mezz on top of the industrial one.
> 
> I re-checked - from f/w side as well multiple DTSO selection is not supported - and at a single point in time only single mezz can be selected

What does this have to do with the firmware? From the Linux build system
point of view we are combining the overlay into a single
qcs6490-rb3gen2-industrial-mezzanine.dtb file.

Nothing prevents me from writing:

qcs6490-rb3gen2-multi-mezzanine-dtbs := qcs6490-rb3gen2.dtb \
		qcs6490-rb3gen2-industrial-mezzanine.dtbo \
		qcs6490-rb3gen2-vision-mezzanine.dtbo
dtb-$(CONFIG_ARCH_QCOM)        += qcs6490-rb3gen2-multi-mezzanine.dtb

> considering above point - is it okay to have this patch ? I believe it would be good to have model string in the DTSO file added.

No. A _mezzanine_ can not be a device model. It is by definition
something that you plug into the main device. Maybe creating something
new, a new kit.

Moreover, the model name is not an ABI, we should not be using it for
device identification.

> Kindly share your views

-- 
With best wishes
Dmitry

