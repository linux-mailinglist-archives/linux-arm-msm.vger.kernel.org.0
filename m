Return-Path: <linux-arm-msm+bounces-118641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qHHZLhuHVGq9mwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:35:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 335777478D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:35:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N90xAxAx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J19aGvQS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118641-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118641-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5D46302D947
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950BC3815FA;
	Mon, 13 Jul 2026 06:33:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3437737AA97
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924434; cv=none; b=ZDathixsFNiQRCPaqgqLPD00ZE2/ne+nw8fKLwrZ7Ge8lQ636K6OjwObJ+6P0NhXULq2HKK49mnlyH33P6oMe0mWX/qmA3gGeroU1amhXSOQUAZqfE3WLrqrkMzHxoMkKQOORtDnZ+2w01xBQJGbLEhm/1+1dwKlk99njSuflAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924434; c=relaxed/simple;
	bh=aBpC69+QsRh15CfY3z6X/LotXnJw/IfvtS5JH0p+HFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvXb0m1Pm7imDOyX1PKn+AM+g733hcJPQ64w8C4FdVnTxof24Gl7M+W5Wj7WxzeJc6BG3I7PboMK2r7hBwt9R6te3m1CkbaBrvP3Jm4sT/WkFv+0DnEOXvjmpbO5ld+jX4B1pjtzVkd3KI7hMzmargPA2KYvfRXeEV9nf2KBW4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N90xAxAx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J19aGvQS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NfJr469256
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rB5Qx3+/q81F2sux+PFoG/ZL4o54CgITNe0u0e8Wrew=; b=N90xAxAxwKG/jqiZ
	KDO8pZErdEcTQrWJPeqQ72LJxS6Bdw5x7Q4eJumopjTJFZgt6duG5vZdXQH4yvsp
	Kmb42AWrkr4mJbhYCt7MUen4A/E6CjRrsh+HgbiFSw34zXeFOVB/zyYE3pRSgyJf
	HyywwwuXogDDFJLuUhYB7A8nUTzsDJgHzmPtJG2Baq8pSkv3tzxvuMagpf5m1g5p
	NZNRnRv3DbrVvoDqXjLnf9atlEmvnEZw668BXXS5dQIxeudW+d1wT4fiUYvbdgiQ
	Juco2P/64m1XT7qTysZLJMrbKMpmO9OGIPQ/A9XuAxqFcgRXHy+HzN2t70wF+FL6
	LJ8qFQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf484km3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:33:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848d21bbb55so2878527b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924365; x=1784529165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rB5Qx3+/q81F2sux+PFoG/ZL4o54CgITNe0u0e8Wrew=;
        b=J19aGvQSVxCOfbh4Y/0jQzVr5dObRt/rE0fgGyWCu28XO+OVwbrVZu1K2y9Ocq1RCu
         H5f1VBGLx+Ub156F17af8yuTNDi8XaSGCxu/da9jsfUChcJj3tsdyNUlIS5AzHU+MZKy
         bi98kJ28A8Z1wDILMeqk9J/N7N7KMI5W6kEhDG9E8WctQi+OnfJwIqA0tjS4SabvSUm1
         +DpnPDAKd/MpXj/dZZjEEmFYF+xBF/3DrFpwkxJahcSZ+g+e9dVikGGq/pnyJqa6Q7cU
         dfBOvCWRq7eUtyeZfZpWprK5loSpzBw4pqZqjQ64+VGCSh5Mog0pQgUbTbykjKzEThAf
         Uv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924365; x=1784529165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rB5Qx3+/q81F2sux+PFoG/ZL4o54CgITNe0u0e8Wrew=;
        b=ZZ+xqHnCQOUEVmWef31twghJjdVVnCqwubhMzOlhou3McB5B2h0Z6nL9dga1JsbzSr
         ccE5U35H/qIqR9+AthQgOo4pmMa0Kk/gOnpOg8kFRlTqwewHeIm/YaWUSUNirJ4JAVRt
         o4v1MlcU2LNwKxoZ4Hh1VlNQLHDuFfPpE5xX8w2xJddR36pY2cxAKuv1Ck+VkAWBTTo3
         dD6aXDrz6OHJK4lfRAwx6ywl9SRId46QMobOL2t3EsN7A30jLg5Gnpwthpu3kGRCMKDX
         VLfbOvxQlllLFJAQRTfqi7pbi4CEQMJuyq0pQSg6I4dB7sjHU6DxuoKsoyv7Uwocv98Y
         eCXA==
