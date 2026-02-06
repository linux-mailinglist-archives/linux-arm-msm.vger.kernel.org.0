Return-Path: <linux-arm-msm+bounces-91994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDhlMF2whWkRFAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:11:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A32FBDDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B6D4300DCC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 09:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09A13570D4;
	Fri,  6 Feb 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnK/xRoe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hflRHzkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D433563F3
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369108; cv=none; b=G5fb6xj68re9+l3ni6qmXSZvC0qsdVJpm55hkQrq7FSg/HMAWDOqA0OCPsamwgUCiipkSBuxvFk0S9AsVwqeLeQRihpv3AHukPVEwEwiWXisKC6P+2Djyn5pUWg23xpNRz9cYYHqB8ODAMeym2fNueqdbUQXdp6QchQCQmWvWbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369108; c=relaxed/simple;
	bh=Qobkgstg4jim6MxKUCBWoLcPEdL4TRW+k82sMjr58q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4S7JnyYZHWTWt60SmqS1RAoXAACpd9yEWKA1KvGaIBrbL8l/RSZVddCQjTmPZAvCKtgAoR9yKtVBht79neG7+ecpUybuFfppCV9HUxWyysTc99FpvCrSqUXLExtH74ilLglFlBTTX0aisGXKM9ETpRB1o+VgyZ7ls70s8MEvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnK/xRoe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hflRHzkw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168UhwH695036
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 09:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUdof4el6Kjt7r5sJvWGFwX65pxh28RZD7+N5QBc63U=; b=KnK/xRoeUmimaCWY
	Tj2/G9t02amF/qfZxVEs7UC8tOws+hrG52AT8vOp5vRUEtnlyAETm90HtCCo1Fc4
	fqQsVEdIMrqWB+7BWIj425kTG+PKgvHtN5lgZ2DtWRb9KuMHpaQOO+jl223HAkWL
	eX8smBsWg+UNNmue9JarEnllync+fD2wWjc7RE2lemrMpN9wrvhnObasZEByfAII
	nr0/pkxXuERcxYGwhrXP6AccsV0yFqetCCyNAUiW4V4gfRmmotLcbydOOkxZQ72e
	D69Jzhb0KLrF+pBRVn6QmD+ESNojSnTj/CDRMuiQLn0rNQKhb6bN2oUHdWbZ07Ng
	xaF+kg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c53qv9vjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:11:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3952cbb9so78388085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 01:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770369107; x=1770973907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUdof4el6Kjt7r5sJvWGFwX65pxh28RZD7+N5QBc63U=;
        b=hflRHzkwEQF4dGumB1VkM7gY45NwNpYwdVS7vG72jdMNJAZ8QWFOGinl1SbCjuliDH
         m+FMRMHjg4UPstxrjOTeRFRi6amMVWYZ/sADjO9a55i7T4lxr+HGzssOmKHK9EGbMoso
         g1muLBMBjrnZa54YnybO/8ncle1CY9nC5/TI+k4PPDWPe03qrGuS+CcGu66vK9vMKzp/
         bqB78wpBKhNIPFTKJ2W6o8JawT7EqUmwEbrb7joe0JOuY00IGJ8z1FDxxW/d410uZl6Z
         Kq9B1j5jVvUGSQN8BZebJ+c6NAwUphWWwpK7jQEvI20nGqzP2nEJa3vuwulNgLcTbh04
         l/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770369107; x=1770973907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUdof4el6Kjt7r5sJvWGFwX65pxh28RZD7+N5QBc63U=;
        b=ZbiTbPtVh59kE00gRq76EeIE72ZlNVzb/YwmsWQVEkdGf8xnzXhTipDzrbPpEmdgZg
         XQ2K9tRB/AK0jg2692oJnt1WNVNdsRyKO2s2Guq/DPn4GRU0gMP78IoNCPwht6o6bXRd
         NSpuNpUHLO6BUVcb3ILsoICmoqhzbtXE2YYHwKCVKhpk3adj024Dxzhdw+we1vJ+wp6K
         cdE1l9ejNVIM8I1/jTdRxe0JhbZFdx4KgENkolf2edO1Ld/QYBl0WyBUMLFWb+Cijm3y
         sagT2H4Lv4PN6NF3jSkEk4zSEBL7WHr33DNpnx4bLoua57vEbUOifr8imF4dy9zw9wRC
         Gveg==
