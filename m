Return-Path: <linux-arm-msm+bounces-91608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKIhCN2bgWlwHwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:55:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A354ED57C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 263B1301443C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B814038E5FA;
	Tue,  3 Feb 2026 06:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwnGYxAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dcy36gdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51638F235
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770101713; cv=none; b=mO+IFSEjqTSMkP9C0mnchS3i93llS8AGih3BC0RfxnQjSZdqKSbRS9kSSRSRRfj3zELJ9Rr1wcRDjpXphT98kqsapsqP8U9pFmKrzVw8W+1RWISH952M/NmLikpz0iNBSO9OzIWcjp7Lzd1x+PjaXucRMNYgIdiUdNc9JDBWkXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770101713; c=relaxed/simple;
	bh=1QZP2yBOYKQkZyiDROL5btYAGl+z9w2fPfu/JbHUWXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e3y6EsaWLKEX5W8eIbqdf2ol2OzgAemTiB1ZeEl82ZlGaGQfs4omQfs6vDX+arIk+U2Zhm+VUvbO8DFgCYxL7xrtFWT5p4JgyPj+dZBQCeGQ7j0pJvIDsYHLTulpJoO+tMqkxhkpzC6WLh9hlfmvOhjV+brLoKJh17FV/sE6U5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwnGYxAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcy36gdU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61362xg93916029
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yJh42zj/7ybOfbUD7RC8M0
	spX8TaPhWMxB9G3xfmx3M=; b=OwnGYxAAvIRItXG2xLKXi+IsVf0lLyfpE+BE5e
	rR1eE1zZyNZygzoM5fRBCx0xRSlMxpzBhCyYJyjQ79q1Ws6bsFpVcnJqDuFob+Bm
	KQ09wbR35P3WiL7KhAA26i5xcCS9diORBM2Df4DMl0O0iZWoc6Up8gxNfPP+GKIx
	PBHk/28h7DifGqfTcz0MBrnKY3uuwkzSEa/ecwYuFjC2R+aRPBvn8yEHCOT7XLQJ
	rX3wUTsMQSAgoTnDz8I5plb++2XENYN6T/FL4fi+hHeQF8hDgnvJdrqmQWVqBWaV
	s5YMpEL6f0GetcKFNWQ6S4Vetxmzo+vHh7zZvdfJ8bhlaVPQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmka2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:55:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3545dbb7f14so2345500a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770101707; x=1770706507; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJh42zj/7ybOfbUD7RC8M0spX8TaPhWMxB9G3xfmx3M=;
        b=dcy36gdUjuATkEYbhy9fFxgHhDdDewBnkL7OhfIL1N1QfQd5fXftkKE8Kn942IiHHI
         IJjoefcQz/HNZePl0pgXzct3DNmP8f+nnJxj5McUCKgN8PqRohoSTnUnYbupRn+cJQCq
         SuXZmeTqvCoyp6qnAGI08Ao7Uvk4hBklx8l1fkclIkkSX2topWN3TGbceHaZ44q2KYPK
         LgeFCRZAxoZhpZbf02eqoVBl891k/+6SabrQ9SK84edWJIqeB44Of30Ac0kgXrh1FRVX
         Zn+rkumS0089eB/lg/2rexEfXCL4kMF9UpuV41uJYdHHPzhYwA3KYaBvdKog3KReNF2l
         ljtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770101707; x=1770706507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJh42zj/7ybOfbUD7RC8M0spX8TaPhWMxB9G3xfmx3M=;
        b=dq08SyTeEucyRjPiLa4YpX7KlceZhln8F+bAvoat/sq0lExersKNyG8uPdPO1bc5d4
         4s3Q0O6iZdCxNvFAnyfpdjTbvm5feitDscxSgUyYUdW8+8nPRQpTjUAZTgjnpH4ZdgQn
         Xfk3l9xTN0/KKPo/VX5k+XKO7IcJAYrulPnf1pq3uHYdqJvKBebnWsWDbVaUyVi4xtHZ
         gPyB8JbOlZP0NH5RnSQJCzGRY20IERsIyWDd7KkGm24nJ/p3kiEGZAoOzEVbiwFHmhWr
         vHGS1uKbuLfvi569l4s7anLBSMkSXzl93CdCTTIHcQJI9ZYwhCO3+XowKzBSW08Oubu4
         luNA==
X-Forwarded-Encrypted: i=1; AJvYcCVsCJS+JU+5QB8Bof47W47rr7rLNrDRE+HdDceDcj6Q24KvabqP2ATCgI3Ry5nJ0BaO9rhtA3lVxb3l3nPo@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3UhQZSAM/KmVz7WGJGdx2+s/SsCmCJ95ZSa2BaJjADYG5yav
	HOVgWjvmwD4mtlb/vc2aDobX4gKMVYhhjux82mqgdAmy98IQUP+A+6cSHA99KLli4RFv0RCPMli
	5+bH55uwX3/p2xrVnQ4xLRRUffiS+w3Fc9eiULXdcXQ1k9g5hgE1+nbUFQpm8oLguu92BkpfduV
	+x
