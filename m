Return-Path: <linux-arm-msm+bounces-91535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOVMECPQgGlBBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 17:26:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF933CEEFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 17:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4931330BE905
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 16:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC8936C0B4;
	Mon,  2 Feb 2026 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/okN7sT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LKJh3JWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85061277C96
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 16:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770049220; cv=none; b=OQaJyEkXBh7+IH7UxX66W7O+rauMpU829kRtSc3r3c44LXwOuzKf+vuoor/9tSK4G3q/5sgzyi0S4hLUqwnGkEH8RIzNr2pDIJibgGrd5+uC3XyxHr+TIwLsuNl4O2Mu2lFdAxqYuoB7ZGdfNgR4K2cCsxixwCcXYnQLVIZnULI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770049220; c=relaxed/simple;
	bh=qQCeI19q43zhf52hQ/Lsl1XTZ3EmXNqwVHsbKSSnuf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6Coow6LLkK4Gx2gRKUQt7qy/VUt8Miz+YnaKnLIn8LxZpUPJzmggAHpGO9EBKKUo4s9GIE1j91cFyS/CbIGUSuJj85MLVlFulQttZ+cXz/mXz0kzvgeNqLDxrRLuvtkotvixXboC3LEht04sH7cwk+Pd6XDXVjQ+4ZGAcJUvaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/okN7sT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LKJh3JWc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B4F3K2848639
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 16:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GN/RhHJOU3ALzGvjR26VdLNF/dFbKvBucXPsymijr7g=; b=G/okN7sTS/snq5ho
	wVV9102D2DlV4tNBPq+y+cm7ptgjxo6LFimX2Hk3jwnHObtFLVP4P/Ir0V8Ra2Nv
	KnTIrc82O35MAgXLTT6n0y6xhxXpih/Vb7IXRE6o3mZpvxgyg0kHwrUAAyDMMyhK
	3uvnPoi1DcS142IfdI+fpwyiblKlZOM3EtzWfcsSYKK6Zb9TsWoyG0J5+f93hzny
	jjpJCoRRDDAJWZtWxA7obgnEuvGJExMGhFjsLDgQkzNGOMvZtZAxxmzIj4bozYT5
	v3rhCpRNQsXb1TtnU3Vf76zZhmRF6gDxYViPpxqnLWM1KnnObAEscfbTGsKeHiCQ
	ZQN0bQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tqtgxna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 16:20:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0bae9acd4so33680055ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 08:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770049217; x=1770654017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GN/RhHJOU3ALzGvjR26VdLNF/dFbKvBucXPsymijr7g=;
        b=LKJh3JWcVTsOtV9ewHMnMgRC2ytkbolgpqIojC+tBGvSpLl8QqYHXgXvePV5JhYFDH
         T2qLhFTvwRW4oYFa3QbzDpYyu1aNMDLzPbn6F69QvQ8J24rMe8QbOQ9OgDheRdZppwtB
         TOD4+TAbWqAOKXHxA8kPqxyHicEyCge9MqR88n5aegWE/A1OdBYHXj/IPZw6Lz/U6K/e
         bL8NI1gYCsGu2jiHljcsdUTB3jSEYrstxDXTRLUNR6QicyyWERuONRuTo8HOmGR246mZ
         fy9NKxCgW72u0KvQcoCDb4xCGHglyBqUTGMyzdKFTrE9DnL2l9+3x0+VuK38eqJVU/E1
         OIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049217; x=1770654017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GN/RhHJOU3ALzGvjR26VdLNF/dFbKvBucXPsymijr7g=;
        b=MxH+Ci2ITfJwhc1yhs1ZJ9fmg9lVVOw2YxXXZsfaJEqsJWBOQ6g9Swk6O7TWZYV7/p
         6a/3f/USZoyl/DqM77GSixImxIi9HbQRfEn2IEIBqMWvEwbz3DS4H/fhVRPapDu6pUVO
         NlQzmurnkWcSfc4d9AVhdvaJi5WdgUNTYDh7436SBzlTPoWqKNAIELCmhQ//TjU8JYaQ
         NunUzOwml/fYiRtLLHx2be3Buri2oQbgkD3gAcjGi/fVLVwfoZqJmS2FUlbCQjgOISRU
         xLw23HeNKLgVfK7g/OjE3Itqg1Xbg4c0aIuL9joww7QQaLnDwBrSickGZjI92cX5LD6B
         jQeg==
X-Forwarded-Encrypted: i=1; AJvYcCV35R/9FB+LA56gQkduShTU+oRdgrC1cuO6sKaJVs5IMhR20lsI2POFGmMII5KAUsVw2wCckLgLKb1ny1yG@vger.kernel.org
X-Gm-Message-State: AOJu0YxELAtJd20YLOFX9KXmcSgCdCFUE0RsYijAr793sEjpseKRVIGH
	YFurjf6p1bN9W1iMeO6dOkn9L+1v+1MGQklRebu42kDPIZAZ6gDv/4KgmqyvVT5b00u2+JLdLfP
	xifm4jpxvcer4iyr8FvBPZqp/4oP+lqrGWqnCPGvOH9A+PK0BWEo7e0IUchLzlDhrUDYt
