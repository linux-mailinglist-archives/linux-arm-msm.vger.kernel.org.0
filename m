Return-Path: <linux-arm-msm+bounces-110988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SyGMEsc0IGpaygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:05:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DACE4638630
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:05:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O2rA4Y0G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=doAsmxva;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110988-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110988-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7169C306C05F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BDF345729;
	Wed,  3 Jun 2026 14:00:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F433EB06
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:00:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495227; cv=none; b=DSxiemCsjPXjaa8RkkVcx40bsncU8bdJNLwJg93GYjKfve3Wg4sQtchQF3cpEAeHQk0fjU4WQFgj14Z5urxSV0LQtGqrAx891NZBLb+Po7j7CHhe1vUkhZKr3rOkt5hyeWbhuTwemOXlVb2eRCdYLCuEzum+jQ60BtNlOl/x0jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495227; c=relaxed/simple;
	bh=Mmc2d7zBm1iWxipjEaid3o9zeNASq3ftRZ002GwxKc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKYyvQ9tkW29rw4VpGYg7xZ291qe467vR3QH2EbroJPOSWsGZC8B0Dw6ZVzs+cz+xHjpxdvjCCWSrGLNUlv7xzGeIUWWrK434q8fgRdb3Q+uH5V+Qg/aCUVgHP0zhBO1q09cH9lJngDFg/ZlbTrzeJXlt4FOileay0qUif5lQS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2rA4Y0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doAsmxva; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65396BBB781033
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 14:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9/bOeVPhoSAIurZMOzdi3+2T
	mq8rOt36OfI5aPW8pZ4=; b=O2rA4Y0GClKaJijcBDjsi/+AaYCF2wRbLro4nQmZ
	Vo1AqwwdwdFoxAsxIGC+8atTAssPhbhJm7AGunvScAbOkatwSUPEqmWbOTlE28rE
	6FkH++s5XGPd5IHrQrxhsON3yN8oE2atT1OUK2XFL5lHpo8TkBObRDCXbNROD3Re
	dccDSjSx2VCa4s8yx0DYBo4pNWITth4+nGfBM8jXyheEfAo6YJnr/txZ0G9Dq6OA
	hIfdJjalqu0KkCQ59YStkX2wujP00S0b/LI5pjFZ1B3s1av6cj8OnWFj1SZAvDvz
	3gqn3VRGYM2zMidFUV+iQsgNk44kSSxKl/jKO+Rxu5eP2Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb13fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:00:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cf37fe12faso1558214137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780495221; x=1781100021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9/bOeVPhoSAIurZMOzdi3+2Tmq8rOt36OfI5aPW8pZ4=;
        b=doAsmxvapn/hEoGFVgmcY+iq9iW6D7yhN+jgexCgKKyXTeC62WPy0EC4kZRpgzvHYc
         fuA2aR3I3JqsdQACa2tQPkAYQ2CPZdgn+2yNJOTSGGqMXnLZwfx4QKHfPh5eywN1Gx49
         SuzAVaWHyJmaYM4DBOOWbouYTIgYhBpvioRMCCZ27gOGe7YvfZmnImItMJcP6tDjaE6/
         6U2RUZfA5l+L8b+7JhAvhSv/JoU3PIda3R3M016ZP8CSQGvr4sjHVj9pLhqFx3NXCCUY
         MBhNF78Jic+8X9ZpliTQBfPZ6yvYgxZCk29/nZr7A4O/t0VTnyG50CXaSWA67yAk5DBv
         Jvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495221; x=1781100021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/bOeVPhoSAIurZMOzdi3+2Tmq8rOt36OfI5aPW8pZ4=;
        b=STBuyZmyYvC2VJ5auyYU7EDS0ZP/ljqvZLRLZ6hnc0Su/MsKWFEqYtxQMYC2wUvyIX
         lsxx/HpioT6F+Y4PdPYhmEY74FL3sZrLZBzeIsuXcygqsXal/XJNvYTNBQsNHLPxYmiO
         5+svP4stZPgFQ+xf+rlvjqMyI5P79bRsAFD+7D2Cv2PBre/IodirVm3vVSuwO0b1waQy
         2HG8dwWEOzo59NImWGUJUNX2sz207LMbS5lk/SHHfLrFeUsH396X/C7qdSscr9S1s6Nm
         Aq7KxztUdgwnzuejgG1PNBGl6jLaYDhXxfMAyacShGffKDnly864rTdoXKkFpFkOGWUH
         deLg==
X-Forwarded-Encrypted: i=1; AFNElJ8AIG39/D5swGTd7pXvCew5aYAymAVX5ua4nrVYDZ5v3K5C2UEU08/VVHuxTK6k97xlH4igvc3hXR3zoBhD@vger.kernel.org
X-Gm-Message-State: AOJu0YxJAOhmStaq7fr/WvedwwD7gpvjys+vyFax/ELYSZfoixFYT4sl
	5AaJrSYVIDeGPWe8eQLv9/VowyhWnc1Av+2DsU1AEM4uRYqXlUlm3/lOgEI2WLHm3XVE9RFxvCI
	uaz3cBSpLPEZpgmQ9TxlTaYrsf0IHH2dbuoKomwue1Izax77PvjvydKXBEZBMCGSAHfW2
