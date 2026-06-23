Return-Path: <linux-arm-msm+bounces-114104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ocTzET42Omps4AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:31:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 920006B4DE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:31:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="oaqV/eaR";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="VWm0hh/H";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114104-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114104-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28EA03012E91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 07:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74996305678;
	Tue, 23 Jun 2026 07:31:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E78311977
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:31:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199863; cv=none; b=CnDzkDqq84ooih3/faFaNDrpA9avH6Mxb/vy694CL16nu+ShcE3I/Tyn5yPsyMv0gKk1zEyPvSrFWuYqW6hi3lFbeQ7TJzvu7BNAKTrqaGJ/gd0FU652KfbopbOPwjahJA+n6kjjA0d/HTSLvtB8jkA5cnDLY5tx7W259FTs3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199863; c=relaxed/simple;
	bh=+z1jZQEnVR8n3wdnGSX3AbHxBd+dIKoxZwO+RTEadyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1CAQHLsiX2DHFLRisX8ROW8BDz46WPM/fG20irg5EewMNMQPph409t8CYDTmhSvROkSBcWm0lIP5zuITlSw8z18upz4RduLgTZW6LZWEsYbR0sgK4Lco9rX+6vVvtDHbS9oMUT2boJZIxEp+QLZGMhc25C2Ke2DJjqvBKIi9Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaqV/eaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWm0hh/H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cjaN2986824
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=d3ILuzr6rF0uBjm5kVCeg2dCh9Da79HKjgT
	n/WbdLvg=; b=oaqV/eaRWEZ0FU6GaybmJ8Egzx+/Ugo2FfiiOZwSLlcSccmSmjd
	Iu2CBl6rEBJUJPUxx3++jGIh3Kw8pvBobSx5IgTH3CTCGDd0LFLHRefDrkQKT+ai
	ZrzT3/bjoxOqsVmjD7jjxGh+sx2P1I9CmAREsEvN1FdrVpOlgo4ql6B3ibH+ZFIm
	F3Dgss3dmN3fy0njG1JyUtjJn8t+bWS61B/r7Lx039dJy4/tl/EG84ozamUAMwQk
	AkDUfRT0ylooHUrKf7mYz6AJYxBLbbXOJChXBA4wPNZ2R+g1XkV40Wa14kjs6k5X
	P3n/NBax+XinwE7rjA0z0DJIhH/i0kOC6hA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3a0v2pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:31:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-922ff615c39so208048185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 00:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782199860; x=1782804660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3ILuzr6rF0uBjm5kVCeg2dCh9Da79HKjgTn/WbdLvg=;
        b=VWm0hh/HVD6e5wpKtOyrwy8VuJr1GCGoj9JvfM6SD7hc8SGVLAQ2VR36KQlgi+SqY0
         WW/8bguaOcFWdV1WRXBmtCKCDwZa7gt95gj7NMGDWhELxEDIzeFRbg01pcZt+FR2fZPs
         WUZzdp6gY62KnYqFPbhUwKaNZwZqulD/UCk6BeaNdeJWjux3YmjEfWXI8EMW/saEe+Jy
         1V2EA6vSa0zPNLMX9O/P+PBC+WSzR/wyMPen/+lu13+cgOOwkiWPJBTtcB6u1mwtkZ+3
         q088an9Jn9xTnNESX6I7vA0q0wlEv3jcAYrypSo8GOFSPTsW/s7gTsYIeEaFvUlnR4jF
         nbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782199860; x=1782804660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3ILuzr6rF0uBjm5kVCeg2dCh9Da79HKjgTn/WbdLvg=;
        b=jV9YL17KfhqrfLbpbpg7nubh+TIohUTKtJHZxNP26LbQ+liQAbYG2c2lUSeajyXI/R
         u6RquPwTeCk+C92uGRkzppbQSyLenWNaC5mz/45ChLrSIwgdCJhX+AUCxvo/vzXx9qAZ
         eAnZHAtPKtKA8W6xKuXeKHyS1RJBwckhnQNu4nCnd29AHIrgPbrQW+qVhklKTtet/rgT
         3jCrF4SQYRV1wY1uufWIzWVQZURKqQo4dePRHS0AFFXyAmjVzS136pBVqanwlScTndE3
         4+DtKYreD+mcnB56RzBYWv3E7Zxkc+1AogwcYopGdV5PganZrhjVBLEpGqEphLghE73U
         HBiA==
