Return-Path: <linux-arm-msm+bounces-109314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOQ9FrpTEGodWQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:01:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB35B4B21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ED78306D910
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A497360EFA;
	Fri, 22 May 2026 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eH3ezz6C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYLAs1ea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B570125B097
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454491; cv=none; b=XbvE2MmxL85S1/RJs+Yw5hi3FW9q3ZoZ5PaLf1W2ckTqpFVXa0W02d9HJMN2oCnSeUCOfh6Kf1MYX5361lXIHUJCl6NbYFgsnMGxDcwWmLGVe2Q3nwDPBhc/4ne5nsBfb1brITwtnC7iWd95xWJyEoZYgpwn6HDTejeX8vzjYKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454491; c=relaxed/simple;
	bh=VXs78MA6J6D2rEIL2rbG2HPAMQtSJMsnE8RkJzkUqFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Co2GaDT93ei+QwtHKRu5YEv4BAyhXv+dRjUNnfV/SMJsradPrlWcgVtkc761ADTh/LPduXwWsr4jtynqoSsS+pCyLvGLXVaPvk94clKurTg4M13qqBlesIkaLR0KCDRciUA+fUlcoV85UkKXQ3r92wBZTOl/1suVWRBIqPIh3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eH3ezz6C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYLAs1ea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8bX6g3532225
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ea0S4zQrwmtFxTVo56imyzNGzEUv3R6pf0Xv6mhSt+4=; b=eH3ezz6CCIOp99hd
	5VYtElxxuxo4usmOpIB6+VfqXgWbE6fasfSd0zClgJB3qfmeDH+WUi/er3UZPkfo
	LIIQ4UrlIPWdr5CQRDlGqOGbmeZzbFDRfOs0wSkYIk+nqOQBlwYp2LUlDbRUjqV+
	M7L4Nn0ZqW4iVZiJptSXUz92XeVZMPQ/5942ok2YqjX00IZp0dIp5XNvbko1GDzP
	GtjBnBHDodkjsfOSzkcNKmBDkLAJT2s4Qv3COmLpSc86SyaW9rqSAqWfDp9TfG/I
	EiuHemXfTQ3R88JwEgYOsInARjR8Mg8UNCOi9CaTc6DvM5it/fVFfsUfCZDOmXqp
	U4atBw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gw3fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so3885513a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779454489; x=1780059289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ea0S4zQrwmtFxTVo56imyzNGzEUv3R6pf0Xv6mhSt+4=;
        b=XYLAs1ealLlWAR4I0npoIwzt4IXtj41vYcsjs2RJ8dv8ZXTXi8iLtjwvySte4eeVAp
         bhMvo5rOsg/s/OXSVrNTLjqgoZZX8Bz5d4XFwXZwCn0uFqIbKH6lb1aCyAjG7e0S0W5v
         BPpiJS2DKfq3Uwv/Otu+BO9ZckD4zZPJ8ViNHWa5o+jvzcBw333FfQWFQK2/hFsptSwE
         Og5R0aJ4hjd5lfgbbrGkU33oBjbWN1mkjXjgCL2pgRF81yjYfNThQ7oTBW55+NxzGxme
         JC5J+pSdmwfdV7ib1f5C8ZTk3wwwLsfH58JHiMm/b3hSsr+AhHJwD21QsRDomEdCL4sq
         xDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454489; x=1780059289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ea0S4zQrwmtFxTVo56imyzNGzEUv3R6pf0Xv6mhSt+4=;
        b=nint2DpZAx+6CH+DkiaczuGfDnLa6VdaGRego7IJDRPTjJFHOvyeNCmKKZQzuX6UKm
         aMSDh0lIT3xWKnczgnfwCDQKoDFr25PJ8BrIad/9Ftt0nKx20Rq6hoUtbm0ykofnU9nE
         D4mFTsUdAypGaSkLY2NfHlMg0o5UdjuJR+EIqtHbX+rAc9y/Ko66wOSgTA4zjhMHzCBx
         5sM9Bxr3Sk/4x6EXndN8LsUtaTcEG4G9QatHwS8IdpfzyHhKel423rczrjD9dn3cTNX8
         tzE04NBR/XjnOMwCDnD3aGaZGGnYqrjR+MHEu6HG17qeYOdtjy9upS3Pj1Yoe7pVOBq0
         JrWA==
