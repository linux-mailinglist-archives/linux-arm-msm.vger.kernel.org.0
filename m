Return-Path: <linux-arm-msm+bounces-109018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHKwJ1/eDmpMCwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:28:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF2C5A34C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3229330E6A4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300CC3955C4;
	Thu, 21 May 2026 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZvptoeV0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jz10epXO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC85A381B17
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358901; cv=none; b=tZH7ga9VxBydOt4A/hiXrSyQ8rSSDfMa0WHxD3wgmx75VWwajVjSviUGHQo++tpw4EW1L0IVWelU3lgBfMEXDs6fS4LhbCcEOwTs2ZPgIs+26Dw7BkTpBui26JMYus40akl/DFjiR/tUG8FBaWvRMEBdfWiCXR+ZO6qFSwY04jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358901; c=relaxed/simple;
	bh=QhPbVZ32ARSFRCmhEhRTUEojjFFbPAw0ehbADsv4MSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mkRg2rezhEZJXrza+7iidIYly+ItqouXLSDgAYfN108Hj/NPNe2YJMR2xo46dex2+kicScUY/V01b6+gB2u4P8vowjQ23fIOcSiBoMXdE0EfVnMFBZdHXlh68TMCLIN0LXBLxahNeafJScG+vXQy6ImhXpgKvcBMZSEJsBE7WSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvptoeV0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jz10epXO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99vLX2491823
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GOctqrIp7yWxZYDyUjClrejv+dblgIqYIZ74d+eTfGk=; b=ZvptoeV03vV1RnIx
	5gB3zabIGRZ7I6uhUA61mqkv43tMGfeGejMd/JunCKORhS0ZVqR+ZGdSnlWv9hyM
	i+OdPEqqtVSkfxKtvmJUa+PMc2Z+UY4JqyiG1ywFJ/JXZJUShfeCdx5F9zwQ0ft8
	ounGgYDkleg5t5TDxHL2NQslxqqfGg7XhFBYadoRuMXjglWAANaiSNWP88hvsWKR
	jUj53RhTIBltWiMAhzSUfdxjJYoz6b87ojpsKsraMGvK1BPsm1tP+ao3dX++Kd53
	WOtA1JCMXbe6QcQUoNuQhc6AgtVY6B7atO0yYNOnzWzLKBThFVSs8U11shBddYBb
	RPIKRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j4fnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:21:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516cd650fc2so282391cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779358898; x=1779963698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GOctqrIp7yWxZYDyUjClrejv+dblgIqYIZ74d+eTfGk=;
        b=Jz10epXOCv6CY6CAD3ta2FFuO7Bpr5V3YA2XEdw5xmgInl0DKQKMvfO3h1+ZDWq2Cd
         JflrlKjpRCO0yz9lQ6i4OeFe5bRmhZ1nz+zHB18goxEA471m1iXWR94O5mycMOq4SexM
         c699y8FJMyh6MoSfY7mvn+x06xut4X+uhn0hSxvwQEC195JOmbKc4mRTvryWDlgPl/xG
         4zX7sk9U9vgRIWGKzI7hnKbrQoYzBIHlQNvk3uGdijNTuVShmrG1xyvR7Eqr7b5moWt8
         G6uCY9GvUE79i4Keo6TTqExyIGCsGKdepICqI/Z6pSiI5Io1Ki1YdhhqRjGZqXycuImf
         Xcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358898; x=1779963698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOctqrIp7yWxZYDyUjClrejv+dblgIqYIZ74d+eTfGk=;
        b=Ygwz4z5YbzED8guNk3IETAIYQkZh7W1aLCGXsms+JkSB7E36ye1CInzzGyqnNDt0BA
         KemHCByTWnXqlu3CSkRbq1x/MrZB8ktTdYMpSdqSL8ekL48LDitng8H9NmdFdN4bV8fZ
         Zri0I1kLQmAe7rWd1d7hzB3Cv8gh/9xPbK/Ug/RmYOsvmNuTqhOWLxbajR4C4SA+o1Ur
         RyZevO16nvpgF4j4kuvVLA5lw94Md9Ml0Pxuz4O4sgXCWypmF/MyQs0wJn0eQRwMlLTz
         tqQ8sMgD4afgWBwfgK2758vhXH54KzTgbKvyEz1mP6TCU79sKuqmR5o0ccqjkbv8QtoA
         UdWA==