X-Gm-Gg: AZuq6aLtS006XvJmz93jeoq3GFvoEDFweD2FDVkt8OmU5dVhNAd2qrg/4SWZK4JJ6P9
	FvimvhqNF4ypPZ+/1Cu7fkbrvZK3AsR/1YO98+qU1K5Ss8QTyQyT41+boOriK8/SBvO7m5n0i00
	7OT3Mx7bQ5MCeDCY9t8f01Ftk0cHAf4GADSxrZhlJc5/W2PWvmJOlwGe79B0LsYRhpbYSuzG2Us
	gzIi/0JHEnhzhGZGPWZJkX5IEuV/Km3xZzGnieEMsQ6sVk1FDhRtp0ea3yNwCz5nYBxq4rKHWkz
	hN5ElOXIxl9G9OPV27ONNyCFyDqXWMJsok+01Y8eprk4aMHDo1nKHFKh+6Wd/ied4u4HqTzV6KN
	Utt6CerUNVBJj3pubdzYfyDW4NtfArTl3Nrs=
X-Received: by 2002:a17:90b:2d44:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-3547be4a465mr806922a91.12.1770101706696;
        Mon, 02 Feb 2026 22:55:06 -0800 (PST)
X-Received: by 2002:a17:90b:2d44:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-3547be4a465mr806882a91.12.1770101706186;
        Mon, 02 Feb 2026 22:55:06 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547b1036e6sm837924a91.11.2026.02.02.22.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:55:05 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH 0/2] bus: mhi: ep: Fix state_lock protection issues
Date: Tue, 03 Feb 2026 12:25:00 +0530
Message-Id: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMSbgWkC/4XNTW7CMBAF4Ksgr2vkGefHYdV7IIRsz6RYEFxsC
 K1Q7l6DukOEzUhvpPe9m8icAmexWtxE4jHkEI8lwMdC+J09frEMVLJAhTUAaJk483l7jWnPaUt
 s6RD9XipE3am2b31HonS/E/fh5+GuNyXvQj7H9PuYGeH+fSeOIEEia+WBauvIfMacl6eLPfg4D
 Mty7jv/SDWH1GQbgy05B7OIeY0oqVHV2lDvXNW8QhoFqOcQWzXsTKcJjXpGNtM0/QHJS+LBkAE
 AAA==
X-Change-ID: 20251113-reset_worker_deadlock-0223907f7c9d
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770101702; l=760;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=1QZP2yBOYKQkZyiDROL5btYAGl+z9w2fPfu/JbHUWXg=;
 b=NOMgO3tCdmINAuGBFIcL9Kiol8jRQcPQr0FNLlxZ32gQkeV0jKm7wUWhX0bxMktCAWUid+gA3
 AhFiDLypyBbDrp0/1AdLLVsVPwqC41j8HkaQDD7pNKikz1LTYnmU6Vq
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=69819bcb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pCodMjt2KUT0m2k7nJoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: rhYp98vYTH4U9-Hou5oTi-VVIWhRxicf
X-Proofpoint-ORIG-GUID: rhYp98vYTH4U9-Hou5oTi-VVIWhRxicf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA1MyBTYWx0ZWRfXz0OuQkR8Mvap
 LVSD9OEt7egs0/+mGmX9++hLXViNLaVVqqVnkH95PgYgw5gJirNqpw4j7UhuclTYOmc1EpNUAbT
 CXBEkp26fZzVuMBuAltCwSoh3PEetogFlH6PQGL+6/s8gE4+uB5iVPRGzAgHlKrj7fyM72ukIdL
 V1Fmqc06u4RfMy1tZsTp8CgOvUEinhl0t/jQwzT6HyHGRqt3P5Dhers5kPAI7HE4I3d4NLqrnv/
 JPOnXy95ZVBgykwGXc/S/2DjmIm1GWI/X87AV7SSq9oKScOWhzYpzs1zEi2GuVETMKQbXccY3vm
 09FBm7yJ0OUPE9h2uOTxYh+qyU4BuWtd31AZq7lE6L9QcQUzdQH7Hq+8/lhGZYLjzAaFbMJSuE+
 17NHBsSeeEOHL5GzUPfMv4HRxRkshnwpOtgBhIHv2n7wIz+SY0Df0Yy4AEwcKw4reukVlmZU8hm
 zFRd7OgLWeQSdt+MWEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030053
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91608-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sumit.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A354ED57C9
X-Rspamd-Action: no action

This series fixes a deadlock in mhi_ep_reset_worker() where state_lock is
acquired twice, and adds missing lock protection for mhi_state accesses
in mhi_ep_handle_syserr() and mhi_ep_power_up() to prevent race conditions
and state machine corruption.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Sumit Kumar (2):
      bus: mhi: ep: Fix potential deadlock in mhi_ep_reset_worker()
      bus: mhi: ep: Add missing state_lock protection for mhi_state accesses

 drivers/bus/mhi/ep/main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 6fa9041b7177f6771817b95e83f6df17b147c8c6
change-id: 20251113-reset_worker_deadlock-0223907f7c9d

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


