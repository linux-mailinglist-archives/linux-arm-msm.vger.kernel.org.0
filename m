Return-Path: <linux-arm-msm+bounces-95216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBd9IJlgp2lvhAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 23:28:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7DA1F7FD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 23:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7BB530DD57D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 22:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40123EDABB;
	Tue,  3 Mar 2026 22:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNkaXJvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7R7+f/J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FD739659D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 22:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772576910; cv=none; b=YBDgA5b4v/dRE9aUsoYDkx+dIaOrvc+CRdMdxnKcju445vXaJBNmebjtLQQB3eMdX5ceK7IfTT1V0gAFah2UpbJ/57/tMhRMxHX2JcRqYSS6t9gAs7JzTSshiQlqtzY9jo1WMXdDix5nm/MpNV08xCB6lQEJF2aT/ZzLjrBiLoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772576910; c=relaxed/simple;
	bh=43ODfSZcUzBQTYKiiCeti8jxSCEV0BXnx0H9eW8/Hls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOGhOpWx0TsVqb43H/uwexx+ygCTGDx9q8xnnhuRe4JY5e98VKbP9S7OT47sR5LjsLMehmuHZLENyJ1022nVdWI6VzQzCs0CqMbhQBrL7C3ix3WDgpLen//AiGrp9bXr8L+5MMyWINHxXSUHsqLeevnDdNAGDl2SLVGEAWwxHL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNkaXJvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7R7+f/J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623HBHDd2786721
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 22:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P3sf8FAqqEmrZ3kQlF0AcrpG
	0JzllvKYNW2tsVeXgps=; b=YNkaXJvmnUGbWafXGXjdQMr5vwNDktlZkKxbb6o1
	hUKXbEhT/mB5rZw0N3QUQb7/aUJmEpBInMbdafacN+09i5/Pyj1g5HL1GDpJvQTt
	C4WBz6V/e/7DWsm5rajLO4QIsmDP/1cjx7g58N9IOEKVQ7Xk77eFi2BtO59dFw7m
	DpQvhoYNUBbGjJJKG8udmEDe0YjUbkFI/8ebTIZcMs1ioJ9EK7l7eqioMZYdwfPY
	8VBf0lj3naEGfu2BGfp/zR8sH2tI8XTuPHjtTsKxoB+5HeGtmZJPVayTpWCEvUqW
	Fzvia3AdNApZ7jYqIG8Po+HBApGqG2zvO/yiTr+rfq1WqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvh2ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 22:28:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a0796368eso103256766d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 14:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772576906; x=1773181706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P3sf8FAqqEmrZ3kQlF0AcrpG0JzllvKYNW2tsVeXgps=;
        b=K7R7+f/JATOLO8v/w42BdTvH5ZgwMl38v14nTRD7fhqGgEzAaJrkJhI1lIwR5oJCjZ
         UZRzSr3HqLvG4a4AsGuc5QRYmFowWPiy3S2iKnR5q/EDF5ev9HUmdPEVyG4PUROMuVs6
         S4X5uSVUKTTHOiiqus9S46FGG3lt92ZWq30tdSgGTrigR83epIG2sqlt7a6s1WyNHV1H
         lTHJJzkxcc+l0jV868UjFI1n81mG6nOqScQjal6piH3aTBXass+4zTYh+nqwTyME1uN3
         bIiVVMqjxTzsFgD6ySPQQzszmbkRCJ3PQ/Dhoq0iiC5OflbYM4MeMr0g64Q34Y9SWq8U
         G4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772576906; x=1773181706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3sf8FAqqEmrZ3kQlF0AcrpG0JzllvKYNW2tsVeXgps=;
        b=C/NI3HywJ5QFYEQto/zG4+q77Al3rr0CjyFL0fLndHpSYlBuwO5hMrf3J25s7UJI85
         BlydhSvb3ugwDHc44JtKzAbFI8HG1HZmiObd9MNYsR3iR7vgTe6os5FfAvU90nTl7LQg
         X640oQzgBYPXIvJjqx2lXxnjZ3YfDd+DodsNhBVMLo4pV48ev0FiJENqUrGYXrmaBUqd
         2wh/9W/VSnblFgApYYr87r9LEJMz6CNelg9CobsMySvDNFIv6Rqs6UurkZrE3bpeeY9/
         jFJNy0Nwm5J/fw65htxStnkii4oFhbyJQSBlqp8PSvs4kAhE9jxtezw80RTPyC6lW2WX
         Cagw==
X-Forwarded-Encrypted: i=1; AJvYcCVolrYRhY9ONs9IcM24sHuyVPJy1biAB0Wyk3jT+uYdQpxxnkrhmODJXtL/YdJ97qOpiOIPZZtHJON4N1I5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Vdamkg9jiM9GEwh2bbrQdIKZSA6v1k0Xg2vKjjOMuOth9Uuu
	vpOjP4f8CNoZqITAEnyl9FXDL0BZ0dKsujg097N9jTosYV7K1U78OVYqE8mJjiCBfnVOuL8roYh
	VU5xjjjG6JU2edvqwdGsUtDvGznMCirPLwGfTMgSb8qP/+XJ/UsvJf0wO9loLWFUHaZCi
