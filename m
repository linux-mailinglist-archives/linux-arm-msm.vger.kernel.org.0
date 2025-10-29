Return-Path: <linux-arm-msm+bounces-79330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D018EC18538
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 06:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D12991898425
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 05:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6B12F9DA4;
	Wed, 29 Oct 2025 05:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9iu5U/t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0+1Zafs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A32F8BCD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761716679; cv=none; b=r1y5pJ1pPSjlR+rbipE3fLveQ8PdUHquGz47ietMg7148YV6Ex8LYYUsavfflc2FimY30bQ7o3dhUY34r51RA4pc6qT39HZgrSX3rnXQ6qwZpfFaG8USjH29IDKeCpJACWSxJguzOhRCCr3EpnlTgBcaXS9+T1lRYA8ZIL9aV2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761716679; c=relaxed/simple;
	bh=bZnoqdyFY3pu65TwtNZzfCsh30CpB8ikyYZgkjinaCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KurcEjDk6fAcQbccOlMdeXuQXKuQJTxifYG7OWG0aNP5Nhdj9J990DXhBtbxWqSM6Mpq0YTwYLKjkA9OA5whbnV2VtxapgGJBDSGlqR2rWVtCbM0BWp27+lIg0PPwdOrZL8G+3BM25kkjV8cKJdSifI8yCkokZgtL5/pqeNH9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9iu5U/t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0+1Zafs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v9H63639224
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LipVLE24QMA8YmFHCyk8Jk9meuXazMzb1E+JswV0knE=; b=T9iu5U/tYAD9ZY6p
	zbJX/Pu+o30ClNdz3mXyCw0qXCz52cNIkpirvawVcxCmCjFTBGK+of6TRHc1s8vG
	2laP3V+jKbvKPRIDnM6fIprtsHxogo30YIjoRDaU2zvdjpSb5Bznj4HTwRwGocZS
	xc6EejKnsmcu/f1cgStlmXQ7RExQrdetvli6ip87DIbX3mzvxCCxczesUllMtLca
	tD2wRNWz/8trrl1tMtijbqGJ90X64e5UGIBU4+LQf+DmBLPF3vdN4XurYMXXty39
	MsmvijhN7GEOHw7lYJbDuYSxPlM09YWIyZBDPdZAdW4PIiDCgZ9k0p+PLsWJgukC
	91lA1w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34cd9aaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:44:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33d75897745so16049019a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761716676; x=1762321476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LipVLE24QMA8YmFHCyk8Jk9meuXazMzb1E+JswV0knE=;
        b=Q0+1Zafs5QfRI2YDSI5CcssQ9X/kop4IvhC+FJr+Q0yXl+3jybRP/iNYR3Nf4TD4JX
         LHTceAevpA9IhuXXCyoh2w7dukDnJCCOSgbGajm7qQkHo5bv3DcLdcaUUAYINQ652Bv/
         RNA07OHI2RE6jNG0notPa6MakclJ8xOUprUPVM3o8G8GV8Lj+ITH9KeAeUTcJbKVMXWG
         IIEWO9dUNloIa730Gz993+suifYyJIyQNvrQSz2pcCJqVv2RSc9B6buih4xt8gMhq1wx
         UrXgXGJIUYDvve+8T8HiRrNOH7Z71+eyfDINCIQZ+c1NMi316IHv/nWmHm3BGS+Akhwb
         vcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761716676; x=1762321476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LipVLE24QMA8YmFHCyk8Jk9meuXazMzb1E+JswV0knE=;
        b=INkcVoYT+khjPI1cmaRn61iwFlzQ7psr23soHnyGjpnaQjPSEmDw57YNsvXTbx+xHM
         ptsOgrcK3smv3KTkC0/+th8bD+2WEJtvEr/jNRLJtNtWvJ5DQ2kmUgXwc5KVdaU/Qp20
         mq++AE44G71nD4Bny2cnayQFSJAxLFIS5iHJC/YI+CFUNFXtPQN8OL38h45tAZf+q2WH
         CNOOFALNpjhfd+btgamHPh+xIeSR8ZskRhbsD01Mtaf2aNNFqZP+ikiu0DY+7j2sRsA6
         5fJZxKWpGK+7t7OUX7WDv8kA0j/Qd188LdBxgkYHScm0vSDpDZR/OE7kWPT+cZdZhtvL
         UssA==
