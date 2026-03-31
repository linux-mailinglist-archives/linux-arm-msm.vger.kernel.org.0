Return-Path: <linux-arm-msm+bounces-100993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBteLPKPy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:12:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D2366C61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4919B302DEB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515D53E557F;
	Tue, 31 Mar 2026 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNPC05Jx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EB0FER6f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159393DCDA4
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948292; cv=none; b=ZUtcnFER1K1Rwc36VjoxyiFGjuqkvNy3ECgVrGqSV1FElNj/6S0M9Tk33icM9SNK1lgOV8HeTmEdXS+oZZkS0Jc26z6mJ/TvWcipakZ8Pr/c0ep86BdmLtpFqd1C8L5RjLV9CHcOO2WCrV94bSAo7WjhhkiRXqCLTyWcvOfglFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948292; c=relaxed/simple;
	bh=796KHNc7Y2BriFksPz8VxoTz55QXqpxFqZkjLa0i4ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjjP1hQzleGBg5aFmlkbRkKK2wwMSOi2e8RoInr2c0JUsE82MhAf6d7vlXGiR+WRq6SfNZsXAYvs+kuYvi8/pZV2aKDglT9HhojMrKgDZa7n9iZgGoiHHqw1tJqxpXcxSJuoeexobBDeL7MYnal5bqzAfnFg5J2P7n0/fsnkem8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNPC05Jx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EB0FER6f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V61pUq2407599
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1CXzUkC/WOYnzlTDQs9LM6hjmmhZDKaeKNdyHXyfQaY=; b=LNPC05Jx5PUahOj6
	QzDRyIgJWaDwgr28qg09blZrU1FD9UgXqPxnNYuDPPt+aUES9tLy4/3fzvHsaoIc
	Q22c2iHUE5LcXT7xJ7r0FgvGQPFZxpZQnBE0DSpbiSSA2BEHv0IaqlMno9geVlOc
	uStEz7iyrWp0f31HxLj+KX/W5B9H6TGt10GqFqXWPOsGYDv1ntMHGS4Bz+ahTEPK
	8BE0me4Q48Ro4C5CNMDosStkUXi3waYDNp38zPJaQaW0QZvwxw0Sy6JH6Zzw6vHQ
	l0hStVmKraJXD3d6YKwW9Ed5yfHAbn16BGsYPyehEtcfRtVihqtikgOvMTahxcII
	UY23fg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80hetb2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:11:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50947db2e97so14834771cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948289; x=1775553089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1CXzUkC/WOYnzlTDQs9LM6hjmmhZDKaeKNdyHXyfQaY=;
        b=EB0FER6f4thgbtpjA0D0Lub7PCcHWADL6IWNAxTX/wDlLwKRMvjlKvqdo5LCvxnCg2
         JTVmYQNaImefKrNDbz3WqvH8d1HseWWn/KDTUhXdKjggzBV8JzM8GU7k7KnMe5nWINeu
         wPxKtJl6Gnr15iV3rk78M/Mvf4PSRXEnoHERaKFMTCkishmXUgKKla3k60FILhdXAa3k
         lqLVRPMwQTq9IobGA77gqHC31xCjUEX5rtG0WRtK1ELyllKJ2dFi1bF11s3UloqW+1CC
         UG/uVhoq2xF4QKFD7UJ2bG3PTUo1CyVKe+us76O5RKNPFI3FclXFPPTlVY6l+6YZGupT
         JdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948289; x=1775553089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CXzUkC/WOYnzlTDQs9LM6hjmmhZDKaeKNdyHXyfQaY=;
        b=Yw3PXaQnR63xuMoth5MaJnk2RsyRSL6dM2AV7/YtqrHBlG+KXNpLqpRRmdIhyTGXaq
         2PdfEnrTIMeZwEnulX5CS2bbY5NxSBvCc7QftvAnr3iuj9rRpyn2xsg4+o30npchc5uE
         7KCPNCZUFDDBP4yYc0r3Oa3l77UndRwl8Zw/3Ss1V0lMwUtI+IWmMtdaCFMYzQBN0uli
         U1wJSopmMWxD2ZrHUrbP1/pMbde7T07wsFbEmxByZvnqVQHdqhk3XRuOy7E/y3nRgzrq
         f7a7yFgwTUik3g2vrqEhJQYZdZLA3+NiYbe58ETUb4YZF08zwzhvBGi6kanZu5ZUcUud
         3gOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV10FARTiEj4DA9V1WUZ/YeyAGwmMEhgyhcFRKkgE4sUzkqmKVRRQa7QTAQFoSTFKlhfwvztQPfjKKCLep4@vger.kernel.org
