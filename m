Return-Path: <linux-arm-msm+bounces-88236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A486CD08314
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AC48308791C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A6D3590D0;
	Fri,  9 Jan 2026 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpsAyHRm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWQfTt9t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634D316192
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950789; cv=none; b=F7CJfkiWQ1grjHDrxdlRS8Xa7yBCoMdrF7iBwVgiJYUimC/KhoMfj6L6IGTVN/qOvzeDUawnyLBHAlCmiJV3v5Vcfc3VL9hseiaiz5rh62lA3IudoiQqsvwlUUVFOiRKFufo5ainWLe4lGBC7XQx9C39jI8zg9xqmFj0zOUGC0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950789; c=relaxed/simple;
	bh=n/TG8MO6HyiL8J/XwIVaNqLz0iR+l4eo3PBvnTrhxes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qW4MrMnKJsdriA6nu+mg1b0QIvgNZu5X6OEGQCRif/kJvxDk3zLwC3kRc3bcMtqgjzirGN3hTWK+EcesDaW6iLn82IM+lXUBhWQuzhu34l35lElmEv/96q2l3eWSNfwdgfoXrPwXAc15SvmBpRY6hhi7oUWT1A4YzaXa9yxWunQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpsAyHRm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWQfTt9t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60952d4j3541993
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GYupHi9hiffcOrLcYrkERu+8
	TOtiFQWC8OIKZvLgLzU=; b=EpsAyHRml+EeiIqmsgWAs1OxeWytrrAwHkyIGuzN
	U+Zof37ZEcsxtVOWMxe9ZKs8K7IJ3PrM2u9EB/7DvB+xLXzf0C899TV4+w6nSlc1
	Iq5ApL4+rMhIfxaaKPA1mkhNtcRWIK2HoZiIBx+DJ1P5316AZ2UH7TumeNXjcSP5
	LSDyknWvrkNmjR+QP+BGekArlurHYAYOnT8lJi5H3opn1BMhPU4Q6zHrFdLxLtZG
	xCyVOIopHdgP740bHRyYtm5/yFHZwXup46cDy2OWshKhmc/KGBbBfoKZ0l+DBX1z
	/4Lo/KkUOCYboSPcpXmFRM8kOMkHOvYxgvcbA3vUUC28KQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b0qms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:26:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c2a3a614b5so816494085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950785; x=1768555585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYupHi9hiffcOrLcYrkERu+8TOtiFQWC8OIKZvLgLzU=;
        b=IWQfTt9thRjXPzU1wuxnzTKhoBOpga1zlOFQ7BOSYhav6n9Y5OVu1OR3O6VI6WAekj
         Hlkiu7dWgrpIHF6fygrw9Ch4Dl5pLtR75G9IH+0baowb7fY6wp05fQKANf5ubuiNk2MR
         sy22V1TJ9X2BP7Q+64SGnFtepVAs0Cpv1q51Z2mgizKq52HRctNdiM51W/3GyjQZaPWI
         Dk3xe0vFSvv785h27ZrzUJHtnDMd4J0sHUWxba4+pWdD4G2rv/rCUoMWFQtWQwK+vAZg
         spExXdyjWWqT028IrHrx3BGk89DZVjJx4r2BP1oh/+LR5wSoLQGzgH94L3zflvuvt5PF
         3s4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950785; x=1768555585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYupHi9hiffcOrLcYrkERu+8TOtiFQWC8OIKZvLgLzU=;
        b=grJGtNn4qDE19ymly6JF53+PWEHHyzl6aUzEQ8If1YNwB+uiRKxwFLY7rf+uOLeKc0
         iu5Bj/Wg3Q77xfptdqbUhdgBJsYS950iBFDm5ksPqfMxMGztF1yNdCImaHnqjnNlCWFC
         7yZA6NLkjavshvPiNJajC+HDSAnAmA+0Ea8/2g7JFIKtPLluZq6e3vxGsN1XCRgRz1J1
         BTGg7D7ex52PHzuk5sHd2WVJ2MQk/IlhO+i8bm5qhxi/HEYKryWE63VQ2WBRX33ku0fB
         +TFO9OcgAXIrVoAmvdwaToZanUxoEFBHz1DDLRCuOxT5XQAEty39ZRt+Fy5rtDvXNMre
         wuRw==
