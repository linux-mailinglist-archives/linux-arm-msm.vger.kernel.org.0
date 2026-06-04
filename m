Return-Path: <linux-arm-msm+bounces-111196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TmLDLpZwIWrTGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:33:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6994A63FE67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:33:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YihOSW7t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e8EMjdYv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111196-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111196-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58BBC301A9A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5D74779B8;
	Thu,  4 Jun 2026 12:31:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CAE46AEDF
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:31:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576290; cv=none; b=b3G91Gg4C9PA2p1/IZkUOvykG1Y3LwyhvebZT0zKO+plP6y4O/bQUdZZ82tr1QZRNtv8WtPk3I6+lZClrw/NrHDKODVVumUNhEc3aaG6AnF+Ln3cQrjE4s3FHMivCaMH4LbBcy6KKz6n2HAD02N2aVdtOZ3ohR/KLYcT9A+nlIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576290; c=relaxed/simple;
	bh=WfANBIIgBzTwwuDDl6Kdw8lUaZONgWxsNNvWrRs4B1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBh0u4kIqlvRUeFUBCBtwPSTReWwA14QZq6ZN1CMEfVH+smoM5dbx26X0JiRNQHR6jNeQtYKX77/XdGXF65PdouYrWrPxL7fW3B02+xigxV0IsIRAxolAgQ684/kYpd3dAIBWnkDzx4atkzvBwG+gS289lbqZJNxYpB8bir3goM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YihOSW7t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8EMjdYv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6549v1Vb3233931
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/L5+wnjbDEv3102VhOKhi89mJmJQbEkYJLYSrku4XFo=; b=YihOSW7t5IckLsz6
	zvkpUu3rt5sYbJ+OAx08vyi29N4mOGsSsCaUC0oIAWOJ0E7Amiwn3MgInauKAkfV
	aGgwCTcmYg1FtV0KASu3vAkq4U6tjg1P+Hpoc3E4maSnqEi1uq0QXTTdvQK0TidU
	IllBHxoGjYOVzVaFObSY2hyiBVCa/uG7nj5fbw3dVkSFq3lr2H9wvRnoIS3yN/6u
	k4ni+Dn85uMDjrFS7F6hl4R6jhQPJ41ax6g4+ZbHfZLyDTFq011Fr0K3JJ/x77SL
	LvU1jW55gygrd2QSZwXipPYKOYqgP/skwrWZa8uYlBrA4x73iP/dxudnyJXdLQq/
	m0vd5g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s3ppr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:31:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84240683a82so592841b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780576281; x=1781181081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/L5+wnjbDEv3102VhOKhi89mJmJQbEkYJLYSrku4XFo=;
        b=e8EMjdYvVOuht7iFnXf57cvUlTWRy0E7fqtv2cP5T+sqqrjRSNirc23PCmgjdLRj1o
         pMgflOfI+WSP/ffpCg0zb2vgelVq8O1RUQuuZC/5umj629rOIBacb+g3eH5VSYXdXbry
         uTJyjeMlTsXfIUaANZmfY8XIEGhy+9OQttdzKVoQT8Q610b/mSKzroKL5/TYJyO39kbv
         k6yPte66RhrtLDuj8HrW/RWGbZL9HvV3dUvtI5WIwZsTZ/Zp+Z+S5YnCEOJqqtPn4NJr
         ynarsj8zQdb8PEL4cJ/keWNVJ2zf3/tmtnjgIT9xJdcJpmQqvfcfaZQjN+vluRQRr36o
         5l4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576281; x=1781181081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/L5+wnjbDEv3102VhOKhi89mJmJQbEkYJLYSrku4XFo=;
        b=EhPBel/I1N1ZDjxYGfyBpCwsnNLeGnr80yV5imQhBkjcxinVIaAbGc3mU6Eedwh+v/
         Rdrx9GzM0bJPorkYhwT3bSrexRuhJVrKWq/7Q3XIJLtoHTVk6r2IeE373r84OrU6P7Dm
         2Cf2PbhJkxY2iUbebU75pW0NHm7jnKLra5Pp6YutecFpegdzCCN6iyQFRil8MsurZuk9
         JRKakBF2lVtzyJZhTCfzRCYStUYTIr1SMGZzIv+O5Fru/5fTjwuNSWi2xw8GgVH1370j
         GrcxzKAynSRirtNmn++0G4XX57PrVCYd+rRxF/L6y2jk8l8kVt+Crnv9TcnQl2OwUBdR
         lqpw==
X-Gm-Message-State: AOJu0Yxgt5dUGt0mtN00fA4G0zM+8PkXrEmcsM2VYW4mfjgEBGitN0tZ
	C5BzNSyeRHcU9rJ37LcgFKHYh6w914baTBF9DYQsI/vcZ+JrX0ZotMczKEFOKjvJUtdZHvjDVT+
	NUbs7LmRKis9YWR0CRDVOyTDmP1Lqwhh67U/7BBlEmLDN2+Llb4jCPK8XGpDyxpBstq3E
X-Gm-Gg: Acq92OG4XRufodjpkyf+MNjLzbu24BhuKGdECQfEycQ+C1u7XJ8anga7nFyUWBQc7m3
	Kqar+QZNu6kf5UuzyF8y6R7a23fwU0b+3mUDa4QAYhPQMVcbXB9ZiYP3omRsNanOK7fW7uko16y
	gfWi3mvXcnKirgiE9T4BuDrb8BT4SH4k076eYZsp2UbGTOOzNciR6H4b4vjiR8ZQlYUJsmPB2px
	mrwXFrVMJ+kzIV+CdInizu9JB1YJ5HJMXoKy06kxB7ppCUplVj20CyUn/b5kFYUAkCt9BL0Ma6W
	kUS93mjZb71Wj39CseNRtQVcJrFuXRuVVd/KofzsGR/sDPNWnkGqosg1Xat0ne55DNlh7syiUC3
	ociegH8wDiIN/fn27HZC9NONhI0JTIFg1DxzII5Jbp5OLTIdJZ8uchTSNMY0=
