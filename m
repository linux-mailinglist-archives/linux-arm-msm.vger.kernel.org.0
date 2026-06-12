Return-Path: <linux-arm-msm+bounces-112957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0xHYMcE/LGpjOQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:20:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C84967B46C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 19:20:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZR9ssblJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TFHmi9s+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112957-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112957-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5789030DBE6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 17:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49792DF717;
	Fri, 12 Jun 2026 17:19:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E323E2763
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:19:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284787; cv=none; b=gZ6GvAAjfqyqKBqgaz1jx6+uuaJassWnPtzYdt9Ae9fgOOes8YCBwas0w6LC3ACPJ/QL3dJWs9YHRjJUnBHyvP8F6hG3jJpbdDjXEsxMxidU/2HWLDl/3gfdCqhch59UH5fDOYYIPw6uPvm18dXKy0X0Djm8LE9joO5kiGlcPCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284787; c=relaxed/simple;
	bh=q5vTbGXIbsd2Eh2VvxJhzRPgxjad4gTyGkH3gSYi0o0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/mlPpBfYpTt876yF29U6e80Dvht0ubu7uIkdA0tjQC7/SDD4T+qptwXwqkojpIzFH2SJCkkHtTcZBMu933J10fX67pg8f3IkiAQhfbaAW0NNbdZmQhKw5ZvYlvDsNQluTs7sPfQrGgXPdZX9GZuvBt9Io45TjXWQJKTTHP7aIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZR9ssblJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFHmi9s+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGVaaY047309
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+God3BGRWfxFPoDCTks9XxJk+bGqwi5qZ/7Vd+kYARU=; b=ZR9ssblJ6aPVHIUx
	P2Cz0TM9MyVxeIhCu3t20i3/FGY/m+zHbvEyILtzONNgvv/o2uSw1E1/axPckAL3
	t9M6CaaO8oxaJc0aw2hS2NZnShsqNoL+v50ehGdxxiKBuGkgzFevwQyhOGXKN4ra
	UYcS9rczffFTMdezCFHxB190VAebSqQ54rKPF+uevuwlYxpNs6P2XFtf2jp/LvAU
	+6BhTZGHfwIWxJXpx8SAwzhDtog0FElROZTKEJvg6ogmBC3JGUG+IT/iOl6a9XxO
	MuZMGVbwrJSgU2/QeeTo2RUPj5llh5Ier+zjHmNfeRJhry3lxhFf6syCFpAKji0/
	eKK31g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76ejuj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 17:19:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85dc345ac8so648785a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781284784; x=1781889584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+God3BGRWfxFPoDCTks9XxJk+bGqwi5qZ/7Vd+kYARU=;
        b=TFHmi9s+LGMYaMcKoHGfkSO8b1fwo1r+LWeVj4EnlKkedF7nE/zYAfuM3qv7dxPdjJ
         2QpkTb9EmUGoigv2xnJPLB5obCBbphOo9z/mlYFBj2otD5ZOm5JfsEVmd8CIuLO1xX7s
         3BPjowjORM3ffcr4wrBlmGNOvlUWXksJ10dxToi5Z3ol9T68ChJTKzvelEvX5vBQY/pC
         GznxwHg6QIuXAAVIOEg0weAQd5ZybhmNIcTOq+JAyWWuDrvjZSCW35JvDRSN3+TQki6B
         sDhmLOMyGvGJZis23HNxnOqK5n+G21/J+87QXaYiwCmYXaUWfoE4gbyxyoIVl3GXMguE
         899Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781284784; x=1781889584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+God3BGRWfxFPoDCTks9XxJk+bGqwi5qZ/7Vd+kYARU=;
        b=GWMP5NDnPgo07ErU+GepKRG0qFg7spjHDB1rQqeiCgEQETrbREyBPCX+YOgGgQezd+
         AJydFLiLb9hwba9/bDRF4VZILqPyyJj9Kh3lVrWzk1kKD15/FK4Yc/0ixaVsxONIevvO
         gj8OqUTFas98JpiI2Mlfa8lWVqvRp9Abh6h92i7+J1z/6PdOztdVhueH3N3kPFYDgvIl
         dtq9PlvQy/umLJUIhMP8gGBuBo4OIRX5CZbr4GEgl1THbno0iP2rWH3Iyy+V2X8Jxz4j
         0rGU0rakJiQgztnpj+Zi10REzyeqsnX9kqgtTtxKE3lTgsovsapodLowkvXuhPM0qDS1
         szeA==
