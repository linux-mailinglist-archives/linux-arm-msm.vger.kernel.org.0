Return-Path: <linux-arm-msm+bounces-91773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN0ZILHcgmnwdQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:44:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E7E2126
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 377EC30601A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 05:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B9634DB66;
	Wed,  4 Feb 2026 05:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htPMq55m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jc3iGYdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAFE34D911
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 05:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770183840; cv=none; b=RLJbG4k+/4MWKw1etw1/Sxy+BxkK//YGQp6p4dGo1fBrcMnIEZw6T6wNDyar4izxLLtmWnz/CsRNcXrPlxoknM8p6MKhH0Gu2+SC0v2ZWfA1O+70VgtczsY71/rrjoeB/qGs/ZbFde3P4HTrDuvjovOTfOQIXAfpaeQn7b3WRjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770183840; c=relaxed/simple;
	bh=go6m8g8r//fiUrk5B79pQDICJEzKqS0qc5HSpLjpegY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tOC7Vvg3Vhcax7rbD7PWG/lz/zXluXt9noCJZeu6uuhUaG9pPtkPSLLCKfYLqjoOuslwSXjr7y5TiFQ1R+sUBO3piAksVenXRYEH31ZkQYz3Monx65/FJJuClbSoFYipqhCBPfWVkJTlNnQISVxLcTklCioNt/ys7BtQz/n9++s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htPMq55m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jc3iGYdm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61453hkB2829158
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 05:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POZ441e2LFMbxIQBK+YboacBpaYFysPEfDX6j0TRNhU=; b=htPMq55m0Y/EQ4Rf
	oO/D1UE2SoCF0JuHd5TI55XY9BQh0RoDqLs906WG1TCCee4UnauKZiDl+okExb//
	ngLSTRPfPO5ssMVIgLgCES7gNNn6S24I8igrHtKTf68j3AmymW2QsXANcJdBIWSl
	pLuRpwGjJN4n+t0rFE6YTOBVMQlpI6jazw5mbSVRSSGUoyxGsY0jg3Y28GeOS3h+
	il9ZHXop5mNHbsH3nDbHGRGYPDc1NQJ5nkrENk5OD0svTBXNcwnKkUOYmFtGz7BP
	aa7ZaQ4NkZ/YmGWNN4ACY7tXkqHsXWcsHxeClyiy0HrXwq6Azzhko84VCenqyiih
	BClj2w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ndvj16n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 05:43:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8227fdbc51cso3238876b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 21:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770183838; x=1770788638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POZ441e2LFMbxIQBK+YboacBpaYFysPEfDX6j0TRNhU=;
        b=Jc3iGYdm6MY+SJBgggpd9RfrW6V7PYI7al33TzdJNOyXeviLTcJDEtgrP/yeVXw76p
         unYhxw4czJYx0N/KjJsYxSSMsbUDPk53Ggefn5rsN76lfswnIDUDtW6GRBvszvdzHa6/
         hYRlKqS7+b+rKed8ybecHvOk6FgqPJmJB5A1Czo7CeetWuuclY6mOgBBlgDq49LMDcrq
         xupDncWHi4J5FcXjDUGi64IeWfsTECOy045/40wjRImFlYGNsBZ3Bi9Z4xRVum6Vzxf8
         sHHv+eixVCyV94X0vPCkrclxB+jTZJ2BadaiKXpjvRjCQG35BK81YD/sY7mXYvxN4EZP
         78Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770183838; x=1770788638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POZ441e2LFMbxIQBK+YboacBpaYFysPEfDX6j0TRNhU=;
        b=OUGcXaC5wcn7HM8cBbWWpDRHDnpIJs+7zRizkrOUrh9xw5VHRA/WNNPoytSIhYMP/V
         s2UK0/dgu+oJlBdnLs4wjU5dK1q5cMhAumQ9W27nfbB4X5ug6EIgAibp4dl2HOjYHrIA
         XmXCWswT6kLTmcLZ4JPhCq8bQwqucJ+t78HQ8qKurQvDtLGmKzZ4LkWRfkoFDavXncX9
         I5V1/93wu9DZnFofyahCOiYtcllVneaNd4e9+Wc8rKJcVQUPpsySf61SamAXBy6+cSHc
         5vmjqMWHkHHzWT99HJADmpT13HtdBUoLK+Ium7ETcrQrd9pRh08P1ympuRc06Ek0eap8
         2Phw==
X-Forwarded-Encrypted: i=1; AJvYcCVjIjQ4r9p1iIB2gEVTnFbl94iDmd4YfM90JMusz7XSTZvwfhb4DZ3pgu/iZ8LV1IyFOpChW5SJcx1znAfg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs3HsyXWyJf6E4nqDjkJiNpLxY9Gpqm+SCZAyX0+nQwpG32Olp
	c8ABzDa+VgR/IMLhp7gE29vdZ0hyBOC9AN4eAvOj+vBwD2C68JnEDiLh7DbsiYWSRe+lOwpOt4q
	2a1Xu/uYOMhdx1JZKOUcCCEiaf1g2eRt5OJtO4fsd7DQ6V/7EXHoFaJJVMJRA9gLBff9x
