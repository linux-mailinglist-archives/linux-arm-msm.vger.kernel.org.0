Return-Path: <linux-arm-msm+bounces-104719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKnwODpb72llAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:48:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86073472BEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD3723038785
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2933BD22E;
	Mon, 27 Apr 2026 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4onTU89";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWPD7G4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA1C3BC669
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294008; cv=none; b=E656t+24ViIuk9jM4z7QQ4q1vZiL3/X0jHWKtKaYoCAh4I42r/auQ2pQCMYdSCJUlmiLm11b1s/zwialBRWzEPcEMwnIyjQTJFMGmEVUEIlYO6SMUfMU2pZl6XmIlX6iZR1UOEjRfq9XCPTFAMqKQgsESImLVt9C8c9NBoBJEiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294008; c=relaxed/simple;
	bh=us+Y4Cb7pFVSLnADy916NDIEoYZAuE4XXB6lyTKrzXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONb/BO9BmpdD5zpciHAuZM1xXmTEJZ6zir/cGVeHIS122c3Gm8laQS3snowT61MOi0SMKGdpxRo1B60wfXVypBwwKes7CvQJdjG6lXuLyMnxZv7Q/dJJpv/OXjjFS2RQVEmof1TGtENuhM8TqmIyR36F+H8hZcrO9LljLHiOeAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4onTU89; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWPD7G4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TB3T665673
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpAVUiE0mWNRiDxsSieW36zbJskMY3EKSaK21P2YpUw=; b=d4onTU89SjGFIA92
	+Dw4xpZDQ6Tg8GvDUi2FEzcjwhlE8/TfgV/Xbt4kQIXZuyGCzxwEcwKjw20gItR1
	sh/trF/BOGYFIzf4SgDVFnMxdyPlKitrZGfdYGFB8bYucbK+TlTKOzHN+pzMCfHE
	OLvldclOEfDS2Ynh4Uu1SD6I3JvGYsPE3P3rEpT3D2/NhM9kOYqgr/5qoxZtXrsL
	mBK90fmUBxyOKJKv2W7CNl2IB3YzexdKgMxIQfT668CoZM+dSVmH+4+VHg+i407k
	j7h6Dg8ne/Uwj9h0hBUJu/3yJfC+Q+Wct+UwS2g1iCJbecYyY7/OoZzVtF2txBK9
	e18EFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n1d2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso270492241cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294001; x=1777898801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpAVUiE0mWNRiDxsSieW36zbJskMY3EKSaK21P2YpUw=;
        b=JWPD7G4jZwwfw5gCpH7kwworxGE4Wg8pOPtCfc4pQ1av8UpwNVAGtMaN4ch+xOBY15
         Vpo4mXqDWBe754KGWZ06IgAfOdXw9121TAxlH1R7WB+MEccgFNQSy2fJJ+t8suS1qhlb
         WVFLqCpRpSp4N40YQrjLjhd1J7p795XebIz8QuahxqX5gCZ8s/C+nATV+aSIUjDHWaJE
         UbQMpQcObnpf1KaS48ijKpLpkRXfawdVB46gXBiHT9qaN4gbzWSAdZ3/n8/qzCpEMyMC
         C3CgoQ9ZC37FB1LHoTJu+4nqn6arEIfkxIZZhFLG6E99DCgWKkeQM0mCVVNpvW4jrWHi
         4gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294001; x=1777898801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpAVUiE0mWNRiDxsSieW36zbJskMY3EKSaK21P2YpUw=;
        b=JCI1ybSsJFcjIQQD8j0L1/+xWlzAYfM5sDW8rFuqqp/yhVhimDfOa2JaaQg/yxGJIz
         OyPI6BcjybT12rpPkN8UjBXV6aZam6unlcfzgu0fNNG3boiaxtaqXNmX8/gs9MZTs7vi
         xDlQ0eFY0UmzCCiCtmxZFqLz8minuMJJ9C2k+x1BwybS17aq3lUJz00S/wx1i51ZX+tG
         n2O7cBhjU4yT2Ru9DdvAydl25Bu77hDmiHBdHPQlyEcguQg5W0M5u2ityvcoFusjXaJZ
         cp6qTdoiSsIRQFGC0AwOgLqZyb47wjbmEyuLC5uFCV8trTRtjqdSbN9zChvP1Vribql3
         8S0A==
