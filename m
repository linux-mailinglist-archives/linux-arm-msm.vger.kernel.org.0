Return-Path: <linux-arm-msm+bounces-106647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD/SD5K+/WmOiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:44:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52A4F5389
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44FEC3016D29
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135DB3D1719;
	Fri,  8 May 2026 10:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgwqTUVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1MwCYk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46BF3822BE
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236981; cv=none; b=j2uOSH5rS/r9d+p+IP6dQDoqusL4ImBsDEgAItzBEFIgXQLCtsIaogcP70WOPbRFlRqurcj2ZlXUrNBbCdcm74ILwCmoPBPzrOx7z9I2XHbnBk7NZhYkGLVAAls7QdytIIue0d98bn7rKGgk+DitezJEJRhf/J1Vvu7SFHpYOcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236981; c=relaxed/simple;
	bh=w1p2ZKpeDIu0yqJaCudzdk6CgNOlD5fS8OxE1qIbrms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGUjWz1Uh9/2+z2aD/hg738FUKmV5CgWjOYtj/p2UwSzTSUOZVReZARceA0RQzdbpQlt8QDxXi9rAqqA5R6lG08pr8WKwGEI1b15Olw12qHKTI5BByQBs0oRvlCbf8yXAx5vkkK4dPjsnDS7TSr9aADJCMkmAMkow7Q1sQvS11c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgwqTUVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1MwCYk1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487Kanm317550
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cxZOQbgDsT4SSfVbvrstk18EZILNq5oPkVhwWFpQr4U=; b=BgwqTUVic9PpvUST
	9JaVKcHpmoL4hGsKHrTId5nKOxVwE6MZhmJldUPf3/uDlkjR5YURSUXwJOB+zK5r
	+vb5o++pvP6SwybAYY2M5yBNLTVCqZ0qC29dF63GDcv2rA9ePV4D3ZW4poPS97sr
	axb3jp7o45n11lZvG145xhj9NAYEvnx0GDUmU5fRBjT0HDGAKNr0gymj+rrWtmEi
	juhvGJtSdi3RNABORoxQrSVQBHtHC9KA0hXs/3xAYRCY5Jgn3b9j0iobYYMMM3Rd
	apvIrjBj+fkGk/9xzLXzJrDw8MRdXmY0mYVtPCCOXJD7AwGb1RXFsAHdUDMWZiSC
	d7ToJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc00sd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:42:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faec938fcso3131821cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236978; x=1778841778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cxZOQbgDsT4SSfVbvrstk18EZILNq5oPkVhwWFpQr4U=;
        b=K1MwCYk1bb3KEBCSUfeI3nRTVSo9PxS4oZVau3kqwDOZolpCRH7/qdZF+A89SfhJrf
         cS8ytMhSjEu4vB0KerXHuAw3v9/wGfnvONdZwCZTAXZm8Z/G+ceI/bRqfGGR99RsZS1T
         2EZJIk9I0JAofhjK1ftQ+DJxTb0Y2MlehMNG4bUNGbQkhapq2wmWwR0QJPh9iR0YdaUU
         fhiqf6FZFAucbQGkO3V4wyNufPbfkdWToyRnbJzaEWOFTl8qhxQHnlhqIswpJAo5RES4
         06VcoJEzGl+0/Prd1vXc96rdLF4+0JKH0N/I3HacbhCmODWxlECbK52MehDVz/yye6mk
         T8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236978; x=1778841778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxZOQbgDsT4SSfVbvrstk18EZILNq5oPkVhwWFpQr4U=;
        b=ZbfxAikkSIdtMmU5zvWTYJKl+VMDh7OyPeW4XpE3wN/p8mzjQvbdezOtRbDnWMhY3n
         B3ueagbf6AEAJMd9Qw7eq2+uDWiVowZZLHAoT5v5uJ9A+g/TomkH5xsBz6NSHgmlimDn
         Io+zoxIi0j7r8SuY3km+14mujCJMjuFY0P27725sbCgVQ/BJMSiKzheR+vp/7j986lkE
         c/c0LSvBmoHm5g9ZzXi773PhZ28U601YuiCx9QlVNbEL/M97ekpu8xk5hC494G+7VLTJ
         8xUBfHD89H6WpYCZsfXYGx5czS3S7nbUrRE5Wlc8mbOXLxgLzuRyfLvxFG9vnC3Z5VZa
         F/gg==
