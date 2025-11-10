Return-Path: <linux-arm-msm+bounces-80927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC1C452EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 08:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766673B03B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 07:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB4A2EA481;
	Mon, 10 Nov 2025 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ds3Biz6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elWKW6wq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF85F2E92C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762758829; cv=none; b=RPyQJN/2/AaglHMX5bfVpkTemFNPkv55g+EbFi0o6XJ11Pqge76fx0o6I+EuWrRDrasiVGS+NpTuAaJpD3lnnKpW1LLqhRH0KHwtqqw22jLJGEWeYpC6MVabHglOHy9yz6dx+rTZHx8x8g5qKNYaM02Ex9tZnPxJvu7igpKtxDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762758829; c=relaxed/simple;
	bh=aP90UFdql0oDm4M3IKd3hjBXMgT+QNuJeGXRkHBd7uM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E2xLA2SEg1f3KGJb0S5CpT6IGU0ngTomSQJq8/ME0xonk7OAaQDDjaxewQebVwvlSNyz6LHzcAhOIIx6mZTe0TwK16adMvbQAUaYpkhrX7dA+uJeo1kI796e7e26KAvNLNTiA0DOegZjnm8EoWqmL8Wj62JMZFwjrOFksFnlp1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ds3Biz6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elWKW6wq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA76x8Q736629
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 07:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0u2kfrzFgA2dlZWSM638OT3Edc5mlVUf7StctKj94Qg=; b=Ds3Biz6WpGS6TTVj
	ZPtsXLMuRP/tFyCJ3GWZkDztudelWLciRKkb6as/+fk5J7auLMJmyRiV67nxflxh
	wqLabZjpWz0WeDwpDSVOpYMq/YNb06LsXZsfryUnkbRwNzNF6pszhk71p9L71Eyk
	d8VCCceQO0cvJ0hCsKsIeBNqnfXQsFu8QUhkz7llChyGFjs147hUXfJbTuTKZ6IM
	jvPxaaSn6hnydst5Bc0KMp6Uu5qxleRLrknvIdlJg36zNKXWH5Sjnqd8M5CFHbMK
	y6GVc0nr9S+0ymrN0zdWpDVI6jX5No2P75dDnzqPo0ZxzCI9TSaaKJmaXF7B9ian
	iOFqCQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xuekpyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 07:13:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b99d6bd6cc9so2134935a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 23:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762758826; x=1763363626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0u2kfrzFgA2dlZWSM638OT3Edc5mlVUf7StctKj94Qg=;
        b=elWKW6wqgY66h1OGKiZf/p+durcqHwOxWzO+CfMhHS8XZiZlZrJLI7+33pMn5AMYMR
         OzPCTT8f3FjzV35tN+2uZbkmxXYUwTt4VDLzDWpNtnUZ55Zobae6rUa8ZIbpCaVoJd64
         687bHS3fQm8A68cZQrFRZ/J1v6imHYO/Abh6BCvUdrVezMAzAFoveFCVBio7N6xwA4Ce
         zMdR3dSpvtalGnoO0cqgF4JZ8maYNdWfCoDi9V0gddqjKiyGlhRG7+nqPCDd9+PqHrlv
         wH3bTYRMEpO3V/ybcADHngC7RSgeMiVW3LxAor8dSyZpgX2Ag73nog6owFcd6+10SppG
         LNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762758826; x=1763363626;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0u2kfrzFgA2dlZWSM638OT3Edc5mlVUf7StctKj94Qg=;
        b=uiB+zJF5zQDzJ73Z0+XMdHFQAzPVTtU3dD7dDyy2jltefBwhzA48Pz0BrpaaPIMRsT
         HjEvwVgjA7lAdUmAU6JKNlTLSJPXMa5EVbGCYhhXYNDXfVfIkGwuc6VpcDFMe9GyUZBi
         ttfi6wtQleIFzd9QCXqNkDrSI5Y6U5aHR06MB/i216ZppCrMC26yrwIiTeEwmXzC72qn
         x1AFz4/k3f7uPnfGFINTB2oJEHxjZGCBPN3RyaE2GS7whGVgEKgkpVSKvEo35kbAVGKC
         2q/tq0pkkDf+yrv3Rfeha5kjnZ/zTXgEYdnGInmzeEg1lzZuebQ3YZYgLuUmxMh4aV9E
         NUAA==
