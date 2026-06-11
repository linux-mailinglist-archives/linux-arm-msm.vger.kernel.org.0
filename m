Return-Path: <linux-arm-msm+bounces-112813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a/aFEEEZK2qY2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:23:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEB56751B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:23:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Theh+Kbo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HKV0t1pF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112813-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112813-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D0BD303D371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2633161BF;
	Thu, 11 Jun 2026 20:22:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBBA3612F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:22:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209356; cv=none; b=owf+qoBBygKFKPvcADGHPAvYj1amzMy1kR6+gQZWthyHySwSXPgTJnm9/inwciBHAU8jzXI6JxqNWWCxU9KNYH/2SblhKt8FDHceX7dWgLwPmnYE4LjloZUWgvRzxkU0KWkJaflp1C5FIsMZbcrr10PY/DK4BTFSKcFDnIaxnIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209356; c=relaxed/simple;
	bh=3y4RuTTJNLUFUXPYMbUQ7S8NGmlwMUTx91JD9JD33nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqgsT7o0qkoO88t0VDUzndkKYCSUV1eY1SzpCsBLHzWXB35mmS+z9USKOzc/8fKY3DI6IvsC0AvxadyvxPXlWalmOxl2wjjSNCgXmDDdpvjtgNU2pE6xjxAXdViUUXTbv9zTNGRNEMMB9bInQDTvnFOUax6AKx505beKv+y5K9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Theh+Kbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKV0t1pF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3bQA1480022
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xJZJ9xOtxo/SGEidDFpL5mXa
	/YUpzW0hXPivz5u62gU=; b=Theh+Kbop1JICFoapkEXU/+HG40FvGtIwVhMW5Mv
	G6Gg6Zs3K2dbk6PVdVv+kzRW0Kag9z5GrkxBQzz/dMl8Tqk20nXgVjw0LK2VNuPc
	SPsD80Ar3Bx2C8M8mIAYwmM7mqYNJZaJ3E7KLVJoajxlKP8iLBI0Ot4QaXj38Yi3
	QXKlJPhLQxPKvsX4AdXzvmVVgrKr1ZPEDD17G8PvKyMOk76ja03kjKjFu/cdbm8F
	eKQIspiaj4s8A377peILxFcGZMXCZPYYHpS4h6XJhTiEIft8sJF6cD0KAVmVODgk
	jC6i7pSSKg9BTHAq9Oh1GQbw4Nrid6Psfm6WlGPzfLWijg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7gvrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:22:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c69c788ce7so89089137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209353; x=1781814153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xJZJ9xOtxo/SGEidDFpL5mXa/YUpzW0hXPivz5u62gU=;
        b=HKV0t1pF8Wxrbqxkg4yyA/hE+HnemeN1eX19O+lnwIvmHCM6S/7Psk/DWS2gowbXgK
         q1DAqtajUCWln9UihZsvQ9Za3b2LDvdZdz5DyogWLx+agZbkTF2FV+LwJHysIDwoGUEx
         4B99ogpT7JXZUEsDr+ea8J1VMJ1HeO6rPO7V/2et0BIaLPXm100cYgyfyE/cIDRzuN5m
         hx9sq2GMx5JDAQYzu5HVPP32fP7J/8Y63QVGgH52mzjI11fJry7l96gx9ZW/OFQPNZxc
         JITzQq8LzyrECnNE7fmcV5+UEgiXGbA1z/ynPEPUnIniMKIL56+2MD1DIaTGgRjaulWD
         0lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209353; x=1781814153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJZJ9xOtxo/SGEidDFpL5mXa/YUpzW0hXPivz5u62gU=;
        b=elowfR1XxcD+OaIzO1sHGXswqeofGqyJ8ELoojXDdsT1pNi+tL7chUQJpmlkkeCYA8
         d3771uXFvTekGkaTJnroY0o6GZ3wtq3JpDIxiPvHwGvz9kHCrMmEXX18YfQ26Z+opC6B
         tg4DI5dDNWXwnisWWQkvCGjWLMYPKY9/cj2DkzBwZmjgALrrdE1oE6O5+BYOJuvyGOHM
         Fx4ZykMFCHhP69TQl/saL2HnaTsLTCelWqwRN08aL4yKpdNpBiYJisy/UrRwGIvg4kzq
         /xYExbhonofzjjh6D7BKgZSqyeuQbUUdmJOjHVEMHQLV3RH+xAUhL1+LMBZSwFzsDTrM
         FAVw==
X-Forwarded-Encrypted: i=1; AFNElJ9mxA8Ayo4vTI3Ady+qfVVhFzDC62uf4MaYWnlB/2OIA2r/UShbpSk+E68RzYugNsm+5kxT4maoIHQNFy51@vger.kernel.org
X-Gm-Message-State: AOJu0Yx30xJJIhIqCGa1t4+s/4hrd8PNJvYX+KAeO5MzAKORA9nlA1iS
	rP8WE6N92tNsvmMnEZKFu/tBnukxX2gPEoS9MQuT2ixK2yMiTXsuNeLYvt4Q8CxPJojHiy/H0Hv
	Lvbrow9zqx0on6i6h4LmEwCPvNMbmpEBJR6PpiM+6JfXhzrB8w+Kw66CVrFxLMSQfW1Ji
