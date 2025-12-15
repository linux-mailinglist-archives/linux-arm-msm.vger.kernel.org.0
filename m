Return-Path: <linux-arm-msm+bounces-85270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD5CBFA1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 21:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AA9D301CE61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06194332EA8;
	Mon, 15 Dec 2025 19:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLzHNpU2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIN4/w60"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2162233C1A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765826971; cv=none; b=dvG0Tvymb8yR1JX4snbb/mOKS8sUAwKzB/qFYNQfq2XJiGHNvs1N0KDnSn3qDGXhJsnr+45ceAKzozi6lTpXRLJ1UAfb9ZPZx4cLHh44dz3aYe2TEWQmFndSDOOmqB8/pN5Svpc9F0CycXoB3TZ6eIQp3J0PyHYLZTr2S7RU4CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765826971; c=relaxed/simple;
	bh=wztAsnyzNkKB/8QcN0F4nl4t6Cb8hkK3Mj3ggF3tYPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWfmsyR5Yd06X0IpJvAn4jj7jqqOF2gPNmz//eVkY3wO7hCRGcmZ3l6VBTQZeXfDJLOzditCwXXFOZZjr65z9BH1Ccz+94BPxiAUN1VNKPhNBjBjWg1yyLlZjFi1Ajrtn8EmA4/R/gUpgLzez1u5XJkTu1F0Yx+Kcd89qW4Zbsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLzHNpU2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIN4/w60; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFBSkNl189259
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/hosArq0+s/NDaQwSKgPN+W6
	lq3BmCe22Y/GBR8QRbA=; b=VLzHNpU2fAwgRR3J8pky5rZGb72kIw4+IIf2LR0+
	WCbsF+uRJmFrq7wQBqk4TBxKWxhMx7Polw4tW1vTg8f9AkRpCTwDtuqoWVkKju68
	OPfMUvA5cHObGV3Bdge8G/cbsnupqzm8yogzK29yRVgOowDghn/Cw4UxiceycAz2
	BC9Cc4GRw8SvFUhQlL86DP7JFn4FeYELayw5f1wvjJG2GVQc7NT/1cHAsAKg4AsV
	voPJOcaAMBUB2x5+FJ3wR/fOZUAqlpArnVe0g8z6Rse0+08cqrfSHk+SAjRpe/ha
	efmHCSatjlBqQIM2y6A5FEGQYfMDfWbRW33o2+QnofiEOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2hgasccb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:29:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so1283338185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765826968; x=1766431768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hosArq0+s/NDaQwSKgPN+W6lq3BmCe22Y/GBR8QRbA=;
        b=RIN4/w60bQD+IbaW2Cl+FCcIPWsn9enkSNOCq5wJ8E8BprQ+S4R8EroR1pihiL2iOj
         HmWZFc/oO6GfjNcgRU/E8dCtZt8gkIflnkiCTAiwvhmnuDC3J5tv0lsyDkAGCnSlvkaM
         ho9ttTmmTgSCj5E7OaiITi7YQArRvuanQSl5OJbbXdchQn1kskuXcjNLMwlavBAZyij+
         kuB0Q8cYHNDyeGu6t/REwKWCM3ufD//VX9y+IVr99YUkxiqMUpWty7VLF2Xl2ox6yvSJ
         ncRvvMCCqnbl5d9ifZSsQWVjjZm7fjnQxj8sORMoTVH4eXiju/cio3oguKbg3srwLCIu
         yOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765826968; x=1766431768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hosArq0+s/NDaQwSKgPN+W6lq3BmCe22Y/GBR8QRbA=;
        b=X15JD0jL84ukhBw71cL6No59fqqvNf8r9dnguXrSkSVH/4gYriu618+fXJUFtXfE/J
         IxGSbqzKcmOs9fJrbf/dWRRE5jmsD7n3OBhp7rTTZqLWjlOt7g+A2ui67hE1kGC84h9o
         vY/KAEJqUyryNqzFMA+Fre0eWapY/JOsZgBupEPxX6daac+pBySTFHk0iRycdIPChXhl
         PPPZLBiakHrYK/IepgXvxda9oPBL36wLBBC3nMcrvVEJAt15uL576P8EaxJ0CkEQPR0U
         ZGpZ2TYkWOyncAkVs7czlZhX9O8mczlaYjaETki9wRkf53UQrsnujHhjhjUaDAep3bCz
         1EhA==
X-Forwarded-Encrypted: i=1; AJvYcCXaKiKOGYQBYSpd0T0xvGTvqIS2ruXzJ1NQ1dQvfHnCuaIMIlX/aHqy2Uy5BqwIibi2LVe7Sei8wMcTR+h7@vger.kernel.org
X-Gm-Message-State: AOJu0YyoRxH6BB315zmzAhPpPPyYTGb+dg1z3yRfROwXfACcy8XNQl2P
	78ewKlgcf1sEgLMibZ7Cb5gdcjBKfxHMrEt8F8U+uSv91yfjdA2tQlf7KCXOb+n2YgWt2My+F8Z
	k4zCgXW5g7SnCFE6eJbRzwD86coAI5gNr3a40y/HzQTwpBd/qxOJu5WfVdtH0T5A8+M/I
