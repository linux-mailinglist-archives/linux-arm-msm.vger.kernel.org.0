Return-Path: <linux-arm-msm+bounces-99826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFGdJaC+w2kRtwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:53:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2A32357C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E763313AF5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCD83BBA07;
	Wed, 25 Mar 2026 10:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLFZJPce";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibU6wSrj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39483A5423
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435478; cv=none; b=tUDX0qa16anYNCoBNEVPm8LgGtc1H0TnGMo7w+m6L/lDwMJ351sGFrV4c++hT9kVG+b5zl1fp/ekQlCIw98Xos074fAC2nxJoaHdNwlBbyqdA7xacDsEBwuU1FSZ6oB1HN6Z1d4egt+lqJfIvdcqM1x6JwRUGMbsvfUnaSiOjps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435478; c=relaxed/simple;
	bh=1g/d5t4YEJn3vzLByvqFm7wSQmFj5knlf1Q4e1jTPPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ktN/9WOs80Jt4xuhN9H0mTwu++KRPsClYeUw2VuqPv7Ey8ZTqhHQAXVvgzhsBb03Q6PD6BwA/TdIu2nTyiuQFL7lZP4UIHyM/wfBqZl7LxbEV5I4HZaFt+ACKeWJ6enkb9x9+MaR+CxQrUI0+oLbDBUehPeDgaCpV1NMtpgu4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLFZJPce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibU6wSrj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PA4Yb72932155
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aCnhiuUucRtnccc/6ZULQYlbkRL3io779F7
	YrPH1Boo=; b=NLFZJPcejrH8hZPD4qaFKq5QKEuQacCmIFLMUNqI+WeTxMB2Q+b
	BisiQeeDqr6t5WzrlSAMQevDGQdJuFFQ744wovH2QCyUH8i39MJFIWUIguZky9FL
	SQERvfo7gER1/J44mIoHqOL+q/DpQxCrt2UX+mvZfJV/94gjv3jp2z0Ol9AuI7wA
	QJo5w6aklsnoV1DnchWwjpgE4b3as0ACSwAWTpYtjBRRBFjuQu7nv+LSv1PTBWHz
	wgrHLM1b83re/Un0VdJl4jJjInKDKb/7Qpc8kNnqQANIlzjpB8Hl8V8khxBFLfoY
	QArD8wGOcSNR+1wm4zN58kfD1dg9H21dIPw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmpr584-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:44:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c675116f1so3618232b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774435476; x=1775040276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCnhiuUucRtnccc/6ZULQYlbkRL3io779F7YrPH1Boo=;
        b=ibU6wSrjK7zMQBMwFUGaeF2eJfNsab82zA1Zs0n2qdsdk0EzF43oUK8oFHE3+fSjcW
         3hOrFvlqggfQWDNVDnjGEHJgzoCHMD1Y86fbqk5T9OGpl9jslq/K9i+kjwZSOtnn7JKs
         Ta19NgO0eLhrYfQS2pIeIzcXP14k8zfDSUqX/O5U6Oab2RgUl3XQ4p2LYeKaBTINaqGK
         51jAL8hZ90Yc2nBdhYOwMnW6aLyC7GEmr+UxxaLtra/uJAwZ0tTnAC6rvGf0HIW7F3kT
         XyYDV5vKklMagAyVF2oYuyzXLf6D28E/vK6Hg6n4GeJ8mExb+mcWRCFKnt5oloiGA8vR
         AihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435476; x=1775040276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCnhiuUucRtnccc/6ZULQYlbkRL3io779F7YrPH1Boo=;
        b=fav1eNDGE0WvVdE7+DiRd2F6JJfjoJVQ8KjRuxLmqJ8+0DHOYGpsRV0DDgA2RFJHF8
         r/opDdd6v1DG2vaeToCwWE7bUTKEHAXHmqPF8xe58jtS2R2TRiFotOiuBA7Kk8UJbVc+
         eFOc+dvaXffXdqklWLPwV+nFaG+8GtlBuf8UeKb1b7f5j6Be6IqeHCpBS7Cn+akMG9mb
         tv1yaO1rQfR4QlZFYsV7NV3Gb+t+hoSkJam7K+UGrza+4wJk00TvWtG3WK7FOIkCRquL
         87RnV00+dTq3o3llnEkamm/8pZzz4bEqdBK7wxqW4NHIpL0jGH4u6iHmlrWp4RB/yKg8
         parA==
