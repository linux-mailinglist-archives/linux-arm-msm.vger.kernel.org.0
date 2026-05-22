Return-Path: <linux-arm-msm+bounces-109327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAgzB6phEGphWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:01:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B30D65B5BB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BFB73028EFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E7343CEFA;
	Fri, 22 May 2026 13:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9QMcUOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOGZXXez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F184743901A
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457226; cv=none; b=OJHBnu/dy4//E+6IuSOZhR/I21cBh9vOwW29CxUlbXb6qd0lwBh7Igxen03J+VNa8T6SwryAe3mU/P4ZyfRP+f9eCeKULRYUIET6qSp40t7VVVBx34ezpeeNy6uWgBOsMlYRNqN6UXYcAqGShe5RiMAypPBYHkBVAYJhTD3IFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457226; c=relaxed/simple;
	bh=yKvgG0rTvuvJLcjw7C6atYAtuGT91Jlwk9eV3sVaoBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZcejbO4xLJ8mkrZfRht80w88iRtWYP2clg+mbpKXwAer2H1vFxezz0vHf4DadcC0hYqMLOJ/Cyjh8wxF37/+ahpku0D8qMXZAznw2pFmukRbwP9OymjjuT68AZMx9cDsUsMvvtuLJsdctepGS8IeYaoGHPd+49Lhuz8CZCmkXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9QMcUOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOGZXXez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8sC562765182
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=; b=V9QMcUOi7GuPFjlk
	iWsdKoKhc5xnnmNqA0jCFDOGNwx6V6T5eNUHnqAMEHx8ivt1habATb0HlK1ov731
	BBX/0y5CjhIaETy3u2BdCIx/G2q+d4wb6Rci9txyiVFK5yQRta/etS16TAXGTI6C
	Q9gbYtn3lC/yBbW4r0+QArhi/hVwIeejFvhmkHCjwM+I84lHjwLaOryxzD+3p796
	KuVkqmCw0dJOHOMKjGnqu0dTsupbo3QKywOmfbnZ5iHvsh/I0vwmKV6ubhfCvxPL
	SzHkR9RKFkuwjHkdOcg92wocaDkWFZeFhPpqGscNHbCyO8Rc0RyxpL8o36BA0/e1
	g1y2NA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7w64f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514ae0e3ad6so186240331cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457222; x=1780062022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=;
        b=TOGZXXeziVN6nRQOSb/FeaIh5KGZ6tlHxbneL/e4SR7ZhcPC8epqGPv9DeTMpN4s62
         4Fmqm7l1S0IoM+q+y8oNbwy67ZTQWHmw1JvqGHurXn+WEYf3GDWsOr8BbNCCzu7dNc11
         ZkXfsRvfl2q+u2vMd1JhN103vEtttiIcYe3p3gefWNImo528t2aBv1C2et+xxW10RIwd
         UH6CT7pBtaqeFP5gxG6nbGOwlPf1Rgsg9CqjYx2A39n7bOLoPVjaiZVmKsccCPMZUVC/
         COJl/H+7hz8en+uhEPo5qcY/AEmwOGkd7Ty/qCehWJNbTWent7r7soK2rSul5GDMdQbJ
         VjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457222; x=1780062022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=;
        b=lYvonWvfpfF05iHDLPPHinOkE+g9Tyr9SzDKWGfbGNgEU8OG7yG+EdMqZGwa3qq/yx
         u51+M/HlGX3yVvNnDAs6yEpGNu2XIq7WTkNaJn61NmqQMYx3KtAJk4wzwQE9EtJwmsa8
         O39YvyZxh2a/vg8uqGLOnikC84YeZ5GfTqTsRYIa/YLflYZbLHVzfld8OTXYTDDax9iR
         +6Rbkz36kzqisgO4iAqhvq0WT4rzYcGS4qsPxK6Jw8zdp7rnLsH1SwjUSS0FgfT+3OjL
         Dhu3afIzuodGt4T6aT8b7tvktecoh/PP5mA9NZ/IRCz+nrDtuzIz1NAD2W/0oVKoFBrf
         b2Lg==
X-Forwarded-Encrypted: i=1; AFNElJ+GEL9x5RAubNs81iMCkO89+iyAZOMVNIf+llyBCyjKEwDQUlk1GBn4NbjVWG2LZZU6e2oe891U3DHac+hV@vger.kernel.org
X-Gm-Message-State: AOJu0YyRL6Tq+KkTKjh1wzCdTWQYPHvzM5wyVUiKt0VJPAcWDNBtyMtF
	T7wp70YKCi0RNkzji2aMlBhvjUYn5wZlrwLvZVt+VfoFf3BCidGXKWELD2fv0lrxAXufPqBq9tS
	S6ugQkUdEdk7odlQuv0Oflbi8Xc3ydaezpNsbNHuWroXrBwUWhMVerpR5ZsGwsrDVxQiK
