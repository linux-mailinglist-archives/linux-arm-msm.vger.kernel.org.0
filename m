Return-Path: <linux-arm-msm+bounces-102576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL9QL01z2GmodQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:49:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFFF3D1EF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE13F300824A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE85E32E73E;
	Fri, 10 Apr 2026 03:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpkViu+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POTswptj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8E0330662
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775792961; cv=none; b=Ohe0D/PEtrA9qZC9HMuoa73IXEyOqZLAS7wyIQ0CYxm3/tzLImAcwuH1NNCVvURkRigJLfGTpFsv7P7q2C6ECcz9YeKkk+148esOPf3gMMgSnsAVSrzzZo3iW6atQ8FHSlK2vB39+GHbrEPDM0RM+lZI1M+SDmO2EYWZplsuS9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775792961; c=relaxed/simple;
	bh=xndMnytD46oNcdty1II0Pt5GXVR0jc6Q7BqQXZ6JaeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ROdCRIIYJEWbO4Kz+uvQ2uh70zpJgfi/Pub36dc2VjDtuo0e5itz++kSGw+AuZukd8LtPwALeeDayi5xFw5LIbzVbGyXSgIkHnfzOYTkZ9tfbIYBbWJ91XMUwwtrNwlw9y6xltFU6D/BRlPeqIdyolnB1jdGxKTjRQpib18CSpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpkViu+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POTswptj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639L0Xsp1972554
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yPiSfrQKsl/VRd2nw1vKfMGzQDLRFPCgUTkp0DvqBBw=; b=ZpkViu+ezp+QCJU+
	dGZ47mzKf4ol7fgo3MfL/lNfrHztjOBKF9eghgzxtxc4Xcd+JgD1DJTpzYuVwJM7
	Bunap4t/fi6aCQQHfyxmkeE/G11utZW13B4Ax1K3YAugKrL4frCQScysEVqs95pK
	QTign0hAV72lLHXf8TGfG5lq52GY7JMYH8DFKrHIQBGUWGR4EtKe7PM8T0+kehq3
	qYsgugxUCpApIxCx3AxEQROiS86eDo4w2O1xenHpmZhyi1dhI6nBlD2zknEKyTFy
	n77OXAvlCtnLCn4gcfYorGrU1XNyKvpueYFgxiH/qlCZUh2JtfTE3CWlhmAkHMwO
	2Tv9xw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms2k3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:49:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24611696eso13787465ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775792959; x=1776397759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPiSfrQKsl/VRd2nw1vKfMGzQDLRFPCgUTkp0DvqBBw=;
        b=POTswptjsbdGa9NzD36FbEd66z5p+vNmRn64dD00Hu7uP7JMEf1oMBjRgJQDQoB72F
         kvIOs/ouVFAMZuTDAKXtY6q4j+nkL/mKWH7sDzYjKEXashQVt22VZ00Wv5Pj0D573tZ6
         26tqUw0LLtrMGruDlOpz2I1amcQqiIhqnDu3oyQZpom5jZ451hvT0axSVyVK1pjDm1z7
         5mW7ZOib6OZOwnB7cfqCF+X2SAu2+0SLrURox191gklkvMPNKU9Y3vl2EGHgIt34XdzS
         kenLcNwLwTM8b6LQBm75Px+9R8WWFLznJvPWQruRuFdjGRjMwi7aLoEEBa5Tr2PP6A1r
         IO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775792959; x=1776397759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yPiSfrQKsl/VRd2nw1vKfMGzQDLRFPCgUTkp0DvqBBw=;
        b=s+FDN5qmjrxzjTQDtyiQtci+JqUwgnJRexeSm/Gzz1GxKqJj25RmWWwnnP6k+/GM2C
         3MvISe+bVknzHjOCItHDjnWpGE8C0xNsqcLWSTq8lJQFYde26T/fmWhzLI9K9D/zDISt
         YXQQBUFNgvNDKvkPaQCUEyTE6mlqdeazIgfIKLKAwYVDibiNcTFjpGZDgCLhCG2WMqzG
         8mEHa7uTvDLiPF2BcWoTbrtNoEQuw/tNT/sYH5XsA1Ixag6Lp54LBaXasCFzJ8yhtozm
         Pn4nNHNfe+/RAHZP3GQ1xD31QvP8BZGZzwdRix1iNabhS+dbJP0nvuD9YvESAf/SE0Vi
         1eDg==
