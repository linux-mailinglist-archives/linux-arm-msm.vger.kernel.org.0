Return-Path: <linux-arm-msm+bounces-102916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIYvME623Gm2VgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:24:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7C53E9CFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72E62302F24F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8383B19A7;
	Mon, 13 Apr 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjJfZ2XK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDDpsBgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B841A840A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071818; cv=none; b=DBjY+vrJhfuuRetbk2XPbJ1gd/uF/MT7NrkVbVg6QWW9obr+Jke32h62vT6HzKPidEsbHBDKFxXqX665zhnUQWfCWo0q/PcpFqSkRp9VETiUKPa5rN+nW1iNP/+VV8Jjm6hVXczfb3esgOuQ9X/DRmIn/u91cCb+Rq5gpCniKoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071818; c=relaxed/simple;
	bh=YnftY9+ehUwSgclaGDxHKtysSDeKaKfz2pmZhieH4o8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSnBzhMdPaT+iVjGcEaCZveBEVKLxQ7GqByy/chj+x5EdDJQattlx08WrOubHk0i1jDTboKZUozOUFLNitnaY+exVeX5Lszcv0WqI53bwsNqfUzsGzAsT3JfbrUcSoCXsSD0/C/sxjl9QQi8b89j0YnbLZwmjccUieCY4t7jLjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjJfZ2XK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDDpsBgN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5MtAW531190
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9nPvxcQMAx//YrsAq7WIoTHxGfhB9nazCVh
	lwcfLYsk=; b=PjJfZ2XK2rGHUgzBcLjX/54SSoOtDVFu1cpyEZSpz/6FS75ytmD
	ZG4u0UYsV9WN6v+1Mcoa4qT4bdsnIh0+7NwE2g7IRorzY1M3UhhRyxa4bmYuv9Ox
	8xy72M0PhSd6XOHaQfUYqNvcJcuUXI6v/6xU5O2xyUY0x4CKWLhDm/h6cSzsnCUf
	7qcOJuhVu1KIWOWa3Xlb6iXc/sb1kTtCkLZ37HP3LP2d5/secWlA2PsqTAB0+kSx
	vOrvzWADvzAE+S6FnbEpliZCfsnC4jdkaEVFdN6qGm/AKXkM1EkoJSS1+UfnKeRN
	ALoH26k1Jd/QfgKeX5L20mCJavXsNBWyUSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2bcmeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:16:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2da19227bc1so740324eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071815; x=1776676615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nPvxcQMAx//YrsAq7WIoTHxGfhB9nazCVhlwcfLYsk=;
        b=aDDpsBgNcry2cl0C5/PNwrj1VcDnfc/wIkuIneOYUIjwKJ4BcX4P0cD6c0Y7XMDZfj
         VvfW8vHmw9TC9vQh9sf8XhXRT2K5Yalna6xc562eoUNqC0YTy8lswOFcVEhVENyTxzM1
         Y+KUATd59VKsneIy4GtNyu+DhV4pLSi6FzeoBqpvKRQDx1ejpRcghDwWpq9kJVjzcFUS
         cn47gi6+jv2lA0dRY3uHkxOdXQ+MIKPk3tMbNsqkgKu25YgKevMNtweLeWIT/4k3d5JF
         fqVdl0CuAFmFmgYhpb+TG3/rqd3uggoj3cgtEm5TbC18dCW3g1teO/Dj+DYG4NwRHr1g
         CrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071815; x=1776676615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nPvxcQMAx//YrsAq7WIoTHxGfhB9nazCVhlwcfLYsk=;
        b=ng31jRNEdsP4AOx/ElwU0CUVrnEykB+y9J0e/KjBueIWNyHnZAh9GPxx5ezkonZkEr
         GpzG1ddSPEREqRny5mrMkzKUaiXO/xE4Sti0PyQ4gGh7pJez+rcT+6X6YJOyQlZZbELa
         BqmNtbtd6ggVBc7nKxyjt+2B6YffnXq81l0O2fUaKfPqGZFmLXRWpOcHJNuzRXsHG+Wo
         odJgGckEqTFFjs4q/oAVaqBIrttVCZgxKy/duLK20voRm9BzOL8VXcCEmK8nh8r/O3eL
         xHoxTVNRWT3zuVWz5ndc4bMAMj+4MXW2l2eQJWiwPIITf+7vKa/cOvy7TwFKaqdDSZmE
         ngeg==
