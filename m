Return-Path: <linux-arm-msm+bounces-92689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJhCGkrCjWlt6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:06:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA63512D465
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B283E309DC6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018BB356A11;
	Thu, 12 Feb 2026 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpJqUq1x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1rG4Dbv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A093F346E64
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770897926; cv=none; b=D275cL+ll4b/4rSY+qENDiFWBc/ydvEftFF/sdP9O/Lp/bVmD6IIo0iAx0B4oHvDW2MSEyqjAXhZi9qWo1SQkow94x5D98fVcKgX3MOibVrXzkQmDEJZsSeXF82XDOoHeRekJ6qqOU9UG8HQ5/vMaeteVLzGltLyfdq21qcPiZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770897926; c=relaxed/simple;
	bh=o2GFVDqXiSLUKn8UeGbPsRZ1svvguHIXozzWU8zIjZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hpw04Z6aUdbeZjCikn/DhbQc2BkFnD9QM/UX7uUV0gyxc9ZEqQoSeGGvvSqeOBchD2WkboC6gbAhQXLuIl87XMTH52VPS4Fs4Ncx//K0NCE1e3BhM3UEz7wSiwMzyGOXjpDq7MXt7ydD2GTgoMNW0XCMQVP+r6SRTjwBn9VNdWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpJqUq1x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1rG4Dbv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C6mE4R2976979
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHpGzoa3aopZAtJxfvEehMpSqEZ816kpOkyer+YIROI=; b=VpJqUq1x4U4uaVZ0
	8uMfx/11i4i/O5tLZzXy9biQVtAsH1gyOQ2Mj1AfY4TeKOG/LBF20+CuJyem2Cth
	psNooWPvjpsD/Tf1BdqcXBY545Clbx176K/2RbxMRGF/16J05Row/CnpYKA+R5fV
	FStFEkGpClfx8tltg8a1yC3ZAAMpx0PvwInuYx0vzO+qIuQ7whWGT6t7Xarxv74e
	7h7Rt4NHZrk4mZpvZCmx9b+fqQm1IVWKRCAFzhW6t0/WOGzzIBkmzLPAk5MjVEJ+
	JfzpxWIWTnSW/AMnl3wzEOksBV9rJSUZlL7Ocb34lfRU0bntKCSHIqVahF+X70x/
	Y/GgIQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wtpk688-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 12:05:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954937be97so22716406d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 04:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770897924; x=1771502724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHpGzoa3aopZAtJxfvEehMpSqEZ816kpOkyer+YIROI=;
        b=P1rG4DbvXTwogHQiPHoJA46cssDjLbzEelbSKm44tAYDctVIm0jXhV81hu5vZ4k/oe
         W/mCZdUZQwFIGYU/Bjl1iY5aSzJcD/Kfk7qXZ0xQHcWntxmSn8outCZ5YFE2hI4MPtlO
         Ipa9A4UebWQ/qPnZkkQldapqb3adRk2npWpdR85KmkU1yg8RkyWkGjtlfVYVyJsWOPFi
         lGRO4wtoDavpcfffbA7PJDBQERUlkB+AbDfFUz9/KbWe9yujCxkJz5CVhPfpa6gJ4Yh8
         1CjN0Sb5ICL382FMalaEW+ukEgI8SoT8W/PJcA374bWA0we33sMw817BBezZKGp4zs9g
         5fTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770897924; x=1771502724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHpGzoa3aopZAtJxfvEehMpSqEZ816kpOkyer+YIROI=;
        b=ohuROa+1n0zOpz833wtD3a8rYFojK/bpW/+o8M8tJKJIu/W5kuet+ARXvTXuLgoa29
         RpcHDvSXv2QWyIqMBCsECyOfHretNeORuqTHLHj1rYmzBjWgN3zad2h4ZTKmuAe307de
         2dzZ9vzbLBU6OrT03EEXPufrDh61maZ6l7ZNNsvDziufD/dyBfjsxqslP/DPRN0uxTku
         /XrU6hBEm7GrF2grrcEsui1qSKLU8QMYTu3yu231tcdYhxD5DTuWMI1sflczVRjOxxJA
         N5Xu4p2SS3VDitZxR/YKIo21Hyr2HhSjgurHRKUhNqWdweF8RY85jlj7uiLvLJ/n03bg
         WnxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU2NZ66BE6iiz/JPICQLz33HWhbuu+jqdz33eSnAcvaJd8N8lugaRwnD9DDsU1tO5krvCyo7K/f0VhDw40@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3tfLH433xp8wa4IR60WViEF4sDsyFU/egzp896hpWF0ZPo8vY
	vQpVQmSd6UL97W/r14AXHh52nSxMstbvyWWXWYubixf8BmbxvaH+oRE7IJRuSx9z86HNFOHflZx
	LMf9xcUcUqfFOcIiQz4u42EP5Gd/GH9HfdwlnApqzxS/sADi+JMgf9ToB8ryawO9O6/ur
