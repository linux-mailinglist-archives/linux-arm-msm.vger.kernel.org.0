Return-Path: <linux-arm-msm+bounces-98360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJdDMGVqumnnWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:03:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C112B89FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B52F303A118
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7115038E5ED;
	Wed, 18 Mar 2026 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N193ab1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IGJ42WyF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234AC36C0B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773824505; cv=none; b=Gi0a66MPoyhcPN+bPy9759ppH4HAuCSKK2bloXCdXJy01ssJ4mOPbyB0aNmhPzsQRrVYd+ixZ81gZ8XuAFvyUOK2VNU6yz82D0otkU7zu24sT6zWrDYnDGoA8qe81SRIjArSrov8q36BvX20G7Zcs+l76RXj9c4FcvGFEjQEHOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773824505; c=relaxed/simple;
	bh=qT9qLg90H57tYiOueJJhZtRn2Yv1150kwWxBzpCr1U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Duz129aBVa3jHTWSYh1FR6/GlV1MPC73sI9pgnikQ/ZGY6xlK8R0Dzw/hgnuS/z2vCE6jlKf1Wbwh7nYq09esGDkcAdED13GJDed3JXgORIEwWsH6h8Y7mz74krGlrp+hzvGeY73En1nbWJPcGhoTePwswaA+cezYwOZ2NQ+PUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N193ab1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IGJ42WyF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8mB9J1632446
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h2tRNdbBQv7P+2iASGcHIa0C
	E+XHqx1uSsy6uRlRIxc=; b=N193ab1ZhMdTVVDi7rzIMCn3Hj9v8J1rm8t/Aa29
	scUKlmx5Zf6vrqPxXWrDXFMfu/2Urks+AtmkyEh0z6AM4TmpR7J6BxuMSuI7fqaA
	Q5CAZs3u0FaAYem3V+fZboCx749JCJFs4Wg4PdU2gPU7qrB0t2KMLB3145VnECFT
	F1CJeWGWNqcgy0CrPO43DhfYutHpXXvGP8ibjbsbMIA7mQgCCYTG3PnsB+oZVRMr
	P+oXQgfgbQTS7TCvLrIpBzpTzjy9ozkb7ttZSW43HRK24M/ts20tKdtDjtbL/m1o
	LtcMoMePANBTrx3z1pMwjkYzBvn2o5lFaqONX6/pHAH4cA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyapukebm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:01:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-950be47e8c9so18274187241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773824502; x=1774429302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2tRNdbBQv7P+2iASGcHIa0CE+XHqx1uSsy6uRlRIxc=;
        b=IGJ42WyFTJkWGN1Yneb+8XmhzB/Q48gsquPQ8Orm5d1G/x9YTFxkIH/DSZWRowUd+G
         saBzG3y5aaP5iJaqUBk/9K4lz4eV4/Ftxf1GkG4uDwdLgHSM96/oyyrPja4CfXSrjZFs
         GuBTpf+YNf/U7/1hVdRr1V/d7sD/T31E9h1A6th/S0Apz2/SHr94p98laqISCvO0doX8
         BHGUM+yz/836Uq9JAxiPcoKmWzSm5CeW9Y5txEOEDljwBT6pkViD/ng0/DZKUgXMIYs0
         Cee0lLHU9JElYe2C8Avbi1T2oMbAQNxHB8seXHRdGkFRXr3VZ7Y5auW9bxDjGfPi2tFy
         wN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824502; x=1774429302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2tRNdbBQv7P+2iASGcHIa0CE+XHqx1uSsy6uRlRIxc=;
        b=Y95O3qMHId+F++N3YZj0scfykDddAtAvRX5rpknKs+m2Jae9ogc+JuDHrVcu9wsSK7
         g+XGhKQ+8i54lObfEFIROQyaJIy2wQRuVRvo/UL8DidpDjAK3BXno5OsMUDjNz2GAjIU
         2QqiadWU39XjykMDSgrdRZ+oxD79XFTxmksdgxFD+o4enxRw5fLW7vcuA+MWZcFHBDNY
         AI//SM5vuqSSlnZopQzNsj8VQ4/S3HLUe5CgTW76BD6WRvsy8l/lQgVhbPnsxtk09usl
         g8keXdLAnwNc79lqDAip7Tbhf8SY2rjH0sumpW8fsoo/E129daqMZmZqos+tnJlvA5jz
         33Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVBusyipzDmWfd5OuS4fq3glytMa5ToptRl8bQHh63RsD5HMCnRNx/qPobihClaRKPORtojQI65XOOZ30Wj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz5VI2GKjN+Jmh5yLbiUcRbi15MedrxK0Vehuy6riUQYvKzQpu
	E/zeZWtjJHn6r5zsP3eEXA4sFRoQWayJZUWaF+hvc13b42TT6JvONcsiVrzYj28wJWyNTkQZW58
	1NM2meYYftgv6eWAY0HOPm/jyadbHTooMquMUDXypSx00wD7WflMctDwTaiZOLUTVZuP2
