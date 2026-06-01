Return-Path: <linux-arm-msm+bounces-110510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HTQMc0qHWo4WAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:46:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF161A571
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D906304727A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 06:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DA7376A14;
	Mon,  1 Jun 2026 06:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCjnLsQ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+jnaIUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88F73672A1
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 06:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296181; cv=none; b=iYigKb1g3T++je5EcMMu+V5RQXN64x23NdHZFf+0gT7IUB50n9fh6CkaZlzCzHDfHkFTepkh9hRHRQjIajRUxDnzmj2V/W6qwLMTgoshuSwN3A1b5c9u9Dvf3YQtGQNhRpVVzA8BV86T0V92awhLbVRDzQXJ8+vPUPyQYYLpn3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296181; c=relaxed/simple;
	bh=nYTn0G/ZDrzIo5l0OdoH+hwjxrMK1S6UIEIHuScxhhA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mk010TlD+XZC0yb1wik4uepKaV1TNmS+a4X9nOzIn7nwKTdEqRvuCJCpdwUjsnMYRtTG+hT3JNFxjZ6b6M8ojNkAZ+D10cHSPGs8Fo5L0wTAh8CwJUQZkk74YbKgyKRj2x+bQTfGkqoKf0Cap9gGPMFs7d234uO4MkV7vXRJ25o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCjnLsQ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+jnaIUM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6510H7wV1542805
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 06:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BUoRT/umrxuN/KHs4F1vXvDSCGOLYsWvMyewnQxtID8=; b=fCjnLsQ/g23ip7p7
	oBu+yycb5ND+i81+X9WRkdQWA08JR4L5yOXw5aeuGQE6c/oLdeRYlDn6f/EGKlDt
	W99a2sm91LJ/sp5Hu1sqFS9YntrWh1yrFdkywUpD2uGa9ML5pbH8iOHUdZv8/fKM
	YooEYIDLEwcA1iignOtMKMh7h58yTQEQJvWrViyezdAsQODRwoCpMFFVk/j1eZuv
	V2Kcm7ImvvwPLOG8N9F58VcamlnEviarqp5XgBrGVN0PUAhAQPnSelfdNBeWZUzq
	ojMYfNTd8C5t6MYtCO4J6UnjBpFaCZKIU690IkWh4qSjhqt2KChBchMArhPzIKhh
	ccnwLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efrnce4bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 06:42:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso2203071a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780296178; x=1780900978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BUoRT/umrxuN/KHs4F1vXvDSCGOLYsWvMyewnQxtID8=;
        b=j+jnaIUMikPYxQe3bGsVb7gl8GTAL4NZZJdzH3mbu90qbXmGTvsaMrK3bkJStuOT2/
         9sqEYkF6b0m32uRFcCq1tjFSSKEWnf6dazkp3H9GpcNynWgzEJkc89pe10UjhcqnrVod
         iOZl9aRjqLWtcDpz7bPd+bSsBWLScuw3Ix+SLwB/sasyqNhV78qzYPbwPdc+NqR7BvH6
         B0NerUbmxmEav3VxeuGQ4GfmEtnDpd/+eGOI58OcglQNbgPoTBxDBjjr1Av2coVi9Y1L
         VvcVXJXzAbVezueI03Lg1u7buAllW0BoshXwJpqAGqghbRFClD3PvtfCt8NmMe4Cclx6
         YZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296178; x=1780900978;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUoRT/umrxuN/KHs4F1vXvDSCGOLYsWvMyewnQxtID8=;
        b=oyOr87lN5dExXqmT5hgkneSq9i+IpZBWpAmTAdqtjb3dYLaHT6Vn4X29KkPoeCxCp2
         wqxUz6x8xn/aNXAHySeu7bz3FOI22ZcYKupJnTFg6k4pbsoe8N9LHuWDW+nsthqkMBa1
         h+VjHRceSvdSCJNMoa2Qee3qSWwqwFn7WzB/7k+FMjoGI5hlcZEJHmHi1358LVtNaTWt
         sijyGw1aCnxjhjqh3mL8S64CzJaNG4u2VcPGvDORcKUs4OQ3rwVL0SuGWorUtlGIceRg
         UVKMmYOMMu+lIwIb5cU5WhbaKPsVqqZs8auZRtJWK5/7mggjx0sYyYzrf5BmSbVrLJ/C
         hvgQ==
X-Forwarded-Encrypted: i=1; AFNElJ93Ba+FapxRvw1dDS3QwbRMnid/jBk2mDevvNpwS7YteK997ByTXHXgXuWDqk/h5q/vVrWEOWNWuKBTWC4V@vger.kernel.org
X-Gm-Message-State: AOJu0YxekxYyZICLr+BelIpGqQ7MekBswKspK1nysArJqc6o0jMH9Zfi
	aWF67PMHsH569FGWTIRCAf8vTeEGNuNTVA10HlvVNO5zeqrjsh/kbWOeEsXdQkegqiQpGYyboQh
	EJw7j8uXvirSWIRMRofSDi6W4PuXhUSlXc8D4zfhjCAUNvYwp5N17ab9W3LN/xOOb0Qy7
