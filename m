Return-Path: <linux-arm-msm+bounces-86282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C2272CD8135
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 05:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A760300253A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 04:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A812ECE9B;
	Tue, 23 Dec 2025 04:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gh7SeYb4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0O9HRV3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F93D1DF271
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766465324; cv=none; b=HCZUIup/BTEthklDRJFk9MZYJ2+nqUY9X/jE0y8GgIMsTebdRg6UnjDQGbqDJ54gvf3W3duGiNKfnXxxKiuq7GNF/SIizX3O8YuXZEoKiGrcEWRBMya6jFgHQ4sFCB6HOD8uNAHtxXgP8uV3z9Jr8wgZdwt9H0csNaNGCTTjq3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766465324; c=relaxed/simple;
	bh=CMGGQL5QWJe/piAjltmzUTUwWcG5aRX25Q9dhRO6gxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rN7qEhJekkTADvuGlEmiufAGA+zywZhUg9t34jzn9YfjPL6hbMkLqunolupP6m2oS3cnie96r3hnk8mEFA2I+TArfnfVQFJ2MaX+8t7BaOCt7AbP1E4yHf0JfVb/gyWgkL2vxIYx7mxsjatnNR6VlQgoIoe6xp0mjPsvjK6uBWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gh7SeYb4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0O9HRV3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMKEV8n4044571
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/hDBX5mLgOSdIJryYj4Sqei8YelgVM5i3AjtuOIU7c=; b=Gh7SeYb4eVnkcWtL
	Mnwfvgriex8bSxw7Lo8ur7gJ3cqt3hfqn19jnkx+tQlEY48zJbPCurIU44hMi4IZ
	es4w3nmI4kWL4cAv7ZRy7v9CTWUTNDP1nPMR89zrbzEkZziVMuxBvKH510wrLzOa
	wIs0NaY1Wfwq00RTX6ZuK/RqxpmhCa7PapIua7P4BYPmjxtiKnwcszXCoJYjk4+m
	OkyFBIbgdtybeexhrE7WfY3+h64J7erBUtk7PGaWGEOqEOOoOoW37nHK7V2hf3F7
	jQM2D9dXr4ukwM/LOO+aFR/uZaJQp8cbwvH5jiyBrjk460rviPUkf0egHtkrzsSi
	jdV5FA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuh992m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:48:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ab459c051so12336809a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 20:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766465322; x=1767070122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/hDBX5mLgOSdIJryYj4Sqei8YelgVM5i3AjtuOIU7c=;
        b=B0O9HRV3fY0YGSw00rpa2+XJuk7+TSygRUcSXCMS3jHlPBjU7cYkOAbmADyUPw79OF
         31mn0qmJuRw9zj7B60m8bqJg2zy5fSN4NP4WJxIcYfmZ1Q6Cryf95g0dDGgNMN4uYloO
         PwK7jBnhUmF8zUoQcyrNTiNST91Sm7LdS3nMUcQf8AAK067DUo9seM6UpdnDauUm19oi
         D50KvqI0lulFSR4dHqCHHx4qhjGWOeMOcLHyF7YaNCo7joYuunnQe+vQhWXTkJHl8UeV
         68rRCXTnOqFou8uMaf7gYerQzgbIDnMXTUJyYBxUnNYwKs9xHajp1JQJi/ZSQuT4vPYd
         nCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766465322; x=1767070122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/hDBX5mLgOSdIJryYj4Sqei8YelgVM5i3AjtuOIU7c=;
        b=o1PzO8lR5XbjQrrUv1Pqbjm/WvPd/eHuxOPE2+AeDE18bFVLAa8QLLFfjRZ2Xojoyr
         yDmAfPjMSvZ+wGGupUqOXQxYAZWHd8rpzXEozj4rrUMdh3IxED+Akf8hmx1yjoVCV+A9
         ooGlM9ywq4CIrv+Wu7xhMdHNP4/fv6ZyHIhWWgSWneSE7H1dzUmpy6dgulu7V8PQlgVr
         sCkn8HJHniVJ878KziAxA63Uxc9/3jRFn9SHn3fPZgRYqqBkMkuyZEEGCicup2axABte
         llEPR9Zru1BmQSRZCX+quejKDvHoW6vTdTPlxfXy4SGof4tWI70qbUccjN5w79Sy9jDH
         GxHg==
X-Gm-Message-State: AOJu0YxJ7UKmY25x4y7OI8giuCj15AnnNLSQFIhb1R1Wa/IHPTVZmOaB
	ZgHpERtcGP7sNZqZB+Un+jVrhejIqORHIuQPlrVLoVd+bBLaF8y2A9gkML/ScImHmGrCS1bR3FN
	j6JreFohV9/2rJZeFg5HZIVSMDWLG4SwqlzsIbhRD2Op8jT4zjEItLvVfp3LyWWD7JZr7
