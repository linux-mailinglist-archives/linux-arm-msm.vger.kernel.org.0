Return-Path: <linux-arm-msm+bounces-89784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CBCD3C5BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A9196AB4CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 09:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AF23D646E;
	Tue, 20 Jan 2026 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7CPl5eT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOdFCG16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2868A3D34B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903029; cv=none; b=UbCw9Qubfl1yPAey4lgFuEOMM8sa7VeyW65JjpJj5NDAxDxVafYL9yw4gNkDFpZZv0zt13NYoH5vWuFTYV41v6Uvd1IB4/elu6KW2nIIBd3UYf1wh0EKnA916Uv7V1y1B/PNK/jH6SjKMwAFdLPuUAyZM3vaRwmMfNBP/gI355A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903029; c=relaxed/simple;
	bh=KKPpwl3PRgiv4NCoWVUTvYsEZb1m0fIotFZUF3K3dbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGiuyqL8v0WxQXF4iacDkDO6ZVv+x5BizwALEbpv2xVq00oPzpxFyY6c/637OZVIBkA1mK16WNyEnfHJoiJeJr7dEXTtDKanq0Nro3EotXwVUz32941WYrjL5wxXFgXBYNvdw00onHsyWpKEqzaD0FV2ELSf0cTB1WklEvcg/HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7CPl5eT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOdFCG16; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K3sWb13252648
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 09:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2l+XSGNfvRBN7OsA6oPPy5KlQtETRGyeIvn7Bx5fW58=; b=J7CPl5eT8/2B+4oc
	lLQ9qYBHQVYvdJ+g1ouFH96TcjcuznRttAKFSbhfk4Im1zDHU8LHTykzi5B1uNnc
	t2nYynSqSwELTAvJpEhrcZxAOlv8PqevQ4r6Uf1fDGaXPyyvHeOu68UzIm0oYEMn
	8HwDDVqTPMbfj8SL6IaLJoiBvM0GpSkNLuUf7Vw7aHRnWLx+atFoNPuvQfYGynkt
	EbHJHi9vM0H+shLiUbbB9yutA+NoQsGWj7gcHipRUEAPAAp7LU8IODZhEcywY0PI
	zvBCEo4smCszNpUxjl6vQvIo0eT0zmglOCDuOCIv1w1UWZaAQAsXDkwvkMi3XcJM
	DltKWA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt27ah1d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 09:57:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6cfd52556so36798985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 01:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768903025; x=1769507825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2l+XSGNfvRBN7OsA6oPPy5KlQtETRGyeIvn7Bx5fW58=;
        b=NOdFCG16TN6TDRH+LFLxucHPG0BDiOmnRmPjuAc7ZVFDc8IYHxrIvIqEpVAlrXflJ1
         XCMDR06vJgAkyQChOQBA1LHEm3MaWaOtMhFM+YFRLMe3fQEI8pmFY6xK3b5tJNODoouC
         fjrmTnBXu+9KfwUcXcTXvAAIysFu4briVpzYEZaaXFqJkKvcpvdfNe5ETBT+9lh3HIqA
         pjQzASBbCQzWjnsM+izTAwVekUlycOE/31+IBgG16LY6dOFb3rk74PHl7QlwMDICIA6W
         v9NvhQ5Sde878Xu8ZzeM8eC3nrz+wiAyovvDvoK6kvjj8mm4bKp5+Kwh32eBPv1yOEx0
         dFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768903025; x=1769507825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2l+XSGNfvRBN7OsA6oPPy5KlQtETRGyeIvn7Bx5fW58=;
        b=sOYRFZfnnOzqFaoweAr/HmRVrFbnISoCVj1W1b/mscozOCbeFK9NGK/Q9+omvFaf/M
         fQMOAtmXPaQCYQdPE5OmIUbTKwV7f2T0Yx8oBxgzO9nGeDZw7lj+WL5x5i+l6gxD4mxn
         fkFysLcWMiN26RR8h97hASY91hrzeFlCLuX7xGgsrgbWDXZLj8koBbhO7SEqIrbRY8rW
         cY5A7vZtx9D7YoySJ14DUun4MhcQC8dBcz3SmLqkcBz66zrFWWTcOPoHvQvlBDhzzLTk
         gdzg1/E/tB4BTrp1SVzhJc8oWaBp9436xIF35v+Lxpp6Z5xCRAsw7rhgbkmQSSkQDGFu
         9JMw==
X-Gm-Message-State: AOJu0Yzg3jgduVwqiBzvyZCs4ec/auEye17dFLQB9jiIEHxy17yjcF6p
	/zdwTZ/XTFSTxcA7YEBm0tDzcrX78+PNeuTtU2P3cRVjqpHP09GezWXN+FcOvVGE1iXmjZ247N/
	YQaBwvR9Gsk/f14Uv+0q/wIGCQvgmd42FzZ4m4dbTLd3rEtC3sPrtM+pqKvVM1rdppZFOFmtvaG
	7r
