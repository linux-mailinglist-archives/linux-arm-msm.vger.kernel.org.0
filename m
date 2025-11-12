Return-Path: <linux-arm-msm+bounces-81341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E30C50E36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 08:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27DE33A4CCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0C1212F98;
	Wed, 12 Nov 2025 07:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqCO58Lc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUjJLjik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89822284894
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762931519; cv=none; b=CbSQvnPIMboe7mfC7tvUCSy8dWsRNO1G9HWOE7O2pSRhvgNTfGd3y0kmWcoCSOoUGULHaxEd2BUSQufHxhefortmbWdQloyUc6kEI2NahleG5QhUbSq1aimohZmT1qjd3RnE/RieVh0pw7KnIr7KtyVrZoxQMp8ZA4hs1z84yNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762931519; c=relaxed/simple;
	bh=QNm5as8w03q1nGnq6y4/Xul5+GATbCaXYGCv41u750c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pRSa22WSSuY/jR2BPRp8+fLxHkHm1tCMjHtbRIAXqfGBiOEGkmYjtm1pb4ZykKqq6KPL/hR0kQafnP/IWoAXhxt1bGO1GS4ohQ0L4Lk8STe84n0/F5+GK3MFDhdnkW1oCXiPrb2HxuTn+imGKZQYAkDUAXUDfgnNTUFTa13HGtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqCO58Lc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUjJLjik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC1HfsN3683861
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VYEoLUJo/ySlT5FF5Bj9pc
	H7SQ22bq/f+2ySX8qIxTI=; b=EqCO58LcydOvucTFZE2VAX+sxkdxUEqH7fA127
	M3Ea8cPFY6a8NGyMr92G5TkrIgu0/iLrVTdfDpyZtcSWKWQ1Rgl6EyYp1aHdaIqF
	uGMdo1EIAi67mGqLjuhLNsdSd5oTnqazBLnAaBYVByDQFgrVLFXIASqbx0gK2NyE
	l2F59H5RHn8LByp1IoCLfXAx7kVFVf1w48jfW8UpABKKKpKiTb7wTpqb8PBwh7gA
	83ET4RQZLOmwTz2bIgRAFOSTaDre9B8eS8QkBZ0dtq9YwBQtuhXi2rZS25Z8hv7t
	lT5I65fhu18OoekFtLMhkFFJHXlTcXG6pFMsnPg8KXqeU94g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acgeu0w4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 07:11:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3436cb61f20so146979a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 23:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762931516; x=1763536316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYEoLUJo/ySlT5FF5Bj9pcH7SQ22bq/f+2ySX8qIxTI=;
        b=fUjJLjik1yUJv3uhB6xkx6At7Sb1hRJXXdUtFulapDEpEKum88xT2cSVW2plfb+Byj
         vZqUdd1K9aPYWMoC22aaL1fLEolqhCmYgM55t8jLtMXOGn2d1g+8xL+TFJLLyOJu36Sy
         YkwKkQUFbV7R00AEC4N/6gisRTlYDcrEv0PWCROEtcnosRVuybRj53HY5Zm0KdCNcGv7
         0qAERMNwtGk+AuQTwX3FedZM4+qndBjv+SoS1vpjEQtyzEtUTfQ7jDiDVVFGCK76xCdL
         65TKMrgqkzwcnTa3nH9YbKlkih8eyj1Y4U2ImuVEL0QqucKTBRXMTMuCFxabik1H6j8V
         Ahew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762931516; x=1763536316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYEoLUJo/ySlT5FF5Bj9pcH7SQ22bq/f+2ySX8qIxTI=;
        b=E7D4Qr+Qn98gSMuOgjaHnZwWdKuND61mH0sxuV+1m3FvKk/AszwPpzPNt0arVe4DQr
         1y6IY40GlfqzOvc24QRmc9cdRxRvcrxjII9U7map03cavBB5aBdgIipoG+n9IGehzaxA
         GfsDNfnEuf1ps/SvAbHwSqsgsFfcyb9hO54ogrcgdkmx/OENnv1ZJA9WJGwIBKBsMjuK
         1ip3eOGR74CuRg3SapAp8ZZew+po2qGWcW0FBdwR6Euh2su4eW+xxzNz58LClMz3y85f
         460zfL+7zL4TM4bE84ue/sOvm9Y+jNdIFgHVeeocj7oMriRZXvHcvCBP3LwzB1Z5csse
         RTzQ==
