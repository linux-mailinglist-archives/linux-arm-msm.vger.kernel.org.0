Return-Path: <linux-arm-msm+bounces-110734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH97MJ6FHmo9kgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:26:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AFB629A98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99D7E30539F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FB6379C5E;
	Tue,  2 Jun 2026 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZ5KSwYM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UoMqVuPw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB92379C43
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384697; cv=none; b=f56QntvC5tAzW7EL/yjICl4W8WLUEiSyaqkH87eEqblfApXxjJSsFx3SfDd1lHersXfE0uVUi+dAr3/UJvVM8pQ18s5UE/o8fNvfmBm7/NUMAsxNdM7DCXj+Mu+/INybB/b/KSKO45b0H5wEwLz+c4N01ScyizfuM6mxqSqlwpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384697; c=relaxed/simple;
	bh=JPVQANRPzIydaU0WcpkAVORq1mGKEPTOEIUcCS0y0vU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ozPDoVzLSjdiL/e8tVL9vOALPwOfVMPMaRxKb+tYBtVLfyliSx8U53CySgo5Nn0XfRoPnmlGrDKHB2d8Eq84L+IdyXAPIT52Wzi+xQcQ1FkluMCEg10mHFgctNEb9RXq7ihRV+7XSswMV+dAzz32Ofh1W7kEC2Iko0KO/6FmErI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZ5KSwYM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UoMqVuPw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65245nB32692286
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GExpfkrACNf
	d8AgKb7pzoxx6CS0kiv0JrtZqZXX3hVQ=; b=ZZ5KSwYMKZBdV2J7rA+BKaZVSuY
	kJFouZjz6jCJZi/iK3YsFL+fbQ+DTKEfBqyDlULM8aLXhwfih66W2eYPiYHm8+Nn
	I9ZXzC6UncyYH3dH4pvWoMjOAZa7ORpPsuj5RnKVxO770UnmGOtgwYogZH6nnIUv
	vyl69sWA+GjmvwmgLrsLootw3pvSvJsgwYdyqSDP7HDNMQVbwkdTIkE1obBs99p9
	o0y+yfRFEf3+EmlswYIA0WYi5G90IeGvD60iNE+nnKgRIR5qlhCoS9lNDbB1RWMH
	TewUoF3xx6+URUz/Tvx/kAE81KU+sRfnFjnfOh67Mmjt0UntQ5ZVrJbwaOg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumgq0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:18:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso1757011a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780384695; x=1780989495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GExpfkrACNfd8AgKb7pzoxx6CS0kiv0JrtZqZXX3hVQ=;
        b=UoMqVuPwE9u/qzrZ0EOWwHRULgDap4fSLoVpxHgjyqV5VoZ9V0Dam2aTPL+7m4cX8+
         OHtDAK3eRcaNYYorJqBYGZfF1bDbmRfXmoq+C0LBGBqRTAkAujMrVqojjJahYtUR8FxI
         RTXesmvyWHYqIPKZ2jTwcUnO0EnmXfSG8nJaCBUYd+m8C32Iyr8l3XBeCMBRhdl9ahHR
         7Zz1P1aAlCI6lupN1KwWHKHMHq8hNB9J/FMdEAL2gByL98hq2tqTSuep0N9zcjSieVHi
         fSvOctSK4v/p40NvzKmZNjr0RWVn/2dLCXa8nv1KuAMCkUWNlHzl9cNDywYzwmLjSjzH
         hHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384695; x=1780989495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GExpfkrACNfd8AgKb7pzoxx6CS0kiv0JrtZqZXX3hVQ=;
        b=nsQLzP1ELl4qbXcDojJc7h0GyygcmLgQXA0P8xkM78u1AkIGLRhqqQGK6eVOE0sK0O
         vuKago9oHMURoybdh9LswINJADZM80MSjLj96BrEMNHMmvfTpo/bRsqREbcaeCoxJ21o
         CpD9UxHzkX3EPbIpthZE/sJl0yiazaQjdTsmneDKS4lJOnqF3Fw9bkauN4wETWQGUHxl
         N68GPkHoXxbHGvW5utQqEKYDnc2Nu3T8Y4J8EcVCwcAOVpdSXORBSu1rqJTNIeJuHq83
         qWEMVzlzbKH7Kc5yCBDKj01ngBNudzk3ydobIysmJrpdodgd3Hcx5N1RnhqId/DRNrt8
         JjCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hOscwdpw+qHCgo7qENwu1FUha0w/s5odHTg4m0D051mTCd89hARhvILUY/qN868KuOxyrdP2eEkrXR5vK@vger.kernel.org
