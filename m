Return-Path: <linux-arm-msm+bounces-106412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HpTKu6Z/Gk6RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:55:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D084E9B02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C648F309526C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24643FAE0C;
	Thu,  7 May 2026 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4zToJUV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTC0g6XV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4013F9F46
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161838; cv=none; b=ZbhoOE+4pg0yb/6gkWHHGLEp1urPS5NGe4ckSN8se35YN8PBmNNOMu7WvInSKQHJhIdT2y85FrwxbWRX8N6Y2aShBAKIAD8pQKnhuM5PyimyQWBjaChDkV2ACYkd9rhzdo9y+E0KpH2gABqLnDb0cDTUCKN3bY1o4IeaxR/KHx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161838; c=relaxed/simple;
	bh=zwntjvmIfrAlVTx71N8rEAJVuLSoabrlsSMRE8ARKgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5I1bA5GLOrW5WgmkU9MLEEZPXyhT5E0Q3/tjVQPAc1S2j82WGgkNFlr0G6do4VLCsXcy3MYY7mLTYLF8A2FDvAwzNhhROWsDnOcfNPBdzmtPBUaWABYT/WQ5DK6nUYFse+cionSE8fDwpSCsHkAgosJCp3BAgwUk3yCY4hEUsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4zToJUV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTC0g6XV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647Ajgfq682765
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WkbTCdJkfzkEnIQAyS7unzhZ
	5gPwvDI1z/fUnG8v53I=; b=L4zToJUV6nfQgkEbx5q73ob+yn1kRD55WsafmcAb
	Fr1j6rENuN4oY2pQBJQfbcDSG75m5xQ7X+Mb1hTmTYKG3hy+3JPbTCooL5Ut0W4A
	7IPLmerRsS4/qJuOWGrmlrngpsW0dmkgmVb6ThszfBDKhZxvohYuA9VUzTcGAL9E
	Ok2Z4+cUuwNfEn7l0kR2vYCzxNboHiSdit9V/Vnmvdu1Gpt5SemWLY1N90NvJU0P
	/3+vABYxu4CvETNLRtU48RufZtonu3EWp5IU/SuwlEFmjqF1G0328EHuW4vfEcfB
	dkiMi+WY3+/skJEupCjcFElnDfZtG6f86ZMvxTc4E0HoPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhastuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:50:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d890580e1so13138781cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778161835; x=1778766635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WkbTCdJkfzkEnIQAyS7unzhZ5gPwvDI1z/fUnG8v53I=;
        b=KTC0g6XVNpi2wda7+qr42KYBBykFkFopSKEzsIJDiKj2+Yol6W9fjqScFCObTgwdNK
         +WD2LtDSW7n88YfDvxiK+7voBt1Q4lcm84lUxXhznZMx+hCFMdFtXNF2jz0jY5OCQjQK
         rTLmOaHWavw21GNRgEI8zRHh4hK8cA2jKjH2VNrt9EMctqW/8yFVy63UAa6KgXojhamO
         qjHklO74gTcqZY/Sp6dDdTPR/9a+PgKrwXFyhZbKuZAcI88bNeTKkWjjG3gmofK4yKxs
         53V1kEWKL4XqQEnbTDE8eqv/Qk+/H7Xt5YPCt9ehCmpqQuBeGRXMdspWCUnv5m37eboi
         f3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161835; x=1778766635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkbTCdJkfzkEnIQAyS7unzhZ5gPwvDI1z/fUnG8v53I=;
        b=oZdQMHIiQVkw7Nh+OsVK8+Lmz+L020VIeCgpD2mYHLCehf+VSVkHOJvAWDCpzICMm8
         BAjEZvFjppzLIL86x876o46LmwMos+rOqMUJUXTuZ+27cJlZycwYvLf546MxsC0hLgE0
         WgXtguNnX9HNLSIVmg+nIyVB16u9Bf04h3OwzP2lYjsbv6xUP3ACS21IRbWfV6e+WPWv
         j6SitGVI729EBh5ZfIR09x5MD34upJEEeKm9wc8E1vonncqk/GQbCffc51bKp5PxknVz
         Wp/R/6spahJCWzMhnO8Vm1TQu0jdy39gI3I+/FHaETWKhrezqjaRS7kLYJ3GBZUwVT8b
         D/mg==
X-Forwarded-Encrypted: i=1; AFNElJ8+uOEOMptu8z0mFxP63mnMFUSeElC8g39NL2AYNZNgEOT2ULTRUPbtkBF/p4SQ1UQN6fBGCex2Tkgg77tu@vger.kernel.org
X-Gm-Message-State: AOJu0YzHi0iMnzt8tVctvsmIKjYAVunx+wS8Ugtcgax/zxsUYQ3N+8iy
	jtcpCmEZ1P6Vr0bLaTTyUb+4oMaOn1U0OdI/a6CRv/ZqUKd5Zo9pvT+DtKNCNsNrMGPHFy2H5f8
	Hj7QFxLcHDZeu6bRhCb0cOJk5fClgCH6JSITGJpnAFYWGinDM1GqzGZ0Khy9ZFedwxT/F
