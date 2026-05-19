Return-Path: <linux-arm-msm+bounces-108519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONY8AG1jDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:19:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A821657F760
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFD4C304B72E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C45348C73;
	Tue, 19 May 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkNp9NOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gynW/fiv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8244DD6F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196704; cv=none; b=BjGZj5eJ2W78pwf+ATo9zna7fdxX4XpJipctQCnLINA+ZRWwG52IK3yRzwQiKlUphHjHHSml+gzf6rk6yzf+UDqZW58XXeI8qf4vHVNAL7H/fOf3dGEBb+gGIw/bQgrwPWG3SHFMZpqrPqbm/eK4uY1lJN4AXTZDeXsMcRO3mWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196704; c=relaxed/simple;
	bh=FjlWrhg64aXopk2c8TNW8F0ETOsoah/nz+L00f7HWu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WEpq5kZ25/COICsta5aq7bsfjUebKxgN8VhML9nUr6CPmINIV8Lgg2/2V1YxHWV7/IP2c3F/Ln/H1ex0Adqrh5gIA0tGR27SvawXmLwH0gQ/Cx7kIVDrprzRPCWQUP3jlOh5VO7/m6B4XWfr6vmhO8CSMG5EZL3HuqQLGdmtcuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkNp9NOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gynW/fiv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JCYY421737173
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Gr0t6VI/a0hOXrs496vSrF8FkdFJvUknR0vCq1ph70=; b=JkNp9NOIXoxe9TZv
	FR5IE7jqxMa7D63RJSLPOYEmsJlQ1KK5vGaPhXT8UgrhZPACpSSS25Lxw2J/v3qC
	YMWWFUuiJFTsC2viMmb9jVfnygIF6CLuLzM9R4hzSNaGMx0rWUdwCD1Ozq5TCgcU
	rQU7gfM+VWMtrxE6tb2niuPltB1ueqavLthCyqoVkBzwK/NWvoymU34ncnWBcG5n
	rWXfGSqG5zU/0OOdnbGuAyX1z+PzBXBcQCK3VwNfnQP+b+ZnWnCJ01bfW8LLsItC
	Di8PHpdUJBD3rcp3QTiO68OQCbNR4jUQjljQvmassS+XeHFPOggiF/ch5mjV8hUd
	zKamGA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju91jkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:20 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-471618e2082so4014325b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196699; x=1779801499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Gr0t6VI/a0hOXrs496vSrF8FkdFJvUknR0vCq1ph70=;
        b=gynW/fivuNHYfNpN7/cZBw2TYrKe9uU28geaMbo9/C22JV6QoIaDnO6yCINLk4+DWk
         SYpP0PFyCoDrG2CtWDqqGmiwFTwpA4C+QIjWFMdN9Je+F2xU8hah7pT91IvvZNm0ntKi
         te4TnkuRVxmGzq58fkXvTwP8EghKnhzmJfpsggy8CcJtMFBPP6Hj2S9DQ/rs+4KaOgHS
         kcNsZyiNIB+zIFoQ/0/TJYkmMviltwbXNcI0ONpoTlGxbRosdXE5kfCiPsfceoS/NBv0
         A7YRqN0tYYkoe4KBr+fyZC/Dk6DVkGWHchxJZYO9vRitcsK2N4KagSCD2Wj2bc/k5vfR
         a0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196699; x=1779801499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Gr0t6VI/a0hOXrs496vSrF8FkdFJvUknR0vCq1ph70=;
        b=mCsg8tSuTprfsfd2dEYSgYKSvvrXS0DT1k8XJkG4vE6Fp4sEyzSz/ZJMGxDHORUkmJ
         ggtpEFQMtY6W+nctXdAmTlfcHx/G/GZD7MQwh5RN/7JU0VqL/fdtnTmly3FAmRUG8Ivi
         JTzZ6JH97uPnSRHL+CQ0Boq5Mur5T8wTRmr/TugP3zDZg2SGYo/TllykmQveSbnkXv5L
         qLR6NQwKF+rwQcqDDaYj8emjgiqBEHg7bxlaFXAPwlinvwTBK5dfN9m1vrxmewiUdTHn
         RMEF1Wwh0+eEyhc8MM5oK3dDUC908ofofFyfK45vC7qLJ4qrX9F7n36mu1u18yQ6RKaa
         d+Ug==
X-Forwarded-Encrypted: i=1; AFNElJ8HWRLnpY2XHmjZ0H4rnLC+QljSTZiX5Tgj1wWpUMKZApAS1TzSAYLax9M5Y/7aP2+ZI05qBrt3U2QBkqY1@vger.kernel.org
X-Gm-Message-State: AOJu0YwEuyojp7cFreyJDK1kItT52KiCERGm7WqsSIVJ5OkhuwPO/Wyq
	MrdL+0J9SJj+D8jhoZqSfJ4Ok8HGFfEktiIyU4/dCWQd9IxaqlC6cpL48l63tSJhXeqfabULb7X
	2zsZtRt6IfG1llN8DN9Vo1c61Vws1Fsep8ACxbm+Lhgc5O0NmPeq8iLZ/7tmEFeRffj7x
