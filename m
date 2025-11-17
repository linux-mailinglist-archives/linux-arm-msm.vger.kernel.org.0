Return-Path: <linux-arm-msm+bounces-82020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F1C62587
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AC93035BB14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 04:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E5F315D4D;
	Mon, 17 Nov 2025 04:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cvcqw/8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkcVJxKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F7E315D20
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355100; cv=none; b=SnnzNe4ltUnl3EopIIVvY9bVbhqYUHBMzYYfRFRKbpsNG2fafMTwTU+CPT1SOhU7f1yaN+ow8x7JOetufGci/neuqIMOPPWTQhdJq3hhEQhOWDVC5KvsnYybS2QlRBdsc/3m8GmdCtZaaykZmNV8GPvbAUPj9lNGpXGW8MdwkUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355100; c=relaxed/simple;
	bh=KXYp4E+oqUAJB7RokrGdr4qrBSPzBs9rxlbrTQtlzEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jl+5cyPIkgCNGTNavqZ3/99SfRk/KidaizF8ENNrE0QbqohlJdIAb7vfe38VOKB/hJJ323sDXb7vOAHx++hevmp0XAYLkSraWxP5N/oaREnFYT1cfHdRD06hH6lK5ffUz4evUGrnHf6Sh4kKmPI+C/54C7RJcbHT60w0UC+pazw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cvcqw/8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkcVJxKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4ntXo2582287
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xcYu9ilyEoVpwojQ2cRbd187Ruc5hj6QpP6MAKyTpLo=; b=Cvcqw/8bRZNC3WXo
	vdcsoYikVYcVOFaC+5UoJCBVzlqlrgdDMa8CUy7kIl66MdmtrPFrbhzLA80GyBRJ
	IQYYAKeodxCb7bCkgYGLLwTvkwhBasq4YPDphPZnYatYHQY8/OOs0dj3xPGbEHeo
	zQv9dbLphCNADcOBTkVC57SSjl97beq6CW0U7ICyOIUHLMrVjwS8PQ4KHhPKQldo
	qlhb4EWVMjGLCZ2VNmKRQNyP8LarV6SC/NDqfwwOD88aGcbH9M+IL+pa+hm46IxY
	WN8Iq8XM6JVeUjO4wMCPdYHJa/uCPentQApoB9G4ryXK+4cerq4VdIbcnIfEdKXY
	enGleA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afssf8du0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-298389232c4so53378485ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 20:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763355098; x=1763959898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcYu9ilyEoVpwojQ2cRbd187Ruc5hj6QpP6MAKyTpLo=;
        b=kkcVJxKshejkNZ9N4Z8xxPdDISaUh+94UtRh5mCdjtI3klGbLq6MWxyEF7dYA89XhJ
         phjaOHXucQ5eNTBWvNiswvGeHdwTFvvygbQKpVE5iIAdy+PPoQ86yqKQN0EarZZIBwpH
         FqP/ScLwQ514MrgQoSWzOvZv3soA/BCOZ/4VjFJXxz/G42v58IGYidkLfobpn3UXuX6P
         j4N3MyY1RI+4IW15pUc5yuRySZ7bLSxElRDYwLrKaiAxL7GAsn4yA20tWE+ALCssvFR9
         cCiy109n5Mh7kDYRfFB7//fXztgJ+hbh947f5z/A55VYlucJyO3whSmI2BOZdlspX63T
         14Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355098; x=1763959898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xcYu9ilyEoVpwojQ2cRbd187Ruc5hj6QpP6MAKyTpLo=;
        b=TXignttaIErvYdCg6VDowR9UXfRlA9OUMBVosndKemR+aSU9OyNCnXCBgvt9edV2Kx
         DdDfF/ysdvVVPriEH0kbiw664ZGoa9hHYvDXgQi4Nk4XcKM1MjnyHIMH92Mff62oapr4
         q7uf9OXk1FkdGm+MoHWOs+jdxu04st1me/Rwokqz3VkIDP3tS6+3Ol2QGSq1nWWQ9blp
         d7AucpzHfJWyxwTdUBzhKZ2H2tNDpgEEURSEei/KKLNnuENEsQUXZxeJjY1Y6hEnUdva
         60ButkcgFxKftBCVGSvSUdFfwAa7WzEILs4z1LPJzTldBJGN9jJQE8vTa/xqIT5F7LVy
         rwXg==
X-Gm-Message-State: AOJu0YxzG+q+JyzWyln6QpjGTAttBmRWyI/Nq5lJi91OGSB/a7kf4FtA
	ysSHfYy1xcspQ1Ucq+xFxYzvPHbCADJxSVCQFwv/MvT8zVWx0aPXoIIPbI7G/UitHwOm7YN3V9k
	xGOCUuW5dJ71EODPr+6KpD4J18hk1mpGRBcZxh2Px1HD2lZCXl82qghVAvZ8AZDcrY2cD
