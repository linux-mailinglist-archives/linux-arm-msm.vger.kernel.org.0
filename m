Return-Path: <linux-arm-msm+bounces-83651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F33DFC8FD68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE11F3AC16B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DAD2F8BCA;
	Thu, 27 Nov 2025 17:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVlXJTco";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ELNCHg9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368DD2F83DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266336; cv=none; b=ttusrMSEd1jKo2LeErCCnQ//jYxWMMiSMOvxhysQ8uhqB6y52L5+7/J7xHalfv86jyoWSvDq5rYTBjsNZxUri9wY1T0IrpNjX7gK5J8gPj7S5igbRuMrAzI0UuQx0FYpgguk74zV36MGlAvIgE/cALKyCUOqe3KTrR93QYI73BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266336; c=relaxed/simple;
	bh=R2VJEJj1wv7bNKZ9HGnx8ZStYGfbOxnloYajFqzbH6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8p1LIN4KOQRxd6r7ZDFBfyX7Egjtnn5VGvMw5QYBUZcrXf/TOmsGZyJ+Y7laPeO4PNnF1X7STQXc6/U7AT3aftmeaD0hJYkk/XBY84B6JPPXzchJbxbvBYaGxvW+WUBbMk7u2Ut1A3i5oWLgteiF9hQF9fvqECugOr0qfUddDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVlXJTco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELNCHg9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARH2fTv1592113
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPt9ZcHSLXa22nWW1rrRtzNb1vBANkrucG9jU8C8YHw=; b=iVlXJTcowYa/CUBS
	Iwd9paELVTD12+Br4byiKbrYSGCuMwStx/2E4IGJI7i9zJOsvSOf1yNjvXyre/E2
	9ODWl7wOskLq/AQ8plokSOTbC44+rL7EVziro9tIncJgDdHREUUVbApqwiDN1C2f
	fzJiZXRjzqHOKlRjZowCXytzLxe0TRnOYKmIXhthfwlCOb1So9dCPL5MT9knLxLN
	3onOXt30lkkOAttY9FBHm4vk+OXXRHuU/BQPtdcoWntNb8WugdM4uORNyW7IcD6j
	MqzarJ8reXoAZbl0KQkbiTdF+Ye5hEWT9jq7GOimEsuJHEl26OYgyE0JEDm3E7Af
	tZGn5w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aptpu83fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f587dc2eso20408505ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266334; x=1764871134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPt9ZcHSLXa22nWW1rrRtzNb1vBANkrucG9jU8C8YHw=;
        b=ELNCHg9cF9DxNFyysR2FdiDqTVu7d/6LFydd9W3wWI+QDEvR1zhWm4lf5xbjpG/oka
         H/6Irn6u6GlRIGuoc4uPxazHGBzLwz4QeEzmZGO8ffXMeMDV9yGoF3xdGFImQdssS6IW
         0OSgRrOoWCH00CdNqD88SuK4F12h5OZxGnixN2LJ5P7iBgR0s3qqtFgR1wKVtmvxpww8
         FsJ1byzxwMb02fVnUTp//YNGQmrLbhbd1CpfzIgFcesFzwERF1vLW7Lqr4U6kv7naMzk
         qJ1QrbxnZ89xYHsVn5cd0w6o7tzV7KSQYDC0B5eVlRC0HezRtXc5HC+JC446gjkFqu/C
         ASSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266334; x=1764871134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dPt9ZcHSLXa22nWW1rrRtzNb1vBANkrucG9jU8C8YHw=;
        b=G3m3lh5180vPk/8zhHfKgt3Lxiyrdot++LpZrK90n1sq9DZYLGbXugCM5IDYs48e1O
         0CRcBTW9j+kMg/NTm3VA1v1Zq2xacGeiBz9JVvWc6xkxn/gF2ByCd8yUwxJkoGKTvsOk
         sdJjwJWXW3rOzIMPG7U+25+2oTzV4uUObG/SMBIHdNi7iZ0/1zZxwB2hp/ZHH79rcV7u
         UuHRGfuMSgXCU4w7DZ4YSVY43pxIhSA+bzMMa+LqMGKB/ycyqSGYZA+wg3bQLKHc2Krh
         ghedQhNu3gyLflprP5SNVFa49EfN2TTj/izl3SwZ/jTfiQieW8ZJfWJsOWhP2HUigQUT
         vafw==
