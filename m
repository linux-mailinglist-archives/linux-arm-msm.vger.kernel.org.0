Return-Path: <linux-arm-msm+bounces-95145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBIpAazjpmnGYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:35:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EFF1F05F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23F433034606
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD06262FC1;
	Tue,  3 Mar 2026 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjKfkATI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfqKOWCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E9C255F57
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544921; cv=none; b=WZHD/7gY20DAqIzn45qnI39PrmEAU/a8zM4ae9QShDC4qyr3YFz8tyPNSvk5iyq4oyCpGYzm61ilMaMgwNjn+BJnoFaMl2r4eAgU0bAxEjmYz/p60t5qqRrN7VbY9thEBIcoNbw2XGHZ0oRIEGfgo/X/+RXYJqYu4wdnQAFt218=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544921; c=relaxed/simple;
	bh=MUQCZt8SC6oRsgXEYYBZNhvSs8c95NHMWCvK4DRBGxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MI0qC2df9kv2AmRpSYIXjB0wW0SDnJG0FUR70op58oj2lRoKQz7mxJnm2fMI4MPHOi69hc1hInvSFpQ8MUJIw3C4u5USs2dgySbnmJKcZ05xNi6udFtNn+IjLtDQiIaRCXRF35SjeLSkYz2J5X0hTxV6JVdMEtBUP5Q1QVuojW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjKfkATI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfqKOWCP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nIg9323881
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iIDdHFjvuX2Cl2qm4wnbyb9t
	S9gbrmx/n5LQeTmw3+E=; b=UjKfkATIJMdRvfZlq5+KSkv/9GEHXh368xPy4GqF
	xb09kpaqeLIj2UweoOCEGX0qTN31TDmp4i+EJYGR7uh14we7obTNcdSB2GzF//6O
	G4zss0X2/ceTnHS6bkU30h+T8P6gw8HzyIDTIAarzg8yX3Lj4sRgiKYUM9VkWkyH
	N5ffeWHgxM6hF8oK+4yVT2Yq0o+XtwyWH9yLJqo+wKqE7LaZ20L7rNJjgNPheNdh
	mJhwWBzAZxMuH4Lg6ZowZyBRjOXQlhCQMocXbiAUEDNiSNl07jdcRNZHs30Y7Bg7
	iMOCmElfRdYdAyt6mv5EzrjY/+Yb3Uc/nb8Awl6LhZSi/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfv7vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:35:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so4476472785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772544918; x=1773149718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIDdHFjvuX2Cl2qm4wnbyb9tS9gbrmx/n5LQeTmw3+E=;
        b=gfqKOWCPZP3noVzdQ5SBGVhs0SMPOd+pU4xiXHTiPIXj4KKsWLdXcpCZRHXG97a327
         sTNFPyOoc9bqnPfnxIMsNsmbeLmJQgnkfEX+9hCRoSV1Xr3KjzVDMXsDqysGqGllOH1r
         w92SddUVokAPNVrkAteZNXn2hq6HHCVqsm3maPtu1J7qX5HzweYaHrweltrmy0uEl8+b
         Ems9tC4XEQviyGI1x4qNkO7X2WqONt4rjUEPpqGH9jPotxaIs7yIl/09fXel15QIYoZk
         jf91bKO/e68VCalFC3rK8vGEqvlo8alKEzJTEL4LiKG7h1bt9g/mytg0ERSTDFWD/0VI
         V4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544918; x=1773149718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIDdHFjvuX2Cl2qm4wnbyb9tS9gbrmx/n5LQeTmw3+E=;
        b=UfvJ/cYGnb26hRLA6EyvJIXAkPcfxxK52yJRIYHXLpTS6Z6i5chzAsTWJNBC2owTY6
         JP4vEf8EJmoU8gu0X5asnNKVFqgAyf19dRGxokQ7V0r/TBjEtt0xpPsU80lt44On3xOP
         T+m6PpjNbbh8rtDzwWkgFnsBdr9fcTXnXCyvnVZq2XdCIUgKDA6NsGow/4eDsV0pd6/s
         5OElmCRqQ+ezYopssdBWenMWSU1UPmWJl5YCRH/1YsNMPDDmerakYjQ0SvTODWc2WUy7
         Q3Cf/TckYzxZTvebiOvBo3OkTVoiWlBTVnfXSz+gJeCc2r+CpOyrB0IBgmOyKwQb4uwq
         +f2w==
