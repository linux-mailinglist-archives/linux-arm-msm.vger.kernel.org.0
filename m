Return-Path: <linux-arm-msm+bounces-90749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEoaF7KneGnVrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:55:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9E393EA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B24893004D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C7A34B43F;
	Tue, 27 Jan 2026 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8ZVhDTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLUqT2X4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6167034AB0B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514926; cv=none; b=XKhVVIPuO5+8kjByFlL90dVfsZubxR04nSoDbISX70/iRRmMrigxHRskxqlrgIsP/AQZ6pWmgGngJNdDThA3GP0Z0BftTOf9qc82bJJg6axYfXbDfm68xnTRu5b1SxntqP+HcZUDGJHdWr8SI5u+yqJbblVT+GOPbOSdj4YoN5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514926; c=relaxed/simple;
	bh=o9v9hHV5L3vmq+RKzllPOVxRj4a7zOG+09H9v/8+dek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E72JiRcK/cHcuEMXkjeyXYzH/+9TdM6VxGRn+2zZg0XyOU6A5k4LpdD2NeIphfENJ6ec4pSNmmtqcxDYQTRSEMicXQU/MYafAwvYfp6/Ss6+1kB3eEFhAxjkWHfd5Ng+Sm4T71z8iWO7Chqxbrl0X8m0bFZv+2OuzwI1Y8n2cnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8ZVhDTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLUqT2X4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R9qZ02171364
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a9Sj7eF8b1E+BkZwjsDmL9S3HQBAEI31EvuBR0bF4wo=; b=i8ZVhDTOXPCYbR/R
	lafK+Mhg89Uinr0/bMU26cFy+TsW7FAbEkmlH0ZA//TRvkjaziIAJ27KZFqgUjzF
	rRRKKFhJbX/jLSXN+Ez0ZJj+1hHDIBpK+Y70vUkTHbkuyOtM6s9wDgbFn5gRvS4i
	tGNn3NOdFg/UyKya0NsGSBs0MHSQIuy0hJemsmAh4QbeQT6uJZeOfnu9a5/OxLIT
	ENAY6iu5AlI9Tc5d9AYs+YCsjLfVr56uA31fuqS2dweNUURScykPjhySAjTCQSUH
	eZOADN6ChSF0zcB/9rORHdK61xNUwEJKJYgMl+RrnD8gI6aSsppbJV1Ooo8wmOKx
	YhFoqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a2p6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:55:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c710279d57so1367785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514923; x=1770119723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9Sj7eF8b1E+BkZwjsDmL9S3HQBAEI31EvuBR0bF4wo=;
        b=CLUqT2X4j8MoI4ElcjYtOsWOTC5MPKiZ/gSgOuoWFJzKtOdsDv2WVlyeuDjOBsr+rB
         +uEdEwMVPM/a8sLtukID9EMDXEINqnNq0gPZAUOWDkopOCrB+3WKKLS8nsN7W8PenWnZ
         +vpk989CJ7wMhmOeBmj1RvPH3SHRMsrEo6bstdKAmVcqwwP1pqvy8ftJUeadSKTXLUKR
         VALU5Oxa1umDpiE83q8KfWekNNELndOMxi/xBt4akuYImLUn7qvzZbU2/B2IJ567Q16+
         6OPLKvCj6KPJ5rqOsf67IF44NiYpbmJZ9HYN+mm3rDcujMtcY8zX/cNDqg2srYCSa1Pg
         UspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514923; x=1770119723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9Sj7eF8b1E+BkZwjsDmL9S3HQBAEI31EvuBR0bF4wo=;
        b=H2uLxNauobQ4u7idnVyCEjCwYB41KHEn+IPDg41Jtys0YxZfo98mcC6IWsHXG8WSV8
         sZ/2F1oo1Bo1xRUVqCahZDsScSS4/mmQAhdCOoAlYnhMqrLSzAvRIT21ArmKK9UbLGtB
         2LCPjKpEdnHBzUf9R6MPCLHDzMtanjYZIDHe7TnEj3evGOi5dzR6P7atXZSv0wdv1gaa
         K76N9shkc6lBormGHg3NnWI7r9PVBwIz0iNz6Bc28MulxzUrb04cSMF8I+GiaIlZMHnL
         uJ0p5pXpLgsjt0MtzVEy1UjAYDEPEmfeO5hl6iqoo70wB6rsSu+s1un3CHVJioo4TVpi
         lxBQ==