X-Gm-Gg: Acq92OH9R2e9Ri4+t/5vE54G285pOdeGInhrO3JCBs0HBur5XgZhLUDp5/T0g1Mk7MP
	ORhJcd3Gl0W045FMr1sf8TU88WiLb5ri+6myXiXviMYwgjFFE7cR0zGoENvdB+CncyWAs4oU9GO
	cUXkxVE/itpZ1gU0xZi45vX9E1bocNcqmaiG9QdEbd/LUFttx5lvyAqHWBirIFFESrDaoCvJ7OK
	aFfChlR9waHR0BdcTPR2VeBoJuItHIvXD2gmNLBKp8FcrmK9n3gBGQ3WswLutXgkQs7SeRD9oDz
	3bw1AnKI8nV+PT6XCzRCcbiONUr+VCYOXpN6Tk0m6hY7g2pBGaP0vRZBmU3GVXUuAzZ1hDn/3MX
	VRWJPBJH+yuFzX1/Rb0nrkWgcudMHBbbzg58oQSMrht2tVRTCTHpsg+gX/87AdcY/kJASvFszdP
	1UQtYxAGXRiVPo8UZSXju8XoabFu4nAJM41dU=
X-Received: by 2002:a05:6102:2921:b0:650:a5d1:ee1d with SMTP id ada2fe7eead31-71d5d398fb8mr2993500137.10.1781209353454;
        Thu, 11 Jun 2026 13:22:33 -0700 (PDT)
X-Received: by 2002:a05:6102:2921:b0:650:a5d1:ee1d with SMTP id ada2fe7eead31-71d5d398fb8mr2993489137.10.1781209353023;
        Thu, 11 Jun 2026 13:22:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f1b4basm242091fa.24.2026.06.11.13.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:22:30 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:22:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add IPQ9650 PCIe PHY support
Message-ID: <fbtghwjrokuijatssy7xn2hwkp34p5fjyn3ndr5t2w67fkz2na@3izdh7uk4hst>
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <20260602-ipq9650_pcie_phy-v1-2-d8c32a36dbd9@oss.qualcomm.com>
 <56zkq7bwrt5smmmum6jckzrekkkqrych2gntx3obnrmamwumtv@espahwe6pc3v>
 <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7def2ccd-0319-4f85-8275-73fd254d887d@oss.qualcomm.com>
X-Proofpoint-GUID: zOMKvZm6tTQyfq3YnOzq-orq1RbEneQG
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2b190a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Khteb_73IZe1q6EfuL8A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfX483dsmfSRcod
 SsWt0eqYhuQOaEB/SbEArKeEYzxDcAgltEz0sMtKtr2IiQKMOSNQcW9zjtMvjzg2MKFg8/cXKPT
 sDcmiOAESSyasmK+kjj5vg5U8XfA9sZW/+8ihuD3tzhxFJjxji6zXyUxPXkfbD5Edtkp0CDCcmv
 Pod99jOVVvQ786m1hUlInBCu8y/1mM0EuW8xMZRssmmHFQFZRSdmjEvfQhmdOnMVWViTgzbHZjS
 17T9mrlZqtiOf5UOuh95GWeGeRu88Ar+XKYKDh2CSHe1t0fubw7dHaQa3cFsh0VIKfKndlHxNHE
 yiXI8gXmSGgSU7IazqoRxP+xfEHXHsPtMMQdlqOrQMJYoSuQ3YcNYvaHacxetgEs8Nxy4w+M6vs
 slwPILMXM+O4pYvfuY603l+5B4F9GQNtRXJhYenav5lc8BSsYmDQAU6kN142BzSpMBW6kM2OQ8n
 Os0jEPqE7e1HModZuDA==
X-Proofpoint-ORIG-GUID: zOMKvZm6tTQyfq3YnOzq-orq1RbEneQG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNCBTYWx0ZWRfXxHGgsFFLZUP7
 tu49UScwsrc9gVNlIy7kFkgA3TfOfzunA5jH6nxbdnF+70+UWDvPo0iCOvwpfjR+C0WEv35K7RY
 0CR0WtSFmsZnVk/EhDzpaKEyT/wYXm8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110204
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112813-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,3izdh7uk4hst:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABEB56751B3

On Tue, Jun 09, 2026 at 03:46:56PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 6/8/2026 12:26 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 02, 2026 at 02:40:18PM +0530, Kathiravan Thirumoorthy wrote:
> > > The IPQ9650 platform has three Gen3 2-lane PCIe controllers and two Gen3
> > > 1-lane PCIe controllers. The PHY instances also require the on-chip refgen
> > > supply.
> > > 
> > > Add the IPQ9650 Gen3 x1 and x2 QMP PCIe PHY configurations, including the
> > > refgen regulator supply.
> > > 
> > > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 220 +++++++++++++++++++++++++++++++
> > >   1 file changed, 220 insertions(+)
> > > 
> > > @@ -3378,6 +3524,10 @@ static const char * const qmp_phy_vreg_l[] = {
> > >   	"vdda-phy", "vdda-pll",
> > >   };
> > > +static const char * const ipq9650_qmp_phy_vreg_l[] = {
> > > +	"refgen",
> > > +};
> > Now vdda-phy / vdda-pll supplies?
> 
> Cross checked with HW team again. Along with refgen, there is a on-chip LDO
> which supplies fixed voltage to the PHYs. It is enabled upon system power on
> and no SW intervention is required.

What is it being powered by? MX? CX?

> 
> regulator-fixed doesn't take the resource 'reg'. May be should I create
> another regulator driver which accepts 'reg', something similar to the
> qcom-refgen-regulator? Please advise.

If it doesn't require control, there is no need for a separate driver or
separate supply. For example, the refgen is being references only by
those devices which require software votes.

> 
> > 
> > > +
> > >   static const char * const sm8550_qmp_phy_vreg_l[] = {
> > >   	"vdda-phy", "vdda-pll", "vdda-qref",
> > >   };

-- 
With best wishes
Dmitry

