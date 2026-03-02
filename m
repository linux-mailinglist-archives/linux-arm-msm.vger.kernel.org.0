Return-Path: <linux-arm-msm+bounces-94808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IUUAARRpWke8wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:57:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 563CF1D5123
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4794A30048E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988B538A73E;
	Mon,  2 Mar 2026 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFoyPolg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdYbXWWX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B34A32B985
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441783; cv=none; b=QZNdr7gxUf0DYh2vmNB5MUyND9zq9/txLTEGHa0yhjBgtBtUOxjEK62uZkpwIdaa7GdTshxIyL5HPRF7uv1ZKwkrlDTJYcN+V4IhKoo17FYZle+/8I+CEaelNlLVA3wnyfkFhOFRcf+vAK1Mreu+U54XJHclUt62NKsHJvRTmYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441783; c=relaxed/simple;
	bh=YSle7age6/sGC4mrbcE1fgXH371qq6gkeUXhaxiCOyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HrK4sF9pSFR72+WEgYu39q8ZON/zSZmJTFpW+S2gWzO0d3eRgW3Xd6L9DvzZXsq1M8AASJ471l7x+2KsX7DE9OsPGKkN9mF1sXGht4EQ00SFcRoeZauAoFyhBHR5rhzxUOX+JOZ8dthfpeSu3LacczYo4NLUQE8cuFX8QNJ4fU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFoyPolg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdYbXWWX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6225ZRS1974656
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 08:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WApl3fPUusQhgCuPfXm41GbJ+B8rlZDv+NV
	xfvyf6qI=; b=DFoyPolgCp/EYJgTV2hvkk8ihX/ytfIJn6J2abn+QncUKRTGVtK
	ZJaGh0+irgpLI9LzNxJAiQqLowGytkcMZACEy7YbRvUi2yLXgofgdA6VHT0D2egw
	eMY1xNtX3jke5KRM6u3PpNWMHV1E6kQgjRtfK1Zp18uOjU4r9tXUIIxAw8PQ4fR2
	US3h82xcsjtRf7jIrhVfR/ZQaMwNDATh67Koj62swj8hQSa111zk2wdNYKmU9uaI
	tMaH8YqTErI+yAq2e4oy/rwPuEuP+fuxHo8ReRliAFqJCTgFVrctkJesR00O0t8J
	3LA3KVQweNdMi7BviEhGu+6p4Z+Nh6KKP/w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrvvwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 08:56:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae42659a39so123438845ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772441781; x=1773046581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WApl3fPUusQhgCuPfXm41GbJ+B8rlZDv+NVxfvyf6qI=;
        b=ZdYbXWWXk/8frrMJjQZbAI5xHLKBu2yTfU6wagp9E4Ywxoy2BrmGAzjeinAD3Rkz6P
         +MLLzSvapC2xx025J605XhBi/Yegw5pN9YidtDsG5Kh5155EEcxsJqqCgEow0vWnauVs
         xb1vv5jk1i3P9lXXgDJT04SD87QFYAiMJzPQRMYpx1R51cWbFoXrEUJqDwH1rH9G1Yws
         89OfQP8QrOIKSoKJhAmO1NHyY7LnYYm/Tf0XHSIO21InPraj8m0PRZ3TMjokBqtaCl7W
         xFYF7ESTvZqdCJ8HrUFKbAG6R3m4Ku4tD603jXwKInMh4oUc1FDyHhTMjMbfbNOxch0R
         uBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772441781; x=1773046581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WApl3fPUusQhgCuPfXm41GbJ+B8rlZDv+NVxfvyf6qI=;
        b=S1Q0EuUTgIW3mItb+1Dn5+QAT+qTBzHshsU8nLdXKK7GMpaWzdp5ue+O3Bx9fDkeNV
         f05Z5jwjysnMIxVt196ouciZ2e+TQC2bCdaWiGYuBBMICjTbfJWIGxnlLTvEFAEVHols
         vzcR+atOH5orjE6QfKQq9dxUZtPpMA7j0X6DmCU3cFPDNR3YHg9jnUC31GQxLx27vhjt
         Xj4uoM7pubF9mttunZziUAtXFMVJogWYsWhEgciAlXkTqlVbQzQeiwMpVJIEJqDvCm4W
         EJlgwOfQH8sQnBagwwJXU3A+HHEXr1RROC0EdZ8q4Lxu2c7uGvvmftiZozHDhB+SUCSw
         AlXg==
