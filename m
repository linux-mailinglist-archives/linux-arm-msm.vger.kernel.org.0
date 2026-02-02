Return-Path: <linux-arm-msm+bounces-91521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAP7NpG8gGl3AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:02:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82981CDCC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44C5A301DAEB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 15:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E91E374189;
	Mon,  2 Feb 2026 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtaZJJNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AblAgGM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E473F364E85
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 15:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044507; cv=none; b=TI1eEQXOnP8/IIJ4Rbvsj1VHx3GLzsWWZSBNd2rek/ar8vGwrqtui0R2MSMGmsWx23UKGOAiaZeymhoLBviqYP8oRc07Ej85mhINZr7nQZ9LJqAP2rHXr7prXyoh+SnKdiLR5B2Srm8Njv0QJFlomYgvmaLDLwnnmPj9er3UcNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044507; c=relaxed/simple;
	bh=JcxIl+U6XrrYzwzysRKriC7B7jJmpe/ag7DnsCLo6KY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6N2ehjCf/ZS6gO/doyDXFN1aq8SRZW+SmbXPy6L4VjDuplGbhJ/s/e+IcaavTjZcXlAOqiQZQoSCHyMnT1kzl1MJK3kS/LVdzY5ld+dG0n7ahpjfN0Id7EemOjI46MXphqs0ZEwmQXS7SSRQqlBRw+Y8jbzESn0f6ljVida9BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtaZJJNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AblAgGM2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612AtJfs3915998
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 15:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7LkWBSg9k/hqZXrb855SBQlwZa3bPE252WnYqjGZpc=; b=GtaZJJNFInkB0nDH
	54tU49dyHv+VRHJZVBVJMVqJVvxuHoy1ovO4QvYQfZfGdsGfExvWo28Un/bDUCk5
	VKxVX2OW1YQnzWUG9zpQkzbVrouNacirwHDWVQItC3VXh46cmsOlYkcgvPKDkcut
	5fjMcnaME0scGguzeWG3lvQdQsudjNlzePnArMMwXC4ux0kXQKS5WPZoF2S64/iT
	fk/2FcJZ6/Y6ZQZiUqttHbdeyQeXljEK2HBkEPtbjVxMLv4Qg5uGQEOeBJ4a93Vz
	pSsuSXAlg6LQYi4O8n+B1BwjGjUKv/X8dxuXJfgZwprHwaJ7P23ycrkSogrria07
	h6XDMA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmgn9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 15:01:44 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-40445fbb208so700866fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770044504; x=1770649304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7LkWBSg9k/hqZXrb855SBQlwZa3bPE252WnYqjGZpc=;
        b=AblAgGM274VEbWYjs/UhCbYCGtZPQe/YGUiPcBm9cUhrYjyWsNNJrVebLVZGqqjPhG
         xUqdUMWmjeQKKFQAFKc6klct+3n8OTqJ54+GNSVzbrdv91d3ujqwQAFc0rC4xZxpCY0l
         Oo2RKwP1QwM/QxbsvGBYdqYX/gxJi269czzwX3FEdhFBl/DMgP7lBesf6m64kee5cQDI
         yr8gwUKeb2nGO5Itipe4uTIdHygEpcMIY8JI2ClQd8efqdp7WwL2XVKcARAnD6gvIssb
         4yMlEmiEMoN3xL+Q3r2t4lmSkSEP6x1/SLvjFt4To7C0vjX69fKEWI0mVdAMIH2flXCR
         DLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044504; x=1770649304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7LkWBSg9k/hqZXrb855SBQlwZa3bPE252WnYqjGZpc=;
        b=vOsKyLZNaKN7gDFF+gyWywjSUoxU+f1Py9ElI0DYVvoOqrjAguLqlT/HsCXMgdpVj4
         Ok5a6Fz/HkXBs5gEwGCofl1sYQay/ICfXju6RtKFamTsBG8M8bbC+BOSi9IjCP/LLtpZ
         EXHUElxlgSoSvZxzgYmsdb+oH/qu4hT6mzLwIoQOdqIqeYF5SbAp5sK66rPOsrvd/JCp
         PGc9S82zipmSWHol1raWKlQFJOaGVeAPb9vOV0Bbr+DgXpa+Kz6D6Qa0KeOQf8kFvMcB
         Rcm3bDsQyGd0fCcgOVHwGbqv1UO73qQWLfPxCCNVJUFSUSxhLiD4q6xH/3LIPzWGoQdi
         ZwoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBhmLwtOlUeOffF7ZtGXCWtzF9nyDQzfD2BiJ7+QPoCc1AFwevv7Rft3lKhvTLc0R5P/RQchRBUuGd+8ec@vger.kernel.org
X-Gm-Message-State: AOJu0YxCqhMAjb8IDcZZimWVVA/HxwE/CkX2C/E1SW45SdAa3UH0SLvq
	c9yhlyBObPeKuNOSf4v60rIUXP+NRMTi5pkYA8CfYDTXRBE7yfgyej/xmrzoBOwfHuoRbODtIIo
	m1N62xsari7f7jao0h9/MsD6Jh3YzW4tU7lvU11D2+o7AQV9cPMQ/l5lZX+QSxLa5ek3m