X-Gm-Gg: AY/fxX7LCv+kdtPkZJq5/LAuKlXGiIqm6ST7YW1/IxM6byiVePnVfTytj9IvMCa6Hx9
	lJCBkeURfKYyNhPE3iPxnDbDwLvrgF28+focwpavCL/ODjBz5QN/ToQ95mXb1pl/lxPE/ohfkWx
	sX3j4YlUJK2AEzZ4KajhknSd9HvAFkof9/mzvaTeOak89GHcq+M0LpAmCNl/IkjxlC9OUH7NzmZ
	e2khM4uMJOUjWuBEdEkkMNKIdkkm2HwJql2PBaI0F3Szym+3dW5rK5hVGQ+rBN0fqdIIDfq2K+Q
	5UsXiPtGlUL5tJNeTf4YWyI4lnShFqaglPuW3f69heDxA/Ci4gywbR9yzYrjF1hTbDms8S3Sd0+
	Neaz2XFWJb4W8bfPYVNTBC7Qcz5aeAZqe+4x/8BJOK0VoyGfJeUG1+gMtCNcI75dUpOKhVa2lLY
	PhMF5FuyxKYlOSroAE6y1xpc4=
X-Received: by 2002:a05:620a:4707:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8bb39dc3ecemr1778537885a.29.1765826968249;
        Mon, 15 Dec 2025 11:29:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9ULv8Wr6if+oKpDJxIdczwgANEVhGYhMVVZC45WNjehcGVsIem3udGpwIwFm7P4Cc1yoybg==
X-Received: by 2002:a05:620a:4707:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8bb39dc3ecemr1778534685a.29.1765826967805;
        Mon, 15 Dec 2025 11:29:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdebe5401sm31551671fa.4.2025.12.15.11.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:29:27 -0800 (PST)
Date: Mon, 15 Dec 2025 21:29:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: Introduce Kaanapali SoC
Message-ID: <np4txll5unbelh25p45abitemtas52rvvdczenxaoj4errxwql@6u2otevdsl4c>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
 <20251215-knp-dts-v4-3-1541bebeb89f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-knp-dts-v4-3-1541bebeb89f@oss.qualcomm.com>
X-Proofpoint-GUID: RaoLQE8fQM8DmSI1_m_NIm-66Ti0V8dO
X-Proofpoint-ORIG-GUID: RaoLQE8fQM8DmSI1_m_NIm-66Ti0V8dO
X-Authority-Analysis: v=2.4 cv=GpxPO01C c=1 sm=1 tr=0 ts=69406198 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8NlrwkMwniVS5tDy--IA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE2OSBTYWx0ZWRfX5lBuzfLVBGtu
 Vmd0Zk0G31far3PLTwAHtWUUaDnOH2w0QaLN89YWuY4QFQBkptH243GNJJ6fbeFv+q48GQzlCE+
 NIZxDszgkbtmspIMKsjFaUOyyJNpiW/7t/KlKkFfEceRGfANiWa0uQ1Cq9AbE/W36y9x27maCxO
 PJoplpSqswe8etyi5fY20VxIbFfra4haMYtrDPpn95fkjSOwrIXbcRmlzUhUY3PQIuXXnB7p8Qt
 m0yP0wxrYeSkgmf+BQIli3/h2HNDanNOmgo+Vhx4WRG6wvg6byIWZE8Bp1AiGIf/8oeUr3xYRlr
 jMAwUitGFuxb5PyBtZ0Zp3Qy8GUSW7mFNZYOk1FUpR6OFff36mZ4kABfNfAL9H27hDrXJqS6gZ4
 PegAZ85dB2jY1LGP1VKMfaXsBC6S9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150169

On Mon, Dec 15, 2025 at 01:07:23AM -0800, Jingyi Wang wrote:
> Kaanapali is Snapdragon SoC from Qualcomm.
> 
> Features added in this patch:
> - CPUs with PSCI idle states and cpufreq
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect with CPU BWMONs
> - QuP with UART
> - SMMU
> - RPMhPD
> - UFS with Inline Crypto Engine
> - LLCC
> - Watchdog
> - SD Card
> - PCIe
> 
> Written with help from Raviteja Laggyshetty (added interconnect nodes),
> Taniya Das (added Clock Controllers and cpufreq), Jishnu Prakash
> (added RPMhPD), Nitin Rawat (added UFS), Gaurav Kashyap (added ICE),
> Manish Pandey (added SD Card) and Qiang Yu (added PCIe).
> 
> Co-developed-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Tengfei Fan <tengfei.fan@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1606 +++++++++++++++++++++++++++++++
>  1 file changed, 1606 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

