Return-Path: <linux-arm-msm+bounces-117032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QVYECz0aTGqYgQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:12:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 798FE715A5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:12:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="FZ8j/Qwk";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T+R9WczG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117032-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117032-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1092C30071E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8514538AC90;
	Mon,  6 Jul 2026 21:05:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BFB3328FD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:05:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371921; cv=none; b=BOOfI/CO6RgeN/pXtA2HbBXSDqI4z7NmsHkie6xqakXudn4vWuQNmQ0TMP3Th6uwS8WPStNkL0zG2+tCNL+gMUdXEa2qGuuLzrRKW1ZcN2H9OoivVfOVgfch/4teHx6FGanZuz7i6gJM6EAlnNQtWcvoOap2MvrNi3ybT+3Lkk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371921; c=relaxed/simple;
	bh=rYZUtLoMbkIwkI8yFMTr/hVq0ZeMXm4yVfo/qe4LXmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQAah2wxj2ghJyHYB2eXSuq83q8Bt04pXpoT/NH3+OyESPiVXd5OymMEtPXfCZ+JfzUEj9b197phsOdJFSpvDATvWGE4/37JlVHhTQ5/n6yVJnBHCGUpM20Cd/Z+dJRx80sWTNmx+9G8tDNGBy1vVL2C0TwuLpf6FFvswCMtdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZ8j/Qwk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+R9WczG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEN8M1429170
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=FZ8j/Qwk9OdN6zki
	9ictFYTUl26CmsJYocIGqx+ILtabVxrVN4pGZTTBfkHVczbK30QYv1weMMzUgYo7
	jTvI15GrM1ZEeAKXZsWDSdG/v0AqxDI/Z1LOAL3S+tIvqFmjQddC0zSqrTZXrgk3
	MXvTtfINgtJVdUPKKTpJwB5X3aaEscjc1Dey6kaJH36Ejtmi6XyxullbdYrT6U4p
	HJhLF3n9kQmTMnjM8RzJBvmFfZIxZ4IgVvTJITr22wml8oU1r+X14PwhJAny0D02
	rmO0CfyqzN9iium7+AW3oW/jQHFlpy0SpfcZ37eGJnznIs1O2UN3W0TX8jAPQbZ/
	DUTOVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxuhc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:05:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbb61893fso15169905ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371919; x=1783976719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=T+R9WczGv3Na8pnNoroarhKY4hyXUWGyo3gaVSe11d7YfmnQHLJxmhBlJR2+G9eta1
         W4I+PaUxEL7YrN1qxaxuA5y/33rmPsNrDFf/UhwEjdDHfee3mOQfBaIGwjd11b4XpNZi
         ppWkWDliyyLmXT/v5XUE2HfapRP/IyreJSYzNBeSDiFLDhi0lBS6p7aoKCroZQtKN5yC
         sHLx+fcO5TxR7N6YFVzSMiQC/nGphkc3Xi+Dvb1i+ZpZDr1IgbC/vk69/aVQQq5km1Mo
         zmb5IK9VOeqAwG4vJ02i+hVOl44mtakNXtk8VSPpCnlJFNQA/uGFDmUPySC/WA3m1vzO
         TT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371919; x=1783976719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=cTrQgM6ccmkXHZvo1Yo7r5QEonznk5RIxpHhSCJJgS4ZTrhM5USLU7eED5yBsaf946
         f1GMdaMFqtNQN2frGm28YOCqRuXtDIqqFU7AF3mzBcqvSTmfgHGZOQKiIBSn68Kzw0aR
         N6JBaS/sH7nBn8M7TxVMnBxM2EeXfV+xxxAv1dk/gG/BrVk6TVRY95E/QkgOuHSIJTDO
         wYA3eSfFoLH237Kq62LOIoTR7GoMTuO0Fo8veb7ABU1T3pcBr6UwJCIliY7yLaIIBKiG
         TbRAdM4uoKXwmLik9xp0tFPPkNeUQx2dph9SejyoGt6Wh6xqqeE1scaQT2tdUVsvEoFa
         9gGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjhhrMZQOTKmb/wytqmZ584pxM2XvXbywioZjl9Ih1obn83siULJVbSIlMYyy9rTL8xpJxu0L7438SHPaK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8mzARDFVN3FRMofqkJqG8PVZjLAMf2Z+3qWDaM1QPBObgVzNb
	ShbPtSpK1CMQ3NbDU9+gFjCWVshAcrTn4qiyl9WVKvS2o/MIqN2JnycIY5nGts2ltR32m326T5K
	Y4kGjySAc0djTWRh/S9n75oJ1tg8aVBpSCfseRwqc0ERmdgmUYJnJ0hsZRBhJOuX2ey1Z
