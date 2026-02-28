Return-Path: <linux-arm-msm+bounces-94586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKd+A53fomkV7gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:29:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A6B1C2F34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D484830733A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 12:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6771443D4F3;
	Sat, 28 Feb 2026 12:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mX3so80g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRp0oV4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABCE392811
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772281752; cv=none; b=DDesvvIt/ox3ZRDTFmwHMYod8JmYKo7eWCqm6I3q9DT2cqaR5C/WGEI+Gl1NKnHPbKcVG4nBq9EB/Cm0lmReqYMn+k0wKqQgPdVB32uGk6BUDO1Q8ixD27Vpc4z8Rx9mC1l6QAXLl7lJQaFL+khc5IB8oHvi7SZHxXtYYBUjcPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772281752; c=relaxed/simple;
	bh=LQqeUUI4eIoxI+wnuzm7y+FRODsvxOuD4mSpp8+hpUg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gDohz8UHqTP2e84VpYkqfC9i/tVtZ2v2BUvSO1Pv5VN8PhuTm69xCc9VwYpS+d5oQfTy2qLQhoji9qCVRrOWcGk9Ync4ghG/q7CgsGv8uXuZ2lq+flh+x7WQSfY2wsfnJujcQYofbD8EohrPEJUvQjhdc3GKDRTR9rcqVHRKRR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mX3so80g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRp0oV4g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S90U7U2002774
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5NYtt9kmT+nvQOth6ffJUP
	TCPJ+FKctS8emJa4pNm5I=; b=mX3so80gshzRtLMyXeYrmQKVYwJL9zIxcHJ/iA
	DITjYUqJ1bvXhjIqiwCVhletHef7WIfWmmj+FejGlWoNbRc23ZQTZbt5CQubU0Gp
	ddZoY6D89QhZBhMhCZL0pV162VE1c0eYyjPjtSd16CxgIhdbR7F4GbIzSq7q9UX/
	ypmqzl9gWdrmAs1m+czcDy6BF0FO0jUs0DqM708YXz1FgsDlX7lBHHg34Peyzzkh
	gPB4H9ktoe/uE2WjCezkim+vaYebJzWG0/oVX+gKq8iBdDDhiFfOwSez0KHZFzoe
	b3w+WeUKo4ZKVDUeTJybViq64K/sc/iUlyuDtaGTkLJHq7Ew==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg70stn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8273855525aso2524612b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 04:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772281748; x=1772886548; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NYtt9kmT+nvQOth6ffJUPTCPJ+FKctS8emJa4pNm5I=;
        b=YRp0oV4gyO1YkpAceIdmZtl2U1NlrzKElYMDV2bw1FG4u7D21Apuzhv5J2Fp7/G4jz
         oT/P5RcsaRFupibaainTdmhdIsqDZ/R82u0qNvOsO+wFH/WIH/mysrrt4gMZiAq2wjP/
         uv9Gp8SyHUfyaev/Ie3WQ/HdhPrTr+DYgF1A7K5UBGr0fdKb8ssAbad/VWZfxlyf7vxG
         l1mxwiY3ZGGbAiz/VzJR/DULfJPal0GOqfQ/wzXb6DdTSlDRusNvaWDF859f32DiW1d7
         qAwXkQaK3kS7Yy4c9KbuLuN3EMrRTZRc4kgHndkYwUANs0qiVOYLeyHLnrZibE9m1ZiU
         C8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772281748; x=1772886548;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NYtt9kmT+nvQOth6ffJUPTCPJ+FKctS8emJa4pNm5I=;
        b=FB96gw416KCXj0/5nuwmps7viGMhBxKWQ6wBA09lxgx03RecUmzslgl+fu2DjEKo4R
         YR4PTplm7okAR5E+UInOYe8D8q269nTbQzsGDPtHBJ67sXke0zM6tV/DF9FET5liHzY7
         6ysf1GkofvlR+PEyZitbmRmRBweQth5oH/q+EHdGKHsduaN6VvrZ/Oz9wwAU/7AYD0fG
         I/JN2V/4Fq7FHt0kK4NrPBNrcFfIHoGAqkkoqhRkiWi929j5dumX0WODOmhGHI/POmHT
         3JZI/YmeQNLFDTfpZDqMxiD4GsZD6SBjGeLU/OjbCXlNzmmXc6CIzNdV06ztXx/cfxjP
         tjsw==
X-Gm-Message-State: AOJu0Yytg7nr4uZC9xKotIVjz4IDHKKZ2RctJ4KIUGSYSp8lVblAWyoY
	0iS6oYlVTqtxKON3GJCUIRl3UXLjUERqfRF35kA3xbVxfnFDZOXO+bG6d+rnwPI3e2Vn+YW6nkI
	HzVk42S8neCUqrj53OieEBAXoyEbbeoQyAjcVQJhuj/eOnrm9EXFiKYgYvgglx+Wgmuhx
X-Gm-Gg: ATEYQzyDmYPB9QDz/P2RlgHUy9ACpth3gfp+EYzNSDuS1niV0E9ppluToKi9UETB03k
	INlmqpQaSGTnYMvFwwSeae4mequ4E2BMN2J129uvs7OsaqSDSOCV32UuaLA2ArsFaHjvi42wFCt
	fqqNn3Ldzau5DHtdNJ2+Uia4U6pNoq58/OukPfzf5gwVXjX+66nCRnUlZWAh5QrTxw9aQUXtA34
	3gUPJagOTtOrZkE8Kic1rrAwkuyB4MJhCVXq8vtUseMSqqjbO+gkpmv/Jn9McGMEjK4bvS3uB/s
	qEbrgnGrM6kyDZlJu/MK1cpksNrEe05ZsztWdxwl8gTUhsdMA2hAQTglNfCgSwDRtc7s6cgbfyL
	a7b0Ro6+2JZvnshHYNa9K2XGLEuZQvlZNhRgP33qj4A9fTvsrplxMThLAAMoHiopnGJKT7qwmFD
	0orL4TivTB5PZHjbTfrP46s/EhIpOwDhFEf3ITAtvwq7612AxgwPc3xhMN
