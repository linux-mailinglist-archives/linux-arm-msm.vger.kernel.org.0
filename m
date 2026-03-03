Return-Path: <linux-arm-msm+bounces-95049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJkPJE54pmnxQAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 06:57:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 326971E95C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 06:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4839303FDDC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 05:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0170D3382C5;
	Tue,  3 Mar 2026 05:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkZdqbu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzX9Joq3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB5C3090C5
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 05:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772517393; cv=none; b=praynJuUOu8E2xa6ywFJMoPwGZYiYbP+/K7xJUewrBoKqtPM4NrI8YuK8YKWHEEhYvLDIWQ/DYY6DqJZCuibRkjawBN+lW77P2fwnJKiSCHP4vaqI3nHQ+/T58Fdqyi6rxI4WMXk7ilEMr3+ZfuweDWTWQ8Sh+42/gyqmGvC3mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772517393; c=relaxed/simple;
	bh=3bIXffY/9X2HVXQIA39mw4H/IcuURtGpwlkl8koIlMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cP7DJxd9BhET4HIx5HiMfnQ96H5CDyObuXeXPFMoGeEoHq8BY8jZ9jhZVKNbeSodE6NdwqB5XDQ2z8WFxczgV66Xpo/bGyhIThc6q9AxQ+PQdIwkoRtKMiX5mZGIIvSlwAGPHx6PQOVFeQtxw9LpYL4LBnJHGWglvWXRKaFwIzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkZdqbu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzX9Joq3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234gOOJ1186947
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 05:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFRkum70LwaLQ544ntcVbg9EgSAccXUR17foftejeHo=; b=CkZdqbu3cXsf309b
	1OkxUDCi1VpE2jB2U5FHi51pNiwjumq7GxVWzn7z//8zQ0D4kfl3te8hSE93N4T5
	LWhf+B7KcWF74PfyGuurDHDDD/y6Y6k5dJFZQ80QzLLN19Qa/oKR32m3kMBvrUeA
	VV3hixGm0uywBPQzSzQcRJpvVOvv2wLtHIioVOTXnN79emeW7kJ7tva3TXeP4Z0r
	UqjxXMj13pfBHLbcGwsibGFYdU1IcF4jJVKZwUGoTmZhQ4eCG7NtZnYkavJ+Gwf0
	cwwtpIOHqyXYDqZHrrxbM8SIsqr8usCBdGqxXMnJ9vvDhQrmzthXOJYxdSPR4qUy
	8SHkMw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cng96hu9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:56:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3598f4fbb13so1732628a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 21:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772517391; x=1773122191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFRkum70LwaLQ544ntcVbg9EgSAccXUR17foftejeHo=;
        b=LzX9Joq3wwuk+XT3KCPFxtZmnRtoXnbSMOQDA5snSLJFljuLigv2UL7Z8ALm7YPaLI
         PWgC/rm6Jz88F0xt/9vpreiVDL8yhKtQ/7Zdg7Zgf5WK8G7iK82y8TOvW2oAvhXTL2P7
         cbvoUhqaPwOGKIfHhHWxg9ryTqW13X4h8ABJJzSEnzFbFXVp/AJBFAqQfqlxtTmoGFCC
         TvoEoZ2lASAjGGBE6qQJsEs29F8XkEZgNrOdYuePJJQXtdNoiUIwVokXX54+ceHSg13z
         RO3q9sP9drAgUHzHHNJNCx8LExgG/IndFDKmv2a+gnRHqbt9wG5/YbsqvlfYUsxNDUyI
         GquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772517391; x=1773122191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFRkum70LwaLQ544ntcVbg9EgSAccXUR17foftejeHo=;
        b=LgSAwpi4PlRAOuz5+HV2i5xCA26WfF/Jf1jesQzfPcetcL2FnrUFl6FdFegh9g380p
         xufrcbUcmaPOmSnJJ9ds96EdPWB0AYOT0p8I7TNWRp/GO+yAbWD2+JkGfk1Z7Xmq7Bbs
         9If1qZ5pofNPZ/4jdY5iaJCqgxixeIfT/X/q2zJNwtqYM3+oS7tieIQ+nAcVcH6GsUiD
         UWfd+vj4HGWkkqjJngToXwYj+i38qXqRJLidaq6g+Tvs5wLfFb73vwkIutKqcqIfUTcK
         JMFHA30okTHl2IjNCkgAzAOXOw8aZ1du8GiqtK0UnaAqttYep14Jg+zx840QxVcLeGOc
         rKnw==
