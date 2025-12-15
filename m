Return-Path: <linux-arm-msm+bounces-85224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD0ECBD71E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11010300E3F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 11:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BFD32FA03;
	Mon, 15 Dec 2025 11:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6c7N53I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MAxu05oI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC42432F77C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797005; cv=none; b=H/FUYqxSqOUl4kIgkGYgKA84hlwBrrE3/xv4Yt4XKrGipr6AP/rhRCDpqlzR2bvb+EUZlTSFkwXA3a2FQqe/LJE/4ZUo74ihJaUQgnNykcOXxzFTzF9OsAY3Y2upeOcmSuYeGyA+NylJ/lsrSmqFL0XZtK15zRk/d15R9bE4pNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797005; c=relaxed/simple;
	bh=ydtpo1HUo+zQHHbhntrdl2ItAFsh0CmlNavyuhDjjN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=as/9CLEZ+rX7zCysh+w2AsLju1teEVAQ/CvRCGpkOg03Oe/Oie8I93SMZ0XsnrUrMAGrPfQ2duNltxLBK4SbwsIrl3uZ3iKA56zIFQRadGaQleTsOn5sFP8AvQ0ditUd40yjodlMljNQWSqJHZJsKlgHLiw9vW7G+Gfiy3gCRk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6c7N53I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MAxu05oI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFANp1D675957
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Lt0oGmd1BTqCj7isKaC752
	4DHcIL6aelvkpkGT0P+tg=; b=I6c7N53IsCtwC45lXNsonzoH2UZ2qmyzKzHvQ8
	2QIsqRvxxcWXa6kMNrncvlOVTdhi0eVeqZVuZw2FePL4RVI7W6/bNsAxnzAAYX33
	Tq52UgkQcYHewNIJr2KcDwixNLLMrcSuL9mwoqw749mb+q59FaxX002JmTsTu7mz
	M8brkxy1/M1r3/PRIYSR2nVEdyxAzlNM14N79FdkAjgoxe5UUNbijQDM4bT2vKfb
	piaNdFYfXF6jTiITlCH22no/HwqI1LN8LHzFcUHtgxkyB3zj3ap3lUxbqLz7vH2V
	uEi5piVH/K0AIYRM1Jth9j/uKw3nSFuE70Q24K6V+9MpkmMw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11cyma1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:10:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a089575ab3so26887145ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 03:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765797001; x=1766401801; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lt0oGmd1BTqCj7isKaC7524DHcIL6aelvkpkGT0P+tg=;
        b=MAxu05oIf7tRFFFtDaZe4ugrIGhsdgY8FMpZGfWhdMXB//kCLi9EusZRixQ1fBu+EM
         Rkp15ZsrmZ6reDRiySbwX9kJh69NENdszK5ZFWFHrLEu0qcxLA9E38PKnqQIUpyR587P
         XT2Fvs9sHq0NwUpLkYh4UatXWyMBeKVQK1956JF++J8WADVFWfab48G8/w3k82qmKnmE
         tCwxi1j5D099aLFLn9yXr+v8WHe0fe71J2WXEJy9JuH3Os3wwD8kfHGIRflr2Ns+qGrn
         aDMjk+8fOtEzQ0yzvXMyfRmXISo5q7IMaEo1IqchYlU59mGeHksyXv0rxACny97Ca9Kj
         AW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765797001; x=1766401801;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt0oGmd1BTqCj7isKaC7524DHcIL6aelvkpkGT0P+tg=;
        b=tWYwem1lVzXS1ZmsKxag4ZhMq1aEPuMU4DshnCY2q+SMVCpj6/4+ugAZ7QBWrtyQTf
         DG+OjlFhQjJLAFzmhCbnQfSQtbkUmIUD4PELqaNdV+4SOoj5ebxxKd63HOATDITswBuU
         4974CGAOhuCSszGmU4bswO5xciKx/spE2YhzWXaQw2AwEn0ktjG8q1quKkLRXkWjqOQq
         tNCUunnUSClck8eTawVyaRIrjR37qPPB7svbG7Fahfs2rteRSAfa5blv83+LwfRNq13X
         0EI+Ipm6MC7od5/+W9g3XzM/gzZDHtLcSEIYUdCvPDatx97Sp3Xy+po2cnDIHIelcwPQ
         +wjA==
X-Gm-Message-State: AOJu0Ywq0OT4/yBZXt7Nsib5BtU0M7Qfpw9iDvOcFVheXu1s8LaBH+Bw
	3ARzrVVupZL8PXaNJWqjY/oxvR2Zztqfto1KIryDPwxlu2L9GF/Uo16faxcIpuRorS8LqtObdPU
	3LBMpOSDxLxlTVJAf+fSzMb8asvwhKKZNJpsR8ZR/Z59i5b/PabpKbh5C6amlW7BhA50S
