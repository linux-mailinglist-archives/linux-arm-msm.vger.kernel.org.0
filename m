Return-Path: <linux-arm-msm+bounces-90903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG/TBqqseWm3yQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 07:28:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6754D9D6DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 07:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28382303D2CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 06:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2C4337692;
	Wed, 28 Jan 2026 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsuDvuaN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Quvj8A6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034D6337689
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 06:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769581652; cv=none; b=VcWj0awl4LSf8rdzgCxdtzKsR6rx13Rj0wGH4QtXIfiViTA5GGSCEwyoeU6CO3aKHBQ7U6S6m8NUdNF7X8kblWk9QGcAhc7hGb9xmE2Rh7Mdne+9k8kDNLpAHtd8CexQUpETl1B/RvX0Cy2SNKQztw19BWZciJEOFfB8OH6F5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769581652; c=relaxed/simple;
	bh=Xe3KPleQc1zW6csRIiAocjXfU/8aeHv+lJPe+k/UV2M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PQsCB6mKt6whyZE2Y6aJKy5GX5xPYr71TIcVUMVG4adKXuuEUG2DkIZNF1fuUVtEopGbSKu7clfDxqCiYiiNOpo455AjBpd5Qs/NazCwKALZSbXI2k19vziBtZXO7OgT/dlA1bA7v9ch4/peErMWwudeUti0X+yPcF6iEDQwHk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsuDvuaN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Quvj8A6U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S3ZnLH2477239
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 06:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1EqyNg7XrcvdpwaoVaEwAUPHZ4OY5BMwz2o
	ZWWKTUf4=; b=UsuDvuaNXvanswW4oRBIkC8THHMuPCb/00zMWNQ1lPAJlMkPIkG
	TEMMtt1oEIJeouG5dVU2DtFOVnqh+8ckvqRKyeyGbni55ES5Wz6W932Wwj+rfpBZ
	9/Ew4o5F7lsjsmTtUp5UetpS1jhcvJj7Y/SoMFbuqpyW9/OKhKKJDJQe91x/OVUE
	7Rto3ZBmi4V/0SRSHTggJQ6gjUaLxkRsgZR6eyPnSFd+tIKcDB5TXOSQ5k304p8b
	HsiQlxPwlh8ulT2PaodiJavSIk1uVrnkgpDbAQkqtpdKM9Z192gNMf6AjORUn2Ph
	jPURF/8qD2wnWeT2w9EiSF9f3hxjE8U4A5g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y24be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 06:27:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso945812a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 22:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769581649; x=1770186449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1EqyNg7XrcvdpwaoVaEwAUPHZ4OY5BMwz2oZWWKTUf4=;
        b=Quvj8A6UKdwec7eq0IPKxg9iMQnTkRjhFwv8ktXhdfYDso0yX+EwCr7kyiig90FSyZ
         kDYJMrjKn8TGXhtk+bcXEDo9N2zKTzpCXt+XOrrKT0AOahXt4HygmA1nS0BSqYGbD6hR
         P7F2HVu8jkXRi9A6pJGw+EM2wbGLTYwP9aBooLC3O1rrD+mycoRTcNSJqOt7tsyWnfOJ
         moc+a91+3bUaMhKm2SN6iPpqk6x813Kw7Bt4mi0cBHTNkmqbmeyPkan5NhmDY30LKfRA
         kHKIhqrTvUOldhMQPjuE7aw5/rDqkW8oQ9UpuvmDfv5hh4lpSLc0Md+9A5bRjHQHOmXR
         qeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769581649; x=1770186449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EqyNg7XrcvdpwaoVaEwAUPHZ4OY5BMwz2oZWWKTUf4=;
        b=f8CwAjirL5RIGZ0ZjtxsBOxD4iqxuxEwPjYGYQ8FR067Fgr7DN7hQdgT9N+Pjfq7cT
         KzrJVJHHRkcFTHTMqhF6g/h5Nwb6J5J4AQXcxmV+YmTKZGMhcMRWFuSQmTVmL27nz2jO
         ovVBkDOoWX/ZaKpl05DFGeql6JIh4Msrez/Q3Iji5rF5dVGBvnvCSwdI2TuqzYqYS9vF
         TALLLq+wD+K4noYwV1z3zsVpOd+i2zi6fOzg4M+KBsdAX8pLsdVGOncmL/Q27hnPNMZ2
         +Nu/oeMmE1usaJSA2QsOJWayc8LELnE/CqU4tJAVOGvmHvoAWg2Ay2R9QdvFkPzre4YW
         7vqw==
