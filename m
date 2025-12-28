Return-Path: <linux-arm-msm+bounces-86734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3071BCE5300
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 18:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D3D6300A1F2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 17:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9268B21765B;
	Sun, 28 Dec 2025 17:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0nC6p9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpeIXAmH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68E91474CC
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766941289; cv=none; b=TM8R6BzGn5CWd6CNA3YZV+4PzwlAxWC+asWRgVLUWTCGkhzWdY/4foJEbQhnwZUptRUxxlPrsXkUMRvEI3iG+vSlWmJHi9492hxXg8tsvbNySBG26h5L7PI32Y3wchyONE/MTrUmHvufGqVIH4qGOm5ETYTS5069mp3kVlWOKEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766941289; c=relaxed/simple;
	bh=9i4SXdeQUf4xFNTVF27hrzTgaGj3TYdVJNxV8w9WdaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E97Mqzl+oHX8L9M6R6rHYRPHVJW/R316Md1PwTA7TNnUNLs7DsImrWXKXM82OTBM6J9HEt1LLnuNkXKjrYze/71p2NSmLNc4CMxAaSNRMQf2jUjneEJbuJFpc7NqAtkeXYmanFZzwvCulL5wy/G9hcI3kmr3pUDLomdunNTfC3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0nC6p9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpeIXAmH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSEkBhi2773520
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZpyQfB1E1Ukc3hXRUc/eOcDPD8SLuR+sl0Pk0A8isQ=; b=c0nC6p9/89mbHDZv
	so7k73BopelUm01zMiekFzYnLb+tpi7rno8JwjQPAvhrCdqw4OTt+9QTUqLEQaI9
	Y9MGlxVwH2CkErjSiBAjws75QlRhIEUlVX3KmpCKB0H9tJMdimR27OW0RErQQmjj
	e2PONEIEWbHL1bXFB/K+7Ks6d34KsnNThIh+n48/Gqn3SDFHM5rqY3pygtp6l2Ub
	83gK8LjW1pmaIAoKcWClMlYYRtWVKYB0mO9cWmm74xRZXQZcidXUHY4EfQlCnCCv
	IPeiORLYUB9HoiGnu/iwaItph2XQ/JhMRMrtaIKfBZ2/irExCU/FfWMQ3WvFcOIo
	F+Ahlg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg2gg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:01:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ae3e3e0d06so7352702b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 09:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766941286; x=1767546086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZpyQfB1E1Ukc3hXRUc/eOcDPD8SLuR+sl0Pk0A8isQ=;
        b=gpeIXAmHwOYsa2dUQUHHbtJxvB3n8xbrMpU0xQXDGddfL6YN9yJptKMjMj2mczg6Iz
         ipTjVcQeby2Yyof19Gmnti52Ay2r8IkRM0xqZqKsZ6khm8JyMdFiJc0zCDr1rZbZ3gJz
         R7QTdwmTQofjja6Nx+sNpj8w0buH+wKTkEZ7Cs1X7XJlievMLn5XCwCcguamja8heIsV
         gkk0Dm4fB6D5XLh10NdV/YyXW27JNIPJIp9qKRShBXgMM8MSY9rkfTtKDnisX8H0hoY8
         unwqCsQQThCTc5gnSFj+PUSei7nPy/Wrd9T13sML6qn7xrmisaSbDDBlEbHCX5KINJdk
         SSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766941286; x=1767546086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JZpyQfB1E1Ukc3hXRUc/eOcDPD8SLuR+sl0Pk0A8isQ=;
        b=XJrXewOGE0HIsRdfXST7jArXce6zR10aW+4XPBLguNqXAjJdpFPfVMK0wKF3rGyP8b
         G8LEXSz6SBlPFyA5bbCnSJXKnG6uUDZfE5hWzPKxB01eLmjRXXJM4F60MmyUOS26sL7P
         WM1Mu3MRmMkOyj1M7U6qt436NJq8FMKymSl5tyBHN74JPovbj2NV82d/AF1SMhJxZchz
         KZdNYCKnf8juk0U5B56++jLIZCr00L07RhplalkpdM5p0x9Y9p1dGiku6mzBb9DomaCe
         wS0HI2Sn4uQXEojHP4kM43DW3qyDqPyaJjc5XLPOmNUzYwpmdk33fM6pgiqTqzid9x/l
         qzwg==
X-Forwarded-Encrypted: i=1; AJvYcCWjh1F+hSyXAa3fr+whyBFhYUMzwT60OgmdWQbidAEbFE/pp7i6vbdb7qc7igXHzqX4UHbuIWMJxZcFlLoH@vger.kernel.org
X-Gm-Message-State: AOJu0YxDdYI/9Gw/gaun5BTcoCDK3xnNld3ghl30l0g0qyGUqGAXrFzR
	7JvnqbREodPbulUV6x2VuOLlYD1vE3Smh9FL02r9+wlDJyQcXCE2gT9ffLhvdP84EvKdmMBLCOc
	1R9ZsIOXxp58VzrpM7m3Kpk+yTsAiQxKU6ZWyKfHE+j0+1m0zn82iFYU951wMl9Da2S+8