X-Gm-Message-State: AOJu0Yw7BrKnKC3oVUAKPy6R0sjB7D0WjPNhJd2bAngNXORulItkD9+Q
	pzOporgOh/W8eK+DVMTE3x9AZkgsFcS3fU+EuHyiLeJYJZ+s1nSUhQS+gtDLEUUZ11R8I3i1t9A
	WUtiABJghpx43Hv+rfmSxU2cuzmSQFYVltw7zlLQX7nMXxVsRZCdl7I8oZBeh5aP+HrdA
X-Gm-Gg: ASbGncsDjg+hhn4WIrl0YqrAfg4NfrUNphpb2Qpg3gBjAaXEe3NER/ZcyQviylkiin3
	cxrmnn36qWhLIuwmOiIHdt4j07f08A+ljNymIuRIVIjjcjaHyCEox07nl1H07Va//j5oC/ZgHOt
	NbUfH/cAnCCVNkZwq8UBv5LRgS0e5/b9/eqcxMYXvyMg4DrJ7FyPoITfCYnSGF3eOdYYJIKaReO
	2DNeIpdBKwN454PKBB2yumFPBxkCMnYRu983ptd9/BB5B45446yCE/SihhJdyAhuobNfUlMnOHA
	HXpta3D1FhnJWgQn5SUZwCbskmU0/6PhJ2LXrVyLWbCOAr2S4uMHjtYbuAyxj4pQYp7rWzNUh+X
	UMYh+PIPckgEQcnZMgonmCg==
X-Received: by 2002:a17:90a:f482:b0:343:e0f6:3770 with SMTP id 98e67ed59e1d1-343e0f63b57mr641744a91.1.1762931516053;
        Tue, 11 Nov 2025 23:11:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6k7LYAcjTwU20hULchBA/1gc516UaI7nND+8Cli7IGNCnIJbqmEzeFagjXs9CcwySY8ED6A==
X-Received: by 2002:a17:90a:f482:b0:343:e0f6:3770 with SMTP id 98e67ed59e1d1-343e0f63b57mr641729a91.1.1762931515562;
        Tue, 11 Nov 2025 23:11:55 -0800 (PST)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bbf18968e1dsm1748045a12.33.2025.11.11.23.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 23:11:55 -0800 (PST)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, quic_shuaz@quicinc.com
Subject: [PATCH v2 0/1] arm64: dts: qcom: lemans-evk: Enable Bluetooth support
Date: Wed, 12 Nov 2025 12:41:46 +0530
Message-Id: <20251112071147.1450258-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA1NiBTYWx0ZWRfX85SCLeHYpeFA
 ancNVUETHIVWuVTgaHdLkWIinrVb02cvPjnDUdCdnxqQ4rTJlZDrwpGXlhlsMC3qCQ2W7lNIzk/
 SwNkjsdXSivY8nDQd0L7uY7FVh2DAIDcB1sioblqaaTzOhVZj7Ewsucc+dHE8jvovXCGfFKDyqu
 OiIRl3rrD8yeroiazif907Upm3fk1HkGoPTdRk6Haj/wd7Npxb7F/xXz8hViTyYut/6t6AVp8za
 cbcF1353PBHvDEjxCSEveosB00u4jS0+qV2SNzHPV6d0UBhsJvfYMyu0gjMLnRr6aYYnMf77jNh
 tq20+UxtV73OLL6AflEr2p+3X2o1k3Fpq6/3hlo/9GDsd+7P7oz2uzEPprAFoeCXTApxHbFStPz
 +gySPXZ7X4imQkwZnf+ZirQg2FW12w==
X-Proofpoint-ORIG-GUID: tRfAfaJt48DuvPGecu9RUwmoOHwfyqNx
X-Proofpoint-GUID: tRfAfaJt48DuvPGecu9RUwmoOHwfyqNx
X-Authority-Analysis: v=2.4 cv=SvudKfO0 c=1 sm=1 tr=0 ts=6914333c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NzzfBly6y60KycMFBWoA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120056

Changes for v2
- Update commit message
- Remove qup_uart17 settings
- Remove CC stable
- V1 link
  https://lore.kernel.org/all/20251110055709.319587-1-wei.deng@oss.qualcomm.com/

Wei Deng (1):
  arm64: dts: qcom: lemans-evk: Enable Bluetooth support

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 99 +++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

-- 
2.25.1