X-Forwarded-Encrypted: i=1; AJvYcCUH+ikZ29uQVlXBtWbccnBl3Q7S9et7XA5VnFI+WJ+2Yw4RyTSf+wVGdzcmKiWpMgm3g2pppR1SL02TjCzf@vger.kernel.org
X-Gm-Message-State: AOJu0YxV642z7hdypVDEi7C87znhK7Nzqye0pPhFKzdWQqj4dkrguKK1
	ce+c4v/hZxrhwedT2s7P77Xk7+dHzgZNzvW2Rot8TuLvPw0jze2HKAeyB5aL+IOE7wBBqeoVKry
	QxEOkEY5cTXszEYn1b44LX8I+YePpuvq6dnDvl+evf+H5PUpNuyHdADWi+0vp74ECzr0I
X-Gm-Gg: AeBDiesQkG5raBgZyPlAa0Ua+RFHci6wmld2B7rgzjVqJLbOSk+pMWHF5O/WZbmaRXP
	mIOtRx+PXvsGTSZdKewX+585S1oVIeaee3IT3njhgbRHUPjiQkl9xv5oCKqy+tRCOKLuMXT9vdw
	QVhGW22bq7NItJ9SAVQHnUpAMf22H2+hiyWcyJxQ3zfXCvLrPMHSRXIGV//r0S8j/D9V0PLG5dD
	uVivMQRnwH3Cu0rW5kOM32riAzYcTRnm5OpBS9230XvYE82kxyl+0Ehg0ek672pGGxVIQKbnKMu
	I83SioWfR6ruf/AAr3lC4l/aj4ydAygEwl85The9UAMzB+pyDlhpsLGkT4RMycMixXvw07glLDs
	tnw84Z9QfW82EbbOLzeBz3yzju3Xr+9wQQzn3J6vOwFB2ZA==
X-Received: by 2002:a17:902:c943:b0:2ae:c816:ec5d with SMTP id d9443c01a7336-2b2d5a6a0dcmr15477355ad.32.1775792959305;
        Thu, 09 Apr 2026 20:49:19 -0700 (PDT)
X-Received: by 2002:a17:902:c943:b0:2ae:c816:ec5d with SMTP id d9443c01a7336-2b2d5a6a0dcmr15476995ad.32.1775792958802;
        Thu, 09 Apr 2026 20:49:18 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddcda9sm11588185ad.28.2026.04.09.20.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:49:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 09:19:05 +0530
Subject: [PATCH v3 2/2] arm64: defconfig: Enable Qualcomm Glymur clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-glymur_mmcc_dt_config_v2-v3-2-acce9d106e72@oss.qualcomm.com>
References: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
In-Reply-To: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: z-zVBNwejyfv15MkfGKr1R03d-xc8UXh
X-Proofpoint-GUID: z-zVBNwejyfv15MkfGKr1R03d-xc8UXh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzMSBTYWx0ZWRfX4uKLQW9c9aqk
 c8fuN1TepWFXqNtznLVrZ4Tz9zXoiAgZALP8bRcf0prj+IN+cBcFgsnCayy2pTe0SOmxtsoLNp7
 g5g0jtXvcxKuEzpJ2nrF1yiFiMwM3WpwZO5oboWCGsPR4lRyBZXVTA4IdfavR1YgDvaq8Fg8eL0
 2W5lZD+BPeRB1qHUR9ELBg4mwV3RP9vshOfYkHQRvPbzim2cxACtaP5EOIV/T/C3NXYV7SjjteQ
 iMYQuj6wJ1kW5UU4eT3lpfyKV16JyArGduxFQ9Vg2mOLxLqVFjiix/JwSHgILqbqev6PDo2/MHp
 R9i2kJvOfoyPnnwYpd7sUS++ZNpVl8ITL6PwA6heP/LrfokQ+WysA1LbZ3wEf3RvZhmPxfNMEG7
 Pgd9JLRp5O+mfx8jnXkxKl3G5FBRoeXFgQz9dYSQqxj+v3DOL7QkJY6sUvV2jvC3tO0anUbFCQv
 MNw9U3tIdKphyubbq/w==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d87340 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100031
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-102576-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EFFF3D1EF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the Glymur video and gpu clock controller for their respective
functionalities on the Qualcomm Glymur CRD boards.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee854038fa7a756d8b650a609258bdb3..a607bf49c1563d22550c4b81a237d46fe4ea41ce 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1457,7 +1457,9 @@ CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
+CONFIG_CLK_GLYMUR_GPUCC=m
 CONFIG_CLK_GLYMUR_TCSRCC=m
+CONFIG_CLK_GLYMUR_VIDEOCC=m
 CONFIG_CLK_KAANAPALI_GCC=y
 CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_X1E80100_CAMCC=m

-- 
2.34.1


