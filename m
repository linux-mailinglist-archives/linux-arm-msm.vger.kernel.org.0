Return-Path: <linux-arm-msm+bounces-111198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ItRuO85xIWobGgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:38:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2963FF06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:38:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IKKcfbiQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WcQrXFMv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111198-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111198-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D42643111FE6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0974779B2;
	Thu,  4 Jun 2026 12:31:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAB43D6CC1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:31:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576305; cv=none; b=kgQlCsmEDS2/bCoOGMUf3RD/nYZTNTZ+Hg/kxlrd6oHs+fCMoAIG6ihCSe5uPon/mt22l7PLRMP1epeSniuUGe+DCuMEMGhj7IhCiwbWab45H5QOCBVU/4sWQZ2Ltqr6ncUeqVaMP3oFS4WnShwTRFkLwBnvjTPAjFh/fUari8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576305; c=relaxed/simple;
	bh=RszZ82isccZ6HTay6fmDewNiy8+hVMevI+lNe+sJbQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8MCGn+XSoJHv31YS3wvO7TEePPGjJJUSybvAvKFNHchaVx/hzIVuSbyDIe9vI/Tk37ZqiVcx1DYyCd/Le1Ph4ax3yjCw3Zd/wbHUv/1FfE7EPRvSc+JWfa5pR5vZEOsIutbDo+LNOCEvGWxueYffDmQexWss4FpVJ8NFJQU4AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKKcfbiQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcQrXFMv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548pRnj141438
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q5uBWSpIKAMT49XBoIDUyB5FAbxKelakvTHVeHNdNyM=; b=IKKcfbiQd4EX/21Z
	A6rxQE9bFiAjZalDxu5w+ZGExnX8akdriSFl4molN+SrcgB++6I0Zz4D6csgi/sQ
	CkVNQzKtcspqMHIMbZ/1Ew+/EPoQHgjinFCqn/7pMn4rSYhCZnRQq9rB+syYX4Hn
	U8bahJGzatQZUYPRngyTONXjAYU/hdaPQwlJkXUdaL49+8OZ5OUWTawcJv1AzgiO
	wzfdrfbmomKfTVnyK+YMhzJ624xZi+WLOnryrOe3b/ytmmDLFIndfHD2AG6xJSma
	FpzkfAznOuLB+XGDmEH92xNcfq2iYNYcc+4yQqPVOd71y51JDa3IluqYyS57nmUv
	KFKbvg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyenaab5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:31:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a329928dso1088777a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780576297; x=1781181097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5uBWSpIKAMT49XBoIDUyB5FAbxKelakvTHVeHNdNyM=;
        b=WcQrXFMv9NNxGZqw6Nm8TQJZ8MvSKP+H7FJXIa0DhXlV1ddGODGSDcgvUU6+NpakYl
         QJrx49/ULlh0YckZ6KRJCf2Yf4CuVOauDqLjEzpHjhvrvnYxDVKEND+u/fkWFCDiTFHc
         1jBqXXb78EkkGGl9ZVBnV9rnw9Ix3Hv7t0k0FRnJ25zcZklMBRLTtpBt529r5deUMGKE
         I5qIW5A39hALfZQ2AuyCDFF3pQKqMNPgu6S3/K+cHknoOaiL0dATBMv8fn9nS4CdQnZV
         8TXykLdSOt4ZjwAG8ZQT+z0xVxTpvoICjxwI11uk/J0vkgliEiLNBjk4glRfQbhOscD8
         KS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576297; x=1781181097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q5uBWSpIKAMT49XBoIDUyB5FAbxKelakvTHVeHNdNyM=;
        b=gnAOJH9DZIgXRXa2wjWiBusPUr7TOHeFt1Y0FSenhWzsPOS+WSUVRqji5GC52jyAw4
         Ll2hTVJf2pMJX2vxYX5wsCDl8NKMtOj6ZDfOHvObuwuOanccib9gsLQBBnfomQHg4nUc
         fl9tHm2uQvFKJoskEQlZxuKZEAo6xl+k22JXv0KJ+TlOe7wb2AJ4hcDrYQPdfZPA330S
         0wA34DLX/BGATg55QzjcQqgpLn/4LWjhubl/is9N8esItjDQyl4/psAIucznm7piyRv1
         vp8uq8nwuWvhbWA6dKwpkaixmTmxNCXWHty7cSntcoeBg3hX4/+u9bQn5DVvz3CRTBra
         Qc/w==
