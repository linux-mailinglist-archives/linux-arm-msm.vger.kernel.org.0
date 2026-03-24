Return-Path: <linux-arm-msm+bounces-99758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPOiDagWw2lCoAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:56:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D4B31D88F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98059302C5CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DBB3C6609;
	Tue, 24 Mar 2026 22:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g62vyGwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFZnHrEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7893AB27F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774392678; cv=none; b=qfpiof+gGR3XpDO5UcRLrE2uMqalhEi2/5ZBx1v1QdzrVWnTqGfE8HDzFw/DIqUO/UBsW4J8YLkI5PPngt4f9atpz1/jFkmZNO7B9dTfBywbyUDcDOpC8Pr0HYN8o9wM1ncXqGkpgRZqAnKW1nsMpRNjuo/rs/6KBc21GlMkGgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774392678; c=relaxed/simple;
	bh=jfo8OB3h3iXt3h+nZR0znNzllKjX6tOd0BY0feLB0vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeZjCoOehTx/z7nwuDIdSg2U5DFihasVndONd9ovkBf+uDjT2XNArZ0X9/HQwVbZ9oCWSyMfPYd27EnsiDQYtOOn50ieklhnNzrKjcXj5TncNr8e+OcS2FMbYU1jqsIcZXYMa4zoyWk2IkZze4OwbQ5ofMQhshUyQJbiTdbmi4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g62vyGwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFZnHrEY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMgAn71354077
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0u8uB6GNrhdJsmH1ConLZooY
	IPLJEAZiTZjJQILyV7g=; b=g62vyGwf4+VBUvoexOz56S/vSMc/YFMB3YxqzwXx
	a8JfOUSR6YZCiIx6p9lg7MMvPXdHXU8eEQ9J26239/cwvnGfizUv5Y6Q1/rtsRvI
	dSkDV8DRbUjaScAvEFpSHMukjWNkk8EzgjuhAPvHl+CiEYx4MBNcpdvbQrSU/lCY
	FbnCgPnlQz5NkC605RPzhABqfIi0QXjiw8pp16t83zPlRUMBnP5iAKVL2rIwueHO
	Hotn8rIRZRo9kWxiA0/U9D/8Mgs1fI8g4mJBm9z40h3Q2eRgncZzUji033O7jbHP
	a1SJ2S4x7+zc8un6PW+d8Efo14wqnUzkeY0aqKPE8TkNIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm9x8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:51:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090bc4823cso71351cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774392676; x=1774997476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0u8uB6GNrhdJsmH1ConLZooYIPLJEAZiTZjJQILyV7g=;
        b=jFZnHrEYOqxLwIR73hU229UmcfgqcV7CmY+uMovusSQdEcP0f+xZ0fvuXyJ8oia996
         x0qh0hhznN/T5BndVduBZybCjC+l+OfQGpoX5YCh6P5G//VyPY0lofCUJI+5U+7u2qY6
         2o9zV1YjzE+EEgisIMdjbow1cNL5pe7dHJs/6q2SJHf4W5uQSN+TPlWSrGTX6687AhtT
         Jg0Cox5EJxka56/tKh6QFmoroD/0AFuCLRHTbIwtKc1++wTqtEBXawHAUSSG5vSx9tuW
         F1p2A4h5tCz4i5Eod6CAVLT83Sps6fIDBegsGOEwIzsEj1rnIgzwLQPyXaIHhxMDOiLw
         idaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774392676; x=1774997476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0u8uB6GNrhdJsmH1ConLZooYIPLJEAZiTZjJQILyV7g=;
        b=r5tOwvINfEPBknjucZtiqSzqEYtID9g8HjnzESmX/bBuKL05Jo5JOXGwHuYUnVdBSB
         RKERcgzxgf9SL0ZkmXF9UVyRePh0llCA/7dfoLiVuDQGUqFAK9P+2abKyh/NRwBuuy2j
         5WOxXXTp+u4ygqfVCB3z8lrNDa73JDpDGVpMoEzFS6YqNK6jVyzvJKkkBZhdosA0YQAG
         Nvfqks4gxGGroGu5S5uCqQaeUvT6IYByZEHD0/LJpv0W9iF3NfGRL4KgbetQ3UHKCJ55
         f3bSzp/Wv1mUUPmv85YXzKJ7Xqdju4cpRrnIaieNFAUL3fPr8q+F26oBB6V1A5FJmXWz
         J5DA==
X-Forwarded-Encrypted: i=1; AJvYcCVOnVR10yFF4pAmjoxc9CLycmuu7fd75q7H4/VmQ89gB8JahbNzdhpvqnYl3LoG7BUZgNPEAMfAo1BcaI1b@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/Gd7juhppku4e/BjK0QmMB3srHRV8l4NHCT9x9/Y9PtjFVBl
	/Fk5xsbk1A+fkk65zzNIY42VHDmBqu8ohjwVGjKS9L6fUYTrL94z0IzUWotojQUtqqQRo0HqYU2
	8KtIikHarxUFvOB6MR5/XDuwsJ2pMXvPJtny5xmiCrLT0ZlTFYqY9M6J9MRtaADdvvaok
