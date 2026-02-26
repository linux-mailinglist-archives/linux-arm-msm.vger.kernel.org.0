Return-Path: <linux-arm-msm+bounces-94220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF8fIIjjn2nCegQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:09:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E018B1A136F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2431F302AD28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 06:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21233806BA;
	Thu, 26 Feb 2026 06:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJUnIWiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/sbj0NQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35A61D5ABA
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772086125; cv=none; b=H0bKvGDw0S6ccxBe6QipXvM93cUkGdFFFrz4IISWDfvVo0v+mbsAYv9LFTLNf48fMsR63ZTEqDPTHMWndEVPuDTKfCC+yfH/gi8Eyd08XhcvJyYgT1GtnmhRidGsmamvYOxV64EG03dOZ6JcXpxiUJ9WySObu+4YFutIWiBI3xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772086125; c=relaxed/simple;
	bh=PN2Pp4Q2bdkQcHqpmay+Cg8ARHsIhW13FHkpNJAcD6A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=md8jKVt2U7Xd0NM0h7ViJ8DVbdgv44b5HFtGS4iX89sdN0HaquZ52TYM8SpnmihBdSaP+Pt4HGxj7xToq+kEoIl3jtHxSQd8UTfgBwv0QE1h3vjHqGiUbywSLWv29TG+VQDKKLlnkZCObEkN547fjItCjQKLBrD1UZGnulPuwCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJUnIWiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/sbj0NQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VRlk576511
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1xZh6f34xa4+0ZKlwbfQfhQnzUZeEIzNF+2
	sNjYiR4E=; b=YJUnIWiVL/9aP53EJ47a5TpFNqqDgJ145i20fNLQFj4E4jx01RQ
	HMCRONEP1TemR4xjN6F7PVR/1kFAafUZSju4x1x55bHbeG2vYadERbEExyJAGWdH
	Fm7tsLueUo+3/U5d/ELjJ02ubGQbkoGSjeo4bJ1Vv7xj/EwW5GEHe7TGiMGq6/tJ
	aNb4WeNG3MMDdtHscmV8gkAVtS1OmAdvMW3eaF1iVlIhxVYmfphxnCVSBtGRtESh
	7k5jmrMGXpsjKpkUM9IQVEOOhGxsyvAu9fC7TfxvWQPVipt3IyEpdwzM6MJS3a7L
	S6al1Wrxs44Daz7pN2QBAQ+y+0R4mKCSrww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350jehv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:08:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so671086a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 22:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772086123; x=1772690923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1xZh6f34xa4+0ZKlwbfQfhQnzUZeEIzNF+2sNjYiR4E=;
        b=T/sbj0NQRsEPcikq3ecQVCYk43xKhEHLNtFnhw2wpz2TqIKZt4V3weRciwEjKkN7tv
         bcgLB8xjCkQKgsKjwcv6NsTN8zwbPnrh+CaeCdNsYnz914MAu/D2Cwbpf1NV25BvJSTi
         thpD4I0ayqMJted2OuU2oMLHz52NPZ83XzwQSb9d1WDmgsGGLGNRpCtQh1uADRDxuB9N
         pkfxR4z7qzT2q8QvqgP0HqgGU9ZWJ8PGPtyTt7ps/ADmrc4ev5UVCBlgAXDg41qlem0w
         h8VbMQRALIASdB5XT194M3isost/HmCxajMDPzBx3vwLNgZ5o2c0sxsf/cM/uKM50Ic1
         +5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772086123; x=1772690923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xZh6f34xa4+0ZKlwbfQfhQnzUZeEIzNF+2sNjYiR4E=;
        b=VWYVOK4OX6wK2e82q7FmY6/wVaBXZyK0tVdu8qQRfVluZwyiS6oxpDbz5pTt9VPQyt
         zPcnxxJGHILk5OTkiyt1tVzZivgFweepZPBJRoz0UpgHV8kFlYkn8ooDFErSBhH2ybEy
         H97mYntfOF8rXnqN+BV3gOTg4MU7o5aZlqrFNRXdtS9JuCPqk+aN2hD7OlMXzqqY0dNC
         rN6Iy4Wm/V4QmwmkLyH1A5Yg8c0FnWBCz8MkHJO1hzxX1SqAhA0Cixt38gMKd0eF/lxH
         zkFmg1BkmpBtdQsAR22FjqIr1XlFade1GU9eCCXBowHo7EazA6ouaA+xjLI6QmGCF3OX
         Sd+w==