X-Gm-Gg: Acq92OFSWWuOPHHe31IveDDHOAlmzD5Wz5vYUai3RrtkqpSUjGdJdaAx897/zkf2FVc
	ws10hPZab88OF1P7SurirDefCrHXrLl69E0cZ2inBcd9r7GsT/ChRabBP5LL1mWl63zBMK9/aaW
	Q6PSAeRjUBLbE/fTM1SBlZix8j8qjzv1ShrL7rL4PebFg6cr7BCDIbVABkKDf29EKEZsEdSVc65
	8Qy5t1Nsrej+nI5lHv7QH6T7w5PrYYyYB89F2PQ3T7gjUS5VKPBIwJejQnwicEUcw4otsutazLC
	R8uicH16yj/NMR88NxRxtWiraCYC/ia5iEfpfMPHpVDscNIRXqxDlMhLbYBdC0k6wkVKrvm+blb
	EriapW29ePd5jFZxtFWW0ZeBfMCewCapw9bgGzTF5Up2ULibkoEk=
X-Received: by 2002:a05:6808:50a6:b0:479:fe0e:e83e with SMTP id 5614622812f47-482e560891emr13202808b6e.14.1779196699294;
        Tue, 19 May 2026 06:18:19 -0700 (PDT)
X-Received: by 2002:a05:6808:50a6:b0:479:fe0e:e83e with SMTP id 5614622812f47-482e560891emr13202768b6e.14.1779196698704;
        Tue, 19 May 2026 06:18:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:47 +0200
Subject: [PATCH v17 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-5-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
 bh=95UZqYCVoso2D8UWFsBEOl96nt3UOjBik5wfLsq4Ngs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMGcHdXbfyHT99vDrDX+RrK/0ep7PuqhyhyR
 nnEczoWRnWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjBgAKCRAFnS7L/zaE
 w5ThEACBFJwqWuIBl/1eTJS4fTvqoKnroUsfcrhv/TH82B5fHMnFllZQw2arhmDFjmel7jjoQpK
 va/zXYByx92u2Sb7LeXe2wzPO0wME5W8+6Gf3tS6VXg5ataVwgVFZgIhSpWOmUmaNYrgP/3kLUL
 C11zAAjEILXj9zQF5FhHxRB23NnKCKc98FVffOeegnf9Fy2cdcUmKoupF/Xtdwg0wVFYpr2hL6N
 xwHTe1vHdXkB8HoPtKBNJIdCWCVAWQ+iHo/Zx2Oa1A0L9VSg24WTFSibQ+va2dear/TzawVUS+/
 zA56o0x/goHUsNpR3V/fAgnp/b29N5vK0iuz7YCLMIbwYRUItpHoititqPrYtjNF9Pmr7JeReWC
 NwPitUtpPEd//vpuOQ868vp7DZ9LDyJpvlLG/GWQDtsk2hPWsPjOlf6yrE6gyyWF6KDXQWe65HA
 VaIdaLFWYGus05MtH0nbgCWf3FCZ6g2u9GQ42MqcgWQ3aP8QHAIvUnhBR26ajda7W38YEkr0Z3s
 Ck3zlSsLljlFVvfGM9y7kCywteZcnmrSrHrjGpzQurDS1M68Lx7CKjMl3fWNAjYUXEKWzZoTfUH
 V5HZpfGWQDCgM1XgMKyEEvSOuGc5GIo3m8m7rOu9TFfoRUTWzXDB/NWXppwFWxdevONF3FBjU+F
 rAXrD27c+U7tjxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: F2g8-y4xDF8HefTLcMFETfldTGqGVHrv
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c631c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXw0u6QlE8dovt
 B0f9D3yx96mrCAiXglc9gCtcT9OOHyT0L1+Yg84xGtNLAtMJpaggXtzGipukBHGkSAyDmoFHJ/6
 S+mCmJ7r+8y5BAdYVDjv+GmnaaOtDq0mGPf7UGNbl6qT0D20MysE3ABhTdzBGGETMh23yqp46Uo
 Bz4K4OORz6VTrErICNheVcCMjbYqdvvnYN5pXQ31TgZzAbdfFfJsnb2sQyxTMsBQzChOom0OwSP
 h7yGhHGjC59jA6y4QokTc8uk1i0VcRzieCDCPZI6pzbUZCc6q9Q/yT7iVPnPD7XyLT1pIuNr/Pu
 FbYVEEwYk0VH0yjr6vJd7BFTqOQup2DNMIKbkURfNkmXFd5o0jKDF3829Of3gi//btHkSlgWmf+
 Bl49Qq3sVG7zMe7UaTOkralfQFyAm0M1gYKUX658HxdMkdYq91sRmTDgA5vfJC7MrEvXleHN8ix
 UWa2SkhWbV9nUsW6o9g==
X-Proofpoint-ORIG-GUID: F2g8-y4xDF8HefTLcMFETfldTGqGVHrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108519-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A821657F760
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
index 7f3d1b6dd5d7660d2743dafcc43878e5f7952b8d..30318cf01ee20b7e64a988e8ce1ec04dab55e3c3 100644
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


