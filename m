Return-Path: <linux-arm-msm+bounces-85239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E66BCBDDF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 712D1305EC32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A06194AD7;
	Mon, 15 Dec 2025 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VyWXwdiA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOXpY6wo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF40230BEC
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801999; cv=none; b=iibXkv2znmWBXebqjrGqeN+NYTeAHi42b+vP7zDHT28b/O4aMkrqtKUCIjASSt7JJ6sQENB54H5Ux0MvppGzFtz34B2DXE7ThkVpBTg2HYedEshX7NH29ASRsd+fd0PzfGzopgVkxFWbHYpfSpMtHj4x7KI/p7VLZ1MvdZQPvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801999; c=relaxed/simple;
	bh=x9xTIu7Z3nI+BHXPlc3xpHoopuIiNWvUy7/yPpbNNrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRLw8BXyZ3Qocon5ivirjfpNWMZQRZniGtzItWcDZGRbTZUOMBgB3c8RXUq0DZsdnwscKtP6ARrIwIvWeRxhrILWgMMm5P7NJXLlw0sVHyZzbhqMFjiClZJeqxpbkbRkcZfZU28K9zo4DKjBhw4smTQJoOkqYoPFazWh/jKY/1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VyWXwdiA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOXpY6wo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFAO3Oe315562
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4/NPiC8qxSXxsgy7wgYQjJm4
	FSRDvFbKGkMs0zoelMk=; b=VyWXwdiArwAyngWo6H1KHLKhny3ZTfz9pKdBmuOG
	yR4LpPHw9iCuTKoccVfJOmYWUiIJ1sjo9/gex0ctaCzYXdGD765naZFtpQIYorQM
	hbfsPW5E21TvGeL2YFEtvNsL8twT71m9gQqLPjAQV2HnNldrFkpwrzeBhpCHe0V1
	hnTvaHgdhZSM7+iFvuElWn9WVSfvFmyV0A+LABQs41QZjeLZCqvZDDJnyudgkKbq
	kNklyT2wsRkxLeswQND7IoLFFxl6mLVDJk03FSHeNlFBd90AU5R4ORBzCsM29scj
	S9eP5uYr8JWz42RTHsr7Pt5nM1iOHcBcEostetrfpWjefw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119amft2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:33:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0488e746so74579301cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 04:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765801996; x=1766406796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4/NPiC8qxSXxsgy7wgYQjJm4FSRDvFbKGkMs0zoelMk=;
        b=NOXpY6woYGQKVTV6iU2wSOaV9wCZTy6u63hzhHDaOR9/7WLj+eUmUHejxf5kWq2Gjd
         JPfqd1HPMeor+ILhsIHho2G9AnQK9YBZqcOCVjvVwELft9syLjqUWce2ik/Q43XVIKHW
         dlbvl7/awFaWvpFFXYaG/tHC9zi/BivGq8/sgvfT9g0tRl7CECJyaTGu+QlK2wOuGrb2
         qBe66m9GRlb0nNsQtSuXBOZd7qzxEiYfYFVEMBZPMPX5JqQsSRdgCxXc38frpTzYiIoO
         00jsl0xzqTWmXMqAosL0BW1WJ/uNF3tqZciRQ6kNzb+TvP+4mojmcFTDkW9bgvMUyY0J
         A54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765801996; x=1766406796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/NPiC8qxSXxsgy7wgYQjJm4FSRDvFbKGkMs0zoelMk=;
        b=VvVt/nRg5iEkdSFvcC6ZAC834fX9EgL8DyG+fme5hSbZdx6fYs2rjQ1esLQm/GYdmB
         31XHeme8jFm8MjrKmfOdHk41WBjcDMAGvPtbGaV/UgV1lahFVbb+CDp9P8drGbgI0peF
         YaimoaVyK6viFG3VW/0QXXlgyWs0dLRUPk2vJIzmryHAnrVoA2qVp0BUYevstWFMLSau
         //Yhd03btnTI3XHDzEHsLWfJk1jwgMkiiJaJ+mLbIEeM5uV0daq3GiwxzQF/Ed5i1zFs
         hOCChrzFp+8ks1WOEReWTcxNUafPPwDY8oqQFzlerkqS9BAvblpu7r81HAURFDpsG5cc
         Fayg==
