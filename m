Return-Path: <linux-arm-msm+bounces-112729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TD5zLCGbKmrctQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:25:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 256FC6714DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:25:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=glrECA6a;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HzeYxzwk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112729-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112729-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E41963022928
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D2B3DFC93;
	Thu, 11 Jun 2026 11:25:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00CC3DA5B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:25:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177119; cv=none; b=qTLKLfasRqMhYC/h0d2PWN6FugAUygVM4aouth7TK5AWxOr8RCIRp4JpFyaE//wydAkQyNo8kqxXoOcO/k8qDIUHqq5NzuV0v5UoSZ6sDcnITC2scAINDdX1D7osmEeFXuLjYMvUbgy3GrwlncaUxmjvOi4jD7dN1QzSQ8zEEYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177119; c=relaxed/simple;
	bh=vi9Z7DDnlPuv1RFkNv8Q03tknP68sabA7c8NaYEkQAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkAmDV9Yz992+epJi0q1NJ27mUcRI9zQD/WdPasqWMMBNDgilPigdzGphTskXzvOWKNxV8IUKHNIU7VNY4hmv3Edxh+tkFdYrXQGW8+ONh0qCZkOLubzsSsp20IgU+LLBh9hZ/AgoJVuZi+1qJHpevP0kG12IS3G5TtJQjCRYI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glrECA6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzeYxzwk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA03Un318917
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gP74agXukYi9qHLu6WD4fAQMqsUwCru4GBxwuYtEPHI=; b=glrECA6a5vYUP9/z
	enhcyA0vT8Fvcpo0cwU0gFPcYolBh9Q1kjECplI2bN5jDZELveqWfU6Rukyh0xwC
	AY7PWNkTRn9AMVwzBby5clbTcfkEVlIqKOeqdDvz/U5SS6pzt/l9JCovUSpj60rU
	NyKSLlJSOyX27igfgzADk4bzQ4kU8mPZ971jxK8nQ4ZjAHuJt1kPqdoNEmIfTnio
	qgPdnlKq+MaH/O50EvHNjXAAHB/V9j0Hjh8r8DJzM+bojwIBh9PQ8PkKrbX0lNoj
	PC0bU62wHRZ36LJZjeocCA9nJ1MKdjr28Ey8Is0Yv8iwuV4ahMqFsmpbjPgsDMDD
	1nQQLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk6aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:25:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915ccc2d4d2so113211285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177116; x=1781781916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gP74agXukYi9qHLu6WD4fAQMqsUwCru4GBxwuYtEPHI=;
        b=HzeYxzwkHP6UVg7ZDUZSsA3GCmjBaO3AM3Ukbg4vzD7vLwcqM+LY3zUEmNofsz16kZ
         lvSgNktk+fCqHPSoTRSx0aYs7U6jRLF2l7Ff6FHURX5mg9HYzD3fRLovzw46lKXZrQjg
         0J1CJtKsEnKLKzC6O/2yZUxkN7Swy7UmonEX60mjAUP5JH2AmrvU8+G2yu4LOWLD5RuY
         534AuKxT0lsRabB5DKKMqe3LGvx9kLEFM0D02NSvuqTIOGzbWoZdz+PMtfML76f3qy9Q
         K+Gcd49VaftXBsuabJUBXuV6RdpjoA1CXoYVSje/obu9/E7kKyHHrznNaugpHo16KFPu
         is8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177116; x=1781781916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gP74agXukYi9qHLu6WD4fAQMqsUwCru4GBxwuYtEPHI=;
        b=LG5IQOdaVu3aDha682CN/2k2dQDVgi9/9QN88nDkf+7r9wkWBzSqeeOYoZEOVfjFeN
         o71hGffAq07joqxfJF/xJcK9i4AB+CU++VWKKauESYHMS+cnFJE5vJFhJW6t1GiGvvpA
         LRl5m9C4H8REZwqpNWaM50mz3vkvGgJuMuTEatxZhZGV1ZVNr1wgMPJDyVyMLEOXaxBg
         c9qlgRj5ni6k9A7H5Nh9++mFiv1NjE/tMhyzi60bgfZ77O515pJLMc7JGEwvQ+IFF1WC
         jt+LLvV67zxOCLd58BXnZDS54wQ9pirG7cEGfuEUM2QmuhxpSttz9lhgJ9zTqXXXT5Ue
         HG6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8cORD7GydyD5nk373uKZhQ9077PZD3f7GP+FVprMyAHf8x+IK7syPuMPpksPGVXWHWHk6sh+niXtnf+OGK@vger.kernel.org
X-Gm-Message-State: AOJu0YzAa7fLgnPMKvO5R+A06DL4W3LsK72bZtCOO/aSdI3VTkPKncjL
	hypUScHJAE3bLC9JvjULlXDeZeFnsLykH5AJ+/EaTNeXQLZj4aPj3IY2KImDbwGUUVV3LdK0Z8p
	6TCHiWUXFlH1IBUvvXUNmnGNMBvP8jATkV40fuK1ANV7sI9NOcmgP7f2tlKslLwio7/Bc
