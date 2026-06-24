Return-Path: <linux-arm-msm+bounces-114335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H5NcMrTIO2pUdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:08:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8F56BDFBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:08:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AOsamObv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i0wgRcOX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114335-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114335-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A2A630ED112
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7989E258EF3;
	Wed, 24 Jun 2026 12:00:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467A139B4BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:00:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302451; cv=none; b=PnYuwwSI14daINZjQS9eku1+dSjIOP48bdoTMvcITXoKMkm+OJU240PLEVUXOzvVne67TQRiOQLQfaQIkbRmOClvymX9ZWJCCCDSkDyQdUaz/kUYD+Lmplu1aYa/NYd0tC2wEftnbAA68CKu1I7Db5SH41RtZ6IcMBxroDqjfvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302451; c=relaxed/simple;
	bh=yn2hY3rZbDM4MtiWyAwzZb+JM7DadqcO4MGX+CvMBpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZplHGevulu2Sd2dnwBSBuntjuLniDELkWlZoMiaKbomTuUpbnP0qracKf+T91N/ipaHfODKEaJpKdzIJaGKfyWxHHjCdoo88tMyeFDUAt6c/D2nFDXABVGAtNI8YgIUZRwCw91ipDlEIYhZXWvbsNwCvkbUTC+8EVP2louD9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOsamObv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0wgRcOX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANYX42501854
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYFj4kPcouC1mjb0JYQRO9ALhnR8UReul2IK7X9tdqU=; b=AOsamObvUdQ8JOaP
	xhWSiROqh047p8JG9Lzjd+Nj6G3T80rUt/4dYKHZvPcGtXbLxuz7AFMtxw/WjNco
	rnEqD+8Qk3PE3eMBPgqOZweZnEx23mDJ2RVkWEv9dKdF7Ah41sTbPeneBxQiHwr0
	bDG5XRoEtI8xuehkmPKQAfJqwQrRAP3I5zyqd2nt6qXS+j5FlFltLUSOtQevo1bn
	uXu1hDYdolWEsOwbJpH0to9mL5Cdm0oPv/vVoC4f7S94weKTL2ZR4E3zgXe62cgc
	Icjb4Es+h51lLdDxrnUhmMOTDuQvgWHobcF9Wr47NaRhDDkXo4qJ+L6BT2HGXO0Q
	TMb14g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d450fqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:00:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517647fbff1so2753301cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782302444; x=1782907244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gYFj4kPcouC1mjb0JYQRO9ALhnR8UReul2IK7X9tdqU=;
        b=i0wgRcOXhc1Oe7foAW6gk9Qdc1MQ2DJzb58tgvTepfC4tQua0B3tPv3hPHI64ix2vr
         KSrq1OkCzQocGiH6YLV7xcg6BIgD7Z4765BwNCIiMU9UniA0eD5oVihUnUBJDnCXfk8f
         y1xETLLg82atKvc867wub/Zz1OSuEEEkhrbpU5KPTrHxxovgf7h7zJqp8U0IZAmb1ODu
         fpiAFNsiY4DZU5p7JR5v4vfXpt4867/FxHPBRwY2zVW8K+lG3OwHIR+cPFGHCM+CuTKI
         KZJ2IDYmxX+0Uol5GiSIX9gIT9NRtXJhXpK35t5ZdT7QN9Dn0mPerWma16uG7OSm5Y1g
         +lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302444; x=1782907244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYFj4kPcouC1mjb0JYQRO9ALhnR8UReul2IK7X9tdqU=;
        b=mSMQ6J90bajlE/2nyLWL8fFysmBKRU5wpCoQ9J5tdGxOBpp4Q6aHNBI7+0ez09CBrZ
         ESS/l8BuuNeNSFY287jXGuaBKWAOFMzOlpKU9C6Z5SCbRfexS+wYpYndRPWlAdQ/cMnQ
         75GTzhgGrsD4RFvhv0UCgteRM9A9AqLLmBA2oPpLYz+9xaUlztOJgTgHZi7bKwfURxwY
         ktzGO44oj1B3npweMeS2JWQCKeZDbbKmCjkHnSz0M9sSWzH5yx1DujE6ShtpWdn7kUWV
         bVMLsPQINY19uY6Dcy4JTElhspGcjAKET627cDIAnbqcZrougrXJvwbqtOl2tGPbVVRB
         TYrQ==
