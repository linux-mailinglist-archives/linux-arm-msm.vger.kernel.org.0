Return-Path: <linux-arm-msm+bounces-100717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBl+Je1Bymky7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:27:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3847B3582B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AD99301A738
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134FD3AF676;
	Mon, 30 Mar 2026 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSEPAWxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATSOXP8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61BB3ACA64
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862366; cv=none; b=q2HIgjqM7xYLfhRaUDOUFDkzQKYqQHgmlNXMktoGk7jBeIoBCl5Fx2mWElww11ZDWBDzDSFKXUhokv8ishLAkMfjKmQ8maMNP6pLaMuAJ07Hb6cG8kV5sOtqxOav+/f/BARPQ1YhBaiOtpdXlPLeXMLN1xZc06BL2oikYqgDtdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862366; c=relaxed/simple;
	bh=CGMhqz4WMEHh/H0EyNeol4hXDWErazxDGYolq4l4d6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PA1LMUO+OQtr+uM8NiQytoqfEufBgNfFIZb/YKIfmgG/NwSCkB2CDpm7BrkcwfE43TY8YTQHzWRnoBw/1yROmF0pLVZ9xjIqai9Q4uWRP704KVidtJ57G3+IgOEsc5lcaFy6//hw21N1wyT97LdkwEQE0d7prnCZLic4CW1eAYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSEPAWxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATSOXP8a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U48Pc4866310
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dVpq79/2Mp4ZTAXSmIvqoHbQFeBJxMYGu/6xI48YL0=; b=cSEPAWxnxvwpCooG
	r1/J2gx8B6vgVk56R/UVqi8Xjgb1UaDEQzANIrYq0hq8QnFcAQJkrvDgDL206Z29
	SrDrgf241VHKNZf23sv4d5c2BPYmltSSeWp0m9kE0gvZt2JU76dcfLlyHKLvNzz7
	EFajnarq4EESiRHmYgKFXICJGDhD55tLwSQi9nMQs0NFvg8oJkaX7mr91O/CAdm3
	kFhNmkFkzJRIMERJPu99sgkBE04QLjrEhiLNYklE8wg5xmbf7dwhM7KJvn/p84v4
	IUdzpE3cBGNs4LcyssJvVh/tf9+DpPZTDn2WIvioKlRD0im3NdiifbsOsJhJa+Ow
	KZiFhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hdbm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:19:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b32feb719so8182571cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774862363; x=1775467163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dVpq79/2Mp4ZTAXSmIvqoHbQFeBJxMYGu/6xI48YL0=;
        b=ATSOXP8a6yhtj11i1IH+ag3UmNfWsiCRaJhqSis9vQQ7teCjUcgNMBfgEVS1Xq0o2h
         qagv3U+naBeoGmuSVp9T9761hmw1qLbFdlwJWna4Itw1AFFQMRDAkMY9e8vyVHsfDQyj
         VejCk6OFkvj8BDs6ke+lGwfEEKRj2QdUZwB2xPoT0X8H9bHRdtSB2mMk6Fdp5rmGG3ok
         sdUJIBOji/0k3cE5M0ZUDKAbyOemJRSMdmz/xcprrcpPcGuG7RgPYfO0LIqZA1jnY2hR
         zhMJHMmyyiullAp7ZmaIHd1zqCzjz1HudirC9xbCBHXOaETTyHZ7uUiymPa5Hn++bwL0
         C3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862363; x=1775467163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dVpq79/2Mp4ZTAXSmIvqoHbQFeBJxMYGu/6xI48YL0=;
        b=nZ1bh+MMwDGMlcyl1YiLVoK1rExQIjQs5QAdwx/SthoFFNfwx+MZOHCMvrsAzhF8eg
         4BsLv/jMzLJV5lHfCRM5tPT8AnsuAVCULG8jg/i2GCacUyCyFOCLzAOUWxLbVkY3F8tP
         5Hx3DOqF2EvlatlH1PgGyLxzuRAqDGsQ7Bsuq/Nnmn2+nNAjBo2J0HJzfbmYFLeIXr+Z
         keALD++yKW73RCSVBufJyX5GOWXaXExw6ApKweg1zxz/tmn7OCM7g5RodeQ311BDI1E+
         pMopghukNSxo+6gsN97O1BuuFztWdYL5LO21k8hHQgcUqaSptj/rV2m4RY3Fw8K35IvN
         uULQ==