X-Gm-Message-State: AOJu0Yzpq1lIorwiKGLJU/H3PXMCN20+qFKy2IvIDtlHEC7z7XdSiyxB
	k0mln5BtdmSIAKN6c+XZUkvNFqtxc0C7U3WHJtouMwBSCiEVc1p6BEmmhww73UhjNEtOCWIC61P
	AOlFBZ+ZTwnek+e9l9h4ck4fHIODRL/2kRP7zJXWxzI3srj9FmMTaPBU6URiZFgSEmOlBLg8fG6
	Ft
X-Gm-Gg: AZuq6aIRFhvECe4mBmcAHLlmXXifvqY8YnkviPPPMQKmLhdrZ8XmnPpkwOQgn+jL9Ss
	CE1dkVYHpgSzMt+Qakj+CgTNTmifafBLi4J0wXUi284axEudECQXqDCX25n3Mm5OMxJI3JjaT+l
	sfRbCuOIHQ0seh8IjdVocClbM+zFsIWTxFbf0kuNEtTpkD+KQMCwmisKniRGdLeg0GRRgWvV7Sn
	ynHEKYGL9v0ieQ0TfEWYcz7fErEh+6eadAPLIVVE9BMbG6Fy2DwDABpRHkWlDoy1Vj8dilKuzd3
	nb/Rv6sAFjO1FuUO/NEEiI/IHgWNM64HDOT4uCiRFTpeVBhotgZHDBHXThtk3zgEVnyz80yRle8
	kOFjcnOxl8h8vAEUhVaPbVGpSHEumMJPeuOOcjf0llUIz58d95zf77WMN22Yya5hPZyo=
X-Received: by 2002:a05:620a:19a3:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c70b9b3ca3mr104160285a.11.1769514923453;
        Tue, 27 Jan 2026 03:55:23 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c70b9b3ca3mr104156885a.11.1769514922939;
        Tue, 27 Jan 2026 03:55:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b418494sm792980166b.21.2026.01.27.03.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:55:22 -0800 (PST)
Message-ID: <d996747e-b727-4116-9124-08a2a8827250@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:55:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: Add Redmi Note 8T
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
 <20260126-xiaomi-willow-v3-7-aad7b106c311@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-xiaomi-willow-v3-7-aad7b106c311@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX5awDGsS+SX4q
 ApsDGV98MFCL7hpr3r70nHm1SlKK/GCWA7FX/MZpyXgL/HSSUgPb8CM8n7rffAdvYbIAoxJjSrR
 GdAV/0TxDODb6Nx3h/8FYV1yJtfucNXpXbWzxJ+6Nd+3wz8Gxi0PfLxy2LO/cUfNQ2pkLBm4TH/
 MeTM1KfbXfNEUboeI3EyrN60LIF9Kg+TYZtDrVHO+1pIAZo2co2D/ar2t9FJ72FgN7qWCXrxBij
 LrMxDbD6nsqGFjksYa7XJ1IK0mGrj0wbw/TcMRX+HGfMMP3UR9J1QUn9GU8KNk9AybRIF0rpYQW
 GDAr8OYl0qSDBoY8xK9MhZwSE9JyU/UFFw0P2tA+6bkRFHLl+WJMczzAAb6+rZ2fFzyYLmCTo3o
 Y2ySLPyG19Tx4ieY8iERNgtApZvmxY/0lvSaqPuupLLuL46QWhAco1N4U0b5q/5uhFuMojcTKvn
 I9kSQMnSIr/ls6ix9jA==
X-Proofpoint-ORIG-GUID: _c7lTzy8GqHMNtbsxo0SvkP978rvfl0G
X-Proofpoint-GUID: _c7lTzy8GqHMNtbsxo0SvkP978rvfl0G
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978a7ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=QCooW88KiTORuWKV444A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.57)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90749-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mainlining.org,kernel.org,disroot.org,intel.com,igalia.com,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,mainlining.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE9E393EA1
X-Rspamd-Action: no action

On 1/26/26 5:34 PM, Barnabás Czémán wrote:
> Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
> the only difference is willow have NFC.
> Make a common base from ginkgo devicetree for both device.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

