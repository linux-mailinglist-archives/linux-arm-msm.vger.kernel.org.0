Return-Path: <linux-arm-msm+bounces-81890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A9C5E127
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 17:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 937A6380226
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3712B330319;
	Fri, 14 Nov 2025 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMwRLDMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxtmoL1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E9C32ED4B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132236; cv=none; b=I4KrLPNldgxOcKGhp4bnK1gp7KLPey4PecnwBE+SW8aV8sueUsrZ2m9O9sd+KMlf1ggISEL81ZbFGAjxIVyoGN3/2HjjMIqntVUeW8Q7oxVxOfjmPQ9LotKNjdu4FwqRhB4bfTksmMQVvQTPVX1fObOZ05/F3xdLDOvr6wx86mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132236; c=relaxed/simple;
	bh=DK2KNKElJtgWNkv+V00lbBy+4mPkGdUnRSI9negzd8I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=a7+LleDwsdS7mlkBOrwoCdlCuX5Aiy6GHT2TGQfuM6J9lg2XzrC9+wtlp9/0gX1/0inUKBPk7UX/NP0htES0fieKoY6A2UQ/D5f5MNVQSHxXyr7L5bmI1xfP9rBJsTqFO+1ruBMNqHy7q4OxAu64g5uwoG/Ek0PZ7VkyeWj/h/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMwRLDMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxtmoL1Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8RRl11424135
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jO9x66z+M6x/MShGW+Aslg
	4YLDu++rhFMX3yNdkQ5+Q=; b=OMwRLDMP3rrkhmETrB5os21Fxfpl9ykAbKmHTH
	kB8IZJVqTvlmc5pRPjohDmXST9yASilEWxT/mRJpNyFbCkkHhTQOAFvjvv831Z5f
	sKHT0u8KE34HuuLOOfQ8jej4ut/XmQPwzlqedZFpcLT0Gtu9U62vPq/Peyyp/hMa
	kyVRBfW3qvUI4B3ijbs4tJ3v0Gfa4eLvPNKOs51Wd3ypWbTOCHJZ9wOWWAHhnquE
	FQI/nHGFdGnVzGt0944Yyco2mGLd0qCMaHWZowZ3X57Alszg3iS5ra7x8xPOyeMf
	GAnqJf2a1hIj4GtYkYdrUJq673UVEurqgQNOpCoTj9lTYiqA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g2g8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:57:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2982dec5ccbso49212395ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763132231; x=1763737031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jO9x66z+M6x/MShGW+Aslg4YLDu++rhFMX3yNdkQ5+Q=;
        b=jxtmoL1Yhyo7Gq99TvVJQI/QvQluFcPtDDMYF7ytzNq2ty+3IRDTx1jCxf6bUZd9B6
         2NTJT4ePqgYADoR58lpRziSEQzgaQ86uAAzvk1OunSEOem88jnqp3StqRpVR4i2FABzZ
         i0g6W4R6iYyYl+V87P2TcgfnhJWsoXSX/BVGdmKamDLtNSFqBIbFaOr1xGALSLLpXkr8
         zcnjUTZnn2x755R9gsYukbNO0+L72tyb2ODqniqGdCY3FDBtz6/BqyrTbkVW3Eq331Ey
         0Ea7wpy66D8/I2ycIF9HWVDurS5Wk2DHrn+GzpNGarIzoRvarm7UxccYddEGm20vci/p
         vMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763132231; x=1763737031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jO9x66z+M6x/MShGW+Aslg4YLDu++rhFMX3yNdkQ5+Q=;
        b=BCDyXCjyRjcP+D4SpwEglveX68R9OZVcROl6BqO1JtT3jwXP+St62/O2NSgO60ShYA
         a+bzhWs7fHc2YL3ODorkzfmyftNHRvehWVqf8xma0Mj9HTSGClWv+dGO6y3Pb8cOYRP8
         RpYmajmK01cUZ8XnsRJrC7mxnQ0Hj84fwtHaYwJqz6Uv7PV9VkJttYMacmutcaIZ7nzW
         3j03SzZRBm649xJjfGself8b86+Ug9ku/FvFtjkZU4abAiyIBnPjLeAQEDDWZWPxmFzs
         mVbqK0w9vDgncayOH8jYvnfFhRLWGM8Bscvtprwed+KCl+BQBpMDKzJX7Iwbn2TKaxGa
         U1zg==
