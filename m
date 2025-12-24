Return-Path: <linux-arm-msm+bounces-86533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E7CCDBD53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82C043028D84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F8633343D;
	Wed, 24 Dec 2025 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p66wrAbq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/XeHkW8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23C030E0C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569230; cv=none; b=nTkht+/0MaD1LMakX4otrq2w7CYQeyibBkFan+HHQva50nOlOA+6+lmyDIn9YfA+p6mcSCz2zDYNRQWrWYK2NAOZJmFiill4hHnCj6yETjbwbViC5nMqQAdUQnAX12caSha6D4ZeO3N6f7dbxVmKbCYAZ97Sjcz5uspeCUUtBjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569230; c=relaxed/simple;
	bh=VUNWnVw9H0LhkGkKWLjn2gtjU59fpxnI9WWSNZj7gUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZA/Zo5RbY7IwKlB0TlPjNSKBgL0qngKFg47aMezaEBE4OMBs05ULCU2UApGVjFa0toHBXTozSxqFxnvzGHQZAcRwW8R6cSE9ngCF/vsH+HVF4MdJ5rRbeFJJ5cd5UXv2KXzXW81WePgL9YDI8G0qD+QsiZgb7Z8NLKH5hhrAtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p66wrAbq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/XeHkW8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO527MC1018084
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bRQVHfzN7CrzKyMWpIbORoFD
	gLii2d8HNdpnpnafAhU=; b=p66wrAbqVk5QU8KJlXNdEWriiKxL16SmeLdFF9/7
	CAaj2hySgp6sOKDLd4QKvTC6Tkjjt/Ms4TFJ1MbQ05tCHcGfv6DZ83WsPKUD+rKM
	EN38/rxbjAmq/IOtXI5DINH6o1UHCytGxotsbC84AKMMBS5iBLbmHoUE5yh/6kVe
	Mrnk8gT2r3deewzMASvNKMVQL91bJfBwoCcC4xjza6em5xrw2NhVNA3us/5nue88
	4PM89FT9odm5r7EBXxTdZupbAyUgo0dwrmWztJ88ZkxXZp7PpANhE/7uNMongxoI
	SvmLTPpFQsequ86IfTSzyjLhwkYLjJfII6nCHcwXwCjaow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsag3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:40:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b17194d321so726756585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766569227; x=1767174027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bRQVHfzN7CrzKyMWpIbORoFDgLii2d8HNdpnpnafAhU=;
        b=P/XeHkW87R1WKc7n/4DgNCh8mTy3XO85Uo6irW3Ap2S0hkBoAphdlbOn95hLK2zb51
         hUkwN2r7povFIXKh+41U/6BnCd/lO1VF1QbQn8mC0hc8ANJPvmi7SkQRbsInJHzfNHkk
         plhhX1crxIm1g3CaBdGEjTzX7vAGPCzJoikV+TomAyHYIv6/XS4cYvjcaaCJEaB7Dko1
         zDeHn4rxdTuYQFggddehZQv5rKp11+jKUouRCGs+ALPXdXfWKUZTO9+bGYM5ASqzq2Hf
         MzMdtnAHhZGc5cheUT9/fRfceGS8FwriyRyfoOoT9U0iAiunEZHABVFgDLsJos/nfBPy
         tQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569227; x=1767174027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRQVHfzN7CrzKyMWpIbORoFDgLii2d8HNdpnpnafAhU=;
        b=vFs8phHg745FjsQuPFdKPZkErrjxzYddllt9rtSkVBEsQaX0YGNDwCS/v6xW+y/YLJ
         eG3Yy1ePWqa2dmp1OsyXgI/pLy1eaV4ZSz4FNS0/ZxnFYvCuNJRWi/yh3oXqFDNAtKVt
         KAaI06z+b0SDTBdUL7RPFtyTIcipXoQkrAYy9IX+yxxZwqwswGk7rDvlsZHShE6G1A7F
         8VMGLkTLMpcU/SWd5ZFz6vJ0j5nGwla5gAKKUzCozWhl1h1twC/Auhmq1YfKq3Hf6ozc
         Bt2sSRe152bAtqeBek3TX5PqWYwDT0ELQbPw0uRMiI43u0ZZzL4T2GjOKcl2w5zRFZWE
         8mIA==