X-Gm-Gg: ATEYQzy8brLXEctVT5Vp+2HWoztW+XVTZUCbojptNnchmQNwssixAJevpJdRC9gueLD
	lH3BIFhnmhu30Rn09pfJdwKTRllVxVp/wpboMlugcU6QIUK38DUxolY7/yXTPyybKqr9y8Ri2hq
	OOsYWIScBv10Pc8/qJG7iu+AMn4HEfHDPOTnlECOA7khcheiQYbtYK1NBnrPHUBnSyZJ+d8/rKr
	mBEgk96kZjMoCq3CSO2X5sakhGUy/cfmMsnJIlM9zdkVFzZEaURz+9aicnebVY369Z+mpI+lVQO
	P1xWYzXTGMpA32UzZ8bJjVogerBfak1ZMDNASiU5gbXZmfSOf+3UvUPxwKJC+JKz2ILhH1H3K1m
	ECnRupO1WDWfwOuvHc0mtyThW58vLdi1jNw==
X-Received: by 2002:a05:6102:54a5:b0:5ff:cb2c:a04c with SMTP id ada2fe7eead31-6027d098f25mr1279099137.1.1773824502145;
        Wed, 18 Mar 2026 02:01:42 -0700 (PDT)
X-Received: by 2002:a05:6102:54a5:b0:5ff:cb2c:a04c with SMTP id ada2fe7eead31-6027d098f25mr1279087137.1.1773824501421;
        Wed, 18 Mar 2026 02:01:41 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4434dcasm48010735e9.13.2026.03.18.02.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:01:40 -0700 (PDT)
Date: Wed, 18 Mar 2026 11:01:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Enable Eliza MTP board
 support
Message-ID: <syhsf3ztpgvbajdzdrswi6wp7zbfhvndxkiuidlu4d3ixrnftf@ngiozebc7ob5>
References: <20260313-eliza-base-dt-v2-0-bd91367d860d@oss.qualcomm.com>
 <20260313-eliza-base-dt-v2-3-bd91367d860d@oss.qualcomm.com>
 <sf2e5rld6oiv7piqq277ppe3xqrh7q6bz2qntekzusq6w56rr5@tc2kdlnocul4>
 <vpoq5lznz3jcfiumsfgdskspus5nzotl2utoaubidfktnvw3za@txma7z7m3v4f>
 <3twoflmcthhja6sbj2jg5l4dm52zsvfpoajlkolvv5baxqes3i@rjw7kmewynax>
 <etynwixh5fmwlixdowzlju7qctax4f2iw6ogfw5zcqzpwydmiy@3737u5m3ar6c>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <etynwixh5fmwlixdowzlju7qctax4f2iw6ogfw5zcqzpwydmiy@3737u5m3ar6c>
