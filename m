Return-Path: <linux-arm-msm+bounces-113209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 81EAIH8ZMGowNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:25:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 215A1687A62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:25:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="l4M/MlVP";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A6V4p5Ch;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113209-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113209-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCBBF30065D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31EF403129;
	Mon, 15 Jun 2026 15:25:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A13402B96
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:25:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781537143; cv=none; b=AzTmGvw+0ThAldNsT8HzqNWxq9nY/nDa2Nd3QLBSvqqfXnYQXWp9fxewQSW7S1vgJQHVl1RYVFfUG4mIo54ITPp18lHzSKyVdUnAIkwnD4CwLS8rQoHyU5HsgHm8QwfoVZCK41RWImyHobRfTXpv6rwQa/QZok1DWZH1KgPw5/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781537143; c=relaxed/simple;
	bh=pXCNxxs1mjxtAFSmX6jArvznuLHZysx3NusI3L+39Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FE0FMecZyqMugWe+eiVZSmQxutCzyCjyJpXmQAMPgMpFYrweypJOK9YsZ0f82he1eupwqtjnbeOC2Er2UJZbQvloOfvuEUzoOydYdB2RUYxaSYmePVprkt9MjNtcZMuKMXgBO2X6H1CXXRS52y/Keye+MICjViQW2VEUFJHWDlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4M/MlVP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6V4p5Ch; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFJrXt297686
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KlkMVStFd7TWXdQCQgPLMRWEvG6VtN6Kkt81Xs5cI7Q=; b=l4M/MlVPuoz7uIWz
	L8uDQx0ogLGUSABWffL7prFfnmiR9DH52U3Fa5627ssYiDIgBtx9vYSyWu/KPabe
	p3JDNBGaIAzzh50jazHiWyVdV/CmSfsWshguFQeB+/iJQkxNO+uiIEgabJVVZUB5
	yz8EU02w+Wjda5Wc8qaVkB+9WDVqJXOHO+R9powEEtTURySoWlVd1MnaZ8B34+7R
	r9bUVIAgpxuOE1zlU+j5TlTdSSX+898RdvdRD381yMfbEELtvoC/lIc4n4f12rRH
	dMBQPHw2rZ1Xr8typfCR3evcK7VHDIzxjpdzindbGHVeAR1APCBgo4gj/mpKSOGc
	qnsWRQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjsf5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:25:40 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9646997241cso849802241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781537139; x=1782141939; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KlkMVStFd7TWXdQCQgPLMRWEvG6VtN6Kkt81Xs5cI7Q=;
        b=A6V4p5Ch8blpMBWBDM19iotY4dQfgAxzJQgYmnYyuWOIcWsMag+VhUJUrThga2D2RM
         IpOfp4Cd2LvMzo15Fhtnp4ZsDdNjy9j+qJOVCpnOp18BUrzpkY3vkGPcJ7H9y8zAIBas
         iSjNu3FlyDdWtFLZyDXskEB3Kz6t+uKFxOjKx9YjrAtZKvOGqCwjqj3UX0LFoG43Qi/A
         yAQ+H2B2g5NUQkLgb4hQ4dwsxCHa816D3mNxyWmBkhChzF73lk0vrrZMzbXetUZhKroC
         iAEIF1pOyhlJjF1VS5nGFMPk9z+kYeSolqlonGn1SGcujXB9s7m4AHozQoVLKnpTJTS/
         0C9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781537139; x=1782141939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KlkMVStFd7TWXdQCQgPLMRWEvG6VtN6Kkt81Xs5cI7Q=;
        b=HK3/rBpQ0VAJbIhX6fL8YL+6ZGs9qCzJZ3aKYiCr3AkLJrFtPXZXW2kCpKcjuDSrqe
         nH3Ba6NwTwKaxyzXDmv01vm31vABHAEcQi6ROOs/iZauL+JnNiJO/1qKH3PV/uPIeEBA
         uWib1wbl63wjZZ4nB6Fz0/sl91Nikgo2kztSAT+E6fsinSvYVBvs5J6nYmggcV6L1eWW
         hdjs89t4KNO1StVuEh89RofufUZMtJt3fVxNMI2jxNEFi7T+n+9QzJCOxI/Yd+C3aTWr
         1MAvrUs2W5G9M2cOIFRvTTg0Lv3/lUfHKrjYrXh4uEOrjbac4wmqkC8uYuHAcFRnnJv5
         74zg==
