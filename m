Return-Path: <linux-arm-msm+bounces-110279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHXZEaedGWq7xwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:07:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EFE603462
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42F8530BB5E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28E93E2AD6;
	Fri, 29 May 2026 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n49KsI/q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djQThdPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B4331E846
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063335; cv=none; b=eAuZUgVBPl3v0APfjeGLbcL0R5jn4mEjEG+AHXLoPE9lzG4TbLgtwkdho1wZJiM+ysZScvZz00oBWMJHChoEcX8cnopwKG7D0YACKxdy4XaBKJtnU48gMaGwD3VrNOmbfF6xNBLrxZ7nL7kMa5rK8wdoDEcrEuYbMPdECuqV0ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063335; c=relaxed/simple;
	bh=rVRK5jWbTZVvXEMLSmFo8QQ9aUW0G8dSJpscL5lI4IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arT6Xon+fWjHQbZb9QUORd6RnXnkMNFidQOdpanBtDNhXl0cvdOLfEly3WbLT8HrAsx1nsTBf9ZVb9aSLzVrkvKKvuVvwMlbaXvT5dVCLf00ryASHU9URnbaXAx46vDNQ4cpevkWuKtLvnRdC9GQzmqRsr3o/XzPQ8G5q+BoWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n49KsI/q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djQThdPH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDL2L23249651
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8rNbSa5cBAMgvrmaj0Kg14xG
	39pdVOPXbgUHJBktyWY=; b=n49KsI/qt8BZpkNvZ2ZD/2v/qW4ORlNT/urYVIvG
	FXwDaL4ZjfBk+eMKCYY0/rqK0AicsTqdEEEsrSEVrg3eMb1/oXphUWG3541g2UEU
	x52u5xeVg5PJAAoZfoKV88RDdk7S8vOZ9a10WSWW6ZTtyQTuRRd39MPTFfVZwmSH
	dUQWm+09e/V/Cq2bTjKmDuDPPCH+spx5L8EYqDQJL2gqNNhJ5lMtt6G99CEq4SiO
	hQddsF4duRNt+7SOEvgAVbTV8p+Q66tz0Ve6ouaVj2aNPY0SrhO6PK6Lwu+Jt5Gh
	in233agCR8XUWAavcVNJnjbus5qIvL+LTPO6OsJMXBQbwA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015axfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:02:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c5794db0eeso4928137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780063331; x=1780668131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rNbSa5cBAMgvrmaj0Kg14xG39pdVOPXbgUHJBktyWY=;
        b=djQThdPHVKQZlIbVUK36EDUqVV3a5PtWcyoU444wnUIaOlB79LWApeiAjlukueVZdu
         olPNfEkU7cO8G5T713YUeIaAfwLcicfy34nmVNyDIP0LOlCTWUmHkRukNCXowRcnocE5
         q2ZfwIoySZJqbNRCtmTej825OpEfoQgfdngOlEy9ETvw6aQZlKST68H71vxYuYyOVMnC
         d26o/We+K9Wk7/xW9yqu55Viv722Mq/QZKxXtzcuHzJhSAlPzQh9K/VwIBbxFn5FCpt4
         IYrlaGEx14hNwQ1VmpGtRn1TClgOgoFI9RkrBJW0JyRov8vROuf46euXQQB7/hldXn6I
         OfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063331; x=1780668131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rNbSa5cBAMgvrmaj0Kg14xG39pdVOPXbgUHJBktyWY=;
        b=dQ9I4E+LmTBe3gJ+K6TZpxRGxNSgMpiolrU3cYI5FhM6WancjVPFkI4ny/cQuL60Lr
         cnBRBgwFFnVMz7227PggStq0rI1++/aTcYI9Gh/hSWBIbYDXsmO2FWsRXDMFWBWhA2qT
         eskaLwLYJHpMgnWUZ9RKXuvH1gtZIN36nwBbWLRx92jA8sQaUoM2qvQFOXrZD+ySqfiV
         TSbBPYpGnZsof3MBaJ8UM3RMP2hxh/6V3w5qZTz30zdTe+SajKPMrzUgl4DJzVcc0AVc
         h+CiJROAz2kPzOBiQEkQhyvZQiIztnSsPFeVeDVgv+9jioR4o23xgmbvCNSnU3YI4Pm7
         q+Fg==
X-Forwarded-Encrypted: i=1; AFNElJ8B2+hhBz2Vs/oq4JcYkuQKK496zwTKXy9w0/lYmqQqgp3MAGg+QWtC2PiFIir4F5AqUzqPFfvIU6vlvhPa@vger.kernel.org
X-Gm-Message-State: AOJu0YwmrkLuHZg/FsJWJvTW3ep/u1/zzLEZ+m+AVDESY1hmFz6Uy/Sq
	Ri01Wk1mXI1vmH/aJX8ztwYD5X3C1XBLgr/r+6CBNsYgZOQzzI0tXKvYhFdVYmRZgBzM3l2Sw48
	VOOj1Iqh3+P2YnN9zRrjd+Pj/0ZCInU00VjiShf15AdJhr/2URCdF09JA1CNITfRUSMK3L0yBw4
	BvnzY6vQ==
