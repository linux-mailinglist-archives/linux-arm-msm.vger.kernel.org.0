Return-Path: <linux-arm-msm+bounces-118586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V7/RE+myU2p6dwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:29:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B355D745302
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:29:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ut3y5NeA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P2lI6y3Q;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118586-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118586-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8E42300E723
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9956D33FE33;
	Sun, 12 Jul 2026 15:28:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD593403FC
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:28:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870134; cv=none; b=YA5KTwPP33TJnMn+BkKQ8+aD6yu743cvnavG2cClds3Me4uob4KHecNvsl3bZEY9ymGuXAKi2zxcBEOISrExRysfqRW9OJQGFU1mXg7xY0DbDCuAuWvTAxmgmS8ejKyVaMP0NBCGdvSZnMcMXc6ocFSAP7kyZa+XFKKtj4f0K30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870134; c=relaxed/simple;
	bh=n32F+WQzySrIX5iVbHz5HeXrQoNod4+w3vtYMUcs8Ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjCuhiJZxHjGze+uIA8jXQf691mZEhU84YVG3Q3rr7Ar6DDcBDfxfCkiKzXGXrg7H1GGxnB01wIDBv1UudkRSo1xkxKdODWdThbvBo6xIUxq5BDcnYoMYB7Gi5BVA7nvNxGuy/3kfOSe4REZZ6FYKnQPBcjY4LDiPzPfi0wvGoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ut3y5NeA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2lI6y3Q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZPmk2489122
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=; b=Ut3y5NeAF0rGYtcj
	hchYAZL7FKat53pHpzAmjyELB8/90R2RsyYUcO4GOhabKssk3yrNZfBxMrExpHPq
	yy9BtsuApFRBTijlp8qecrq78jxbQGnbIJGuMPsrCi7AzexQqYPu3+5fsTSGBip6
	IRwaUNbb9eiTxevoBBSzfRLEUFCXU47MGTrG9Uu65/1y3a03hyw6RTvx28UNI/w7
	Pqp0vBj88HXCaBW/NRFAs8asvBkvdC3/2gv5iSXdViYOp/VY9EAlgwLENg7B6tkt
	uEYVyg4v6rmETEDpVhtZeuNaSqj8jHUgA2lX4IOfqK7rnmPwVRRwiLGExE1vONkF
	A6S9KQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gjxqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:28:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so3313972a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783870130; x=1784474930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=;
        b=P2lI6y3QE3WS9WHgp0nyNoEAyaGvvhayvkpZxQ3OZnrm1Knbv1BYudp79gQKxVfiiB
         Pv5ExXNnhTaSFYYew6JOeUCzVdHGFdpM8TEJfyMPOVh4jenvfYWRK2AUr/AsY40xAMeW
         l6Gr1FWyTQM9Kp675HpbfnDQeHojzbx9MEKvpEYoVuX8QaKFj8rR9TKs3x/DkHqE2cPe
         1uqQwe3rgWMIPOfFY4a8bO/GEuzPZsD6PpXGytPlu/wY0yuAKMFMsX0p4C4FLPsxelz+
         HdDANN0Xi8lYiqKo0Z91tF3+WtHGr1Re8nlbpu13Btz2MQEGT80o9pzb+aqeSf84AEuN
         xvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870130; x=1784474930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=;
        b=l06wSiE+1d5B+oIIsOMBxSwl9N4sGIJqSMW3N/GIOn93CjaBWblTvwypGqMBstX2Dr
         t1WsFYlozUIYBY2gFDRQSuk1//bZxho/ZThWrASh4FHSxZ/JfD72LG3EodIkIxjxl9Y5
         WkXZCl2K+KpFcF7pQc2yoNXlEhhMgUCPXs1kiXNYSJEZMHF1EOCHxDwerfP5zZxS/zxu
         IqLOVsEyC6ATh3dQvAotp4xpEEygH4Llfu+FNIuBKRNcPuSqG4EHtCzPzD5+cb/LSN0f
         WFWbbDUzld/C/ELyzw6dmzzLQtckaO25aTBQwO9EffOAkhdf9K+QiBw69gIPzXw1aK53
         +ddg==
X-Gm-Message-State: AOJu0YwJtWBoMF/4scAWaf8x9wAUAvJ3tewh3i1/+btuXlCa46xOpGTe
	kVgfaDCyaWo/J1dpB15CHGnbTQFSgBr+ylCPoElkO2DSSRNVtpSWBbrIRW+NBdTEzziQOwJ1JDJ
	N0kfVPM5FJ5oz1wkyvP+CHy17uNnbQyvcOsdHCAa2Irh3jxNVY7sHmWlN9PgQTHjvdOsO
