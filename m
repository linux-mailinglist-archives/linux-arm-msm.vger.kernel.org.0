Return-Path: <linux-arm-msm+bounces-113296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4QsICVOWMGoGUwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:18:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70268ADF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:18:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ajKrQt38;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cN4hvavd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113296-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113296-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0AC93008D30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33509233935;
	Tue, 16 Jun 2026 00:18:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E519520E702
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:18:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569094; cv=none; b=g0MYJ92P+/soJekwyjkATPulRKMhtbMGWxg2RPGHNoYC3H37Fbdk31q2fgnrCLT0EzaxVQH9KLmQTzY1/QpqFp7oIGAvm4NKU7+Gp34/0l5QGRKe4uYkIjWAteDqPnhlH+m7Vdtu2ojYC54QE/IvNL8fgpojMZXwKrUcyUcNvTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569094; c=relaxed/simple;
	bh=9vCegOvm02QK0AtqE2izy4JK/HP646VqdIZW7JindyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+DlSnmfdb0YEjK8/HsR0+oaeCkiduCfJmQgPyMAwgQ418l4ai1iWUJHWAD8vnimWx61ZW3AVVdsGmKQpOQkAIIyMCA4e0vjTgNEMl2QI0H+rzTYr57YUhNzc05hOud3u8Eo324Qu9QqglIhl4XkjCDTcUWCUSiqBEBP2xXJjU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajKrQt38; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cN4hvavd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxE2n861120
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i20IcmKQCtSpRNFUs8gx8htg
	mWtH8qlgtcQsTvxKC3o=; b=ajKrQt38ygS+n4lMp6F59aVCCgMCTv03uQ+bp3rr
	uB1127SRL7ivvincdM15beeF2Rj8Zk99pApGrI5U93riFFSBjkFkzuEIaneSZcnE
	Hh7wNUPL3Cc7z7z5ji9NfKuaOKimTwKP9IYrtkwFGrIBhltO9JzWcQjYBn2k6C8N
	13cZgqyrBXi9BMoU0qKal+v2iC08L/se0psF6wS9V7y6EFB7SiVZJz86jw7WV7jA
	VqO7X76mmzCpncUNKHjMjoyamhZzZQ/lauQM5vZm0rQ0fTBAdcQ4INkYtZymkAoV
	WnBq+W/2BsLjM2YE4HR76i5mTqv4yjlpy4TgnhY+/ipmBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbpkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:18:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157f453a27so571635385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569091; x=1782173891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i20IcmKQCtSpRNFUs8gx8htgmWtH8qlgtcQsTvxKC3o=;
        b=cN4hvavd6KaecNNctaDFYPxffiBAGHB0piX5M+h6Xq4jE+X8EO1s4W7oG/d8PzWLon
         pmtrLT3UNSnyjpNp+UemVtQNyVLUf7TFf6Gp/fgFBgujyxofRWvHVmMWzy/kN3UUmkHh
         ODALbJig08Nh5tQmzYAmgyH0GMGjlsmfEkEMRMkSslWw5/tvs9vtSZbFev5ss3dceBlh
         Ckd9f+CLn6w4RgbXPl8kLz86PXkNbolMOL1+2DsAKgQjlI7fDnLWU5ju7mUetn90B2pT
         mTjEm5GWKDBbQ9FEz8x58LusAPq46HVRTmfHkItWK0itEMvXlL99Z2BoOhR8sBc1eJ4i
         vM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569091; x=1782173891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i20IcmKQCtSpRNFUs8gx8htgmWtH8qlgtcQsTvxKC3o=;
        b=ar2no5ktW1LjiFF/RhUATDAvNPgQy6ihMBHLGdWzNXOfoCKaAoMr/sfcz04h/dq/0C
         AU9CBzW+9WOO7YrUG8Ma7nTMtZmqFLfQuXwl6QKDfRMU4AHX5PgP5W5/AUTA3qqepjPh
         hmHgMNaFufgpdR4SXKuiAobMRq904EqsrG2xAH+M5NZOUM8MdPAj+mLwVLMphPMqjtox
         cQsnuqyYpm+T59xo53gwO0mIcD62mF16OBWoUQukaqpDhC4yKSFcsWHrbOffpLAGV9DR
         S75tnS3mG2si64KDuRlue2hRsZQEvm23KPuXIJyKSRPiGZHGP8VyO/Brer8lTS8b6QN5
         THlg==
X-Forwarded-Encrypted: i=1; AFNElJ+B0oe+Gw10BQ+F0MA82u02YVoGExLFzjfCpJzqBWY32+g6CoHpkf2fKYbTs3cdp9GO+wWVB+pAgku6WsgC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz25LCtaeqsyS99J26YxDI1cMcg4LHkDIt8f1UQz3xBlwTDt8Cs
	RbVBiITTvoKOQNgaq9uf80QQBP4u2w5ysGKyFGZUviBwr04IVFBhtteG/WNarsDHkdrSAYtdmch
	VCNOVve5DaSHV49JP1evFBbG5hOmtXQUsRjuJLH/ZQmJ/h5jpimAIMfcbn2+T+avRZhej