X-Gm-Gg: AZuq6aLT6xpH917JEK/tHnVs18JjL9ZjV/JJ2aumVYrPXLxaadRBHYAGcek87yt2cHR
	mSjMYNMGeg+oZB0c8hpcCeexp2i3oxSEaj1gB3SlhaGCfD5IKDgOn03WRtTaxQJOtaXgTwsBjR4
	DIeSmiZHaoMXlN+e3ygU3wNmrzlutx0hT3jJPq/oQ94I3xYlwr1FLDBDarvwJPWpnaiI2llXfaM
	v/r9yFISV2MkJN3VzA0XInC9YcywQBBuxtaW7SMnFHiGyFCY1F+9SAwbOEylQMQtIsimzf6OWjc
	IQ51TJyqXZhxI44QwWnZBZlF6SXkaPbNVLiUsEi3w8i+EwvDvbihlw9RGeQxqCcHG4GRryX51KK
	2L8mB/UkCAl+a2kL6yRrblzNuYM4S/nAAofjnMHf0
X-Received: by 2002:a17:902:e551:b0:2a7:cb46:706e with SMTP id d9443c01a7336-2a8d990ab01mr122086475ad.35.1770049217083;
        Mon, 02 Feb 2026 08:20:17 -0800 (PST)
X-Received: by 2002:a17:902:e551:b0:2a7:cb46:706e with SMTP id d9443c01a7336-2a8d990ab01mr122086095ad.35.1770049216518;
        Mon, 02 Feb 2026 08:20:16 -0800 (PST)
Received: from [192.168.1.4] ([49.204.107.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8980c8623sm139237175ad.94.2026.02.02.08.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 08:20:16 -0800 (PST)
Message-ID: <4e6ad74b-a717-4283-afdf-90301e63832b@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 21:50:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] soc: qcom: geni-se: Add resources
 activation/deactivation helpers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-5-praveen.talari@oss.qualcomm.com>
 <ae4eeac9-701e-4697-9d76-931a6659e7d5@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <ae4eeac9-701e-4697-9d76-931a6659e7d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=6980cec1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JMgISmeAsz0pT9/O8qDBbw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zS6uJyjHEOQbzLCDLTgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Vu4KoF7CNAaLXEqs3B1oGFSfGa3EMw_u
X-Proofpoint-ORIG-GUID: Vu4KoF7CNAaLXEqs3B1oGFSfGa3EMw_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyOCBTYWx0ZWRfX96swbhEvQJJs
 ZwoxLtwNBPFuYUurMls6fyQRSTAotwXbk2/WjmExI5SsQZOH7+ahtOvEqDu71Q6BMeXkHdLgg6V
 Qpk5SzLG4H9ArYwot1XJcgadeCS/Q1YPEZvs4yqSNhPOHrxdJI3zvpbawoBpX2P05DQroMQtQ57
 eb/WDo7jvr7Rwwm5cscSxTKQ3WQoxRkyfeu5vfhvosLgynJsghZs9F/WSQNtcePKFH9Ld8Uaeyi
 M0muXKL/LBbpGrH8dYqtRvvUp/zZbqjCmd400FlO6B8auzbSy9jt8ojcc5OhmLeoABaASWRgnJG
 UFe6T9sy+wdg3DCaI7EXlL9cptfEoySqj4JwoplvA3sLUmOIeeMwW6n0E9Y/WYK4PM9JZH2djLT
 Bgg22RU9ssAQuyg5fVaKXBuud9YUtmEP06Kjz/j/QdkSMYUeAJk/Do5G2HRD7Wik8OtGxGZbh1Z
 VM10WFjIbCAdSjCaTOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91535-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF933CEEFB
X-Rspamd-Action: no action

Hi

On 1/30/2026 5:41 PM, Konrad Dybcio wrote:
> On 1/12/26 11:47 AM, Praveen Talari wrote:
>> The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
>> activation/deactivation sequences independently, leading to code
>> duplication.
>>
>> Introduce geni_se_resources_activate()/geni_se_resources_deactivate() to
>> power on/off resources.The activate function enables ICC, clocks, and TLMM
>> whereas the deactivate function disables resources in reverse order
>> including OPP rate reset, clocks, ICC and TLMM.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int geni_se_resources_deactivate(struct geni_se *se)
>> +{
>> +	int ret;
>> +
>> +	if (has_acpi_companion(se->dev))
>> +		return 0;
>> +
>> +	if (se->has_opp)
>> +		dev_pm_opp_set_rate(se->dev, 0);
>> +
>> +	ret = pinctrl_pm_select_sleep_state(se->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	geni_se_clks_off(se);
>> +
>> +	if (se->core_clk)
>> +		clk_disable_unprepare(se->core_clk);
> 
> All clk APIs already perform a null-check internally, perhaps this call
> could be merged into geni_se_clks_off()?

Sure, will do in next patch.

Thanks,
Praveen

> 
> Konrad


