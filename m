Return-Path: <linux-arm-msm+bounces-116732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fjJfFnaYS2raWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:58:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A557102AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:58:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BsIT2GuQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hMwgHxXz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116732-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116732-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A2F2382AD22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558BE432BE2;
	Mon,  6 Jul 2026 09:40:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DA733B6F8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:40:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330808; cv=none; b=XLPd0eMnGQS2to1C1Ydz+DKwxfit+RBxP2pHKXPHzGZKQdcCKhnkMSTGXO6Rinf3xZZUr1741Fnu1TReMHzhMOFm0NiSPF1aXi3HY325xCAr479v8R63mP6M/zTmCtXLx17AA2rgxpIJiC+EYLVa3lGwNb92f4ApjFHF/AnXiVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330808; c=relaxed/simple;
	bh=4ZvYWEuU6Q6/l9s5Hx5u5DDikp8elqHiHSp+w1WZKkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jree/dHQ/0hEnd3sfUFRARx8qPtalvqpXaWKPLvZ+RL5wOK5nwVhqGK/fMZGpGb6KylwbJj/6wGZ8vxJmfu3Rf/WSzCWBgrizxu31bJROj1gFkHTBGxWKnsxbLo232Rd3lw8pIRntcuPx5A0tdEABGDPe04OTTrwc2F8Rg8vkFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsIT2GuQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMwgHxXz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693xHk4108111
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEK9gjwtChv5jazBqtF9ypD7rf/tLq/hPM0yu6oilwI=; b=BsIT2GuQG1ritM+/
	tmFl8KFLuHM3/dj9/2nKJTaLFgxEseRjk+rbBxvnarx/gzr8a+LOwAKl394mYJLV
	Nc5dgzRANHm/RX7+KPoo7+sBAuqH/fRHKFefr5Q9/9GslaVAouqvTEoLh/nVdkK3
	MHmI05X97L1eENILTWyCutwGvUKaMhRkNFj3xGFd6mXZUhboSb/kEKvDIej+Gjjk
	y8ak1WmWNDVAN9QFxrqnwfGh4ADQYvoRB4lz8ngEKunXP80gjziCQc0homnaeZ+x
	PjIbpGYC99Je6bbK36JZ7dUvNZ3xCKdN4ZgP5nhdDyvF+qmqpRnGvbYLOOsjv0BH
	COk6sQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrk70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:40:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e63df032bso314034385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330800; x=1783935600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEK9gjwtChv5jazBqtF9ypD7rf/tLq/hPM0yu6oilwI=;
        b=hMwgHxXzhKCb4Ih+0l4MgOyVSzVRpToMWm/UjoZqL2w90XRF1ehi94zSsYiNiZjjAD
         DvooS0nSD4TSvhnwff1FTsjepKIPf5RrcvN6s+rvTuL4OhBbTNimEZY4+tlwFPvZZL50
         mRQkdAjNeamJsS/eNRDLDCmjblFnf22V6i3iNs6EURIEy2GnBbnnsaJUsXwq9xfheLBT
         q77Xj/2YivsNdKxEzktuoVeV+QAzd3GCzlSX6ytCbGUifyejOqKbilQDx20V6j3zpzXy
         Ayrr48SUQoCLh3PXJ+S/7qpSxp8lPFbSbl7AtM9QNNgvk4BlunobQ+vESwIN+/x77lor
         uQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330800; x=1783935600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XEK9gjwtChv5jazBqtF9ypD7rf/tLq/hPM0yu6oilwI=;
        b=FjbF2dd2qVJvWdH/FLffW5GMSeQGwSmyZDX8K8I7x6Odh1bHgqrRpGc781+6JoaCei
         dvE6BQLuz74Y3gbcUQ1gkV/yVZE5tOhj9XIx/VsjZ3rixYHoa5AtDJgFundOiT6gR9i3
         r8E8aBW3jmYsEIvABj7t2PTabWJ+mxpMmWrBAf3zE0KhvkQLcJZe9qZQh/0cQ2r1rfYm
         Vr8uCHJpNZuuro5gwAFgM38mian/YcQZUGXpUy8IFGs8GKlncJFpDFfcBnO9yz/sZ7PG
         jMNo87+SYCJOfH1A0o5fSWSVlD/FiagIK+972MJmBWX5TNTPKFqzid12rU6Zm47rc3mQ
         wuNQ==
