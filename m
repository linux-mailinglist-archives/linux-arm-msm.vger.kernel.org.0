Return-Path: <linux-arm-msm+bounces-91418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOmIJ2dGgGkE5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:38:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F0CC8DBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BED73018BE1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 06:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05D42FFDEA;
	Mon,  2 Feb 2026 06:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Asq4OzCI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivJOX+eX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6CA2FDC57
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 06:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014273; cv=none; b=Nw6C/a/Rw78+8Z/fiIZ9hac7Pl+5JZ12PyNXBlLySzcHUO06qoYc4H3XEiIKd21+q0FsyEn3boPKxSViKFZwR0JUlhgzWqcCUf+PGlTgaQ47KKae3Zu1j/2xzUS2TXY+gqwLGNqgTnii7JasmXn4FhBiUFEbtPuMHASfcEys5/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014273; c=relaxed/simple;
	bh=cWD5eSAILeUuTTWaDvGUuJbhuiVAHyoHWHRux09XQKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhbGEtDrmjDZlHtFdRqmRPlVgHR2wM9fT7dWB8ZH48ADCQQzroM/+YDNYYL9JEIIZJ55wJ1nehSgdSoA4CkdpABEBAmQg7/xeB5j2c94Rb5v8/+5wl8h3k0Bq7Ep3f87Lg5avCNwMREcDaU3HqH88D+wOaF4bj1PhJ5LZgAI61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Asq4OzCI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivJOX+eX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611MmWpw2343019
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 06:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5d7BAWG81laRew+3TfSqguMr
	5kAYoIpiGVT2NJVANI8=; b=Asq4OzCI4NN7DjmSl43Iwk7pd/GbEFVtflPxiZYK
	M+qNW6eKhIegiQ49DwwMgs3cM4ZFWEHPlLbce+VrSaguS/pxfnmLHWIJswkEz2RP
	6efNE9cI+/WCOqj/F7R6bCNu51MG1mZMbplBTYUV4Es2TJhnKFnGyH1bBgX/xMv+
	yf/VLjkZrj/b3+Lvp8L1OFN0+/XWjnWNNk3nlr5gq/+l40e5Bh8xaySG27JagtiA
	lWjNiiztdp2uMdLNQ+HqtUI35nhq/mLTkEzv0YTU3iLIm9q9cZKblR0CbVE8vuNP
	jrTG2iQmNao0MOoiLNX8BI6KJP/Oiw7JpDocp5gf6nDbEw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard4812-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:37:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f42368322so3550657b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 22:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770014269; x=1770619069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5d7BAWG81laRew+3TfSqguMr5kAYoIpiGVT2NJVANI8=;
        b=ivJOX+eXZ5Nuhfd7c9N0jMZI91S6rzE1UU65fTqExq+aH7jUOdEj54rkheeBZOY2zF
         ia/xfcdIgVDN0+L8e8p1iOGd7vUH9tchkOM8Q79fLnjehP2tlOke5nEeOcSugQVz8PFM
         svk23syrsjopw8rjWMI9RGYTPoob+17WVuwKmHtpBIsg61HZ3H7GimpnRg6BLGXU4SZH
         St+aLOMzilI3WKcFKJP9ypPbUkjqWMsIXQ9GXD+X72YdFP5XdbravmhgRhOnhaJisZun
         DKAU3CFFcAg811UqMC8YdGzBencN+l5l03sPb0TOY5dBR8YXq+OSXtROO0ftNXqUZiS2
         6Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770014269; x=1770619069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5d7BAWG81laRew+3TfSqguMr5kAYoIpiGVT2NJVANI8=;
        b=nB1mCS69tjXr7rAlKYD4Sf9bqKW5ZfP2T1nr4Q9KKjNszzkK0EFsnupt1f6tsHOBMo
         aoccbhj++OvLPryYis5PekejuHPSwNPX4GsVEMc3rPlWepJG5pnMm21Rg/OwrBv8zYpp
         E5MAkgIq90A8sucpMSsbgt7e+fn6cNIpPVhO+CVorA37P3WEbHFNxTBcR1OgjK8vrasB
         vTwVwm1mQAEYoZEr3xAlI29AEH0uhvX5L+p3Q3RPYVBJ/Q+Sih4m8Ei3uaSQQcWyVji0
         6W2WK2jLA+78mtiy4PMOBXe39vnGV2GEz2CLX18ceal7YBdWf5ww5xNDCoBZzc9O7k4i
         0WlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLeiNhHKaD4Zeqvf1wT5wUmAVnYqwUuTelFkqvvW9ijYfEH2cwhUPQHlUcHbIm+XP3mvqq0tPvjZmHy4U7@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQmgxMxtOjQkTuAc6xosEP46vgF7JiHmDT2Vk9BO3HQqlbikY
	05zdy69ACGf3+kd6vVnPqTg1JDaepFlCQswPKL0SzXNz72IK/3u4n2hiH6fMvmN/uCsWAmcySlw
	MJJDjD/p2+FkqWij3P55owgBsxNgGQXZRexXNdhzOdnEcdnmpG/0VpZmn8+6U/dYpga5F
