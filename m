Return-Path: <linux-arm-msm+bounces-33170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0497699143B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 06:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72AFE1F24474
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 04:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC5925763;
	Sat,  5 Oct 2024 04:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtFC646R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A4B1D554
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Oct 2024 04:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728101163; cv=none; b=DGCdCYsobFqCd8CD6x3f1iI+BNCbzqiRshaV4BZfuq02tL9sgN2vsQJPI9hsYyFwkxn2848tdkuJpugY8wKs4J3gMJg/ws+jA0DbYFE6wkbLynqcIXLmy447SAOrc5S4a6+EhYWehg3UG0RNnVeNU0ZbnVLh/KgJCtlDvmVMbZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728101163; c=relaxed/simple;
	bh=yeW+ixq3PNStNZwXjz2ygWlTa7p8zncF/b9m6U5cQZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Sx4kaC2Z7gKaV6Ui+XKHMZBIc/PFrlzQD3N0CkhTDxx4CWud+IVwYxN1USOzB0DcZ1ZSzsGWx6LxdPuOVmPPkep+g1pu3vgv7zpDT75p6DmmFfNmN7n997elMjo4c40SilpFQFDtu1v9BdA88jXI+GLjWiTYsAo0t/RIOnDbUY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtFC646R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4953jbS2020476
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Oct 2024 04:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nt8ByGFRJzx+/MAP5/mSPK
	mnjPolpJ2VP3zTLsA41es=; b=gtFC646R7AFmNUWj63ulTXivRP+L9NRcatdArj
	p65Eu+p9L51bozFV8ccEEKi2hjCZrMgVSii2EZY4m43beQdmqdn0VqT5d9ePCm54
	l1I1M4Uwnw9g9qRrCYNYVToJpdjQXwOwo5qa37rK+5HDn36Hz30Qn77XhcAcs6ck
	W6Ms49ZOnlAvoyXnGXDnH+cdntsj7fGgQRe9DaKizM+XCakQmvikL5IEzs61t9oL
	wOdB/NEvqxNE/THPLjUwiT0YGhVCf3bIeKyQNFss0dw+bAWJrmwFre1K9UEkNLi1
	JmW/3ebSrm8m3buSSlhTC/24gDqksUnMXj2Mc66WpvS2JQNQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422wu700mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2024 04:06:01 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-286efde9783so2465535fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 21:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728101160; x=1728705960;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nt8ByGFRJzx+/MAP5/mSPKmnjPolpJ2VP3zTLsA41es=;
        b=YVoqVO5FxfkFlEfShxx5XJ90fQfRgPkEDDliZvS/dxdtYYDjMPAGpbsWfTZcOsACVl
         VFFB4z+TQPTPf7u9fuDzgCQEQAI5BhuMhuDDSnmItH56mcT1mlIB/1L1bzGE6YuIMtI/
         8P3AHWHwn8nUdQq5/4UjD6rUYNeUc8fG3xV7wvgdAURAXNJUxt3atibKVoJ3kT4Y4BQC
         UKVgWyunI1iVvfld48GWsf8mdjEUDG6l/EBfEBSt79PG568dSnnxZXrGnRxotZq6rBNV
         tsWzQrvG+tbHqwLh2blUCoW0qm4qtrIhHCthYzKZENzEMiid2CwOYxKbfTvgAEvgUk+e
         H4jg==
X-Gm-Message-State: AOJu0YwRv0h4haT0HCEJrxkZszaDeeD2Ekkj1mKO+sJ74UqfQwu+hZpx
	3uFv2+wlC44l+K7nxQJNdwC9P/nJZ5f9nSiHMQx858yjsFdjOxhSGYmBt2Hm7vCBZxhgbG3xWJQ
	Sgxv9wt7LjIrdvpgJGlC58cUiRuLJV9Er2l+EaRPqtdDroADct2W0KfryeCRzHZKHDrT0s78xXJ
	c=
