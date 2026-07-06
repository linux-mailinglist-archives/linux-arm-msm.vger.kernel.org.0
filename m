Return-Path: <linux-arm-msm+bounces-117045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bM1VAwwhTGqrggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:41:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 760A7715C8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:41:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ceZjQ8eB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bjACVa61;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117045-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117045-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACE703028369
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1394947DFB6;
	Mon,  6 Jul 2026 21:41:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94C8395ADE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:41:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374062; cv=none; b=bppQjONLf3Bnt+hDaavw76jYY/fQOVkfDK4sjn8QNOXz9OWHpWL2FZKTHSobZWxywtiqTX8/xoD5MhKAPbTMp71uo4nlJj6dGqxCGd4YM8i64VPqwtbzC2WOy9Sfe29xB8+CCsXPk3IL2ZYZGLyWTHkvhTyeTfLIwJN/v4EjQVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374062; c=relaxed/simple;
	bh=u0V7GQzqEDNpecJi/Mrlfyjnpl1XHgYKPvh7ZJaslcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqnacWhxEqThqrS37gIWkxzAgVNnq1sCdr5O79Jh2ylPsV1Cfnv2PUoChv3QgzFkT4zIef4wlWJxLrjkv3RbiO4QwD+73l8qgpenbaOkGX4ktqsEnm8B8RbE4Jajyfy6MQw1C6ckUwZASUpRnr1gGzFq+bfAHl9i1/1RnCKDNCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceZjQ8eB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjACVa61; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDp6E1628655
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkXnf93yLRWoLQTfGMAiyn37G03qiS7uTjdBHZXSW0k=; b=ceZjQ8eBnqJyvJ/n
	yODW0D+GvmdiU6wVotMh8dFHnitj/J9b2rykVHx1hMIlo6l78Eg/RGEZdY/S85ZP
	eQWhwktOgE0fMKVx+pAsrYvcwOjivisetF/2tV3nn349JI3RAyDxYwG1RuZ7LeE/
	/mXXFkWArw7P508NXBDPdpu1CBETqAR3QEgMiihW0ybfhhBFgHRf/3+VZAmIaRT5
	JB0Vs6NYJKkyrZXeowdCoSvha5XAus1xmlH4gXvwGFpXnYFFM50QoU47z1wv200n
	VgygfrEsUrW+4ylZZBvVeUjTHwN/j5L0OtxjPeFoblqOkecHZ6Q59Fa2ECbS+K8b
	3Sj/kg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw1cfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:40:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so49087895ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374059; x=1783978859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkXnf93yLRWoLQTfGMAiyn37G03qiS7uTjdBHZXSW0k=;
        b=bjACVa61iNQETnkEbR1HSfsjzxd+fEEnjNWcR6lyO+R9dzaHHzlGQn6RG4wF8pE811
         wAZTfWeayXFJv1OI8iJv2izzZ3jHC5F9FFrcG1TZeaGSq1+H7F9eSBtJrssE+BsM53Au
         y1odCfuAoU3zarsgMWvZXVVB9+NUEtjV1O2GUewXD9Qh0o7TooByEHx+Z79PvBILECCX
         kA/xkLKh+b3IxziXx1gNZ1Dz9/wDjdgHVrnvTLp4IOosqEAEi3s6ybBXeEJPyuGjbGwr
         JVaxVQcUqh+A2RE8TLO/Ui8rGhqH3waFs154PzG9KI6zW9mo6PTZqaaHiHcrRxer9Twt
         dxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374059; x=1783978859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkXnf93yLRWoLQTfGMAiyn37G03qiS7uTjdBHZXSW0k=;
        b=NrMOvCkuodvdRurCw75PrWvcriovuDgnAqHejN3Xc2U3A33Qup+PpBiJx2aZytYbVx
         MPzSTkAQzkXT5JEmdkNUvyltv0CZ6DPaHhMep0H9K3PtEfAHMbcbgABbFuRwh4WlS6xZ
         DKcTxCVr4bLwvUeAaWX74dejrpZ/Xwh4AOGLn1YZF1ah6wFJ+AmURZUNFYSgG3hUeSK8
         Y5Mt3PVFpZ3kSfAR3i/RG+KfWZfcZQwHFqnODNJzgj06PFKk8vX7MbiMUvxtMT3ov4LQ
         f2vXvMVwqJHQFYYstjAFbOCj2EyA/taos8RQX+DNE89OYd/MBN8ZJk+6l3CU75l9fMnH
         4QzA==
