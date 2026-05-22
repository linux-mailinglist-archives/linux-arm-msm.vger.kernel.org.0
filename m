Return-Path: <linux-arm-msm+bounces-109330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AClzBOJhEGqyWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:02:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D825B5BE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46D0A309DF3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27DA43E9CD;
	Fri, 22 May 2026 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3BeDV7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSmZ1cmA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889D543DA51
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457232; cv=none; b=KBepvGKlSS4ak3zTEzT99/j12PMA1Dib881s4iTsIHdRNoy+hekheLJPufrC0mphVRqIocu1O64DNIRgzD63KTEvBHQiMzeij97r79Cu2ORNAQvCSGobJnkbtFttNKdB7KRX91WzQOHTY/S1o/q1Sovkl21UHKlDqDxkzfIJMUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457232; c=relaxed/simple;
	bh=W1SOKd2RIQ9nozxC+fLn2sIL5/s1so7KiyQzTPwT+38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJ6DAHhkl3gMhKE4CcuCTYF0P5xQOtXJ4D3CEp74XyBcmUXZnNGeF94hl/cTbk5MChHdRaQjTBQxtSS8ZXwxgHBc76nepWiTP27noLXxWMisxkhaRWSwNdjjM3Lb6zJHl5m+uMPfsR3lHRWE3DJWonQVaXubfmDdfpxlWkGqoQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3BeDV7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSmZ1cmA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M989fZ1815982
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=; b=Q3BeDV7bYs6Iisvy
	rVyqZ8B9BBRjnkLdFbF4k99xPuPt1P0Crd9bzejmb1Qm0a6EvrUvFGZK/aKhsia8
	sPlJBJhNbL/zwmmfAW01mgIDDzHHHncCcSzXDrrQZcXUoRzq0P7rtRHrKi8iOHqW
	odNss916PK6JBOr57rzFIKRDOyOFPqB460GgX1CIxUnThwQObJ5x0hj5oLWjSuBX
	z1OUdiok0JKRHmzezdMk01Bb8EC3ywqUMhD7c1j3XpF9NWTHqoE+BqblLLSWBe1m
	3LlF84PepGhwQDdTpJiwy1a7H9CrlDBnqk3Cc30PeDRphnEWeDugJsGoI+T9wmat
	4y0frA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm262y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d1a8a6c8so25646001cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457229; x=1780062029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=;
        b=kSmZ1cmASR6yXlmWkTEfH4uMmxgauXECq2motigdF50fh28tUJqQH+uxD6rZl/z/7k
         5RW6TaNreqQpy1MQ8herHbPjv2ojEFi2yDaK6UDjf/n9JPNLyGoX4BymiXuzjKASORIh
         73choLmXHxu31EkG068i6NlLKzRsFMNqzBMSbx9VeA+jl0R2nyzFP8MJA9XRdUiRuF+h
         GdqXWG01lCyCqZYFwk88eopdVEKeq2qnrM9s0qMOp3qhFfwdnoy69TXdCg+1Wk3pPS6P
         MJTw14xFUFMzGR+R8QFgBRcr7qSnwRcNi7yN6GuoQRkJLLq1mDNfGQ9LtOfNcZ2HhzPp
         l79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457229; x=1780062029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=;
        b=GYPSBNY9p/yElvHNXOEI1bpvSKK1ZjrvJ9nQnpgdNYE4KFGhIJBrnf7F91SmTJrGh4
         M0W2tj6mZM2ht8/9Zb2FDLrErk9PDdMLTIzu5fGYcL+WTBMwqnwbUR90iKuEaMZVbl7+
         9/zYDc/zssURiZl4POV75IgF6DqL1lrJBTY2p51AMyFww3kt2hX/EOqus8ef+Mj7GtoY
         VB64jAT4FPHRijN86CK6NZtZ+pKbhCxnsW4fLZ7obRqKQ9dSn7P3PG/IuRDMmXhM5F2a
         kVd2eCuhpSUQ3DYyI6gP/X2F9+FIuiM+Lcz8zv6hHUlwTrcZjAkfwmJy4Zh22I8n7a+S
         U3Vw==
X-Forwarded-Encrypted: i=1; AFNElJ9haQo6nCW8l5gQRNU6kTxsU84Xif2NMCxqw/jqZ/Y1nvwv7oo7QWQ1d74i68HkW2aLdx63y4CQSkWASbpu@vger.kernel.org
X-Gm-Message-State: AOJu0YzFlN+BnufUz0c/cSG1/l2CK0NZ8pOuRniwfU8FDoK6t3rmaQUl
	iZ3vGF74R7R2lCgQsk5O5jpOX31pC/isVkUd6N341l0a6TNrPgqUoHMELBAkWeNsMOKRy0LGYWX
	X6ddUaurrYJaANUhue0g43DDpmcv5eNIzH+vPyOIThXcToqxfJGiKQeXOkChMHn0RYaia