X-Gm-Message-State: AOJu0Yx9P3m0XD6XCEFmrmtHRrEycsr2Pwfyif5tVTjgV47Sp04IOOdu
	f9cGTJ5KubEh/TT6ZvhGuNEaVIFprnd2uY/Mt5DYae3iKmikLZq+AIX5ImimwpnpuQ1nr4pY+vK
	Asp2vJBkFQzoC8eFc9VrEQkPGsOpv20IfVcK+fYNsvBShk2de07iWB61qyNhJrJdtElW5
X-Gm-Gg: AfdE7ckQjKXVj548sABUf1NKhvflgETD9B1IKgHu5HvnV9qaC0AhQoyr6A//FUe1LOj
	kQSYbIkc/m4irwRKwNMz42V7sBypVUynR1d6ej8CHeY+H0xRvEUI03smgMT1LAo+ksT/FDrZs27
	OYpNZ7iZpNmyqaafLQze+Y1ORa1dwV1SvoH5ZlE4/l+aW4jfEC3boUgR+fwckdx5XWH70oJlAT7
	52x4/KGb1cdzYib4g2Ib7r5v4mkm0H2iYh0aSpAcUskwHOgnXTusQu1g25AmoTBOfdeQ3gNH0Ib
	ECAK2hpP6xmI8M1L1KKeHh+N/rd1fKxbHVHmScfp4PGJ56AqkQzQwq6frss/D759e6VSCTrIC60
	tdd9xeTrrZdZFnYfl9+HihwS2qGMneaETUTE=
X-Received: by 2002:a05:620a:4054:b0:915:6ce1:3576 with SMTP id af79cd13be357-92e8b504b64mr1791973385a.20.1783330799957;
        Mon, 06 Jul 2026 02:39:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4054:b0:915:6ce1:3576 with SMTP id af79cd13be357-92e8b504b64mr1791971985a.20.1783330799475;
        Mon, 06 Jul 2026 02:39:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb566csm259144095e9.7.2026.07.06.02.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:39:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:39:46 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: Use lowercase hex for unit
 addresses and values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v2-3-90c781ae0417@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4ZvYWEuU6Q6/l9s5Hx5u5DDikp8elqHiHSp+w1WZKkc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3fm+RWYDKXl2AJyBoodiTt2U6QW660ti4fkt
 zvb67rtfrqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt35gAKCRDBN2bmhouD
 1+UjD/0el+9thrcJ8LiU7LrsjRg46mjJpJMK05twxZaxX7X3p5G8Tqvg4H+mqbyHhIJ0rpqPKD+
 g5Nm17QMtD3okeR6gC2KSMrkKfwZTDgQ9LNxTFfbgMb/eA+RnFeDkN6XPS6jX4gcXZO3u+4N1Et
 DzbNAfqY1rMS1ILnzLfrKLX35PTat+CC3qRLw51wsSQSYKiyHvxYuyv1jefgUZshrhoF7XKp5/x
 ZzH8oOZZ0MP4U6ra7e0r0gdvOUZ6J6CycFzNbKWaMtDm4eBQPChpqkWgTBx0HAY5yhgyA43IUNQ
 fLxxBAUFWKcyP+REHbI2A1Zb+jkeBbkRydw8liWv1A4k+U+SjLfB4g/gmelRQgOrdLiFbszWu72
 yjgrOevWyKIUZ1c7XZz3B+wvJCdjSkJAogjOWcYc0I5FVYYQCH4amDtHjeWqA4ZKG8qhzt3m+Ik
 6wS7K6BA/ybiWZola9A6bVjGHjraKw3mPpEI5HMCNd7/t73qjCaVQXaB2WfYJ2jzS3l4TnHc89L
 H1KY3ZWdS50JIBvSwhRsqkmt4E+exaAZzO3IgnQfUVfkszmYYWCQxuyu+5hPJ9ha318uGe1iKNE
 VPqkNeHwVgdw/V5upOnowUdIhsJlJCXBLl16sS0rX5AoYVqCE1b5b+MEjZAam/Irj313PzK4G1K
 Mu7KKVsR7jdX2yg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Lkw7_SzGJhqkXhJE3t9b2XsfFk-kBG-Q
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b77f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qNKHm867MdwR7kzYylkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfXy0N3XeG5JcZ8
 u4Yiv/VHzZrLm/Jw/i5qjckwz4WVFVN3qsW14NpWFM/LxjuUirCO/pTpAmW9JiNU7Sbh3YCKI1s
 1YHuY/qtvkkHtVT2ODPMIL70aN549mc=
