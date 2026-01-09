Return-Path: <linux-arm-msm+bounces-88275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F6D0A268
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 14:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2476C30329DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 12:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A20D23F417;
	Fri,  9 Jan 2026 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfJX2H7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBtPWbX7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C480635C19C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963053; cv=none; b=vD04Rd/1vDvalYNwMfjODdb0RjCWepQzLr7CgVnCsxqxJhz5Efgw8CltrDmVnAP/QVnzR5mhEu1kUFQVeALgOQwdOfJpIWhm56S2PfMaK0wUH1kl1GbBjY+TRpeE9CHkWA4gbGG265aNxrmYO01vIhclbxkHxsuPtSCRgsdDvB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963053; c=relaxed/simple;
	bh=4a3iozHJZfUruZW62Jm1Yp2abSfdicV3Dz9F7NiAK64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzv2NrvNo3uo9v6Fud7Kqp9j1glzPa+mIH6wqSu4dZF9peOKlaHf+zPjkfLbFGy0ocKsaep1Fh9uJ2vyA6T7TwvdTz44Im7DLedbDWT9xurH8kBJ1/jtG6clefJN/MwanJnnYRSMSBpXnlKWI5Av7JKL8LHaaH+2Tkamvhnjx6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfJX2H7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBtPWbX7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609CkAeQ3542035
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 12:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uMi19bT/2KsvQExq9tXzAxTw
	QukDUINRo3BEZqQEqrc=; b=hfJX2H7Any2GdvrdmZXylSlyrTY08BEm8kXG12Cz
	2LQI6pARYh4sVLGl/2MTbYYdOLP09nkg/GtRUAdmYFkaztLr/+FMk/AdvfJwufAg
	swdv8PrwuST9kiu5BUgGyZcXEyzaws8n8B1csuuokCK3Qw2in4vgTVZcTe45QNMz
	hx9VfdvTx1iJOHk2fzkXYRlY8BE1anvbGE1N1NWWn6qzyrQm1eN3RqYtjGcmUn5W
	7G20sTCAECeZlJV4jAd5bMxmM66qPrcUW3TtADQx6YT+BHKbE8MZIp5KjRNDu0Qb
	8B0Dq9tjB2twMINC2X4k5/tqxczzJdrBuL5GGx27+ggJTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b1a09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 12:50:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b24383b680so1568482985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 04:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767963046; x=1768567846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMi19bT/2KsvQExq9tXzAxTwQukDUINRo3BEZqQEqrc=;
        b=BBtPWbX7dEUogL2O9ZlBYFI9+I5p2FS5luew8iy5ZlOb52haB20WDrqVVE2VZlkqzc
         6Dxbn1IJ65pnH7gxH3pZEC45wU2X4bLucSJObFXAAwNw0l7ukChst4v4bRbk+t3KOi4I
         gll/VJ8/l597DZJVBGQJfzqOVmzQjy46ROjeHQ233umFmHlRdY6heQ57drUXD2DZDNFd
         4nX3PfT7XDUoPuxL/lYFf/J+du4g/SLrWrkPDRoPM3iVAlVAZNagkq48EKT4nPree3sR
         PpX0mbRdoiqwfrD7oQQEyEJZl74qrmq042MoFXsPFeLCKbx3sWCnSmqvYMB3eC5VbB+S
         EsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963046; x=1768567846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMi19bT/2KsvQExq9tXzAxTwQukDUINRo3BEZqQEqrc=;
        b=N7WxP9AJY9NtrN5cayXcLgHFqjFe+mQXtRyd8ChwV3KGFvEMtxyml/in7xL1qLz6hk
         FOBu/X8GZjn01NaCcGkRteGsjuTr/OrgU4J3UVnFhX/9WBT2n2LgEEsPPf5k64BIHWTW
         E/qeo5UefMqkt4HPKpi224OUNr6FZSXWdJ1faxwQOOru9HDHoJpj8BR/e9U4Omqcvkul
         poDAny7nom2J4UowiB43Svrgj9RUcIAO30UJwHETrZVm4rJL6cU3yGPZ6EDELxZXGLu6
         7wwRteotT8ovWUa6hBxhK2CWjlwFOqcLzLHavlW6e3ytTL3Fm7pElZ8joS7uBnvpBNLH
         tlZg==
X-Forwarded-Encrypted: i=1; AJvYcCVC4vqJoG20ursHsuT0KhLpkGA6GLduYmgMnX8KwLZg1R6oqeffIbYA/wzYCe3QKRaaQ1gdTZhcg1PG8Aoc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Ex7Yfe7mggCECB4za1rG5dpOhPJD+Zb5Kcy5EX1hLvLGp8Ll
	2QWHfd5OV8B41Ut8sxnscnBRo/JS82abeeUJ9lZDnaHpdAvd+jOffIbbs5gjgAPbm/AMHGAGWGA
	x9r3hN7HEQetC6Zrj57m4DMy/uGir071T+O0V1pEYzQVu+ELOmYnscjVO+FCV6goESUcwr3J2F6
	DG