X-Gm-Gg: Acq92OER7lXeAj/XZoaUtMIjFaHbcdVB9h/M2IiYx5DG5qz/C3LY3g+Pq+CJMMwFhW3
	WpVDxKCulebEk+AkGHSPhlwu0y5L/wYYnfXzLgwvyuY/xBMLs6J5DWXwHGt5VDsaC4Pj3RRgzRv
	7rxCyfnvovCemuPnr8bTa3745EbnBt7/r3bhI282tRTNJqWZn1v3AcguuD3T21aNOpCOxyssydm
	2al/jtN0m0QxiIy+cXHiBr1tNglgrkTZ8yvxIeNgN6EyIDZgGK0ctVJp7g///eYb83gxREa+CiU
	tZ7Acnua0h4LZUY5YvM0FWcUlisJboebmbV7mWoBS/mrrYLUbn32a7cM4blW8xC7GmWyBb2FBH5
	LVU6bXcmtoxX6gS1UvyVYuedpbRN0ZNYwfjPBv20jfAF3JwOfLw==
X-Received: by 2002:a05:622a:a90b:b0:515:7d69:4c0a with SMTP id d75a77b69052e-516c54cdacamr67015361cf.2.1779457222333;
        Fri, 22 May 2026 06:40:22 -0700 (PDT)
X-Received: by 2002:a05:622a:a90b:b0:515:7d69:4c0a with SMTP id d75a77b69052e-516c54cdacamr67014841cf.2.1779457221737;
        Fri, 22 May 2026 06:40:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:39:55 +0200
Subject: [PATCH v18 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-2-99103926bafc@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yKvgG0rTvuvJLcjw7C6atYAtuGT91Jlwk9eV3sVaoBM=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGoQXLPIYQPrnZ/xYu60uh01cd0qPgA+V20Gnmo2k0X5SkfnW
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqEFyzAAoJEAWdLsv/NoTDIUgP/1Rs
 8KhvkXDlop1eW5Zm2UYtzwQ8MWsBJXIcYHv/LvM40EtGmuKFx3Dv1xPh6uG/54rAtUWB6pdUTt0
 Rt9yQ7eXGUbiO6q6HRm0Nh7SCwlHZEAAmfB/vUQqNa6+FQ+vRujcfXj3tPs41Ra7H848YAYrCJ6
 tMMHzVsFSeQ2mEQ9JDc5cn+F5Z3TWqq7uNfrAxocXFAvdO7/eg6zQrjEbqvWyPB8xxwK2mSoe0d
 tTTRZdmXS9nGoYK6CWq/r9W//W9Ur4DRnzVOBCXsFBsm5Px08pp4sdFZOQC/pBM8mOnZVLmBJ11
 tMSI+TuVsEkxgEfu3OsMZQrL42RDjyrOl4bgXD6GiFERrp6+dU8+KsQbzdMmRTAi30wncJW5wD+
 0XevaHhE2m1YkGstKi6MLn7JQYlXZwkVJM/2k2BvFRDgHel+nZp35Ple22kd/s6/Vw0CIIFlczO
 kGtLE+okV0fbXc0IXMEZhP2ybDw3YrIJQQqLl4P4R7EqaGGcOZEHIJRsZ+ijTZTowqV9854hMnp
 Qu52D3mczLLjgod+IrcP+e5SKtmlZa3jc+mdmI/N2lQiPM1unFZGtUoQ06Lxl/ljfLNwwU8RhIs
 w7g2bdH6iZsY9W7MZdpBnc2SWBMojiIBcy2eF0Xgcj6Mnq/O/84w4q0MwypJDN0BigyVnVRWhT5
 GIU7R
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a105cc6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: gCWTUeO5T8EMag3zODF-a2G988h-Eelo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX6nAzDHc5RZcf
 bhIVtVqk8yOHCfTUA6Gm4goOkhvcGvv9EDts3BeEmAVok6wFxrMU4fxKiO6WSGv9UsetW7DOHK9
 NsNH3AjOCDvb25l2okK5zGlgUQCBbSNTIvw0QkL1GJOoPZtxvAIaRE/JFEM+qh/uw6JPIiNNL6f
 Q9DaWt2G544EyHQ3fJ4fvJTnIr5owHxegv9C7cIfKLM6WWW/f5BiuQt4JyxbG/HLGbFf52bijfY
 rpgtC7/EgnNRxaaDgrfDa2TqH1tZzMMmliDc1H2m7K5D0zrD8e1hM3CZk42liOPbI8C6zBPPILG
 0kjIhToYsYN47mEVbDVxQVKJ10cx4SPS8OKEvIEAO/guz5vXD/iXk2iMN098HJL09YW7ahAvlLI
 UaiBFCmeNryOvmgWR6XSLvwYdrEoBD80zU1PMKaKtpNy6CE1YBsAzgxWjcQL4T/9VkcB6XzXZo/
 cq+zZZcNPRM1BW6N9cw==
X-Proofpoint-ORIG-GUID: gCWTUeO5T8EMag3zODF-a2G988h-Eelo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
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
	TAGGED_FROM(0.00)[bounces-109327-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B30D65B5BB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path and in remove().

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..b3d36ea79984385fe0d05ce56042d3e6e3030c5a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1302,8 +1302,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1336,7 +1335,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1355,6 +1354,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1371,6 +1372,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	free_irq(bdev->irq, bdev);
+
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
@@ -1379,8 +1382,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
-
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
 		tasklet_kill(&bdev->channels[i].vc.task);

-- 
2.47.3


