Return-Path: <linux-arm-msm+bounces-98559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAmGCHf4umlwdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 20:09:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D321A2C1D36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 20:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E7593031AF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BA03F0772;
	Wed, 18 Mar 2026 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAtPDh5l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nx4QhnzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472843F0760
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 19:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860937; cv=none; b=bK6HwV+AOjJhsawmO0W9cbT5mtsxND/3fZUxaVscWYuiYj8I06j5/1swil28gTuwVj7ojOfKLoI3lv2wZ7YtKR0DU3bQNEq+cDP7JctwcyybOUZLSz7f8R4UYOR602hLAHQ5mPrMBQehxgOpitYmMHVVoaJRxgeW3ku1dP1bca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860937; c=relaxed/simple;
	bh=77Q4qjhAUiPP0VHJG5EbRPG2cIGoPwv3G+9ccxuj/iw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6BaxaPnr1Fkrtaw5FtrPeTo2nHTYw4iJ6ZpcuflVDnS2Z5szrPb7vsuB1KOX6kdslsQmNEZHC5bcmOTQJE1NVsIKAsNlgld7y0Y+ThLKUOfdQagbhIlPmoYtxDT2ERkkI9iJdz4gUe97XPx2fdjFGQgFNTYAB2N4jBVvJ2j5mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAtPDh5l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nx4QhnzY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFgoH6551542
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 19:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+hXm4esaizx8meyCbvXWK397tdA61jSAx/xgCf5/hk=; b=gAtPDh5lqV4xHnCB
	6AvyMfd+1KrVnhovVVbGkjRGb+KHcPWALsoZmsSO/rClnEeiuGO1OV/OXdonFpdD
	e9YduoPKvjZfKJCWevujQk6WPcxBTPC5vszD7Pw3ogjI7c9mDJP13gnYSqMSzTkC
	0XX50RKR7cOTx74hmzDgv9YHO9UayaDxXAwFR1QxJeL41clpY0US58H4+KwFRvl7
	UsuZBbZ/zLHh6PIWcq1WXUeElPTRBsO5TcAjJGRJ1WZVjoKdC7ritcMJ5DS0c0vZ
	GoRk58DpEwhS1TAHyGPMmQrctDdhLOmxrHJYqFB0xgFaENm/l1cyYO0sRMbBaFOx
	WmTBvg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g41t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 19:08:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aec532278eso906145ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773860935; x=1774465735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+hXm4esaizx8meyCbvXWK397tdA61jSAx/xgCf5/hk=;
        b=Nx4QhnzY4vPckvCv+i8ekzYr8GjfbLu4kedfiLlSO4SW0j4vpOZACu8LkXPDlgRJYr
         ToqiVyj0uL31m7DT1VMDkMdBfiRyFYokuYVQKJXUjyX45lBZ323cXCOa+2iEuF3Y7Ylo
         ajWv+sMXMyZsH2/UZy4cFjxEOMqwVXQ8jqc4VmDGHByvA/z0c/p4wlICBAzLbtlHDnxM
         u9NZyrYssCjNNRF4UF7QyJTnj7XOvOtxwSfC47H199Os32fnuPvyydPYKzD2rbO1uA6B
         LgXjeQg0+qIQ1ZVGJUYattopXc2rQUJd7a5+IyYa6uzZsyCdFnjgalue7YAZwXE7F8KV
         JX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860935; x=1774465735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7+hXm4esaizx8meyCbvXWK397tdA61jSAx/xgCf5/hk=;
        b=T+il6TnSwzHyh+2vWfO2lVA1+7+gvVXm7hkJYTv/E+5LG91MWvT3I0tnvwuTN3r5+w
         qXy5BZh82lm3TB2p737tyiOW0mUZ99bJ9/AY6BuMlWntJBjsu1j33dLz2xiuO3yBxzZV
         +xAJ5MfWqRFtOuv2D+XfN4KUPXzaxzWkPWaiEdyujgiM+0jnuaE52VD45mW9IBYqqi3j
         yDGA4FTwHBQOVvgPfFN33Fw+9jZ0k0q15fPDnYUckea0VEQBm8Fb2Tl7x1Bpcdh0M5Zb
         oMw02kAhiBB/fPTC8E/GswBp0WtESlSOCNx3PtODaN6Nim+hQlefhDNLufsrJNTdRfCQ
         5SeQ==
X-Gm-Message-State: AOJu0YynIskujzrXeHBgReA07WJsb7rb4Srvy4fD4ia9i1csJFXeruHd
	wVHoWXbq1BFyHjH0yCO8BVK1DFMs6RKReJS7IOiUZUxCNylYstlyrC5PxrYBR+caxQz3PmGOkil
	FjxhFPux4qQK7ZuafQekkMR6W2ZFt6801pMM7lwufChmDpFKeriUJo4t86hYzYRB1kA/FU7qjBZ
	l3