X-Forwarded-Encrypted: i=1; AFNElJ86V51DrQu/wU6e+XVDvNK2HmjxuoeWvLSPi2bSdql79SypbNWx9dhLsDZdoFfukGPve9Vixd0AUXHqbWwY@vger.kernel.org
X-Gm-Message-State: AOJu0YzHP1kaUd2CSlupphYu+o4NY9XMhi2fbt83r4khhrSHV1ITUGo/
	JzP1G0NaVwWBZIPyvZ08Ye2hlhqT+mwEDTf+SdC/Brsg3I4Cey8lUm3iuSUnmcYdPOyCjf3tsEG
	UiPviXkmHHa/Uf6anTxaEwdyTcsBVVkJDidHAcc4X0udpcz2kphdNMZId2vbvxDUEkJY7
X-Gm-Gg: AfdE7cmIPauToed+YxtX5t81j0VSsjOgPgQrlL67OqjAx69dDpzEmVwwN7cOBQhgklE
	gmCn14cN+sQ3hWdCXALh4et47B60fTCc3bpTqKeXpo80HhlJO8yu4CQxV3TRam4r1359Ma+e5KP
	ZjLzd07Q/R63mApj5Lly/U2qhavf+dUc0kyrYo4OX8wjaHz6ealc15lmL/5yeWlHLoZ+jrZsVxO
	8eI6HIxQFoCv7oZTYrmFnjOtB0Y8rEcS/dUmRZau0qLw/NrhNhJ70s1Cg5WVFpac5FiOwP0Beer
	FApmWekqzhigEHpCRxH4aFGUJOioi5DUzJs/fAdq52MPebtgTS4FNgDfh4Rw3agTUFUMQkGvEmY
	7/dSuShUbEqZhNjb/v4fI1kTWYB0=
X-Received: by 2002:a05:620a:1a18:b0:918:7e9e:de74 with SMTP id af79cd13be357-92600a83287mr479174585a.17.1782199859900;
        Tue, 23 Jun 2026 00:30:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:918:7e9e:de74 with SMTP id af79cd13be357-92600a83287mr479168485a.17.1782199859316;
        Tue, 23 Jun 2026 00:30:59 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4fd2sm32639666f8f.14.2026.06.23.00.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:30:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: clock: Replace bouncing emails
Date: Tue, 23 Jun 2026 09:30:51 +0200
Message-ID: <20260623073050.36262-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3511; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+z1jZQEnVR8n3wdnGSX3AbHxBd+dIKoxZwO+RTEadyI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOjYqw7+RyPgYxYdPnTEFX17TqOfRdpBrpFk/9
 nECEH8iYtSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajo2KgAKCRDBN2bmhouD
 1/zqD/9bOBLllsidqTgIaW9n/Im7ZNh21uTUYpZWY9l0c6FHAd7+MgIBIsgU2A5abk25PiND4N4
 iFvurm6lE04BJQw1is8lJTiAudAunnJiVSTVw+xHD1fIxYqvkSx4MIUaYS2j8ZsTPMYhfGPLAH/
 owqpUIghS7KmlJeNmh3ttEzlrOph8i15uhtev00kjBZVpkjDgGsFj2bfzlKd/m+YYFnGx9nr6bN
 XBwCmuCBiPaXM9fU72ws3xZPCYo+xOMy3QLQLLe7bKq9IAn/TR2tevde29XIuXDdgskh6pZA9Yv
 w0unRiwWYjy3T47N5i+IYEylB5DsfjmN0Uz6+ZTKCXqLG0KP9az/FqYaUt0qqLPJ9ePTJQ0RWpg
 46j53S5D2dyNgpwfpDiPe84Fh+78+SqhDuniTRKh3TUCO5Y7fFfz+mQktvxLOPwwNxA/H5DXdB8
 DjUA/dZp3Ud8PrXE2DbzXfIc1M7VsFydkLUXrkfWgrJFIL0m+ErF4zPIknL9RkH+JpJBXhMIqw+
 PLfM6qcvuWRoTmHWLOlkrINuZBjbwA+S6Oh4P2TYHj3f1dlrKbvmcKvA0waBdx5Mq57WaEaKtbH
 Ogq/Zd7Z2fiFN+Lg1tjTtHQySJ+eJmHx6/exh+CNAlDQaWps/JsuBs3HtrIzbISytV+/5MXVpqa /5mVdW5lFCl3KBQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfXyIYLtcUyaNGc
 EAXEqAzOG3WZ5StshKlhei2aqPCJYPxOPSsnU0ThCufWVLdelbiCC7qZ40M/MDiD1Dgk69W2jol
 nIcBO/du6yf5Z7XWHBDwcPlfhGV3d9Q=
