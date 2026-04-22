Return-Path: <linux-arm-msm+bounces-104053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKTAHNeU6Gl9MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:28:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D53D9443FA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EAA83021580
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664BC3C2790;
	Wed, 22 Apr 2026 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLzzZh5Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AbBBx4Ij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4BA3C276D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849948; cv=none; b=RGhCRq5SrbEHnvMFK8SIzNKavmSJFGisfBHyHHJMZR00MUcfEtq16GEB1jrvun7zvmsJv59hezazUrQkKwhDOgdLLviPNIRIPCrBnQ/hg3sy/r8NX1WiBFqJhwsq+p3CGiYjxmGY7nAga8X2nLBkup0NwAWZ6dEYou/JbJQWPIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849948; c=relaxed/simple;
	bh=SMiz56oW2fSvTvIHDcMXaPFCHt1cROs3MYO4h60ENTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOnhssMQWAYI3P7mn0HC5E221KN4ZGQOOkWPUOJ5PBAJ1OhV826IlXKVmdZQVtpUpXcrMZoisz85pGW9iqfnRJu9lbn1aSsSQhvXk/iWp9zakMoKAcMNM0IQd944C3eAyYkUqwaVcD1PPxvOJ6vbnosW30SZt7eIajvAekkg/OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLzzZh5Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AbBBx4Ij; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5GxjM2123520
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5L66I2ZHgE1jaUWj/sWd6ziAFW4XoEeiBo34fE87hgQ=; b=PLzzZh5ZZCnulpYS
	7A8aQkStUsSYkgNyitb7NtAAmxndtPR7pWYNvMhw+H5xng/VS0ryNUB/sXGvPth3
	iFK9hnwV4N8Ww8EOuJaO+J7rjGF0YzLZ67ZmyIh8LpsWQoG59euUBnglU0vxdt11
	/L5be8gJZbKrbelGsJyjsLqCenAHvinmNuc8DLkl1K+kcoWmyWdLznR6hMbCzMl9
	hP9f+L10AgMyembnjRaVMycJiaszpe2XDueL99H+MlkFtD6tuES+7DxXKcmkFqoq
	wwitPdA7lA4BTbmDNuRpxUmI4X2iQpLAMvnesX3Wh4VD3vJxpO1nGJw0WpeXtEXF
	A1xChQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftq7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:25:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d840206c3so11278171cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849945; x=1777454745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5L66I2ZHgE1jaUWj/sWd6ziAFW4XoEeiBo34fE87hgQ=;
        b=AbBBx4IjuADdn2c6s79MhgYPBF9V2dmxVFjYfIpVgPBj05T0qixQVCCSDFGh+WffXa
         Aagssy9afS4hZ3jOpWDnQkmfYl8dMi2uasHe+XLEpZS7BZyWEVCr+DRHC056OpMEosOJ
         rrsSVZfi+7erm6PNyQHjTv8CckoLALlyut095OXUnwngL1l9Mvl5a3QYx1BuP1m/DS3A
         VTd68kGs5QGc8ePfgdWRLXTmesu0jLMRvtWQAErOzfWzqDIumLX0UWpJTOWKrp4rfZ3L
         edc6w2I4U1u13mNxDQc/ul0LpW7Tf/L+IH7+U4bR4iZyLwBfNnD3puuFvt6amkYNt067
         ipcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849945; x=1777454745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5L66I2ZHgE1jaUWj/sWd6ziAFW4XoEeiBo34fE87hgQ=;
        b=mbroQweenXBwDOH2KfKqm4Usluj92nYP75XCE3mPMj+V0yPW9CupQzYHXKYtSi5JTI
         kb83bKaB4Trxd6qK4Ghl0EXIGofGEfycWkbmX5CCwog2l/HuQSwoUDl4pZ9gE+MIZKt3
         +mCFMJHXTXpbKSRQ6M6ojRGhH13+PgaF1jBGmAxVqZKQLpEHO0i/1FREWm2DIvl8MD9N
         2x8DMv9M73EJLSbrsQqWfEadoVg3LkCJqs6nRRJugrgBMR+15ibuZior/0Tv/PygRpRD
         phQcURbpl3R08UWvrMXgs+9t4ow/JSajH77M946vFjds0r3FCh+z1FJWZuLEWmin4+HT
         gVWw==
