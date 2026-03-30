Return-Path: <linux-arm-msm+bounces-100701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMzyAO43ymlf6gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:44:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F0876357670
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB9B63011522
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F063AF664;
	Mon, 30 Mar 2026 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aLNvu1tD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b61CcGOH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745043AF65D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859929; cv=none; b=ltly27X/RUs3GPelA+Vdzzsikz7C6/yk5afDRt4kIF653y49BbJ/QUqnMDjHjaYHafzqc6Db+ZH77mmuQaITBV1RojUNveyLpxYkPK9dSOOqd2PgiXXi2fJ47fViO8lrjii/6vazAYTSEUzFa70NlJ1i9PK+agYulB8s+h8MqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859929; c=relaxed/simple;
	bh=uPEa10RUZ/XLrSwr3txF55Qj+iEJvmEjuNcVPYvP7A4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=W/1ZPvXFo3S0ABnskiZGiktxXwb0AObYVWneIMZzIY3Kkb3CtW11d47cXOTviIVYtRxKUbHvNhlbEMRf/jCCraBv954J9JCHUkVTXU2ufdJpUxP/pieqj/9l1ZBOQJsmmqTIKLltwqLPdUDswPh3BmCyGnUCQh+jZAHj5Gh0wrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLNvu1tD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b61CcGOH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6gT1J3438065
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMBwZVcrgwfSqM1AFW0Gp5hq1IFjNkYD0/WkoDCtmSc=; b=aLNvu1tDibXSUFb+
	uwK8fIs1JvosGM+L+g2HT7pa0ze9lQJUsWYO0BSGf/3W/Zoj8gPej1QQf3tr7jFu
	TPEgks1OqDb/yZ2ICvA3g7bCapv7nOUZvwoX8MUZfwCMut2H6eaoCeXBNg7nG3H+
	w5zvE5iogZ8aG0+bSgHxGqbUj81i59eZgqDxuBMmwWz+haBlxRFZU0hFys9TgoAv
	LELpG6ICRD0R7/W7TeYuDQbiTVmngBLS05gUaJtddsgf3KiAGZlVtbsDyy3mtYcd
	BWrfCjyLM90Ll6WE5TnYwJfDr2sCtYWAMN2ojwfZvG+MLb5HkGaVYxJA4CGbRDmp
	mes+jQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afwar0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:38:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so109422721cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774859927; x=1775464727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EMBwZVcrgwfSqM1AFW0Gp5hq1IFjNkYD0/WkoDCtmSc=;
        b=b61CcGOHZRY+kTzN1kLa7vHw/Q0JTMN4qwUGIitz1UaFE52OHNz7xgapLdxmVajbsk
         Ie+NJOaginHthHoT6QWezGVXG0o8rA7OeFrjzfJPwplc3PyZ3OG+yLs8daHQQlRSbmMr
         hEUgT7GcPLYyU/y2rklV2JaeO9CGCXM9LSyo2Lcj3T0GEWcJdV7iNNHQJnI6w1v78fj/
         78i5K8GRjliQOy6r4UyU/KCc5jnWCpCWnkNAFdpeGYc5CbRFNtAPvrCXDSxejTwC+YEb
         f7pzYXsLtWYTUxlgpZEjNyFpUejoWQl7W8/jojO2uFSDdU1gbFCJZvMFO6Z9xx9x/21z
         Ymug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859927; x=1775464727;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMBwZVcrgwfSqM1AFW0Gp5hq1IFjNkYD0/WkoDCtmSc=;
        b=If3RoTHVHB6Jmk2Z1LGuPwj9z6AdUQyGL7jhNfmbAJuz/bHZGUkcVn5h3UZs2sNZe3
         cxZ23igXZaYTQ+FE8ufZ7mO5SVO5YX3rwX0FB5TsMDzLSPIpezGjo3R026aIj96nfFx5
         m07IzZsQr5VQynj9w4J6SK6DupLz52olQeby5+QrtExDH0Wimj9VmS2Wb3YaN+eluZcX
         4k8oBfR9Uko6xeH0issb37zGdbsol3TqzBnvfl+thwBnqgduN4fQCltWtyTfrnkotUeX
         o06iiFGSYgO5ZV3a6c5aSEQV2e4ed1CVNXayQKtdbssrEOavTHhgueN0YLiAjs/vSkCU
         fgJw==
X-Gm-Message-State: AOJu0YzpkF4n/Rorz7UBAKjRMPrhJir3mAoiW6yNsXcEZ/SO7dgM99PL
	YIsblcPsk0xj0OfK9FRkMxDsZWvxJlN46qw0Wp0ryI6wtbjl5K/BPjeuuiZWUodMBmC0TXJ8T0q
	/WDkkVV2pQ9YCRm6Yq0stUTlug7aCBUn1Amv8jlbkwjJCEQxpHeG1fdCMgRfM/cA+h7AS
