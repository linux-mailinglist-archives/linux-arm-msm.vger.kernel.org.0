Return-Path: <linux-arm-msm+bounces-102643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L22GxfH2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:47:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0413D5297
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AC3B3059E21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30C536F41C;
	Fri, 10 Apr 2026 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xr9LNeJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKuXzKND"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBD03B9D90
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813736; cv=none; b=mRGktrWJVhpwVZbFhfn3sYKaciPEBjq1GXIvA7ZjojYadQkP/9luHAUavyLkqo7yeHxIqz17nuX5LfKSzy+nDT35biLpf6SPG8/jgBO53SN4D5mJ5mcxfb3Ta1VnLEUsVlYPnh88TlLHwTII97tOlpPMu+hqvAaA1i4l1vVGcRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813736; c=relaxed/simple;
	bh=j8YHSkQXSkV3MzDabWeSsjFFi1434AhpeARS2yXB6PE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=In8W4c9pfBnjcPMWKQ7DNNQm9hKlVe439IOiHcfyCHtnpzAFRfzpz/xh4B0cK2neV66xHRdRZyGgXfPHvxNL0nPEaO8O3Pqs3iaHf90BHgYZqzVOeKTLTEPJUNbkZcsrDlzMEMY8xp2pkJd4AYU0YfDS77dgNUBztZg4feaCiU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xr9LNeJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKuXzKND; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5o2ap707656
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/I4bTSOiGY1jIhDj9cBBNJ5NjBusFbpH1J5Y5qViqE=; b=Xr9LNeJa0pKQD88G
	kV4cVa4QaX4j2gk9YgsZlPlwoOH3VNYm7JScfxBKnjAOHm/kEk1QK5uG9tov5V9d
	CLuxqVKecLiagRUieaWTcy+Pqwla0kpQycRjLB7+NphEjFu1126BShILKMd1x4z9
	MrEmc8DTmjBjQ/0yhC6znwNYo0cTV3ei4tVuDmW6jVCTzygnVeZNvsGbGtuGeEED
	Ls0mG9PEbkO8OnvWJ+/kG6MVuMJqK8QL+MD0k+kDjvHarAx/wk8FqFIfvX9x1DhR
	Z3WLh7IUUsv0t8hVQ8YlSzj5im0PgsOH/t4j1eNNgcYtV8gD+NJF0x7CvLYU52ms
	JmcTRA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj0tmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a31df1907cso51957136d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813733; x=1776418533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/I4bTSOiGY1jIhDj9cBBNJ5NjBusFbpH1J5Y5qViqE=;
        b=HKuXzKNDdY8wx296lahqpxUKCeY96x9lJvdi4LgOZjTs2/TVMNvuZoWJrcIo7r4Ens
         euz8Q3uAE4NOH0whOnMCho11YErc1qt3iVq1TwTBOvoyOLrWKiTtRtpiS0Fu/I41RN4e
         eCzJxrHjFtQdLo4h2f3j9aF813Xzjyh+oWUohTRYLkJQmfUcdC3kC2Is8bKU8vYsCUDl
         +zWWO+hl40s5UmjC/3Kqz/dJOsTkVqQ4/aEFPrZCXMaZ58/S80+jgIMU4GXFG5kuvMUw
         OpXy91xuabMXwdHefDd4h67vEChx6dEcjC4cPVwHemfcRvov6ZzQNKUQj/OS7vIs6bt/
         /rKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813733; x=1776418533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G/I4bTSOiGY1jIhDj9cBBNJ5NjBusFbpH1J5Y5qViqE=;
        b=Vq2oF4ODD0vVyomcycmDMyDxGWeQKjCNIfmRPelTyhRr1jO9FqS4mI95WYYo5dgubf
         dRL+u1TyvSDfqumo7i99ZSyZPWVh7qQRP43EOPrvQUYPa99rDztTs1VpUYZbSAlm6LXT
         9VcVY5Y2A1KN50RQHN9U7hwt/2wCFx7d9hnbft6MwC1ftSR4lMtKctpR4N6RGwDSGf8A
         yS+S4V5RNJyPbcBJvCSPQ+agPPp/E6lNA9m70qP4zTcVFKGpOY3ib+XQwR26vFgAAEl9
         CC2dhuL0HVaSwzUTN6Ky9bUDEgZkUh63vCy/Bhas55toQ0cO28jLaLtevu+BIFZLTEbd
         hXXg==
