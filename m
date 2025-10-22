Return-Path: <linux-arm-msm+bounces-78279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C54D4BFA8B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 51D5B4EA96D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FED1E8320;
	Wed, 22 Oct 2025 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HmarEOxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FC12F7AB2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118139; cv=none; b=Cxs2EYvE5x8LpJq0RFkjO5vT7QLsQ4dbkvBn5FUQzwReHVfIPlgwD+HJWslMDmTZjUd4vMtFI0H0S3DdtkgWjuMV11BqM/9ad6IwXWloVdXmSOjwfavtyD0VO8F5DA9GpvleC+m50U0PygMlG+W7j0AK/2uOJur3SOBsScKnZY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118139; c=relaxed/simple;
	bh=iE+wj1nJKoqGaptWFJM86DR2OUp09Tooy3IwgRAiN2A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YaDFlJbo5xtmzCO8N5fG1xb2mVVjD3nu8bDHclOkCDAJafD/7QNvGnwyyv/dWYAUkjS0d5EQrnxrMU5o7f1NffyVX5JGA2Ujg3ZX3D5xabuKdkHDJlRYE5olvKS7B+z6wBs7+awHxdad5ZNr6/NC5qK50RgE/0jSEY/vuKS3QoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmarEOxH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2ppVo031255
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DGlg8C4BGbAwf7Yj52Ofip
	eoKnBYKkeSW3ovRD14QZM=; b=HmarEOxHKbvjRLhCrq++6IVs3+Bm3m1/H0UoQ0
	MCGM4GmmIwkZoMwU+/XMSETUGWXWV2A9g/Gecqe/hEixJ6DI1+6NLTQkFArTTa+4
	rWt/P9hR4Yz9F1WnAwan1JxBWFlcAwqmtH+wlaj1LRo8B2xd+M/dDz41Gq6J2sOK
	xgexvmtP5Py9c72e5N/mz3n2oAqHWmCT+xJhsHXDl+Lx1WIIKnil4peZ5Ljrb6lV
	jYEswz500rOtcY2SHZ+eYh2sYm24Jyd0z4HYVkqMjnWgm6gEBeUv0kyu2hZEkqzn
	2k1EuOm30vVp7fv1yTuKCKRVChe1theUfRBONB08dlY9PVKg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kbgxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:28:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befc08so2520357a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761118137; x=1761722937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGlg8C4BGbAwf7Yj52OfipeoKnBYKkeSW3ovRD14QZM=;
        b=Cn5meodvE1v+7Fp9mNRCQSds47z3sODO2x82wg80UWfQNx0TS/4/CVI3XU6fxayMaB
         /irEZuw0k7ZZxUyzT/5e3mfwb73cKhHe1g0sm5f2/4QGWIlUst8/elWRPjzP3J++fr3u
         dUZjOERBdWWEQa8Y4wdQZu9miowbII19KW0guYvYd7UrMJ2QSuD5ZDnhOZsG7vyrIrW+
         N4+c25yEZFITouUHU0dk+7a8OnQHzUcg7pd14GMkjEUT8/geVhyZBzdbhk7QPlZtOD6i
         a0s3K46j/AOtxI6qzpQ/hb2KMPHkcCgmKoqKDpM8iyK1YaDzGzy+M3bW0b8RUlgT284k
         6eCA==
X-Forwarded-Encrypted: i=1; AJvYcCVOk3seEewPDH9CMDCbAbsBnuW/MqO7r6edn9g1956yONMUcdvqYKls/+NXSeV7cGzeaO9Ke90ET1jXnAR3@vger.kernel.org
X-Gm-Message-State: AOJu0YzBSrGkoh67hZVvuW54HeV62YlViaQLP5+nrShog/W0gzalMrYE
	LxbEiHKfoQaaUuws0RDaxqO45Z0OzlhfRqItHnB3Ntjy77cibRobiORI4LIn7dmtZK8Zl6c7SDN
	3btrjEp4DZM6S6kQKleLXeFwO3WtXfC7sbNScAbcVcXxbKWQL8d6EnHCJwip4vgkNTrLn
X-Gm-Gg: ASbGnct7P05uC46cqdyaovISpEBhPaVtbGM9jPreX9a0EyMsb3RYMcSzkMdv/F85Y2/
	o5XYCZxHGaLzweTkqdcGzJXY7PONqcPGSGwAnyLNaGPbRWKohwNebxXHOCrD2Ex3miXH2B8H2ui
	q8ed5gdiFMs6u2MHGFdXcnN+FNEExBmU7TkQQ2J+R5KAH198qO0sY0jKN/QPkxHS8YVIkP1Z0NU
	N70hejeCyFI88oy7SIjVB7hQn3e7MMfAxaMxJZXrWm3uLupIWPGiEI4qMnF4fjWMpSjSbzIaAJW
	jhCn1n1mg0Bi+YwKoaMHmG/HTLHe+CLIuBFzC/ocKSeEHfmsw9m2Zk8yE7rcuO3HHcZxRLQorRh
	KlkPFjTKhM2JJ2Y5pQ6I8Rr33oZMaR78rZkHLno3lF22Xk/rDGQ==