X-Authority-Analysis: v=2.4 cv=bKIb4f+Z c=1 sm=1 tr=0 ts=69ba69f6 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8MBofLzAf-rrxkIDIyQA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3NiBTYWx0ZWRfX+jRqCOm/Z3Mr
 EupGq6xld5eHpSEkQh4Q0uNjQ9h2CYcLGQYYD73PSkZzEmXsB3c0K+eDXmO0yZr7tlWMSBOAhnx
 E1Q9s6Io6HxM/nEVAROLD3IVwjXyjnGZH/vq2UOKzpJPbtMMjoNK4B0VcIz3tkLTLyR/O0247TU
 QvibGGxwcbR2EL1/8tSSmrr/0ue0prDUglNl4HOK0FEMSpnykU1ZA/br8mN3cO7QdzjxlEb1TRy
 rdwSNVKpJg9rVLj0Gfm4WSxVkZodsJul8dhPpmPXZLLBu0hYUbA3TdAXl+bukDTiKcdn+THb493
 2Cz3EPKNyh+dlZhpg1Ub4evyxv/ZGmyP+l20yw0g/sVTTs22p511b6ZFYsvs0S2Hi5L12wI3ueQ
 fMRqMBm9GiP/ILH1CfzHjveV5F0ZG7wg4mYzqvgiU57PfebAVCNyFwYFewh30RBwTcQEg0ezC03
 D3wbhkl9mPrEDLADZkQ==
X-Proofpoint-GUID: 2aze2tZUpxKZVo_9MnFW-juO2yq9rwKU
X-Proofpoint-ORIG-GUID: 2aze2tZUpxKZVo_9MnFW-juO2yq9rwKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180076
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98360-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 37C112B89FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-17 21:13:22, Abel Vesa wrote:
> On 26-03-17 17:10:17, Dmitry Baryshkov wrote:
> > On Tue, Mar 17, 2026 at 10:47:18AM +0200, Abel Vesa wrote:
> > > On 26-03-13 17:51:37, Dmitry Baryshkov wrote:
> > > > On Fri, Mar 13, 2026 at 03:23:52PM +0200, Abel Vesa wrote:
> > > > > The MTP is a one of the boards that comes with the Eliza SoC.
> > > > > So add dedicated board dts for it.
> > > > > 
> > > > > The initial support enables:
> > > > > - UART debug console
> > > > > - Ob-board UFS storage
> > > > > - Qualcomm RPMh regulators (PMIC) and VPH_PWR
> > > > > - board specific clocks & reserved GPIO ranges
> > > > > 
> > > > > Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/Makefile      |   1 +
> > > > >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 407 +++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 408 insertions(+)
> > > > > 
> > > > > +
> > > > > +		vreg_l12b: ldo12 {
> > > > > +			regulator-name = "vreg_l12b";
> > > > > +			/*
> > > > > +			 * Skip voltage voting for UFS VCC.
> > > > 
> > > > Please continue with 'why?'
> > > 
> > > Actually, I think I'm going to drop the comment and add the voltages range
> > > in here.
> > > 
> > > For some reason, when I added these, I considered that if other platforms
> > > are skipping the voltage voting, Eliza should do that too. But now that I
> > > took another look, I really don't think the voltage voting should be
> > > skipped at all.
> > > 
> > > Downstream does the voting as well.
> > > 
> > > So I'm going to add the following in the next version:
> > > 
> > > regulator-min-microvolt = <2400000>;
> > > regulator-max-microvolt = <3300000>;
> > > 
> > > Thanks for pointing this out.
> > 
> > FWIW I consider boards with different UFS PHYs to be different boards
> > and so there should be an overlay changing the supplies for the
> > non-standard version.
> 
> Yep, me too.
> 
> I'll send the next version tomorrow with the range mentioned above in.

Sorry for the back and forth on this.

Just had this bit explained to me by the UFS folks.

So the MTP can have different UFS devices which support different
versions. The UFS devices, depending on the UFS version supported,
need different voltages. Bootloader will pick the right voltage
and we should rely on that. That is the reason for not describing the
voltage range.

Now, with this in mind, I think the overlay for each different UFS device
is a bit of an overkill. But maybe I'm wrong.

So if you are okay with this explanation, I'll fix the comment to
explain why and respin ...

