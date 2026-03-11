Return-Path: <linux-arm-msm+bounces-96842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K1TJUThsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:28:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C30525B938
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DE68305A3CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FC83750A8;
	Wed, 11 Mar 2026 03:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VebJrlru";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkJ1+brr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7168237474C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199442; cv=none; b=ESXwJ4J+xNMP/DnYWbPAIjvLwoZz8umw23NwvHfFVyGRGx+vbuhKv4m8/0vQBPidZfSSrVGMRXkEYIbhJlJDzFQ/Dy8XPh3PFpm5O+O+SbZ1AptRNRsgmzR+VuT6tcI+B9hf9LTPGn9J13KP7WRiF11xsCoZFS+4Gt0q/6C4o5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199442; c=relaxed/simple;
	bh=jQr7R3+YepKvgcTe6jp82KzUXB8bK1KOSbD7btdKNGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EShnlkpubZhrGgmx+NZpvCJ7kg+dk1MR+oAg5sMmE1aiHPQkSlZevILuqWt69wC1xXyQgev3XzHHwqAWtkAkISzJY9gQaLjP9UYHCSEyrzGqFLjdkDwoPJz6usjFpi2gRRVmfkcz5OlmO6yQNSbJ9SgSJ9mfsKwS+ITczN9bP2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VebJrlru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkJ1+brr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B06Y9m1265806
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzMnkl155rfInvEKL9ifI6QydBewp39sV6azipPoMOc=; b=VebJrlruRM4RJj7Y
	KoHO2AgYGh+98lC4YqPurKT1a2Kk36loeY2ZF5AMGo3YzemtkKyAcpc9INS8YQMN
	t6Zui5JxiOOAbiU6qbkugtpwW7UH8f1QKi+a11JldSbOQJOjHxyV7b+CuspJ1k8d
	Zl1N0MjruWQjVU9HvEQbYUScM4FCUoJFCAd375EWKPYxME1aWoSpMJz+jIe5ffe1
	42xMJOp3dfl9jdf4RuaH2TKRTQvDLt5BZkCjZyU+aDdyyi4hRaIwiAXIC+0tMaj7
	cxICBYuSmrWNhuEIjElXnfxBEtOSZW/nimmxMvwUal69OTIeTU8a1LOioCrT5wk8
	E2BnYg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfj3ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:00 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ea014ec7cso2830357241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199440; x=1773804240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzMnkl155rfInvEKL9ifI6QydBewp39sV6azipPoMOc=;
        b=IkJ1+brrH5ODEFg9nvQ6JYOfx4iQRcpauYdzfZxK+vZEoy1on2CTerQ6KvgjoQSk+o
         xRt+zOis6mmyyZ1oeLdHOA4VNVcJyWLSjmAzxnKBWxcZHlsTem+QUOSWbaWDMUM7p9gb
         V6VOVn+0T/J7grNLLt42uBCwASqIrueQitJ1LQAFvIOJPLoguLy3Lj7IEzsSIUBCYoNr
         kcuJyPVbYKo6k6IukU8MFs40/gTTuvkiBgERiIiTrrWm7zuOqssh33oGzNBxboVchAZv
         nswYw5toW7B/K93BfQhqQYIjVPZkY1K/mNrrrDdn2ndo31BqPxjDpfoB+LJyafsveAdv
         aRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199440; x=1773804240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YzMnkl155rfInvEKL9ifI6QydBewp39sV6azipPoMOc=;
        b=hdgaIR58ROZPySdhV7GskA9Uqmi4uQzumrxeroYq/6bW9Zu3iRRZtQTJVTJpQNxShV
         YaChxThwJAWRH/ogSBNtkDkGnlWACgc2RqnpPK3QwmfRzuYYAFHBM06wYlixDvdKZXlO
         5ncrYQ8REUKVtuyGzWu/CHZbSYMe2ZcttrrUCFgMJAb7uXObqYnEZIM2S1I1juf87yCX
         ff/maHWsGMjoYnYCNgqJ6rDOYrQzcTetjWmvbbRZM3NVgfRcuFgWoyGyQ7jadlfP2jLE
         IDGVOxHeAI0OOAS7i6qBm8LsKYqLjs0ACjmyT1ptKI+g5lKh9kM9MaAE/+2lOCl8al7K
         T8nQ==
X-Gm-Message-State: AOJu0Ywql6sH2XWkmRlTnqv3FyW1UX/xCoV8D/USRcGhfqqZVoCcX9va
	KFdlJOlDhSRhsGnN9vxJJ7u5/hxX74omar/IayTqnY585Nnt2yVvgU7FjzXIxBIsyAJLAq5/vEz
	V0hkXre7kqy847xxyYrh5k3oD3j9soEGitq5ULhoIUJou9sitpIkL5U5LKhzrVHzDQk/K
