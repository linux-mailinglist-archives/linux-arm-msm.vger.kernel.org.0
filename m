Return-Path: <linux-arm-msm+bounces-96782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEWeKA2gsGkwlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 23:49:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C93F25912D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 23:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C689C317D776
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 22:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D10A3537EC;
	Tue, 10 Mar 2026 22:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obIyBVFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WshxHqVc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1F8215F6B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182987; cv=none; b=n+zAwCITSqs7NrhAgsvqbZVvcDHzr6lP8KqlPMcrnwu70e9zsxK1SjZU1EqZ9O5Z+9EW/UI0YyDTrcg2W7+P7ocPClumEXMIXH2x+BoE5M2OCxAheM2VRSpZFyxujSlS2/AXuYOdy1cxsjMf+uDDm70jUzlnGwqQtJLE7HHpmrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182987; c=relaxed/simple;
	bh=v+ZrcU91c9QASxR+/RihCw2I+Gl+m0lEe0t7KdGOWi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lR195R5x6yuyIHHPIgFfp6tMy2Og38m2RipSH98IofUDURYTQ7eYAA3Htx7KJy+AreTJLq9p8sORKt514wFfNAOgZs5KG5M+iMynztj3p1p2WnrUsSAD8vKSJohUGDUfbmQK4DhaPyknOlx6Pp7tZrhLAzUfb0gFflYmf9CTdGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obIyBVFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WshxHqVc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIv8c13892673
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S7mCBQwqvdOhvHU+bn8EBLkX
	cId8QXMT47Sfa58+8jk=; b=obIyBVFt+79DC16AzQUqigA/T/WocKANZpvD0BDm
	T9rw2E/X5zIJ0XoCxLlRGJwWkPAEMJwfctWulgnZOj6I4+77+zLIClFmn9SrrxNj
	snqLjbdBSUIDzRbqUIH+pUGHxfGoplbMQDOoZsWqFbEVoa+fuQ9uWrSZixOVrziZ
	ounFG4GGHt0vT+OKx+A/Wi7Xie9TJv1DjlPSwKRfrF/IZY/BaLMpJOmWOgVgEf/D
	idURrXiOr0btLB/fYlVoNaqpvnGCSK84RvSHd3vaR/WE3/Ew28c6CIG5ShswjXEk
	GbdCi2rIPqpRKENKtEX3GGAiP8wkYSEGAeklEci+ww61FQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyt7wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:49:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffc6cb5980so6808099137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773182985; x=1773787785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7mCBQwqvdOhvHU+bn8EBLkXcId8QXMT47Sfa58+8jk=;
        b=WshxHqVc3mPCGvFLtxVeJvPDFEtKNZZ6pCd7wAqNZmeMoGXzUfSBjHG9dfQ7h8WsDp
         aFuRXTYF6QEi9a94rBgqwZMXuix3UJ+YcZrSnpV5cHcMjR+k1irpoG5eBtnWj4G568FZ
         +arnweP5j10+PtxWuUjPnfLV9VJ0Kayu8sZNZ6UACOK2NXZ720cVKAbIFJ12KZl3sRxt
         m9yXXYcEKsXgg678e/+JUEy9QDBDQVmU6QJugxxI/qhK72qThl27plsOK1hm2kzgft5h
         cLp0qMF2zQ88zYokBaAnbcGY+S5aaH+aHvUMduU14IXz7nogU5kcckjznFTh5ZQa7TFn
         STKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773182985; x=1773787785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7mCBQwqvdOhvHU+bn8EBLkXcId8QXMT47Sfa58+8jk=;
        b=MxNPdoZhHqtIWabwcejRkIrIia4QbHaB/XHVzC4IlmXnQGdGuU7REh3uEEYpJQWfLY
         71nkeyKYDSNH5FNoaaPoAUDHDHIuHYnuyw+xZbMKXJDF8Gq9cojjp/cTyyMuyuy+LQ6J
         YiVUMYHs4FAHv/vlylDEthEqzpsvQdozM7xH5pnWKYjfzBjpWIUtxeOoFsVW1cJAWk2M
         71afmt+VBcGwA4NsseuM4v4qLOlM1xPu/7R8r1gR08aT57fMivok7GWySeZSCFz1MpQV
         F3nufCMYTgaMMe9PU6NwhPm8kNN0HYB+ECqIzq9RrPzHg1hn1th7uo+UYwf7wqn49h/S
         1qZw==
X-Forwarded-Encrypted: i=1; AJvYcCWdrEDRCcpkRdx87O/h5SeeGahuwLW0PBq0pVHrn5Tq3HArfxbqmUtG0eV2QHTicMl8irNuNWyCMr/D2wd6@vger.kernel.org
X-Gm-Message-State: AOJu0YyreHinxqkVqSKfZ8nIImcZS3z+c+PF4NgH8cajEFkO41EjqItc
	0v9xrtIPXdHn4jT1Ggz2E0onPLF7efFJWJAmxDk4CoTc00iyfAWUOyO9Db+i65vJlcN0rvuLh2E
	cBetLdNZKaalZJj7IQthP9LT/TLi8I0uHkSnFlGg8ncf1qCaHgtrri3yAwUL0Nsls2m+/
