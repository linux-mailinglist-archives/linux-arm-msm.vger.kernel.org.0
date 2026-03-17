Return-Path: <linux-arm-msm+bounces-98082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFb5LCv/uGnpmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:13:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0652A4A36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 896523017036
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB61C3876CF;
	Tue, 17 Mar 2026 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsKWoIfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxrhjO6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D083876AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773731610; cv=none; b=DkV/SluhvSY+H6Jj6VhrdQD1PodXqhkGzZJjSg/CTlCIqLhaC9rKbPcoOFykDDsqTb/xvN5/Umem1V2TQ0wdQP+KePW4nCtF0JQ+ePe8A8hfzeVD4XHl82X/XGVZPB2VAhywEs7xy4rVQWpepisGVNJRNl/fdcAowSa7Cl5E2T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773731610; c=relaxed/simple;
	bh=NaBGtM8UhUW/KNbEDu8GNMWOcshBLnrQ4JGGVJDYpoI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ukbNL/6O40lNH3j0NH92n3E+ye6SOQSHC9VgF15oraRdsYNxnjRyB0iYggfA8wtpNzUliaSmdDkS51xTB/0YdJzE/XhBNBU9QhbD3ud1doN+ug9tMm+lKLA4QHsvwaYGm9j6wYLKNPoN45I9Xr3pnfSepnKTjsyH/4OzqQOpRBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsKWoIfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxrhjO6v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H5E6Su1428842
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=em01N4mmRB5sKowyoNAik7sLPqHDR2HjvdO
	4vhrrRtg=; b=JsKWoIfyfAjJmKvLhTS9GG1JgH7lL22mawQGQbihwa6F28Aejod
	75CglexQPKAEVrqzbcx1OvQmB3Ut19sF3Royv8qrBo5kL3tB33JvjrMgJ4fHDH2o
	Ol0vrZFkdqnyr7vsFmU0K6CwmUofUEM8xkLppMhD+DeKNKEneNLSLknkOpu1VKET
	0/eivGHrFXedVe9KpdQz5PdDlfLuMICtp0CCfvVDM61jtL37Oy4q7l+dMmIFv+60
	sWvPwIGv9l96pz6VOXKUxQevGe+RETYRXP79lTFtAptSpeK0MJcbU0ArZU6WlsGj
	lqt+SSRzgXLZZOIKtV+E6dW7A/yfGbdwU3A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99bmjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:13:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35641c14663so6223573a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 00:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773731608; x=1774336408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=em01N4mmRB5sKowyoNAik7sLPqHDR2HjvdO4vhrrRtg=;
        b=WxrhjO6vWTO1YdXvhgKdJ01a1T3EEJDTg2Awmssiqpp7Jyk0oQXcqzD4mYk657QbNP
         j7X8I2c9CQfcT3/dZQ/1IFGexSPc44ujXDqoTxr/FGlxbNtj/AwH0frrfkU++eAC2KF1
         3x9FusA8Nby+ScAxWtPpN4+HY6sPpPVn3kRRJxazz2T3EtQ6Lx/yHlV95mJ0U2NoaLM0
         ncK/0jnSJMXX9DgN9NREs8KfCMkNnWytZiXyCZpGqY14YBm5qDnoEWy3hu49Yy1l+5I9
         A0ENoYBh4QvDeGH743n2Yigm/YdnxZVGi0fj2oVr8V8pQPXdTFy20nMX3TPqQ1R1qDLp
         5skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773731608; x=1774336408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=em01N4mmRB5sKowyoNAik7sLPqHDR2HjvdO4vhrrRtg=;
        b=Umydot7ztGAOcbQLxiFj8KKbwxglybzeQmLUtveGd0673EFVo2DD0+2AhHa7n0hP99
         X9yDQn0HVbxiXHbuC7Q+uHuQTZJ+wRyhTMSCd20tvNZ4AuFrOIcxTBAy2Ws7aQmc8guA
         k9xhHzNT/y3CN4rb2+Ufn/kJv1gH0DAF/2wjsE8HK5xxPQMARUdUUIjP1AbM3yk9LSwF
         omlFl/SNVU+jFtRaSiilr0OXxQtq42ax0IG5pHDC+JrY1QcqXIuK9xTU9C6jl5JGOs2M
         aC+PhfP0DNwvLhjSz03GfbUnidBMPiKCMbKG+cntPI39TVxT5/hvvRJE0A528WbGuJLU
         BZuA==
