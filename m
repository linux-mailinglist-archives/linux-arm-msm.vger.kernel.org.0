Return-Path: <linux-arm-msm+bounces-107598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG1QKmPLBWocbgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:17:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB515422EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B13DC30451CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7809818A6CF;
	Thu, 14 May 2026 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJ4O9nvL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtW4/rle"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA723DD844
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764605; cv=none; b=FdeEQcPAiLhFx+q0QD1Xzpt+Dw+MBogoVhxQn7GTPJTSeRIjuR4AF6GHmiZh7QuG1YU6hpaXSF9JiaXTjltjItp3x6lYr8z7oaYSV4O8nT4StvNiDTwTb8UjQOudESM1t4ulixV4n3QS8p092FszLGZX0zfZPplAfqVoMYD2Sio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764605; c=relaxed/simple;
	bh=doRT8cwl5tuW4v3nDKY0tWcMpACQ4r7ipwewcgGcF4s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KdGmmiMTvjAoYdPWCjCxNKxKZbEXL89CsKpCw0fHP+J6fQKB+c4eoWtIzpA2r2ggCi4fKPVSseXSA1dz9APC24DDyB4CE8et8KJnsgnOj/tqjCnjxC4YnQNSMOsyJxmfex9rOZH1iGqEhNw6gmsCaSY5+5BVjUo7yniTKwe5uMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJ4O9nvL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtW4/rle; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeUI93061899
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MSrY1vYdLTiLQUIIayjkcA
	EoHn9Qam7mz3CuMYOBslo=; b=pJ4O9nvLiJsW5EMSIZ4lS8u0tHjFofwxQMLwmv
	FR4YDpL4rHNFVmMo/+/tPLUprNvyw0C98FH4t77PiAEWu3rVl8X8NfKHHJ/mlfAU
	7pFYhznenI4CZ99u9bxXugs8PA8ZYNn23QGkxrjRNjZmqIUSFgh6KbT7j8tlfwY+
	Y49lMsOw2M0qg6OaAUZ4S9iMrYgpNpmfYwRjsN39VHFfUhnV+PAtURaLUkg2Zen4
	C8y/qKSpsNipSQPjOw+w7dzogITG1YwCa4mFXJ3TbrZp2aKlzPR5v4IOfCmULaGm
	WUvU5Ua6HXkxvCpcbuuO5qh2a+ZBOiHvphZn9Ds7QdF3+BUw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554aa3e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:16:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8291230235so5554334a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778764600; x=1779369400; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSrY1vYdLTiLQUIIayjkcAEoHn9Qam7mz3CuMYOBslo=;
        b=QtW4/rleex2nkQ6SM2AXOTMi64fnyBeNgW53MbY6ajVfF3Qw10J1DZDx79YiQNIjw4
         6GkLb9j4ydeLRI9Wh5hrrKCdN25i0W2Kx5TSn0wRgAgVdkmE9P9M2HuF+3Okyh7mw6rc
         +Xor/G5JF3fnFng2Wnt+j+V+KPAzn6z6febEkpnBTq7Zsi9kZZP93I5lYzgS1LLW7LFD
         XmtPLbXIHiGpFvkVIMAR4GYfFqHFTeb9I/0g057ChWiVHbu1FUKayp8BhAmdM4PtVoaS
         eGhYfHFkWn7uJP0zglR7pC94WPzBTmJCQpbA+Ma/DBNqfsLHx27B6fC9iWH1eQEHg79F
         mEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764600; x=1779369400;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSrY1vYdLTiLQUIIayjkcAEoHn9Qam7mz3CuMYOBslo=;
        b=AWQhpX+J+L96ybS6qsSD6DZRJan5dcWeJE4k2RS8wYTmYWJdGB/dShFza+ldBvs+JW
         ukJcL7l12S/eH13vuItYOPdFRpSDxeA1hOR718xmmYcM7DsJgqfrxEa7MPCSywbbeCvg
         I6du7TPyX8ZwsXp1Of/BhtLz7jpY1b6neetRIVbrNVlhhX63j6Hoh118BgKrxaeCjQYL
         TTUdGEjt3vL8nR2RJ3uP96Hu++6GjirvksMhVV1le7ZVtn21qHo4h2A+2qSljc7GdIqn
         7umdoXnrUpZgeqr+CyOwFEgZ0+tVrtwijphRC6rwsKvjRaIgGyHi+oal+ZQ5zKQpbJIr
         /N7Q==