X-Proofpoint-GUID: Lkw7_SzGJhqkXhJE3t9b2XsfFk-kBG-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX0erKUoo3GIoX
 aUuxaZ7KgFADxglQd/rBU5BabH3N2wOW48ADR/5jTNdqXl7TXpg2KbugPta6AW22/2xEfJ+H/fb
 TnBkGk2KaA6Q5oVdsdKENLQo4vdOn0gB+mBKgP8yiuDnvWHC3yGWx+/qCx/z+FH3TncSxQIRfq4
 gb+FWhq4UBA5SWO0X0e1WObtrLD3YPmSvcHEmuJWHrWqiRL2QgEBbeiPcZxl+KvDmShBJXVInZV
 DbkRcNbc9go/nNmmkZX0kxC1bjpiACYHi7zN0KdAeWap4aCIrqEMb2JWKTFr9wcNhhweJaCPuMM
 v4q6lySspsjDM3QZ5wq4/Jota/KWDTymKGvwKTMzy1FeYDm4qSmGsNxLK8FdczWiaNaTd4Tr+Wu
 jxWvCyOlEjws63BYF3nFgFBg2rhK8tVXCcfwQiInzQSXAtfOyETrXaW2qwjhmXIRUKoRYj125iD
 Jex25Zl5kCziaITwBSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116732-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77A557102AB

DTS coding style prefers lowercase hex.  No functional change.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           | 4 ++--
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index adedcc6da1da..1a278503d340 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -591,7 +591,7 @@ saw1: power-manager@2099000 {
 
 		nss_common: syscon@3000000 {
 			compatible = "syscon";
-			reg = <0x03000000 0x0000FFFF>;
+			reg = <0x03000000 0x0000ffff>;
 		};
 
 		usb3_0: usb@100f8800 {
@@ -1241,7 +1241,7 @@ pcie@0 {
 
 		qsgmii_csr: syscon@1bb00000 {
 			compatible = "syscon";
-			reg = <0x1bb00000 0x000001FF>;
+			reg = <0x1bb00000 0x000001ff>;
 		};
 
 		lcc: clock-controller@28000000 {
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
index 0dd52cac0e2e..7206a33da279 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
@@ -15,7 +15,7 @@ / {
 
 	memory@48000000 {
 		device_type = "memory";
-		reg = <0x48000000 0x7F00000>;
+		reg = <0x48000000 0x7f00000>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index b2dc0327dff8..9368fd6b8751 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -66,8 +66,8 @@ venus_mem: venus@97800000 {
 			no-map;
 		};
 
-		cdsp_mem: cdsp-mem@97D00000 {
-			reg = <0 0x97D00000 0 0x800000>;
+		cdsp_mem: cdsp-mem@97d00000 {
+			reg = <0 0x97d00000 0 0x800000>;
 			no-map;
 		};
 
@@ -81,8 +81,8 @@ slpi_mem: slpi@98700000 {
 			no-map;
 		};
 
-		spss_mem: spss@99B00000 {
-			reg = <0 0x99B00000 0 0x100000>;
+		spss_mem: spss@99b00000 {
+			reg = <0 0x99b00000 0 0x100000>;
 			no-map;
 		};
 

-- 
2.53.0


