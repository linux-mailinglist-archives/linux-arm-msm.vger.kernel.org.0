Return-Path: <linux-arm-msm+bounces-109686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIZQNv1pFGoTNQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 17:25:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E395CC3C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 17:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2DB43013A93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C09385519;
	Mon, 25 May 2026 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFFZCQOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+m1dIb/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450B33F44C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779722747; cv=none; b=fmsNICDn9nsO1OQK/ZML1pVMevGAIfjGd0vMYxz4nN6GUisD3BC3VUVY133ZDQR2QitOoM6PDN/THBQVvsKTf6q5JyvLsFD6MWxMxkYYjU1soB7cccDMXGl+oN+EBZF14B32dHMORb+WevqUhdVnVi7B+TDufCQBS2xAd8TGDkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779722747; c=relaxed/simple;
	bh=s2POYjk8QAQW1VKj3Lnzj1j05Q67m2Y9kxI0+l1J/5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5MCTFlctgXsKEjYzkRx/mTsjhNUpzZ0n+kFD54nhw9nDvHGrdQpKLQHYIMuXB1e/e/uq19t3PJnXlYrkGFTrgblgY+Yu0riHFKfctIqQctSP+UFeyCGZkmcidVrJsrfHoLEmC90T/UNjh3837tJqgBrCptSg3rqKtEEuAfsfEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFFZCQOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+m1dIb/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9EKB7079203
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 15:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EU+opvXvK8b9RLhxTcj6h/IT
	TVsJ9OckkeeV/g6Qq/s=; b=gFFZCQOBA9rItRfKGvBLw5AsGNL8VjEhMwXHvECJ
	R3Lf13w5JuJ6M4w4bMP8vfgtg9v4qU08XMjnQYXvb1nhQQjeLgJr1EZ1Viue7+v3
	sh7qcVg125N0R+NTO8hX5aOEp4xgW+Q8U6qy9arTvHvLSZZJYjVjFNh8sQA4zD55
	QT6BKeeCkE3tJY1t5FbpL6ltr/0IQ3nQBQyxr+JvpT22ab9HJ6EYKLShDR45h0Yh
	/HjyuSjQTJcXYA8KG1UcuZ9puh92Gybhc7uusjN/gn3y3O6vFQordeQDppKPX9CN
	tgZEtl0WFihTS5+RoQ6+BSQRu9V0aQq5/u8E/ovS+Hj1sQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma97cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 15:25:44 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d25cc8f5bso13408041241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779722743; x=1780327543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EU+opvXvK8b9RLhxTcj6h/ITTVsJ9OckkeeV/g6Qq/s=;
        b=J+m1dIb/43Gk+L/Ot1AraDvC6a7wcFOCDuU6ISdwcYyAfbOdqIBZIjNUixv2b71kUi
         Ahabwo6e5X4CNy1ncbWZIEhjVNQv3SVsCQ0vPZ/CE87iRe2AFUDm1iQCOHY+wqcPFqJ6
         skAyf2ksD3LnurbnL3MQ/7b+mJsy4aEB2QJjP3ybyPYdbQaP2tuFd49iohe/h0Tns834
         q+VyWlEl/eXn+CiSiHBIwj/GjWli2aUXrzMBtAwFazymUBQbk5w35107DQQMBJCQM8qg
         koQSSN96B0Kg+zdWP6KoNIRMEAZl4KZKKC0FcMTp1O3HgfdlOjMm9Z8Hlr/4jked8OQx
         hLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779722743; x=1780327543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU+opvXvK8b9RLhxTcj6h/ITTVsJ9OckkeeV/g6Qq/s=;
        b=WZOQOsSfCF8qnzsgwXdQzE3U5JLk/ZUwCJoAG3sfsn2Z5jGa78n3CVnKYLxrz9wQlz
         lml9Ks+EEcPqXTOWspkCmPgMNwKOC4D/KO8l4kIs2MBiQo83peCDC3o14XKaBtzWiV7B
         o+vW/JkfmYBczv2HHoiZHP+QXp2iVmRSf0FXKCWqTBtP/zv5VHj3O/U5QyMEiOICFXSx
         XQ3FPWvQVjZebbZXv/+t9jdlgNsdhFarMzY6+eYLQ03WPGYlXhv+3Gq4Mffs/VQ7Mmeo
         jFgP6Ix33ZFSlJRd1nGkiAEnHP4r61nccJiHr6LA6mX6x/KuNLc98Sx1WnQxSEAPInT3
         o56A==
X-Forwarded-Encrypted: i=1; AFNElJ80bS7h07KxPWMMBlcmDmSuIuKKwMhJSZbO9H3okGex8S/MssZhvO9oCPcV/iTg4f8ag+Vd6PfnQUwntdky@vger.kernel.org
X-Gm-Message-State: AOJu0YyM9Q1skewe0hVgu2Vwqi8xVIXUKeoIEpdjxRGAxaBnuZ3Kojvk
	ZIUT451Ob2tgTM3S+tZhB/JNrzDZC7znsRSBCyQNP6ytyGWbLLohYqYWi+3+R5t3AAefjG/3vsE
	pBA9/xjB7wLR0IBGv2TzvJvTrxt5R2qIUltZkvLJsp7FAb+U0vUH8Fx1tE2vv0XgwSyZu