X-Gm-Message-State: AOJu0YwoRlLPfgWD8m/L2P+hxmT/U74V5ZtZwo8BxuantQAOxGlHxgDT
	KvxFGC5mn61/EgnQn/5JUcv8rOmjG5VtEN+3TBlGx3ztP8KxEluSdDOzZBh4CWBD2bYZLr09lxQ
	YUtbqZtiRPVHX59D2urRf/CcTNTOsZS0ImtUl1ytt8/I46rASUVpYB0ZX545RE82LDSpxdReFfY
	eY
X-Gm-Gg: ATEYQzw1r6w7SfQvZ6X+F36vXGJBjIS0D5gY4hhJaboHvW6fMGhfiSa0prAUhFerXe8
	9FCJkmGi/v1y+b9u3MJg4LCTlrYjHebNpDA0Dm8/dT+VedsQ1MrZlR1CSzt/KVclSmpnkDgx/NK
	UVfiX7hgWnM97v7TeMHQdXQj2wFcQcxmdi8RdzxMNEl+HJbi67fx3yVfnPvwVQ1H5YGush4DwCY
	kJLcwASuvWtsXZT4uqbVEzi+9OC6DEJp1N/d78c3vimlNTlcO6jFHaTqzrQfD6HGOhH6cw5D1r6
	cWmKrKWmtQrUikl0b4uiOHjVyCnxx7qCn+cmZTQ76tG0/v7mRHnSozvMz4pJCEuwXxlTTwygWtI
	dVPyjukT0gH73vStKK9eEaaAdpbIjnrswbB2z
X-Received: by 2002:a05:6a00:a88e:b0:829:924c:3482 with SMTP id d2e1a72fcca58-82c6e0c86f9mr2995336b3a.53.1774435476273;
        Wed, 25 Mar 2026 03:44:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:a88e:b0:829:924c:3482 with SMTP id d2e1a72fcca58-82c6e0c86f9mr2995305b3a.53.1774435475725;
        Wed, 25 Mar 2026 03:44:35 -0700 (PDT)
Received: from work ([120.60.74.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409c6besm17867251b3a.32.2026.03.25.03.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:44:35 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        yimingqian591@gmail.com, chris.lew@oss.qualcomm.com, mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 0/2] net: qrtr: ns: Fix unbounded server/lookup messages
Date: Wed, 25 Mar 2026 16:14:13 +0530
Message-ID: <20260325104415.104972-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NiBTYWx0ZWRfX7pOwx0ovmcvM
 Eh8C4ioTeBH3JpOyxJZpLpL6NPV0clrB3EeLEVodtfrUVRT6eH0T353IwGhOIGCs33DMNB6OC9y
 qKfO2Oq8In6m2X9uXHQzTs0UXSLprubkgrUkHOtOazvOGOxsmc+jXr6g5sEXAhCDOKUGpClfGyZ
 Glbxq5aazusK2AaLAS0+YZBq63ogHKdRTGivRnnM6ycevELU/FfHNDhwpV643vuB7N+kNF56Ksh
 qCZt+SjhkoMd+L0YBNH1kTOETP6kZgk5x9WyiSpBSM6sxtqMhM3k+Bpv9VJuEMZgky86cCs+KTy
 U8hdj0AVmtU6TcDciPnW1hbF8HS8vjW84eG2g8fTSXggQtQrwM1JW1g6ZdDNEE+WJF3y54khS77
 +XU7vytksQdKAfXAhqpddjOU5qW5L7dM11dqZsNegO0R9gZlENIfpHEm3apL8p9oAWeQ8FjPJwy
 4SQfVI+QtqAOw76L+rA==
X-Proofpoint-GUID: zmSRy0VrBbdxuScix2P91k2tBBEf2PK4
X-Proofpoint-ORIG-GUID: zmSRy0VrBbdxuScix2P91k2tBBEf2PK4
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3bc95 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=DfnuZq+CPLWApegUcJV09w==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=f4Wm403AlyDKAX-waN8A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250076
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-99826-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DE2A32357C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This series fixes a couple of possible memory exhaustion issues when the
nameservice driver receives a flood of QRTR messages.

Manivannan Sadhasivam (2):
  net: qrtr: ns: Limit the maximum server registration per node
  net: qrtr: ns: Limit the maximum lookups per socket

 net/qrtr/ns.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

-- 
2.51.0