X-Gm-Gg: ATEYQzzINIzuwFlSa9p8jO5ZMWGaK/J+84J/jpyhooz1LkK012jfgUqMYJJg3CcEsea
	f/kgzGv62JBE2X4anXDcubZDhaWG5MDN25Vg5Hq6UYI3IAXd9y0lmPSrY6N9+/rjqHNwQ8y7Zaq
	kcD26labbCe7PNEfA8YJMtXKCjjOl0pJS/JB/644nmgxQxBtA1pO7uztvoIbTknlDezTt/JdVMR
	zOKcQD+qok+BQ/a1V04HX5HqxfBW1tviqQkSQETRWnT7H6l132vvYdGd9bWj9/gCFtS9Wz22T9d
	+xliD2NcluZxh6HxPoF5BcnYZ3kmKRE+JwUb12n/xtdU/77edZcrhK8spuojyUw10ZOwHuZQKHH
	bRjnEeLFKAdK/hMS7ritlFU0b/d7ghfr9nl6mPY9DAw/UyzlLdSYh6wcAjeKYFrrvK4NK5NoXV5
	U5F+Yq41lmzVPAm6M9SufOwiOzHxmwWL9cPD8=
X-Received: by 2002:a05:622a:305:b0:50b:6cc1:38c6 with SMTP id d75a77b69052e-50b80e45d7amr21331821cf.55.1774392675762;
        Tue, 24 Mar 2026 15:51:15 -0700 (PDT)
X-Received: by 2002:a05:622a:305:b0:50b:6cc1:38c6 with SMTP id d75a77b69052e-50b80e45d7amr21331501cf.55.1774392675338;
        Tue, 24 Mar 2026 15:51:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a298511b9csm704111e87.58.2026.03.24.15.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:51:13 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:51:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] interconnect: qcom: icc-rpm: allow overwriting
 get_bw callback
Message-ID: <2453s5yfmk2xrgyuabyhahge2cl2uykdlpcxlmwe35uf44sjpg@pbc3a6fxtlya>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-4-7892b8d5f2ea@oss.qualcomm.com>
 <abb14718-3d94-426a-a0f0-d101470951ad@oss.qualcomm.com>
 <75zgkrwvjsmnvjeyosl326vcudklj6yhhyskdrsm23kbzhgve3@64nezs6c54kz>
 <1376fad4-efc3-4b7d-bff8-9510ab0d3800@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376fad4-efc3-4b7d-bff8-9510ab0d3800@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c31564 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=PuShR9hzWyKW_qgfHhoA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: L2z9XUomcIW962ID3xztRP1ZclPGSBAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3NiBTYWx0ZWRfX6otRpyMzth4H
 pB9TLRobdDEO9FnOXJ8V0F07ZOmQ2ekAp/Nsx5NPYo5JPArMDBNH+GG4E6odRQHpWI1xzxyAfVl
 V1Upj9rhSOmIN8t8mS5tZ/F12uiYzX+LUOOMCthXZmnAxiqTJdxcZWxRUYiEFgzFbN6zPauK7NT
 R4TLHjapLjhWl+lnLbzmYdnZ1yo1503FD0VFix8cGEdiOyzNjM4Ec+UB8+TQ3kNh5lipCWVi5DK
 NVNwuycvUKJfvkSSzEL2Kz+VvaWfJ/Bsn67QDDXjJBec5dHVSwxVGiFDlyC3OVq6fJLZzCWU21t
 EbAYSXBV+5hYX3zViqk5upXxXD64nHSG+x+fKivnD/NPf3ltoABl0/gj4VYX2rQfeZcxlMtGmWU
 yyUWxi77YLVz3JOnv1NlrKBvDhzAgIS7TZaIzC60Y8X5MBl6Bq7eADkBfUbCsvaH0knrfuXVusb
 JAE/IVquwktMOFIkdnQ==
X-Proofpoint-GUID: L2z9XUomcIW962ID3xztRP1ZclPGSBAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240176
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99758-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0D4B31D88F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 12:34:35PM +0100, Konrad Dybcio wrote:
> On 3/24/26 12:14 AM, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 11:32:33AM +0100, Konrad Dybcio wrote:
> >> On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> >>> MSM8974 requires a separate get_bw callback, since on that platform
> >>> increasing the clock rate for some of the NoCs during boot may lead to
> >>> hangs. For the details see commit 9caf2d956cfa ("interconnect: qcom:
> >>> msm8974: Don't boost the NoC rate during boot").
> >>
> >> Is there a single specific bus where this causes an issue, or is
> >> setting *any* resource to INT_MAX problematic?
> > 
> > I'd refer this to Luca. I didn't experiment that much (and also note,
> > this behaviour might be firmware-specific).
> 
> In case anyone's interested, it _seems like_ it's
> 
> (RPM_KEY_BW + RPM_BUS_MASTER_REQ/RPM_BUS_SLAVE_REQ) failing with certain
> nodes

Yes. And if you check, these nodes have QoS settings in the DT. Later
kernels have added a guard check (.qos.ap_owned) and dropped mas/slv IDs
for similar nodes.

> > My goal for this patchset was to port as close as possible. We can drop
> > the get_bw later, after enabling more interconnects, writing the QoS,
> > etc.
> 
> That's fine

Rb?

-- 
With best wishes
Dmitry

