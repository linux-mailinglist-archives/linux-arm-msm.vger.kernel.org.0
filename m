Return-Path: <linux-arm-msm+bounces-118760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tEWsEN7WVGqQfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:15:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C24EC74AD14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:15:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TK40pqQi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="iqy/QHWN";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118760-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118760-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED7313017BA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2635D409621;
	Mon, 13 Jul 2026 12:14:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6088408619
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:14:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944893; cv=none; b=tfHXPzHxydFt/YOpXq/ds91pYpiuVgdBZM3nQRgZtFGPGIOFLGm2QyZaLgROXkuU/42uqG1cscAo37H+N8pThpdzSdr7ekuX+i9E+EGB5IVfL+mrn4LNd6JVR9DH/SxEshmKJxJ1A5MC0+Uusv53GK1XbCxsGo0ktl5fvnIeAN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944893; c=relaxed/simple;
	bh=b5cPk/8TTFRh8c69aoCwpRLmg547F0aWw9DtTVQXef4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qusxKqjHObV/StxaCDdJdKV77fAwxYA20QoB43yzn9U7gv8eNozGIasGP/QZdV+e8hjFewaHjO8EcotCe/Rx+DMHG05HdLpHF633+2QeVoqkVO1msZg/CVf3hJKwluBZxBhAjqT9hS7CzRdiu1CMc5JKg5ohvDIYizK6conIvNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TK40pqQi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqy/QHWN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDj4h1453285
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyxSXEtF5jsDzlt/U5zJMxAHTaONNDF+J4xpZtkdAOE=; b=TK40pqQinsRDQ9B8
	WUGGrb4qX+0zlMucwIBNV6/edXG3PF9zN+9PCtFjZWxzChQEl5jUSwrh9iJc3e9h
	XCTFbYxB1IcfCBTuGAzWDgdgNKWRuIclWZVkDw+FDTu+TE/DYoqTSUMllOwm680Q
	BnG4A+to5fmZx63ljS9hk65zMHXG6qiIgYWQawsk2NDW7cqwRLdXa2SmQdSOS5ZY
	DmeB4aH1MLQiU4Jbux0BxIDcoKPni3LdQcgiHkOpwS1gXyUwZrA5+/F9YONuSq75
	Ngf0YALRvBjxX8n6ZCQ1ipb0obrjn+yirMGYEKyyIoWrQE7pkHyLdim8hcjmWhnm
	LAHT4w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj0147y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:14:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cedd915291so4796855ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944890; x=1784549690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyxSXEtF5jsDzlt/U5zJMxAHTaONNDF+J4xpZtkdAOE=;
        b=iqy/QHWNq0347Cv5x1phYaGrCBBDEAoDVgPcYKP0H12CDjT7bH7ULnEst9vbJoxrdz
         gUUXfmEaNBAVJTcEof9Eo5/fHzhx85eFam3mkNhlRFZXp1QUpV01m6rKSKbzPNVqRahz
         urjA8B/m7ZYpf06vfvw32QKMM3usJ5QkSV0dKHgcowIWrgPjx5XYYQrGKn3B1H3sBBr7
         fqxWcVgAfrIVr4X0BXOaTbA2Zf2stSu8boULtvD7orYGjUnZ0F2Wq3qP3kjqfcZzUpOa
         IrLliMWiGznPJQ2YgdTxJZP0B9eXVQZNTtHcGjFAwxEMb95G48t+twA9dDa20MJNabuK
         TLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944890; x=1784549690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyxSXEtF5jsDzlt/U5zJMxAHTaONNDF+J4xpZtkdAOE=;
        b=Nb9PLXhyO2vy/y5qlQoowKFjkUNZ7u/TgN2NIPwVW0steWMkSyjpfcP8hu2BMOzx4W
         4zZbACw2YiNJfRLYJM/8tdem6+q48G9RSG9ZnuXr+b4ceBO1bKYyuCoJ7S4Rl9oLued4
         zYsQJc/x18tD/YEtcYeEBJssMZEOZSrmt81rJBk27dFdH9Lvk3YNBywrUOLlWTmIFEDj
         h4K4S9E1uzEFlVgXEQam6pxxyalYtnNdGmU8gGGKXcRgS4szJ6Uj9K/FoBYoafPuGghQ
         SwHVAUfmk0gCi9GYsGEM1c+nzp6r3tPYyMwcJdzST4pE4mz1X8euo3IPt7jAeMOmVHeR
         mgLA==
X-Forwarded-Encrypted: i=1; AHgh+RoEU5TvI/VvWZLGJHEIa+a2ZbfRmv2I/QS/RXrlxDzV8nIh9A8+6n8x0sCVuoaT9SCvywMzYgS9Xxrsy3bU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6C2kRI5AhGAw5Db20vhavY9lTilS2MWaHZ5ZKrpxeCMt3Wqb3
	uym+hJJ4UZbc4CsL/bDWUbHzMg3nacowY1x4OcA7ExL0VJ4SxVvLpIVfix2mDs+KgzmmVRFlXtq
	j0p6LnaaZrOQeY05Dl3prIXTbea7A7RQrqPfHEtbe/vqJ3Yv5LliyDB/NQrgdUZqfB2te