X-Gm-Gg: Acq92OEeV1AL1s/jQsh4PeZbMXn2sIgeue3Qoz/5CAhilDsZjJdOFsiquDOJgKnuYDk
	a3SmkYysiztGJsUDI5PfZ2BzONXPCb1Pvs3BZ4M7uRAXvwFuj8Fk3StIE6leWlRmeSpLwothkT+
	kOUsVI4NAdTydu08Ftl0iZpl4odgVmDchsvkIlykUAS0zFxsNlHS+RUFtgntVDqxa38VnyGux0s
	iA9eiD/a0w56ao3/oRjNZdxJm88u2whxycKA0gHAVxVqqTn6pTwwnh0WdtJgY3n27l6TtRSVX43
	Y7w5Q58rNsubm+TNZCdSVXeTrojzi13xec1Iq6lEkSIpwDDmKp2ijMKRCZBeTnW54S7AaWXKE4k
	UdWUzv2XbTkVy5Z/02GxG70R6T5eGLwoqfqAGTI8Qchw/VVXMRw==
X-Received: by 2002:ac8:58d4:0:b0:516:d2cc:5160 with SMTP id d75a77b69052e-516d459212fmr49798731cf.32.1779457228721;
        Fri, 22 May 2026 06:40:28 -0700 (PDT)
X-Received: by 2002:ac8:58d4:0:b0:516:d2cc:5160 with SMTP id d75a77b69052e-516d459212fmr49798201cf.32.1779457228286;
        Fri, 22 May 2026 06:40:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:39:58 +0200
Subject: [PATCH v18 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-5-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XWQU2M8GNJi1hTXicUIAjauPbHJI4z5KvicdSabu0NQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy3+8CwAWUYGtz5ChFcSpJ0iDTEYSKzMHbak
 OKb8pYpuFSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBctwAKCRAFnS7L/zaE
 wzgID/9fxcVgxjsMMtcsIfMmsrA6TLSsgpemAxxT/40RvT0jg5qrmvtvuKjU7DBA3LruRgkIUBl
 cH6PqVB/NxyAEgQJ2taTQUiIJdGgcFZxckR0jq7LBCgH3vlQX980piQjxK4JXi3CR7PI8k0eC7Y
 2LLbZvn2hM8DLjnY/ZqShrSvILBra1sJZt8aREI7frl1ZN9qeoqNTT1txH43L/8+ovfKoIMWK9O
 4ZCQ31MvqIOgpOAKDIvZGMk653f4HpcH5y9dmO/j3+MEsPcE/dM94QBMj1zYPSKpUliX+3Gjs99
 s6fOret4uXBcgSec9BfQv8vOhoG7dB7KsUHwHhyWi3hkkCcCi1LDYUXV1Km2Fe+dNZJFLkF93vy
 f6b0O1bwcSWyUZU1Cbso+mETogeowV93qnfGDOs9wUpgctZF9Q/5B0hjOu9omJ8+bcpSIWdfQrz
 OdLdKNTuEWawDE/ih2ASVNoe8auSHcbM1QReW7zW05PTL+ZQN/Ls5k8jZr9K0Bd5ResQIG0uC6+
 qlmekYdXlM4XIgA3DNVoTRyLeaKW9ligxe8c1bGvfBWNar3qokt/mCDyZCgEW9CB+e062+k6BIG
 EYmdGM8dWBzvjH8aNsMaEbToKdMrWYaLaHi+LEUpkSBd5repkGloyVsaCnbzzwiE/3z0TuOGS8Q
 ZFkWIwO2J7wZuww==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: hCM9NsjxKfxpUm2P1V7gYbRQlZ1TFkAu
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a105ccd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfXyGCUFVw8Y7IH
 SYgZd9iSC6WixLLD8SKl1pEPHPjyafn51XbKt9oTWczxd7yQTMbecr1ud+YGj2RL9X0a8mhCeHu
 HDTny3hguGkXuyMr8B24N9HJrmVJ8lAGh280favX3Xe7+c2R4R2xB8TgW0UoNSKM7QkyZbMwJPq
 oKi+lpLrQo0oYkyUcq+1+aw1aJlrvJmS+5Dkck2C3wxSW38/2uneFdtakXCaVH87DDcmuFB+RT/
 Rsh7q35EelbNiYmegXUn49V/AV+keLJGD2oQivTGKYB+NrusQQyAFsc9qgfwTaEtRx5e/nT62GD
 vjVQ2JdhamT3ttZszmsUABhWtTLxiuKxpEsBSD5SKSpBP+ALE3tmCPu/yEyPuF1Fxce0LLksGtI
 FdbCp8nEBk48VUTEC2if4m79tOMHMtYs3sDF8Xo8qH7kLdKidWSMPpPhkH+N3bTw4eIet1sFcNn
 s3gz55j0QQNRl2EGicg==
X-Proofpoint-GUID: hCM9NsjxKfxpUm2P1V7gYbRQlZ1TFkAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109330-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69D825B5BE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2129ff5261571581a2c086c13dd657dc63e16f90..04fe1d546be73f074c66c4a5712ad65717e10929 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


