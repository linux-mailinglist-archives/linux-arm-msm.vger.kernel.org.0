Return-Path: <linux-arm-msm+bounces-116508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uW+jBRUQSmr19wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:04:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAB370956E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:04:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F8GfDW9B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="UtIKl9/j";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116508-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116508-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A79B4303A513
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CABF3290AD;
	Sun,  5 Jul 2026 08:01:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144763624B2
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:01:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238477; cv=none; b=Eb1a0wlr94PLJWjhGIW5PIdOMBnxlZnFbTkGjh6MJxuM6Hl0fPj1nd1AD1SKWKZrHiRN721gXYdq06kcY3hssPztgqMnTvG9PY5kWIDjuprTniFCWKiGhslMajmovjawWQa3S31NT38WTHZHgCpDstD1bghQc4k6EBWrudRN4/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238477; c=relaxed/simple;
	bh=OI1UXEhAa5SC5DZklOc1fijHPDyOfJ0YDvWOJSX5GAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SmHTsjVzES5qGiUUA1Mln9uk1y674qSYtc+vZOL70L7smFuKWb9zRTMWVYgIpvfjgOIXu7NqZNvOuujo6GIovODH8cnSuJrc6EuskfygRTAjpvLX0UfQYCnCJRDrfVhvQecXXndPe/XjPPPcMTTjkaNKTi/fvDK/vDPqOivzyE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8GfDW9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtIKl9/j; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664KiRZY3990967
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StFTKdXZGdZFi7CbJzvKqi8zQb82h4UxLwN1tS4qKbU=; b=F8GfDW9B4t3o2Ow7
	mSFrZM8hZj1xH486Ik8lcZU3sm2KfRxIrl+rQEv7RzYxBCgIxJ+n34qiA6D/rQvF
	xzEVZamXH8bwZ/zTSKtDygn++pp4JQy8svP6OwYl41aJ3nIZA7SS4qo9fazTtq2z
	N+wQZyf/FGtAOEDILB9L5Vv0njN3slMLQ19gkGitGsVq5Pb9aRLCA3PbSzxpuT9X
	88rrgTDM28pUD0QkGPwyq/7tS0ZkEuPVDx66hN0rf5QIPGWjUhxRU4PQBgcHlfgd
	YLO+NNb/WDMLXeU/dip7rvBAa5XDpIjaAOKSkMp5+b7esCZuR/VV+7Xm4eNAtbI0
	FpkaZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvjbng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:01:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3855a987c0aso188703a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238474; x=1783843274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StFTKdXZGdZFi7CbJzvKqi8zQb82h4UxLwN1tS4qKbU=;
        b=UtIKl9/j3zBBGgG3glrDrwIdG8A2mQXxkzXnZwnoBJPBcPYX56luMdjAAJS1831rzr
         6ZCehSmFKXWcuJMv2MeCqn3VQHKvznjP8w/YhVE5mTYtg9D6QyAD9xYp/FeJeJBoBPp1
         8QJcvaGG8YlyeTI72pYMz5NA5H7dR1eY2uUOtX89iUhPDd9IM/bk4czKYHn5mhoGdCCW
         dD1PY2Gopu4DXhjZM0S+zsudWq45G10dUl5uE2hG9OtcKbiPG3sHfidcmK2BmB7Vlg4k
         DaKe5l+LpcPmCGxG1ui1YRh0RpjjLbJPrbom3OLFRNF4K5VqENNFR6iIfV3AWwOqtefb
         4U2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238474; x=1783843274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=StFTKdXZGdZFi7CbJzvKqi8zQb82h4UxLwN1tS4qKbU=;
        b=TtDSy7LC87sH2+SxPY2bXFEelFKy9uFC5qUd9nwgu9WsEZDoBM9zTq8v30r8zpCmWd
         5upK9FCc+VZkjiP4XDu3h2U78Y5YUPzfLvkD4pMAttm1VYF/0CfdnuoikY8tNtS4s7BK
         78J8ZlC1I18J9559a+FTguVhz3Iyug7X7Ifqzhg0bn4pNMpmafI8BL/o7/2hQzJOnZKj
         rEd8vodeJ/2b2JESBgmEFat9KPtWLuTckNloh8X1kjWIF+AGitc5SSq/8+HsfAmDB6Yf
         5OTA+KSB3/xvP6quL9ZM/oSf78vXtkg1LwlkFjggnuYZ7mzltXWISy/10rRDG368yUCM
         4+zA==
