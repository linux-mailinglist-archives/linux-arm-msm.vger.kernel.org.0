Return-Path: <linux-arm-msm+bounces-110963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xAjGAN4hIGpawgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:45:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47806637A8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:45:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=onqXhhsv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EzdSR1A6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110963-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110963-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 568473026C26
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65BD43D50D;
	Wed,  3 Jun 2026 12:29:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6113D4105
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:29:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489766; cv=none; b=rDvQev1+SyxXCE8LDBJB2/CvTsGtpvZFdTTkCfjDrfHa9kCInvzE1sEfO0/wgrDJnHgT0O6wVEG9LxPz3QJYMa0eCi6JOkSx6+CJkOBILdKykYBlJz8hyoifuqgnPhZl/4Eu2++Ge5tbzgPbSDgbp4/OAs/ruEb+RzASEfmi590=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489766; c=relaxed/simple;
	bh=YMiHS7/GWiUf2GISl0uQrQVtiU37t172Bh0fR91tIQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwtEBNXeXH2wA/2yrYZO3GxONfTy5f2NdPFW5FtcVkKmDNWqZl0zRZieS8KxCoXXOo2uVfJBTkVyq2TJbhiyUhykmYoKh1gQT8Xc/36HjOAAF6n2QLkyKqANiwQYl+yrLwvj634/rAM/JxT7K01N5xB/BkpIap4tEErlrBm/9dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onqXhhsv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EzdSR1A6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RXAA1741017
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 12:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=; b=onqXhhsvHEFM3HWw
	klqBCjujNpHOAxiBAz3lOekrKdUWlpZCX63ui863WkH9Hb1M7/9MHQhvYud1fdIe
	EgWNFWRky8+f9bvFo4EJIhxkV06mCcDyhaI4hvwY9sJtqeGXqMpOb7EupJX3/Ydy
	gutLLmjCK29oBYSaoCHx+tD+81aGYPHBwBlB3havGfh0KVPszovtB5sG/8wfj1eg
	Q7D63DJxomJvO7Zi4S/A5ynmnTuqE4H4errGdBPlbeDk7W/ya33tJVViM72f6IpI
	LwZo9C0MM/sepb+9WTmk92+SC4xllUgc+ujq5zCo20J1fxpm7y2tpRZhp1ZO2i1a
	h2GVdQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejdq7sspr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 12:29:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6a2b8b91dc5so4062515137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780489763; x=1781094563; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=;
        b=EzdSR1A6eBkCe2KlYxdaTW6s3q+6UiDvU3TlAg/ZpObJowj8+1+1o4VAMIcT/SwuXI
         Bl2vfhYiI6pPmLlK+CdUVCXA+Dzjh+6m58WEs+dhFAtfQ2AdkrwtA20DhQuz2N2VCAYu
         AH5SmYRt8s4OfkPvRmwzQW/eedZlVuh3by94Mir1RXFw1apAPB/2smiu2MVo/qeEa19C
         1QG3Vgxc69hl2vPlcsj+JRlSLzcW/WjtGsHRWEhFjKq6U6VVqWngw2ojnKbUIpe/LjHS
         LlvyF8EK7EBGLQQQhX7IMbo5HAlBc8F7CBAyYXxJu6jIl4m53LKcrsLHmOGOe4nAihRT
         p/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489763; x=1781094563;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hMVk5w7oqbwOYmWzM+P1isNL2MH+1xWEAtw1PbLIu5k=;
        b=HeqMohna6hNAlClYaIEfpDMTZU2UlJyMiIdH8ULQP3eKR7pQ4pHEZHQoDXb+NBrwKc
         0mB/XIndssSGpYLuyxs7ph90w6ic1OuIlD7wTi3NsUvtIRWldFmrZKezeyWd3CRmD40P
         Gq5c/IsTTZ/SMRt0To3O+9kWHPGZ1G6/X7Cgw+MLp/tydBftQl1ggh0Sy/MkPV7JIMdL
         00PSKUhc/V5Re83WxjRYdPVhuj1Iihq23UJXlyxxPGPnZxLA6hOGRJAPPy6tKWuhuu1l
         OBOfVhvwKKq7PT6B8q3Ape2uiQHRA1a4xrX8gToqO4jU5evd+aSad7c/0dGFV/Cc1vkV
         Espg==
X-Forwarded-Encrypted: i=1; AFNElJ+o9WDwh+tW/f5BtDLzU57wIfjcbn244BuUfmjXrCcMHlXjxZKO5YRDf9dUMJ9PdCVwjkWTLnJJa1VXAUQM@vger.kernel.org
X-Gm-Message-State: AOJu0YzapuW+w8zKhc1erGokJL7lCxDrkM16Pya/xhFDqPahbu1g6j0Y
	GjJANuaTLceZjTsuvwm7oh7FGFAc/1ttsB2Mz99XXgDMRT85zuC/M/3G9k4a2AwdDKdsDTF8C+g
	JE+ZC7X2th8S0hnesDRSWmJZ4Bzd/OWFyqT5ECSKpVDBpX6nvgByi08jNk9css/7QV94AfQ9Ppz
	t+VtQ=
