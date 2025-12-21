Return-Path: <linux-arm-msm+bounces-86057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C10CD39D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 03:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44CD1300D407
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 02:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A6E168BD;
	Sun, 21 Dec 2025 02:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gi1Odviy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekn4XFSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072CCA937
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 02:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766285350; cv=none; b=cnvLvnrAJW5bmGtK34l7HVLJ5S699zki/1oWxN92d5DxL/ebZOCPFnKjx3bqZ6RlnNpgOH+taAGvOwx/GumpaHl35fgwbMoSFuYyMA/3UthMPonW+RAkmDBjOmdBnTotYQByyafBeUwQcZt1dSAjRrH1HECkZLA0NPS/K8a7FUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766285350; c=relaxed/simple;
	bh=4hgXj8Pmpa+ynKdMCDBlN0z2koi/im5+/JqiifRdOPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsY9RSzTHt57AruxxOqiLleMIJyBbkqEVS6ok5qW/mO0DJT4CkH0TweEyVejlmiXr4tqa/DLffFoHdNEWPSnFXHzbjWfiASun7Jboto1d7Gh3QdyvYT9aT5eFX8ws27jXtT40xkBMSXT0yvQn59n90LTrcaS2nt6SiJvQaTzO1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gi1Odviy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekn4XFSj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BL2RDuN1398487
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 02:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	baN69HALTcc4BrWKlkYV1bDru2Yk1sycQmONrHJvY1Q=; b=Gi1Odviyqf2CJqJv
	n5FiuAJWxiTlbXD9vniZRC4zUhrjHWtyRKJ/Ysn+3mF3fQZO4VOKaS6LiFXb1uG0
	1t8y57jEBccmy6Kl1xLNoic23OA7rucPSuZRV0xVHn/3emCbTD8fiCs7zoAwA7+j
	BP30n8B0IPU0UXdk6EnXFPo9IY7Ifw8uJmp2zPSWqDUsBncA6v4a7TW67ZwR2DPi
	T4kIiBUradIdo0ME7fAVOu2e+3AmPFjXkTLONlCARsHs1diz0oSuSGK+I5N2V34P
	qNo2GTbHFtJuhRYJ9vN9DfydpHN2Jg8ER2Xu9plv+6vqB2glrTByFF0CeeGZAK/O
	Vj1rtw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru1pf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 02:49:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed69f9ce96so95061441cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766285346; x=1766890146; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=baN69HALTcc4BrWKlkYV1bDru2Yk1sycQmONrHJvY1Q=;
        b=ekn4XFSjfCeqYwJKLtbPDZh7/FALQKA0sCogU6FDo/o7eUJO0s5oxWBVtMQzzlSoRG
         q5rL2krLMYt732QF8v9wWChQfc97Xy9dIFmfF0Js6Cmz26KMzgFY6x0K/hhW8kvinY2Q
         CeEdyj5G9mLhTYmZJ+cothTvMOPAd1ocxXp07nTTasf7Zgm7EJbIFn3mFp/jf+W2DkBQ
         ZebJLCVsWfadOJhImIkuOGsmv2DLsWk3PWt8yyew05FhIQ9r2Kfp+4emlfB+zP8jQlNp
         cEyzFrmPDLE1HYzkGoPiipM0IFb5tnbxyZyX8I5s/epVmXmEu/TPpb+PiK7MfU+zzPka
         XXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766285346; x=1766890146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=baN69HALTcc4BrWKlkYV1bDru2Yk1sycQmONrHJvY1Q=;
        b=B/0bSnaoE9mOcPZcFLuBqDfmSViftyss6hVABFZIZOY8hp+VCSEimBgroq4+805DOs
         WMV0I1FTevhuQraWgdZL4ZOpJoS5zMSxWVt33L8euQ4geXJ0waX8OkYNU2IGeoG//fms
         BWfpGL3mEYQ8HsLIobRXFEAgwxM0Qlaye5tVRCv6bEHTVBfsi1YvfU/5GnoR67ZnGnbx
         QONfZA6gkCNyqdfX0scimys+xmWcwdW4TER9JrFyL0ILm9rewJp3n5ekNgXiafSfp0gA
         4GKtEnM6zsVFRe/crGognHKa04VgDMHWnZvfRhTpL+GpOfcK0+NnP2SlGci3bROwZtzj
         M/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWR2/RyZnsH+idHrw4W3/DrJVahfMnuK74Xn/3lcW9/0cp+xZQ+bO/pjPV4kchWLs8//99i6GPrbC/bqzhd@vger.kernel.org
X-Gm-Message-State: AOJu0YwCT+462IIYIYjuh5eM+eG9DXomJN2mMDtWVtPZvi9QiFpB7Mr6
	XAcAGypMi8Gz6FEenhDjJGc2WXj0JUn14MPo23hCwRRgNh6biWKWTDe8kc5VSyZeGa6WAI3RA5k
	Yy4TdWwCOtdg6+IdTUB6cqLy17ZgTVw3qi4uUoNb0wHfYvttcqfwRZ0kTQUWOfATaYaPs
