Return-Path: <linux-arm-msm+bounces-86913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3648CE8C8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1F8F3001619
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 06:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4B22ED17B;
	Tue, 30 Dec 2025 06:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtSeVSJU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ba4o2XP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B932EB876
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767076119; cv=none; b=oTV8zrwDsDe0FAMFLe3qteSu/6ll92KVp2Vi5FNIXFUY3BI28waXx/YmpfE3OoBqb+u/b3IHDUnv4m/ZzqX24EviQTVURaOSH23nqB1SoVp33n66QqClUqzxE9qK88AR1Bx4thgdCiUU0VoOxobiOFPiKzYrBbQzVb3cCV/lmEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767076119; c=relaxed/simple;
	bh=QnoTbZF5vc/GcIjvMNBncP1FgB9QHcrB5yBjc2jAW9U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o4BvvFfVGUiqzO6ABzta33ny19XgFdB5APX4BR4I/W1ONOgivi6ojQHDdrsfHP8BXnT6/g3BD/H8b/I46Cbqolx+Z0qdA4oiusZvywz1vc8onaBANk4AomDvyu/Xw0N3JqrGhMZhxsS2PBgWs/2MCXwvCfjy3rdcWDF0QNrcGSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtSeVSJU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ba4o2XP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTJrSAg2286694
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2gzL+morhvxfoUPSphDTxDkgMVT4wyQ3PbJ
	AvLEIUeo=; b=BtSeVSJUEZVh3f3YzULe3kqpDhPJ05pKoRvVunLKBOvlU8lOpmV
	NMr/o5open9lQz4N6cWuudpNyJiDQA0SNoONOughQEMmVLKBJqubT+NWuMWLj2lw
	oWN6ht0Q/mDcdekQqaNiFr9yAXwz1epHXu47egXb3q9+F2ejqNS6s/nPxBXTCuXr
	LsqxvTw/15cS8TgmVPrIjckomXXKRuYhP75OppTpLpAUhYX5r2BkLdzQz2wM3WXY
	a6bBhIY/cwWq1ah6JKqsy0MkLTBIzxgsZ5MZXHTjq4wUI8jemiSszutlvaG1js5z
	Vx7EVfSiE7DS+lZE7l7+prE26eJ76D0hWlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gs2vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f177f4d02so221621845ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 22:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767076117; x=1767680917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2gzL+morhvxfoUPSphDTxDkgMVT4wyQ3PbJAvLEIUeo=;
        b=Ba4o2XP4JtQhdjkauJe/ccj57fYQBGFzWDiAHYELBRQd3UtSr0EFFW/ikb8IfYthLU
         eP2Kq4UNwllheNj7Bnc5IQbly2m+Zc42l8dkJUhqXMtCbf9mj4kBc5f0kX9ay1MaGLjT
         u35ghabqaz7wpi+LSr11TX+tgp5vXubbIJri0bpMTHrmxavsdkKatnpqr9w3i7eoWTQL
         Yk+PBfWXiE7pBmozd9EsOhN0uq+m1yf3mG4rBUMqHBBjDe8IAPTTNdZITj3y2fPEQe71
         wS0lzoNdy+J0QPQhIzAoQIV0n3YzFwW77X1xDBE0lj7yS1CisKtOj/q3pi4Q4RhfYNwc
         ZKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767076117; x=1767680917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gzL+morhvxfoUPSphDTxDkgMVT4wyQ3PbJAvLEIUeo=;
        b=Uu7AxqrG6xzs6E2g98IJlL1KJfDDN0cC54co6MlmrbROPOjYr2Jy0+2JPe4vTSnQrL
         crZHq7xuIw8w6VEb1DNNgF75L5RlCBF9nfT33NAQCQDx+iBBEM2Qg/eFdDJZH7loSELT
         C+zyZl4YU41gbPCRJyt5JiTHx5zToJf8ZeWVb4e49ix8MewEyzr5onkUJSXgLyBfIXdD
         4wdAmRXCxlZfcP2UO6glvqvmZU6JiTV2Qw3lt2FU+cU1ohcaL/b8edU1sON9kScVfQbx
         P29keaS+JpJWQQrjs0osVqkhL1C7QA1cTz1eCSRp7eOrgIb8fZ8pMDs2j8I/j/7Qqt/N
         TgVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXox4cVU0pG8Jbx/WwEODqeZEQjAACRKlgszD2Ns4STUjGZSGQQ483hfdXmHwO9RSjTiDnoERqRE+dfiRC/@vger.kernel.org