X-Forwarded-Encrypted: i=1; AFNElJ9am2bPXs7/W1TjuKRHHYUdRp5OKn8NIo1d4DUiIHidbuOkhVfx7tuxCT4jB9R82QcyXbFgRLViPKOK0O2U@vger.kernel.org
X-Gm-Message-State: AOJu0YxshrTzEp29fPNXuvF5rJA7IhJOcXPlGMD1QaOm73nGWPwm8ccD
	35aGsrQclq7+vxHAjawtYdnJinnvIAFCsPx/gUlD2kCdXul3WFxOdeZ7Q4/yXI+vLzXmHZLntKi
	DwkkTn+tvS98P8OsHOpPZ8cSgbW6fXRRMyVca6baFSxBluh2WFxELkiRacYyaDEY0dqg7
X-Gm-Gg: Acq92OFEhZU4ha6/TnuAdTyYnJ143QZxneut6Ql+ITvtK1/zaYHnjOnviomojo+JT+O
	OqHmuF7G9xTL/+Cb3AZkq12qW9yA+5VJJ1FFJfVrmvsSDVcN5k+rSh7dpqmkhksofkqXwu5awSa
	B6mTk7IYMXxPD99mtc4D8wlXyDijVnQH+FanUpXC99QSsaTVn3YLpqJ0rVQJL6j/821524AyQc8
	bKtUsjmTqSxOEQl/O5BIDwHyoSgvrkgMolZ/v5yxR4rfCff9zIyYn6XycdAXjrTsJ36VtYF0yv9
	l1rSk6l7VXS0UUBXt/GsPtSzw08KFtv6BXILsQaSkkX2ClKD8NZvQ2/z91JtERYlOkeS5bq6jK0
	DlXMdDjuMwud7teAtonC6UcXC0j6cO98VouQM4aE+Bh8Lbst74BymiuFsBaZkmelLRGKOELCCtH
	SJaUFq+wU0byAj0n77ozOKiRcUn8FwOll5b9M=
X-Received: by 2002:a05:6102:5124:b0:605:ead:8f38 with SMTP id ada2fe7eead31-71e88e0ca67mr7376536137.29.1781537139233;
        Mon, 15 Jun 2026 08:25:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5124:b0:605:ead:8f38 with SMTP id ada2fe7eead31-71e88e0ca67mr7376497137.29.1781537138656;
        Mon, 15 Jun 2026 08:25:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19aba4sm178721fa.30.2026.06.15.08.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:25:37 -0700 (PDT)