X-Gm-Message-State: AOJu0Yyo/JNHBJM5MLQayUfMQjqQdEM+BMSbN1UCqUFKe/rEXq3vlM81
	0KDrZs9GC5oydO1am0IhGLSb5Yf5Nc2Ai2PqKYcdcZ/IbQbrt26FNvN4jqz+AdLDrDa+t205qCI
	qbsJgeTkwwDRhYt3zD8k+2cKqnSUt2rC6IDIEp0c2NL4fDNWaY7WH5q5lUbwpDbH68d9f
X-Gm-Gg: ASbGnculo17flb+hNqFJ8ivV9W9p3xYwb2JugUnEQFv417SnB5CxK3xbupfuRBC+HSn
	NyKxWkNO20B7gMY+yELA0UZNz7RSZ4UxkDMVxmoeDoN0Rzpmgtcb4OAlM/mPfJXhJ4Y5gGp570u
	KOSGf0dO/PGgwAj/gx66nNJJGjEaSIcUxjV6NxsjBO4PeKXepfPs9prPg1J7sT6dOIbRvbuKbTX
	YApaN08uK43DtaonV0duaFWOz/9xXZqs9tY2nwC+PTxs1WlQHP+PGpt7enGM7rAwSulbhJN8U+4
	wOYx+i/wzrtbOxWB+/PRT5H9yrbSPKToLnuD1oyeCCzd7Is8kBVkIOrc9juIXYsMpVMrQchSbo3
	Gz2Uxe6yBoML5mF/tzixs0PLOx68++w==
X-Received: by 2002:a17:902:f70c:b0:295:62d:5004 with SMTP id d9443c01a7336-2986a6f0a62mr37094975ad.26.1763132231128;
        Fri, 14 Nov 2025 06:57:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnyAp/6Rs5PB2LjIfPs2DEcOnotLNDA0gaNjPanANFzVQbeTzrgB13YQ3OWtrz95qXQoFPoA==
X-Received: by 2002:a17:902:f70c:b0:295:62d:5004 with SMTP id d9443c01a7336-2986a6f0a62mr37094645ad.26.1763132230578;
        Fri, 14 Nov 2025 06:57:10 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c244e13sm57548015ad.29.2025.11.14.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:57:10 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com,
        quic_ahari@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V1 0/3] ufs: ufs-qcom: Add support firmware managed platforms
Date: Fri, 14 Nov 2025 20:26:43 +0530
Message-Id: <20251114145646.2291324-1-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69174348 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=fUx3pPj6L392ZWVjOsMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyMCBTYWx0ZWRfX10dWAisM86m+
 W77s9Pzb4A6OevZguVlgW5DDLZR36AB5Qafeth8AF3+2ahvGCHlgvWQDy9O29txpm7+KqKWKXIu
 nZaQuxkdJXenvteSfmrJinpq+JQbWaAXIBeJqqpR2z/2Ui9Tmsob+H/575U0mwK/DiunRiKPNYN
 9FMrDqI6m8gAQ8VjtyJH8UoosyxK+Y4fvMKMWibgWWG4P91BVKrhdzxOBDKNzQ7m+FVbNkLDslZ
 XKFMSYumtlZizieuQ/hqwHKZtA2QcAW5JSlDnt8NUZJSPzfCqA3AFgiw4ILmOgsQW245tAUD2Ne
 xQWvjA3jDYjV3ax8/3VuNWsGJaZH5e34CeGODB/AP93C5kutdxazfhimuQkNZupPN7nAdiZqCN3
 ht53srKuc+NnL7aAwSr6du9RabcGag==
X-Proofpoint-ORIG-GUID: 1fZPcdBXjH1xS_nBlx2-tLF6WOKidBJ_
X-Proofpoint-GUID: 1fZPcdBXjH1xS_nBlx2-tLF6WOKidBJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140120

From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>

On Qualcomm automotive SoC SA8255P, platform resource like clocks,
interconnect, resets, regulators and PHY are configured remotely by
firmware.

Logical power domain is used to abstract these resources in firmware
and SCMI power protocol is used to request resource operations by using
runtime PM framework APIs such as pm_runtime_get/put_sync to invoke
power_on/_off calls from kernel respectively.

Ram Kumar Dwivedi (3):
  MAINTAINERS: broaden UFS Qualcomm binding file pattern
  dt-bindings: ufs: Document bindings for SA8255P UFS Host Controller
  ufs: ufs-qcom: Add support for firmware-managed resource abstraction

 .../bindings/ufs/qcom,sa8255p-ufshc.yaml      |  63 +++++++
 MAINTAINERS                                   |   2 +-
 drivers/ufs/host/ufs-qcom.c                   | 161 +++++++++++++++++-
 drivers/ufs/host/ufs-qcom.h                   |   1 +
 4 files changed, 225 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml

-- 
2.34.1


