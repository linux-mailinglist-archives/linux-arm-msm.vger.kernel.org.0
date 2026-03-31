Return-Path: <linux-arm-msm+bounces-100966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IleOVaFy2l4IgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:27:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3FD36612A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B4C9302428A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19BC3BE167;
	Tue, 31 Mar 2026 08:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wk85xRbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+zvWklN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA93E3B0AFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945233; cv=none; b=sv3JNOt7PghBWeX1Cgm1Rmzw1Ka+LWgioHoAXS0N2yPCSygxha2O9g94gLP8viEh/xj2Ig25qb020ER7LBhhlXKof7tJh3TylQ85/Fk8DxA3aCQ1FyBEzByXMh2o3j6m69uNHuSWmYoTBaKBQHm3kcTpUBhcRqvqXq8062K8xxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945233; c=relaxed/simple;
	bh=pIn7DVo83rKFtZQ4lodJgGsSWTKSw7e3XyL9bBLwCOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wz6cEFKmVPyx5QjbdJOHmoz2XA268tnFDB64MCVHY7Ej0TJMkoB3YMli/jilkbdnsEcxvT+V3MOgacaOglIhL4V7FFBPyOA8v55/DRMuepHAjwa//W8Ve7mv2g9ra/CGTn3re44yUPvwoRDe/9ZCSrABuePkiXvCg7Hl6x5Bz3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wk85xRbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+zvWklN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V3lTBw843041
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BG1I/liNZmNcrk2tkigeYR5Je0NJszVTJPmGzNZ557U=; b=Wk85xRbJ/ntis3Z+
	Dhhc9zf1ImvmsxEsvaPG1qqvEceuza5QEtVsZTpleMgA2EIbh/4qzqYUTWNDyMpB
	5RuuZe1ObVti7NPPMc6GMdbK/OZmpv4foFfYmjK5wKfh782JnVHwkkD0yf8TUr1c
	Y8DzGb5XoJM5x3ejmCUy8HTdwPZNuYYai5La0njIEUZYhczQRXtMnOxgG1qDjkqu
	RLBc4A6afMz2T2Yp0paWi489yCWGs35hf61Tf4KLCWMBXl06wE0Mvjy7oW7OAAoU
	DTXikLj7F05QnSdgmQX9vtcSqY1vztUnUUpzQr3k3seTfOyHCGietHg4TermHOSp
	k8xnmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86nt918f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:20:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c1107da15so4493891a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774945231; x=1775550031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BG1I/liNZmNcrk2tkigeYR5Je0NJszVTJPmGzNZ557U=;
        b=Q+zvWklNYPcunN46OkLuUblcNtykZyWpPRMS2lzbZqE7DQcpWB2ZIWehsZfrOeIbCF
         kiEOF6nX3vT6+6i++luREMKynilzkLC+PBOUzyVg7bxBKkvWzUxI7v4aJkm/MT8CaARk
         wyr7hWyxFTP7fTKY4zVrw9ZKFIbRif7//cfE0ax1gURaDEjMMO06vYFdK/yQE16w9aP4
         6MpM3selLekny7irmPou4aNnOujzyriqmX/cAFOoDo+w92QTj7iVyYpEz2v4VZf27JSO
         Wc9W0KP3ra51XQzOCUEKpxScXce/xTVx9Hrn/P2btUKBPoPd8HNvavGKHBdkQ4TgaZf4
         UmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945231; x=1775550031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BG1I/liNZmNcrk2tkigeYR5Je0NJszVTJPmGzNZ557U=;
        b=inw3G2Cea5TTPtstuZYynttPpmP8m2IH5l0U8mNogxXTU+Qe+N7H3qXm3gw+iUHvvv
         U9Mq8CyKfAZmVluYNiQ2klqVG68SGOkg1IeRmyNLtRDcxxCyUZBBRa2xm4mLTVpyGDJ6
         OOLSasJS5RMqqLGTVBd725cR0ALqm4Mfwp1FJMLc/cZeDLb+pMASjZP9+Xvtr0KeTStS
         giPLQJ/F+GyV/2GTYbagTYAt61Vwxm86qc4uybEaghP2S7ZOFLFzUPjJKdIYxJbrhoIh
         MqFaGGA6zfl8YEeWtMU/2EAFFTngCAco4+0wZrebo5zXQi6lx1/nliAjGTdsCPctVfmx
         4t3A==