Date: Mon, 15 Jun 2026 18:25:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
Message-ID: <ezggulsc6wvd3gbgnm6tepvtcnvwkeyvva4szrrwbcksxgcesg@qo5l5pjtz77n>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-4-291a2ff4c634@oss.qualcomm.com>
 <pf6rymdtbfcqqzt6vnn6gc3uuod4vlfpw42dxxag33aom7lltu@6ymibirvwfnc>
 <4006d16f-a159-4f1b-ba80-f19bef8f4c5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4006d16f-a159-4f1b-ba80-f19bef8f4c5c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2MSBTYWx0ZWRfX+10wcUSo4uVH
 ARl/8iKGFiWhWMldoTnAUAQsrdspMAN45jQ0Mla9hWht1Smmy/hZwN3TWfsKrxcp0fINCTSamXL
 wqGkjAtrzshLeGDDglapedvRXXZQEUUq73NFVwnK+GPxeBJtcCWLzk6ja4zYhJOBMpfW2G9pIFt
 u0zlmJEqUVSUOhqTM6SsenyjbjPyFi9H2GbLRdc+INx7NTX7PHwxs3YipnKvFy7EzinTrPQ7sCt
 Z/vZABvl+EruHGyio2B2XXKF+pJZOJBWOig+zs4IZ02iY7bJfhuKC/8q1p9tpxlMeOaKk0SjrhX
 zQgbp6OBv9sj11eX1F3XZC7yleJhz3xdKailREI3yh1XhKo2siybzXK/k7YxGZ4ImPa86y2Peni
 2y2KRkXx3aC8WmZZ1C3eyiKiI8Cu6KE/naBsTSWLSa3korgLdRRIZmnUnPyXQYUH5nojp0GQcBE
 22AlfjpcYsz2btuxjDg==
X-Proofpoint-ORIG-GUID: 5tqIttSJ74DM7oYtx4iVL8fk0zyOL2EV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2MSBTYWx0ZWRfX1wNb41Z7wODM
 gfonSrIJpE3n35+eQmfQ0O2TJvhql7/Lu7gsG2ox/tlNQNlbouMW6VwNCPEzaEhVi9xcS/Qdx+t
 xZpCjE/W4EUVo2gL6GWXpDsCOMr1ve0=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a301974 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NIeLh5r5xWi6Lh3APS4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 5tqIttSJ74DM7oYtx4iVL8fk0zyOL2EV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113209-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 215A1687A62

On Mon, Jun 15, 2026 at 11:02:22AM +0530, Gaurav Kohli wrote:
> 
> 
> On 6/9/2026 4:27 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 09, 2026 at 03:52:59PM +0530, Gaurav Kohli wrote:
> > > Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> > > when it reaches high temperatures in kodiak.
> > > 
> > > Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
> > > for modem when it reaches to 95°C.
> > > 
> > > Remove inherited mdmss cooling-map nodes for Non Modem kodiak variant.
> > 
> > Why? If it is a GNSS-only MPSS, does it not provide any thermal
> > mitigation mechanisms? Does ADSP provide those? WPSS?
> > 
> 
> Hi Dmitry,
> 
> Thank you for the review.
> 
> Since the remoteproc_mpss node doesn't exist on these boards, the
> cooling-maps that reference it cause DT compilation errors. That's why
> we need to remove the inherited cooling-maps from the SoC DTSI.
>  /delete-node/ &remoteproc_mpss;

Ok. Explain that in the commit message. And maybe we need to fix those
boards to provide mpss instead.

> 
> Regarding thermal mitigation for other subsystems:
> ->CDSP and Modem are the primary heat sources based on our internal
>   thermal testing and evaluation.
> ->ADSP and WPSS have lower power consumption and don't typically reach
>   thermal thresholds that require active mitigation
> ->For this, I'm checking with our internal team to confirm if ADSP/WPSS
>   provide any TMD mechanism across all targets.

They do. I've posted the dump of qrtr-lookup somewhere.

