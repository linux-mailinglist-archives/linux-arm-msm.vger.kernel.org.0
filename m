Return-Path: <linux-arm-msm+bounces-96629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD1BFesZsGlAfwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:17:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60E24FE0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 368723258C4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A4C3A3E7D;
	Tue, 10 Mar 2026 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kRQINKIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxSrktwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332D3B6C0B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145056; cv=none; b=jy4xxg2REnh+YZNgqIgL/2OsNBUApUtlMre4lCcy6f0hQsCgt4J9jT25Lj9f6DGq0/h37m3P6llJ2Y5PbOF0bKDfzABNZgUveTDjSTExEybErWV5cxWfgrGRYwZnkcNsOIq6kFCWkRRVsyX8xvWd0bysgHePsBOBbG6AFBhcWiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145056; c=relaxed/simple;
	bh=6Z54xXZ7O0OzD2fbFV8YHjsC5EErhrlwiIX1BVElLfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDI79TL+8gZhQvfCdklrYDkALYNzuwce3LIHagwKtVg+ovXn0qVlE+MB1k822ZTLBBcGdXdY0gokmoAiXn/Tyj4V8YzQ9Pp3xk39sKXi9CgYsbSyc5gbead5COo+1j+/TX0sUi7+oGDLFGvs11LjzOYsUlz3nA9lcLkLuVyYnDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kRQINKIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxSrktwS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8r4wO2460625
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8u4ZSwVx2s2Y7OGu3dsf9f3SyrRt6Q7IiSU+i76KfL4=; b=kRQINKIfnn57uQSW
	afw6N3tAvqxxOXPdB7L7ktVRL9EWfww1h2LBbxh7ua+6N0L1267qkefvWefMByw0
	p8N+5Vl1qYpvDHd+/SsVtFoJvsoNYN/KEHdneDBG/lUaVNK+BdKN1dBTMC4lYLsf
	v4WidzrTxVEv6mXUIN7fXH+7VBuuf01ev/y4oxJx2/9ck+K7gHGgdRn9DUKYlJW/
	iwvabEE3RO5geY/Q+CVO4tlfACpuyaHwzjyUylcSDBJCsGDDRitRCNrbksvnMwAY
	TdhgAGc09deQMq3KxTH4nUqQMuRZ09t4fAF4+OLFoTFq7hU4kKr7C3I/47N7qVHb
	D2cuhw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1c7gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:17:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd93c91075so63669085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145053; x=1773749853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8u4ZSwVx2s2Y7OGu3dsf9f3SyrRt6Q7IiSU+i76KfL4=;
        b=fxSrktwS+2adngO3Mnxhc4mqTipfGvHbyRD3cyMixiwrwJsh+9SG5cxmFv7ihySkdl
         3LW7yNjdGRspWDgo9c6roojzy3NT/NPQYBJ53ui10x8Z8xHw/cQUCOiN/Ylm1qEmNVT6
         xt63tAtnzGGL/lUszaykdt14d4zAb+TEeftOlCAJHBN7GGu9J0ORjXfYU/T0XS0ST/hF
         pXC5I0cbqMLa5T6xMl+7Jfv+CFRnvedxcfxcdWYzAAOFreZxLRBuv3ddpMGsjGEKSfFu
         76djStC+cVKn9+RvqrKKdDaHUJRmPxyl1jZ7DbyMXuS1cBpHHB3IpKyw+2pqRO4zkFEf
         TJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145053; x=1773749853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8u4ZSwVx2s2Y7OGu3dsf9f3SyrRt6Q7IiSU+i76KfL4=;
        b=nODtieickhsZ4lHbpeYRUa1YwP3ZWHS8T64z3JbZxNlp3RjLsrJUZm7NqB/D930Xjk
         T5EEZj0pZ3txquoKRn6i2UfrFlPGzb6m5BLRmA3ACjfIdYgLVo1nDdTJvEfWXK9IGzXE
         tqVOQW70uUakg1REfWULvC4g6RG2MM4MLy81hcez3YCccvbuB5t59EufM9BieXov5zZL
         4PcO3qxsuy3EoCVdmnkfEdzRXNJ4PZ9A0tNGw5FNdgK9lALCa1PyLgc1Opav3FKv0wsY
         SIOJV/WuyIgC2+owF3WPRuOJ9OIXcOaaQA61GHkYwo/3AXl6PXSBLDNcF6h/eXtRlnFD
         tsVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY4YNur/SjDOv08JtcDeEAXsUuuX2MQjv7QoPzUEoF7dzKnF3FdqFE+qVeJRxM5O1eYEE7Pk1MMJd4Fic5@vger.kernel.org
