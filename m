Return-Path: <linux-arm-msm+bounces-97691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NDVMFYntWkSxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:16:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4628C4EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F1DBB3004D8E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 09:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0788814EC73;
	Sat, 14 Mar 2026 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CztVR16/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1rz8nT7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC33F54739
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773479761; cv=none; b=YfpYQGAJSImJ1uPLE1E5hTWcPx2P+PpJJobISdHSLqIx7abFnhqBHdWWxB8jLZc0re3CdRHhk7d9Ice8Z9tGahJCJ6ypDbV7wPriS9Gg3iCX7nH5+0WsovZ4A2iPrUYQRAdOSbtTMQxcc8brSJpR6suKAvBz/XC+6Y+B9+SFSLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773479761; c=relaxed/simple;
	bh=Lh1fxyu9xjTwEUaBx5aoyAW5d2QFd6AwMJVE1zTvNZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWG2EEZ+G1lp312v8rPEImg0/C2InL3zQel9Lwq0pvaT99z10DXWgb0FYdb2d1zvXiyY3jwneAd4ChqGxBIL2yFwO6insmC3yC7B97+qWVLM1e+ZKVPDnyMy/7nOE2vb82CdJKyxvDN+0qk6rlMMbP8hEQY70Kbr0KeqlV+D0bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CztVR16/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1rz8nT7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E3o0qS2908015
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZBG3oXb8KyJCWnPiyApKmVG9
	hVM2OlLptjpbh085dQ8=; b=CztVR16/SZRRYfoNoW8X1XW1MQHPIvJyiZXXum6S
	D+C8RNMQT6US1NbCU2utbPGFnzxzxaeeGRQhvbucFJnpNXoBBii/UcOTG1InvTnl
	eexd4CH/bcZXiKdbFpJBdpUWHyAEFw7bMfYmq62ox/Q42Y5169n2z/t+b31oIA5O
	JHxEaoDDsMCaKYOvx5e41KESxZ8c/W/nezK9OVwsWeoumjUsEcmTYhXb9mzhGH7T
	uzZpcrvYQZumjH+obLm/T7yQq3rrlw+fGQg1gg8d5InA7qx+Zcldnp5CyZQF27mt
	hrN73L0CDF9+qC/atrYmyN1bteNDo8lLXIcW4CPoAA1UHg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043gfh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 09:16:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509070bda13so227420191cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 02:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773479759; x=1774084559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBG3oXb8KyJCWnPiyApKmVG9hVM2OlLptjpbh085dQ8=;
        b=D1rz8nT72htElLWasIBbdeggmQG57e+N0flY29+Xgc/SV5/yU/ALv26cZAvSuX6my9
         uElJRZ9vqSGAk/e1wh0xbouIOggOZTJthVxSA7spLKrXsJ8qb3uSu6M/d6+uUAxhgtQx
         cBJy5STDkXx6/dZSwCFzfSMhc0eCO3dsUZUla7IrKUikJFBVMn7lTyKPj+CsHWQmhW8M
         w+3wKXcXmJldM+OjhZO4WpNdzKVMnjc/5WfML/WLGcuJWDMc4g7j1fZFSuy4ADql1a8L
         R9ROtL26jYCEFTbh9sEa3/BX1CtMuQ773yBgTgNUjkSJOHQWEI245qH1IARNeaC13d1M
         hkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773479759; x=1774084559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBG3oXb8KyJCWnPiyApKmVG9hVM2OlLptjpbh085dQ8=;
        b=heKoCDp2Yjnhvl8xmhVLihjZkqE4O7pxR1g/aPgphjdlwFJjkGtJfD1GzWLRNb9cQ9
         19/qXvZiIoZtBFWcesuQsx1U8SUXxHNFHO9MbbhPCyCiap79G/LK5Z8jWMZQEmvqDfjh
         veIDAnGj83BDW90Vqiz8mZMn5GeEJMHP7xQ3C9J9QLbh+9GRo27UrsOGN1wpzdjlovx9
         zAD2uBAJ2GYCyGi/IgoSk0zpotbMB4qRy1C/h2yR9FSzyPJWAVUKjLcWPdto0nCaiclZ
         wkNgMl43ELUBlbdxt7gPFnGfGRw7cVFdVXVkWZw+eiTFuVhz1fd4+yKTcEBoHIkCkvPR
         S05w==
