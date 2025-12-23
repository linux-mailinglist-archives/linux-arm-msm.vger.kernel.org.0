Return-Path: <linux-arm-msm+bounces-86421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7C6CDA715
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 21:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19CB13002FED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CE6266B72;
	Tue, 23 Dec 2025 20:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MccDaSc3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8G/11/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351D83090E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766520933; cv=none; b=apbRFZkC+/aOkULP7ZKs4wINdybDotXEfYOsd+LEFomMrfLx8Ic2osuG18yfrlI1eybQXTRxK8xM/Pj9CurO3WsEa9TrxMQoh0dPyD2yGgqCX+RE/hkGfIiXHdILOF0/4pL4x+xJP/wnoOTsIEMOuxZ0varnE3W54UKJSutodtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766520933; c=relaxed/simple;
	bh=yJ3KUc5yMU4FrnowAoIsslzzphg5KFjX4PvFRgKH2hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+fuvyZg8FmMXWFXukEtH8ZWyDwxWG5r4CmNaK8kfCwW4/R6IgE9j2Q7ct1/2RMqtCq9Q5uBNP4UTQ3RDZjo+CXcf1KJI/mEkbRNQo7FcZnJWsMB8cWJRYK6CdQU1lNksfhk9qhvlwZFBuR6qccoWRY9G7tJBwbJd9AmPho4iYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MccDaSc3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8G/11/D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFr41M4134150
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gS4g2eUmeYobmFi6ysaa22ZY
	ByOUMUYywyMHMVMh0Y0=; b=MccDaSc3EXp70G/HeP0TzXFusa7W6oWzSJlK1+XY
	92ppfu2aTXUEsdhJHy7qXSkqWnhkv6uc0cIZcevBiCLATa1CormWOoU8/cM4scoR
	4ZgxzFUezoXVQLneVGbyGuJudQu5lBlUtnCWpCsmREpzD/OjUPQBEzZOJK7uC0nS
	bZp+zOlHmzPMT6tKSfAE0wLzNfFz9dzSnXmKWaYbAH14vCSbx16tr9vAoxJuFZD/
	LDOwtXweXE8Je3GiySB0jF5JFaD4xj6moigiS2rbBzS0FVR/FPFNpletHOFnjcf+
	BNJCyw4faTIspKBk86hrAACKfvzLIwwrOWTCjVJ0a9FvYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46rsuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:15:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eff973c491so132275461cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766520929; x=1767125729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gS4g2eUmeYobmFi6ysaa22ZYByOUMUYywyMHMVMh0Y0=;
        b=K8G/11/D+hdE4uIEVPoBCMjorhVTnwlpZe/ukLtGl7HVVd++WzXuhTH+ervtsQJpl2
         rF3LMPHxl4KKvAwzrQ9NYZbTmaXMoPXux/kK90N4sfBZ6xa13CZSez0F19mW9/9o+dno
         F7z9HqAXpi1jqMfDRiGp6S07AAoUJKLZBlfaifM4/wWCccQbieA1mDA/3O2Ez4AmY5+o
         0TKOfFdP+e8Aa7CnRdH2daIfw2uaY7DKMf+h3qG5jzmVMlndl/W3TzjePvUBvLGPJfEO
         DlP9wmKldjiX77FQVdbCJ11S5JXiVJqAyJ7I1bTf7baAGVDf/LlF5atH7nrkp5D2VMa1
         YGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766520929; x=1767125729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gS4g2eUmeYobmFi6ysaa22ZYByOUMUYywyMHMVMh0Y0=;
        b=W6snK5Qenwn94KOK8w+dkvvXvQrTzf6Vey3nWh5xBenFlTIRtjwv+Wiv5vWWfl9ZMJ
         G1eGfKxn2fu7YckmeXUIDM68naZ7GrcKV1POpV7u3HhSB1lnjb6Q7z2glBMPr2TASP3y
         RcMO9f2/T+p57xtEveGiY0C6MfoxtWb5AOW7zCAnKgWWZ1Epy61VYp3ZnxHiNxF+tLem
         1pQD/yZ8Lqtrfrj/TZ77XZBtS0FvyvFXcGj4q0G6Fk1mp8JkYTIUvXT/5zXKhddN8dx1
         LemkYY/b36xK/G6XC+bqH0gowCGDuvNuRzXR67OAX1u1zZ886yBxIkXNTudlhXUSQLYe
         GLQg==
X-Forwarded-Encrypted: i=1; AJvYcCXWts9UMWAHrM/nZXAfMogHvCw4Orifp12fR23aCo1c0fl9111q12b6uBMuZ6rCH76b/mS6ccadGeNJzCyR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkopt4zY0i48IO5j4m+C/runlA4qfdsG5VEBQgS3h7TjZZMAuq
	0E1LDucuSKfoa9QR1TIlXelyer18v+T9LTZCHQ5G2CxIfqKuaJFNySCI1Mcpp6RDWagHjs57vfD
	65vkUx0pEY2sCpNUaX0Xvd1BnsFQasLhXXwdZ3NhIOfXCjL8aCimoeA4o2vmYdPzUSUJ8
