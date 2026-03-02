Return-Path: <linux-arm-msm+bounces-94988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIh5Jp+5pWmoFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:23:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B11DCBB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6BDC301BD73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 15:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1804C425CD7;
	Mon,  2 Mar 2026 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7To7dNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHrh3B0/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F05D423160
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467070; cv=none; b=ATR8iIW6uX/uKwkWyJtOi4RFK3Bmjg4keZ7KCc0tx2TPIsJUcabZUX6hfV/M6x39qvQlWQDYJQ2rE0I0H9bhBrZXXZadc+yBjpHRG8XYydBrzo+XoxJ7cIkh5o1DQaukIotx5evjkvqWv1INzYdLWfoDDBxy4DFmvYr5BQkX4Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467070; c=relaxed/simple;
	bh=0l3gdVnkPeEhRWmaFMSjmRRcTqey535uYCWAXzuHtwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o+zqJR02S9Q8bJ9yCUGYzZkbpEgOeIyP9qRHn6EFw/zcCf8EEdbqjcz3YM/nuYdw2bf/WzG+AUJLlfK4fMXSpgt4Gp8h6ovnhL5wU/3W8ALX0prT8K4YKmMDwmB/TL/y5I4aQl0GLOa4RVdkmKVLwopX6cKtGhOQxDDAp74ze8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7To7dNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHrh3B0/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229JtWj3742612
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=h7To7dNlo0bGxp+Q
	EZJpBC37c5uNiXjvM/ABPGgFm08JcRapbDq4bokRXb2hoj1+cklRuVsyaS7TL156
	M/8H1nbIJmx9JxeZoDi0BYnXlHVGFxT2dz+peEgtrCHYHM+8bgOUz77LOSRIvys0
	/2wQ+cwmzHI8+2DbALliOV8hMwAMLE6FBbq4X8mznMBlNLj9/baRnuntqWXKAFfZ
	hqbeqqx+d1/JiTNeGv4WIrMiQS6jv7ejE9lDLg2ArU3tllwtya/tmbSv9fiE1vZJ
	mTqRtBXTROex5jkFZWmFmaIcuA1SNJuSY4lm2sTO03jwF800HNLxptonmIYYXs4Y
	rGlcbQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trhbaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:57:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a0684d05dso10445096d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467065; x=1773071865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=WHrh3B0/vOnjC0Tc+5uf58vXMCwvzq3T0p7bKDLgG4VWcuIa4aY6WewRooWu5F8waU
         YMT8NSr4GjznL5mdqCZ9lcnrbVT5R1gxvxv5r5HS9bzwxOv0trH65ZJSMwjn+AFNZVYn
         1fwespeg/wautHZCslB71WZRkwb7MtGUyyWaxfcEXS3nOKTQmZTuCyGzwZVjFcNT+SUq
         +8N0ANXL7ShCz+uZDnJcguwJUKNFFKg6F86WaUEinlDxf3V3Ge9ufoLNe7xE2Mv8oVBB
         PEkSTEdYgArcV+XM0/iAPccEHtfTN931vK7icK8m/Za9+Y8fG5I8vveXVQUrwvuEI7pw
         HmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467065; x=1773071865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=oXlK9xBU8AJyEWXKDWYbPiHpNhdSXEEzZ86E9X+Mvgr/lCtSfQFj92hseMME5w69kq
         JhcNORxMBBDHTblGq8P+vMtp2q0mqK8o5IxrS9jxQKuGZv8k9sBZ7QDQ57Vs3eKtcQHS
         iDjsIdpE2P9t2Vc7edSHM2HLoQhaLyYHiMrmKs/LRfwYy0d7Kj24GqtqvlVG2nrlgzQq
         Qnz8LMeBdkGJ15Jrm5p1t3SKpA3B27TOUYB762fat8auPRb1WQeK1B2zXXX2MCbkpOMH
         wXjJv4uUiOWdkTJ+BWRGJGCoBblVUP2VZZxxkf5wwVIqfPqZaMKRY4rVDb5uo//q1OkC
         zvVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUANwwmZbzXbFPn+vVJKOZMuiPNwbwrEruhO/b+zwGo7GgEXUU9MaxYLVOs8FLCaIlvZ8sGxJLBb99ec2MQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzR/jMzK2swE37XzMpmhWsUB0dpnPlWoQBB9qNUi40qhXDMIeWk
	R6qmQlBy5t7pIShAIC9aqy4XvmxMQjfKMKM3oswsZbOBBkIH1gqKh7oQwAASogpmsW9CJmh66IM
	dJXkJr7nBUm3WyKNKw6fSaO3C+vlfTi3KUf0M1Ftwio0hhiHKSRC1YPSL9jFLd91SZxmQ
