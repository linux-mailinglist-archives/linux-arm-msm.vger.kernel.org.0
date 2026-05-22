Return-Path: <linux-arm-msm+bounces-109336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPWjBPFjEGrvWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:10:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCA45B5E80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09B7B315D2AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4D945BD57;
	Fri, 22 May 2026 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Df8gBVEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eseIjpsv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1048644CF4A
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457246; cv=none; b=ZfyxHRmK+GmAjrmX6tHoBFYBMdiaMd1Klyd2weN9E+vCYtfPOdiXfwQcpY9FmkteFqqmLn2zBx67dC6Lm5IbkCJrxGy4SRlNyPRMlfKS18XLaiS12elLLCJEPhprFzPgy8U3TmhAXiCvW2d/1VmP5Q/htwoDg+0IrDYESvgru8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457246; c=relaxed/simple;
	bh=9uIzNvyfvjB7Lfk2BX/bVvJu1lFsXDUaVj1eiyJyLZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZiUrZGhH+E9dNlDyj5G4mJfiU9RZ0MRhpJJ+BOtjrsdHfPuBsldlMbZofByqfS+bypJ6a6h+u3BztaD9qRZMFD54R7d0LCc6ew2tJ2IbQuJvKFQZFtMOGY4l9oQ52v9zTwu5C0hnFKA4iwYHG5cuJkC4JlIZYjpV/tsyb6nvoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Df8gBVEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eseIjpsv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBZUn41297958
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=; b=Df8gBVEdewbjthEr
	lmrcQuB/KmhvN82MZyiSw9wvvjS26ar3CQVuZBONp6A7g8c5B9Sto7iums/WHcnQ
	WMA4mZArSxZBuM+NNXQmnMIJfz+tWAzvuEIQkNQw3ivdiX1PVj6oBedalP075z+b
	BDLR0fVSg/7B0cDnAgVhiTjT2mvkQ1qx8mEMksHsIB7mLpmMBvybnrLhICIR+Em7
	YAoBV/emk/Ev+aGBo+cXzjxdSQqSv1u5Rir5/krRbRJ4i57zVc2ZfjECN2w8mH3J
	Vo1lPe9dltbVorMnhLLiExMFZ3OG/ZWrxnCwPIKnDd8yXUAPchXUK452LlB59NSU
	MhiX1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0b5rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514cbe73d00so218106721cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457242; x=1780062042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=;
        b=eseIjpsvHaHX6WTcpPttazu2E054FgGVISAbqmLWcIVEcWqKqrKNX6LCbU2skhXSAJ
         k9Dhu89gfnsW/PbuwmmyxKXVGXoT2GFTKmY+wA6xZ9f2jxFjbmDTmM1wwKAQaA2F/IIL
         BVyInutkJz8KeMjlsfjD5iCz1qYCmbZvDJxOFCKXRadAPSz5MJ2maA95n6DX5Nqi0dxE
         Of9qpHykJcmExVMzd+Dj4oO+H8HuTthUbVs4aBxVLsPBOyHVH6nsmT6SMv/kfb+LJAyH
         cvb6zE9Qy9RIOALnSr9EmuW2SbIyEFIgJnn1pCQfn7D1Vkpth0KobKf+Q4ryhczJcOsH
         4+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457242; x=1780062042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=;
        b=nUvp3w4bB40kys4Cw/v/v6fXe+BPGsrehWv0vTsjfmNH3i+WGGL482nUZl6mIkV5qt
         7xSH4fz5W8iCx7iNNVHzQbGPsyQxx4ecDe4M4nArWSPpyyYouRyg/4I8sPDYtjNz9AGY
         g8nBGxxFSdy/OFINclb/vYbqTesq/mjWWJOkrQLXzBTBicHJDnU7VpRCG5VZOdRrADNi
         gPi1LmfqCvW/dTTJ/M9fdEW2uHzXrX2R01OiDJg7/21+q1+k/0J+JBZFL59njwVxZfDG
         vaGRLlHHAceBc577hCUs7+y5uW30ZT838L1wgRBm/YrSPXMJd30UtgW4MGVhLHMiVgX9
         FN8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9YC918Hk6ieKwdeXMHv+n3m/1Q94KdiYEuNNYU372jvTssZk69ghLcVHSKLUrhnVo7CVKhFXUeX64NWSxE@vger.kernel.org
X-Gm-Message-State: AOJu0YwKAKQsDdIGJMSZAuw8cbBFc0TcJkIfSAHbNW/Hptr6MyV1QgEm
	bf9Pvwrc27m0VNvO8BuITUWzsE7qB7X4Zoyf7sfrDVgRPjBJOZ6ids/LPV/4pSzJ6/YieGrEKk4
	qorvgha2fbaiwk0cqxDteuc+mwkpLzHIA1IjrRl6jwSGmoAb+OBrxbH87ipphB1e+iQbY
