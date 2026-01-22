Return-Path: <linux-arm-msm+bounces-90154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGzaFMnwcWlKZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:41:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106E64AEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D39DF621ACA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5585E31AA80;
	Thu, 22 Jan 2026 09:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mW7n60NK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQYII3Vy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB90C2C2340
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074448; cv=none; b=okI2rNoFBJ/13GxOEWHjf3sWMqEYbqVPAXQLeHj/QSaSuoV5/Y1LU9ZkdR5IjOqnLyOOw3VHirp5TnEFIpJ3ppGlPVfXSWgpWPQB3oAwlJl8iPt/K/0Dy7w2g2FTrNsXF6y+jDA63qmc6pVs1rxIZly2qYD+wxnI7mBGUH/Yi5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074448; c=relaxed/simple;
	bh=jUzRqOHMQ/kpbtoDGMZP8aWQCDm5eA9wCYM4zEFj51s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vq0YCFoiMS/I2FIz7K62eb3TlaRxdkv5jKiqOyl6TCX/dkLCORz0aLxtIELvpOlRNjrNKKj2uW6gJunG4yI60IuGfbt0xMI+kVXWRwZ7XIsIaCXo0yUcr7gjyLei7EbgnnqxfyQF1cs2tH7Eu7PcAib7KzuJYvcOwSfbbKEk3DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mW7n60NK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQYII3Vy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6ricX725005
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=4JIUhGqreSVLEahpVnesFGe3Z8ad3AmLC0m9BvzXVvg=; b=mW
	7n60NKqrH5hUC/4Lkk444KS4YpVSXtIhIR+9StGC7DmIlKnF9zkuahM3kPqHWboQ
	NXlpm9q3rTnzAkmNLFRym1Nyzk5knzugmS0wTV8jKMNjSHiPYJ2oCQSq4pk0Lyut
	LgqR+JnZdaC4IcRc0E7OnF079J/OV6LKKV0k+z24ifsgmIQuCAaOY7Kf6xPgbaM4
	6FlN111hxBZG+SC8/mQVUs8y1AtOpNC2jzrNFjmTXkwnhL4ye2sdLHuEaR6u7R+x
	5Sf/JtTZH73R0ODM+K9yx1B0RYI3VR42lGcAfogpKnIPpVcFTfveSH+S+iSmqTT+
	Uuu9VmBzLeEEDgT0cV4w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bgg14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:34:04 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-123377038f9so3294567c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769074443; x=1769679243; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JIUhGqreSVLEahpVnesFGe3Z8ad3AmLC0m9BvzXVvg=;
        b=JQYII3VyBvjaBLmOgtrKEA4oW5x6kKCBueTYXxrCpZQYjngcC1oUUMbN42a5qMqawz
         pies9yk6F/nPU/81cjzj4pC5ADH1uauAg9SkITh9D/0rbna7KOt0fPsZ6tO6cKVE7FQD
         RtAYr2cDQenLTPFH6etL1RoEl2z70Uf6++9ic4GOUQ9mU7Jt1DaHnTYaDQiQWwDuj0Jh
         PDOTlUNz4+oPHlO26b1I0tOd+Plp0IRDZgcVwTn+GM5pCJASesU3tS2rfuioryRRIrH2
         rQLffaqN4LvJtwIOEZN4gCCyWzWjHmKKkO0yG3wgKAO3B71+rQFa6SmWnPkIl/N4JCFO
         Hs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074443; x=1769679243;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JIUhGqreSVLEahpVnesFGe3Z8ad3AmLC0m9BvzXVvg=;
        b=F3pwmKMyqVZDbzUmP6n6RGtmO5+GdnpoBbj/OCAIap3M+ICqE+4K00w/YGatlEVRha
         JUV5+6maKK7isfWqG7s0EuD61Z8ksQ/k8rmr+jmSJgTy6638EKbyg82E1ZNAthB88KQr
         BBI82C0wFzEsBu3UIZSIcsPPDSOdcYyXc4HAV+oDr8+Lg2+Yz3wUJV5DH84bq1vnD4Li
         Jppj8HRIr+uECawdFi+pUhfWyQHlWhrwZlTuHO+eJF/N2ZB9S3wvL2Jr+x3cN+F+WDEg
         amggyIqiHDGua4E2YTTqGCVzQEjXUpIf+jZAewL85XZeeAqzVDv65gagCorXpLCcpF77
         dDNg==