X-Gm-Message-State: AOJu0YzKNKVez5EvF2tA2iwpmbQwrtTmEvX/bRGmFtZg8Zozt38ciSKJ
	qoSpjMNrvBGmgI685buJUKYI8RFhKl2gOH4SBjjTS+FstJ1cHaJJin+r9A4ShiwUn6Ybs4cWOVo
	ElZAaWgSpEwyyeu0CG0fO2dGcYJbUBFEiNtJRJzElddNO3skfBQRXCZz1e1ipdsCzB7/f
X-Gm-Gg: ATEYQzzLODENS5keI0d7bsjJeIp+zC2KJRmjhs8b2IP8I9CvBDd81RyY+0+x3s2cL1r
	3rzkrdT4MZWtw7wWm+PkeNJlDxPEGYQj7VKmHr3Gf3vP280EoIiYxnwW50A/45UaxB9GOwlivZA
	fujF4QS10BRbe8Chz0WrBantvyocqNwGnsi+dBwcbETI+W4+FgB2URHbIqLT37dJrS/ohSxsx7N
	/BETgSs6ne5wPlHTGYTTpx2yqHiULv7gzGgsQMT+VEjyOeLZUXimvP0Fxn60ASOkCN1zplc6xg9
	fyO9T/xeyCq5A07dlK+o6/A7KlQ0FA4y2lawdish7rL3Ckfr+FFEF26SPgb9zkeE3QvB52w4P+E
	iY3PbifRLbV+F51yqNHuPWa9HqpKEYv5YoU5nzvKSrNPl+5SyyjltEMf+8ZnUA0SgX98RVhWAAi
	a4UGE=
X-Received: by 2002:a05:622a:82:b0:509:38b0:c44b with SMTP id d75a77b69052e-50ba392edd2mr169137221cf.5.1774948289337;
        Tue, 31 Mar 2026 02:11:29 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:509:38b0:c44b with SMTP id d75a77b69052e-50ba392edd2mr169136981cf.5.1774948288865;
        Tue, 31 Mar 2026 02:11:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b2253d4sm389223166b.56.2026.03.31.02.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:11:26 -0700 (PDT)
Message-ID: <3c0d4f4b-e126-4170-9684-e646aa6ceb82@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:11:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Move PCIe devices into soc node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cb8fc1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xfN0tc22g0KGPcRzlJ0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -k0lH1f7YUOb3w17lF0VK6tRxfA7qHqT
X-Proofpoint-ORIG-GUID: -k0lH1f7YUOb3w17lF0VK6tRxfA7qHqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfXw3pWd5H/XTUI
 Hw7DtgzhuJl9Csk8ZhDObKpkaEpX0YjVyKtIHrt18AU2/IdMIfm1Dp81Y5v0iZ93DJW6YNZlmlZ
 UqYR4vvYpFYRzWhHzkJLOwhk81egIx1GmKozc37L+EyYtavmIQ1272uGTf2zGt3QwMMnne2V+fA
 Bn+A/UeodQiJLZE1lQGgKHACcnhxWpSx9eTFQsGZ558kArVmfXq32E87KQJabdEoOdKXDEjT6dX
 aH+4wAA4Z6GV2ouLPMrn3awstuRaFUUSqIp0S7tsPVrmJw3pkA115+FhuEX+1MkF5R+VkeYH7jP
 6mGCV3Fke0NMI125wnhVzOAcjBxdX3gi7NVhHERulIHV1CJceDHSuzkmqJkJAzEZf1YZN+E9IG6
 I8rOUOtKIA+xx237q6hq8/fVcQStjG09/cgPB/g6hZdP3SrzZ//VPfnLTPombJ60MK7MnrSTzdn
 ZP94nCZTo/D6AQCNpxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100993-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F6D2366C61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 11:01 AM, Shawn Guo wrote:
> These PCIe devices with MMIO address should be inside soc node rather
> than outside.
> 
> Fixes: 489f14be0e0a ("arm64: dts: qcom: sa8775p: Add pcie0 and pcie1 nodes")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> This is compile tested only!

I have no idea how this fell through the cracks in the first place

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

