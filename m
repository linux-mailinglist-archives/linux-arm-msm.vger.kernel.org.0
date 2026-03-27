Return-Path: <linux-arm-msm+bounces-100446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MykNrjfxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:51:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 887DA34A75F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0441305AB95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E891398911;
	Fri, 27 Mar 2026 19:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUvIGGF/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nk60mjdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B405C396B84
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640905; cv=none; b=q+63mPBrqMtG1w5ozpsewnNZDr6Qtsj8ZtYuwfcZqp4coIOcI7lEo9FDdD7e7098/x2GfSrbtVwHU3hX8cO6QlXWyOXYJN2j/wI91O75teXxkQgfflPE2lNS8s4+boPXGUh35fl2cX1csWscqN50JgIjdQoO7dX2WlPus950gA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640905; c=relaxed/simple;
	bh=VQ9cdxfTZDLfBheqUQ2IcPxtCskcF2HzOkRR7rJMk1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4jrlnu9z9IC+5BomPPyPgQDC4m2Wt0DmhCbhD1R8pF2J5i86opdu/zGpPiKZyEq48JU9U6oFwVoNpTq6ezFKrwYWhbFhYfHqT56re1llteJvU+6ls+l90MrHhiHBRoRcN0qexBggxJuEJqoq3GEmpMXQRdEqFYSAuGiEVC7CZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUvIGGF/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nk60mjdw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2uPu1458841
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xj6ACPQOpTQOINhOtp1JGfkRWtIL62oMxihChN01Kss=; b=NUvIGGF/fFSFfHbJ
	jAZIblk2p0EvwFOI0ly8SUKeOG2uoo68pYZEhKGqTJWmQQt1nllDg4J1u5FlNVrT
	2VfC/pX/BJxgzZ1kQsCGfi31pY/bQVBs/ovs1bbzjIav37cZFB5x5MYUpn3XXJs5
	dvLt0AQ7dqcPKwA8ecqcN2YlRWftW5mHuLHJMEiG7yadBRXyxu1JAeFK1OATCmuK
	vfY50O+HWidlBrRHSSbEzpC0R/MPfllVLbQYkyeHy5xlUMRQuV3AzVVGRAVzguD9
	sYKE6oa67wzwPaaSSc20wRfGHb2TFC+xIMAKbHY31qdetvD8j5EQ+hoSd9PqDiql
	tuhF/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6m5ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091327215dso56621461cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640903; x=1775245703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xj6ACPQOpTQOINhOtp1JGfkRWtIL62oMxihChN01Kss=;
        b=Nk60mjdwDbsxv1kWPgPqXiRK4CkNXu/rjZjTvqcww9pvjb6CKV/lObO34txRZbG7OY
         C2zL2+OFbIJqYbPxYsLTDCVfgHvesDfv5mFGO4JSTTFWlAhq6BiuHU381Gv420/t63AJ
         U5w/5yGdUPxtnI5CN00xebq7jvbUqJXeHq+NeihvK8e5qr4bpAWEEW0BhpLcR+h5et/w
         LAPusmqpeVjZhMae8Ij/QrG7keTxariFSE7cxNMwem1fYPAc8uS/UliJwvGuUOM3q58f
         9Q/CtpD3YUuoxaYK4U9Wd/tfjDvRL1TblxxDv4qwRb86JNVoFo8ZMVNFQp9IBYwg31qY
         6+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640903; x=1775245703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xj6ACPQOpTQOINhOtp1JGfkRWtIL62oMxihChN01Kss=;
        b=Xp9jqZJPMx8eOtpTf1bp+SO/UKOghJi8wyIDCFSHZgv/muhcvnVyQEsJYVjF/shcoy
         BWL6En/IsYfsxN5bUS/4PV4LhRMy9sOvKIFseVcJcCGshKMmipmpqMAygVWRwg5ykgIh
         +jnx7T5DyuT8N94AnI4zuwOsizC3l1+hl223jkRy5zVl0zxQsAVXXHDxKRYktg80JYaq
         cmR989rMODOi/nLhCGDykMTBw619PEtOkrzwilwAjr/SogeVQwrZkszTrcmheQ6P26RE
         K0Fntzp7ld7vFhK38ODAkLRdLIhJWiyMowApN5i053D4pFy6Eib9RE6ts/KDkGqiDjtj
         avFQ==
