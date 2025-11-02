Return-Path: <linux-arm-msm+bounces-80015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D1C28C02
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 09:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9855F3A9A7C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 08:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9BF1E834B;
	Sun,  2 Nov 2025 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcTjVY0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4oIp4AC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7842A34D394
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762071534; cv=none; b=bEH2y7oc05SuiTqeY8kj4N1aajk65Fn7a/rqJJ0FLumsjRQnvrwaCoyDXZiSLcNTVDfplgZ9bfTNU7IPhW/zWxvmKM9uzmCbQWxnnVR+rsqlMO6kfbOPojmAdIpS8eMGeeOYsDL4X9uynyCeIZ2odYJNFPiQ3XWbrX7ihRPPq7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762071534; c=relaxed/simple;
	bh=fwVRNtP3qmX8j4i/ZEAts2m20jCeRYVyzbEFRMh+KKA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l8kxFM35ByIHRdYEquWzd//dYFBzwaCzN96mitHjnykKEYX4rB0S1Q600oNJYO2XEB6G/AkrSIiJMhwEd8llImZYeON7vwa4iYL8nEODscEqGKl0drMIfy0jNHKZR3K36csCqK8ue8LbwOyFWKSqWVWU3SWJcfTy/Zjblx4Lazs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcTjVY0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4oIp4AC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A27rxu33811333
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Nov 2025 08:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=voMeuYHDPPxb2sYE5diuAi
	qoyRBE4P8mjCYyWgUIqdE=; b=WcTjVY0rOWD8BT7UkjNeQOUbQz8BXh3TX1Yx1Y
	dqblIDNCb5cylmXUQxdyYnUBjry86bthWfDwLQNYkEGWDyOM63RQ/T/bE4UW+B7e
	PWbpKoERaFi9oIGYNQJPP6bnrRt1f6GieONJTjYFAmB5fHjmDIjHBopDAhwtbV+x
	BplxXsdYdfl8PTZ8GzK0vDIP4GNlZB2GLRSkn/YYZuQihmtxE1BiHEN/caMXu0VS
	IC2emzcGg8ZOavrO+aahaCPEVaxKVMEHKdU2aZR5phzgZOqqqGffIIPuBB28iWqm
	fxrJjv0OaM72CF+E+xmRaXDSjrdwr07EutZlZtfm3ql+k4ew==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a595rswk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 08:18:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78105c10afdso4332896b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 01:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762071530; x=1762676330; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=voMeuYHDPPxb2sYE5diuAiqoyRBE4P8mjCYyWgUIqdE=;
        b=U4oIp4ACj3RNrAIG8//sOtrsx/JbCB7vF6Ug67xe8HQRO+MBMgqjBXIp7FT24ug2Kg
         IIrV32v66oPNW+1t2sM22myC24gdisl8lLXaaBimnS7m1ZuzjowAHFh0lbyRvXeG84c8
         bCzrvw4PJfGwfB33HuXYnnyZhzS+TnxfVyLc1ozqd80jsORF9511llw5BLRXiDKwpQon
         chh5cZ6xtkqBWaAU46dzF/JFXppepMBtX8Z7IGpU9RG2F4GgK1StkUpJlRHMfx7sY1EM
         MyA6IZjOjLk/TlL8o1oi0pSg9ay/y7AiEPkYK8hshPNIK+i/OlsGim3tMiVqDS5sl+gz
         El/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762071530; x=1762676330;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voMeuYHDPPxb2sYE5diuAiqoyRBE4P8mjCYyWgUIqdE=;
        b=OVSr5J+ornz24pxHTgtx7jKpb7WgLaPRIrH9dLJbdTXRnQgaDP7YT/OfUXGsPVSEhf
         Q5yPHUFlGAt2Mvc4UhEqfyNWil8G2lfGnPMsXUEgyM1qKR/TC8tCXJ8AimeLck9SMvPN
         URmRUSmzMYfCB4V2RcQdehEWqN+ffG5MPSR61B4+H0nn7rC1LIKNO8pIYs5j7H/f9Uy8
         t1rAbaqr+3YxLtQYZ02cZW1znsS6QV94nJyJLBj87b+rWirfiwG5ABBVlFZwYR8J87Cj
         OvIrGn12WMOD9Tze56BjDmIO6mg61+0C5iw09eFVlT6sDGOPsSH3CaxxmGA2+WGt4sWD
         XByQ==
X-Gm-Message-State: AOJu0YwN4ql6nvpg6LZWkWXRTf9KvY0ojKeJp/yTbOTsQvMJjBbbLfNs
	2lbu63jksaltgTdPzQvzHZ+2X0CQorm6+mjkOHMFHLYTZN3OLRxhHdPR3dp1bbtssNqzpVnwL09
	J/aOQZqVoU/cZAtNOIoGtC7gcn1AIjLO9qEJcyuQlGkcD/kWbWCKtH7GR3bvwW3CcdCnK
