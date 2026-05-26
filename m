Return-Path: <linux-arm-msm+bounces-109758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHn6CSRmFWqCUwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:21:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7915E5D32F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F78E304DEAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B0F3D3D0C;
	Tue, 26 May 2026 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5y/eyU1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ElPtuw0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8D63D412C
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786630; cv=none; b=kL45iSgJCKOKG4d8soG6VkYO/ZMGvkdMRGqa1zN1UCEsdgRcQ+TsEFiYmrYjvtIMJHVDttvvDCu1v13GCuZl2JnvEVwp9DfRqcCpxnlg7hCKM+69RtYcL8ILov8Ty8imQa/K+AZbqV9Lv+QHOntWXJyT59M1IdALA4ZFOfaOpao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786630; c=relaxed/simple;
	bh=uHxDfHp9+PexPpMOxr77xWIABoPMGfsxROU7WJAR3v8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aFNnGtEm4a3X+NnO8M80DbMt/X9JkUWiPDGO+rKQd8APHzDtIr+z5M5ulV3x5wmPzQ2hsy0+p3R6IWwAE8Hxy0+9J7EMmjUtoiaG2On19yEVkKCyKQWmweLQF3bbg2YXW7pUFhgfPykZQMiFEBnidAg8IG0Bj4JMQhmXuiWWNaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5y/eyU1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ElPtuw0q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6YhmG2145969
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T/2aewGB4Kp
	n1y8yQDIKkfGvFMIVNTd7+akHCzOQCLI=; b=Z5y/eyU1uBBwdHYbUe5m2j+i7jO
	K0dQFeC27fVxhamLDGwZaRMGFkSP7UKLMa/Agh7JgS8Pg39WllR+ns4CSj+nZIOH
	cCE/BNOiUSp9hMAJ4GjbPzaaySvURhl4aLXFWXaUwlaZHdiqschMqEHcaDBN4FSt
	T6wNQOrd8X37iVpp2Z8B4jdW9mkadVNgGd1j/UrBHPupHJpxOhbcDZWl/vAjnjCv
	zqsOM84QKZlva8N3x9vfFw4eOUpzs41bwKNsn+j2IGEpGmQyul1qCGNu4KXRvkII
	lBvm9JVFlvvGO7gD9kwzuxVm2hIpD43E1pf23zbFbfg5rD58z5SmwUmL/Tw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv3w33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:10:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2be9e0905a9so65978535ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 02:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779786627; x=1780391427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/2aewGB4Kpn1y8yQDIKkfGvFMIVNTd7+akHCzOQCLI=;
        b=ElPtuw0qBd/B8TKZkrF0IebpG7FJOdg27wJi4fzbgYYv9cARN63kf/exBYskrbOrKr
         x7w1oPS9tmqmi7+v7YbQAcoe5jdPGXwmTCfyB5GpQkuywGOMlL988lT3MsY5plhDLzRE
         fPdgmL+ndTCYH0YbRd6r5uH6wwCygoX8N5Xx6b2i4BAEwe6Bsp6iLxUrVVSOuHyWy7WY
         EDZM06BtsQpKIcHB+b/vc9h+aJ4856qqOKjZkIghRCnbk865gsEOboVR2jKQrLTNoxeJ
         n5VeB1qR9nRmXvkURiKCKSbnDW+EsgLO9/YhDlUzW8zYkTCyjXiA4SH71qZEb7RqaGlF
         FzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779786627; x=1780391427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/2aewGB4Kpn1y8yQDIKkfGvFMIVNTd7+akHCzOQCLI=;
        b=OONz+r0ivEdhsGLaHMzKkqWZI6xWiwEJ+C1aEHQ1SR0/KY004/DXZ69H5v+75s2Dcj
         VnCvzQc0a7Neob9T0AKBhMJ/6eE4Yb8WAzLnEvIANJQcscFqz1tvCtCzttrrEEW3Eos4
         PpF+Bbq8iSdwNRNgS/UvgP8+xcYtwKQXz3T3f5uXcc9x1bN5PPMcT+OfvAcTS+iAxgDi
         eOgdNhlOthM+6cugJsz7nmrg08f8DT5LXQ0Dl7vf9eJi2ROT2L2IJy+fZaISlIRR2bBK
         gGnAAWY2xZ+Cjock57Q9UTF0gaglY9KzgeY2M7rs+Xc0FyG2ntEehN9CHrHl+3DmvlEZ
         zjdw==