X-Forwarded-Encrypted: i=1; AJvYcCW5FisGD99HRFdpHXlCeTVNOwjekFKlQ+m4jnOhbFTFEQWl9x+iOmxEH5RxLcu5+GoRmY3978uppN6N0/Cm@vger.kernel.org
X-Gm-Message-State: AOJu0YzP2YwqJX0ZfFFkUBJyprDK55ZgkyM1tA/r43LcEfKDp5zypioS
	dEPfL8qVdP5qFKsRNSmPYxdjRzw3hiYn5J90Tn5RcjoHJWkIQ6QUK6q+W48vVy5wy9qTD1d90By
	ldP5hnSipcVIvntKE9LHL1jaT6UbsT5XSnHDs2mjH9l8ZwPpbzjqL1T+w09B+ByXSrBko
X-Gm-Gg: AY/fxX7kjyeyOqEDjRsybWHPJQf0yCltFApKcXI+QeBzn1fo6V+ogv1zu9qYAbdsuiO
	PJpGSQYMUqwxHCbdDyDp2OMTMWw9/ISojOuUvzBwRcak/OTez+YS2uLGt9s4rVZ8zwjcrJS6i+3
	5qFWzBzsIuRecSVbko13V3nNZ3VPu0giyozGiCQA7i6YShuZ1ydKhKLkPUm3l2ERlDp5UfDb7cf
	o4T+xOqU4LpZ7hVydGN1GGtQq6Esxpxk2TCG3qgQVkCdo249CqjuIgLWivUziHWlke7rp18GjZR
	hg9uFyhRiymohoEHnKZkDpR71CIE8+TD5XN1mJ+FzG1HUrhA2Zj5Z2CFERIpeZLU633tYjHsdxn
	8XD72seann0LX+3NcHw7BSQ==
X-Received: by 2002:a05:622a:2444:b0:4f1:c5f6:22ad with SMTP id d75a77b69052e-4f1da24ada5mr123993101cf.16.1765801995474;
        Mon, 15 Dec 2025 04:33:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEolfUqhAvxiCbRlZql168UKfAxUzT7uQFWVx2bts3/Oo2pvmASZPEehhVJCf9YXfsm+8YuWQ==
X-Received: by 2002:a05:622a:2444:b0:4f1:c5f6:22ad with SMTP id d75a77b69052e-4f1da24ada5mr123992651cf.16.1765801994844;
        Mon, 15 Dec 2025 04:33:14 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8d9c6fsm186623355e9.11.2025.12.15.04.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 04:33:14 -0800 (PST)
Date: Mon, 15 Dec 2025 14:33:12 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: kaanapali: Add base MTP board
Message-ID: <3a26r7uvvjvhj6cajkt4rmipgp2cgqrpxkqhj6bsu4d5husjlr@yhfvhe6mndor>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
 <20251215-knp-dts-v4-4-1541bebeb89f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-knp-dts-v4-4-1541bebeb89f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ftPRpV4f c=1 sm=1 tr=0 ts=6940000c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rVI_ATdNTQjFCBPYYL8A:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwOCBTYWx0ZWRfX04qaHE5LgMwr
 mFOFshXTmhJjgNkvxfAR5jtNgVD7e+LJeAxWc+bz1GeHRHOpjcS8KN1cM6GuuoxOCdQv5ND3nP9
 32TpjyP/NMlquGYy/mQgdOZ2TdnExut0rpKDaLHd6wNSDj4O3Zg8VuvvPtiBf/ZQ/XgSwbDND/5
 mf9xnfC47V5Ibxgpk7kqT+ME3/JU06q/wA2/Ox5Vq/ezlSk9kq9VJH8hvDD0+yr0r53tmB3qf0j
 YRWbbuB1HWrXWK0pLaQfX3OOxmWUdSHhZUcxj2yyb7d05zigjqM5TAeKDZCbn1jePzaUOeSf0EZ
 MSoHF1ePU0MySnkVSOms0oDmSuCAkIZMeuw4Amw9mBh6Y+TBpUZkQIhgNATLdTu0DLr3be227dv
 5dc80vAeBaU5QYTlF9RVXr9eu4P8gw==
X-Proofpoint-ORIG-GUID: BW-zTE-dG9wvsWGIZP9CgjS9qDVJ14Vc
X-Proofpoint-GUID: BW-zTE-dG9wvsWGIZP9CgjS9qDVJ14Vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150108

On 25-12-15 01:07:24, Jingyi Wang wrote:
> Add initial support for Qualcomm Kaanapali MTP board which enables PCIe,
> SD Card, UFS and booting to shell with UART console.
> 
> Written with help from Jishnu Prakash (added RPMhPD nodes), Nitin Rawat
> (added UFS), Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

