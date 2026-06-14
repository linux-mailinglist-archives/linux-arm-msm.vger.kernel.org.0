Return-Path: <linux-arm-msm+bounces-113051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J/EUKcMaL2ql7wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:18:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9ED682470
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 23:18:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XRoyeQE2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WZLBdipS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113051-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113051-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D5263007E27
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 21:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D8730FF31;
	Sun, 14 Jun 2026 21:18:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4DB1FC7FB
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:18:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781471937; cv=none; b=PVhUuPpYrdHEBrmx3aeeGMoB7bn3M9Y/Iz2bThMbVAST5fhpRFIf3nQhv3o/cia+DtL6SshLXzsX252YyQci1W+cs+PgxgCB+OrNyDrdxu98KvL9sUIUuHUX2TV48fFHeuqBGfeqXUSD56plQm1ENk/zULKquH250lWgntOkLBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781471937; c=relaxed/simple;
	bh=0miKinNiBWvUoPN9BaGwPuXb4iIJkY74GJPYKVpbCws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0R4AZyx+7zIEix2BAsChD4wSNBG/mZm+qaNXeaFYMSY1WU8i1uHbRbO8EN6XmFyg0pl/SICTjLPge7LEfL1E5uX8VmJ5Gi9Rj9MNy6Je8/gE6grI8Hp2yTJd7GoNyWTxtrUhmIiXEAxFFQ+417RM3u8RqdXzSOqnHKYNzoxSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRoyeQE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZLBdipS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELFG8e2546051
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MCsu8KfWh71txzBAaRtP4I1n
	CwGiB4nR9paTIiDThd8=; b=XRoyeQE2h9Aa67gjKufT3yr6h4UUkS6q72vh2qR+
	6rRKrW+I0AY9RMoyFHoQBsg8q8qvyj2zBat1G5YjkcBB5z92a1x3nc3Y7aTUFO6N
	MGduQ0zNpy3hQrHiiOqNGLcOEfM8SIWPNKOaD9HY7kOlEKe4geeRxbNRj2x5KqMN
	A2aTklMiucdvUrBHkKwvKf62Oku+ntATzTeFhqgGuAeW4QbBL/fggHkKfv4w1l4m
	qsMXKHSp+yqyJvdqOaIfoT/k3J0RH/LY7pNn18eUqj1nPe5a1q+2l+yDJLblXJt0
	NBt4ld+90jJ02kui4DKnS8gmPJqU39HyWFCjcloJ9uZ09Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6cgy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 21:18:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157d38ab37so263698585a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 14:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781471934; x=1782076734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCsu8KfWh71txzBAaRtP4I1nCwGiB4nR9paTIiDThd8=;
        b=WZLBdipS9bu+r5x8cVeeOmbpSsfNBoDDBVkUr/gGHi6TF7dqBe8h+mkead2Xn9vWv7
         yMA5x0oX38M/dzUgIG0LJXGeVtEViJ4h0p0optc+D/vEYZqFEw2vpS5tHVpcieFvN5Hq
         PFcBRKAXLnE3RTdunRca1pAYcSSwMYRF1K7TJ6HF0TWbNU6yywhioTH0zE8AYaAyjYbR
         6DHEadGrioBr8aM2Xcgnkwl6H0LZpgel6nM6fo/+EPIvIg28ABh1t/ZeonzAUHSYfdF9
         nZm0xLHw6fkb8IFtXFICFMcWghi44L7cHaCrobcpHPcLyMInpIspnTOzMsdNvsIYoqUg
         +bMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781471934; x=1782076734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCsu8KfWh71txzBAaRtP4I1nCwGiB4nR9paTIiDThd8=;
        b=Olb71lDtbpkLyCWq63ke9M8Fuo0MXqshvU0qlD+df1yNmw3Afz9gFC3KU6Q4Z77bs9
         iuS7/KgObKL2y6C2PQbq+WxYYX7YsVbi/lLWVD6AQAOhdBto/OdQearSL4odHV8LJDk8
         YslGHqsrqAtXsbzedeZ/TdYPhBa4Ema9S8qwG9TFwIhCXZPHJjk1aX47/vMvzDE7mqWs
         DSX1ZJtL8tp7LEO3DGjrasx3hUX4VYPtXv4xiwEffIQYkZ/0CLw5LOwMn7CDEr5KWJPi
         rG4Q0UjinXX6NRS4UtRHMSvLKBxpLiK0zQ+MVhnKtipOOcd0rHFrIkSlP30f9cSeOcEH
         9GPA==
