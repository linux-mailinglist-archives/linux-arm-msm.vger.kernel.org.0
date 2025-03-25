Return-Path: <linux-arm-msm+bounces-52455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F40A70043
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 14:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5645188939A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 13:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3501D267B71;
	Tue, 25 Mar 2025 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P64RQMdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B5125A627
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742905845; cv=none; b=FhDGJ3SmT9zKA4F3hR4zlQsFOYBDdvs6WGdNXnMdULQyflJSlAfAY8cXm2lzBNwcwwTnHKl1QHFnX4/qM7N6hfm9ZJpDKIeISTRJOEJ5gUfMVMnCocaCiM0OdLQwlU60S0+KjI1P1zSeLQkdfTdOhrjOP9yHxcK5XxYuJeKPbco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742905845; c=relaxed/simple;
	bh=/HrP3iXRFnTbX0yCFuBkoG+qDDgKxJzYpbb3ZXru4sk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NbaCAHhk6pHMF5NiKpGX9bKaWSgFzoPGx7Y+z7mYiOLZNi2Z+qnfbZ07gANKQg3Tmjs4LbSq/w0H4iDmhHOmPsnp48K/cAY0+VlNRFzDizOtIPIkh71XLyMFqojZku6aMvhHqBC4DUBDs+UxZ7X6kOCKuwBK0N9g321JdXd8GEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P64RQMdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vdC7028572
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3aowXoeM2vXkzmO5GPnuAiNRRKtfTBOA+fe
	icqOTZfc=; b=P64RQMdUV1OdtXRckW8K7Ci7BVM4zx/+C/i3f73dxRdvVSaSlPk
	IV9cACgUCqjZw9LwclonQoyFHSnc7iABcKWP+A6djG4Q9zgqb5CKc3A1v+Hu1Zvg
	f1CWA5rt3hT4sspuG9VSj0ZQvP/Oh/HirCPrp7rCAJp4cWqIXAVK6QaBwGWcg3rl
	Ipi93tWLwyDx2Vr/0yn0s0FuBY7r9/QpYhvYcJIQdS66tfLHxeGrQcNt0SgC2fn3
	DA0jROHjLtgXasN4k1KT2lLmkTRSdraWN0GFeJraIlDIpI4W5QT5WfYmABJwLVkj
	BM6mE8ybaJWmjOUewI5SVxe3pG65YKjzlGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hnyjfmd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 12:30:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2265a09dbfcso146986815ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 05:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742905826; x=1743510626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aowXoeM2vXkzmO5GPnuAiNRRKtfTBOA+feicqOTZfc=;
        b=DyoRN9qb2l8mY/hwTpQ/5s8ZhAYGxZM+zeENc4kH08JmfZv1LPYBXaWsFkVa64pAel
         j7oqQ0Q/b+FHhd2fH2ztysX2XuTC/WhOPzpyqTRCejfo9GcUMp15lnqHRH/Rz7kVIbMT
         F7xJscp6QN3ppq2YGSqTNSn5BzhaSdeaHLdk4YtnBDFElAi7Yxmw+yy9oa02/X9D2r9I
         FAfTEvs7cQQFTEbcwhDwgf48ofljwluw5E3zJqucpTG7jmBS7BTrlCmctrDFiNr1f71l
         uKjt4H4ati8Wv2ok1e9puMs8oPebl8QlN+Omv9AFZHxV/YRdC/ET8m/8KhdjMFO9HiPX
         m25w==
X-Forwarded-Encrypted: i=1; AJvYcCWZH9pQDDj4nnK9QPE7pVlrQFg8m/LYSlRu+vSi1jnRxWGO8WWU7JBgqmlgftXPjxjwQD28FFhPB7ENrEgG@vger.kernel.org
X-Gm-Message-State: AOJu0YznvvacCqbmSdePaK8pZbiohVQORBj1oQ7nE4wmkiL4RrvDR35M
	CkrGPmcieEhMAJkrR0Sy40nAyFfP1nHCrAWaEYpupwhrlTK5jvV9zgLbklIXxsjYXDoJ3ITLZGT
	A7ndPDH/1AamW5YW6Edb089OmUuYA21uZPzWlViei3Fh4hVlBBOHdXYDgyH728QLQ