X-Gm-Message-State: AOJu0Ywd1cLaYbXpJaCDtlTgQk00bbTeWEQNi+rw6mhalNfiV2cF5oY1
	qKfxksUT0tzpSCOV6RzEn3/l4CXVOHy5spIESff92cCg87NEPqoOuMAYVqCmHGzwe34YDBXlaB4
	8wCGD1Q3jMhYkr6KLGkuK+StFw5Lk4hgpNDcOScgEsZreR+zsCPSV3TuiowdOmVukjqbV
X-Gm-Gg: AfdE7cmfdwI3Qv2X9FRweobYi4DfVjBgqZ27FiQPVzNMQh9QXeK0dOAbwUlzyHGkO83
	vS8TviRFa6thwG2GuABCU5o+TpnbxDE2o12c4WA7PyxjNfeRDYSMyPMncUvzrt3xHMMc/ai+R0m
	48dSlrzIIU3arqBGpb9h9NywkEDEbSnl+RVWXDctHnMcEPW8kgI8lnpmv4m74lO78IM2nPwcTKr
	BRadoahGbwJFADSuejC67VliRyTmnEoMFwNMdao6v/Kmu/Y5SCXQ7LI3WaVfMJTyPcq3T+4LtpW
	f46jjm89stxc2U0dWJEymKbRs2ucrlpkVfNesr1QhO3qO4hkLFESZwxveK2IauGdegsMaFxvd7C
	bh3Y9bdXw26m92rujUmUrv9ThRyAJRGGEYBU=
X-Received: by 2002:a05:622a:1652:b0:509:2a92:8088 with SMTP id d75a77b69052e-51a4f42cb19mr90241131cf.1.1782302443921;
        Wed, 24 Jun 2026 05:00:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1652:b0:509:2a92:8088 with SMTP id d75a77b69052e-51a4f42cb19mr90238831cf.1.1782302442333;
        Wed, 24 Jun 2026 05:00:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f49d5dd2sm982723a12.21.2026.06.24.05.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 05:00:41 -0700 (PDT)
Message-ID: <07fd4bcb-f55f-4856-9b93-7f4569a27b7f@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:00:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008
 PMIC
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX9NxY1AwHXy0E
 rKRBQNUzjYpQv07LIdAIWnMtqmMg1+e8D1mAxkuRKFD62yfbxGq3Nbh+buLj5DF4TbeJVfvA39x
 BTSlYrPb3+O9yDc/HI48eGHFkYUVgU0=
X-Proofpoint-GUID: FO6msuxcMxTZWb7m0-IFsfoeClBa8H8k
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3bc6ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=dZbOZ2KzAAAA:8 a=juudafxt-d9__oLBeOEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: FO6msuxcMxTZWb7m0-IFsfoeClBa8H8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX7kU9Sq+B4fYF
 osROgwUhmMHcYfmvhUxa/dmCyaMya19rHNiotXdpXButrZFjhNAESza1bISZyX/wiTgaE6olfRw
 LTKLz2wE/u10h6Crf0MZbVSyVCqBQKu53wFG/9tGTIYSvpWzam6gQxb1zGvG5+KZIlKpTgp8NaB
 YcwCyHdRVTYV97HFHywNZGfzfJnQ8R6VVZNDuiy9CLARFU9WjyVhZ7B1ouXJk0YvrtxA8Lsu2eY
 Hc1iKBqXxGG251EEzhXQWGrD0Qo45UeblsvHTLufYoxD0JFxX/Rry6RReLY83HYZmpAc2R8AzJi
 A9NHdVsT3Ovg1IfWS/NEdTUTfm1rym3qhls15PxCNpcERa1l2NmECbcnDe9hQe3BTfjmarjuh0B
 zfdWIxjJvpaMhnXlwYI3r/NJRCeR1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114335-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xxsemail@qq.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qq.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,devicetree.org:url,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B8F56BDFBE

On 6/22/26 8:46 PM, Xin Xu wrote:
> Add the pm8008 PMIC node on i2c15 with seven LDOs,
> using GPIO84 as interrupt and GPIO76 as reset.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---

[...]


> +	pm8008_default: pm8008-default-state {
> +		int-pins {
> +			pins = "gpio84";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +			input-enable;
> +		};

arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: pinctrl@f100000 (qcom,sm8250-pinctrl): pm8008-default-state: 'oneOf' conditional failed, one must be fixed:
        'function' is a required property
        'pins' is a required property
        Unevaluated properties are not allowed ('int-pins', 'reset-pins' were unexpected)
        False schema does not allow True
        from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8250-pinctrl.yaml

Please drop input-enable, it's not a thing on TLMM pins

Konrad

