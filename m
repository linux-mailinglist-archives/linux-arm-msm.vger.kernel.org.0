Return-Path: <linux-arm-msm+bounces-101035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJOSLqyqy2kpKAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:06:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A13236880C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02FDD303603B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2DD3AB27A;
	Tue, 31 Mar 2026 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQBPNlsL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyYdPamW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730D6371040
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954689; cv=none; b=VjTAe9gzJqFpi2/czDUXb/kQT64+ybuoYy0pn2BO+Fyd5xH8DxT5j1cVuK3BSGRrl62dD9HjBgnd++UIRWX4DBkyokRcLIcVaE54qkC+cGeR6/KAs/9LO1ugiXBefFPlJMcqmgunK+hrlm0ZhXD73zX+djKqHryFPoK/GpJCuJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954689; c=relaxed/simple;
	bh=b7tq6DQtRCgmYUVhlKeubOo7PrQh/bCTQHPN69hYTiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpOaJuyFp4VY/XYnz+9lNFLExrM3ohJYOl/KXLCWL0LZnw7t5Lhb4iOmpzK8sjc/HTZL0vNfACQuY8fgfPZ1V4YvR/a3/l4u92XPX4SUqoqwhtUxOuacir1ic8QEeOZJwzUBjzTOXGyPJyoVuBOYn6IkxbyCi0sdgL1WrDex3Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQBPNlsL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyYdPamW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7OVQg2465280
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmV+CUKgpBT40E/5onUcGoi9dgiWANHHOSIdJ5YEyhw=; b=AQBPNlsL+M17kdWU
	9OzHm5Su0mgOwcKoIkrtH8rVNDkcRrssNjnJrociLxXfN/H/1czPwNgO311hWLvN
	1Nm8PQivx9hTwJeuw1lQf6mfkYqpshrN0cjkAZNXBrubQVT6QsX9R8TnDsgic9mT
	LEf08m/+az/Ln0tv0yYdZ65vULyI4njrFGKyI1FSFAwZF717gy+QgbZBckUjyDQO
	Px6oY/t81Vkvow3fk/pHzmFdAZQYI3id1OD1TXIRDcfvBl5LMIY+sToONTKgR8HM
	ZiFhJFsizyaRdkdwiVLSpIIZeMQi/gnKBlYhjHRol9AUqxScFDLsjLKv4WXrGq2C
	rai+cg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ut8vjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:58:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c70d1f56eso3475684b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774954686; x=1775559486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rmV+CUKgpBT40E/5onUcGoi9dgiWANHHOSIdJ5YEyhw=;
        b=JyYdPamWqtxT1POtV1ZYswnG47ohhvGMMLcZTneIUyd973fS5LB//wKrNd0iEiXRCA
         uLc4doG4QQ4oXLL0hUcDUSMORnzBb0iqHUuU0w/P3xl0xCTH7sCLcZIIKeic7cNXy6iE
         8RPcuKn4W0aoKrGuDJfPVYhGWwBD5CslHwrnc8Lkq4jDTGRwCRK8CWv+r4/Sqg/XldKj
         F7lBromm1OiZwLecCpqfcnSa2Zvj2vcZG0i+4SuQ0FEqlqwnxpgROQ3KcVAK5WKrllOM
         wHsSIHebXIgIaKvIc+gd0z7vxvF35WunYnt495bI2gns/rAX6EPo+XqVC8IyfoXe0u7t
         zTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774954686; x=1775559486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmV+CUKgpBT40E/5onUcGoi9dgiWANHHOSIdJ5YEyhw=;
        b=bP8iT8afcveoUS/PX4LyZM02s7V35ie/eYX5V1ayQOGb2Ft0IoicBehk9H4mebhM5o
         JJqE1qS2noWzgmbCFm/IVkJ2qZJOVllmCOV10KA7J2yU+vhwd0ib9RYA42+LMPN5SyGH
         t2DwOY8saF+UB954419Z/ML57EEyAGOjwEsY+RW2fTFbtjJdY7UIHlw9oX2UcbC+/RYk
         4ctt2FTff7OBB3V7esPOVvYpI9NFRYG3e/kyt2zk1I6UTxgHkoyCNHndd9V+rHtTayuj
         n23ykTvzU3UgBKVNEknt+WeLmbTB7fGiJVMywByktPb9Du9BVI34SIKH5AUodQT7TLBx
         tGRg==
X-Forwarded-Encrypted: i=1; AJvYcCXOP+oOkQoGkeivtrO2R+NrM9elB5qqK5MohbftdUzfSnmZuwRa8m8aSGQ2in/UwcygnKvNvQNSUdcWV9x9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb8stpmZlhSuspZ6nvYMPxzblJvgmIgp5uzmncNjIroHOVFG2E
	uT7TH66poJbVe5/hbYmSTkogUrfhQTPjSZberGovmXcBEX4DeYjCXrC7DJxnP/FMpgMS4sONQUF
	5eKvc1w+UivlN95i9SSTAii6413fpGDykUJvZjOH6IAWWhvUaIvx7Uv4HcG7xx5QEJ7/x
X-Gm-Gg: ATEYQzx4py7u5kFjVzTHgc/FGuMzWLLRycipfEIML9M2QXgOQ35SYhKxMw4NyOG3xQS
	JY83XIXjVJjcLFoJbNhM9QtSbvXYqIZ82OsBouR4FYlnCms3bSsLALC3gEm0j8TGuJ5sRFoBndE
	Zs3815PchY2eeWVXvH1SUMsL3wQP/KnfZyA5BmZ6ahY3haKOgQQKyzSJUXWfckKMcBuR2bEKWDo
	lAQT5OVelXTYQQXSVjkrPIbvkwTkJNvVWllsjF/1sIlOQnLvI732GzlFLQduqGEwV3QRPKG146V
	nQrXdUdgPW7jfg2/kEvrwWjNQC86svqCBTmp4Vbk4VSvcNVuWnM6Jff5payj98PM4YJ5cOswdB1
	J/0JOCif0NdQeYWX61MpcK5wwLSUWtsAEnLn/pEpXmFwTCfNwG56iVg==