X-Forwarded-Encrypted: i=1; AFNElJ98p58o6hcJXMw7620v6Lsdcq2rrFbC8+x0NknTjQ8IWVi4HaG4ZHLVKdxub0WPS5y8JHmmTEAvft9Le+s4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw+xJIDKrkwqMxhm1mph13VkuhLzRd/pv41C8HeFrksxXmt4eZ
	7O39g10iIKAfD1JQxXCKrkKdt8ux/0yn+ralDpYZwT2EX7jm+APse4OzH7kO2V4c7rrpLKbrBwr
	ghh1czRYGN60ohzWTg9YecILDphBItZysxqSvM6aUat9OreadiRQOEQVIa4yL9HZoE0rN
X-Gm-Gg: Acq92OETJrALuLhEZ6Og038Ubl+wnf6FHrN2l0Dzq2jyP+DeVd4u1GnCF3NT/WO51WQ
	kS3z9Hq3C20DbhQroxNrrfMpoOSI8biTTeX97QyiwH9GMI4eZME0tPAPT9JqBWFMV8wH4WL/dbp
	RJoR8XGi4uD9f7p3IeNBU4xioaNQbtN1eoXa4ANArogt6k9qUCrjfaoFNRq/8k5r1dAVkWNpwm5
	kTu3O7ha57b7A17C9SAfXUqhvea3u23yIxiIbHNJp5NfaAD6CdvxalLzFVmqvs53WRV3leJy93J
	ZpPY0AAKD2PPqCy1W6J5JYvScYWMfTBGDbF67GqoRzzROSFpPgq0HIiO6bka3LxOlUY+KpZAT+F
	ztgX+DdP5HOeFOZBVTbW1lD2lWxZPMm8yssHhBhhy2nzNB8Yb6Q==
X-Received: by 2002:a05:6a21:4782:b0:3a2:c9a1:2c22 with SMTP id adf61e73a8af0-3b3294ca167mr2620206637.6.1779454489328;
        Fri, 22 May 2026 05:54:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:4782:b0:3a2:c9a1:2c22 with SMTP id adf61e73a8af0-3b3294ca167mr2620181637.6.1779454488823;
        Fri, 22 May 2026 05:54:48 -0700 (PDT)
Received: from [10.219.49.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b1af1csm1868442b3a.27.2026.05.22.05.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:54:48 -0700 (PDT)
Message-ID: <defd5a94-613c-4178-88d4-f41db53e9333@oss.qualcomm.com>
Date: Fri, 22 May 2026 18:24:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
 <20260518081738.2453957-2-ajay.nandam@oss.qualcomm.com>
 <c2223ce4-0e9e-4fdb-b289-4e98e64f8e95@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <c2223ce4-0e9e-4fdb-b289-4e98e64f8e95@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a10521a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=knVCPYfzRBhieiZ2OR0A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 76Ep4RrCqtCS9Fjq-Lch6xtEW5xGjfR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyNyBTYWx0ZWRfX1/XMAYd99Toj
 VfWJeWBzx73TGL1nHpW9CsHcHyg2vm1xKRT2sCA+igI07O48e73Rds4cN2/eGn8IjbHNxdzbIrl
 v1jqp2F9sUZJ7ICtrseypPMKpVIcj0Ca4/QWRM8cqZmxG0dDQt1Geh0KvfYP0IlF+w41uZp8PXB
 RWINFEKgUJs6hUh/becGnUbBylBCBy6KM3iZ2MzO8OaNlOTxY4AYiuh4UHvpYNMGyGAgXBLEz4G
 CIeKvAgd6k2GVco1kEQV8vp2Dt2bpLaSMR8cWNtgUuFayPLvMOnzMn6pI11KBu9FTvTPd0czn18
 5ikKUFXLxlkT4d7/16lkKO0nkb35Pn7PPYbyWtveiD0V+3MqH8BknJ0AMQh7hjJz5cbqagQccrP
 BluwkrEM2VM1CrRq7u/wRpjQmQ94pk08qFzR8N1oVQSYJv9k+ExJ5K3PF6cKFC5EJNiK07+uRtc
 fjYrz3SBsUxP00AKEcw==
X-Proofpoint-GUID: 76Ep4RrCqtCS9Fjq-Lch6xtEW5xGjfR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220127
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109314-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 45AB35B4B21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/2026 8:03 PM, Mark Brown wrote:
> On Mon, May 18, 2026 at 01:47:36PM +0530, Ajay Kumar Nandam wrote:
>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>> for runtime power management.
> 
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
> 
>> +	ret = devm_pm_clk_create(dev);
> 
> The !PM_CLK stub for this just returns -EINVAL so if that's not enabled
> then none of the clocks will be enabled, the driver needs a dependency
> adding.

ACK, will update in V5. Thank you for pointing this.


