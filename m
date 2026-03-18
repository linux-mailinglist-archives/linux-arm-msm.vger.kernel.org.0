Return-Path: <linux-arm-msm+bounces-98341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFlZMDRhumnFUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:24:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 262BD2B7DB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0BFC30166F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4803783A4;
	Wed, 18 Mar 2026 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyE1dyHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rj6WsNS6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FA136A02E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821615; cv=none; b=ZUW7PA188uluJMLUuLU6LeeOki0zJ8+3xvrk7RngDtoizFPVIqCaq+NSZJoy+Q+7cwaHn99L1KMux9M6DnEqzyszfa7d0CiaebmQqNakIim1IlNoQNomjfAw2olI9MqsioJlKVHrSx5Fdg+awHvomG6HC6bZLnugSoeaIFTuZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821615; c=relaxed/simple;
	bh=VqRy0C6zladiEiSl0DOLfQtClSjSMcxmIJ2XaFwti1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J0EoW0oGLEL201qePohlRGqcm0mCXHcxPr51UqAFDu2D71e3V9ZJUvJ6rkt5so0fRfFl0v2bDOwT60LHVsK2+mK/v7zYxAKFfZQ9+yGIhHS162Oniqp6jiKaylGbmI6fl2+hMTsMlIicZW1/dLbR7Y5+1xGw13YsYU1JeRGuvj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyE1dyHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rj6WsNS6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I76gqD2612890
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=19WDjJedxyFYNJIXHx2GGb
	sPdTBU8eZ+K17q1lrM3dY=; b=KyE1dyHkTM6dKVjFsXpbD44PBMBuh1jNEITcZM
	x455AM4xl0deAL3KDn+R98ABSUslEOAMrdr8OOeePRWXAzMcDlp4OST9e3INrsGg
	Qm4vAeEAneg8Mahb8R2YVoJNMTPt84/IfG9hVEgYmOwiE3PMp+ve/egi+HDmuttl
	27oq12Fq33S9JZAJUN9GrFsoBPTlaBMSPxCCUqBviCPzmmbvswVqQSnFcWDM1xc+
	mTT82daUPymv2IrY0+Cnyc3MInOodD6QWNsnosDk35j8JVXs2D5rHvJTmLPUAADB
	1h/GIVGCItEQ2PGfbggNqTG/jteYj8/htaNIisvA+thHvrNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcdr9xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:13:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd767c51efso784116785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773821612; x=1774426412; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19WDjJedxyFYNJIXHx2GGbsPdTBU8eZ+K17q1lrM3dY=;
        b=Rj6WsNS6Ekf/T0nEuKR1A+GHIIvwJGwMM9vNJNVyjI0OzgciI/YL0/kLyh6gkVTiS9
         eOhL1kgrLbPiOeI81ARWPmz0EZ1wiaD+9VhpMBuxXA8+0Ka1ytIs7h5jj6wj9MGcSVim
         cua4GDy/NTUC9WDVd8N/h8n3fJKu1uKux8bPK45VBny4B9fNst8Gf2QduBIbgUQfSjrw
         p2yMu5Pyzh5mgZ4szGFdZaxGWzuBzJ1Do5JknnwN1gjqVfsPCAU2EKP5am95+/trDDKK
         j5FVi48UvI663SlmfnWBq9cLJdPOBB0KILkxvvBd8AoLzcUNgIPMmFJae3TnVBLMRoyK
         rX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773821612; x=1774426412;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19WDjJedxyFYNJIXHx2GGbsPdTBU8eZ+K17q1lrM3dY=;
        b=Ll5Uj4S9cSDb2HKeZZkH90ouo+zNxCuyNyFPShjZmn97vnm2gD0udXPiL9BOdJ3WHG
         udNz8rJRkHwdxdjuKVy+o8CRangCmb6RhJp1kNhK3MG8svcH59YbjrhSm0ztaczGPpSc
         9dyGVQU2sE+Wtef7UIKI4gGH48BIuixslEjY4ioX8zl/ts/XlBL/NkckAT8y2TiHIsQS
         D0TfSE8UqqcpWg40AqzMBUZooo7BCoOGeKN/GTWaHZaQ3kW5vwzBhWQG5pwIeW+BHgdU
         lpsoP2ubv8FpHRyGFzHR+U06ex1y35WRP+1yk/K5W/6KpyAcfteIP8sY9oFiHEHDE+Dn
         3ayA==
X-Gm-Message-State: AOJu0YxBFpY/Ad0Aa5B/ID0kirxANyoaUMziMmiMfm3J5RrmJikszkce
	mx3OqE9CU389M6P76P4R9rfqsvskrliVVA9sLl0GGE/2TZx9LKvKiHkShKZLWLEG0bMAJ79flAh
	Kh7WqJBciA5c9NLiD3IeXXv3MxvwW5ldDnSECkuyVX/YF3s6oL60BmGthAzfSQ01yCKQ4
X-Gm-Gg: ATEYQzyDm8z6oTrZh4mvQkSMPO3PKVxiFwmiDnuQmoBFNGYVuqLLkZvqDEj3jIC6fZ/
	Mlg/tOZC58XIiZKf/GRX7Z9thNY40g2MFwa6lLgEhw9DsIZtglm1k5pf1H2QZTcRYBuNtCkADLh
	TeT+f2HlsY1Pic8rYlN+I2aGWcMqYjdVpmxum0PMJHVBQ8+2i3jBU5vVy66Pw3Ey2Jwwnuk3+L7
	xn2dExqXHzHA7BhT1CsdQldYL/4KsNRCOr1yXI6kjH96U4hUw3ffT7JHuLtwo5xp7TP+syYrLOA
	PAtKIBtqqMH1+2JMX9hflulwQcboBHfZeBJqiSjpG30VplijSVqZLw17ITSlkNys0D2AsS0Zert
	+x0E5N3xz+YOt6m5lY2EW2nVn0ZE=
