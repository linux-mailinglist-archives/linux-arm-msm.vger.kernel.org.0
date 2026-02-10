Return-Path: <linux-arm-msm+bounces-92521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLcdI4pUi2kMUAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 16:53:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F711CC81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 16:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70B6B3006179
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 15:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2FF381714;
	Tue, 10 Feb 2026 15:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWjdAXH3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyDgdHKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72AB32C33E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 15:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738821; cv=none; b=qTPgfrMxPFGFbP8L9A7I529IByYiSqviItme53MuOHo0pgoRBmEQTVYEeE2JXZLAXvT7XG9bwlemfQU0jsBUuTcbJDztlg4X0qCtfki8lEb8bnJs9viPq4BQt4wET5lS5cHVAZGkr9U/Q9SQ1Ocw7XsLg9yeFq0qeWiwqu6pxko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738821; c=relaxed/simple;
	bh=ES2yPylAWe7RjKwbD+FHSx3tnogvS1+CwfPlp2CVLUM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=apJx2CP9Suq9S7erk8M5WypEOdysQHpeH5inSQH9lasNVn4xZA/hpWQtDnNSnS7PNowie11uxowk/uQ4gbXUbVeFMYcxf+fU0asjSGTr6WZFUvMEgPtF/jTyUXqCIMYB0OYSqzVdHek7hoxGtSJYInXPKPuu1ZZKXt4hN4m3Hbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWjdAXH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyDgdHKe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AACYhM1940746
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 15:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IrIVbc5cn5o//qq+G7UgCkF5BiMQoDHH3bG
	+Ne3gTYM=; b=JWjdAXH3eCIBJkiMOoELtENG4Ele/K4GcAU778D9FPfVnUYk4XO
	Flr352hUHgPLlUDOrLoccD0c8SxMUtTR7qAIM4IPAn9dZJsYDY6tXP6/mFUSd/Ar
	+FgPr+P2E+W3+2AEqYEcj4kjOWBT1Yh04ociEis3l+9Vxv/a4FCskYHCFH3/Yq0d
	HZ0SzqG1t/JmrUC3eHcbCmoC0z4/p25wun/sPM7ofZ1hrR7y6/CISBEmSYdkkTnx
	23+V4MthJvz/evoscHvL+bq9oM8cgzccq6BTJ0eL5b+h+xoGFD1mMPVsJV9dz+2L
	8WqEPCokWuMXq4xLmIe2eQjD1S26xYvvEdg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7w1jt633-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 15:53:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a75ed2f89dso47356895ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 07:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770738818; x=1771343618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IrIVbc5cn5o//qq+G7UgCkF5BiMQoDHH3bG+Ne3gTYM=;
        b=CyDgdHKeNcviZOkC/BpG/tw+xNxQM/17voGz4E/+nluZkyajgko7BC5Xn0/KGJCAXo
         8JBqvkXKkSV05pmqyyDh2eX5Xplt8p8Xyv8tnR82npO33Luwxry3g7koVhWrAXQaMKMZ
         +o+/iGWJRuUEkfisfyGzLv2I3o9sapFn1tlRlBr32BYm4evWE+bQEH3M79azEoVacys6
         Tj0ZPxUGwyXTdbR4fp6UgJL1t94ySPHsJHG6oyMPYqc2OVWWMhEDG3tx6GLWFyqdSmO4
         4rE2087kKn9TcO1pSJT08UKWupaREtuqSVTmKf5hAgiUYxNg7VFuk1RRkLpuq9DMF3al
         dYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770738818; x=1771343618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrIVbc5cn5o//qq+G7UgCkF5BiMQoDHH3bG+Ne3gTYM=;
        b=uDymc17zCRJQkH/arjv22FVpNoP4N0W6baEXfEvbeu7cwOOP3xVpQMrHYV5TkefI6H
         I3Wy4wmiteZ0Zvg4ReB063Uk/r4KZITSwKNUvo0O2HMMj0de6Np4P/FkbPRjiNF+Byfe
         KDV5NOGqrP62mLGdElNwycCUClwt5arOgkU8ZYFMTOFgauoiAAmOnbvlJ2J4zcsvTJsJ
         3mL7QNZduPpivVXOeGVZvOAnqajjZufNtheKFBrWVgCtsUNAYKMa3hRU++eWYlLNadx+
         tp4xssKfvQK0koRDAzcGilzBPQ7BtxhFHsZ79hEuPbXDHAhPnIJoVXGkEH9JwBtCJ/lP
         iq5Q==
