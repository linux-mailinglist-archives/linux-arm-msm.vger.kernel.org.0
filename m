Return-Path: <linux-arm-msm+bounces-95548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EWyLV9GqWl53gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:01:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB73520DDCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3804330AF66F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D766376477;
	Thu,  5 Mar 2026 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTNTgkux";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmyuLhb0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7422F375F96
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701049; cv=none; b=X+lg4EvP9+wGx8u3ILYZ6zwLDBCmAunrTM4P1/X8lBAUza10TOyjoDJMPx6b7OUhJYGhKj3pAFjw84jAwHfN6OMTpOvMFipmX0QQv1EPCTf2I63vgxV4WD51r+Q42n2QMJioy1HrcGRK32jqQ8BgDu8FBSvz4GEboCrHkffRrSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701049; c=relaxed/simple;
	bh=YJWdEIMf8ASCj1P+EAkD1llJK235Xw3pyDEe191uiys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG52BvMP2L6XH5o1VSSp7ZmwY8AFolvuUU3D/EQxbgQvPq0o37qMMz3AzL7sFuOpDT+wxF2mH/qiiVQoNopFb9PtpnsFyfkX6Q6Y4bY9/vS0uwijMBXnV+E2FbkE1op9HV5nZApKiWWoVS7BmOWyLsLOhfJqiQH93BxhLNKtusQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTNTgkux; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmyuLhb0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258qp3C628712
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 08:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g2QX49Vqh00Z07fTh/aNaujc
	J84T6LYPP7usUAtLV70=; b=PTNTgkuxe4kDhyEN14MR94TGk1n8uX5dsmw8l3cD
	R+V2ZHdkmEqqmzQnGnsEs/R6F/QQsq8/C4eF15o7HYol/DxmhCJi0gK2EeMOog2n
	e710eqoLrx4Z0XzeEXGmitYubB6UjyPWyzanCWBt/j8qpBktsu/stcGFA4UVSgM4
	6yKEPG332QAZ89fQMnTZxMicvtNbTsxXKODT0HoFtwItchPm6P8EIyfcb5PX8YA3
	lDiG3kVq9+B2BTH2rs7sMQ2UH+2bjnu5rhoJghvihxxWcEXXOcOY94XbEb7cWaGy
	6DIBYGIg19GrmhrI+hmrQPiv1OigAVfRMp+hGUvHFZfpGA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m2kb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 08:57:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be27d4e3e5so2980142eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701046; x=1773305846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2QX49Vqh00Z07fTh/aNaujcJ84T6LYPP7usUAtLV70=;
        b=jmyuLhb0Aqtkcc4sydRN9JkdTYsuE211/bGllJykTtyB2df6ezHQm8Vb7Jd7Qrep6t
         o7Um906IZ1MyLLTkHYwu6mxT8FB66uYD3d/DhspgZ5KeHILR9hBH39hGTqX1KHcj41rc
         XCPmdwvgs2+56Pp0El5QRGFOGJgJn6NGdZuxqieG3qxQS0OHrbgcZDCYDCAvS1uAi7hP
         4SRXXg0iybhoA/JlciU2EIfW0KE3lSWvSV0g4SrtHzDsgDd3LqH7kRfsAOnviAfonTz1
         +V/g74+WKQ4NYB8zeQs2PBjuIWCuAkgbvzoBbzlIYMPOeIqvDwVuTAVSpdidbiHUsXwG
         7ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701046; x=1773305846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2QX49Vqh00Z07fTh/aNaujcJ84T6LYPP7usUAtLV70=;
        b=Xgon3Uygm80P0TYZi6Lj/aiV6lFkL88mcE3Y9I33foxyjyqh1iHk0VhFEk2kPLy1B4
         WSoGI9LuyTtN6r1K+YGQqWP+a2/qQERtFdue/QfZzG2ZB+qiOel+mEveusdcE12yMU/e
         EAMVD2vLIpi/iXmhEEDuKrFnSwNm+GZuzFbT8NTik7Viq+/AqMAphc7wuVQEQKj47Zec
         hEtYNPpK4IQxk+BfmbDf1pQg6rusWqI3nf4MDj1gcVL5s2lTNJtYavx0eIykoprZeSMY
         gaq1trUPYhzl9JS6rdzpTZgVYo1EHtUTBTfZVaQk/6U5DzB4HfPlpL/eHFY5NNzYeRZG
         lb4g==
