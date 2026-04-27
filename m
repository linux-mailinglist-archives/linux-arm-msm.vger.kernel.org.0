Return-Path: <linux-arm-msm+bounces-104661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO4aOIMq72n98gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:21:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1552146FCA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9AD85300B521
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0CF3B47EF;
	Mon, 27 Apr 2026 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6KyCAOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfsFthoD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD22F3B4E80
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281384; cv=none; b=ru1OD2jq8/8L0xC1SgE0ZCXlPJjJel7JvzKJIgJhtx88ZF2NpTawR3I1fsL1Ro+Bgm5kyNzIUDFPbcSMFT5xyraISQyj18Tttvhub0itnejQaMcWHVrTTHnrFcewcaMQt7/X16qOylvCV1Q39AysZvATeBTiSNiWRv0k4Tsu+7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281384; c=relaxed/simple;
	bh=FnVBtOe0OnnBy34d5WsqwWSUvkeiYQ93/vJc1qwp/2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fSogUZJ+brCP7Gp7WWNZsvSuyX/PvMxY+Et+vzPTeyJ241tblVM95EuhaZER0+PL+ed1zKZsNiF+Q2VQMoHNJdrUVFf4adoNjm6GE65iTmdeEbGzFoWuUSfRCeR24TKgFnthuQFDLvgq2cgI6asArtQD3Bi7Y0y7C9FMnlMZG2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6KyCAOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfsFthoD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T9Xq2879342
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=J6KyCAOigrI6JMUi
	2FW4hWpKgMMtLx9sgxLJcU5fVxhKef1+SUGmBMu9Tmi0+bQm4xuScshXl00PzhWd
	G4ESrI5uCxyqk0kPsk/Zpqa+LaOexx8aEyQsxkkQCPSZHOHEfrXuiJ/KUN4DflHr
	L9yFLAgjb1OcS2LDWWI4A/91DZaW0sgjTmsjj/XDOb43r+KvpduM40lOvr7teci+
	o5m3UH5i0gGj9tw5cBR0Nk3qnflfKFix35Fr/hVxEc4I9EIB5IhdnaeX9xVCh2r+
	2RjfSPFzwiOlnOsHDOihnL+eVYot6KnJX/gHb7NyYBE+2MpcYzypDjap2bohXyN6
	xJ7JQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2wdhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so176697951cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281381; x=1777886181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=TfsFthoDLop8x+YtDatkE+UuEQ1uuVuT9KaCM3WDoMaD7ZaQkMF404aw9HXmM0djEu
         7nrJuK1VVwsuNzQYXYAphspRJPb63o9WL7Kx3/IUlfRalKnIh1Ys4HLSKZcdOUNptJbx
         OFzJMS7qmMl8bxsxtSb1o5RGPmRJ4EVZiGJ5mW5x+wc10uQ22hWC6S/+pQ1ncLS9YgQC
         ZlO16quM7gZZwTYXg+KzjgHKGl3M7Si7IK96gyJm7081/xULtHtuVZCcxcWCEYgEgwjW
         14OM5/S4aMdgqHgGxyFQA0z1Pi1zNKcrMvPY96FLn0+yxWyYhDbKYYNom7eUoeqPLUL0
         B6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281381; x=1777886181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=qcHwAe2ov3ykQ2qWBQ0jAm58JdmRxUJawYrxiafTSsSnsV3NW1xKqv/VvgIYZYmccD
         NXN0wPTgF9vD3wNXb6cvfFkc/CjUZyyBZz8vZLZkdjuUA3M4WUE6ItyZ1blzSBE461TX
         tPMHsQ99AJxdxiIBm6sms9ryo3SewjNsIo4r03txPQldm+ec6USomLG3euLgtji7vyY3
         QUSa2cXRue/5hVgeSuusS4WdiRft9VpKKWPtb5ZNFCzB6p3Y7VUrsPec0Sao3bdSqc73
         dlZk5JuUX557hwSA9FJYxprWddoq08Pg2CsueHT/6UIJoo4deyTXnpJ5IlAl/BHnBJiP
         q4MA==
X-Forwarded-Encrypted: i=1; AFNElJ+P8T9t8DdqC4vimF1MmQjiu/jsbs0v6QyRppFQKV9uFnWobiqo2rPqOApw72HNQK+FwlU+x9KLKNQJyOK2@vger.kernel.org
X-Gm-Message-State: AOJu0YwT9VH4FsI0c3QGxIErv5w4WdkcoebZ08mwrCpAzIUA9i32qO9z
	/Xlwxq8C3tfPfh30ps8sy43bc5DgA1yqddMO9cdNYHNCjSET9mPrgM0uA0c3xQFUfxuVKE9sx5+
	+I7eIwlRP353oTBxYQnCDuBLMyFAlYBJxFfjHMTVoMX0jiwbbnqlGLG2KI8Wt1UtnUC/3
