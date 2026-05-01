Return-Path: <linux-arm-msm+bounces-105531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHwuFdjd9Gn0FQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:07:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369E4AE52A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 19:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF7E43013B80
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 17:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5DA423A9C;
	Fri,  1 May 2026 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHWvmU+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBJIreje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1184219FA
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655207; cv=none; b=Hb8Lus61ZbfJ4plDSeeGViA+qxrVpUfP91EPfRyTWxziSFjDWO3ImXXoq+ADyUjpLSUqM4C/C2Tmyu/dOj7y1QjjESQaVVFyMZM8Pk4kXBW8+NoRXne78hUcejlAJhYpat0P6lxDnDY3awtyKicpMq+QosRQyIQmdZGmBfOZmtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655207; c=relaxed/simple;
	bh=doFJzNLDHQmlXc2pfwFDlVaTkV7lTXB8yqsy53flfY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XxocIDa5pQyhawUBh4XlF7RQQdqmLrcgdU9UFVgXYpr/NpcFg1p2vO6C3ehGMP5eLXH06wk2eTFJMimylruJtjO66Gar31M1k3leXJ2m5F/76f2yFaO/76kGBFFtvcgEhc08dUNtYYtUzL1MCYDWU/bKe9xZZq8/7+4AqW445pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHWvmU+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WBJIreje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLoV53939057
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 17:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j0RJQKr0tEf
	FrH8IEW2efNQFcXBtQIOQlSiYqCKVrXw=; b=bHWvmU+jo6wB4u2LZnytLFvHm85
	6RSn3bSkaFiQZrJL8EUpQKSOYW0nP/+za3Xyh1OjrX0GZ2+/3NWT1CBcgRiyaW3H
	IgksOJ9c7TU1Ej4fbxdlxHUbjPLA0jCi2eXX68DHOfsGpZ+WXwp9nGQK6DOZFlkB
	UxQEByIq+MiUl6H7Hc/4Kdia9rFzRleTXlAoz5OcUIVFo+MIHC0E5dUKjdkhBvdw
	hgRqCoG0GccDnab17rlWuf8ckfyY/93iDN/CWDdyzoPe0YcvodSkVrwzWZqJNPvk
	4F0Vvj1j+m6WgoeLIl1pufG7drOnxQpNbb5+vlTeorOiKCKEl2H05LPRhRw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvtrn12n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 17:06:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so3236658eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 10:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655202; x=1778260002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0RJQKr0tEfFrH8IEW2efNQFcXBtQIOQlSiYqCKVrXw=;
        b=WBJIrejealST25MRBMzniO6s7UXF5KfDfAEHF64EmXijJV37WawNlm6ac5xGIwegVH
         gYRRS1xk5hJV/TazjCT8T+wndvpn+byE27QSUMN/CzFL9zOS0W0awEndUkfoxPCrlrUn
         FwDVNCWU8Juyd7Sn/HNBT+MMFZcQfZ6wXbXBmFGC9nC05LlAEG0/5w9RE+ZDiYYXm4Rg
         YnGJgzFCl/i75v4HF7E2AIYHa8zzbEiqRb10yWbDyfPQK4N3fmkxjzF5vYBUrotkW4vL
         0ndZxGci6UU/yjJne8+MzM4iBopcWq2sum4yk7IqhXV820MbviIXWXA8YAM4bVZkIaBt
         qT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655202; x=1778260002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j0RJQKr0tEfFrH8IEW2efNQFcXBtQIOQlSiYqCKVrXw=;
        b=MmXiVXmwhwQcPTXr6OWqW5/CGl4tApm8mvo39kIQHwGeSi9HhuthlqpEjiYR3LS8k+
         JINcGnsv2o1QpbrXmAE8z1XM8Q4BGrJ4CirIfEOu05TjWPuIU5+Dd3n5IyHp+10kzHkD
         pz8pIACtMqb4YDODKgd7IiWcv6R0olkuFUK9iICpi38y9gcxVDM1t3IaxXtFm4bhGmYX
         MaBJ+LvPUJgkl9NiwfAgLDHyRod9tPlgQDQ+uisQgErLiXY8AhGrixv+vI/UPMtT6oYC
         7yEsuH1lWUaVLQTmBW5idksgv6qVrI08eHmyMsRJmuSbhG6HY4AJItlrsBEDTmGRYQIn
         VthQ==