X-Forwarded-Encrypted: i=1; AJvYcCXCIkdacYPIz1Pr2AwWkaEYzTT2MbELJRYPXhtl6DswxiwkYAH6FbwJJMIC/I0QQCnLrwSVrp5BQ7VVHit0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8YA/OGROC6rcRQjikRRXFsX3PiLdpJoM7SPgZeyHxwQ8wWYfG
	st7+AuAMj/kxubdCjjEZj+zVY7rmJ8vqan4eT+nZoNKFyP1kbKWA/nsW7ZCiYrnRCqicM8zzBo9
	o+g1FUgW/grj4UGfyk1Paq0n28w1jO0Jj7+xrahVEDHtamgmWlY/mXAj5tP2mBKgDP0EY
X-Gm-Gg: AY/fxX6OCBXMxuGKxXahwENN7k66bbB8yquh3NoXKDpPaF3ImnZxNo1NpSoetN9VTN7
	p62OBseqbbQNI9zHTgkoc5ZFhPjrhDH/lKcWNMKbHoubJj4R/cwHAVyatRisjxUv0TXcZGcozOb
	xv8NL5q/4k5B/b0ao/OuQUvo3HicfMupbArUqEZyWahKKPXCqlPg4vIJRrQcry9i1H+ZwBANP3F
	D40VgQk5LB7j9NVyK43zmgsgZZUdtptAtT32NCTV3x9gxfUB894m0MaqxP295Bk37YsOHKF/GEb
	FF/lrvVQ0w+8qrINhzznP1GVC2jeoYBYfwHiP80A/Xk3+xiDjXOlQKiRQ+hIQC9eX+POkvZPejC
	/QmQ7lzlLk9MGHnnT4S1K
X-Received: by 2002:a05:620a:28cd:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8c37f4c2b5bmr1694840485a.6.1767950785248;
        Fri, 09 Jan 2026 01:26:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqk8xaUlwvb+pLU9tqMNDnyTuej2+CgVW+rsndOdKz4BuiVC9qsdOjh+vh+cFbcIpNWeJ2+A==
X-Received: by 2002:a05:620a:28cd:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8c37f4c2b5bmr1694837185a.6.1767950784625;
        Fri, 09 Jan 2026 01:26:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8719e695sm56927835e9.17.2026.01.09.01.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:26:23 -0800 (PST)
Date: Fri, 9 Jan 2026 11:26:21 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 4/6] phy: qcom-qmp-ufs: Add Milos support
Message-ID: <5g7g2l4x4ocpw3hx3pkgdwrboicxnih37zxvvbfdrp5hw7jwai@3ybokrxepo5t>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-4-6982ab20d0ac@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-milos-ufs-v1-4-6982ab20d0ac@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX1Yi5pCIIWEmG
 3cqx/o1vZWpTjv8gBNIWT8J/3TO1urxRDXP3/ae5uOarr+oe6w9kPy9DA4UHr+Vi5aYyg+C4lh1
 AT3HkGGrLwi8kQZC9IkGYwB5SrYlB1q8gnkzPhZjVVGuoyv5X19D35BdJiMkz7EZq/Ec4iIl07Z
 FIR2BXlKp7/Fi2nduFjaR/V9nJZBJXrfpIjdqdVvE1EdN17gILqXHwMCdSzZ+snH8MidPGcFIgw
 94Qq4GWagbK/Nfht3Cvr/uReIepVVjlQ+f/z8bICt2l7S6VlEw66U9g2XASpXtDa3NnUoaK7sX4
 bVBWBaN2nH57v7SoNjclu+vJxZFsTQautx3J/peKq9BxjyzTZEEt+cWwVkaJlAl6XQ+PphIouNV
 Iy1qFdhRqFdVv8rl02yFeMafQ1ORZGXPb54iY9v8H6LBhcjVzD0+MNedt0FEVX/K6Y4H5rePTtF
 Sa/5eANIvLYMK3hmChQ==
X-Proofpoint-ORIG-GUID: YN-Xofz34Fuz5Ok1WBaXg3vebksUCUuy
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=6960c9c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10 a=AYr37p2UDEkA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: YN-Xofz34Fuz5Ok1WBaXg3vebksUCUuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065

On 26-01-07 09:05:54, Luca Weiss wrote:
> Add the init sequence tables and config for the UFS QMP phy found in the
> Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