X-Gm-Gg: AZuq6aJaDJ/577g4P1dzXTw9oozoUQMFUI1Ek5A1QnyP+TFFA8accIe8t66ALjDrSoE
	6uTHE8bDUViHwCtzBWqJxp03JcakZm5UXzGLHsTT74VBe4XGKl3FTg1bGdtvbuKOWbbQmpYDZgm
	W9zpVOYQiLbHUjkGG5K72KmSysqwPFcoBJHakJS4kqXI3TBQnqCpRE869J/MaZhIX7QTqUgkLNf
	8WIOZJX7cZxKUU0eUG5uBnjGiidcS7/nsvoZTVBcDBnk/r1Ah9s8NR0fXY1LdH3sR+oKT3Su5eM
	HCHHQ+ut0tUjucb9F1Ht8GMYccdeZxvEtTYDAAtOxStvDGiDiHPrq/wLx3Y0kXgOhxQFGpHe10o
	gYLAgCyogUpKOTRx22lzxnbZrjHAR0UBNx3uAdBi3HSEW9IY=
X-Received: by 2002:a05:6a00:3903:b0:823:edd:20c1 with SMTP id d2e1a72fcca58-823aa9407a8mr10103798b3a.67.1770014269005;
        Sun, 01 Feb 2026 22:37:49 -0800 (PST)
X-Received: by 2002:a05:6a00:3903:b0:823:edd:20c1 with SMTP id d2e1a72fcca58-823aa9407a8mr10103772b3a.67.1770014268474;
        Sun, 01 Feb 2026 22:37:48 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b4e96dsm14489764b3a.23.2026.02.01.22.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 22:37:48 -0800 (PST)
Date: Mon, 2 Feb 2026 12:07:41 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: crypto: ice: add operating-points-v2
 property for QCOM ICE
Message-ID: <aYBGNeZUFoEYs/Ih@hu-arakshit-hyd.qualcomm.com>
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
 <20260128-enable-ufs-ice-clock-scaling-v4-1-260141e8fce6@oss.qualcomm.com>
 <20260128-amigurumi-viper-of-gallantry-69ab8a@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-amigurumi-viper-of-gallantry-69ab8a@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NSBTYWx0ZWRfX4lhG89L4eSla
 sJ+1rlaGJch3PgeQowYHe4Cjknr5giulTacypMxghyTiHWuxZZXSvbrvI2IXlkhvYWx5PiBWeaP
 RxOP2tt8GStQf1d8mQyJ1dC5g/JOJoyH4wDo3BZPelcnBOkumNXQ2tiJI7i9pK88Zqxs3RqX9FJ
 lvMiNeJbimO329z/ALcC4PZ9/YIuBlwEBF1QdoXB1VJjUAt1mJJndDcGZ1w+npo9PBhgs9MHkTX
 2YerYqcVrHjyK9IpiIzh+pyxR+tzVVaw7/vjOMDmbPD+lthvwqYQhayuFQgaIKGiSl8slnPLtoM
 t/6YQ/QhaaLEiZlkl62hN/SUYc/Ttv5RFXLGALHsorOWhrRKb1Wy/A9fzsKzAM6HUKRbuFrv1Ze
 eUpMawmNEIcUxmPSdd6HHd+ij9C3d+IMj/rD1YTXQc13rG/sawg9fVECsSMdHJpGVHlkZCMqAtl
 gRFDxUvr6nL3DNSC64w==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=6980463e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=040W-1HjkB6UkxdISe8A:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 8iaA42gdbWvASTIEWeowmx0HCHKIQEnG
X-Proofpoint-GUID: 8iaA42gdbWvASTIEWeowmx0HCHKIQEnG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020055
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
	TAGGED_FROM(0.00)[bounces-91418-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,hu-arakshit-hyd.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 45F0CC8DBE
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:00:57PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Jan 28, 2026 at 02:16:40PM +0530, Abhinaba Rakshit wrote:
> > Add support for specifying OPPs for the Qualcomm Inline Crypto Engine
> > by allowing the use of the standard "operating-points-v2" property in
> > the ICE device node. OPP-tabel is kept as an optional property.
> 
> Last two lines are redundant. Instead explain the hardware - why it did
> not support clock scaling before?

Sure, will remove out redundant lines and update the commit message as requested.

> 
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  .../bindings/crypto/qcom,inline-crypto-engine.yaml | 29 ++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > index c3408dcf5d2057270a732fe0e6744f4aa6496e06..1e849def1e0078feb45874a436411188d26cf37f 100644
> > --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > @@ -30,6 +30,14 @@ properties:
> >    clocks:
> >      maxItems: 1
> >  
> > +  operating-points-v2:
> > +    description:
> > +      Each OPP entry contains the frequency configuration for the ICE device
> > +      clock(s).
> 
> Drop description, please look how other bindings define this.

Sure, will check and update this.

