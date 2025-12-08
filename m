Return-Path: <linux-arm-msm+bounces-84689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8730CCADAF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 17:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCEDD30836D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 16:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F843148A6;
	Mon,  8 Dec 2025 15:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjbFpija";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWy1Lar0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4FF3128D5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 15:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765209346; cv=none; b=C92kUV4u4909kVszhlZAMXsuYBgshMVxdmk5VVhYN/Bv4LHF95/pEEWZ1I3gfkeWOL+nR3GSaLZG7yxPya+KPhHIhfCuAh514L6YzqW3Gs3SnuHnWTkbh96dKvhtu+7bnAFb6cWZl6fnh+xnEZZVPfF17CNRN2OfZUgx98iCk84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765209346; c=relaxed/simple;
	bh=RQN/4tatf4ErZ8pLO23XjqyZj4PbXM7MSnE7vhyG56Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkeCs0r2Sy/LzVSTVMPtF193TfRVchMieow7ghGjbo9gXun/Vt2mkwj3m0N5Xel2TI0JynN8FN2NRrQ5wxcLh3B/sIvcPQ8V5Dr0cIPq3AvIi84EZkVQeauQgQBnvYr2gtAl6BWdFUk5dJhHr23yu97xqzKKUFUpP1nRFf4tnts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjbFpija; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWy1Lar0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8B49QS1130466
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 15:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6biPiaxWOxr5bpESbyi5vBhIVIGuCkM7CMp66XjLR0o=; b=DjbFpijaO15jtl1v
	FUk/XKe1uica1RuwtX/PsnGPBGm9CVXlVdR8kYchp0HIBcbG2owdrbvQALxyBPDc
	sZJ1fkCfylFGWO2pFjKsu59Wdxd4WTydjIL0SOcn9wPO/XuQ7SAJ8GmqcGhzKOSN
	ILShmoOWLg6QN9rqfcyoTZZzWK3aCbAT0ZJ0C/OSDfBkDqqGewnBMpu1cfqhrtWz
	q1sEoDYjMDtLDzrbMGJGWTwFVw0xcnpeG5vsbqx0UVY3+yrZ9zXAk2HPruezae8y
	Z+XKzHwFD9kT0u/QDwoNgwdm4d9WiRXMY/OCeMgW2ey5PYIvcpbxSCOog9Js8hFz
	cvliPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwfr8tvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 15:55:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b10c2ea0b5so149306585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 07:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765209341; x=1765814141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6biPiaxWOxr5bpESbyi5vBhIVIGuCkM7CMp66XjLR0o=;
        b=YWy1Lar05IFHqS2vvhKFlxHiRq96QcczFeQ+n7eoYrKN0AmWuBn2g9A7u0ASQB7vEL
         kGioxVzO7Dq3iLw/KJul/XZc+FbAkmrgirSkoH2V5REazAEcU1/R2qHgd4l/hunwPxVP
         96V0sYOkxHBRn2yEzJR4NoqQTFS2XuJMAdOF99TBCY1nuv5AHBhHoZimflj2iwgUMEz6
         0RIDzF6OboVr9BqsMGe8OGzUQO8mzoCW0BhhwCh4ykBbIH4nDYytoFYwkbaNule15Gyx
         GDpSfMeAgncP4GNdCC7oohRr5Cjski1Z1U3b+COhWvv7NQOTRqyWJWrQqqvaUKYgkJOh
         5aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765209341; x=1765814141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6biPiaxWOxr5bpESbyi5vBhIVIGuCkM7CMp66XjLR0o=;
        b=mhdiMMNcmCETNJRNXnpPtZdJpLhjz97ECJppggUY+nHhuEohWwhnF+zwkIb/VbBvEJ
         Rlw+IKnzRV232tcVcov6rMj6ue7s25nBmC+M1WYm2xD4F2CgT2K0VeGwUozjLfob/mjT
         ASM5yPgMfycWYRLnslYqP6kdsud3vOPz6yEYxu7N4FwiFDxxhEIIVnjz1+BW7j4Y3or2
         WVliHWDMZm9rv+2bA/dbaTdeZcAHf4IvtJ5xDMCcNuBq5tX69Fbp3sDnAg0rWfM2K6C/
         M8YWjGhwOeOYTfLSsWgXbgu9NS/tI//HjqsjobdYfptcwj25zXUOXCmT87gJ1TIq8evx
         OrZg==
