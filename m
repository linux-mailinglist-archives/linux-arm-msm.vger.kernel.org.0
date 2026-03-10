Return-Path: <linux-arm-msm+bounces-96725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEMkLLM8sGmohQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:45:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 857F1253DF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EAC3E301E9A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAC63A5459;
	Tue, 10 Mar 2026 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtrgX3KN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEbXqxB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AD83A5421
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157496; cv=none; b=bjts2SnKXRb7UUqTs/Gfl1MBnxzttvcSJRcJRJcdulq1eKK7N0j4aB8wvMb4820pUXy/H3BwG+40XehRT2Rl18159cIcjsBsfq26BHw1kJlDOUP5MhjbkgKiDzBXKr5Mg4SXsJaZ8XBcewRJkpLJLA+ZRGvjND3E/mMvvAdNfzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157496; c=relaxed/simple;
	bh=QtDKw3sIoTdfDtZw65i+I58veFyHFSLP2ujI82KTTCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPhZNLzL9LqwqxNpgp9wj+yUbuWHL8tLySRn8wLqFuGyhAdC4KPmI4U8RK+NYtf8oNuZ8DL1ljRWwk9mCbJ0/T7SZ/ARIrYAk/tZzGGR/ORjYXlcFAn8w1R34sxk+Y/eFBK+HiiyosmQcv9M/8bE8YmWpgsOyeIQrmC468jWrm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtrgX3KN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEbXqxB2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaXPc3417140
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=; b=HtrgX3KNvok6O1zO
	YYb5Crv4wn3Cn6uNb9zTYtGG0zKYOZcU7sU7jz9HZEpPJ8BLFypzpONFlEQbB6o5
	/souV9nw0YFxQBzYmf/X0DXCepud2rf6ogRtK4/qgJX/Z9iUEfQkd6hXl5KdoSwj
	ul8p06M+dIla/etKBvsZtAnNoqlOTJv7qAvk0ehywaqQ/XRM9mNqWilgKbIZ0W2S
	w754hgn3K1KVxXF4e1DUMW2pChn/SKSNlmixv2Y2UKHX2yG82Y+ZYTafVkHed01a
	7i14uSnCIvijgP3FPUOCl19dBXHcvR8udZ5Dhkg3sq6iQHkUsEpYCi1PdAwAcsg8
	R1aPBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja290jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:44:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7de0e161so1684381185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157493; x=1773762293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=;
        b=VEbXqxB2xQyFEWbZ8m82q+c3/vIXFUOJBTTV80aREjtDF50JccxnLT9VWPRKCSQs91
         hEWrRmqAieVZMjakzO2vKGa9pLSv8EFQbtU0ZXNETKVA4AidSB7Ax+kgqRtuYruYRipj
         EuEzyMAORiDnvcn79pyAusfvjfXyomsk3r/ztmZc4kfGvGYI08FIsIsMcPbR9VQN7Mvs
         ymgHsesknz4wcpTE229OhJRuZ/kEkfZ3MbxQRlF84Fx3RlreZSzLfNFZoSYPKOsWs94e
         vS2bGWtDFkEqvMvhFekciKpXI4sb73nkU6Qzwo73MHGU3Kwe+S5i49kqi8Mm55GKBrag
         rmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157493; x=1773762293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=;
        b=aUiZ7GMSUh5xoIhjqEXzxHl6Pcr2KnkmuE+LErq3ZGYNGFbttWjvc+cix149oKaCcO
         1458ochOV7XxMgxemf7b7KvyvneAp48cyoP6ayJM3Nugnl4N2pCSqYrpPfyOdzmJ/2Xk
         0QBj5VF2ZH4nDgAVClY5FK+rgX7HdnlmIGztShq+OpwQaotlDuECZFu777CrYmoijdxi
         l6I4/f8Jx1iVi2+jfWjW8L30ooDOHXH0Rg+rJsWpnEEJbU8+6sLMan7KXuPaEWAW6jYT
         OBAcqYFAJUXcOpUEBeuWhKP9p3a/3fbv0oxlTWP+JQM5xOFcyx6PhlRYn9HzZpus9iZz
         Se+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8ai2BWe6tcz8/3A7r1+E9uaUlbPue8X2EPp+D9hQMC7mBjXX9y6aJSZFzNIH4CyVs6gTQXti/jSn/eRu4@vger.kernel.org
X-Gm-Message-State: AOJu0YzvIXhYeu4/3s2l9FGY9uaR0nO8iPkUJdI2wrNojUgOrf/ElSDT
	jh2zT13VYA013D99es5ivC4fBDsZGROqzpZUED3sbOHIGUFZ0HhyTt3jYsORF5JZv4HmKtBGKk1
	vZ7OrlSdWZ3XxhskizpRlQTbvJE0zluC7k9hqf5d6grQOB9iUx8liDm4my8bMNXY7ZFww