X-Gm-Gg: AeBDiesJHxqKSn++DiDNvcVEy2i4pX6br3DCCFVEFck94PeQkuNZfDatUidibe90XOk
	vkHnFYzKxsWcR6hjnui6OxZ6k1BZQ14/xrGcqY+qGscX9j3c5i5hFIPX/e5Iahrl01OKrXKceyk
	sAS/dyUJApGlv/k2e8LJc80YKg0dcefqYAhuusOjq3FwpgjOLnBDCy/TYegkM72kLGbEGoVHnl9
	zKkNsXG9aUZDvCAqnXu1FMIja9o4MKEMRo81VI5bc2MdHX0v3aK31qBdBw7aCEbfB8ZXoUCmVpd
	gjpsAayxqpi/eWTebpyvwGEEWU5tp06hTMXMbLg3JEYi/HFm3bG2Tn4mIZQ01C+5YkzuQfr6TKg
	r8IYagshgzPOBy+6OblGuHpsGSA3lNbWKupSB5Lvo9mARJsj24hsmm5bsC10Rl+ECsy3xOCVtrk
	PyPLYI/5A8LWKaPVSFYJR4+qJkQQcolc/OR+JR7cZFWq5+QQ==
X-Received: by 2002:a05:622a:558f:b0:50f:c8f9:d5d9 with SMTP id d75a77b69052e-51461fa069fmr111991471cf.39.1778161835488;
        Thu, 07 May 2026 06:50:35 -0700 (PDT)
X-Received: by 2002:a05:622a:558f:b0:50f:c8f9:d5d9 with SMTP id d75a77b69052e-51461fa069fmr111990941cf.39.1778161835036;
        Thu, 07 May 2026 06:50:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3939a58fa47sm38708761fa.37.2026.05.07.06.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:50:33 -0700 (PDT)
Date: Thu, 7 May 2026 16:50:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Add minidump SRAM support
Message-ID: <3m2bwess4zw3hw2qlkwnmhtclk6ofinxekxfqz5otw65hd6d6q@lfcknrfkacy5>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507080727.3227367-4-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzOCBTYWx0ZWRfX9bvB/hTp/YM2
 +C6bHjf3tYyyqKnIzd6WgHpR3TaPwsmDgGuSvVyOzl5RiZFOg+/G3vzBT5QQfWZGNIVWwcxIsLx
 C4CSiJ4fElzAr1MTrpo2O3xwPf1Pw/JN0VeIqMcg99YRHYmj5zomIHfhgKHk/UA7W6RCVIUOKAy
 bpsrmoHh4CeBeS5rsqPFWyazwuSojfNudmia+x0olr5oNjtrEg49MtP2DNnfYgYGHiBnTtdFkpU
 PFqFKDf1RaqVVcODPCnGBuoR458g8waEmAi4EqRzcyj8mAVMgUEYoWHjYlSCkd/A8FIznqCdAQR
 BL7bfyfOiZLjWlx1kXlsyLQvkb/NU38SagRVpIeAvNuXA8mJsX39XR7TfZ5Cn+8KG35VRDIkdWs
 Zwy4so9DoKCS9+EZ5adtOZ8Bc6rSvetnRGPtJlMj2T/XauwFgwbgXnaOO88PfDxVll2WUahQDmz
 jP7TPH2rePIzsklxPtQ==