X-Gm-Gg: ATEYQzxeQDyKCBqqtf7u61YSTp1136/ytkJeosZoeThRIowUc3ue/Lb1WnV4jIJEgim
	KassYiJiu1R/2fsnMgbREibSLmrJqK2cNe0o43N2XaBuPh9KY4cmAkT+JTgolye78ozIG7uQ0fM
	aQeme/9zMg1LINv1pBJI9HKweI5Abhjl2DqLvkG8NWmixagIyHdZe4D5h+FUz5YH+umV9HBLfJj
	pC/vqi5UudTGldk0Zt+EcoQwP21wn12y1qcPrlrGYZCVqgwsdgvFJV/LRHBEPxleb5LR35JzfHC
	m+NfumST3Uqp0rseQK8J5SjWJ7/Su/SfSDq/xq3rnVlwpH+FuQjdo2M4BUp9YHGnNipYA+i/KEp
	liRzKHh72ExgQRlhUG76VDITAPL5VOdg/xKXZj8kw74nBSUSvWWod7NZur56pY6qsAxBfIY12V1
	KFUxC6jhqUBivn5h40QnCYv1JaFUPcLw1EFJQ=
X-Received: by 2002:a05:6102:d89:b0:5f5:773f:b1e3 with SMTP id ada2fe7eead31-601debb903cmr367916137.11.1773199439543;
        Tue, 10 Mar 2026 20:23:59 -0700 (PDT)
X-Received: by 2002:a05:6102:d89:b0:5f5:773f:b1e3 with SMTP id ada2fe7eead31-601debb903cmr367909137.11.1773199439138;
        Tue, 10 Mar 2026 20:23:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:10 +0200
Subject: [PATCH v2 16/25] drm/msm/adreno: adapt for UBWC 3.1 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-16-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jQr7R3+YepKvgcTe6jp82KzUXB8bK1KOSbD7btdKNGs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAf2yL1+3Ms4JuzlF3f+lez0I4Jq2l3wXVyl
 M7LMTfVBymJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHwAKCRCLPIo+Aiko
 1exIB/4pNQtbZA7TTqXgzxpx1Kd2zIcePocR0Xp9xUwllg4Nfdmt02e4HCXiyAMVMbE4u+Oy/Xd
 wkE5Irxu4m6NrJDNka/zzKiL4u4UQ0S32KM/w7yhm3GdG5hhGkONcbbfVUZTyVPrkp/EqHQvr+1
 9bTKpYVdlBYY15OBMoNRatJAMS/lKY/iDhOumwm+Ig6jWun7Mqc4+irAFXc75ocemHWzyDNP2sY
 v1jCnSxfy1mvPtTN1tFQeawTGQYeqvWjbUf1oijSsLMpAZVW2TAQ18EjgsGkTNZhVAb7sZ1s4NY
 NGD1AchUG0YY6wNEG5AhLzyeW+py3ZkE2G1tv1QdA1k6GuTP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: lmHLSkShO5Gru_FtJ89ae93wIvHZb7RP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX3loObUiSwqg3
 I56Lys81jO1DaTvipK+RZrwQA9eBcgqoQVnIHMETmxFuEpgJkbJzZ6LGbDq0ayONsdx8aJGSE8y
 BOyQi7MB7UKSCwDt4pqeqomDn3fr65njzOCKhMOWNRfcaQTp3ES1Y/RQISCeQuIQxITiVW2gfz6
 2uw6iSgEUFurjSBGIzraH9Gf7lssvlFEUGSTYnCqSCPC3rGmUhb7K1ey80I4UZRk5I3/ZaDkqlG
 WxsyMuUGjZhdjPlXFwsoacKp2uWBck7aYGH2UqfEEko7xPVkIveNl3SKJuDsXxEb7cbhTUn0leI
 HTNR+F/d2LvfhmDCdz1KajST9iQBRQc2dlcRuFoosa1OktZ6mGFXc+EEsRcu8DwIuXhfC4rMPBC
 qWUV2rgAU+6Dd1Y/Bc8WnthpAIMHfII+PQ+faZGHe9pBTZyd6XnQXppi78G24nFubVLpVe2e20s
 nvKIlFAr2/6sJGzqbBg==
X-Proofpoint-ORIG-GUID: lmHLSkShO5Gru_FtJ89ae93wIvHZb7RP
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b0e050 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=h0EdKdWjJzRczO_IdhYA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 9C30525B938
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96842-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Extend the driver to handle UBWC 3.1 (in the same way as we handle UBWC
3.0).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 680f0b1803a1..45f260db729f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -289,6 +289,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
 		break;
+	case UBWC_3_1:
 	case UBWC_3_0:
 		amsbc = true;
 		break;

-- 
2.47.3