X-Gm-Gg: ATEYQzwUB+b3b1WuGuZlOKSsgXrm0bg0r6ULWyxUkyXM81BU/z6rx5AV0bT2PnZspod
	cLxyeU7FjqoO9YGCcaWpa8GVIKDfkVcYtnXgaV2TEgBstAZjrxLJebjjeHaIY5IeMv3WeEmvOTL
	D0nWWAu/Q/hVNZN0+Wzot0Ad3Oly1slBa+NnNDUMS35bKdBJD7bHqj2EocGk53YWQAO8AfjOuBf
	pRi/V2G/5e4hHzNhrjL3G3tVqsJXQzTPxNYstA9f+NQqrf0BWSxDFtF2ngB+vSN1/kdi6JAlJRk
	V8KgDbUJuGoipA1L2kCKSx+/NQ9nqBNxVdhz33QGVcateKmPQS1hldG816GQwyG46AZssLjAzGW
	7cBPoBvzmi9pE/ZGKdYME+eJK8E/pibTXRUa0vzlPK39/IFctBGHn
X-Received: by 2002:a05:620a:489b:b0:8c8:82cd:1a85 with SMTP id af79cd13be357-8cbbf3cf0c4mr1857932385a.21.1772467065343;
        Mon, 02 Mar 2026 07:57:45 -0800 (PST)
X-Received: by 2002:a05:620a:489b:b0:8c8:82cd:1a85 with SMTP id af79cd13be357-8cbbf3cf0c4mr1857927985a.21.1772467064814;
        Mon, 02 Mar 2026 07:57:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:17 +0100
Subject: [PATCH RFC v11 04/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-4-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=azGHQ+ypZ4Lhe2NPlFIx77n1JCkKbs9Xx9/yXH7ccEw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNn4Ew/vxQqWEKjOV5+kouN3wqG17yKI1J4F
 U5nB8f/UuiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzZwAKCRAFnS7L/zaE
 w98MEACqc+YM2pKSB+KOfm67CXPbkWg/mT5lZOTSPM1ntmS/L1MfDMb60c+eQecJ4lEeV3FCsC/
 ZVM7g+eaXqaj1RP8KdY1UW8Ri0uOi8aMV2YMb9IV3nLnCTAagMc3zVeCB7qLxz+lIFF2a4n5tvk
 ONg71SWGZUfjhsYi0MDvjnU3xbkyrTXdokdHOqA3LkZTD5MzoHW3sEZYDC6Y2UsaJ4DVyoO0GoJ
 uueMwVDz+OO3UALvNpGAstuCIzF8Y+GhEte0Gifb5APDDFtvhWKas4CyRcm75IHpVhO/Ra+Ev9W
 3/JkWtSAG5uN9hwqvf/hE7CLU6ZsX1EzobcgR8ye5GhsK263n8yOpwWVYHMUDXNCr1fbSQjmVPE
 MjK7aiIzipzUSe0LDA3Vrvz8DkKftmas7bb8bUmW2AFpKYniRVt70waSfjh90OduCZpAYJkdeLG
 LaX9oWPLblAVEqTuINU+Y7k5TVTpzPgIfvlZ2zYYcTcl2E8aIFHDw3rIA5WkPCjJwPpqaozxAsg
 ZOvvGuVn4Kw3MKXbPUHIPQDezgKyOpcnSyIPn4KJGGT9buX5tCyNBcJiGyZatojxqsTPI+z0/Lm
 Rv+88mriwxosWTA2Y0oakM2rlOwyQHRezuWe4NRpidvjrs/IfjjKqxpvK9H+5WcPMyZFimZqKOg
 E4IxnzBW1z1uh3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX0g9cs9HHyNDP
 d6ji2F9VTGExGGG5DGze2DkthZudjod6ZCZd2disXCleAPBlPACo/02Xlu2CyOqFPG20nSRL2TF
 Cn0+cTsp4nlJ4loHm6IX5LOUQ5owyH7dJDqF3BmVWsR9ig2/PFfryfJRhIUtRGSyAy3YPuxhhj/
 kRgdarVRLRLZzbGWzrx+bvPbsBFy+3sWTWr9PJQweDr0+wiXqpKu8686R88dLQ7ObfdllHtjewp
 I2+NS5pjjIEiG+RAyswBdgzj8bI8Egi5SB+mjSymjg4V3qgxuXpy2NXXLB6jVa1DQhvdthnTGTh
 j+aTaRnjYAherRDZUPIRTd3wIMsyJSmXusIjy589CWXtTdBLlsdnWKmXVcfeciuCXy0PSfP097v
 2nd/EX6CE+naQh8w1nZCSDC4WnOzaJ8sobj+012SFoZk3g5lSCStCBVis3yhCjkVVLThbNKns57
 r5ZNDYDnwMZqmhw0k9w==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a5b37a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Am5cVxAgX1mzOBSooVcbtsrzpj_pIyul
X-Proofpoint-GUID: Am5cVxAgX1mzOBSooVcbtsrzpj_pIyul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020133
X-Rspamd-Queue-Id: 8D9B11DCBB0
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
	TAGGED_FROM(0.00)[bounces-94988-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..a46264735bb895b6199969e83391383ccbbacc5f 100644
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
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
 
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


