Return-Path: <linux-arm-msm+bounces-111195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hE4wDptxIWoRGgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:37:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE563FEF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:37:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H3NI3kj4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="c/i0B36N";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111195-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111195-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BF39300BC62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F64472780;
	Thu,  4 Jun 2026 12:31:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28BF46AF37
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:31:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576280; cv=none; b=krmG4LCeiCWWKPqA4WwPknM5d2nFAtwF//lUv6HV4UlReUz1DU4/ijPMUcalLMUWjXxvD/lpIZxHVcNColM2mfiq+37eIYmSWf9JsZc0bg5LzBYO4brcW3adptdDZj1Pkme/kwNsx6iV3ie7LyuTpAmg+IF821gwia21+IOPZlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576280; c=relaxed/simple;
	bh=BzGjWMm7NOWQTFGGfvZVv4acRcjMzGDbIyUMsF+f/Sc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V4nSEsLDlHKON62Gu6JRXtkVqscIsfSYtGdp2hK/W652yerIx8GIxOz/GSOUKF47Ru6AQiO76CKkV/fmDndXVa7tUxKE2nsEbN3g1QC4xK9HIGfa+hPCXzC2nY5inr341QubIxES8lyeI82KkVQMzNwp4BqMSLcNIufy4G7hDNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3NI3kj4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/i0B36N; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548UfjB1132390
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oVCtfvOAMMbqkNqCa+q9Cb
	6hDsShNb4EGCU/ePnP6H0=; b=H3NI3kj4ZuurxfJZVm++bRwxL3cJBUp3YZlXUY
	MwZqAuxKRSoKNb7pTolPXWLrEWW/mewM5klj2kkr0E4YieQ7DnsM15srCgkkAVHl
	T/6sm/yKEJZmxZ9QfqkB+Fs1zLKE8yVOYPR+Hs9pvkW4D6xJ2kp0qHU0eSP5P2tQ
	T/WBDbfO71UaczluEjEdzQC30KtAKRwwrLv5FvS2XakzUKvTtB4uRzgX1SpjESqS
	mHXEmjxcXdZBkAPtMO3XKa/yHOT2xyE9L/2rP9HUdBT0/6jV5x0ztjhY16t1GkWs
	4peHABjNr9tIVkG9kF32L/BNUOk8/yqOkNIScjj0ZhqJMQrg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsgw4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:31:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422ca754d8so515615b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780576273; x=1781181073; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oVCtfvOAMMbqkNqCa+q9Cb6hDsShNb4EGCU/ePnP6H0=;
        b=c/i0B36NJTaFYTeDnZ64O+sNQMRlvPzwDfCPPkjZ48krGsBH22W3SPeIdfmYxYekeF
         3mTUpxGFq3LgiUIhvQ4sdDvuYvH2GFlkZ+dPtdQv2lPOIgJTT0zmOX8/IHmUqwpA/4bd
         x6fuXgP/Mtbp01bLRK3HBJcRh+SJv8Ogbn7p6T8MGpVl9Q5+zfAaK2yWNPQZlAFyt9hv
         V4lqK1qIa0fibfMpQf6nB3oLL7YQyJybwKQTjW9H/aLLGRqqN5QTXzaiaswLfX+D6q0P
         7Rl1Y82RSPDQ8WxWqgj5NZ5OYhzoMJviLylAexjLMplUK5O9sDhC7zYqwGuO7bjLhKDg
         sZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576273; x=1781181073;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVCtfvOAMMbqkNqCa+q9Cb6hDsShNb4EGCU/ePnP6H0=;
        b=ZxHzPhbwRUb/OQLzhmqHcwfdRlI/sw4h4jAt7s0vyZxc+xJUGdA/IF94CJWE4myfXF
         dC4WTWjEofZlCzdo8TSxxM7DFnUNzjEMWbAipLIsmlHYzO9Wmwnj/bB7nOW/CjKBE86l
         aPL6ybq6K8STtx2Vs+Ryu29dexmdpxQRm6LIBnaIm2OsMjzzfAt/p0l4NMoYH19IVftB
         trV1v3YG2Y/ktmD6YX97OgCIx9qOie/80r3sEaF5wHTpP/nLRCveac2vDf8MJu++JEjI
         dQGhtXPBFRMTNMC1F/eFU3mbqEVFLx+rR0QCc1y2bvnWKjlkfehpL/f3e5JiN8B/zU4w
         +AMw==
X-Gm-Message-State: AOJu0YzERO5bOq+o9Hpl146weGY8qH/vPeQU5BMIBLUMGTE8+yyqrX7D
	b3cXangOLSI6Ckx5YHWYLV2J8RYnWdfz3aur5VZC54JWBhdxOGvLzBzEEdRHF9s/QsmB+jqaRVn
	GMFBxkmssVqiLKe4cNGbtGNngOzTOAvaoytohMagcRSBFdrSWUcUllz66KkzMfcNWhuWy
X-Gm-Gg: Acq92OGCCZNqSJWEP9+iYbhqMW4XtyhuzNfbOJre44ohVsjy8PYsPlGyW7wXWC21YcA
	JAzHFedboIFBGLve5iK9frmgSHop0DekJOGyOTEOuFAHq8/CgWbawCqKEJlMHCbaBnmQALF896m
	bC+lbpHOy367vwjkfZ4aHQRvAUmnAAsuZqhSQj3o34vYnukxGa3v5w5J6xfkhqIeynxGqA5pr4a
	PYZLsbRGNxuFT3dgg9B5OYGjaw3TJuye6pcGGIYDAXCmizjTSXBSbuIGeCL8C8/U6w9O5vPbkhb
	jVMRi+lwQ1J9VIYZ1AwY3Bk+yBcf7iPZSQcHJQLbBD+cCrTTg8HP/O5626WhVaI6vj9xzOV2WyL
	Qx2Lw+k6Bn32T9qjRNHMcmvS3u/k/Vz58/LZByOvXTuWxWTcWgSHke7e64CU=