X-Gm-Gg: Acq92OHnD+zAu/+ybmjqnsIcORmQgYgDrGELhPG7Joq2sN4OzbOV5QeWj4I1kfZjgNh
	VMlgEOeR3vonmrCmqq25h+sWeLDCLNOqrGSX+kyfsdcxlGXvv6zYH+pX/ppxEXdMGkJnKjiTXAa
	NyHE+iDTRwY2DAZrLn/z/djZm77i/EtcgMewTidwmzOVARVTwlcSxDRcYmg0AATa4hI/NbJgB1F
	11ZqpVsmaNfLcqDOVlPkZDJcDB28YU6vhV+hyN6+33IJA8hJLWWvvUWfCvk/cLTwloJEG+LBzx9
	Ff4i9sNiP9Rzy2kVCUvYxYdtiCJPHu3hDvapyP9PJxUduTsw0f07iWEslE7y4Z+amad5S4xuX+d
	JG8HF+CFOpMpJmFhyb47DWlJ8IUc/jRGh6MBPWEqc8hdk9JXbMDnmIPAXbcsZPQ==
X-Received: by 2002:a17:90b:5704:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-36c501b8fb2mr9707568a91.17.1780296178462;
        Sun, 31 May 2026 23:42:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5704:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-36c501b8fb2mr9707531a91.17.1780296177992;
        Sun, 31 May 2026 23:42:57 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc65e7afasm11934608a91.1.2026.05.31.23.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:42:57 -0700 (PDT)
Message-ID: <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 12:12:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
Content-Language: en-US
In-Reply-To: <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XEbmiLUlgdEmEWvN2mnZCXu9F6HXYeub
X-Proofpoint-ORIG-GUID: XEbmiLUlgdEmEWvN2mnZCXu9F6HXYeub
X-Authority-Analysis: v=2.4 cv=FcIHAp+6 c=1 sm=1 tr=0 ts=6a1d29f3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5UiWIToyZdRRPDun-cEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NSBTYWx0ZWRfXyiKx9SVYNCNr
 I8crrvKtk1soSRJoN8h1OzKeZa5IsABpmBeviva9IC/WiOHyELlEMfat61PtWCbEIwA1KgdJPMn
 d5t0OkH8TQxp4s/GpDYOMYdXWTMNW9j7GbC1/bJDIA2iNvi+xFOJb8BLSHWTRQ8AuUJSWTqtJoF
 YdSCKHXQlsXcZ+PP2XMY18o9EXoMgULVq4faYGx/GPC5OUtQ1Ih+f54fqRwpPSdZDxPLXDJjknx
 kHmL79Cch/aICPlcqpQEqxra37JzCsPuJENzYWlteumi8xNrsHwzGn/u1EYT7YhzxgemCcMgcAP
 xexNi/+bdB9w6EQvqKVy8ssy+43Vh/7omevG0LmyVmr/FzzC7g9LgrhlV7uxprDIgWg2XqkxApP
 I1KHVPVSFhL7bRVVH+mtKXVVtU8JPFQAUPNX6Dpv0v2xGwG7U2EpBVKlFFqLQDzsPXxdlLPc0Fm
 jqPeAMrWJKFZx6bVFzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010065
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-110510-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2ECF161A571
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 29-05-2026 20:28, Bryan O'Donoghue wrote:
>> Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.
> 
> Which will be a problem as soon as CDM is attempted to be enabled and yaml changes are dropped upstream.
> 
> Hmm then it seems to me that five is too many for Agatti's IOMMU set.
> 
> I'd like a number list so that we are discussing facts instead of nebulous hypotheticals.
> 
> For both Agatti and Shikra.

Here is the full IOMMU SID list for both platforms:
Agatti (QCM2290):
- 0x0400 0x00 — VFE non-protected
- 0x0800 0x00 — CDM non-protected
- 0x0820 0x00 — OPE read non-protected
- 0x0840 0x00 — OPE write non-protected

Shikra:
- 0x0400 0x00 — VFE non-protected
- 0x0600 0x00 — CDM non-protected
- 0x0620 0x00 — OPE read non-protected
- 0x0640 0x00 — OPE write non-protected

Only VFE SID (0x0400) is shared between the two platforms.
The current Shikra submission enumerates only the VFE SID. 

Should CDM and OPE each get a separate YAML binding like [1], or
should both be part of the CAMSS YAML binding? If part of CAMSS, 
please confirm and we will add their SIDs in the DTS in the next revision.
[1] https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-bb1055274603@oss.qualcomm.com/

