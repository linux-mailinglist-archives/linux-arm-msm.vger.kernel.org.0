Return-Path: <linux-arm-msm+bounces-110272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPjzGH6NGWpTxggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:58:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3D5602920
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 232F530643E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748562F3C3D;
	Fri, 29 May 2026 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aa2MPFjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcnsZIz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAED2F691D
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059373; cv=none; b=YthL+1HtS0VXnvwV7cOR9pJ8s/Ujhz3YITXeAP7x1JlF4REe8yn3yjGRGj+rK3WPebcck3ZN9vd9nZaoRcDhvyosNnjfGHfpUo1zOrTPUbNGlOjLnYaYucfnoyc5Ni79KkQ1PvfJq1xv78zlbPmnBTtA6o7KiJINLiaTFhz34Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059373; c=relaxed/simple;
	bh=iTiYhpelLpWGgfB/Al47OggJjvyNnV4VQ2i749ZYaSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dzKoDTM5cU92IP8m0IK5ZFUUceoi2IqlbZo3kIIMOaBhQyDw6tVy5iSWCMDKUTB/Hy/ZGVsBI5G9LV+H7Mw0dyHrYYlzatxRZqGGoIer8ZFi86HfFPRo7Way3HN73doYbR4VOPX3vcTCqRd/OW9jKJxwXdqph8UfMpjVtUwIwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aa2MPFjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcnsZIz5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TAKr5Y4194208
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9Nf90Hi/6HP4GIlolES7iM+gOdhTefJ3Bt3sz65J5A=; b=aa2MPFjVxtv8LIVq
	52vVKuSsxgR4uMpyl6tFJLDQc7pGvdnlHJp+ywSnl6SAxO9GecnekOShcNbd2+CE
	TW6nQ1s7NkzHfGC4TeDd4QBCLU23X2zLXk8fiUXWm5W/VBZWCU2mlAr6c+Oa+LUb
	4RYI/xIJxecLXA6QGYjBTAwnL+R0cmteq+5Z2Tifz5ipnWjqOZM3NNUwbZQH/SI5
	BEWox4F7/kIiKUKH6szacin8h6cYxeAfW/K/T0nVVByB7FIgHB4dbaKKf1xRMZ0m
	ZF59vLmvxuhcnxWdUEgfFGVjDYMTQU6z9PFaxxPL17jXPjV0C6OodMsbXojLwTuB
	L7fdAQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te1yr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:56:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c828acf7c1dso18646469a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780059370; x=1780664170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9Nf90Hi/6HP4GIlolES7iM+gOdhTefJ3Bt3sz65J5A=;
        b=jcnsZIz5LfYbZIPcDbAwFmQGqGfUciiCf2qTP2XTVvxmmbg0mtuWA5twGhvgSQKJWk
         PMCIBMl/QOUGTiDxN21tpOvxvaHE0AQzxQwmnvB8MgMSOZzUl7V/G1+/KCbCh7HUbtjt
         swcZxH45ey+mryA8Erx+mh2cnp7g5j/FpETuwDJBCiYzsHY0hiP9XaTrH6UbpTa59y8I
         XwSrr+Wv0gMgDLwnrYWDkFLIMxh92agwdp/QXIsnKMye/HGu51l0zQ8TzC9tpiUPN0ah
         k/QDhLu6fncgoUBx67GbD7+p60GgMbglCzNg1GVi2QbMVxpCLYjtYCrgNhmowECvsWKf
         xqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059370; x=1780664170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T9Nf90Hi/6HP4GIlolES7iM+gOdhTefJ3Bt3sz65J5A=;
        b=VuIPkFmfeRvCW0evJFoAa8mN5dQ0wLmzpfEiYUMbjdaTTNGacrspwCL0DpAZGOmBy+
         lJJe7nTkegkum9+7KXb6SPdAnKkWLtfkfEHbzyzuuH57aIGQATG3/egAFmbe0/qB2YeG
         7nJ60zNq7TfL7TwFKSjRo+JE2JVYUdECgiOsJ2ZmvKnwQVn0VdflDxraon5McTv6wSPU
         w0Qhk3lybSO98FxVJhLUlz+rUGpZJsckYB2YR2c9ekPMyP+CyvFDv8J4ZmTxSLUYkP5R
         Lg3vNWriXD1E+nMSeGNUBxUwLklx2lmMvNlQdxoPWhVt8TcoUkO1B98cHmRlwkbaPCGI
         iYCQ==
X-Gm-Message-State: AOJu0YwUj96KVtdkRPx3ubDLGKneyNWQ5KNJtYw0vC/FZhJXcP3mpSS5
	ZkPIjAeQR3yBI+Bsd5ibO/mtG2uaRjOP5cuw2PWf078/+Sz1Yv4+8qMqLgXAwukmXedCHoIn5y9
	m4UBLXyQRKlhdyho8rg4e5ogyv9oUKt3Ziaq5lPMYNjbkz8TZvXxE4EJYQ6/lg8sFlvs7
