Return-Path: <linux-arm-msm+bounces-85946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 390CECD127C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D992B3036D86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F10A32A3FD;
	Fri, 19 Dec 2025 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQeto4vi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFdtupsP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250432E3397
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766165489; cv=none; b=hx4VvYJ2dUw46Z5A92f+9393cKQ0/IJGgW4pfjaWJRpY40kbdvx7fPqzOi9bSvAdkHJiLB7tcODx9vRsAC6YJNEuIf8Giwvvrgvx9HqCJG2N1CpgKMMalFUZxVLjtpMKUDiKLrcgFG166UaYzHdtZV2o/Ic/clj4RIF09FDzZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766165489; c=relaxed/simple;
	bh=qz6pZtrylAjblgA1DeOmmaAivAFk0BsTDeRg6WCp5fk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XzUcHtTD1AeOg7BLYeNyjsK78ps4PKdvtxijxri9156q4k5a+fTvp4cc5h9lB/GZiVZSYCUe4qx6cfKuL2/OtB/GnnDzVEWuc538RY1392z7+AIbNaxQXLGTN5NFjYQIL7kZPTcQdKhRKZpUkkx++7VZj1+7hxunk0Vo0anRVi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQeto4vi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFdtupsP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFjUto1684434
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y4JtJATT+zn
	ugwSXROWGs3HE8ker41Bd+L89u7rq9RY=; b=eQeto4vihjjCseV9RTj2Lf9p/eq
	hPCZVuRf0FUfEtXYy91afEQ9aL68z73xz91/+aAkAaMw05sw8hzuBP/Wkks3nUdi
	hdTZR6j2EiDCL79tww4URh7Ws0D9sWY0r8sSJbB63rY3x3s9OmsvqBnXAeRjjRgm
	BlyqqL+wlIwvuGT1GL7JFN3Xp1Wrmnlp8vzbhHhzznbTYXSpG2g5j8vwEXaOfF2q
	a/I730oHeQwJBIYlQsgPif2Ro57Vv188hv6Jz7XsaZDjJX/I4ze4MzLv35KNNM7l
	44utb+GZu6RCpZ2sHqbtqo2VPNosPw99T5Lc84Kx0SIm1RibWVvm1blzMBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fkekq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0f47c0e60so48587025ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766165486; x=1766770286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4JtJATT+znugwSXROWGs3HE8ker41Bd+L89u7rq9RY=;
        b=HFdtupsPN/x0ICeBW79UZaMYJnHunR+798JyD3w4LcjK8PnK8DcFk2jPfJ7deUUPyB
         V42DSC8xsQjgNb2NCy1AdXuYrKldU8D9Qt+VQk2J/oadImpZDSc67z9skqnfjcOwK6dk
         0J6BrHxymZWc5kcysiW01YLJ+ksxglnODQjTtDVAeFa1nJbyf9CX4nbWEj8BIoY0UFjQ
         dd/pPDwdSAei7O3mH/4gCL/UmrEZdcIjNr9MCeVPcAg0Q7HzvVE36npcf5MNbHD5C7GD
         CfDs0kErwQ4Ql4kOIJl+WutSQCmXG42i16Rtmt489YESeEhPJTciqDW/rw7jgivEJ0HX
         0mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766165486; x=1766770286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y4JtJATT+znugwSXROWGs3HE8ker41Bd+L89u7rq9RY=;
        b=Rome+IiHGCCCRXoa10Lt1mWR9YzVSMJjzu9nV8yf2FEUuq93PNxNhcLn9r8DyFOvNa
         qijaIr+mvmsSMZ1sp39oOuItcEJfrw/89a/GoEoWJxL12o4MubBA4ZVrYmPGhpCd9Wqe
         +GFoZEtPs1dns9dfoeAuQkdx9q8ghV6NDANf/AfcA/JvQVYqzxibTc1i0Nn3KV/1X3N1
         ffS2okj/dmhiw+HX+qGepaynhS8U8BDw7G79ZbU7ADofU3Y7CxCKUpB/AttrIgcnJ7lR
         P24Q4NXSzZUwGFG/vFewdZwADhRpUiQWYv2B4/VQbOAhb7Ia8uZX2hF/xEIo8BFr1j7a
         /sXA==
