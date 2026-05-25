Return-Path: <linux-arm-msm+bounces-109659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC8QOaZJFGoqMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:07:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEF45CAE55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19B7430057A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790B83806B6;
	Mon, 25 May 2026 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DC/D71z8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5QdKJqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F914E2F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714468; cv=none; b=edPCD68VC4tESVWdfD9Z6cKxw73kwKqsvZ9MaL/wEaZCef8KyuTxIgx6Ejmc5LMb3aIjNzyadjNbR8V7jfG+/AAS1l9Ae+gNbqIM0/sn/Y9rGxI2jnH2NTyrxX6K1xWRbYbaF3CpD1ZpDcrx0/lIXe//qsa83KEq2bP4EsRAk7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714468; c=relaxed/simple;
	bh=FGh9wbyR5wQdQfoGl5QdsfDgHApADG1vGkiBgzcWpaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IMBy7ruR+fyRk55y3wctm/OUvbts0kh+vFOAqQW9KR8HTFYBs3F//hwzeyz2WwIxpL5beBiQlxvApQ/lGFNp+3fDnNYJLjl395kFZFxl7C8d7Sp5QC4+wZhvYDFJEvtrZXaWqBxcL7s5e209SxzT8Pj2qAHz6at/3/PNFBOW/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DC/D71z8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5QdKJqW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9EK7K079208
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzRZmaAdBmhSzzrkfPycqssxyvsq883C0Kdc/KcJSts=; b=DC/D71z8QIuEE9yE
	J6LYQFcfF3WoXYg3CH72K09dPr7t/U7zFstNCqpQt14dmegsZnHEu4hAv91Xh351
	XJSbG205ZLpjFhz/zhyafNeghE5kqLpi+jP+Bk41+se61hYajslr1K03Zamtwd0G
	f406Pi40hWQPsKkMdty4ikv7+8oOxLgnPLRd/0Ly8GqSiRNsV0vZEHedB/TAWJmU
	4sJJdORNHuUvPj7xI8y5XUC7ipPukIo21wusbJr+y+Yc4hMNHKK2SI/CnOu+iap+
	KDztTk0uOCS8pdUjcWBXME/J8edliqJQS/pOhuutirEqdePpFTL057yHEB7emDhj
	4Getxw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma8qyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:07:46 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4349dae67dcso1692681fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779714466; x=1780319266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzRZmaAdBmhSzzrkfPycqssxyvsq883C0Kdc/KcJSts=;
        b=X5QdKJqWGMiVTAFfbqXhTgvwO8y92Ew7TTlRVY09I4PTXTk07/PRmhXbMkBMiIwpAI
         dK+78MktPzfXhrBMjabodXhCw5KO/ni4zYmdKkNj3o/9wzH1NbTNnIp1TzmT7RTv9bVp
         yybg1XZkrD15lHE6PMbmoMGG/1wWbwpZNRoQGPv5lvwudruEYfSaOcCuRrJNCUrdNyRP
         8NHl57i/LjQ7WF6PF/xEtWwj2lipJFHZ6yLXRRCA+Dt1FP9LIbMvdo4Qg5fgn1RCmtIi
         tae3uuJfr1CoeE38jO8SX/S4SupMNzuu5XlxWKsCTS7MuCCGvfvqdCeakMpZXQQQnnzS
         TWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714466; x=1780319266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzRZmaAdBmhSzzrkfPycqssxyvsq883C0Kdc/KcJSts=;
        b=hp3Cck8n3fVzpQmx5DLAZsJUBU7XCF6qqsElNyFZ3+jzK5d0hxElbE5veClbPeo9d6
         YSS68LkhSzuHgu8bx8gy0Va3LfRitZsiqr8u5vOs2W9DVsbNxliMlpkoV2P/Smpjw5mR
         BWaKAmW36Z5n4WltpEyq9ePrIalG02lm5yslH38WPLas8iSof3VKydR4OPzkhz8flN2a
         P3lSdn83duF83FJAM50CjVp/yJidkEIW1KzD0cMOuIlBV3TcBYCrQelKqUj4Lik7QXCA
         1SX//NzJ125QC6N38rFLgy2J2vdXTD2lO/MIhC5MR0/T6BBOSPq84wj9/BKG4tQrRI5T
         U3qw==
X-Forwarded-Encrypted: i=1; AFNElJ9X2BK9JgqQidpifgtU9Vax7R2Y+ZOmAIbzd0ib5RoSbeBZEbssFJdXSPfzNGj6r9L6ZyGJnSSoP+wJ7pSj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy/XvN5iNrOG/wgypzo/BV5lL35sDDOIde1bBs463jCEF3oBrz
	mnpRsSaBF9JODayyJ0dc5dgwcOcNTTgVxN+lcFwK/KjAgQVVoY6qPQAtyV/mSgZp+rgqQk7a1/4
	klerLXMk1qvEizePHQLk4BXcknL1HSTfySDcBqqJ+PdQ9OGin8biVsjudy7MS0xf7YLpmVdoJGq
	Dn
