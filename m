Return-Path: <linux-arm-msm+bounces-97826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKCwDI51t2mnRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:14:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F52294584
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B00CE3013242
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483C6322749;
	Mon, 16 Mar 2026 03:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/SDyaj7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuyutN8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E86320393
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773630858; cv=none; b=WBWaVwGMC8ZdWgTdWPLq2Sw1cTNe3W0NrJ6kmL2Dw82zBxkP3S5snnKCYfkWIdEZEcggKgn4gJobJmx5odPrRY6xB7gU3O1h/5GPFJoBoYS8Rvkebv6t9Wz46tgwDm6NM0NoFluj6TDih3zwMV5EptNH6+v7vNaD3Cyk+cJIrGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773630858; c=relaxed/simple;
	bh=/6dAqCJLpbWW1vyE3aLIdCpdvy6gf9OJS53i3RtP+hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGM0WUfBsVg8iyjn7FFOXjJt9RBdFRIYc7JGNl/Tt3h2s/cgWt7+UG/hKR/dvTYX6ljsxJia16mXkHXzKjmGMCWzm+X3dX37yRNE+0sY1cmANUzREAEfXFMzfGj+QoGhO/ljaLjoCqbx5A5zulHlz/amcCnrgVsSNuilNPsjrwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/SDyaj7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuyutN8R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62F6U6bo2396746
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fN+IHSJJiOLaxbG8Rl5q3yDa1ZyDe8oqEKBhuN6OVIk=; b=o/SDyaj7l3wDcRt4
	hOpYFv0oz5/VP4DENPe0UT6r12zWfYENSsM/qQOmG6Hm4Em+XzUMAMM2K/BZFfJp
	fBkvZAYwc6Q3xYmm0TRTZkFbnZQOeAKwUHUMlbIAjnM8VzRfOAqwE0Pokj8jVhB4
	KSDBsrUMyQMSjSV1cJowfXd5c2BEUPcJ2A0N1BMwXy0mDKin8n58OsOLAyw/cuoU
	yRJgVdnu1f0vjdpSjFcLnD4yVxlLWiu1jyoq737gu5VIv3AYZe5eHkJFnHqP4+5Z
	hvQ6XGbeK/zGqQzrGNL13LvQP63bmExiXB1QAuYt3hkCUqsW0HLKiG9myQEq77Ep
	l/OozA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw027c08t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:14:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82994cda354so2904029b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 20:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773630855; x=1774235655; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fN+IHSJJiOLaxbG8Rl5q3yDa1ZyDe8oqEKBhuN6OVIk=;
        b=BuyutN8ReBKVOjBhjo0QiM0YTpQSviTKi1G5s/K6k3E4sZRJs0M3W+e3tc24ASjuG5
         7K6+SDk+CzumSnc63J+tFVG1ua6qto9qT9ZnO151PZywPVEN2iXL5LkHe5iTcgnh1XwC
         lHWa/xRFF9ck/EG0a6qSUwNdkzNNKS4UxHkRNeplgfUFcEFZ/a2rP8BHMmJyYjYM5gsM
         E7/iflYnoEcaCAUZlymEeFgWyTPS0fFfLpq2XW1SBNn/8JhnmSTwplWU9TTR4hwXwNLZ
         IaIGthnKiL4I5tPC0pXDaGeKCoeANyigoPiFDY1DDPeswzEid70VyzNbkxt7DNpPCp2b
         DPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773630855; x=1774235655;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fN+IHSJJiOLaxbG8Rl5q3yDa1ZyDe8oqEKBhuN6OVIk=;
        b=DiO8Yh/ODnbXYiX5wU6bh/pyxX04TuljY67aueEvxlZ/FvCF0dggq5or+4tXE9/crL
         ZruEG5MYvGjwCufxvY8JaGGqJ+U02HP7nI99TAd/gHoRXrlzKMQ66brNH5iXOuk69mO2
         jaPsJMT4A9npinoyiRamgza5fC/BJaI8HtFNf5f+FKaIebWcbSr5pNkmwfrb8efvbYei
         TUpQRXqAc9MnyafO2dLtQ4qeemr06I0aA5U6ZYqOI+AWunvld1LZzZrqkltI0pfnZxTx
         h4ui1O0SY/LerqLNxboWLZpLxsNIwp/0tUFKvkzaSCKjmNGtM6ETvIpa+b1bwHSbnOkm
         hBig==
X-Forwarded-Encrypted: i=1; AJvYcCUJWxF+bARu93eYmZFJ/dBXvZ9TpPBocC16H3z8zqpWkB0Tyl94yBZqAd6FD901diFmB80FppPstKLitNc9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+gjUQomhjudJk/sgyVUKwRjPDqaQSjqXB+4dBTJVvcqHzrN9O
	5lBB9gRfTqJU5ZdXcvoEnuN+gTjZyfZ/lHGzCkHwlGrCDDZ24to3cAPKtNzZ+8M0TJCkRvdE0zY
	FknJowN0HlFwu2DaaiyAemF4IN/PllfE63U7P+dZKA3FQlDgp0DIvpRtOH9KNgtm0MQmwCYIQMt
	VV
