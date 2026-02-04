Return-Path: <linux-arm-msm+bounces-91832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJkJNwZ8g2nyngMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:04:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC9AEABFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D135A3027B37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 17:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839D0347BC9;
	Wed,  4 Feb 2026 17:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oye9RtcC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FlKI+hyy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C79F346FA6
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224472; cv=none; b=MUv1X0TgNlLe/w1u63ud+1KeNtToDs2TRyHfZB2A9A/8v1eN5xpEad4/F9PFHXrca+Fhpluf6k4vlpLHHHPMMKZoKT3dPoH+1HON2ZeiY0VIb0Ca/ABcVmR1ih75X+Z7bivM9fOsSc0m3WMgHU17Zjh9sdhpAYiKf5VU4U2g4UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224472; c=relaxed/simple;
	bh=axyqzuh+nfuIgh+LK6EsDdGL27Q8CwXPsTaEaTeezNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWm4+E1YWrwnX6Fozu1x7r5nfFohYf2yoiIDWPxkKtj2sSTvV0yPRm60uIXEnUVHZ0bJ9uvix63gYpsXBexHQAlhg1PCTaT/kk+eI8JzyYFPRkNFAnR5sYf3qOCK5egOv61Pya5KBNH4fWtaAaBylfLoZK+mbV2WfGOnjE1rxpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oye9RtcC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FlKI+hyy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614E4RTl943650
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 17:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cIOuyFPYn9l0C0uR0YsRIcPMqORnM7AnLgYzjEjzmRY=; b=oye9RtcCXrhouRZC
	AFT1PqkBj3wjjVih85jBl+u7g2yIXHTMapm1TJ+M8fhpvVtV7VRT6ZDgLbCbhlE0
	Ofjc8SUEO97qL9I6IdR57gmB2fzq6KtpMKhL/nDW7l4GziNuItqfyYeGS2bq3gQ8
	t04CEBzwYFfsKC5GRfjV94jSKLJmBrvrfmEdQTj/lTpECo+v4na5TU0Dw8Q2woZb
	66uKKOKryPVZ9T7JsijyL9CcPHOM432M0WSLYZrqBFGgkHfRy4HT7vcOFnXiqe6g
	lvs7Sb5Z8Q5r2R0tLVxmHLqB35q0IwKxC0Ua/MGb61zQ6Qfy9qqSiBc9azN6Hhku
	y5pUhA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja0m3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 17:01:11 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d18998e3b6so15641a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 09:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770224470; x=1770829270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cIOuyFPYn9l0C0uR0YsRIcPMqORnM7AnLgYzjEjzmRY=;
        b=FlKI+hyyeDM2kNKMxj2d2Tf7WUTFZR1tzukrlaHjJb4raf3UxCIO6/U2g8jhC5Jta8
         1TrJsRjcyQIUqG2uW15RYBEl7vuqFQ97wpTf7n5IdrMGXzKVnyWELy0fvJqZnwgLIeSJ
         +K0OoxtfTCc91aF5xDbeiotuwpfeSqWn/JkjBQ57prxQ3Jq+LRnm097wol+HsZfk7Uha
         z5OilwLrMXjxi5Lr0+xqd+Aw7LeMrGSNU095hvi4AW7A9Htl8k7F8iHFQS8/pmgwo+D9
         4u8ZHHEVcMCxLyhyz21NcbOhNrHZOVB3M/2dD1Zei8uRt5QHGNtV4NXfOUZkkuS8tANH
         0Fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224470; x=1770829270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIOuyFPYn9l0C0uR0YsRIcPMqORnM7AnLgYzjEjzmRY=;
        b=i/67RwNecAFpwMhMoU5WXYq6aKg8WuS/3WUiJUSgu2ElvZeRCm3INbP2a5JRQbcL65
         UxTWKwj5fA063toO1y5pG591qVP2itRePJrSDzsHMwWoOoR63YHmYd71sdeJCMkAcq1Q
         VCCEPD3SCPneHwFDKyZMQJacbTh/mk6rXZaV0ZG35okjTSSrmr1Gals1TrHGEyKAUo6T
         py1cSPx6HRhgFAnNDAewAy3MANCJloUotnzQQMAcib4lVUsVjv3pZsB5+0Qyx0FJB7bb
         VnmvzjrMDQPQWPEXmirzG9zno98BlmJCU9foxqBsAkWcDGyrGCL9+nDbiIRZAqKs0Iuy
         T2xA==
X-Forwarded-Encrypted: i=1; AJvYcCWR6BXPoyKziefs4nM5ctywbwHKdt3If8LnE+njWxrsySIJD8pOwNwvWyhrki07QznhBXXyWXOVnlstI5qZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzNH7Rjgj15chEG3YsHmUmYHMEr4/a3bs6uO3CViLpjb/4ly5Ls
	S670ChytS20CfmofWyimSz4Ms82ir7/v4i7NL6wvl2l4eSR3fwehmkLcIhHYwBGZfJRZUxnHAgT
	7y8bONciSzjyHo3DEz4sCGB/jNgN+81fCM8O0WIU92cWaQUYqMmhzsdEj0bTAVvdR97D/
