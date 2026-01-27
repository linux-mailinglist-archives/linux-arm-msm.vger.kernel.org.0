Return-Path: <linux-arm-msm+bounces-90792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MdEC+DNeGmNtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:38:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F27295D59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C77A530087A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBFC350D74;
	Tue, 27 Jan 2026 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvV6MVxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTgR9RT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D42356A23
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524334; cv=none; b=uyJRBGGiChxRRo/hwyGk+bZtQKU5P6WcF74WsjTPlN5c+NTsNbRdgCL5EafXrZx/PcCTJ7e6LuhgUbIgTYOv2b0esgb0z4CoyAtAvrc7c2giNn+v4VBsbn27AFZqALi6xQl5fZAU+fo+8Fh9IuoNXqXSDKOHiG6rZ4g5O8QwCYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524334; c=relaxed/simple;
	bh=7VXB1W83ikac6HwtZPI8A7T7A1xzAjgKY7T53e0jxAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Beua51jmwWmhRDcfljIxjJQNViKC4TQWYMtMMkSsSgptBqi9qTdangsZ4h7VpZKLv+1YvCO+aJ0RL1L7QcgvO0TQc5AP7sLfO25QF+PDbTe+bASQwwfubL0HA8B7mren7n9Emva8jyvWxZJDtQVQcW+U147wb7SHrioYWvyk2E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvV6MVxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTgR9RT3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAF3cO171521
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/JZfqn4pG1aepAs8U6hjEKbh
	NO9LoeCJ/TwZWLdXsS4=; b=VvV6MVxnKqWgkVcxcrN5sXdR5t1kQ9UQCjChNu/y
	VBJIo3GtInplcwgriuEkXIR7YpkYt5qQSflvYRp5ThsY/fEo2eQF6DVEn8KvPR8Z
	ANuxtmAXQaVpmzMqCVIOU5YPmI1TsQ77FEJBNfDReQJGcFGcxaVh3tprqH3bZogN
	yFHhRRYklY/hWtSdFNzv0uCitkHh+cLCESFqpu4g1hsFOT3hlj/X3zK9ZtT+7n29
	C6+Q47VN4aug5YKETtElqopTK4fObc+e4dXAfJkdijeNullYnJ4BvrQpqq9UDbfe
	IRXSM7x4fsdrLR3dNX6bqV4iqBj7URNqz1hWxjopawlhPA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a34qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:32:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94834f7a238so6661627241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769524331; x=1770129131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/JZfqn4pG1aepAs8U6hjEKbhNO9LoeCJ/TwZWLdXsS4=;
        b=NTgR9RT37U1+vGNJm4EdLaoG7E5OzxcrnxX/4fDQcsISCqBpoQ7zUypVLMRlqHleVI
         CBkhkv6iTjhTpnMuOCUTt3Vli9+6LVKRcqTMi7Ki7Ed46hynJ8OW6P4+aJqjAWTwUMlt
         QAClNCTn6o2THT7J9f8ch9wgawlD4POJ160cI6R2bx49tC2ne1CsDPG8/JpaROk0GPGY
         t7QVUscRDqISiJyMzMzHA7gQl7Lxok188mxz8zx6gH8z6rtErPgaFY+IdXyLISgvHCkM
         3NTi3WC5IS5gXMR15SEKMcRM3Nqan+iNhMQeAJdW8a4c/NY/HNDfcSgsGBlvDBMoc562
         AcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524331; x=1770129131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JZfqn4pG1aepAs8U6hjEKbhNO9LoeCJ/TwZWLdXsS4=;
        b=KQMb1PaRYFFXlK/YlyKBCTijHHH3hvENCsKy0F84OOOMSKA1l7xQ24D6RSjbBvHPpq
         qcXDEMzQr2qXJU65Mjf3+t0BYlUmP2ux5xaGvXpqCYkc70v4wOXulbEdxmGfcDNcnGp3
         IEZgUVl0oJFGt6KBFawfNgLAVqb3ZHjjUGlcwlOIjAFk5XNyJCwAhheSZuMZq4Uva0+j
         cnstzW58Pe/5A2WLoXxI6271Tsksupo8X0hYx0HxibWatiT3QffPsdiRQnWFde3oOUkY
         UOCFXPIcR5/vOvcjeywb4bpPVTJliAq7xXhPEPwCpj4r9oMGQPtA/nwwoYMVjQRDhf8o
         RWAw==
X-Forwarded-Encrypted: i=1; AJvYcCUAQMeolIk5qQ+Y0KZTukHICiERpfjyo3YKDUv4vVwL2Vv8Z2C9i5uCFU28Nj2SKrMi0z6dvYS7NEQk5qUM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8z+GuZfPxAmIr9ML0Qe/1zRugFbFMOsM5fP3rBoYBvreSihtR
	nitSEBelq4U3xfN0okcgMuClhqPFllI4hBWztJUTfov6iUEZIs8Tx82QbN8v8QtU+RUwbivcBWV
	RT9+JVwpTwICfkz6kAb+d9MBum5N8ZC2nbZb6+eLXJ3yBAFg1LB83/llkkA9tsmyeRPU4
