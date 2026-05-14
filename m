Return-Path: <linux-arm-msm+bounces-107612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGsLOnLUBWpUbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:56:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D87542A07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4239D301A245
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7EE3F54BA;
	Thu, 14 May 2026 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrtsH66r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rp/rrAWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8B3F2109
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766868; cv=none; b=Fj8SDitL1tFmhVfaawUJ8l3X5VH3E2ZQhwTutX2UA3cYn92HACyc6dfUMtqGkOLjSKvu/NdWaa8DThWUBn4fkdz9PwDDi4xIrmW2ZwC8gmLjD1s+lcINzO4WBNijvmoSVmZM2jo73OnJe62nA8lErp64pZt41mflN09NkPGjijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766868; c=relaxed/simple;
	bh=nTbp1shaJoeWLjzKXLYsaqNmI45aHF5rl5f3u8vBoeY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NFrdDotkrcaDwUp2H+2IS7utwkMMU0mkLLiFxUHMCc+PbhUjp6yPqQh2ZL0EoNTmIb7UukmEh1fW4X/mpLAPtnJtPDPTUCqWbeaUzRiZhsYmnydhK3LhhTkKgpeFCmQPHYVVidOqtmnlNZr7U3ycF5G5nIdH10Amf8Jtk7fkTE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrtsH66r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rp/rrAWw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeT7O2241689
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YDIYt1/654w02U8gSa0u4q
	uzz3yG0Ktza8LnFiuDJTQ=; b=VrtsH66r54wvqwFiYatY4g2ag+5vxGy3tWxcsx
	m0Im1UvOkAcpOxoM3CR4sfAexZijzu0QROloBBBLT/mLPLtuB8WLHsgSHjAYn5jI
	3WMejb5bXtPxROozYQvS9selVLdrf+ANjVUxLa8LBBJx8Bt4TGdae26TGYa/rQCu
	pPiUlYGJjGNDval1IEWxGbwGLC6aA5RcQ2k82AREzevnPkK/qan8dsvm5WmgXNZI
	D8vpBOH6f/skxszFm89iU8xwP2TWCbKWLzjpyYkoQFAq8twC1mnQ6uhP7kUmiS0A
	upV/xpgl0Y6BwPwJ6w3eX3tLWR7k5EBbkup3yCzBSLJMSnVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513gavvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so89080021cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766864; x=1779371664; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDIYt1/654w02U8gSa0u4quzz3yG0Ktza8LnFiuDJTQ=;
        b=Rp/rrAWwyvereqQXOx4HlEipUmgsGnj1szjzvU/9CIw6F4DiitHjF0OCK3FJlWBPwd
         ruWbJW32WbcbFgiLp/afRdhLi3UMhrnU1Shnr15OHETSIk/Qi/4sToQNDd39Xw2FLtHX
         LlKwn4v/CmHSTgArmMarRxu492cPIS5WenGzFwFLVCyDkG4YSk0rK1JRZdccrZlMWhsS
         Ksx6V+Iy6qi+UGMeYyqoyH4FjYCrKgZldZg5E7MrNMqxlAZT+ja4fmeb6XjoVFWY69Hx
         jIPnA30TTP4BzZghiFRaaH63/96US1g2u/94E90u+g9J3QzzNufG88J3fYBvSR1bxsMd
         gR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766864; x=1779371664;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDIYt1/654w02U8gSa0u4quzz3yG0Ktza8LnFiuDJTQ=;
        b=fgZlJPnDPsr1PPZbUaL5hCAE7cKO6pxhAT+6xS43gFzKdXXsf9Ggj/Ms/36vIFBnND
         JPUO8Hb5dVARVBdSILpNrL5OuXHWHjmxYCiHTrmXsU6ufEsYINwJzZ9nIMafMCvAsGvm
         2lAMHtsekqq2Wa+Ll7359is6qbqV7OZ2SoUjvQsD/zHDH9znMFijxvVZGtVyz07/Ug8M
         SqHTgKAAwTZPkUu76rH/q1wUvZO/XaYfUxDtkTFcwbD6EyDW9epyQi/6+u4izAdLyzHn
         BalUv7AjwocgXC/EIirWRIWzMVa//wFFpulwhTw1YyVM9PISWvWg3wrCPScbqvYBv0uB
         srvQ==
