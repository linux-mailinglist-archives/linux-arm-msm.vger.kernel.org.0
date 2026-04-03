Return-Path: <linux-arm-msm+bounces-101730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM/rBPYh0Gkp3wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:24:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 654533981FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBA89308E4E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 20:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CAF3D5674;
	Fri,  3 Apr 2026 20:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHG/A7Eq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="euuAXcb0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0962EAB72
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 20:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247668; cv=none; b=LyJGvkh1VmU2wqkhQs4xChsaS95jcx1GviuZJPCuQczF98ZKJPAOJQZoVhvU7a0SWoNefXZ7fxEN9tQn6/Vt1mHl3r3aVx2rm4nEK8s2lqrpGO69+0XyrZ2tz3zCZoOQVzd95f19RrdQ5xsUkakDXOab+cNzPVVm2ubBGjH+z7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247668; c=relaxed/simple;
	bh=8aiP6h1T+J1Y5W6D6bpL5A64MY3M4snDFjE7mjRB7h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZynsaVLjHSSWf7g34LA29iMbui33RGpU9AgTZEGSojuu7piyR7ksLfT2ACwSadskA1iEqM/zHiF2rxDmY+2shVEa6DDR4KRFxzVSjvwvyNUTaXEBCTSq3t41cvENbBaZ8XjRvtUcrcx4SL0v3EkcQBzZPwi1+g0zR393252Kz2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHG/A7Eq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=euuAXcb0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Emaev142148
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 20:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IXtD3aepglFU36wR4gYJ9C63
	QOxUrZddwTLBJBANcQs=; b=jHG/A7Eql1t5aEV7q4qX7N3Bcq97bbRJWpvcY6DK
	cYUpIxe1l7PzqTgLKCxENUaNrzFi+bDbUrtkA7dno5PNCWCLa+khdhrBFNXofMSz
	W6PTC9FCg3Lnqm2GFzdvPyyuaEG64oaNVEp+wdJXR3k1/E5L5p4ZXI2DhHcU6IWT
	sYLygZoJUM5tMsdAU7S+76kIBpbAy/9T++9v55q/91yp017DTjbSmVKO07nrV1B8
	0Uz0KCPQ/v0Roz/sMdZ8oyS3miRkqQeVxwnKlEU3wvEdDU4VjiBFxrGguVzSft9h
	qMW7BROR8AXBtI5uyRjp3Ikt5btZchtWLl7zQpDnZohSgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y29e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 20:21:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509219f94b0so68978241cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 13:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775247665; x=1775852465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXtD3aepglFU36wR4gYJ9C63QOxUrZddwTLBJBANcQs=;
        b=euuAXcb0rLhGiJMNKKSHMp3GKPF4/YX4XFpwFrdczVLjFzx7r66WePthn8iyJrnezI
         DQ6PnQ2lEMqj0/ERoakMj9OsTUEHZPQMQ+2wYAVkimrELzSha0W15D/JG+pY7p+WKHR6
         12udUOjBVsMlez4QgmP5KmAeHMKPCaWOFCXUTRwalSfT2ksV6vNlJLfhyBD/oNLlkp0m
         iVfk6JM43ddo+L7temI9UuwpTk53LeFwJ7caDu3IEGNfz+sLVpl/foE2j8A0G8EaLwkT
         R37OWWqVMB3RxkKSpcU3lU/OsaWfz6EnpW7GbvGLdBxa+OXTtwDGS3hUfr/pHX1mBY+S
         xjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247665; x=1775852465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXtD3aepglFU36wR4gYJ9C63QOxUrZddwTLBJBANcQs=;
        b=nhhBLSV9/JtqDy/29I9zlo2jwLDz7BqxYuMyB3Cfyoi92JH0vhkTwQqmS3+fOAzPKX
         fJM7bJftiKnXsDwkUN7/WAJQykbA8JeWf17tXm+ouBA7OLjHkhs6XZEOWX6E1fWmQboP
         9BwPKnOMjqdXZ5V/hCBdorJNIFg7/7ZvM/UX5og98WDxWu+CnPY6Sg7rS4wB/9ml1sTH
         lSY5ONJdTMUfSSGFaMF+vy0uADo71QM9kbTdZOVDoYSByiY9MWzt2KOB94mvjW6uLX3K
         4aRKG5lO8oHPK38rfK6qX3hompO8d2VAAf7TfsKgzdm8sFF7UsW6x6u6LX+ewzfkRB1g
         9fXg==