X-Forwarded-Encrypted: i=1; AJvYcCXU3HT4NscUc5gHcf5UnwbMHw6pUZabhH4UwDCexVfLxtmyb+LgVYFZFq/xRs1ik10vF4kNzIs3o2zlGABW@vger.kernel.org
X-Gm-Message-State: AOJu0YzbKtAaKHl/4QXNtskUkuycF8j79Tzxpuz5VmU3DUEFxBWJrUdV
	8ALXKNZVxy/ZJPONwdUx1YvxWihQZTLh2XcvcZhdtejZ37x8skMb4mpg+3+yeba9LaIxLvBwPEu
	cKGoNzgy6+AU315/n5fafkKvGruMaGCflV1770yMRoViri52yJzrs9ksnrSuDXPDbxoFMBjDhrP
	Tp
X-Gm-Gg: ATEYQzxtgqVFIAPQxyDJOM2tvRqaTKNidb5oR2GpqvtkW4+jQQ5oirKFlrfzDxD/s4+
	3pYOZ5pW2zG9o3ixSUH4VkxK5sy3MLSVMRQde1l+4BBet3DBI/rBCYo57Dzu5hCkD/8GpJ7I2jn
	VbEOFBGpRODbVsy/CyDgz67agBPlkNoKHLa9nz0Z5fgC+sFrCJJOAFabR6LPGWfAfB3YgCvfuNG
	x+VODVAyu7d9ufo1yktcCXTycS9Xef+AgjWlafqv09EDmCE+CjyG7JnaHpBJDxrcOWkl/KMg0sm
	OYbP6YmbygQWNPCS37ZL5zhFC/VLDPurEIrj8PG0F8sQ4klCjILBxo++9e5x0rS64JMvLMu4UYX
	NoW10IqZyPT6Qv+oB1RHtoIwgTgea9Ql8apaCHlUSlGdzZl9daFcoFO+ZjX/igqZoBF59
X-Received: by 2002:a05:7300:fd04:b0:2ba:8018:cc53 with SMTP id 5a478bee46e88-2be311d1920mr1882889eec.35.1772701045714;
        Thu, 05 Mar 2026 00:57:25 -0800 (PST)
X-Received: by 2002:a05:7300:fd04:b0:2ba:8018:cc53 with SMTP id 5a478bee46e88-2be311d1920mr1882872eec.35.1772701045085;
        Thu, 05 Mar 2026 00:57:25 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2056acd1sm5583020eec.22.2026.03.05.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:57:24 -0800 (PST)
Date: Thu, 5 Mar 2026 00:57:22 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen supply for Glymur
Message-ID: <aalFcobmkaTTjQlE@hu-qianyu-lv.qualcomm.com>
References: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
 <20260208-refgen-v1-1-87ca84fd78b3@oss.qualcomm.com>
 <20260209-magic-conscious-seahorse-b81c8b@quoll>
 <aY1Jx5J8x/OALk5M@hu-qianyu-lv.qualcomm.com>
 <hcslao22elcihjw56ltu4yo54lotheqpikzsrq6tia33di4fs4@2ygrbwhcfx2a>
 <aaVkpKZcrNM7k4Xm@hu-qianyu-lv.qualcomm.com>
 <578c485e-b7d3-4468-bece-efeb6db2b1e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <578c485e-b7d3-4468-bece-efeb6db2b1e1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a94576 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=o9cD3-WFi3VABs8zBZsA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: gbwZ8yyif2mng52zXP4ULbWaV6JmT-If
X-Proofpoint-GUID: gbwZ8yyif2mng52zXP4ULbWaV6JmT-If
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MSBTYWx0ZWRfX41qmhrBkUBWf
 mNO+nVCAHrhWg3auU5c+y/MmBYYBOqaVg+0gMnv5Efr3BB1OjhjwR8flgiaseXLg5Sv5R6hEf6U
 ooFPcp1vev+heVk9l7eEQDLeZSKATYvDQjkbxq8RZLtHdmEpIjiU44iWOzonKFY0tft1UmPOWnH
 x1G3j9eqEjlMCcB8nU3gTj66Z56xc6Ds4cqH46SQqoK5qykuz72PWrHreyFpLWZmFxiy13Qi/cT
 5ygSwjyxEU26YLDqS1u3GGAnd4DV27dwAWXDBo25f83EIFEHGtN1UL/hl3A+q0nfLFTfuIeSVkK
 quVckidgEl1AioGh8n41+U35BNp4mvdl9fbdgYO2ctj4KcrMXpei0LpZg1qzcodUf7F5WS/8v86
 NxgiD0kKC+6Rj7pDPmpYAhsfBVSVJzuIVj7EJzcEb+8qZmkIQr3cvbe9Qm+CwyhHkdL1Wf9QfXk
 sstPRjqnRGa9DAhHZqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050071