X-Gm-Gg: Acq92OFtgxub9302RmUbU8O2KT2wsbNlxezOB47iGixenKpWu4d8oTPIRgdAWG5F8pc
	KYLVBVf+XD8wD56huGwI6Z1d3j7zdxD0qs8SgsmeXdAQrLd4lQc6DbNtDi3m9+B+8P7ygSh0u3P
	WNGwRcqSUsU6M4gzuL2AxvpPf6n+2DLFD+cIKOtg9Wxi+FzBZCZPb0QIga9XBpSOZeUMtxcT1X4
	dnsmKj/JfB8USXEFhRlcl3y+6fmUxgRgLjXhBCq6t5+qDGu3fdMx3W3kVizH9mTrGb+pGpCySPk
	vJl1E0+iSVXZVg55HLzRT+2SM2DhJZnpJ8cppoT6NzjdNMwEe94PssSL7vxeo8pF7Li8C6RO+iF
	xskd2SA3Dm7v7Hkhdb3tmoafcdzTAW31dyU4uuRSHo0VbJr8yG9mX3F7PEM3MW0DFq1xBwT734a
	FhVUB8nfpflBloYW6v3ePhDbs4wm3jCoK56Zc=
X-Received: by 2002:a05:6102:4589:b0:65b:c17:70b4 with SMTP id ada2fe7eead31-67c5f48e955mr7481404137.0.1779722743008;
        Mon, 25 May 2026 08:25:43 -0700 (PDT)
X-Received: by 2002:a05:6102:4589:b0:65b:c17:70b4 with SMTP id ada2fe7eead31-67c5f48e955mr7481391137.0.1779722742588;
        Mon, 25 May 2026 08:25:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cc08c0sm2725059e87.36.2026.05.25.08.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 08:25:41 -0700 (PDT)
Date: Mon, 25 May 2026 18:25:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
Message-ID: <sv6sja7rdwz6ke525e46zpfmtp4wht2vboxwwpyjnmiezibhhm@pbuvqlpkjpb7>
References: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
 <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
 <005d1637-ec56-4f4e-be99-04386efc2524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <005d1637-ec56-4f4e-be99-04386efc2524@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a1469f8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=cP8gHpZDPz6Z602etIwA:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: sWe07QaGXVVhQv7WOpbB_ZYZo8wEEnNU
X-Proofpoint-GUID: sWe07QaGXVVhQv7WOpbB_ZYZo8wEEnNU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE1NiBTYWx0ZWRfXxxCv9ymU3byU
 nlUdHqDewTDS3TpGp5nU/jVBGKfM9T72/hfLTMLZ66yLXUkV3b9/EwoImOs432eRuINvH9bQQHZ
 Ycm9ye5vuUQvH2LJZFn9rjRSJMrwMLZXw22MIxKGnV/M4db2Tex9UCssos0anTDkXI38GLhGvwX
 AoyhiwoQDVJ55y7G0lSmpp+zow1XSs17RufOIUDAiXJdXSFvQX+7eBJa5nz6QVvPF5GsU40LsYr
 4DcctYSVFItYks9t0gfsL96w5+Q6+qtUG0tJHOJPotuxk8W1Z8ry+x5dbGn5O91RS2MlHfDS1Ji
 3Hg5yBOdW+wdrzs07ox6oni6N21jhkvlMdo4hycs+Mur89EcDCh1xVdFIlWO1ssBA62P0H5K6wU
 r+oe+7nlqsuSsvVHhZ0sPM+gEGJ7COIxLmDuO6f6Mv7x45/uTwo9YMXv8JgZGqRslFcyaDLAT6C
 HdenNeKeZ+ie8hIQeQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250156
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
	TAGGED_FROM(0.00)[bounces-109686-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38E395CC3C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 08:35:16PM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 5/25/2026 3:39 PM, Dmitry Baryshkov wrote:
> > On Mon, May 25, 2026 at 03:07:17PM +0530, Kathiravan Thirumoorthy wrote:
> > > Now that Linux has the consumer for the GPLL4, drop the
> > what is the consumer? When was it added?
> 
> PCIe and USB are the major consumers, which got added with the below commits
> and landed in v6.16 and v6.14 respectively.
> 
> ab7f31a3830d ("arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller
> nodes")
> 
> 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
> 
> While I was revisiting the code found that this flag is not removed. Hence I
> sent this.
> 
> Shall I reword the commit message as below for the next spin?
> 
> --
> 
> Since PCIe and USB are enabled and consume GPLL4, there is no need to
> keep the CLK_IGNORE_UNUSED flag. Drop it.

Yes, it would be perfect. BTW: what happens if both are disabled (or not
probed at the boot time)?


-- 
With best wishes
Dmitry

