Return-Path: <linux-arm-msm+bounces-114833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GCcQEMIAQmqJyQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:21:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DE56D5FFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:21:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YY4OjkzT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dxKye+5W;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114833-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114833-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E0D43003BFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF132DC321;
	Mon, 29 Jun 2026 05:21:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF857BA3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:20:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710461; cv=none; b=rQmbcaPGnVAAybOcZBPX+F4XlkR/cT/Ys+U8Z9jNO57hQiYOYo8VkmRY02Mh97wNYCMAqppnUh3jf0n8FwEtwIbi4K/oMEG3VtiWXthJE2VCxBDuu8R9a5qCxfYne7aoS508v/IZQNo8JNty/DjOfj4vnnRgE3hfQw+sIQBixnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710461; c=relaxed/simple;
	bh=2WOdzPUG5PUNeTf0BqyCqnl/mvY7CXGX0jeuTNkSMjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEc/Z9OyaLdDxqVXW3NCst90rRWyDkmee4bEZkLPCRHT/ahXi57q/Cg514KehQJgN/UWZqp5LNAjtnehImvFhwkQiDsPJU9AF+Is2H4Dug1Lagi2kuaECDnFItl+4bh43gjMV+RCw9waWrtkwhw2Ji6nbkbkjOuQrxBLlC75K0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YY4OjkzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxKye+5W; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NPQj1745053
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeK3bJgoCKDPXj7jg82bDuQiHQZGh1KsuSqDPgEOFTI=; b=YY4OjkzTUiPvSbdl
	1AnIgnP0Okf+79VT78dFk0WDbyBRoGcm3/WWFucjPQMDVPu/yaf02NKTJL41xMCn
	7QGJaT8XuP7+kzepxFUHgXjqjsC8l/185ojfKYoexyyuqXYX+cZe4QIQgU/A30op
	wOMe5xQQAzT8NFKsNme8lrnWx9NROMNVUpOkwCSIWDM9OeT29ErqxBhxjkse4uO4
	Pur+gQ5BJp7mIEyYDZJajcPcYnCIImkzWKUy3+XNhkKs4HMPyFiRYfgBBXnCgd/Z
	MCZ/4Xm680q6rVST+8xpwIEPUBI/siMbp4CxYhdFYQK1EIRyxzho5CFjtLtxIVsX
	C3BTXA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734cnbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:20:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ed9113e03so7269eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710458; x=1783315258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QeK3bJgoCKDPXj7jg82bDuQiHQZGh1KsuSqDPgEOFTI=;
        b=dxKye+5W6MUArvzURzAaAdHluvgWQQanVBYAFjkKc2iPjb0WHJYR4jhPZ0TqMTA8pv
         36jqYC6ruW/fU8/pQq4xlSiTg8iLMhRHzSIk968GkaBu9joYaHlKdB+l3Uir3U24es2Y
         Su/ASrBlkFnonyNeXRD3PP2Vuh7VGnao+T9MvzV8L4UBKDR6jj1HaJD5Ja+z4wWRL0OW
         j1c97qiDlIyuTyiCRgqMMcyxyRBlhClDE5J6cEs9Y4LWzp42jsXdTfW4RFZQ+uO2BWQF
         KDFYngl9iI4TCsAeQ/KCnWq1yFwOkjG0PDMson6fAbF/vQJyn1JzhSkC8o0Hg5qsXqYH
         /zyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710458; x=1783315258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeK3bJgoCKDPXj7jg82bDuQiHQZGh1KsuSqDPgEOFTI=;
        b=mQijWwswoiQ+/Y1TnXh3QLrI12pyUL/ANW1+YzhE1ZjZsiK8kLv4MyZgQKKmeMQhPF
         YSLT6GrBlDIHNDapEETDR+QT5S3JS8HfOXkoBATPBf7sMSFtfHQbTgqo/gECXp/wbQm1
         IKXDReRyYRqLH2j9Nv4nW2jxKX6b7yaUTRQdQXT1mmI/iAXYoa+Er39fZWBZPK+1CWjO
         KC3Pnwg2Mm0k/QFfAd7ccUoy87Bq/rCF6gVICxRA+bOHZi0njHuxbhDpPQI0UU4PmlsU
         OUrgJ9wB9xTj0g6h61VsKAnD8gKtVCwmNC5MdetDyLkOS9Xyxb8l24BE8RO+xh54H+y5
         wdHw==
X-Forwarded-Encrypted: i=1; AHgh+RoVFlK7xlNO7Pny8Zsmj66PelsF36JOF4lvBPh9AfNUOrJmMY80rYqu03hhX9q3goxKSg99lCHNiBlLPxCD@vger.kernel.org
X-Gm-Message-State: AOJu0YwIcqFW1lDQkb7ji5ixEYPLxHsG7KzUKRbyLSi67lWMzYliCNhM
	Szj1hVjDA2tUod2hZv6gaaA0fOihYyZ8SAmM0+8WYyFAL2Q84+kNgJ4FIZbO9/yJGtFAfk7Qyox
	fKqZ4CNaM23a2qTOO2atAwXPhUg8U0XOrz1aQe8IC86sthjRaFFJnswTEkUFWHox3L+wA
