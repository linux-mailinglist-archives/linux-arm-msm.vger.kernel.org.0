Return-Path: <linux-arm-msm+bounces-108600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK4nB07DDGqJlgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 22:08:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C465847E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 22:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CFA3309EA4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 20:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BD1369D67;
	Tue, 19 May 2026 20:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiYCb82Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RF0JO2Qj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B0C3B3BEC
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779221027; cv=none; b=DXGMbCsQwA4gZI0PUUIDAhvY1ydjq0NzmZ/MjkQNIX1eAet0WdmmooTEWoxYTat6zdauozCcugjJAbED1N/dyQr/OdtigFqsaryTwFwtvTQm/fLKD4pLU6Ci9OafP+A22JjpXYTrEt8cjoIi5W3Vf9F3xxoZ9d0e1nLjp4nXnNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779221027; c=relaxed/simple;
	bh=cixxkTDqmFxVL3LZ6/FGzvqpRa/PZqhkUCskLiBduV0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zt6hx8Kp69KvO4VmtBv3P38YfieRBg0AjEnLCoSVWpEDNwtw9Z+k3Z+TacbbazPggS9DghaPoCbjI235ZKqCzfo+zQDs/FV9a0IjJS2b5RdsZe4aZIGfuyOHZ5yDn0gA1zioz2oiB3LRJXmtBrc9wQWiwM/U7IosOfibSqTHCeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiYCb82Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RF0JO2Qj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExJZW2143768
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 20:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6VLWt7FBiJ7doh/6+nwiex
	x2CA7eXIw7/akbrpx+Yug=; b=FiYCb82ZQ0tNMahp+DfMRHl3+bDlmghdhcpABo
	yyYWa5k9LR2FSMm9V94bUxOlAQFEjYje0i2M/ZU85gE1o7+whETB/UlD86YbEf4O
	g3oqexLX9/zXPf/5sFDYt3gE10YKLRMK7bDSWZ4ViYAYiEwAD1gbeGgqsAid0ejG
	9cZnLXrfp40V8J9wkiQ8vv6tMera7vcWcQI8fj5BHIJtCBg23eUaFHtg0QRdRo15
	8et28BHyPBYPRfszi+yvbVTtYMeVp757Is92lULBwyVqUllGf+eUZiO3S93fHWAT
	Wpqg/vo0+Px/bs+WfiAwlrjDeli981Hb3VbtRc8W3+f7lrEg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3thac8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 20:03:44 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575590529a0so9035039e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779221024; x=1779825824; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6VLWt7FBiJ7doh/6+nwiexx2CA7eXIw7/akbrpx+Yug=;
        b=RF0JO2Qj6YsfLFFYFeLOHShCN33kSbafpDpYArMPPZty5eOpLBHFcwcmw96rFt1yn9
         ALTPA4oMljKjLFd4SxwdbYml+IfJivyOS/RY1P5PJhcKC07JvvHYskUBlh1PiS9HtFz1
         fBS/AvINfkNOFnLK6kPjVpahMQeya7sXlDOb8pQ2GGcb6rLBjb4T7EJLJ5R+W/7UZKIC
         0iwssftSCcbkDReOU4Q337tOOeapyot89E+4ukHGid4HwQOjI5yBMN4wMbZMb1ZfMQ74
         pNcBOQsO3xsDscQVHSSkbp6uEWIIdImfCvV/7eGrnUvcSJGyUgLSO/owRCbhIVL0bmqy
         JeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779221024; x=1779825824;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VLWt7FBiJ7doh/6+nwiexx2CA7eXIw7/akbrpx+Yug=;
        b=XCubH2V0I24KmOBYQQhoiCbmTeAsm7UmWbJEbSPGCUU2vaa5nKNw5Rj0FU6jvPsop9
         0XigaY1vsmeBKEnCyQp3AiiVys8otIYvpO87iRfagNGRRAyqHMTgaVdGo0UbarV/ypJC
         KgvpDsySutNUaPDorMoDgIFCkPqGcPBDheUZD2e7fMdgHBAs5Uy5Z+JaGNTAqk7yu743
         KSMmBcRwG0UKpUZjLq/LsoG7CHscoI0+C4h6C1krYkadVyvrf45UM51Mb4ukpGq1IpSt
         5U4AEUHF5cDPaqWb69kaxeG3woBbTlzHR0D6ihN3iwDsPw8CztRVmSVNSortzwEaBknt
         s7DA==
X-Gm-Message-State: AOJu0Yz6GF4A0N5q0SmKZqvIXbDXEe4lP33hJN7Iskjl6x1CyQ2Bsbxh
	4s20re3yNV0iw6YHdOcOdpOqqtSnhfBKws8FTEeebBBeK8t+c3Tz/D9s+STNXADFitL4e/2r1zU
	Cia8Wn6P+bhvIL3nd4eYd38lFNolwWuP+inI93sJv00f4y3l1BeMoLegzAecXiYIOHzje
X-Gm-Gg: Acq92OHKkex6KMyxzdjwW8QlW2RJdLGM8xg0OBnEOVVpihZlF6/sUlUtMcvFIZDUdX8
	8p7sBsJj2ygXwQD5XYo3Zm5fMV84EjpXLV4M02yEXY7m4DOOdwYIfi16Pqw0K0RybILrQbysGd/
	5+Zhna58ypP2YjUu+3rj3DWfZ6MYOTp9VbBUyVQc8DtdYnYC+DBlAX9M1krHjuthxHBaPOo62SY
	xIo9xYLz8kkmk4K2OT0XvadLSuV0cQ+tyTa+HppgWNwPJZudn10gbyA4UmRpPfNTA0NIg/22gmC
	grd5AUQm7kYQL/gb4QKf3P/Ef3+MxxjuMhmJ2eaPzJ237xJL+3oCwSwVcJ9JnJPJP6Q8stW/kqa
	W1AH3Xzq2Ry1RiEGc836PHPEm3M31DWkHHf2h+MMAQpsZROjA4+JRiiQ=