X-Gm-Message-State: AOJu0YzdZ5fqEOqQ4yCI0G0+UhGMb8139ldkwA4CrWKMe00r78RRj83u
	z0AxYQnwj/bQqT7q0TsB/2+B6V/Ow+vi/mzbAzFjRoX8lnLbXnI9pqBz2qajvG0wZk74NApiezH
	kBtH5nfTGHtLpiSuNFr7ZJIDmevdcoA3Lfplxs+3yyN1ehyz82k9VGISFywHzNl317LGk
X-Gm-Gg: AeBDies5dR4AU1h/UHlNadeqUmj1IJeDDPcEA8PQQoOiWrAboVYldCVMVo0cH9nXgBp
	FXB9O0w6WdsqxK5U4wejfjAi4Wf45NUQ0CKu3TIxBF8A1+sZvNU35c2RMYNIR04cn5nOyFcyIjm
	VqC6bEOWROAXwk8ATVEa1ARE3MEFh9w7tFm3Yx07uIHp8oIUWog1wBsOKptFkwxN3KBUZBZCGZU
	09k9oP0O4DOYUjtJIiF6bnlA9mNhK+wIKn5fKoJ4Xqy/4xADnII+IW4KLivUBY5obi2YWkeEhxb
	Ji/O9ncxlmnezWS5/2uTUFULKS6ELbt9Jb8m9evoclwj9i9iq+XW5HXQynzQeb0TJfU2yM4CqIT
	uoRV4rgybzcqQELltyzTPt7RNHEOVG7xOg23lBVoDiEo1ZAqZz/rRBCbqRMdSnSrRx2sW0MCZvu
	1DG/w=
X-Received: by 2002:ac8:7d47:0:b0:509:e68:22cb with SMTP id d75a77b69052e-514628b1019mr118549721cf.5.1778236977970;
        Fri, 08 May 2026 03:42:57 -0700 (PDT)
X-Received: by 2002:ac8:7d47:0:b0:509:e68:22cb with SMTP id d75a77b69052e-514628b1019mr118549611cf.5.1778236977562;
        Fri, 08 May 2026 03:42:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a534sm541199a12.9.2026.05.08.03.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:42:56 -0700 (PDT)
Message-ID: <27247bee-0c82-412c-995a-fcc0c717abcb@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:42:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM
 property
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfX9uzpOTUgK0mq
 pkjptUE+pHOHnvEQwYNiSPrLVLiebxW40T/CBv1ahqgdVoJsfA8vmsMQTgJ/XRcAoYONuOtiFnM
 OrCnkKaypYY0Xathw4S8Wf1IZF+fUDm9SrOJwAFFMH1eoI+YbOTbso3p/6cG2n/22Gdh6ywhbjk
 hM+WMqtjGX8OKkFpUOoxnAyhEK344VfjySzRiCGXzBwTr4RatLoW8oM6zGXSYLjVbh4GiBzcfZO
 BECeZEYb3uG9UBAUcxIZP3zBPtu8un9Id8AayYqR74Ih5RdfY6wMoRaTYgS8Yw1ktuV8vBn0np7
 DzU1ThwOWZXePUKKbrPGAl2iJ5L5wwyvnKWE3SZDR1PZmQPQ0sVQhriyp57pJLuGBch1PHMsquh
 DBe7uto66ZmWIUuCd3ItTMNhwareVORHKFpQLI1fzdHP1I7//WWXeczV+Id9ZJAO8+MmfFaUMhP
 VpKDmDzovNT9MWISEBg==
X-Proofpoint-GUID: PEq6yjMWOEWuTOBoooJOl9ZvhIOGnUan
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fdbe32 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7bsxUpGyA_mMpvjpU5sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: PEq6yjMWOEWuTOBoooJOl9ZvhIOGnUan
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110
X-Rspamd-Queue-Id: 1B52A4F5389
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-106647-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 10:07 AM, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
>  to deliver it (USB upload to a host, or save to local storage).
> 
> Add 'sram' and 'sram-names' properties to the SCM binding to describe
> a region in always-on SRAM where the minidump download destination
> value could be written. Boot firmware reads it before DDR is initialised
> on a warm reset to decide where to store the minidump either to host
> PC or to on device storage.
> 
> Most of the Qualcomm SoC supporting minidump supports this, added the
> kaanapali SoC for now.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thank you for the attribution, but I don't think it applies here - 
Suggested-by would be fitting if I said "hey Mukesh, could you please
do XYZ ABC [which you weren't planning on doing]", this is more of a
normal review feedback

Konrad

