Return-Path: <linux-arm-msm+bounces-96407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC9VBhlhr2kmWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:08:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD0242E7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9823331066BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57647145FE0;
	Tue, 10 Mar 2026 00:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JapuiHfL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJV8BRjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BF32B9A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101211; cv=none; b=FDQ2SwQabJFe32torvNBfvbPnQG/8Mk0iFj4K/YqbW51dOjSqjcDXyiC8k7kOcCD7BMXzVmu1rfZCrsViT6p40VnvekqiK/I+AcLJCMjLj0+N9E2Cv/q04HqvvlZO+gjUXmIMYKyWNTT+9NAJCOJJoiwfcoep7z6LYGP5zNMuLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101211; c=relaxed/simple;
	bh=EeFpgHgJ4EK0P/FdP0P6/Wa/ChILFm1ALZyRl6FBEdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYTEx63ZO/kxtKsGMcoGQEyA3bxeJ1kC66UhIfuhMUZtr+8z5ENW4BBEToTwYOJ2iomi2AuiVe9lg9AQsWJuZlgQA+uZH2yaXEInQ9EjQqRY0mdpdVL0mf1wLTMPGqapdzC2C52odFraVta3rDfVxLPtGG6YMiRRCOqizU03wNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JapuiHfL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJV8BRjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBsQA1920970
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VFmhFycj2WExrdRTfkSysTZd
	dOqHarJ5plPefogYPpg=; b=JapuiHfLWZPy7Qf1nLM6DfJ2elKq7wWA9Yz5rN8O
	RpcjqtxbVZQzPTeEaWzhCzJvIQB9NqUTVZPR0OLNID2rxrhJ9m0OKBhLQdtt+uQB
	yuFo+H1vhdnVA9t6TKi/gGnCrozq5gKa6R4+3bReYtOAad9u/0n8Jo8QPHo7xI8D
	cCt/YeY2P7veEZ7jG7qhD9+DzYDBeo0J0H2ZHl7U+XfV0as0rPy10njp4OBO5Vhz
	yGlYbJ/CR7EkMmFIcuI0Ai5YHFdPRfqBxlTo6PghMlnTWcANCodJh/75Qk/GjMov
	kGUR7kIDRhzZa9CTzNtrE8raj+VEE+v7OFR4E0kTo741+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy820hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:06:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77e5e187so1462722485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101208; x=1773706008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=;
        b=RJV8BRjRQrzvtXO+9ZiuKZvWLhgIURVucA9aTWLXXE/X4KA8IKA4x0iNJvWL9Eo+MN
         H2vMK8BtNG7+oHHp28sHo4l9d6sOZ5NePQvFD9fXFcuv4ILA7EAuQjH0oF/kVL34fiwF
         TDQxBu4pg9IslEVHI4OhLItpAfHchyFXnAkFNxh5uZ/Kg7lpBDdSskM0ILJ53an6IP2d
         bfyvxl1o7FfZBJMc0R1GS/ScESfLeFLszs1RkPcnj3bX+YyXrxY+Imj62ImTTffuygfi
         8MXMMPqCiCMgGrHaUJHeMB+x9TNT+2FRuGsDm67UZLIbmOLuVUWJtxgLCYHvJG8ueUvR
         wh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101208; x=1773706008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=;
        b=SmP4agv0S33Op10BAgCU23M18E5YGEgClBHxLywlAgnDkgXiSkozAlLxmZ2meOz6L1
         fU61rXAW67G3S5PGJ5SyLhBpUCPdnz6+L4s/Gji5ZwiTS3m+47p8USWMbh3tMEMvze6q
         BGr36Cpa37s7r55USfSIRDy/QATCere9bHESgXBvv4sMqtgkgq9oTSk1KUJMZ385EYVp
         5g8Y1olE3gBZhEs6Ko3uvKsvBZlP84Dkn9tXdHmxeQ07t8lcdvxK3lx+XN2RBWuC690j
         P3FBER5bxhlguoq8pZU3q/6mKEKdhzBjEFu2D503wzvY9eHlirDtvxEyiAFzV0syoJfQ
         SFvw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Sei6aVPpDRmw7Q8U8tf5IGbKJMCk6vSZDETrHTLPR2/7+5O9/nrnCkMqhvJ/Lkgym7ZpDdjdSSklyhZg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8INNsIc506z61rX8DfJxgtctoVSArziUhJc7kJO7DA9UgMg9D
	ySoCjKr6M7+PAj0KHksJUoNzrqnR5XN95fSr99P+e5yKeT5TMeyfu9fo8z7sGivmX8VBqqx8b7d
	mK+KyAIk4RbvVuta4ghegTmDHQlanYCQ/Ze3pIDKXoaM0UElntU7lxLf/fBqpYrgQ4awA