X-Gm-Gg: ATEYQzyRSOhMuefzSIam4SN+HuJ++DJhl7s9TrYQrht2mztrjva3I1rTL3rSIqoi889
	KznTvCBhKBC/qanV4PitaLv80JeR/cVKZCH0ygLKQUpPQn5wqSWPmQd46Tif1P9TbWR74G+qcIA
	S3Z/odkB1UsThIsBVa6Cc1Z+9exq0UBgechD5lead0eRFp2/8eyVDpkqOYBgXCRlic76rlqxhV+
	Pwrd44CaiACdrtplgseYwbQiw1/BsvAXRhxG4uHhgSpwZXOekStr9XQ3Pxy4xxMqOV7zGOQRjrl
	qYMXpP55KqFw/SXbLHGb3DOWOGrNkK/luBXo5cHzcr+Ei4b8PCRanEdLRjGp8N99WOfWcVp9xW3
	bsYiq+05YKw9dH+fNJX4zTdsMQIGjq/v1AzzOQo5aplkSBSXgw3F1Z9wb4ulqTrVvzVtgxpU4oC
	RsZVUMGBDvTPw7Gtn6Az0R2pgjiLayfV2LaQlrlz+wqg==
X-Received: by 2002:a17:903:2b05:b0:2ad:c66b:f5f6 with SMTP id d9443c01a7336-2b06e21f509mr33532025ad.0.1773860934847;
        Wed, 18 Mar 2026 12:08:54 -0700 (PDT)
X-Received: by 2002:a17:903:2b05:b0:2ad:c66b:f5f6 with SMTP id d9443c01a7336-2b06e21f509mr33531855ad.0.1773860934367;
        Wed, 18 Mar 2026 12:08:54 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f1245sm42762805ad.46.2026.03.18.12.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:08:54 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 00:38:20 +0530
Subject: [PATCH v4 2/2] arm64: defconfig: Enable Lontium LT8713sx driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-lt8713sx-bridge-linux-for-next-v4-2-da886ec78fe3@oss.qualcomm.com>
References: <20260319-lt8713sx-bridge-linux-for-next-v4-0-da886ec78fe3@oss.qualcomm.com>
In-Reply-To: <20260319-lt8713sx-bridge-linux-for-next-v4-0-da886ec78fe3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773860922; l=713;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=77Q4qjhAUiPP0VHJG5EbRPG2cIGoPwv3G+9ccxuj/iw=;
 b=KTW0Y1vRb6Al1JndCT/QBFw1ndkp0IITUdGPk4nCb8tYzOOZluQDltgx8pAxq87qfD2ymN/L1
 p5yLOhmsq1NCfhYe6F11ZuzUxB6k+K5B40kYKxhuxhCKsebfcT84NuT
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69baf847 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CI3YMI-dvsstCnLhLxUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: nlYv9FR7Az71cJC6lGm04moh37ibGrUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE2NCBTYWx0ZWRfX4lMrtc/Zpr+L
 GCIaP5nFdmLNhzeCHTzudTca13VwzCbaFbgWX3sn5rkDoWydJ0h5+8foLnC41a4VVCSAo0MMVxg
 iDQYw2VddcFEblmGkXV/nWgtN7J++KN7XfzpnOmVShLWRwSd6di77xIE3U7mof6FU3ivKVuJNHB
 xUt9nTjJnZzvra6VhW/WGTIXEJpIa/NdY8xRB0DLnlJY5PlwN3gTk4ZYgGi3P/H5YKKCmCaXZIu
 apuudmZdfY5+IPVGIS3/erqSQBSgWefJyOS4GuZI++GZ6sfiZPTObl/EJ4/UBg/yjOHcyZrcDUQ
 +wBXJ2qaG4MMJayQmpUcp7X2ecY6hG9Q9dU8OGR8HffWXRX4zY2flwnQ6lMgkIocPmEov1Txrl6
 ybcjcpv7FwDAMwz1LQeYPdirJBJ8j8WKFwnuptFcwBVWWon0+MQ/0L7Oeu0drnUhxB/mNKBUYcL
 Yc3gf4syGcf2xXrJAng==
X-Proofpoint-GUID: nlYv9FR7Az71cJC6lGm04moh37ibGrUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180164
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98559-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D321A2C1D36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Lontium LT8713sx DP bridge hub can be found on a Qualcomm
Monaco EVK board for converting 1 DP to 3 DP outputs.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1d967a81b82a..57ea37e4d9ac 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1005,6 +1005,7 @@ CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
+CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m
 CONFIG_DRM_NWL_MIPI_DSI=m
 CONFIG_DRM_PARADE_PS8640=m

-- 
2.34.1


