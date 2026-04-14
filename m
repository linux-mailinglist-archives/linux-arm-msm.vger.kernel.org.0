Return-Path: <linux-arm-msm+bounces-103063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBnTME703WmMlQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:01:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A80493F6D96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 179AA3002B34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2819638B14C;
	Tue, 14 Apr 2026 08:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFeukI85";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVY9j1uL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9B238757D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776153671; cv=none; b=SalcuEKnFMNIYSSdIA12ELPU3IzZRhQD5nRYAMI7uI4bUSijdsMoQ8S0FtXbsY1amilkmC6hvfDXR1D8dgBFYkoKss5n8m47xMQ7yURHlbj70Q9oWchkRzf+Jj+1RcTA2QrVOY1ffaEk0+ZbufdT1UWRRDBGtqlCPk7S2OtVd4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776153671; c=relaxed/simple;
	bh=s/9uwUT3Y3TIoPKem95eIUGFo7ju5xH38LWZqbfnqNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDT6+gokhT/YUj1Ae44L3R1B6YdmQ/LfSr2RqFaUGkWjE74e9ZwR2tPq6WcGEnA28Ozwfbx9AzBDXAQGfDBl1SovlJOjEddWGp2cDqwhWpyjEMU3RMEZadUJlDBAgEnRK+nh+UdjMdfbWwddGQnKlZFd6Io9d5L9Jyt17vxSJhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFeukI85; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVY9j1uL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6mhjj2511007
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1xuLm8s9vE/9k7EaKH7oJwTI
	LNIKZni0Y4sEIKMAt3Y=; b=aFeukI856vdAfDIu+zdiVLpSdB3htmXuddwxnOFy
	ZmGzeSPOz3usOMtHhbSRGtpZ13JhlDz57m8ff5MgKMTZBH7EhFPfLR8lSy6Mm1iF
	fvU1h3dDBqPFsQJwtM2Gvhmq9qkNKOxgFNbmMPNauf+G6LYKxM3Acq15nlCI2oHz
	cOnlX0XV31gZSfcAwDycXe76uvOtYf1kSuR0AeB9N90FLWoJb5DIoQzh3gC9a78/
	1SwzyyKBtxn2C65wCUFW6As5fYYoHS4RC8cb+acGuMd/mc0H+iyO8UtvQtfWPgpe
	1VmVXpC3DdPPIz+ncuLAcwJOjqgUIf6U3iVkw88ErA9grA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh867sn91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:01:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so7371659eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776153668; x=1776758468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1xuLm8s9vE/9k7EaKH7oJwTILNIKZni0Y4sEIKMAt3Y=;
        b=EVY9j1uLIaV7mm2lrfHIZuwNXQt7cSDVthNW6yhDVmuT2SbZbXNIYDJ89vjEefZUmc
         yNZlBIlJjK5/mRz1quHE9PdsCpud4r1rRsXke+M7/1NP6DV4B3gZTFN7gwPzOo4a/8vt
         E2IBP4PrZaf0HNF8Rn6vj1rPAvytloFu6njzOtfOBSo+2PYZSk4jP5KyefcQMGPOOlDW
         hooY78o8+rcHNvz8vq2oc3w4re6AikmI6m4ZBvCPk22lCXgDnmV1yhA5JSvlnodg0u0/
         hoKhZYHHBNTwGpliWsj8y1XMcRWNMsK6K8Z8QKO2xfcHwHPRZpoffXh7G01TFSvX25ry
         S0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776153668; x=1776758468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xuLm8s9vE/9k7EaKH7oJwTILNIKZni0Y4sEIKMAt3Y=;
        b=T1LyZSVWlz/z8chBSl1Vb39cODTYjZt6KiQI4uh6vGpuabVEP7LPz9I6cNnohtY7ZZ
         B1lS105yIX6LBDJvgTGAK7t8MZCJRjIMkOJKMSwIulyOnOQVPCaAQ0//Z3xBMxvvznHf
         B7Cpee6ZJDoqyL+It48fPflGPYaCn8rYUmKM097Hnht/7tkuRFvYC3nTuA/PJu6udhx5
         +fRaNEwhYCricK3pA85YeiJyJfZG1filri3f1hWT+kuZHp+8PWCwaNUAMC3CCxQoLJ/z
         ecJfLpj8EmqZ/fbZ4eEWZfpk48Ft8Jk0YM7WGy01SC84lcMNvT5mFSJy4aSjuELmG1uN
         KeCA==