X-Rspamd-Queue-Id: DB73520DDCC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95548-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,hu-qianyu-lv.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:14:29PM +0100, Konrad Dybcio wrote:
> On 3/2/26 11:21 AM, Qiang Yu wrote:
> > On Fri, Feb 13, 2026 at 07:47:36PM +0200, Dmitry Baryshkov wrote:
> >> On Wed, Feb 11, 2026 at 07:32:23PM -0800, Qiang Yu wrote:
> >>> On Mon, Feb 09, 2026 at 09:06:23AM +0100, Krzysztof Kozlowski wrote:
> >>>> On Sun, Feb 08, 2026 at 08:49:39PM -0800, Qiang Yu wrote:
> >>>>> The PCIe QMP PHYs on Glymur require stable reference voltage provided by
> >>>>> refgen. The refgen itself requires two separate power supplies:
> >>>>> vdda-refgen0p9 and vdda-refgen1p2.
> >>>>>
> >>>>> Since there is no dedicated driver for REFGEN, add vdda-refgen0p9-supply
> >>>>
> >>>> How does the driver matter for the bindings? If I add dedicated driver
> >>>> for refgen, then I change the bindings?
> >>>
> >>> Yeah, I know that dt-bindings should describe hardware, not software. But
> >>> what I meant to say is that the refgen is different from qref which is
> >>> controlled via TCSR registers and its LDOs are requested to vote in
> >>> tcsrcc driver. The refgen doesn't required register setting and it doesn't
> >>> have dedicated driver, so we vote its LDOs in phy driver. I will avoid
> >>> this statement in next version.
> >>
> >> I must admit, I could not find references to the refgen in any of Glymur
> >> PCIe-related HPGs.
> >>
> >>>
> >>>>
> >>>> There is qcom,sc8280xp-refgen-regulator so why there cannot be
> >>>> qcom,x1e-refgen-regulator?
> >>>
> >>> I think we can and it seems better because the refgen for pcie phy also
> >>> supplies reference voltage to other modules like usb. But I checked the
> >>> qcom-refgen-regulator.c, it contains some register settings and there is
> >>> no LDOs voting. I'm not sure what does those register do, maybe Konrad
> >>> can provide some backgroud.
> >>
> >> Those regs provide voting for refgen, because on those platforms DSI
> >> block doesn't have a hardware vote for refgen.
> > 
> > Hi Konrad, Dmitry
> > 
> > I tried to model the reference voltage as a fixed regulator but the fixed
> > regulator driver only supports a single vin-supply. However, the refgen
> > block requires two separate power supplies (1.2V and 0.9V LDOs).
> > 
> > Would it be appropriate to modify the qcom-refgen-regulator.c driver to
> > handle LDO voting for both the 1.2V and 0.9V supplies? In the regulator's
> > enable/disable callbacks, we could vote for and unvote these two LDOs
> > instead of performing register operations.
> 
> Wait, so you want to associate the MMIO-controlled refgen's driver with
> a dummy regulator that takes 2 supplies? I didn't catch that part earlier,
> that's not great..
> 
> Or do we actually have access to the MMIO of *this* refgen and can control

I can't find related info in any documentation.

> it (except we don't do that today because X Y Z)?
>

But even if we could find registers to enable/disable the refgen block,
the two LDOs (1.2V and 0.9V) would still need to be voted/unvoted manually
since they're separate power rails that feed the refgen.

I searched through the drivers/regulator/ directory and couldn't find any
existing examples where a regulator driver enables/disables other
regulators in its own enable/disable callbacks. This pattern doesn't seem
to be commonly used in the kernel.

So seems like we have to vote this two LDOs in phy driver.

- Qiang Yu
> Konrad

