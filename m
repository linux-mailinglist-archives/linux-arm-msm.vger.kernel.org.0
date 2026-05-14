Return-Path: <linux-arm-msm+bounces-107549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOHpBx2TBWo3YwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:17:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8F53FAE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 668003047DC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68BE3955EE;
	Thu, 14 May 2026 09:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lg+AS4og";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B8ZBoB3m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144FA3976A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750215; cv=none; b=aJRYuZX84gsKAa8UxBIAA3R8wWU5Wuf96dMvsAQbBF+QGG+Rf/Ob4A6ZyNs64JvFENQfvWpBMnhvXVHNjaK60KhexwvmeF0RWY9vjV/8xoLnykpFCs6U+z57vspdvemKClYO8IERoW+iO2gsoPLwzAzJ7pG/wGNOgX0u/xnr4DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750215; c=relaxed/simple;
	bh=A922+v4yQg3BZMTUGtFZPP1hW9d8+K3XYPsGdSwLV9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXQpWtmK64BDOh6v7hX/Iv4bxuYmmrWenf8MOwOtQ8oLt7eiErhkxlr/A+0Npu1DcVF8FuGmMbjJihE1E/T/BymgkTcS6H0xb8QtP06x7Ijln81o4g+6lLkjicBxVEPU7HtbqWikFt3t+UQ+RwQMiDhaP/x5pDkZFOjIiB+gWhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lg+AS4og; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B8ZBoB3m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E2xWc91095232
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMMIowNNNMF9IiEXOsQR1pgtS+EOO8C3IKv0+6OioA8=; b=lg+AS4oghde3QkS0
	BguIxmlZ3HtdNhHqbAb7b/3jeyxOczoQWtCbPGFUljo3ufuXvlZaS3Wn9eUICGl5
	tqiV/FGsIwF30OaG/WhqX3CIeVzQb2BbZ3g8PkBx3tpg4e1L5tWKhjaIHQCUmtSG
	1qV5DwcmXRSF7dacz4Lz5KZCd/PHkyzuWcC8neEJRIatiMxTKJmy981S64AhfVgL
	QbO1y7aoqCO3YIHC9oM9WXVbXBfXxwMsurX1/1HCURcVsNomrbQ9j0FHmF+dyj0H
	LfQ2SH61JNBcD7PrUbW/k5WvXNHWRPz7lefONOqqMla23ntEAsaFiwD1cdM3B8vm
	5MHwZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hh72p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:16:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso155178751cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 02:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778750211; x=1779355011; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KMMIowNNNMF9IiEXOsQR1pgtS+EOO8C3IKv0+6OioA8=;
        b=B8ZBoB3msMmqQRRRBKYHZrhnQHfu+yaj0KPwti4ay0hCd5/D28mtoeGB9XPoNUE3Qy
         IfHGkEhZhVBiWXdUaLMDSYkldJNXQ3prqcmhQORKMSLPBv+utLJsscisE0MsRGj9UorS
         oYnZoT4C34Jz5e1XrkhXMIbEPVmYoQEWWdYixkWRHL++EQkCUwARZ05CkzNji1RmxT9c
         iu3ouog+Q9uslzkJ7VX+A6WajYesZ0xAUZwhbaOnM9vInWdQKOOBW3ZFkfMrWvIC6/bz
         1DNqd6DMnN1MbArRAMPlOwJDSIfJEnXVPoTglgQ32CxUcNs2OrrKu3FTETT0I2yQFy7Q
         /jzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750211; x=1779355011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMMIowNNNMF9IiEXOsQR1pgtS+EOO8C3IKv0+6OioA8=;
        b=KSWCGxGLFEs3GagyLm9ACErzG2Ebj8vii7T6laUZlz2Hwb6gBPabW5yRRvDqRVLb4s
         wboR4QSHZbq6bovUgI+ymWeECx/GWH3sAhumsxo2Ts/g3djMDrYW7YHHkZ1bpciXlqth
         /i699o1mcOlMspEOTEE4lcLD+iqUPHyTyzgBHKZfAEs5/C0PY/+hXU+1ZbH20buI+3+c
         B2XIcxE/INfF8Xy6Up0EeJx2qd0XKv3VGGNI/ucsVM3admqcNNnGmGXyTsPeJJb3WsIQ
         CdSluB0yWpeggfXHlwLktKx1Vhud0hm0O8aQhwRC61rLvno0DdY/o45qJj9BI5/sQtly
         vEkg==
X-Forwarded-Encrypted: i=1; AFNElJ+vzCQrqGSFVkb5Ze5sblRMcBMlVTPMA3ot4MN2ccM2tD3+LkZyI0VkFQCWwgx/7w4T30Megb5HHLV5w1vz@vger.kernel.org
X-Gm-Message-State: AOJu0YxhJQf3ZR6M/UL3AlsVG8ZZSySJHdrcOPfd249XVSMe+Sps69Bd
	WIjoIwvFFgYYsvAG7lo4HPktbFZNnH17qrODT209g8zKiRRwV3HBitZkFrXGeZYMmS5cXFuWckU
	ZGWhZhQvZl/Ugb0liP/tadIObCXDwmCHOvjsZIOxbsQyjFs3uTmM6MCc/kHklQxB1Hy37
