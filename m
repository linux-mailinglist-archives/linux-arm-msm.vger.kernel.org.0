Return-Path: <linux-arm-msm+bounces-92013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ8WJ7PGhWnAGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:47:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B1FCC6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAC4C30398AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 10:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2076366559;
	Fri,  6 Feb 2026 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EAKVAQgQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCTsYWmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7630BF4F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770374812; cv=none; b=Zj6/A0sNMYL0P/fHkPW13EbqUFgMOQfJwn1eebgEjb3va8u89hUfOu2MaDXiVeUvqP+78n5Np6DfUHEMNcBbSs+WGtZrnt52mYxbx9JdcjVcYAuV52oREycnBQuh73MieHxd5UP+oj4LmMhBcX1Qw6GwA3gXz4CWg1b4fFY23LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770374812; c=relaxed/simple;
	bh=Cbf64mzzPEuG0k8eQLoj1J9/kH8qdLgOuoX+21Wwx8c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ItkI3ao3bE8/v+9HvDn/BxGZKsObjlGwfVJV44juzoVdWJWeF7t6i7C7RGnVX4k/dj8hFTBOe9+8LiVdBi3+w2eJdE2z1IsBBC5JaDBiv5hrlwIdwQLEPZvlK2l0HgwITK4Y1RBpRn6fY+A5p8it4cEhvKjWBYV0O3L5LGDr828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EAKVAQgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCTsYWmU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6169QOfw2228023
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 10:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9r/eMOQK9nTT1F6zLZ106lu0lf4Wx/cgfXM
	m44WebkI=; b=EAKVAQgQR0rK1bPs/5VNsJFJ/GN7QNF2AK/FxkqNFzUmz3I9jD/
	QGBtMM2jm8LWtBSXEnYlxH/9b3a/IaIw6r1/6/kyHAVhq8w1TjZh4Kc+wIng1D/l
	XgDbMyfadNSe6gz8LjrqpHso/MukxW33Mr+LUwZt9nYMj8ZnGusF6zuKL7qjMlW/
	H5HM9xCtSbe+Ut41DNFwp44zl6APhsBjolkb4ZK49REYd8sApOFgqwrNAbQAY2HV
	wJsyXvRNQTHVnZRS5jMo35RvRxNA0KhTG9E3I1VUYucFJCL7V58o/AwLo0zYr5LY
	dFtu/PwVxseXLNdP7sxNKtX1vzgqrZ8xe4g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5dnyg87r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 10:46:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3545cc84ab1so3998013a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 02:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770374810; x=1770979610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9r/eMOQK9nTT1F6zLZ106lu0lf4Wx/cgfXMm44WebkI=;
        b=fCTsYWmUbtXIYXlanmStpd6GiSW2eA+Xn1wen6hsTpn8aZwHqh0c/O2hKj7rvL/xK0
         1v/SnGWObYD5Nih2N4iglpBBelr9v/7VuQrQjSPSCRNDUbdnRUEYEhTG4QlZmr3PZY0B
         UD0oEeGXw7q5eDxdeQjFcUBnxyu7t/g/72kqHT6j8kXVMvPm5nwz7Sff41SdiFskLnI1
         NF5zTWXCx65R0/DhpSJYQ+Vq0tgFU/YXVqJGAL+2k5Wsr2velL6mfY0BALdT5JCmOPpl
         fnz4ZZlVRFPDWS3TnExvYs2sRo/sgcY5a6mTY+26cYoN+jS1FDfOyAthWrAcCDH8Vjw0
         F7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374810; x=1770979610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r/eMOQK9nTT1F6zLZ106lu0lf4Wx/cgfXMm44WebkI=;
        b=AOh4N/p5n+v90Rtx9Qkd1bwt/mYls4IHKfL3gQQQ45x/ta3oYTOUPr8MsCwe7bUfLs
         TVVHhf89OaNP+yvtgQw8gYzXJZa2lhaHRNcpeCPT2cQ72vG8u4Tj0flrB3L2fu0IU1zE
         H1YtFTdOn2PKIIUr0mTGr0QaqzHBeh5j4ILg+gTnjwUncGkilBMQKgzYPnR5riYc2rK7
         juwdS0GtCpOCXWPmulUe6PY0O+CZ7Qdytn5dB/JC5D8g+/Tbs7iBlxYhigwcI1RvFGcS
         CDvVCraLs4ezpNGLXdbbKaDSDeXrow82F6Za4LQcEV6NeZWf+aNZYg1+/aCawatqlMOe
         0p/Q==
