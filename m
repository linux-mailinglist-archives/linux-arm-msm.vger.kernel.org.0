Return-Path: <linux-arm-msm+bounces-92494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMZoGbsji2mPQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:25:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0849911AC53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D5C93047072
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7733B328B4D;
	Tue, 10 Feb 2026 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABXzolkr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEZGAiRf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288EB328B69
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726313; cv=none; b=g6m1qlqBWP41wdpRf9C/pcPUYAAnAHjR2wU48Aj+8220zRI9ZmPVx48VCkHRhDsMJEpVTN3Izckk7Th7dLYyAA/QvEnKex2oHEaPkD/MS9QmrW831mZXYnVHTkBndLxodgwGr+kEin4//E7wnYZzsVutEFEAg7Up+ySBSe0PGeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726313; c=relaxed/simple;
	bh=PSC/1sRjxTQ1f2Asq/tjCPh/1acRZSxW0lcahVtmmFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j85x4vSBv13FIKoDPGlpEQF6iR1U6jI9Zj9V7IJOeEBxI2ipFHCS1YWn5MT0hka7M4GlYEfiYqO+5hTgO2oUdxhhi5h2iOU35ggjNGGkshS8/0e6C+Q6u/t5f8oKrV776p5kqOl7F+opiBbU4mHKBy8yjNY9HxRey4jvYOgqBTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABXzolkr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEZGAiRf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A8ws6v1232087
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZyUoW/jNDnHRZkkA2vC1hnO5Ofarpv0yHADNbPa0h0=; b=ABXzolkr6HBxuIZb
	JCKcgGF7ufz3fvIRRpArHtmw+PhV49VFT3nnDEYW/atrY35sv2JRtXsBwpboQPJ6
	t+lkkIzizUx8tXtqsBFO3mLe8QnPQwZA5iIqM3Ic4BGhb9s9jsXn/Fq+UiFRwLeb
	8vMnu6nkaFLzTXmwFqRleyJqAHCnCTr6Cvu7QtpltwT++D8O6nQZHbRWrIRfJIku
	5F015BJ1xygN4eSJQxDIDQr5uFVOTqqZS5eWVEqLDWORncLf+KDMi2F/2dz8KpNt
	q3DV4siyD7HQdo+46Gkxdh/mLVYG6cphOGr7ZKThblXi2KAFxa8eFsv8hqHT2UVz
	LZWnhA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7uv59s1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:25:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-502b155a742so195367641cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770726309; x=1771331109; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AZyUoW/jNDnHRZkkA2vC1hnO5Ofarpv0yHADNbPa0h0=;
        b=KEZGAiRfzz1n6eHKfYyGcsTWRUKMxuHIfiN4Uu7jWDQUBAErDJR59KbmikomM2bE+N
         P6XmUJwln1XsdI48SJTkd/DFgsaZNuGuabQWqFn9iJxpEC22jF6ZS5u0tp40qn+7YWpA
         ohMyCuw8Plv6lH8H6V5l1Mj50c8LmtVH01HuvmeNyX88EChpGFyCx4qSPCbs5tawj/sl
         h9RP03VAGkKkJwUoICGlhM8iaARooV2qJVwZF/ixcerJ2sFF9m2C2Y67FJiRrwWx//ch
         Sro0b4/lSI3RJzGvdJVLBWSDcvCYf/wzw8dJAMOYStT6/6lDCWQcI5ID25ga/rzOPQ12
         1dgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770726309; x=1771331109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZyUoW/jNDnHRZkkA2vC1hnO5Ofarpv0yHADNbPa0h0=;
        b=Z7lST56taKdNK56QmzvmbOUk6pZ/aFwge1dNAs6esm+SLwC7UFZ0q/l0B9Cef/Hx2i
         a+C8e6/fk2ydkkmJgJZPtEmQCWfnR1KayRQLsu5ILxV+j4h4MVBeIqltlZ3EG++zZV20
         qQQcmCe0pvxgajvf/M2PaDcXgLk/oUuSurAB1jn/Ina1+boKqqjOKWqiXL1xXmCcb0sO
         J+Tj7TZPkBz8LEk+RHIy+dTWWOHxVsXM131fwkGuknIAgA7h3goTrlR8I2CS0TYdJ09A
         aceivs1AlG25YgV9UUujsN3I11LGU8dWgOne+vfFZbIn72JH2S0KpC6pQLDGTkMP78Zw
         lVrw==
X-Forwarded-Encrypted: i=1; AJvYcCXhC7kY601oIkqo8lF7EDM3dNuKKq1oriuVeYT2r1dDXhf9zfAE/+u2YojBep/pEDD3MFU8tzaJBYhxJay5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5LzlucDMJ65zSfBl+ax0etKMJXsrDsDYCleGxoLgpCGT+duTf
	Ryr31jNEfhsrN4WjwNgD8N1+lzwPfo+alOV4Kl3H+vtNVMNfRq2zYpqti7hCKbXF8cZa636zvdc
	WCGZAaWX/AUn4+1/FP9TdGMsEPScRiXK0P4wboDTp1FTg2XgkFnr+jaBVJ3XZbK+PMmyS