X-Gm-Gg: ATEYQzwpmAsL1cQxw6QosnN1/CYy102i8yedZnBxkuQ6EdP/fbV3xrjvIzvPPmqPowg
	dWAl1TQnPyo3ewt95H4bGY4t+xgBfTtlK5RHVw+a8i/ji+EjEbHrBYah8BjZxDyZRdlhRmNWvLR
	orLLNhF9UAoflz1nVUPNYZsQjZ2X8IneZAzgvca7sIF3Q5gHWMeh6UwPr8vsItKPWQlz4OAUbJk
	n9RkreOv+cpA/j+QgcHht0MAqlYdWLJJpHAqLVrytN/8gssC75exLzCBPp3+w3sTrM+yTLTa8So
	wTwJEqEKEPa96/jXkt1f0iUqVvhtsu+lhV/x4N4qHx4ktC/IsDImAlcnwrFflx8xZyHcff4BGBp
	xDz4sEzu/xNvAimdv3OOEQ9e9A3tXH4oh/hU+9XSG5U/QxKr6
X-Received: by 2002:ac8:7d4b:0:b0:4f0:131f:66fe with SMTP id d75a77b69052e-50ba397bc82mr156069431cf.59.1774859926787;
        Mon, 30 Mar 2026 01:38:46 -0700 (PDT)
X-Received: by 2002:ac8:7d4b:0:b0:4f0:131f:66fe with SMTP id d75a77b69052e-50ba397bc82mr156069231cf.59.1774859926386;
        Mon, 30 Mar 2026 01:38:46 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43cf245ebafsm15776586f8f.21.2026.03.30.01.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 01:38:45 -0700 (PDT)
Message-ID: <3419a58c-c099-4dda-a019-4900419aea9b@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 08:38:44 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
 <fe9bba47-13d8-4572-af8f-d4c0657f7195@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fe9bba47-13d8-4572-af8f-d4c0657f7195@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ulFV6c_8C6pMGkpW47IwysRVR34Z0FbN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NyBTYWx0ZWRfX7i+zk1JUEzt1
 3qytiHk9fPwSQnnLQi0LK48vLEWaygqq76W/jrC+pbuAFte6/rQcQRh/9QnhXqsqyV/MF3nOHZd
 0x7IY6tKkn3Pwn1mSe1tFW5759Uq8tV4KxRh6V8L9QaC7FCMw/ohtRWsY4+KjeQVyamiKKq/jFP
 GD/JQcJ0Q6xEV81xpizU8JcKIC23n8Oqm0hMMeQa9yYIvxgw4Nxlxf/btXq7UDIjr9+HKfg4U+H
 rHNzJhrA4BPe6h9vFpM37EY7M6LjqFjSbKpehspyyfUnBbV7uBY3U7i6fSvq5TEe2tW+xYObiKD
 Ft37zFo4pgVBIFKCL/AuclCmKSYY0M4k7nNm1vSFcGkp6YRqSitiB+F/9Gds1DgFbM4CpcPzuP3
 fQXtFfvAxSz4JAFWhXXc2FOmKtkOj5Csr/PI9YCbHKYP/VAUpzD87erOt2Wfxk+Jn+OGJ/qzOQt
 Yqci/cAwz6ELTeTQfIA==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69ca3697 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eL9--ZToyrh3d9sDi9wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ulFV6c_8C6pMGkpW47IwysRVR34Z0FbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300067
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100701-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email,0.0.0.5:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F0876357670
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:10 PM, Konrad Dybcio wrote:
> On 3/26/26 4:41 PM, Srinivas Kandagatla wrote:
>> For some reason we ended up adding only 4 out of 11 compute cb's for
>> CDSP, add the missing compute cb. This will also improve the end
>> user-experience by enabling running multiple AI usecases in parallel.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 10e799dd4a78..38fbd44c7d8f 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -7739,6 +7739,55 @@ compute-cb@4 {
>>  							 <&apps_smmu 0x1964 0x0400>;
>>  						dma-coherent;
>>  					};
>> +
>> +					compute-cb@5 {
>> +						compatible = "qcom,fastrpc-compute-cb";
>> +						reg = <5>;
>> +						iommus = <&apps_smmu 0x19c5 0x0400>;
> 
> I see that the other CBs have 2 iommu streams, the other one
> having "DMA" in the name - could you shed some light on that?

AFAIU, These DMA streams are relevant when NPU dma engine is in the
picture, examples can be data pipelines which involve transferring data
buffers(in/out) in-cordination with different IP blocks outside DSP. May
be something like camera/video streams directly to NPU without CPU
involving...

Personally I have not tested such usecases, but for upstream fastrpc
clients AFAIK only application streams matter as clients will explicitly
allocate the data buffers, even for sharing across ip-blocks.

--srini

> 
> Konrad


