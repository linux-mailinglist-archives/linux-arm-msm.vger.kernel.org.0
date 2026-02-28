Return-Path: <linux-arm-msm+bounces-94579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBR7Fpm8omkS5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 10:59:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF331C1DA0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 10:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 013B2301082B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 09:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54073D6497;
	Sat, 28 Feb 2026 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJeE+RtN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTmaxdAH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F092868B5
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772272788; cv=none; b=OPbFTuLZlIR636v9wkL0+e2RuHn+7DZ+bQxfZwBt7yOuAmJskkh0ls/3lqvheC5XDoOLY7uSft+OpVLL4FGezlmtVwnoAMVAy9c+jhgPIEJg2E9CE+oDO2trHN2xjUJhuzO3e0C4NxkJYY0quAAEgBobnpqOxd3nUNyGbAVDtbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772272788; c=relaxed/simple;
	bh=lJ0jJU4tc7DuvZ1i7dNHVS+DrIzvVhKRJn3GLb3Tn1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7ZOpGUYM8KjR2ym34AUzsFJzIsyiRnuv0p44Pjdu/108Nuh5eVKD0qxpZmK4UpN1xF/fHb/r6st/bAQpidLXjQO7ZhPnkJ1+FogJTOSc3cJ2HIY6t5qSvOIYwjqrc7uW1IZxM0aT57uGMK1XM1uYl1hPYHDAMeYl8zUhsml3b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJeE+RtN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTmaxdAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S90AfN1252900
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 09:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oeUyHl+z+24C+mBajKJ/XFxOl45rVre6JxTCTLkK/jo=; b=ZJeE+RtNNCCleEtV
	7XKwcIjJ+ZFq9TNiqyPv7kT2DmqXB/ka2Ki0KREGjNabQBFQdhI8ykcz1PO1orsS
	4MWL3Ycspoccda+v2kuALOOR2mM1l8eTxWsjt2ZCnjlkc3zuKvxJk7VviMR+crAa
	UFgJVMCUbASkjDu9ACwWd4Mz1S3l2ldXgmH6Tg766S8B3mEaDsn+GVGCKAezAgBj
	3lPanOjiIDZhYEhFe6F41EBrSwmX8IlMT+fIx7m+7gSAPJzECmdBlJ8k0FgGmDih
	A3Nza6I9bwsrWW/J8C+KWYqS+EgjDY0IK02djzV5OKKyQsHU7wSbvHx7P4jxweyo
	dv4LzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn40p6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 09:59:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3d11b913so2376644585a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 01:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772272786; x=1772877586; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oeUyHl+z+24C+mBajKJ/XFxOl45rVre6JxTCTLkK/jo=;
        b=dTmaxdAH/vtjMH19pCOlP6rqjXQFTPRNbASo1Sl+vxrn+yLh5V/lVc+bXABsd3p+W0
         2Q6aZWOfzh6Z+RMhIRksbNqEiyORNNfew8pDn+SgbnzAxo/rCeWWDhj+yDy4I/BgoAQV
         7d5AiyGcoIJqaf5N+PQSi9+vWzfpXO1wUJHVhRF7pMvOhqQM1BwtVBF0kRNU8scq+9Oc
         P7my1Z8O+YuisPoBMKkOnOIkVXKOEgqQiH9fP+o++0HET+l6vQkQwzrXaaOoQP8Om/Jp
         mGQD7xsBKAnmTuqR6b6jV41gMmFx/mhmLcaOUDOQL840LWud0Hc4H8J5Eqj18pb7Drgz
         vhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772272786; x=1772877586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeUyHl+z+24C+mBajKJ/XFxOl45rVre6JxTCTLkK/jo=;
        b=cRZ0YjLEUBGX9clti+POk3ivWkdsZ9wP4dwOqWHLagx33dtFBj/SCv+AOPR34U/ArM
         vkKa5zaJcEX7Gzith2ZxOhVzyyXko6tsME7qHVC8HfIFw9M35dT6MKRtEJUjD8YvMEek
         KXo4sEfSfwPlTnTjxCOtyHv/Tny11nq9s85NtrDIJ7r0xOqvN3NeTFOogOvVz/RMUoqY
         VexL7DoKMSKvUjUq9CNtcnG4J99ZiQ6GgkArFwRpZIuam5g03qQ/TlUl2Hd+dO2fQe+U
         egDtFyXbx6nJXKBvrCodgtmWsvZz0WoxTYHH8Qkkk9quIjZSCsNgNgrixrrlfGtkmo3g
         1BOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk3Al2jxfz6NF24fQBKT3RMlAsdOO46pCvjZgOCMPPQQAE6TXhwds6pxNQBsYFrUvhDE2vxGmrJ/YMUVv2@vger.kernel.org
X-Gm-Message-State: AOJu0YxpJxlk7sT3Q6rwWE6dXnCs7hpQOrGmWIPbDbYOXKteoxQfilM+
	LIpUFWHdEU8nmAy3uOTZTyITkwkUE+PSXwOyuF8o5ED2+u69BdH3Bf3zMGoreCTo+gWysy7Yhs1
	3hkJDYNufBz6EQAP8Fg7EyfJZx3bMlvsAFONW4qxcOnvP8jR8n2+NWwaf0yXnnWcMnqOH