X-Gm-Gg: Acq92OHjLS0ktxHNrQZ0BO5Capm4ZKnH2yACRsZKB8AbaOPGHEG6JXmYSDaq2tPUTVd
	gWZvwRd6ru0X1EX0Mtm9UavBGANicl8yuarP2zz9KyQ0N6VapjdtnN5ztfkqaDamScaWiSB5UYZ
	+SuWALklCKIsxVfgeiXTp9iWalo1Kfo+w9UDwaw57AfgXgVHwCyNACchm9GvbMpHcKks0D2HxK6
	T2Zut5KJJD5ccgyIV3nF8x8Ba0oMY4vnEifVeycLkdtgsLVBGYGTN1dIGeZWrEHwkbz0TwOwkmn
	p/Q1lVALw079c2oLXeS/anTOExnSm6qaCyE+zWZ4rPyuu0g8Awm4jZFOJo29RDhQx19VDvDVNs1
	pV89QACU7ytB33idgYF5f2IJ9znwnqYVitdnjbQc4j7iWls/qSeTQwxy4+u86gAJu3N0HZLBDT3
	3qHRng/11Lf3ZoQv12jo096AijfLaguk+URu8=
X-Received: by 2002:a05:620a:1786:b0:915:9229:4223 with SMTP id af79cd13be357-9161bfc078bmr2522039385a.58.1781569091136;
        Mon, 15 Jun 2026 17:18:11 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:915:9229:4223 with SMTP id af79cd13be357-9161bfc078bmr2522035585a.58.1781569090689;
        Mon, 15 Jun 2026 17:18:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c059bb8sm2529131fa.10.2026.06.15.17.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:18:09 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:18:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <4wu33lbglqmqywhwntxx467uigkpxzctwkdtues4mcpbzjrqyb@jokhryzdph73>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
 <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
 <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
 <a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com>
X-Proofpoint-GUID: 0MDw7nmyWUoi6JIsXgBxVDBNGJ5w8Nr8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX0QvPiOnOiSuD
 NBixRStyMc0WHEIWP0aeczRXyg21zF+t0TVSVqZjzkEHSvyaY96sLLd6rl7Yy2FR/saAeWBh282
 2uG/rp4OHagYye3nO5ynJPNpM8Vluf8=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a309644 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=V2S91bIb8oTTECmzoZMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0MDw7nmyWUoi6JIsXgBxVDBNGJ5w8Nr8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfXwIzmopOAeFTg
 kMee3LjxHCQzNCF8SgQCEJtiojVxsOfXszYtmvVPj3JHyfhoAwzBN9+RpVJVXfTh3TWnCENsq+I
 HtmYG83ytiVg4sBCBKQqygSEfCS9ImrgzOMHmx+ggDoEXtSSUsyXvvnn8teTyLvaIGvW+CFKjJK
 6x5QgdRfF9UV2cuHyGh2oYxoGgY+UKXhPuZo6u2n1KffSbPTHjmTQvivAWzWVYtUER8CuXXZm9d
 nzblp1Xzk/EjyA6jmPrPb1qsWn8m71iZuvJBGGEo7yu+HZiXCEJJX9EotZrFjPpISFRthezzDo7
 YfQUS/6Gs5Y3MSuVo5P/oblp5k4sFYZE3vCyRDlRBA773JG5n9pnimgkUftMWRjaUf6hyVh7Mm4
 fQx9iIzQBDEl8Jo7IO2hmzLrFRUTJLy/lDZfDjjRjFdCt+lgjnv2URz8esYq4bzQLzY0nZa0g8y
 6KLeVCf8BCkuV6eI37w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113296-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,jokhryzdph73:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C70268ADF5

On Mon, Jun 08, 2026 at 07:32:45PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:19 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 08, 2026 at 07:14:43PM +0530, Bibek Kumar Patro wrote:
> > > 
> > > 
> > > On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
> > > > On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
> > > > > Some SoC implementations require a bandwidth vote on an interconnect
> > > > > path before the SMMU register space is accessible. Add the optional
> > > > > 'interconnects' property to the binding to allow platform DT nodes
> > > > > to describe this path.
> > > > > 
> > > > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > > > ---
> > > > >    .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
> > > > >    1 file changed, 27 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > > index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
> > > > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > > > @@ -243,6 +243,13 @@ properties:
> > > > >        minItems: 1
> > > > >        maxItems: 3
> > > > > +  interconnects:
> > > > > +    maxItems: 1
> > > > > +    description:
> > > > > +      Interconnect path to the SMMU register space. Required on SoCs
> > > > > +      where the SMMU registers are only accessible after a bandwidth
> > > > > +      vote has been placed on the interconnect fabric.
> > > > > +
> > > > >      nvidia,memory-controller:
> > > > >        description: |
> > > > >          A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> > > > > @@ -602,6 +609,26 @@ allOf:
> > > > >            clock-names: false
> > > > >            clocks: false
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          items:
> > > > > +            - enum:
> > > > > +                - qcom,qcs615-smmu-500
> > > > > +                - qcom,qcs8300-smmu-500
> > > > > +                - qcom,sa8775p-smmu-500
> > > > > +                - qcom,sc7280-smmu-500
> > > > 
> > > > This is a list of targets that happen to be supported by QLI.. but should
> > > > this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
> > > > 
> > > > Perhaps
> > > > 
> > > > if: properties: compatible: contains: qcom,adreno-smmu
> > > > 
> > > > ?
> > > > 
> > > 
> > > As of now platforms where the issues [1] getting reported are added, the
> > > list will grow.
> > > <We still have to evaluate and test on other non-QLI platforms hosted in
> > > upstream [2]>
> > 
> > Do you really need to test, which platforms have an interconnect, or can
> > you predict it by checking the SoC documentation? I strongly belive, the
> > latter is the case.
> > 
> 
> Agree, for interconnect path we can surely predict from the SoC
> documentation,
> But for the corresponding FLAGS/values (MASTER_GPU_TCU, SLAVE_EBI1), it
> would need some testing before finalizing the change on corresponding
> platforms.

I'd assume that corresponding values should already be known. The
platforms are not new.


-- 
With best wishes
Dmitry

