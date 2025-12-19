Return-Path: <linux-arm-msm+bounces-85810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11746CCF440
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABA3530275F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443403019BE;
	Fri, 19 Dec 2025 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNfwareQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGlGLAAO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0870C2FF662
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138456; cv=none; b=AMHyL6CRQ8qmvtIOYHBXgSQha3JL3ZmVrtIvvluRcXav2YxN0++gOdhvhCmAorYI6nFkurtJVu1+Id2per9jZip03TRr9nAMb1PK+FTnG/MQnJ/Cv0Y/hlXKva4MOlgAlRy1S7ceD+1SjvB3wRYQPP7raSS/Uhfavda0n8LSUCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138456; c=relaxed/simple;
	bh=X/woPCCKj0zzfDXr6Vqiu9G2o8zrcx+qNe6f+/NweL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gGtAL0fVvhNaqI36DkgmmEKTpifvudZCXv5kLdRwJtqSYLECBMl2bAuMWOPaRGUoLjsAB/hxXMR4/oZGZZuGdvYqjoGa35a001c+preI6Hut35l8fk3NJWfBZLrbnQHu2ku9NxgTnnNKjncRsMIZZE8cJuYF8gcwb5N9kN/9MOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNfwareQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGlGLAAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c8bd3559084
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v8LW1j9iesRUHCUhlLvWVOAbu0RGV4koVYlCPBTb+pY=; b=dNfwareQzEL3gJem
	oYWI6y5VkxyHjyZqxkhsErleMBja5kOsu5YrzlIkxYd1kK5QAlPHhoK6q2KMsCld
	pf3kjUBWnFd4SH5oi0hjuCVrFYHkNLgKDD8vfIGz/0yuPX3BYU2NkTR6VLqprjpr
	MCC2Bt3Ic6pbp/mI73tQDjoVev1GZeKOXgoxCOhEhC3PluZAWeLrIJ7TKssEUfq/
	lxGoc+/wdxDLWGIp9JgCAGxmJXJseu/7qAdD0ATc9qyIA1AXuHS+y9i1VDQczTqY
	hCDhy5wTDxhIV9wr+Vu3CMWFcTDyzGZ9Hh23cR6hnevHzWesCnLi2BpCS3FPiiIx
	PEDiDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ca7vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb0ae16a63so166232385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138451; x=1766743251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8LW1j9iesRUHCUhlLvWVOAbu0RGV4koVYlCPBTb+pY=;
        b=YGlGLAAOp7O8WirXZ6fvOV/BOshl1WPefCV0xQjvDXW8YlCbr2x/7z7QtooM0iTWbJ
         3pCW+34+0eNvyzasZ5QyaVHJCw0j0Z3xgVKF5+nhV6WoCwdJbBo3lNQme1GtAm6brhUX
         wADl/foQiJpMT2hZMEY5H4iSc/vlhfNDHoI8g0qniECKmpMISun9iMC50vEERfnkJsNX
         rKJQkk5XWjKkTYrE8EzsW9oQdgKhaIk+vZ4gXkz49Gl/adrg3+UyvaD/r1nU+/2uLIBc
         DiU5ZgECdefTvUXs0vTaqY//UgC6PqDToucjskOXyMQK2slvbS8qukB8HXS/oNITWxB0
         nZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138451; x=1766743251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8LW1j9iesRUHCUhlLvWVOAbu0RGV4koVYlCPBTb+pY=;
        b=tJ0DX1rHxIUb+tnVASO4/DG7qb5jBKBdZuIp1SxD6VhNjE1JMgVcyasIEoXaffarsP
         /fvOtHhhUxl0FxGS8XIBqlPqpqOkjAsiKInYxu/ZSzOggIpADtbBa3xgueBe+4ZZ1GNm
         B3MRPZmbPBSFqtk73H0CupX/9B0vkGx18mo9diPkIk9/oNT4lWgRsPxl7liNJ2SIPh5E
         eO1KcLEFsub7iToa8OYdaZQhXlxjYP7jvXIpXOZdNC7vMz4Ri+qrRSlMGCpiQm5r7EKG
         v7PMR38yFbUVYXZ4sbDs5/tLVNyiqe5/7jvfbnsFxfbYYAeDxrk0Uk/cA73jB05eJs6k
         okQA==
X-Forwarded-Encrypted: i=1; AJvYcCX/BPTczQBZeEBILpVWcyTASLmXrvSGNSWuoDwlvmCLaeDS4D8GHcR9ca5BKAfWVL06PpTHq/Zh/HWUmAnb@vger.kernel.org
X-Gm-Message-State: AOJu0YycthbzSn3HlLjJYaxTJK7AIUPNJd03HvAZar07KiqLFs4d5Xfh
	F2wEG+8e+ymA7Uw78pDPk/r2eeJ71UkAMfVptG0GtbW41a/aLY7id6Dg+fCd1Lc7bJkr2GohZE8
	RRujb4ThqxSPK9dwCJKa15vONdKw8r+A7dUj640RRfhh0LkUKhJuFZ1TuzCRLIAnUgwvk
