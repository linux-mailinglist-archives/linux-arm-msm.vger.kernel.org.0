Return-Path: <linux-arm-msm+bounces-93919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Iy4FHVSnWk2OgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:25:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD85D18300F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 766413019CAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0138C364059;
	Tue, 24 Feb 2026 07:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pr0aYSNt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWQULz/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315D33644AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771917845; cv=none; b=dVfiDWptFt28Y/EXekhfdSwiXg/Z/gtXTdh26Oaktp1r/qmFF0P8+D5ycKHoaXmBBN0/ZZHq+g6jSjQWPlNjDICPlbhM38gMiRiQdRRolUHZ9Pq3/UN2BUexoUr0yzVuIBwAS1ayHH4/vnZY5iZQUuU7k9DXgwB8unnryqMlcHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771917845; c=relaxed/simple;
	bh=ohm1uRK/xetlIfPWOIT6+giEaGDrcnsUw7oeD42sQJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C2wgnt6xP1fT3imF5LzxHR2KQPlcvy/6BErCixac5tbgekNMdQUv8yIPGeoaqEaANPjOJS6rCyweNC79KEH/koqaE1/QBy0MPoP836mnerwUhHkRqqlmylBdWrTiomBDaq3nozmlsvyKHLcD/dju1+wIWk5uYDy+ZZzmM5UXT5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pr0aYSNt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWQULz/q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4NukD1464863
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	75bYi11fyYiC46XW/yzaxaazSdDaY5pv28Q4r6DamKE=; b=pr0aYSNtF9VAdAMB
	ZIV+HgNAIbPvGd4tYTlks3ov7Xfys3dUfhFf7dps84i4jTtKkl9N3YOuXDqzieaG
	+AFMa4McAXPCNielYf/uvau9TQr2sW8jRfadXHMuyS71LR5NDU1Npq96a2iRelPU
	D/3/pFnGGs+TTbnuzVP8mNGrkXZVddO/ie15mRAO8lJd4kUjZUssu/uWm5mKDPEC
	cqdUWPPgY35rn39uHcLHAbJSnCIR/lMoi/iTpDTVIpCdKcxL1MLYlcxD79pEA/Kx
	O//5vDPWA2msoJ1HRRMWb86TfZ7s7lobo/tayKhoTvlAZsNAb7aTY+EwEsyjCa6Q
	zGTTRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e38h10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:24:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a129cd2so6124159385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771917842; x=1772522642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75bYi11fyYiC46XW/yzaxaazSdDaY5pv28Q4r6DamKE=;
        b=jWQULz/qGH1QccvlJNp3hieG/BctIJreR1wT9jDPSGIoyBgImi/bb8gs4/xSN01pXc
         j8yAIZJoSWD+y076OQWfQBMtJQJfPOsJwWYHkjYrjHjYf0SyXfCl4pSUdEmOZgS0wxi9
         6gZS0i6aOUSPdbSZT6BEbHRHcpu6L4Ugs6eV7slPn+ziMTfWWJnBXuupu8r9jh3oetmD
         dL771danV/1YWRWDvR/azw94Gde+rU4lj+Cdfa8FU8HE9STzQIlr4Srsgh6Vcb+VAZGo
         jpnQV/h8PfewadbSFlz6ZOtNbD/XJgrG2o10U51YkO+4Ggh1Fo161myGFWMk5xu+59Y9
         AB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771917842; x=1772522642;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75bYi11fyYiC46XW/yzaxaazSdDaY5pv28Q4r6DamKE=;
        b=A0rV+0k3bChjrTBF5ZiBDnPD70lCUPCGkvFqbSQC7yygH6r24AaYsqehBiy8NhWx5B
         W3fXOUPxLWNzr4mXUyTsFnEXEyL2+P/cRNY1mq6pfCyw3Xv4oUzGtwjZbsLTYOez50jt
         aiL6/DCSl4LSsV/4Sa6Kkt3/SeheT0CuWmaLZva6uGC2g9URrNgGhDZXmvqJnwRmXAKW
         Dk0Mv0dSAO9Rn0etMUK0zuxUck0mgCMdIPCNXATh2cy5IluOgJ/dXKssuX36X0Gqa+VZ
         UEs7625DL8vH4l2TkzwNLMd2/UsuJT30HQQvO9uOVAcqD+xKiTZeZ6gLUsFH15rUmaAw
         edrQ==