X-Gm-Message-State: AOJu0YyjlJ5tboEY+E1hY0gnNvk5zz88BRjkCji6QdRMiLfpapwx8DY2
	7rcDm1fINWwxVD1JSwIftTyB3GVo932CYWTwNCdFZ/huqTeWwDz9T/YVkQx4isQxe3o2iLuHGls
	sqhjePyWgdJNYsP5ZoZeBbRbLmVmRO3t3uI5VlCX5rRN2lkM1cVZW80ZeMh+TjcFr0bU4
X-Gm-Gg: ATEYQzwSmTJuekMweUR9h5bUuQzhkDjeaU75fzWhngstwNVBT78llts2uUR1Ynl7h+x
	2w4n6nDOO+XGzJCZGwRt9WKTvaalpT5C2rK9VP0nKZh/MasEIWZ0yZCMJYmu27C4jZOUFlAgd7w
	eJU5HWPac3d+pQXsECN/KgeA0YTL5drwziCeKBJ+R+jSLwd1VFgXK9b00WIJK4kB0i09tZ68JMV
	hEvzX6jlS9bCptW5UoIoj0Jy62sl0TluBF2B0AOGvaMb3+W1Xf53DuDTFj7DhfLIJuV85WZJCXj
	afaG6X6iGlcOBtANkjnaE46o4/FdQoq6/hcHWSM03DoKvXU3jBU9xK02w63A2rWSUTK3J3h3SEO
	LUT2rLWCsyaqFHvbxZj48lOknyMzSOYKUE9oiAkQWIeEUZDlOMNouTl0ybz290PCRNGqgHVJLL6
	9RDMo=
X-Received: by 2002:a05:620a:a28f:b0:8cd:86d4:648a with SMTP id af79cd13be357-8cd86d4668cmr574300985a.4.1773145053185;
        Tue, 10 Mar 2026 05:17:33 -0700 (PDT)
X-Received: by 2002:a05:620a:a28f:b0:8cd:86d4:648a with SMTP id af79cd13be357-8cd86d4668cmr574297685a.4.1773145052751;
        Tue, 10 Mar 2026 05:17:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a2b801a3sm4288761a12.0.2026.03.10.05.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:17:31 -0700 (PDT)
Message-ID: <4ccf78a1-2a96-4d32-995f-834d37e9cd0b@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:17:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] clk: qcom: gcc-sc8180x: Add runtime PM
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010653.4266-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309010653.4266-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Mp9pGQnJFeu28FKriOMOFTbIVNibhK3T
X-Proofpoint-ORIG-GUID: Mp9pGQnJFeu28FKriOMOFTbIVNibhK3T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwNyBTYWx0ZWRfXwSZsV4mqkH49
 THS/7WXA4KaMG2QroQp42S22MfWg4q78+U3ouWR2pHPh/PMRlT9lMV/VLbnHhfwduwCp6WuXWLS
 FpktHJkinv5auWa6nMosZcZZjCWbRoRS/VXO58Tn/+RzZST3dK4xL3VXKaVc+Z4j+oWowdM5gjD
 LQ9wnTU24CahyYqCn6N6b8Y4sbSGDY8pweI6L/e9bXfq03e248fM9MTJa4Nr4+R7eAuRzOPCSy3
 QUAi4Ay7tOvAAF4aIy6HMUdk9VjnNL/tIhCGNnpMChiReT/HS4/ucO7e6xPLVbHghMKo/fXNLtD
 KfYQFEBUwtM6ENifOjYykZztd8y7thVj9qtp5dFIRMSAmepVlQga5JZxERQQd+KAT62iaQ8thRk
 N3RwPzChdYuEJ7vYwP6ahjIxYW7QsTRsql7stEy07sc9nOrwGV4RLIG5jSfWpKdNFUkZn3r2wqf
 MKySVeIL1RY04BuacTA==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69b00bde cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=t7adyPguPgru3dqzU18A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100107
