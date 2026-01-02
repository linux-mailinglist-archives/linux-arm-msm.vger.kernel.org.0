Return-Path: <linux-arm-msm+bounces-87260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33576CEEB72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 15:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B2A5300F5A6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 14:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C232C311C2F;
	Fri,  2 Jan 2026 14:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQZjxdWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YeMz5fRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812D430DED5
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362406; cv=none; b=WyXpDAwqrKRBlkR/BqXH+xrgEulJQtecrPmCcH2OKNifIY//c8NM5tmGqQF2Mo9hunKeb6qXD1UAU8jhRuoEQNBMiPQm7jWqJzj+qLJlA5kvR2FXeiT1OfBrTvHRJubKhsQNMMZzn1wguzqQdQRB8nUoT7cn71dv6c7M7kagHKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362406; c=relaxed/simple;
	bh=ELgVrFfch8jx4zNgF23g7jzrBonp6d6Eq/cHi+wq2/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=boZcPYXMDqo++MSOOLb0VLUBcQgSxo7OpqBc6uLv1IbyKSJPzwZZZP2po3WFAk/xuG6XpGd2aRaxP2sZVMchmGAiMA5312dMxLl9wLXhtMpZ8hkMNd/qbffHY4VjqvU5IQ+FaU0CqmoilLlIrRnCYbYiOTjb279JJ3OP1BBlgIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQZjxdWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YeMz5fRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WB9O3961186
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 14:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=; b=pQZjxdWu146rz+Ln
	wuEZ+TCxIwl//TICA4OB9Agfc5KjyaBO4Drs1tF7fJmgmnyyDzye7dgTtPIC9rdq
	1QFZfBeidguqVdKffIcb4wcbfUl/ztF5N/+2FqpRLQEsl7wuEe+WbOdEl4M9CXpH
	UDffpQNRqkEPUmPofSE2jY8U9uBNNCshP1x1f+NYdNA3BaiMyGxfXkFN5/AYqxCH
	OUOCEtymcAH8Tgz/KFq3oKiTJL3zw40Fx1v558dDqRFOMKhyvwuX5DqbPPaPJxOp
	h7mAodYiwpP25mTBVszDgmZ2Dgx/8lcmz1qP7lsHhiGlA/jYHwyjsWfjy1DVsW72
	XnJAaw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v3k83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 14:00:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f357ab5757so56731541cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 06:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362402; x=1767967202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=;
        b=YeMz5fRPNOcnA8rgnVPeVXLCq+j+K0xjE1L6jCrTV4eOELeZ11QR2PDt0YFrbU9Mwx
         2dDKof73aFFlvMLEvNymocdk+PuaDNm/di7HFnuvPDnxEPr2Uf3cCo5USEXm2VjiP4FA
         qarSy6pLBjohFYpLd59tbNILUZR/n6Mv+FCsTfDytYvO+nZHzSUB6Q1PfDgUy8WVZZKn
         ioL90i019Km7k5Y8lj87OiObI5vHArFzL8gKHerCgfWw3PRNa9epeNKBgbxcuMyuGRC5
         yUHrvqLzWUT+6hNe5JoxiLscjgAuOZproxLhf7ahkEbJP9+EZzhLfirtYTBfQajfwfVq
         mRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362402; x=1767967202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=;
        b=g1x/QxQMmtcWvNi2iymfH+DWxS7NZeB6/hU28d4z8A9shZfcmRgv7OHNplAV0+Q2hm
         m2rbvezj1CDStjlLX5JbpYznuxQZViyoLrWY1yiA/3xOm6GsLKMzOlJhFliuI9e9TrHq
         /pjsMYc0wNH3Og3qBsWfSaxTSEUUadi/D2MzQRHzbwxKiR4AG5dIzjpcafNHcU/Tey3x
         n36lFBSMGDfmiFQAfRvcSsU6zA+hDQXtR7accU71qs8bwShSIKpHm/Xhen8PIg/wzYo9
         upEXHa4ExQJiPNGty64G4HOOJH8RZTCYL7mimEBoDmzzMJkgePjGKTQgih8521xabq8b
         +b2w==
