Return-Path: <linux-arm-msm+bounces-105170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEyjISbQ8WmjkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:32:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C76A491F1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D20303007BBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B2439527C;
	Wed, 29 Apr 2026 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrFnsG+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK0pNfsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBD239021F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455137; cv=none; b=fh6p1FzQHxg20EkmILZPhcCQc1wAKL8gELNnUOncSG4yVt3aploJZ/pvZEMe+PvS5XorWuKp3tO0XHgJ6m6IikYTEMZ3CjP0kiaqs+EUeb9az43Pys8cmdfue0EDyea1HwjjtcYZOMUdpymiTou3SoYyb9j/dq48OKG80MfhJfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455137; c=relaxed/simple;
	bh=5q81zyT9bNFdWJs9YZZFd/1yiVmz3SfrynLds2/FimI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOVumV0qO6Z0yloSpYdbJN3ovZaxXxeAQR/RetTTEcy7lqUVx0utWGygUrYAvOD+xwvYtXxK0jTObJssZEuvG4jpGiahO/uzG5wf32zjQvPSBp4qeHYNO1Q+ZnLlwWW9zTGSpG3Bxy+tJG8JtzfbKQXsCUFkQKWRCXWK6GZE/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrFnsG+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK0pNfsU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pmOR3752372
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dpp2pOYs+zgwLnYd8Zpm3wMJtqBgJtWLRZMos+6qw+M=; b=QrFnsG+jG6rGzo9W
	lO0/0zNIpKPh5RzaU880EfRtJvcH9VKGHTso9BTsUoTdKhUk1V+siOywCL8LjgFi
	tsaJ6EiG+/j7Kabmwf9GqvEIuGlyf5V7pT7hOuM4P70FxKSiOaD/tOSHyLtQrefW
	NahBP2Wbc+FIakFEpEPpbyRRGGIXWu6Xi6wR4VZSz7O9gK0wRWBZh+f+km76aphq
	fOOYVZTZ4aExY24etzO0XVpDZqW4GUA9FcGEePBWxgcP3ccKN4YTkAEUhMCMSj6J
	LQanDekJryOGgpc0YHp2feY03k7QMgHdrEByr//wIDqm2f8yuyI9eHD1g6WhHYpm
	GeEgXQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1gujw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:32:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so826777e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455134; x=1778059934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dpp2pOYs+zgwLnYd8Zpm3wMJtqBgJtWLRZMos+6qw+M=;
        b=VK0pNfsUNUqEa4lJ9L2erBXv4206Il+blXl2uWvUQw8lnUzT+eGJKmdhX3BbxU5QBW
         5RhQMXFYTj6dJ+95kXBjOx+x44MGIeYvwXQuZdPHn8IML7J2FjREp8Z875QWiv9rajOv
         apGnMyu4i45kqcRi9S94WV9l1V0z9hVVQhhecbzdalNpUjaIqY5ZAtvDr7/IOZjHcbtk
         Nrfrpx473jxWjV1rPAM6+t4EwNELb+0DOa2/Im5Iwh3HHxjz1/Tt23r+5FNuSL18KS+b
         UR0QZ3rZiXRs6Pnn6ZyhD+e2e372mVMTkoSlQqkmTzwaK2C39X/Vf8gFdH+fLilePojj
         aUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455134; x=1778059934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dpp2pOYs+zgwLnYd8Zpm3wMJtqBgJtWLRZMos+6qw+M=;
        b=GxLpCDMvBbEk8ee4dIx0zhr/P/jmSYiUYJ/0ic+eVO5w/tFb+6gfwT7ldMZMZmn8kC
         n2kJVbXD3UpzWUym8heP5jCYrU6g+xtjWGn+r+fTSXRsIlCSHLxJC0ZAbfq29jSo4JEB
         2yN5sGQHNEi9PQxjIhvAiAV4b+tJSz/he6kz5PPpV6DY+EnBrTc+aBeAeTN18qe8Q2WJ
         LvN/nYymoKjFsSS3oPkGA5WYF3APYnBccTJK8/6nh/gV14WOG0LfVRKBmz7pFnwD1xCs
         Gt6P2e8h+q++a1IYBdiNlKEgW8DeDyWXYq9t45DXPjFZA2sbbqi7kcp2vrQcVOfxWAAz
         1QiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aJnZ5jCUuS62XK4+qUDETJUATK37YfE7Nq1un9AmzuUKoJlFR3DzmlIGfuJZNvHBFIdOlZ+60MDoGJ3St@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3kRrpRxaLBRxrTmHQ1J58XjyfkQOp428umTr7tBzUKavNs6K
	CD4IkNbGWhiwDWI0+bcZW6+RRXfrt78Zc2sFayZzWHjh+WT1FRIRVnpBjhJq5NAurr3Jf48EGYs
	fkXUV4RMprPys9csEcxhPf/ZUG5dI2H+QzgFXGjawQYnChlw4NEmqWh34882DMjnQ33eg