X-Gm-Message-State: AOJu0Yz1vGC0hrg2o2CD81zn9yfqwH96IZQbzLOf6d3ATCv2iUQ1mzCb
	C9hyLajhtRIL9Eu2bJva2Cb39nirq6GNLAyFcTpV+5k5Ha2o0uXUBhX+8jC7R5SBAaC3h7xqBlb
	ffZB9FOa7ikEmwHxWj5v1yowQgCmSeMl3G8m/xpz8JtNQ5C776W+MDFKIsHFjhJPtPOwI
X-Gm-Gg: AZuq6aLrkTsGubql5b19NvQolaU3oU8MMHlB36i9XAUxb64EknIhWW6ZjvuHkQl8VrY
	dHx1Kcug54v0K56/DzViYph42feFLTC4srDMYkrH2EYJ/cEQFSKXLvHBt4/7EvSx/qV6Bku31pR
	QBn/cbWgSWzFgPvME81+7Yz9rTtEct2Fcn6AcQgUAF/K9bSLEQ8VVCxn1J2cfaTYBfg5uZ48Cq5
	LdrD6cePNJchAl16Gjq72dQ7gFQpb+h4CaTveuCgI64pyp1ggAboKUctIVpo6AA6LcwzcZbr2Xq
	viZcFO4XU+F2skt1GFaNh+b7+7/Ki0R/K/UqFSXLccjxBAek+ACGd6MdHP4evxhaTbBjeCw+FTR
	PvkCVsQPQfl/BeNL8gynU9EPd098+k1MHARLpkX/bVIE=
X-Received: by 2002:a17:90b:1d50:b0:353:3934:1449 with SMTP id 98e67ed59e1d1-354b3bc8501mr2172216a91.12.1770374810492;
        Fri, 06 Feb 2026 02:46:50 -0800 (PST)
X-Received: by 2002:a17:90b:1d50:b0:353:3934:1449 with SMTP id 98e67ed59e1d1-354b3bc8501mr2172183a91.12.1770374809920;
        Fri, 06 Feb 2026 02:46:49 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b21fb723sm2081136a91.10.2026.02.06.02.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:46:49 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable tertiary USB controller in OTG mode
Date: Fri,  6 Feb 2026 16:16:40 +0530
Message-Id: <20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P3Fzsf_LXSnI_9edVu7JimvJ38XdTn3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA3NCBTYWx0ZWRfX6HzGy3UWgDYt
 Nc24Fn55oBlIDs6nVSJRqO2uyHOX2/me096DNZ9Wq5s11dt9SGbBXVIkHhE+FN/K7Gml5eoZLKp
 A/CRVTAk08UwX1Q45P9jARGC5gxx9fzh8FSqpZBDOXQl8ul3gHEq6MjVGpOiYm7dH8AfVz+PFs/
 1kTgcNN+spdVBNgkCMd8vT9M2KmauHvfC0vUgtC5kA09AzN7MH+v/ZQtfJq7C7OCbIUuV4M/HIX
 61Rr3zXxGQ39lqB1RKREB/EGuYXPeCULkknAaZ4e1UDWP/pURUxx+ZCn4mP2GkYWIFvDlAlUMdP
 SkfD2OH12VHLmj6/ZWcyNkpKacxSbaTC9wVmk4PkV+Sw4ztuVEqocvaBrBUUzFDU2f8pU3BBrAy
 sT96izQFvRRwT0NQlSGbdHvpHHWz2K/213wTGWmZ9bVE3j9OCWxdeUlNs/buw06ua/6kbAs++62
 1Z+lsI3wTtxG+Z6x89A==
X-Authority-Analysis: v=2.4 cv=C73kCAP+ c=1 sm=1 tr=0 ts=6985c69b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qYWVFJ-tb-LjRqi9uroA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: P3Fzsf_LXSnI_9edVu7JimvJ38XdTn3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060074
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
	TAGGED_FROM(0.00)[bounces-92013-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C0B1FCC6B
X-Rspamd-Action: no action

Enable tertiary USB controller in OTG mode on lemans EVK platform.

This patch depends on:
https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qualcomm.com/

Swati Agarwal (2):
  arm64: dts: qcom: lemans-evk: Enable GPIO expander3 interrupt for
    Lemans EVK
  arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 66 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 +++
 2 files changed, 73 insertions(+)

-- 
2.34.1