X-Rspamd-Queue-Id: EA60E24FE0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96629-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 2:06 AM, Val Packett wrote:
> The GCC block on SC8180X is powered by the CX rail. We need to ensure
> that it's enabled to prevent unwanted power collapse.
> 
> Enable runtime PM to keep the power flowing only when necessary.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

I was always skeptical whether this is useful for GCC - here's an
excerpt from /sys/kernel/debug/pm_genpd/pm_genpd_summary:

cx                              on                              256
                                                gcc_pcie_0_tunnel_gdsc, gcc_pcie_1_tunnel_gdsc, gcc_pcie_2_tunnel_gdsc, gcc_pcie_3_gdsc, gcc_pcie_3_phy_gdsc, gcc_pcie_4_gdsc, gcc_pcie_4_phy_gdsc, gcc_pcie_5_gdsc, gcc_pcie_5_phy_gdsc, gcc_pcie_6_phy_gdsc, gcc_pcie_6a_gdsc, gcc_pcie_6b_gdsc, gcc_ufs_mem_phy_gdsc, gcc_ufs_phy_gdsc, gcc_usb20_prim_gdsc, gcc_usb30_mp_gdsc, gcc_usb30_prim_gdsc, gcc_usb30_sec_gdsc, gcc_usb30_tert_gdsc, gcc_usb3_mp_ss0_phy_gdsc, gcc_usb3_mp_ss1_phy_gdsc, gcc_usb4_0_gdsc, gcc_usb4_1_gdsc, gcc_usb4_2_gdsc, gcc_usb_0_phy_gdsc, gcc_usb_1_phy_gdsc, gcc_usb_2_phy_gdsc
    100000.clock-controller         unsupported                 0           SW
    genpd:0:32300000.remoteproc     suspended                   0           SW
    894000.serial                   active                      64          SW
    a80000.i2c                      suspended                   0           SW
    b80000.i2c                      suspended                   0           SW
    b84000.i2c                      suspended                   0           SW
    b8c000.i2c                      suspended                   0           SW
    b94000.i2c                      suspended                   0           SW
    b9c000.i2c                      suspended                   0           SW

(this is on Hamoa but it's not much different)

You'll notice that the GDSCs are counter-intuitively **not** children
of the clock controller (perhaps "anymore"? maybe that used to be a thing
in the past? IDR)

This means that the GDSCs (and therefore their consumers) have their own
impact on the enable state. IIRC (which may be wrong), the clock controller
would be runtime-active if any of the clocks it provides is, but for that
case, we already (should) have clients voting through OPP.

GCC also has no 'required-opps' (which would make it hold a permanent
nonzero vote like some multimedia clock controllers do, for PLL stability)

I was curious whether 'unsupported' (i.e. not RunPM-enabled) causes the power
to be kept on, and it certainly seems that way:

gcc_pcie_6_phy_gdsc             on                              0
    1bfc000.phy                     unsupported                 0           SW

(note this is *without* pd_ignore_unused)

A zero-but-on vote will be translated into "lowest active state" by the
RPMHPD driver


So perhaps we should do that after all, as even with an aggregated vote of
0, CX may be kept on, but as Dmitry mentioned, .use_rpm is the correct tool
to achieve this. I would appreciate if someone could (n)ack my thoughts..

Konrad