X-Gm-Gg: AY/fxX7Lck3YFhzob5/1nQqqeG06/195ZU1EdMOSdX3onREQ2WotjUXpD2S+qjw/IEt
	B5SCr7W3YOfWoIWRUxJlHREWafkIsagz99H4r6ZqXCRVHFQWmsqtUx1D+n3bTy+yYNiNEeuW214
	8iR+SI7l9taqn9S3EeVIIokXFC/YBfgYmzj+c4x8fV5tyFS94BlV3Q6xSJ09LsLlRpY7yLYCory
	3MJZe3wYYbc3me/BdjnhkPWhnmyn7UXA3oU1SQVR+pZV/xQ5Hxf22Ei/dmEiO7R1x8/snL7kji1
	ViLObQFyN2rNowSViTQcwbNojKRGBYGfFS7Jj9um8o7hWIOXyXwnA4fk4adqFMItWsrPhbf5k6g
	3rBKSq6pHFlCMgjX21PpaPN1CNK3IhNHV+fc=
X-Received: by 2002:a17:902:d541:b0:2a1:388c:ca5b with SMTP id d9443c01a7336-2a2f2a3551emr153992125ad.39.1766465321925;
        Mon, 22 Dec 2025 20:48:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHri+m8RE+iDJJCDrA4k39KHtgYbgIzbV+TNylaO/2pNchET7js7YqYUWunXoEnf3dMeNdyEg==
X-Received: by 2002:a17:902:d541:b0:2a1:388c:ca5b with SMTP id d9443c01a7336-2a2f2a3551emr153991945ad.39.1766465321467;
        Mon, 22 Dec 2025 20:48:41 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm111316245ad.42.2025.12.22.20.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 20:48:41 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 10:18:16 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: x1e80100: add TRNG node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-trng_dt_binding_x1e80100-v4-2-5bfe781f9c7b@oss.qualcomm.com>
References: <20251223-trng_dt_binding_x1e80100-v4-0-5bfe781f9c7b@oss.qualcomm.com>
In-Reply-To: <20251223-trng_dt_binding_x1e80100-v4-0-5bfe781f9c7b@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766465308; l=989;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=CMGGQL5QWJe/piAjltmzUTUwWcG5aRX25Q9dhRO6gxg=;
 b=TGTiw49JnMKrMe62CtB5dYJ5m9av0bToWKPuGwOgYJWMqtgpAvGGtIPsuLXA1jHuZebz0k962
 ALs3zKyWZclCioTRnBvgcRwS234LAU2U5zGnA9VVrsKevp4c5BlUEft
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: 77aHs3zRjfbpYiR3lzWEX_X3Ctf2-5Em
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAzOCBTYWx0ZWRfX4zKY+RLNSaOi
 96xVTy6aItXCKA1CEW15Fd0UjClph1xhXcJxzJNYy9RHD8K1+C9C7QD0NpBWIM8Kj/damzGuGNv
 49R8h0PkuWVPujYMq6V5vbF08irquXDOBck06R8/A5oGObq6nd8oSwjbHilyZCzAnlZsOog3F1b
 q7CtRKtB/x6RGJFcJUICplZ9/jvWEjrgcvtcTQuM40y87EOrKOivqFxLjz9WZEo/xjDdBfGmvYE
 trygOczYXLR3QMmvp9o1EHZjWflyTIT89h6ubLspe0bhpESFl3U+dlVCb/sYbdOh34pytPa1nVw
 FvQsRFVI1+cNNZzxFwYn3XDbtHpXtcgo+wcB9OEDWGZGSQJOAvONH+MsrvMxQZIzq6udW/K11Gb
 vQn5qsQpp6JIn8wChKmxPBZAv9qKxbpTbqbPEmwehFYhCJzWZSs6hIJiPV6Eav3Pxgj0uPjXN9A
 l/q/MCBbh7VkZ96wlPw==
X-Proofpoint-GUID: 77aHs3zRjfbpYiR3lzWEX_X3Ctf2-5Em
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a1f2a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=75mWG-WH9mJFzEGoRSkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230038

The x1e80100 SoC has a True Random Number Generator, add the node with
the correct compatible set.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index bb7c14d473c9..1272f2d3a7c1 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3060,6 +3060,11 @@ usb_1_ss2_qmpphy_dp_in: endpoint {
 			};
 		};
 
+		rng: rng@10c3000 {
+			compatible = "qcom,x1e80100-trng", "qcom,trng";
+			reg = <0x0 0x010c3000 0x0 0x1000>;
+		};
+
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,x1e80100-cnoc-main";
 			reg = <0 0x01500000 0 0x14400>;

-- 
2.34.1


