Return-Path: <linux-arm-msm+bounces-115613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jre9I0LURGov1goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:48:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4576EB410
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:48:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y6sxk5++;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="hO707cL/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115613-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115613-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB6D9303F444
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5753F0A90;
	Wed,  1 Jul 2026 08:47:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168E93EFFA1
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:47:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895657; cv=none; b=RiYsy+UAzl1WC3t0cDAS7LH3hYcq5B48zJkj58RtszLVK4W+Mx+dHsLQYJMIkTe+PBBbISQRrjVtIMGUTbbEwtOrZmbIB+jI25EOLSvXDgthVa02/qg/waJ62EFzm1m0KGsQY39To6aDP/p83lWEImsldCRCbTEi1diQDMDeClQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895657; c=relaxed/simple;
	bh=oprQ9XVDp3+mPNvAdK17kUzNXc8oPG3pFxUJUPdh4Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rck3NAAgEBpL2TrGKdfDm4nmu2FczWMun9RzljjfhCOOUg4vOA1O/jXHAoxKos+JYC07eOxK5cR1XO/IeDFAtPeUBvI90ZSzVFjlFDFKNmSnJknIjY2349k7Q/c3cgeMul2qKq4Hpv4R030t4JHhZvqK9SPTRXGZX2Y3t40krFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6sxk5++; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hO707cL/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G63F413799
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KoQsjVH1ilFu2iiwEa1yweVh
	3IKCGAoAPFTfsbbLkiA=; b=Y6sxk5++5awHgFmeNItSimgCoczNqftVQaEvYal3
	WRajB6HR1c2sdRNS4aX211SzcpF4PKra/7f+EkO3V6GIgt2FVPW30Z9d6SDzinCM
	xrkm8x+V+E18PUAI1YFJthlhMNQ1dd9s+UvzIVgWsj0LXVehckXmFM7cvFTNU9D5
	0RcdPARf8bJrmk7co1rrHIgzvmin4jwouNLGMOCL9tD+bL1fwK5vG0C55KA5hVxf
	6B/MM0Tx/Y6knYOuSqtiDhGEyzjSiY62DOWK65763Rbw6A0xfnwcx9jIYvLJmcwl
	hdPMZTklVgE3iHrCmFbu2i+jZZj3aaAotpix3SyuudcJEA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sk7jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:47:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e97889ac8aso5490906d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895654; x=1783500454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KoQsjVH1ilFu2iiwEa1yweVh3IKCGAoAPFTfsbbLkiA=;
        b=hO707cL/DHCnjzU1PEtvnWUFMKQINVE501vnMJeSZsJDVtMRkF3kx9IZcBzOkrByfe
         K5I0HBXA+oJHKs20tRIBjaUrRtR9XLd6I6T30gXmhnyJRvV5gUjRji4yUbeiL2/3n6A9
         +LriJkspnlkyfBjCcxNrOGct/1a1bheNBTG5R3NMLCHQqMq9MidtYysIaosWaM2FMyMv
         SVJtBJyzBM3b7TRPXW0OkODHtgCol3jTOKZUwziKZO0FCl5hOLKRoNgqu7G0sOINg1nx
         QFlPSsenPmh8f3hxV+8KgGQubMC5UErSHDH50fOYj/h0s8TmGEluHlCw4GO3BiJjAMaV
         nh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895654; x=1783500454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KoQsjVH1ilFu2iiwEa1yweVh3IKCGAoAPFTfsbbLkiA=;
        b=ZCKYQUUgXqm8nvwnMqiMz6GoovuAlJDO2cZFT5WA5/aDTfTtY8/3JPXjHrKavCYy5Z
         pqLAEsn7xMqKdhgiRMJkxCzz8zAmfEfJBunGBIgstz8EHaQFxK0avrOap0dcpClKoGLS
         b7jmLN5fut4Hd78LdjTAoFFQ4SxyJX72dgi5lHvPRvY+cBYq+Wnd+tkrIkKXBXuvm0W4
         hj7ngbu8KlNXAHjaYJR4Zo4tYnorBoW61UHDGgHw06x5fJtoXAbbP5XPOmtkDWJIBRqx
         o27LvgFpXGRLAXjk6EtEF9jVjVWBhhzMV+aq/0jhwYCM06LKt0yGaykhjwoRrhHDSJ3b
         Wxdw==
X-Forwarded-Encrypted: i=1; AHgh+RprqQlBgsu/8UHekmlKpRvJwkovzEiLA482CHENZp1WQPyqxmQqv1+SFH/HBRay1/OSFvCImWeytdre9opF@vger.kernel.org
X-Gm-Message-State: AOJu0YwaMcxo3S7ahZ4BOLHHNiQWfsGdcuwd3YjN1boyrMrcaZBiTgc5
	ydkOFhardKYHU34pHGLgkw2BDbZZSuXbJlu32Ec9V874vVj37FFKFm7zRu+q99/z4aIrAjFZUem
	V3i/EYUyk/UUo4y6gg2HdAPpBAmGAiyoGLT62DWEOJGxGa35Cc+6+Iufe5ZgYJGmE92xJ
