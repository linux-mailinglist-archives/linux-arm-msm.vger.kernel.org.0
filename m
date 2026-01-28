Return-Path: <linux-arm-msm+bounces-90912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM0/H8fHeWnxzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:24:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316B9E2CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0ABB3005AB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22FF32E129;
	Wed, 28 Jan 2026 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiUIzcqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kaBAdEvK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEAA328259
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588676; cv=none; b=Z2qLYDUvIEDy70MNgnBhuMm7TJTKBFM6xfsw1kzw+s3ZxgUp07X/MfHtsodzngfqmPmdk2d4bNQSrUqnmGDBTd0jvNuu8PfJ5gqq3A7ydIPF+9IBStpWa95eQdIGfdAWVGY+opfGown4Cfl1NStFo39E+degIL1EeiUQrYo+3eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588676; c=relaxed/simple;
	bh=Ec/IAyAZg5HY1whU9HVkIuHkXU6cH1mANyRUHnDVwes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYxY27z25cfQVqjdVuQNeSj1GPxgcAXHj99oYeOSfnL/EAikyj1yI7TQrEGCCGBaytBtpq9U3u96Bx7gbRgipF7Nll7KeGgtwOZwdcaCiW0Tb4rS9TBezYhh7WwimP6/K5WtxoG0SiMHihh7YwvsGQ+zR/aqZhd2Zi2wzfAoF18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiUIzcqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kaBAdEvK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S7XoaY3712860
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ec/IAyAZg5HY1whU9HVkIuHk
	XU6cH1mANyRUHnDVwes=; b=QiUIzcqTfz37lmnCckn3wutW+3fIy2XOqJh2FnmY
	WXAzKDojC89P2Zw3XxKq2GWf8NVwlKWvyOIkCrQTEsRcQXBxzh+/KIyQ7h4W6ar5
	tbD+vC7IigbQV4MbqiFlwBMq7flR3Z5XMigCjD5wk3Cy40NMDQhg3aNOiBN5MEYF
	HjW5mXDCgQdb6lqDuAr2N1kAzMq/B5ZP2sFweX7ul9BRn0U8373NyQ4sHgTWYEyk
	3uUGfSvHSLecxshW3DVmWvsGqady0WiYDyPeRWZYmrL0PFQhj/TOG4NggFwaSpyG
	KH5h2oLX5niGqbR7m948vjyH3gcfNRPcOkrJ5JUs6YFHcg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbhkgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:24:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a344b86f7so244197196d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769588673; x=1770193473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ec/IAyAZg5HY1whU9HVkIuHkXU6cH1mANyRUHnDVwes=;
        b=kaBAdEvKP2coqSNR/sFM1JlKpfBexWtM0wmLFM/CbeVFdHVndcDTI6hY5IPrqvw5RY
         ai4+qcAcnMxI7gJ6xH7clfvrTC5W6FT2v1Mtax/V5/rIcgaZzdMV4FPQdRZ2AJRZn3R0
         eQxuPfsTlkgaaqKaMWDFcyclOaE2g8tOuqlWjjNusTLt2kL+JhM/7pylRCsCgflDB3V9
         RDro7M51Hcjb8R8uvDPqudd+vpobae0G8e4VlhPAlGYwf6BBmmgGNUe7fHluC5cpD7Jw
         U8QSFwmAJ7oW77hOY+Y10Jrb2XJxL8+dS+4ZjoaIJHoWVQirL1ndWFRXuWVn3y/A/5hh
         kTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769588673; x=1770193473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec/IAyAZg5HY1whU9HVkIuHkXU6cH1mANyRUHnDVwes=;
        b=J7stjn8MPJS8ZxLCTUHe9BrhYgHdqzvIwiGjrUTuJqNt7OWL08Y2evViHm3LNVFEoP
         ltwatoFdvkH+n4qyU9tBeVWpldMgIxC7X8DiCstCt5Ky7if0XpR0N4xj0dO1eDVW0t06
         x2mwvsWBZ2sB88PFcThM9/LPWLCyo5yu4tGBBj3eJOWTECjBiTHSjJ+MbcRKBNMaXBWY
         O+TQ6c9RsAqGJDhhWPzOkeMOPOGpVdhT7k/5QPnb6VeUPpbaLLaLhfuTiIMP/+xkkklN
         zK7aabMCRPvPFBaZ+Pc7f5I8FsV1ayDiWSXd5HH3EiAI8WeOfv/u/W2Prhkx6n76uwmI
         jcbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx/br0ltbDwrsaxLCWyQDtfonk03J4vTA+DA//n1kI5egSggMUCPbZREaM/oGcgTM+zkM3Hnyw//iubvKS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Mvc70euguYrPtwntd0kjsAUXuMZfVh1Vfwu9ZkJhm+c09sqo
	CByfV2lAcxk16CTqILg3fPQu+rbYu+yyM3cVPN7fWUHcOYurvzh13UWWcidduFXkQRVD6jTNO9M
	hPZA/SxrzGlVykoKLLj05mPLZqsJr6cUF1GeDXfZAYiqdPx/jNzbM2YBm9/z6dgFaIq9i
