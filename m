Return-Path: <linux-arm-msm+bounces-107028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOu2OPinAmpSvQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:09:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B55197C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07167303F2AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 04:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BC738332A;
	Tue, 12 May 2026 04:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HloNPhUT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AM4hHL1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E202D7814
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778558921; cv=none; b=a/GBkF0xkwiGYRLmu8x34Ni0fdkFQsZ30tHFXctFwnOc4LRaHl2TQ+nPsm+xrQnjZYmDs9pwZoDB+uA4hSDZ3+CFp4kN7tELWML+jbDkgLDCb7jCtww88pBo/eyv7AJ/pqp2kDUTDUzwbLf8OEdTGy1yVT0vJfvQl4l3aUHjaQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778558921; c=relaxed/simple;
	bh=15Injmg8rK8ASVqp1eiycQ+rgVM/qUCUjHV9ZKRmK1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9RkG1z/o7qbfRFhFUIRVJvfc8VsOLDpJS8NkgSSB8aO1sflowIY1nMiRBSjlHpYpe/Ysl2Tt4S7hbYdNgI0unpbzEoIbkJzoDaHnUc1ZYQNmp71L1Ob5sYSrbjZKkU2V+RbRT9U7Tdy2RxlD8cpDY45yD1TBYl/j3F/BX/Az/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HloNPhUT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AM4hHL1m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6XdM2994934
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X6gGgEnllp4zvZoYkPCyMOmUb+keOCb7VayvIxiJ+aM=; b=HloNPhUTK7PWr1y/
	WH7OOakh2tbuJkbI4BWePgq2axLROMe+W25sJLDUNBT1zYC7oCuoFHFLZ508hJbt
	niFJMCAdwZ10iANUBUzVyxbESEZ4lkvhdushTUaTXEo//MOx/bBRJqoapVE1wsyV
	2JszTufhgmHXatEVvJjpR/PmHdptOcRIPhXtXuDh1/noZCoiNYxObWD3QZuroHHx
	9tA4un2uufdDQdI9/2CzwY6IlHRwvXZ83xoocdS9UhIqV3BbmBAiALKlfWvqhN0q
	NmfuaSNpWY0Gwve7DkV04lQpQMzNcrmmWui/MhrFVB3jHRmIb/M9xwmMKzzaFgI/
	M1GQ7A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0sdgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:08:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba838d3fa4so55375885ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 21:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778558918; x=1779163718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6gGgEnllp4zvZoYkPCyMOmUb+keOCb7VayvIxiJ+aM=;
        b=AM4hHL1mLNy13Evndd7piMk3kUsfE6kPENclVP+UxeU+9sHfYIHS5lpP9dvWx29EI2
         fJMvMc0D+ZiSjzLRKem8TjMaWcHLgZUJskr8ywzuwwoE06A0qUTgvJX1sJyZOqXtgCCh
         tC0UO2xPH8dzcL95aVIx2o9bd4YFq21hYNgtL8IS3sSaAU3jreiLbu/hWT08nqj+q0Ls
         rFxLukSLxi+hHWyQ9G3G2r+Mp1mqkvfi1pUi94iK7e65lUG8HBJ8ir8igLofRRi0cnBU
         6eJqcJ+4GFOsMegmOMN9C1OHJfUNj52fLJLvkWc0HTMyimiF/YTHskTaNHQU1ymLXcnk
         qKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778558918; x=1779163718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X6gGgEnllp4zvZoYkPCyMOmUb+keOCb7VayvIxiJ+aM=;
        b=U5C07UBPUkpnIVJiNa92hBDhyg7IBCqvTLTqJ+fcaOLkLETTWGZNUn8RxW2XRJfihI
         gyzn04v8f0byHYjpL9CiKvgS1WP3BIWTjZTx6QVr+pK8L3iJ/4+7a+3hKE7/lBjoX6i8
         MXArPpRlOLSzRR1h8UB1ssf8ktOYzHy7Xwl0PBP88Ziw6t8DyV82s4AazHYsttffYCvF
         H2vCxuTIQgjpP3kEoCy2V+LoYbGfSLIiMXekGnsY2/+PYqVclD6m+osnFhEzZit7ztQN
         S5bFF6/AOvTOjXPcGp+Ej9MvQNZpBh9m9c5/CgNXMeQfE9OXT3VxUBtIauk3wP65f339
         IZvw==