X-Gm-Gg: ATEYQzwhrcPDiT7uWXDM4YuKikNZr+9kB6U7eC6XiMsjd3ETdROUzPJpHCBakL/Fqxy
	zCNAk7hq11uEJq+xdA08fQVl7QBMlMKuQCpCTlVAOlEuXv5M4B+kmte5Ov7rCXfKdhT0uqbVpCe
	7eox8pn2Jo6BlOkfVsIXJEoRiMPEgNk6T/+cYCF1FwiA69FhtvYRmq1OaDB31u1Y3DugyHI7x78
	ya8gpkDtKTuE/dzkzODpecUlEQjGx3tnHX9/bz/NKEOZl5TLCuzMCbdZJ1LfCZxkWP+m01g+Rcw
	OgOeW86SJJplc730n2xRpnDjMfAe03zxBwQMRYC7UPunoLqZ0l7AHOysWfoBPqBZtJhhV/PuGld
	LoajJNusFSv3vOwTGXjXrTCwXUne581Z6k9Cw8PbprQeUadPGgbn2b9QY7/rNoMFqD95XEJLpv9
	Nr6EVfhA+6d16N/zR/k8bEx8HAozJ/lB1TiPc=
X-Received: by 2002:a05:620a:280d:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cbc8dc28c9mr707121385a.5.1772272785791;
        Sat, 28 Feb 2026 01:59:45 -0800 (PST)
X-Received: by 2002:a05:620a:280d:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cbc8dc28c9mr707119685a.5.1772272785318;
        Sat, 28 Feb 2026 01:59:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bc9fb4sm481670e87.23.2026.02.28.01.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 01:59:44 -0800 (PST)
Date: Sat, 28 Feb 2026 11:59:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans-evk: Enable the tertiary
 USB controller
Message-ID: <uwmxnps6b3przlwzoapf4lfmtrhslvvxikiukeoy3edzs5jjd7@m3hcnyayqvmq>
References: <20260226060835.608239-1-swati.agarwal@oss.qualcomm.com>
 <20260226060835.608239-4-swati.agarwal@oss.qualcomm.com>
 <ogtehltf7onbtwnn7kvkjhjyfoh4zhjltgzq4gf3f3lwoyhkmt@le3lrprfdvgw>
 <CAHz4bYuP6KnfEwvEucoE_50G1-CjhMHQXhxbK+jee1XyCKJDDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHz4bYuP6KnfEwvEucoE_50G1-CjhMHQXhxbK+jee1XyCKJDDg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a2bc92 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=OU6IiKEG9ziWOZ1dIgkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 30ehV_YqwDzxZ0lUQYuEBCgjryc1gr7u
X-Proofpoint-GUID: 30ehV_YqwDzxZ0lUQYuEBCgjryc1gr7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA5MiBTYWx0ZWRfX7ikyi+0FW3Vl
 SQGUWdg/o/MOJLl3B9xFjG/D/L8XFah61Ifg4V7fPiIyjGd5bUumYWtQfKQRFPIzv6A1Iom12fo
 xrEhmUAE1d1Xv9SI9CMZAapbVyb6VSYqxLUVX1F8vbX65N33kWYOwUN5n3AkQ/orNZqCpJ4mOus
 Vtqb9WZfY4JO2yVvAFaJg24zoo3sG/pI10VEhKufNee5mVtMgOCr1aQzAcj9hghah8onz3a9/5R
 sHdN9xP9BLL4lS8FaeENWdVMT2f+O2SE9bTKUls2iHVH3q+C7Jp4faJldlnYJaf0D4lmb2u+J1m
 KKS6+Ifri+1Z7CbNmG+LMWZWCVqFGAGMWdmVaosMJOAdWVwiUi2v6S2LISf2J/j7gR5GpTLi/7T
 QFaxjI1OCLeXKiYyrRedthcW6e+v3DLkOQfQrx+epjTnPpKrp9aNb30Le9DQ5P4759M2v1/boBP
 MxWwikUNhXEk79EYrGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280092
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-94579-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AF331C1DA0
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 11:26:07AM +0530, Swati Agarwal wrote:
> On Thu, Feb 26, 2026 at 12:36 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Feb 26, 2026 at 11:38:35AM +0530, Swati Agarwal wrote:
> > > Enable the tertiary usb controller connected to micro usb port in OTG mode
> > > on Lemans EVK platform.
> > >
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
> > >  1 file changed, 52 insertions(+)
> > >
> > > @@ -132,6 +151,15 @@ platform {
> > >               };
> > >       };
> > >
> > > +     usb2_vbus: regulator-usb2-vbus {
> >
> > What is the name (and the label) for the VBus regulator for the first
> > connector? It's visible just under your chunk. Why your chunk doesn't
> > use a similar name?
> Hi Dmitry,
> 
> As per Bjorn previous comment on v2 patch, "use supply name as per
> schematics" so that's the reason I followed that and created a label
> as per regulator name.
> For eg:- if the regulator name is vmmc_sdc then label vmmc_sdc:
> regulator-vmmc-sdc.
> In my case the regulator name in schematics is usb2_vbus, then the
> label I used is usb2_vbus: regulator-usb2-vbus .

Then please add a commit, bringing the other VBUS supply into the shape.
It doesn't look correct to have two VBUS supplies, which are defined
differently.

> 
> Regards,
> Swati

-- 
With best wishes
Dmitry