X-Forwarded-Encrypted: i=1; AFNElJ9VrE0Y6/1EGIYcrWtC+Ba7YFPKRiYNOBqlGj5fgi0jgmnnUcPTrypMxDkXsXL77qakKXhlar0F8hM9G7kN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+pFJFrG4fngcCGhXvTx/pwezmq7JAQ8cErp6vUXxqkN/HGHsk
	SeHXJVgCtegkilspiBdXNi0zI2zkOegWuCaG/SDyPqpFAztAq4LPJ6qYA5jd1rjtU5C696VH9z6
	SMPVzz7ZFgRyauDXy7FBtAJKlVbrnLGSgVThJN+9SgsNN8GBlvXh/8DhQNH2WJ75PYqdPZdGkru
	kCZQU=
X-Gm-Gg: AeBDietJhgjHnET0k8gLeJe7CPgtDlN9MV//D2+5/rtQGsOP+74EptUJ16COzPxuAPr
	BCwOCoKEWztgmjMlFFDgv4PAk8w9w8SqE5qycFflSArRZ5Bjkn8JsMh1OLIESgTMf7OTNnusSlq
	TbAwXEF7y5jS5kcnnGmVTt3ZEAactv7udG8aSuzPlDQMSk+OxWJYKR7Ekj9nvEVhSW91uM71dLV
	DmNEcxCC8wOXU1zl5X/IPgE4KE5kWeP3ouuwE210+fTcGG1CnlQKUhRM5iFBs/H/igqjdX740LU
	XNbNQs6kyFGTz/a0UfB3VTi14ZcaiAZIKQXJUlhdsigUi5hAWH/Sa6rOHEP0izWLVSxWpqD9Ah9
	f/Y6sauPAsuQC7jz2NKbYkE9Yliz0FrrVKUzLzAT72IzE2NKF77ilaR7znnzSJcnl
X-Received: by 2002:a05:7300:ed0f:b0:2be:80c4:2c8c with SMTP id 5a478bee46e88-2d586fa6021mr8938093eec.8.1776153667679;
        Tue, 14 Apr 2026 01:01:07 -0700 (PDT)
X-Received: by 2002:a05:7300:ed0f:b0:2be:80c4:2c8c with SMTP id 5a478bee46e88-2d586fa6021mr8938065eec.8.1776153666670;
        Tue, 14 Apr 2026 01:01:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d944769298sm7724195eec.5.2026.04.14.01.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:01:06 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:01:00 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Message-ID: <ad30PAMHxq5QErxx@QCOM-aGQu4IUr3Y>
References: <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
 <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
 <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
 <adz--4_2qAs7lkTu@QCOM-aGQu4IUr3Y>
 <d671229f-1c9f-470f-b1d1-7d015c0721e8@kernel.org>
 <ad2WsFuUjtcjZ1wU@QCOM-aGQu4IUr3Y>
 <27f57fd6-71cc-4f88-9d8f-6c6fc778008a@kernel.org>
 <ad3l37AXKvzRrafU@QCOM-aGQu4IUr3Y>
 <e80cbf58-3701-48fd-81ea-2fe6007221d0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e80cbf58-3701-48fd-81ea-2fe6007221d0@kernel.org>
