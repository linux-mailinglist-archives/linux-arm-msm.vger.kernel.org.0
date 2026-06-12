Return-Path: <linux-arm-msm+bounces-112863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dC7oL+63K2p8CwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:40:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A51EA67753E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:40:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h8SWiVAO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UCdcuW49;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112863-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112863-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4173D3028740
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA34B3E1209;
	Fri, 12 Jun 2026 07:38:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74443DEAE4
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:38:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249888; cv=none; b=KEoPVkVbXLhwETyNXQF8DR5uHnlpDq2BBSknPeQ165zffaCtoTRtqEynSrSM+bWCbusDbczKodfZDP+jDSTPE1OrZ2VekuNBEhZZfG8qMV2UWssdGpSVw91emPIOYEhZdpIJjfHQSd6Vzx3/BbSPKfiFEGduiJk8XxolXIN8ZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249888; c=relaxed/simple;
	bh=DOP+NEjs0aZ8AjB9Kb3C72IcIFeqDyCdhC77UBl//ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKTstBb6nafRpiV29P0NkFsruXe1PeOEURWm6aBjdObgGomVl0kjmHyxBU/ZParuiIodvPh9lXNF6iPgedQL7sjMc0Gii145Snw+jv7N7BLyQw8yDtnje8qC2GXfXa4haIpKMoYyS+iF2WclIco5/UYVpUdIhPDS5OIIcWGp+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8SWiVAO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCdcuW49; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39eZm2411611
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FtRrwXijfX7jRcNOtiyO9WkT
	MQFqO0ZC2KWKNOB7OPs=; b=h8SWiVAOr/HjgZKoNKMp97PEMyff1+X+dwHmAj9x
	Jqsvu+PfBmQkjdyCDR/OT4ezsJKcW62RC22owB6l4PF1gIQ1cgdUMeNrsQxyh4gI
	KwxjsjKD1qOK+8GtryA6UVJRuYYP407gxUG/Mri/1IAdeu+M76ABVs9DP3zBMTu7
	gfo0GvoEaG+TPBP4HB8gfsRmh+/Yxm7VolXeJ2h3Dl6nbEDiOH6Orml9DkKcWXYG
	ZuEJtCKbDZG1F3bOaTqmg+EzGdAmJznz8TLvs79QExokC1PAB4oO40nGJiNc4EIU
	WkDO1UATKOvTG1Q96GvwwWvmZ1oWt1zcvr2PWsR7/57K4A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165ak43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:38:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176d949c58so15063331cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781249886; x=1781854686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FtRrwXijfX7jRcNOtiyO9WkTMQFqO0ZC2KWKNOB7OPs=;
        b=UCdcuW49u6DGqWrj2mOA+BPv3gyNkR+erBWzO9czokPcSWhaEGo+arhA55gNhrRXCz
         d4xc8qmPWJ/u5KgReZ3CgTXFctZweGt+epb2yODkwH7TP3Keq0KdobZDX+uog0dUeYDU
         ejErasHtznHDIGw6xc45I8NbAl2TYFKSw8HCNXTlS63+AgcB3xyIx157XwqzuRAPNOko
         L+hsi44+Upfc2bef4zaeet8d+MJ3pS6OcJJzB9Q0HeRmX1KhpSJ3mLKXdaG7I59rD7IQ
         1q9FfwkwWIq/PxnY97EMMFlPVc4WkAJHOe8KmT2X1eEV7cQsH9Zdg9PXuhzQRyJFO1aU
         rFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249886; x=1781854686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtRrwXijfX7jRcNOtiyO9WkTMQFqO0ZC2KWKNOB7OPs=;
        b=k+fs7qZO/wMyMi2GFBdQrGj0rdBwpBJ/3LRU85k8WpwB4hzfdOfEwpMFyzeUPXIS2D
         qYwMZM4WWas8ywjWQmgaNGuhiZONK0V35+gERct+Lmfb/fz5yy6wNpxKOB8vPVFrEJIL
         ndNRtr56ZCRJYDe23yEe+G0VOdl7iCfaAOKnid6YYZFN7Z4yLre6PeE1Akxsw0woJ9oD
         8U+W4cU3r6SH0BDTGuj6M2ztW5dEmUUrqXuJnyVSPj845W6kWn2yhhMOxrU45B3sFX65
         jE0pdhFuLEUgfV2Ts4M6EayuINc82jg0A0V1Vogz72K5joDVlS1vo95zopobO9mqnEFk
         f/2w==
