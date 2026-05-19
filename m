Return-Path: <linux-arm-msm+bounces-108601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDaxISnCDGqJlgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 22:03:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EC5584701
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 22:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B5B93050276
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 20:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92483AD50E;
	Tue, 19 May 2026 20:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEPBzrTs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVq7gDb/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F284B3B9601
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779221031; cv=none; b=tZ0iePHVadk9uUXWh9SsHvLJvpNoXRwqc5L6Hs0EzhLOvzHPQHDwxPOtFYwRMfCTx6Mf/vMMTTjUhcm+qf2ad2sfw4wX9a31sOwykbvDi8Qi+RD3UKZrN6Y1fJaxxoYYuCRZnbweegAVgC68hYvCInXJslXPPgShOEWGI0dcSgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779221031; c=relaxed/simple;
	bh=/w7XGxfhaDe7QdBC9q3KobdbqwqXL4pZ1Apbhmx6eUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jv5xo0m7NQIlfF7RU0wQcagDy5w0vGGCdUB6LGO1a+lGsAaJ4ewyV8a8Mn8Qg4598i2lKU8OugECm2lrJ2mWQ1rVYTFAH7ZA8rY1+mV2eplHYo8tdfvlt2S33DRN5jZ6Z1R69AT7CjSDs0k2LdhRmosF7K/oNfYesPNCn9x8yd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEPBzrTs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVq7gDb/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExIcJ2064625
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 20:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zv/6eViwK5rxMf4H+Q6UCmCmXc+mrouaTyBpgAVHcUQ=; b=AEPBzrTsi/LbH95F
	Jhxw8OflgsXakY9ZHVVuo8ZfI4FCZOxS+7jIEdhKcNwGwC03VxdLgopM6ut1qxMr
	6O3Ji08XBSk5aoITqDl8uCP9TsSvU5OekYb570Gk210kfVuezqu7C/nQFbF/c7R5
	FJTSjs9PypdjmcM+FFpNWdHPakrudsMskXM7t5tngAhYHHHI2JSidendTIhAylQw
	J9ZZxVn/g0wXodPgqSOtGG4i8a15I2TJTXTY+Bh/jOrVcutN/JPBacGqzeAyZVxQ
	DBjtZNREW0ZLfH6yH2wE+rQq9DmMbQR6Dvf7YgGqw+axSsCqtWjxfP0SgZx5HJwU
	g68KXA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t19n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 20:03:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95fe2422f62so1449531241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779221027; x=1779825827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv/6eViwK5rxMf4H+Q6UCmCmXc+mrouaTyBpgAVHcUQ=;
        b=cVq7gDb/8CfU/n8b6Xz4gvs/3KKPzFQaVfUNvWeZz/RYdvPy32shX5Ng+/ktiUhzoW
         gBOrNDFQhOLQrCJKtNpCN/3idN7voVeltvaZao5a7L+6lkLoLWBGeo2TG5LmGF5yNYcm
         bUypn73ZJQfJUl2XOt0ZKLn6FRfnEidXDQl5G5WfRoQeTtdhJL0B46rISuwxhkqtfFbE
         aOcD8FdFe1GFmcQOY3vgqW/rT+7WcUIVdERhcWI/Q9xNJsr4uRd48NE8z/J+XE597XAn
         DeWX3pUAdEXfnACk94NSiyxjXxJOcV8WKt01TAoltyCYL9mQ6GlHXZdNbWZvt1WYS2M7
         JwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779221027; x=1779825827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zv/6eViwK5rxMf4H+Q6UCmCmXc+mrouaTyBpgAVHcUQ=;
        b=PdtgylKjw9giHZQaiZ274aUSLgGA+XRR4GLtSl1wPuzQI0Ab9i66YuzRjELsuDRzay
         +rKty/lBy1jls1LKl77H4uVaDaGCkhUes+DShPHBTjOchekWM4zYw/Qle3ARRFOOnPtI
         RFtoM/ZkepuY1C674zFxdJLfL3jLsF3oR5FfpdtKfIdQ4gN97jDU5X1qrgzS22/FqXWW
         wLfaPyK8I6fLx3NUPO3pWwpY2zwybrzg6jTmxqE6dX3d3wWSFQUtG5OyNsURBrbtbe8w
         lx2tIKrp4M2w+4f0jQgUEP6MRgL7mPnmeAz9KWMjlzE6oFdGVXrouC8E5xo4GpRHhgJI
         knsA==
X-Gm-Message-State: AOJu0Yz4zMIc06bw9leo+Y9BRf4c9uoqCtwYiRJwUnb+oZxprnCwhL+f
	0wDICVC97oEmXiooUFQh+/UPuYv1+FsvguCopE47nSKni8zL2PDcIe8jA1EPEmFhkQ7+L7/RxdX
	Ah+S7x6n+obA1e/s/Ml/p3DlPmrpm4YQnu8LwGN8TxdykFqhhIQsmIKQ7Drh6Zogz8yoGcBEWz/
	Ij
X-Gm-Gg: Acq92OG79aJk09pKcOUz2/lUcPS0lTOTNlAPByKOPsrfwicBKe/vmn2RRDc4kbVewmj
	wE2rs4DTRIGz5vAe8f6OJAqx5KwHGgLpxdvnnyjPjoeurPlJAbAihdqHq35b/8TvuQcJugeghZl
	fFsxXKGKagva3c0BgWp9nlNzCUAhe3R2LTa1lOKazlgO2FwtdhfqNtR/dLVD6nuxZNIfsFLm4+I
	O/Csa6zYkXZXpIDwlP9AuoMB08W/WjlMNxSSQc6bQqzSbWZJ/Sx/Fe15BQl+Mx/v9Nfa1mFpCmU
	01ZZnJIedaSZ/oevPWe7YUqXvpEVeWiVsLbp19LQiiX1RFMhhP/YQU3AVgUDAMR3KDhfU1fC8gO
	wQWqtglzP1SM0zXGbnMt75/57/q4feR/nxct0G9DZgFJHJFIamfO03H8=