X-Gm-Message-State: AOJu0Yz31LY0fRugTzUBvFmat+zCtQ8sZJR7vaANAJGHKdF2fhfYQAXe
	rriDBAo70WuG4ovIq79xNFG2WIzcBSmctxV5y6JI73BSO8N3Z2aawIj2srUP83MphUtvhELTNto
	ErgUzlZf3VbCkhpP9ZB6/B/bY4MvWAFaf6X1dSBpo+jKdPTYk3L+m+qLgGB7PUp5E925z
X-Gm-Gg: Acq92OHeIqvtaozyOHrNYjUNDQQ/u8ko9HvGjkdKhoHBggGTAdwm11VWkkpJUpu4tnD
	htHACKpxS21EHAfIXOAO61vb7f2YgDdR0nR+iMM7VJ4Sf0PwsHnmnxBURammwW2hXDQrm1ipu2i
	lUXRDDkTGo0obhQ+xIkyuiYgjva0cgAfOuQJcCGIln3cNUY1y+LbsndvmCaijXrpC4QmEQ5UGh9
	NcERLoMOdq8eb0gUBZJePkTGPt9EdTPaPxS0onLeZKGWu/SxXLcoxZNOMqGLu+4k7T3eN5NsnMN
	pvFuJj9f01zObsqjhKQwHENXmi9p8k//nXQ8n7hFE1ltyHNCnpiQKFYP1SiqH6Pa6Z/jq3S+3Pg
	4g02u3F//95ndKWOddCnIz4jw/dhFkw==
X-Received: by 2002:ac8:58c9:0:b0:50e:5fe2:83a9 with SMTP id d75a77b69052e-5162f437d72mr105273081cf.5.1778766863917;
        Thu, 14 May 2026 06:54:23 -0700 (PDT)
X-Received: by 2002:ac8:58c9:0:b0:50e:5fe2:83a9 with SMTP id d75a77b69052e-5162f437d72mr105272261cf.5.1778766863239;
        Thu, 14 May 2026 06:54:23 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd62dde04sm27798165e9.2.2026.05.14.06.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v5 0/3] arm64: dts: qcom: eliza: Add ADSP and USB support
Date: Thu, 14 May 2026 16:54:12 +0300
Message-Id: <20260514-eliza-adsp-usb-v5-0-a21056ffd892@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAATUBWoC/3XNwW7CMAwG4FdBOS/IdtIu3WnvMXFIUhcyAWUNr
 dhQ3x0XNA3RIUuWftn+fFaZu8RZvS3OquMh5dTuJRQvCxU3fr9mnWrJioBKMAY0b9OP177OB93
 noB03FDBAE9EoOTp03KTTFfxY3XLuwyfH46RMG5uUj233ff044LT3i+MjPqAGXTtPBQYmiOa9z
 Xn51fttbHe7pTQ1/RjoTynAzhQSBR1DkLLw2jxRzJ2CNFOMKKWVsSNnMdITxd4rZqZYUZypKlO
 yq3z0/yjjOF4APPtrFZcBAAA=
