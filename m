Return-Path: <linux-arm-msm+bounces-116520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XjrjFWITSmp4+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:18:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A83F170968D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:18:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Hw6Uej52;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=M8ghNPQ+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116520-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116520-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89F28301E6FD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D0D36DA0F;
	Sun,  5 Jul 2026 08:15:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457336C9CC
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:15:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239329; cv=none; b=EZ2mNvIj3hrrl/iYymtjbWTLlYuGeXtrr9/tCP3gItK/r7tc2jGllfF522DnVgE9B0jrm95kPFYmEadslZcH6YCqiMQZ7Q9not+pvCNbPeXQ8kVeozvTMbbvdao8fWSueyKlEp79Sw9A+CpOB0dMo5Kp39g3QKSx8yR2itTJCog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239329; c=relaxed/simple;
	bh=VxVfs90+RVyIFj8A0qDzTyazRfecJmozpZRL0X2Homw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y61ZwqzCFjeJcXsjrEXQ6t3G4/sFx78ubKQx97TB7+tE6ftooevUVaYNYgJ+Jpk8vzxoGZQhmE5E8TbLEBnpdbqMXGBL0pVPhDkwMsJZH+WeUZwZsRX0PGiJZ3kYrhsLWbver3oCGnLKs0mgps7gQL5CB5WCg5qj0g0urRb8maA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hw6Uej52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8ghNPQ+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6655svd4894868
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=; b=Hw6Uej522PtLL0i7
	AAjOq6lllFv7kxd6XU77DgLv0U/97Vkz4XF6yNeEzalbgTu1BPmgeYEeTpi1yloQ
	CBNAj58vinX1TxVcisvmbVu9dccnNB0z5ElUpQXwK+r9XRRv9/2iHoyQKSYEWvXA
	eWCKJGepkjhAIp7/RKAVbKS4IKtYxciDkj5YrtrrU7tMI25IvYfPbFitM/xUYqJV
	bO0NBVcCOpXJZuWXQGIjkSJkpf9jzFqyUQixI6IJsWPWH1+TfjTfmcbD1iHP8KYT
	A5wBo0jYfeU/OfUEGoONWXF1bAq30ioHB+KzlWwHdSr2I7MLQXRkR+4VnUKanfpo
	SCQnCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgtnj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:15:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso33801305ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239327; x=1783844127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=;
        b=M8ghNPQ+7B27FI9JZ+L7H9F6cbZpnu0TxSimAOwX6Wy20PWQjJ7YciQzaxBft7tOZ2
         1DGgAQZVvRYTQcdLVtAxgDK8xkUApbRrY/z8AMyxJiAXUvzIP6m4zw4D0BL8w+Sxylu+
         OZ9m+JktMVDdRGh7zkB8G9SN4G32zWshQoZqAP3AYHhZEWW2DzZ1E5aQyJqdugaacf6O
         y7qcaKGQeSwKSHlQ3sfxAIDPUbj4y0nldzpaudLHhXqlF8UVoyDWH+wJm63hpAeoT+4b
         hLv6PqIGqYSw1PJpr+URMx45j9lY7wVr4cf//BF0DkTIQLtOWRhz84IfXGhrc+HBk/NL
         WBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239327; x=1783844127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=;
        b=e1T/aUBwopwShtoS1WNlI85cJp/d/zagx2Oy6eCe5+n78r8Q7WW98TlisTD102REus
         NrNFx9Z49aJVwjtIOaK5DCmTNRLq7KeHiTFRuE+ohj6pEg2C0bw6KfZBaX2ShkJtOcBg
         Pb/N3l21WFUSkKVkhSgJa8NZNrFsFleGSEP7G19jz0lx+t/g8NELs93SJaM3t5cjXydf
         M1ANMKt7DYDvE+0UaT/IyHAqLiMLe3UJBfErPIcmXY0KDJAVYc9LIFHO+1y0FIZ8f4C6
         9FWsILgPR4p+VTQPaO/AsEvnnZssekKLIoaSBikmoxDQr6I5EPI2c7cNPbc3NU8SYZKo
         DDSQ==