X-Forwarded-Encrypted: i=1; AFNElJ/BXi+6yusnN+jNr1ZjOabefvJNJrRzlHI8+aeufUiGFLEjQL7RIjvUNtJMYT6v4kI9C+JvcQJ3/s/ZdUmo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+q3wF30dpX+MJx++7Z/o/Zv5Zp0IF9lR9jBnS365PdPS2Euux
	qru7qRObo/SkEbUQAu6JOWDpFRCyn9cj2XZUNiREuvC3G6mOVAIX7y/n3NL8BhIz9XczpT7jDTR
	gz1Y5dWFFFgseDMY+Vgmvy9/gv2p5BZ8xMoCIDAWZkYQE4cT6NVo5oPY+kM7G44PsABkg
X-Gm-Gg: Acq92OH3oBoFSxLXAyF4ZfEI7/eL/p46qeyZxKOgqymd+r2zZB2PLmyzxukXHoxXPsy
	mwBfP96N36x1gYNhs8FKNxq1MCXENLrlKsBFmuGNNt14n6xeoSIVtQMdFQ8lcw8FgpTZSht/a+D
	AFb0cnwI7W68mhRdKgoEb2ZYXDzcv7+H6KE9IjEB3O9Oec3RFcqRhHrlCXYRs3AEAbhABRZBBVX
	kQeFt11W1i8gkhaMhFgrHyGwb6wu9GPhbkDyLEhnFyhr7rhmhqqUVQ38NCjAJyLAaSisFcvq/qT
	Pas8+JF3DjUstpxbwSQ5/nDKKtZp4vbVkNqToaOKk/IPAsFGT0LTkrhajaVieWUsnYVnu8bseqv
	871KREoP86CWjutRV37Z1ep9ep367A4CgIG/omu8jz9w9T37umlM=
X-Received: by 2002:a05:6a21:4d8e:b0:3b3:223f:d3f1 with SMTP id adf61e73a8af0-3b7962bb2e0mr572012637.18.1781284784258;
        Fri, 12 Jun 2026 10:19:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d8e:b0:3b3:223f:d3f1 with SMTP id adf61e73a8af0-3b7962bb2e0mr571975637.18.1781284783791;
        Fri, 12 Jun 2026 10:19:43 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.232.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866518677dsm2627178a12.19.2026.06.12.10.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 10:19:43 -0700 (PDT)
Message-ID: <d47c504b-1aa8-44fc-831b-d09739b59ea5@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 22:49:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] arm64: dts: qcom: Introduce Shikra SoC base dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-2-103ed26a8529@oss.qualcomm.com>
 <zzveallrfaeaclkes4dvexcxacyyew6mjgar5ctmhevh6ld4c5@caxx3gdr6g6v>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <zzveallrfaeaclkes4dvexcxacyyew6mjgar5ctmhevh6ld4c5@caxx3gdr6g6v>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2c3fb1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=g0pf6In4uVe9puqoFIUS9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ZCscK8iRdYwrpkwA4MQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2voWegDwvWnXWBJnLSLNX4Mm70ZEyPNQ