X-Gm-Message-State: AOJu0YzR6AoH9MbIlaNkgxbLIjDaB7pIBNIigMj43wZL7EguSmp0Qrr3
	X8I9EWBTQn+UNqv0a1cxGdxwA0qyTayhy+reO2DentCPfI84BsmN3bYtoAskLocQsc56PnG5jUX
	gXAr1ph7eiIyzdlsiMUeDxZw9E+65FTCXMYm4PWMQN4MF+R2LVVADjEhLM3m220D45bQW
X-Gm-Gg: ATEYQzxw4ZtT2JW3nJZqIZRD3Pf5CUwGTai6IL7EpuH7cTVtzNX2H4NtbdIXmQHvRYq
	h/okktkXHfW7Aq1qhT4S6ARoduB95O6mKhU6I5xOZaNASaN8Y2C3ZRAh9g5lYAXLOhVjSbK+Qmm
	jSMZ+8CTAaedmCFAWa1J564hFLHDtXz+Vu6cUr8+0t+xv3ajHJwxvSxT4xT7uzZtbE0LOrNxDH5
	cmd55WPA/zMyMd0aKSHGveokZ6s5/eRHhTk89pJhMGyMRjbOTyR045OQ6Ml/67NVBg8EH816Ax+
	2+SQtlKMMpf5y73PeGrhmXiVa6dysXXnwIbH2z6e2bYfw6uuA9X52pc2KqLNOrqouln9Apd1hyT
	Zh1dZyrXwijjrmDEC3S/5QAQsoVdq490YEa8jW0RLhZPBBs446MSL8nM=
X-Received: by 2002:a17:90b:564f:b0:354:c452:b2c7 with SMTP id 98e67ed59e1d1-3593870f80fmr1391625a91.16.1772086123219;
        Wed, 25 Feb 2026 22:08:43 -0800 (PST)
X-Received: by 2002:a17:90b:564f:b0:354:c452:b2c7 with SMTP id 98e67ed59e1d1-3593870f80fmr1391609a91.16.1772086122713;
        Wed, 25 Feb 2026 22:08:42 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fbc363sm2754421a91.2.2026.02.25.22.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 22:08:42 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Enable tertiary USB controller in OTG mode
Date: Thu, 26 Feb 2026 11:38:32 +0530
Message-Id: <20260226060835.608239-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: V-qU84EYQNb6rH7qQkyEq8wJTc5DlnaW
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=699fe36b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PAEsFWfe2vKCIHFHJysA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1MSBTYWx0ZWRfX47tlJ25bfezS
 AdQH/n5Amq13MOtA9n1ZhiYcVVfHfc68b8T3+YRwXTmEZnf0EjMaR0LDpCwcUyp7irRqhqKbWN4
 DKFQKT5vDROthaR2Jk9c0qU7RmFYTzUUxvrCxRRNC9K0A8cXtP5pbvmpLgZCYSlKQ1tsljchYWd
 PSDEXfA6/k02GzGf72vsEyDfXF+7uTyid5Oz/xq+HnJFxY9PAh4wwmp/wTJ+L+px2+HoiKyl29M
 hA3Nd9R0Y4emMfYoNsG7TQvTYI46F8kUqvBJjt9/PN01D6GkWDMqJn8Jcn3pKObagSr0m8K+J0a
 KqBA5WmBQnneobiVvt5E8w5nL7CU4DGylP1VdCSW94bc8loyv8hw/sUfjN36183DPkJm0sTzLP+
 OKCBu4FZcm2CbX/sVnSZrpWHRrw6DeLJjzrcVUo/Bng4GEqzlLmJR6FJLCMy/fxVWLq6F6YoAbL
 jTQGb8f2dhuEfm7QHAw==
X-Proofpoint-ORIG-GUID: V-qU84EYQNb6rH7qQkyEq8wJTc5DlnaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94220-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E018B1A136F
X-Rspamd-Action: no action

Enable tertiary USB controller in OTG mode on lemans EVK platform.

Changes in v4:
Minor renaming of regulator.

Changes in v3:
Separate patches for lemans and lemans-evk.
Minor formatting changes.

Changes in v2:
Added interrupts for all expanders.
Minor formatting changes.

Link to v3:
https://lore.kernel.org/all/20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com/


Swati Agarwal (3):
  arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for
    Lemans EVK
  arm64: dts: qcom: lemans: Add role-switch support and HS endpoint for
    tertiary USB controller
  arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 96 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++
 2 files changed, 103 insertions(+)

-- 
2.34.1


