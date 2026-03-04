Return-Path: <linux-arm-msm+bounces-95312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AhoJe0uqGlPpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:09:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 132CA200130
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD7DB309FB9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B5B285CA8;
	Wed,  4 Mar 2026 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agljdLx+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9ZLpth8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216E277035
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629642; cv=none; b=fPrNrPyFnanmCbkJQCd5zgQA5Bu7dVKBB3LN8rXAwXPZPY+6PHKUwi2+mMInWLALOB/hBnKeUG9gW96/ASqM4S+RDJS2q1abNbAUgrNYiyfBLG2GygX5CdlzCyMiKSSwme3oLlhu22oBVL5DwDMTijYixKG+TVO+lE5noyaXXUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629642; c=relaxed/simple;
	bh=fldykUob5Z2453rW/Bu+WyVup1MSOjtxkIDMh+tQ1tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfLhP1nlafgOMMxx8RExpVUo3O1zdvaTdGNRjiyduqpF+fSSD8tiItxU4GDktDoUTUilI3epcGWpi6pl3Vil0KO9zmDxD03OfTe1VrACHE/Q6eRk+7vKbrci8XOJKl4jjttnuI5P5CCGEyUNyZVrO8IM3uU0pbOJTyl7gRm+Jh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agljdLx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9ZLpth8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624ChJRv2861376
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xEO2oGNAYFh
	ISLn7OT5Tnbx10tCrKXxJuovsEhU565g=; b=agljdLx+cxPzcUVzBVOIsLql/em
	iy9AQWlyf8q5bORCFczmpdX2CI1Q9ANGflc5qYghtqlEgDmotcdMfnzE33B8TPre
	2spOcRL3RHhwIensSpLIYLiF3x2ZbNrX6pguhjq2FaC/nfJZu4RY2Rdtous9snss
	WqMqnq9eOXijcpYQEmQAXbPF3wBo/VgwoBgaQAcHLTCRWB1C29u62VT+CyXO+m9v
	3KvnASUuvlz3NhwyIL0THlWhL4W4kAuXXdSbg5jin7DW5BemET+RwQj0JneZp+U7
	EnMtP9X9YlOsF51vUjeA8Ld1NKKBbMuQHpAiXVm3vYk7vndVY5dqksEL2bw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9kymq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:07:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c882774f0dso4258101685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629639; x=1773234439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=R9ZLpth8GfpwQgYgphlGuWzPDoDYG7LCK1+THUH4b1HV7mnROcuWNbdg0+csexuyLX
         wO2PQ6UHUGZtmzGTPnCGmF351EfsM/DFTSU78W2M3nBw6BLTXx0ajUlNK+bcnSieXc5F
         owkGn8hxN2JC123TXbZ7K4Fh/LOOU/wyaIJfqNZGQbmGF/r+FKmuJd3rkymJLStu6ouF
         P24tKwVXAKfKbfIP9TWyyLEWDJuTfrgPdlq+5qPJoxr1SURCXTtJbOPO5mE5j7ssQSs0
         yvTheK4LvsRYTaY7WcJcABUPjOXH+YONSVgIpYmwS0eRxZr4Yh1LXTocWd1ZLtC2r5mh
         X2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629639; x=1773234439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=UV0BRlpWFBVhdw7SpUY7gcREPuk76mSX67Ju3BBcKUrv23TplD/1v8/uQEIJWjnwqM
         e4EkTVOA16hss7520AVEN5G4f6nQjIqPdLPGcz4wFCnEyzk0gniZVcwRPy6uuPwr5vh4
         Mauxi34ZfSeurSJe1Wi6VOjfoxiodZh5fC1Cv1KRECTZ1YmNoM8emong8oqN+FpVbvz2
         095VRlcH0ytXZCemKE5YVmDZqozEh9EfvTnBPG97aGfabx8sgHAFmeCuYj9e0pX8q1Im
         zPAaGV6JF51/KKXYgyjBAwvBrH3RL7hcAN0yjVIBmv5wYssyBu6kVPHNlaQUPDV8NHzB
         aE5A==