X-Gm-Message-State: AOJu0YxTQAe4SjlQyKpNkiwRYcWcHkA5zGQwFa8Txkb0DQFiA6dljIfH
	esITZxDW6qBSb3dF0zhyLNrk9GpRmIPijEDfBDEtIpN36s6+ZRV8DNHCNhbcorl0C98pyw1ikDT
	7+diTi0/X1lN+MIHP0F9V3xvmKcn9T7EirDHrIE453kE4AlFFL0g6LkK09Utc1cP8PP5m
X-Gm-Gg: AZuq6aIqrIL30XnmAF5JYGNrxsuEwvPq48htFzZ4whfCUV2hIR2cQCQvsvL75r9Xt2h
	AB0CxeQkLddl72NHWMJml0faSbOkNlvxfCx8f6WYUkf7r/J5D8vIvt5BYLYwZxF79zn3RogCcoe
	Wq6flFs1o4HZzSSQqycLK6zru1bUt1Y7kwjcWyCWRXMVQoBOtjHvNS81eJqnTmRmruvRSUm+VEJ
	aHswLut0m+B+Q0PHJ4bG3nDx6TjunO86QlBGabIACz0LjKu1xA47KmGAOlc6PpFepMojgiwEcxp
	UgrgedK2xf27Q3zilZf2GCy6rJOIhBEQqJ9gV6tRUWmBg4Ihc3THY0mTA0mJI83ZI0DLGdIzbTP
	AqtBXyTmSwJwGFVi74hpVuHFjvtGif/abjZpMhe0hVfweyy0=
X-Received: by 2002:a17:90a:e705:b0:34c:2f01:2262 with SMTP id 98e67ed59e1d1-353ff8b3d60mr3462341a91.3.1769581649382;
        Tue, 27 Jan 2026 22:27:29 -0800 (PST)
X-Received: by 2002:a17:90a:e705:b0:34c:2f01:2262 with SMTP id 98e67ed59e1d1-353ff8b3d60mr3462325a91.3.1769581648799;
        Tue, 27 Jan 2026 22:27:28 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f17955asm1276381a91.0.2026.01.27.22.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 22:27:28 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Flatten usb controller nodes on Talos
Date: Wed, 28 Jan 2026 11:57:18 +0530
Message-Id: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xhl8HAVb7uRuxD8-EQl9oGquMxa3OQXV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA1MCBTYWx0ZWRfX/zYFBxxuRR8i
 hbqmeMEhQUYH1QrijihGooIorSpf9IvUwNcgXeJw1GG3OIzPSQFc6vWKrHafsRM+7S48NC/Ef1U
 Kj8tUTweNnIduhMoco2QlkGQ9kcJ8uotwqKdqNz7yLasKo4yDz40zfa9FYEW55PQo37gpWHRirR
 oLa7QMtvBff/BxFKA+ZlAprjNr9+l9TNi/VXW3Sqc5tJDVeLQ13mJDlV+EyPTXlzZp7fhBBtg8v
 GxZQzv9BicohzZrSO5gGveIw+qndt5jvR84ZkLyLGWYj/kkK0JsGC3rBMXWOd39PCZoc0veOLZI
 SeLhnEcP3Im/gE4JtNPhQ1MDYV/7fa7K050m/8xCL+3rDDZsH2XQSi+WnA590cBjl5g1RPVLoyi
 iHjNS+OhDbZk1mtqreKL6gq+ejHBGG4VqYkrZVHtes4G/a4v2BS/WDtJSTHQXfHkI+vEFjXpjcd
 3pGOC/mxIjmaRlgxW5A==
X-Proofpoint-GUID: xhl8HAVb7uRuxD8-EQl9oGquMxa3OQXV
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=6979ac52 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wwCzRCD4zyfo-UnKcXoA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90903-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6754D9D6DE
X-Rspamd-Action: no action

Flatten usb controller node and update to using latest bindings and
flattened driver approach. While at it, add the wakeup-source property
to usb controller nodes.

Changes in v2:
Reversed order of patches as per comment from Dmitry

Link to v1:
https://lore.kernel.org/all/20260127155537.4088709-1-krishna.kurapati@oss.qualcomm.com/

Krishna Kurapati (2):
  arm64: dts: qcom: talos: Flatten usb controller nodes
  arm64: dts: qcom: talos: Mark usb controllers are wakeup capable
    devices

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 +--
 arch/arm64/boot/dts/qcom/talos.dtsi      | 97 ++++++++++--------------
 2 files changed, 46 insertions(+), 63 deletions(-)

-- 
2.34.1