X-Gm-Gg: Acq92OGP3FTeI3Mt2pyBJo3RreoTZh+tnqsoB9Ty9SN9sHibAdgzKlraN7haQ/qAM+r
	I1/ofhYRR2ucVz82TBSxNyJrAAjYojnfBbRR1M9YW3D0vPlT/WZGgcbRg6skksAf/PQiAZPYFPG
	LmHNIwkQQrGtA/S3sOVVtNMzukUV2gPzgqAJYd87lxX0/6cKK/R5gax94qya7sgApfHYQE6tos+
	RRlwMOuR4GzOQbb5pyqUEDE6wWriFKqtGkLutUFcx7h4BWWWnQAl/mbdnuLzewHvlG9ytyx5TQ0
	pAw5QLU3yar/lwrzApGAzY1/Vy/a17PkQyXrP2RwLSsYQYE5f7sXSw9emPH14L/8hobEWHiEIKk
	MO43bh85eKkKmUvVVqQ5iIczY61TuK1uj9qFE2/JPwIqpsA==
X-Received: by 2002:a05:6820:5457:b0:69d:449a:2bed with SMTP id 006d021491bc7-69d7e854c29mr3518785eaf.0.1779714465632;
        Mon, 25 May 2026 06:07:45 -0700 (PDT)
X-Received: by 2002:a05:6820:5457:b0:69d:449a:2bed with SMTP id 006d021491bc7-69d7e854c29mr3518774eaf.0.1779714465275;
        Mon, 25 May 2026 06:07:45 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d9520sm393075866b.50.2026.05.25.06.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:07:44 -0700 (PDT)
Message-ID: <cd70aa70-1e1e-4440-be2b-414c0d331099@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:07:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
 <9e8c0351-0168-4d94-8610-cf2cc2f030f0@oss.qualcomm.com>
 <1e54db48-e618-4525-abf9-ee65d0a1b71d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e54db48-e618-4525-abf9-ee65d0a1b71d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a1449a2 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EXL2SugY_77LC3pzBmYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: wtW62d_ykAU7eOCPNfXvMmJ-QtqW7t-n
X-Proofpoint-GUID: wtW62d_ykAU7eOCPNfXvMmJ-QtqW7t-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNSBTYWx0ZWRfX/86LYub1uyyz
 Z39Mr18PMao8WmVUCBjSqpuHXnulrpN6WbexYCEhcC9aLtLhVzAmdXlRz50vVNZqk/SnDMwpbYR
 nyt0p/SO+WvWpuZiW2sXKteqpFD/gmzVvepdzHT2wmnCdwdCEWOOzJXwmvIAEV0oQxUI1PPcfo1
 YOIdV0WGYLh8J1eTaBIV7ntv/QVoZ4CI9KBXonMrnTznZQmCvBO66oDzA56so8WMkN8fnY3Bzp0
 +JNpskFniPtherGN5riw49EJs6/wraHXzwMN/7fHaHERXQ/6XFjJBzNPpx47NudPX0w0+Yeocwj
 KSM3SeAQbtqPqEDoD9sjCD9BZvryd1qH9zwQn0a7dAmcbcgwT23hmEoKhJEYjOQTjmj3Qfdt9G4
 GdQEt+1VNej9lHYD6yCv4dcBRP1baEgYDNK1dPULVcawqkAQpejR7CfMexuaUn6qKJHhkhFAKze
 gdeJqPQILC24zYFi8xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250135
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109659-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4CEF45CAE55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 9:26 PM, Ajay Kumar Nandam wrote:
> 
> 
> On 5/22/2026 6:55 PM, Konrad Dybcio wrote:
>> On 5/22/26 3:04 PM, Ajay Kumar Nandam wrote:
>>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>>> for runtime power management.
>>>
>>> The driver now relies on pm_clk helpers and runtime PM instead of
>>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>>> clocks. Runtime suspend and resume handling is delegated to the PM
>>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>>> PM callbacks continue to manage regcache state.
>>>
>>> This ensures clocks are enabled only when the WSA macro is active,
>>> improves power efficiency on LPASS platforms supporting LPI/island
>>> modes, and aligns the driver with common ASoC runtime PM patterns used
>>> across Qualcomm LPASS codec drivers.
>>>
>>> Keep the SWR gate runtime-PM reference from SWR clock enable until
>>> disable so autosuspend does not gate clocks while SWR is prepared.
>>>
>>> Add a PM dependency for SND_SOC_LPASS_WSA_MACRO so PM clock helpers are
>>> available when this driver is built.
>>>
>>> Suggested-by: Mark Brown <broonie@kernel.org>
>>
>> You added this tag, but was the entire content of this patch sparked
>> by Mark's suggestion?
> 
> Apologies for not including the Reviewed-by tag earlier — that was an oversight on my end.

I'm not sure we're on the same page. Please read:

https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

Konrad