X-Gm-Gg: Acq92OGcqKtNHV2bvSBu0H5RWr2/5zL+xEkAN8vdjyu3Bre6q7yEGXvBunXadHsTtpA
	r9hhtWj9OWvb+QTqueA4X6Uck/lRhJQWsngV2E9vxds42Cj/J+nkGOGALU46SSzIXxSY4Y63c/K
	pcbj6aWQRmg9kHNCKq9JxdgqYya6gMLC+M3Gi3CoRn034Icwp0k9WDKpsH5UT7QfTMQVw5OYc+z
	/OZiV3+X/sdhg+NlHnX1XWAsR2hsTVvgTmOaeD40EpESI+fKnGjT6wpd1mQTyQSYs13xI3nDxVO
	fvKvSXoVtATnrk6zHmofzYsk8W41s5UY1gSns33DScCOUjlUzHERY3yI1hvMZVJhohsRz4tA/Pc
	nPspowN4ocTRWubjSKzzpAFoBHJhBzt7KXjNH4zcgidsiYF4iwMqEVrpdKTpeSg==
X-Received: by 2002:a05:6a21:a04:b0:39f:a42:9251 with SMTP id adf61e73a8af0-3b411de8796mr3439900637.22.1780059370115;
        Fri, 29 May 2026 05:56:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:a04:b0:39f:a42:9251 with SMTP id adf61e73a8af0-3b411de8796mr3439854637.22.1780059369614;
        Fri, 29 May 2026 05:56:09 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a7c24sm2119680a12.2.2026.05.29.05.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:56:08 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:25:46 +0530
Subject: [PATCH 3/3] pinctrl: qcom: Avoid assigning thread_op_remain in
 unthreaded test
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-tlmm_test_changes-v1-3-88bfdccb4369@oss.qualcomm.com>
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
In-Reply-To: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780059355; l=1056;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=iTiYhpelLpWGgfB/Al47OggJjvyNnV4VQ2i749ZYaSc=;
 b=8rskZm0Ft0bNEFtOzsXTRap4SzOqcPM01f9uFoQ5VPdviVg5K1+/Vw9wolQ1788k6qS9VnxEL
 3alsQ//x+2fCw5Fxq3j42UP2p1BUqv5uU3OLd+96XhQGdQaYZnPB02+
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: QB9tDXl7v23LVWaLk1tqMNCwxRdt0--v
X-Proofpoint-GUID: QB9tDXl7v23LVWaLk1tqMNCwxRdt0--v
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a198cea cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=unFxLnwcM6tLXp7VbdoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyOSBTYWx0ZWRfX0/w/KC/Y9U6g
 4H5GyRu9sP3SrGqQyLEQ3vZlqF1SYgKRo0Ox0UnNybbumgql0bW9aDYU2KQj4D5db5+mwYBZ3XO
 sCZHonsDce+qZ7NCeI4lMUc1RiFjUyOSzyAJMvuB2okYrXHsp+58XW5Se/2E0YqbjV4OGIm2VGA
 jD12/wrC3nQdVHJraQ+xSIzzvCU/xRsgV55H2Quj/eKd02XhbhnAi+ehN8nYvbur3TsaAQnaQtR
 QG3WQWAGiwK1Yu7RdK3VsqVVkLaoJkZVxTLXk4G0gsi90i47Tmv3jPzHLBpkvNGFRexZBpOYp09
 3iHGAO0FejyqSboCQRFit96oOWO95BzNdyN9ydU4xyHMEKdaIUUAD82Pd8RX5VA9qoC4ZzsuJtD
 6MMZI1qhSybGXKjiRBkks4U2KFSSIs50I0rmoUlB3Unfhx4BZnhR8ZJVALBrIlEoAy28r1U8k+B
 oIr16wQPRyMSNe5EUWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290129
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110272-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7A3D5602920
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
variable is only used by the threaded IRQ handler to control the number
of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
register a threaded IRQ handler, the assignment is never used.

Remove the thread_op_remain assignment from
tlmm_test_rising_while_disabled().

This does not cause any change in functionality.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/tlmm-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 007d6539ceced294e81cfbe93a00c75a98c858de..e9e04300ab3687825255885821ebde0f3ee586a8 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -521,7 +521,6 @@ static void tlmm_test_rising_while_disabled(struct kunit *test)
 	unsigned int before_edge;
 
 	priv->intr_op = TLMM_TEST_COUNT;
-	atomic_set(&priv->thread_op_remain, 10);
 
 	tlmm_output_low();
 

-- 
2.34.1