X-Gm-Gg: Acq92OHl8mDsy3h4w9ss5NelkVzJo1BH6ws7ujr0I2uc64QiTuqGNZUPYpskE5hz182
	6R7ZOgZGZs1HvobZfMmDcnT3bZdt/PfV3B8E1PkYkTH1Rco2vHopjgg20Dek/iDclDYGAb70HOu
	sfk8bvV4W9iJDMHKgqNv9GQpbM3WONF9R/LJOkyjvh5lyNnjyefOjub5dWItBZhdH+Hx6xABqTy
	iKMqcc7zjVX6nwUlmLnwK+atfhekWQmQgLMs96SbpImT2BZg+KggesyNa1cmYVrgrajftoO2dFB
	QZUAi7jNUthDc6egRHfU2bti0VIwYBcPv1EG/VUtlu4Bxqqi0MtU4ju2E7CFMO/gsj+Z7VZaT1z
	cIibirTP3rnIdrquVUHecAvP6Z8Y4/Dy73Rfy8HCe95D23tFNGajnZUnpuH6S9Ur6VQksYoH7Ap
	hKR3C50f48nmE/qVXtmVf4b9DmXxzDncDlG9oMRSzGEawtoQ==
X-Received: by 2002:a05:6102:5812:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6ec2b17b508mr1292404137.6.1780489763586;
        Wed, 03 Jun 2026 05:29:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5812:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6ec2b17b508mr1292387137.6.1780489763242;
        Wed, 03 Jun 2026 05:29:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c11csm620669e87.78.2026.06.03.05.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:29:22 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:29:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: MINETTE Alexandre <contact@alex-min.fr>
Cc: David Heidelberg <david@ixit.cz>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling
 pinctrl
Message-ID: <thj65jrvef3z3dmn5f52jplewrjgklomc5s32grktsjejs72sw@npk26yx2hpf7>
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
 <CAD++jLm=BxHsPJ4rgqwY8SvaefZUO+Pfv8E8xizqPsdJZw5weA@mail.gmail.com>
 <298550eb-1bdf-4d7c-8111-8b8f0b5dc056@app.fastmail.com>
 <4b797a3f-01c9-4b02-be98-7b82099c2e0e@ixit.cz>
 <48cfedcb-a9f5-402e-9973-f5c175fd2740@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48cfedcb-a9f5-402e-9973-f5c175fd2740@app.fastmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExOSBTYWx0ZWRfXyRNKQdeV31qY
 SyfUHIiTfc/BpMBiuuApdBIj30iLZ307BwbVItcebLWAXlcnEIyUuF5bMMjFcvpvncJOuo8Z1Y6
 X3imye27J5GjSU5C/JfDjVXb2Big9YEYp/5KUOJpSQW+7GAUcNlz7/idVD20+m5WcAhiP7CFTg9
 EkoidoG5Dlmrx2CuWDtk3uELU6xH5S9j6Se8r51xOd56W3juAPDFt2X1peiGotCvGO5CAb/EsJZ
 exYgrtoWnUy7YPerrDFhMph29R0DpamlHc6K6UGKZ9kSwf2AlDyGW+ZNM77B2JevPD8WbQh/wRh
 kbPpls95o8Frdr/PgprWH+G95V0JT7ep0i3qRufb9NSFOx59Srz8tcxCfbtHj14wARO6ew3e/D+
 AoyRJR/XiAopyW8mpu9zmgiq+3bNTdLUcxWyMXhdPgOhttLcRNplicsZnmYaySl21t8lD3yXw9f
 +AeE63rNl6pt1pZkt/Q==
X-Proofpoint-ORIG-GUID: 1JxAu2BNbS4_jcwojjrr17srjcP-HMRc
X-Proofpoint-GUID: 1JxAu2BNbS4_jcwojjrr17srjcP-HMRc
X-Authority-Analysis: v=2.4 cv=ccniaHDM c=1 sm=1 tr=0 ts=6a201e24 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=JV3oGrjsAGRtxPpt7K8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030119
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110963-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:david@ixit.cz,m:linusw@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:robin.clark@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:iommu@lists.linux.dev,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,alex-min.fr:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47806637A8C

On Wed, Jun 03, 2026 at 10:58:24AM +0200, MINETTE Alexandre wrote:
> Thanks David.
> 
> I initially considered adding a Fixes: tag, but I do not have a commit I
> can point to. This looks like a latent ordering issue in the
> Qualcomm pinctrl probe path and could have happened at any time until now. 
> 
> The failure became visible on APQ8064 boards such as this jflte, and I also
> have a report that the same change helps flo/deb, but I do not want to
> add a misleading Fixes tag as we don't really know which commit really triggered the race condition.

But there are no gpio-hogs on Nexus7/flo. 

> -- 
>   MINETTE Alexandre
>   contact@alex-min.fr
> 
> Mar 19 mai 2026, à 23:03, David Heidelberg a écrit :
> > On 19/05/2026 10:48, MINETTE Alexandre wrote:
> >> Thanks a lot Linus!
> >> 
> >> This patch is required for my Samsung Galaxy S4 GT-I9505 to boot but I also
> >> have confirmation from another contributor that the same pinctrl patch
> >> helped boot the ASUS Nexus 7 (2013), codenamed flo, which is also based
> >> on APQ8064.
> >> 
> >
> > Hello Alex,
> >
> > if what you wrote about asus-flo/deb is true, then this patch should have 
> > `Fixes: ` tag, as I remember it was booting with few limited patches ~5 years 
> > back then (only one serious was hack for proper clock bringup).
> >
> > David
> >
> > -- 
> > David Heidelberg

-- 
With best wishes
Dmitry

