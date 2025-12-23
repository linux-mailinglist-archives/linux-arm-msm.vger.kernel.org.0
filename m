Return-Path: <linux-arm-msm+bounces-86285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 609F5CD845F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 07:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 282C63015847
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 06:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EF12FFDFC;
	Tue, 23 Dec 2025 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMoyQFo/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4vERsxe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B794204E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472085; cv=none; b=PnX8DqIKhbnha8jAuB3xodsZEmy92exvgI1FSv3jrR79Au30RQ9tPY+kzqZRJ7S3YYCgWexu8JkWpKzDNDTVPN7oMtwi8ml2E2Tp4xiqYmPvRWaiPpYVs6wFHo9/P/7A9SrZ3miisFwZoNlyFaaMWiU3e1xv97+f32KqqBKAhgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472085; c=relaxed/simple;
	bh=jQSG42iFOfGSKjeSFUaHSsaVCvHAWfEU23GA874g0OQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nRp9w4qhHB6WsB4lVM8qmWXH65O1froJHUgrNbsbqBe+OjB8n727XeQcbtmLbRg/hDpkKd0vznSFfTRWzQbNYshkpXGq6yAG4v8O0gMkRViLQ3gjwrA703X4jR9qoa4VaoT1qmT5G4lpZvzd+3szAJpi3NVWzurgDPG3DWaLO88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMoyQFo/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4vERsxe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMKDl7e2115304
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFHpQ+ZwtLSOipgbW1A7FnCEHJ7AKYLUYz3RyIjedpA=; b=VMoyQFo/F8v7WVMf
	0NnY7OU5tdmzWoMFA1Dc6dz7CIv6sl1Sba1xP+97oqMRsjb+S7esJPWQqjpX1bRu
	5HKp4oeN9wFlpK/3/A2OhLnWP1CCB6kOu46fOT3q0qSesDXAXtZLjzP+5jo8t6LJ
	k17QmjoXAt0Mg9Eex8yhTw+z5MSEfJ8o6GOiOYQNXApWgk8R/0ByVaIbntAWD65Z
	LF1gnGtM6C4FPN+ybmiI0YGaGWEkKQ1Arut6YnAhWyu/Xbxmeh39C7BvJV83kKwc
	iUg9TBqF60yP74B7rPOdtAaafsoSO8JOvH85gSbSqkcvLERrkhDz/btfLYds+2ll
	PC7SGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudhkp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:41:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34cc88eca7eso8680301a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 22:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766472083; x=1767076883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFHpQ+ZwtLSOipgbW1A7FnCEHJ7AKYLUYz3RyIjedpA=;
        b=O4vERsxe9ZZ526MH21V7dOaken5kVScQoIR7tDFRlyzh1q99bEN2wCeBgXAFPjN1fG
         FdCBs6CCAAUpXyzhreGslklZ47MhX7VMnLy23XyLCuLkBBTgOUIbaMhXEXKNyqE2O5QN
         5Umtcb8voXz9qgeCoLzpK2WkQN3xiqCANcnUTXBrHjAZgjkQ7pgMDiajE7xeK9R+Ctak
         ZfDUSNK40h28wkWA3WwYr8iPD5/bMG23VKB3lnyudvlbx3iGXFwsu2nyqdmh6BPkarw9
         Xmge4eurmT8ZSvuovxjIyC7uDSSHjYci3Q406ysw0pgj/IxJbO/KgSt3UZ5t7FuA/Oqx
         9JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766472083; x=1767076883;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nFHpQ+ZwtLSOipgbW1A7FnCEHJ7AKYLUYz3RyIjedpA=;
        b=UqUxn4UL6YgRMWi8Vzk3mJRGHpiIBc7JHBR6bGigNMeSeDejWUoLth5s/7og1sv9fV
         k+6TeIJWkboMacz4g7SO4O4SOiwT+ULUXmRg0yCteuZti1GCypx3FMy58/F0/tXZpJQl
         wXfxwTdGtFOCaDiAfoVWbQfv53oZZ6fIn5/qqYtrvTuusJQztfCty5Ak8htL9HY6Eaon
         rG1pWJkIUq8dYaT9bnZFt69rPKKTMUkK+jdAd+09nTbmcwevPigYXI4jrgewVAZS4WQz
         YAdgQfNrdYybxrSdDrBFfsDKeWHrRG9y4KTW/6Qlbai8Aeqna3qLT1fIdfc9PE1xngey
         DS7A==