X-Gm-Gg: ATEYQzzUYCx6RqRZ1RlGig3hIPFZe5PYmEBvYpPnVyGlTFBQIrB3AfamRaVrIfKXGXy
	kylkmZaefAi9D/zJUzSAlQahsgR4lspgEVCaQCOuhtzHvrYIVwQ837FpsV1nfcUby30N34kAn3t
	ksVTPqzwcIqt6WEcX97A8ItvzEaN2hLHy3ABUEXgpvksf/xrcGih6TlMzsjrlxVUVUbafuZhsOR
	vUIiH0liVDsUfvMlabk8XDeZcYmzY7rOIJttY6K2ndHjUBzXzmS2LnROBdptbpovOEpjNZIQ/Tu
	llfiOQ69s7ddndVms1RveOFtF1X2CWEuWGTbpYeKr85S4vaYRCRKPC0X0fq682scT1jxnLwpwJv
	f3RAP5RkGXAjzMLs4xw85AYqcSekVP5O9nPrJkTdQh2csrSWHCMRZ
X-Received: by 2002:a05:620a:2952:b0:8cd:7fac:a2a4 with SMTP id af79cd13be357-8cd7faca5cbmr1210911585a.0.1773157493344;
        Tue, 10 Mar 2026 08:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2952:b0:8cd:7fac:a2a4 with SMTP id af79cd13be357-8cd7faca5cbmr1210907485a.0.1773157492878;
        Tue, 10 Mar 2026 08:44:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:18 +0100
Subject: [PATCH v12 04/12] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-4-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gfl+Fn+ISpyM/izQ226zR5pAGJiHs0gWIagW7nCmNI0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxjl0oBLVkyovFs0XMRxCMKg/HdAQsoHdoH/
 d//6ZZzKNmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8YwAKCRAFnS7L/zaE
 wxRtD/4ud0b8pFCkZb+ljYaNfLtENTl6pz3RRlsXW8S98lIHlWvV5/g0rTiZLMZ/nhZJIHcx/dy
 dT/fFdxCu+wF/DQiBke2EvOr0EYGitPlJvKek2niuutIa5S52uV3GqneZM42CysPGjoSuh/WFjc
 3Ju0MkiATjx3kZnh3vpH+ppCGTLpVOwHCciHGWP5mPqc5NmGUgqSeqy0I7D40dIB7vJGsSSNI8h
 F7FPb4w8WZl8W3yzmCSVfMLOj7CiQMTPW0qYA7Ugwb3K6tWtwieLGjueg8Bd4yjGAAAIPXyUlEQ
 VDLAilh/F6icPirmWtb5Lbdvm7x/RyDwhTyGJqo88y3z7jZK5dPx5lGo260pn8b8Mr0iqzWFxe+
 sqqZJOCP+wYTDrhxxvXhXDwdAqf3fn3/D2dQEJRNzTEpHRcSVULQqoQcb9wizvIj/fxzHGBRZOI
 un0Qwp8Csbnf9Fq3/md0VaVuFT0SoHQSWJpYxWF6L2t0wKW96kibt6xzfcJbM/3tFyIiQiOtHOn
 Jzxu6vCnZNMy/NIET7BQnf9HZ5ne8P/bAYKMPlRvPg3FJuw68Xy1s9MFcv0oa2NH+aasSTEqaIF
 QefClOPcX2zN1Yumo7lbDQWr0fPFzSixnzt6j8faXsWZeUygWqFI8VhBzz3eY6cqXc6Vo7Ht4le
 OPNzAobYJS//T6Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b03c75 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tMYkf11C66am177922J-03-ci2e_jOZ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX9ux6oovzufhd
 0GM18IHjWEkCH/NxI/fzj7+nRsEMZvK/1cy42R5G/RNt+nwX/bgHhb6KF4+KKQfEM2whgZZ8DkY
 E5JaP6uKXS0EJvNAgKq3DGhZ4ZEEBpaL2u7nrxyFqYaBVN6547T3OwZWgps3LQ9Hn0nfv5IVxLJ
 0SNi7p6cqxlRDwCVLxhY9aKNOC9SYL/gWeHURU0Wo/4shbicv2khJJjDR4cW3Ia6qDxZwxz7Kg/
 6KAA3/O8SG2nQtvDh2fUv3Z4WNElK1YC4hnGqAgkgnKWW+pOJVxtzql5gSD9TeLH7oqmR2AtPzR
 w/+pZhxO8ErxxQQk2hEuYVHueRGVAJm95ZbBlIpdul52g2w2ivLh7dWMm0/VHycQagFQt2rMSQy
 Ab8gtTlS8ePE3tbcgUKnqQN/yju7rvmkpa390T2gZRJmCsS7q7yYO7yywZAG7PKAgJaT04XQXzr
 SZQuhfHkpo5SqFWMD6A==
X-Proofpoint-GUID: tMYkf11C66am177922J-03-ci2e_jOZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-Rspamd-Queue-Id: 857F1253DF0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96725-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8f6d03f6c673b57ed13aeca6c8331c71596d077b..83491e7c2f17d8c9d12a1a055baea7e3a0a75a53 100644
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