X-Gm-Gg: AZuq6aLdBDJz+i8WXPclq9Ffl+x8X8YBlWVVP9PdKlzdUJd9OLeNk6x5PvbN76BxWAv
	xtWX/IQ012YHrVMVRJycDx2aHBsZJ3ACe1ebZ/5E6XTw2bzHcUdLxFyw141crgg4z145kfCgQ9L
	2jKHUALWfIoqKk51DE9iu5n/eDBEbAueax7SoA0dUNL5JnOku/8ujyvrosqklY+xmnkt8TgWKs9
	mfAImu79PtA1hGAIHxm+0Qbb5dRJ7+/LvRX6KNvfrH67hThTxNUdSDhyMRNSGQzk3cmrqQ6OcPK
	4iJuB7h+W0Xi7BUcAMSc+Q/ctkfdmc3key8XX43PLhhyTPKcJv4s+hf4fV4xwd+s80wv8QDOM11
	SRdmB9ryWb1mfrlYBeuCiO+lc8aTr1g2vwS1swgof6A==
X-Received: by 2002:a05:6a00:4c92:b0:81f:4c37:7647 with SMTP id d2e1a72fcca58-8241c79edfamr1857634b3a.68.1770183838558;
        Tue, 03 Feb 2026 21:43:58 -0800 (PST)
X-Received: by 2002:a05:6a00:4c92:b0:81f:4c37:7647 with SMTP id d2e1a72fcca58-8241c79edfamr1857609b3a.68.1770183838024;
        Tue, 03 Feb 2026 21:43:58 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4a5c28sm1239114b3a.62.2026.02.03.21.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 21:43:57 -0800 (PST)
Message-ID: <bc743f55-75ae-42d6-82bf-593ad2359134@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 11:13:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
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
 <20260112104722.591521-13-praveen.talari@oss.qualcomm.com>
 <8e410852-37f2-452b-b851-19b7c4222727@oss.qualcomm.com>
 <e9d3c0b8-2abd-47a5-b594-83f0288d95ba@oss.qualcomm.com>
 <6e5924f2-a9e0-45db-8a79-b328ebd12a0d@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <6e5924f2-a9e0-45db-8a79-b328ebd12a0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAzOSBTYWx0ZWRfX/76RXIZTmWj9
 KtEB2yPlTQclUKpEPtG92xWl+SmNhlVFoBvYUmg0KEUISIfkthDyWwyb6BCWV8Ulmoujp4AlOe3
 mLydEW2kwX/RHaqs2HDuVbV/Pzu8JHRtX9ToV24+OLXBOf0/4uYJqNwxYNL7fPB4Ac0i9x2/ofl
 yLvzkdFFf69RbUG8frYS93c0uMndxHKEfMGYRf8wUNgYlstZOQcycS/DVYH5XYI7WmKqDh4tAtr
 zOVJtC4eJc5B39QuJUf4IOfyyrpoOneI20uZQAoduiGPnHBSeTNrPnPeFSAzcHDkw5P4/0ymEf7
 JlReBwMzdLx94ke9xYzGcHUvZZENQZH9/AA8foIdewhgt46r9ASsQm1YHzUArB13N/1OBXjkFBm
 lU6wxegC/BfBCVin+HFdvwvZwUv1xSwNYyDsgb07iWeVDAX2HZf1nDvjXQn1VgMCfOP23mn+iPY
 BxpREI19PWL9/bKORaA==
X-Proofpoint-ORIG-GUID: K1OyVSVsi_sRsiM-b3k5ebjpbBw5rQEM
X-Proofpoint-GUID: K1OyVSVsi_sRsiM-b3k5ebjpbBw5rQEM
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=6982dc9f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=WgL0-2sr_UKP2Gu6nnoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040039
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91773-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 072E7E2126
X-Rspamd-Action: no action

Hi Konrad,

On 2/2/2026 8:23 PM, Konrad Dybcio wrote:
> On 1/30/26 5:44 PM, Praveen Talari wrote:
>> Hi Konrad,
>>
>> On 1/30/2026 6:04 PM, Konrad Dybcio wrote:
>>>> +static const struct geni_i2c_desc sa8255p_geni_i2c = {
>>>> +    .resources_init = geni_se_domain_attach,
>>>> +    .set_rate = geni_se_set_perf_opp,
>>> This means, on SCMI devices you won't don't the vote on the POWER
>>> domain (or PERF for that matter) and switch the GPIOs to a _suspend
>>> state - is that by design?
>>
>> With PD_FLAG_DEV_LINK_ON enabled, every pm_runtime_get_sync() or pm_runtime_put_sync() on the device triggers a corresponding genpd on/off transition. These transitions are translated into SCMI power‑domain commands, allowing the firmware (GearVM) to perform the actual enable/disable sequencing.
> 
> Does that handle the >1 pd case too? If so, then all good

Yes,

Thanks,
Praveen Talari
> 
> Konrad


