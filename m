Return-Path: <linux-arm-msm+bounces-105133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAayAEuz8WmwjgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:29:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D8149076C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AE4A1300EC66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 07:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26688175A8D;
	Wed, 29 Apr 2026 07:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIpLHBN4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+0Nhnaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C9399342
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447745; cv=none; b=Lhdr/BO6sDQvW0qnRpuerRaTXXYtyZGS6/x2TehVAvve5PbS3+Jlhp6E30zppZ1q0pId6KnBc1J638CkquuVBsW3g2zLdkugy+OcoOxGfPTK/bYiA+nS0wQGfcJMsJj9O5ajVw8yNdCQbwmmn8fBTm/nsq/gYsHt144Zvl2b6yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447745; c=relaxed/simple;
	bh=49SErnGl4RZ8R9MFYGLdiBx7EvqkH7d4iHxEv/oRs5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AD15EZhuEI20OPvUQ4jJ2TYNcIotr9MrZMTqRw8ZNg87AvYJiJZBDCj3Ul2ne6GJl9sAgAJRqpvfYr2eXfm7VrWfF2my7MJlQWzveA4OpdHz5dZCAO/O9ZoVbk1S+6kqHMOvsR2nae9AsVH8D2iDRxoSYA4u70g3rrDxLGUUIGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIpLHBN4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+0Nhnaq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2ucDW2984795
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZS5IKfeim46O0kOx4wtbnE1w4xKhmH/WYNeMSKk7vI=; b=pIpLHBN45STyaJvA
	lHiOwPg05MsjFjAR42LEkLxtfXCLpkPwZqi2lwdihpWRKe0lqitEXfQSBo0sJdZv
	dRKR+TdSREJLmYu+ql3Y55fHHCGPcFHZw9PHBFaaJ7x/d6QoXG7qR2sCCbksDaL8
	Qzg0Az+65C0qQ1g/nG6Ub76g+bXNaq2Rkjc6bjFoITYhgDqc331Uh5Gyv+tkK/Jk
	gqxpBfdIAcYQIiDTfyd+kFt8ogA28zYBPtcObQfEC4NPwR8lKnTFK84FkAPlc0TP
	vAxXN9N2svJduRal/ofnZ6vz741kiHD3WQ6C1wHWN4LFIo6+ySHMb0uyACD71r/0
	1SaKcQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1tnjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:29:03 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c91ef7009so39261799c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 00:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777447742; x=1778052542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZS5IKfeim46O0kOx4wtbnE1w4xKhmH/WYNeMSKk7vI=;
        b=H+0NhnaqquqqD/kXkWkB2Donlj12y8tpXIGe/xmFNyQun+B741W8IB8zJnxzfdn4QC
         1cnCjCU1a6vB0O5eLJ7yFQp4wmeui+DdNmruRji6UmtHTuQTSqWJdHqTgG9ku2LhoiWJ
         39YJRznZiHIiJfyw0GVrUs+s3pGZNyPKGK5ExfXw1dcEzC+Mfzfp2hmD1k38gFuSef/p
         jBxsTyRcgy+FT+tUPpD+NCV9Oea5SYDv/nvH9VXeiC9pIboG7erOhZ4shd3KAprx4heY
         1RVF6/AulZLLWQQHIjYZP26SXwdJMK0WevHmXBGQp2Ujh9Hj7NBSqC6iaTIKHrLqAjaX
         nI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777447742; x=1778052542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZS5IKfeim46O0kOx4wtbnE1w4xKhmH/WYNeMSKk7vI=;
        b=DgYQs3zyI4IWbACIpgtq8ZOx6NzltQxuxAlO7NJYMTfvKtX8RlGxImcEbl4/z8+bMo
         Ckb0lLPnGPgBNLJO2HzvR5RU1dKQKAGU8NipZ4Ow+Ls5zQ68F0Je/rvKAPFSeazNlbO8
         zqFccdyQdrsTcEhDV58nO80zwaWr4E2YsL3ttCjR5BIFSb1B87RP4wTU3Mu2iTuzYHi4
         BdjMjm/RxVkDB0uKVygO1fQfJvojQT5kUHK2xLW9Qx6cutfYXBb6Kvn8cqZKGkBp/dmo
         eKEYCFiGLAzxSyuD95A2daMkKc8yyVVCpslp18KiLhP0hZ+ES6lF9Bspp5lOIFmdLmnZ
         DkPA==