X-Proofpoint-ORIG-GUID: SaDAZJM1Cu9X1zOhG1J8Cx4d8oyyo65s
X-Proofpoint-GUID: SaDAZJM1Cu9X1zOhG1J8Cx4d8oyyo65s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NCBTYWx0ZWRfXzv+4oY+om3Nw
 Be5G3cE18/dxKIZUm4RW9VyE0vU45jyHX3fMzt1DcQcHXlliNbu1aLEmsyaxBMInrI3SXFtSmcD
 34yj36rTgJw/gxWDJExWlqvt/El6E6sBtuqiQC3hy+U07mvfmtambcnbde5qx8UEgsZU+4mEIz4
 q1UC6b9qY50v2o3sTb4ZvF9QowYk/GlWETewTgKGgWGsybqqcaGwfNyvhfbfvPI6+Y364s8wi1u
 PCyzDbwmQ77T1q/TUTPfok2Eq8VNRMQz05F+hOO0ECxSqVMv2Af/Quu0Bub/lH0k6GiGvRDtqKQ
 /5zmamn+MNhrXDp3vHfGm3v9/ukFt5V/mwN+mHGQSkPclJJr4TyshN2Su1JFiHIe/4MQYswcdic
 pwViuWJsIkjnype2Hzq9NjIatFp2aJap8+kg0b6NxFMjyDMUssj3NRcEGDcj41JMdTJzmo9bkxm
 REtFKZyyK3v+7tsFXGw==
X-Authority-Analysis: v=2.4 cv=etzvCIpX c=1 sm=1 tr=0 ts=69ddf444 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=M1xjTVqJwPd6Zf73j48A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140074
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103063-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SEM_FAIL(0.00)[172.232.135.74:query timed out];
	RSPAMD_URIBL_FAIL(0.00)[get_maintainer.pl:query timed out,qualcomm.com:query timed out,oss.qualcomm.com:query timed out];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A80493F6D96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 09:11:38AM +0200, Krzysztof Kozlowski wrote:
> On 14/04/2026 08:59, Shawn Guo wrote:
> > On Tue, Apr 14, 2026 at 08:23:12AM +0200, Krzysztof Kozlowski wrote:
> >> On 14/04/2026 03:21, Shawn Guo wrote:
> >>> On Mon, Apr 13, 2026 at 06:08:49PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 13/04/2026 16:34, Shawn Guo wrote:
> >>>>> In short, there will be Nord DTS using the binding coming, and I do not
> >>>>
> >>>> Maybe there will, maybe there will not.
> >>>>
> >>>>> think posting them at the same time should be a requirement.
> >>>>
> >>>> Well, it is a requirement as I explained previously, said that
> >>>> *multiple* times on the mailing list, documented expectations in
> >>>> mentioned/linked email threads.
> >>>
> >>> To be honest, I can only read the following from mentioned email
> >>> threads.
> >>>
> >>>  - Binding and DTS should be organized in separate series per subsystem
> >>>  - DTS should reference binding series by a lore link
> >>>
> >>
> >> The links told explicitly to organize series per subsystem/maintainer.
> >> Who is the subsystem here?
> > 
> > Rob Herring <robh@kernel.org> appears at the top of get_maintainer.pl
> > output, so I guess it's DT/Rob?
> 
> If you guess, then why did you post it separately from the other patches
> targeting Rob?

I should have done that.

> But you mentioned oryon-2-3 compatible. Who applied it? Rob? Who applied
> Kryo? Or Samsung Mongoose?

I was misled by commit 96e71f817b02 ("dt-bindings: arm: cpus: Extend
Qualcomm Oryon compatibles"), which should also been applied by DT/Rob,
IMO.  The merge conflict where oryon-1-4 got lost could have been avoided
if the commit above went through DT tree, since your commit 0220405d7e09
("dt-bindings: arm: cpus: Deprecate Qualcomm generic compatibles") already
went to DT.

> I explained you the rule - bindings go with the subsystem and you post
> everything targeting subsystem in one patchset. This was explicitly
> asked for in my referenced postings.

Being a platform maintainer for 1.5 decades, I knew this pretty well.

> The SoC is the primary subsystem here.

The same binding switching its belonging subsystem is a new thing to me.

Shawn