X-Forwarded-Encrypted: i=1; AJvYcCXuYtpr4WUtT6rl1QrVmEpbLVW0PgnR8J9ewFNpC5S4JwwgYq6KDaM7Ai7lUZF/uGhnSq3P20n3QNeJMhNi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8JelUuhSP57yJLdBEelgsXtGkhhv8sViKsW3vSlJj1nyn+W8W
	8ea+h5Ej8OOh6uGr5aGoHKS8Ca6d15Txi4sgqf2rYrKhV4Ty2rzVA39VWb9/FWneqveqOnSAve2
	8natVR1MN+EfzkuCBXZKitGahQtcNm203NungxbbfwohThzJQZbE31hzTlb1Sv08hspgoAir/ni
	8+
X-Gm-Gg: ATEYQzyY2SFcnThqXVxG2kZ1Q8DOP8e+QSqU92Zqlhna3G2MGovOltnFf3WAn7f6D7s
	p7SgXB1kBLYOQWhwSoCw9MuiOPm3++Yn3Q8k0Y1nT0AYde3uzaxIiL8mRADSIBa/b6UPaGagQyw
	ughP3/M0XWRJvCwL21YFCqJURTHFUEBXLvn1rrJ+yH3xMXuiNz1AXInNZCfeM/2cIZBHvt/ouWH
	G9UVTpjBMy/VKIgr1J1yNgVbgLy60bfDnKSHIRc16ltvzR/momwWPs2Ikvucd4x6Ml+6f5UYHMS
	UrFxdF5cL1rDVKgWfu31u+TQJHQFxXRm2teWG8xALU/MoWIOc9RT6dyuAkD+jhLoZoc26gqx20N
	a4SpqlnkHjT8RRyQAUrYvwYXquIbuhJLgbFMCziVjUnySaUfgSQHE2A==
X-Received: by 2002:a17:90b:5288:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-35da5572476mr7580358a91.14.1774945231122;
        Tue, 31 Mar 2026 01:20:31 -0700 (PDT)
X-Received: by 2002:a17:90b:5288:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-35da5572476mr7580341a91.14.1774945230674;
        Tue, 31 Mar 2026 01:20:30 -0700 (PDT)
Received: from [10.204.101.77] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe959886sm852242a91.14.2026.03.31.01.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:20:30 -0700 (PDT)
Message-ID: <1f2e1608-100d-4a3e-99cf-6a7a6d39fbef@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:50:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: iris: Switch to hardware mode after
 firmware boot
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
 <20260331-kodiak-gen2-support-v3-1-958296fab838@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260331-kodiak-gen2-support-v3-1-958296fab838@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tHBi1ayZjKMwGwqlJuQqjySg5mhvH4bd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3OSBTYWx0ZWRfXwTVvCXZ01FbE
 Ur3vrr6hcJbYvsJ2Il53QAFNWgbiGtSL1GsrtxdkWLHLKb6UeHI3mK5ObBlx1yBKNmGF/wsNTxH
 f3BsPhyZcV7VzM7hZtY6bqSqLMP/QP6yrzpbTGK6HDdhqrr9I5pgi7lV7IYk8AdvGi6mQRvrR9I
 Ku0QqriXFsRhUfsWfwuYCI9H8yGm/Gq1uOh0DaiwjXwbKpbJ6zmpNLPSIhyExr5VKLF+r8lJdOD
 /Lu1mpaJw5+Zq5uCByfkU3So0sJY0cqNmKrMmF7JLKzJ7azsdDNggE/Ltdgmr/gafk3Zhg5f/Gz
 YOQrehrmU4DfAmtEQv9Ts3M4fzMEFkoaZZ9N9NYRLPLkA5SfKmUrrl34/Eb5wat9TAxDOzqsyhJ
 W8WTyLpij73mTC6wr3n/K6FMQDxb3ekwYr1eFfDfJaWYsVq2wBkskA99WUjSL+kh84FxEK8DxMz
 Ay5xuJTrkoRXt14ltog==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cb83d0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vonRipBiouzHufA7OUcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: tHBi1ayZjKMwGwqlJuQqjySg5mhvH4bd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100966-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F3FD36612A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 1:09 PM, Dikshita Agarwal wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off,
> keeping in hw mode, thereby the vcodec registers programmed in TrustZone
> (TZ) carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> The efuse tells us which hardware blocks are actually present. If efuse
> status is disabled for a block, the driver will skip powering it on or
> resetting it. otherwise the driver will perform the necessary resets and
> then switch that block into hardware mode. This makes sure we only touch
> hardware that really exists and is enabled on the silicon.
> 
> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
> Co-developed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> ---

It is missing the RB tags

