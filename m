Return-Path: <linux-arm-msm+bounces-100652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLCyIrHryWml3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 05:19:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0331135502B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 05:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 298233005AFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 03:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E66E31ED7C;
	Mon, 30 Mar 2026 03:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+w0k5C0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QrzigmSI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF9A40DFB4
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774840749; cv=none; b=p1GV9qLfk1UiVofIu9F0335rDRY5M6iYqW60KTGXUxwTiUXKixoVxshiAHBaU3zgcoPLeHmtcqV0VYYjNkrsK6IvyXYISgwuEHO8LinQVha35csn05Qy+lB4tkd3Hmc17dVgBiRmwks1MWgYszRIt6DL/j8x9GTJBVLmETJjTms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774840749; c=relaxed/simple;
	bh=x1Q0AEyfkGsRy2wVqZKRt/iZkHcxP2JClu0ZvmSbrPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKZvwdRh76ixEzVzg8AxzFbydvH5ye3k26nMuk1aNhupJ019ODnJ6cgoqlt+Zin3xDf1KW/r9TQ87VG3McaM5Zcyk3Fs1O1TDuqNQGHsWy/55qsjlEk/CTDDRQ3nHizu6TENf+Afi/i+QH5Ea0mCOcSx0564ICv2+KpF2hxXHNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+w0k5C0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrzigmSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhnOU201855
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pT8UfJxWZ+kyLM3PRyRbZ4r7PM01E/No2UWdApRLzbA=; b=U+w0k5C0RYl32Vc5
	ejj1NloTv41CM2QTDgYhcjjp2Hs21FNvvHyjv7aItlgcpyH3So08trJWUoNL7sJg
	c8fWjI61hOgy9KSIc4Qb5XviCXLjfcnuaGLaX2Bo1r+NP5+zTsySt05qJP2hqnWa
	wo0mmcEDb0g00SIa3vha0xQEYjbfppQvhIRN6zuC1lUjC8tM2k6hdiU10lZkQfuP
	9XFDP3fQHPpaDAkjnU0OSnxG2vIpI2h9keVG57nHzISAE0oJXaRGSQQni63dtLzo
	Sa06IAEcr5COCHcCFEFFB5K/Vogd8J/3N+JP+AIfC2Xawk9iqqz3/F2QIyFORChF
	hDJ8TQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwm9pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:19:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0b0aae381so53630785ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 20:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774840746; x=1775445546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pT8UfJxWZ+kyLM3PRyRbZ4r7PM01E/No2UWdApRLzbA=;
        b=QrzigmSINErPB5jJ1atENv5d1u+8Rgi07nThk485p0+zKpCBnqjYo938akPVo1TzLq
         /aUH9pGkYhVbyhElBTY5v15gnF/3SD9YY3h0ku0YLOt2mG5cTg7NREou/3k8OgLEI1PZ
         kmWCB1kScatiKodF25ai+XVJl/iUBaE1cBVexT0dF8YsqxqbcWOhSUjnsZUPH9HrZXrb
         //w/WL4fVNaPrnFzFJ8lIBxK1kjTvkZ5HluPplR5WatI15OJoMraouCd+uiIWqPbBe7V
         mYf+w6wzVfxqt4ewW//QKoGzP/4x+2WC1Nffl2hf3XQXzExQjKzqtu8ztfZ778mSbxRI
         wCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774840746; x=1775445546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pT8UfJxWZ+kyLM3PRyRbZ4r7PM01E/No2UWdApRLzbA=;
        b=hCmgvwjYC473b0Uk3Fw+aurBqhUYNYFWJpwkpWxWAaE1Nfh3Cy1ckTw0rTSwUKDR47
         jUhFRwoQgb4nzK/ORIHSpvqR9kYAaG3h5/FKYX+sbUtkXP12AtDE7pRzpnFtvOuW+mvW
         F4AtBQLZDBTrPOgVfzZoohHfVfmPuiJRR93SpVK5RFbob3NG396bV2WERZzk4dO9kAEq
         QXUa8XQ7RBO7dDWtU8OaUhUMDZR8ZNxs1f7s84lohDl5wFr/r+wjmtUH+EUlMoVu+iUA
         XL1PM3fLI/7rL8lRzDMMNAjQp4eQ7DtzbsE1y7jXYcrv2PD79dVL976bd1LK6En6A11g
         jFog==
X-Forwarded-Encrypted: i=1; AJvYcCWcIG/tQwZfkEkT2Rw/xvzKeOascS5oFdJhx3OES6izdvCZmlCXoVaOxlq4AmKW/s8VeboGrbA8bYWJm1T7@vger.kernel.org
X-Gm-Message-State: AOJu0YzgNHKibcUXfRWiu7oafaewm6Cwoyy1W8A8H7v8cVjO8vvP/QjR
	4sbAvoHd3TpjYXLNFvlZHyL6vAS2A+EyFr8mYsV3m2RU3s7nbqIQ+K2AQf5BCbAepKjK8RDKl7L
	M3zNn/Os3UIZtlxD8Q/lxT+w14VtaRBSZnHhAIn26707Rfe/W80P6VrnwOWU9zIctWznE