X-Change-ID: 20260330-eliza-adsp-usb-8ef2b1b0fc13
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3171;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=nTbp1shaJoeWLjzKXLYsaqNmI45aHF5rl5f3u8vBoeY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBdQIaOFeGQD/jvmtbIhtOLzqA5iQ1q/DKLqg/
 1mfwrL12pqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagXUCAAKCRAbX0TJAJUV
 VoS7EACrOJAbdzvC6XJGe7w+U8LCWwSt7Q4ucsVHB6a6BeOTwxQc22xC6TNZQJ/OfbTHFkS0blx
 C/ZIHd4JYzTzBJjEi3Lp9ym7T3X/5iIkvn86HTvXZOxhluqzl+nvBDA5IgVRkxFysZg5icBidaJ
 oQdtul+2kO3wDWVNfdhX0JWuS+FD3+PZTEexd8WgEdpdA8Pd8/FJgCCWFHO5EOEidDQr4kmNPcc
 5xB2YUgoHVaBWp++gPuK+0IiusrC8WTLMeXbkyJSsiBpqjlcqX5ixjoC9E3l2xbe0Go8EQvzLah
 XlrkxxxsCJxrAQnHDdbB5U8eTCLwEegUsFD7S6+eQ9GoGK2dwdrTQiSoTrAgVNRO80urfb8UhSL
 PCL0XqPUwE0KYEYtbj1/v5qaw6rvzl5UfzqddtXOTVC4Z6HXmLA76atBJ3xznS2uN10S8JqqKGz
 XdRGnu98HozXLWy88ovCyRoFtfqq2KfdOWGDFarQwCsJaGOeeUqqqXjXgM0cuji9gyrA0DyEt99
 hdr+W+NFdq56evG53opQ3akMLVnrNOqrIfqzhU4ckeatp7DmdPBCWcvd2DCYHjyFxCUz2R7c/aa
 etfFwcUn9htiAZps9+lEEQ5BlbtLlkORyJSawaDH6kArnTzZTvRAauWk7xNrVrgHf8+GePvYihm
 GUn8ARl/+AddLRQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfXyM5VkhE5sWL2
 Fq5JX0PtdZMcu2UCs+XVN8yJy0Y7kzly79kiyjXR8ar4KrK0+BaE6u6auWQuuS4gx91escYze18
 5xVj0toLsQZu+IqxlR2D/Xvd8z+k7qz244Uaxfx6UmhP6w4xggw30u6HfBpSi0DjssQmc2XsHxL
 R6Z81d1LO/AuT8s0DLGREllel5aMd7AJO0SLm+RXUkkhbKnffkMguojlv9vQHzbHxVnqBeTx74n
 90etdtLvyDTlv/KQRatv0M12gAQV/fC60YO1Izp4KUn2exY8WwViRn+3GZxfbv23WAOrCS74E4B
 m7SNyHklvBouzzmjtjnEvYM52YdjDgoFmiIWqOerjGBoT1HxklsJrDV+B4MfL5Levb7pDt/z+pY
 WwHHdZv/DP6WrK9vaFiNs4BCNL910IjK1EGZo5nVbB2wjQe94w4e1tXmY2uX+0Hzc+AZRwdaGgX
 e6CTXvIhEHPeb2EWkyg==
X-Proofpoint-ORIG-GUID: uPfhE0W0uw0yaTjC0hw7n3C3MK39o1b8
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a05d411 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Qmfk-NFhDH-ilJP6KxIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: uPfhE0W0uw0yaTjC0hw7n3C3MK39o1b8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140
X-Rspamd-Queue-Id: E7D87542A07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107612-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds the ADSP and USB related description for the Qualcomm
Eliza platform.

The SoC dtsi gains the ADSP remoteproc node and its communication
dependencies, including IPCC, SMP2P and the AOSS QMP channel. It also
describes the USB controller, the SNPS eUSB2 PHY and the USB3/DP QMP
combo PHY.

The board dts then enables the ADSP and USB stack on the Eliza MTP,
including the Type-C connector graph, PMIC GLINK integration and the
PM7550BA eUSB2 repeater.

The following patchsets document all necessary bindings:

https://lore.kernel.org/all/20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-qmp-phy-v2-1-849c4de8d75f@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com/
https://lore.kernel.org/all/20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v5:
- Dropped the redundant interrupt-parent from the AOSS QMP node.
- Picked up Konrad's R-b tag on the first patch.
- Link to v4: https://patch.msgid.link/20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com

Changes in v4:
- Picked up Dmitry's R-b tags
- Replaced PM7750BA with PM7550BA in the commit messages.
- Put one entry per line for the repeater compatible, like Dmitry
  suggested.
- Link to v3: https://patch.msgid.link/20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260508.
- Picked up Konrad's and Krzysztof's R-b and T-b tags which I forgot
  to fetch from v1 thread.
- Link to v2: https://patch.msgid.link/20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260430.
- Changed the HS PHY ref clock to TCSR_USB2_CLKREF_EN, as suggested by
  Konrad.
- Changed the HS PHY VDD supply to L7K instead of L2B.
- Dropped the dr_mode property from the controller for MTP board, as
  suggested by Konrad.
- Re-worded the cover with more info and updated the bindings required
  patchsets list.
- Link to v1: https://patch.msgid.link/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
      arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi
      arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support

 arch/arm64/boot/dts/qcom/eliza-mtp.dts       |  81 +++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi          | 260 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi |  70 ++++++++
 3 files changed, 411 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260330-eliza-adsp-usb-8ef2b1b0fc13

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


