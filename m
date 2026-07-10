Return-Path: <linux-arm-msm+bounces-118225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 95rLHg/DUGrA4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:01:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C77DC739610
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:01:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bMEl7vZO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AyPfjdb8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118225-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118225-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0259C303901A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B153FF883;
	Fri, 10 Jul 2026 09:57:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852CB3FDC14
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677466; cv=none; b=Je6Y4kdUU8XYF19+iQBZi7TmE039Iu/PXcAllvjXJpIf6joe3OU532xUPKEGvaL0x+jhvZtfLDHZtrWdbSnpy6pUkUE6IimGJ48LYTQzL1XglBmyImxW0ZNGu+kmLtZUdMs9SYmXG0Hu7irstYOTzKlgRxlC2rGCmBbg31hzJIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677466; c=relaxed/simple;
	bh=SDP/HXgz4amfEH/BI3vkK16jvRVsmUt0sdawVFBJlw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwEnjo1aYIIWErj/NI1UiHp06qRYza6XacLoMEK76IW6dZwuIwL02wXLVdJdwDY5BngYkzLEUlzLC7Dj/kwHnyAXODtAylvDOtGyIdvTwfmds7+55pHDE0pn6cyQlkmGDuL3rlyz9TDfA1A31cWVcL02Tcd2S+Rl/bKI98yQ0ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMEl7vZO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyPfjdb8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dIHt172012
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=; b=bMEl7vZOTf4dDadp
	EzlAQnUxEqs+ldnAmqhMDH0+LSqEFMW9vdihBed3ExQzkon4MXvnfTGGPIs3Jos7
	eWtw2JCrYsKPXX5g/E1/4+zJp16/bdUJ9cD9nf9YTz1kwIhe6+6vqu7t4SPZWCtv
	F2pgZkZeHIrsUXJixKP70U7Rr5iY3LK1MaVXjb/KZq37oiu3CV6tdE4DhRznd+PR
	YwtkfXTqGpdyBz6/8feSqDJxMU8Td8Cd10LNsKx8cM9vjOUxJgkytYnPvB9D4C1J
	FuJ2n3Ck73w1qmWzovubuUv+npI/LRHUpwxiYXOWAUXdR2LzS8r5Pb4JZgl21jGg
	riBE/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe9x9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:57:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so7739651cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677456; x=1784282256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=;
        b=AyPfjdb8gJ4oonHJoGgQD37xzqVfXkXKKE6nAUc+U17wn02SnfC+mUe1ffzx3SsuUj
         PL29jAQIQoDgLQSPOeLUOUMribhORls1HeaZo1SVfUICCHvngr0wDjqiKCMBV3MFde6C
         CdhU5cI44h9pFC8m5DUwZgI12+54u4xNjZfrJArk+len157zoEzEMe5L5ROXBE4WjXAB
         yk2L2MypgPf8mIPzFodzJzZmfIG33fpRDl23lL7MSN3kbxvzVfqCY0dgeQvCXMoNSstu
         96aAlsA7zKPNYc1Z+VCaGYkwz+v36RvATALCayDGXI2wKVJV8JmgH0cGtERX36XSZ4Md
         GjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677456; x=1784282256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=;
        b=c4a6jjRf7buKNDvk1n5T+3inCNBIADhUOswfX5LR/ivM6QTC4CymZ//7p7wWqUMWpH
         MufoJPdDKkhI0JiuZ6w8vvcAX1GxQ8h3hA9c6jur6UYcWk4I9iPcsQzb1BdVl6npkE+Y
         H+ibutMhXkedISX7XxgfiDBAdXCWw0YSExPzazrEtPcZlnZWUCPLzmrFblnq3/QlfOY4
         tWCJIvvQHukGzykpMYTohZgoh05dLI2dcNctjKRb6McdvyM7SI4QfFyafeviRs53GYoQ
         oOQmJwXjatGUvI8MnihiBwGXLMnqndHFXbV7CH8AsWkElQ4mabd1sOsBowjasuSTlUcQ
         Pmwg==
X-Forwarded-Encrypted: i=1; AHgh+RrJiwbxu9D9mkwVwYUpuFMw8Av+4MdUzVLQSD9BAhgnPMcBvONHLejcCvVXyGxCd2+oS5QQfWCG3Hw3fU7H@vger.kernel.org
X-Gm-Message-State: AOJu0YzB0Sqh2xmCgXJ4Mi055LBfY52sSmwUy8h12qBy+CCONzv+yXFh
	730g6RIQv24DGVEzBcon/V60WLrET4CdYHXFM3CDs7YCALHio+jdFs1XfDkIT+gn/g8x23Sh40L
	jLYKWQKE5C0R7kfWnB9/oSdE0o59Jcnx9xSjwSGElJZk8vuFpfUz7GIVPQQqdPzqxe+fnqZm/bz
	aFF4M=