X-Forwarded-Encrypted: i=1; AFNElJ89FpyR66/8/mgFylnCOsIa7apdTyNOvJCctC+zzyJf5vubXEPJTsBTiuqd/0cNVd0EVO6+A10USVEd9Sfq@vger.kernel.org
X-Gm-Message-State: AOJu0YygwKGL256SmtLBWocqFRjU2W1jG0AAJXMC9+7Kv8M+Xa4drgaL
	3NNyuwfwL/5xspga2tj87GF9t7kNFyp5rnUam9gkaHxrfJCeXuzAgktTbTpFR4n93K/+QygF69Z
	M12lHtYkATgyNr5Ya1H0JX+dMd4uAkFXId2LUC9OWq3P4UyS80hBZLCTm0llmr/9ZthnC
X-Gm-Gg: Acq92OGjwpggmkz8XxnKEbB5blU37IO1MHqFKMlAX+ZZQqTuOQksXpKlXpeapzu2Aqe
	1ujK/e4bybPc2Bmsc8pr6Ps9gnV+n70Ey6ZdAnBhm+Lj0ExEOGxbmqvpy3sonp56J3fM6NE/0ll
	YLPD++HCBpsi9t87gD1cq2vWpEJ10ktwzcfLs3klW3T8TjNIWywlLnpFXM3NbS07s6qWs2wawDn
	nrJtMv7tZK8T6i4TeC1yoU3uYY32ZcEg9Ew5CmZeeQXdBZHLF+SPUZ5oIH6+1k60nQ75vncYz+u
	sV7xhSbmw3B3Q6u7pZqWOi2R7wm2BYX/dYuSsl1YVAIcGLpuLp4XGQWVVpDrJbLQW8lXO72VlaX
	vybYP7PxHi/t0M+LLjJaA9FeO1p0FPuwFbFgfbuICrq/7KQOvoHMLtIv23ovHUShy4TB0li/PB5
	3SVq/4D0glCOuw811jXJsll02+xi9vJbod5Bs=
X-Received: by 2002:a05:620a:6f0a:b0:914:bb8e:915c with SMTP id af79cd13be357-9161bc576e1mr1799152385a.22.1781471934102;
        Sun, 14 Jun 2026 14:18:54 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0a:b0:914:bb8e:915c with SMTP id af79cd13be357-9161bc576e1mr1799148885a.22.1781471933635;
        Sun, 14 Jun 2026 14:18:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1aea92sm2187663e87.63.2026.06.14.14.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:18:51 -0700 (PDT)
Date: Mon, 15 Jun 2026 00:18:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
Message-ID: <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614083424.464132-2-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyNiBTYWx0ZWRfX3GFrQQC8pZcu
 3ZOW9I/a8EFQFqeWccGZtMYnmb7flJaiz1Y8eW6vvBcitSBjYkJpVcs3PQDnDv5GXf+DzE4IT9T
 /1lb1HNQFeo7Kn50ieLuJ8zWPKACeV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyNiBTYWx0ZWRfX4OphXNGzI/Vr
 L2pv0XldMPTfD8Rh9P1lTqUcqYCtH3A+qld8voLKtpSf4d6MaANurAhPSfQPCMtBAXR1zXauKH6
 RxbKsClDWbrnjBoj3aI0SWPVc6n9152dti1vhYeqiE/W8BYpBdzS5uWw/v1LMynZnvnN5o+ATvu
 o+v5IjHmvcieCtaPELp+mzP4hQGQwPg/84nT8BKSLM4zjS4qUxUVeBdUMLUvjxaAcJHyU1S4R52
 ZDNE4Fw71xXO0UdvuoN0l2XwPq3LbvfsTHaoXpR9+DJOddwe50X768o5K5Xi1jcGKYoF75Rt2Ei
 jvTKjfB9iy/w5J7NxuIzGGve/NyqMcZaqpzYSA3fsZD71/B0ZyaZzqa+FksCtH481NZa4oS3AiW
 wuzweMDc5Mq5G37+4gRqqkMCpmyNk9cgYAbiPGIer34s6UKRgSilQszpknDEzd1B5DNkbleNFlR
 0yKYu247+PKCLbVv0dg==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2f1abe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=cGGWfqFj7ohIeHota6cA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: y64LbZKoyoh4lvQgBvYub54ZCfNqV6iK
X-Proofpoint-ORIG-GUID: y64LbZKoyoh4lvQgBvYub54ZCfNqV6iK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140226
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113051-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE9ED682470

On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> Some devices (such as gaokun3) do not disable FIFO mode, causing the
> driver to fallback to FIFO mode by default. However, these platforms
> also support GSI mode, which is highly preferred for certain
> peripherals like SPI touchscreens to improve performance.
> 
> Introduce the "qcom,force-gsi-mode" device property to hint and force
> the controller into GSI mode during initialization.

Ideally, this should be decided by the SPI controller based on the
requirements. Another option would be to prefer GSI for all transfers if
it is available, ignoring the FIFO even if it is not disabled.

> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

-- 
With best wishes
Dmitry