X-Gm-Gg: AfdE7clKHXF/fp0raolErnqJQ0nIwAVbCQLt+Sy3rEUEECDfE5W9iAU41ugOHQu6/hh
	mPk+23Jj13pFQG3Defc57LSQtqQTMp+16s6QKPXXNsln8wFHGsBJj4RR+04e5OQUfuwA1U4gQd5
	1hrmT03q66MgbE8EduzUN2+h3Wqjg2pc7DGA1odIzbEJWTgUroGcsTKO5s8FbucFo8Oe9LEHbI8
	4VRQErDgXIxGhm35NOPFSu8+umQG5hfC6JCh3J33FQ8ahx6IrcgoEJsDAOj8cSLJYm/1+kSe/o3
	QZ/IpPORluzIzv1NqNgAMm9kQALB3vQNYM7CStv8CoWAR+l/M3bp8QAcNyVrPigAfJOxYjCDf25
	IvgV2BoQxRUr+RhRQ7bm2r69EjdmRheDJ0CgMRYdRJ+dB5P6orCsV0iY944y74Thux9KNsNI//Q
	==
X-Received: by 2002:a05:6214:4004:b0:8ba:3fc9:88ca with SMTP id 6a1803df08f44-8f3c8d082e5mr7699706d6.39.1782895654311;
        Wed, 01 Jul 2026 01:47:34 -0700 (PDT)
X-Received: by 2002:a05:6214:4004:b0:8ba:3fc9:88ca with SMTP id 6a1803df08f44-8f3c8d082e5mr7699416d6.39.1782895653922;
        Wed, 01 Jul 2026 01:47:33 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f361da0c54sm16139736d6.44.2026.07.01.01.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:47:33 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:47:26 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document HAMOA-IOT-COME board
Message-ID: <akTUHrBNe6X4LYM5@YUANJIEY2.ap.qualcomm.com>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
 <20260630071022.3256-2-yuanjie.yang@oss.qualcomm.com>
 <20260701-rigorous-analytic-mackerel-449703@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-rigorous-analytic-mackerel-449703@quoll>
X-Proofpoint-GUID: SdMoHXzs60GqIx3FP-V3inX6xaR9ZcqD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfXwF4CbxVTYqmP
 WJQtzXzIeHqfnOTbOkfuWtVqJhrG4QzZR1I+TjfIiB6AHfsdbahMynNWHw6qomuHRp2OBrd69Y/
 vf9B35tN04XClCjLSsB1aLMikidKk5m0aiEaVzYftOmGL0C1H4jKC3PHf1QbREzsaKd3i+AOwtK
 0LkJwcDGsN22W8jEj0SB5q3a9gcuR/qISBdyQG5buCCkY9XDdIrcZ5FqRHM6bNTASfTQAnkrlOe
 pp94zGcdomILjldBnhRMTXU3eZakIbO+mzllM9ANngCh3Ru8g6I4j6jtA9cgpK1Shq1Fcvh3+rH
 24SR62crFtHEHudEbcu5LfIVmHH8q5E4S8Egb8I2lBAjO1MA91u03eJeaHVxgEapSrozIQZowFR
 an5oNnPtVkG4w3kqHVPb2oxLDIf7AYqFPlDePR5c5I6aOWAT9xYGqj0BS2xyol8dsOYI7guektX
 zrxlfCIdhNfaEYB5IkA==
X-Proofpoint-ORIG-GUID: SdMoHXzs60GqIx3FP-V3inX6xaR9ZcqD
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44d427 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=CZ8AopsyOcsE_E3q8cMA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfXzkgGvCGE/5yx
 xkS+b6pzv/GOf1lj6wnVqIF03dS88NMIL5W8soxPM4yU4zA2MftlIcxz6TR+/VH/MOG18IKNzoL
 805+LxHcMQqH2Cuo/eJgWr361dlgBVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-115613-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,YUANJIEY2.ap.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E4576EB410

On Wed, Jul 01, 2026 at 09:28:41AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jun 30, 2026 at 03:10:11PM +0800, Yuanjie Yang wrote:
> > Document the device tree binding for the HAMOA-IOT-COME board, which uses
> > the Qualcomm X1E80100 SoC.
> > 
> > The system consists of a SoM mounted on a carrier board. The HAMOA-IOT-COME
> > SoM integrates the core system, including a SiP that contains the SoC and
> 
> This is contradictory to the code. Your binding said you are using IOT
> SoM, not IoT COME SoM.

Hierarchy:

Hamoa ComE
 Carrier Board
     -> SoM
         -> SiP(This SiP hardware is effectively the same as the SoM on the Hamoa EVK)
             -> SoC

Hamoa evk
 Carrier Board
     -> SoM
         -> SoC


So I think I write a wrong dt binding about Hamoa ComE:
correct here:
I think the binding should be: 

1.
      - items:
          - enum:
              - qcom,hamoa-iot-come
          - const: qcom,hamoa-iot-come-som
          - const: qcom,hamoa-iot-come-sip
          - const: qcom,x1e80100

or
2.
      - items:
          - enum:
              - qcom,hamoa-iot-come
          - const: qcom,hamoa-iot-come-som
          - const: qcom,hamoa-iot-som
          - const: qcom,x1e80100


> > related components.
> > 
> > Hierarchy:
> > 
> >     Carrier Board
> >         -> SoM
> >             -> SiP
> >                 -> SoC
> 
> Drop. Compatibles define that.

Sure , will do.

> > 
> > The SiP on the HAMOA-IOT-COME SoM is equivalent to the HAMOA-IOT-EVK SoM.
> 
> I don't even know what does it mean. How two different hardware can be
> equivalent? Are they the same? Are you creating duplicated compatibles
> for same hardware?

This ComE SiP hardware is effectively the same as the SoM on the Hamoa EVK, 
It's just called differently on a different board. I should update my
commit msg show this.

> Best regards,
> Krzysztof
> 
Thanks,
Yuanjie



