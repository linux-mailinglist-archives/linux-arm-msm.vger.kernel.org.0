Return-Path: <linux-arm-msm+bounces-114775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BTjlCHcbQWpElAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 15:02:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 761816D3D9A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 15:02:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UR6TL9eo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cqEnE0W9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114775-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114775-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 025803006F2B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 13:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDC820D4FF;
	Sun, 28 Jun 2026 13:02:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4718AFE
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:02:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782651763; cv=none; b=fGtN+X0hOyYRid2J4IP1RxyHtN7dVx0A59n5K3mPpsKO4Vkuo8hiP+8X6NYhq0AEIDtGJdm+WNuo4RZnEpMjOTLQMhzzbMGgLvSjpQ579bNXMKE+bjGOiHGnCmwazCK2SLUwPdQBUteShT2w3B9Iq2u+nj3A1gbojgZE9mE0wk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782651763; c=relaxed/simple;
	bh=3a0VbnXkZ8vz4fvZwDTr4U6d8HJd1IYRhkPgY28OmDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVHub90yUcAfzSraapNxDUQ2uyb+VGnOwEIxT8RC+76eIG1zDyS1TX2Ji0ygTDKx3EvnRNZJ2MlYhhL7r5JCFSmHimeFnIAIrwyjQEF67ChlPASWMBXDJilslNwJ41nFs+EWIzR04Sq9g9KEMOmm+45cgm4uiJF7Mb6ILPNquh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UR6TL9eo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqEnE0W9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9PM3q3606450
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RdveEr8qZ0MWpllypjGf5SGU
	2/zVm5rbjh5987dmoZg=; b=UR6TL9eo7FBJxNsD48lxY5TzHBqr7uMgs9tVJ/51
	B4wOu2/qrlpKfcZDEkkEPrTL0rdOSq2x7ITK2yG87moS52B2c8LdDBVj6XJs8J5P
	QMRFHcxYc4YqYJza98GiMray736G5YmgC+TRTQxtI0KVzn5W78iOfrP+v17kFOaE
	UE+rqiXkt+myKaJqO9bbmPUdSrdF3jN7536JxzIerjSgvcZL8edpyRp0vltevqTU
	U4Xn5BFCRi9coq3c83svEztaE1CA6TqusXN0aG6JiC/vp8jaaAuAfnMF+cYunosw
	sQge/T71d08JZTrqUjboV5aLufsF6f7vOntzk29N//TgMA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cjusp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:02:41 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-494d3abf6b4so2723521b6e.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782651760; x=1783256560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdveEr8qZ0MWpllypjGf5SGU2/zVm5rbjh5987dmoZg=;
        b=cqEnE0W9NWZNIfB6/FFwnsBzcunrNngmFfjPtVd88mOeYGd4srnLAz4LyTynqPpA99
         zgcMAwMefQpAQegjchqBEADdGbu6SamnkzvqJkGAHxUXlXzQ0Rp/gQcS8IjfDdihPe0e
         F9+5W+vOx6URmUQyqKLj65joyJJxRzySEBQDSFtbWH3UWGBTFOOgy2BjpDjg0UZCgD/r
         N9AE7zgwmm2eNFA6H7qChbMvAXJBDNlikWZrt115PiOquqoX6/5HdmXrmg65MtWRDFW0
         QXrG2nEMON7C/2p67JhNxb8pIj08oo9IQglYl+rIlyCgGHGGgcU+VAxWBq9o7sQkJbUB
         Ga7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782651760; x=1783256560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdveEr8qZ0MWpllypjGf5SGU2/zVm5rbjh5987dmoZg=;
        b=kQGcepxGQ/5TdlNwlPakbKBJrceShje84Xgi9xPonaCQJpf8QDlq4kp/B94NgLS4p7
         KJSldHcSS+V1CBuwsdU7ajbhdZvslJbuAviu5Keol3N8GiY5lKyBkDQi10FAX8j82zsj
         N47bfyAi2LJuAg0VToLybbmk5PoK25VwhnHQjB4+NXBlASCH4YjFDcaxc+I1TsoEQPBF
         u8i4qPwm7G4qiPOptRq3fvr6rvY0PpHSoYntnF6pzGVahsSaTiY9uezcOc++3J6LEy0b
         vlCjGh3hKZhh2wvPAtUotmrMwPR7IYhxQnoMlD6zYvYnnE4/zJpRMy/xGOvdGH5wSh/u
         8DNw==