X-Gm-Message-State: AOJu0YyAO9kmZLRzq48F6FoEpWFt35MAIl00uB/g6UykHkhh3jgNWLDu
	TzfZ7zAv0sGKqyE3DMxiRBXPVs6+Ci1tRkK9YxvBggisZsCWTN2D3rw0qCgmv+8HjdKAiGwDPP4
	K5z0kLarZNGUhEJa99tLIzWk+3yzp+pjKV3ctS03CTiiD0u2HLf1grVVPGs/n7A88i5Rx
X-Gm-Gg: Acq92OHR8cAsoIHMLJutInVn/+IXN9PDaE65WIcOdzt5P9Vp9ULN3m8VzzOiHKWjwhc
	OiMBYpFttSJ3xGbupa7m3VFM4N+L5O99JhExAkk9TUGFzkuv/r0LNYMUqUNGn0IF3d8AExSdNDM
	hoqnLyXogw8aRVe3v06VsxmFW1ctw8xoo2Anjg81a9oWT47OMbslMIl/7MdP2g4mjUc1Vi8LZss
	rfR/R9ja6+aRJcVOsOQFvlQ/p6doVPa9QfRE8i45mo9QSiq28hC8pK0iR7+MCuRk4Ps2mV0DEn7
	7Xe90gcyBpE49Nq4n6JVMssrGdL79QKE/jt1EJAul3Yf1ru2hwM9CUkK6E33XcOwgAe1gSvX/VA
	OwSBjxmtNEthReh4M39Yc542QbNtF4uQa+q6o3yxtq+t6yj7uHwfn6gMXx5j+o5W16YutNFy4Dc
	XCWwACEWInvukY7yu0Gns3dmLmiPIJPA==
X-Received: by 2002:a17:90b:4a4d:b0:36d:dd4a:1e59 with SMTP id 98e67ed59e1d1-36ddd4a24e2mr2251888a91.23.1780384694927;
        Tue, 02 Jun 2026 00:18:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4d:b0:36d:dd4a:1e59 with SMTP id 98e67ed59e1d1-36ddd4a24e2mr2251844a91.23.1780384694470;
        Tue, 02 Jun 2026 00:18:14 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91c9991sm1766279a91.7.2026.06.02.00.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:18:14 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: [PATCH v7 3/5] misc: fastrpc: Fail Audio PD init when reserved memory is missing
Date: Tue,  2 Jun 2026 15:17:48 +0800
Message-Id: <20260602071750.526-4-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NiBTYWx0ZWRfX7MKUqiL5F7GO
 DC1BMVIMw34LJzXznrSSf33ryKN819jGP+ykn7uxwHIEgOA5meGAUEYSI1ipkFUMmWGV+Gupsyy
 M8VlN94KDldhnhj4F6IxSRtEKSZiFvoWIUcBA0DPEhXe4tuH/6vwWtf4QEzijl7kv2u02635hJX
 UWAesRIER8IxI53XsZXTYj/ZH1p+V+9SUwSWddjWrGvWsQII+ctPATddy+yim1pVJ1dlNV90sIb
 focA8iK4gZMW6XfUgIgiSopkL5BnMly1ZPByWyE0CAVvIUcN8Gq6NppV5/rBB0b5fZjzvOiCFtw
 GKMY83fmPKv3nv8A1D6EyYDUr75EJAWrRl07XmqvOHJCw97X6E5NyHE2t9vb2x9xudq+UWJchdB
 zue8tlmjrRPMJ/3QcbeC9cWTrwhmnWZBeUkvyPH0+Zcshjk4pot5S99ieMESmTbBDulKHoguDJZ
 cgO5wK0dQS5hpU1V+8A==
X-Proofpoint-ORIG-GUID: OwCKngntqWMkyeaL_8ocnJdMlcliJbyw
X-Proofpoint-GUID: OwCKngntqWMkyeaL_8ocnJdMlcliJbyw
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1e83b7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cwMOb1EeFLyGxYfGK4oA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020066
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110734-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2AFB629A98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Audio PD static process creation assumes that a reserved-memory
region is defined in DT and exposed via cctx->remote_heap.

If reserved-memory is missing or incomplete, the driver may pass
invalid address/size information to the DSP, leading to undefined
behavior or crashes.

Add explicit validation for remote_heap presence and size before
sending the memory to DSP, and fail early if the configuration is
invalid.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index a8a58f889d07..f46a8f53970d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1354,6 +1354,13 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	} inbuf;
 	u32 sc;
 
+	if (!fl->cctx->remote_heap ||
+	    !fl->cctx->remote_heap->dma_addr ||
+	    !fl->cctx->remote_heap->size) {
+		err = -ENOMEM;
+		dev_dbg(fl->sctx->dev, "remote heap memory region is not added\n");
+		return err;
+	}
 	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
 	if (!args)
 		return -ENOMEM;
-- 
2.43.0