X-Received: by 2002:a05:6a00:4fd2:b0:823:1bc7:ffd8 with SMTP id d2e1a72fcca58-8274daf6851mr4783219b3a.9.1772281748104;
        Sat, 28 Feb 2026 04:29:08 -0800 (PST)
X-Received: by 2002:a05:6a00:4fd2:b0:823:1bc7:ffd8 with SMTP id d2e1a72fcca58-8274daf6851mr4783193b3a.9.1772281747432;
        Sat, 28 Feb 2026 04:29:07 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4e10csm8130048b3a.1.2026.02.28.04.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 04:29:07 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v9 0/5] Add support to read the watchdog bootstatus from
 IMEM
Date: Sat, 28 Feb 2026 17:58:59 +0530
Message-Id: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvfomkC/3XNQQ6CMBAF0KuYri1pi+2AK+9hjCllkCZCtUXUE
 O5uy0YXuPnJn+S/mUhAbzGQ/WYiHkcbrOtjKbcbYlrdX5DaOnYimJBMcUaf9XD2GDClDq6noKV
 uEJhgIEmc3Tw29rWQx1PsrQ2D8+/lw6jSNWGK8XwFGxVldMdBV1CUpi7h4ELI7g99Na7rshgkm
 SN8HSHkigPRUbKWFWCOHKs/TvHrqBWniA7j3OS6MJVqmhVnnucPuT5k+EcBAAA=
X-Change-ID: 20250610-wdt_reset_reason-7a5afe702075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772281742; l=3842;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=LQqeUUI4eIoxI+wnuzm7y+FRODsvxOuD4mSpp8+hpUg=;
 b=iLQkzfZNhnx7G3in00XjisfXMH944sWs3n3AXSsp8mTsfrJYmC4uZUFOQWNeJXOAuNDDt5jFi
 UsrZXMU09TEBYOA8Ah/qS24fY6TSO3jpZWt96rzNDQ6mdHTICYyZQyr
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: weIMT1ylxNCeUCoLk6WWt3d7zC7n6ULK
X-Proofpoint-GUID: weIMT1ylxNCeUCoLk6WWt3d7zC7n6ULK
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a2df95 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3xu3cfvniY9m67ySxx8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDExNSBTYWx0ZWRfX76JkVRxHY8eq
 Ry2PfhNQBv15KJPuUWtFadhwbid7wtDOy0yGBdd83vRkZ6QpuyR5z1vfn0QZev1T6kbx/ATm2aw
 y+Ir+CqopoHr7zSwSKplt4wEoPlVp0JvZozdWMxCNLoIjU8OrS/RMOudyPWDh7gz5qKkyF56huc
 /3+gAFu8D5etXK6+od9g58CulTjtbhoy/0wF/BkxDzxRkVCjaIg8jnSm9cyQ+ltzPM5/AN56uA1
 tgLAZmi9kQEdFUyqwW8usBzLq6DhbACesjBbThi9n60/NlDZeaZAkYUcG8A0YdAEp0r2dVQhgq+
 hOHCtM+g0+9Jyl4xBbvvbrhmw32SduMbJ+cnhKn82rgoUxGTDO74JZ2XE8y7XiZLET5HCx+qKk/
 VGlCv0SmChgxv6Lu7DWEnKGigBGacLh5xfiS5BRQsDXNVK/8GhnmvSgq3jHc5JTauXHEHDR2W5V
 Y1rQmyYG/sqaMfqP0og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94586-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1A6B1C2F34
X-Rspamd-Action: no action

In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat
/sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v9:
- Picked up the R-b tag for 1/5
- In 4/5, if fetching the boot status failed, just log the error instead
  of exiting the probe
- Link to v8: https://lore.kernel.org/r/20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com

Changes in v8:
- Collected the tags
- Updated the commit msg with reasoning in 1/5
- Updated the comment in 4/5
- Link to v7: https://lore.kernel.org/r/20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com

Changes in v7:
- Collected the tags
- Added the reference link in 1/5
- Added the flag 'no-memory-wc' in 2/5
- Link to v6: https://lore.kernel.org/r/20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com

Changes in v6:
- Moved the IMEM compatible from qcom,imem to sram binding
- Updated the 'sram' property in watchdog binding to point to SRAM
  region and update the watchdog driver accordingly
- Dropped the Konrad's R-b tag in 2/5

Changes in v5:
- Rename property 'qcom,imem' to 'sram'
- Use dev_err_probe instead of dev_err
- Link to v4:
  https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com/

Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the
  DT (Konrad)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com/

Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

---
Kathiravan Thirumoorthy (5):
      dt-bindings: sram: describe the IPQ5424 IMEM as mmio-sram
      arm64: dts: qcom: ipq5424: Add the IMEM node
      dt-bindings: watchdog: qcom-wdt: Document sram property
      watchdog: qcom: add support to get the bootstatus from IMEM
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 -
 Documentation/devicetree/bindings/sram/sram.yaml   |  1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |  6 ++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 16 +++++++++
 drivers/watchdog/qcom-wdt.c                        | 42 ++++++++++++++++++++--
 5 files changed, 63 insertions(+), 3 deletions(-)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