X-Gm-Message-State: AOJu0YzfNMWaqvinGQkfbQMFTace8nhXTO4Z0yC64uSNM3U/OAjqwRku
	cNLu0gkAe2F5R0RGH6ekRbAx7N85F5KICDvp+LGA87S40hxfc8blDLUHL3aD+TQ4O8vN/UgKW2C
	J0yg+mSfFZpSbTwZGSIp1S76V1H1360uk6a0yxsnFjEBx5rRbNpgGXT8RY7dW2wQlNM2Z
X-Gm-Gg: Acq92OGx/fo9B7AYBXxJlm0E/fhejRRGPUqgMdlUywN3xwjZhkRzW/24Qfvbes1D7+O
	wUV8uH8YsBW2JwHnVHEmKTKPs1U8vyx6XCmAC+pfcnplL/w7PkkF0dyLkHGCznXtNAwQViHAfY5
	hWzo7hrveif15d5FINebpCO/M5HEtoVsRrInpOyEa/4HZmwg6buVAIOMn5NCOz1ZKnRIs+MXLiE
	UHeCYBXWEtzxeNtlauFlRVAumnOLIinYP2Jv3ObksjS8SOJzCMtIdXagrE8+CXhV4ZAtcR3PWZy
	ASuCdF1m61IoI5KftHKX/EGzg+AGAHDJpINTOiw87B9wu0JUaU63CRsvCJ6nBHiiJD+1kMXGpyi
	5R/c5Wh59Aw7swVqgYlmiwmcE60GvbXbbDlXnbZHxNOi2viPBkrft2A==
X-Received: by 2002:a17:902:f543:b0:2be:1c3c:72bb with SMTP id d9443c01a7336-2beb069d332mr184560785ad.33.1779786627370;
        Tue, 26 May 2026 02:10:27 -0700 (PDT)
X-Received: by 2002:a17:902:f543:b0:2be:1c3c:72bb with SMTP id d9443c01a7336-2beb069d332mr184560405ad.33.1779786626890;
        Tue, 26 May 2026 02:10:26 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695a40sm109237915ad.17.2026.05.26.02.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:10:26 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v3 2/3] scsi: ufs: qcom: dt-bindings: Document the Hawi UFS controller
Date: Tue, 26 May 2026 14:39:55 +0530
Message-Id: <20260526090956.2340262-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3OSBTYWx0ZWRfX6/Z7+6GG8t+X
 U7Pv8G/HrKkwZvxtI1azcxsJDwMfIPv946E2rrrU49W8pFHkH+YvbXyMsAvT80qbqxCWYFSQbGU
 /M6cKIoS8MCIspOx6J7+k4U5QtWBfM2kSL7/PBsq+NiOZkjLA1tfWrvNDidk78cV5ypJOCYJ1n5
 2Lt0LUu82Q+6azdOeYBOJwZToggdKFDMXTZboY9sZ/obcFH+ZWpoD7d2OOAvXv8UL3dAYityuW4
 IkG6fFvPBSMqieZimtIYBdnfoHlzOtJvgT6xR6z4UO63pU6yquWcDDuVrgkbdn+bVYJgwULeTEq
 ubayQlWaK1MMbCK2TQCw8sfpL9BMlM2q8r7KW9lb6FZ8/4chVtKXdzv01s3DmvbJwul5tCJU2qt
 kswPBDU/rEOPOy4lbPF5GDjHrJGyiimrgHVUqQVP5MPI4qyNXITAQjKx/eN3T9zF0F+J2AqnXk3
 FBZHjyOBHKp2GhI0yfA==
X-Proofpoint-GUID: esaEmz6vDaBlp49-5xHz6vTxsWJ3Gxfx
X-Proofpoint-ORIG-GUID: esaEmz6vDaBlp49-5xHz6vTxsWJ3Gxfx
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a156384 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dkR0I6OD3irOzcp_LXMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260079
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109758-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7915E5D32F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document the UFS Controller on the Hawi Platform.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f28641c6e68f..3de00affa4c6 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
@@ -27,6 +28,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
-- 
2.34.1