X-Forwarded-Encrypted: i=1; AFNElJ+8iD88+gnaR5tphfjgG6Vf23A5aIp5EcH9S6sAZcpE3uS2mh/vP02h5lKhverZu7I3OaqMgEJ77rf7srwZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8tLvVhKBJNsX2pYia2ZbqCInF++7fr+AMu9Ny+YFJj11WKXL4
	ZqyzeVRCKMu8GGgiWIg7p/rzTAwltfVtyAahLRijwrdA6gUi0fG8LKOgZEU3slNV+2cK9ZL0Zvl
	ttyi6wXEgbXDwNqTX2renKgvvT+3T0r97SPI6fdZbOmvfcMr7uUfhQJ5qVQrSGKmjdiIM
X-Gm-Gg: AeBDietsOF4ZN1JCbpe2Tt6Y8dBVsoNtUSv4wefOuzfKIiHD04PpiWUG9gaqlGuFc4C
	tSuKpyp61vWo5VydX0rTui2+g0UsyOgwPKQ87Ht+YeJ27rEVzGUdaeahjACQWlky1mGSqUM+QIC
	MXO7jNr99XwshveCX7JAXsTM+HNU0FyaQV3NLKCBhKkfB+0RSLQBej4aQrrYvnakunxPNKWQr+l
	4GtlBM+Fb142WtwH7XUthxwKp1/MJWC0fKSVsn0M+/RuAvZSUCayDZITaYj4CJFxIhr7Ed2U/iv
	czd22IP8ctTGgiVqvr6FaJVU+9rXRcuISdTymED32ZXqyYwjZ1ugr3W3ONjrsLPkif/DqsIwCiK
	1t4YPYD+Ms+pmcqeLKnPawxvFv8+8vH/1ucmWiSKEWdhpR4uqsdIrQS1LK9D6BvCm+sfRrHTO+R
	Skw9N2XlxRrVg+cfh64gCyk57qW8A=
X-Received: by 2002:a05:622a:2449:b0:50e:6399:eed4 with SMTP id d75a77b69052e-50e6399f879mr479265391cf.27.1777294000907;
        Mon, 27 Apr 2026 05:46:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2449:b0:50e:6399:eed4 with SMTP id d75a77b69052e-50e6399f879mr479264881cf.27.1777294000497;
        Mon, 27 Apr 2026 05:46:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:30 +0200
Subject: [PATCH v2 03/14] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-3-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX6tWqqLEaLL89
 mnQjI49dN6bdapXTMmr8viL6MvBG7yEwYMxfBG7wxCGEbcIT60/8A0ilFQjcxN0Hv8W/+IzTOVO
 Nu71vM+aCaVeRfO7dz/GhpDSFvcReODfWKhkA2EqxJF4AaTGjJtR2Unc5mrJQz8w2QcrRzI5TgJ
 ZN7AiiNqLdLclDNtmmqJm8oTPPSO/pl4PZ7JhvFj0xhvURlzhxYKhQGK5UzvrK1qMnbZsySQrfB
 Xn0i6m+svlN9nLOkjI7Zo6j1q6tkgeFejIE2CsTvy/Kfz6ym1+ZHbytAKEPPBupVCWasa9quJwk
 YvQKPXjgy81s60wf9H7ctgIviUp2aRBj9BUIrk/8CDewfsDiVhB9rMmXZTX5rKMG7c6s85i0nCe
 K8ugKjxJMQTKnhWKjZnMMyoFWYutJZmTnrTFMVNAprzYjadbYgSq/xOpDwGxjeokwwfh5o8yb8O
 3MQlHWsrH0p1c+RcLEg==
X-Proofpoint-GUID: cpF6IECKh3XtoSrValvHIhdXIdLCKy7s
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef5ab6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6k50daf3fveMbYCwvhsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: cpF6IECKh3XtoSrValvHIhdXIdLCKy7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270135
X-Rspamd-Queue-Id: 86073472BEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104719-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb and axi clocks with their appropriate
nominal rates so they can be managed automatically through the PM
clock framework (both are part of the camss-top group).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ca68ad7fc9ff30eae23d3baf34cf1ca642acf9d7..b2b0afc3fb5f597622f9b4ebfee2ec6703bf0890 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4846,6 +4846,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { { "top_ahb", 80000000 }, { "axi", 300000000 } },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1


