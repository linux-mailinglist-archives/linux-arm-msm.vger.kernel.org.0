Return-Path: <linux-arm-msm+bounces-108191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LIDDPcAC2oH/QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:07:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C682D56C411
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDDD0301BEEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2839B3F9A19;
	Mon, 18 May 2026 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrZoMgek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X7zrgimi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7A93F6609
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105881; cv=none; b=PpxhkrT0/+ehIfTEbdMaNCMEoE5WNSiIsn3zYVT7HvPZBf0M8sje+txivQYi/Hnhu90buDxSSJQIj+Xd0SIBcZJGMMl1VlsdGMFmwaSocUP04eNurmQ3gEpNBul4RgTalL32N+hOHyl801d+/mAYKqdtYGqqQLzlXLB4SNn6qE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105881; c=relaxed/simple;
	bh=4OQcLQXCWrBfLkb+LzcpyGtTv6JtzYhLoEkqGB/nYnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mf4DHFfR4lT+sZQI7TBZiQqrkZgYZk16zZKRCmtXLqNAtMjtCwsvwZMqsbc07A3myiHR/kQGBR3SXSbbhgkqMkmT5RF7QGVa9g0rUl/y8HQKsZuwI9XtArffNH8y3U0EcR0QMB3A/i1KcAxnqCuiKAFr/vmc+S79riUoSOVeTwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrZoMgek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X7zrgimi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I6s4Oc4172509
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RHtxg/E3v9Gqvx9cN4dY7ENu
	Y5kw8ynAHB6Lqh/VAds=; b=WrZoMgek3WUBGedZBnuVRgNfIpfxNJTS5eBAXZZF
	5AvlJiuhQMZbkD96jgH1vyWhEjZry60/TEa1iuFC6v6RW7CjNU1WGG5UlDm4+Cl7
	jkuHnxHxFq2KaIk3u0LPs2adZNxUYdfHOMtT7ZcKW/1ibiAD5ZLwawlE4b2dQlB7
	8Rczr612xDH++KHHWau7GUT2vpPmdgTmGCrkVBLzcQtVbnSEYNvC04Y9chzEWF9D
	KJTtWAXotFArmNc3wkyfFc+WoG/J99HDFqwtU5bY9RUUWYfh8ZgprjWWe0R4PQXF
	F/EboIeYo3d6z34erwmXTtQ3CpKrLSRmwN9FVzlwbBgEzg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g6br3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:04:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-577c69d3f04so1654444e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779105878; x=1779710678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RHtxg/E3v9Gqvx9cN4dY7ENuY5kw8ynAHB6Lqh/VAds=;
        b=X7zrgimiEePgbRfelGCTUC+psuV8lS+OtG5Ofc5+rRWQwITX2V0ZJE5jvJV43KOyE3
         siMQf4UJZ6DIzRsKiZK5yTaSMxiYTPB2T/tfXYaZ56Fg+mBU//GBoe5MDJ2dQzWRGrF/
         4q88AxprEKAicmC/K8AQwQLX8oGoxSPJAklozMJj9OMjYbHxULCip+FZJSEYgpDYUZ7i
         gO4sKw1LcP0SxUWBmn3Dv06YmWw/bprejWZPO+QQUoFNat0rUjwZkf4RYn0b3wxyBQYr
         ZL7xG4eMerEyqIUuo50csXAv7PdWfOE7NiJXdpkKclI1cL36Wty88hCrHHGA2SlyVP2d
         t1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779105878; x=1779710678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHtxg/E3v9Gqvx9cN4dY7ENuY5kw8ynAHB6Lqh/VAds=;
        b=h7Q6qTsLrrXpvro7dpIxB00v/EezvfZDbTwr75px6tRLX1AhPUzRzIQ3uIKIfWQ0VZ
         jXBuh+Riisyayh3qxjhSA4JC9coNrJzSLpOTgMPF3vqKiALYfTPmPeELtFISIAwoBaSX
         6DTx81N0dU9Hpr5BYWRzMRLVQo7HOF7I/k06TQsyvwR3WwI93pvgYdjzvh2FFM8X0axi
         5SB7mqjeJHNd/4H6fpw471W5lBlMqA6R1tyC8ckDzluF1UxlxuLiTT1KI7WOM6zI4Pie
         hdgoCjWV5RWbYxYT6tLEmHAwpHPeW0eobWUFkYo+wZ30LOrfILeJsaizzyRu1JxMVDPo
         mo4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9uLg9AEVg01qz9wI4mQ8g/0FeQx60GOFGmjnz1F4XrOEbTv6aktdYRxs3X0nsp0yZ43kQKfpBAbguiXBRM@vger.kernel.org