X-Gm-Message-State: AOJu0Yx5E4Iu4tEwMqdV5EJINj2WzGd/T8NxBdL/q/9ddo6tGY8sIZxl
	Uv7mM8U9B5K3hktERNwB36uG0wMMoSMQx+Dt48lTF8CuGeJkbEHV/LsK6UJK+Y7zGrfPq8xHLTA
	K+sYvXlARMWwUJmJ3aOPhLjv9Gv4WS0Z36PR3tYH5Wdj9G0E7/G/Ra+lBxYc3bOEa2GaIgxgTV0
	bz
X-Gm-Gg: ATEYQzyb5Ng13U0ZeIqOikxxx+sEY1StS9dyZo36vMahU4ukzOIqU0HV3PE0JvEbQCa
	C8RXT8vYgub7CXL1C8ihQQvD0OIzYPvefEakaz72fTWUcUMtOz/sia+rsOPMEXYuZ+hXqqwvq26
	x6yHtIz/e2TzpnxaLknVfvwpE/B2RK7fE6+RKM3xBG57WPNOpsEuCVRvtEH4MUq5fUrMWKhGpEh
	ny6O1Xln36gI9kxXuFn3UMi+y0PvJ7M8aHq/wrZ22u6jVNAx7KqG3096P1bS7bduy4D8qV65+n1
	3dd29xpjiDdcUN8gc6z5H/ngCFUQBJiT0mnzUg1b6b+f2BqqG2/F42BTaqaGWFcTaTtcVLTQMaT
	EWxW8AoCR6fJsr1Xv8DKoq67MZ8Iu4eq/KtCPjOwPyObXOhcDJYyrmAoN4/18GAYzByF4iGqJZc
	dqSRo=
X-Received: by 2002:ac8:7d0d:0:b0:509:d76:fe73 with SMTP id d75a77b69052e-50ba3858beamr122747201cf.3.1774862362914;
        Mon, 30 Mar 2026 02:19:22 -0700 (PDT)
X-Received: by 2002:ac8:7d0d:0:b0:509:d76:fe73 with SMTP id d75a77b69052e-50ba3858beamr122746961cf.3.1774862362413;
        Mon, 30 Mar 2026 02:19:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae52295sm263765366b.24.2026.03.30.02.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:19:21 -0700 (PDT)
Message-ID: <c2900de4-6dad-4822-9fd1-57721f7f8f14@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca401c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YTqrmQZhOYAkcZPAGwYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MiBTYWx0ZWRfX2E8lmdFuAKeN
 ZA6lz8/FTK9CkSnXjfhw5R2Nf5vgwj4DkK/+fgBGeOnTTx5YtNd9+wQ8SVwvRHB2udKMwHdkl8m
 jYZ1FkW3ORHwut4VPMJiiyPrWczOZLuYz2e5RKPC4wOWTw6znQ5gMFNAGE9mb8w3U/q8hJ4ez7J
 I3PdKU8t5PsjDiT9sSXovwc8P3ABZg632KODUdkqxddcjCE7HvN94nMzYnjigQfWUzA4P2p6mGW
 45hGss2LQ/cFRRpDrEZ12OxmPvdPQ7RXkPJ3ELTm9uqTGYujJUN2D3mQyYHycAPhppyOtrdg/SI
 BnQfVfiXyzpEVBb3LJnJu5ZTZK5LVMOXnZ4o3ZR6vCVpKNR6RYvNMKgciGlKFOmjsa4NZ8DOEca
 +JoCZF2ZsZytbDqVt6Q7V8Nx4UXPothISHK7cXi2eCBmky1fH+Lk70UJdo7MdovTRVupcqaC3bt
 RLP/sd+WBrLWMsem0EQ==
X-Proofpoint-ORIG-GUID: zYbER3DTofgEsv7btImdEHFHhCs74Xri
X-Proofpoint-GUID: zYbER3DTofgEsv7btImdEHFHhCs74Xri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100717-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3847B3582B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/26 7:52 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali MTP variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index a603f3056d83..38269aebdf03 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -82,6 +82,11 @@ key-volume-up {
>  		};
>  	};
>  
> +	pmih0108_e1_eusb2_repeater {

Huh??

You're creating a new node here - /pmih0108_e1_eusb2_repeater{}

I believe your intent was to override it by label

Konrad