X-Gm-Gg: AfdE7ckxRoUUJyLTcl7J9iVGNtJVNUyceCIPgIuZ7aDBLuDwqXW+0LVue6CRL+P6wHv
	tx663ZZmrFt6GgNhugl7DexZfY5n5f6+UsAp811Tc++Rv+mfMVm1BT82jIYR3CMTlOtT+MX7KD5
	CtJut4z6P03H4uS1EgHEd27WdqmqCxZpCK9p4ZsB0nocTITAVhqPBmusd/nY4F3/LxoRv/ivM+v
	moAxXMZFc+0txSYdYnk7xtUB/oNBOxmKbc90kjgXeg5oMxkSiQxdtwUgRI3xiQHJS7IcW++lx1L
	qnGeiYgweKP2OWMaTtnv3moIPmNIky8j4jthj+8Z2RcRU0WaMFgHr5MZFsl2zOABohU/8a1WEPS
	LLtClNP2kL1M4+w9sPd3XQBOEtg213SDkqUIxjOk0kQsnhNcrpjtRVRhoAiBKNJfbvLOiDZHuAv
	Yaf44rq2F1s5gEpbFMd1p8LiUEpD1CBkJnOeiQpckKR/vfEOvADOl7oErJrMXvABaSqvWo8t27t
	Y5Ku1fvEDRp57nravx/
X-Received: by 2002:a05:622a:4189:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-51c8b45652bmr114762541cf.37.1783677455762;
        Fri, 10 Jul 2026 02:57:35 -0700 (PDT)
X-Received: by 2002:a05:622a:4189:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-51c8b45652bmr114762241cf.37.1783677455256;
        Fri, 10 Jul 2026 02:57:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:28 +0200
Subject: [PATCH v3 02/11] Bluetooth: hci_qca: Rename 'power_ctrl_enabled'
 to 'bt_en_available'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-2-46253587af64@oss.qualcomm.com>
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
In-Reply-To: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50c210 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wYtw_XDhO1ghKZOGarAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfXwgYmgHELpuZv
 FrBOZZKYp/1X2lg77yMhvlJy69SmpkOkO2/CDISNJ1sRJsgdNf+MrtP4VRU564pgRPW74GnRR/H
 mlEwLhzaZK7pyvtcos59G603ytGiGqKitZDyYSxBQDGz0DAK6qPGBIvD1hXq5NQW6uSk99TMh2r
 XjL6SGn7F7kkrPJWYj4DGUPYlRwrDseQVsb4z79tn+haprYq/s2ejqnAGG9zYR+4hftaKdl+bx8
 GxaDGlvTshXL42n+Nf/SWSy14F6xkgr4AbB1nd/15hLIL31DdK9m6qlbTzRdThU1k6pQEG33/Et
 fn9XrW+pEiphK5Su/qr9rxNarKs/LF+SN1b95mIXQejiEmP9Tsoj7uWpaFjRuYo9GdI9AQVnsak
 EJEdMhPt1/1yAPlaCdp0xHtbDTeTuw4MHGRFbYSCWyY3I9pvjjuSyaSahTy4lySi5u+WfEzM/dZ
 KuwvPeQpXvjg4/zzpxA==
X-Proofpoint-ORIG-GUID: 74FXtfK0JlD5nK3TpcZfowxIOlHoTLG9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX4GR9dk80mi/o
 jd/NCUqUZhNEyo4UGrToRP0sMgjWZ6fB9piCTM/ncdWjuGgb5CUNusvBV6gqsQChDTbJD+3lF0P
 A64BTQRyDyH3T6GqlYvDCqtIMB1uUL8=
X-Proofpoint-GUID: 74FXtfK0JlD5nK3TpcZfowxIOlHoTLG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118225-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:wei.deng@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C77DC739610

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

'power_ctrl_enabled' flag is used to indicate the availability of the BT_EN
GPIO in devicetree. But the naming causes confusion with the new pwrctrl
framework.

So rename it to 'bt_en_available' to make it clear and explicit.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 135c79e696aefe2b37ee7a7a668715360a1e2d75..17f436484e1e74d1dd690ada22134315abb767c4 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2393,7 +2393,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	struct hci_dev *hdev;
 	const struct qca_device_data *data;
 	int err;
-	bool power_ctrl_enabled = true;
+	bool bt_en_available = true;
 
 	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
 	if (!qcadev)
@@ -2501,7 +2501,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
 		     data->soc_type == QCA_WCN7850))
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
 					       GPIOD_IN);
@@ -2539,7 +2539,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		if (!qcadev->bt_en)
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
 					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
@@ -2557,7 +2557,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	hdev = qcadev->serdev_hu.hdev;
 
-	if (power_ctrl_enabled) {
+	if (bt_en_available) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_hci_shutdown;
 	}

-- 
2.34.1


