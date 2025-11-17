Return-Path: <linux-arm-msm+bounces-82162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6ABC660E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 21:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id DDA3429750
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 20:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EE31D61BC;
	Mon, 17 Nov 2025 20:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKPOV7lg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2kwn00y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E96313530
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 20:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763409801; cv=none; b=eg9OR8JCGntuHPyoMWXUbClfk98VQIbmDKKvgOB78MRr7AdLyY+sOn6EA5yvUrgbUIydCbnK/6w20DIKHilYcu6uPMintYczttagcOaObxhAmFHQNhyEpnHUNTsOvzvUDd7UdnqQQ+AzrNJKhXCgVzH5eD02uGl9l38MCwNbx9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763409801; c=relaxed/simple;
	bh=TjTaJ/T63KHG/rbqqjwyv88Zrir9+1UWd2FlGf9JYMI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=tTBPN6U3V6A9v0r926U14pG2ufMAvq4hKuG5w5oauPqkFPGHygBq9LVbs4gmXNXqn6QH5QgP80alMg7zmsR+K3uq0E4Bz3BBo6WP7IYTbD/9eFdENRW93ldUqZT6uKS3n0ckdrMrRZFxTzu4MsXGmAqRmtZciM2hJpd5VqzJGL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKPOV7lg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2kwn00y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHJGcew3916364
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 20:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c26Rp3/bKYNX/PJuKOfFYo
	CK6vXK1wp27/21pquFoEg=; b=LKPOV7lgxVDf9tlS99t1TmamWDMgqCe5cEJyck
	rR02DPFzEUzvgIIWt87CUznIU31lBg3sftKM9Fw+OG0zJm1CAGjUjF3FyVH6rjkY
	iEJcpnC4tmgXp/cc+/4EfLQPMtyqLe9RVYhs/YtYuXm3eT9dtImQ2r6+5Kck1yQ0
	VGkeq8+69kSAVNb5bmLIPXRz0EpXAidiD7w1Ncwj76wWF9gXi/MRXgvw7++9XxfP
	zgwztO2xAgmuiHFCvRX73U0O2jwzcyEIzLmNWsOraAH66kJysCqcASrs2wBCYwvb
	XiOSeDbmI1tathD8eT8/Z25e1fo0GwuzLPYcb3wXX1DkOxLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx9j7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 20:03:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34374bfbcccso4788739a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763409798; x=1764014598; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c26Rp3/bKYNX/PJuKOfFYoCK6vXK1wp27/21pquFoEg=;
        b=X2kwn00y9tHwR1NcGluGNwOkOwUEcQMV9qnAP/LEwW31WpSX3NHsnTLt/x+IUXxprj
         jHREcIPjef3z4E2hiemooikCtOxzbn0smP58F7oXyLp5R46YRqkAKeY4AKMdGxsG+q6c
         AkLhW5coff9STlFrCjph7Lk0Z5DY+MjBh15Onb/Mwl0PEGl2Y9kV88fmgVoXkGw9pIuC
         7GRi9ZcG2amK7A9Sta1I2DzgQYnOKRYtG1LIUkrZukK8Z29s7DenixI/VY8C+lih3IKn
         tLFUDqteBxnoQCioUqFuttgetzZBBNFKE0MY6dh7KlOkMsOV5uMmeWkvxifhTDuFb/EZ
         E3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763409798; x=1764014598;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c26Rp3/bKYNX/PJuKOfFYoCK6vXK1wp27/21pquFoEg=;
        b=pPQERU23BDU/ZpvXHZtSqrE/yudyVfGMwNrqXC+lzf+gc4MbY9OimFkgcN2b1Oi248
         SfufIxJJyxEc/OUqy/Udv/b2fYDionZeuU1sWkIyDXXrqgmniWEeFlQuQK76v6+Cy7Mj
         fK+bSR6Oq3/E87+Hwhgdum3ZAmMB8xxsS5zBMccCr/Hs7yN3K1rEYZvzDahMEi/pAFa8
         KMAk+IPuDSaZgJOdz0wcHInyvmL3yZpgtKOD0brM9FBpPcdqYiTI3rDey/stmralG+YC
         GY/bMOmBGf2LYEOlaR4kjRm6RqZEqymsmRb+3yy6XHVTbr2Mi7IHQMOSAX5bPm6Y15ON
         VIZQ==