X-Forwarded-Encrypted: i=1; AJvYcCW0A6lSgLVNDkERkQiHmXOwwnj6x0ODDp2Eyq5uAOsQ+kMkHST2ePVhTM7p4U7vWODy55m3k20usaqcrpcY@vger.kernel.org
X-Gm-Message-State: AOJu0YyWyzI13/IzsjcXNCZ518HpJZSaeJt7u/CozCRvojcbG6tMOUst
	g0ogrr1nKNhFLBD8ObVHrrumG2IuNpS2FoTcP2V8+6zluqL3gdsttE5vIQ8/3hDht1/IVoTIWvI
	tmMj9G3ji3jGewiMPGJSXMCNuYhmambKkN7FXy45CsTyoNNuDBlEdK9V1MEot7y1M2pWL
X-Gm-Gg: ASbGncvm/InkSeti8kZ7xIz5SyNyH7ditgpb63FiMh+rquSHscCo6nGqteRxCG6Lv4w
	yn0xfGIMz1faERfV51jhGaPg7UnTb9FucbS/StaeqWMTe22iPq11KZzHLXglyFD8CfMzGkkylxJ
	19QqsDhQJk22e7MWC1ano8Nj7rtIXMTvis72eJm3zyji2J8RSW1G2tjZpdc+e58lagNXO8692xh
	r8TRvTUh9Rp5qhMHRYj2AFIKBUcSaS3CkvxrJOKuRiXn+ZBzLPZfy6C554AsqzjeeqPTpq2+DjX
	1DxdpwhGaROyXsPhzyQ7IdqWxnaQgOKpaZ1WSJJwiTPb8HCU31Q7AHvc+U9+QCymvIILEZ/jN+n
	mDiN1Ym8gj0YsKOOJrvE8TpitFtGMHbp5stVdRLk1PsufxMlQx9L7Bg==
X-Received: by 2002:a17:90b:4b09:b0:32e:e3af:45f6 with SMTP id 98e67ed59e1d1-3403a265529mr2007786a91.10.1761716675793;
        Tue, 28 Oct 2025 22:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh8rloteq7WeuPBaOFrjDmh+ZqqPoQGP+YRbt29wqi8injOzt+ncXOlRtdj7cS1pR/EjlmQw==
X-Received: by 2002:a17:90b:4b09:b0:32e:e3af:45f6 with SMTP id 98e67ed59e1d1-3403a265529mr2007753a91.10.1761716675284;
        Tue, 28 Oct 2025 22:44:35 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7d1fdesm14280643a91.5.2025.10.28.22.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 22:44:34 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 22:44:10 -0700
Subject: [PATCH v4 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-add-support-for-camss-on-kaanapali-v4-1-7eb484c89585@oss.qualcomm.com>
References: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
In-Reply-To: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: t7NFDo3KqFT-Ole-B4NLrOOAbtskKFe_
X-Proofpoint-GUID: t7NFDo3KqFT-Ole-B4NLrOOAbtskKFe_
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=6901a9c4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=j9zjN4cs5acD8dv8RPMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0MSBTYWx0ZWRfX5H4hoNtADjrK
 ndYXYu6zlogPSBfSXoKeBp8e1xwiuEea5LamRCKPNiGV1NJdamsi7gvFdpyw0yS51UKBeuU/+j9
 kLW2IkqG8SZ0P3jzGt7tYNGaM8coxFAppwnI4j4Xx8NYAu6/jZbtO0g5IssAKVkPj4+muh+Esvr
 IhmcAdM6OzLqrHCGgF6ZHuqRSC8TPQc+bjaqCGzsXKWUHkjTGegdICq8r4P3/NnWaqh3rQEdnYP
 qXbo4FtEeWP3eDgFb9kjFtZaLEigyyS7QMvuVmJQKQk4qEsgrimrzjVYum2MSOaXIJS1GSUTbqx
 165aaH0TxuS0XdkRzBWiEagndabs555zWAniLKj0Vtik52QXhrNp5s2xoTDvn0cv4FqhPDv6rjZ
 gJ4wsZm2TfDJfLAxv7giKzkO0Ct6pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290041

Add Kaanapali compatible consistent with CAMSS CCI interfaces.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..9b83ec63e124 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
@@ -128,6 +129,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
     then:
       properties:

-- 
2.34.1