X-Forwarded-Encrypted: i=1; AJvYcCWxmM/9Fit8k/1HvKRUUOfghgwXETTbCv1c/anQCuOAlnPhzoY8FPkqWjbr57DAX68qAngai3FQEvs2V+oi@vger.kernel.org
X-Gm-Message-State: AOJu0YwEMMA3Il7JZSAPOrAASoTEaxJjMHG71alkan06hXtwvqFP4Jmb
	sm3SvZk1aOs5SIEYcWiICknLLeAAHlJzpvQSsfwne/k/63dznQ2LIYOPQ9BgKcqopyuXGC0ukA3
	ca0iVbEGHzgv6eSsPlMD7g3FaSPEVXEtFFn1byXnszr/08LjA3XBuGArbE7xH3jbAwcF6
X-Gm-Gg: ATEYQzxnpVHZLntOlpHMhU0XRZOiJTyR/CjIaXdLX9yk0TrySIw7li9jbNzdPw6OGI1
	3WgNPpfO/Jfw0bAaPDkg1JiuoFP3HqEhFGj0X+XVWPTWGkm74Fm2/tvNgTrbXCPwqFYTNastqrP
	16nZvS/s9//wH3F2g7bOFm6ZWGZGkaewnDxupFYono4kBSp1/Mzw05Lxm3oxRvjwhPkHnF22h5Y
	SGo2WqogZXbU0VokLH00WWzwPxp/pQsPTpWaMyV2ufgztzDLAOA5dUxhHBr11g62D3zMb2j66Ta
	r+J2TCXZsaSelYhzD8wgnx7q1hsjWF8JGnw45uereGpd97UxmM5M7lujzd02N6ZKAFTNgkC36BX
	ftjtON/KQfHZRbw+BWCpKEKqAJouopEBM0ylcLNfQmOF3Wm4hBFG0Jzk=
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr229278685a.41.1772629639590;
        Wed, 04 Mar 2026 05:07:19 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cd5af818b8mr229272285a.41.1772629639060;
        Wed, 04 Mar 2026 05:07:19 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 02/14] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Wed,  4 Mar 2026 13:07:00 +0000
Message-ID: <20260304130712.222246-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX7cvgs7x6pLHF
 jj6IlV72LkyyWtN7P6Q4RYB4ex2UXfTAvWVXu38jCcIfo0bMeTx5wtwqLt4qEo2diHYBuYhkLPy
 wa2Qmabm1RkVnZp3PkOxOIe7YGjfU5ZF1iCDKG+rs7XopFHJmvUcFH9k49hogFZGAwc9KzwxxIl
 bRq99zw+Ph6FirpE5mCWiFj9WmyLAK8TQOLakeBmd6ri9exQqQz3W2YUCBadiJVwGHSyyLPU0HE
 21UnNXp6OOQNM8MP5w/7IIEG+GSRkaFAUrMZiG9Ap9jKYJDuYGHaoV+SMvoHnpSKdz03YnKsUBU
 GRJswGDLfm7GQ33ph43I6gx8gguuEk2LrQBLYNRkJqCj3NPKzf0JSzY8d1G03iZybTSqPjDeQh3
 sDnRgilvfEg2BAl9/xjfvZ9pmeAhV66XzLQ5r3l2Sqa7vNADDHi/BoirhjHX0t06Ba1FjEdjF8R
 Lph6BPvQxoRjmxEMofw==
X-Proofpoint-ORIG-GUID: IXg_n07PuDr8qwhwpyYDnvWFkeVGBUCe
X-Proofpoint-GUID: IXg_n07PuDr8qwhwpyYDnvWFkeVGBUCe
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a82e88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WbEMVPVtDBSXEMPt_8MA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040105
X-Rspamd-Queue-Id: 132CA200130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95312-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by using a manage version of of_platfom_populate.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index a4c662be52e0..ebd5e3ac0366 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -752,7 +752,7 @@ static int apm_probe(gpr_device_t *gdev)
 		return ret;
 	}
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	return devm_of_platform_populate(dev);
 }
 
 static void apm_remove(gpr_device_t *gdev)
-- 
2.47.3