X-Gm-Message-State: AOJu0YwKM1sEZqucwJQD9Vipn2BfwdDz7pDO4rac04YF9F+Xeh5OR+7I
	soqFc3riEg09mrzpTGEJxMuTSh/WFySSMu7k/nK5gs+9BnsYJ3FHnZaEdosrWuucew2tLfKQdIs
	0V/Lzi0/lPbWzMCUJkl4xutXy/WCt8JCa/e7MLYJ+CQZZUWz8YNlgsqriRHkIQorfim2RnBCZGM
	jj
X-Gm-Gg: Acq92OFRX8ey6ZAzhZ1NKY/rq9UvxaAop6/yBDIBzQw+4RemFp014ll+69VGnRf5/Jk
	OAwWxVCNW5iur/mPgWuGZZR8f4zZYKsi2sss/H5FlNFadQSQvfEkb42kXgidvLEEc3yKD6l5t0v
	8cJ+kjjZTP/MJaOOfi6jloSx2aEXbFhqtlKoVfWkA5AI2KK9LlgHh2LQ5mwgK2HSaxFXkfV4k4b
	LMUowIENAtYUdXcIuGFN11fK8QrVJrCMYyQvcbz63hY/YpvTfFYJnWNhZofh+wBGXQcrk8MxrNa
	3vTSrHu9YDFufs7Hl64tvOSoODtPudzN4q2TuK6MSPa7fuudfAdoxTeMfO4uM14MDx/Fpy1+CxO
	6O53sbrmDwwFZRbKJG0Xn6w6BrT9oil8l4nDpXNu6vsA8hVFcIdhHfoo=
X-Received: by 2002:a05:6a00:8e09:b0:82f:aae5:c7a6 with SMTP id d2e1a72fcca58-83f042c3b5bmr8052746b3a.43.1778764599933;
        Thu, 14 May 2026 06:16:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:8e09:b0:82f:aae5:c7a6 with SMTP id d2e1a72fcca58-83f042c3b5bmr8052683b3a.43.1778764599429;
        Thu, 14 May 2026 06:16:39 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm2666656b3a.43.2026.05.14.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:16:38 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for rng on shikra
Date: Thu, 14 May 2026 18:46:23 +0530
Message-Id: <20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfLBWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MT3eKMzOyixPiivHTd5FQLcxMDy8S0FCMjJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAKWRhVxuAAAA
X-Change-ID: 20260514-shikra_rng-ce87409afd22
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: ZDUcVnebAMi0ggMgDbuzTzmDV5eoW_4E
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a05cb38 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RhLXBfPnT0iXFB-BVwwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: ZDUcVnebAMi0ggMgDbuzTzmDV5eoW_4E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzMyBTYWx0ZWRfX7e75Ysda+/co
 yFhCJ9mlILj0UDLFYr3uP1mRyMaSkL6dEC2Y5auIKKmsMkMCZyrXE9DHa2MKtMufjhmQVhmteBl
 fW6Ezy146tkwmk55jYJLaMrKraUC+6j+Jj1GFPoTTUAsV7AMlfYiq24MdxPsXRmZtGicG8vUxWU
 LuHK0dNnZJJix3QOtlx7fzwLuoV8t5Dmyj1iE04bAwdWXB/vQLUwXbBMqMUQhFCVNq5VVo1xJPy
 8+f0HX5LwRMT8yt5FR+ziVDA3KZ7jzuvE/ImLga8KR8gmPkNLjot4XwKQzWtYG1M7xW2XYbFuiS
 xUPcHMSiE9gF+lWzTE99SZLCAl9SNAp+7/okbfLuLAItKJyYr11Z/ioxKdJ7wGEptG8JdordtL4
 xfRF69jD8M/h1nzU90DlQKcr+yQtPCJkXVyXaeFzuCkAB3vEaIboewyFWYJHMH6e2QrfpZBeeqP
 4NjbQGFwOKUUvDgALDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140133
X-Rspamd-Queue-Id: 1FB515422EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107598-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The patchseries contain dt-binding and DT changes for enabling rng on
shikra.

This series depends on the following prerequisite patchset:
- https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Tested-on: shikra-iqs-evk

Testing:
- Boot the board and verify qcom_rng driver probe success.
- Validated rngtest utils
- validated against dt_binding and dtbs_check.

Steps followed:
- cat /sys/class/misc/hw_random/rng_available
- echo qcom_hwrng > /sys/class/misc/hw_random/rng_current
- cat /sys/class/misc/hw_random/rng_current
- cat /dev/random | rngtest -c 1000

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      dt-bindings: crypto: qcom,prng: Document Shikra TRNG
      arm64: dts: qcom: shikra: Add TRNG support

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi                    | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 33c8e3305b65a2e757e68b10af521ad54ea051a6
change-id: 20260514-shikra_rng-ce87409afd22

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