X-Forwarded-Encrypted: i=1; AFNElJ9/ABCtKZk5IQH6T5MA706hTsM3MlgYXv/tVoza2UU3W9LpAnkiR2lLHWP57DcvFbozON1JsdjTgXZq8/QQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxIe1iphuXnVffsAJR98fnLAlWv6crF8LgGxwSoV3CaBhoAM58c
	IKzTo4SMdFzp00OZWXNgEtD/l2CNisCg+P1tY+N/7vCV3Cbwg498XGlIae+dbrp2WHWAqEZDK9F
	xXEwUg0D4SOUb5qVq+/iNYMS+SravIG7GGtwhvU/Hlv/5mdhZHEBu6l989MyC32cvgAKj
X-Gm-Gg: AeBDietxFuqZy+LyenFgZNfSvJsTaLyYtGvzj68tzSJrcPJmsqLJo2yN+09H+nE7P6D
	gxsHFNoKmqinQaSK033bm3q+1zBponTkLNN1UkUYbhoIUqzoCTTLldk+wQ5r1PhICcRfbMqEIU8
	dO6O65EX5rE7GcReuCw/3+QaS67hJ5hdVYIjJxQoDwsCKazaJP41HgCgmACS7wjmgGHgfcaE3iS
	4TR61pELBDynzypSdHa+884FJqkX1IH43V2ytlHCqnXLgOAP4COeYa1Hh5rSOtAnkjV8seMuyS4
	KNpC4aUTIRLxkECVc+qGCEyAJoOKJzXNW5j920LD5efHLd5Di66frkhDVWyaC/7hApr0r0u9l1V
	HzGAFV1ogrWCrWzJZVqltPNngQ7Bho7OVeBX/Ly7TG1V9oroWJivW6c+7R001ZuRH1yoonISvKT
	qdimVxnwiLM1btkQ==
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr99405061cf.8.1776849945017;
        Wed, 22 Apr 2026 02:25:45 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-50edf3b0365mr99404951cf.8.1776849944551;
        Wed, 22 Apr 2026 02:25:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm533701166b.6.2026.04.22.02.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:25:43 -0700 (PDT)
Message-ID: <1d479cf0-673a-4cea-8ba7-7287456a8f48@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:25:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
 <20260420122843.327171-3-ajay.nandam@oss.qualcomm.com>
 <11f2596c-c9e5-46d3-af6b-1f6b09c2db78@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <11f2596c-c9e5-46d3-af6b-1f6b09c2db78@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e89419 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=hF-cSiSp27aMdzgguJAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: sLmQ_1dU6lNt5B_F565pOIy112X8fve7
X-Proofpoint-GUID: sLmQ_1dU6lNt5B_F565pOIy112X8fve7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4OSBTYWx0ZWRfXwlgek6843SWI
 LZbsIjDuQozr1nWPlO1DJLy7zEDrlhgvb6egBcaQXwfJY9LAbj0jFhfp3DmZ7JPN+kAwYF6hDSU
 3qHeZ/O3G3UOTqqQHnCzHn5kLRHNE65O9Wy2TFg3UWKK2IPtmurnCyivFVKIXbZvl0oWI3CCteu
 Nuo4JgZuA9uZdIGlnYwgR11lrG9Jdk1xGUkP+Nz0MOGIo+llRLDFF4894P/sCvYb7mnlUDYpKEA
 z+s5qMgtIzniIH98uSd0LkEJZyONB708mg0D1jyOJEkjCACu0JgSXXmkU3lQehrVaavBVZb59f1
 erFg5UkDT130T0jlxKyF3HBU+pLhW5GmxiveEQ4yP6Af+18wADNq9jkdlcTv4qioC4iFJy2VV0+
 dEJQpGmdlWVIW1sKVVE1MzkAEQILg4C/xpeUDrWIiWV4gWAPQ29f+X84MWmxF4xqq4EDsmW1jgS
 /hlN9l/ox89GB3iWwCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104053-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D53D9443FA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 10:55 PM, Mark Brown wrote:
> On Mon, Apr 20, 2026 at 05:58:42PM +0530, Ajay Kumar Nandam wrote:
>> Convert the LPASS VA macro codec driver to use the PM clock framework
>> for runtime power management.

[...]

>>  	va_macro_mclk_enable(va, false);
>> -	if (va->has_swr_master)
>> -		clk_disable_unprepare(va->mclk);
>> +
>> +	pm_runtime_put_autosuspend(va->dev);
>> +}
> 
> Don't we need a _mark_last_busy() here?

It was made redundant a while back:

static inline int pm_runtime_put_autosuspend(struct device *dev)
{
        pm_runtime_mark_last_busy(dev);
        return __pm_runtime_put_autosuspend(dev);
}


Konrad