X-Received: by 2002:a17:90b:44:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-33bcf8fd82dmr23899332a91.27.1761118136761;
        Wed, 22 Oct 2025 00:28:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN227kUpyZjkmpdeHrnrNo9N+lV5dc2dEsaPN37OJQMnUXIZ2XEbYkNywC0naA6sW+ZJ/KPA==
X-Received: by 2002:a17:90b:44:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-33bcf8fd82dmr23899296a91.27.1761118136310;
        Wed, 22 Oct 2025 00:28:56 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff4498d0sm1687342a91.11.2025.10.22.00.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:28:55 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/4] dt-bindings: soc: qcom: Add soc related bindings
 for Kaanapali and Glymur
Date: Wed, 22 Oct 2025 00:28:40 -0700
Message-Id: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKiH+GgC/2WNQQ6CMBBFr0K6tqQdQawr72FYtKXARGmxo0RDu
 LstWzeTvOTPeysjF9ERuxQri25BwuATwKFgdtR+cBy7xAwE1FIA8LufOQXLDfoO/cCNUVKK0xm
 aGlj6mqPr8bMbb21io8lxE7W3Y/ZkR56NSK8Qv3t3kXm8J4SC6i+xSC64OmrRgJNN1atrICqfb
 /2wYZrKdFi7bdsPk+H7J8wAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Eugen Hristev <eugen.hristev@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761118135; l=1309;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=iE+wj1nJKoqGaptWFJM86DR2OUp09Tooy3IwgRAiN2A=;
 b=isjUOSIQMyjtDRZQ1G4Kw/FYLSRqchF3+CWscRwYErlkL8j5dLT3Rw0aVJSrhO5/qP3SBeF3H
 MjjO0P64WxXCivn3dDKg4EiEv7EYPvvs/NLBmquf1uYbIzOJeekZLm/
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: oSvt6dEoVAM0U54sk5_rXVRG840TldK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX2Phehy//D7KE
 qWRSTkv6E5am6Epjc3KOa8zs1Q90PBQZSG9QLS1DV0Fhk15/pYC2cUZNC33BZguamDAYVN4ESU/
 c/dOB4SXUAFEMMphAEbA1MguBM9XvQhenCGmVmJoL774xiP87J+fSjwnxwXgwbg87/L2FU+16Yf
 3R48QmuPz4fFj4cU049h63dE6ZTD8xM8U2XhtGAYK40LaBdmdy+6AB0m+BRJE9RqayM6KpD+WAs
 YupDOM/1ff4qpkVMzGUjOdFtHikt14J8DehKvwYMV7qFNQWBKGe6Fnb8cUvAmAug4mUx/TCoNNn
 5twcIuCOhO/I6wHTFQKqJqlZXzLw56oIH24t1AjUOHy9pKz5eb2WbVhkjqK9JWICumv2psdNFbr
 rEU0QdDsxNxH/GlTpyFbrIhwZhrd1Q==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f887b9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x1lwz7GVZOURCrER9fYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: oSvt6dEoVAM0U54sk5_rXVRG840TldK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

Add soc related bindings for Kaanapali Platform including aoss_qmp,
imem and scm. And add aoss_qmp for Glymur.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- Fix capital letter in subject and simplify commit message - Eugen Hristev
- pick aoss_qmp change from https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/T/#m4bbee2db112a471cdca7aa63477b7147691e6852 and rebase
- Link to v1: https://lore.kernel.org/r/20250924-knp-soc-binding-v1-0-93a072e174f9@oss.qualcomm.com

---
Jingyi Wang (3):
      dt-bindings: soc: qcom: Add qcom,kaanapali-imem compatible
      dt-bindings: soc: qcom,aoss-qmp: Document the Kaanapali AOSS channel
      dt-bindings: firmware: qcom,scm: Document SCM on Kaanapali SOC

Sibi Sankar (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the Glymur AOSS side channel

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml      | 2 ++
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 2 ++
 Documentation/devicetree/bindings/sram/qcom,imem.yaml         | 1 +
 3 files changed, 5 insertions(+)
---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251022-knp-soc-binding-bb9110682752

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


