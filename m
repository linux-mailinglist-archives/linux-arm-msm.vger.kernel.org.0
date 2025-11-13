Return-Path: <linux-arm-msm+bounces-81527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DE5C55F58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 07:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B4E44E46E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 06:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC50320A24;
	Thu, 13 Nov 2025 06:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puyJj8V3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SntrsJZq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2F5320A0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 06:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763016080; cv=none; b=jCwJIaaGhED2SEBTndtSS9SGPNUwEncF5HbN7WAWVfUmd5sfPJwUlht8ph3tON/VyeTd/Etzv3EhpoMTvl+7Du0tkBl+BuK7yLUw8pm6kP2Fgw9gzRbnjyIU0K8hfbDNxEnEQ7ViB4V6rERnVWV5LpEBdP7YN1TW1GNN4PNaOtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763016080; c=relaxed/simple;
	bh=+Ke+KFsTtiPqM4IHJhRaW6f4MSw/B+01CP19xDaeQTM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uxr7gYPSRLbm+N/E/p9TcLSNFNHiACkuIZw9Cb6/AbWlrKCCciLGybJvqfWOKqNHXIDUJFgyAyNxHfG4BvAg5NeuKrAb5MRU1AHpLSx2IzGdFUEVH9JsSWn7oEhAKblSFIcwMJ18pmzU2XXva6P36SFJVhj6n3lO7CJJgUuzY3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puyJj8V3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SntrsJZq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD1SVH23120612
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 06:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vU7vryC4Pt5YAZEAUaqbqwIE/ZqBh1IMXki
	+lNsih68=; b=puyJj8V3t64zL2rMenQUWUyTass2Wo0MxT+c3GlImgMb7zTrHWr
	1kzenpBC7nxzDRAadM0OziYwLhbyVIRjZlq/F/DF1953RABLJRN0Y5TZqHkKw/fZ
	sXm3Q37U9KHUwzZM86C894w10pv+xMJuVZ5vWYJDnL3h5hPMM8tOCFru6t+1T2RX
	38kyHunV8vrHEDKp0MwbTMt3nD/+s7NLc3N5vqyXI8uxddrhc7A0tCO4MxYJ84Z4
	neDoOhCZPEgcQWdp4JswHGo+ZzXegF9lPq7grDAhXHksL+yYnr7wO4vk1IXmajBa
	mo2u7iZqineMSn/SdiBbk/ygLbxj9KItJyg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad5purt2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 06:41:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc2a04abc5aso425793a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 22:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763016076; x=1763620876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vU7vryC4Pt5YAZEAUaqbqwIE/ZqBh1IMXki+lNsih68=;
        b=SntrsJZqU2Dt1Ps1eVMlKcdW2EUgB+fYaMaY8NYYq0BT2kSTtwpqMKIALKGWYj2Zaz
         hOjdHXmI3FNb+XljCNsWWZgyitaSPIQc7+cXcwROvd/sC1ufB9GKT/C52w9UvGVxFFp0
         QU79rlITfAwLpl4dClv0fSSjvnVD/Qm1vJswAdm4UV41eIjT02RcEGUAJ5ebLQtZ+H78
         c7f9slSFuV/DKuXAT1Z/F24Mc1evgxOgOjHjjF1YViCUGYH9PlXTbWTCe4EFpne+JlXb
         BuYvF1XPbW+KgrmHzTA79LDKv5Qr+6IfjHiUfrLAQCtKuobO/0uGMhCIDI68x0aR7Qc7
         VfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763016076; x=1763620876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vU7vryC4Pt5YAZEAUaqbqwIE/ZqBh1IMXki+lNsih68=;
        b=cCGGglouOh2ak0O7aCWdPTMxLIL6/n7MSIrHu1RwI46ZJwcRMflLeFJffAbw0Dl9O7
         S2g1bYKGEiiWAmfIBfr/ZkQKWKt1pZMIaOYV/ZhJBg5anMpXsFBQ+J3+8gI8+Wz+5LeY
         DNQSeIoLi/YykMRfzaXaVWce1Jc6YUOxetO8FEg5x5If0Yun3JGBFTZQjEzmJRo7tPXM
         abnOirOkPV4twaxvdnS0rUWU8zKPXp9v8fgfya4o9vILdv9piuNtHBLlOt1RroDMfRgK
         FcScOO6CM3tBKZ+H+zWRo9gcnLe5jdsk8ZJssuXKrIc5haT3g3QP7zxyGGAOtWKX+nCG
         mJBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWynQL/lme3Bc17uYAMB4vkePT9J/TyVNPCEYXX6fwhRqBK712/OsjorAWJz4AT/Vj/saV7QaGBUoFU97XF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ZYKBPFKC689+l2EKJjtvqz54Wb8yqN+1dm4fybLSAxfC2GiS
	9fedTyxTh2DPH6PdNaNkdjVuLMq0GrK2xAOdvkC+BHalnh1k7kqqDNoiFIQseUeop+mLRutW8me
	LJsRXByik7UHM9Oygh55E/WNf2YQ66B7XeK11hka1dM/Pm4OAMqzC2Ub8ziB0bxSeKrL2NJqrH8
	vL