X-Proofpoint-ORIG-GUID: j7sThb6oKcm3A3cDOKs4F4JAAAI0CLQy
X-Proofpoint-GUID: j7sThb6oKcm3A3cDOKs4F4JAAAI0CLQy
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc98ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=L6Hsa3w0Jl0puDdxViIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070138
X-Rspamd-Queue-Id: 40D084E9B02
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106412-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 01:37:19PM +0530, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
> to deliver it (USB upload to a host, or save to local storage).
> 
> The SRAM region is described by a 'sram'/'sram-names' phandle pair on
> the SCM DT node. If the property is absent the feature is silently
> disabled, keeping existing SoCs unaffected.
> 
> Expose a 'minidump_dest' module parameter (default: usb) so the user can
> select the destination. Only the string names "usb" or "storage" are
> accepted; an invalid value is rejected with -EINVAL. Changing the
> destination while minidump mode is already active updates SRAM immediately.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 95 ++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index f65b132004a5..b57f8cce7a8c 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -57,6 +57,7 @@ struct qcom_scm {
>  	int scm_vote_count;
>  
>  	u64 dload_mode_addr;
> +	void __iomem *minidump_sram;
>  
>  	struct qcom_tzmem_pool *mempool;
>  	unsigned int wq_cnt;
> @@ -141,6 +142,18 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
>  #define QCOM_DLOAD_MINIDUMP	2
>  #define QCOM_DLOAD_BOTHDUMP	3
>  
> +/* Minidump destination values written to always-on SRAM for boot firmware */
> +#define QCOM_MINIDUMP_DEST_USB		0x0
> +#define QCOM_MINIDUMP_DEST_STORAGE	0x2

This makes one wonder, what is 0x01

> +
> +static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
> +
> +static const char * const minidump_dest_name[] = { "usb", "storage" };
> +static const u32 minidump_dest_val[] = {
> +	QCOM_MINIDUMP_DEST_USB,
> +	QCOM_MINIDUMP_DEST_STORAGE,
> +};
> +
>  #define QCOM_SCM_DEFAULT_WAITQ_COUNT 1
>  
>  static const char * const qcom_scm_convention_names[] = {
> @@ -568,6 +581,17 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>  
>  	if (ret)
>  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
> +
> +	/*
> +	 * Mirror the destination into the always-on SRAM so boot firmware
> +	 * can read it before DDR is initialised on the next warm reset.
> +	 * Only written when minidump is active; skip if SRAM already holds
> +	 * the requested destination to avoid unnecessary writes.

And writes are bad, because?

> +	 */
> +	if (__scm->minidump_sram && (dload_mode & QCOM_DLOAD_MINIDUMP)) {
> +		if (readl_relaxed(__scm->minidump_sram) != minidump_dest)
> +			writel_relaxed(minidump_dest, __scm->minidump_sram);
> +	}
>  }
>  
>  /**
> @@ -2055,6 +2079,37 @@ int qcom_scm_gpu_init_regs(u32 gpu_req)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
>  
> +static int qcom_scm_map_minidump_sram(struct device *dev, void __iomem **out)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct device_node *sram_np;
> +	struct resource res;
> +	int ret;
> +
> +	if (of_property_match_string(np, "sram-names", "minidump") < 0)
> +		return 0;

Do you actually need sram-names? Just to verify that it has one string?

> +
> +	sram_np = of_parse_phandle(np, "sram", 0);
> +	if (!sram_np)
> +		return -EINVAL;
> +
> +	ret = of_address_to_resource(sram_np, 0, &res);
> +	of_node_put(sram_np);
> +	if (ret)
> +		return ret;
> +
> +	if (resource_size(&res) < sizeof(u32)) {
> +		dev_err(dev, "minidump SRAM region too small\n");
> +		return -EINVAL;
> +	}
> +
> +	*out = devm_ioremap(dev, res.start, resource_size(&res));
> +	if (!*out)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>  static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
>  {
>  	struct device_node *tcsr;
> @@ -2748,6 +2803,41 @@ static const struct kernel_param_ops download_mode_param_ops = {
>  module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
>  MODULE_PARM_DESC(download_mode, "download mode: off/0/N for no dump mode, full/on/1/Y for full dump mode, mini for minidump mode and full,mini for both full and minidump mode together are acceptable values");
>  
> +static int get_minidump_dest(char *buffer, const struct kernel_param *kp)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(minidump_dest_val); i++)
> +		if (minidump_dest == minidump_dest_val[i])
> +			return sysfs_emit(buffer, "%s\n", minidump_dest_name[i]);
> +
> +	return sysfs_emit(buffer, "unknown\n");
> +}
> +
> +static int set_minidump_dest(const char *val, const struct kernel_param *kp)
> +{
> +	int i;
> +
> +	i = sysfs_match_string(minidump_dest_name, val);
> +	if (i < 0)
> +		return -EINVAL;
> +
> +	minidump_dest = minidump_dest_val[i];
> +	if (__scm && __scm->minidump_sram && (download_mode & QCOM_DLOAD_MINIDUMP) &&
> +	    readl_relaxed(__scm->minidump_sram) != minidump_dest)
> +		writel_relaxed(minidump_dest, __scm->minidump_sram);
> +
> +	return 0;
> +}
> +
> +static const struct kernel_param_ops minidump_dest_param_ops = {
> +	.get = get_minidump_dest,
> +	.set = set_minidump_dest,
> +};
> +
> +module_param_cb(minidump_dest, &minidump_dest_param_ops, NULL, 0644);
> +MODULE_PARM_DESC(minidump_dest, "Minidump SRAM destination: usb (default) or storage");
> +
>  static int qcom_scm_probe(struct platform_device *pdev)
>  {
>  	struct qcom_tzmem_pool_config pool_config;
> @@ -2765,6 +2855,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "Failed to find download mode address\n");
>  
> +	ret = qcom_scm_map_minidump_sram(&pdev->dev, &scm->minidump_sram);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to map minidump SRAM\n");
> +
>  	mutex_init(&scm->scm_bw_lock);
>  
>  	scm->path = devm_of_icc_get(&pdev->dev, NULL);
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

