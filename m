Return-Path: <linux-arm-msm+bounces-111588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2NmqOMvMJWpTMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 21:55:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0D26516CB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 21:55:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bhlCR4ue;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Go9vwZKk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111588-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111588-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE25D3006946
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 19:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D133126DF;
	Sun,  7 Jun 2026 19:55:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302EB2E5429
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 19:55:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780862153; cv=none; b=ehSU94UlJSAkr0CKPGdPwaFI0ImY4YPPfs3n7RJ8biLTi6uPW4WHR9PvUJxiL8cDrVUYUWrZhmSNAP663la9lfaJcpmurB0ji2lbtMO/SPlfs28fJ3EaByPO3YpscJMl4pxCNgCtJgNTttpRPYoCz1I6urcBihkZV8SKN4ylAXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780862153; c=relaxed/simple;
	bh=4J7CraTbFxVrAU2Q/0zeueJv4jPC3HqzfEkizabx+fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9KI4qL2EpCqMecmOqHI3Z8Juwz83ATCOAf4WRes/6UScReymxw6sWsk4jwJS3ibs0Um6k53Ut/JrR/DPQIfOQGKc3VJe+oRZSEnTUSEmFTj4tYA3LaF1CMFCwydwNnFSo2JZiYIY2x200h4uFjokPlQTtFzdyD1v9ubDWmyJG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhlCR4ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Go9vwZKk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkSsj441251
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 19:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bWqyXsvCXgrKl1TXVXvI3BVS
	Pnd7t3dF8ExSfTjOAY0=; b=bhlCR4ueT2NZTbVDW8Vvx3v5W26MvkO23aH2nda2
	LEbvV6zfCYFQsXnwuBRPgemyBrsqbntTc0pC7YePr5c+hkecAo+eCayRC4Jw+nFe
	fYCb1h7norddbhbh3KkmdRVIUoA1M9Vzs4F9+XSgWleW8fHYVvfQdL8ht748PZhF
	KK48r+jAggEGxbhE5Stvz7ldgRAX3m86F/VjmWecKxExi+7nub/+vsXErxrKUdrw
	sWh83WTBbELf3sv22DA8EQMeXqFStoLDjO7//j6se4Rs0Ou12c72Xl25nGKhRlpD
	vvoPEzib0kQezR80rymko7s8sJFN0G7jHdqcbP/0vw782g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cw50k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 19:55:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso1511480137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 12:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780862150; x=1781466950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bWqyXsvCXgrKl1TXVXvI3BVSPnd7t3dF8ExSfTjOAY0=;
        b=Go9vwZKk5glNoGGhskgy3biyIFYZplVPQ4tMJ7bQSfx/5sqLiEO24+VRBNfQom+l5S
         Mrc16qeV5gUz1cOvffgCjzbtKx/Z6P6O34hDxJnlBcui9aICy83l5uAqTjSDaUr3EyuV
         +xCi4Y4oCpjiZLZDMWZ3LdoqSMxXqLohs9iqEXBTcpTtVVN7O291RzVeMwXBh9T6y3AB
         27fAZyHyVTaLtfvafnm2vtMcZe1/7mNO73Jqbb4Knn9Ir3xBQvbHq1+5rvGidZF2g6JQ
         yaRzPyzTP8qcBThFK87oP0O3Bg/A7YM7IypDnzG0wkBgxig6841LC3h5fOUMzQfSgkmU
         KGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862150; x=1781466950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWqyXsvCXgrKl1TXVXvI3BVSPnd7t3dF8ExSfTjOAY0=;
        b=mzEO0tbz5ZcdcMDBgE7q+bXKGYPu1JhNE/hnPUygjE5XyrZxoWfuQ4wjpk0KrkQDFb
         4UR3HxBZBOFIxq9xIYtT0yyTTbSNqR4YKqzb2ON7UQU0flOUTA9zTDa+i0kwZ3xYjXTG
         CP1N8zBLhioQbCxjPX5xCvc+nD4mXeZA7hu27eRc7/lDkolK2cpTn7iStNO6RGBjx6W2
         PFfSe/J+UL8YvCEfUXRnfLwigjvU5MC2l6M1EHTobXOUFd0RB2FHE11EHjey/m1wFqVd
         0ptDsWefx6cURnvgLyZpmFJQD6/fqzAZ/txSlB59o6pHYpI7CSk082cXhICGG0/PyW49
         uk/A==
X-Gm-Message-State: AOJu0YwxC6Zxbk3wY7pyGvOJky/TUl31Wi3AgASnLGVSHCOIGvkO6B/J
	7lkp6Lmtx94nk9YNAdXW6fc4Mg1YtplwrM0KseMFowj8NmuzJ5kk5RWa0P+TzF5TNiNJmhIiiQb
	nBjZlcSov2dwpeYnNxF/EpUQyQ6cC5TS/5YPjq+zag/GBeZj1Uwr07Fm2RtRMhQc+oO9C