X-Gm-Gg: ATEYQzzETlCWrEUSoYSutQdhxCQIajBLTy1eLTa2z4LaLJ7MgnnBaGHL4EZFR7xuVrD
	pLO7RzuEv/7bAgDRrZn3X/DmiouCbIKmj9r5wfZisjryeFEowLiHGtHuZBH4HGNaaCHMIAjEgRJ
	IM4V8dtTrxmktZ9BNcS9UD26agL69NlG2CMSSJFaiT6MBjnZIc1o27/t/0i5tLdPmnTLXIQm9HW
	q/iPvWJuEmX+tGaRgw1BnkAwimBBVPfQBCkv79QIyQaM5A01OkOEGhr8C67gyUj/84NjBhteRd+
	zexH9CNv/MSOzaumhTihHyOaWBlUu1PDWWthfx5NuewOQrwPkwYDtJVvriD1ULDfuiUCbSdHasG
	vfwQ4qAGG11GPyBMqnncqBnKTO9RceJDhOafPj8TE6mYbIvqyMWftcd7qlfybQagCUgcAgYUOJa
	1Ku/2yL/wJH8rVSgFfgoymqeE+4BFaBHviLPCxBep1iw==
X-Received: by 2002:a05:6a00:1a8b:b0:827:2b42:10ea with SMTP id d2e1a72fcca58-82a19701b46mr7053138b3a.1.1773630854748;
        Sun, 15 Mar 2026 20:14:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a8b:b0:827:2b42:10ea with SMTP id d2e1a72fcca58-82a19701b46mr7053124b3a.1.1773630854255;
        Sun, 15 Mar 2026 20:14:14 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07365b22sm11774045b3a.45.2026.03.15.20.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 20:14:13 -0700 (PDT)
Date: Mon, 16 Mar 2026 08:44:07 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge
 with displayport
Message-ID: <abd1f9uKhjevaoL9@hu-vishsain-blr.qualcomm.com>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-linux-for-next-v3-1-3f77ad84d7d1@oss.qualcomm.com>
 <z3y6wb6irac2ef3f55roy66wzyufel4vannfbynoivzgl2cuob@um5eomgvt5uc>
 <aZo/NRg3IxdyKZ6I@hu-vishsain-blr.qualcomm.com>
 <wvjfla4rk2qxzayloov6ofna73kl22nls2a6h5uzvap4kasfh2@nqvpdsassfcx>
 <aa6OGbZjT2SdTxJL@hu-vishsain-blr.qualcomm.com>
 <i6cdhcdj7f3lbfvu2lvakbir7ovds3yfqyod5wceiedjqrlxxo@5gntl3peqz5b>
 <abPXerHW3YoEcQ0r@hu-vishsain-blr.qualcomm.com>
 <sowx6cm2ayx4ezbkcpv5vez7tdkeesdd2kugjmvouk2ud2soqf@habtwjzkoyza>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sowx6cm2ayx4ezbkcpv5vez7tdkeesdd2kugjmvouk2ud2soqf@habtwjzkoyza>
