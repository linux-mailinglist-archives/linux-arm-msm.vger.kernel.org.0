Return-Path: <linux-arm-msm+bounces-80083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BF3C2B500
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 024894F4E0C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720B9303A15;
	Mon,  3 Nov 2025 11:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVMZLVX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgpS6V4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0BD302141
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169021; cv=none; b=fdOhUNUOkMyI6ytxWFQNwyRL63HhlAMCAg2yqZnTVRKBOwfZGlwe5vKHJ7124euZ4Iwy8h7AUThtFpMFEC0CSRwO8/JYCtVfvyLycIQNVQLzf8KScPkD/j2y/fz6wq4fmLMLXIyLkzktbPU4Fu+KaJ1vRxde+6VmOk9sH5Whfik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169021; c=relaxed/simple;
	bh=TbmiBoxPKzcW1UxoRCY4IynThedTQweoi5SHvSXhxgI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aRfAa8SiwGxk32zo4BIhDR+cf55i9mRVhxXDETmZ+f7BKfbiDP8ybrO/LsTAppNT+3hXE1IUqPPIhctmkWHzxfyNFRp2W6YfFpDcF/jea1uV5cnh9Oj7eUgEwGXCnQ1AQe/iyyzj1vFtpnBVl/YevdivB+0sDcTwbpiOF785NQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVMZLVX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgpS6V4W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3AS9Ax2891249
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 11:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ppW2WMHBesMAmVu4KwZN4x
	LFSJACIJINMPYXiWQWYCs=; b=CVMZLVX5Ihg2Ck6++lksm/RU+YHuwdZWfv3E3H
	QfP720w7g5iTZUllPArzpQE0lDepNI997lP71uO/VVVzf3F0+LuqROIWEkf72Yjk
	weykfm3Fe8r8L33TedUCyhc39QAxjyaau/iLrgMpTZr9vx6BpdfJIzThgdx2gqNk
	kty6pHLtQSV94ZlKMGtOWbs141V7ECORPAEIEKdmcF3/GDTSn+oDVhIFUJrEjoTt
	LxDA/jgiiik2K0pPDRvJVTTKGcSNjUenRN5FI5xy/nEzqilHP0BJrrtjGAtq5iKK
	r/SqXXG1rZjJC8PrDpyHBjSrkIhVVrryAiNrfbT9m8A9ie7w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6tnrg4y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 11:23:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b55735710f0so7769964a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 03:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762169018; x=1762773818; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppW2WMHBesMAmVu4KwZN4xLFSJACIJINMPYXiWQWYCs=;
        b=YgpS6V4W7t69vkuPeoi3GW9XaUmBZcalijeXUnaMuTsNp2i54zgEM6pI1mCxGGNBLW
         7x6j0q3jeIuUHcNCT0UrYCqoagM7l33iidnVQkpmH1vPsHahpzW5KyUUkY3GHxVRXU17
         pUrJtR8fbHfd87h+FV3VaN8Mqfu5oSa7GgyPF7HLsUk6rExyX6DksiK0mr3PvyksAG/0
         tsQxqiTC4EdJqAKaCmHQiZr1YIezUW2ov8fo5bSgzLupMFHAzA7hEAEAbEyo5dghf1qf
         BzamBfqov5imRXI4SjPTmLjzY6Ohmr0JG0k0jH/YbWXJxu542rIkxX+CZIW9U85o5Haz
         0fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762169018; x=1762773818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppW2WMHBesMAmVu4KwZN4xLFSJACIJINMPYXiWQWYCs=;
        b=PappFXJo/8fCZX+ELfcSFr2FncGjxhzhv05CQoC7+9Hu7JS/EQAT47ZspsVyTT7xR8
         Xw3rj0M3IHGf4/dRyvjRmFKngapWiTBdfoOantJc1NyYt6MkR/YjAQP2NELmZ5M0wSeF
         7U7jTZmyjnQCAMk9MAxrAKTQRAEhSawxS4MWPVtHW7WRqrUFZq4J6n/eCttEbmhE5CMt
         udIigN3BnzvZy1YPOJHbpwI4SMRxj5XYCWd69OIc83KrJAPy+gQwUlJFMTx/H/xy2mTY
         wG7UrCiynsz1BE0uhOsqJYP+Bwywa4iRyRHgCIsn9uG8cYFeLy8nSmmhWLxtFWqNdgMi
         vXPQ==
X-Gm-Message-State: AOJu0YxK+Et7j7xK38hiwMTmOiv/D+oOau3StDigHTYmXGncBXPz9Gna
	FqEHZvuBos76asI8xitPECdNi3oly1ORlb+RSmWFtxa8Lwt8Yu0lwSOB95GusKc84xC1wFLHGss
	wBFbydjP7c9/SN3ZwqoTAVvGLVxmwH2U4P6zlxJnbUb6Uvju9BMfixI8qXK8XXtHQq2Qk