X-Gm-Message-State: AOJu0YwxKwvVlTKMWt8Z0socDAmLkk5hoyo+z1wGLlWi5UVP1js8/v1J
	UXiNZHYBVGhq60HfEj5ZRJiHLswrsFBVfLlnp+vEAsor37GnD9yxKL2rOoEhFmT/KGs/5/b+yEI
	TIs8GN9YTEB0/bhRGxvbWPm9XFQH3qR8hNEbyapyLtmJY4zD99DM9703ymX6vEJw9ivKe
X-Gm-Gg: AY/fxX7QfAZ4syD9hdtSkOaiv5GHkqTmEpzrUTM3OviObJMnAA4zGrtH26LqfHd7gcs
	F6KWaOFwEe9t6gxVLHgTWa88eCqWfyKgLZ7CZgaM1OAhXqvl9KjgJuhw6caaGJnzDe5tSRyRW00
	vJhg2t+iLiaWZFgWFmJR8O8GOK3qKGdeyl2Y/HMBh3HrCE+YNhBmSb34c4+ePxJdpRr4TBbmjsz
	7M2yl29xaRErH2g8bxm/MLntOXie+U8i6Ph3ezfbhnTAT+3qjea8RvAzN9wQvL/NSRlm15rmPKz
	5pmNdbDjhmfbEkv29h+3vmErKtQrj9GXDLY10vJ603OsxVrT/A5OiNIBHKkunq+jTtDk73aaDt7
	LJiGwlZi5Y6BTQWfgyvfCsoU9D9naH12Kf+sj6ifh8g==
X-Received: by 2002:a17:903:943:b0:2a0:a0cc:9994 with SMTP id d9443c01a7336-2a2f2833076mr359789105ad.47.1767076117085;
        Mon, 29 Dec 2025 22:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKWoEDEpUIbuA4wOjGKtEu4bp/ZAZJLkcusU8f8d1u+B9Xfn8/4xtkSBgzZnIUtkExo2w0DA==
X-Received: by 2002:a17:903:943:b0:2a0:a0cc:9994 with SMTP id d9443c01a7336-2a2f2833076mr359788915ad.47.1767076116642;
        Mon, 29 Dec 2025 22:28:36 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961b4d0sm26491536a12.5.2025.12.29.22.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 22:28:36 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v5 0/4] misc: fastrpc: Add polling mode support
Date: Tue, 30 Dec 2025 11:58:27 +0530
Message-Id: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3bSK9or__hxCI2pvlovlJfPuIVR8RLLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1NyBTYWx0ZWRfX82U+UypDBtuk
 yR0wKOMYZ4wRLNzeYLr+m5zd7PqzY35PDXWBILMQVuDqsef6qQkiTJK/xiIFjLMIJLnvcUmCcwo
 Kv2R6Lk8LWEdh9bZ+3BDA3Qp9KmzK+Pn0yp4qOWVjBG18l6E4fSVRR9Dsj4xO3L+s6q39wRpdjA
 0PE99utbrOviqFPFHM8KNn0OwnZNSEluiVOhK4/QNR/HcWid2xLPC7Zu9bhwB3RSySEJgAQVTRJ
 m+7kfXzgDA3NLfinr/fWimKcE9GRc7LDYlrKUAl9q059MnD7mQ4XIIgApgYik1Bn/66li7+uyQ1
 fY1TRIyTYAk6o3rRxwuasvXni4yp2aCtkadMBWPSHLD41WFmS/y/GVz22lEaJqCA0zlVsrukSgC
 yH0vfQbKMxShYv1JNCddMppfJhg8FWI9xrQHaL/+h5bJP0LWb4U/DFbDfOUXA2BwgeL6q/AfMtG
 qI7E6e/bLEFy4hKeQPA==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=69537115 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=66tqkxcFYQ9a7oDX834A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 3bSK9or__hxCI2pvlovlJfPuIVR8RLLM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300057

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v4]: https://lore.kernel.org/all/20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com/

Changes in v5:
  - Add more details in commit text.

Changes in v4:
  - Replace hardcoded ctxid mask with GENMASK.
  - Fixed commit text.

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (4):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
  misc: fastrpc: Expand context ID mask for DSP polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 164 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |   9 ++
 2 files changed, 151 insertions(+), 22 deletions(-)

-- 
2.34.1