X-Gm-Gg: AY/fxX4idGdrWM/wBbQGlSMYSuuInei137DsoB8JPs0dO/1aDP2gmnSJLzcDc001xrU
	GzAJijzK1QlR3y9GXoyOERRGFncaxwJpZrokWbAUfE2OhGDQBTrTlwAdUmYDg+58zbFbP8xOdMY
	UbT5Zlw9Nnd1aGhdLWGYSZPFh6khekf4kIrxxaDgmIKtMFFYMn2j3iHBBnh/aaaza0C7QB+PiYq
	REhhUTR0Ja0NdCOZhXXfpUNWam8W2puCpN32ALkA7+HpTNeNjJFLNzZ41+qL0S0toP5I6XS0hZV
	++VyBYpz6CA4/bkYDd+s1FjSSVNx1vYa7T6sIMFic7a3XCPiI9feu8Y7VUindZoMMZZdIvPBISd
	H1R7MnrLAGYg/J1cUfl5L4nwuq58BiPKyBuhhqtk3zzk1
X-Received: by 2002:a17:902:ebca:b0:295:86a1:5008 with SMTP id d9443c01a7336-29f23c7c568mr95371215ad.38.1765797000571;
        Mon, 15 Dec 2025 03:10:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw+sSh+Rip1bcv7Jmd6B3GjWMcPMdXpJ+pPsj0p0PeozuPMWxI7STGb1SB8dS7W67RV31ezw==
X-Received: by 2002:a17:902:ebca:b0:295:86a1:5008 with SMTP id d9443c01a7336-29f23c7c568mr95370905ad.38.1765797000110;
        Mon, 15 Dec 2025 03:10:00 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36a80sm131516695ad.19.2025.12.15.03.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:09:59 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 16:39:35 +0530
Subject: [PATCH v2] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs
 present on Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-knp-pmic-mfd-v2-1-1e91138c6fc6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG7sP2kC/0XMQQ6CMBCF4auQrh1CaxFw5T0MizIMMNG22CrRE
 O5uZeNmkn+S960iUmCK4pytItDCkb1LoQ6ZwMm4kYD71EIVqpRKlnBzM8yWEezQgypxqNDUhqq
 jSJM50MDvnbu2qSeOTx8+u77I33eHikbpP9Sx69mNsEiQ0DWIpOuu1qfi4mPMHy9zR29tno5ot
 237AkPQ6UizAAAA
X-Change-ID: 20251215-knp-pmic-mfd-25cf7ca8ae73
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765796996; l=1462;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=ydtpo1HUo+zQHHbhntrdl2ItAFsh0CmlNavyuhDjjN0=;
 b=EEQlSlTwSYFeKwxmExyV3/U4s/nt7woZlmHixe3peCqp4ljMdHiRuRuJVSFKhmZy58nq91MAo
 xZs41nff6HJAbozMUhX4ENBdPq97ThlUjJDwKv0Q7iDLH+EBsuhRQa3
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA5NSBTYWx0ZWRfXy1DlwylHtxVM
 6NQhzcRO8vq0t5+Oj0lBs9Ma/2sgdra7Yy8k0c6+ITnhWqE2e7vF44zj5r2xKW8K3CfOM2BVXVP
 o5IjwG/6SDdDo6kbkxJY2H9eDmWACIYtQtXR71ikRAzoAw1mYIhcA4CHAekWsjMLxDJHytDqQ/c
 lURLClD6Ba6iQp9Ne4nwDrDyFXBy9jLdtiV3YTRsTQ1iI12/XSRvxQna+mXDpocqxda6F4Sdpg8
 pS/kJ2ZMhPD2lt22iHZi3No25CCIUoc38tAzesnLVm20PRNactB4nhEJuDw7vUyLqeoloLhVRiT
 FgoME5G8mJlMuyjaj1a4LmugKW7Xe5ZX2ajq4bYPd1LiYPpKvluuyPylbCWPRT6XKH1AByckDPa
 whFJylQTKLujH9lGWlSdQn3cB/TVlw==
X-Proofpoint-GUID: 1-d4xonT-buM7hMhbS8Rz2o6akblWuS5
X-Authority-Analysis: v=2.4 cv=Afq83nXG c=1 sm=1 tr=0 ts=693fec89 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wI7XyV6aaWbjcf_UEo0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 1-d4xonT-buM7hMhbS8Rz2o6akblWuS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150095

Document compatibles for the pmh0101, pmh0104, pmh0110 and pmk8850
SPMI PMICs.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v2:
- Rebased patch to Linux 6.19-rc1 base.
- Link to v1: https://lore.kernel.org/r/20250924-knp-pmic-binding-v1-1-b9cce48b8460@oss.qualcomm.com
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 65c80e3b4500..fff2824c69d5 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -79,6 +79,9 @@ properties:
           - qcom,pmc8380
           - qcom,pmd8028
           - qcom,pmd9635
+          - qcom,pmh0101
+          - qcom,pmh0104
+          - qcom,pmh0110
           - qcom,pmi632
           - qcom,pmi8950
           - qcom,pmi8962
@@ -89,6 +92,7 @@ properties:
           - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmk8550
+          - qcom,pmk8850
           - qcom,pmm8155au
           - qcom,pmm8654au
           - qcom,pmp8074

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251215-knp-pmic-mfd-25cf7ca8ae73

Best regards,
-- 
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


