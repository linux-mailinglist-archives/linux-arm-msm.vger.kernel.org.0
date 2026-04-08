Return-Path: <linux-arm-msm+bounces-102303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPb1GuQm1mnYBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:59:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD83BA2D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA1DF3019F39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6405D389E1A;
	Wed,  8 Apr 2026 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxoUxSFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQxZSKnr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DC837D12A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642331; cv=none; b=f9KFPoKK1pyOeVaSRd32k4h6EazvZ8g0wATofO0AiAsvYgzAhh2zxqN57H+oyJywO1iK9ahBAUvahceUzoVwuSoDhlzWlGw6pmpgiphX/uUS5K2x+8HUu0fysLNftyEaw8wyTCl+K4ZybDKL0WAv8yFPu06deeYMfYfds5uHfUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642331; c=relaxed/simple;
	bh=HdDvtn19+g07S2ZeODC0qA6hNHqqCE2Olch3JOf0xdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hTYxiRTfLc44ourOTkFQNFnNtmQulMlrhLw/B+ydtYwpzzte4iyJ4EyWDuV11MM9Jl8ieNhubxRDU7NMRmDcAmDEqqkSKCNy2w5xTaKpDgnc++U8CIrRdQs1k8nSH1W4uJpW1JU8w3wcw5h28o1Eu8YTPo5256YaKqWthWmUr4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxoUxSFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQxZSKnr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63875s8Y2860424
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aUY6Zyvi5XUAqPvNpDpsoj
	jZctQ9CzCDJGHbfUL9eyM=; b=QxoUxSFfO/pOXSbpWAXGrYK7xK61zmjMPFTCiC
	XVDze5/Hc3qPmlWBZUHTfjdwQfCEtyibEqkrm+akCPyZMu2EuqH2XsZZF9ktk32F
	oVpzgzZNhIcjLmj6foxyz8lTlcKwKNEk3GlLq/sGjwQ+bniHAqVE1HKtjPIDMhuq
	/gnXi3aXDXgiMfBA/EwvBLs918pKF2vYIhyaYPlZcICjzw59n3nVXUJJgjS1gHsU
	JzwRYM0G8nWmLig3I2Fc1rNv4cOg1oGPX7UeRGf3YjI4SpwybyRZ0yjaKuANrod4
	uhf5JUj1oP926tA2YR/QCusY0mhvFE3saPNBDGwvwUECetmQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8t6nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:58:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso5795262a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642322; x=1776247122; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUY6Zyvi5XUAqPvNpDpsojjZctQ9CzCDJGHbfUL9eyM=;
        b=NQxZSKnrLFCoBFUh2BdnZxCaozF32GVSBafIqgm4e/JpwxpkN8AvsqHaE94hXqcInS
         6cXFiOekWT6fQ7tXnHI9pqwP1Gkl/VFrwo3IW1SezGP4sVodg8okK0b/8sa7Z2sGp9a7
         259MgTW0FTwwu+K2W1mDt35ZKEHra+GZ8grimS3iEF5lv8hoNuofngSDQp+JT3k/ZxXN
         TVimT28T8Jq2JOjGRtgqRkZqa09zl4MPzbfx3VfQWGIR7RT/FPvfeNG3R9FyU7gD9mAd
         QLH4zwU+ojTao1rPZ8bpS7KyeCenoKQApsuXt97IyExUQeUU0iegeazG130250Jm3bVP
         xb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642322; x=1776247122;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUY6Zyvi5XUAqPvNpDpsojjZctQ9CzCDJGHbfUL9eyM=;
        b=WfjzeBKcSu0VdF2MgnmInBkaQLnmKifmTASNi+asEG7BtJiPRP3GwVs91zqVbI9wzD
         aNIyZM+NnSb3DUbJrdgiZKU46chPkABWD50pHhhoHg/8msyGPeo5FexVbppw/JHWaK+l
         JEQN/u5/I7GSELM0+IgyY4WpprI9eb7lG97CiUi3RPJ2YjTquSY+JNsOMsfaQYtBISpy
         Zlg/h53Bz/iE/E/KzqMDokTMiB1OZ0sLPSQOoIotbNnpg5gG1KXvJWTS0rNhSQ6q+aKy
         4YhHBJP4QYQtQftgM4HKVPvqu0YffWQ5StReeZEw5FextQawZsnx4OPBKU3zgju2Jscu
         LgmA==
X-Gm-Message-State: AOJu0Yw6XK4pDWqFRrurU6mgrrJK34wpBcCkG7l0I5qr6dGpG9VPmen7
	u/0i6iuO5VQo9QFXCRa8tDpj8sa1dyCYrSHIFdXjIjiVAkqW9u9VB1D7U2pFSlEfwlyj9pKs5kv
	cW9I2RbeiuElZndZbDA8rT2vnMNhSGEuG2+85XEz9PZ5g4SyqqoHfFiLzvvceF7D8S5MG