X-Forwarded-Encrypted: i=1; AJvYcCVJatLTheVUJYGPosdjaFFBLHWPL+Bb8d43M+ZF7qPF3uzor65nVNJ8MgofFhjEucfv+2PvpCc7roN/CriO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6gQdwQuyDAjDqEdC2EXi4XNR6vCX1ZtpP3TPj0JNQrIE8TRf
	lxHhljho9pojwRu4XUT/AWG6Tg4h9U32mWZzeJ0LXcOoy084sdL4LxbNHYzI9bCGxaVICy0o/cn
	+KB22HNp6PkbDoYrvgl6kIn+/Dvh21i2nf35pOf1CPrNwKhor+uWJgHiqfYSXyVHHbFAs
X-Gm-Gg: AZuq6aLHkjl0qolQTn5qCD+37XtqEEjnxjwJnMSeJDXt4BubOeqT8XZMlfDgHg1L4yH
	D0yuPygicnjF8AB59d/7npyf2pu+18OpyH/Abir81fQ5iICPuGPYpehj8Bgg582RgWesy8cpedU
	3nL+GMD4dMteTWPUwAXj98o0G28DaUtzIq5rYNE81Fr14b9D/fSD+k1tEFz+fBcFf5O0P0F9EvT
	GG9DzGqL3/zeF56QWaKtEEVljfD5Wyg4lw0wJBwXMnkFlu5RInTw9ozaSLKZUeGJjX/fA5x8eFo
	jWEcVstE5NN33FcxqgU6SNqBXSQ3dD1jHzLEjLKUlVwdFMDKBlUx/n3LoKjBzofQWWWhpfllEz2
	mFZVBGEQFDal9K45nN3Czo16TF8pP1i07OYXuWx/hGpmNJONsGjXuJnnx7jk=
X-Received: by 2002:a05:7022:4181:b0:123:3360:aa99 with SMTP id a92af1059eb24-1246aaf297fmr5544906c88.47.1769074443266;
        Thu, 22 Jan 2026 01:34:03 -0800 (PST)
X-Received: by 2002:a05:7022:4181:b0:123:3360:aa99 with SMTP id a92af1059eb24-1246aaf297fmr5544876c88.47.1769074442479;
        Thu, 22 Jan 2026 01:34:02 -0800 (PST)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefa7c5sm31090768c88.10.2026.01.22.01.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 01:34:01 -0800 (PST)
Date: Thu, 22 Jan 2026 01:34:01 -0800
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ananthu.cv@oss.qualcomm.com
Cc: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: sram: qcom,imem: Document glymur as compatible
Message-ID: <20260122093319.2124906-1-ananthu.cv@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.43.0
X-Proofpoint-ORIG-GUID: 6i-3EG9_rRxEOwhotiBKArsyxlehk5RD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2NSBTYWx0ZWRfX0B9JjknmTuKa
 pqZeAdBYn4PXXiNWeC2XXEEndGabKxk3xjuJImLbwhdfZZAelTRnFfTclBwEJeMVDPzi1xDOqsv
 xEexehCFm5qJ4DalJnS+iMo4+Q/cy1q+0v021Vfj8Wr6baleOAjRcYUkVEJXnHt7gjooSzZbuau
 1xyb4vLM7lu1h08amORmfUUjUaS1TypOM9B5qRgljElrjST2KzlSsUs7MrvK3Ae808IIwbwHC95
 NOhNRKWjCCMHzBUsbnUX51lSJKHlMOL+p6QKPPcPe8/Wmoei+iQZ9uY/OAa0QaxLMwN7gGdEFU0
 daXoTigF4UcSzWDhzrBGRcp1lOkIXi2CIS15Z8xBvwzusNSZkTk8bp6cS2TRwfq8EsIl7hwCqau
 X8e6fjpX6zkqxfkmcl1ofVaQhYLwAl+VUVhurRldpaYFs8Uaxmqd8cpXsGb0MJ66BFxN8KgTE+2
 FaWdHOQCGATpvt0nHJA==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=6971ef0c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bTlCb3fCMfgRa23c2f4A:9
 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 6i-3EG9_rRxEOwhotiBKArsyxlehk5RD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90154-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1106E64AEC
X-Rspamd-Action: no action

Add compatible for Qualcomm's glymur IMEM.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2f..7a4ff0ecd2f4 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -49,6 +49,7 @@ properties:
           - qcom,sm8650-imem
           - qcom,sm8750-imem
           - qcom,x1e80100-imem
+          - qcom,glymur-imem
       - const: syscon
       - const: simple-mfd
 
-- 
2.43.0