X-Forwarded-Encrypted: i=1; AHgh+RofYUdRToJR8hm35oIDWf8brQBClpOy+mL+0IfT+lQFQp/JjMdubA8aegd64AsDlMB+Y+lPnwmC3el9ovz4@vger.kernel.org
X-Gm-Message-State: AOJu0YygnA15qv+SY6WHFL2PMvS9lO2aBFNQ93kR9HLV1aPfDLL0F3c7
	VqnLFHfskfbBX+Z97UXL8NK9qcLne8CwhS93rhZPJ3XheLITyRlf/x3vPWv/JDKrlsYwSPGZ8jE
	olx6dpGVd2egaGk/t+pstlPYHWBUfLBn/Ch6wx9kffDsFZWsY1LGH0FDTADfZjQPcVMt7
X-Gm-Gg: AfdE7ckPfgzZUDl9Wexf0e5igHVS3U7zYioHbFRVPvKmZ5N1lZWFanlNxZQMsel6u84
	jTc/+16TKYuKrjnDmB2m90PqI3Jmclm6JrIOaOUB11kESTvBu0MjDY66DMVzp8jvlpJq0ZWqt7p
	2zVmgl9MiD2bhqnOpemHHiji5iKqWOcnm+G9hit8IvqeeXJ4V+8eu+foehL+ouMr7BhXAS3qh4m
	jRUjvW16trD+KV7QE2TveWO0pJWJA0p82lxmg5j519GiFGSI4g7WNZ9QCvHajkJFy+INDVtMNg/
	J6chQ25o8UGF2lYAdPG6HVExlDWE4BWpULABpWT3ODl+arLp3IPlgIBLbyJlQs7gC8rQCR3v3bD
	jbV6tY5yi9bHn0EjkzlFoyT7ha8kG7VypKA8=
X-Received: by 2002:a17:902:f607:b0:2c9:e835:ac67 with SMTP id d9443c01a7336-2ccbeb1e2e5mr25480755ad.19.1783374059375;
        Mon, 06 Jul 2026 14:40:59 -0700 (PDT)
X-Received: by 2002:a17:902:f607:b0:2c9:e835:ac67 with SMTP id d9443c01a7336-2ccbeb1e2e5mr25480395ad.19.1783374058879;
        Mon, 06 Jul 2026 14:40:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:40:58 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:20 +0530
Subject: [PATCH v3 2/7] arm64: dts: qcom: kaanapali: add the GPU SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-2-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=2533;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qEe8ApyufGdls1/59eRBgE6mt3fqa4nJlBW/WwvTUag=;
 b=LMc5mk+WE5iV1TaH/olVocdEf9bvwVBig/I7ERonQcpX3Z63ura+W+n63vue4peLfqeMvQt0W
 tZxG2RqFMvbDzM/WCwXmBJBo2DW8B0e75hW8EtxLW8A48IujYbwUZN4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfXxIYwmyM2dtag
 +kxLYfKCU5VmttVNvyXtJTB01fYSvdi5sYXnx0FjKTm8fxC4qYweuYPMEi2NwqI6Cz1hUZhhOc3
 zQvOaD42o193NoCsdAYUQsFL6q5Q7uo=
X-Proofpoint-ORIG-GUID: F5oShpAYqFBQTYioewYfA8umls_UoagE
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4c20ec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX0sqkUFXvLYOB
 9Vsyf2+TEOrErAxFpN//epYjCIeoxSbLMUDY5hG6/J5nB0qDrp2kc/iA9lqX+5O+pC6j1Ta1rDG
 LMld9xire+/Y+cwdRHg96XcSWa/o1rb2m/ITdePW5bNZ6tn7mA/+LGo2eCpqmlIHeA6kNsT1P5r
 C8+PaK47bWTyJfcLBjlsicCgs20HGC7AY+DaWQlL5GGBdt76pZ2uf3AP4MXoxyvfvAsUU/gWp52
 dyGKloNpXsMjjh9rOP4Ib9QDfXslwjQD1etThW29s1VD2XO8Vftep3TFv4TMzFoNR2R5kPSp4Y8
 Xibk1gFadh+3iHeRtg/r8LDdmy6ayq6jQI2pTcCmtiO+MugkEfl6BVsKz7La1v0R31SuKJKwatF
 BYY1clbDVoiKf+7zC3kvcjYjdU/zpHyvmCrBzHdUhulv3cZrXq24+BZE5psHX4b/zReMhw1Nx0B
 s3Sl5W2qlp9fDwr3sVQ==
X-Proofpoint-GUID: F5oShpAYqFBQTYioewYfA8umls_UoagE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117045-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:quic_qqzhou@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 760A7715C8D

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for kaanapali platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..a41962366941 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2601,6 +2601,46 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,kaanapali-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;

-- 
2.54.0