X-Gm-Gg: ASbGncv+K8cp+tI+PRNJzRkPa2uqYEwMvf6h2PkmBIQCGEPo5vP5oAjh6sxLanB6W9r
	WF/8/66LCncZBeb3yINZim4d9RBK5W1W0PRiX9riC1CJ1eR6oy25zw6Tk3F2CNWwshJjnAHCcP/
	MH9SpENaIoGpkj/MTEJa9W8NpC7L3VboqlNmImajMh9aWYps52RqcPjmgA7negPr6iinRzivQn2
	6SBppywjwBTTCyzJhZCaeHWhjVmkx/+kzWr1Hea8XORjRdCc715irEqNyMBVzDiMvnxFZ1SyMgQ
	OtQ0Nw7Rtwv+1KJw55ooPiQuXyviQxYPlDhnvrK07860h2ZvbHqFtTChTzyXfOiqWv/Gtsit8BH
	59eF6EuMKOhFmO68oL/1EkrCwiu0=
X-Received: by 2002:a05:6a20:a10f:b0:33d:5e7b:2f2b with SMTP id adf61e73a8af0-348cc8e374bmr17011578637.44.1762169017806;
        Mon, 03 Nov 2025 03:23:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuePqrEzLevhZsip1JibT/swFsuuGyDcZb61TK+iUH/KiTXJB7lTE7DRWdTJPg1bvGD398MQ==
X-Received: by 2002:a05:6a20:a10f:b0:33d:5e7b:2f2b with SMTP id adf61e73a8af0-348cc8e374bmr17011554637.44.1762169017345;
        Mon, 03 Nov 2025 03:23:37 -0800 (PST)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf078924sm9838762a12.32.2025.11.03.03.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 03:23:36 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/2] Add Qualcomm QCS6490 SoC to socinfo
Date: Mon, 03 Nov 2025 16:53:09 +0530
Message-Id: <20251103-qcs6490_soc_id-v1-0-c139dd1e32c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ2QCGkC/x3MTQqAIBBA4avIrBP8K6irRIjoVLOxciAC6e5Jy
 2/xXgXGQsgwiQoFb2I6coPuBMQ95A0lpWYwyvRaKyuvyIMblecjekpSW2WiM31II0KLzoIrPf9
 wXt73A0s6SU1gAAAA
X-Change-ID: 20251103-qcs6490_soc_id-1302c425ad9e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762169014; l=526;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=TbmiBoxPKzcW1UxoRCY4IynThedTQweoi5SHvSXhxgI=;
 b=gn3tGj1KDAszyV4v1LiuXYtVQwCSlMwB6MKGQ5L2+7R/c0PXybh5qa9orcpY0JnrlKTTbTqTB
 pZIDTJuMCGmAYtRJ09LCsHHGNN3BNAqzlrBzD+rMYglrWcAkkr4i7mq
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNCBTYWx0ZWRfX+bupCRkdQm+u
 mb84PyEhP9cClssfFWUc8PhO8SxeKbfeblrmcaM3Fqh6yI2E/mD7NvUouV5L1yxmD20igNsfZAm
 uRy87RkdSJASENmqtLo+q+9T2H2WOzs8jcZpfTTzcXhPnDLXvBWgHyWHRscCEXS6DqUhD7a/Fxv
 xE8mxjIixhDWHdorQfjdo96b7c4v82Nkl/R/t7n9qGUduXyDfHl3NAIUfiRic/ILOeFf/ZNiecY
 HjAyMBA3PkWNmgzsmPKs9t6yk0ZyzFuSk0jX0mXBZugv0Xxv6Kveygn4NJKXbcxzD9jDstk/SIi
 FJiG64D/b7zJvFz9JW0QJi8bwD2g1+OBHi5Ae5HGtmASdl5yZxlzH23LfBHUr8HRUdMSeqvLno7
 X9Ylon+dcDbJW/2HlcqBg7qPuz2qZQ==
X-Proofpoint-GUID: -2zMsvU0cLl2dHe1bUxQve5teaK5caAz
X-Proofpoint-ORIG-GUID: -2zMsvU0cLl2dHe1bUxQve5teaK5caAz
X-Authority-Analysis: v=2.4 cv=BrSQAIX5 c=1 sm=1 tr=0 ts=690890ba cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XqTMHc_fffBHN5zSMQ0A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030104

Add SoC ID for QCS6490 to socinfo.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for QCS6490
      soc: qcom: socinfo: Add SoC ID for QCS6490

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
change-id: 20251103-qcs6490_soc_id-1302c425ad9e

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