X-Received: by 2002:a05:6102:8659:20b0:660:d26b:506b with SMTP id ada2fe7eead31-660d26b7500mr2859352137.5.1779221027328;
        Tue, 19 May 2026 13:03:47 -0700 (PDT)
X-Received: by 2002:a05:6102:8659:20b0:660:d26b:506b with SMTP id ada2fe7eead31-660d26b7500mr2859299137.5.1779221026609;
        Tue, 19 May 2026 13:03:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe794e7sm112085175e9.30.2026.05.19.13.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:03:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 19 May 2026 22:03:18 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcoms-c: Include Eliza, Kaanapali
 and others in SoC names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-dt-bindings-qcom-soc-naming-v1-1-005d29d261ae@oss.qualcomm.com>
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
In-Reply-To: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/w7XGxfhaDe7QdBC9q3KobdbqwqXL4pZ1Apbhmx6eUU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDMIa1Ztfuwc3MfEcKPxWoX5x67z6cz2XJUQzm
 H61yWM+/VmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagzCGgAKCRDBN2bmhouD
 17E4D/4jtPFRmEpgnP2wSJBR+MQoqImQalD8zkBV+w87ilCBSzmVNqI1nqZVlXvdE2PZpTJCAkE
 NmwGpZcJiF1s9s08YfGOqAqwF+QflitA5zbmRl0watGkUyfDapsnk5p3xFHS47mDcqQCv+8pY5T
 EXtvd8hv+sw8+E8sniUwPWBvqCc0Tuc5pWjomRaZW06iaWa3qDUZhnCZatGhsvCEwXw6FNdvkyh
 vqym6UYAaVGYzpaKg19M1biZSjjBunzFePSujKrjPHNO640f391h0KHpnNKJeXe9OkQj7xN44JI
 7Q3LGSu9miBpoYwlLD5Kxny0GeT4Oyx4M0RzUv3XFsau0H0/IsG91/Ap0vi8B07WEs0XqModdpG
 5BUhuACmJLIhUGSgsSW/w+AoUUrz7baRfhDOXPFZNp33IeqG8sho2Snlw90ra6dB0jZFXIESqCz
 CTGQZxgfqjaIejKwJlwbUFj91R8q9gGUNSWgmX4FRwTGmBeb0NXjo2+G4LhCxq7ji4OL0IBzaLX
 RL9zriaYSyVmUEmjrbrqsd9NlD3nF4gzaq0qRMP7lEOojSYLw20p9PfXjcet+zpJFBhcv7e5mz4
 3BRbk3u/VtscQRRWkwEFl35VlzEbTfV+h/xc0ysrM/oXttQfY+Kd4DdJACpD8p0/PcDnv8gl3pV
 NP/UQTuTaMCLHzg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: IC6cDq_uauznpeJ9Q77tdMzyKfkW4aW_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIwMCBTYWx0ZWRfXxP03JjzjlnZB
 8NnxEkS4i0MX39liGKjMScvGD83ZPIms6zeY+J/NRNwulYB+dfW+rGpHFT+g1ImWO0XYXxOAUvx
 8A4rOhq+NBYpVwDZGAiuIhrEtYcvo49DiuZ2Kt3Uj1K3v8vt0HCyoGtH1SuYTS2QC0QczkyZf4d
 PdoA4gCnj6p2h0q4fqFkwxTfdKQPu6sr6BRY2wsW4P/ilK2lPBtOGnUGIq7MvW0TvxwGnpn5C70
 TE/Gxya9YN/jdUmXgi9iyYPU18C+gzyodeypNGKTjeO2vDip5YUQ7LonzDGtB3xH1BxWcaY38Sc
 rZYA/lVhn5MPx+jrdn12zIVO1W6rjqOFq9SE9hWYD7qvrOhgNzpsgjhEgi0bqpq94OKhWWBdulS
 YSW0d9Mgq+616Zynqv1qojQOLgnQp9o3v4n54YnO+44QZyxt4ta6Mx/Q78YvPttKmdI78vwCh+c
 TYb3VVT8MUUL4Fed0ig==
X-Proofpoint-ORIG-GUID: IC6cDq_uauznpeJ9Q77tdMzyKfkW4aW_
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0cc223 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=872ObbKbCC1Zr02HKR4A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190200
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108601-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22EC5584701
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Grow the schema checking for proper SoC compatible naming style with
recently upstreamed new Qualcomm SoCs: Eliza, Kaanapali, Hawi, Mahua and
Shikra.

Since switching from model numbers to codenames, this list with explicit
codenames will have to grow and list them all in order for the schema to
work.  It feels like a churn, but the compatible naming is still mess,
for example, the schema pci/qcom,pcie-x1e80100.yaml with a legacy naming
vendor,IP-SoC (qcom,pcie-x1e80100) received a new compatible with new
style (qcom,glymur-pcie).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 27261039d56f..b5f3a750cce8 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -25,7 +25,7 @@ select:
     compatible:
       oneOf:
         - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(glymur|milos).*$"
+        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|milos|shikra).*$"
   required:
     - compatible
 
@@ -36,7 +36,7 @@ properties:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
       - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(glymur|milos)-.*$"
+      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|milos|shikra)-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:

-- 
2.51.0