X-Received: by 2002:a05:622a:95:b0:509:5859:2917 with SMTP id d75a77b69052e-50b148879f0mr28816391cf.57.1773821612334;
        Wed, 18 Mar 2026 01:13:32 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:509:5859:2917 with SMTP id d75a77b69052e-50b148879f0mr28816131cf.57.1773821611665;
        Wed, 18 Mar 2026 01:13:31 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4613243sm24849175e9.1.2026.03.18.01.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:13:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:13:22 +0200
Subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Document the Eliza
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-eliza-bindings-dwc3-v1-1-92bdf233cb87@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKFeumkC/yXMyw6CMBBG4Vchs3YSoIWgr2Jc9PILY0w1HbxEw
 rtbcfktzllIkQVKh2qhjKeo3FJBs6soTC6NYInF1NZtX5tmYFzl49hLipJG5fgKhq3vYeFs5/e
 GSnnPOMt7ux5Pf+vDXxDm34rW9Qse4ossdwAAAA==
X-Change-ID: 20260318-eliza-bindings-dwc3-4b6e4ea45b93
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VqRy0C6zladiEiSl0DOLfQtClSjSMcxmIJ2XaFwti1Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpul6kma5YqxOa98y/l615PKIyrgRGFzLWAWcg+
 0XNLQ/gUL6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabpepAAKCRAbX0TJAJUV
 VmABEACbFRUUIgdPMGegK+ho5ZLLgsPH4EasFSuWFC/iPr6tDlEXyS7IzpFFuCc4Ew3YYGo6lOp
 clNFI+GKmv3ZVA7/hm3wT2voCkG6BDt5bDv0Iry0FG3liAQVuDQuTyJ7IsgP4w1sQETUNcz5rBe
 uzHaEF1d7ivT5E81MLpvvnIbwQgh/K2UAv/0LoFn7PwiQJNheJqwl/3QIOg8xMakU/pGHrN9N7W
 FKIgYQWmEV9bkP8LAfmx9fpWFpHRHNO0J1mPdlug/zlitIVK/xZW6XYKW1iBT/A3v+AsU5H6nF1
 3m2hEXmMEQ0GG9GTkeImH53HKkr7WLaGgNFXpgorrrFyTE2yXH84eZOffmPjUOhKTlCYtvKbFj+
 0qEtDLa83FOZPhCbRfC8bMPOh9upho3+GQSNQZlU42O1vIyrNsVMPNoFER96xzYX/SoStPLmYIH
 eOh3lrQC/GMG2D8GXizn8+Hcka6gB6piurKn+ETn5U4EHcpCq2Z04xVEGKrnlbfLMDGorsWHYqR
 V1D6Dygy7c3k7rhTTr0xmMwAD+LfEGqE7HqaIY4LXCtYlJoTVKCamcAfUs9YSttDBxzZw4h7Wu8
 rgGeCCfuGqgPd7MlcjB2CYapHxvCd4PhyFF94Hv0Uwj8wPecg917Abxg87lLbxfYiExdA8+Jk/U
 aHUGid0idn8BKRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA2OCBTYWx0ZWRfX4yZblriPzcLW
 YdMv6FUDMkYyo5Y2m2WCdUsywxz8e35Irhx5xocUeIQOXBdXETHWgwlNUrmeDeDzZ42eSHKH9aY
 09BVR4bnN2QuVfBHfXO1x5UkQ/5Z3FydsYuBICed2BsaTwB+w4wSLhKdT8h2PqjQr09caP2+aGV
 QG+xkuR0cbzU28KWyxpX08/unfQDC9yaZ2M9DVVodmIXQ+3ytHNSD707bVS6kIjU2Py17BAZiNy
 sVDueuLNRU3g23EzD86ApZhyxd51MHNC2UI638ZxYA7NW9yO4TI4QohXOA0VdqtijwNW8P1PV93
 4yJ8/j0frL15k+qGgCZxzlgsJmiR+YsTFzX8vNChEKxRGiRsDyW9qaLpouEwOHYXaYsqN9rKcQz
 SK51fkHAL9BCrKn4Lsg2TFcUKHXbf8C3P+dks6DQACoRWV1utF6XMiqx1taiXwoA0gt3lJsahqn
 4rdGSe9YcWxy11W8+Rw==
X-Proofpoint-ORIG-GUID: sue6ipjq3o6j3cnPU4HWmZeEH1mBcJqu
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69ba5ead cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4brKZRnnUR1JoLn4V7cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: sue6ipjq3o6j3cnPU4HWmZeEH1mBcJqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98341-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 262BD2B7DB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the compatible for the Qualcomm Synopsys DWC3 glue controller
found on Eliza SoC.

It follows the same binding requirements as other recent Qualcomm
SoCs, so add it to the existing schema conditionals covering the
required properties.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index f879e2e104c4..e67a967c677f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
           - qcom,ipq4019-dwc3
@@ -346,6 +347,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-dwc3
               - qcom,milos-dwc3
               - qcom,qcm2290-dwc3
               - qcom,qcs615-dwc3
@@ -507,6 +509,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3

---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260318-eliza-bindings-dwc3-4b6e4ea45b93

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


