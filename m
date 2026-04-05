Return-Path: <linux-arm-msm+bounces-101856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBnLEVtm0mnMXQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 15:40:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3E739E954
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 15:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F052030166DF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 13:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C9834752A;
	Sun,  5 Apr 2026 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahwaaht/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkiHPx4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAC5347533
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775396399; cv=none; b=lGU4bjmxIgETdirNJAGzSeNFdKIroCBIs5qf/Zjqmc+VPRXhzhJiQBxo0eJtiLQG96BT8tgG9/oJiwbYRiK23u7TzGBstR6CBXM3JvwiDl7dE+dYjWjuC+bH3pliBw7zZpSZMSYqwa/cHru0CbBUcBrfSZCMqQIk6MFp+b98Zkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775396399; c=relaxed/simple;
	bh=w0w65oHRmYdyIowUrjyBwLBpwY/P7+ACD/L5gk12A44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2JMQHguEuya8eH1q02AWE6lGAcJ65VyHI4T3jKQXOdbcbksOYAgtPA3ICbXSppCnwepyPloPKyKCPud0mYPfhnxOYkEYGzIHU9v92wpMtoDG2rhpbWK4F/tnDRBZNWjdQUMR9/pDkd92SURkPxW5os6T/3r1bYn3vHzh+zqcBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahwaaht/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkiHPx4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634MBwkO1866599
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 13:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adjkt5c8UdlOtfXptpxeUtjlXcYJQ0my0zFaNI8b+Iw=; b=ahwaaht/dJDFXpUN
	fUTEy/W7Stof7idzW/YNpV3V1XbzDIA1XnbacF/rN6ltIjueUuMha+3oTm9lhhY5
	gsEYHWRGUpW+LhE38lmxdqwpsKrm4e/ExUCnQn1GnWV8qb/+vJBW75m3Jctu/7c9
	GY3dFj3dzKhV+m8+PlKJKNIsENZGL831rvWHZy2FRjGubVQHrSNvBNI3FAQ7nQ6g
	OwCYCzQbzka0twK5Xyl8YVfkcIUbPgW2rlXDnL1CSiIERa25PaCQeDRFoC6LsP8E
	8ERUN90LeEnZv/igWsfuVhLne4ZOH5v0kJJIvuJ/6P7uYCbtRx76hLDrwlBKqy1C
	5c0BEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd2fdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 13:39:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8dac6233so5776401cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775396397; x=1776001197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adjkt5c8UdlOtfXptpxeUtjlXcYJQ0my0zFaNI8b+Iw=;
        b=AkiHPx4WI+rR3tEDS/H9xOmhT7VsxBShtTR/Q3o1xt1C9BGeNEfE2ttlJD++FkUzL0
         Ndf5ZB9xfuV2Ape+q5Orwf3uPZ7Slk4G8+3EX/zWwkXI7+di6uD2orc0kMOU7xsgDNdb
         zZPkHVuBQcNyM9b9eWpraD2jH7bo9fNefWAk9dzicM0LWgYA/F7bC+ps5mdYL1t5F3w8
         4cVaBySEpIkmwib4w4m9ji7JypVuMaJ6Mh+ZbBG7PxnQVsGPBU5Mpsq9ckbsfPpP62rM
         B9pq4LFWk0ZP/fPAeb+5xeL5cJRtLaKg1NVxEqCDc+tS/qfjwnTIRRMnIMID+a6nTJ4l
         4aRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775396397; x=1776001197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adjkt5c8UdlOtfXptpxeUtjlXcYJQ0my0zFaNI8b+Iw=;
        b=VF9y8c2FPqLL5NTr2iip1rrkv0Tq2+AaE4k1vBCgZslkQ2BZKJylMamlIpT6nv5f7w
         O8QLNIS8QE4mR112asWcXhVzF4FdEGLF69Rc82mBdf105MFa23yDy0QqMK3GZnH0injp
         ueKKPevgzaG+2xSE8miBstqjEBDb4cY+3p1m5HRq1t5+Yo+h39qjbLatqWrNN3nXJt9o
         /zVI6+wETXuKWY4mwCbznAZrmayEWSOERgYUdFnrgUIDAwlhmv1FthYBEeU24xanWgrv
         eMb5hs3gl0cX6hlebH3Nbb8STbNc4ViTJqoX9M8IDWA/tj30oicXj6pwu7VwpukmamLp
         mMPA==