X-Gm-Gg: Acq92OGnxG6dgm3JdK+XigMRdlKPOLtzsPTQAuSeD3jfkGJc2n+31OB7eNi6vi2Qq+F
	8Y3cNfF5m7TJBvrqsu3fPWPVf4JTR1FzoZzLKkkQj1kl4lMEzSJxlHqPcQk1K+7aEuT1CHiw8KH
	sSnrWRKujnAAye8bwNwuDDgZfxSl82Avlco86i+Sq5xTFHp4peB3TXK8B848Cmi7XI8XWM3/PX+
	aMUTx89IXs7+j6c9UpsxD+ux+L40hz/lefanvzbnWjdpNGXOCm9OCTO+VCYOg/IxIlBTIHdvDyl
	6Vo2Op4vYcbEVPZ630M2WnlGs7keyBp6Lg0ha9Uac221usmYHEiFtO9n+yB6v8b1UZjQI5rvx2M
	VCCGqw/0qAEghjZHPuUw7i7I2YkZXBXgVCq2AChBrGtsobp5aqfniHPJC
X-Received: by 2002:a05:622a:1e92:b0:517:6a56:accf with SMTP id d75a77b69052e-517edd186e8mr22626611cf.1.1781177116059;
        Thu, 11 Jun 2026 04:25:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1e92:b0:517:6a56:accf with SMTP id d75a77b69052e-517edd186e8mr22626081cf.1.1781177115326;
        Thu, 11 Jun 2026 04:25:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6915a637180sm6949847a12.26.2026.06.11.04.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:25:13 -0700 (PDT)
Message-ID: <b3a0fb12-5595-43ba-b552-cbf06d1f9260@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:25:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 node
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-4-7ee6b5f2d928@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P9r6JdRtLOlSdQlIKqWOpsNnRmDasm6G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNCBTYWx0ZWRfX63RSFZxWCbws
 EBRgpt2duz+f0x20F71/VYRLP8AvEpdHd9SQQ8UnXtzrmD7Hbkj8pdz7ALXbXcsL9oJzNmkdMRQ
 2cigc/CvjZ30Gq2Mh5c0XTXcORXOXOI=
X-Proofpoint-ORIG-GUID: P9r6JdRtLOlSdQlIKqWOpsNnRmDasm6G
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a9b1c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nQDTg_FwCyLU4XyDx0YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNCBTYWx0ZWRfXxkRd7+TTj02r
 ZnILFbChRu5e1wPE8hjAm39RN0cudAneWJLyQAMOT5+M7+2XcgIfqhjHdnKjO2WCW1yu+9woEo8
 fc1QGIxGqN+ztt+Et61CvV/p04x7DK/MwPjhCtWRuOAbhUwV9wV0C8yTu31S0vEWdVHoXjMuBOd
 ch9AeFDA+Dj74VO4FBr+8f1RHFFuiV00cNcyRIy/VcQGCw4sR3edAdqE98awUlB8HzcOfBQpxl8
 qZ9KbcUCkyR7esDyhDUXqM9ztJM11MaMg6hSqBdvJfo/EDuDUYGDRhoQBTlWtKD1QRdN0P0Jwqb
 d3aqVbRT6GFAoM9tr0u4Ta4vv5otx3+zzcn0pQtnb5boM+iUxfAfv5j2uE0Mpb0s/x/PfDtdStx
 N9HRQ9Pk3jo64WooQ+JiW760EVwDPMelhyRkw1ma0vaGfKWW+wPcuxkv5ggIGXOMuLVIqSq+8YR
 6wqafXWMguhaoJdHv6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112729-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 256FC6714DD

On 6/5/26 1:26 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) node on Qualcomm
> Shikra SoC. The CQM variant requires both clock and reset support, while
> the CQS variant requires only reset support. Update the respective device
> tree variants to enable and override the node as per variant requirements.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  5 +++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 13 +++++++++++++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0883c480bfbc80d7bead966b9ba932dee8a77bbf 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -23,6 +23,10 @@ chosen {
>  	};
>  };
>  
> +&audiocorecc {
> +	status = "okay";
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index b3f19a64d7aed3121ef092df684b19a4de39b497..b5e3d573868a836ad5e5e8eb3024cb5fb71dbb4e 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -23,6 +23,11 @@ chosen {
>  	};
>  };
>  
> +&audiocorecc {
> +	compatible = "qcom,shikra-cqs-audiocorecc";
> +	status = "okay";
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f15757d52af04d8cb5540354a239127cb0d174a3 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
>  #include <dt-bindings/clock/qcom,shikra-gcc.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> @@ -640,6 +641,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
>  
> +		audiocorecc: clock-controller@a0a0000 {
> +			compatible = "qcom,shikra-cqm-audiocorecc";
> +			reg = <0x0 0x0a0a0000 0x0 0x10000>,

This is called AUDIO_CORE_CC where seemingly all the clocks live

> +			      <0x0 0x0a0b4000 0x0 0x1000>;

and this is called AUDIO_CORE_CSR where seemingly all the resets live

so it would make sense to split them

Konrad