X-Gm-Gg: ATEYQzwCYMi19CcKL4jXYI4U3z303xtM1Ok45kIHyVik0IqzHSKswgSzre1XeAAQApq
	TMNjjQxeEX/a1eehKM/tcWNSlefue8dBOEBDoDLEaH6EQi1oZodmm3Vo+OzhGXUVOi8HCvtOwmo
	unJOtVww6rlKAVztNDtBvCm6Z/iUIxIQiwztP6pZ0W1cg50mcKVk+AwzNRRLQKymbgOVVmtKhDJ
	PYMvYpHecQJxxOaWf6k0hyIFCR6KPo6qFZb8lq9XxIofAxcjP41tB1JZXFU2KAiJNrhUiAV6KG2
	j55sGch5mWBJVMSCJHhID1z7ExnKyQn1J8ItMEnANMbVrDtPZauYoCSzd73clq7SNy730s7NtSz
	G0YhKACo46W4+gxLF34aJ2hQy43zB6hjjCXZRhmoLxge4efMQjwrBQsBGHd38ADxNGG2EIC0CfO
	3AzfC754coa2+OwTS/bPlit7FgmEyaqIpHrw8=
X-Received: by 2002:a05:620a:46a6:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cd6d488044mr1675002085a.59.1773101208098;
        Mon, 09 Mar 2026 17:06:48 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cd6d488044mr1674998085a.59.1773101207669;
        Mon, 09 Mar 2026 17:06:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08641esm2376849e87.74.2026.03.09.17.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:06:45 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:06:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 6/8] soc: qcom: pdr: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <sm2yj2zmhswp6ydjeonal2upnm6qwokivmrnyajmw42iw2zeyu@d7kwprkm7voi>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af6099 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1EgtvGsZK5M7WpkkhHwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: iaqkBUEwkFD_SURF_q0qPdQgaLv_qtkF
X-Proofpoint-ORIG-GUID: iaqkBUEwkFD_SURF_q0qPdQgaLv_qtkF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX/AM82hj3iXS7
 W6AUoyxAr8GehW7/5eZRRZAaoBQlwpQIJ8cPF2Va7qZXXNJl/Nd97zonVwSdCbU+kx9rSUNVO9O
 QaLv5PXi3J4JmyF/7PawYMrqGBur7MkQXnpUcE8WJxnvAwUApAac7q1ZB6QaLfTJZvkNwYoHKr7
 s81OZrrChs4PHiN/8Rx8324H+inNI5OCpD1NwzwGIipRzz29tHeijaX0pze3YEywriieKX6Ip8x
 DLqCfVUCFF75b/+CHJmjCNzutcpZ1EnOQTHjYHslb4LM46BTVuZ/V4la7ocWu8HyGkAdutEOy29
 0i2lJjA1L7bFS5Vbfd3elQwNNMyoEowJxKZr7zVWlH+4GVjPM5OskJsve5fS4/wWRfT9quv0MwM
 FYLrtRKKi3NRS0ZF7lCrgjJNcllanzO0li1Wf5LF8QtwJ/ICXBV+Sn4R/EUehLO9d20JZIuixZs
 16N5u+lOGiy/OBQvvwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-Rspamd-Queue-Id: 72CD0242E7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96407-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:03:35AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pdr_interface.c  | 4 ++--
>  drivers/soc/qcom/pdr_internal.h   | 3 ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