X-Received: by 2002:a05:6a00:1905:b0:837:f111:b70 with SMTP id d2e1a72fcca58-8429b57a3b6mr2822619b3a.4.1780576280756;
        Thu, 04 Jun 2026 05:31:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:1905:b0:837:f111:b70 with SMTP id d2e1a72fcca58-8429b57a3b6mr2822556b3a.4.1780576280004;
        Thu, 04 Jun 2026 05:31:20 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm6015917b3a.34.2026.06.04.05.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:31:19 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 18:00:47 +0530
Subject: [PATCH v2 1/3] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-display-v2-1-b3c1b2b67edc@oss.qualcomm.com>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780576263; l=4493;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=WfANBIIgBzTwwuDDl6Kdw8lUaZONgWxsNNvWrRs4B1s=;
 b=MtMgBdqvWqWsrLdHxWNc0SaL5+U3fBPtkq6vzeFtJypgM4h4oQWOWMW8CatTFoOwuUB00ACxI
 /jqGFI74wkKASThmqiqyz0GObhh0XKnl0wAX2LWewF69aq3oi58Z7bG
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: BaG5fLWoAJmvbuOzIPbndcJu9rH5PQ-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyMSBTYWx0ZWRfX0ipDiYYlS4hV
 Adp8wgjSQnAHz5TuSpCTYKB8hiqUp1a1sAiEUNx/lto1597wX8mlmGmZULc3GbMlL5/lYZk4/+e
 1Vo1PxlFHxDjO8ytvOQgmAzfeYCPs7I4GtYbKRKSvbMD6gNaSd9XmqDy1fqBXlZGr7D2v3/4GgA
 NgQnm+LidGwOQEVIcWdyNVWzVeDoueNIlh5PgvC5QIxdzYkXh+KKNwqNZfX0CQA25SfkNvVPUyg
 N7Z/v+IMAFRbKvkNMTYv+geFvXFxHCWwgfL2pp/ZcUx5o4diaaqT2HcTHE43U1p4/L+2j9UCS0H
 Q9i/2zKvW89F1K6B0nVIEjSAXl4a7UHFkqEc4GzqMDuNAnRinvdrxccGJFp8iBKtYnw1iOpPZOb
 RiZoruW8nnnW3QdDKaym7Ax3F4wx1oEn5kRkPAlmAMqaSb/A5VYXP3Ot09ld6BfznSc1og671U3
 pGWpB8XQyAHsC9FVHIA==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a21701a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=_tpsKkHDXNPZovU35XoA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BaG5fLWoAJmvbuOzIPbndcJu9rH5PQ-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111196-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 6994A63FE67

Shikra SoC uses the same MDSS/DPU/DSI hardware as QCM2290 (DPU 6.5),
sharing the same register layout, DSI controller and 14nm DSI PHY.
Add qcom,shikra-mdss to the qcm2290-mdss binding compatible enum
rather than introducing a separate binding file.

Register qcom,shikra-dsi-ctrl in dsi-controller-main.yaml alongside
qcom,qcm2290-dsi-ctrl, and update the qcm2290-mdss patternProperties
to accept both SoC-specific DPU and DSI controller compatibles.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 ++--
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 38 ++++++++++++++++++----
 3 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index dbc0613e427e..a2f3e91104af 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
+              - qcom,shikra-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl
               - qcom,sm6150-dsi-ctrl
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index be6cd8adb3b6..e166a73651df 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -13,8 +13,11 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,qcm2290-dpu
-
+    oneOf:
+      - const: qcom,qcm2290-dpu
+      - items:
+          - const: qcom,shikra-dpu
+          - const: qcom,qcm2290-dpu
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index bb09ecd1a5b4..7184b09a8774 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -4,21 +4,36 @@
 $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm QCM220 Display MDSS
+title: Qualcomm QCM2290 and Shikra Display MDSS
 
 maintainers:
   - Loic Poulain <loic.poulain@linaro.org>
+  - Nabige Aala <nabige.aala@oss.qualcomm.com>
 
 description:
   Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
   sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
-  are mentioned for QCM2290 target.
+  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
+  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
 
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,qcm2290-mdss
+  required:
+    - compatible
+
 properties:
   compatible:
-    const: qcom,qcm2290-mdss
+    oneOf:
+      - const: qcom,qcm2290-mdss
+      - items:
+          - const: qcom,shikra-mdss
+          - const: qcom,qcm2290-mdss
 
   clocks:
     items:
@@ -52,7 +67,11 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,qcm2290-dpu
+        oneOf:
+          - const: qcom,qcm2290-dpu
+          - items:
+              - const: qcom,shikra-dpu
+              - const: qcom,qcm2290-dpu
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -60,9 +79,14 @@ patternProperties:
 
     properties:
       compatible:
-        items:
-          - const: qcom,qcm2290-dsi-ctrl
-          - const: qcom,mdss-dsi-ctrl
+        oneOf:
+          - items:
+              - const: qcom,qcm2290-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
+          - items:
+              - const: qcom,shikra-dsi-ctrl
+              - const: qcom,qcm2290-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object

-- 
2.34.1