X-Gm-Gg: AY/fxX4VlTeH/kdbTu9TBfgd07N6xP3JTKOkmTaiqHVfS0mYdfplijm12k5u8Uf05fU
	83lsTgagfQneWmfGRVilqx1dvAMRdvLHVZyS5Ha1rA132V520cSHQ7s2d1JDKh0eZrubYHJzOyZ
	/lnMyX6EPFa4GR1YZz1Bpnb5MqldNWd3/0RyZzVKtBRiNevjJboGuTLi6f1tkP/v97B30SY016a
	zVmlS2SBvK6UmHPUH+1azr97bbL/Oqjn4u8taFJ5OtpmRbjClfF+HCt2VASDDD3pQo4NXpXZym4
	esjX/CM9wKuNv7oQW/eX+o3tr0np+Ov1Dx6aOAxiK9bCs4JKKgOvIcIlFMLm2Zt+MG/lSIt1lTc
	QvcEVSZqsTiZdj+/jiA==
X-Received: by 2002:a05:620a:2912:b0:8c5:310d:3b30 with SMTP id af79cd13be357-8c589b9781amr2336076585a.12.1768903024465;
        Tue, 20 Jan 2026 01:57:04 -0800 (PST)
X-Received: by 2002:a05:620a:2912:b0:8c5:310d:3b30 with SMTP id af79cd13be357-8c589b9781amr2336074985a.12.1768903023976;
        Tue, 20 Jan 2026 01:57:03 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654533cc543sm12697032a12.20.2026.01.20.01.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 01:57:03 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 11:56:42 +0200
Subject: [PATCH 3/3] arm64: defconfig: Enable Qualcomm Eliza pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-eliza-pinctrl-v1-3-b31c3f85a5d5@oss.qualcomm.com>
References: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
In-Reply-To: <20260120-eliza-pinctrl-v1-0-b31c3f85a5d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=646;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=KKPpwl3PRgiv4NCoWVUTvYsEZb1m0fIotFZUF3K3dbs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpb1Fp0xt0i3j6+QzxNYzCJgyzMi6VBHs4caazt
 heX5Qjnh06JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaW9RaQAKCRAbX0TJAJUV
 VnwGEACcW8/b4o1Zx4cPGMJbECWHXCA8MnB6ZwvSC+3CPmgp+qeRVWUe4OjhilocpXCINg6kam3
 q8aEkLiUbWjd0bBtl/Knjw+ViMCJ3V6LN8qYtyg8vf56NyANK9MyylyBdZTuKd439LiI8QkwpMX
 ovS9oOy7Hfv+gRIPf/APKuEitrMtwjXnmt34ua2TC/t/YaY/CcQL0jdmZoR6Z543keAu8461xj8
 h2zi/D5W4Lq+eCDwM92LMQ61Lz7a6kFVNUgtr4aKp/UX5Jj/Fx35WExaPFkWlO/TflT+niRQwBE
 JITZNhiEDZSZHZBoo1cEdeFPT18wxvyPCOURc3VzsAB57xQimbmUt5+U79lbzTmYXTQUG0ocK+D
 ztC4FYa4/BTJmvZhv3VKtg9QQxrL4Q8/hUcLYGn5KZ/r3ZEg+Th16O+zoqfCV0J5r3NqhrbXzJu
 wzxFoQM69sUGRor0NTPX+8ukTmFZZ4CX1NDX74Sp/mcf6f+A3RDq+iBlfLcbDs42vMXfSK+C7tT
 Iu1qu5Wiak4o+lPD6s0+cOJm2s0wrNJULeJJiXmITLtmxajfKl/6kNL0kMWjm+17fj4e/TsuxIj
 4ASsWbkrQnqFQHcrPr6g9eFzsUJv74Llq2m31p31279KjXA7ZcgtkEfpZdQTaYJhySd90TvqWtA
 SzSC5Vbyj4fKpxg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: w010T4W_xr_JUsjCSUiUOO9e97k1-Oq1
X-Proofpoint-GUID: w010T4W_xr_JUsjCSUiUOO9e97k1-Oq1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4MiBTYWx0ZWRfX1WexwjN+H2bB
 Lh+/1PJngsTAJ72+HT8829qQ1/zYR2UpoNu/AbCm5/+h7iZg0CEIQpBzSHtcvPBG/kNxpmiBUgD
 KrTDdjMwFc6hbAi0GF0Abxpdk8q9i6ExGyhAjPszO3Ca/WYgW/eyNvcps6bAU16iTp4F15bEoOf
 +TL1xymhFymp53qV6oUt7BM2oarQxnmytVRMhdO4H5TqbrN5lxsX70wQrecqRKbwENZ8N/J12Ox
 0vFBGrLapcV43tujEx4THHVFcg9rZwAIe8vRM072A2287H5m9NsRt9DnlnQvjrJ5NTyJdf5kteM
 tC4QuhynurqdPAmiX2+gEdst6QEK0AfEC3EuBiQ37k1q6H28MuihOo/Xv1l+Jf6Sk7Tk803fTYA
 qlCGOiIR2ykyoT7kBURaM6r7+KdW3LiptrrKj/cnU7/knyusnxmp6qN8Ph2mGbkUXdab2W1ZU7c
 31/l8NRGU+HhYBmcW6Q==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=696f5171 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tDv4L-taMw6S-dqSCEsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200082

The Qualcomm Eliza SoC needs the pinctrl build-in in order to boot.
So enable it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7a6d7e70d383..7c100e51af88 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -647,6 +647,7 @@ CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
+CONFIG_PINCTRL_ELIZA=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y

-- 
2.48.1