X-Gm-Gg: AZuq6aJCc/fFkVzHWTTFHoUtQP/qKc7TQsJWwNa3OCMB5Zob3njBnTeLCmcxiSCOOk5
	q2mCpUOrWhkgCh4GMG4aaDDeDRBuI/C5PZj/jaiMx5hR+k7BAoXJCparL0Tu5pN3STcFDQ/o17o
	AnNMXAPyDhwsIpfARyy2e/TmGzzxk1gW4nkaCkBOCdTFNg59AszDrFNjdhnSaXrwPGDKYfGrMhS
	CKuYpcGPR6XBrE5GckzQnYZvYhaCYt6cWcnckPcBMJMejDLf83qXUXMc+75rEuxIrrGrvg2q8E2
	7BhGPZioMD3KmUcHVMVIuWcEvslT3GY7gGmpyuZoY/CSE693sZaFY3mtt3B71UhEm1IW+h/pWs1
	f1DGdoka37fm0F2GZ8dSiQuhT
X-Received: by 2002:a05:6102:94f:b0:5db:cba0:941 with SMTP id ada2fe7eead31-5f72380ed5bmr763973137.38.1769524330881;
        Tue, 27 Jan 2026 06:32:10 -0800 (PST)
X-Received: by 2002:a05:6102:94f:b0:5db:cba0:941 with SMTP id ada2fe7eead31-5f72380ed5bmr763912137.38.1769524330210;
        Tue, 27 Jan 2026 06:32:10 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37433sm62354795e9.10.2026.01.27.06.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:32:09 -0800 (PST)
Date: Tue, 27 Jan 2026 16:32:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add Eliza interconnect provider
 driver
Message-ID: <jvvj6eehw3gxthrldtafc26xua4ai7nheojfdflbgabjwxbdxl@ymrgczsq4zhy>
References: <20260123-eliza-interconnect-v1-0-010ff0d100c9@oss.qualcomm.com>
 <20260123-eliza-interconnect-v1-2-010ff0d100c9@oss.qualcomm.com>
 <8015c8d1-6eee-44e0-9a50-df23126bf7f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8015c8d1-6eee-44e0-9a50-df23126bf7f1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDExOCBTYWx0ZWRfXzEgjPnvC0Cz2
 9jF/B6P2z8G4HBbkPJdq88fLSkC2TmdIxk+53gidosGURMdlYEvD1LPJFcTp/H5yjhmIW/TJzlg
 /WMv0VS2lquLrfiDRunN7IPFk9bpApvQy/tQ4OSvsUihr24iLQIQmtsmND8Oo2nds6N8u6vOt0F
 VbSzVlmwGsKpDxDtIOq+84n74aIrKDXijbZdDqDkknvlBZ1KqLNvMhCAWwJxTtbrv38CdJun50F
 lKXK+hB1htqfiw26jrci39QIlOen+/stC/i4ZTCgnWrpBpL/SJVN69LlS9WySZ2twXP2HmwdqDD
 OvbG3o19dAIZ6FC2ZV6GNUUPTCGBbdyhbqirVLPLqXBDifH0hg+vA/vY0KMkl+6YQqEI+RUYwzA
 KdViQA0ZNITacLqH3pF3O+wHu3/20V/BuDgZno8FPonc6NE7JDhHZZ0rWHi6R64tFL+Ldlq1CGD
 Z9+CAcQJcbfEKFxQjdw==
X-Proofpoint-ORIG-GUID: giglFvffzCU5AkTHuvWOvW-37-5fm46l
X-Proofpoint-GUID: giglFvffzCU5AkTHuvWOvW-37-5fm46l
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978cc6c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=npw072eAQMWWEgrtj34A:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90792-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F27295D59
X-Rspamd-Action: no action

On 26-01-26 11:26:07, Konrad Dybcio wrote:
> On 1/23/26 1:43 PM, Abel Vesa wrote:
> > From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> > 
> > Add driver for the Qualcomm interconnect buses found in Eliza
> > based platforms. The topology consists of several NoCs that are
> > controlled by a remote processor that collects the aggregated
> > bandwidth for each master-slave pairs.
> > 
> > Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  drivers/interconnect/qcom/Kconfig  |    9 +
> >  drivers/interconnect/qcom/Makefile |    2 +
> >  drivers/interconnect/qcom/eliza.c  | 1586 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 1597 insertions(+)
> > 
> > diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
> > index bb1cb8a640c1..53398e972458 100644
> > --- a/drivers/interconnect/qcom/Kconfig
> > +++ b/drivers/interconnect/qcom/Kconfig
> > @@ -8,6 +8,15 @@ config INTERCONNECT_QCOM
> >  config INTERCONNECT_QCOM_BCM_VOTER
> >  	tristate
> >  
> > +config INTERCONNECT_QCOM_ELIZA
> > +       tristate "Qualcomm ELIZA interconnect driver"
> 
> Please don't scream

But this would make it "the one-off" though...
All other ones are all caps. :-)

> 
> > +       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
> > +       select INTERCONNECT_QCOM_RPMH
> > +       select INTERCONNECT_QCOM_BCM_VOTER
> > +       help
> > +         This is a driver for the Qualcomm Network-on-Chip on eliza-based
> 
> Whispering afterwards is odd too

Will fix.

> 
> [...]
> 
> > +++ b/drivers/interconnect/qcom/eliza.c
> > @@ -0,0 +1,1586 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + */
> 
> Stray empty comment line above

Will drop.

> 
> [...]
> 
> > +MODULE_DESCRIPTION(" Qualcomm ELIZA NoC driver");
> 
> Please don't scream

Yep, this one needs to be "Eliza". Will fix.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