X-Forwarded-Encrypted: i=1; AJvYcCU4KGOvcWVeL9a4EN+0iUgNWYPCI7/Hw6Djr65AxvI/9vJSezWyLzMccgjvPDW9lFIpbSgZcHSKtVF5YoNh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy41D7EmEHoOykAiQV0Zpc5kzRkB1waZSC0TLdoRjy/UMcxXKns
	w4k6Nf+QJI8leISq564U+9RSAfsxXOt3T64RQ14saYJJ4fLnHjk+c3H1Ig2J8Gha1jokkLptNp1
	Swgz2NoRBq5YtXx9NpkXYy6qM1yH8Z0O7iJRJjjb5UrOc1KGFhkpjm8ipxL1rJl44UyX2
X-Gm-Gg: AY/fxX7veKwzNfMcrcwd6tnpTV4IuEJav4XD2+G6gZyEOSih7uFKVg39cZc1Rk9+Bdv
	a+Ph1r2/OuClNYBifCBUfS+CI/mOemwBByacYykQpKrJvkF6yfl19HfDXJ/09VaFMcSu/FBJntp
	LVaweJg2T+HfWCKaHlB7htftXCOoJ1PsrBUXjeg41bnYMaJhfBdH2sRj6ylzq5zDgFTzMQflg8j
	Hf8mTmtLM4c2hxznadZQ6Yn2JsSWfIXqMlXnPKFnPpPyBJgafY2gbIKs/+or4qpiaFfKo9vxX7t
	6TCL93CHYUW13ZPXY4CcOQzvVdS/bYeMCXdmrLCYHCITVddK8nja1mEx9Fn3xL+FthOydWtUDSp
	67PR1t5r735+0534UfpBlYqPqfoyawQLL6+X8mLMUbhVp2mAJdFCq+wNUX6GOBl2vJA==
X-Received: by 2002:ac8:598f:0:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4f4abd7613dmr434910371cf.7.1767362402385;
        Fri, 02 Jan 2026 06:00:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBkOKZSWRFsB6BJFVbH93340vfDP9YfJ3KoJRojpfsiJwEKriedd/ViwC+9G4nwS5XjYG7SQ==
X-Received: by 2002:ac8:598f:0:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4f4abd7613dmr434910091cf.7.1767362401838;
        Fri, 02 Jan 2026 06:00:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm43735803a12.8.2026.01.02.05.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:00:01 -0800 (PST)
Message-ID: <22121c9e-1cb6-4948-93d3-6e9f9d7922b8@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 14:59:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] mtd: rawnand: qcom: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil
 <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yKh8641gOt1qQmrEReon_kIVNHJasFG_
X-Proofpoint-ORIG-GUID: yKh8641gOt1qQmrEReon_kIVNHJasFG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyMiBTYWx0ZWRfXxaUIOh1tXRH6
 rNenf5iRJCWAvpb7L6LZomwcp8ysrSpMNw4IdbKzEUI6L4TvIVRWx9nkZdcu7XNT3cnYnlpDdSD
 3ajIba0dG7wAWRUHyiuDWq7rnCH9e1d4JO55YIRXm+nd05P7ccpk0BIBo0V7ZLVLrBfD52gzUp3
 BYbVEuQJS2tn1ZTU05J/IwUWmtZtDLPKhOHNas/i/FjUP43Mw2qPZbr6MSvZQuc3XiJbiBijBkj
 AqJfDe/wwaUkE0QKJBpRgdwrqsKfO+3xTJE2BxKyfmIZmBE32q+srAqDagM8wq4H2R35k+Eo3Jj
 H9L+Dy49jWjt9p9H8R+4EW6szpaKmVRGsK9F/UvzwaCBcm0poatkUU2B0aCCTbQpcU0txvz5DHz
 ogZbqW9YbjHbxGunGAwjpZbb+9t0p0fwyhMfKMGuOOZTe8fTD0BWyAH97uALuuAZq9W3ANOTIsm
 nzwIGXD3xyQN+jfUjNQ==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6957cf63 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020122

On 1/2/26 1:49 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

