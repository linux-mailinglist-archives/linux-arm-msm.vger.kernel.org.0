Return-Path: <linux-arm-msm+bounces-108320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIt9Bpf4C2o3SgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:43:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88555577858
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA81D302FE9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27518341AC7;
	Tue, 19 May 2026 05:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1m8nCNC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hsl7G608"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03CA33F5BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169387; cv=none; b=qe1GT4BgiKR/UqHndljBTnVlB6oFQE8u5hEL3r37MvLcDaGJ3+PPPvA60C+aLUdBE8eKh9bwyQJaMucioDM5YpSaiTmL1rAWEFqd2npfDFy0k0TspKqmx99XwHIFmq3waD9pPlqM2Cd65kb7uyfu3yWAnFdIJ4MvW8jGlZRHtmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169387; c=relaxed/simple;
	bh=cnOBInV6M8f/0Tk1xyC66S3lfdG9Yp+vY6XxdCdfezs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0Xx3Ng8+DXP+V2o+86iqV9srju6i8aUyqZvYdA0minHWNYmvweY0GMwMaJoKJ1btYDMUFiFRcARqzLjcfYR32N4kJwLTjH7kdX2jdnXKn1UNi4Os+I9U5BtcLgXRffHuj7azPSx23gjYnY9rM6NgcCfV4OlTQFUmPtK/Asy7D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1m8nCNC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hsl7G608; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4hoUG1250890
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mXheU10lCVfR6g+wnLwXV5CB
	zolgwdhwg1YHF1HLEVU=; b=X1m8nCNCV5YYgRmFUzpYksFEGSsuGTdVR+4ZrWrN
	FWH32/n/R1Hga7kT2hS9eF5OGIrexDQ/tSP82uZqS+9+tPyn34nbb3gD5zPZkbug
	edIhFHgY7xf4vWxqUy0npMLqtlHFgCll1g0IeNycpjyMIYjBcbFdNtmwN5z3lqge
	vqEcyx5BXVLq58EHeyhZcGKPpxdNY1H5at37fJLh5Bh+iov9lB+AULGscFaGpXRt
	Fa8MvLmyRMCftMM4v9lZxRXgccjmdYMNK3V0tFobJ6UWthZokDzVbug3HmhobVI/
	kt4AqkHa0zJxzVXk9UZF7o4huFsxQ+iGiFgcRZQsVkdX1w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0khu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:43:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12dece274b1so4485618c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169385; x=1779774185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mXheU10lCVfR6g+wnLwXV5CBzolgwdhwg1YHF1HLEVU=;
        b=Hsl7G608k/L+u/JVsD4q1me7aUYRpTQ4fyfdUgD2bdVQNdr2BYxzer94ZFbGjYZKcs
         wWXt7W4dfwbA6eXgNzeYwMtrkB1DfrEEjApGRwfHbPqNOlXl5kohpkemtufL1tsPBBOH
         XDJlPTz0H6sxu4U2bERJzWH5Uuizn56azURV+2TeYWd2e3cHZNnnwTEmxzCV0tLU7cmT
         28fF0XiGKNzGvtzpuG9C6c1VxQxFX0E8h9MrrFShPYeZcHDnpYQCJg7/zOGEbRku0P5E
         q21lO/otT3BtrynowCCtV5ojsb4pzLrhqxvykn/hr+gsct+a3IsqIGDktwGt2a1Cphxu
         9pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169385; x=1779774185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXheU10lCVfR6g+wnLwXV5CBzolgwdhwg1YHF1HLEVU=;
        b=lPSz2bUR0Lmg7i5/0OcXOxiCN/VJ3oTPZaFZuG4vAssxueYWsZistUXO9QMmDETxbZ
         mfYbNqiFAVLHHbre3aWORLERnsO/Xq//VjOv9sU0q/KECOWrkwcVrbQTwXl16UN1GUTa
         8VFzeQ9ZrvwedwgpaWJ7cnd8+AVkeeUeI9j35ENfIoYMRV3/OeHgE9P4X/EHqf6kHT0b
         uDtdxwzSCIPZ2visR+/mlcuDI+Y9qFZKQDyVD/rW4RspMyzZow24292tlJ6xZNvbGOfH
         fbn+wyLGPjnsvt2jJIqF2uSek3yqKF3VTBwVV/ELQkAUNXB/L6cVqwEQA7ySwq/GFCdC
         3bsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LsjP0JZby9eshCLER/qd1zRrgFQb3/XKp9V1QEmpEVMpmi8NzJ6jcgRHt3coLyD40rlwn/svhhBDzfWvf@vger.kernel.org