X-Forwarded-Encrypted: i=1; AFNElJ8b+ZoNnTDhe/3DQJUNZUfOs73k0lN/rt7rTYroVctUETpUkMKS5pMEbYRGyY3C0YUN4ozpTBf2/uta14Hm@vger.kernel.org
X-Gm-Message-State: AOJu0YxCHlYsy1ppGkdI09Ji2pE8TOJwAUvcLPLBo3OBnAt3XcV9jOIQ
	W8Rf2/QTLP04s04b2U64h/cpTfiwP7gDQtIO79oEvkVfuWVGZU9A/wRjP0DUIbykZQPI6o6qrR8
	xGDaoSSCbEBZqFrsHryHm8XDwXD2bmqqX5qIMJETU0rywGnLP1CLiYNi0JDYFUVHLdMDb
X-Gm-Gg: AeBDievoexzLnTryGmeo1E6TPQ2oHE4usodsNNldS1qquHaMPuhFOHMH1A4wx8zPH4p
	DKe1EXLcqD4hWEOvYPoToLsX8uhVn+tbRwq5+R1wAODYnd8e91epgEwwbauHSb/oe7vDuV9s2h3
	UEQoTTWjJpy8WqBbKFnYQQgzTKH2F8mUDRP+ZMxEFvanaLJleGuZnc7xKjfur6kIFP/EV+1gRey
	6gFMw008l6UmBrKWagb5JrDiY1eSHRCG0d7Cl4WAjB/d4gd/fXn61v+Od7uu5mQt8+LtVuPScdd
	Ptzgkc2VcD/mKJFuX+6CdefGPxEv7zKfYknjLbMdskSfY8SVhw6oDP+MzlRs+6raDFJbXp/TzSh
	vJSEvA3U+WIBaro7SA8CN2xPdF7CTSEPRgbDnxXnDZFLKPQLxgaxDT2pv2jtpLede+Kt1xD3Cie
	6YJHmccJvddviX
X-Received: by 2002:a05:7300:238f:b0:2de:6fac:f666 with SMTP id 5a478bee46e88-2ed0a118364mr3139722eec.27.1777447742292;
        Wed, 29 Apr 2026 00:29:02 -0700 (PDT)
X-Received: by 2002:a05:7300:238f:b0:2de:6fac:f666 with SMTP id 5a478bee46e88-2ed0a118364mr3139710eec.27.1777447741601;
        Wed, 29 Apr 2026 00:29:01 -0700 (PDT)