X-Gm-Gg: ASbGncuW8t1+M9bjkHF69JgEN7D8fx84bCwCBfCiRtIGlBEyKbFjv1udW3r6yxLDHEj
	1mPm/oC1DSOoZX9VxLG7iFtht/+ohOXCYHAbVJYUwsgiy9O3I0UXre0+KVJt49jhGv+cTZon30e
	7ngMVMMRdvD033qAR88WwkvQc2/BsroZNL05k90AdSW5NLb/X1yeEyJ+UBsB25QPGKzw0M+QkOp
	Ftj6MFNm5N/rpDQ08GE6KaA4fZVzpMwONkBkHpL6TnY+gdnRRvmAuXw8NjfbgC9Sug4FQCmcsgK
	AQTazzQgIR60VR6UdSSy/VO0h5LWc2LNsOTEz2cFyfXGIPlF3ei8umXU/R7dcRtR1Ip+8XhiyLH
	UshkxF0Ff6gPfgDpumDypB+l4EXUpKJ+zS1s=
X-Received: by 2002:a05:6a00:a2a:b0:79a:fd01:dfa9 with SMTP id d2e1a72fcca58-7a77718a06dmr10599313b3a.6.1762071529747;
        Sun, 02 Nov 2025 01:18:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyOVw+yQQe9lY7d8i/j8vDWpMKeY24X0GGdCl5JBGlFyGIlw4mDMnRKdODm5GBEDGZDwq36g==
X-Received: by 2002:a05:6a00:a2a:b0:79a:fd01:dfa9 with SMTP id d2e1a72fcca58-7a77718a06dmr10599293b3a.6.1762071529182;
        Sun, 02 Nov 2025 01:18:49 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897e862sm7440630b3a.8.2025.11.02.01.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:18:48 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH v8 0/3] SCM: Support latest version of waitq-aware firmware
Date: Sun, 02 Nov 2025 13:48:44 +0530
Message-Id: <20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOQTB2kC/2XOQQ6DIBCF4as0rIuhKGK68h6NMTiiTiJSAW0b4
 92Ldtnlv5hv3ka8dqg9uV824vSKHu0Uo7heCAxq6jXFNjbhjAvGuaRmGQPWL4Vhrj0YKpqOiax
 gjWxuJF49ne7wfYqPKnbnrKFhcFqdDthVu+QmUyYznqcy6TEk84JQL/HfiDCUR+EECVhzgAP6Y
 N3nXLjmB/sbk3HxN2bNKaPQqAKUUHnL0tJ6H3k1RsycYrXv+xegrvWV9gAAAA==
X-Change-ID: 20250227-multi_waitq_scm-5bf05480b7b1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762071526; l=4288;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=fwVRNtP3qmX8j4i/ZEAts2m20jCeRYVyzbEFRMh+KKA=;
 b=z8XNuMY0ZWLsIk4OABvH5X4XHOlJUiCqMOnyLUxOfNvPmOE8aWIaVR4J3bU1vEAhTCy2z7/UQ
 Ea2VbcDKS8nDjAXiiNeuAQLhM7LMpsw5JiwbxQCSPDnK5/15/5TYIyV
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: 8u3Fs91NklcpS9wrVoY8pShKjKeqHzzy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDA3NiBTYWx0ZWRfXwEjT6zuMrszW
 AMyb6OX7nICXqLCFcWp8ouFo8SK9IqXEQaMCymYZt+Iojwv8Da8qVY5lkyWTPVeFnhSulXL+K76
 5oMSlkqoMEhAFbA9qWAhfZ/nkSEqTSomiDzYxe0tm70Tv8MBLKaJpS2azTPmtBUQkaMEOoONucm
 Ls1T5HiPtnI34iMOjKJynjBi7mdcc8XrEgLEdk+shMgQg7R2Nuh01DfQTSJFmtjrMrSaJyREo5J
 0/Vk0Ur05VWaQIEloUDduTrXPJZfc3CxKsy/VMafCM/nyGrH7dSHsvsenq1G6EftZyQ7jGRmq+e
 HoLo1b27SgYvGMc32Ct+GYlijs7G8ymejBFe8B4L+rt5abFRB1CEF/xzpc2fR0uT0V6XARexjeZ
 Nsa9v9WXQzHJo/TGeAsa74wBTUHO/Q==