X-Gm-Gg: AfdE7cnCJO6NaD12y2psAgytIjmgZyl484HAszN0X5NxtOxuge5++OLQIOyGLXxp56x
	OBt0jPkyY3D1gXRLNGR+LNnQT1qh/qRwYqH+eCG+4mVyczA6gbrtkBhnPyg5wNSUktkgpU2Nsir
	x+eZ5rwDMBu0AS8rsnXqbmwL4HJrerrrKQYKw72GD01GoiivJ1fHUcQTEPrYOF5i3I29szDxobh
	WyuObpPbjS3E2uhZMcLu6WwXG+18fpRIk9zEbi5rKMIKQ/sQhhM2xTRnqofQ6avtvkz7WaQViHD
	wzeyd6ggFdntu7p4GsS3eKr1KQsWTkWtlEJLA8ITdfeGPOoe8rDRi7Nc4sC+cOGCdIw0+S+DBpY
	93ATTpWDtUVcV/ajSdxJaQSlgmO+8ycohTsY=
X-Received: by 2002:a17:902:d4cb:b0:2cc:9473:9799 with SMTP id d9443c01a7336-2ccbe71f6abmr23765025ad.17.1783371918740;
        Mon, 06 Jul 2026 14:05:18 -0700 (PDT)
X-Received: by 2002:a17:902:d4cb:b0:2cc:9473:9799 with SMTP id d9443c01a7336-2ccbe71f6abmr23764605ad.17.1783371918261;
        Mon, 06 Jul 2026 14:05:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:34 +0530
Subject: [PATCH v5 2/7] dt-bindings: display/msm/gpu: Add support for A704
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-2-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=e0reXjU4841qQsB76OT4bfKmGmY/z//RRWVRYHDWGzM=;
 b=vX6elNuOWQ/4xTG/AIha28ryHCrqCz3yvhkLfw4vwe9YMkegmgcm19fBeyeVORd5TxSW+WwUC
 /8wVZA0zXpkD5agy1gfq/6ZA/4fyK4Fhy6L2Kfebx+YnGBJfWNznNZy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: A-y_XJnNxZyvviMfPdSWXcs4J30V0Q3-
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4c188f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX1SS5iEaJW2L3
 XeLeVAMX2YVMHuYdfwgh44Lji/xJtAHa8bzaYiIWoZy+csR9TXl52dtyc1ynYhxmrEwLTi3FdsC
 geg7sEeZrtGIUUKZ/fxVoEpKV+9yY0c=
X-Proofpoint-GUID: A-y_XJnNxZyvviMfPdSWXcs4J30V0Q3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX6IorxTNth+k1
 2HiDXpPe14uEVhSyo2s4HqyXZYYwWquFhiR+exiQg5sh1s0aX+9FJUO8kanRFxK9ZDUaIwVnTii
 1vIROq3xVpCTnMKbtrOZYbNWfWCbksNqeSi0h5AYTShaJTwyi9Sn7GeZaN9B+CsVn0iV03sgB7J
 3q2Jj9Z5zc8U8tjEu9hoGmjlTy+8sB6NhYsvOwbzubKwxXjIgTf8vDP5kmgqXjGRRAoLLCcj3wo
 wNyQOBTXVW3iSFfTSTGrxquBVw7dfxUWcqQCvw7zDEEvK0G42ngxB/hHJjQfOjKu6URaGb2xISV
 FH113VFcGM6ppecv0X/jIs/2Ufm7IrBsa0zwx+xvntW0XXV0MQGHATXZCqHA16wE8rTEErhQQhm
 6eeXn0sVe8G6tiU15xlX8gdGUlm/uWLBvWAhOHdYnKB6JG+ZDy+xMQrx7bFF5HP71lajFNjZlS1
 z1r6PLgK6x4WFQwiMVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117032-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 798FE715A5E

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
minimal changes.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..8e648bfb3b23 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -353,6 +353,7 @@ allOf:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
               - qcom,adreno-07000200
+              - qcom,adreno-07000400
     then:
       properties:
         clocks:

-- 
2.54.0