X-Forwarded-Encrypted: i=1; AHgh+RqRoD24Sr4vrm54eI2YNW9oR1fh6MpsOTTbB5nEuXiPUDkopKO+cNYSDE4wxhf8/pmGlNXqCuaqwRWVCzVV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv8IlTCXccvC+RyyPg85gqpyO4acJiYlB/2+ze2sBG8exWXYd6
	QgVGgXGpJOuzcI4xH+I5DVkdz499evvFzO6vlF4TIaPm0jDWfseYPaKFyTH3nPniGImtE+qa+tV
	Cf+XVpU94JWm9pDzR9FsbTBkPFRvjtmYeZ5OTQmCaQrL30yZpp12Bhv2kq4HvrdS9/M2jNtTbWS
	/m
X-Gm-Gg: AfdE7cnwEKLyf39l3P9xGVHS5f8K31toKx5oR/AmYiRRBS4aNXCMGhsWYovfhFtZ3g1
	CUWry+lVnZXYS/pAV9mjGgdjvzV/gYivzkYJWGjpYUxD2EEYNcrNLqkQFnA8jhShi2FCOSluULP
	5/bYCHTpo43HoP1l+s1zq8WXWKgORYhOBuyAgfG3DxRXdqFxMuQureNcGjZ03Ev8ZcHW4HIz1fC
	m+u6k791n5kSQBWZgmR98chiKkyz960/syvIt6MFll/Q2H36KVLz0DZTrFN2DyMoVKNe4WqY0LU
	XcWWY2iiBybWJm7M2QjU+6uUtZ+lGv45+guX4F2CXSFcmbBXyv+h/0+ZOqhMxBPNK2vKqgAo4IB
	CzcB+uSnFNy9Te38CGTaqheleLleuAMi1HRA=
X-Received: by 2002:a17:90b:4b06:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-382807af3c4mr6120300a91.8.1783238473287;
        Sun, 05 Jul 2026 01:01:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4b06:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-382807af3c4mr6120271a91.8.1783238472790;
        Sun, 05 Jul 2026 01:01:12 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:12 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:07 +0530
Subject: [PATCH v2 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=2414;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2J3wxVNsY4ppAiRVvLGUwPpm/Kmj8pqOhBbdF4kY2vw=;
 b=k578A5/54ikUDp8kLnqQMv2fOTlVQ7Xm5nrGCJ4mzGkT7xA6MAy/zLB9vcpg4v5kTvgvtBoGk
 96g1g8ZDfYUBT5FeUIfmS4ddkZABbHayBtPZcgQ7p3K7fwb6+/tGgcM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4a0f4a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uK02f_PeVygofScQzd0Y3jWVPGh-KjVm
X-Proofpoint-GUID: uK02f_PeVygofScQzd0Y3jWVPGh-KjVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX8mkHvq5EoE1D
 BUBWvj55F/LetbvTRdrRGz1IZrfZkfKtBqJRU/D4Dwkq6OkIc6n+pubHpUW7mXq/O4C13+pkhIe
 JbUYrrIThlf6zXwMz6zvyReXgW0qNlUTU249x8FSTmwp3dR7vTj6j2cFLLaDqfsb8IE+Vhku63I
 sOI9sNNERIghDMHiLdvGixqrxD95IhUIrxOtwTWxD5KtCWL9mbE+vRna+idkL7gawRrhJls/LIm
 T5iqq1nNz+k2QGOh/AQRpH7LTaTLxxQJJOL0cok8hMuGqzllAOI+GwxsuJ9XJbU/UswSPFx280i
 NmRxhyYWOzh3xIaZGmXo8QCWuEUINTRKYorP1Cc3Xd799HG2P5GWlDBdVh2BM5mp2a1mZdHcVk8
 /ZFeds0a5OVH3DAeSNkPceZAKsdPxTxnO6QM9RteuhB0N0al/yqeptdNOh3lStMFLCFQp/rTJDu
 feAd0KvHdfDXM7EI2dA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX14j6jybYVcV4
 Um5Gso5xylOa/zwqYYTqAcnp8LwcrB2wg9R1cLlK9sd5U34kpciQ3dN9sBYRf52mfb9IKqrtmlT
 w5Xigdhvr+WSJ+5gWKpPeYzFiJV7Nh0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116508-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:quic_qqzhou@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FAB370956E

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for kaanapali platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..19eceecc2a19 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2601,6 +2601,49 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,kaanapali-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;

-- 
2.54.0