X-Gm-Gg: AeBDievD0OLzRCAiID9T70FVVM9YcmnEGc7/smfB/pOL7lAoVbLd0FbaGHHRQTLDK4Y
	XKXuOxjjGfm39brtIRhWmR+d40FT7esPKCcJBSvvhqHHyDJN+9GYL1L4JsAzP0FU8rBmkWc0fHB
	WHBlfgJwV2cSLKKnKEexLxWZUFA6i2r1QLoZ3n4oh6qJpEmXoydhc/v/GWOJFUAPtxb5vSyTKHA
	PEqhP/O3Gn2j3U3hYrhsVnFab6HhZPaKGxVKhqHG3pdVF361o/DPH3Abm0e8CQJyG1t48YDclGg
	HgGH43i/I+yWBlA51XQe1wYwtwCHGOH5Nn5WxGmA5qeotsTZGrQ5kNqCwjER2BSqiE8ir3DgGya
	jzaAGZ6MfPqxqBOShVcCf7BYJedIFyd7basxtbCZnSVOscy+A828yvRdLbO3lyA==
X-Received: by 2002:a05:622a:5149:b0:50f:ae44:515b with SMTP id d75a77b69052e-50fae4453cdmr438255601cf.37.1777281380990;
        Mon, 27 Apr 2026 02:16:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5149:b0:50f:ae44:515b with SMTP id d75a77b69052e-50fae4453cdmr438255401cf.37.1777281380602;
        Mon, 27 Apr 2026 02:16:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:43 +0200
Subject: [PATCH v16 10/12] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-10-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRGqUxioVpJcY9zBfeIZn1vIilzfanwkfyseaIOaQFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylGmClCRw3//AfCjDOHernDiXEiNO3iuUlCp
 gZtKgrriaqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pRgAKCRAFnS7L/zaE
 wwtREACcEpKAs4f12xlr9d432+UiRM2mqQ0WBb2tqTkHrB92fG3R6QIfX/0r0TAp4o2j3KzY4LH
 i7C9hOGNmxiatWeBsAqptPxi7GQzaDrSfwSJMkQvcnBF9LhCSKIv+8NGfVlwKhat+QzjZkANPK7
 rPv8TeukHNlUuFYifbu7zryjeH1ksha4ZQ9k+BtMHbGgZm3GsWdCaoaXQked3UoY3qewm8nzWfw
 4tBicyc/b9QrNvOSyIhYWl7taI5r8JiWfnrxH28tcs0uCT+8paNvfNcjaHflLqlnKMeTdy2DNqq
 OkniN/g7MRsVxtajBfV+xsgrE3kfd4kxLLZMT2v/ec1XQd8WToXxLgNYQrmSr+fxzgclxL8gCSw
 zlPpakDKsBf0+VbSgDrMdHJs8uR/etgu2gN2WstJ7SnukbBElTYmqZ3s17ARRLL2cfoJy1z8nmY
 bJPPm1GwkeMoNd2AoLA6Le7OoK8FTq9zcwpoBBrZrYvn+TRTpKGd9JoYliEMEjKiOV9UItpEQfq
 YpZCupTT0ymSqFzi4KCE+93mXXWMQn+/5ArMejrPT30QJ60pxe9h5Xc666ZiyJ25zDt3rGQDY5s
 EWFvFFDQPiGyT5VrQr8j55uFwShKCq2GHoRqPbipjOeaGxenIkhID7vjO1YwkrzuHDRflyEsQrD
 oAp75Xv2eG7HPcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: afxEOf3Ft9zmWEKFoR7PjJKuEZB1TC1P
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69ef2965 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=76fuQ0JqpD8MvifAs1cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: afxEOf3Ft9zmWEKFoR7PjJKuEZB1TC1P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX0CkRyPLFZsKA
 qY2+L0q9HueM2G6E7z6nqOXi0Sd4Dbv6oZmnin6G6sb07s3z5iiUMwnMIAdyBRYskKjtqoP/40o
 GF3lCsdT5/GXU7j0HiB3FeJR9nZswlqIWT4wNcSQ73b338rF27kt5bbh+Sq0xYsjL/uU5u7BBn7
 u0KbQTxJIZhIrZhdpNiYaukOBxrP3rIzIeW3mAhw1bhNvZPN+dlubyh/MT0s7BIRjX2Q5mmw5V1
 bda3pW6xZVJUKwBKAZ1tJw96pw/u0L9DoekrZgAXIH6PqEkpNueGi36XXlfk+eQsa+ZXgz9JJpX
 nT7EmIaMYsK5oHRFzYl6CjMjH0rrE5/PdaPPQeuJnjaFm1C79jM2H5d5PxbHwDmu60jlHt/hTEc
 j51kFcMzVKFLRRYfKQJPo2/PLsOj13bFqQfc+4n7o89KZB25a9lkT6cAJ2O/UDHdEi8zZmlfn+H
 EnnkdB7+FszYoS7YRPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270098
X-Rspamd-Queue-Id: 1552146FCA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104661-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 25 +++++++++++++++++++++++--
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8b7bcd0c420c45caf8b29e5455e0f384fd5c5616..2667fcd67fee826a44080da8f88a3e2abbb9b2cf 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,10 +185,19 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -198,7 +207,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -244,7 +253,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		return ret;
+
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3