X-Gm-Gg: AZuq6aIc8FrjgsivhOgcAt12Y/IK4LVJw2WEMZccVUOud0vZmGkTQR5R1F8HCfXP7fs
	w/A0V6VbU6HgX0NR2FvIzMalsmocKaeWEZ2Xo8GsEPKgNlgGRxpWlvXTyydoO/KMTkBXd/RhsOv
	zXa6syFuwNAdm9YQi/V7owMR8szSLn6JYLgZTEy2G3oasb46oBu+EXviP+6TsSX3k2kP6E4bBTQ
	I6dqSWT/chMKCm5u5WoNsHDevv6qKq18jVvMoMsSLe28ThM5Rwj0H2gJHnBDJI97GvxcpQGfk7r
	tvm4OoerpNOOrN6TqSlFAh4kl7lZz93iYvZAMn6S7Dks9L+i+juiHJPGDCtlhnwFsvtytHyZ29f
	K962IuhP/Pzbq4eR4PIaYvi5jSiZ3Ni7UMeyk52V1llzX17tDEctMTS3xtj9bgV0R9t4=
X-Received: by 2002:a05:6830:92a:b0:7cf:d117:88c4 with SMTP id 46e09a7af769-7d448c2348emr1443872a34.6.1770224470439;
        Wed, 04 Feb 2026 09:01:10 -0800 (PST)
X-Received: by 2002:a05:6830:92a:b0:7cf:d117:88c4 with SMTP id 46e09a7af769-7d448c2348emr1443847a34.6.1770224469981;
        Wed, 04 Feb 2026 09:01:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8f7csm138531066b.14.2026.02.04.09.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:01:09 -0800 (PST)
Message-ID: <9917eca6-1543-44f0-b0c3-388a85b80e93@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 18:01:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] spi: geni-qcom: Add target abort support
To: Mark Brown <broonie@kernel.org>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, prasad.sodagudi@oss.qualcomm.com,
        mukesh.savaliya@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
 <20260204162854.1206323-5-praveen.talari@oss.qualcomm.com>
 <68908c06-390e-4717-bab2-708de7f5cec4@oss.qualcomm.com>
 <d8415a8f-81f2-4f14-bc2b-23f90879efaa@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d8415a8f-81f2-4f14-bc2b-23f90879efaa@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: usWL3gWk-POKHqGW-bolHbsEebDFi-Ss
X-Proofpoint-GUID: usWL3gWk-POKHqGW-bolHbsEebDFi-Ss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyOSBTYWx0ZWRfX1P8h/I7RWESj
 3Vcg7z5W5uJ/WoSjsKmy+v5I3RX+yShWYlo4GIt5WVXSNxEjuIX/mOV4ogu2hHq+sGkg3yTB/nI
 AzdlSmU2lBxdIl3sTVs7QiYhyQv10QjRsst+QF3iehMFGXlvfOu2u2QieJfrh+nYJqg8IBl+vSC
 gJ9ShehURSqwF1BXOaUZQ6T8rXnNzHGcF4aRAv1KlJupsJB9SGwh0QJBbLGjpQSi0lxYusEPb0/
 bjGw05npulvnK2P01LaBpZa3XV+zQdj21HT65vM43kP9moN14MC3QKf/ZhXTFXzCtYUVmBVEe4q
 PKLyh/P05htbVV+wAJwfh1Cap1Zvw11PtNd9ymACn7TMg7rlSntbCTBcqW2a1MfU90LS8j24gJq
 soyVe2yCXrvoQv4Zf1TOAXR5tDLi9NiMH7IthnPOJ6MnK6uyoE9EA/u2FEn3bHfqvoDomTYSPal
 gmU238pRIBik2DQgqGA==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=69837b57 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=E70cyP_rRQkSMiAniigA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91832-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7DC9AEABFF
X-Rspamd-Action: no action

On 2/4/26 5:57 PM, Mark Brown wrote:
> On Wed, Feb 04, 2026 at 05:41:46PM +0100, Konrad Dybcio wrote:
>> On 2/4/26 5:28 PM, Praveen Talari wrote:
> 
>>> +	if (spi->target)
>>> +		spi->target_abort = spi_geni_target_abort;
> 
>> The same check is made in core:
> 
>> spi_target_abort()
>> -> spi_controller_is_target()
> 
>> So I'm assuming the intention was to allow assigning the func pointer
>> indiscriminately. Other drivers seem to do it both ways.
> 
>> Mark, any specific preference?
> 
> Not really TBH, it's redundant in the driver but if the people working
> on the driver find having the check there saves them having to check
> that the core does the right thing that's fine.  It's not like this is a
> fast path.

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