X-Forwarded-Encrypted: i=1; AFNElJ+3MQPKCpipA29zajtdN8DrJlIKQwQjAv5PFwSwsI9bW6qZSPGrwfPdvMA7NReZGiBpvkhPu8D8jE4GiJ2t@vger.kernel.org
X-Gm-Message-State: AOJu0YyCDuy16ELx+DaKjX3H02ZbvQdwsEk4RNx3wWxpHzwDOg6KRIRk
	e50ubFwCsvkH2SX8raZb4ku0c0XLuCrsGG4k6vGsmJWmWESGfREma+vVYPFXkM+UmjEX1/gNyXU
	NhYGkFZ/tUeCpyB33ZhIXgpwBOLfunrQStC2k4zXF4ouYGFb1UmhQnY31/AomL0jXiqzt
X-Gm-Gg: AeBDievyhNyChsXoAQ+J9x+c8OWqEgG+YzDmIJSXnaGrwb+4fc5Rh/4y24x7TBm2asT
	UOOMXObyzsWTrfaQbQkAKo+khVi0ADTORUkdAG1jqj9qalZvgE3xTPHAiSmtKZ11ktN0cnn64n9
	QU5+4Mh8/E7bBMUnk6RjNeKzfykgCVmTRWZGGhJL2slktP1TlYnsXykAfyWtYPqsq0QI35a3Oqq
	UNPt5Q9v8i42XBorrkxCvtmE4DpbKlwMbHQ8y5LVtoOM6hrSOYIMjjU2UlZ3rswV3Si7b5DK2iN
	Qr+LsXqXgLtWT/a9dnx5hwFlBgFugrorn+J2QONi01+Nis2jaeYflJ4mKZZzF32/MWHI8tNxHVO
	F5F59Pi1108LsCm6NZXpOgDDG5wQqsQG4cgvSBh7qo2ofTwhhdCX3dEdKvTlkagAtncvQSXJW+j
	ceQBavPw==
X-Received: by 2002:a05:7300:8609:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2d589178770mr7841093eec.29.1776071815295;
        Mon, 13 Apr 2026 02:16:55 -0700 (PDT)
X-Received: by 2002:a05:7300:8609:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2d589178770mr7841080eec.29.1776071814764;
        Mon, 13 Apr 2026 02:16:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa571csm18349212eec.10.2026.04.13.02.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:16:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: arm: cpus: Fix and extend Qualcomm Oryon compatibles
Date: Mon, 13 Apr 2026 17:16:23 +0800
Message-ID: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MCBTYWx0ZWRfXyY+G3HxuBBqL
 hyKQ7mllfWz8+87yloVDXrHxsz2veqCntLrwWr3rXv3Tm6L1qUmyFlb4uXh4z5Rcjy5zwmE/8Sp
 fowtNCEr1qHe71QPpSvA0WP41xGHZKPVyvAcRZHz5hYxmNWLG02VV5m3hEcyKKrOaxsaPIRW4Dj
 Nu8WR9ukaQ5JM//knRaHbavRA5C4MiVXHD1XUTABUvfDsH5NCczUYzHACEIPzPVXBSLGkiPRajr
 fsYzgQk5bRPTqZzKv8KXjbvqa1AlB0k9Q+Ek3SG54cZcIRCv3bMcAqSjw9HPwp23F5nSkSFxtiT
 KkmIcvTdLFE5+ZiaetR7ADOGPTyvjtz9TMJxYwLwzrEtOoSx+foXh97w7DPmo1LC+7kwpsg1/Za
 G1/onRa6RkIasgOcTLOCY1PVen5bKM9YWTCTSXosB1FMX14rzsVMNPRdwnBt+GZzkS/lTkk81+d
 9PFJmQLaKwS70HVqC4g==
X-Proofpoint-GUID: dzv2GLZphYqcM1QPK_MbYE7HhDPl1Tzq
X-Proofpoint-ORIG-GUID: dzv2GLZphYqcM1QPK_MbYE7HhDPl1Tzq
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dcb488 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ewe1H0Pqv3kREx5oh8cA:9
 a=UzISIztuOb4A:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130090
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
	TAGGED_FROM(0.00)[bounces-102916-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E7C53E9CFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series restores compatible qcom,oryon-1-4 which was accidentally
dropped by merge commit f6935ae6147b, and then adds qcom,oryon-1-5 which
is found on Nord SoC.

Shawn Guo (2):
  dt-bindings: arm: cpus: Restore qcom,oryon-1-4 compatible
  dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5

 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0