X-Forwarded-Encrypted: i=1; AFNElJ+aEhkYtBQB7+TQeXQCVPLJfFX0qz6Pbu87+/3Q7+v0nrp8Fqmb4KSdaoDae3K/vGe2qSNPNgxuC4FO6MtB@vger.kernel.org
X-Gm-Message-State: AOJu0YxWAGjINBlE4nS0cMnAc3a9bxfXgkcKb746vXm8US41paC02ZGG
	QGkNlvNkIDzedHCYEhJf/BtukADeKv6gq2NsBbzPukj5KGVjKgEfZJd44tIHic9uV4naklGDEgd
	99BJS8pCFKLQ24Yco/SLToCr3MyvZ3QvVAhm9vdrr0ZB6v20SWLD4tyA2/UN/9IbDA+of
X-Gm-Gg: AfdE7cmvGy2SXZs/XZqpyukgdv/lnz812Rl3SslzCfP79wHRgLvdDjy0DxNDk+wgmwj
	Yb2zxHe9twd3EPdLFK8/jjDz7DFZNcG1UHKNop+8e3l7Se4yDklAQpzFUeVGqI9LOuuhu8/nugX
	QYh37bCxvZ94MIklThAymeCZOWz32grfawtKwK5be0bvMjkWM5//aZy/ybNCXuZOSvoA2ILH61y
	5hSgGxFTucFDFAiGEHgoQKZhE6qOVtjo29/zm73rNuC4be34hDrj/PudccmJu14L9Rh5mZI3kTg
	LgUgouB/AW0heX5MYw9XLjoQPD1ntWNavrIZVo3baoRI9O+1oi2epCsyKOAbvZFpQti3i5dk/Q7
	NOXQjHC6DunFghoTcqrlEjXrFFe4eL97dAe2kKzEsjS5O7vZ2NX2sMC0lYGLm7698noqFxqOAf/
	+5haNnvmKku/ruGmVv4IEE5N8Z
X-Received: by 2002:a05:6808:ec9:b0:48a:a688:4155 with SMTP id 5614622812f47-4943dab6f41mr4832896b6e.20.1782651760478;
        Sun, 28 Jun 2026 06:02:40 -0700 (PDT)
X-Received: by 2002:a05:6808:ec9:b0:48a:a688:4155 with SMTP id 5614622812f47-4943dab6f41mr4832857b6e.20.1782651759869;
        Sun, 28 Jun 2026 06:02:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39aee2d6600sm11014001fa.38.2026.06.28.06.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:02:38 -0700 (PDT)
Date: Sun, 28 Jun 2026 16:02:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on HP
 EliteBook X G2q 14 AI
Message-ID: <jrubgkmydcyjfuva56p5qz4rc7phjrf63vki3b6g3oyfo7aqhx@uhvwg7pcjrpa>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-3-00905324ffbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625-glymur-send-v2-3-00905324ffbf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a411b71 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=u3KQrUZgNMQpLfssPf0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfXzHQrF4dqVSuw
 kDiQk0BAMseVxNCadFdwRvv+Z+Cbn7JVOg/8QC1i3FqhSXE19qqWXwBN60PlTp87Ak8RQCMPDCV
 44KnCExu2iI4KWMVSylnAyKtoeMK9aI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfXzk7rFebPHOmP
 Lj9/fP3SY1EYUr5tOVyJ22G5oz/mLmXqxccLKBtyWl4OR443Ef9df6l7Je6hiePJe0XuPDYI9a8
 zPWUaPxflcFaI2rfyDE2p5bYcr1sU9I6bYTdCbWv/XCSQI+zhKH+Fkw27Hi7ohUAhOLVlNQtWbv
 aiPwP9VSwuM2xJeBvcuLT29piZq5ke3cA/Ne2zgPbds7lH0HzUtolAlJ/josO864g47LOx5Enst
 Bad9yHTc8iyA4UbjAhglbmnvsKeZjDDREj4FJ8x3HxEfNynL2PldGleOVdJueqC9ozQRYa6XIsE
 EO4+VbEygerIqswpfcektF2NsigYXWO2AzM8dnd/DO3LCqnZvGw5WAzGZbvMixLICGhlkoY1Ols
 0zeqgW33aA8EThO82l/aMidrl+PJ174aLxPWDBsCFr+oRIaVOG+SVt7jaZ0UxQ0CAB+Mf/Qm/cv
 iRSSiwmPgFnA5cdEBuQ==
X-Proofpoint-GUID: J3bSNYDGufE7Xt_eoahVAL-o1QT1Hrg0
X-Proofpoint-ORIG-GUID: J3bSNYDGufE7Xt_eoahVAL-o1QT1Hrg0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114775-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 761816D3D9A

On Thu, Jun 25, 2026 at 10:47:22PM -0700, Jason Pettit wrote:
> The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
> (Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
> Add its board compatible to the QSEECOM allowlist so that EFI variable
> access (efivarfs) works on this machine.
> 
> Without it the kernel reports "qseecom: untested machine, skipping" and
> efivarfs is empty.
> 
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

