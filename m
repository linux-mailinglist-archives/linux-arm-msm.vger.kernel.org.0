Return-Path: <linux-arm-msm+bounces-118585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S6IaKcuyU2pmdwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:29:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0896F7452E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:29:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jJRdIiL5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="AUN9bUr/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118585-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118585-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE12B300B9E5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E6D34040E;
	Sun, 12 Jul 2026 15:28:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1961333F8CA
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:28:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870129; cv=none; b=OvyYfEkm5viTRp4U5eTCdSj5syHKbGAVTHRYemoiyjGS2YphMWpTG9rxTOZp9YU4LLACcQbxRVXwGx71AUKYYs1SArwynvb2daMFts3rjqX3dUZE60HwK5aA8D2Qn4J/fCA5/7uAIX5KrdyK+G2nuaJzyLzjoeU2BvvaMlyhHJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870129; c=relaxed/simple;
	bh=9AcQqP3IBA61ponBq5aLuiVfoQQyMrsvshw4ON9Sb5o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O2HT0hAOqGy2hGUwvJOtyIGnolHgLMTRjRMEnOUGqniql2XckkLhoOxR8TlapJQ+oBgEqbikfa7C/4oRtPNs5pvp3up511SbsCMNP8SJOxiJ8k8kpBcdPHlTLf1vVTjBW1sr6kZkPpsEDIZC2HmG4BafCeUc6vFUHE5hPtNom2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJRdIiL5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUN9bUr/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDbm5J2701970
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T7LzRzdOtGRUoiK/jsLmZx
	DmijLhPZ8dl3wvVuyklfg=; b=jJRdIiL567rIJv7vAlm73Cug7HBSNuu3qFciwM
	uJqxDfp687avA1HEEo0V6m98o33KStttKWB+fRay+FYHcfFF/5DbZ7hWut3cEATw
	tpw6TSM9/p33yIDpDY0w7JoYaGD0B+gGm2Pn3aAzxaNdRJukIV+7yUN59UnNPjZ6
	oFWznRw+9HR7VCKEbNOrW/LG8w73eKGub+wt6/1B+jCzHBPS6fIj841HNPRp/IX/
	eh/B25nbmAtRPEdM1tBmSEvYhaQlTSkJTMCX5R2akBFeFD0npxDNXADTBm9mn5ba
	hVuKvgkAaL00AMIWuo2O4z+G5PlnC6ORmMrt007iYkZ9WyUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamu2bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:28:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so3405634a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783870125; x=1784474925; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T7LzRzdOtGRUoiK/jsLmZxDmijLhPZ8dl3wvVuyklfg=;
        b=AUN9bUr/GlXAF3imd2nm9gSiXgss9YDxkvWkcrW9JoUaw4Tev4AOkPlY/KqGiTw1lC
         9sM6T/4fjAyugFpIEBViUlvouQZGWuImdZ7emtDVGX5nQhn1Rzr+UdWODIMwMxyE1k/P
         cwvi0q8RQdsVOEeDluUSZL4shpAll0Y7TIRpJH0kBAphOhGWUTQ3uDYdTLF3eK+QOSz8
         /Eh3k9AlaOEMmLEcUDPleerakKXWxqz1w7IKwRj/1wpzub5Wz/z/xoIwij3sG+Z9FSU2
         Q9PUuzJdcJCtjCLQE3K42DKW758GQ2MUByFfmMmQ3rIsru0PRveAMM3cxtNBdnl16MQC
         Mfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870125; x=1784474925;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T7LzRzdOtGRUoiK/jsLmZxDmijLhPZ8dl3wvVuyklfg=;
        b=cXgxNjQacPIrRNbD8xhoykolytI0BN7ShmG66rx7F7OkNiTrRjZpEuAqbRBbkLah+F
         OcyfqO5FLNJvxLDN1M9HBsLLJZED/GVepe/VwjUVlCjR5f3UPhvGwaQ0SXSQfPUpw4Pl
         M2mPGq4+qtZXRfYC4jn/+LSma6O6BlCJatiM/VwewwkOX8tAkAq3MMVHfYnjrG4WxdRj
         0sHdxyiPpA/PYE0SfLDHzjmYSwBK4UD0SCXwoV+PG8i5Sisg0xkZZnj8z82Z5O8DwjUW
         w3SYrEdRGkylXQJZJGeTJh2KKuZiVk0hXHiMGKHe2RLdFT/OZee8MGvrGRWB2gZPKlOl
         Jrmg==
X-Gm-Message-State: AOJu0YzYxC6wWyV3S3Eks2SJuVRU/87+QHo3JgTnC5q8jVDJafSQtJfw
	zIAu4BIJq74KQkaFiUamPpA7+TCBZIHeI5HiSg4JRKm3KsVP5rN+bsoUfZbQIjPDnp0DWnBqkyh
	qriZSmiFG+cRnVU6mV8O2eMI5VgxrawF/dDFfsiyA7yubllnANF4Z39oaPBG3x3m3utch
X-Gm-Gg: AfdE7cnk/CGHTLaShe8KJyTzScKFtwaoBxdIACW5C7h04oPBomZJQHcLWjOg+fUExeY
	stqas2g9GXUzzErJ2XNG9CunxMekbaunCUOQUW/4cBzYNi4kQkk2CcCq5z3kD48drWe/A+CH4ji
	Ol0NxfjHmvA7sdmMPplD0WiqQWptFhHCZWUtnHuQR0z2lPcwPRTtdkzQRgP+lJqzuoMU5aBK04T
	JZVRzn+Au81EfKXaGPwuyWNRsvwL7uvdSee7ZC+LRuCmRqRmxtJDg9Q922QAYGz36sMm311Uyl+
	IVYotbkExLyv1EiYFZByo5eTRw2Sfu30T2Uc8jhiG0O/S/zTIBPrFncplUOFb/LD5XcMPRg/ew2
	pPuM9gz/juHi92ZGev/UP9zCWRPV4/DpoWstG3pIFdeydbMb3Z0ASqodwaI++4A7rxBTMXaF0on
	ts1fK7