X-Gm-Message-State: AOJu0Ywp+jdgFf6keBWjTD0aO+Y7E12Wvi5guCPW48VgmIkmCeuhiKue
	DffQUlNOofqRbfwzQzAKRZ/8S0ic7J9FMG1oY1qx8wVmLebNild6liwy/dp1VXaeJuFkEhJqEr2
	CgfB/pNYK+YhT/HVhRUjm91fhgjJZ//YKApK3ZpRz9HYh0pYRutMOx21Es5ZFJ7OPT2vO
X-Gm-Gg: ATEYQzzdsC3R2txc/J4zYoaSxQggN2nv2pgbQWRZvnt2BUIcVz2LQ6Gbi3YGl5bgEuy
	GoJ4KgJz+Qm9y5b27AcE6o/4G095Jb6agOwwOqHVeZmcBp85+okMIrFozQWGFGarKio5UAKfkhI
	9A+hOBeDZrYeVsHMwscgxLyv9C89wVcuJwtue5HWqAYJoWcQji7p2OwPi6+ByaevBizmmwsqGhd
	Vn2k5IaXH0sy+R+Md3MQlMoYkxOmrshABaiOp6pc6o6a5WnUpbn6qQbDcJGfemQYpuKWWaSudqy
	sO5puJ8yzUr8bhAr3pD0JMIvJGCKqOEVoXQJqdtL49z1E7qAx7mNJ2NSRbf7OQO8ZeCJvyGijAV
	OxNlmiVsfaDVB18PbMwofEi4c5Rh6gOz41ejY707g9Y8cbiHooVP2aZMoi25G0Wqm
X-Received: by 2002:a17:90b:1dc7:b0:359:855f:ff96 with SMTP id 98e67ed59e1d1-35a21fbebbemr14056864a91.17.1773731608357;
        Tue, 17 Mar 2026 00:13:28 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc7:b0:359:855f:ff96 with SMTP id 98e67ed59e1d1-35a21fbebbemr14056846a91.17.1773731607869;
        Tue, 17 Mar 2026 00:13:27 -0700 (PDT)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9d6fe68asm2563184a91.6.2026.03.17.00.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 00:13:27 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH 0/1] Enable UFS for purwa-iot-evk
Date: Tue, 17 Mar 2026 12:43:10 +0530
Message-Id: <20260317071311.1696361-1-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b8ff19 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gTvuN3wP4q4l7ERkiOgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA2MSBTYWx0ZWRfXz05cxgiMDcGr
 al9ZQcnc8ZTRSDF6mg+afJEy8ecidhxLiU8dqrNp8AkglDqq/iAJe8H6NST/LrXSmSaFhAPEwTK
 9ScX7znhpx6vdBHbqyN33sqIvIaAi86TDinoFxTqEj5JmHP/SQsBs0btAnPclsGm/qbrkPS1xpv
 6J5Axjg937PoSemNH35hmYOE/pihkomShpYOYCjAAPhI6u1ISiMIliWzGHeSsNsI/kfx2pQN213
 MCAIxIsNTu1ZTDrw1SYXclKUE/B9z6R5FGwgyO5bfZTC57diKEbmydGW7e5z5Y3k9y926XvGhsT
 5Qmj5NH5tvDWdVeRWNfb8XBCkEhL8BetjDh4W590g6WVSbj0N/oVMvK5/sCIVjI9iTDaJqXTUmL
 gbr1n6AgGfusrZEuKlER865tLO/XnEcYsZcqJoF35bi+30F8QuBtnGgqHiKDzXhDmBT7WTsgEAn
 WMQ2uTT+NKYvncYHwFw==
X-Proofpoint-ORIG-GUID: qAUpZk0h5iny1cDbKKsDRU_IlIYOTchm
X-Proofpoint-GUID: qAUpZk0h5iny1cDbKKsDRU_IlIYOTchm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170061
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
	TAGGED_FROM(0.00)[bounces-98082-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradeep.pragallapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E0652A4A36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable UFS for PURWA-IOT-EVK board.

This patch depends on [PATCH V5 2/3] arm64: dts: qcom: hamoa: Add UFS
nodes for x1e80100 SoC
https://lore.kernel.org/all/20260211132926.3716716-3-pradeep.pragallapati@oss.qualcomm.com/

Pradeep P V K (1):
  arm64: dts: qcom: purwa-iot-evk: Enable UFS

 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.34.1