X-Gm-Gg: ATEYQzxsCAHYp/7DtsxIiQlwmFWmO+TuNFY1WbuAM4VzswPn4XzHbQz4CEWg/HnRDKP
	jBbugmcAvHKggOIIL7kfQbBHYL2L3O10Qo5N4gF/FeoIwAEnOgZOEJEBxwiVKLr+FWdMRkmdb9U
	GRUyOpnV4XhJEG7d9AOSgcG0TY4FrEZ1MA/HgERrfzc58T0Uktokhx5HR7D+0B25mMSw8Vx7Gmh
	U6ejr3TGJgFu0msrZfwGK6zvFexXlUjrh8A0zNc5j83ncabVdkDRB0hPTlzAo+dMSGpS74VEz1U
	2Zwz+tG/bE1jC20prr9cqjea/FEnJUi1dqNH2AijryaH20qN8vrZMDfCSZSmhn48MTjANMqxD7r
	G+X0KWkkGkmGRWpNVFqA0bZTqqrTlgudJXnpM9b4J+IRDdH7/jqyKeVwf03gIFlKQRjgQ2z4Mxl
	jF0m+SLwo2+TrQ4Dwq0gf11B1NfCZnyqsju7s=
X-Received: by 2002:a05:6102:3ed4:b0:5f5:459f:9860 with SMTP id ada2fe7eead31-601def7766bmr195779137.28.1773182984533;
        Tue, 10 Mar 2026 15:49:44 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed4:b0:5f5:459f:9860 with SMTP id ada2fe7eead31-601def7766bmr195758137.28.1773182984023;
        Tue, 10 Mar 2026 15:49:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e7908fsm559781fa.42.2026.03.10.15.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 15:49:42 -0700 (PDT)
Date: Wed, 11 Mar 2026 00:49:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
Message-ID: <6ddgxby2wzaa7mfbc64a4ld2rdbo6427csw6blzg5alstvkfv3@usfqftgctnzs>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
 <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b0a009 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=sfOm8-O8AAAA:8
 a=cDFCKFFyOUkPfWTXbrUA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: q14ON6KyQQaub_zliVjlGuNNXjkA7EKz
X-Proofpoint-ORIG-GUID: q14ON6KyQQaub_zliVjlGuNNXjkA7EKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE5NCBTYWx0ZWRfX49jSndNXNnnH
 evIOtbHp/R6GcIlfYnaC9P7d5n/AU1x1bWN1LnnI2B9U2N47neqVtUkyFTlu0m/qCaJ9w2V0DfF
 xCUeKW+JtC+s+glqYtfzc54cR2VQcAONGwYb6jCAes2KMB8oK1ypwxfRP8zkoGufqTf2aAk+R3k
 mHD2RN0xxvK0o1QxpmJNSx3/kCJM7YrkqBAxfUJRGXb/DD19kiJeRT2B95wx8uiH92zCxuGe4xb
 opgrEldXhuJBQCwAgKNQKgsOrHIzY3e0bn65izdVADebKsBYI8uGYhhBfzercaBfhQ8xwoRPiS/
 SwATNVp8F2shffbIV3tSeWT/Ctx/lseVh4+qJW8ByAJKVacvcU64IBWV+Sjw+0zkScgu4Ea7GET
 ZaroWzVwO8NEx3xuXfTquGRQUBu4ZxlaT2E/MOsOxdmVPaJ2wR/4JlNUqgM4M53HFezCffHx27G
 URs36eg6WklPKSBxsYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100194
X-Rspamd-Queue-Id: 0C93F25912D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96782-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,protonmail.com:email,oss.qualcomm.com:dkim,5d:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 02:08:40PM +0100, Konrad Dybcio wrote:
> On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
> > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > 
> > This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> > Add it to the device tree.
> > 
> > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > ---
> >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > index 7b2849405462..709ea6fc9fbb 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > @@ -94,6 +94,31 @@ &hsusb_phy {
> >  	status = "okay";
> >  };
> >  
> > +&i2c_3 {
> > +	status = "okay";
> > +
> > +	touchscreen@5d {
> > +		compatible = "goodix,gt5688";
> > +		reg = <0x5d>;
> > +
> > +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
> 
> interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
> even consume the former. Trying to read through some of that, I think

I think you need both, take a look, there are enough users of
ts->gpiod_int.

> it's on purpose since the IRQ GPIO is repurposed for setting the I2C addr
> (which nota bene doesn't match between the comment in that driver and this
> submission - perhaps that's just a SKU difference) during the reset
> sequence
> 
> i.e., does the touch work any different if you drop the above?
> does /proc/interrupts differ?
> 
> Konrad

-- 
With best wishes
Dmitry