X-Gm-Gg: ASbGnculr6nnjAjUsSbG4Y2I5RgjoDsA+Db6AATUl4r7e0VHi6gqiQW3Fo6f6y+g3i8
	c6KNsszTetyvu/UGeiR9LxtdJGGVZuxof5kZpy6+OJJuSHEdrKUNdabVG/y//vbFMw+shzK4AxV
	ByLzdyAJ7wmXPkUKHlj0PsuYVrvi98FqesebqGT+Z1QJRyA0+mX84znVjM4dIvr+SVFRGABRn6M
	Nmjqbrw0ekCm2cz2V6FTvERMyfWWHQNww+NktQfDlqZrLncjwmtaigcGJ3ouSg4VrPUjQ/DC/4y
	ys4AfmxVCDUfDPaxYyF0GJoLrm32ps4ZOZeO9ka4MqcaedgoKBGCeGYydRWdv4vqPHzf0hCHwIx
	GFcD1K7puE/g7slAlWDRiSxvLIDQ6zNM=
X-Received: by 2002:a05:6a21:6da6:b0:33e:84f7:94ef with SMTP id adf61e73a8af0-35908c8a6ffmr8002124637.11.1763016076570;
        Wed, 12 Nov 2025 22:41:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtYraI0TKB7wHfSTVlzFGmjGWRnrZ7crCPf2287nYk+GoGEXlI8vnXbcHt76kEGplJFqjP/A==
X-Received: by 2002:a05:6a21:6da6:b0:33e:84f7:94ef with SMTP id adf61e73a8af0-35908c8a6ffmr8002087637.11.1763016076030;
        Wed, 12 Nov 2025 22:41:16 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db25bfbsm1138419a12.1.2025.11.12.22.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:41:15 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 0/3] misc: fastrpc: Add polling mode support
Date: Thu, 13 Nov 2025 12:11:08 +0530
Message-Id: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E6/AZKdl c=1 sm=1 tr=0 ts=69157d8d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dFrkBzGdCdqBpI6tlPwA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA0NSBTYWx0ZWRfX1X7xNzwSkkVh
 G6iIvT/HQamTnkUbjg8yiLu2MzP/2DKvaBVJuYYQx1es8zexLiFfQAOkcLipdLWz20hRYNkTd5u
 yEBfiV4p47pizKPnL3JT/tYSlFkjUq4ZFOcVye3NfggB2tA1qqk7/XTwZKqCn4ZJmtd0zvuFSja
 dkuFcbhU6umeEMpXhUkGuizsaBQPGRIvnPyt/MAsFrxMqiyLicrjSmUoF1N+GWndGFYEbO36RNC
 G7f5ff2BAi/lasBK/O96RlSCMoWFA6kzW+2df6cPe+CdaFrND2JLQintNGYsEa+M35BLHk+vDv3
 AMkoFnTqVc/CaNcGt6qbkZ+YA1kuTQ7r6u9/O4pMZYvEZ0fPcz1B6chunkHMdaWbGvB2WjJ1fw7
 C1o4EDRugjeKm+Lkg1nm/0Tw9q6YOw==
X-Proofpoint-GUID: SmMR5Z4R5GQE-XrkaH0LRL58G8qjunYY
X-Proofpoint-ORIG-GUID: SmMR5Z4R5GQE-XrkaH0LRL58G8qjunYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130045

This patch series adds polling mode feature that have been missing in
upstream FastRPC driver.

- Add changes to move fdlist to ctx structure to avoid code duplicacy.
- Update context mask to support polling mode.
- Add changes to support polling feature.

Userspace change: https://github.com/qualcomm/fastrpc/pull/258
Patch [v2]: https://lore.kernel.org/all/20251106050839.3091707-1-ekansh.gupta@oss.qualcomm.com/

Changes in v3:
  - Resolve compilation warning.

Changes in v2:
  - Added comments and fixed commit text.
  - Defined context id position as a macro.
  - Added new IOCTL to control polling mode as always enabling
    it might cause excess power consumption.
  - Cleaned up polling mode implementation.

Ekansh Gupta (3):
  misc: fastrpc: Move fdlist to invoke context structure
  misc: fastrpc: Update context ID mask for polling mode support
  misc: fastrpc: Add polling mode support for fastRPC driver

 drivers/misc/fastrpc.c      | 163 +++++++++++++++++++++++++++++++-----
 include/uapi/misc/fastrpc.h |   9 ++
 2 files changed, 150 insertions(+), 22 deletions(-)

-- 
2.34.1