X-Forwarded-Encrypted: i=1; AJvYcCWnwaOKSFESmuxBSrJs8dFr0qXYXrbIY6iM75n4mlaU7G+oedVQTKD6/Snz86Ghi0tIRUFYfMsoehWkGHlc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe2vGDns7WP6LWtEY0OHzf0WjAxilDCo7eWOUBt7EgkfPqD4RT
	JCWgGKq/mOhlJ3IQUEafY2J/6xKMtS01i0PB0rD2/Hc8EEoq4Ndh7OwYG5sM2a8V0wm8rpdit+d
	BhDcc7sKUpDAdeHL+tlHBvaSvo6zG6NLgDh5+h73/E1eSvJzFIM5gxTeJ9E+vjpbT9nP/
X-Gm-Gg: AZuq6aIcHN+gfuT+356AYo82CzfXuN5vplibzUisAGgPUw4nhoUoUdXp57RzMHY2HdQ
	bZoiQmJOlvvcXJQCBbI8vZQxtAohatyJy6eAd4+G7wmJ5woRTBRXCJTWGcRZVbekIbkJ4FvQlU/
	s0wJLbO5P+oFLx3pKKPpUPSTCFsAHAMM7+QEWjPmmNCNtUQHIc0wgKrjuk3vO+efvP238sHO3+z
	GGFNjMUzv7tQzukJ+qliecr5IBZNNB+j6Fv2Xp8QtOY4D6cJgsG6C7cKT5Cl4y0ueSmEEgz6XJy
	mMzRlPkIPQkXAR7nNr5+eBs9LZSW7C4JDjqESUAAcWs/+yFCTphJwaBUw3Wn34sSGyiKtF/aal6
	67IgdtGOh/QQmVGhGsCYaBM3nUKJP5h+wCAfITl6osbSbBlKGoawQirb2jqQzs6MagKE=
X-Received: by 2002:a05:620a:29ca:b0:8c7:1156:efe9 with SMTP id af79cd13be357-8caf17e40e2mr175878285a.11.1770369106760;
        Fri, 06 Feb 2026 01:11:46 -0800 (PST)
X-Received: by 2002:a05:620a:29ca:b0:8c7:1156:efe9 with SMTP id af79cd13be357-8caf17e40e2mr175877085a.11.1770369106273;
        Fri, 06 Feb 2026 01:11:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a3004sm67451466b.15.2026.02.06.01.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:11:45 -0800 (PST)
Message-ID: <c1a9aec2-0389-4a24-bc28-75be04cc91d8@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 10:11:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TsPrRTXh c=1 sm=1 tr=0 ts=6985b053 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=eb200YweA7kxUedDXicA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NRPCOfJ_QDxvF4NNQkV__7TrhrVkV31l
X-Proofpoint-GUID: NRPCOfJ_QDxvF4NNQkV__7TrhrVkV31l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2MCBTYWx0ZWRfX3Iob7aDC2tO7
 yuGlfA8mcYqno0/CsKgb2ET3uLDYwbFJ+tAFUPMpi0kYi5+d0Tq2XjJX9KP6feSeJyVFB+MTfp0
 F20cVd3Hlat9HFcNlgca/Xa2ODTIh3IOZZD7MjW/hL3oD3/3IjkH4EDj9gIYVDRS2DwncVKbFas
 42lWPmvJ1vsN/36Zc5Qa66y2bsN8f8ElBs0UanKjaXLXsYKV2rAFOvdR65dadze6mnAiFWCSjMI
 +98pCNHXUJ2kMBD/wIsMV/Njdxsz8F0YTHBUEkptNTJzLLwBywTOj6byGv5tPFBB/BKjrB3foQO
 IMzS3gzIxHR4hW0GJv9Omg+hFjLCFce4xG/Ce2DZgLaiHHBAWBHrYCWPj4wJjKSLaeAOG4Yaqn6
 nAU/0orABmuxIvzVqbmCl14sxDBv6xUSTc7hz5NBaazmLR2KeVSn/ZN4Cdn/kGacaAjumqNRSpm
 mzRHanGyDImNm31T67g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91994-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[c000:email,qualcomm.com:email,qualcomm.com:dkim,1d00:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89A32FBDDA
X-Rspamd-Action: no action

On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Enable Qualcomm BCL hardware devicetree binding configuration
> for pm7250b.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> index 0761e6b5fd8d..69ad76831cde 100644
> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		bcl@1d00 {

This should be higher up (the node above is 0xc000, this one is 0x1d00)

Konrad