X-Proofpoint-GUID: 2voWegDwvWnXWBJnLSLNX4Mm70ZEyPNQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE2MSBTYWx0ZWRfX3U5TjzJl/0NY
 /5BebWkr2de/5j49VerAR5EfgqWd8JmqcshnVgTGjcnLF2c2amzuG0huxYd/RIgsWziefnj8Yym
 NhdYM9R6Up47cv5eIZIHdL2SzWxXAw1DNmlWfd5N7i8jV1qMfSODJQR+G72JjL7C58+b/sJPxF2
 3rCaobEpXNvFH6LSr6rlLMnXd2Nw2yDwXDnsUq2Pbm4eAPH4dJQ5ItMUQdYDwLUuUKaVDrS9ATD
 Uml43PJxEBZSEWiC3ApL767+iUm5FCFhhP5RTPqQmevkiBY/3EONkE8fArwGzXkaOme3heRGpYd
 pf9kmGbgUrmROIrNzrdirCGTu+Hveh7vtAJh/iRjt86X7i7W47ljzDR1hLlzhIbIPMqJgcbL4E+
 EbirAdZYIJGqWaceEhhmEfOlFPMqHC5pen5aKs9Em9BYObMijXdUdyZXcYaBYvonga87hUxtsm/
 v6IYt6Fa7r+bUzcW2Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE2MSBTYWx0ZWRfXzJm3Zw0+r9oN
 Uz8MvbgaxfmBKnnq5MI3W4PeCu6EcgY3VgSLDqxH4ZLKpNk+jl5VmGk8EgdpP3Ntnwr3fUfxViA
 z6mK6vUSmFkg3bum2oakEQS1VaZRWOA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112957-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:quic_mchunara@quicinc.com,m:rakesh.kota@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:sneh.mankad@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:xueyao.an@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C84967B46C

On 6/12/2026 1:46 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 03:40:09PM +0530, Komal Bajaj wrote:
>> Add initial device tree support for the Qualcomm Shikra SoC,
>> an IoT-focused platform built around a heterogeneous CPU cluster
>> (Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.
>>
>> Enable support for the following peripherals:
>>    - CPU nodes
>>    - Global Clock Controller (GCC)
>>    - RPM-based clock controller (RPMCC) and power domains (RPMPD)
>>    - Interrupt controller
>>    - Top Level Mode Multiplexer (TLMM)
>>    - Debug UART
>>    - eMMC host controller
>>    - System timer and watchdog
>>
>> Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
>> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
>> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
>> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 842 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 842 insertions(+)
>>
>> +
>> +		rpm_msg_ram: sram@45f0000 {
>> +			compatible = "qcom,rpm-msg-ram", "mmio-sram";
>> +			reg = <0x0 0x045f0000 0x0 0x7000>;
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges = <0 0x0 0x045f0000 0x7000>;
> 0x0

ACK

>
>> +
>> +			apss_mpm: sram@1b8 {
>> +				reg = <0x1b8 0x48>;
>> +			};
>> +		};
>> +
>> +		sram@4690000 {
>> +			compatible = "qcom,rpm-stats";
>> +			reg = <0x0 0x04690000 0x0 0x14000>;
>> +		};
>> +
>> +		sdhc_1: mmc@4744000 {
>> +			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
>> +
>> +			reg = <0x0 0x04744000 0x0 0x1000>,
>> +			      <0x0 0x04745000 0x0 0x1000>;
>> +			reg-names = "hc",
>> +				    "cqhci";
>> +
>> +			iommus = <&apps_smmu 0xc0 0x0>;
>> +
>> +			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>,
>> +				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			interrupt-names = "hc_irq",
>> +					  "pwr_irq";
>> +
>> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
>> +				 <&gcc GCC_SDCC1_APPS_CLK>,
>> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "xo";
>> +
>> +			interconnects = <&system_noc MASTER_SDCC_1 RPM_ALWAYS_TAG
>> +					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> Please align on '&'.

ACK

Thanks
Komal

>
>> +					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
>> +					&config_noc SLAVE_SDCC_1 RPM_ACTIVE_TAG>;
>> +			interconnect-names = "sdhc-ddr",
>> +					     "cpu-sdhc";
>> +