X-Forwarded-Encrypted: i=1; AJvYcCXOil8RjowTgT1H7OVEvherjgXBZoMGk7L6isymVubRKLJSvjwms+4MEOQ6ZukvYACdZucVEszFg+0/Jx3W@vger.kernel.org
X-Gm-Message-State: AOJu0YygfI95HASOqTplPhqWwk8hzBrg4QJe1ndVyQhos+q1y/IOVurE
	ThAHngtqbYJTEnanhF8/l/NO23wnvJ6EloCGagWFgZDEJLFPyD863Xo5beWZNuMDh87A98h35aB
	+a6Xt33WYxuHShndN1R3cWWAdwQ+CtU9KB+8dIfpTpdY+ZFg/PxULw0n27q+ZFT1hobnE
X-Gm-Gg: ATEYQzzY5gsUlAykp2sTNzXJDEAIkE35WzYbP21FAejYT92h8fjTYtmKYzSUii08waN
	gDx3QtVDs0mFKEozwMokPd7q3X5GDvaPVEkG8erAjeIYO8pRfc+8PrkFm4GP4URojuE75pYvRtN
	vlSYzLVJdyUDn8n4+7q5E6+GOV6iYAmwyHW1hCEXEt04WI8DJTLsfKMhG+U+592vxZ75+YXQ+vP
	JN2KJzictpAcoUQhNLMzqYCITDnbyc6kGIkoU+ugNo3r5hMNVxr1joz+PfWLrcGL3gd8VLJQLEY
	aUvpOq3kG3NQdYdLkm54qP89UCyGmIWeg5G9omD70ltNQjZEaB987UXG/L9jPLiI2BgGJm0nnll
	rS9LqHHq3jxKA+sDydqVaqjOoszZ0VPydYvdyb9wCr8CacVU=
X-Received: by 2002:a17:902:d508:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2ae2e4d0a96mr130649835ad.50.1772441781166;
        Mon, 02 Mar 2026 00:56:21 -0800 (PST)
X-Received: by 2002:a17:902:d508:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2ae2e4d0a96mr130649365ad.50.1772441780596;
        Mon, 02 Mar 2026 00:56:20 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:40ee:341f:1665:8aed])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3590158f6e0sm20781263a91.1.2026.03.02.00.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:56:20 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org
Cc: sumit.kumar@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] bus: mhi: ep: Protect mhi_ep_handle_syserr() in the error path
Date: Mon,  2 Mar 2026 14:26:12 +0530
Message-ID: <20260302085612.18725-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NyBTYWx0ZWRfX8Vtx6RfAW52E
 SBdGpLr/jMCCv9p/m1q29WRRxqLvvH3xfiL+/F0ffBzXaEpNSXBe6zi1ftJBinvBwlyjqtjMttw
 RcXVfCSSyn7w95Jg3hK/huF4X1TIdro/9uxn0nLpH06VH+dqfhA/UHrYIc00RbzvttCWHXnkg5y
 6fahv5h4B+PaRP16VoSPCeaIB1zNXJpCbTk9BixLj3mLezI8G3u4DrLaYFVk6tparSfK8OjvGjs
 1Reey+2N1kS24i6jRvzSumTecG1cfpsEU87kQGobeZJrrfoMXMlr7K5bwseuvaHJsjIqFshwgFT
 nL/ZLbiQmankT7CJ+rcJXLuZM534f/iKC9qoER+xC1QDZCJ69P/2KHAazWvAnIQq/NRMEZHOuWx
 NNwVbvwcCZAx30cefs1HAfEgoH1xxtqnp1SErRwc7mHoKZdCr4mVR01zHGj2rsptL6WQCwyaKsJ
 O0YgWSrgukLffdiuriA==
X-Proofpoint-GUID: PgvBXofsPtVCjg_hRBjX0UlVLG6Md--p
X-Proofpoint-ORIG-GUID: PgvBXofsPtVCjg_hRBjX0UlVLG6Md--p
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a550b5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AUlretI1EePZII7xc8UA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94808-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 563CF1D5123
X-Rspamd-Action: no action

All the callers of mhi_ep_handle_syserr() except mhi_ep_process_cmd_ring()
are holding the 'state_lock' to avoid the race in setting the MHI state. So
do the same in mhi_ep_process_cmd_ring() for sanity.

Cc: <stable@vger.kernel.org> # 5.18
Fixes: e827569062a8 ("bus: mhi: ep: Add support for processing command rings")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index e3d0a3cbaf94..6a6aa2c28760 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -232,7 +232,9 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 			ret = mhi_ep_create_device(mhi_cntrl, ch_id);
 			if (ret) {
 				dev_err(dev, "Error creating device for channel (%u)\n", ch_id);
+				mutex_lock(&mhi_cntrl->state_lock);
 				mhi_ep_handle_syserr(mhi_cntrl);
+				mutex_unlock(&mhi_cntrl->state_lock);
 				return ret;
 			}
 		}
-- 
2.51.0