X-Proofpoint-ORIG-GUID: 8u3Fs91NklcpS9wrVoY8pShKjKeqHzzy
X-Authority-Analysis: v=2.4 cv=XYeEDY55 c=1 sm=1 tr=0 ts=690713ea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=2Aqlhn102uXVFFBPaCcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020076

This series adds support for the latest improvements made in SCM
firmware that allow for multiple wait-queues in firmware.

To support multi VM synchronization when VMs make SMC calls on same CPU,
waitqueue mechanism is added in firmware which runs at EL2 & EL3 exception
levels.

Thanks to Unnathi for bringing the path to this level of maturity.
P.S. While at Qualcomm, Guru Das Srinagesh authored the initial version of
these patches.
Thanks Guru!

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

---
Changes in v8:
- Replace "of_node_to_fwnode" with "of_fwnode_handle to align
  with current kernel version.
- Add NULL check for parent_irq_node in function qcom_scm_get_waitq_irq. 
- Change declaration of qcom_scm_get_waitq_irq and pass qcom_scm pointer.
- Set the scm->wq_cnt to one, in case where waitqueue is not
  supported by firmware and continue to probe the qcom_scm driver.
- Link to v7: https://lore.kernel.org/all/20250523-multi_waitq_scm-v7-0-5b51b60ed396@oss.qualcomm.com/

Changes in v7:
- Assume failing scm call to mean WAITQ_GET_INFO is not supported on target
  as qcom_scm_is_call_available() is handled in Qualcomm firmware's TZ (EL3),
  which doesn’t implement WAITQ_GET_INFO, and therefore always returns 0.
- Link to v6: https://lore.kernel.org/r/20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com

Changes in v6:
- Added R-b tag from Bartosz for first patch.
- Check if QCOM_SCM_WAITQ_GET_INFO is available before making scm call,
instead of assuming failing scm call to mean WAITQ_GET_INFO is not
supported on target.
- Add a new patch to check for waitq idle state in wait_for_wq_completion().
- Link to v5: https://lore.kernel.org/all/20250227-multi_waitq_scm-v5-0-16984ea97edf@oss.qualcomm.com/

Changes in v5:
- Use GIC_SPI and GIC_ESPI macros from dt-bindings instead of redefining
- Modified qcom_scm_query_waitq_count to take struct qcom_scm as
argument; scm is anyway stored to global struct __scm after
smp_store_and_release().
- Tested on SM8650 which has multi-waitq support and SM8550, which
doesn't. No error logs are seen.
-Link to v4: https://lore.kernel.org/all/cover.1730742637.git.quic_uchalich@quicinc.com/

Changes in v4:
- Moving back to redefining GIC_IRQ_TYPE_SPI and GIC_IRQ_TYPE_ESPI macros
in qcom_scm as seeing compilation issues in linux/irq.h when including
arm-gic header. Will send a fixes patch and move to dt-bindings in next patchset.
- Fixed a few compilation errors.
- Link to v3: https://lore.kernel.org/all/cover.1730735881.git.quic_uchalich@quicinc.com/

Changes in v3:
- Use GIC_SPI and GIC_ESPI macros from dt-bindings instead of redefining
- Prettified qcom_scm_fill_irq_fwspec_params()
- Moved waitq initialization before smp_store_release()
- There is no Gunyah hypercall API that can be used to fetch IRQ information hence
introducing new SCM call.
- Link to v2: https://lore.kernel.org/all/cover.1724968351.git.quic_uchalich@quicinc.com/

Changes in v2:
- Dropped "Initialize waitq before setting global __scm" as it was merged here:
https://lore.kernel.org/r/1711034642-22860-4-git-send-email-quic_mojha@quicinc.com
- Decoupled "Remove QCOM_SMC_WAITQ_FLAG_WAKE_ALL" from series
- Converted xarray to a statically sized array
- Initialize waitq array in probe function
- Remove reinit of waitq completion struct in scm_get_completion()
- Introduced new APIs to get no. of waitqueue contexts and waitqueue IRQ no.
directly from firmware.
- Link to v1: https://lore.kernel.org/all/20240228-multi_waitq-v1-0-ccb096419af0@quicinc.com/

---
Unnathi Chalicheemala (3):
      firmware: qcom_scm: Add API to get waitqueue IRQ info
      firmware: qcom_scm: Support multiple waitq contexts
      firmware: qcom_scm: Check for waitq state in wait_for_wq_completion()

 drivers/firmware/qcom/qcom_scm.c | 129 +++++++++++++++++++++++++++++++++------
 drivers/firmware/qcom/qcom_scm.h |   1 +
 2 files changed, 111 insertions(+), 19 deletions(-)
---
base-commit: f9ba12abc5282bf992f9a9ae87ad814fd03a0270
change-id: 20250227-multi_waitq_scm-5bf05480b7b1

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