X-Received: by 2002:a05:6a00:368e:b0:841:dc85:1638 with SMTP id d2e1a72fcca58-84284f53d31mr7173802b3a.42.1780576272422;
        Thu, 04 Jun 2026 05:31:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:368e:b0:841:dc85:1638 with SMTP id d2e1a72fcca58-84284f53d31mr7173753b3a.42.1780576271868;
        Thu, 04 Jun 2026 05:31:11 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm6015917b3a.34.2026.06.04.05.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:31:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Subject: [PATCH 0/3] Add Shikra (QCM2390) display
 support
Date: Thu, 04 Jun 2026 18:00:46 +0530
Message-Id: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPZvIWoC/3WNwQ6CMBBEf4X0bMlSDRVP/IfhsJQiq0CxC0RC+
 HcLnr1M8pKZN6tg68myuEWr8HYmJtcHUKdImAb7h5VUBRYKVAopnCU39PIoK+KhxUWC1qlWcK0
 xAxFGg7c1fQ7hvfgxT+XTmnG37I2GeHR+OR7nZO/9lc+JBIkWTVJmlxpR5445fk/YGtd1cQhRb
 Nv2BfxvrkzFAAAA
X-Change-ID: 20260603-shikra-display-07767208fa90
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780576263; l=2713;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=BzGjWMm7NOWQTFGGfvZVv4acRcjMzGDbIyUMsF+f/Sc=;
 b=DMPp/3/P7p0mXsQD7I5mVa3XnUwoOu1FC9g/lOw0Oil7tXRLfw36d3FtC9Vm0lebimbzZc3mx
 2nZUxp3Ljv9ArLU9lP93ovjQqDjl059xpYQ4hTofSNFsZeINsNo4k+V
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: OtLt_fKMPBJTxciaHRJzmg-Sf8BcNzS6
X-Proofpoint-ORIG-GUID: OtLt_fKMPBJTxciaHRJzmg-Sf8BcNzS6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyMSBTYWx0ZWRfX/c/fzJ9U8y+Z
 RSkbD2NICv0rugc1i0LO25A+mSlspqLY8dOYxxSJJDD25dgz6YrSjjYEUSbV6Sl9aSoVeKrtOT5
 3IZJJgFfKrzDkK/TZ1jXxWQVax7ulOUcqQvD/1viGzRyN4O55iE66P1MCLKxkHbbmHcVnGyut0A
 fS168u0ap1QMh/SN8erjhiBUE7oqJfSJ9AWpa0DGWJ8oont4R/8kkHyyV20Us5b6/AO0IBbxtIT
 kVzESdt/t00VWYH5KtlPfO2CaaIu4vmys5ZXY4BDsEZsHxggUftOD2vXrrWzyGpXYhfvmH22KaW
 4oPcFzKs96lWXkMM6D79+VvClbWcXwsE5B9DNORzzJNH1ijzJZ/Ks2BOYe17DDEib5MVndeyqS/
 mKec3bzBp2BKwlXNY5BFvN23H7PdtKGfQ2JVNmZ06gNf7Kyv64LoeVjD94BXcoJEGCOEAIrP1Wx
 KjzDPirgr8xC49NxATA==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a217011 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=3zM2i4eYArf5VB82j9MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111195-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,msgid.link:url];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 2DBE563FEF0

Shikra (QCM2390) is a Qualcomm SoC based on the QCM2290 family that
reuses the same MDSS/DPU 6.5 hardware as QCM2290. This series enables
the display subsystem for Shikra by adding DT binding updates for MDSS,
DSI controller and DPU, arm64 defconfig enablement for the ILI7807S DSI
panel, and UBWC configuration mapping Shikra to qcm2290_data.

Driver and SMMU support are covered by the existing qcom,qcm2290-mdss
fallback compatible string — no separate drm/msm or IOMMU patches are
required.

Tested on Shikra CQM EVK board with ILI7807S DSI panel. Display
pipeline probes cleanly and panel renders correctly.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Nabige Aala (3):
  dt-bindings: display: msm: qcm2290: Add Shikra MDSS
  arm64: defconfig: Enable ILI7807S DSI panel driver
  soc: qcom: ubwc: Add Shikra UBWC config 

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml		|  1 +
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  4 +++-
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 34 +++++++++++++++++++++++++++-------
 arch/arm64/configs/defconfig							|  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c					|  1 +
 drivers/soc/qcom/ubwc_config.c							|  1 +
 5 files changed, 33 insertions(+), 8 deletions(-)
---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
Changes in v2:
- Drop drm/msm/mdss: Shikra support patch; driver reuse is handled via
  the qcom,qcm2290-mdss fallback compatible string (per Dmitry's review)
- Drop iommu/arm-smmu: Shikra SMMU client table patch; not required with
  fallback compatible approach
- Fix UBWC config to map qcom,shikra to qcm2290_data instead of
  no_ubwc_data; Shikra shares UBWC support with QCM2290
- Refactor series from 5 patches to 3 patches
- Link to v1: https://patch.msgid.link/20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com

---
Nabige Aala (3):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS
      arm64: defconfig: Enable ILI7807S DSI panel driver
      soc: qcom: ubwc: Add Shikra UBWC config

 .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 ++--
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 38 ++++++++++++++++++----
 arch/arm64/configs/defconfig                       |  1 +
 drivers/soc/qcom/ubwc_config.c                     |  1 +
 5 files changed, 39 insertions(+), 9 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