X-Gm-Message-State: AOJu0YzKyHPBEz/bO/hy0JEMC65wXfiAyNS2qwNUXWrM+PIuy3h5EmJ2
	YD6YduktczdAUsDmopaXfvHon5lGQg7rfPAUKGjWvaC2Yv/+SClg/7iiOjA/XZhITfMnLcnMYqI
	WxYta6+tZUpFstijOA3RpFB4N6zASQCePtWwGMP6gQuCOvOfqNsVw7sJX2MCU3UjRIAzA
X-Gm-Gg: Acq92OFowbicsu7nMHQJn73NsrCiWcwM6KfNNSjlCgvwZgRWpemhWa66SCS0euqYeAX
	AUYRW13Uh66r7iZ2vyoEdj1SrdGLifuhgQZFXu2qJusM8oxK/Q8rvv+TXI6Q+/64pmAFAxB8Zxm
	SjVlGjSgOZNLNqi0T6oN+g7d6gQxS+Txb67WGQSvP5ZUxGTxcz/6ayLkfeqgPWcXVzEmEafYKdF
	H9unqgctxa7SKppqpuPMIBHP5atXY8HfMpEtBms9uGzdblrf4UA/XOR9DltchAmKQZZGookDxVZ
	r+cZ144GYhHNTQXb8/UReENkuEaEhdmjkNH3CJJlAxwo5qIke29p0jz8w8Bp9XIhjSL7vPTnRBu
	xC140ZhRcQZ+L4Hr/BAIDAlCNy/Cp+zwCKwggzNqAknPC7YCfEmnpDm5BYD3A66LpDlaIHHorSk
	4Ij4jxkq9+AtOZ6C+N+JZdeyffWHlKYFZV4Rw=
X-Received: by 2002:a05:6122:3287:b0:56f:22ad:f5c9 with SMTP id 71dfb90a1353d-5760be34515mr8478655e0c.2.1779105878215;
        Mon, 18 May 2026 05:04:38 -0700 (PDT)
X-Received: by 2002:a05:6122:3287:b0:56f:22ad:f5c9 with SMTP id 71dfb90a1353d-5760be34515mr8478609e0c.2.1779105877801;
        Mon, 18 May 2026 05:04:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a755sm3264575e87.34.2026.05.18.05.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:04:36 -0700 (PDT)
Date: Mon, 18 May 2026 15:04:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: stop enforcing INTERCONNECT_CLK dependency
 for everybody
Message-ID: <x7v2wra6pbtxpt6t4dty4fpo5of7clt7ul2ptw6c2rpeojwbvz@xselcvmgyrsu>
References: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
 <cbf66c6f-9418-41bc-9d0b-f1af0fe89485@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbf66c6f-9418-41bc-9d0b-f1af0fe89485@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExNyBTYWx0ZWRfX6SzUHxiotbXC
 f6Ig3vfEgTkRgTVbkopP0HPRozDlNQqLFqbixN2QMOcvEshkw7LJjpBgRhiZ5UKbf/IE88Xc97W
 bpKgg51QcDf618jXyubCGYmzHKF2KHe8Tzi0XhbHN6wnHX4b++OzyNpf4W73yX2hiX1uw6hyery
 X38MDEzpQgx1tccxDwlP2hYrqkM2jDsklzYpPHREZvYDBErpE0Rhnq7Ar5mUy4KAev4vE9fkqtj
 cLIhDXvSiO7kpiET4HQfa2bVoiVn0bXaOSs1yNDjRSAyThIyZtD1FV9VicQ6MvTpVKcoPPmKM8v
 6XlaalDL9zZ6GcRA0RWrD91vVOoXzcqIvq1kCayOnoKU89+UnB0p5K+JB5mWRo1pujdJx57VQGE
 JEaS2Hir9f/iyX/ylzps7+0cNGh+R2X00/YE8Ug7EbNOLDy5+1kwhozz1lYL2tCSAImiKngP4xT
 6PVRQP2EB2o1y+1hPDA==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0b0057 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Emq6NeHw9dlhMvRVmBsA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: FtqCgWGWvQzqYWHfwd-rFNLCadie2JnD
X-Proofpoint-ORIG-GUID: FtqCgWGWvQzqYWHfwd-rFNLCadie2JnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180117
X-Rspamd-Queue-Id: C682D56C411
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108191-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 11:22:06AM +0200, Konrad Dybcio wrote:
> On 5/17/26 8:51 PM, Dmitry Baryshkov wrote:
> > Only several (typically IPQ) platforms use INTERCONNECT_CLK to turn
> > clocks into the interconnect providers. Stop inferring this dependency
> > on everybody and set it only when required. As a safety measure, make
> > sure that the coresponding clock description fields are not available if
> > corresponding Kconfig option isn't enabled.
> 
> I think this should be a 'depends on' instead, if you like having
> PCIe/USB

I'm not sure I follow. The INTERCONNECT_CLK will be selected for the
platforms which use it to control NoCs.

-- 
With best wishes
Dmitry

