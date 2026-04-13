Return-Path: <linux-arm-msm+bounces-102917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF7PIJu03GlVVgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:17:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 101843E9B1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EC6A301939F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532FA3B27D0;
	Mon, 13 Apr 2026 09:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kq3EKPv/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfRm6fWi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3893B19AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071821; cv=none; b=JWlfv6YJrYuJqCAmZsF3AM6N3usH4Gx+A3aAbrzqC0H3RsExvw8CZsuTX0NJdWNawASEUfaeBsmXqBn2neup7GvcCJHBpuSHJFCIisLs5FgzGazXEJVzqUa+73oLc7j9HvnLTsRzRyruOuWOxAtwZm/MAiNJROCqShzWnuc/80w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071821; c=relaxed/simple;
	bh=yft5KZ9R1auRJE/A5VwABKRhpqm2vi3F6M7Ng9rvmaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eWB1ruRiUG/XM2qxme7pWS+zNytuYKEBEtp2rHEeup5KRBCh2IoDYKCmsySWHKLkb5FmnULlbETUjWl9T+Ey5A6nshoUJrsj3NZMyLG5p2auesNmZ9l9PvfCU+pscjjqTJVLcfv972H7qi0OUYed9mxqT6vx5AUrtXaetya/aX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kq3EKPv/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfRm6fWi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5CeiG3560421
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O2+T2YIzvBr
	pdMax7213av6/Esab10jipDl7iL6z/M8=; b=Kq3EKPv/RSZaKHAr1vSddr7AfxK
	XAaw/LXXUjma0rRg5ByJjCNAffG28pH69+LlHasLV3O6QZ45vd/pVJZnrIBGoZ7/
	TMVLhLBBJpsYPJnvYOrgkt1NbG0rex0hsobGwMBFwhHwtFs4G/Kz8s/3L4tGpo0P
	JppRXUtYt51LwabN4H03vIakdy5A5jjp5JTGb9EebxrDLAGl9wbn0jzjdyTsoJ/0
	kfCwGL0fhgYoelNezHwOjS5P1tVuZmrOSA6gQTqOf8J7VInVoeCz92JBB1AKv7y3
	A3E6deGydTXO2qvR0oHvzpAxsPs0p798qIsJPyldFUCQJAE0eRDLYrTPLhg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0mk5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:16:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2da19227bc1so740414eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071819; x=1776676619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2+T2YIzvBrpdMax7213av6/Esab10jipDl7iL6z/M8=;
        b=DfRm6fWi7sRyUcUzeDSXTldsKY8q0VjvnN+NqT4mOfRtkB3ZlLsKH8pxg7RaNvBBcS
         wMJUoUQ07kcsQA++51nU8p5HFJINY8MTTYvREdQsey+BpJ0/rdSW0gkb/5AOtP1kJVxC
         dTqeRv6ukAlRf2J/GLB+Tz68BEYuu7thB6R2grVDyzK8Cr08m7O8TO7wXN9M5FuiFWRM
         pzCFUjn/UiGI53h8Qnrm3jMr602ul2JOB5oQSXZfQQ4EokYBqAHZmCaf0lNVWGpuwPdb
         tCyq66CEP9MlqPw7u0+BIh8s2+tn0705n8gkNPNJmjWMMualO1RnLxT+jm9+W0uZ39gz
         L0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071819; x=1776676619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O2+T2YIzvBrpdMax7213av6/Esab10jipDl7iL6z/M8=;
        b=DjjdOjv8qVQVmXGBoM3aYwbTNqt1fWJ0SPIIiz5lwihyjBiOCwEdwZOruOrgldOy91
         FfLMYf/bbjVi6ha3oH99bC0FQqEDzstoxqI/9v5LcWOmjpREhsV6Kq9f4ndVGU3haJSx
         Q/14JmGUhUC8B5KuQRnalX+m0RdZ92xTkqDE6NZN/chUjBkLBSlp12DrvPYIoyosBZx0
         /p8jC//IHzAbv1Y48E7sCCSPoWNbX0IyxeudDpOdjqFUhguQK3tUdqKV+iXw7CooFgKO
         eEULvrklVMq0+vqLHZsXq4KlyMrcaLl5yrKXiRlechVEMZN8yabTPO+Yqq7M93ohQFvY
         nuew==
