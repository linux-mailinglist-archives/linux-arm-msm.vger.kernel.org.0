Return-Path: <linux-arm-msm+bounces-103668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH3TMqvH5WlIoAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:28:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C923D42734F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BDE9F3001A47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C256158535;
	Mon, 20 Apr 2026 06:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naYUmxYF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYn7JHCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC2D173
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776666533; cv=none; b=S1YALbf0aLLL6nYXUYODdORy52To8D8J6qlN/k/crCnW+rYov3zfJBfaVjfw6tdwITFsveBFKAmetIFJpelKLs5MIj3QKq2eDNTme6O3YhPx+bnrEExBwvXf+SnFKys1/oGD2HBRHe3cPamUlg0NqqpeGIU8KvufgVJb+MVjjFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776666533; c=relaxed/simple;
	bh=LQml7xcUFqSufxGHC15bAVeuf9too0YBjUHIs2RvX1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpRulfi9KWuXyeJLGJRhpSXgT1Kc4osTXBKR1Nad2V6fRdikthncMH1dMapZFIez1i299QYQTvWRn+8pNTpdfBt/V3AseskH3s0OUCNeh03i8DHLXjbUVJ29zbS1HgaFxkwEgk0K0Cx09xTiEnBdTlCDMZ8XL/1wO7q8ZpWrXgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naYUmxYF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYn7JHCf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JKpRvU162162
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0NFyYCBsMbkdqYxRq9hZiGAx
	1cFe7y4vnQr+EXdSgqY=; b=naYUmxYFQw6zTfF88XlJPkN8DD51jXHGHISVJIvT
	pOGEA06gfNKUu5o5ufs2kOyZ8RfcEYyGtCR/tG4opYM3a3R0rvqSRMsF4TiWds5c
	yJR/qrEQ4fEOYdhZVUCQYhBhzvyhNX1SUPHrnturJtonFVUaLTYlJYCF7J7g4UK3
	3dzkk5rJDrV/mU/KJ1zqdT+dqHIv1rMVAq64G4BXiiFVI6+sMTIoiUlLwiXwRGzh
	NOSOVovgRP/DEppMXSIfJrAJZSHMOtbBWJ1EgJBtUNcYWu5wkSPjiuW2gaMeThJU
	4oSGexxBwIT5IIy8hsp6Qno9ZYCpASkXXybLjZhfDvn7ig==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkynecpx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:28:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c7169f3a9so4079620c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 23:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776666530; x=1777271330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0NFyYCBsMbkdqYxRq9hZiGAx1cFe7y4vnQr+EXdSgqY=;
        b=JYn7JHCfIUp5hZOGhLfHkRmeb50iWFXPczEgA34TSNc5RX3ws7nKb35v2qnQ/Jp+hZ
         DRwRQ3GaRV8UnlWcM8/zhxPLWnOZYub/MDuZZZKJAQHzVS+aYVbzNPoyKE/UtATylHpb
         dqFevRr3v1yGxp3tBCmVNxntMT4hAjXHuOqSeLsSX2rEgg5PkkrTMZYyiiaAo0OniYbt
         3IIPP0bwVR8kPg/nvS7FUqeBjcsjidBBJftWIfdy09fqp2Jt9euerXdCghQb5K+7ICDx
         2zoNi879xhmmBnJ8ZzvQ4eftQq+HTqsBzOR7UqAxQnYp7QfjLMN2ozcZHINYu6Wsw5lU
         +bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666530; x=1777271330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NFyYCBsMbkdqYxRq9hZiGAx1cFe7y4vnQr+EXdSgqY=;
        b=KGsyrCclNQpxq8Q9cnxG5wB4djLgfNK9sByQJrVH+klKk/wTBnAQDu+woP90it9V/n
         nTyopFAyflbzw6L/Ku4BHDngHfbgyBMsk3yu14+Yi448YJ2V8zuq2WZGnkj9ihgpSPYU
         ODCEegg0S3amE3fujvgfdSkTMz8C83b4Iro72g78li2mJAq0Moi22glLmfGnpxEbaBfE
         VtatsNCihzfZZMKGlShwmYKBG4o1EjflWWhh/3pirJgHBXrq536b9Rk7us/ivedwovJj
         4U00xyGVJ2vC1w787UGzzxL0JpREk5n9MIhKKWNkOr0WYDsimUGwXgU4oBSz6uBybXSE
         viiw==
X-Forwarded-Encrypted: i=1; AFNElJ8+0KSek2AQ2go9iylR8gC6Or2ylvkhOVvrpq0fBgx9YjFM0rcmdoJgI0I2vrfM5iUjNc8/+KiTT7XrCzHl@vger.kernel.org
X-Gm-Message-State: AOJu0YyQbeTFfmNkqQdQ6Nt4VorzJuaR85Fy5Ad1P0e9IaHZ4JaQqtbs
	Pi5XkKziMcuyW1gblNvG92NV6VTdJQ40mkX/cyrmi27EPuS4SkKQUV9Lo47OPUiQKSbeZcTs5zt
	CzGsILZJgOG+FpW4/OaZ4lbtPrJxmG1j9GGh/0+alXZl3LwYEj3piC1/+od0oqVTOhZdE