X-Gm-Gg: Acq92OHE/0TB0RKSHufuBHHGgRyrdoea/90P3RatGYI7DViqDd6WtF8Hf/tbzo5DqYx
	RNTFEyCns/QlAXUKAOGvPsVwsaoTCCPNZp2MZA/0MAn5GAm4TW3BIX8f3i7Y+85GWjCYusp0/PT
	weUP848wm6/ShLyMnD480Rgd4l+MW95j0nauPGyvoB70H0Z1561aN08Z37xzpFhm7df6PcnsqWw
	tU6PjvXaP72mBmHglYb5dn0TrTC0Pjv/RLhr8tehyLYt0TwJBHHBrCwAJQDk93o01tWO7BlxIhW
	fRDL1bo7s8nCmk4XddL4NsssWyK/v5GN0OOxcxYgi7pCAZOY6gBEl6Y4uOsF/VarY7Iazm3plxP
	wp0+KCauYr5Ivuedd32jOY4XV1UyF3wCYhzU4WUdikYU8tgKs/Ynl4MLagYOCIuVKTzu6g7V33y
	4PE8/+ZokatT900/5nZE7TAK+/UUQ6qhjrs6kQR9O29rweZw==
X-Received: by 2002:a05:6102:3e09:b0:6cb:d562:b96a with SMTP id ada2fe7eead31-6ec432802edmr1467060137.14.1780495221186;
        Wed, 03 Jun 2026 07:00:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3e09:b0:6cb:d562:b96a with SMTP id ada2fe7eead31-6ec432802edmr1467030137.14.1780495220739;
        Wed, 03 Jun 2026 07:00:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be038sm9721071fa.22.2026.06.03.07.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:00:19 -0700 (PDT)
Date: Wed, 3 Jun 2026 17:00:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: glymur-crd: Add FocalTech
 ft3d81 touchscreen support
Message-ID: <l3xx6wuhhrf3d3mdk5l2hag4hq3lq2br4wwbooumbq26konvyt@5aazqaoftzep>
References: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-0-3453ef577bcf@oss.qualcomm.com>
 <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-2-3453ef577bcf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-2-3453ef577bcf@oss.qualcomm.com>
X-Proofpoint-GUID: OJ4qwqGxdxmTyQNwnljUpPv_GWlDBnEX
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a203375 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=N8g5PzzKtf87v6poegAA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: OJ4qwqGxdxmTyQNwnljUpPv_GWlDBnEX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNCBTYWx0ZWRfXzyK/Sa/mkXeF
 whgwzF0Fjkuc9yrCVoItTuvllMoptmPT/g1wSA8QhXuQNPJNFly69mrpQEgMjYc2Q6Kz9CLCFA3
 Hm23F7Ir8t0t+yTXB1jj+XYv6HQhdvdFOnxOUOCbx8YEY12oW+oxuwQ1tquWAiEP9vA8kVFkZiW
 qRoiWU0FJ9iTHoEn8h5HEEdrd0P+qwY8ctJ+stKapfv4ulAl5msm8y3NSQHZAGEoHWl8ZCZxaO9
 k7C9GRsWeDgnbQ5qHFIKZLq8WACXJdKmCPOuWc9cD8Y0krjon0B24hWuq/OeAal34Vj4TLt7t5y
 oIN2yIp/AK8dix2xXKoRF8ty7Y5yN7OUcvaJGQRUpizuNRIssSt+Bn+PSu+fnzdDE7WJszRT+8j
 z2uAcjNMEOa0YeuVcHtgqeAi8MLfBVgC0W1kJqmiiq20CmhJO7yJLUJgYXTnRLCe5sYDlLRs45K
 1BmuYE1+YevL6Z6Oe9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110988-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pradyot.nayak@oss.qualcomm.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Daniel_Peng@pegatron.corp-partner.google.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pegatron.corp-partner.google.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DACE4638630

On Wed, Jun 03, 2026 at 08:41:20AM +0530, Pradyot Kumar Nayak wrote:
> The touchscreen module on Glymur/Mahua CRDs is different from
> the one used on Hamoa CRDs and requires the reset-gpios to be wired to
> the device. Without this in place the reset line will remain
> permanently asserted during resume leaving the device offline and causing
> all I2C transactions to fail with -ENXIO.
> 
> i2c_hid_of 3-0038: failed to change power setting.
> i2c_hid_of 3-0038: PM: dpm_run_callback():
> i2c_hid_core_pm_resume [i2c_hid] returns -6
> i2c_hid_of 3-0038: PM: failed to resume async: error -6
> 
> The touchscreen on Glymur/Mahua-CRD is a focaltech ft3d81,
> which is hardware-compatible with the ft8112.
> we have added the required change in DT.
> 
> Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

