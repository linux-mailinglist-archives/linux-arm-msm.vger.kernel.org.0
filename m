Return-Path: <linux-arm-msm+bounces-103742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO+EIHkO5mkGrAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:31:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D68DE429EFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B46A304C94F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F866386552;
	Mon, 20 Apr 2026 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpR26zgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESGhnY+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7AA2D5925
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776684661; cv=none; b=Fg4p5QvqJmxPqLNqlS8c5/AazDpaRbV7Eqj27vdaV2CWeK1Xv+TC0o3bquS5qHYhuCgeP6wLHC0in8Dohpx2jrtRPudodImrojHNlaC65WHwI2WMQUhTLLYPBoTE/mz7oSCrPU3KUcOZV+gERcw+nLE8SGO9tXBazOtoAEKi1Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776684661; c=relaxed/simple;
	bh=Mtcv4O+SsioZzYTwCA8bJTfBJVkqokYIJCvhBtq48UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kC2IJuqnpHCb1NJ/6AssEXo9DruNjf5iCtu1AOPzKEV/RB06SqQfz1avQRwSy8AMrctCUkYHFTToXbhb8U4qe1QvaERX9OleUYFTxkrRZqQBQphUVlqv9rFuJOmiwyzTU8mh8IheHfXbAkdv1dXc4iSYWqRytxTMdDziUqOFYI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpR26zgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESGhnY+w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K91S0N2281695
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 11:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rJK3tyKKPOULevLlFyeKOFJs
	OKc285YnQNkfp8+aIFA=; b=DpR26zgwXBk7a2/d90F0Gx0wPwYlrBXd+AfxtVTx
	a61u/PudqIxo9PdozPWh8q2BUrmBgVZH6QD00xB1l80ia/JkU0DEFeMJVZbxTo+i
	GrB9cNcD2pU5QjKM461MDDosHl72ZrW4HtJYLQ3s0o3E4SiBxdQF6LicxNydxjao
	OLHQPT405ls2U3BgPhpg/dJ8fLWmV0QEb4hNnqVDf2xgRXyxJOxIlf8sv4QWrxkZ
	VdEWL8fTkZ3/o5Eb/LwKG36y+qYP2zOCDJapmBkFKRPMU+IQPLyABQPIAa1TJVcy
	UZBrMSmjsSfCTjjqKjgWoQaSqK/8pGcEASTx9V7Ch8mLzw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh598gss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 11:30:57 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f6e1969c8so4834872e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 04:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776684657; x=1777289457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJK3tyKKPOULevLlFyeKOFJsOKc285YnQNkfp8+aIFA=;
        b=ESGhnY+wNj/j8HMCzQbv+5eKTlHp62B86ifkEQw3FkjgXB1U8ssXxa5DO7gnm/ThmW
         p6dk9PvpBX5uPR+jrb/LF6hoT8Kw0BuaWlEsf8lQv/NT1jmBNbZGJctRf2H7MTXeN46s
         w+9y+UDJwRveBC3Lx777ZkPIvSXq0FWwuwqSSWXe9d5ldLpz+IHrHzrGaVuHDhae6UFm
         bFu72nY+FKedn30TNjspOad+OxzhqAyPhVT/a8FWgnXLS9n5ae/4wmGoAWg8tl7/htSG
         /t7azODd0NY9NXDxYQEuLD2d/TcMR/gUyUEh4lmy5SayPYS3womPbv9kHgVcUsA5zyaK
         t35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776684657; x=1777289457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJK3tyKKPOULevLlFyeKOFJsOKc285YnQNkfp8+aIFA=;
        b=TK2XGsJz5i+oTeuQT1yI+yE60nDcX3vU85z+M5scIJB0spnVzDzzkwa7jJjneaM5uE
         6HuECO9aissr4gRdKmJlAXZwBcH6qk6JWRmU1apfE/sLPg6HuYzDEc/89zq8TMSepFoR
         3LMKcMYmQca/4Dp6iHDbHNWBUQdMRXb6xmqu4mslbshOuo/M8C1Z/GQ+PA7uiHnLBk3N
         z9QXLohzYbPB1rnW62VLbpq1Si0Y/7GVWrIYFBTpbfjC/o48cTbIOu21PSbSzw6oO0uC
         VZh03gzBXXHi4Gg28YqlOlIeMcwJgp2ZlQ8GQRnuGCLaHBbnGPJ7NANCbWGYwebIGD4r
         Krjw==
X-Forwarded-Encrypted: i=1; AFNElJ+wiIUA99kcVIxQC3oy9v7AO3lptjBfxnIk8mbYx3oNd6bx7MbyjBmW/oG4Xv4hkz7yXKMbI28SE7uHlPTi@vger.kernel.org
X-Gm-Message-State: AOJu0YwJtOgWBrzuZblnSTXJw9XqrGbMNBSSfpqaooI5hWYVzfK7/Kt1
	H8MhGO160eIdWnjZqJlhww9OxRSf96GZRSamG1KPn8nbFFh6qWzCIDlI/dUMJ5tLma6+WHN7OLK
	ZO0Cf9aFV7p+BBziaaOImtGcX0quXx3IAnYIYp+n2saSWfEZdeApxcqPO0r2wx85COwpP