X-Gm-Message-State: AOJu0Yym4ripNJCc+mroi+sQ+RQ46GVjZtuXdxQU65Ok1nXwRxlnxHrl
	J43icHiTJ7toO4S6Wt1+Yu3w0396SJ3vPAAxbTPDVl5mIBG6VUcOO6ElACOISwlUoU9Eg0H2+B0
	SSnTF8wvIcX1AaCw1NaUzeN0pZan9WrKP52t6QbMRBohYAnHmb02Asr42pu1YglZF0axC
X-Gm-Gg: Acq92OHWfTlF9Sv2xNARH+oVnoYQgK+mGtb70n8cQqFkKhWGcdB/4cdj+679Uui0TLq
	DtWg4+h8+79fhWet8TyRwLqbV39dF7iuzeX72rDlcEMTCylcabNcfNV6zSz1MCBn+2sqeR/JXZQ
	fPRysPP6gnUAuh32hWWxYRCkaff79As3uoIvOcW9TNHehbV5pa/OsNuTPQ51m8UynE/SBmbmfDA
	XasjatZuenzFQ9AR4u3l2J2HO+8xuFIYmMJh/OpoySzyPdR4xKRegRn/+S3DSfq/8+Fnz7yjgaT
	kyRsrRrZCerE/7E7X+PlEju/OY/N1WoN6A4Z1VvDhIF4UI8ds/eWO2mgcckO4Kt5/AWn7gWgwux
	Mmy1+m32U6vvQWqPv7oJpDxYT14Ne0avkXqkW
X-Received: by 2002:a17:903:1c8:b0:2b4:65d8:6a20 with SMTP id d9443c01a7336-2ba78f50177mr287506385ad.2.1778558918384;
        Mon, 11 May 2026 21:08:38 -0700 (PDT)
X-Received: by 2002:a17:903:1c8:b0:2b4:65d8:6a20 with SMTP id d9443c01a7336-2ba78f50177mr287506055ad.2.1778558917826;
        Mon, 11 May 2026 21:08:37 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm122646725ad.28.2026.05.11.21.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:08:37 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 12 May 2026 09:38:04 +0530
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-shikra-dt-v1-1-716438330dd0@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778558905; l=1405;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=15Injmg8rK8ASVqp1eiycQ+rgVM/qUCUjHV9ZKRmK1w=;
 b=qsd+1ESlEP8UXvDEem+D9Z3wOKU5SlGZVippPIxIqbom5EjN/hps0owmuD6qyom/WZlyQsIrd
 rFDT+XPk5CtCmIIk3GlfKNMXLOIf4AwITOLAjL+jl3JRr8Ro0Q6zjxn
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a02a7c7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=s3D7Wza4eiaRwqfIe7sA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: srpGL5kmkJA-KEHLWMj9sRcd0-3Gyuv1
X-Proofpoint-ORIG-GUID: srpGL5kmkJA-KEHLWMj9sRcd0-3Gyuv1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzNSBTYWx0ZWRfXx4lQqGpObM5r
 ORz7pg4q5rqRNw7nMXwtC+hBBGrkon+IG2j0tUUp8UcAuCZMtCpOpdsJwqqjgdbHmE7drShoewG
 25cP18si4YZepEJ9Xi5a6iSggr4fl3ZRm51tWvMzeQ5W77GzBxyRhb3MWhNLQYMDuGMMYVIGy08
 BlGkalKUGtVXUUQYrgkHDd18d1iw+LMiRFOo7OTWnnNfhw9lt0AUAA8UlOnm+xc19pnUEdmZzDt
 Q4ecOFOjt9y0MXfbQ8lJyWFoVX7d7bxUrvbnxGlcu9HKTymcIL3JbOLfW00vGPBYVEQw5BhQyC+
 F3kCJ6d/JpGarS9kD64jDCLkMHR7Z2UtV7EvL3u+38i+Hd6QGMzi4kHADi+dT9bpcJsNtDL4/5g
 sKy8mfLrCXG+LlYp6EeQklKw9Ic0HENeFU0CZwlk1lxgVBKErUa2cAG30vUO3S9xkeSlsBHlMpC
 3vwwi+usjUJFt7DerMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120035
X-Rspamd-Queue-Id: 866B55197C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107028-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

One SoM variant is introduced:
  - CQM: retail variant with integrated modem (PM4125 PMIC)

Two EVK boards are supported:
  - shikra-cqm-evk: pairs with the CQM SoM
  - shikra-cqs-evk: pairs with the CQM SoM, with no modem support

Each EVK provides debug UART, USB, and other peripheral interfaces.

Add compatible strings for the CQM SoM variant and its two
corresponding EVK boards.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 2741c07e9f41..f041d71d7957 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -963,6 +963,13 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - google,blueline

-- 
2.34.1