> 
> > > 
> > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kodiak.dtsi               | 127 ++++++++++++++++++++-
> > >   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +++
> > 
> > So, you removed those for Radxa Q6A, but not forRB3 Gen2. Why?
> > 
> 
> Ack, this is a miss. will fix this.
> 
> > >   .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +++
> > >   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +++
> > >   .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  18 +++
> > >   .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +++
> > >   6 files changed, 208 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > index fa540d8c2615..d345add2d8c8 100644
> > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > @@ -3427,6 +3427,9 @@ remoteproc_mpss: remoteproc@4080000 {
> > >   			qcom,smem-states = <&modem_smp2p_out 0>;
> > >   			qcom,smem-state-names = "stop";
> > > +			#cooling-cells = <3>;
> > > +			tmd-names = "pa", "modem";
> > > +
> > >   			status = "disabled";
> > >   			glink-edge {
> > > @@ -4787,6 +4790,9 @@ remoteproc_cdsp: remoteproc@a300000 {
> > >   			qcom,smem-states = <&cdsp_smp2p_out 0>;
> > >   			qcom,smem-state-names = "stop";
> > > +			#cooling-cells = <2>;
> > > +			tmd-names = "cdsp_sw";
> > 
> > I'm going to review only this DT, the comments apply to the rest of
> > them.
> > 
> > So, we have two cases, CDSP and MPSS. Why does CDSP have only 2 cells?
> > Just because tmd-names has only one name? What if we add another
> > mitigation (which can be added in the firmware), do we suddenly have to
> > change number of cells and all the cooling devices to reflect it?
> > 
> 
> As Cdsp has only one relevant tmd to mitigate, so we have used cooling cells
> as 2. But i will change this to 3 as this is backward compatible.
> 
> > Finally. If I understand correctly, these mitigtion mechanisms are
> > provided by the firmware. Firmware differs between the boards. Vendors
> > (in theory) can change them. Why do we list these names here, in the SoC
> > DT?
> > 
> 
> Below are the main reason for this, replied in other thread also.
> Please guide, if i can use qcom_pas_data to define names.
> 
> Following Daniel's series [1], the thermal framework supports
> mapping multiple cooling devices per remoteproc/device via indexed
> cooling-cells.
> 
> 1) The thermal framework's cooling-maps reference
> cooling devices by index (for #cooling-cells = <3>). Without tmd-names,
> there's no way to know which index corresponds to which TMD, as firmware
> may return tmd-names in any order.

You can #define the indices to the well known names, turning those into
bindings.

> 
> below are the changes post new thermal mapping changes:
> DT: tmd-names = "cdsp_sw", "xyz";
> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)

What if the DT has "cdsp_sw", but the firmware doesn't report it? That's
an error, as it seems.

> 
> This allows cooling-maps like below:
> cooling-device = <&remoteproc 0 ...>  // "cdsp_sw"
> cooling-device = <&remoteproc 1 ...>  // "xyz"
> 
> 2) Not all firmware-provided TMDs should be
> exposed as cooling devices. The tmd-names property acts as a filter,
> allowing board-specific DT to select only the relevant TMDs for that
> platform.

But then the properties should be defined in the board DT rather than
the platform DT.

> 
> [1]
> https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/
> 
> Shall i use pas data to define tmd-names instead of dt ?

Let's settle in the thread with Daniel.

> 
> > > +
> > >   			status = "disabled";
> > >   			glink-edge {
> > > +			cooling-maps {
> > > +				map0 {
> > > +					trip = <&mdmss0_alert1>;
> > > +					cooling-device = <&remoteproc_mpss 0 0 2>;
> > 
> > What does this mean? I assume that the first cell is one of the
> > mechanisms. What is the difference between them? Do we really need to
> > list them one by one here?
> > 
> 
> Let me check, if i can document different tmd's somewhere:
> 
> -> modem tmd used for Modem Processor mitigation.
> -> pa is used for Power Amplifier mitigation.

What does that mean?

> 
> And we need to list them for binding purpose mainly.
> 
> > What do other cells mean? Why are they 0 and 2 rather than
> > THERMAL_NO_LIMIT? How does one come with those values? This should all
> > be documented and explained somewhere.
> > 
> 
> Will change to THERMAL_NO_LIMIT. Let me check, if i can use
> qli doc for documentation.
> 
> > > +				};
> > > +
> > > +				map1 {
> > > +					trip = <&mdmss0_alert1>;
> > > +					cooling-device = <&remoteproc_mpss 1 0 2>;
> > > +				};
> > > +			};
> > >   		};
> > 
> 

-- 
With best wishes
Dmitry