X-Gm-Message-State: AOJu0YyZYRZBkGS3xaBOPQ/eFz3GZDlV+sSgBlHQLr9I7do+pn/1Xjb+
	c+wTRg+CBODU42pcCu4vek8zmT8+o3D6mqYsHhNfiesio4lekuNJHFnes4cTYk0SjPjINqDMD08
	zZncuX3pfpZtPs6YYDzbKPBEUrTAppZiLHT/bdvqIfk7arhP+VB8R552pFR8d1byVSTLt
X-Gm-Gg: ATEYQzzfU/1Ccfuxi7BVbyucfeDaGSKdyaghBmG5jrIMzAZ/8l5aU9Pp+yYRNIfrIRM
	ro+vfFkOoQ7LFFNnPorHoKuISRpX/vluiKWUJy45nSph0SworNdna88bac/tFIAz7oSogRkAnZn
	c+GqHcMe4aOZUKHKKyO3yHzu9jhP7Vkki+iBXPob9yXxxlTXnIugumrm0IwXfdxs6HsJaDVnBnv
	s+2bOvtnqAHxaToWxUiv+EuzFRArtT86WJXwUvATjGlq8YCZ3R5w9yDVD/vqA0Jx4ZBvIbFgkQK
	mxXC2YhhX/gC59r8BcMTxWtIRHdclU3erjJC8Qb1W3G+PapQdTSG3UYV2dnnmeweETjtqFSX4pX
	u08pua/DdTTBH044b46Dlxn2aSDvhAHFRDXjA3h1RHz7T8zRn
X-Received: by 2002:a17:90b:1e50:b0:359:8812:7c01 with SMTP id 98e67ed59e1d1-35988127fd7mr5371873a91.28.1772517390672;
        Mon, 02 Mar 2026 21:56:30 -0800 (PST)
X-Received: by 2002:a17:90b:1e50:b0:359:8812:7c01 with SMTP id 98e67ed59e1d1-35988127fd7mr5371841a91.28.1772517390198;
        Mon, 02 Mar 2026 21:56:30 -0800 (PST)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c49eb72sm1199207a91.12.2026.03.02.21.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 21:56:29 -0800 (PST)
Message-ID: <9ff1645f-b2c9-4c1a-ae2d-96af416b08d9@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:26:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
 <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Co6ys34D c=1 sm=1 tr=0 ts=69a6780f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c9pHKBabw8uT7j5izdkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ny__RHmKGz4qF-lA5rwao4qlPM1r50Yy
X-Proofpoint-ORIG-GUID: ny__RHmKGz4qF-lA5rwao4qlPM1r50Yy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAzOCBTYWx0ZWRfX/FL83rQkCI2g
 E1VQr6q4EnO4INtmUJQZKpnL5Ue83wv5KLF0qwcXlOXcc+u7NfmEyzJ2YvBSGPZXKjZ1IRdBJID
 jzwD7sSZ+6codAObg0O7vgubI8cCLPXTJIlYiYBWV7/XQFJCUUGJdaBkDC67TLvozy9+6BGETS1
 SPubisTa9Lnoc5XOCIN9mZg041QbvnLs+JJVD4tFGGuh+E7gZFfvEuvvx5PGkUwvqtYcC7KaV1k
 LvuZRIgNRUSkiVa7zUdc3xUOMVApx44nVncHNXKHIHocGh5kwTO3k+eqL211+6fMxB3tl6HyCHQ
 Y7cdaG6XuBE+flb9QCelLAqDLY6KOvFcbLp1whPNCwqVwJmfE5e9WPUuTw4ZNR96Z9gICCD4XWX
 8K1YOz2oZKvgc4vSZbkfrRUo04l3Tve5vgdc1GeFAhqlkrb+MpqbsHwQ9KIAbm502EJD+FUNUPL
 1tfNqaZKPzsxP/st/xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030038
X-Rspamd-Queue-Id: 326971E95C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95049-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ade0000:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


>>  
>> +
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,x1e80100-camcc";
>> +			reg = <0 0x0ade0000 0 0x20000>;
>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> +				 <&bi_tcxo_div2>,
>> +				 <&bi_tcxo_ao_div2>,
>> +				 <&sleep_clk>;
>> +			power-domains = <&rpmhpd RPMHPD_MXC>,
>> +					<&rpmhpd RPMHPD_MMCX>;
>> +			required-opps = <&rpmhpd_opp_low_svs>,
>> +					<&rpmhpd_opp_low_svs>;
> 
> Taniya, in light of the recent discoveries on other platforms, does x1
> need a performance vote on MXA here?

Konrad, MxA is always ON, and with the current clock configuration, a
performance vote isn’t required because the clock controller currently
votes only for the minimum level.

-- 
Thanks,
Taniya Das