X-Gm-Gg: AeBDiesp7hk1OP+nkBmJnKvX6knl7saE9pCdS9sFsh7CFIxHQZ9WNo9pAaH0G9yW7qP
	aViD+SreIl7hudjmsclXJUK2MDwG7OcsUoRiDOt+QcqmM2cDdRwept2PgQz+I6O4SwACRPNJi3K
	CXkhAe7yhzJCoe5FfM8YB7jeQifeAEVQXXQeTIz9CSNTxzNhyGOM+dmbhsWVGuQ9BPPO/0Tioci
	vYMNkK0cno5iZaNem7c57sLcwGldHweutmlLeC5HkUGGixzVrWWAybAW5soIO9YhTgg8uGwsUZ+
	0jo1U6xGnDLfSbMBZju9iBYGtn1qlFnjLbOduXkdNIf9j9jO0nrFVm6QUa2/WNX7DTnRznFWwHX
	o3P/JqWkBr05PSjzpaFmDUHJqU+wYp0yMD5FAIsg3VT6ypIXouxIdfw8AGOGCIoC/OpNkrcXZC7
	A9M8iO66HoWIdTGvY25vy2ljeiy3m3RYW/9E1oycvc8hVmDicrZq9Mg3by
X-Received: by 2002:a17:90b:5585:b0:355:35b0:8b78 with SMTP id 98e67ed59e1d1-35de69a6545mr19325294a91.27.1775642321687;
        Wed, 08 Apr 2026 02:58:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5585:b0:355:35b0:8b78 with SMTP id 98e67ed59e1d1-35de69a6545mr19325260a91.27.1775642321188;
        Wed, 08 Apr 2026 02:58:41 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm25445663a91.8.2026.04.08.02.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:58:40 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add the SoC ID for the Qualcomm's IPQ9650 family
Date: Wed, 08 Apr 2026 15:28:33 +0530
Message-Id: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkm1mkC/yXMTQ5EQBBA4atIrXXSLX7GXEWkQ6mmZoHpQiTi7
 hrLb/HeAUKeSeAbHeBpY+FpDDBxBDg0Y0+Ku2BIdJLrVH8Uz/8yz7SVCS13orKyIETTkDMOQjV
 7crw/x6p+LWv7I1zuDZznBUCL98xzAAAA
X-Change-ID: 20260408-ipq9650_soc_ids-597ecc1aef1f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775642317; l=576;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=HdDvtn19+g07S2ZeODC0qA6hNHqqCE2Olch3JOf0xdQ=;
 b=Q2WekfT6KZUysnM0AeBr+4PKj+oGuW2dUXwDuJIaOwYVpgM6t6ipn4gPBKejjsBuXBvULvk3B
 MJ0f5kzF4UYCIJAvZhjLXF1k04Ff/xBNeobDvDhjWjvqWZR2rpK9rOb
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: jAnlGOEOICahEfAFtWb8Rad8ht35Rs2q
X-Proofpoint-GUID: jAnlGOEOICahEfAFtWb8Rad8ht35Rs2q
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d626d2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=N01T9IvMyzn-mJD6WhwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MCBTYWx0ZWRfX8E/agFsbX6ZJ
 INxwI441UX76YjCMjhxx3GkV9nsy50ddBodspYg3sndfpqrRSmEBycP4ipVsfWY2N3LMmK/m3QT
 r6u04PeJDmZ4HQziWTzkEEHbd6WRqKcn+72XyoN+TgqQp9NLhgS+9m7QiBcoBjXkyY6QuckWVKc
 Ru0okalvAWp/1McYscvu5aA40wleIIoD8P5HkZypEWDbkpSqfWY+TSn5sfMrm3wRwUwD5B2Qdyv
 s7zXQo+PGz/qEt2/B3gx3dDotx0YoeGfwXd2MBQQGp1lIcgE0L6UnaAwzCejyOD/lOB7rZa96/g
 QpA/1ppgUF8eEdQBEvtHaunkXogD1iC3Ae574uhSsvcEkzWFru2ODOdQUwu8fPrlTjMXyIBlFKJ
 5EVTr2P7cU4Cn1qzpHjDplpl7INH4TcZaB8PHPFgS/wQXueSE3DWRd1L0F8MLPwEcNYCde69sSs
 tUc+UpF5nJg4hEGBzZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102303-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5BD83BA2D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: arm: qcom,ids: add SOC IDs for IPQ9650 family
      soc: qcom: socinfo: add SoC ID for IPQ9650 family

 drivers/soc/qcom/socinfo.c         | 6 ++++++
 include/dt-bindings/arm/qcom,ids.h | 6 ++++++
 2 files changed, 12 insertions(+)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-ipq9650_soc_ids-597ecc1aef1f

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