X-Forwarded-Encrypted: i=1; AJvYcCV7EeYcZ2p9qMT5fK7RQxh3LROj3KxGkrhKscPmdjMl5jzNANrhKo/6/o0IDCrlGfHpJyy/eSn4LKQjyaLO@vger.kernel.org
X-Gm-Message-State: AOJu0YxCDFYbSAzROdyTO9WYNvW6RBeaekQOIJU/fwKXiFqg009PvKOc
	fLLhV8BWTNt1eC2pfQThZYmkjVSZLQO62+tK9C+F5MA5yX0zIayflNvUgz2ISJ/wTyZzrXslmOo
	8rtltI7FNtVTBdZYRW/hpolwHvS0H7dIJFbbjO3R3ZXo5SLEfuv5Dm92VNuY2ageSWyQW
X-Gm-Gg: ATEYQzxcjgpqbHGd8MQuZavXCDv4kkwp0u680yGjde4s9dL0VVFM4GFdCBOWpMR7SSA
	m93JAJt08DHEG8Mf4ckzHOwXfXVqQdELdXBkTwQMTpmlbY710Tb1hi2Bmo9HBENZ+J5i1kQ15+i
	UB5Y5D93/y8Nc97/PGKqbqY/iLG33DXSsg0FgsluDKDcOcv7Xlb9mSTREsWLiy9gpCzfiVRRzH3
	7ro/2/n1tXCDfl9+KWkir0ni5bvCsz252aHGLh6Ng6a3gQ8UzRdXxx0AUTbJzYY82X0y/iDrJym
	u25AxCozjDCr6cfkZy5c4EmRVhc/UWyXZjyzyJ8jpuO1NRfeBVGXVAQJkQeOa3OKFCd+nTakzUl
	dyKBEgb5qa9kP2Kx9OIReZp+qog2TCpgJHAts
X-Received: by 2002:a05:620a:1aa1:b0:8c7:995:b961 with SMTP id af79cd13be357-8cbc8f2b066mr1941903685a.58.1772544918114;
        Tue, 03 Mar 2026 05:35:18 -0800 (PST)
X-Received: by 2002:a05:620a:1aa1:b0:8c7:995:b961 with SMTP id af79cd13be357-8cbc8f2b066mr1941897985a.58.1772544917427;
        Tue, 03 Mar 2026 05:35:17 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485125bbb48sm27812015e9.0.2026.03.03.05.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:35:16 -0800 (PST)
Date: Tue, 3 Mar 2026 15:35:13 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
Message-ID: <5fsq3ex6d6ytzus4n6smkd4tkxvsl2npxjdlnj4m332lmiad22@iu4f3ij3ozol>
References: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
 <20260303-gpucc_sm8750_v2-v4-3-2f28562db7c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-gpucc_sm8750_v2-v4-3-2f28562db7c9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a6e397 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sWMdH8d5cH_G3Qu0fyEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: pXoWb5DsYpvLU00UkKlU4KmgGuFijf3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNyBTYWx0ZWRfX/XZpDLs7ZcMM
 sRqjAYHKND/jaNewK6yBVYGHfMw0kM1CggwKa2n0JwuOl1/0TSD6HscjREOmW7Eblgbl3/U0kdT
 Q+Zk1ZdAMruj+OWFdCIftSzTDdVJYHnFFMoUZr06dmeqWOT02Nxt8StlC91QR+kxLDEdLtb7aZS
 +WUKzvSTuEv+ntMXOhzVrCASiJfYUMYS8+9Xs3P9vYlcnMbf2m6Z6C9eB3U3007s4tMP+R48Vsc
 0lS8vALevvxjQWnEBmMvXYwjdgGtW9VAMZMZW+do+J8vlf6JXS4hSek0OSQBMkdLAxIBVZjyDVS
 BqGtl4rxJVQWrT9PhhlmUBp9hJxmu2gPaioM0NgaJEbARZbAklqEMKDDA05nVNYiSca/GHrwjBc
 eMC0PiLB9lp2s09yNIVZ/wDJB/6Hy+Sfe7PBF+bG8ii/qDWfrJKNDALrZkEN+H8aA8H8ItKNopa
 3KyPNkVkH0vaF8Noezw==
X-Proofpoint-GUID: pXoWb5DsYpvLU00UkKlU4KmgGuFijf3q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030107
X-Rspamd-Queue-Id: 92EFF1F05F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95145-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-03 15:05:27, Taniya Das wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
> is simply a separate block housing the GX GDSC) nodes, required to
> power up the graphics-related hardware.
> 
> Make use of it by enabling the associated IOMMU as well. The GPU itself
> needs some more work and will be enabled later.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

