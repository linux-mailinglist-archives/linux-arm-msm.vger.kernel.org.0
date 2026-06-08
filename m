Return-Path: <linux-arm-msm+bounces-111941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j8UYEAAIJ2r5qQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:20:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81975659A7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:20:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DqzjkByw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ix3XFUaL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111941-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111941-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5615E317B659
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 17:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8213B8409;
	Mon,  8 Jun 2026 17:54:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D791F36C5AC
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 17:54:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941246; cv=none; b=Jn1dELf43Ez8j4/evzSK7xVeNbbaXCF4SbtSAkndZof/Mulx6geleGXmFy+pyroys2HRCKsTMkFSLtV39soeeVdhu+JHRXxVTaZr4215wXw1/onoM8I/oC8rngesQxOF6yxa/N207gN0kc7RD9jDKLrgE33Sq7wX4g41JZ89QJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941246; c=relaxed/simple;
	bh=bDkRxLlAlWZzxLQ2Kt6FCFRCVafDaXMIspOTHA1osNk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZFfC5fMQYY63kJf5Yen+oW3ry6seOnxlFvfOxJr1C9u2ED6LfjjZFdDPN72FRcRZsS3fJSjdsCMm2VwjppECezlVXdKi+/dWuAoz/WHR3gzuqjKvts3W0MshPb6eUbGScwEe32huDoMXLtJxbDq7jqRoTFNzim2oY2XzPbb9I6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqzjkByw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ix3XFUaL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFdu84008662
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 17:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QD/j3wLGU+hI+sIm6mQ03Pg2eMQ2R+PhiKW
	/UfMvO8s=; b=DqzjkBywaXpmDRmTfbGxzmEjQjejGxcS02VMBgjNdRG+x9RKFSX
	sABR0qUhhYWCfdrFuV2fagzUcIeMi70ElnT22Qj9yoQoNZr/gWVyxx0ZytXPvgRc
	sNNzIWQ1cRZ1XCyKX5YyuSmlyjodjwUuIa9Vke6nQIizxEygsPBtt+DJfJ7fLuFW
	OFdORLgDXOfEeh8WJK4FtfBHlevLliKiT89gKSSBT9iK6P/xGx+XCA9e16Tzsp7Y
	Th6AbbaOlENh7Ez7xhmNAY1Bltbk27pUtlZZeofIBoPr4mCcUsNywJ9CrtAymSwz
	GwDPKuh3sLKQ0SrLnStMgqjd/x8Mz+mi+tQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0jghy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 17:54:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c1e112dfso64711735ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780941243; x=1781546043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QD/j3wLGU+hI+sIm6mQ03Pg2eMQ2R+PhiKW/UfMvO8s=;
        b=Ix3XFUaLodxvYhLA9HSXX0i7NlFGt+/o4M5PYTVoMhfeOeWZ2l+mD7gDiVEyv0sjUh
         Y+fjaRfwtH9D3m5CTNZNJPbXbLHA5Bt+MRj/YH5aIMyf5awnRe/dxHVM4DfFAxGsEpeX
         +P7jl4vKFTWcwPBswtA11Yin9xD9qguA6SZLgBLrwFMqJsQf+3ccifo03oT3PL/gg00x
         91I5VP7biI8V6KoFV8Mm6TUyNq72+n5HXxXSfA5jxVoy0UcDzfY6ImLQw5uCJnVVg0wr
         yQiENoobnDPx+eAzCphJguUBLcK3SgyUSuZD678uiVFMSOCEAUumJYqeJA0aKE9SY56e
         tpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941243; x=1781546043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QD/j3wLGU+hI+sIm6mQ03Pg2eMQ2R+PhiKW/UfMvO8s=;
        b=fagdHZ2hT2QsBL9vZ3aPqvDCQZzL93iuB/oRBsnVraHgPDFnXEC9fVtozTi9NKBwRB
         wpcq2BH2PuqIMQDoLeAUengD6nOM1CoaKh+5Dd0EQFtjESH5cey74pYSMz5R0COYxSjp
         auHCJYkooz66xRC4uobrtVS0FFc+Xx9MVUs14+qk1e8hcAKkAyTHzzMXgTnGztBzsqI+
         CoM3d8XvG7+0BaGxgcAWNLSAXr/wQTSrvYgqv078T3ZG0YYe/k9RknLbLxX+fok6i38n
         31D/0Ks0TFcX2N9zA3cXXHYuMrThK1TcbBBBvpJyzo1a17z7SQeCl0H2qPX3p76tglPv
         n4xA==