X-Gm-Gg: Acq92OHSvT4ZNPi8l1+5v6YYh2eJ3iThFfv/zzVHPkh83xzVh9fRdUkMBdUBPVzmvwL
	m4m4wlouwnlQGOZtpan0+Uw9B6z0E39nGV31FNi4u1mVTefUgCfjaHnC8mqsTM4gLs4M+wfCwpR
	frHU3Zo9JjF94pJUg0hSROalHxpdADWzEUvBSPLOmYQajyvxtyqfmn8DT/6KeFCBUdLbY17RIUV
	1zDMWIRN3CETc65FuAva+uZ8JcDqkRmkn93EJod2EJkjzORUGcceovdXuuU0z5se3qx8oUxtMEr
	2H0XY/YeRDtK/OcKnu9zxLc6AIwqXpXr/JG8yMrgSK0rpsJZWb8wCNO+uKJ/ZomO58bW2NsnoyR
	RNmu72DOP6MJbtxOoPJdlcAa2dOEB+tOkbY3aPkZJGrno69fnvhILcGC9rMevE8ywy+kZsmd+9r
	/Rck876PITJE1dLbmqv5GECgSfktfKK+6HHcBtjAvH7kUfIA==
X-Received: by 2002:a05:6102:688f:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-6bf39268d3fmr1217354137.20.1780063329077;
        Fri, 29 May 2026 07:02:09 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:639:1e8b:ecd9 with SMTP id ada2fe7eead31-6bf39268d3fmr1217198137.20.1780063327649;
        Fri, 29 May 2026 07:02:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39659c90b95sm2289911fa.11.2026.05.29.07.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:02:06 -0700 (PDT)
Date: Fri, 29 May 2026 17:02:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: Replace open coded eoi call with
 irq_chip_eoi_parent()
Message-ID: <h5q6nlkxw2hpfpo2p5mt6umgju3kvhygeiyhngm37tabysifuo@srkdeexp2pj4>
References: <20260529-pinctrl_msm_irq_eoi-v2-1-7edd050a46f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529-pinctrl_msm_irq_eoi-v2-1-7edd050a46f6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: HjnfW3Jrg8X2o00vdal6kVwX61Dhb8Gg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0MCBTYWx0ZWRfX26YMIW18jyj6
 X47i2jNrieFwsrf2zG7woCJkrCC8NIjuogjF8Qnssf5TgEhyHpkStKkrEjc+656vEIZeTn6nwUs
 RS6jLkjs1WxYAX2imZxp8n5lx+nz2yJzfC9t143MCFm2BzLRwWRS5H5aq+g+8dxOmWwvJPiQvdM
 K0/3WhY/nkMV1cubJA3Ru4fect0+aaPUAEmSiuHUlUn8NuHcc9OzHJ6VxD0gqDwvMNAKnZs1U2Q
 TKBN38+1Kf3BvW9mlLJLFxCbQPcU3HjxtocI0nk4ChfuSteY8eONtX5r3pF+jIVKn6yEbeNo+Ty
 uO+JMCa0gji6z6zor4eiFaddLebuy0ukUOcfAMCPXlSKWSGL/mi8KLELzjQNcfHjVA/lhxAJsof
 UDPoNV9qhVFxK2m/+g1o68OQ/0wgRRqlBaQ+jO3A+yaZUczP1bHHTnCW5IvLwV8zEcGOGePbqnU
 Ma2Wl/M9I7OrbeY2nbw==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a199c63 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=jYLZWZKYfa6piK-RdpwA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: HjnfW3Jrg8X2o00vdal6kVwX61Dhb8Gg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290140
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110279-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1EFE603462
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 01:39:11PM +0530, Maulik Shah wrote:
> Before commit 14dbe186b9d4 ("pinctrl: msmgpio: Make the irqchip immutable")
> msm gpio irqchip conditionally initialized pctrl->irq_chip.irq_eoi to
> irq_chip_eoi_parent() only for the GPIO irqs having a wakeup capable irq.
> 
> In order to make gpio irqchip immutable pctrl->irq_chip.irq_eoi is
> initialized to msm_gpio_irq_eoi() which now gets invoked for both wake up
> and non-wakeup capable GPIO IRQs.
> 
> Replace open coded eoi call to parent irqchip with irq_chip_eoi_parent().
> 
> Since the irq_chip_*_parent() APIs internally do not check the valid parent
> data is present to ensure irq_chip_eoi_parent() is only invoked for wakeup
> capable GPIOs validate d->parent_data within msm_gpio_irq_eoi().
> 
> For non wakeup capable GPIOs d->parent_data will be NULL since parent
> irqchip diconnects hierarchy using irq_domain_disconnect_hierarchy() and
> later irq framework trims hierarchy using irq_domain_trim_hierarchy() which
> makes d->parent_data as NULL.
> 
> No functional impact.
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update commit log with the reasoning
> - With the reasoning added keep reviewed by tag from Bjorn
> - Link to v1: https://patch.msgid.link/20260514-pinctrl_msm_irq_eoi-v1-1-2d152f8695f8@oss.qualcomm.com
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