X-Received: by 2002:a05:6122:d1e:b0:575:27de:3eab with SMTP id 71dfb90a1353d-5760c057c54mr13517730e0c.9.1779221024332;
        Tue, 19 May 2026 13:03:44 -0700 (PDT)
X-Received: by 2002:a05:6122:d1e:b0:575:27de:3eab with SMTP id 71dfb90a1353d-5760c057c54mr13517695e0c.9.1779221023905;
        Tue, 19 May 2026 13:03:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe794e7sm112085175e9.30.2026.05.19.13.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:03:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] dt-bindings: arm: qcom-soc: Improve validation of
 expected SoC naming
Date: Tue, 19 May 2026 22:03:17 +0200
Message-Id: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAXCDGoC/yXMQQ6CQAxA0auQrmnCIGjGqxAW0ClYEzo6BWNCu
 LujLt9f/B2Mk7DBtdgh8UtMoma4sgC6DTozSsiGuqrPVes8hhVH0SA6Gz4pLmiRUIclB2wmfwl
 MbeNOHvLhkXiS9+/e9X/bNt6Z1u8SjuMDzzkZfH8AAAA=
X-Change-ID: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cixxkTDqmFxVL3LZ6/FGzvqpRa/PZqhkUCskLiBduV0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDMIXe//6h+WtTfhNI2NNs8IhM+44ymWWdh2kM
 4ZqRIIz5J2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagzCFwAKCRDBN2bmhouD
 1xthEACTHh3du0Vle8GahBWqnpZKoIoktrvX3n4fnkQhh1SXn8pnPec336JMg7CroohEZq9hdaH
 B8zrbKKOa5et+gQxpk97gTUsUD7ru3RzRH3+PKCzdbiWFwmgh052qobZ/3DdrBYWOdxmhIUFRlv
 FmgCjtv6gbiOa6R48SEb3ttC5v78UD82IpBpB9KGwCmbyG+gch9iM9ZVg5nSVwmkaeHeMMqR53e
 HMGDhitekPMgjOJ2XmqO5hfrdUsb/S1brPEEoBK4g8SSuu3WLPSnyCvdAt0YALEAcalxig9ptbh
 GYcdeY4QjrhBMwSZsU3Eo1WhtSzXTq1/9/VDWxwmFZHCYbf5ukMq8yvrQ96yu+ehx0cUhYWMPF3
 qd7R+c542Sz7oMD9VoKiDEUSvie9zR8Byhr1P2fHWQlPj05QZKWsAiEhkpY1sapLKZu9JoFRzCZ
 G60if57aySIEiuxY2Gl8vmmriBs1ojnCxSgXDRkjZbwH8Zj2wO40Uf3RHkgQwTA+tbU02g9jaga
 aF64Z6gUipxxl34jjKJEsIQXpDhvH16bffgNEoqLWL351op5CYpKKcTk2DEMYmReeR0znL6p1fm
 GqC0noMMe1Ul0NmJBDD5JSfDQSZkeqlWOhslN1x6YDpSKzMMzEI+DrXeNW/PJExpS6oXa23VRzM
 FGw3OVGPlGeHPmw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=feCdDUQF c=1 sm=1 tr=0 ts=6a0cc220 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pnvqO8KSa4PCI4MgiNQA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: lgCln6LXaryPvSxMJKIhwyKs0uMXRgsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIwMCBTYWx0ZWRfX0MQuXRr57SvN
 i7W7Z8vog+AYKZoxCf+O6V9CvHNi55MbQYe5tQA8uWo4PaRkjzlAWlkS1xuFkuhutKzyTHBUPDh
 57DeWWu8fAfyC5Y7zPbKpRf/XAj98HFs3OECWzwFn9Kf0VLj9pZmxLR52xppQRz78RpDIx6CEcN
 Fdyc4totCqJrOg75Hf+AvSJ380CBW9VWVVPO4gCsYnZn71loIakbpkmOYcydX7H+MsdGZbmjZsv
 SoV8p7u1yXLsN+NIZEFAw7oJ0JI4GMoywyPahGs8gyYSf5AFTtNdMaRlvA5r/B/8zOrLptqBU5O
 ilWwxCqJXpgy7Vjz51KQclxlvNmXJ20xY/LsuaknK6HwrP3t1oRiHeq33DRoU27PQI3gdTEx8aY
 KcO4co0wma4t1Wz8rs0KrzbjcBDzBuSm9VspPF3OF77QTSOg7668xc9cqusxbEnst9WxGEOF4CP
 6rdaD7WyoqLqIPwbrPw==
X-Proofpoint-GUID: lgCln6LXaryPvSxMJKIhwyKs0uMXRgsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190200
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108600-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 71C465847E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.  Improve that because questions about expected compatibles
still appear, e.g. we have
Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml with:

- qcom,pcie-x1e80100 (expected old legacy style)
- qcom,glymur-pcie (change to new style, ok fine, let's switch to new
  style... but...)

I am afraid that a new SoC will revert that back to old style, e.g.:
qcom,pcie-whatever-new-soc

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: arm: qcoms-c: Include Eliza, Kaanapali and others in SoC names
      dt-bindings: arm: qcom-soc: Document more of existing legacy style compatibles
      dt-bindings: arm: qcom-soc: Validate nodes with fallbacks

 .../devicetree/bindings/arm/qcom-soc.yaml          | 173 ++++++++++++++++-----
 1 file changed, 137 insertions(+), 36 deletions(-)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