X-Gm-Gg: Acq92OFjCVJL62SBMax/AEbG8zCTNtOo2rkAKI8k61Va9zM+a0jT4ysJK3W+HyWAF3p
	tXG2XfL4FDBzGJOzSrAwsqPUYT2L54tvwG0+1xV4K2BWKN+H4syswlhzWLcev25dxIRiUSuVMEC
	dfHvN9BZCmfYVBZTsjSUMRVPAodS6+aQWOHBFlOeCqOr8v/bD9EXOVJ4ozf7qz6RGaurHnCffIL
	WaMnspBLh86LIyrfIlxNSHsbGqjFHg2C8ee2y5S6VEFlUFQit+AJPM49IYUUHbTl55av1ahuU3I
	His5OnhrUNlMLcKatmh+0HrtrEGCgX/Omi3d1dkGPwB0Lr8ECFFRfVglbassUGoZcN8QE+jO5m7
	a/ZJFm+iqiPAUBtAzVE7pxAy13oG9zymkGWPQvK2uYLRF5qw6lw==
X-Received: by 2002:a05:622a:a901:b0:516:d720:4656 with SMTP id d75a77b69052e-516d7205069mr33669131cf.48.1779457242256;
        Fri, 22 May 2026 06:40:42 -0700 (PDT)
X-Received: by 2002:a05:622a:a901:b0:516:d720:4656 with SMTP id d75a77b69052e-516d7205069mr33668621cf.48.1779457241783;
        Fri, 22 May 2026 06:40:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:04 +0200
Subject: [PATCH v18 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-11-99103926bafc@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kub9ORcm7+PjuGNnZqvGfNQgLhDmAjRY+udGQlXYRFY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy8sVsJ1rqtkGBlZ35x+opyw4shtSjbnc+wk
 W66vCyk7y+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcvAAKCRAFnS7L/zaE
 w0v7D/4jw+3q8HcVHo1FlT0N6ArmoTBNyabY55CYkleyMxUYKB8XxGjywgksaiO5jRRmO+MYqUB
 aavzVOWySEc/m3myQIgSCG2jjUNwlaHfeWHDZHqCPTAOvVlhwO5ZSnwvw0BqtW6c5vntgXxaUC1
 Dh4EXXfwjZWiZkuQXW1rCj309B+9x5NDnwfoCgvlfZoKhIKuCKOCUydFgZTN9uwB1bzdeny6CST
 EGWvYyadkUROQ60PH8FvoWrJAFvdyxjnKaPxrn+xcXU5KY0eK5LpfiBZ3iLE4gp8wOAKkvV+3Nd
 RVsxhVUc9EHmruF813wGw83U+cH95oiWRJ1P15uIh90Q2ERxeAKOjxy15foAYJgHcANGadsXcMG
 kOZu4LXl3JOm+OcAj1/vYXDkCrmXSfyGkOaes4qMqLlMHMpmyRCGoH30HRf9XXFhdFjYmJk6eNZ
 RECwm/+dmZOtSYnIg/U4W+F6eaKIesM4ym23bM+DLyv5n1t4a+Xoy9eLuHZN7Ml0rA+7OYzTQT7
 r1qMjO+6J8nV92upfXI6YTCu4QG3/DTS9fZiVosBqSLntMqB1EAPQ2jLrv3gxroMLIiV0XbS83m
 fnr8BaV0ybEV0a4K8bh8xCNssgGnakiDq9/2DEtKkbxlfncd59K0fbs6aQBndrPTjlLyKMLqvC7
 aXB0Le0+9+/3mcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX0Xl2prXb23Fk
 PwmQ3iN1fC7evCnBDGEyukCrkFD+W2GzKGFYOcKYh86RXUfA+vnd3CCUxpAL1LHaeFsmj0Y8lJ6
 DNvMiqPXLKxwm0g6p10APDH+wuGzziieUfrae+lefWI/Coz3ZqlY29f4NpZFKUKixzcJ7X1zcvk
 W6qv4OAYL51LXPnE8kTvu6HccKa+drtfiIPA3esFMIzC9weBjFJF4RoydRIxEHEJ8QL+puub8uZ
 CfqW8GaRDg3zuW45oAMUetM7CYOh3zPESVOsRKIRxzGMIzkN0OU7rLjpf9Artdaa+Vo8JIaSvRb
 Ku3HDARFUMAd1vQy9bUExpbVyv76QppEJ8S3c9MPSmDf8w0o+7tMQMrDM+Jgr0QyIr+lG8Sy7We
 Op7zNc4IFHUUN1h9BGQlVyhd2lPYrp1gijrQeHKuLTDduLYYaAEZixnNEEJmASeH3SeE8/JFPv5
 glpitr14IKc4s8jgyjA==
X-Proofpoint-GUID: LWrTtY4Q5ESNbsIkcZpCGGwRhioAL5XL
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a105cdb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LWrTtY4Q5ESNbsIkcZpCGGwRhioAL5XL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109336-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5FCA45B5E80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 41 ++++++++++-------------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..3db46fc0c419a0a387abce93649084fbf4b1f128 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3