X-Gm-Gg: AZuq6aKi7J77LV2bT54d+3W7GI7SDGqTefq0n2r0FX6RAjcYMoQS2DpzQTCD0XoiMJ2
	9rt7hCCFtwa707K34YmvaA/Ej1AgNgxRQxkCAc9lNu8vuqGub7HFBcAfHFH1qzkoxVEBp7GxsGy
	qGm48i78Ks6xO/7w7ua7MufpUfVhyMRSing6sRyFCdQlEKdS9w9Mq5Om6uxR6oDDRu3wvSU1NCZ
	fAZvYxXkAL/4heTwknq7Cdyu7sE0NXTrvevGbtFZfakahzvZ2cTZaKPOnFaykVXVNV/nXKiZsZF
	KTJvgOEKAzdHqTj39h9ikZvaAi5LJlOA5c/soSCwnRmflDznbsX9spqg388FoEsOeR5tFxnw9be
	P5x4RsZrL8W62Fy7bSkMpd6CDetv38eSdAk7TQD54Nq2oAGV3DUBXnFFSJNqHrRfqehLa1RU6fH
	wX1t69nUtjYCMxqY7Nw0cApOjC6E0ps8lI94E=
X-Received: by 2002:a05:622a:245:b0:4ff:8754:eec2 with SMTP id d75a77b69052e-50673d98da0mr20160421cf.40.1770726309269;
        Tue, 10 Feb 2026 04:25:09 -0800 (PST)
X-Received: by 2002:a05:622a:245:b0:4ff:8754:eec2 with SMTP id d75a77b69052e-50673d98da0mr20159931cf.40.1770726308677;
        Tue, 10 Feb 2026 04:25:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ea9sm3321639e87.6.2026.02.10.04.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:25:07 -0800 (PST)
Date: Tue, 10 Feb 2026 14:25:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/9] pci: pwrctrl: generic: support for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <pvmi7hkk4j3uzyqt7qyeumm6mq7o3j7n5u47q5wibbjo4gf4jk@kfxy4n3hl44c>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-4-5b79c5d61a03@linaro.org>
 <fbxbnou5mdlhaq5dpxr3wdzmjetwdp7auaaqeunc67tgk5ej2m@cnnkr2pcwy77>
 <a4e55e91-0e03-4e63-8542-d8ad61b38906@linaro.org>
 <o6e5qygss55p6npjgaicxffsqdpv7kojgidr46zinsvfpxfxug@vn67nq4k6jzk>
 <b46da4da-93aa-4213-ad75-ec7709008b95@linaro.org>
 <qd5egc42mkdofs4ey7gl664e5el2p5sxwluesjtm7gc3y66hez@l4dz3bd5xm6n>
 <8b18433a-5836-4a65-b790-9f51112d1f5c@linaro.org>
 <cish7iljd23mon4onzbonpuvii7mccwygllr3bcqcpo7zbp2o2@lbzokxr6dod3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cish7iljd23mon4onzbonpuvii7mccwygllr3bcqcpo7zbp2o2@lbzokxr6dod3>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwNCBTYWx0ZWRfXzluW/jPU8T+O
 o9ud335u3uUdDtt/GYUFn+oxnYKY7DZ6zHk7mxx3HgnK/DbIGr8IHp7zQZYgePyFJvKl99C4N95
 yPL8zIV6b1/6mAKmYkAMGo9BWWBG57S638x1yNjQ5BaNiTo9gqbakJmZG4q0rkCq0CwMT1C98Jy
 YGjo/tuBpgvcL713eTRzQf6xe0yT1T5E106RhvFLrIuRv6eWNLEfKZ+rrrMAUrivEKqYC12wm3t
 Mr++WPsmQNE05jMWN1oGHQyaQnWBpda+E0/j7/y0nMAGDkA/PUdNSDvqtZrwQdQS3qJGfWKaYIW
 +tR4EiIIUJz5RGScrk0JjTnMPXxnH6Wo2S/X+v/2nHeg9Ylmy+jdlTZcN/fksWXqOfPsG6CPTZW
 wM9aHlC8tKtE3nEabdeFqIq2DeLpR3pciccfGZVfOz0hSaaqVO7Ip6Kxq7T2Uca90yRSkkxE2kP
 lqYmKPjlk5J6vu6h23A==