X-Gm-Gg: AY/fxX6XVmiKLL37KVpKy+EdTF14S+UC01uQefofI1cphkkvP1Gld9iF/TFGFOSivxJ
	aMCgCcuy+LmhLFtM5fTS64f+eAC4gTpbiVC9KbwBDe1TGZ+eBOusHNf8bfnbTPpO3nUfrmTyzim
	0TFD5LnY0pkTlSkIeu5WIZTNxtlRaUsVL7nOjxXEta8LopIMVj4HBz4W/ckLqNNhoa3G5DhAzuR
	Mi8Ojm0KUV+YgurN4F3SyncnRzqit8ctZSp+F+yzlmnF8lPhQsoXXleR+1z3QlDmTs82tE2LsCy
	5cjdo4qZHgw1kKPJVurvf0Egem66dXsWfBT/zWmTkd50IuQz06/smJddcbHnwR7yGE6K0QLz2sj
	eoUwcub/KOgresSp1wRfUJIMxNhMHt8GGNJ1eBXvTAfPvSC5UQrBvYOhjC7Wq9fnN9tFEv55FEm
	vg32uBosL/yhocAl6iFx5sPMU=
X-Received: by 2002:a05:622a:1b8f:b0:4f1:def3:cc00 with SMTP id d75a77b69052e-4f4abdcbefdmr94487471cf.82.1766285346166;
        Sat, 20 Dec 2025 18:49:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEondZuaShLCzXeRchLYsivILWzK0E2UvSHh5kpVrkZ16zOv6AX3t4sJBWxPrrlqjRUWYsJug==
X-Received: by 2002:a05:622a:1b8f:b0:4f1:def3:cc00 with SMTP id d75a77b69052e-4f4abdcbefdmr94487241cf.82.1766285345646;
        Sat, 20 Dec 2025 18:49:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5eb2sm1928148e87.1.2025.12.20.18.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 18:49:04 -0800 (PST)
Date: Sun, 21 Dec 2025 04:49:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add
 hdmi bridge with enable pin
Message-ID: <x2zwsjk4vv73a4i4pj2aphvajtjgkw6mkzs5brg6adlm4gnxpu@r7pbypzvcsi6>
References: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
 <20251220-tb16-hdmi-v1-2-18b1e20b396e@oldschoolsolutions.biz>
 <72bq7sblm7iprtxg6oo65mit7vsheux2xatqlk3csf6sp7ersg@77p5hloqf555>
 <8b562354-1c6f-4b13-be55-b23a6a93d9be@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b562354-1c6f-4b13-be55-b23a6a93d9be@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDAyMyBTYWx0ZWRfX1psPFjsvgHdg
 k0Gre2aA8V5GmXVMnQ8JOqA7TxkXcFk9ukYcFaGNbEurjkQNakjL++YSHTjEBkQMyuBWL0AN5ze
 9UV/C9Fwld2KkrP3lzFFWn3LuCFP1jnBXqj8/c1cL4TYsYQl7qXW8INIpK+riKl04KfrJNLi4zh
 /1NP5oxS2ANf0Ps0kKV0HVCVWaYiXV9P/zIrd4OO8V2nl1N1cr9TcE1q4ewekMpSUW0KOWJFyod
 UiOFa/tn6x7ADWlEyGowoz+WE7GiYCipSqhQ98z0iijjpvtU8qEQR/lqZAa1Y46jBOuyTEV8xo8
 KRimijkr75wvvX/jxdCP9AFrUPn07igtNAyp12ocw5Hg47MNsSYcEEMeRqYjgceO14De3yQ780M
 1hJXDiQl5T/7YLtwmiA110nfiAoV2dNbz7gc4w9Hq4ymEqAwXj9jZ+2Uhs78uPBMzOF7iDJW1k1
 qiXeftNjmjaKg6RCXow==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69476023 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=gxl3bz0cAAAA:8 a=NDGBFv2eB_F-JEntco0A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: LXXiSpkCl6KuCjkO_5PE99q7kVEPbsKE
X-Proofpoint-GUID: LXXiSpkCl6KuCjkO_5PE99q7kVEPbsKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_01,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512210023

On Sat, Dec 20, 2025 at 09:17:16PM +0100, Jens Glathe wrote:
> On 20.12.25 19:52, Dmitry Baryshkov wrote:
> > On Sat, Dec 20, 2025 at 06:47:10PM +0100, Jens Glathe via B4 Relay wrote:
> > > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > 
> > > Add TLMM 119 for hdmi bridge enable. AeoB has this gpio.
> > Whaat is AeoB? I don't see the GPIO being used in other place.
> 
> AeoB is a resource format used by the QCom Windows drivers to add /
> overwrite definitions coming from the ACPI tables. [1] It had the info that
> was not to be found in the DSDT. Actually, x1e80100.dtsi has the
> edp0_hpd_default pinctrl which is required for the display to work with the
> function edp_hot. I verified this, you need both. I can use that definition
> in this patchset, too, but its not for HDMI.
> 
> [1]: https://github.com/alexVinarskis/qcom-aeob-dumps/tree/master/lenovo-thinkbook-16-g7-qoy
> 
> > > In general this is the same setup as on the T14s. Since its using simple-bridge
> > > and also is Lenovo, we also use the same realtek,rtd2171 compatible.
> > > The real chip identity is not known yet. The bridge is wired with un-swapped
> > > lanes, though.
> > Is the chip marked anyhow?
> I don't know. Haven't looked inside.

Photos / scans of the mainboard?

> > > As for gpio119 being used twice: It doesn't work if you don't, so it may be a case
> > > of TLMM multiplexing hpd for both ports.
> > What is the relationship between enable and HPD?
> 
> Yeah, good question. Actually HDMI hpd is wired to gpio126, and works
> without the enable pin. But no link training succeeds, no display coming up.
> With enable set on probe() this works. If you have the lane order right. The
> HDMI socket  is "above" the type-c ports on the TB16, compared to the T14s
> where it is "below" the type-c ports, so swapped lanes sounds reasonable.

Okay, I might be misunderstanding something. What do you mean here by
"gpio119 being used twice"?

> 
> [...]
> 

-- 
With best wishes
Dmitry