X-Forwarded-Encrypted: i=1; AJvYcCUC7vhT9Urk8QSaEz72ZUXvhCoqfvEGafBeTE0MHcXFQmQWs5nHR2oiLDDqyW9nQUz2vDJEpfOUIrq6WWN7@vger.kernel.org
X-Gm-Message-State: AOJu0YyT8clYVXvDGKQumms3BcUryqVz3USHZuNRnlBm9SNLO0x4uSwb
	D5lVi3X7TFdJ/f+FwYnW2xfVu8LQUlN2qGIEZnY2Y3NlBqGJ8gDnX7oinWwBA4jMYQpJT8QzooC
	FAXFVZQq2ht7wvzUOIRv+WHBbDu2PJOSiHbARoakMdFVoy+8JhPYuA/xTyFsz5/xerWPz
X-Gm-Gg: ATEYQzzAtGcI2AfpTVmFRFIa3mdNWxnyonhtZc8lx4SlYSyoBeIchS0SFMAvN4aMux1
	9yOsU7uV6IyjiI5KoVMsmzbmVmD/tFsUcIsUHDj5beBHmDu9D2gDdqxFX78bZpG1qpZDMZKQBcd
	QMEa1Al4reOSzBZu7DtMu/O8+Pk57qVK1jT9mKWvqDG9ACDD0FnvcvO5HDAfK094W/r52/Iqfya
	gd3ExLQnbou2T4z7GZvljdl8AntaCJy7417r+8F62TDnI6UlpJy44jUPS2D6ZbxY0JRBAMj5jdT
	zz9rumWLi1fODMexGbkJ7AU0SZ3Xx0s2eAmn/9HBbHxq0qhyFknyBuqi3ofhRR3cADQhNxhoFEc
	ip0KrgtupTjol94X6Ylbv7TXuWfTHT/UwSFW1ld1Hqk2OMnBU7IHMtoZV8yh9Oo17lgC03LGqU4
	KaEg2ngS6FcGoWC7SQRJcp0ZVixxj68qvvmnE=
X-Received: by 2002:ac8:7c4b:0:b0:4ff:b32b:cdf9 with SMTP id d75a77b69052e-509571a98e2mr75357061cf.14.1773479759183;
        Sat, 14 Mar 2026 02:15:59 -0700 (PDT)
X-Received: by 2002:ac8:7c4b:0:b0:4ff:b32b:cdf9 with SMTP id d75a77b69052e-509571a98e2mr75356911cf.14.1773479758726;
        Sat, 14 Mar 2026 02:15:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156358066sm2082333e87.63.2026.03.14.02.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:15:57 -0700 (PDT)
Date: Sat, 14 Mar 2026 11:15:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 6/6] phy: qcom-qmp: Make QSERDES TXRX v2 registers
 explicit
Message-ID: <sk7tou3vwfn2zikl67ugharyf24sxqi6fkx344pz4jwbr3uz6x@qbkhuzwru4b4>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
 <20260314051325.198137-7-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314051325.198137-7-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA3MSBTYWx0ZWRfX6moPx7NRXRBK
 ty9iVT6VMJD+8k3pKFlZUEHxo+wZYNeMqbgFTp08Y0jZWCGPMEzD1PiDF/ZbLSwiCP3Fm39VU9B
 I+pMiFVX1qNtlKOW4R77TmsCQ3sWclp3fS/5tPpLuuL41UXuFYvW+SwiKJS5wr6FiBdRn/7rlMs
 FE1AfMN/AbWbJiiFZT0VSbzPw+g6ujT1kXVOsHzTNdaczNiQ6vjishm4GIQsYlodRvnIZpbimpG
 Dm4Q4dm5YDpOTCfBhkff9EwpfKte/12erOceZNDvm3i18sVOMAWQuHifvCDQQjIFokfBTLDBXes
 sH+NseeHSRJwYvHBuCIY3mQeye2ETZ5MpDwldWSZslEn3HmTrZVCE/jCZHQG7heugL66XgAT2af
 +Oy9e98JxueHgaVHc42az0ttbRnuusI+qjM4qXwN77nKxJv4EoF4ZTPNgQNQ/4KWGYNuO8rlADX
 4YLpk4cIrSeeJ1+qHkg==
X-Proofpoint-GUID: MmMF1FnioMe8y1c03EBT-hPNv7H-UIMd
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b52750 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=DXW28Tf_i80TwAerqmoA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: MmMF1FnioMe8y1c03EBT-hPNv7H-UIMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603140071
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97691-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFB4628C4EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 01:13:25PM +0800, Shawn Guo wrote:
> Rename QSERDES TXRX v2 registers and the header to make version
> explicit.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  |  24 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      |  50 ++---
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h   | 205 ++++++++++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h  | 205 ------------------
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  60 ++---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |  74 +++----
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   3 +-
>  7 files changed, 310 insertions(+), 311 deletions(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