X-Gm-Gg: Acq92OHgDhbqXiYGJSE+BXWgluroyq1fX46slDcDVu/fBUj/EObyK5EAhe2WBFFparA
	AresUc/kYUMM0deMg+bxpYMS7++6BDXi9tdXWRVXKJXt1VOn/aSRoQgI2NZ3Wik3HHt/Rj9AIb3
	jMQTfFAYXTifsLwzLu4sSEDq28e32JRlSY1dP3WrFUSxTzF+ok9TJGbMrdmUNS3GL5UZa2cfQbr
	oN0I/maTpuApRLaVMsww4avgNxqQABLzRcxDrSbc+GkLyagtfhM+ppxUFbADu2G6n4QBnf+NuWt
	RWyJkVzFZoYLn+zGFEL79t+pSWRZD5aOBUX2ZsonZrfRI3g6ghuCDaOsdWyFZBq4DnuW5X59BUr
	DRL7xpa9VH49hDQGu0d81lEkGjM8FiqbxGeScmvuvdZCNMtzzTNPjAFuuDgCT54j+zYR52Ju7a3
	ec2cCqQl1++kdTMI7UkVQTmA5LlYTljm9g8+4=
X-Received: by 2002:ac8:59cc:0:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-5162f5c9524mr99616271cf.44.1778750211412;
        Thu, 14 May 2026 02:16:51 -0700 (PDT)
X-Received: by 2002:ac8:59cc:0:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-5162f5c9524mr99615971cf.44.1778750210849;
        Thu, 14 May 2026 02:16:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c58139dsm4605241fa.0.2026.05.14.02.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:16:49 -0700 (PDT)
Date: Thu, 14 May 2026 12:16:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
Message-ID: <ezpigr442rjnodqcg5fqsyaik3tkp4yyw3cbu6j75ra2vidnnj@7svqkcz45sdi>
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
 <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
 <e032c072-57b3-44b4-84a7-5aff062b9c00@oss.qualcomm.com>
 <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-GUID: 8_6x4HMmEyiS6dN4FntUo1Gk4imI_T1C
X-Proofpoint-ORIG-GUID: 8_6x4HMmEyiS6dN4FntUo1Gk4imI_T1C
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a059304 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=CrRiqOPGEFRxvRNxu2QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MSBTYWx0ZWRfX0AGjJxHz9ps0
 R3jT9H8o75pxIjU2u91honPuUDFDhGaA7SQgtXiyXBz5ZGu23IhaufQSIpxvsmtOA0HtKcbNGI7
 Td6QrLghH9DOl6BOrj9AxH5JFNkJwMiIoJt778rgwIJPi/0WqyT0w7tbWnhKnqOeXJCfm860/g/
 5lUOQmxu2mBNz4J3qs9hno7pshxktsuwNS5kUq+1zWjtQCFNXl5iO1a2ukYcNCeWX/WaecuVQA5
 94appi7VJ9KP+C4nFSbVLFULXWZyvF9VcM05TZVALbAVPeTh6lwFLiuL00PJRbqCyTIcuyhA1ac
 7a7lW/4cqaa2dfsEC/LEew//+ZlPT6G493MH5ejuTjXYwwAi5Y4ToWjlMQkL51dC+2gpeTiRoQN
 PVv+Wn4kQeOYstFQLe1YjJgJDs8T1eBynLWyO6DR0DQY07Pn4gZfWDN9hrrLYeZu0OmyeZZVbtw
 fGERaUBWdBImehpQGJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140091
X-Rspamd-Queue-Id: C5F8F53FAE5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107549-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 02:15:12PM +0530, Rakesh Kota wrote:
> On Tue, May 12, 2026 at 02:16:07PM +0200, Konrad Dybcio wrote:
> > On 4/29/26 4:09 PM, Rakesh Kota wrote:
> > > Add RPM Power Domains support for the Shikra platform.
> > > 
> > > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > > ---
> > >  drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> > > index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
> > > --- a/drivers/pmdomain/qcom/rpmpd.c
> > > +++ b/drivers/pmdomain/qcom/rpmpd.c
> > > @@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
> > >  	.max_state = RPM_SMD_LEVEL_TURBO,
> > >  };
> > >  
> > > +static struct rpmpd *shikra_rpmpds[] = {
> > > +	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
> > > +	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
> > > +	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
> > > +	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
> > > +	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
> > > +	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
> > > +};
> > 
> > This is identical to sm6125_rpmpds. If you're sure the list is correct
> > and complete (no LPI domains etc.), you can drop this patch, and proceed
> > with just this change:
> >
> There is one difference — the max_state for Shikra is
> RPM_SMD_LEVEL_TURBO_NO_CPR, whereas sm6125 uses RPM_SMD_LEVEL_BINNING. 

It's handled in the DT. As such, programming model and the domain list
looks the same and compatible.

> 
> regards
> Rakesh Kota
> 
> > diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > index 0bf1e13a9964..e7d9e8e65641 100644
> > --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > @@ -73,6 +73,10 @@ properties:
> >            - enum:
> >                - qcom,msm8937-rpmpd
> >            - const: qcom,msm8917-rpmpd
> > +      - items:
> > +          - enum:
> > +              - qcom,shikra-rpmpd
> > +          - const: qcom,sm6125-rpmpd
> >  
> >    '#power-domain-cells':
> >      const: 1
> > 
> > 
> > Konrad

-- 
With best wishes
Dmitry