X-Received: by 2002:a17:90a:d00f:b0:387:d5bd:6231 with SMTP id 98e67ed59e1d1-38dc8499094mr4855701a91.20.1783870125016;
        Sun, 12 Jul 2026 08:28:45 -0700 (PDT)
X-Received: by 2002:a17:90a:d00f:b0:387:d5bd:6231 with SMTP id 98e67ed59e1d1-38dc8499094mr4855684a91.20.1783870124518;
        Sun, 12 Jul 2026 08:28:44 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm41458776eec.24.2026.07.12.08.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:28:44 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v6 0/4] Add USB Phy driver and binding changes for Qualcomm
 Shikra SoC
Date: Sun, 12 Jul 2026 20:58:33 +0530
Message-Id: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGyU2oC/yXMQQqDMBBA0avIrDugAUftVUoXmoxmFKxkqlQkd
 zfW5Vv8f4ByEFZ4ZgcE3kTlMyfQIwPr23lgFJcMJjeUV4XBVTtUL1NocfE7boTGlnXBVUMlOUj
 dEriX3//5et/WtRvZfq8RxHgCvsau3XUAAAA=
X-Change-ID: 20260712-usb-shikra-phy-v6-2c581e79656d
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783870119; l=2427;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=9AcQqP3IBA61ponBq5aLuiVfoQQyMrsvshw4ON9Sb5o=;
 b=oSeXFglkEXHHF132UQDh6cuFaE/2xaFCbvsvFDtKGzfu9yzB0UxJXgx+ZzslPhZhZvEhN4oAn
 IAkqE2hKhqDDedPeoQgU1cr0Bp85PL0XWXffuBGL4KAqhFiAK+Pw2/U
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX2VYDNKGSiuQu
 /vaqjy4LP8wS35r7sSJOhlvi/W4N8oOd0BNsSliCQbNaX0GjP9QARi/6jMxse3YMDDyJtgE1YYo
 ah5Gy0Da03feShZJhkQIJx+p4OM+RL0=
X-Proofpoint-GUID: F4Jyjt-x5HHZJWMANJtzglsx2d_3RPCE
X-Proofpoint-ORIG-GUID: F4Jyjt-x5HHZJWMANJtzglsx2d_3RPCE
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a53b2ae cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1jnLzvbcVs2I2Y3RooIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX125cIWO7KuK5
 j1/nzkHMX+wUYdi3TpCci0yPCMsTCq4QTPTghsb5SrpDT5CFLgZ5qFcX4zkKqR+r9TYvU9t7Nx8
 toKsJr33S42nJJVVyID6TnElBn4KczA8Uj4FE46xezgyu9Yw7kf+VhR1KmZCYv7e7UcV3zXRZ3y
 2Nq6OjJtI2kq3w7zzASUgmDH/qcPKwpvTWwoM/SjxfkHYYHNbAiCVxmIW19ycQP2lVnlO+M18bD
 s2IRBdK9aKcdwp8UcmWY793Z62IaRwRPyebMcOSpTYWA8TcgGgBAd9JU0Eq09/+2pGVVCYB5woZ
 DQQ8YBJ7Q5SLhMz7Nobxb/EjqqJFCmq5CR93edUz9gGwieu6UzHayORoMRaykGjfXB75akpZ++o
 m1rUFoZZS03Bs1bFRA5rK2xz8ygvFi4kx1p6HDDNagx1/IA+hlQ8C+VqBgniadcJ5KN+jnb1dtJ
 uLUc3ar6uKpnoL8QqTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120165
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
	TAGGED_FROM(0.00)[bounces-118585-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 0896F7452E4

This series adds Driver and binding changes for USB Phys on Shikra.
There are two USB controllers - One of them is SS capable and other is
highspeed only capable.

Changes in v6:
- Fix the minItems and maxItems for reset-names in qmp phy yaml

Link to v5:
https://lore.kernel.org/all/20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com/

Changes in v5:
- Fixed shikra specific minItems property for qmp bindings
- Rebased qusb2 driver changes on top of Dmitry's change [1]

Link to v4:
https://lore.kernel.org/all/20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
- Moved to using qcs615-usb3-dp-phy and added resets specific to shikra
- Updated bindings to reflect that there are 3 resets used in qmp phy
- Add remote endpoints and orientation-switch for Type-c handling

Link to v3:
https://lore.kernel.org/all/20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com/

Changes in v3:
- Moved to using qcs615-usb3-dp-phy since the DP Phy is present although
not operational.
- Using Talos as a fallback for shikra in qmp driver
- Add required "phy" reset in qmp usbc driver since its needed on Shikra

Link to v2:
https://lore.kernel.org/all/20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Separated the usb controller binding changes
- Updated commit texts.

Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (4):
      dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
      dt-bindings: phy: qcs615-qmp-usb3dp: Add support for Shikra SoC
      phy: qcom-qusb2: Add support for Shikra
      phy: qcom: qmp-usbc: Add qmp configuration for Shikra

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 49 +++++++++++++++++++-
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 53 ++++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qusb2.c              | 14 ++++++
 4 files changed, 113 insertions(+), 4 deletions(-)
---
base-commit: 716471df03105a6abdf02727f8a6f096b70aaf98
change-id: 20260712-usb-shikra-phy-v6-2c581e79656d

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>