X-Gm-Gg: AfdE7cmeEZg8BVB9CQHFIpnxUC9BVnGNvepJj7EBNGu3GIcudxRxBuJyK0iwCbcX+VJ
	xiVWO/z0rcYqe5NtmOqJ+4PsTq8zVmR2/OP+rf1B/kf1aLAOxaGOuuGNNfygyBeeOn8CK66iNwZ
	wbZ+qP9m+qLSuQkzkVeOaQ6iIN82lk6FLqyoiegz1HZrzUM8yMFtE0ndOqoXKIM2qCStGM6KCR5
	NWC/TcjoL3LVRd4oP9E/BozbfR/PHB2u9lSYrf3xnHBPNl+cuIrG1A77NcsX8gDhFvx/sO7T9jy
	4+NPuRj//oa0eW8X9XVxk2anwZ+64SBbR3lsMUvTWdLL2bRw0OH/EkGU8bVoIqLylyjmwPsJv+w
	BZontPl/YENKcsqIF3Y24XJlUZqtsxO8l26/+kg==
X-Received: by 2002:a05:7300:aca8:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30c858d23aamr12222765eec.6.1782710457854;
        Sun, 28 Jun 2026 22:20:57 -0700 (PDT)
X-Received: by 2002:a05:7300:aca8:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30c858d23aamr12222738eec.6.1782710457322;
        Sun, 28 Jun 2026 22:20:57 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm39914896eec.5.2026.06.28.22.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:20:56 -0700 (PDT)
Message-ID: <4980d925-ec32-4632-a377-d65b9ac1d152@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:50:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-4-7ee6b5f2d928@oss.qualcomm.com>
 <b3a0fb12-5595-43ba-b552-cbf06d1f9260@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <b3a0fb12-5595-43ba-b552-cbf06d1f9260@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pXTiU9MjAvOj2FC217q3z7kx34viBE_7
X-Proofpoint-ORIG-GUID: pXTiU9MjAvOj2FC217q3z7kx34viBE_7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX1vg3kKjTmP5j
 Hndbcq4k9kvJTezMNZsQv4yjBPXk/6jfx/o4AU9hFIl/nYFUrP0Z6LVboISmM+PzJgMtAn4DbTT
 O2W+iu+U9IIlSUhHCWOSZtN0XL0WWyg=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a4200ba cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SiY_No2TDSAPns8i4EEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX8YwVeuMsI3bb
 B35QBcPPF19WckDE1O9Ag/Pqw1Ojh593l0IVXEGFxo8p0BLQJt3zyaTUE5R8VERDbQb2FUSAELt
 QiSRRT8UJu/ewevxjVlSa2D8gemU6EIgOILeSN9MfksaBrUSgTO/gkfWcLiDpcTcCTyDX95Nilp
 tLzz2kilUcKoKw1EeCOxuV9Y/1U8510HNDK8xgQ5jyAFVec+7jcDY9F5mgZKia4t4gm+lJ7lZ8G
 yY5GmbDTsK6Kha1tNWb9646emQtCIZhrj3tbF1XlCD/OweE+G65JzzAuDzGOf69tQOPMUe+yED6
 1AnSVdGFt10wvoJfZwnDii9GVOU3QSd6aDwEHiiPRyH+3LZRhs3Ze6ae0bV5gQtABev6OJ/NfuB
 8k6rb9kpnIW2vorZd+KQNe3rS13dPrGu5cgAyH7lSdIuJX4uj3sxEl0aZNuaiKnyMGcgqmbJKeJ
 XbTnoZx1dPfZw/tsjLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114833-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38DE56D5FFF



On 11-06-2026 04:55 pm, Konrad Dybcio wrote:
> On 6/5/26 1:26 PM, Imran Shaik wrote:
>> Add support for Audio Core Clock Controller (AudioCoreCC) node on Qualcomm
>> Shikra SoC. The CQM variant requires both clock and reset support, while
>> the CQS variant requires only reset support. Update the respective device
>> tree variants to enable and override the node as per variant requirements.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  5 +++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 13 +++++++++++++
>>   3 files changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0883c480bfbc80d7bead966b9ba932dee8a77bbf 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -23,6 +23,10 @@ chosen {
>>   	};
>>   };
>>   
>> +&audiocorecc {
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index b3f19a64d7aed3121ef092df684b19a4de39b497..b5e3d573868a836ad5e5e8eb3024cb5fb71dbb4e 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -23,6 +23,11 @@ chosen {
>>   	};
>>   };
>>   
>> +&audiocorecc {
>> +	compatible = "qcom,shikra-cqs-audiocorecc";
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f15757d52af04d8cb5540354a239127cb0d174a3 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -4,6 +4,7 @@
>>    */
>>   
>>   #include <dt-bindings/clock/qcom,rpmcc.h>
>> +#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
>>   #include <dt-bindings/clock/qcom,shikra-gcc.h>
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interconnect/qcom,rpm-icc.h>
>> @@ -640,6 +641,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>>   			};
>>   		};
>>   
>> +		audiocorecc: clock-controller@a0a0000 {
>> +			compatible = "qcom,shikra-cqm-audiocorecc";
>> +			reg = <0x0 0x0a0a0000 0x0 0x10000>,
> 
> This is called AUDIO_CORE_CC where seemingly all the clocks live
> 
>> +			      <0x0 0x0a0b4000 0x0 0x1000>;
> 
> and this is called AUDIO_CORE_CSR where seemingly all the resets live
> 
> so it would make sense to split them

Yes, the clocks and resets reside in different register spaces, I will 
split them into two different nodes as suggested. This will help to 
handle the CQM/CQS variants requirements more cleanly.

Thanks,
Imran