X-Forwarded-Encrypted: i=1; AJvYcCUrLxg/MfcYY3DQqVdKxryIE880RIp3C4iwfExMgqb2ozghZaFLpyFb+ZlRAERqaWwPOLRbA1ngyML+P5fZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyYF6XQydUC5hdRAZkR0ewaNp1HelPZozCIUjNbFdgaPU7UEtEu
	Ro2RI++nmDkPotxtdoFpPMsqTIbzy6RkJ3sUpuulJsD5REifHeGJMdwFjYu/vqMIZ3weM4JM5DU
	qI0z6o4TyxUu4g1J22y5aF95/bunhT5PeWBQfmEvrLxKMiznC3SgGiy2HVrtQN+9QJjqV
X-Gm-Gg: AeBDievZf/Od1SWpdZ8pyX0fCF2UdbDjcVAgIcwqIdgG08p4rFmMXp9BSUHQXq99Eif
	FBZK/b+V7jDREcG2zblY2TnBoXwy532dRybPFpyptfLmq2ceIyf9lwCUvCsUErhCgUR4ysPqzEO
	juLWhY2Ytira2bbYHMVpRyZPJjJV7ZF3ErTe9Li6uRyLJoCcA/FarF+oMM7Itgiu3+L5Trqa+bI
	/W3WtLDwY5tnBqwL+IsNliBiiTd5zQcWk59I4FZZP3WTf57r+ASFyfxOq3EjSYaorUd1m4qizmO
	eYgbEnWFXK0KKabqIidAuwakiJvPm8qzEom0RXszw37rI4gOtnA34X3wOEzikG68xvM1qNwAX06
	s3CxeA5ywIi8HjTB/W2zEMNKE+pn2kqTzl8sUcg/oMrxX
X-Received: by 2002:a05:622a:aa42:20b0:50b:2900:6644 with SMTP id d75a77b69052e-50d62adcb5fmr111076021cf.51.1775396396596;
        Sun, 05 Apr 2026 06:39:56 -0700 (PDT)
X-Received: by 2002:a05:622a:aa42:20b0:50b:2900:6644 with SMTP id d75a77b69052e-50d62adcb5fmr111075541cf.51.1775396396114;
        Sun, 05 Apr 2026 06:39:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f1esm32188774f8f.2.2026.04.05.06.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:39:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 15:39:29 +0200
Subject: [PATCH v2 2/5] arm64: dts: qcom: glymur: Fix cache and SRAM
 simple_bus_reg warnings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-w-1-fixes-v2-2-1f2c7b74a93f@oss.qualcomm.com>