X-Gm-Gg: AY/fxX4zBTC8/3qpO20QzbIgculeHmK12QN/a+Zt5QPogIxprRbEaERfRm1r35hBXRI
	gisZyeQ5qeIp7d8+CmxqNtcJ4hkhcdBBANDZbOUcCLYKvZMESnx9o7duqGdi1yLrZSErWhFvrhq
	SS8xDOGIvV6RfOH8kCij52cnHEODWXXov4rzrB1PPPhZEAn/QyOlPGLVCeeFuJrzrVmh9S3bXFk
	acoHV2soJ4V2f/ECagmRNYx5fsWqPAwjc3DbDjjmc8460WJtiNy5azR0HFS7vv/Q19Pp2NzmWcw
	cPUrtyyd5Li5rIhSPGOTNTOjQ78H+PscnopKVfSO31dsA7ZAHXXtDdLLXfHgx++B7b86iiJhoPA
	Zf8npLJMO0jHWLfscwTgTGSmm5FvdLMAK3Jc=
X-Received: by 2002:a05:6a00:bb91:b0:7e8:4471:8cc with SMTP id d2e1a72fcca58-7ff6627a17amr22970412b3a.45.1766941285768;
        Sun, 28 Dec 2025 09:01:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZUYc54+DSVmtXju8k95ao1j7mt83mLRLWHzwEdBnXV7DhGydmdA6cyFtoWUntJIH5KyAmzQ==
X-Received: by 2002:a05:6a00:bb91:b0:7e8:4471:8cc with SMTP id d2e1a72fcca58-7ff6627a17amr22970369b3a.45.1766941285236;
        Sun, 28 Dec 2025 09:01:25 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:90aa:5191:e297:e185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7ae354easm27053925b3a.16.2025.12.28.09.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:01:24 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:31:01 +0530
Subject: [PATCH v4 1/5] dt-bindings: ata: sata: Document the graph port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-pci-m2-v4-1-5684868b0d5f@oss.qualcomm.com>
References: <20251228-pci-m2-v4-0-5684868b0d5f@oss.qualcomm.com>
In-Reply-To: <20251228-pci-m2-v4-0-5684868b0d5f@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-ide@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=917;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=9i4SXdeQUf4xFNTVF27hrzTgaGj3TYdVJNxV8w9WdaE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpUWJZht5Ilx/39KhJmJ/l+9nK2ZzwY1VV0THRP
 iYObOTK/X+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaVFiWQAKCRBVnxHm/pHO
 9TtcB/9tkgMTGGQzyXMke0QCfYDs+qENGaa3DAwJDeks22k9HtZPl1XaI0l/HFuUzfXs/Wmhk1x
 d6mC/24BTuZyXlblI+IKWg6T7sA3omV2UKjk7rO8KpxojpyxJmELD90aC1R7TRCrvSALUq5WSYA
 wlMVl8QLO1dFDqM4oh/T07J2w1/Zei2Kpx+UO9x6WKiVCTutqDFsGHd9LNQpdRNjraaV8gygp3x
 dPhYHh07oDawWDfq7/O9xfZY7eBZ7Nc+9dSwS0n4HDOBocndEmYr2IFWbsUzv5qYzRlIK8b6APM
 KZ+/s7frTobw20zzNnfhW44M7yHAvLUFsIfkl2Uo+NwzRaCk
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-GUID: vOWWnuCcGxP3CtF95RC9e4tXqZV1WUOj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1NiBTYWx0ZWRfX1u9z7ubb6Qq3
 TbIzNiDZzmvi9b96GGLNVO3YOkcWr1LHzS2MEMMxysohEkUkpNTZTVOLjbxldickkIOyHpGqMiG
 H54waMm1Vs/XiFCvw8I0Ld1IV0lxBpJFCyW0OfBOXgMy/9XgQ88hMkmWEqRKjLePatR9NVH4JF5
 +E/gUP0BcPgnrQaJo7Z618z7yEt8tNVrCqOJ8FXhhdrTtrTIUjouY8yHrkrnfOq3B7zN+B/II6o
 67g6jHekbidtpehJQ2GwdJe1YIKYgeci/MbZvC8YEGy9rmFRopaD9pYToNwdJgem4eXbzqXezky
 zJi8iaxK2+Vgqp1aBK2sTT36U0fwmtvM8yNSxcsF5TXs5VT6iileWwzTerYYKtS+YclY6DnZyER
 9NEANZmuXCD049rjSn08XGu/EXIR+vziOLTwcDTtj8HwIUC8D1gRPKz91dIgx1Ra/6KFOv0LveK
 +osY2FoT4UsJgn66AQQ==
X-Proofpoint-ORIG-GUID: vOWWnuCcGxP3CtF95RC9e4tXqZV1WUOj
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=69516266 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jFVy6iIYKzc95B252P8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280156

An external connector like M.2 could expose the SATA interface to the
plugin cards. So add the graph port to establish link between the SATA Port
and the connector node.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ata/sata-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/sata-common.yaml b/Documentation/devicetree/bindings/ata/sata-common.yaml
index 58c9342b9925..97cd69ebf331 100644
--- a/Documentation/devicetree/bindings/ata/sata-common.yaml
+++ b/Documentation/devicetree/bindings/ata/sata-common.yaml
@@ -54,4 +54,7 @@ $defs:
           each port can have a Port Multiplier attached thus allowing to
           access more than one drive by means of a single SATA port.
 
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+
 ...

-- 
2.48.1