X-Forwarded-Encrypted: i=1; AJvYcCUw11cO7yYQCPotWd0GevJntL3Zk11cVJ2IU1NaM1EMZ8xERIH2qpBktSxxzDjpqWkAq4oOxyJ7U+BFN1NF@vger.kernel.org
X-Gm-Message-State: AOJu0YwuFaQImjtey/qE6Ukqwqsi//9IFCOwXFZhBawRrnLgBOB1bpKF
	JpmJx0zbgWNoNvFIpBwN0tr9Zbi5Jq3lDD38gf2UhFUElTk3Ou8bNxTZEqwiairQaZrcZb2qKvW
	PVWJrkZbPgTEkI/e2ktqLoIpnvCoW2pdvULbjqe2s6yNb6ODd3KxX1q4GRdbFytdIXsnA
X-Gm-Gg: ASbGncszGsdYhBP8AxjamhxkN7WS7wi0kugrgHc9TIGXBfgnJqjQ0hYQOQE4SQkvMHN
	Z9Ieq3yKpoNeWszALemRz9JTUDb7xQpwyxUr4yj4ZJIdO/Xl/752QDbbfLVTxf3cwrcUakVGBOI
	GgQbtYz8wJaqb7SMSgihaLBjDiR5U6mMSAStm4XEQgL4pQFIp5MpijW/JHsxQoy5x84JjLbtN2m
	UmgKHNEdHAP8EA8O0QCZ9C2zqNVoO+vd5DQzoB86rTq9R2cWBSuGArFCraVyvu5Q3aaK5TMM9ES
	dErJvT5cRqY8Or7+IGhReKt26mDJsD3qp9E9jkeu/7wTkSO70F9JPcIj5IEzvpdtWVFHvyG13Br
	5oZWFOu3UGIIsijb08lbBNnzxjqI8Kkk=
X-Received: by 2002:a05:6a20:3d84:b0:342:6c97:3693 with SMTP id adf61e73a8af0-353a3963648mr8974963637.47.1762758825665;
        Sun, 09 Nov 2025 23:13:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1C5fouoELxALLyfIlIbLBUhu4F78OELcJ64xUUUD4/zEp1jk85tJkItOENf41QpFQz1AJhw==
X-Received: by 2002:a05:6a20:3d84:b0:342:6c97:3693 with SMTP id adf61e73a8af0-353a3963648mr8974937637.47.1762758825119;
        Sun, 09 Nov 2025 23:13:45 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:884c:92ad:3fef:1d6a:49a7:308b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8d7eedcsm11924004a12.2.2025.11.09.23.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 23:13:44 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Michal Hocko <mhocko@suse.com>,
        Manivannan Sadhasivam <mani@kernel.org>
In-Reply-To: <20251106162430.328701-1-marco.crivellari@suse.com>
References: <20251106162430.328701-1-marco.crivellari@suse.com>
Subject: Re: [PATCH] bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users
Message-Id: <176275881845.11063.4284661115624687.b4-ty@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 12:43:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA2MiBTYWx0ZWRfXwPNBMM08fUnz
 YEa3v8L5BF3NHt8aOSdpLv3ZEOA4hpXKaI2ig7r802iG97yGUGPkYcqcrGtinSBPZlyx03fOt8g
 q0w99/NIxzWrlieUcJJGsq05caBZH9mijqjsOXgmilujO4g41nPdoKaSt2BfkrBBQybPFE+mMj4
 JKvqIGG2rrH9F9vgJiMxdPnwJuqkPvmymeQJHADmYJMbxdCGKbjIIOFo3gHgK78nto+VjruLuhY
 ZAga/EDNwEF1gcK7E+8+PF35vnZXbox+xvdQC4HDMQRNi6Erxx21ljIjMYxLEBAoBy8KBw5BYpJ
 D/OgkoYDEB6hTgHkHQ5xaZnQnzP80UKMD16+S2Wu+XwuFkBPVChj2NvxTLSC6zgeHm+IFwLzl5p
 l/H7us3m+iI0IC00HCaKxDsygnjYBA==
X-Proofpoint-GUID: tl9bxeUzagd3yrO9ahSexTb2IYpiPMHd
X-Proofpoint-ORIG-GUID: tl9bxeUzagd3yrO9ahSexTb2IYpiPMHd
X-Authority-Analysis: v=2.4 cv=BOK+bVQG c=1 sm=1 tr=0 ts=691190aa cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DXX0947HJyerphLxgaYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100062


On Thu, 06 Nov 2025 17:24:30 +0100, Marco Crivellari wrote:
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users
      commit: 9e24bdfecdb071a3a42fb74be1ab503c958e2740

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