X-Received: by 2002:a05:6a00:2e27:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-82c95c27e6amr14264826b3a.4.1774954686359;
        Tue, 31 Mar 2026 03:58:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e27:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-82c95c27e6amr14264787b3a.4.1774954685820;
        Tue, 31 Mar 2026 03:58:05 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86286dbsm10214104b3a.56.2026.03.31.03.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:58:05 -0700 (PDT)
Message-ID: <5409e13e-280c-47b6-a29f-351cb609bc6f@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 16:27:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
To: Alexander Koskovich <akoskovich@pm.me>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
 <gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <gwVAH2mJerU4dBInw8pKmOs5aQK55Q7W6q_UQAlLFCsEgX6eyvSgXAWbNNMqAX4WmPlYCKUSMhfkr5Jry4Ps5EqnxYZqEEDd3Whwv7ZXGlc=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zqko3n572C6pG5Kf9Tb9dCKgAx4N2YcX
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cba8bf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=6H0WHjuAAAAA:8
 a=d5075zjUzbg6PSGir3kA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=fsdK_YakeE02zTmptMdW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: zqko3n572C6pG5Kf9Tb9dCKgAx4N2YcX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwNSBTYWx0ZWRfX8lThlqosVSOR
 r4C1QvQWBLNX1Jb84OJ6C0gImfXhLvw6vkeWtmeg2atsmUNRzDNLZeZagzgghXDOCLoK6vy5WhR
 0rDw9c9zv/yalRZuJ+dLbwZjxIAwa4V/aRiYchNMTJzt5K2NwFrkknfsGaiKnugOy7wmCX+7MII
 /Iq1Cjc9OgCH+ETRBmcvBZa+9CQe+F33N6fopTNmQojJ7dYOE+l7RRhcUWqIgTyFTFmI4fDoyD9
 2kVDw6zUDMgDj58h555XG8MwatnBVTPLC0SEmeq80VyY8KooclfXLRBsTt0TvfCUwA8f4N7SbCE
 53WOdvtIM329VGUfTCh1YpVxCxmvnb7b4rjRmEiGUczyfbKU90FXl1TD/3zrEA0aXzYLJyh0Pd+
 HqIIspVQFJ9OZgDD5WlRHUDh4N9u808A07vohHwUIXtnBminO90BDGe79O0s9vm4V9GgwsibqxN
 6KxUIAJ05HgEp5YrMHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101035-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:email,codelinaro.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A13236880C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 8:07 AM, Alexander Koskovich wrote:
> On Friday, March 6th, 2026 at 8:56 AM, Luca Weiss <luca.weiss@fairphone.com> wrote:
> 
>> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
>> clocks for the GPU subsystem on GX power domain. The GX clock controller
>> driver manages only the GX GDSC and the rest of the resources of the
>> controller are managed by the firmware.
>>
>> We can use the existing kaanapali driver for Milos as well since the
>> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
>> configuration.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/clk/qcom/Makefile             | 2 +-
>>  drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 90ea21c3b7cf..155830140d26 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -182,7 +182,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
>>  obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
>>  obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
>>  obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
>> -obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
>> +obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o gxclkctl-kaanapali.o
>>  obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
>>  obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
>>  obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
>> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
>> index 3ee512f34967..d3899420d6f2 100644
>> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
>> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
>> @@ -54,6 +54,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
>>  static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
>>  	{ .compatible = "qcom,glymur-gxclkctl" },
>>  	{ .compatible = "qcom,kaanapali-gxclkctl" },
>> +	{ .compatible = "qcom,milos-gxclkctl" },
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);
>>
>> --
>> 2.53.0
>>
> 
> Was running into gx_clkctl_gx_gdsc being stuck on when GPU was doing runtime pm
> and it seems like this GDSC requires GPU_CC_GX_AHB_FF_CLK to be enabled. Though
> it is already in gpu_cc_milos_critical_cbcrs, the GMU firmware appears to be
> disabling it.
> 
> Relevant downstream change:
> https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/3c1f31518edb7b094b9b9285287ba49a5c9196d8
> 

Hi Alexander,

This change was introduced as a temporary placeholder specific to downstream GPU SW & GPUCC code,
to unblock the gx gdsc warnings observed during system resume. But it is not the final
implementation and change was reverted later in below commit:
https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/11bd8d8d6f654cf156bb4fbbfe6587e0c41adc2b
 
But you are right, gpu_cc_gx_ahb_ff_clk is indeed required for GX GDSC register access. And the
actual requirement is linux GMU driver should disable the GX GDSC only in GMU recovery use case
at which point the necessary clock will already be enabled by firmware. In all other cases, the
GX GDSC should never be enabled/disabled from linux.
 
In the upstream implementation of GMU driver, the GX GDSC is being enabled/disabled in every runtime
resume/suspend of GMU driver which is leading to these GX GDSC warnings.  Milos GPU architecture is
similar to that of Pakala and similar GX GDSC warnings were reported on Pakala already[1].
Discussions are in progress with internal GPU SW team to see if GX GDSC can be handled gracefully
only during GMU recovery use case and not control it in other scenarios, to avoid this issue and
without impacting any other GPU use cases.
 
[1]: https://lore.kernel.org/all/CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com/

Thanks,
Jagadeesh

>>
>>
> 


