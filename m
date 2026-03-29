Return-Path: <linux-arm-msm+bounces-100628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNmBHZVXyWkuxgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:47:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A5C353209
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E4B0300468F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 16:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF7A382286;
	Sun, 29 Mar 2026 16:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QubKJKJw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YaOhRGxU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769AC262A6
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774802827; cv=none; b=oK7oCDevGeiEH5l5kiFpKyAML4fYjk5jzUHLoK1ICbq8X+qLlJNtmkouPM1LTo1lzTp/LqIve54r68Htph73tieLEaXO1MAY2IaXKJjsON5+mvILYfEzJYvEFe6STKnGeamzNmOxbg0ZTFjLb/JatM6V3kWBJDJg7MAf5/eE7F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774802827; c=relaxed/simple;
	bh=ibl6XhNqyrvJUsHm2dX6Kpy2F0XScMl6vUZncNTkLgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CI4ISAv80h1jEVZH2wuRXwx2U+FfwClHBDBMOlJqvOZAaShiCMFdgtu2Tk/N+z79JhyXcT2VHIC3mI3455Ftuc7X+09T6o1gPr/5QBJPou1MjoCFo08AO8vH34pRQ8hGsH4og+tRIfPcY4u4qCocYDbcrQUmAYnI6xtIksKA0IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QubKJKJw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YaOhRGxU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhUSk2503708
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BDN5beH5ZkYhpK3cKd98+k92
	0N9cE+eiBV71p+13/Xg=; b=QubKJKJwZC5WMGT6nmGtV+KoBK6tc3NQc8/X4BYa
	+isw3BgQEQCGEvf+/a4sLtHWAasl4HuVTQj1mFvjijnWGJ8OuWpvsVdMiOASKzS9
	moBN8R72m6ZPhd9Iw96bVsgRW9geUbvLNtVrcMdlZG9bN92Y8jejGyLhLeqrSXqo
	9xVQT7dOjK/gyywc03X06idlsBTEbRcOnrobc7vT1SGdQs4Om/Tz0ioTAa31buPI
	NUvmdG7FpL0XiMJKFa38B6Y0btxKiQvDp2KHRGwi7ePZU7VV7M5znb0r+kK5eSZi
	x/r1FMERyYjuZyPEjIVdnZRNdOaEXqdjUbfVjCn7BQD9TA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afu93y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:47:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509044f54aaso118336521cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774802824; x=1775407624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BDN5beH5ZkYhpK3cKd98+k920N9cE+eiBV71p+13/Xg=;
        b=YaOhRGxU95ObdC9bWv9VzMZ8ja6kidzV5ugqdI5VGlxCJ6RJ6YaJZq5KVPyCG+P2dA
         sLDw+zaqrsAkpvmcF7ANrP4S/MgRtk7R3G1gBSdH8JDgJMOwvkX+BFrrWjnsXkBvdT3e
         0oTPTrPcne7QAhc6vUkQ/qRJ7Dgy9ejmt5SLxsSrglVBGLdQ0H3HLWXsDw2g+ON2DC/q
         pnYwCYcQ2otDUtfPXb+3+yKceVjWqI+dnhQXHhXvO866X6K8M0X8JFTFPm4OJOnLFhlW
         nbT2AnwR1ngaiEjB7nMo7GOBfPwXc3uglAiQgG2RroZNcYGbcD5SQDmY/5qFrKESmBcN
         +Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774802824; x=1775407624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDN5beH5ZkYhpK3cKd98+k920N9cE+eiBV71p+13/Xg=;
        b=QsgJ64i1u8ddXIG7pDy3DrtvMy4foMInk5BcrGv2L/qf/9zwpyBoUHqfwbL5LBLna0
         cIDV/v++l1yKsK4OETw+fNOYI3wFCJiISdAFHcdibx0UPzXetzTX1n/nhFQh2jJVyFZe
         lhtmvF7MEpWJjtzjT6zbZ4f7AgE0boiaxFtzcjUxI2vuvareeu159rbNkmBIlLZxaAQN
         vLe1d4Q4iw8KwAyEbxe/dMdP+8mRRYhFqBWiggvzXtRIslVpcqLn6z3dBLa5dxCt0D/0
         auMh/e5X8C1YqAAjLqbUyuWDKEIseg1dpYy3M0/dIaV6WOShx7R63F87HhcfbwPtW46H
         Ajuw==
X-Forwarded-Encrypted: i=1; AJvYcCUk3yrIqFOAamWMNhGiEZfs36PZPfQPruKzccy/tOd75cQKo2auFrkD+IDpXuDcu0KjapDhkwwnjgUpDxqO@vger.kernel.org
X-Gm-Message-State: AOJu0YzqU8OuC64FnH4L7OtSmeLm1z8zY0E6MFbDomC3gjc5Z32pWAim
	FEI4EfiigujIOxrJtwgDOdj4wEPBYp6hQGz4cKVFUWI4PHP/F2jNaFdUpqYqEJNtkcmNXuQhGgV
	y8kyBZxvKroHP20yM3kTDxcDzH12NqSlAvErGJn39X+9XxD9vb4Jzrz0+f0nGA5hvRTikeARrXR
	W8