X-Authority-Analysis: v=2.4 cv=P+Q3RyAu c=1 sm=1 tr=0 ts=698b23a6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=bWODTdmjpByO2ujYuvkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MCvEmCHTAq5anAQmGn2JNPdRk_Enkqq7
X-Proofpoint-GUID: MCvEmCHTAq5anAQmGn2JNPdRk_Enkqq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92494-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0849911AC53
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 04:33:08PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Feb 10, 2026 at 10:01:00AM +0100, Neil Armstrong wrote:
> > On 2/10/26 09:00, Manivannan Sadhasivam wrote:
> > > On Mon, Feb 09, 2026 at 03:59:20PM +0100, Neil Armstrong wrote:
> > > > On 2/9/26 15:49, Manivannan Sadhasivam wrote:
> > > > > On Mon, Feb 09, 2026 at 03:00:02PM +0100, Neil Armstrong wrote:
> > > > > > On 2/9/26 12:30, Manivannan Sadhasivam wrote:
> > > > > > > On Fri, Feb 06, 2026 at 03:50:32PM +0100, Neil Armstrong wrote:
> > > > > > > > Enable the generic pwrctrl driver to control the power of the
> > > > > > > > PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.
> > > > > > > > 
> > > > > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > > > > ---
> > > > > > > >     drivers/pci/pwrctrl/generic.c | 4 ++++
> > > > > > > >     1 file changed, 4 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
> > > > > > > > index 08e53243cdbd..4a57a631362f 100644
> > > > > > > > --- a/drivers/pci/pwrctrl/generic.c
> > > > > > > > +++ b/drivers/pci/pwrctrl/generic.c
> > > > > > > > @@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
> > > > > > > >     	{
> > > > > > > >     		.compatible = "pciclass,0604",
> > > > > > > >     	},
> > > > > > > > +	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
> > > > > > > > +	{
> > > > > > > > +		.compatible = "pci1912,0014",
> > > > > > > 
> > > > > > > No need to add the compatible to the driver. Just use the existing compatible as
> > > > > > > fallback in the binding/dts.
> > > > > > 
> > > > > > ???
> > > > > > 
> > > > > > Sorry but this is insane, in no world a standalone PCIe USB controller could be qualified as
> > > > > > compatible as a pciclass,0604 slot.
> > > > > > 
> > > > > 
> > > > > AFAIU, 'compatibility' implies that the driver can safely fallback and would
> > > > > still work. If we add dedicated compatibles for each endpoint devices, then we
> > > > > will just keep adding forever. Powering up a PCIe slot and an endpoint device
> > > > > are conceptually same.
> > > > 
> > > > We're not speaking about driver here, but about compatible string which describes
> > > > a device, a PCI endpoint and a PCIe slot are 2 very different devices that are
> > > > nowhere compatible.
> > > > 
> > > > > 
> > > > > > Technically it would work just fine, but "compatibility" has a meaning....
> > > > > > 
> > > > > 
> > > > > I view compatibility interms of device operation, not device as a whole. But
> > > > > sure, I could be wrong. If the DT maintainers say so, I won't insist.
> > > > 
> > > > In the actual way it's defined _today_, the "slot" and "endpoint" power up schemes are
> > > > compatible, but I hope the slot bindings will get much more features to describe the
> > > > real world slots power properties. And no, endpoints will definitely not have the same
> > > > features as slots, using it as a fallback today is an error.
> > > > 
> > > > On the other side, adding a "simple-pci-endpoint" compatible that enables any supply
> > > > and clock would be a good solution, if the DT maintainers agrees of course.
> > > > 
> > > 
> > > We do have a 'pci-host-cam-generic' compatible. So we can also have something
> > > like 'pci-pwrctrl-generic' IMO.
> > 
> > I don't want to into this route, I just want to powerup the USB3 controller on
> > the Pocket S2 gaming device, not spend 6 months into _not_ modifying a driver compatible
> > list.
> > 
> 
> Sure, I don't want you to spend that much time either. But I was trying to avoid
> having a solution that just works only for your platform.
> 
> > All this feels bulky, who a pci device would be compatible with something like
> > 'pci-pwrctrl-generic' we're speaking about a pci device, not a power control device.
> > 
> > It's nowhere similar to the 'pci-host-cam-generic' situation, this describes well defined
> > host controller interface.
> > 
> 
> I honestly don't see much difference. ECAM is just *a way* of accessing the
> config space of the PCIe devices. If we can have a compatible based on that,
> then I don't see why can't we have one for pwrctrl. Only difference is that
> "pwrctrl" terminology is not part of any spec, but for sure every device would
> have some kind of power control implementation.

ECAM is a way of accessing config space. But there is nothing like that
for "pwrctrl-generic". It's just a Linux-internal view on powering on
these devices. Other OS would support ECAM, but would have no idea, what
pwrctrl-generic means.

> 
> Anyhow, I don't have other solutions on top of my head now. Let's go with
> per-device compatible for now. I'll deal with a generic solution later.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
With best wishes
Dmitry