Received: from [10.110.80.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf8e281sm1158944eec.9.2026.04.29.00.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:29:01 -0700 (PDT)
Message-ID: <1f803f25-5f90-4f09-8634-5f27946eb295@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 00:28:59 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
 <20260427214217.2735240-5-ronak.raheja@oss.qualcomm.com>
 <s6ortwyjjoq6lsxjjykbbshg2rczchtol4ntmxipcrsqufvsby@whwxtlnn74id>
Content-Language: en-US
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
In-Reply-To: <s6ortwyjjoq6lsxjjykbbshg2rczchtol4ntmxipcrsqufvsby@whwxtlnn74id>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _UbdfOuwo5PUMtQ3f4oQWFoQDTx6cDoK
X-Proofpoint-ORIG-GUID: _UbdfOuwo5PUMtQ3f4oQWFoQDTx6cDoK
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1b33f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XcaHRVNlpVRLYJM2DHQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3MyBTYWx0ZWRfXyXYo7+gztFZF
 rxklROqYTLq7Eyd0JZwmMxzc+9/qzjf72sstGCSQsqIq1Tvcw6A28LGYyqANSfBfR7UgQOMdjiT
 IdNz3eXUraMHPipPbAiXr30kOmlZ0EigrtSfWZjP+VedfFbLdBmAfvI8612WzV0xu5uHpenAatR
 rZUMzbH8BssKtqAW50+lf4ZPGmxhT2P5Dpkot5JmkXpO3Fs4T8f5dB7VQNUzz0CGR2eP/x3kPtZ
 Rs7llDbT5Anm2U28cBqzj82Vp07RpM/Zr4u0w9OCDZJzbCfSk0Zlk3zaCpHnGIoVitGh/hkSbh7
 zbTUCksudcQ9d1jNAivvw+FeMFanw97qbzvJIie07jS7vEx7H4zRCA4nR35AeIUxURZJ64P1z8o
 Dn7MQ58A95L66D+gQKdO02RK+rPD4ZOQI2Z3Pv37RxJCNikCQNWKVjEH6bnYjuolqeYpfG7/UCy
 R3YTvinJpkw9BIjEY0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290073
X-Rspamd-Queue-Id: F0D8149076C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105133-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 4:40 AM, Dmitry Baryshkov wrote:
> On Mon, Apr 27, 2026 at 02:42:17PM -0700, Ronak Raheja wrote:
>> Add support for the USB3-DP combo PHY found on Hawi platform.
>>
>> The QMP PHY for Hawi uses QSERDES V10 register layouts. Add the required
>> PHY sequences from the hardware programming guide and new V10 register
>> header files. Also add a new v10 offset structure to incorporate the new
>> COM AON register module.
> 
> Was this tested with the DP too or did you test only the USB part?
> 

Only USB was tested. DP support will be added in a follow-up patch
once the MDSS nodes are ready for Hawi.

>>
>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
>>  .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
>>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
>>  .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
>>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
>>  .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
>>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
>>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
>>  9 files changed, 506 insertions(+), 4 deletions(-)
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
>>
>> @@ -2198,6 +2368,7 @@ struct qmp_combo_offsets {
>>  	u16 dp_txa;
>>  	u16 dp_txb;
>>  	u16 dp_dp_phy;
>> +	u16 aon_toggle;
> 
> Are there (or will there) be any other regs? Is it just one-register
> space?
> 

The COM AON block has 3 registers: USB3_AON_TOGGLE_ENABLE (0x00),
DP_AON_TOGGLE_ENABLE (0x04), and DUMMY_STATUS (0x08). Only the first
two are currently used.

>>  };
>>  
>>  struct qmp_phy_cfg {
>> @@ -2705,6 +2895,27 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
>>  	.regs			= qmp_v6_n4_usb3phy_regs_layout,
>>  };
>>  
>> +static const struct qmp_phy_cfg hawi_usb3dpphy_cfg = {
>> +	.offsets		= &qmp_combo_offsets_v10,
>> +
>> +	.serdes_tbl		= hawi_usb3_serdes_tbl,
>> +	.serdes_tbl_num		= ARRAY_SIZE(hawi_usb3_serdes_tbl),
>> +	.tx_tbl			= hawi_usb3_tx_tbl,
>> +	.tx_tbl_num		= ARRAY_SIZE(hawi_usb3_tx_tbl),
>> +	.rx_tbl			= hawi_usb3_rx_tbl,
>> +	.rx_tbl_num		= ARRAY_SIZE(hawi_usb3_rx_tbl),
>> +	.pcs_tbl		= hawi_usb3_pcs_tbl,
>> +	.pcs_tbl_num		= ARRAY_SIZE(hawi_usb3_pcs_tbl),
>> +	.pcs_usb_tbl		= hawi_usb3_pcs_usb_tbl,
>> +	.pcs_usb_tbl_num	= ARRAY_SIZE(hawi_usb3_pcs_usb_tbl),
>> +
>> +	.regs			= qmp_v10_usb3phy_regs_layout,
>> +	.reset_list		= msm8996_usb3phy_reset_l,
>> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
>> +	.vreg_list		= qmp_phy_vreg_l,
>> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> 
> No DP counterpart and no mention of it in the commit message.
> 

The DP configuration will be added in a follow-up patch once the MDSS
nodes are ready for Hawi.

Thanks,
Ronak

>> +};
>> +
>>  static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
>>  	.offsets		= &qmp_combo_offsets_v3,
>>  
> 


