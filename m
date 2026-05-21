Return-Path: <linux-arm-msm+bounces-108972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBvPMwbODmpoCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:19:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C1B5A2289
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6912430B1A01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B674234D90D;
	Thu, 21 May 2026 08:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kPhiLWMS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XnXirLL8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2A42FFDE1
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353553; cv=none; b=d5nA0Ho3O3lCmIru4j3n8Ly2gXB7cVPLoPV2H0fqLYYat2vgFUA731qAuznm1Lpb0pF1IRupWMqbUcn5sfugjYt8LNKuwHzkHiDHJ/erQ2NTQ3dUyW5Juk6bEpSJZbg+q47+VKDowVy7/ajEEE9CCAjxrvN4kt4VzHswKB7pspQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353553; c=relaxed/simple;
	bh=ha3irtupBmq+r5ifKW6qnliRxMG0AjctZC7hsHH2Qoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QysX8yQaiTOqYGXe9j7ZQ219kLbBQN4Z0it8pJuuLUBpPPiJMC2EfhGRZPUTuT9D07ky6dwele15QIkxEWJd9lb9yx0B+2MfRwXkibQUuIhLz3nrEOElOoILuyMPXFeEVX/KM3W1NPUXki45oFN5/35UbiVfUiKtK5gTcSXpvRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kPhiLWMS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnXirLL8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6srjn1798322
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrEtA8AuXxln3e3Nbl82hLH/2uWUXSrq3eJbCHfTlVs=; b=kPhiLWMSsboB+AeT
	pp+xU/5P7YvW+Jjv8sYPZSMlzbkf8QiD2Guf7BPQYt4g1nS3JqgvAp+ZiR8VOXrH
	/KmGleKdiGqbMc18MQsD6n0Fnqq3ouHA3ZvaoT+VSHk7AbJ0VjR2nlKeYvDwPUmb
	8z5I2NMGtbCR/0ehUF55Cr53TPy6HfGXeFiaa8ASDMBHe0hO7PbGz+MU1wsul9oY
	F2m4KLVOO1o17jF4zU6UQOiPWuOi5rApc730tY+kvaNMnVX+aUYVsgh6g/MSretO
	wX3P8jm5FltKthH/vUauCbZ5XCCliTuY5x8N20ybiSR154RYuIjPh0FPrzYXzTUD
	ewCiOw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu4406-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:52:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso32019301cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353551; x=1779958351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrEtA8AuXxln3e3Nbl82hLH/2uWUXSrq3eJbCHfTlVs=;
        b=XnXirLL8GaPEqeOOwdK/fc5uRm596nRMq4+iv5e1fQ4dU3YVfhVVFjQvTz2qCCnpJl
         RwxL49Lkw5rafm4gkL6x8UiWn8pXYublnx61Dz0UbqxEEepwhRhLTiAx65WjNE38BfZz
         VftuIKF/jNF+aMejhDQ8DQMzXU7aI3DJcrKeUXodjxF45PA0MF+78W2Wc+Ir8nCgVM5w
         /978twlspFXHkXoN8TGECiphnoedzVa8Q85nI+lBG2Gdss0fUQf6tm0Fuc0SW81xT5Qi
         8G/VrwGnMWeceSF38M9kTVymQzGQX+UvCvoDQ7fHqeEsh5z1KYvNZtMoqmR12Ly1Ja1V
         xDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353551; x=1779958351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrEtA8AuXxln3e3Nbl82hLH/2uWUXSrq3eJbCHfTlVs=;
        b=fKCHEQWhNyMqeVFSdAWqcwkIReWyIyeES8UPEgJIE0Cpg9mMJYj2ushXEOBHXLZmI9
         PkGA5uaA6s/uDQS1u6uqzKY3UmRnOeHCQztqlY8L8VoK9b/415OV2KT6yd8UhDalkBV2
         AynjwKRmlT7lOjVrth2W/lGT8hNfl0t0DiZk6S9UcPz+hFytWbaQThnHsg7gLrJNXjBv
         CmbCsEp+6F9N2ZcDE752hIALAZA6TB6Zeb3kmvK6rYQoj5MQHvztbCpmX4Iv6Wz/ju0k
         PhbFpmUkgNYmNA/OtjaD5V1qhHNe4v6sPl72zBkQXKtsnCTxhGqjTXmoqG6rqNEMIemk
         1ksw==
