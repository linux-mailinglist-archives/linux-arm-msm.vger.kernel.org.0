Return-Path: <linux-arm-msm+bounces-76152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D09BC0354
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 07:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 55F5B4E6C7F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 05:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFF321D3EC;
	Tue,  7 Oct 2025 05:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zprfjm3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFBB219A89
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 05:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759815904; cv=none; b=QD0zPyJIIwMjYDmb3yEWcNs1ZS8DQ6QIziNLZUEz3RRe1TZKWlxvJzKo8nm47V5Ofb+SSuynuBWL7ROpjFdPkJH/6qcosE1z72/qQq4C+TmtHXd3P5QOK3nz1x6F5Aiupvc46Tqm+/yMfome75jQ9QgAg3EPH4WUJgG7C/0OmXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759815904; c=relaxed/simple;
	bh=lpVzjcBwOXM4SN23tt4fC4BA7Luy5Tc4dyql00/KvbU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qm3AM7ohJL0V5FlKNV1bcsLRxoognWJLjur8Mt7fuOOc+9qIXlloolj4rV3eKBzWBMRvNd/Uzl02OVrndzDpruvfsWM6dNs5WTlc2A/1mK6nZ+amJPez1ZU7++sCV06t5qocAcCP3UWjHfR4NX5RGW2rTbhANjNPorEYwFUMIK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zprfjm3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972jBbE005359
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 05:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KIJxcpMYEnmG9XD1E/vZXymkquIdcw8T6Th
	rEVdfbdM=; b=Zprfjm3El4N+LzprHmpDA31d9ZXA+SJfAUUFr4zpz/RHl93B4Xt
	pko78uyV6E/E6izruKojrzlvmQEqPXSTIa42gFE2Nqm3pJJeX0g6PksGcHE+s+c6
	lIu6ncdY8kkuCqsqVg5fIAWbbaAGXMQIV5ICiu3dBDyPvVCn5XwDHsEwV1tu6YAu
	7U87cZDudEjLg99hmfp38O2fKrl64s45ZUQK6DgOquY7+vI9JMpNVfkRU4qN9YhC
	Zk4PqYgflilJzq0rgPoTzxGsrmO6JdMf3kAWNQFUTg3RxU/Pp80N5ggzRuXoX3oh
	EnzLnNtc8ZBTSb7fnMbBWIOuNmN/qmr317A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu65dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 05:45:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3383d1ce439so1880473a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 22:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759815899; x=1760420699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIJxcpMYEnmG9XD1E/vZXymkquIdcw8T6ThrEVdfbdM=;
        b=uvQwACEcEK7ebJxv7aAZSE3oy/A1zVkkrQr7hWzAe/dsaMgQbtjO1eelzYrI3p82F6
         PQPrV2fQVvATwOKBLZvoaKPaX8G0qFkdr8SqsICobOWoY1pSqB0qyv9PHuSDKVauqN7H
         wZWTI7J3nWq8euDaKrVPEmpGCuG9sPEgxG7ofWiupyLsVrKSp/niDs9jLSrz9UzLBAqO
         JM8bvPUYtYk1oUllePEN+75g+jyblnyTml6U/iwJNBY1qeGf3bdkXGEkgbCFmE405g6j
         huYG1NiR0hada+cEghUmYr90y829xjCHueZ+piY9CCa+4sgYzrwvADIqpsoKxVQcX1QL
         9wPg==
X-Forwarded-Encrypted: i=1; AJvYcCWjOu12LX8+tmL1pAO3efer7CflJkDquODFCwDfnCchWyfFxgU+AvP/y7b7snPmAeJL570vW4Yots+b3T3j@vger.kernel.org
X-Gm-Message-State: AOJu0YyZUUpWGG3pAJHot8NIfdaS7Re/Ws9Sw5CJqsRkhzECqiNEU6wk
	//5SeBFaSJYsrVg59/RcOJEihYSyEdWNEAnaCX4LVYFjJiCdFPaVwCH7kR45shxFP9FO6/fyM97
	bIg+ZCnwAgY2rSRmLJKRN3kkQbcc/rypSmwJGFJl/4UBBnJnsgVRF3Ekr0ybcerJ2oyA=
X-Gm-Gg: ASbGncvm+5T2OxSAE3RwOcN8dfkm+1UC8KDEOks330UhF0oSukuLUUH+qBFU8NmCo8z
	AxTMQ7S9tdpkWjUtxNgKDmztCC8Y/njFGOGa9vGzQ58HadP4yP02VHMrn5CrQVDa+eVmy3/i8UP
	3HZFDZvD5k1coo0zYCxNwWPg9t7ooQGeXo06hxYpaCB2sVDG+9QnUhtV0eUlwrxKAjGTIwrGg9F
	9rkzS9MKTGZBE4PyeZvpaggizUmEUws0rjYLJV93cC9BPAA84I3kx6zXjj53xKtnasZGRI1t725
	F5Pmz01gpJlJtUSHTociWntQsGsSp//2s7vr07g1ZTwdGR+lX+YXJrSk/kpqr9yKfibtyN4defD
	+
X-Received: by 2002:a17:90b:3b86:b0:330:7fd8:9b05 with SMTP id 98e67ed59e1d1-339c27a2520mr9699638a91.3.1759815898921;
        Mon, 06 Oct 2025 22:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErGc+yIrFJKtSY7vYdT2RQdgafbYIfgt1qp3puRvmqRiLtMmkJVl+tUt+GE7S4w+S4kSKxag==
X-Received: by 2002:a17:90b:3b86:b0:330:7fd8:9b05 with SMTP id 98e67ed59e1d1-339c27a2520mr9699627a91.3.1759815898418;
        Mon, 06 Oct 2025 22:44:58 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339ee976b81sm502624a91.6.2025.10.06.22.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 22:44:57 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V1 0/3] Add SD Card support for sm8750 SoC and boards
Date: Tue,  7 Oct 2025 11:14:42 +0530
Message-Id: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5bAEVjOTiumPjtXEbjSeK4MMVZqHPqJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX8fDmEUXg/QWm
 GFE6x8/v5tgWDxq0u2eVtOMF9RXwHnGbciPONT6M07zpVPcIGlpw4hZHo+enSqywBd/s2kAsU1g
 3eNR6ZvHP6xJ4zBfXg6XHLkleRlEQILnM7RfYlZVzySa26xLJK/lgjNea82JGiljczgM3O/UAIs
 7ih7pocBgw/o6XjhacZUryonZ75mw488pV+RxqPWc1y9skZ5OWSJ2KPpEWcjpe/lPhtlFYhWfO1
 gk2Z4+Saj/JNaeDbo/pvBiPWwQY3RvUt6tN3WYFKcPW0M0QkV/mdypQ87KTRVby4RjoBhFKJXxf
 2qQdXwDRZ10UTaQJJeOWr6fMNCr6PZN5Jq95j+NUwqE3zQehArUR7j/tDbFzC45zocQ6y6ZKZ+d
 m8eSutttcIQjjFN7W9GBg2BdoiU9fA==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e4a8dc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=F0tEe3Y5rRK-XVa5dUkA:9 a=zgiPjhLxNE0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 5bAEVjOTiumPjtXEbjSeK4MMVZqHPqJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

Add SD Card support for sm8750 SoC, including MTP and QRD boards.

Sarthak Garg (3):
  dt-bindings: mmc: sdhci-msm: Add sm8750 compatible
  arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
  arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 mtp and qrd board

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |  1 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts       | 15 +++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts       | 16 +++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 63 +++++++++++++++++++
 4 files changed, 95 insertions(+)

-- 
2.34.1