X-Gm-Gg: AeBDietkLydb7QDCNq6HCPRNQURJddcziJNzVms/X6l0H2kZW6FajTYw5fFquWTy6S6
	ayL2uNYQP43IUDDGy40mrOq6FGswhKhdT0cMy1SRHO6NSJvRxFSjOIahQWj9ivg9vgYj97XBEGr
	DNhaovmjBMHG6kEdDfEBw764rWyoroDwjYneW/b6bfFedq4Wj0yUdA6pBRq/fDSjms+VKOc1ACx
	GhPL86TJ1LdapDG9C2DS19i72VUoJbqsHWiPGBlaShZ92M4OiFEGleKKMo2y8ZqPfxyOzN08jnr
	phRQkj+IDR8ceFsTWArEMuz/q9Q2FYCdDeNvXdkHQJtfkx2Fh/SGENgzJ1nb2lb0X8ROVKwsiv3
	fcRTIEnpbCVi8qqF0H52XQEGc2PgdSkOH03nXpaWFGepU4lRenh2wjQqN0PYbA930oaPb/uxL8Q
	g=
X-Received: by 2002:a05:7022:6988:b0:128:bae0:e03c with SMTP id a92af1059eb24-12c73fac23bmr6150760c88.30.1776666530331;
        Sun, 19 Apr 2026 23:28:50 -0700 (PDT)
X-Received: by 2002:a05:7022:6988:b0:128:bae0:e03c with SMTP id a92af1059eb24-12c73fac23bmr6150739c88.30.1776666529664;
        Sun, 19 Apr 2026 23:28:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c837f7feasm9919793c88.0.2026.04.19.23.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:28:49 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:28:43 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm UFS and QMP UFS PHY
 drivers as built-in
Message-ID: <aeXHm9B3u071dBZ1@QCOM-aGQu4IUr3Y>
References: <20260417035509.1021860-1-shengchao.guo@oss.qualcomm.com>
 <898874b3-fb73-4a46-b440-6ea3377c2f2d@kernel.org>
 <aeHxPALfVd7SgtUj@QCOM-aGQu4IUr3Y.na.qualcomm.com>
 <c2d7588a-34c7-42de-b809-0733b03d331f@kernel.org>
 <aeINUiVreq7HFqf-@QCOM-aGQu4IUr3Y>
 <dvwh2fwi6xzskicjtr6e7ldzsgf7fsptep4t6p5qzzf274jorc@zo7hl565tu2y>
 <21664acb-8fbf-4fa9-a674-982c98992df8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21664acb-8fbf-4fa9-a674-982c98992df8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HbokiCE8 c=1 sm=1 tr=0 ts=69e5c7a3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=DEFKgJF9KtPrpQh0uycA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 2s8srqj4_F7omv5ckVkmwOuJ4y0dXQyo
X-Proofpoint-ORIG-GUID: 2s8srqj4_F7omv5ckVkmwOuJ4y0dXQyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OSBTYWx0ZWRfX9NBeZRmavu0r
 pMB58NogZ+qLlcFhwqLOGh+1TmBKmMl9XSjkxCq+XqPNt8dX+VfcJme62RUcLewrpU1uDt5FRCm
 +nzoAPZEVJ5+FGCNWkj56OdADFQzLqJk9qnZeRlJkjk5NS5b/RY+DDDnkXwonX9X+EImgaUhlH6
 a+1Sstg1k3Um7GDh3QCMVbt4jamlw250qZn3FI1DEYhGf9SfOkv3RqYN/Q4SqEKfouZWRv91aMc
 fXV/8vIWrD5WnUITzxtc0wXp6YeEZrCBgHdYtYBMxxjnyndOdFNi8ff8Ryjhuv+Tu+r4H9vJwLR
 Rn9IOuzZAN86boFy8tXOt37RjP7+oeVvRcscSN9bWfrfraOjIvDuB/4zZne/XqkY23WoK4VaXQm
 uJ0mHAZViQt8lG7JUArmDjDgpjlKyHJR74QC7ZUJj8jN6RjqNhHhl0UyB/3ByqtpG5NH4vTpIbU
 LBbrlJZHp8j8qb0UGcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200059
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103668-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C923D42734F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 11:10:28AM +0530, Kuldeep Singh wrote:
> Then it makes sense to make CONFIG_MSM_SDHCI or CONFIG_MSM_SDHCI_MSM(qcom
> specific config) as module too?
> https://elixir.bootlin.com/linux/v7.0/source/arch/arm64/configs/defconfig#L1279
> 
> Not sure why it's enabled as builtin for all vendors.

For whatever reason it's enabled there, let it be.  Do not make more
developers life harder please.

From what I can see, maintainers of other platforms are flexible if
built-in for some options really makes most developers life easier,
but Qualcomm folks seems to have a high standard on this.

Shawn