X-Received: by 2002:a05:6871:51e0:b0:287:bfad:b17f with SMTP id 586e51a60fabf-287c1daf9a5mr2869081fac.20.1728101160216;
        Fri, 04 Oct 2024 21:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED35/McyuIslOGRBzvGHo7SOxcoqplNJK/DgeWpr9rg8+BEq+8ZGipyzHZvjS2TBwlUQMQ1g==
X-Received: by 2002:a05:6871:51e0:b0:287:bfad:b17f with SMTP id 586e51a60fabf-287c1daf9a5mr2869078fac.20.1728101159914;
        Fri, 04 Oct 2024 21:05:59 -0700 (PDT)
Received: from [192.168.86.60] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5e7d712081csm384872eaf.2.2024.10.04.21.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 21:05:58 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Fri, 04 Oct 2024 21:09:05 -0700
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Specify i2c1 clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-i2c1-frequency-v1-1-77a359015d54@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOG7AGcC/x3MQQqAIBRF0a3IHyeoKEZbiQZlr/oTK6Uoor0nD
 c/g3ocyEiNTIx5KODnzGgt0JSgsfZwheSwmo4zVSlnJJmg5JewHYrilHpyHdzWcNVSiLWHi6x+
 23ft+tXzzZWAAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=yeW+ixq3PNStNZwXjz2ygWlTa7p8zncF/b9m6U5cQZI=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnALvi02Eqr2WX30kek41XNwJGxKKDEcFTim1so
 LYj89LCsPaJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZwC74hUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWbcBAAn6uJm93YPyByPkuEz5RZvuQwTdm6YCDytOUtiYW
 esY/tNf5lLxmA+crZNyUOFAGZfAdjmw4WKH1WYiCU2xMbc/p7YzNJRPIXFzZD36Bq5uEOuERUKb
 HOBOSdCvLMcoDo/uKQbjG0mbXPJVZKwbm3xSa8RScEfM7pt1BNNzOSNnVVlVLn91Ax7bzCpKVMV
 aCobqobYR5jtxCOqTsY8H+PCe70rWJ58SmdAShe22JgaLgl7HykW/m5hR8XmihvfgLzS5wT8KEJ
 bJT81UYlQV2f53rJ/J8OgVXOrDF9P4+qA04Jlx97TdJ04DXov41hxzmf5pfisv1wDhdEFhZppUF
 lqIMzArNbPAlo0NlkyuNcMOzCUGz0rLSCrtdSreJ28kS+W43iRBxmH/pkpn/Kdv/Bw3QEtuwfCo
 101JHr+nB5+8gk3id1ATUeFp4SStDMJNXvEbNF7jrz7FXdahGdIvTyPE7Yt7hnoDPbxXa4Hgyj/
 wB0u0igdDX/ImFnrbeNgmulZyW8DBOGYvmBc92fjP53ynFACLq9vSOMWeX9i9Yr3w4T6AS7IVJb
 06l8q5mKokaMeWmu/ffAbpYoRfzgd4wVbDSr0DDbpkhUlVicFTp48tI2DfQGA8a7e1rmVQk0eSh
 H7jQhT8NNi0b4UzemlIsML9pXNDoXbtwfrMNmqH+JOZk=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: mSurVQUIh0xCRTYqv6j7yNjTCFeu3fDB
X-Proofpoint-GUID: mSurVQUIh0xCRTYqv6j7yNjTCFeu3fDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=730
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050028

Per the binding, omitting the clock frequency from a Geni I2C controller
node defaults the bus to 100Khz. But at least in Linux, a friendly info
print highlights the lack of explicitly defined frequency in the
DeviceTree.

Specify the frequency, to give it an explicit value, and to silence the
log print in Linux.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0d45662b8028..469a30f138de 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -598,6 +598,7 @@ lt9611_out: endpoint {
 };
 
 &i2c1 {
+	clock-frequency = <100000>;
 	status = "okay";
 
 	typec-mux@1c {

---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20241004-i2c1-frequency-1b57e758e542

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