X-Gm-Message-State: AOJu0YwqRMiNCZUpGIZhgPCQYuG+5JRWYzfSDXU9ZgqyjBuhbBILslOr
	nbnPEPGEr0f49O/OYbXGKksqKWFDy9rj+naCb7sZoMIhULfr2/T2wIP7mf0lynF632XH0pClkIm
	UQ5p/K1xETVLwmXMFVMr2WvB1h/NhotDAqHA1aT/QrXgx3AVNHzcH6hyNA8vYyss1RA2sBWNecA
	/2
X-Gm-Gg: ASbGncs67gUZ95OpZ8ZGqnQbBlP6RAlnRHGfC7ZquIhH+EwP8naAofxpeLgBfy7A0Zc
	PX/Gq4svpmXDjU66phZmvEgR/2Ebk8rSoq8qvmPyQ7TF61y8aLwjffhodOiWd8i9FiV0hQ4BOf5
	mNPEFz9ZM+Wo2hkYHn+P09n4N8pnCC90PLUSUqvDUonby366TuYXeL/KaYzF9k58d4kIRrElFw4
	mnPEfYpMcmoGR4i4gJ0NozYUSSVtEJIcIoztFvZgmiwNo/HMF6jv/8hqgGfJ64dS3JXuL5u5QGq
	H1gF3L9BaWWYsvztrF1PK+40yVThvpAUp8p78kTexy3K2uPdfkdA8wlV177q6ziwWyOPb1Tk35U
	yu+0WvjrlbK5pwgDwDU8DW3CfHGk20ajOiy+/xXwqTo/6aZFR9n1nZg4j4f7b3AE=
X-Received: by 2002:a17:90b:584d:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-343f9d90c97mr12586972a91.1.1763409797837;
        Mon, 17 Nov 2025 12:03:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTb88C+0oHSffz3fukesKEKYpXaynlkyYjtfFlUHACP4e+GCA21rujoM2xS6sbEMBlwF3WpA==
X-Received: by 2002:a17:90b:584d:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-343f9d90c97mr12586948a91.1.1763409797329;
        Mon, 17 Nov 2025 12:03:17 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456516cf7esm11126035a91.12.2025.11.17.12.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 12:03:16 -0800 (PST)
Message-ID: <13afa249-cfe4-4c19-96b0-ca9506b2fbd5@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:03:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PULL]: Update firmware for Qualcomm AIC100
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XUw-C26Jqk9TmrCzmhu4j6NTggCDWgjF
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b7f86 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=NpLpmiFu_pJ0in__f2kA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: XUw-C26Jqk9TmrCzmhu4j6NTggCDWgjF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE3MCBTYWx0ZWRfX9oDCnjHSM7ZC
 QXmi13DKxdV994iQkBpA1La42DbWg53+BQtNQmQn/kDy5xX6WXg52zQN0ztAIa7yQxCI3fXlr/b
 V5sFDMzeJvig05ybdc8UTj+ga6/ZoeseuQN77rAVzfy1GpfGAcNEYLOyMgsB0BQej6xUDwU3fl0
 AefPeNjbVQpkqpzB5a0zLbdXFQUpSyB0J+G3x0F2pjMBnS4avYZ2Npg5dgDaR+AzP7NpIzzWWB2
 OQTJO0kUtaEOj9uPEiNL7j9TXMtOepzR+yOmEu+GW8M7gbov9SjTWr/E4FTcSqVf7NZ+9nJi3X9
 iXW6y3wH5mqVAAberah+snvj8yzl/v8FW9Zd+ODJoIBsPPPvZ0M6xSbIWy16q1E0ryK8yWSVo/A
 pHFGL7tS3Tdxp399Yil0p+uXNBJluQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170170

The following changes since commit 43a0c8df58aebec0a9456fd5ff4ef955c627d0c2:

   Merge branch 'mt76-20251117' into 'main' (2025-11-17 17:42:57 +0000)

are available in the Git repository at:

   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_6

for you to fetch changes up to c710fdbe961e6e04239b989d688aaf56cb6d90e2:

   qcom: Update aic100 firmware files (2025-11-17 12:51:53 -0700)

----------------------------------------------------------------
Jeff Hugo (1):
       qcom: Update aic100 firmware files

  qcom/aic100/fw1.bin | Bin 2180920 -> 2180920 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)