X-Gm-Message-State: AOJu0YzcrumkMukcE8yhuIm+fNSgzSTnSd0Mp90uid4fDcHa4udwEA7f
	TnO34WOMStXZK3p4RxG+Qcxtwadw8BeTdB9WbHSr4lFCU0b9yIj/eRl6BUTiigeShzJX4iJIShz
	TQYrjogY5yak8OK4uZuStJLqe+jjVzWcbrCx6fsBLstTB0lU1hxYj94BgWOrp/CiHIBLI
X-Gm-Gg: AZuq6aK8gQnxvAnd2jTR0fFZVwDr5BzalYcUsOslCVHP5Xe7ChMDoWNBOGcHPXJNXG9
	wVp8BYjsrxVCbU57l2NktoemXk4ybXycwNMph8hsDsD3CbttwsbywEGIwdqcI1GctfJzExYJ7nb
	PdkKkfyUiLE/JRzQiVyjxMJMwuch9un1NHZYx6wLBi+u1ENkopG/5ci+flbXYjgWIR9NfrhriBB
	aUHds1OwwQc5y/0aYV86btcz6EAdYO5Dqm+4qMNbq7ePyWoPkI1+Wbl4n3TUVkLmO+fp9ksy0I0
	Gih1YAhWD1VsqIiAio7m4omKbSl9f96qR9uoQVmLun3Hq4ATMJqIxudit8HFgQ7zvjKEteu2FlB
	pqOa/UdjP/K7rp8Qw/MCRTBJvkE6wi9s+pjytUXSR1S/y7tiMrCnmAYz+eRqsPvD3ieg/SmRY/F
	vpg6gj1LI3scLj+VcO0SeZLmsyU6z+MFtaGsY=
X-Received: by 2002:a05:620a:3949:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cb7be5dc53mr1837545285a.10.1771917842098;
        Mon, 23 Feb 2026 23:24:02 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cb7be5dc53mr1837542685a.10.1771917841521;
        Mon, 23 Feb 2026 23:24:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a770ecb7sm21372311fa.0.2026.02.23.23.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:24:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260214105145.105308-1-mitltlatltl@gmail.com>
References: <20260214105145.105308-1-mitltlatltl@gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming
 dsi registers
Message-Id: <177191784049.440843.1605828631777709323.b4-ty@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 09:24:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699d5213 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=-6-yqrtIc-1OGEPD6ssA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Bat98dCy0-KSJQR--Vbs6whtl9aqGpK_
X-Proofpoint-ORIG-GUID: Bat98dCy0-KSJQR--Vbs6whtl9aqGpK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2MiBTYWx0ZWRfX8JLMP4LYeD9C
 sGlgoTV3afIgrTo33TxBquMi8MJDYSKvxGB+KtQtw/SaVegPasExrhfYcjn0zDCAKbLJCdd/l7R
 FJZ4YgSM+9uGMC+YROB3Bm0mmo49Xy1QA0zjBXdT3Kixy4x01E4y6trr+ZpCl4n1L8mIdMRsiTt
 0nCXdYunBMyZyVMmxE44gU8yFn+LiW6ddpnA42tcmno4vN/h8pka4vlq3HD+PpJzPA2PaPGV4N6
 Tgg+ZvYcRihp13GbblUn0r5ZXBzgVNWR+sT0wgjHXvvDPArPybjo4O7Tf9WlwhlLXEQcc+I14bz
 pzPpx3aL3eigM3vFchnyTVVct9MM9eDqO+l7o+UrNpc4SCS8S0XF8ee+Ek1KWNYxRJkgQnpoaq0
 cTgWdWIEWfWWqcUaSi9eMj5pyNyVmnYCb5NEmAY+tZSixkiFpA2M53FSnBuCncvLxsAobcLpI0A
 SQVCLnwDjbyfwvZQBiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93919-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD85D18300F
X-Rspamd-Action: no action

On Sat, 14 Feb 2026 18:51:28 +0800, Pengyu Luo wrote:
> Recently, the hdisplay calculation is working for 3:1 compressed ratio
> only. If we have a video panel with DSC BPP = 8, and BPC = 10, we still
> use the default bits_per_pclk = 24, then we get the wrong hdisplay. We
> can draw the conclusion by cross-comparing the calculation with the
> calculation in dsi_adjust_pclk_for_compression().
> 
> Since CMD mode does not use this, we can remove
> !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dsi: fix hdisplay calculation when programming dsi registers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ac47870fd795

Best regards,
-- 
With best wishes
Dmitry