X-Gm-Gg: AZuq6aJWiHpItHKb3/wVmdxYW511c1mDfmJv7MwmOcWxx9DMBNRj/lHdnX+XtPycFAG
	UIm83al/wMiOY4jwcyZYMC+9CKuf119VtJxGgFMXBT0OVBBHCbqT8ZqQO53EkzkKmn/uOB2In+o
	e9aSGFQmIqDEH1SXy3zoRrNo+rGSSLgEm7kX4y3fPDUTZJeCOssVoL0vrv8betzs82iaycPbcX6
	ZKau0s/z6mPpnNEaPEvCGTYaW8b2KsHFmfPsfnzqvZEeCBkBpOVSJZ0HSoKEsN80lqilnHrSsyk
	KEUV7LfsUgE4NU/bWpciEwNzTskIOp+1n/K4AQDHGY8S7n0lfiIZ5cm1SoIHQneo0gqisjRpIpl
	+cArcVWHEaAArbWJpBWSVChgwmsAO0Sqg+aPxYT2ZM+seBz9toRHrg0Jxpw9XhMkmLU0=
X-Received: by 2002:a05:6830:4124:b0:7cf:e23f:5ae3 with SMTP id 46e09a7af769-7d1a525f7acmr4859573a34.1.1770044503739;
        Mon, 02 Feb 2026 07:01:43 -0800 (PST)
X-Received: by 2002:a05:6830:4124:b0:7cf:e23f:5ae3 with SMTP id 46e09a7af769-7d1a525f7acmr4859515a34.1.1770044502743;
        Mon, 02 Feb 2026 07:01:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ecc73sm897795866b.62.2026.02.02.07.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 07:01:41 -0800 (PST)
Message-ID: <cac8e14e-63e4-462a-a505-cd64e81b2d1d@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 16:01:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Enable ICE clock scaling
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
 <7b219a50-6971-4a0c-a465-418f8abd5556@oss.qualcomm.com>
 <aYBF3Geeuq2qHmYg@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aYBF3Geeuq2qHmYg@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6980bc58 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fQ1HhNXxD7se1t-yopsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: bzgKF5e-Y58GcwVI2fV9hJBwnzBXAu1o
X-Proofpoint-ORIG-GUID: bzgKF5e-Y58GcwVI2fV9hJBwnzBXAu1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDExOCBTYWx0ZWRfX/lQpIATqs0a6
 k/kH8j3ZF1FQWTImbSG6x5/KCVO1nJ4zfYT9TSGjJznbY6uwA2x8MT0VHHiXXQFAoyDfiOxxjKf
 rNG0qfhf1gy2/9xJZa8I98dvVDkWYPikicumTBAPQXWcC/2f4CIZHGxFSuH3D8sCx9T2AxzI9Fs
 Yf6Pe70Bbg/dMz/IzsoB0wKCd5Wf+H2/CuHm4kvZaZ1tUCJQGBYYAP+5cHICUkKnVjxEU+DwDCG
 De5ZHkfDrTQZzhgBvpqtA49/kJbZNoGTUoqDSN+Alosv72Sdl4qSmrLhKyeYIkUQKYyKwQnTmc8
 CIqJXqnSbNttmq+qZqfZvczimsorz+jrINiWREEYf/Zr3cM9gUsIE6/4aCpbe/0sV+nrxZLHi57
 Rj7N7BGO7Iuud0f5qAqzMDLmhO4Yan8ztmm/A4Twaj8nJWVHokJ0BErgr5uTTDqkDMGY3qNAVpA
 /5tjewAwMLEDfiWCV6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91521-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 82981CDCC9
X-Rspamd-Action: no action

On 2/2/26 7:36 AM, Abhinaba Rakshit wrote:
> On Thu, Jan 29, 2026 at 01:17:51PM +0100, Konrad Dybcio wrote:
>> On 1/28/26 9:46 AM, Abhinaba Rakshit wrote:
>>> Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
>>> using the OPP framework. During ICE device probe, the driver now attempts to
>>> parse an optional OPP table from the ICE-specific device tree node to
>>> determine minimum and maximum supported frequencies for DVFS-aware operations.
>>> API qcom_ice_scale_clk is exposed by ICE driver and is invoked by UFS host
>>> controller driver in response to clock scaling requests, ensuring coordination
>>> between ICE and host controller.
>>>
>>> For MMC controllers that do not support clock scaling, the ICE clock frequency
>>> is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
>>> consistent operation.
>>
>> You skipped that bit, so I had to do a little digging..
>>
>> This paragraph sounds scary on the surface, as leaving a TURBO vote hanging
>> would absolutely wreck the power/thermal profile of a running device,
>> however sdhci-msm's autosuspend functions quiesce the ICE by calling
>> qcom_ice_suspend()
>>
>> I think you're missing a dev_pm_opp_set(dev, NULL) or so in that function
>> and a mirrored restore in _resume
> 
> Thanks for pointing this out, its an important piece which is missed.
> We can use dev_pm_opp_set_rate(dev, 0/min_freq) in _suspend and restore the

FWIW

dev_pm_opp_set_rate(0) will drop the rpmh vote altogether and NOT
disable the clock or change its rate

dev_pm_opp_set_rate(min_freq) will *lower* the rpmh vote and DO
set_rate (the clock is also left on)

Konrad

> suspended frequency in the _resume. Something similar which is used by sdhci-msm.