X-Gm-Gg: ASbGncsH0PC9SjTIG+Yj+Z2fBWP8Af+ENHr2fGchm27HDD+/rbAytoSeqKS0lhoQBFQ
	l/mbyoXDi5TY8fP1MqSzXF25Vv+2DIY9t9I25fXMjBO3ng06IUYnhtTg8sPXlyFpq0Fiaoki29s
	fnYMDX9Pd6HlB/HXuLrl10G2DBdpGqUja7rKcKFPrCrM12lwf+k8l4KoLQjbNr3zpmVaFecnU4X
	ReoZB5MJHSjq6UHiFz1qdsT8mtlBNBpo4X+eVvCRGmMTSLcDNc6D15u03AgMinNzhdUFLT7p2I7
	/BW5JbTRhH5jVzl2nqCyThMKfXCfDncJJDpWLF9IkvrkI9snFQurS05AlsVMimw9DF6A1hFpPRO
	jo8F733Q+Vv4Uf41W2GmtpaXtFgfYV9YhFsEpys6OpE3AvwPdy0v8y56VS+qVxexatHKzkwtKPB
	ZPpxmzKH4bpD8KT9Tumnfbt5We8lUj9SvfWZjRVhCvtQdE
X-Received: by 2002:a17:903:384c:b0:295:557e:747e with SMTP id d9443c01a7336-2986a7408edmr141124755ad.40.1763355097835;
        Sun, 16 Nov 2025 20:51:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6HzRrSs7ebOqAFezbEg2pQs1lEApo4alFhPwkk6JYxJdawvGKxNf0ML7xeSRyrgcLcnwvKw==
X-Received: by 2002:a17:903:384c:b0:295:557e:747e with SMTP id d9443c01a7336-2986a7408edmr141124495ad.40.1763355097401;
        Sun, 16 Nov 2025 20:51:37 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm124187105ad.7.2025.11.16.20.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 20:51:37 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:21:25 +0530
Subject: [PATCH 06/10] soc: qcom: smem: Use __cleanup() for device_node
 pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cleanup_node_put-v1-6-5f107071d171@oss.qualcomm.com>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763355082; l=1103;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=KXYp4E+oqUAJB7RokrGdr4qrBSPzBs9rxlbrTQtlzEg=;
 b=YrLOWfAfOGFxKZfncXhLgIC3D2Mj69o2Rqyc4tGL9E81sLs5O76KjVczGTcb3odPN1kVcD/GP
 mwGBzCDhJomBy1dhXClmP3jiKUXpYIMQ3Y03DTvBpMIdskhgC7ScH0X
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: EMpIbvhR9sLCmr_bHZRnjw52llUqDExa
X-Proofpoint-GUID: EMpIbvhR9sLCmr_bHZRnjw52llUqDExa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzOCBTYWx0ZWRfX4vkxJmxY774a
 aEXgKScG6e8fsDUVORS6/FMsK2ECbthoqwhv/DcPKDqzrsUdcABCeA/xf4tutiRvx5OvMzQhyIN
 QsVKv9I2ONS27kAhV4nisYuo5adlTZN4fH9lMg/O+liBGriMLpmKbRs2eq/6cCkcsoYc4XGpXuL
 mf7Nhc+i3A+seyJqwegmcHMeUiSiZL8ElWm413Eypn+eINgzU90buE2PVockvLB9rOO8GwmqSKf
 HvT0/Fqkhd+XSx06v1bns3ZqjYp4VLYNIH+XEt7F1iHNP9Ahz1mxeRUJV7XlCUDDf7YlQHW59AY
 ZLtdSWF7KbR+ZJEv4+bTq3/aAGcni8xOBi8bU2XrkMCSdsRM/FBe7P1QOzdOepES/Q/Q9YAKRmo
 2oMwdYXKw1HkAKv/Zb3QtVzdRZ9dTQ==
X-Authority-Analysis: v=2.4 cv=IrkTsb/g c=1 sm=1 tr=0 ts=691aa9da cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Lio3-SUJGi11rbJkDvEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170038

Apply the __cleanup() attribute to device_node pointers to simplify
resource management and remove explicit of_node_put() calls.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index fef840b5457407a85051ded0e835430dbebfe8bb..6c3a08e1afe824402f6fbb84c9695ee57eda230b 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -1100,8 +1100,8 @@ static int qcom_smem_map_global(struct qcom_smem *smem, u32 size)
 static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
 				 struct smem_region *region)
 {
+	struct device_node *np __free(device_node) = NULL;
 	struct device *dev = smem->dev;
-	struct device_node *np;
 	struct resource r;
 	int ret;
 
@@ -1112,7 +1112,6 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
 	}
 
 	ret = of_address_to_resource(np, 0, &r);
-	of_node_put(np);
 	if (ret)
 		return ret;
 

-- 
2.34.1