X-Forwarded-Encrypted: i=1; AFNElJ+te+WozJkx0m3MHDLqXBAncUf4tzkwO2LAEFPJVI3bZf6lnJsBOrvP0II+ctEM7WChQeuoiz1RQvmCk2t7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9cyHGU19RSHsnvr4zXcwMvivwSPl47b2vdKX3gSknM0ZoVkB
	2w5eP0JIkMz2sK2x3BSfvFlI9Y7byrPu1V5PV/68352wai3jO9KMIhPr1dyPmvcvAfhpgOZ3wTk
	Fmu1niaweiHSMiRtxUq7nZQZAGTlq95Iw8dqvk1g6XBpKvvVYjqHqrjqMTPrjW8YJabZT
X-Gm-Gg: Acq92OEekRGO6bQx7PcmMbyn7LBoElajsqnh3mGPYGeL3D2vkdfGiMpJMPFNgOZslvw
	xU47+TiIIzCPBawrmTxVrNxZGv+5rlAsbp8QGvkAmn5KFEw8B8I3bDGI/fftT9ngFG4IiEdSlVz
	hK1tx43aQ//+5e6ETyp2pZqsWZLssyE0B+6bA9hREyJxr0wKK8Jucv6NXAESKH+xBjrnh8W/AwL
	EbQZ/XJ+EmrSL+R0CoTrwA3hyMEQbUnEg37OG/S7hXFuk7NXv8TKrG9XLjokcv9UCxkYUrBZjQ7
	t9WQGs1tOuEpx3l6+XuAzXr/BXxFZ1I1ICL74BNaT0ftEq20Vg6b4h8IVFKHgr+p4rOn2gteVJd
	DG+lr2B+s1M7XRkAKw5yTLFkO6pE5M8BsUD5UYKGLZ8VeLVwvsg98kZ+p+JAWT0SQCwtz8Hz8p9
	JZ9xJgMiNnNjqu9ciEhPyiegeW6248K3n3bE4=
X-Received: by 2002:a05:622a:24b:b0:517:7d9a:a88 with SMTP id d75a77b69052e-517fe4edb35mr20865881cf.37.1781249886124;
        Fri, 12 Jun 2026 00:38:06 -0700 (PDT)
X-Received: by 2002:a05:622a:24b:b0:517:7d9a:a88 with SMTP id d75a77b69052e-517fe4edb35mr20865481cf.37.1781249885707;
        Fri, 12 Jun 2026 00:38:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7283sm302576e87.39.2026.06.12.00.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:38:03 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:38:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP
 and MPSS on EVK boards
Message-ID: <po2gqpbmqw2tnkjn45ywgnsiaz2tpsprr5yowe3lw4y2lxk5ga@m52i77h5ymu4>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-8-2114300594a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-shikra-dt-m1-v4-8-2114300594a6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfX+JHnzEz8rjha
 2Tc3HNWG1pCyaYPNxycvsv3Sgq/7Spa9wuwrqV1Id+61tJCKg0Kzqi1qXVpUB96MjM3oXtaGh5I
 QfIjZ7PYz9vlbhKYax4eg2fudiciAAs5zvX1NJwaCXgX1zRuxCJiBJq6Ojnf2lZm+JbHWBPwB22
 5+uzBqoh807zRCZX9vhRMt10LzqOY+a0f0gtr3sdElZVm9AhFp/n6fUjH+nt+1AkX2D9ftTtNOA
 QAsrtrw3q4oz7Qh9QnoPLt4QEnfMT6IhSeDSXamumCcD3zIUCNC++p1YYrxxL7LPm3KRCTxYNod
 7+UdHWJ4BTTAgGikF9zLxDH2cyzyfvsS4eRMmMVtGshzOGqQ3zwTY2/sAxDOeXnAwb4heEJ4QN4
 0qA6gKWt4243E64oQgfTmfpDd+eMNyzEscDaBoOs1s678nKtF9tqWje2C7axf6MWwwENYpAOswE
 JmOwIWWeIsCtW9PZ/2Q==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2bb75f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2wNq6JH_cIzNK18R0_EA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TkIMWgqUhd-J0TciFlkx9g1c8aFS24Sx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OCBTYWx0ZWRfX/avfj2pZTKAk
 r5QbH6k8vAP7mFjaKmVNRrIK3zgJQL1H8mB31XTlZsqoiNeq8320aakuDrzcasRcIwns7AEZUlY
 AFdC0KZy6DHBSV5o+1aBcyjQyYhNGVk=
X-Proofpoint-GUID: TkIMWgqUhd-J0TciFlkx9g1c8aFS24Sx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112863-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:bibek.patro@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A51EA67753E

On Mon, Jun 08, 2026 at 06:40:28PM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
> IQS EVK board.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
>  3 files changed, 57 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