X-Forwarded-Encrypted: i=1; AJvYcCVebktRKDYSg0u1CnFjIEibLgOo69dbhcE8IDTKBU4R3CMZfWpdjgKmvV0j1Jj1qG8ozYX21Caz+BR5qF17@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0xsd/htaC4jKlGjpsfJsyOpCMuUbGbkwzRPgppzsetMu7xRPK
	CRtr6uknB17FMgCn8o6DJnGIpxtwv/LEhxtQIfyvTVZ7/f0yRi+FIgNSqnrPuc9cC1Z2FYZKwUv
	0Z4xyrgI5k+P6xyUR/Alug3HQlRVyGZp1nzqbPcxYuV7qUE+cfexkejK4p0+0F/aIwbOh
X-Gm-Gg: ASbGncsiUluMsGIdbkJbTFP2oINW0OId/P+MzIixfVkTyey5zzvkS4m2H1TuU1prRym
	1hMhTp1BCaDLVeUr2UgziPaCsBHUCIbU6VFFbkoYsThYZwBnSNwyMYLc/VMvG3gn2SLs6MtDQkh
	YoV1xrHHR1d7SCsuFP9q+Mkw+i5GRaKzQnO26dlQbnNuMtDfc2cavWMqAXvFLoyo7WuDuGA+LOj
	ZJb6gG3fYLLzKHJIhDL+ZKfCurZP8UixZiEK3faE12d6jl795bpJKoIYoqNjvMQZ9Q+PfuLm1x4
	jpjeRrrMMqESP6TBGwV0WnkorpV45HijEmFUXTAkMETJopSEBAJoYKkJ9I9+d4F+3I+ycsKuCFk
	ZQDxd8VVkZFds2Afvul41HxbyPDqylFUjfN380i76
X-Received: by 2002:a17:902:fc43:b0:295:73f:90d0 with SMTP id d9443c01a7336-29b6bf76f59mr269115705ad.50.1764266333820;
        Thu, 27 Nov 2025 09:58:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGc9yg/upMpoC/v3pdvwpbyro3tbBhB3f0/XGKb4wuyaQP3AvbUupqHW/mpvCp8W/yMubiWTQ==
X-Received: by 2002:a17:902:fc43:b0:295:73f:90d0 with SMTP id d9443c01a7336-29b6bf76f59mr269115275ad.50.1764266333351;
        Thu, 27 Nov 2025 09:58:53 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:53 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:42 +0530
Subject: [PATCH v2 7/8] clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: JfUXoU7__XKoXUVEpOTKGmRlIVpggy8w
X-Proofpoint-ORIG-GUID: JfUXoU7__XKoXUVEpOTKGmRlIVpggy8w
X-Authority-Analysis: v=2.4 cv=WIZyn3sR c=1 sm=1 tr=0 ts=6928915e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jpF7Y0NODDEllFhJFvoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX1IKPvIBFroTV
 n/zVHtMuOpz+zSw0L7H5IHI39wjVF7F6rdpgG4IOd48Br35v2JEDHmfZVbneIba4jKHN8q26c5e
 89coLZcHng7NjJwuiP+XHkSR22Uchq65x0HSV+p1KP+/24EY7dROUTUrX0nL4JJmOPi/MZpJeCr
 fFWojKNHRGx//gY/XvWRGSwfV0TxZcUvCdVORQDNSAcJl6u1DoVgYQu/O+IbyZve8MosmitFuMV
 cuYtiqfhbNZjI9yT00qG9NHx8Xsdeqb0pR2uITIvK6wDYhn5t1COV2EbPmzfxPObevnJMpOF17Y
 3L5ctKfll7YKU1iYGzFcnjry2a54IajCcHu8mu1hdJtSPgwApg+enn+bGKti+DXGtajgsMA1aBv
 +x4+/1p6rteOZp8wrRiI3p9dzVaYGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270134

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: baa316580013 ("clk: qcom: gcc-qdu1000: Update the SDCC clock RCG ops")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qdu1000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index dbe9e9437939afbcd50759dfc21a599864278816..915bb9b4ff8130e086ad6b5bb8872c79617afee8 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -904,7 +904,7 @@ static struct clk_rcg2 gcc_sdcc5_apps_clk_src = {
 		.name = "gcc_sdcc5_apps_clk_src",
 		.parent_data = gcc_parent_data_8,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -923,7 +923,7 @@ static struct clk_rcg2 gcc_sdcc5_ice_core_clk_src = {
 		.name = "gcc_sdcc5_ice_core_clk_src",
 		.parent_data = gcc_parent_data_2,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1


