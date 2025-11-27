Return-Path: <linux-arm-msm+bounces-83645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC52C8FD22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FA983A9A5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A238A2F530A;
	Thu, 27 Nov 2025 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkoCd5p0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dE2k3akV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116BE2F547F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266300; cv=none; b=cgSR3NSFaw4dmM2HY9UcBPBSUwhgFTrhdDNlLNucGUNT7sdL7+sxz09DfyxCse8KHKOofrRumtBXkk/Jisp2oTxnV9j5iYBXrDfrUN1wJqi/71QIb/sFgnheCTzXnrKZsZv6plAJy/a71XPLx5djeeeW93i6Gar8HNBuTSO/NVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266300; c=relaxed/simple;
	bh=HqgIgiFAVIlPjNTzEERqS0kjdxcpXgmK5UyJN3a7JE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDWUKm1Ws+qeQED9coF28Pr34QvG8qOOac7+bcf+dnN510VQTu1ZM7hnQYdPtjXyRigOlC8g+Vo/5+qQ1opE7AkmtIsrH7KhsTLBIdFqxnhm7DJTBbgceQo/mM8NxSMcJG6zDluPwssSQZL1zOvYFIfRqQZmKtr9+YWyKPkl2es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkoCd5p0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dE2k3akV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9bEOE785240
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfserirmGFWLLxsgJLSEJSByhdJnOKDNDQLUMvRi1Yk=; b=MkoCd5p0R1TNmtHr
	NMQTIVBd9srP6IxLh6LsBfJbODQM6Zn0V/xRlCUkKJ/Rw53FPLkASmyD+F52lwMg
	tcZ6nKPHHWiNlgE0YQHTL0rOMgdZc6LGd7iQpYyDQJQMThmQYATuJ27urCTLmEVC
	wrQyLMpZUQVpxCRlugs+nNyNFNQ2mwaYL+0aNWNaZOUvb/ndGM9gN0ztYSXR0U3m
	12s3KbTM8Ak1ZA3sk7NHiD99yU8XgRscx89d6hEPgT4p339MuF9W5GDT2NZEKxLn
	+KZMU2PcB0TOT6vBJrBTtMBQ9XQum2eVIOaqhWSrUe59GrMk+hLzt2j+H8GAI53L
	wXbNJw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61s75q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:58:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297d50cd8c4so36352945ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764266295; x=1764871095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfserirmGFWLLxsgJLSEJSByhdJnOKDNDQLUMvRi1Yk=;
        b=dE2k3akV3girAsUd2tNPfs2sskwxkkUx1EbNuAPoosQKWNGoS/8Zx3Uy5ASB2bqrXH
         FAZGk3QitYw5RL5iwHokt1iXF4FP6Xv804UCcuZbVllRQO9tIUcyKEhwOSpTp9fJwnyu
         udMyYKrZD7Fv7sx5FMDD2V/y+XGqmpGkgoxISKqeGn2n+LbsgB3jofPU70/YC3FIASvf
         Pgb8M5Q6qFZSshbOpoZHrcKr/3zhl1J5t0re5/ktzSP+oQB0sWChwrfFtc2QRtxpdOB2
         r9Tr+PLOxuts5SKDMowWU4jNZD5IIeJYUn+e/3KbvnZytILjjaTW+BWmHZq6dH0R8hGH
         +54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764266295; x=1764871095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lfserirmGFWLLxsgJLSEJSByhdJnOKDNDQLUMvRi1Yk=;
        b=QGWzx4Y5xle+FtqqIU0kNuV/Op8+rUxe4ahxT1g08eArLQ7Kh9LJhZ6v98rDGzh5/L
         QjM5dN49kAQ5rUGle6dmBd0TsmQzxzw5LnyjL6ejAUaHHk54LdSMzbJ6+qhGL1FbcCwu
         HmvRyfbQ9DJTqIPz11Upy2dE+vPOhsI6XxmpePdG/TM23iAbZHdwhrE8b6Ju0tkiIZMw
         6t7zRtOf+f5GjRo1KHn3+1U5bUtRUK1xT5hxWanlPL4MhaB5nRlO++/SOymEBvTve0ms
         +ej2J/cjFGk4bf6EDaPBGKXCc4H2F6idH+PZ2KM0BRVCNj7HA8S3eAXV7k80FkvmgJ9c
         jMUw==