X-Gm-Gg: AfdE7cm6oJqSl1IHN3kBkLK8LCA9pe5OOrVR9meAYQ3a44RNJAfnVyjUg88uk/rQX+x
	swyp6W+2jdbzzwd8HPVE8DnTLtQe+YKj1PTYCQGWeb/0vcdSPS2GEHQgsbavhq5otgR+tKpqHON
	Cs1OqKQwbGMpgL/6l5o5yvW7CujhpOizWlpNCr3U9rDKD65ruWdAJZQhLDVTCm2UM5Q3Wb8PTc2
	jOj820Prwn5h6iTNIvk1+RYH9BpOzsGyat6DncMAeJ/hW4FQs7jRhHoNgJzY+LKDMTNReQ22HGW
	9Vkr5T74kq3pRjXSbIYNLWjcWTRw14Q5mJo7kR+o0zHVXSBIn4n16rxQmsjlFGvW1+LVI1Kz4Fm
	HY1py95oLjDOZynf3heCYp2U5ZVvHBQbaLt6NnkqLVJTP6TnJ6elMX9kV1v+bPwXIatChjqmIvE
	bC7fB9
X-Received: by 2002:a05:6a21:b8c:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3c1109e29e7mr6280584637.3.1783870129856;
        Sun, 12 Jul 2026 08:28:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:b8c:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3c1109e29e7mr6280577637.3.1783870129458;
        Sun, 12 Jul 2026 08:28:49 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm41458776eec.24.2026.07.12.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:28:48 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 20:58:34 +0530
Subject: [PATCH v6 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy
 for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-usb-shikra-phy-v6-v6-1-1b3e51bf1541@oss.qualcomm.com>
References: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
In-Reply-To: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783870119; l=953;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=n32F+WQzySrIX5iVbHz5HeXrQoNod4+w3vtYMUcs8Ls=;
 b=ryjiLCuO2VfGEfymQNq30j8UDQcwYsa9Y14VCb7mbDWBTsA3QglgrHbzkDluT8+b7c5oTYcUN
 QK78T+bZWRICYSYsb/V4KsCUc94iUiuVTDHjdwp4y6f9V0+KTJyC/lX
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a53b2b2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ybcDLLt5cEg1GZjoCqQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: oTUtUX-BCmXzE9IqA_JzVEqHIkQ8H-h8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX/P3n73tX/JPp
 BdvuugwXUiLTEaUU+oKanFXsZG30PsgZP7npmt1HnljeR7nRZa27MPjZ6fAMuSTCzyObudMAnXb
 vZPgzbaDnhCoTnIjeo2DFIalmARRcpCH+CHFhoH0RfFkGz+PMQ7WNgFnJ4JadCo6CTvxZTZxb8B
 gDgKWVskrkVU/mcgOk4BMaygm7+K43OTMPksAmkXkQbL3rerfSZ/fDuLRMxCmuSz4Af8Jcj5MsJ
 xv9LGfQRjTX2EZzzpDvxhaMwRS43tdwF4/JeQGospXVULJKHHj26OYW0MEobLYmp9cmQt9KmVFv
 TV9Dd7lJEA7piL9vTQqOGFGl3DJD/u8jw4IdKBwQrhkbWWiEZBbe6VgN0vJbwfexg8HyLwsXjRQ
 T9a/68J1ClIPbjNQ0QAjdMvTXjPj86So9LyQ4/uwfEDpnq42XWnko3xrPnfiNButt7OrPe0ZKh8
 c12x/hFSSUk1c8cBBpQ==
X-Proofpoint-GUID: oTUtUX-BCmXzE9IqA_JzVEqHIkQ8H-h8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfXzKetjRXROFjp
 NTRSY8hlPid1I+Sf8R+aSMm3cfgi6OpZ1RCXoZOs9pCkutzp1VohNZkBLLiUj3QkDtqfB6zx9PV
 Tqr6b9OjoGLyQkNWgn9d9++c4rYrPGg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120165
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
	TAGGED_FROM(0.00)[bounces-118586-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B355D745302

Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
has two High Speed QUSB2 Phys.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 449c2a7e5fec..001fd0ccc985 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:

-- 
2.34.1