References: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w0w65oHRmYdyIowUrjyBwLBpwY/P7+ACD/L5gk12A44=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0mYfvtjtbnUZ35lcckwJq3Rid/bqCX4/R65IA
 5078xAaYYqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJmHwAKCRDBN2bmhouD
 1w8YD/4/UDc8WlLMAZ0OxRjAYxzkl9l1Y128P52ma+y9ftwFHzSpwxsdtu0gFA6HpC6R2hM/QMp
 6NB0OoZd6PM/AZFMh1vGMkfj8YSq7qxC6EQbdJjLIbJWV+xeRblLb3pfelPysjFKpyWa287KdaO
 KwZUH8fYa3IuD1ePEZ71INz5cZWfTQfbYYaFJZzqn1boPgi7U4kurcnr/voS4XdgaRPcUW1UDjT
 4f8YW6pjcu2VGqPhGOLnEUB8TJDE9HH67i6Jvp7fSlkm00m7wuzAzzTg0/EOG8dKQxP9pnzscmC
 5FNWFH7FrUt4KMT9FxoepAWj5L5sfYgUy5QZDpcKyGYPzLbzSqQpvyLElBq+2cQ/+oJ3l9xS/uw
 h1A8fdiuGq2QTFC/Eztwyw/Zg8W5mk7G74QD+KDexLZKfPXjF5BPnjE2nSiHTuw+PKBqwdn1pTr
 X8dkmAaBl8PoOZC7DRYeQM9+PIvFHe2I8mj8DgIEsjP2xWzJqq3T7vumobkUZR4x6vPtelf5ztU
 vY8XK6/7Y/B6oD1RktJKZgvJ1flgsD5TEyv25jdUcIyZx4KPye04AsyxynvhVf9u5JXpTdqYlQI
 WCyScvm3tdzUrDenSe43v6nG+4eaDRVy58MTkPUXJYl/i68CgzP9KNgRGNG/Cm5ZNQNUR+jx2tR
 6PzW1mJzQwbRgFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: a8yN482kXrmEe6t2MRHjr_V0IuLIs7u5
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d2662d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=whlQpUbcimcIkjChax8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE0MCBTYWx0ZWRfX6yEatVlxvSFS
 gbtzpqrJwtswgpjEv68ich1xImp5ncKgimGPRsY1HHUEQObA1Reojsk1lfnpEynchJA3QifDsig
 ccDqHXl+1dfDoET/5I+OK9Arq/XxyMND6mNZI1EJpNdBFrEI40QHs/WgLy9xKdifQerQ1od1JIB
 KFfNOqQHkNbsdCIXolFjF7iF7YmNhTcDX5Dj3wzSdRWq6fxM/w23I8z8b5yxylQbvYycvD4p07D
 PplhUILn1V7lIpzGq5orpPV7dswIquI7hEl8lsxFxkz0VUL89WOqJJ7W2C9Q2UaUEufVM92NcKA
 bDyUp+YOqjFnAGypiga90XMQAzMi3YSCjg/v50oGx872IzcGoiF+rqtvAlp3cUpBL13Dd9uT9Yo
 MjkGwFFRcuQU7qI1St7dpaIeRI0AJHTkD+tNjdP+EDOwsg3Ye4cz28gzl8RQgYNUR1Zs9PLIZt6
 5NBwio6e2RQufqof82w==
X-Proofpoint-GUID: a8yN482kXrmEe6t2MRHjr_V0IuLIs7u5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050140
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101856-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1.76.164.64:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,81e08600:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E3E739E954
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the unit address of cache controller and SRAM nodes in Qualcomm
Glymur SoC DTSI to fix W=1 DTC warnings:

  glymur.dtsi:5876.36-5908.5: Warning (simple_bus_reg): /soc@0/system-cache-controller@20400000: simple-bus unit address format error, expected "21800000"
  glymur.dtsi:5917.23-5934.5: Warning (simple_bus_reg): /soc@0/sram@81e08000: simple-bus unit address format error, expected "81e08600"

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 3389103408b6..0c5cb8532b20 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5873,7 +5873,7 @@ oobm_ss_noc: interconnect@1f300000 {
 			#interconnect-cells = <2>;
 		};
 
-		system-cache-controller@20400000 {
+		system-cache-controller@21800000 {
 			compatible = "qcom,glymur-llcc";
 			reg = <0x0 0x21800000 0x0 0x100000>,
 			      <0x0 0x21a00000 0x0 0x100000>,
@@ -5914,7 +5914,7 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
-		imem: sram@81e08000 {
+		imem: sram@81e08600 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x81e08600 0x0 0x300>;
 

-- 
2.51.0