X-Gm-Gg: ASbGncsfdtduIH3TcANZS2L6c2guUpwKTcjSTj64jgsnfnqSQe35ZHSVRhOvSu2Q7t7
	qvf4Ci/SZpkiQAvT8vnxRHne1SqQyLGZ0imtljFWYUg7nkxCqkrjsEMWTyYzkNAuQzVFX8WXKV7
	IwUM0S/UqcePi8tl3FNTcCwyhvNAeZWqfcp8OvR83d1MOOMzy+8mSGGkKfNex1xYK6KNWvZTgmk
	vSJxsWVocr8a1wZCn+MuFFrVntANngPp8VMWOwoXYY0ga0l2y95/uAKZL/r4YgBmOnMBFjSZyAz
	ofoxMLP3stFrSoL7uwES9rNrnUX+W3cfDtDd+PzFIN4j
X-Received: by 2002:a05:6a00:b84:b0:736:5b85:a911 with SMTP id d2e1a72fcca58-7390598e30cmr32350955b3a.8.1742905826298;
        Tue, 25 Mar 2025 05:30:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUaP/3gTLNur6saCYHGHl+3SX9tZjQxxQncUBNKoOTE3PO3CfIu3oe05QxFaw8RHX2kA0xGA==
X-Received: by 2002:a05:6a00:b84:b0:736:5b85:a911 with SMTP id d2e1a72fcca58-7390598e30cmr32350900b3a.8.1742905825712;
        Tue, 25 Mar 2025 05:30:25 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e4b6sm9987391b3a.180.2025.03.25.05.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 05:30:25 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 0/5] Add snps,dis_u3_susphy_quirk for some QC targets
Date: Tue, 25 Mar 2025 18:00:14 +0530
Message-Id: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ybu95xRf c=1 sm=1 tr=0 ts=67e2a1f2 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=1HEuz3GWIXJSLhVaKDMA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Fu41vYAm64XF-nr-LsAQn5pbOpvQP0QF
X-Proofpoint-ORIG-GUID: Fu41vYAm64XF-nr-LsAQn5pbOpvQP0QF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_05,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=672 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250088

During device mode initialization on certain QC targets, before the
runstop bit is set, sometimes it's observed that the GEVNTADR{LO/HI}
register write fails. As a result, GEVTADDR registers are still 0x0.
Upon setting runstop bit, DWC3 controller attempts to write the new
events to address 0x0, causing an SMMU fault and system crash. More
info about the crash at [1].

This was initially observed on SM8450 and later reported on few
other targets as well. As suggested by Qualcomm HW team, clearing
the GUSB3PIPECTL.SUSPHY bit resolves the issue by preventing register
write failures. Address this by setting the snps,dis_u3_susphy_quirk
to keep the GUSB3PIPECTL.SUSPHY bit cleared. This change was tested
on multiple targets (SM8350, SM8450 QCS615 etc.) for over an year
and hasn't exhibited any side effects.

[1]: https://lore.kernel.org/all/fa94cbc9-e637-ba9b-8ec8-67c6955eca98@quicinc.com/

Prashanth K (3):
  arm64: dts: qcom: sm8150: Add snps,dis_u3_susphy_quirk
  arm64: dts: qcom: sm8350: Add snps,dis_u3_susphy_quirk
  arm64: dts: qcom: sm8450: Add snps,dis_u3_susphy_quirk

Pratham Pratap (2):
  arm64: dts: qcom: qcs615: Add snps,dis_u3_susphy_quirk
  arm64: dts: qcom: qdu1000: Add snps,dis_u3_susphy_quirk

 arch/arm64/boot/dts/qcom/qcs615.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/sm8450.dtsi  | 1 +
 5 files changed, 8 insertions(+)

-- 
2.25.1