X-Forwarded-Encrypted: i=1; AJvYcCUhfC9s8zT/c8pwAX5/5iwxaQqwdEDrP454h+5ZwIBJfOZzp3XYaKoxfWOecoaN05eQ0u5yWfK8lTdl4XRb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzffs/nDGN6y3l3emKWDZRwq1AZBvaGOTaJKtlcFUJRO9oyf9K5
	8stRTGcydW2hUk2f90nWcmaU32wHgu0I3aLvMLySiyQC/J7+CRn05YtIwcanaLy13FEWpjH6XAG
	y8BXw+gz02FAcMxNqzrb15OVIu8bkx3hrgJ0WVWb/kHdHdmcyNRaUGolv0ZeoG6pC7nL4
X-Gm-Gg: ASbGncvorkvPLDMDAx0/l3h2CMzS/uDkkPT1PT08H8OI8BQAcwi9YnT3qUu/u5N3D5B
	pQ87BEUt5AP1aLbh/omO08PJTKWd3qfAkOBrPtQFlb5p5u9wTqrnftGfsTxLSpUdALje5QRw28C
	vtWYN9/UoWAYSfqIGY+/5kLhd0XsczFbqnt6AUM/cCjtbHf456/+PiIBpnarj8wuJ4bri6gv6v1
	2mfebp0832mjB8BzGmxv93MNqkDZQkVbVrsOm5juukgefEM9qEVSYdU00TeQAhlXdy3jSfqCzpR
	D0F16DSUrq5SKhKzf8bWzTNXBosHap/15lV966KctaSgK7l0dDRkG1NuJ2sZ5jqJRaN3N8IL2k2
	KuBcja5wx8nQviKsWUHKj/LOo8a27CJKkTgQfHMXo
X-Received: by 2002:a17:902:c44a:b0:295:34ba:7afa with SMTP id d9443c01a7336-29bab19b21emr84357495ad.43.1764266294614;
        Thu, 27 Nov 2025 09:58:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMjiZ0RP0L7TZ6gH4f4TyC+IIBhQmeJw7HRZcNKV3khMHi2dkfabsjfeJfNCV0OoaefZjQOQ==
X-Received: by 2002:a17:902:c44a:b0:295:34ba:7afa with SMTP id d9443c01a7336-29bab19b21emr84357215ad.43.1764266294082;
        Thu, 27 Nov 2025 09:58:14 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce445927sm23785535ad.37.2025.11.27.09.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:58:13 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 23:27:36 +0530
Subject: [PATCH v2 1/8] clk: qcom: gcc-sm8450: Update the SDCC RCGs to use
 shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-sdcc_shared_floor_ops-v2-1-473afc86589c@oss.qualcomm.com>
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: hmeph6oliX3Y0FyR3MDJv3C3WjSrK3ZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzNCBTYWx0ZWRfX/+251DXpXwe7
 mo3opkWEQoFEwv3MsDCLxrl7f8w+kZf/MfF0iCvm3mv/N4ndlTDj3+EqgY7goaMIiwWYY/7ccFP
 dNFsTEmay7tbiuRArLvmAApctIQamDCyLB8TegQjjIajeV+gGO8OdxfLmrOfY/EiMSriAdfiIeg
 dMbZOn49Vz9y6+1IGptJKLhCYRitZSUQHvFb6OLyCd/J1MXSjqA7fqIV4/7DMoDEMtthOMfSPPb
 7RnTuauJGo8/LFqDymlozgehceMszhQU/kqjAszttM+RoXbCpGDBrwyVBmhGsOeFW6gbINFg6zb
 PXRUSwR5LZcPXAREs88dyhvxtsP7atZ9INaUKmGjg5Nbt403TBcmNOmJ0NNqvyOrekDUp+C9tGj
 QUiD9J6AkUh6bIHEn2K02GCx8CO5Qg==
X-Proofpoint-ORIG-GUID: hmeph6oliX3Y0FyR3MDJv3C3WjSrK3ZP
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=69289139 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=FOTRiHr0QPuqn3MmG-gA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270134

Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
during disable and the new parent configuration is programmed in
hardware only when the new parent is enabled, avoiding cases where
the RCG configuration fails to update.

Fixes: a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs")
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 65d7d52bce034335707014797fe9002429212a14..b18bb34889ab28fba13cbf2ca8cf83101e4e0484 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -1034,7 +1034,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_7,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1057,7 +1057,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_floor_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 

-- 
2.34.1