X-Forwarded-Encrypted: i=1; AFNElJ817fV5XifUJiWyL0+ILNDKwDmGuuiyfrxNF8ydnBvmX/nRwM70/LAZJRun1iDhhY4Fckkgpvg/h1ib83HH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz77o3vR06LfZSlHM10KSNDlDiYOGCEjnn25gzPp6U29BisiGAo
	tYKnPaJMmmQz2Sw7/KVoy9S+dITWVSoKlrxZ7B5ARY7egVTmigH+SdKZ2nYmVKhQrTA4hIkhIEZ
	rJdJzHeze0sZr3EYzF2irtFEdeph/HjRz9Uy5cZ5TFfTHZ/4pF3QZ1UwaPoToI7em7iUw
X-Gm-Gg: AeBDies6xQfD9xzAt5W0hdkeFvQRz6QERHzmFs83f3WYY+n55YVlLnScdU8pDJXlRe7
	jrourF51Lbyg40xZN8eXrpWkl/wpp5UlHnNAPKydqkG7nduKmNGh9/mh/oNEFuFJt4WvQcUjMYs
	u9JGpXjXg/ScteUxb68JAzLgc0oWOyl91HHj1By9gK62x+s/Cw8fqZ63rFI6lNwJXm7Fh17TaV2
	Mnf3xpkyvgHOC4QxQnx8UtV0yHgcHwoA36Rod7d96VTrsFbgI22VTWtfMg/0RMH4qZiCuZjEYwH
	j6+DzeSi8FS4VFgRHFiCD+LWVkRO3IHaowRpJCpnbI64T6aMYsRvhvBZ7leon3dUSiPl56+d9wr
	KFu+UmsWKkLsh4b2HiX4xVjNB4TUH0bE9vZMyN4zHJIsxCMxNjz7kEyNuWydZYiQFRylbCn1sut
	hRqdLINQ==
X-Received: by 2002:a05:7300:dc13:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-2d586992571mr6653809eec.11.1776071818819;
        Mon, 13 Apr 2026 02:16:58 -0700 (PDT)
X-Received: by 2002:a05:7300:dc13:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-2d586992571mr6653791eec.11.1776071818330;
        Mon, 13 Apr 2026 02:16:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa571csm18349212eec.10.2026.04.13.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:16:58 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: arm: cpus: Restore qcom,oryon-1-4 compatible
Date: Mon, 13 Apr 2026 17:16:24 +0800
Message-ID: <20260413091625.607976-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcb48b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=F5q7cko3O1bYObIGLI0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MCBTYWx0ZWRfX+xi9Ug9R3RVl
 XD0SXaaGZpFFVM7Joj7qGzJiOituDeaH/m3dcYLodQ0jRnhcZw4qmPtz6OGuSGHDUkQLsHRLVUw
 r6fi8LVYYbmbIqOwG5OB5hRssiMZbILlTwv08y2ZpK351NPv12HnpG5ODh9QFDvTUblOP3PgYeO
 dA9f57U8ybAfsli37Y+0TntH+jSpi5b0+kgTQMcCjc2I8VRr5V6XuvPOYWmJhFSEOmMY94F4shM
 9BALD3rzD1TG2kPV1O0AUxNYAsGJEqoFWPqGfH4JwKOoPG3vCKhDhn+igwVblIDod4e5XMQJaQ9
 4dL2jM8Y6qrtznyjbB2MluRe+M2x6wL7uNypegtv/DnxEx1lU4OTJj8HyX9uPn7cCu7jB3kIDl8
 dCQf0oD2X9z5s4s6OLwEixfxH1exiArsbGUDk+pBhWKJ2IiPwXPXKv3Z8KhPoBoWK8nmtfy0gtB
 3Tv+RLNWpe4vWZeH/zw==
X-Proofpoint-ORIG-GUID: 9hQueHWZpNzvbnOaYqUcX9ejdvq3D3M3
X-Proofpoint-GUID: 9hQueHWZpNzvbnOaYqUcX9ejdvq3D3M3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130090
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102917-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 101843E9B1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It seems that compatible qcom,oryon-1-4 was accidentally dropped during
the conflict resolution in commit f6935ae6147b ("Merge branch 'for-next'
of https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git").
Restore it.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 471902ddbb65..5f5ff5e51e51 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -222,6 +222,7 @@ properties:
           - qcom,oryon-1-1
           - qcom,oryon-1-2
           - qcom,oryon-1-3
+          - qcom,oryon-1-4
           - qcom,oryon-2-1
           - qcom,oryon-2-2
           - qcom,oryon-2-3
-- 
2.43.0