X-Gm-Gg: AY/fxX6jXowy9XtypbFDvDcbe5Bl64vWg9d5nrVypagUqah9vperSsg2tM/Cg5Hsa9a
	/AAUSMjt5qrW6XlquzTaILKS4ToqFS6VHcUaoogt/e0p6gXGgtF4taThpxF7v/MutShV4v6yaEj
	vAj2PcBJGQ6yspj91P+FeDtgE1U16D57QrM1yca8XqN/27JqPnIJH6+U3OOnPXIRkAPiPvC9uez
	7uJWFmj0IeKVW23LY9yUGS7hO12pIob9c9QVGoiYdmG5ENGuUzkzWG0Ldjv/HPWo1OAit9z3L5F
	6ciY8QnVTHCkn2XJpcNwa6MELQaDAbAWzsgr28kjhEx7WnDcCDlv4slpyevoox6EgElX+RlW1sq
	el9rPLdrLOdrSEUeaWr2C6/KJAAMkvyrvlHEPOXBYZ6GMnYcw1OOL1K+mYXCYRQBTh7JOM7wUNy
	pkjx7BWyd2Xz1E7n0WF1jWL2s=
X-Received: by 2002:a05:622a:312:b0:4e8:aee7:c55a with SMTP id d75a77b69052e-4f4abd02696mr220046061cf.26.1766520929111;
        Tue, 23 Dec 2025 12:15:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ3sre+cW+YMd/Z1q5mx8ayHSvI5qfjS4r3IZxBRoAQYGRXDyv2pavw42k6HZDIj0Wn08HFw==
X-Received: by 2002:a05:622a:312:b0:4e8:aee7:c55a with SMTP id d75a77b69052e-4f4abd02696mr220045491cf.26.1766520928621;
        Tue, 23 Dec 2025 12:15:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186287e3sm4380630e87.97.2025.12.23.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:15:27 -0800 (PST)
Date: Tue, 23 Dec 2025 22:15:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <zavjg2ciefd6fmlnqryzvo6vmtlk3xmns62hn2kwctpgtstski@p6kk3tn6c6bw>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nGlfLutAbcTktCwzzzoIMygmgmD6rZN7
X-Proofpoint-GUID: nGlfLutAbcTktCwzzzoIMygmgmD6rZN7
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694af862 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fuSJv2krIXeVBR1GlpsA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2OSBTYWx0ZWRfX54VeLDsxVZCm
 PD6PjFc1w8F2+NK4ll5ZcsFpvO7W/qIyshJrqjLIOu0x+xcmtD/NfgfTcO2F9olVI7rJ8pdYmn+
 HQDA9F2sHv4ksP2/b8QP7Dq1WF4zbg6mbi98YXDwLS86rd9maB63NAWLMHl207kO1A0oXpo1CGr
 oxL0Go8kd4ekHHOwGrPmKh/9S87d4G8MhjLOWQPt3ThLztfuG3bKAYvqEaq4NKMC97AS/lfvQkS
 B/G0lDXYDLfOnqHWS0pX2L21SgY2TZ8OxchWLCXdCEJAYD4Jf+fA425f+NhGIGhx7vbEQJLI7wv
 eGUlQcizHR42U+jNFz4iWSb+RA4pNxMkagxdFcdalQP9jU8lPDzoafOAAMYd9cQEtsz6O4fUlYC
 VVHGQrWODTinDTEGy7aiazG0QKTbZiiF4PBzLnJS+0B3hOuIGkbVzZPygzT3YQtx5rYW+ajAG5y
 p6X6oVDJIad7J9mJrNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230169

On Tue, Dec 23, 2025 at 01:13:50AM -0800, Jingyi Wang wrote:
> From: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>

So, two names start from the capital letters and one from a downcase
one?

> 
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits and performing ping
> test.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the
> subsystem is ready either at the first check or within a 5-second timeout
> and the ping is successful, it will be marked as "attached". The ready
> state could be set by either ready interrupt or handover interrupt.
> 
> If "early_boot" is set by kernel but "subsys_booted" is not completed
> within the timeout, It could be the early boot feature is not supported
> by other entities. In this case, the state will be marked as RPROC_OFFLINE
> so that the PAS driver can load the firmware and start the remoteproc. As
> the running state is set once attach function is called, the watchdog or
> fatal interrupt received can be handled correctly.
> 
> Signed-off-by: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c      | 87 ++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/qcom_q6v5.h      | 11 ++++-
>  drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  | 97 ++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/qcom_q6v5_wcss.c |  2 +-
>  6 files changed, 195 insertions(+), 6 deletions(-)

> @@ -247,7 +328,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>   */
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  		   struct rproc *rproc, int crash_reason, const char *load_state,
> -		   void (*handover)(struct qcom_q6v5 *q6v5))
> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))

Separate lines

>  {
>  	int ret;
>  
> @@ -326,6 +329,7 @@ static int qcom_pas_start(struct rproc *rproc)
>  	}
>  
>  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
> +

Nope, unnecessary empty line.

>  	if (ret == -ETIMEDOUT) {
>  		dev_err(pas->dev, "start timed out\n");
>  		qcom_scm_pas_shutdown(pas->pas_id);

-- 
With best wishes
Dmitry