X-Gm-Gg: AeBDies3V8CPEHKPqMmrkFeqUU7Esx1dwNzE2pO0c4No/dhmHP9nncMS1sqrWlRm1Z5
	cMoeNmRfUdPRXRteas8LhSrx34NQUrpkjHcyPkuBHUcApjjyMkPUFSVwJrgbd8oSNdrs9ZKfRKj
	Jb6R1/9lm4cNC/3vBT9lKgc444Ps5az4h9+pmfdlpNndyoyBTVeCna0ajADimpp5oL7a+IrHsxF
	HPAGMtN6jHJzE7nMSsdD1sSqBOsew59X6qMT820+ElkvP9+zoToyJxYeDZ5s4eICWtjolfAVnEm
	byvv6aUXztF3C1Om4vyBvy1tqo7/CNIvtZU0w2dh/qvGN7dubE6RIjprKLaNbkUEwotuSX0eQqO
	fJhtCxwlOzlZGhHIXb61VUyEPrHoeaNFOeGE7cg5U66smLww=
X-Received: by 2002:a05:6123:2e3:b0:56c:fe16:f54b with SMTP id 71dfb90a1353d-56fa59b2e39mr6265131e0c.11.1776684656906;
        Mon, 20 Apr 2026 04:30:56 -0700 (PDT)
X-Received: by 2002:a05:6123:2e3:b0:56c:fe16:f54b with SMTP id 71dfb90a1353d-56fa59b2e39mr6265076e0c.11.1776684656236;
        Mon, 20 Apr 2026 04:30:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc100162sm302652885e9.5.2026.04.20.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 04:30:55 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:30:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        mani@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-ufs: Fix kaanapali PHY PLL lock failure
 after SM8650 G4 fix
Message-ID: <iekd5fokqecsqzjtqtp7ai4ibyvs7vcuesxczndts7uvbdxt5g@g35hk4gwkypm>
References: <20260415104851.2763238-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415104851.2763238-1-nitin.rawat@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eVmkIxPXyQn73MDwPgKyf4xmfC_y3dKT
X-Proofpoint-GUID: eVmkIxPXyQn73MDwPgKyf4xmfC_y3dKT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDExMSBTYWx0ZWRfX43R2F8MTT96G
 xtPrvuNjc894hqb9V/VTPJr4ckpunWZ4xDw/NAiEOo/k2brE3eCHkGAzVDbMP00qIHmQzAOhfPG
 SLs8ZwEqNF2GG4hEkuAZDgPHMFKvWj5CtiC7f8dF1vXtyfKZE84VJ45hCEMw0LTAEDt2Gt38lJw
 pENhQVdpeQyVeBEzlR+Nzayf1t03TFsmHtUJcUjC/lKcXhjI2in1dnf9LaVRUjlVTpZ9fMj1nqC
 aQrYKrGU1+GokWsweLJEdWA9l2yA8K+W30OQ4Xa9tBW0ZYJty5W3HsVNL14+zrjBvsiHS6m5mfr
 dnM7fLJN9w51GuIzWsV37fzZkmybDCGvDie0rQ59Ry0e0dMAJj3QmjKdViFdyUtRA+iL5CGdTyC
 QFwnla2DYRTl91R5cf9mbRITUqJEsLwkQTb4tAiHR8wLaV+xLI2LsDOltA6jE6YwGeEYtwaGBO/
 NeBgurEcoY6T5v1OZmQ==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e60e71 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IGLtpV1Bqx4y0bnjnHsA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200111
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103742-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D68DE429EFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-15 16:18:51, Nitin Rawat wrote:
> Commit 81af9e40e2e4 ("phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4")
> moved QPHY_V6_PCS_UFS_PLL_CNTL register configuration from the shared
> sm8650_ufsphy_g5_pcs table to the SM8650-specific sm8650_ufsphy_pcs base
> table to fix Gear 4 operation on SM8650.
> 
> However, this change inadvertently broke kaanapali and SM8750 SoCs
> which also rely on the shared sm8650_ufsphy_g5_pcs table for Gear 5
> configuration but use their own sm8750_ufsphy_pcs base table. After the
> change, kaanapali PHYs are left without the required PLL_CNTL = 0x33
> setting, causing the PHY PLL to remain at its hardware reset default
> value, preventing PLL lock and resulting in DME_LINKSTARTUP timeouts.
> 
> Fix this by adding the missing QPHY_V6_PCS_UFS_PLL_CNTL = 0x33 entry
> to the sm8750_ufsphy_pcs table, mirroring what the original commit
> already did for sm8650_ufsphy_pcs.
> 
> Cc: stable@vger.kernel.org # v6.19.12
> Fixes: 81af9e40e2e4 ("phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4")
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