X-Forwarded-Encrypted: i=1; AFNElJ8j4dMnXmP8pyYshnAqxWQVKgTvBoJF02vWFeSPiDOzuQn1FNT06NvT6DdXNjVJshhcMGAb9YYBUHKANp7S@vger.kernel.org
X-Gm-Message-State: AOJu0YyXgKHBUSUrvSN5OE4sJNyTVz6yrWXJ7K9RYX6fA+K1LIHVobB8
	9UO8SiqnZlPb2MHBgCSN9m8MkiaIMuGMc/c6Mfhlc/NJfVs2JQc/tK9/Re5YLuD5Ss9K7Bg9vwF
	hyX+IipchNNTms/bs/GAONFb9G2QQx5C+0cM0jfK6MUAhcOJE9hw6jN+u7t41aWCEf0Xp
X-Gm-Gg: Acq92OHt8ZcD94UETBJNYeayFI+7daOO1/s6FwbQ/+RlTFdZ32V9mpWj1UMFdjkL8ym
	AB2zwLHKXxtrdgUj/LiLxgWJel7i/YxViggxQBy6VvqLc8rTyyE0j8Ua6aBc7uFS79HmFjhnIfF
	N5RHD+hZzQxzd//XfYlS8O2NBefAJxogGuc7QNZJNIugGalYQh+jw00QxB5j+rVUEkPmTgXeed2
	MNrifrop/rlU7ApWD1e6VQDXDp7tJ2arZK/5o5cTajbQrmYzBVd27zkPI25zyJQIe//+CCDCqzA
	tBYy6ykeJJkSRpd1+WZNxT5t1zhP1JIM2JXys4sGIK7wYW/mb6aHYHDzfZwxak/XeF93t5cCsxU
	YJQA3hG5hN9Z0Kpp7qyqNTuSnV6p0fMwPuPTfiInhf1Nkx9d52UKhMUh5WCZjvBD4KPaV
X-Received: by 2002:a05:6a20:d043:b0:3b4:84c5:45d0 with SMTP id adf61e73a8af0-3b4ccf35b24mr18718833637.27.1780941242861;
        Mon, 08 Jun 2026 10:54:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:d043:b0:3b4:84c5:45d0 with SMTP id adf61e73a8af0-3b4ccf35b24mr18718797637.27.1780941242382;
        Mon, 08 Jun 2026 10:54:02 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm18975720a12.19.2026.06.08.10.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:02 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v1 0/2] soundwire: qcom: add support for EE-aware register layout
Date: Mon,  8 Jun 2026 23:23:43 +0530
Message-Id: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2OCBTYWx0ZWRfXznAhasNchMVf
 IKmUGbQ1a9gjns9xGKq1OZ8CmQ+VrpWoUfFeVYNVMKmLI1bjUZ83a/SbRUvBsFWba1nr+uLzX4i
 FixPYEglevwP8loAHYqW5xiABmbhphA34q+Zrpw60GKNi5NrNDuC0/JNSOREdyDFFopLfxew3BH
 taCRAmOd3XmLCTUDGDf8NOHDZGPzRIAEDjkETqovQ7iXu9P8dxDrmVrqStu/lWcC/EiNhwOplEG
 eK5tkKmJfLUXBhY3qqqaosKnSOGwYboi06gQZxXXyt6+IBxmbhkGMNdJCQh35A0n/1cplvJQBRX
 Ud4jUGL9RRkJCv4YGCiJ5oCy5ZxiE+G4NV2H6FcliKxxEsMo7CKriT/ZTD3xY8dQ70aaUQQwZwn
 ctJO8vBcEp8ZSJbSoH6oILwiuFCAM/xZAtFLrH6zkaJDQeq6eA7ozOKYgtlWMI8TneLSjFnaKbH
 DelbSWuXctnfq96et7A==
X-Proofpoint-ORIG-GUID: iRI0Pkk3cPQNaOzVeEH6vPv6p4a1qPqt
X-Proofpoint-GUID: iRI0Pkk3cPQNaOzVeEH6vPv6p4a1qPqt
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a2701bb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pUmdQMMffi5nh1osYxcA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-111941-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:quic_srivasam@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81975659A7A

This series adds support for execution environment (EE) aware register
layouts in the Qualcomm SoundWire master controller driver.

On SoundWire v2.0+ hardware, some controllers bank the interrupt, FIFO, and
status registers in EE-specific windows separated by a stride of 0x1000.
Typically, the driver assumes EE1, but platforms like Shikra have the
controller routed on EE0.

To support platforms with varying EEs, we:
1. Introduce the `qcom,swr-master-ee-val` DT property to configure the
   target execution environment.
2. Add remapping logic to adjust the register layout offsets by the
   EE window stride on v2.0+ hardware.
   
The first patch adds DT binding documentation for the new property, and
the second implements the EE-aware layout selection in the soundwire
driver.

Mohammad Rafi Shaik (2):
  dt-bindings: soundwire: qcom: add qcom,swr-master-ee-val property
  soundwire: qcom: add EE-aware register layout and cpu selection

 .../bindings/soundwire/qcom,soundwire.yaml    |  6 ++
 drivers/soundwire/qcom.c                      | 78 +++++++++++++++----
 2 files changed, 71 insertions(+), 13 deletions(-)

-- 
2.34.1