X-Forwarded-Encrypted: i=1; AJvYcCXKGtAq9/ivNTyl//ULbp5Hxjp8Dv6Z8sAciX1QVF9b379FsnaycQ7fqqYnvy4WLKYQWuH4CMOBRhJT4mop@vger.kernel.org
X-Gm-Message-State: AOJu0YwZqbyZr/HWz2G0hr5GYymFQ3NBb6UHEna0a5G6MxqbTvW6Bm/v
	7hiAy0i2U6edCTQ8kMFgulH2+Kb5fOUjtGLzMzkB5NmB6FTUdob38J8lfuIxqOFFN6DF9xqerVZ
	Jpvcb2q932zqe0KKdQqrf/bbLzflsd8l3W7djysLDSDhrmDDKEhD6wXrXFGBOgtlOEN7+
X-Gm-Gg: AY/fxX6IpJRbZGS/sIASjZwsayC4bFj8W3ofe/03Xjt0CiIjCzV7f90OXpglt2VmA7a
	sfetO9WGjfvEVZnjAPNxmpmP6J0cV+rJZwB9iuvGXfnYeqO7HFUxovTT58c/WHIVma5sI2RYEgK
	wcpcpgdHZF1gA15Jk7QchG5iVT7SKt8/cvfA2TlbkMEadSnFJNFqN4Wzc7HaGV0HCFyBbI+ZjDk
	+Qti2OxzqDXvp46wTESE4DzPNWLcHOo4wBPYZtrnmR9cxpdrQTa7l5+BPM74iShiGBWwXR2SKVT
	CymObSavKuM1hHlR6oZK8Nd7pa/FwAV9MEbqL9wg6YIUhZaROcyHSK8RooDem7nLtdrElvceRdN
	/NYElPTbl
X-Received: by 2002:a05:6300:218b:b0:366:58cc:b74e with SMTP id adf61e73a8af0-376aacfbf5bmr12945232637.61.1766472082915;
        Mon, 22 Dec 2025 22:41:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXUhF61/xGkXM1X+0vUrEXlOJyj6uehv/ClwC4XcVTJt6taDpNGfbbQc7aG6fAh++v15CoVw==
X-Received: by 2002:a05:6300:218b:b0:366:58cc:b74e with SMTP id adf61e73a8af0-376aacfbf5bmr12945213637.61.1766472082434;
        Mon, 22 Dec 2025 22:41:22 -0800 (PST)
Received: from [192.168.1.102] ([120.60.139.28])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7ca0baf3sm11272132a12.34.2025.12.22.22.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 22:41:21 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: robh@kernel.org, linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251126081718.8239-1-mani@kernel.org>
References: <20251126081718.8239-1-mani@kernel.org>
Subject: Re: [PATCH] PCI: qcom: Clear ASPM L0s CAP for MSM8996 SoC
Message-Id: <176647207945.161450.8052515821884695336.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 12:11:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a3993 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=wbxd9xFQoh2bOL7BUxlcyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=nO0wZtMv79AcQGVKydcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Ix6cdBrZ-8MQLBMNqQF15XxilwM6zm47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1NCBTYWx0ZWRfX6Ga6kIUFgV8F
 8Q3C1LpwG3dUFuLhs8xgkVWWwX5pvvKAFapEhoZyU7qUkh+UVe09i2ltI9EpG0F/jZRbUFu40Rq
 9IsWuNt8WgvwxjxUmZ+1aA445QPkxFi6vEQhZE7Ru9nLWsxXQ6MY6GUp/+NyraVrgRkx9DIF+Pt
 0kCoKhk8aXbG57Cwp5gXMdjIOUuaBMB+XR/z3huGk3aLhmj0AQ/v+uoweTr4I5Mxrlff4YmhYW8
 HLbpSTllPZELj5aMONFYbgjSTV/nFDONMBrz8NARLgolvs8e4iyZZe5vB+kpEixV7cFK1cNliBJ
 JakuWMO+Qq1TbD92TCGjhFHuyulFuwBzfQR89kW6PYof3z28Y4rTo1uLHeANsVXJ0udIeeEhmZk
 TqZUwuOEJ6/Lr1uuFCcHH94TXHg2aILPOCiqWxX8pYWrIbf0x6LPxk9d1Vh/s9YLzUvFCQQQ07x
 GeNOrNA72ehMyHLpyUw==
X-Proofpoint-ORIG-GUID: Ix6cdBrZ-8MQLBMNqQF15XxilwM6zm47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230054


On Wed, 26 Nov 2025 13:47:18 +0530, Manivannan Sadhasivam wrote:
> Though I couldn't confirm the ASPM L0s support with the Qcom hardware team,
> bug report from Dmitry suggests that L0s is broken on this legacy SoC.
> Hence, clear the L0s CAP for the Root Ports in this SoC.
> 
> Since qcom_pcie_clear_aspm_l0s() is now used by more than one SoC config,
> call it from qcom_pcie_host_init() instead.
> 
> [...]

Applied, thanks!

[1/1] PCI: qcom: Clear ASPM L0s CAP for MSM8996 SoC
      commit: 91f2fb5fe4735c6c99c000857f2e0bd7ebbddb95

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


