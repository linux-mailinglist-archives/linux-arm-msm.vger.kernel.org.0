Return-Path: <linux-arm-msm+bounces-112751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E1xuDD2kKmrfuAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:04:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F0B6719EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:04:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZAZtb8EZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AtjeBSS5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112751-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112751-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F386F302AB0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D0C3A7F45;
	Thu, 11 Jun 2026 12:01:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692143CB2D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:01:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179272; cv=none; b=rmt1nxMHStpEIxz5z/ObM56Va3YdQ4LspzgFpMqIH72OZMKQrBHD2EG77KHhRuHDmnuWam2aGfY7K7mNxCqb0O/koqQFtif6UMikfyn8cvW+C2Y3FuS0vcqxArd49mHDFN7q5cFNfvGHmbKDpxpZCwVlmnAQjxGZNo78vLO2kXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179272; c=relaxed/simple;
	bh=UUASRU8qrMq5bxc7X2jqPLe9p6S7lopRBLYFDQYVE/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4UDezr7tZ1M63bRwKWWYlNK0u2BeeVe+IgGiDOk+cH5AwES8U9RarXNQaor52GnUiTdvYrhLFj4HUWpc4ibW/z5XDyVZ6bJjrz1iNtlNxksxpi9Pr67BNvH5/hUrJrjgcbb+lS+aj4W7UJC6zyxtjwVHHxw0XCjBMS05f6IiMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAZtb8EZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtjeBSS5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xJU42890217
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68zpPUdw9eWzXraHNVqxbEaKq0xVZ9xrYdjkpnjxA9s=; b=ZAZtb8EZN4eZib+p
	As4Cey2lWAM+Iy3vS/dONwDJD7n0caQU8TEFUHv7/9YVYcGvsscXJIzbPua2FjP4
	rErT0VqMybbitS4M2MbbOfLVgSB5ZxaSxBk6TA1TpdobJu+HvPbFsAb3XUoRPGJN
	4s3MeqrW4R7dJKkZ8ldXc5cETqZhu5ZpdfWE8RopmtjQca8qFEVYmEZe1JNbIMDg
	W9ccewyewbk5ePVwSQ0HGnmaS4G/i000be6LvQRSBgSc5stsfq5MRqlGyBsMr29K
	7atVHXcTo4iamh1xyrKwbgMuutwl0O3qxFCPYZK1OrRrfEgAxJqS8R2fmQFnC5fF
	dLsTow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79k775-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:01:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178ac43d27so22027731cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179270; x=1781784070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68zpPUdw9eWzXraHNVqxbEaKq0xVZ9xrYdjkpnjxA9s=;
        b=AtjeBSS5r3+oCT9P5VizbMy3vDaXVlMDaQ5tSnnreyaFAhGrteA1fDYhqomc6XHvG4
         Ra1PZ5doi9/5+G7bvgMLMv5Kj5APZ3aGBV68mKNsAU3o9UKkDi0sG9f5tnRew7pn24em
         39N4i+MUE7SiHdEX/R05dws1AfYoiOfeSvcVvRa1botEbxYvemjWSnxZDEbcD7x4bbL4
         w7uaykXma1fvvBTx1MG7DlP5LZFhAFLh40mxkGv/JA0tLmbPJrCLM5OMbdY99fqAINLr
         zXULRIuDaqBqF/4sPrOyHbUN8sXUnbBBLuBTqgFXx9SyNKMaLTD9Q9p+hkOkfteuaE2n
         4T1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179270; x=1781784070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68zpPUdw9eWzXraHNVqxbEaKq0xVZ9xrYdjkpnjxA9s=;
        b=tLAqAkwYXHtjnxQ5nfyy0OH3YuloYaehH+a4E6ghqzrfkcV+634Ok5nsEAFMNMTJqm
         jacuI1qOPyWlE+ZwH/1uHfad67dX8MgD0uXiR3nrr+/YnMpMvkiROKSdiXK0wjmN7uwU
         XOYbR9VkdP49mTHSXFm5o1E72ezIO096+VY9c77/KJWGmT4gHIBgBO2Qpnn8kEgfglb0
         T+D27L9+YM1z5ApJhHqrUVbaOk+5j1o4KNEGQj9Mo8tocn/enowPB/tqc4tE4EFhWulZ
         JkiL9kHLb7Mui5biwQyIeS00rPaY3clrI5qnV6tEUYEnnLkV79O5utpZKnCO6TdnmWlM
         jyJw==