X-Gm-Gg: AfdE7clYOajsV/QugftjE/7739SEvrnbX4YqLx1R7OPu8Ul/4jZM1qBUYJ9ZgP8S5r6
	NcPFxCS2KuVkBZJpJ2t4XI1PseBUwuE0pXlyBq4q7fZ8vnRf7s8TNjYcR50mBwgm7zJtZ4zgvwF
	SjXC5BRImbFPPCtXgmjJj7a9owNevKJIApVOEwQPnDYRVaM/hMyLICCzbTmgTf3VHi+YAL6mtpy
	hP/D1zfbRdt89D20oSmG3sKf2AFX9Qbk+epiVFTcsAincdBrWGW1m3nDbwOA3WoSGbd1JL+V43S
	DdUkDWGuqApc8oE4nXwUr8z1VkuIp4+H8tmNQcYdGn996dnGzYov2Lau6RZIsmJnSbwVUES/AZI
	lXZ+YkGMw4qHoSLxCtfAQG8Cy3pqvMnDboqMxHw==
X-Received: by 2002:a17:903:110f:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2ce9eae29a7mr87590495ad.1.1783944889575;
        Mon, 13 Jul 2026 05:14:49 -0700 (PDT)
X-Received: by 2002:a17:903:110f:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2ce9eae29a7mr87590135ad.1.1783944889099;
        Mon, 13 Jul 2026 05:14:49 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ecfesm98917475ad.47.2026.07.13.05.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:14:48 -0700 (PDT)
Message-ID: <23f9caf5-d992-48eb-b41d-75833770f4de@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:44:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/19] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-19-cc13826d4d5a@oss.qualcomm.com>
 <3ad818c6-39fa-4b8c-ab82-f5cce6743cbf@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <3ad818c6-39fa-4b8c-ab82-f5cce6743cbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX/aaRD377Q7Af
 nh+sCnayH/3qKQqeSUg7JYJp2wX+gXUqwoA7uBsYIXug9Xi99Rn0g9gaAOu1PZN1JBcccAyP10G
 kv1dfvbrBs4i11gSoF6tLFuNfe1UHtU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX2JoiqBEhyfSf
 1xMmsNV4YtOMnJulq2sQc3+THn7m2wWmXkW8GizQBpOcpB/LLrCa9aQyUj7j3nkmPjq1Kh2EFtC
 EuySC3SNpZXqOV/UPQhnlf3kwzqbIDKlUK+8cZLiWZJW94oQB8ukh+r3oOAc3OOydp3iOLNuUME
 tgwXwEe3tLqNUyuHmHR24tCkzzZ4LKjWbKkBJ5VQ4Xhq6a3z1InTr/Fb3GEx9msWHpT/8lSDAZH
 9Bj1+/8zrUPAVyQHQyQ/YoAizT7oKV6UltTEFQRZITvNPhUSf3zfBmhbe4RX2DW5BXoY79Iub19
 YqobxzlztDS/R0KQNw0It9qkR65ha7ciWeKd6GjGi550ArXBmWpq5XM7wrK+ecQz7oiCRYud2L8
 DbpjntW7gBHDB/vXC7ae/LXUM8J+E2jJ0bRq8P+TBPKX28VJtgpWsmL/Vg/zFJBRKWezn94mHN4
 8+Su/CuNW/tqrS/tGqA==
X-Proofpoint-ORIG-GUID: I6wn1bgFaTveJ9MK6SHpN4OCGNOcglFI
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54d6ba cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Kcuzh8V2oFltqVObT2gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: I6wn1bgFaTveJ9MK6SHpN4OCGNOcglFI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118760-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C24EC74AD14



On 06-07-2026 06:30 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Add support for Display clock controller and GPU clock controller nodes
>> on Qualcomm Shikra SoCs.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		dispcc: clock-controller@5f00000 {
>> +			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
>> +			reg = <0x0 0x05f00000 0x0 0x20000>;
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
>> +				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <&sleep_clk>;
>> +			clock-names = "bi_tcxo",
>> +				      "bi_tcxo_ao",
>> +				      "gcc_disp_gpll0_clk_src",
>> +				      "gcc_disp_gpll0_div_clk_src",
>> +				      "dsi0_phy_pll_out_byteclk",
>> +				      "dsi0_phy_pll_out_dsiclk",
>> +				      "dsi1_phy_pll_out_byteclk",
>> +				      "dsi1_phy_pll_out_dsiclk",
> 
> FYI neither Shikra nor Agatti has a functional DSI1_PHY, so
> unless you're worried about some incorrect bootloader version
> toggling them and want Linux to clean them up, adding them is
> no less than unnecessary
> 

Sure, I will drop this patch in next series.

Thanks,
Imran