X-Gm-Gg: Acq92OGdazNNSGOAo9bptw9bZc0Ss+VvwVnGwSMOa3Hhz69uigllOGrMjJyV8cqZr2M
	rwMz3g7cJhJ/wz/sWD/5Z+AdiCXJRCS1Afk+sUpEo3RG+XO9OvL4uFm6/CVmNVSLT8QAYapuQS1
	HQ0pXikIesmbtw+VDU/djCSEflM12jc43nArZu1MYmrcjK+FjbholxcGDtMQZkTH/t1LgXVXrEV
	ffFZx+oxxLkmi3AxrKQFno3ONerIiYZyUcCbcDwqssJRE6C9VNjRs3b6ffEnZZeA5+r5iR8jMJh
	fu0PRO6xsD4UnzBXwaLfAhevQrlXK4GJ6nieBjWNxXXH3URVlioOqURONX8/97hxTsjT/Pn3lPv
	omHz3AT5QSd9UpA+JHZUh6LtBcmP3YTL46vWtvBPwYDsWNilt6e7IppEW39DnwPRayVdaoioVLA
	HBTJ00PBE8X0JUR73JSqBOjk3RFrdtBhKnzEL23KrnSolOMQ==
X-Received: by 2002:a05:6102:8097:b0:605:ead:8f38 with SMTP id ada2fe7eead31-6ff005a01f4mr6071353137.29.1780862150181;
        Sun, 07 Jun 2026 12:55:50 -0700 (PDT)
X-Received: by 2002:a05:6102:8097:b0:605:ead:8f38 with SMTP id ada2fe7eead31-6ff005a01f4mr6071347137.29.1780862149660;
        Sun, 07 Jun 2026 12:55:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcbcsm3302031e87.20.2026.06.07.12.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 12:55:48 -0700 (PDT)
Date: Sun, 7 Jun 2026 22:55:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] spmi: pmic-arb: initialize "ret" to 0 in
 spmi_pmic_arb_register_buses()
Message-ID: <qbslmau5c7ywqtzjufi5mdyelam43sy6tawdxziayckzy4jxj6@vcvrb3obdw32>
References: <20260605-spmi-bus-register-fix-v2-1-b3964b093fe9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-spmi-bus-register-fix-v2-1-b3964b093fe9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE5OSBTYWx0ZWRfX+WzMRowYfvNm
 6NJ4t7zbG4c7ZoOrVKnuLPxevA1rEnoKr1dhu8FU8UKL7GvaS+SwzhsbygiVd1P3LEZeytw5SKF
 e6M1Og4IVGzxCfL+VM5OgFdP+9dynPku8Kef88aK8NumNTocKklsVVxo1I+5ry6RzbXxg8WwD8X
 FWje9dZDOKK30wfhgkTWkTCmBGfsgxXa1HFlBYLqzwlsgfjHakUczBlv3XSr7q6MXsnJrRWFS0H
 WqA4ZTteoZX/qExVPN/tp2GZR+XzjmtFWwNsRjio821/1WL/qYrPPsp7uNnYCKQECq+ZPCT6AUi
 FQWV5BqWWAlKhTh5b9RkzAG4j+HjTzDve8kGW3LhOQG+wDfbqLOo0XZu3jY3dbbw8TkYwyueS+K
 JQ4qve7z+0welQ4y/0smO/sk1tfc3cNwyesLBBLiIA9ma8eeGQh5RgBrhjfu5+NrbZ5DFnryN+a
 vkPm7aMYq3lb7WSoxgA==
X-Proofpoint-ORIG-GUID: sM9YL6RjxJWldtrt0yY1__luVMSGQNhQ
X-Proofpoint-GUID: sM9YL6RjxJWldtrt0yY1__luVMSGQNhQ
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a25ccc7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=f_heSQ-JXa6-mbBFG9UA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070199
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111588-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sboyd@kernel.org,m:neil.armstrong@linaro.org,m:abelvesa@kernel.org,m:gregkh@linuxfoundation.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C0D26516CB

On Fri, Jun 05, 2026 at 01:05:48AM -0700, Fenglin Wu wrote:
> The "ret" could be returned with an uninitialized value. Fix it.
> 
> Fixes: 979987371739 ("spmi: pmic-arb: Add multi bus support")
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop "of_node_put(child)" fix as it has been fixed by updated to use "for_each_available_child_of_node_scoped"
> - Link to v1: https://patch.msgid.link/20260604-spmi-bus-register-fix-v1-1-136adda83a92@oss.qualcomm.com
> ---
>  drivers/spmi/spmi-pmic-arb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 2e2cb4774103..6203bfc2207f 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -2046,7 +2046,7 @@ static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *node = dev->of_node;
> -	int ret;
> +	int ret = 0;

Just replace 'return ret' with 'return 0' at the end of the function.

>  
>  	/* legacy mode doesn't provide child node for the bus */
>  	if (of_device_is_compatible(node, "qcom,spmi-pmic-arb"))
> 
> ---
> base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
> change-id: 20260604-spmi-bus-register-fix-dfdb94bf834e
> 
> Best regards,
> --  
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