X-Gm-Message-State: AOJu0Yw1cLIp3PmLwDzz7UOdoOmIxhZbVi/rNj4YILaLROcnnII6lLyc
	mxiEI6nHthd8MkoPoCll6z7q2TjgbGWjFzjOFu8GGWP423x+PH41NHoSWRB9o00GH0gsDE2fPRA
	rvKZqYFSpSK289fYsELr/U0gcdmzttV/zsqTsUkeAwkQriIP+XJbbxnlJ5juZDBEmTqlM
X-Gm-Gg: ASbGncuhFna8ceX71fx0KFWxWaKDPqmtgFHcV9anYi02ud+MEQiAGJ8NKzcWOma/81T
	nkXP9ProIkULBVJJ+tq7BU+NLmJ3tw/ZRVxe6Hqq0jEu9NRNiJZHiHjNBAWEJNb4XnE7fcVqMvs
	7x0rNsLK1vUhQ6/EB28PtwvnABkdKsjs/+jILVIdtLWCTr+EMOxnwhjLWS9RSAAQWVJMMCRn43w
	pcyU6CWU08KCdEYq/NRTXGs3Um5D4cUFdFEFqCh02C3Rjbv0RA1AOTEJ8v1lMvp8KLjSEr/v53/
	Rwp407VAXnSAJ5qfYdsUH/M2Zi9EVyRRDjDa0yGgefzBZgzxILsRKQxH+Kb4QzNUHzfxnPlGEqT
	G0NmGQNQ+D/xIsUNSrR1mF/k4AJnyjkCeR6qKcIajr617BstQyQ1bL8MOTiR2eBfPlA==
X-Received: by 2002:ac8:5755:0:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4f03feb815cmr87807891cf.6.1765209340797;
        Mon, 08 Dec 2025 07:55:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1ra8DQNX9453soIglDJlASVNAarFnHTUAOnla/eKMlltE5IlkN2d/Qxgt6J+gAELWJPTZ/Q==
X-Received: by 2002:ac8:5755:0:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4f03feb815cmr87807561cf.6.1765209340431;
        Mon, 08 Dec 2025 07:55:40 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b368dcf8sm11516494a12.19.2025.12.08.07.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 07:55:39 -0800 (PST)
Message-ID: <5ddf6a43-da41-4720-a41c-1990fdb90a7e@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 16:55:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e80100: Add crypto engine
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>
References: <20251208-crypto_dt_node_x1e80100-v4-1-f5d03bb2c501@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251208-crypto_dt_node_x1e80100-v4-1-f5d03bb2c501@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEzNSBTYWx0ZWRfX9Rdx1jrINYHa
 m6FUllgeN3OzKU/+0CQWKI0ayihHYH7sjl3OATvUnHbhDkM0EZ8bBoFnze1VWPglw7VJB+PCu6p
 3GvNMJIXzLAzp1dLL0QMnuwtIdFK+fCyps16k2CkHjCdNyDN+UKJYtzuYj8f03nw/3/ho8HvPQu
 5RmgFRM4NRnv7XkNEOO4S1LNFqa+X2uGDGxoT2BCTZqjQpwzLedT5D+jccUOmnflH6lRik4ZvVI
 A8Y196XH/XPbHADTF94i7CAJOvTdvjMTMhxitYLgVT4ehYYksuurXsgCAxMpTYvNwl4BJSDZfNN
 WeH6iqfgK0j6KZeXhlhi7lgULqJ34yJqoJFIsniE+5Qhae5FhffASY8c+J1nIC9j1FiXtgT+AqL
 hxyM4PaQeTrYe/i+8NZTzq9ZyM+5aA==
X-Proofpoint-ORIG-GUID: MsKSWBm-dJ9JoK_iR0nO22UaoQ9gzFao
X-Proofpoint-GUID: MsKSWBm-dJ9JoK_iR0nO22UaoQ9gzFao
X-Authority-Analysis: v=2.4 cv=fsXRpV4f c=1 sm=1 tr=0 ts=6936f4fe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=fLcEx35aZHfAyDpaXisA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080135

On 12/8/25 1:32 PM, Harshal Dev wrote:
> On X Elite, there is a crypto engine IP block similar to ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
> The dt-binding schema update for the x1e80100 compatible is here
> (already merged):
>     
> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
> ---
> Changes in v4:
> - Updated iommu property to use 0x0 instead of 0x0000 in last cell.
> - Updated dma-names property by listing one dma channel name per line.
> - Use QCOM_ICC_TAG_ALWAYS symbol instead of 0 in the interconnects property.
> - Link to v3: https://lore.kernel.org/r/20251127-crypto_dt_node_x1e80100-v3-1-29722003fe83@oss.qualcomm.com
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


