Return-Path: <linux-arm-msm+bounces-71457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC322B3EEF7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64FFC4E17F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F42B32A81A;
	Mon,  1 Sep 2025 19:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fi9YLFKp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B71126C3BE
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 19:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756251; cv=none; b=P8ENIK05v7VLRf7Q5fZdgI+Qkl/QtPAwMvXd9xxiotjt2dytq1fVDr3akYd2SzTwEiLktq7uwZ8xz/oqzNcHk22yfWL9MGXe4xUx4eLEPlPLTVxUVEO+f3QgomImPsDlH2j1fIFKprS73Y9lLcErBccBdnjMYZNvnJcOlrh848I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756251; c=relaxed/simple;
	bh=2HBCvrefasfSLde/LtBz6m/Kud5gPwXS3AqdFSSSbuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yqf326jt0TyN6NhOEVV2Ao+SJ9YleXXnAshQ2/1oc+ignoJs0/xnXI1FujOQq5DDMBY2ozKmTL6DT/mqfHa10MYqgM9uIq7tgakOo4vu2jxG05sVtuo1ymFcVSxd/cp/SU6Sab8O0MYhlQuQEkX5rFBQ0op5MN6Lo+IpnC4o2Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fi9YLFKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B45kO025109
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 19:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DOwAoUlzuqa
	7hTeE48P2QvIO2GkY6Mj/VfyeQ7l9coc=; b=Fi9YLFKp+kFYSuomdzo3n5fGRLw
	vsG8mEIk2mA461kLh87eteALU+wUuV9kx9exquADIQY8Tc7w0+IhbBcdVYwB2FtG
	H3N38gdxwuXwu2ak7MGaMBCugqmYkwtDfpkQYK60vxbNzzD2XMRJibpmjmQWom0J
	69uX4QXA6Nqrlw+4Ao19iYF3lFpFr/fbp8DvgDNZGfMo1ruAfNBTOM5m0RtNLMU9
	6LsO9OhyT9FZVHNiML3b/dbYE/q1cWbJxHl8A7V/pWwQAz/P+j7YlxhZ/wQfd8+O
	SWY5QgflXMlGZxZsuTUcWs023zrN1VZ7JriVL2FbUjt7gLcK69IlNercujA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fdkm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 19:50:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b33e8943e3so7837681cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 12:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756247; x=1757361047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOwAoUlzuqa7hTeE48P2QvIO2GkY6Mj/VfyeQ7l9coc=;
        b=u7a7ZSy+ovY/rKynQp5eC5cBMmz6b6mIu8jGrYLuLYNiQaF6onfZ4NGl2QdcDdO08K
         EwI8/C+5e1wmSo7273YmD/DgAeRQVtqsYfv+iXcJzWPTbLFiUQxIB/JfAJtKZLJHCGyU
         TiCAJOUTJEsVm+j6qlsJp7QATgcADHsraXTayTOwHDoR6U2ZdCOOpJyodCamQrHBgjm5
         DyiDbCv+y1XRTrqV4kWaoYu7O5AgQuze1CR3mnatlEf2c4yISltJkDKc9/D5X+ZHQkD+
         wZkcXorblEjSHPTpoT7MgACTDOOTtGSCGGjc75uLWeQB0VONN7P6rbHRHVYTk0KKaVqn
         mT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxx0TwT7e89NtRsQmpgN4WpNbtYG76KxGfijTGbINIDlFl0I9Q1LHxAIu1mAoWlfJkKjh0N7VEcalrP/jV@vger.kernel.org
X-Gm-Message-State: AOJu0YxjaqieWOBO8Z19CkVcmZmxEo7PuZoneqZSui3oD7NG07Ny6zVr
	k8HXIn4sssCw/g7bKtHXFaBfxIYpzCgTxHxvngdzICx7ubrekeE/7b+fEtwve9zFmQJD89Xy0Mc
	3k//4ijNSAk5DNy4cduAFgWlcd6TwAtqCz8iQRPSbe4fzrPmwNGVsI1/gwV2J2l7QxD+Y
X-Gm-Gg: ASbGncvNfpSB91SM9Acf4dBaZtXFhyrevQz5HMwqWVV87tbNBQEIYHTGUXLvJYLseVx
	7EdbDS9vL7NL2gZM9lyMCQorK/ZzhbfUD1c/MSPdFXTnenbuGMwm4r5QnVdewujlkgPA7jS7HCb
	6f7b17Cjq28u3wsKQiCTTko9gAsBLyTX+MBytmww6E1IHb2jR+6fqPVrvSlayco1SqrfCSC5d2G
	FX5VYBstyNNeGVjndszbyZEvesnBQV2Dhgu0QUo69WuzejDBfonaHtg7uDXFzNHvgAORFn7MB08
	Kje3VfU91WWhmRwxT9/1HIqf5kjjG/OljvhKNccswkEoEhdZMeSmBA==
X-Received: by 2002:a05:622a:1a0a:b0:4b0:61fa:19b5 with SMTP id d75a77b69052e-4b31d9f0bd4mr103979781cf.24.1756756246959;
        Mon, 01 Sep 2025 12:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8lcuLrPgwq9ga93n+Apj7m0TtKUqMmRocQnUzq1ECRFE6bweqLXtt8pEYlXV9Ca3WHx/wNQ==
X-Received: by 2002:a05:622a:1a0a:b0:4b0:61fa:19b5 with SMTP id d75a77b69052e-4b31d9f0bd4mr103979391cf.24.1756756246315;
        Mon, 01 Sep 2025 12:50:46 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm4653705f8f.10.2025.09.01.12.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:50:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/7] dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
Date: Mon,  1 Sep 2025 20:50:36 +0100
Message-ID: <20250901195037.47156-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX272g5O87854X
 NmwSxVIILCOhDzwdEKA3moC1GVJnrFSM+EtdqrzVc4IhUYO7i7pk7apHvjDhe8PyPSxU08jV7yV
 eeQkbaYRK/87mLeGvWfJBL/U7bhtkU54iOmeXhCMD6l1gLvCW2ORfkp27TwwbrZs2+ZhJAtspqr
 HuOOI8SHgto7zv/yzzYy8R14VI8xNz2nHJGcQRnVppaeKh6vZEr1o4aK8+px2vNZHRGqxwtiQJk
 SL6H5jhAkB6ph9z3HDlh8iogIlr+wiuAN6MpFblVs3fzT/VTT7DsQYq3N1lVRCCoR+LArO4bJeL
 OcyA2uunObfJ2PvP+dTk1I+sv04I45FkKIdXcf67+11n5RZYP9co6q0OV5ROVyrDfw2WfUYwdyI
 65u7vvuy
X-Proofpoint-ORIG-GUID: eoNrKdh3JWr5k8oXgiMYavVzT8zThIZL
X-Proofpoint-GUID: eoNrKdh3JWr5k8oXgiMYavVzT8zThIZL
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b5f918 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=W-ialWlWjSFIadUgVrgA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

Add bindings for Soundwire controllers v3.1.0, which is available on
Qualcomm Glymur SoC.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 7ea491f7e828..003023729fb8 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -23,6 +23,7 @@ properties:
           - qcom,soundwire-v1.6.0
           - qcom,soundwire-v1.7.0
           - qcom,soundwire-v2.0.0
+          - qcom,soundwire-v3.1.0
       - items:
           - enum:
               - qcom,soundwire-v2.1.0
-- 
2.50.0