X-Gm-Message-State: AOJu0YzX81WzNVpjiieiv0o9W+mny/7k+jnnNPILL+PGL0aBCBYfgXzD
	JCnd+FII2+epbWQs7ZRJY1Znbtl/+Jk81SmYQ8hA3en5x4psNcEYhIOH6TxtKLuLGc6n2ZnVS8+
	w/SDj7qDJxIwwXzSZi5P6mjjNnkkvdrPYcKyEgXFyimaD/bOdl+f2Q25uu0kq0MABnZ1O
X-Gm-Gg: AZuq6aJ+8Hp/w/Xl29iGAaYRBx/WryUfU39Wbp726/J/L4KMjK2AjJctSjFAWyUttVC
	XIc86rWCf1SRhbjvZeVfvPJIYD9rbFigBVVO865ec5QyGFcZ/m4wteQJ/ywjiR5Se8RDZTkdiAI
	t+WUAxcgy6LqdaI8V6Irng17fU4L6sRcfALOkJcRC0rPWWMMtsf4dIMpoTUxYi7m58kU13VwP+5
	F65wjOBnwdksQyp6VtIm/Hh3BatwoQ4YAjSzRTi0sCju4z0GQichgWjXmSNFSfZH2Fh5GcZKVtG
	PoeLDmhqUdY4UQRyF+aUV+pXXArL0qiwvvleC1ZJYkxXMXHrwdKXlBrqEcGer6Qn9VIWDPAhkzh
	PA4vJepsqMh2sMDk+H5SZhnzoswYRl6VErf7fqRhL8lAFkz4Ncumdj+A=
X-Received: by 2002:a17:902:ce12:b0:2a9:649:6f5 with SMTP id d9443c01a7336-2a951633a7cmr157968605ad.12.1770738818483;
        Tue, 10 Feb 2026 07:53:38 -0800 (PST)
X-Received: by 2002:a17:902:ce12:b0:2a9:649:6f5 with SMTP id d9443c01a7336-2a951633a7cmr157968355ad.12.1770738817998;
        Tue, 10 Feb 2026 07:53:37 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a952221b4csm149305465ad.89.2026.02.10.07.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:53:37 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable tertiary USB controller in OTG mode
Date: Tue, 10 Feb 2026 21:23:27 +0530
Message-Id: <20260210155329.3044455-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: enfi3mjavzjYKB1GL2IlW55oyRp3bVcO
X-Proofpoint-ORIG-GUID: enfi3mjavzjYKB1GL2IlW55oyRp3bVcO
X-Authority-Analysis: v=2.4 cv=YrIChoYX c=1 sm=1 tr=0 ts=698b5483 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=1gpuMaJnbJF-dNvRveIA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEzMiBTYWx0ZWRfX3FuQyAGFNlN9
 Jxe3PZcQ4icx8G+wGZ/J4ibey/dmEOgDEk0jPJEJQWJ+mt5/GdsLfNEIDekZp3FOnYeju+2LOy+
 6gSs34L+JJUQzcxAw/a48uA0WG6plwpW8PR13cwqSF+cvyYO/xrIczrmKVnEu2eqzEPKf07bOt8
 3nY9UKe4N1yoMLkIU4OcDOmzbXRQ/ODgx2qnWloirrK7cei+9JVrSR9zEazVXZlYbSuBDEbcBvn
 QDu+Z4mvR0s1FJNes0ksFz0udaCYvFTbsEmuJ18VUe/5wtlhJGEH3CQEIIOlHk8SgprHOR7eOul
 alfqz4zTk1g7qGUs79ODnmHuvpeXvOF21154WHe7/No0N32Quj2wKJv6V60U+va/LQalFgeEIG3
 5zVqLchvzD1pku+/08qtd0gDfevfYSVKoXBttyOKnCa95u2kDF5xEB8tikvit/RBF4KbhPGQvvi
 daor0qSosPgrc0fzyKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92521-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D4F711CC81
X-Rspamd-Action: no action

Enable tertiary USB controller in OTG mode on monaco EVK platform.

Swati Agarwal (2):
  arm64: dts: qcom: monaco-evk: Enable GPIO expander interrupt for
    Monaco EVK
  arm64: dts: qcom: monaco-evk: Enable the tertiary USB controller

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 130 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |   7 ++
 2 files changed, 137 insertions(+)

-- 
2.34.1