X-Gm-Message-State: AOJu0YxL6rb/K3FRR0sNkrXkrLFSGJDy/hqzrP80JaUz/i8xgNogKmxv
	tvyTkqy26yfCfOr7AiS5Iw7wnDBKYJ/q/yQbMutajqfbC7Jwrav1BepMTih/vGxCAHPBTAgAnIZ
	ODSHEgeZkE5MhGHlrDy/BFLMNzRofkfx7laNiEcl0YSmqrFdw/I47T9HQtAw3sk+PZxpy
X-Gm-Gg: Acq92OHeSCbsNJ5pJSpcGNZAocGYEDPljqlEvxE8rKMcNa9OmDpnvD5tT2ZQu4e9Sfv
	3UddgbN6QgJX9J6xTBPilpCPL8ZmILijDoRCTv/V5a2p7L1r9k+o9N+rQoomJviA/yajKhrogNq
	qD7ruk+mdk8wZx4c+yQszKVZTRquxaiNoUUOtMtuKIt3V8Pl5V+YUKdx2ym1+LODIoTD2YjRw47
	TrDYICPGrY5LONDfaepZ5I//0qaPQvaPjfGWLnSheHcsRFVAWY7iYk2BRFahtJWDaCd1EdVqcBg
	dR2hrJOVaZdhz69lgGqgy38eaAaSigyJf9fOx0PRjCuyNJC5krfgYKehLkPYJSkWVJuo7JhKjQ4
	Lf4lA6eW8uYI4/l4w43xreON2KB9PgUlsiJCLBv2u7ho3U4smh/k5YMhOvdTLZaOO
X-Received: by 2002:a05:7022:40c:b0:12d:bab2:f213 with SMTP id a92af1059eb24-13504738731mr6938608c88.21.1779169384543;
        Mon, 18 May 2026 22:43:04 -0700 (PDT)
X-Received: by 2002:a05:7022:40c:b0:12d:bab2:f213 with SMTP id a92af1059eb24-13504738731mr6938599c88.21.1779169383975;
        Mon, 18 May 2026 22:43:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351d9sm23676597c88.9.2026.05.18.22.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:43:03 -0700 (PDT)
Date: Tue, 19 May 2026 13:42:58 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add PMIC PMAU0102
Message-ID: <agv4Yh7dRWdHrKVC@QCOM-aGQu4IUr3Y>
References: <20260419131523.1232835-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419131523.1232835-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX7X4NjeFECrzb
 jwM5hd+2l9mA6a7ULjJe1YDOcpaHN5Kj8eXF7l5RKDXdFoGyvIvwco2ZnoqbADhWNDQwK1Fto7E
 0nyCtHT1QOFznWIgqXCJo9MzgA8UhcQNHcsrj3nU4T0x46VjM4cDlxMhJd32GdsZIA1788ZF5r7
 UxxZ0peeYFHVOpks5dYab+5yP2itw3v65SiH4GY+eTSv6oECwRRjrABExFCYevHL/zDvuRmrkdY
 9kqI/2KIIW3Zd4rCVjveIv9sUx5l4G3qMcinkkOV+qMxwVimEgWWEpdTFiFbShdXkJZIxiYYdse
 Q3rIyBw/KX7ik24EohuDEUqUzRdOe1ytg9vvs/8WDW1c4dTv6ttt7F+FmnamDdD0ysg+3fowuPk
 2MhHIkZzo8XPovqaQbBIoKmm6krv+Yv3lxfLA63Iz/WvbW27IJDat423q6s4AOA6KlBkuU83+48
 A5fy/r0cpt2VcqexVbw==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0bf869 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FE0JCe1nNlBvAKogSaIA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: ULQFMG2VUVVv6LwgCaOdZoHQ2KtzkTxV
X-Proofpoint-ORIG-GUID: ULQFMG2VUVVv6LwgCaOdZoHQ2KtzkTxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108320-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88555577858
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 19, 2026 at 09:15:23PM +0800, Shawn Guo wrote:
> Add PMAU0102 found on Nord boards to pmic_models array.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Bjorn,

FYI. I'm including this change into Nord DTS series.

Shawn