X-Forwarded-Encrypted: i=1; AFNElJ8RS6dnRFSSrY8zWeu+BAlHo0PpSPvTQoVrThiN9By64noadDvyW6bJIfAEFrDGJ7m1NLEKHTlYJbpJgClj@vger.kernel.org
X-Gm-Message-State: AOJu0YwLXGi2zOzoyOEnXIuS8lzcBoTWS0778Z+jxVSmUQx27940FnL1
	H/yaB5rm77nv/R0t/tARygL8uK9GfNwxcIbSMQwl2giqXdyz0jMOtMqEq00NGnxehyNGDdtdw2e
	RhHQSj+KlE+UMR4XHYMyu/kKAAtz6m47YqcSZ15Jfvz0pdZTpgrD4UnzdZ/p20jw5Uy20
X-Gm-Gg: Acq92OGT+gwt1muJRhBKZ9Rp/ksCtZQkuh/o6Ayui4I2HY5Uc8up4zhmrLpgjhGLhcz
	jW8Gg8qhhmNQOLwWd66IGe+3HloM0N12/6GCqOo05oRvCiLVHXMtIb9J0VlNj2aRFVS9Bmz8+BF
	TxnTdwljjkuPmVUEZg+GaIy1gvQq5Bxk5BxwuiYJHeTFAbAikdPe4JUfbxKdRiHUyBoPVX09T+4
	STvGwz4Om2nk/X3CVznqu7oysyySnRai0OYD2oEa8urkhnkiXx2+nHxlFeYKkE0SLfFfGvnB59D
	RCme6GS0EQi/6C3rJ3origUae3jimspe1kiXTBdTPNsUfnxl0r27rrMS1vArHPyh+PlkoDNYdJq
	h3viTS5oyDKusnX1uTW4jD2+exE1RA9LyKKr+QzfbSpE2ytDeCXxQcl/ZGPSMgqKNZM3gtcEJgS
	pfUN4=
X-Received: by 2002:ac8:5dd0:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-516c560aa11mr16078451cf.5.1779353550779;
        Thu, 21 May 2026 01:52:30 -0700 (PDT)
X-Received: by 2002:ac8:5dd0:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-516c560aa11mr16078301cf.5.1779353550391;
        Thu, 21 May 2026 01:52:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aa02f25sm17540466b.45.2026.05.21.01.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:52:29 -0700 (PDT)
Message-ID: <418efc2a-d7de-4c1d-98e1-634f08bc3a85@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] arm64: dts: qcom: sc8280xp-arcata: add USB-C
 orientation GPIOs
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-4-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-4-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX/y4EuUlXN9bE
 Ec4RbudxFEWrWNEYSyS73EZJ/FsA8/fWukTBAiWJ/9S+SkopHmE4tqxUaWR4kQGPEJYjmmLHCiV
 23rzh0o585omXSLraS683jdLdmVlxAnTKuZ161fBV/m0hZ9sHwYmlLz+uS3ABL7VZm66gvGwLaF
 0ylEP3VY2O9u7tF90wcb29A0zZwl0+SMkDI4NUMHWn8s0Cxnf3PEVlDPnP0bjHDWpMl31O6c6Ff
 oltH99oIFUatysh8xWRvUyhe6c1We8Ybbo5Cv40fCJ9ij3UTjzMcVVS+HUWOar2e/ko6ltKXnfY
 +I8HOQ9gFR74COIYa7PYnzb45FAGCiiUItpaIImd6RqGIZR+0fa4+jkIQN2X7FwkxhYiPOoOxmW
 Om0lHHEFyxFGBh94xvQr8FnITDhz5HLQYa6YcpMPD6WZc4giCJvHlTE2Sj70SaMweu0h15jihBP
 2jhGAWEBPFLOlSjhjQQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec7cf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 0hti2G3Qh4njoGm38D8-VlpAcfsUS5ik
X-Proofpoint-ORIG-GUID: 0hti2G3Qh4njoGm38D8-VlpAcfsUS5ik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108972-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35C1B5A2289
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Define the USB-C orientation GPIOs so that the USB-C ports orientation
> is known without having to resort to the alt mode notifications.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

The commit message is slightly misleading - there is no orientation
data otherwise

Konrad