X-Forwarded-Encrypted: i=1; AJvYcCXxPZvWk5pXxNPW/nvE5T8qUhrq61DbrWsdD9mc1PiQmejLr2dhkK4I785vXWs8JVPqg9brEkHI+yFGp1cs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4jRFPuQDNrv/nluvO50L1sAGtViqefca39GVUgQuiBuuQjSXS
	1E+E9vLwgjq4SCWUz7ketKJqVdElUSgs9nTmtXNGtMju6O/s/PfWkIYaKCJz55XsOIjmyvO0u/v
	PwK0+iRDYwhViy4GWybHklTxypZhFIpRDZ5/eq6XB2Rnu5JrT71+0MEyRyW9kTWieTo1D
X-Gm-Gg: AY/fxX5qDYWKwFexiS3GBN5yK8YNSHFk/sTlIlflmMFckXih5S34ZUy24ZtVPldOijh
	phGo1kleDTKLVwIjFV6OHsnzbXc/6Fs7Tn7t7hvnceLKhMVW4cwlpUOoLYCMKS9YggABxugBoxt
	mTu3nQqsCh5uDxSvPadQknnkyi9SaDIeZ/qKFJZnr/9ZNSkI8Pn6gihO8E3Kq0kDfAdfpIlvjE7
	kDLGpgRvYYWLxWeY6ugOxqMB5e4zGLuAiHl8JKXWhhepkMHEl+4f13yPdmC3PWqsyvS1/SXobGs
	bJ+djRQYkpYuZ0ocOEfWnTH4nmVSD724YSjEhPVK+RytH6AVwlKGOdigcK5bZwVj1KPB9R0V+3H
	qiLxaoe5tS9xL7o+58DTFhA==
X-Received: by 2002:a05:622a:1927:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f4abbae21fmr256306411cf.0.1766569226890;
        Wed, 24 Dec 2025 01:40:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIjgIFTjjMCgzWvqS0ktmCtdbY70tLlfjNOEUQmmhChSiqgNC2StLDjeOQZTRDtY5Wv7/mnw==
X-Received: by 2002:a05:622a:1927:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f4abbae21fmr256306201cf.0.1766569226374;
        Wed, 24 Dec 2025 01:40:26 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53be0sm16177518a12.2.2025.12.24.01.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:40:25 -0800 (PST)
Date: Wed, 24 Dec 2025 11:40:23 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Use hyphen in node names
Message-ID: <nafboxqpge2egox6hogi72tco427oegk5zn3dhuwkwakvb7nvx@zughp6drnql5>
References: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223152559.155703-5-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223152559.155703-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfX6KvjC+SV1V8t
 g8JI3z9Uy4V3Wlz1n21xj4F0y1RbVc3RRHe2jjVeW2nWrCN9RtdGV9nh2JXoTrSfcfn+BvkF53B
 0HuEF4qhnyZq7rbH6fHzxR07Nn2LyB5gUU7LexsIaQSUFPm8vknvzLa9DKkPnUbaYxyVCix4JBK
 Mu4xbzyZjcrl91XKu3q4Cgz6OwKYBfTq/EmrGjP/oTxCNG6pq8znpyuJmZCZSnMz+by22zg4rCy
 zs1MZPlFeEE4WXrLZNqoJrWiDx4Yz4hFSEcUXGU7d3d/rzM0i9WtfT/w06w0grQJlgU4q+2m8kq
 HHzth7ZnCe6YvQ1iLzJOCC8K+jDeUNsAU0TkfMp78kQv/ezR9G0zcE4Ofiloe+NyKxDapOC2czh
 AOPTb9bkJ3W3TLfNus5tFyE1eWTCIMcgblajo5fYBDDSBvEBpOeVVs9uSrH9GbTF2ROf2W/RVT6
 UUNBWrU4eaKpHO6oOrQ==
X-Proofpoint-ORIG-GUID: eNHryTZvVaW1t99pQeo9Ych0QcSjYEs-
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694bb50b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cxglbGFaQTsLusRpAB8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eNHryTZvVaW1t99pQeo9Ych0QcSjYEs-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240082

On 25-12-23 16:26:01, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