X-Gm-Message-State: AOJu0Yz6fEiN0Yef3+BIlYK3lsRQf7WgXsVmhNW9wjqVAwoN4vpRlffh
	6moKIcew5bFsHKA+6P0+k13u2hGeYfwxcbInYYQq3sfFhPVZVksvi9IJPVjNf/CDdnSh8CuTz1e
	OuxkEYzuURh6YmK3w+WPcq9W+imupi6tgwM+NDUFXEsdohCIz+PIDYv6+T4rB1JMm6iVv
X-Gm-Gg: Acq92OFjLB9fRzIag2ukg33D3vCKFHe4csi8levTVo87fBA/or7SC6MEqYzITDm4tIp
	deR4wtwqgr9IrDWvTkK/GQgiuFiNOVrQensjgJIP/VJtJtu9AGau1GZhGM71n0K04x+AhRa8BkL
	sDZx/zquQgN/ye2ZVbesXHs7ORlBxEgJw4fiyqgDyxf6ukFclb5mCNYVVOmA8nmHlj660JtDjnK
	Be6ZyJ20MIqEGTPIJo113AP9i2PbFiy4ACOMjfpLFe8H7ENoEhoTDCHR/nMba7PjRJTSuBD9fX9
	ThwCh2zS5wfVSVRehLlCkqYiEpLW6W56qwSbBvWLQNylikFshx1HzQT47aNaz3L8n0m+OOMyRLy
	mOrZebdK1aU15qugXxFG+ubgYKjD81TIgZEhX9OkgVlSmPrS7vhsTPv/leo9xTXkAt0ITHWZ6J5
	tIE9s=
X-Received: by 2002:ac8:73d9:0:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-516cae0c958mr5233981cf.0.1779358898283;
        Thu, 21 May 2026 03:21:38 -0700 (PDT)
X-Received: by 2002:ac8:73d9:0:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-516cae0c958mr5233731cf.0.1779358897736;
        Thu, 21 May 2026 03:21:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87890f2csm27749766b.3.2026.05.21.03.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:21:36 -0700 (PDT)
Message-ID: <19de35c4-8ddc-4824-b8c6-083eb53a5e8d@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:21:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] firmware: qcom: scm: Add minidump SRAM support
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0edcb3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=y6rW8TDjuTIuaxCCkQgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: g8eko9MnRexQprS_CNeANxcC8up_kXg_
X-Proofpoint-ORIG-GUID: g8eko9MnRexQprS_CNeANxcC8up_kXg_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwMyBTYWx0ZWRfX6CJ0ZVHop5Fk
 /WsDAKsECAcObO2zOCWXNk6IMzfPDdiAA/WFpBphuoa2aPcVO5XXfFfyva+cdk8Syf7RiX0/jp6
 uNf69IY3elSCzuodtWmaiUpX2kWynaogTjKuIsgv1wYvE9ifd9zZnoy2pxk8uo/vW0MeQ2MFip7
 NmVFpROvsHe1y3OuFPRezodG5kmzgXpxvdw9ABpSMru3bLEkKgttNQXIt70C8Rs3XtWGlO8NPJV
 cPjoKvjp4G5+ObOu1ZO3w3nx9k+336BoHikIrEnjTtCyqC6tkJcmS5qWmZRg+2vg78vHZFRrZa6
 PWheth+DqRb80bhSIxbxR/T7D+0PssEUDe7Ecf6WgwWhowF2kEP5aQJ+TumZoEloM2bwoNB5uex
 LWoQhNipn/G0AICnsK9AArD/gQTczQA5YUsoOH4bJ8sGsAWYUplz5VXQ/J6Q0hxbESzOACMjseV
 OkUTLPMvSQ9YI2++kxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-109018-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FF2C5A34C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 7:14 PM, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
> to deliver it (USB upload to a host, or save to local storage).
> 
> The SRAM region is described by a 'sram' phandle on the SCM DT node.
> If the property is absent the feature is silently disabled, keeping
> existing SoCs unaffected.
> 
> Expose a 'minidump_dest' module parameter (default: usb) so the user can
> select the destination. Only the string names "usb" or "storage" are
> accepted; an invalid value is rejected with -EINVAL. Changing the
> destination while minidump mode is already active updates SRAM immediately.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +
> +static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
> +
> +static const char * const minidump_dest_name[] = { "usb", "storage" };
> +static const u32 minidump_dest_val[] = {
> +	QCOM_MINIDUMP_DEST_USB,
> +	QCOM_MINIDUMP_DEST_STORAGE,
> +};

Since these two are supposed to live together, could you turn this into
a struct?

Konrad