X-Gm-Gg: ATEYQzyQvPDi0NUzu0boHqX3bSVdJldaLdX7hUqq1DkGCaL+9C65J61F2Qa+aGnaLQ3
	n9jdVJTYyUJcVflREhBnbu995upruuBdBaHpdI7RORNlOxHlEqrX0XuVCb4kRzvSns0t3lbHsed
	mu34kHn9/ugWXkioDKTZWrb5cs3q+fW0jcUkUt6s9AoL3siwcdYJrfhzVTl+mYlJwQDumdY/ptw
	/+quddX6u/9OodcZ/+Z7Qq2UwgtRQrWaxdfvIirtCPfW80jhuLgLv0oQ7aSbGBbZT2yZnWrbEKp
	NUT3OhR9y/dgkatLPILp6Yahx6yBYt6kGNt/fFNlLd/Tu65NR5fsXcHf/Yl8aM6nlVUxMGOBEUj
	g4GGgnOQisKUSgyfUNvCGkCwyMkLffwhwDFdrWhqH7dszZ/M/CJSi/+eJ2TFXE35pD76Ml9cdnf
	rcLcRPoKKJLjGnH4Nj0wqJULllT9QYqzhjCf0=
X-Received: by 2002:a05:620a:199f:b0:8c5:3256:2f47 with SMTP id af79cd13be357-8cbc8e7885cmr2266682385a.68.1772576906183;
        Tue, 03 Mar 2026 14:28:26 -0800 (PST)
X-Received: by 2002:a05:620a:199f:b0:8c5:3256:2f47 with SMTP id af79cd13be357-8cbc8e7885cmr2266678585a.68.1772576905724;
        Tue, 03 Mar 2026 14:28:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12356ff44sm847928e87.87.2026.03.03.14.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:28:25 -0800 (PST)
Date: Wed, 4 Mar 2026 00:28:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 6/7] media: iris: add iris4 specific H265 line buffer
 calculation
Message-ID: <hrjwyqz4r6usqvxhnsvtap4byfu2zvumji6whudda55vuym5yk@u6s4heswm4rc>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-6-850043ac3933@oss.qualcomm.com>
 <cbwz5wtd55enswdi2zvvy3d66nsxlemyzdypheibvljnewmkax@kybx63aveepn>
 <ce80e60e-90ca-415d-83af-4fe2e86ffd91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce80e60e-90ca-415d-83af-4fe2e86ffd91@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE4NSBTYWx0ZWRfX6MJiQWIUfwfO
 CwvTsy59QD7oaQwNTO38g93rhLRsotVJPDQFX9uSXLd5jovfUs5IYbXynnu+cDaJncqkr9Sczn+
 lBugUsNCUR/PalUyfMOyR134ZQG53Ms22/MH3uRPbQItJLbdvLjglPWhj3QsTxYnpk/vCOpeSDO
 zQRzmjr+Qgg9GDaSV8BDIWAkOlnYMkKLlIxaFume8P6lbcRiBIy2+LiE//uWGmT6V7DcD0cHysP
 8UY07SgK9Zq0czg8KEMZOiU6A9+KCpF3qtCGUoF8Vf+1+zGR7loUoU4pECO7yTXCq7eILpQVoKR
 CIUCXoAwsHE8/c5pWFa4KTIrSLxZtgcBh0wOPGmh6wokdH8ci6tf8PD+HxqnipDIHSCZaYhkDaY
 Di/H9l254TsqLZ6crig94Ekfg+5+pA/D8qehCi4zdygAyhqVJrPk98bFGkCIgdkOQf3kY9yEx9i
 mRHTHtCv98SjFoVdjjQ==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a7608b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=l8RJfLSqy8S6moWSJ7UA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: X3kc7Is0Fdwe04JJn1G24K5n8SNCey7v
X-Proofpoint-ORIG-GUID: X3kc7Is0Fdwe04JJn1G24K5n8SNCey7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030185
X-Rspamd-Queue-Id: DE7DA1F7FD2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95216-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 12:18:58AM +0530, Vikash Garodia wrote:
> 
> On 2/28/2026 1:58 AM, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 07:41:22PM +0530, Vikash Garodia wrote:
> > > The H265 decoder line buffer size calculation for iris4 (VPU4) was
> > > previously reusing the iris3 formula. While this works for most
> > > resolutions, certain configurations require a larger buffer size on
> > > iris4, causing firmware errors during decode. This resolves firmware
> > > failures seen with specific test vectors on kaanapali (iris4), and fixes
> > > the following failing fluster tests
> > > - PICSIZE_C_Bossen_1
> > > - WPP_E_ericsson_MAIN_2
> > 
> > This reminds me of the commit fixing SC7280 support. Should SC7280 or
> > all VPU2.0 platforms also use separate formula?
> > 
> for vpu2, there is already a separate formula

It was more of "do we need separate formulas within vpu2".

> 
> > > 
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 51 +++++++++++++++++++++-
> > >   1 file changed, 50 insertions(+), 1 deletion(-)
> > > 

-- 
With best wishes
Dmitry