X-Gm-Gg: ATEYQzz+oBS7gA+oGLafJ6c0TkB3sITNGJKNeY0gaksZdMpGoyVZhbhCcyMSSd2Wmh7
	23pgs6dzjLEYq44NH/Xb1Yj9GSabtIiUJCZ9448LMIYNgD20Z2LwtZsmK5tqj+jCUeIRIPpVNHd
	aI7ongOOIoptRDn+qgHuL8+s9q1Yd/yNKJiP9q4WWCwi9Fw9nIaYTdLT8uemdWRIW87FxzOEuO3
	VdTSbKDRVI/9pMZmX9qd4VKOxqmGwiEmShtQwLRr0yjsMVmmJMj2dC/MkXNwoV4uS2yrAvvqmw9
	MIAW8I7ICe4ph171JBSSLJT72vtbbB6q8VI6vaj/q03KFA2wS5kewYaI+NndYz0SaUbEUahS9T1
	qoc5MrQypZHTZE7OO3CGHuC945Tis9KXG2B79NB0wYfDrxGVgG5p1B1q6FPjuBct25nWuzLnUKW
	JLv77/vpcuqowfFGry0SjbiWbPs7W4Hz3iUSw=
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr132832491cf.17.1774802823778;
        Sun, 29 Mar 2026 09:47:03 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr132832291cf.17.1774802823326;
        Sun, 29 Mar 2026 09:47:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm10094801fa.12.2026.03.29.09.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:47:01 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:46:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: add blsp2_spi4 node
Message-ID: <2roskwzih3kaz5ca7hocew22jdbh5aqllood4urwqtfgt6wtqg@urzazog75lkm>
References: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
 <grmuh7b5phy6clv7izgq43yjtfxaulw3h6tqjenux35r5o3qnk@6q7nlgczigdx>
 <CACr-zFDv9mqZMOfHq+LjktA0DUVrTTw7-2oSxmu3U05ss2CQNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACr-zFDv9mqZMOfHq+LjktA0DUVrTTw7-2oSxmu3U05ss2CQNg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: Cg-9pvdjYtqexig0_-i78fPzskziQs-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEzMSBTYWx0ZWRfX690lC0H/WdPV
 l0NrOuII0ffRcPrjXUJ6S3Y7ilhdwMF22B+MEjDOKga32Hax4GrJQp7Xl5JD8tNbKbhY/02iYSm
 EO5eGA8ls7ZEkfzsH65GOlXGeI4I28Fww4YvH7utgTwj9XC5+1uK9HWQjzVX1TRz/NtTpRcRpjW
 LB7F1TGQR1hBNIbKfU+xPBot13oz/knMiapgN3c1Zx+VA9fbYTqYpD0KNyfAhlCDpf/lgo5dTdh
 En6CGAxYPSNfVSKTTbUuIj8y3lGZyDVGhTtoqv+hFX5ofwsri68qiYN1CkzMQ7uks52FLf2LRYw
 DNR2wTdxzZ9PMjrVh33xouj+CxclYS3yLNYRdPZ7eMz1g1rDGuF2B7BwB0WwV6db85TxpO1BaHT
 kc9DC54zHkgkbZhDvErGNC9SgpxWcd8cVaxCcjg9/85tRg2eTRqLRDpMA2NKq10LVd4l8oufLqW
 C4uuIK28S4l/8YaBaQA==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69c95788 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=vpzSWxukCRzuXf_FP-EA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Cg-9pvdjYtqexig0_-i78fPzskziQs-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290131
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100628-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[75b9000:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,75b7000:email,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2A5C353209
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 05:35:23PM +0100, Christopher Obbard wrote:
> Hi Dmitry,
> 
> Thanks for the review.
> 
> On Sun, 29 Mar 2026 at 17:03, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, Mar 29, 2026 at 02:19:15PM +0100, Christopher Obbard wrote:
> > > Add the BLSP2 SPI4 controller node together with its default and sleep
> > > pinctrl states.
> > >
> > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> > >
> > > @@ -3417,6 +3441,23 @@ blsp2_i2c3: i2c@75b7000 {
> > >                       status = "disabled";
> > >               };
> > >
> > > +             blsp2_spi4: spi@75b9000 {
> >
> > This should be coming after i2c@75b9000 (which needs to be renamed to
> > i2c4, btw)
> 
> I will move the node in the next revision.
> I will also add a separate commit to rename i2c@75b9000 from
> blsp2_i2c5 to blsp2_i2c4. I assume the pinctrls also need to be
> renamed to i2c4?
> Also, do you know of any other nodes which need to be renamed while I am there?

Hmm, after checking. For whatever reason, the nodes are off-by-one.
Sorry, I didn't notice it from the beginning. So, instead this should be
blsp2_spi5.

> 
> 
> > > +                     compatible = "qcom,spi-qup-v2.2.1";
> > > +                     reg = <0x075b9000 0x600>,
> > > +                             <0x07584000 0x2b000>;
> >
> > This wasn't tested against the bindings.
> 
> Oops - I will solve this in the next revision.
> 
> 
> Cheers!
> 
> Chris

-- 
With best wishes
Dmitry