X-Gm-Message-State: AOJu0YxA18HmsXVTO4gHUwGmo6kA35qo5MTLMNymaNI5/j1yAQrstvar
	I5rOZSyblfI26kNQyZdPMC010yicTRQz0Z0R32g4mnYD2Eojl0dQ49VaehwIPsMvAMKVZbqIw+X
	XlWeG1VMLJfE9wujWeNbO2d24L+7VaTAFgIj58tW3jVEoy8XOvNyyRTjOWZPxGvvv53PfS1Ugp9
	7yNOp+MA==
X-Gm-Gg: AeBDietQ5coJ4wuRKnXQhSjQVDXefhUrtg+bqw1VZpKMLHemnwJv2XiOcTvuxXAlWq+
	Re1gp36pJvoFaLW2Tmey9a0VfWpFVeIvhJqeuLb9i6z0p1cDNANG92t1rBe0NBr8iVnEOhwUIyu
	mA6mX3zRL4iJ49x3rjyFy9u8knqdAplWycvn8VERJZ3vpWKqUfx5FVH74RJztb5q37qTQ2HfSI2
	DKAy7ANYqBZ1AV4LENzK+iiULjAsp8MZQZMX4VJOq8o0rxRRb3ekZBWecp+mzGf2JqArD3bk27d
	EbBTvLL5S2aWHzc5TW4VsK3cXVlq+xFGakjftK4a/829POUYifMzU7+b8hmpLYfghFARdXqYhSM
	MdNvWCZmYcBBFwW83qI1nZrDvnRGeZWy8PIpJTBux065tI+41G1DRIAUSo9L7InBeOoY/qIWTW5
	n475gJpe0=
X-Received: by 2002:a05:6214:29c4:b0:8a4:8b2c:428f with SMTP id 6a1803df08f44-8ac86156589mr34211506d6.2.1775813733573;
        Fri, 10 Apr 2026 02:35:33 -0700 (PDT)
X-Received: by 2002:a05:6214:29c4:b0:8a4:8b2c:428f with SMTP id 6a1803df08f44-8ac86156589mr34211166d6.2.1775813733092;
        Fri, 10 Apr 2026 02:35:33 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:35:32 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:55 +0800
Subject: [PATCH v4 20/39] drm/msm/dp: no need to update tu calculation for
 mst
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-20-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=948;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=7rIh5JObexl5wqWddoGzIlCl+b0BF+eozfwLe9V/icE=;
 b=L0VlX548K0Ak9M3bU1jIVULRvNBw2qHMvQPV8mzvfqFtmoRyUXEUPU82trTojGRtaXSWLLHFu
 c6KQX481U5nB3g9OiYzdERFd4EYX4isXmZeLD/bwF8w06mr08S3PT0i
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: zxSZchBXmXdzgLF5OtVd69fKJEnKaeWv
X-Proofpoint-GUID: zxSZchBXmXdzgLF5OtVd69fKJEnKaeWv
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8c466 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=IvrVfA4mKswhpIek5RMA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX41ZjWZcvcr5w
 4Yr0D/cfwfAz3u79R7yyjHdXnIqzRl3C9fYKTULtNwLfezVAAsmS5mMg7cav10AcH1UX74pUA9b
 Ql43czhnyYD2P820DqS92lLf7s/QU6oYhIDOR5ERZnUcvWo/K2sc7EcLODjBhQvoD7AfBdVFFxO
 kO4erbRHTx4ZpuAXhn3dxZ0TXsSlnyzX+L/6bGByLtvxNhNth0BOCgj00mWnTNSURYd7LwzSUdu
 b/Ru0LZkXZGO0p8r0IW2vZhPhxnBy2rxf+zjgagPM2bwoHMJP1GZrhsTKiRADN4PHet4lQ0RLFp
 /6NqHdS5GSvLQ/A8B1a9nSuD1vnJsipfF/OScUqL+DAZWOsuWZE5rjOIpM+hVHq9MN4VUXELR7S
 Ag3I3q7s/IeIugHr6FsKB5GtXbOURv00RrZVSft27gZxusRw6K3OPiKVzMIOqlfjOoH1KJ23CKD
 ZMvmCFn+JoxlVaghIHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102643-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED0413D5297
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP stream is transmitted in transfer units only for SST
case, there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9513de81abc4..98316892eccd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2698,7 +2698,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl);
+	if (!ctrl->mst_active)
+		msm_dp_ctrl_setup_tr_unit(ctrl);
 
 	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.43.0