X-Gm-Gg: AeBDieu3CEeTjXiiBn4rrQ/NP2Qbgbdq+dLKcdxNV0enabPIFw7KoE7uaUtSy6DDYXR
	opMwC9SAX9v9FnnUc/06NsIYVJYdEryjRN/hOvMbbc/M9z7g6ncO1rqywyeQh6AcJIP3sMGKyxz
	yyc9A7hwimHE6FMw5mXmj1MYpuR8t0igQWJUZap6EILfukLrptmRYK3iRxyCTRtaqwbF9/L4vYn
	QzpXcenSH+bTZYC1dXfp5YJeYmcINCQzS6d07oQpBdPXUVPjDHQbJBYPsDgpKNK7KHeiMGgc9cN
	4cVAvSXfbBgmXVPGwwAQah4C/t6msvnKSwewFPeWM+DCbYhcBtgkAE4wqQHi19++3I1kinlcCya
	VOx8y1IHcsfGFlXvVoMueL28pRzGcKLboghjYw8afwBToJQU3aJ6cwS6ESceQP3gcqFuq4Y+5PM
	9XkZLN+JLG5otZ2w==
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1309835e0c.3.1777455133952;
        Wed, 29 Apr 2026 02:32:13 -0700 (PDT)
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1309824e0c.3.1777455133542;
        Wed, 29 Apr 2026 02:32:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb980a6f2e6sm67596966b.8.2026.04.29.02.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:32:12 -0700 (PDT)
Message-ID: <2390c346-0112-45b2-8d10-d29ca3cc8f88@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:32:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: qcom: arduino-imola: Get Bluetooth BD
 address from NVMEM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-9-6ad23e75190a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-9-6ad23e75190a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f1d01e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NSBTYWx0ZWRfX3JSd2QStdRvL
 slmRNxvPiVRpkQlp8oQk7BubeQZ6Bt3J3DemSThTPOszX6VJbrvk73ynvyjhQLyURYuOc4Tr4RS
 JROCP2kgHQb+N8R8ftryH4xFpsBj57/zpjRvhXhlrdosCtu3AtrZF4IeoYdp1MJQiF1Nw9iY+oB
 JR29I1x47cfy9pjFa4vi8D6UTRv+xq9CrL8zZNeqfFb4f1a7BqYm1iVc+GEXAnePci4WF6Aoi7x
 c3hWZbR/0sHNHAA7xNbNhds9jAyK+b2RBO1KxqRXoIFg//Q07wX27pEPtz0fmTi7p/EzOEjAv29
 WPiK8mkAcSdxfwxBAWd5raA82AcQWegHfCvrAgAZW0nIlIZyd54BpOrSh3Ye3/2CLVt7qsThOBt
 3ZS10MtXWaxZV4xzYafFzC8vOWHmryYPRGgLCUFFWBwU9N2dpUxxCQV8rI3OnqnhG2xUdYVPuVb
 7Fk/l5sbI7I8wAnNnpg==
X-Proofpoint-GUID: QC1hpNkhQ2fbmRha5oGCfZ-StdYrzowG
X-Proofpoint-ORIG-GUID: QC1hpNkhQ2fbmRha5oGCfZ-StdYrzowG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290095
X-Rspamd-Queue-Id: 2C76A491F1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105170-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 4:23 PM, Loic Poulain wrote:
> On Arduino Uno-Q, the Bluetooth Device address is stored in the eMMC
> boot1 partition. Point to the appropriate NVMEM cell to retrieve it.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