X-Proofpoint-GUID: nGXKFYArr78AClrM25NGlrVTk5oyQxC1
X-Authority-Analysis: v=2.4 cv=UJ7t2ify c=1 sm=1 tr=0 ts=6a3a3635 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=OuZLqq7tAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=hD80L64hAAAA:8 a=eM6w23YO-tvBst7BRO4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TvTJqdcANYtsRzA46cdi:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1OSBTYWx0ZWRfX4sd4F94Son98
 I6HlF86XLgfiLuf4xagI1DOwctj3y3KWcP4cxs0YhO7/viRb9XpDqLyzZ670R/aPf0Qc6BLjxlc
 342QKJ9xklqJXHW11TNidFSkRTIqXlBKUDGskZoSeQ9Lt1+H58GBdMUKcnvR/tL/PIUPPfbwLl/
 xMUceBLxWMAaWjlLAmYg027+G0z+yt3WNhmwIkDKVdCGs52qSVksbn+OCVjrEWvK0+qLzKZ5KoJ
 3dczOZGwDTiuc3GcdcNtoOY1GQiW/ojaNoEPTOCC3wgK0VNmFkFah7bVnlLhcYErITrPgZmTARU
 jr7lBhCPTZIGKYrDNmm8pKB0ctDFcUeZjW/yduQesvSuo3NuX9ztUSmMnCcDnDmmGOcq4pnIqZz
 yPRNV5G5PfNtdI06r+KEbZjQxaf8j4U2rN4JqVanASg2G1De3MYaBcm5ZQCJo64chXF0mQKnEk5
 nb4aa2viMFRZVbJER/Q==
X-Proofpoint-ORIG-GUID: nGXKFYArr78AClrM25NGlrVTk5oyQxC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114104-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,samsung.com,linaro.org,mainlining.org,gmail.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:barnabas.czeman@mainlining.org,m:tomasz.figa@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tomaszfiga@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,devicetree.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,protonmail.com:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 920006B4DE5

Replace permanently bouncing email addresses (550 5.1.1 Recipient address
rejected) of Adam Skladowski, Chanho Park, Anusha Rao and Sireesh
Kodali.  There are no new messages from them via other email addresses,
so drop them permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC
clocks, because he looks at other Samsung clock hardware and drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Stephen, can you take this directly?

Changes in v2:
1. Also Anusha Rao.
---
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml   | 2 --
 Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml   | 1 -
 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml | 1 -
 .../devicetree/bindings/clock/samsung,exynosautov9-clock.yaml   | 2 +-
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index fc0360554f68..9f2b970bfb48 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -7,8 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Global Clock & Reset Controller on MSM8937, MSM8940, MSM8953 and SDM439
 
 maintainers:
-  - Adam Skladowski <a_skl39@protonmail.com>
-  - Sireesh Kodali <sireeshkodali@protonmail.com>
   - Barnabas Czeman <barnabas.czeman@mainlining.org>
 
 description: |
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
index 5b128fa841aa..1337bd87fddd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-gcc.yaml
@@ -8,7 +8,6 @@ title: Qualcomm Global Clock & Reset Controller on IPQ9574
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
-  - Anusha Rao <quic_anusha@quicinc.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
index 7ff4ff3587ca..a35bbc7b1924 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
@@ -8,7 +8,6 @@ title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574 and IP
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
-  - Anusha Rao <quic_anusha@quicinc.com>
 
 description: |
   Qualcomm networking sub system clock control module provides the clocks,
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index e9d17d48b4f3..3dcdfa7a8792 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos Auto v9 SoC clock controller
 
 maintainers:
-  - Chanho Park <chanho61.park@samsung.com>
+  - Alim Akhtar <alim.akhtar@samsung.com>
   - Chanwoo Choi <cw00.choi@samsung.com>
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
-- 
2.53.0