X-Gm-Message-State: AOJu0YwJ5n5+l0cBAMwBoiIpueYDNFK/2obxTMcUIme9l1MZPrQUncw7
	7zKqkrXOx8pIdpgr4BVOqlL1U25+rMvJnNuNk+M8Py2lHDSOcakSIJD7FPuvVy2MKobLDdff0yk
	Vzv5UPHyks4iboraxr0DosZfEsf0bvbv1DukxzK8hDUkz8Nd+P73tPfd/OrveK56NVJpq
X-Gm-Gg: AY/fxX4XFW0vWnHV2X+h6lru0b5EYBa3NtrZuW5mRdgmOiC5lengiKR+mRvPxtKZNnz
	3W1Mnof4r53JbYNhYTnKv0ROop1WHM2YufyfktLK8Ll7omw4rjnfncmKqkQjPGCTh4Itw5N5jvx
	XWfsMPPlqdT123umZi6fHeK+bE9pztSJ1/PxO2PnffYDA4XYJPfjASYXLAgWRpKhuhWSc+MNBU6
	g8P0FxxvsSXZ+rDA3uw4IWvvjOv98cRcDNc/CHV/GCQknXfyrMdfv3KcTTY0/66XYos4OasTr7a
	iBo2Q2MUvtopTenRlGFEEvboIldyykT7r0MmM3EBmifN/C12GxOGueyzQznTmQaVjJkBxA7SN/z
	hqYGA2+/r4BNKGSCKLN5/9iwvCyrYL0zwtUFnYO37SXfFB68=
X-Received: by 2002:a17:902:cec1:b0:2a0:e195:b846 with SMTP id d9443c01a7336-2a2f2c4cde8mr30440525ad.54.1766165485235;
        Fri, 19 Dec 2025 09:31:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0ue4HpXY8vYB0mKQdG1pqLFR1JAAfGIxC9B6A6qayF7Q4jSjg2qMDAVUkxJC/KroWOTtT6g==
X-Received: by 2002:a17:902:cec1:b0:2a0:e195:b846 with SMTP id d9443c01a7336-2a2f2c4cde8mr30440075ad.54.1766165484573;
        Fri, 19 Dec 2025 09:31:24 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5f5dasm27568705ad.82.2025.12.19.09.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 09:31:24 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add squelch param update
Date: Fri, 19 Dec 2025 23:01:06 +0530
Message-Id: <20251219173108.2119296-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=69458bef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HBn9Jitws6tvw3KM7cgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: m-SgN_TnWE3KzI_7xitLCM-6GKJhLzFM
X-Proofpoint-GUID: m-SgN_TnWE3KzI_7xitLCM-6GKJhLzFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE0NiBTYWx0ZWRfXwNYPgQteNKMZ
 Q/aSpgDsYwfsIBhDk+qGR4q83NMhnnjMR5nE2Q1Ql8U2LyuEMo90Y3UpzoWexsJ6WonBWoSOr8Z
 NDi6qqVAXBa/jyUfERI/MPhqbuTjDagXoLKJMXAKjIOZQKL4fgVPW9czLbvqxbjP7sHhzaQE/KG
 v7Z9mnLjj2csxIZjJXCxZH12e4q3KA5vsDceyB9Oq6dck+PDoLO1AfovLM+DhaaCZnHRpUzJwJp
 zKEX6bugKFKGb/2syBTw+fv2KprG9X5uxOmH9r8KpsInN+Um+HRA/aBaCt20YqjV+b+G6CKUW+d
 OOlgIZ7K8XG3TpOdSJT0JpZ7Ub4p1bBJCinbbKBlsglVQLApV7icJdNoBgsV+68qr3erErEAqw2
 47CvwgiMRMPyFXuXC6D4mFlTj8MHlCdpU2CmZVweuTSGboHsp7e2FQj81SIzzt5nChC70yZYxRE
 2tjc8fh2Z406qOETxsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190146

Add squelch detect parameter update for synopsys eusb2 repeater. The
values (indicated in basis-points) depict a percentage change with
respect to the nominal value.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 5bf0d6c9c025..f2afcf0e986a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -59,6 +59,14 @@ properties:
     minimum: 0
     maximum: 7
 
+  qcom,squelch-detector-bp:
+    description:
+      This adjusts the voltage level for the threshold used to detect valid
+      high-speed data.
+    minimum: -6000
+    maximum: 1000
+    multipleOf: 1000
+
 required:
   - compatible
   - reg
-- 
2.34.1