X-Gm-Message-State: AOJu0YwPPxYBlEeEH/DcNzAbinfsFCj5cUvqvWVuRJJuyAetgLyofyUc
	8Ahvs25kVI8lXbnRPH75SVZcKUngDWBu4IJ5Y/TIHqs4dBFamkDqsx/cS/Z3fHKoo6b3ACRqY6i
	F2OddVcR74BcbHmIYuOKxBMGkWE4oiV7+wkhOlKitTz9xkp+nuY1DK/a/eeYGDxypSA58
X-Gm-Gg: AeBDieuY3+dwKClDj1WqSsm22UnMMtBkQKFzZmelj/1M+DwnfLtTAA2fe8RK577r37A
	bIhp1bl1/8kaVfrG1QddruZ81MnrSd4twk85m41pORC74YocXiQA4XwFlwYOwpwFzQVj+Y442/h
	mMUWGXcm/YBRElKsLjOsx9n3VBaRv70QLzuVaDIlIR8BIh5/mMSwPvZeGkpbLILkcHBexXSowp6
	4/DA67eXwnIE0XGTc0PqtRiyHDpVYFb90kHduEhMtahvHFKAF7vrAtQJTXgGnWOpbmXfq1O7v1o
	YR0lqSlGypuAsQasPi4M0hCybigQhELsw68eAojE5WpWw+zgO/yn+R3Hum2Tp3xKaNyoV/uK1CY
	GXcpn9NNTVtBArKV97sT7qevu5RyevpIs9aNb1zNEyD4awLV2HhRnfkRbLHz4mPjvP76YTRrgKZ
	OgzuWCqe0bTw==
X-Received: by 2002:a05:7300:a14b:b0:2dd:c066:c02 with SMTP id 5a478bee46e88-2efbaca2796mr85835eec.22.1777655202297;
        Fri, 01 May 2026 10:06:42 -0700 (PDT)
X-Received: by 2002:a05:7300:a14b:b0:2dd:c066:c02 with SMTP id 5a478bee46e88-2efbaca2796mr85821eec.22.1777655201800;
        Fri, 01 May 2026 10:06:41 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:41 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 5/9] usb: misc: qcom_eud: improve enable_store API
Date: Fri,  1 May 2026 10:06:31 -0700
Message-Id: <20260501170635.2641748-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JPwYLnfPqkRKATqsebwJRuAXKul_DtRz
X-Proofpoint-GUID: JPwYLnfPqkRKATqsebwJRuAXKul_DtRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX0IznPI54StBW
 jFLbz5CzoQVUSMGHkE64/uumXWYZvT7m9YxNVjg6iIi5yZ2qMYPxpgRxoNYNgVv0DL1xCX/99t6
 L2ByLLdRB2pYYteiQJ/OJrAx9xbZ3E87K0+dvZJV8lbbV3jscEYnJTYxIDp0ozeTazcczregXC3
 0h+R9NDwxsDNzlGXIQ+dofAYWIa277Z6hqaMYcKZtEd4rEmq6ajtADr8SANNn7ixbzizHhjT0qx
 LHWTbEvwXO3JiQUC9BXIOt8djZn15K8ulCqMzmB5iAIYbxMAq1VH7wuLEne8H8+AFyVLVjozg++
 fjKntaWSrDFVE7zNIUBA21eN4VJaZ8a8sQuSweuEJCVZhNg7EBYtO2wf8frckMTazTvP7+6UVtI
 eeDa0GgGVGSz75rImqN+ZcuS+BnbT3ZfPSvBLgwXkS2yRtIjYRhQTxT/nXa5PGx83kixlLpJMoX
 OOrtNVlG7t5W7LVF/Dw==
X-Authority-Analysis: v=2.4 cv=KrZ9H2WN c=1 sm=1 tr=0 ts=69f4dda3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=iEam2xx7WbKG8qDqzoQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: 3369E4AE52A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105531-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 7fbb74bf1599..f656ffc8818a 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1