X-Forwarded-Encrypted: i=1; AJvYcCUKdzD4tKjapb98PNOCzHJhdYucOEvTmmGQqMW28nWPxx2IUPF7FdVnCP6/rCybC3hoIxjU1wef0ENwSmoT@vger.kernel.org
X-Gm-Message-State: AOJu0Yykni5QO+uyQuQiK5mCP3o4okKxz5gvW5+NZMKySFaUhnLjr3LU
	REvBYy0ZmSdnpmsUEDRLx8+CWPhms5Z6I0x9UPQayr2E/sii7jixmqJ8Qpbo3un/KOVuMkWJ9Mu
	U43F3vXaalZLGJktxkg/aw/diggBDJgNDH1O/nc24XSzN+VaIVYFC3/bUIrDIc9chyFCl
X-Gm-Gg: ATEYQzyMo3jh530x5ntI6nmrf8tvW0v0tje2/jTTtHQ+8tNeN6+rrLJlVMMZh4jMiZd
	1r/SpnUlt5rHEhxKmdoleCVj6p83OXd9X/GXlR6S3VGloA75pB9vA9o00OFjIblU4rrcrDPvieR
	onASXmAOfy/eje3Q/u1WPBgPavJ8883yYZTGpmbdtW/yAJpalY5rOlMySqLlrEGK6nK1fvH0HoJ
	Wqav8SK5asmb64xTSMNXiIuk8EUUTw26IV1erMSwomyEI+fUUYz/3CPdL4eBOW1Wgsr6b+VeEeE
	GjNwYFayldACRqbjRIGMxVsWPLV7gyJ1ostY2rxS9NrzGznUfAOHMBXlblButFLhgn6aQyO/10b
	AVSjVyPYKtB/5/KILbbvOg0Yu2NaZ7GbSLvYLnoQiG6NU8oFRLgpZXYG4NDNgD2IAN4gJoEn3me
	wWfufUXF8bz0n6AIi6jCei7vBgYul1ds07RUI=
X-Received: by 2002:ac8:5785:0:b0:50b:2e8c:6ae0 with SMTP id d75a77b69052e-50d62ad5287mr64692331cf.45.1775247665330;
        Fri, 03 Apr 2026 13:21:05 -0700 (PDT)
X-Received: by 2002:ac8:5785:0:b0:50b:2e8c:6ae0 with SMTP id d75a77b69052e-50d62ad5287mr64691951cf.45.1775247664836;
        Fri, 03 Apr 2026 13:21:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c951b1sm1688529e87.6.2026.04.03.13.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:21:02 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:20:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
Message-ID: <n5pxrfwgqdg62p5s7mgxmvx64o4mon3wlys3nxzjlcq5v4o6bh@3gl5dtfctmvp>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
 <10a9a474-7612-478e-9fb2-85b7b01ec7f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10a9a474-7612-478e-9fb2-85b7b01ec7f6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d02132 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2h0Dhg-k5Ge3AQLY1mIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: a6x8FLUK8J6MPjKauILVwnFIB1rOdXZz
X-Proofpoint-GUID: a6x8FLUK8J6MPjKauILVwnFIB1rOdXZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE4MiBTYWx0ZWRfX5oEEX0Dqt98m
 1vDQTnJOHyfezSug1+hw4K19Z30dZMnZ5XkrDRILwshnlf7jNoBfZdVknpqNld3GpPIHgISUPSi
 tNX2HHqBiJ+7a7m4QHhywhxZJLO8rDCsNbWabslMd4tAAdkVbP0Dv7g8Wwd0s6QiAFy5Wmied39
 IjmxlwQZSdfKDQ2nSGQq6Eqv03kHYIsM9y0LaYp3NpRM4uw8zrY+KdhzEmJGKYfTJhcKYpVRoBH
 5xYQAn3XkKg6vu3YYIfMVngZvosZCxpUgPoj2KC0D4Dd6XmxH/gkgXZYxdZBncgx2lFfH97BzT7
 RWxndHWVScWhGBBEhKsrwBZCLnKT2cJkhZ/KfRR6VYFGBQbpubrjH2J0w4Ze4UMD9jfX8FqliLR
 7mCW/NmaPozCFfwTjOXGyxTIzDLZDUyc3zkTf2/vJsoXLWC+E5j86baghTK/2lebEiD6lRR9u0Q
 D/5MDE7vdpWAip3bfSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030182
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101730-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 654533981FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 01:39:50AM +0530, Akhil P Oommen wrote:
> On 3/29/2026 11:22 PM, Krishna Kurapati wrote:
> > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > 
> > Enable USB support on Kaanapali MTP variant. Enable USB controller in
> > device mode till glink node is added.
> > 
> > Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > +
> > +&usb {
> > +	dr_mode = "peripheral";
> 
> I can see that the usb port in the MTP support 'host' mode too. Should
> this be 'otg'?

It's stated in the commit message: OTG requires glink, which is not
available yet.


-- 
With best wishes
Dmitry