X-Forwarded-Encrypted: i=1; AHgh+RoN+Wi6QGMuUm3flk5YPJ0HnbVD8LXBc9EEecRl3H3QQ9tV97jotkm5IS1K5SVsaD+dBPrAmAh7arGN0Wn0@vger.kernel.org
X-Gm-Message-State: AOJu0YwVz3NATGpMQR3nIzAqLbYcYgFDYC5LjKjSLVLwkm5Z8ibJmMZw
	3dBbt6VPcv0Z4YbDCzLZNuXUMbZmQJi27ofPKMstNuENNKzLx062ozFEwlO+bfHPoSh77jm4bze
	hjWzyoxiBx2ua2NX2jKtTeTpIBpLyir4WcCp5r8G1lfGV4K491EB2O4IvQ9/QN15Rl+4y
X-Gm-Gg: AfdE7cnfnHUQEGetfb5iq33nwFJmQFl74B8jok5M+4D8OGEU1ZteCPcQZAvzr4DZv6f
	jwN7FdBZGVf62E85bEA84XmYlr0MEoQBpYlIZrfTSe2wBE5HdFWYxLC1xNAjSqvNoA6ldwo3gCC
	QR7jd/b3xcUfKQfwAcpSwRpat0Aqlv0GxhUZy3Ul7NhLKe4RZlAuTOPaYpC7Zoyme44xtSiOFk2
	rF+YDMK/g7xnTs8NzIWMezh65NFVLugMzxlb/ZoF4twnO81NvSmBXgCPsnFVs2Kd1Pa6WoHbHiv
	NEKDgp2V37PhNp1cDnNOGYSL/f91I7XQvgiOJ0wj+rpccwwupMXVOtxNVkeHnMsR+GZCgr7Etlv
	V+RwYH8HQjlSEyr7wuPRc8xsLQVBbuPCqiWI=
X-Received: by 2002:a17:903:22ce:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2cbb750dfeemr62830325ad.15.1783239326882;
        Sun, 05 Jul 2026 01:15:26 -0700 (PDT)
X-Received: by 2002:a17:903:22ce:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2cbb750dfeemr62829785ad.15.1783239326208;
        Sun, 05 Jul 2026 01:15:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:21 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=2286;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=q+INaEIUNj0EXeDmcw5Jx9wg9/Og5BIcLTww5DoAVnA=;
 b=MohOZP5BSd7gGPu51pY6rKeL5RRxBoIVIbOgZlIdE/wHpMOl/l34w/UKkxBV+hgg0MnC/fet9
 g1adGQtY8KCBh/oGiWWKyTQqqhJ1+0LNhTQDsT9Ph0U7ePkTzbEp3qg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4a129f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IlPRAfYEAefbqxDJwzkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: nQWtFfZKiETGak4O5LZToTlNUO2LqyIv
X-Proofpoint-GUID: nQWtFfZKiETGak4O5LZToTlNUO2LqyIv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfXykYNQ/iJhizt
 3dS9Us/HaBvQEkJ8msf9o0osas+aopOHhFTzedHJiPPiIpx3I2JL9G/BLvWxIYCaR3hDCmHVJac
 iVx3R8aHlDB0UFkY6XXMcevWeLJP2p4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfXzFXE1vTtSX2n
 FNPm0fm0RPL5VxqGftjHg4fv0dr9wizQdv/QWdne2lZOo5BSLGAUgXUOdStF+WhaXtDz4gRqoSn
 BeuHqelT6T9gyzv9rBF2Ah6X2w8DNbv81JwDh3ro2a+BqIQlxkD17x1Ce4y/eGHOk/sYEEhr38o
 ewuP1GnmXBye0pIX3R8gkdZbkudA/lfm15axyqQ7YVsk20+vlfHwlV6at02isGBqqWXQzon7F3u
 5OfcJoMnc8pB95+bdcEk1pxN9laIqD/pfZXF+PnP0DpEpUs8H9/VC/7Xll85L6WpMTeHtotsNhc
 0NXPWN/PvKvnO1mYj0opr/YdfYFdlimf73AA9w8+0xT/7TV0aR307Z8YkYHxyVhOruyoqwX+8Gc
 2wLosNgRp6grAM/rVUGBQQpBS1sVOsFzkPNIQ1KarWPjcPdTrQMwgZywJHcJ/fwautb+8WOHUzN
 /Wnea72NN+d+T01dmKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116520-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: A83F170968D

From: Abel Vesa <abel.vesa@oss.qualcomm.com>

Add the nodes to describe the GPU SMMU.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index c5635f22e2a7..e5b8377e6c3a 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,eliza-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.54.0