X-Gm-Gg: AZuq6aINZQGdwSa8gXUQB3wsrmaktvIJu1vLeA4KROyRHun3dpFmHgyOsLV7YCbX43R
	quSdQSNeeEjRH+OAp9FGQHvNmANnxCbxJqB24h1nyskGYWwX8fbWVQqRz0LXEK2vlhwdMh5EnSi
	ssv0cjOD2Ml3O75iDtgvLaSglSZKVmH8mCTrpvNdoAdwCXOHpyuJWrJUJqyzupTXBRavqyVjDUh
	fn9rbOHXGvpNoKMv2mTYMeFi1BGyuFSaLsorvRj61pOx52qL5KUOUAtRmXOgCcRMBRaLocvKdZt
	o9ohJ/mAR/exfKBTxHKR0QpMZhuhXAXjS9bVL/YP1lzavHkPP7CMJPIqU8McEMJo0AQ9sgHVa5b
	j82RprVoUPVL7QQNUOf0J0U1X0dXhEV32WPNu6WkmDkQW+b2T8NUaDrpqOQGzEBdeYghrV7AZqu
	4MZSI=
X-Received: by 2002:a05:6214:484a:b0:897:1d50:2336 with SMTP id 6a1803df08f44-89727972a48mr28203086d6.6.1770897923775;
        Thu, 12 Feb 2026 04:05:23 -0800 (PST)
X-Received: by 2002:a05:6214:484a:b0:897:1d50:2336 with SMTP id 6a1803df08f44-89727972a48mr28202586d6.6.1770897923258;
        Thu, 12 Feb 2026 04:05:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65b2da1aceasm1112696a12.19.2026.02.12.04.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 04:05:22 -0800 (PST)
Message-ID: <fe57b3f0-cda1-4bde-a215-12e3aa9ea344@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 13:05:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: ice: Remove platform_driver support and
 expose as a pure library
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
 <20260210-qcom-ice-fix-v2-1-9c1ab5d6502c@oss.qualcomm.com>
 <7d61d324-0d26-47ce-aac6-d17abdcf05cd@oss.qualcomm.com>
 <jkrkp74jgjg6d63ro4inl7ily4p6s35hmhpxeroyzue3o55tto@sgl2b4uv6ysv>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jkrkp74jgjg6d63ro4inl7ily4p6s35hmhpxeroyzue3o55tto@sgl2b4uv6ysv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=baxmkePB c=1 sm=1 tr=0 ts=698dc204 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=FGFzfvMP8PCZN11w_dYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: faV2A6Urr48EJ9l7LwYug_n55iftlsm9
X-Proofpoint-ORIG-GUID: faV2A6Urr48EJ9l7LwYug_n55iftlsm9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA5MCBTYWx0ZWRfX43LikPD2n45D
 WWwevcQdq4f7CTXopsu5HFwNp5HHp8ovhf66S/HjUECdL1yWVHiw76OvKJ3BFiHLTSUAdi1kZlB
 POZ2LEGTIqcv6z2C6s/p970oPLvqLbwiUamKp5F7GqXuhkD1259g3P0AnZ9KeIQd4O2CKOqBrlr
 uGscdmuWOz/hgsPPutpWHiFaJsBFZxA3NJ6pO0/buVlicwm7129LjQJY6bHBTeGWH/4nmNgRHCl
 T+0njS2NeVTFUjP6fhpG3JbwLSf+60/YimJmZJD3nqqKeUgdBk3UZdJJp6Ph5jox18+4di7S28L
 fBld09UNqcXzNg8h6ruK3nHiLHTe4KbQJ+yQS6qZNaSrBF8YtUc4TOtXXknhyEXeS947TgIxRiN
 bkBHn8MrTgZvK6X76rQgUc1kmOi4E00KMl+lsv9OhNNJekCCrFy9TgIyaIhsKtZJw7SD/jBI49c
 9LSr0LREPH2I+iqUpXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92689-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA63512D465
X-Rspamd-Action: no action

On 2/10/26 1:19 PM, Manivannan Sadhasivam wrote:
> On Tue, Feb 10, 2026 at 10:39:54AM +0100, Konrad Dybcio wrote:
>> On 2/10/26 7:56 AM, Manivannan Sadhasivam via B4 Relay wrote:
>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>>
>>> The current platform driver design causes probe ordering races with
>>> consumers (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE
>>> probe fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops
>>> with -EPROBE_DEFER, leaving consumers non-functional even when ICE should
>>> be gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE
>>> driver probe has failed due to above reasons or it is waiting for the SCM
>>> driver.
>>
>> [...]
>>
>>> -static void qcom_ice_put(const struct qcom_ice *ice)
>>> +static void qcom_ice_put(struct kref *kref)
>>>  {
>>> -	struct platform_device *pdev = to_platform_device(ice->dev);
>>> -
>>> -	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
>>> -		platform_device_put(pdev);
>>> +	platform_device_put(to_platform_device(ice_handle->dev));
>>> +	ice_handle = NULL;
>>>  }
>>>  
>>>  static void devm_of_qcom_ice_put(struct device *dev, void *res)
>>>  {
>>> -	qcom_ice_put(*(struct qcom_ice **)res);
>>> +	const struct qcom_ice *ice = *(struct qcom_ice **)res;
>>> +	struct platform_device *pdev = to_platform_device(ice->dev);
>>> +
>>> +	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
>>> +		kref_put(&ice_handle->refcount, qcom_ice_put);
>>
>> IIUC this makes the refcount go down only in the legacy DT case - why?
>>
> 
> It is the other way around, no? Absence of 'ice' reg range in the consumer node
> means it is using *new* binding.

Yeah obviously you're right

I suppose in the legacy case we don't need any refcounting, since there's only
a single reference, from the storage controller device..

This assumption would break if someone had a funny idea to specify the same
"ice" range for sdcc and ufs though (via the legacy binding), but let's hope
no one does that..

Konrad