X-Gm-Gg: AY/fxX7wHZNALEvqMITmUywzlt+ALeyhVuhVrWXG/akhOci0C/JMB9ZA/UTytiMZ7k9
	AeqXDSV6F9RTW5RF3kiylZg74G1OQqeFaT++w04gzhKe02bWosHOfEFCncSVOu5fSFbZl4LJixO
	M59RmY48EPGTuqAz1ca9HDprhEvOkGsxUPQUeOgP+OoajPnW9Gd9lst6HBOKls5+Dxb40Q0S6YJ
	SDiKJnOUrH5KEkIXk3DZ1L+6S1bHjqks41pyzBs8l80PolP9ZVMcN2y6H0AZO7laYIuLmpfX/xY
	Hxbq9GxMku2F/c9L5xx7ClECxdaCp9nbkndUyzQ5OMxVlUCAUUX8+ikiSEkFEMmLex1QOnPk0jX
	g1zFMVzEV9lc00Qz7pIIAPQBWGNBWIuuwycP7s0q+mUPQchFfjaPiFDNu7Evw9cJV/Mz3pI4e3S
	2JMzx5N5am8e9qyAQOsc+Sq/U=
X-Received: by 2002:a05:620a:444b:b0:8b2:9fb7:62bd with SMTP id af79cd13be357-8c389417561mr1356384485a.74.1767963046249;
        Fri, 09 Jan 2026 04:50:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG98H1mAcma5eueuAgjBnLHiC7p5WGoxrEiz3bi1dp1G5/PFEWquv2v/Af/F4rLyMFSEYQdqQ==
X-Received: by 2002:a05:620a:444b:b0:8b2:9fb7:62bd with SMTP id af79cd13be357-8c389417561mr1356363085a.74.1767963042795;
        Fri, 09 Jan 2026 04:50:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6cc4d11csm2277684e87.74.2026.01.09.04.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:50:42 -0800 (PST)
Date: Fri, 9 Jan 2026 14:50:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, vkoul@kernel.org,
        kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org
Subject: Re: [PATCH 2/4] phy: qcom: qmp-usbc: Fix possible NULL-deref on
 early runtime suspend
Message-ID: <6hrjezmmq5ebevqgbbiqyjg7os6wmiolulw34sac5nw365m7v3@zxhz43h6kexa>
References: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
 <20260108154944.211886-3-loic.poulain@oss.qualcomm.com>
 <c6017022-c96e-4095-b85d-88784a44c13a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6017022-c96e-4095-b85d-88784a44c13a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NCBTYWx0ZWRfXwFbEgSb4H5l2
 ZqpYKmeGetX7i+Ktpvor2ikpO4x/Gz14zWa8cImiiDq9+SftunfFnXuvAXdlxMe+ou69olORFBL
 3M8ddHhgQDTwjW6Ltc+sMLYPmNMj0fJ9keg42muf0yqiNCoi5nMALJb/JNUgr+D8WLaikJxpYja
 0bMIXCd6SXjnwBUY104zrodR2+NUxBM3NH8AAg9ooIzS9pi+x1qd2L3gCNVEezDlqritCaquFwG
 BV0VynMqZXLpvzEdRoufcucuert/jbd+fKljohHMqALq2S4uDSapRcmqKBlBHUshNcv2dZlpiSX
 F10Dxj+7kJhiyKU0P/BPfn+KcPKqK32eunFK5zhXbrS86zB363KRbOGCaPZ8o0ZOwwpPzYKSLat
 gvkA+cYBKpCNHq/zgfUCk/lVyplY8Ry52hz7Ma4MnyskpYLs2pjsU2SLyoMVgZnVn2w6Ltsd3Bz
 M9VcbBu4QsA5bNSULrA==
X-Proofpoint-ORIG-GUID: qT2auWGyGqOmcNe7j7_oJ87B3Ujtzp6g
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=6960f9a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=UD6jFWV5_MqAamJTNaQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: qT2auWGyGqOmcNe7j7_oJ87B3Ujtzp6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090094

On Fri, Jan 09, 2026 at 12:26:58PM +0100, Konrad Dybcio wrote:
> On 1/8/26 4:49 PM, Loic Poulain wrote:
> > There is a small window where the runtime suspend callback may run
> > after pm_runtime_enable() and before pm_runtime_forbid(). In this
> > case, a crash occurs because runtime suspend/resume dereferences
> > qmp->phy pointer, which is not yet initialized:
> >     `if (!qmp->phy->init_count) {`
> > 
> > Use qmp->usb_init_count instead of qmp->phy->init_count to avoid
> > depending on the possibly uninitialized phy pointer.
> > 
> > Also reorder pm_runtime_enable() and pm_runtime_forbid() to prevent
> > the window where an unnecessary runtime suspend can occur.
> > 
> > Fixes: 19281571a4d5 ("phy: qcom: qmp-usb: split USB-C PHY driver")
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> > index 5e7fcb26744a..05717ca85c5b 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> > @@ -690,7 +690,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
> >  
> >  	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
> >  
> > -	if (!qmp->phy->init_count) {
> > +	if (!qmp->usb_init_count) {
> >  		dev_vdbg(dev, "PHY not initialized, bailing out\n");
> 
> FWIW this effectively says "if in DP mode, the PHY can't runtime suspend"
> which I'm not sure is what should happen.
> 
> In USB3 mode, there's definitely a register in PCS_USB to put it into
> "autonomous mode", where I believe all the hw does it listen for link
> sleep (U3 in USB3 spec) exit requests
> 
> In DP, I suppose we can't just yank the power until the controller
> decides to suspend the link, at which point we just power off the PHY..
> would that be right, Dmitry?

I think so.

> 
> Konrad
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