X-Gm-Gg: AY/fxX5i5tCwFtVB2ZGSXxwLF/uUqSVDi0BMVED8yUYWrgLcIvcC7D67VlouN0B4LVo
	S13/kij/8lZJ8Ozhu9Knzh4NfARd7qPhcSw6QERe86PdxigJaLtvR6bAuxp9M4vC12x4licc2q2
	IxPRyhO87e/K/jESrkqfJOlhWlC7sMbkVzPnhBqppjwA4ad4NCdEo16XX1X4lWhoHrviU0diJ+G
	FppUpQ6W/Dpf+DAofkn44eFqfJmX3HyuPSSIVtSLoZlbbp/5H4HAa3hJ8Y9Q7446AqtabvPkp5/
	bAky5MN9PdSWlS7aE0vUIR9QRZJdEPTlPVAPLv7bqCcWapjEy4Eyys8rD+S4Z+UoqGQjcONb5u8
	sZ3V9Jljbz9hLH7Q=
X-Received: by 2002:a05:622a:259b:b0:4ed:e595:bc85 with SMTP id d75a77b69052e-4f4abd621b7mr34433011cf.46.1766138450907;
        Fri, 19 Dec 2025 02:00:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd1P3AYYLyroZawKvkw081eWEd1n9aeDbLa5HMuOmQKwC5w0ebW3tjanqSJ8iP6s7bHqoQNQ==
X-Received: by 2002:a05:622a:259b:b0:4ed:e595:bc85 with SMTP id d75a77b69052e-4f4abd621b7mr34431941cf.46.1766138450136;
        Fri, 19 Dec 2025 02:00:50 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm4106563f8f.22.2025.12.19.02.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:00:48 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:00:30 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1-el2: Enable the APSS watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-3-fdfc6ba663e6@oss.qualcomm.com>
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
In-Reply-To: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=X/woPCCKj0zzfDXr6Vqiu9G2o8zrcx+qNe6f+/NweL8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRSJJGRcAyeolWf17sx1zLCEE+2t9MlBQSXOQ5
 9BCU0HPBIeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUiSQAKCRAbX0TJAJUV
 VrU/EAC3O+fosmwh5uoUiTIPEBrhutRcj4sjgauVbAbUIMmFvw3M+7eghwF5hh4YBpYwcBQ4yKi
 mA1i9tCWOvTfdbs01ZahI/je2Cqb5HUGHOA1aBco1N7Wh0I5bH2Wr/ErP7addK1gtne0xoGo+tx
 S06pN4rcuptXOwy/VXAsdf58opjt/MJ/qxRO+EY025w8Ct+aYWKbSujyhL2GgphzhuZIkcNLPCG
 aQQZAx9bw3q2Snx1sti+gB95F68AxZVcokrLRvni4ZAsNkiYWDn7taApYhk2rvA4sD3uIjDegdt
 83Q3QEsn9FHjQLjlvy3OKpH6m/YRPS5yYGumcJzUgfU2JFWef0iLwlig8eoBFq5QT3SAb9N19OU
 HRPvgmroSyYz4SnP3ZzHM1ySxVhOA8h8vKUUNz99oETVxwZf8bbnFExN6oPzwqCiJaA/fBbHEt9
 kyPNZ/pvBkYtwIjuVf5snRk9Cm8AdX1HLThQ87G1aKURVeUn9OtAE41jrqcRlpYUwcpaUmlkA3e
 rXW6vd3DkvKV0ca3SaJE7sI3ZZTQsh6a5UanbeZpqu0urvRjQcQjM0afzeuRoaDfsl3TND+G7Yy
 b8CepvzYraZsLdlmVUkX/LrFHEzYRwSuoeOPPpEO9cECjVSw4wyh0/GKZzTFdkQzeKWLshTFP6Y
 CyP3vT8H4KHi/Cw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=69452254 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FZ1xxrKGKg_zhwGc0gQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX6zPNwA+SzUKY
 WAawHKtss+i5qE1AEyUDlG8Y1OKaG9vkzVFtelLhBOBLBPJix0CV6v1WGSe1dnNcfgryBwFnFxD
 q2/PC7mVnteMFI95ClMdguW1UlXUIi1aE5O80jtPnCfiWDjO+OcrBFXCykaGjr/PGw0gaXc6bmi
 yi2k3sxiVTkXkGNqg2vjyhjSlIqaphQT7jSk1o7ku99ERbqZgE+KSWPJ1RJgq+8BaJ8xMg9qNr1
 abr+a3LRVtT04cv8D3YOp9U9szLvRAkbJjS5uOkFWSQyy8HBUQEOM+FlXYQAwoySEvMxWH0AGuQ
 4aQ3yOIuzeXMliYVS4q0eML6z71YMKfdhUdQzbcAxsEpXvqo6yHJaVH1YuoRf/ULffiGGQV4O3f
 9wdhwGMRiXzK1NMwedaYbJPGXq1CSf/qXKE3EJmtdjVTs14G6HxlVg/cdEG8gZdNiPppXGn+0kj
 WzcvF8uD35H2n7b/cag==
X-Proofpoint-GUID: pUYAUqZkbqdhQWymOyzdtTCZhjVX8aHX
X-Proofpoint-ORIG-GUID: pUYAUqZkbqdhQWymOyzdtTCZhjVX8aHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190082

In EL2, the APSS watchdog is available. So enable it in the overlay.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-el2.dtso | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
index 2d1c9151cf1b..175679be01eb 100644
--- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
@@ -7,6 +7,10 @@
 /dts-v1/;
 /plugin/;
 
+&apss_watchdog {
+	status = "okay";
+};
+
 /* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
 &gpu_zap_shader {
 	status = "disabled";

-- 
2.48.1