X-Forwarded-Encrypted: i=1; AFNElJ+PeSyOKZcBI1r8GQR48r7ocMCiPp6Qn/RGZSwDjdaYwd5Dg7/DhoB1t3A19SX7EKZltvDkABK3wl4O8pJm@vger.kernel.org
X-Gm-Message-State: AOJu0YxCXnnuVaERCrCNzjvKJ/j3EgB4jdTmXEZpD2cCpNwg/uwv3lH9
	1nEwwehEGOfu9CAwe1QyiKe82ZzgFm0sj9XnIQ+Uw1kvJXrx31Byq+qlGX1CmLefjmorTP06H00
	VNSJAQ84igni++1QbKAg3OHbqwvEJ41tVK5eYZX9sJ3O8ZdpbH36tmkFV9T6rHj4wIU2R
X-Gm-Gg: Acq92OG4ZSDkzxL26uu1dALI2oTu9TtQYxxsxxbCFzDVgDKbZa1SysLw4Y2Zi3Pul4o
	2sW8rPbMPtP0Uvf5G6cQdXatQdo1Gcp6Cehph1j5LETPGfucPsDosrtzkwUuPMjP8nBWWI4i02d
	yAUboyD1mE19upGr7FNGNqkGGebH1jfbkyQGy1+BHp5TaZihYWYV1rm4seZeRovQTrgt9oKV3Jz
	f0K14d/J/VBVQf0FxFjq/H3x3rt8R997TVPZd+FNXanBxg/j8T3RAQXPrVq/ArMDspEbvpAI5gX
	y4o//isdymNrQrdiyRiYslRxfNTDlI2xKaVErqEDYNb2nT9lqmax/akuLzlZu6z0gW+EDfY1QFG
	fcJUIS3zfimIOyZETq4dl4ArYVequ+lMJH8LKxSe2hlbeQAjcCM+JFrt+
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr23764541cf.3.1781179269334;
        Thu, 11 Jun 2026 05:01:09 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr23747671cf.3.1781179258661;
        Thu, 11 Jun 2026 05:00:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb1607ef1sm54532366b.15.2026.06.11.05.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:00:57 -0700 (PDT)
Message-ID: <b926f503-05f7-4d9b-98d7-0125b106c512@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:00:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mXPltDvOsU5nKFYCGqvtaglXLGiaL8YI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX+/uQPXZkFGPa
 hMWum0asCzN0r+ngxeyQxfMBlvcHbskSgFikOyR5LwmjEEyy7bUOMfGGZfQYgfEtn+i5XsJ3m5p
 jAQ1pHQHWAtvroxYE62dGn+HS/hNrMIpKZLDpTPM1Jo8RfxIZhO9voOPTYAijdJOrlcweGcS/Zm
 Tya+96AW6cBNjH5NQyjRqACObSnrVPvSeVVrWSUTv2kV8RN5cp0miJKn9Q+IT5bi+s2Tx5GdzXc
 Kcx7aEYe/VVyrAU9rBCeSZYk124bFGcn7djQHjvvMThZjG5njvAq7CLJA9NpvMr9CNQ16CQvmbj
 4xzYCoH3wrLBZYs2kSWn1dtGH2s8+e+/dCvPpj9+U7m+q1NVyC7xu6CpJrgOVddARZKvhU0LRzW
 wniO/JqoeXNptpQcBZ/D3rPFqrO21aMKmsD1R7JjybBZJS5ssueYl323RCeb2xq2HiUpir2L5WC
 qteP79NIOUTZWEAft5w==
X-Proofpoint-GUID: mXPltDvOsU5nKFYCGqvtaglXLGiaL8YI
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2aa386 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HgiURebnQJ4vjG2ds3gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX2o3jfucLn1gR
 sg+XpULjI1cWvfKuT0J4k4CGULAPGq3z5Tpf5s9qyia9yW0yYThbpqqu5y2pXEDspeYAYZQRr7L
 979yGoOq/hhvFfA7jcGzGWPS0gUb4EQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112751-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10F0B6719EC

On 5/26/26 7:29 AM, Taniya Das wrote:
> Add the device node for the EVA clock controller (evacc) for Qualcomm
> Glymur SoC. The EVACC provides clocks and resets to the EVA hardware block.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e9549d126aa50a0dc7a90943a3249..66948808d197bd17ffe65190b472bb845cba0eb8 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,glymur-dispcc.h>
> +#include <dt-bindings/clock/qcom,glymur-evacc.h>
>  #include <dt-bindings/clock/qcom,glymur-gcc.h>
>  #include <dt-bindings/clock/qcom,glymur-gpucc.h>
>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
> @@ -4804,6 +4805,24 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		evacc: clock-controller@abf0000 {
> +			compatible = "qcom,glymur-evacc";
> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
> +			clocks = <&gcc GCC_EVA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,

With the XO_A situation resolved:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