X-Gm-Gg: ATEYQzw0tTrEOLoVHloskhU5kZ+Qttp/JfFNbwxEw8heDQPjTNzV0Gmd2raNIc17kt0
	kUUV/g2zJWFhtQFJjPHUfXLU2X4Yt3N7TkEMnw8mh4W1Mret3GJQBXFfPaivqlmFispk73Cmb39
	FNjnLkNn5fFyX6fbukRdM9cJQT6uIDpY/UJBwSzZfWrQKSpofBzFmMdFCa4aABNyeOtI5MPNiYh
	/Y5QF2RCG7qc0eQ4HaHCAN7d1tbpCzD0jJi9oZB4S9siZGCqXommNfxDCp/yjAxL7g3PQF5QXDU
	uIm7puw/XS5cJyNZzacLhrLk8IxQn9CB8xpUa3K6j7+rWdQzo+4TT7R+rfdyaYZKnyjTnjeHUn1
	wHGbsau+KZ8FtOxb00ZlTPZ9QOqqIKZJJ+hok6JU9/dKIWOll2YyBZ4VP2xp6nfQr6LG/Tu1bYu
	zlAiHBfMrSJ992o2s=
X-Received: by 2002:a17:903:46d0:b0:2b2:50e1:f108 with SMTP id d9443c01a7336-2b250e1f633mr26924115ad.49.1774840745815;
        Sun, 29 Mar 2026 20:19:05 -0700 (PDT)
X-Received: by 2002:a17:903:46d0:b0:2b2:50e1:f108 with SMTP id d9443c01a7336-2b250e1f633mr26923685ad.49.1774840745349;
        Sun, 29 Mar 2026 20:19:05 -0700 (PDT)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642956sm65575025ad.6.2026.03.29.20.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 20:19:04 -0700 (PDT)
Message-ID: <05719918-074e-417a-8209-cbce9d49d94e@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:19:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
 <20260326-knp-soccp-dt-v1-2-a60c2ae36e9b@oss.qualcomm.com>
 <bb03901e-5054-44cf-a150-6c7d5ee0f78a@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <bb03901e-5054-44cf-a150-6c7d5ee0f78a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c9ebaa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K_kJy-3VoAIDHo5jem4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 7tSy98BvgmXV6iOWosC0yKTPqW_oTjRo
X-Proofpoint-ORIG-GUID: 7tSy98BvgmXV6iOWosC0yKTPqW_oTjRo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAyMyBTYWx0ZWRfXzI0dXVoZtUQC
 xz65fC0M/g9GyQ2OTwUc8Q8GsSQKQOar/pU8IhlxjALykYSxLbwOGf05bqGMLuyiPQ/5gP0tCJu
 ez8nvby4bvpcnSmKXRBznvWoLW0H+g6l6N0UGnJgYc3QoD65NmuGZsomhhsQNnkZv3ttc4QQBdX
 dsULRGLAwBsG2a3j7gDj5g6XuDJFVX0DAL0C9hfsFATAjK6zeNwKYNoTbaVXGMUJ2ty4bWWtSkm
 +nxAED/wWPMETe9MkPOTyqR/BpKhZpcFJZijIVLgxuIp4dQWp+oJ8C38UsE4a7Yt2nD1A44+DkO
 gcg4/pZXvAscAMYy8v9xn/RhphheeTmGGPWLEm4nJbeCyV3tjKgtYe7udaWTvGeQzbVV6fOC8zq
 4fpzYhb7mW9MK9t89KH77wehd2vAlMqEpC6mR0ilGfar6TPVefwzPO3KKt8Xy/M2+XbmNZe9NEc
 xmRMKLO1AzPU4NzE9OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300023
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100652-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0331135502B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/27/2026 5:53 PM, Konrad Dybcio wrote:
> On 3/27/26 4:20 AM, Jingyi Wang wrote:
>> Add SoCCP node on Kaanapali QRD board.
> 
> This is really more of an "add firmware path"
> 

will update the commit msg in next version.

>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> index da0e8f9091c3..6a7eb7f4050a 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> @@ -781,6 +781,11 @@ &remoteproc_cdsp {
>>   	status = "okay";
>>   };
>>   
>> +&remoteproc_soccp {
>> +	firmware-name = "qcom/kaanapali/soccp.mbn",
>> +			"qcom/kaanapali/soccp_dtb.mbn";
> 
> Given that this contains battmgr now, can MTP and QRD use the same
> firmware?
> 

Offline checked with the POC for SoCCP firmware, MTP and QRD board
share the same soccp firmware.

Thanks，
Jingyi


> Konrad