X-Gm-Message-State: AOJu0YxjjrRiu3yd4Gaz9K7+4/vvrdLwBh/Tq6SscBFAdf8a/V7SP8I4
	CJo3aLjKeNxE9q2jGPLGEJBbPAywmQ553rZwLuCM7q3B4h4NRmxJ6nk6RfmsqdMBiBbFELMjlFv
	uWogH/rCRSMRIa05mtQ2OB6LYi2rE+QFSYKjm0MVpOUzgq3P0oUB1X+9fZuMigWBhhuWZ
X-Gm-Gg: AfdE7ckTbn4rxo5eMZUe8Bb079VhKYyDnt2SBusrhZzxGr4lLzN5MOXL4X1F6g8kUwR
	X0H10GiEJjhrXuGOKGWpuEAswhAIqMGhM6jCDHYUZn81kbNlt8+PqVZoph9yjhHlv0SAyhFfw5L
	vSl6Capr74o0Gvf7OU+cK/r40iAWnVcj2f8sQt8GjhmllhZLPrfZKpbtm4oY6j4LDDV7yvSesCP
	51qlvtaAFopIuQMLNOHYgDruqhHOrbE8eKC/JDpDJXu/ZaDn1rwIGTBwg79FvTPbMoiipanvmAk
	KJ9s6QqJ5py+bnLG5bODh2t+MxRXOScHbEPqh0H+NuWLTq2rFQ8w/scWDWGd5gDG51u6BtKywOJ
	y2x+wcPJ6IQnScp/yNznTZ3eTkesFHmVxDmInaYhdeOVIz5NjS7ZHeD8fHhLwN+clybtQdbgIRF
	Q0letyDzuEtpN5BFTpAZlDf7V79yBqSYECkpjCe6Rk
X-Received: by 2002:a05:6a21:3383:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3c1108b490emr10223266637.17.1783924364771;
        Sun, 12 Jul 2026 23:32:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:3383:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3c1108b490emr10223236637.17.1783924364350;
        Sun, 12 Jul 2026 23:32:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:32:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:17 +0530
Subject: [PATCH v13 1/6] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-1-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX4TnrIC7cHwZf
 SZ38sx7NBHZil+i91jMd5wBa80t60d+mNQPDQNSI77r/avzB9uEwx6H6FfEUPSUa8nA7ALAtUeT
 3wfceXT0SmtLIC8e5Ufj2/27SReDNzI=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a5486cf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Hho1wTqgLjreKoR7ChkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfXySAxCDK6FbXF
 JKbaINzugd8idGp7WQG5JigtDumcVpKyM2NM/kbQ6LikXUUW/uGFVcfq0mhdjG3NNKgtzHui8ZC
 ILvQ+zNz8+6cFbJk4PT9nBGcn/HO+mm5WYVNfXgTeIz8W2SwYcOZNRCxEb9cls8ieNv1cvF+E0b
 cxuzw/6CywTBAJFDhdIZFwWFHttq4DLBpVPTw6L7+rnPb7nzvNTy9s3rervtgOiezCp8/3oZDzV
 n129sSWku10OpOE35gSaEmjcCN9auOUvsgxRJ8dR5cR3YZ9L4G5OMSKtAbU3K9qFrBA9syHITHe
 4PZa+e+fjQFQ13yUsh0ZQdL/NPWMKTDmrRGtaFa+OkQ8kZOYiAAXz/ZQYpnNZgXZdEOT5EY7oPU
 GqyhajajyM6QI01RNBmMWE4ug0XrWmPGUDmrDl/rhKYRQYaIojhOmsMQSyJtemvr82T+0m5kSn9
 VifbNJybSvZxQVU8QgA==
X-Proofpoint-GUID: 8ro9SU2DbYpTN9QKdPC3hXzgY8pI_ydE
X-Proofpoint-ORIG-GUID: 8ro9SU2DbYpTN9QKdPC3hXzgY8pI_ydE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118641-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:manikanta.mylavarapu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:gokul.sriram.p@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 335777478D4

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 14 +++++++++++---
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 7933e55803dc..4a51d2a2b519 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -575,7 +575,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
 static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 				     dma_addr_t mdata_phys,
-				     struct qcom_scm_res *res)
+				     struct qcom_scm_res *res, size_t size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
@@ -596,6 +596,14 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 
 	desc.args[1] = mdata_phys;
 
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
+					     QCOM_SCM_VAL);
+		desc.args[2] = size;
+	}
+
 	ret = qcom_scm_call(dev, &desc, res);
 	qcom_scm_bw_disable();
 
@@ -621,7 +629,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 	memcpy(mdata_buf, metadata, size);
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
-	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res, size);
 	if (ret < 0)
 		qcom_tzmem_free(mdata_buf);
 	else
@@ -660,7 +668,7 @@ static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res, size);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..cb80e22a3d90 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05

-- 
2.34.1