X-Gm-Message-State: AOJu0Yxa73vCSL5Z28ka9ILDhNc8iQZ28FVSLyRq4Z+gtgZWmal5UWyO
	5jEuHvJEHi7q/1NvMPCXjCH9T6CHhOZgT14qDftcVtoFbM6GP42FrPsfio7RczlN1o0doc5RbT/
	0Tu80NMbpE8AlsCTN6/GYuzoRxPZZ8IzMSl/Ak9EB/Ewsu7Hjykk8ktNQa/faDGTEs90I
X-Gm-Gg: ATEYQzwF3IfaRPyBi8pEzb3kAJSQRE0uflF+704Ypz2HgdbzyFqjX+VJ1h4IIn9rKad
	Y7B8fVqGiD/RRBQKZovhOOo5nPVgznTdCTLU7SDoZKerqlDV1EkqCjhDgLAZmOwSIaeQgk1d78A
	vn6LKTGlMuBec2sfcbVO508vJQC1qxTjg6kZebVC8u8kp5nWdHQTEKvOESPfGgu+iRxf7afNT00
	N8hGfisGuOyyTQr5W8vHcb1RQQuM4wRGC5sgb8NvJ1Tj1H0r59Q2KSkLVu7yr9mjyPq5mZUyRAG
	ThWZgjEURG2ANEcUIDfvwmTlcaicf2F1C8MPwVBG88OAy7M/geUfOMoKbwpO5j+J38S/m1TZJ8a
	QvHlTP3GNdBwmvnZQMLzSfyCqdKuWCSvU8fuIm69Yj/JoYpPTuzb3Gx2SVU3vFE/vNYWzb9C5hL
	Gwes5FH+CFrVotM/cpEibi73PVAYnFJ0/r
X-Received: by 2002:ac8:7f8a:0:b0:506:6caf:3cab with SMTP id d75a77b69052e-50ba38533ccmr52007901cf.26.1774640903246;
        Fri, 27 Mar 2026 12:48:23 -0700 (PDT)
X-Received: by 2002:ac8:7f8a:0:b0:506:6caf:3cab with SMTP id d75a77b69052e-50ba38533ccmr52007481cf.26.1774640902688;
        Fri, 27 Mar 2026 12:48:22 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:21 -0700 (PDT)
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
Subject: Re: [PATCH 1/2] drm/msm/dsi: fix bits_per_pclk
Date: Fri, 27 Mar 2026 21:47:52 +0200
Message-ID: <177463970785.3488980.6066718261448635938.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260307111250.105772-1-mitltlatltl@gmail.com>
References: <20260307111250.105772-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6df07 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=EYcKVL8hNR3qEPlwxdYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 2a-jiEzDKB1RAUE7IoFwdj-lC-uZrKo9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX9/+gEdKZYb/9
 JakibQD8UMtrPumqJmuBPDjbVVTuZHWTsf4M5D4G0e6RnEV4331LaGAuBPegeF9Ur6p6fd9qRTY
 v5AQl/LPFuPTCGaHtAcbBjX8i72QmSQTvbABtGovlYAcLtcBu63w9Tusu3nBdPSDRlPkDf2SFRP
 OHMtnj3fg0VvVl2soAHL9X7tAQFjTYf1ysLgr8eEXqDWQ0hCPHW4XaYyUSVfyHDnzZhOTcX8mc9
 gFR2lK36s7LH5ObskCCUh1DyQ/2E1xGp37ePf1E1ACjucMCG6LzasNFykcCnCwGExH2UWlaGsVY
 OgJ/qIjnvVpHsr93JkoBF2zYec7IiuM/EMN1GOC9rtmtJh66mmXM/9d3jM0QzCJg8vW9gooFug7
 RkLrUwN1sJpfCofdVmR/INZCVL375QUUzaLsV69e6kBHw0Mpob0HdeNRktX0oLTOyN5qnhUcu1o
 36dTLwlogj7+kzg4NAQ==
X-Proofpoint-ORIG-GUID: 2a-jiEzDKB1RAUE7IoFwdj-lC-uZrKo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100446-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gitlab.freedesktop.org:url,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 887DA34A75F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 07 Mar 2026 19:12:48 +0800, Pengyu Luo wrote:
> mipi_dsi_pixel_format_to_bpp return dst bpp not src bpp, dst bpp may
> not be the uncompressed data size. use src bpc * 3 to get src bpp,
> this aligns with pclk rate calculation.

Applied to msm-next, thanks!

[1/2] drm/msm/dsi: fix bits_per_pclk
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2d51cfb77daa
[2/2] drm/msm/dsi: fix hdisplay calculation for CMD mode panel
      https://gitlab.freedesktop.org/lumag/msm/-/commit/82159db4371f

Best regards,
-- 
With best wishes
Dmitry