X-Gm-Message-State: AOJu0YxhTz+4A7yOXHoCtoLHUmD7TMo5T0FqghceCvJKYfwrRDACXcXD
	WmAKhWl+llHvJAFoKIHV9VHNTPW8RPyqcV1yHJEt4FCaRrP/FWxWEzFusHHfHiotLTJYjzevCzr
	aJyPB5TfjtKujGS+UOOgl4mdi+5sZVljxSFsD3CRHvd8gMMGHaDDcA9zERBS5662UX1u6
X-Gm-Gg: Acq92OGddfkQc+CIqmNTJXmiqXAoOnDQtqlrSiGWiIrmmhwjcsEPwKpI/lxb7L1gQz7
	vWmgc+dAJpfGV/Z6ptawq9UTs0wQtzh2X0x0wsqBmRfDrRKRpU9zLXZ45XRV4SR2NESlHYyju3e
	ceDr9qZqB7NYDUqgjyViB4j3dP4zxuWuwpqRn94SN++R+x79n1Hllll6h/nnxgtMP77MQotX+i0
	dhKZ2vYTutfqBt3iSSoSYifrYtHOHVMMwbBF/blmmqU1tQEpSvm3Y0t4JCVCpXILd1F3N4Y9aJd
	j5+eFX4kcO9dLz+jhTiPMly/lIyXS5Nr6fFUhxbVZ41kgewtDaZxvcYMxgkuYIZwoKOfIGuaXyj
	68iv6wlIB1X86o4042+1s5G55t2C4BlRIE/cUPEiOgSOktEvpLeDZ3MxZUyo=
X-Received: by 2002:aa7:8887:0:b0:82f:355a:857e with SMTP id d2e1a72fcca58-84284f19a34mr7916007b3a.47.1780576296723;
        Thu, 04 Jun 2026 05:31:36 -0700 (PDT)
X-Received: by 2002:aa7:8887:0:b0:82f:355a:857e with SMTP id d2e1a72fcca58-84284f19a34mr7915977b3a.47.1780576296198;
        Thu, 04 Jun 2026 05:31:36 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm6015917b3a.34.2026.06.04.05.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:31:35 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 18:00:49 +0530
Subject: [PATCH v2 3/3] soc: qcom: ubwc: Add Shikra UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-display-v2-3-b3c1b2b67edc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780576263; l=1005;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=RszZ82isccZ6HTay6fmDewNiy8+hVMevI+lNe+sJbQQ=;
 b=b49w/HlsBNCONlirsUpO5rkEIu3aZiKg8UbSER51g6trjxtIHBA3pBF3VltP4RNl+n6X4WcDy
 tWxKEYVttzaCry/mB9JVehbo1q/1hFQVEJvE8KFVIUyofFNpmhHZ2ea
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a217029 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vtxxaatxrD0BdpsZsnUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: A9Fo9uCHbevzF4gcrv-dGczs9a0iFekF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyMiBTYWx0ZWRfX8Nru+J56RbOf
 I30jmAf/+rcfCybQdp1V8bNUFe03UerBSUkMlDqKVmmOMat7Yx9UQyWJWzgQbJXuaKsrvv7KSVP
 GB0UNXxsA1ior/ML4coDV7G3zOcQWqcgvFY6z5osjzzXV8ao2mAix13zHa+y65saw47bbQwupUU
 juNrB+PSY3ZK/yzWHlsbyNJ8KVNbzR9tX+0vZcUDVnYLvNoAcWgUagNzHvVdeGxOmQNi2eMt9yM
 KYih5oUDNFy3J8G/bGVjKGqcOUSPh38L/KOI7I86V35Z++U4rBm4yrudSXJ7DlAdbsCs9pEDY0k
 qtkbrbfyX1ftpicYMtL6ePttS0Pow9Y40lNOZnv/q6xjS5yBaxfiggKmDA2F9g/3+cunQby74OV
 gMwaUTAhmOCYpQNkI0lKOJNQcJzm6zQmyM/h3bLMs2Kxr8M7en4k4w0Gaet2aNI52J02GD8RMOc
 lFyB8Hy2WedykS1banA==
X-Proofpoint-GUID: A9Fo9uCHbevzF4gcrv-dGczs9a0iFekF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040122
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
	TAGGED_FROM(0.00)[bounces-111198-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 5EA2963FF06

Add UBWC configuration for the Shikra platform. Shikra shares the
same hardware as QCM2290 (Agatti), so reuse qcm2290_data for the
UBWC settings

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1a2e54c6480d 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
 	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,shikra", .data = &qcm2290_data, },
 	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },

-- 
2.34.1