X-Gm-Gg: AZuq6aLwADicKE2jTP0Q2LQkUL7uAtdYuqKG1Ce/zRi8e8moRYbMpRWClAu/8crlOMY
	8cWCAJtN8lo4LAp9B/51ZN/eGPffb+vYpbpLDAHlg6hPojlaBe5bJQgvS1PGCboPoCzWCQHV2My
	HzdZN+RSBsHtMRTeJFoLug6AKXo6IWlZmgaSS+Mjc7r8idk3wtQGuYJONPvHuDb1RIWRa5PY5CE
	JyVJ9LaBSSA8F4H/wKsTNEtvBu5AqOFlnBMxJniL0DoFeNVulVi91P/+VAWmOLvMgUzjgLZOFAC
	YFZSNXPMhFSKGRrpl71n5Fq5+MIoU92oOF8zj4G5YTuw7WHNNL2qC/Cs1AnkdkU7RLKQLZr9jZU
	Oj0euAj8KI5WiDvJBbWY/Pu+R
X-Received: by 2002:a05:620a:1724:b0:8c3:5a72:b11 with SMTP id af79cd13be357-8c70b92f7c0mr585127885a.90.1769588673447;
        Wed, 28 Jan 2026 00:24:33 -0800 (PST)
X-Received: by 2002:a05:620a:1724:b0:8c3:5a72:b11 with SMTP id af79cd13be357-8c70b92f7c0mr585125985a.90.1769588672889;
        Wed, 28 Jan 2026 00:24:32 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066beeaf9sm121311935e9.6.2026.01.28.00.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:24:32 -0800 (PST)
Date: Wed, 28 Jan 2026 10:24:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: qcom: Update compatible for videocc and
 camcc nodes on purwa
Message-ID: <pjgsxvzdqqlp2vi4thxljkprxwd53nxs7prpp7cj5n3f7ifsyb@e777n3nndnyo>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-7-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-purwa-videocc-camcc-v1-7-b23de57df5ba@oss.qualcomm.com>
X-Proofpoint-GUID: oo-HlGcpaNdddOszOuW80bBv2MoRX6Wl
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979c7c2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-SFF1rR8kX9xiZyV__QA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: oo-HlGcpaNdddOszOuW80bBv2MoRX6Wl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2NyBTYWx0ZWRfX8HYBoCMozoB8
 dE5gqvuLI98qfWkWc5A36VQZ6vzbmJL/+4MbfR1irR9K3kwIaay5KXD6lu/bLrEOxDfH4PVYPHY
 cs50X5WGxJgnIqrrkgHKXtX/wsVpS99RAVyAN5RNfsF5HnjvdjtbL83Lt+MTWvqAx588lFpbLuD
 v+oHFhfnjLBvZ6wnK+X63uOd4n/yEQV0wxCLbtHizhyn8q2I+zz96RTj3xyXEwwbwyt2xa2KjOX
 ozUnQ9rjSvgzGI0amSzo2EJV/ZKLmbt6tclKQSS9zZDzCvP2oJ7jbytVyhudZct5JEeMX0ywApc
 YX1s2pmfecRD5fynmN1q4j98T3QCjs3EKquMagC6HX/E0nO9+At89ztVeufXCoMoAUSJmcduEl6
 omOrJ3npbucZ2UzhI58YTEm+q2PNfnKQJRr5LRKGIQCmHdzSsVO7RsAoeJP6Og3eemFZglp6KLY
 0zatV5kjBFbE2N2c9QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90912-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2316B9E2CA
X-Rspamd-Action: no action

On 26-01-28 00:56:38, Jagadeesh Kona wrote:
> Update the compatible for videocc and camcc nodes to match with their
> respective purwa(X1P42100) specific drivers.

Nit: if you respin, Purwa and then a space, please.
In subject line as well.

In any case:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