X-Proofpoint-GUID: iCV4amvG-z9OTXtERi3iuCtOJu-2Ytl4
X-Proofpoint-ORIG-GUID: iCV4amvG-z9OTXtERi3iuCtOJu-2Ytl4
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b77587 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lZUHFFOKBum8XIv61zIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMyBTYWx0ZWRfX35BP/zzHrHBW
 64d5mXjXre8zrtsnZIc5quIuZ5OQEQdYFBqR1CJ9KkUrd6L79+LIdfU1F+De+z1J/yTaBV1U7gM
 zmHF1Ci3CD8lPCwBljPfZXCK14K6blAiMJLnswW/77wgd9RZAD2AEP8xHPlD5NMs1F5FgLNKCqf
 7+luSIpIPIu99Pe2hDiJUWm3mc3p0pNGu+V1ZZQDaMs5Qj8JsQUD70u3TMIewyUwBA5oXwcpVQh
 qIuRnAc2uOgQPG1KO1lMZeTpn9d4q8jnzPpkZyyuMhQZiaozYnzQT8G4a4jNbuokcQ61s4PNICe
 iHCCNRTOcfKrMQyDerjgYTLrAqxGzgZ8sN33nf6APeFatApEZoKNCTctURzfF/BX7QBy4rwiYsb
 w00KVEGArzQb0dGGUkIBKwDBPqseOwFErtdZX0qlI+E87+Sv+fBimmt2npIcWe69XkGJj90xl7d
 +UKks1xx+d2nJ8GWI/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160023
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97826-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89F52294584
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 07:01:57PM +0200, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 02:53:06PM +0530, Vishnu Saini wrote:
> > On Mon, Mar 09, 2026 at 09:19:45PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Mar 09, 2026 at 02:38:41PM +0530, Vishnu Saini wrote:
> > > > On Sun, Feb 22, 2026 at 09:16:54PM +0200, Dmitry Baryshkov wrote:
> > > > > On Sun, Feb 22, 2026 at 04:56:45AM +0530, Vishnu Saini wrote:
> > > > > > On Sun, Dec 28, 2025 at 05:49:30PM +0200, Dmitry Baryshkov wrote:
> > > > > > > On Sun, Dec 28, 2025 at 07:10:38PM +0530, Vishnu Saini wrote:
> > > > > > > > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > > > > > > > converter. Edp PHY from monaco soc is connected to lt8713sx
> > > > > > > > as input and output of lt8713sx is connected to 3 mini DP ports.
> > > > > > > > 
> > > > > > > > Two ports are available in mainboard and one port
> > > > > > > > is available on Mezz board.
> > > > > > > > 
> > > > > > > > lt8713sx is connected to soc over i2c0 and with reset gpio
> > > > > > > > connected to pin6 of ioexpander5.
> > > > > > > > 
> > > > > > > > Enable the edp nodes from monaco and enable lontium lt8713sx
> > > > > > > > bridge node.
> > > > > > > > 
> > > > > > > > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > > > > > > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > > > > > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > > > > > > ---
> > > > > > > >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
> > > > > > > >  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
> > > > > > > >  2 files changed, 95 insertions(+)
> > > > > > > > 
> > > > > > > > +
> > > > > > > > +	status = "okay";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&mdss_dp0_out {
> > > > > > > > +	data-lanes = <0 1 2 3>;
> > > > > > > > +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > > > > > > > +	remote-endpoint = <&lt8713sx_dp_in>;
> > > > > > > 
> > > > > > > Does the bridge use DP signalling or does it use USB-C signalling here?
> > > > > > > And even if it is DP signalling, it should be correctly described as
> > > > > > > it uses signals coming from the QMP PHY. See how it's done for laptops
> > > > > > > with DP-HDMI convertors.
> > > > > > Yes, the LT8713SX is using native DP signalling, not USB‑C DP Alt‑Mode.
> > > > > > The QMP DP PHY is already implicitly part of the mdss_dp0 pipeline,
> > > > > > similar to other Qualcomm platforms where external DP bridges are connected. Because of that, I intentionally modeled the connection as:
> > > > > > MDSS DP controller -> LT8713SX bridge
> > > > > > This keeps the DT consistent with existing Qualcomm DP bridge descriptions, where the PHY is not represented as a separate graph endpoint unless there is external lane muxing or alternative signalling paths.
> > > > > > If you feel strongly that the DT should explicitly model:
> > > > > > MDSS DP controller -> QMP DP PHY → LT8713SX bridge
> > > > > > I can update the graph accordingly. Otherwise, please let me know if documenting this more clearly in the binding or commit message would be sufficient.
> > > > > 
> > > > > Please check how (and why) other boards handle the similar usecase of
> > > > > DP-to-HDMI bridges. To put it short, in your DT there is no notion that
> > > > > it is a native DP rather than USB-C signalling.
> > > > 
> > > > Sorry i couldn't find any good reference for DP-HDMI bridges to check signaling. I checked these
> > > > DP-HDMI bridges PS175, PS176, PS186, PS195, PS196, RTD2171, RTD2142, TI DP159, VM5200 but none of them 
> > > > wire DT graph endpoints, Please let me know if there are any specific DP-HDMI bridge you are referring to.
> > > > 
> > > > I looked for other references where USB‑C signaling is used, in those case the datapath always involves a
> > > > USB‑C controller/Type‑C mux/switch explicitly represented in the DT.
> > > > For native DP signaling, the common pattern is that the DP controller output is wired directly to a
> > > > DP connector/bridge, without any UCB‑C components in the path.
> > > 
> > > Yes. Please see qcom/x1p42100-lenovo-thinkbook-16.dts for the example.
> > 
> > Thank you for the reference. In qcom/x1p42100-lenovo-thinkbook-16.dts
> > I reviewed the HPG for x1p42100 and monaco, x1p42100 is having DP0/DP1/DP2 as USB/DP QMP PHY and DP3 is DP/eDP Phy, so DT graph wiring is defined as below:
> > mdss_dp0_out -> usb_1_ss0_qmpphy_dp_in -> usb_1_ss0_qmpphy_out
> > mdss_dp1_out -> usb_1_ss1_qmpphy_dp_in -> usb_1_ss1_qmpphy_out
> > 
> > mdss_dp3_out -> edp_panel_in
> > 
> > In Monaco DP0 is a eDP/DP phy, hence DT graph wiring is defined as below:
> > mdss_dp0_out -> lt8713sx_dp_in
> > 
> > I think Native DP signalig in this patch is align with the reference DT and HPG, please let me know if you are expecting any changes in the current DT graph wiring to make this clear.
> 
> I see, I totally forgot that it doesn't use the QMP USB+DP PHY.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thank you, dependent dt patch is merged now, i will submit a new series with these patches on top of the branch. 
> 
> -- 
> With best wishes
> Dmitry

