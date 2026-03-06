Return-Path: <linux-arm-msm+bounces-95848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AdbAY7rqmlxYwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:58:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A006223341
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE69A3025F68
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396B93A9D84;
	Fri,  6 Mar 2026 14:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+rmMnMi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OuRhKzH8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAD2F6565
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809003; cv=none; b=UOIj96zQ5K8GPjyjVRWZ5VUZ1T6djEfH+zPm2JOEFQkoraMPgkdoLtHAlujZUcNpT4gMp+m0mcQjkzkAqbAuMauCOacCA7vbGfr+McaZzMVEYJNblyAg3HLkFBMrgN7d3Tx7oTSlEsCkk5PV+9XkSyxsz61JzMTGH9WTXFSHKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809003; c=relaxed/simple;
	bh=p2hFAe+Y4IqM7bFXZ2XLknPNHp6Co230/2A3Vzyitrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3kbCr34vg856I6FWIysDwxKA6BKKO3UB0UlJ4unOllr4yDOFWbgwASI/FcA/pW6xnTw43pvSUGKCF+IOckWQXI/8dQ+wraLig03ObsdxkMHMrq00CEOH5Qy0xDKSxm0d1bjhTtYs96fS2AdIoTSqO+SL+8bMNco86SD3UHLtHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+rmMnMi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OuRhKzH8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BajCr4186040
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXCHikF8KUfYdmPShFP9GEVmU/PX5zhrSuocgDLD8BA=; b=O+rmMnMijFJgNzXR
	TArltUfUKsPbcAcFG1xdnxW5VhNIQuatht2HVyFEaJgzma5OpbIf8b284hcDWSnR
	0WMOsyM8HwL1C/JQ6TZI41PgEBb58nAqexT4XEcvQ2HzT/19Exje06UleyqomZ31
	tR1qzIk9/IKp+aUtUAQ5dHNqt3/ojwhudorYKVSB1wCm/Sul4OxpH4yaKr3eOKFo
	pGHJiHZwk9S0++5+SWQGPo63w5ZcZ6Zm/TSbeZeQjL505t6H8e8pKBSEOabBb/9+
	nWJr9TYwNHW5J0all5RJqxCMXB85jML9mR6sIKcm4QthF/+hQIZhiXqFNjfXAzxK
	00M+IQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruk9s9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:56:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829a4b6d5c4so256199b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772808998; x=1773413798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXCHikF8KUfYdmPShFP9GEVmU/PX5zhrSuocgDLD8BA=;
        b=OuRhKzH85lq2ReZnDVEKuBK5kOZzkjKmSh334tBxoOG0AhnpotzhSg368Vc9IMnxR6
         6ZF/Yhx8XPDcrF6KNcMlgAEqh+1W3+lTxENaJNQvKVIRDuXrpwxvSGrKwff6EOL+0hnh
         9NnYgwUETWqhJb0PIgMMmzZf8VvQ7Mpd2Hlt3Hjcl9jScEyojLATk7nEROJ1cieLWvg8
         yxqAf6sfsYE1h6F038LH7hiH1bmH0hueCBzn17IWHJMr2gNX+cqHm0xDqSCrjSSwxXw3
         bxglLrymcJgNKsVn7Sxe/tkexoCXmPqCWIwpA5K8I2tJcYKq/+vmAiD3Se6l83joKFZH
         ycQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772808998; x=1773413798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXCHikF8KUfYdmPShFP9GEVmU/PX5zhrSuocgDLD8BA=;
        b=N1ZHK6EfechdW9kv7KovLi8C6qL6sx7QMx1Jbx8UtpY5dN4q1kpnWyMnsr7GXSB4QQ
         bPrrb9iUd70EKcJy6S0V+kjAv+ZzgjnMuKlZVV5VGTKBbkeBmNEkinLCuSUN1iK+OjZ+
         hRzKXQrMtb5XExwSAj27lWqngGQgnAHEoGBGc06Eo30n58kczmV9jr8NDJ6GgxfZix7i
         EZoK8qmoBB5ZAeAvzaZWiQWdBaMhYA7fAadrlvDBOxKoPuhJveg5JPTYaUMamG4Y/Ckz
         8HNEsmvqpKVSYgsfeZNpI34iKpsJI1YFUG8KJZSsm0M2mF4Bnxv7JycPDy+X1xZp4qk6
         E1Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWB6s7cG9GjWsrWWlqGefzUXdv+g4YV9QroLcaizB4HW9ms1XMUMFW/KXpe8nCWDvZfgsKXen3xJZnguGjz@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfd+1EcQZJp4LJP/k1GodV/9SFEODR1czbE2rDMYBxRNt3Ldl
	CBd+M5paZm7Z7lL5kejOioDmVXOGW5fDqbviPSeLqTJuMRV7xzr2GaI7A/uv33VOo23nPLPUbBk
	h4sBL1XsNCnmK1chByyKfHoioQVHe7YVeBGxWF+lgiMQ5pc2uGQ6J0JOObgpsugnI4oyI
X-Gm-Gg: ATEYQzzYkJYrOogEtO2kNXrcwlCzjaQ1Ol+UNMhqjkhg4WXNQSLIGWQIuI/hpZixMRl
	W0ShXUAZf60zAKMnwQCnxNqjy5z/eOg7nLNQehFf+CJtLT/+2drithcH16SrgVuUanh2G9+oiHF
	Dqlz5bS7ugpeUWd6Ja5TBfij+FLpPSsbjKxlMWN8hDXQgVAewRtiTaAxCWQ9tgU5gE6j/7RC3C6
	K0QSRos1ukcUhGeOF+UhfgmC5iT2+YsZgaViZmH+WnURGJuYu3IqULhkaDGkUO3RZFRvQOAXeoh
	Kp0VXbBNZo/lm75WORuggAglr/e5+mDKhW2/jf8Gly4a/GsWwOdcvBGTmvy/2dw9SEelZAPHfDu
	2QwK3iGUq7yy5hbKjbFlgDdBJI3lazlz0wxG9UHS2Pdqo5KJxtiBfhKU1ZvPRhhwoZU0+6N9uGT
	k0hjbdrX+kBzw=
X-Received: by 2002:a05:6a00:1597:b0:7e8:4471:ae55 with SMTP id d2e1a72fcca58-829a2f4f6bbmr1719776b3a.33.1772808997793;
        Fri, 06 Mar 2026 06:56:37 -0800 (PST)
X-Received: by 2002:a05:6a00:1597:b0:7e8:4471:ae55 with SMTP id d2e1a72fcca58-829a2f4f6bbmr1719749b3a.33.1772808997251;
        Fri, 06 Mar 2026 06:56:37 -0800 (PST)
Received: from ?IPV6:2401:4900:88f5:81:e13b:ce78:7823:d9c3? ([2401:4900:88f5:81:e13b:ce78:7823:d9c3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a2258sm2067215b3a.46.2026.03.06.06.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:56:36 -0800 (PST)
Message-ID: <18076843-b4fe-407e-b933-aaf3ec4b8c0f@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:26:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-3-dbbd2d258bd6@oss.qualcomm.com>
 <tz7njmffqixqn7554dqllqjridi6uksjcd4rq33lx5b3bj354k@bldalfcu5xyq>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <tz7njmffqixqn7554dqllqjridi6uksjcd4rq33lx5b3bj354k@bldalfcu5xyq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0MyBTYWx0ZWRfX/VqtjWQCC4Ci
 SWk5dVeb9qMUgYJbGCBL99kA5e8f6UIWXT1+lwX8ifXOl9enexcWqIbpwdYtgfxet8xfJcRNM4x
 KiTRRxZLA9lT1/78nZtQBNebjG3RE6socUzpvlkKOY1ku+U39mFUdFbD2lKTUClYtBjQ4rnz+8t
 MOX89m8SCc1byy7K0oiJc9Rqw/KGJIhU3bMi5fIeAyGrxegk+l8AqvrPnZrDczeTdc1olXYOJjM
 i/bKSeha5oUkzVA8wr5lzM1tkZcI5O4BN+VZqccmXohliPOTr/BobrPGrlLzXNwtk5RbAxZ5NQ9
 XcWUkZGsn2yVJL5a1poqqHI0vL+L7vQU/LskI68cD355KbNgUPqCExDpNQz1MizzteK3HSZZkiJ
 lhSBaDOmS9/pfOX55L2ONrpDXH03V308KKGYKV5SkxLYMPn2WqY5dHt/syJ86NJWtRKx37auLZi
 dJB5oGPml2xmGJzzkUw==
X-Proofpoint-ORIG-GUID: dQRM3BvnQsgSF1pYOH6aKjDkaZcqRjet
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aaeb28 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=7FAE2XUoPshLKEvahKUA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: dQRM3BvnQsgSF1pYOH6aKjDkaZcqRjet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060143
X-Rspamd-Queue-Id: 9A006223341
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-95848-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/5/2026 5:50 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 04, 2026 at 11:10:53PM +0530, Jagadeesh Kona wrote:
>> Add support for the video clock controller for video clients to be
>> able to request for videocc clocks on X1P42100 platform. Although
>> X1P42100 is derived from X1E80100, the video clock controller differs
>> significantly. The BSE clocks are newly added, several cdiv clocks have
>> been removed, and most RCG frequency tables have been updated. Initial
>> PLL configurations also require changes, hence introduce a separate
>> videocc driver for X1P42100 platform.
>>
>> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig            |  10 +
>>  drivers/clk/qcom/Makefile           |   1 +
>>  drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 596 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index a8a86ea6bb7445e396048a5bba23fce8d719281f..b1b1ed70871c1b348985d6f5149152e57637d904 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -155,6 +155,16 @@ config CLK_X1P42100_GPUCC
>>  	  Say Y if you want to support graphics controller devices and
>>  	  functionality such as 3D graphics.
>>  
>> +config CLK_X1P42100_VIDEOCC
>> +	tristate "X1P42100 Video Clock Controller"
>> +	depends on ARM64 || COMPILE_TEST
>> +	select CLK_X1E80100_GCC
>> +	help
>> +	  Support for the video clock controller on Qualcomm Technologies, Inc.
>> +	  X1P42100 devices.
>> +	  Say Y if you want to support video devices and functionality such as
>> +	  video encode/decode.
>> +
>>  config CLK_QCM2290_GPUCC
>>  	tristate "QCM2290 Graphics Clock Controller"
>>  	depends on ARM64 || COMPILE_TEST
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..b746e5046774259cebe3da8dad1f226561268a8b 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -36,6 +36,7 @@ obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
>>  obj-$(CONFIG_CLK_X1E80100_GPUCC) += gpucc-x1e80100.o
>>  obj-$(CONFIG_CLK_X1E80100_TCSRCC) += tcsrcc-x1e80100.o
>>  obj-$(CONFIG_CLK_X1P42100_GPUCC) += gpucc-x1p42100.o
>> +obj-$(CONFIG_CLK_X1P42100_VIDEOCC) += videocc-x1p42100.o
>>  obj-$(CONFIG_CLK_QCM2290_GPUCC) += gpucc-qcm2290.o
>>  obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
>>  obj-$(CONFIG_IPQ_APSS_5424) += apss-ipq5424.o
>> diff --git a/drivers/clk/qcom/videocc-x1p42100.c b/drivers/clk/qcom/videocc-x1p42100.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..4e92f0ab7e4016724af1f31aa4896655b1dc8308
>> --- /dev/null
>> +++ b/drivers/clk/qcom/videocc-x1p42100.c
>> @@ -0,0 +1,585 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,sm8650-videocc.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "clk-regmap-divider.h"
>> +#include "common.h"
>> +#include "gdsc.h"
>> +#include "reset.h"
>> +
>> +enum {
>> +	DT_BI_TCXO,
>> +};
>> +
>> +enum {
>> +	P_BI_TCXO,
>> +	P_VIDEO_CC_PLL0_OUT_MAIN,
>> +	P_VIDEO_CC_PLL1_OUT_MAIN,
>> +};
>> +
>> +static const struct pll_vco lucid_ole_vco[] = {
>> +	{ 249600000, 2300000000, 0 },
>> +};
>> +
>> +/* 420.0 MHz Configuration */
>> +static const struct alpha_pll_config video_cc_pll0_config = {
>> +	.l = 0x15,
>> +	.alpha = 0xe000,
>> +	.config_ctl_val = 0x20485699,
>> +	.config_ctl_hi_val = 0x00182261,
>> +	.config_ctl_hi1_val = 0x82aa299c,
>> +	.test_ctl_val = 0x00000000,
>> +	.test_ctl_hi_val = 0x00000003,
>> +	.test_ctl_hi1_val = 0x00009000,
>> +	.test_ctl_hi2_val = 0x00000034,
>> +	.user_ctl_val = 0x00000000,
>> +	.user_ctl_hi_val = 0x00000005,
>> +};
>> +
>> +static struct clk_alpha_pll video_cc_pll0 = {
>> +	.offset = 0x0,
>> +	.config = &video_cc_pll0_config,
>> +	.vco_table = lucid_ole_vco,
>> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
>> +	.clkr = {
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "video_cc_pll0",
>> +			.parent_data = &(const struct clk_parent_data) {
>> +				.index = DT_BI_TCXO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_lucid_evo_ops,
>> +		},
>> +	},
>> +};
>> +
>> +/* 1050.0 MHz Configuration */
>> +static const struct alpha_pll_config video_cc_pll1_config = {
>> +	.l = 0x36,
>> +	.alpha = 0xb000,
>> +	.config_ctl_val = 0x20485699,
>> +	.config_ctl_hi_val = 0x00182261,
>> +	.config_ctl_hi1_val = 0x82aa299c,
>> +	.test_ctl_val = 0x00000000,
>> +	.test_ctl_hi_val = 0x00000003,
>> +	.test_ctl_hi1_val = 0x00009000,
>> +	.test_ctl_hi2_val = 0x00000034,
>> +	.user_ctl_val = 0x00000000,
>> +	.user_ctl_hi_val = 0x00000005,
>> +};
>> +
>> +static struct clk_alpha_pll video_cc_pll1 = {
>> +	.offset = 0x1000,
>> +	.config = &video_cc_pll1_config,
>> +	.vco_table = lucid_ole_vco,
>> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
>> +	.clkr = {
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "video_cc_pll1",
>> +			.parent_data = &(const struct clk_parent_data) {
>> +				.index = DT_BI_TCXO,
>> +			},
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_lucid_evo_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static const struct parent_map video_cc_parent_map_0[] = {
>> +	{ P_BI_TCXO, 0 },
>> +};
>> +
>> +static const struct clk_parent_data video_cc_parent_data_0[] = {
>> +	{ .index = DT_BI_TCXO },
>> +};
>> +
>> +static const struct parent_map video_cc_parent_map_1[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
>> +};
>> +
>> +static const struct clk_parent_data video_cc_parent_data_1[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &video_cc_pll0.clkr.hw },
>> +};
>> +
>> +static const struct parent_map video_cc_parent_map_2[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
>> +};
>> +
>> +static const struct clk_parent_data video_cc_parent_data_2[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &video_cc_pll1.clkr.hw },
>> +};
>> +
>> +static const struct freq_tbl ftbl_video_cc_mvs0_bse_clk_src[] = {
>> +	F(420000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
>> +	F(600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
>> +	F(670000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
>> +	F(848000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
>> +	F(920000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 video_cc_mvs0_bse_clk_src = {
>> +	.cmd_rcgr = 0x8154,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = video_cc_parent_map_1,
>> +	.freq_tbl = ftbl_video_cc_mvs0_bse_clk_src,
>> +	.hw_clk_ctrl = true,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "video_cc_mvs0_bse_clk_src",
>> +		.parent_data = video_cc_parent_data_1,
>> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_rcg2_shared_ops,
>> +	},
>> +};
>> +
>> +static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
>> +	F(210000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
>> +	F(300000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
>> +	F(335000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
>> +	F(424000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
>> +	F(460000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 video_cc_mvs0_clk_src = {
>> +	.cmd_rcgr = 0x8000,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = video_cc_parent_map_1,
>> +	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
>> +	.hw_clk_ctrl = true,
> 
> sm8550/x1e don't enable hw_clk_ctrl here. Is this an expected
> difference?
> 
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "video_cc_mvs0_clk_src",
>> +		.parent_data = video_cc_parent_data_1,
>> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_rcg2_shared_ops,
>> +	},
>> +};
>> +
>> +static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
>> +	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
>> +	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
>> +	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 video_cc_mvs1_clk_src = {
>> +	.cmd_rcgr = 0x8018,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = video_cc_parent_map_2,
>> +	.freq_tbl = ftbl_video_cc_mvs1_clk_src,
>> +	.hw_clk_ctrl = true,
> 
> sm8550/x1e don't enable hw_clk_ctrl here. Is this an expected
> difference?
> 

It is recommended to set HW_CLK_CONTROL bit for all RCG's, hence
hw_clk_ctrl here is expected only. Will check the applicability
on other targets also and post the changes accordingly.

>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "video_cc_mvs1_clk_src",
>> +		.parent_data = video_cc_parent_data_2,
>> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_rcg2_shared_ops,
>> +	},
>> +};
>> +
>> +static const struct freq_tbl ftbl_video_cc_xo_clk_src[] = {
>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 video_cc_xo_clk_src = {
>> +	.cmd_rcgr = 0x810c,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = video_cc_parent_map_0,
>> +	.freq_tbl = ftbl_video_cc_xo_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "video_cc_xo_clk_src",
>> +		.parent_data = video_cc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_rcg2_shared_ops,
>> +	},
>> +};
>> +
>> +static struct clk_regmap_div video_cc_mvs0_bse_div4_div_clk_src = {
>> +	.reg = 0x817c,
>> +	.shift = 0,
>> +	.width = 4,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "video_cc_mvs0_bse_div4_div_clk_src",
>> +		.parent_hws = (const struct clk_hw*[]) {
>> +			&video_cc_mvs0_bse_clk_src.clkr.hw,
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_regmap_div_ro_ops,
>> +	},
>> +};
>> +
>> +static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
>> +	.reg = 0x80ec,
>> +	.shift = 0,
>> +	.width = 4,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "video_cc_mvs1_div_clk_src",
>> +		.parent_hws = (const struct clk_hw*[]) {
>> +			&video_cc_mvs1_clk_src.clkr.hw,
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_regmap_div_ro_ops,
>> +	},
>> +};
>> +
>> +static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
>> +	.reg = 0x809c,
>> +	.shift = 0,
>> +	.width = 4,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "video_cc_mvs1c_div2_div_clk_src",
>> +		.parent_hws = (const struct clk_hw*[]) {
>> +			&video_cc_mvs1_clk_src.clkr.hw,
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_regmap_div_ro_ops,
>> +	},
>> +};
>> +
>> +static struct clk_branch video_cc_mvs0_bse_clk = {
>> +	.halt_reg = 0x8170,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x8170,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "video_cc_mvs0_bse_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&video_cc_mvs0_bse_div4_div_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch video_cc_mvs0_clk = {
>> +	.halt_reg = 0x80b8,
>> +	.halt_check = BRANCH_HALT_VOTED,
> 
> x1e has BRANCH_HALT_SKIP here. Is there a reason for the difference?
> 

Ideally for SM8550/X1E also, it should be BRANCH_HALT_VOTED. Will check
internally and post BRANCH_HALT_VOTED for SM8550/X1E also.

>> +	.hwcg_reg = 0x80b8,
>> +	.hwcg_bit = 1,
>> +	.clkr = {
>> +		.enable_reg = 0x80b8,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "video_cc_mvs0_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&video_cc_mvs0_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch video_cc_mvs0_shift_clk = {
>> +	.halt_reg = 0x8128,
>> +	.halt_check = BRANCH_HALT_VOTED,
> 
> No .hwcg_reg?
> 

Purwa doesn't have HW_CTRL bit in this CBCR, so hwcg_reg is not required.


>> +	.clkr = {
>> +		.enable_reg = 0x8128,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "video_cc_mvs0_shift_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&video_cc_xo_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch video_cc_mvs0c_clk = {
>> +	.halt_reg = 0x8064,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x8064,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "video_cc_mvs0c_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&video_cc_mvs0_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch video_cc_mvs0c_shift_clk = {
>> +	.halt_reg = 0x812c,
>> +	.halt_check = BRANCH_HALT_VOTED,
>> +	.clkr = {
>> +		.enable_reg = 0x812c,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "video_cc_mvs0c_shift_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&video_cc_xo_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch video_cc_mvs1_clk = {
>> +	.halt_reg = 0x80e0,
>> +	.halt_check = BRANCH_HALT_VOTED,
>> +	.hwcg_reg = 0x80e0,
>> +	.hwcg_bit = 1,
>> +	.clkr = {
>> +		.enable_reg = 0x80e0,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "video_cc_mvs1_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&video_cc_mvs1_div_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch video_cc_mvs1_shift_clk = {
>> +	.halt_reg = 0x8130,
>> +	.halt_check = BRANCH_HALT_VOTED,
>> +	.clkr = {
>> +		.enable_reg = 0x8130,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "video_cc_mvs1_shift_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&video_cc_xo_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch video_cc_mvs1c_clk = {
>> +	.halt_reg = 0x8090,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x8090,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "video_cc_mvs1c_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch video_cc_mvs1c_shift_clk = {
>> +	.halt_reg = 0x8134,
>> +	.halt_check = BRANCH_HALT_VOTED,
>> +	.clkr = {
>> +		.enable_reg = 0x8134,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "video_cc_mvs1c_shift_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&video_cc_xo_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct gdsc video_cc_mvs0c_gdsc = {
>> +	.gdscr = 0x804c,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0x6,
>> +	.pd = {
>> +		.name = "video_cc_mvs0c_gdsc",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>> +};
>> +
>> +static struct gdsc video_cc_mvs0_gdsc = {
>> +	.gdscr = 0x80a4,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0x6,
>> +	.pd = {
>> +		.name = "video_cc_mvs0_gdsc",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &video_cc_mvs0c_gdsc.pd,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>> +};
>> +
>> +static struct gdsc video_cc_mvs1c_gdsc = {
>> +	.gdscr = 0x8078,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
> 
> x1e has 0x6 here. Is this one correct?
> 

These fields are taken from HW default PoR values, and
yes on Purwa the default PoR value is 0xf, while it is
0x6 on X1E, so this is expected only.

>> +	.pd = {
>> +		.name = "video_cc_mvs1c_gdsc",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>> +};
>> +
>> +static struct gdsc video_cc_mvs1_gdsc = {
>> +	.gdscr = 0x80cc,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
> 
> And here.
> 

Same as above

>> +	.pd = {
>> +		.name = "video_cc_mvs1_gdsc",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &video_cc_mvs1c_gdsc.pd,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>> +};
>> +
>> +static struct clk_regmap *video_cc_x1p42100_clocks[] = {
>> +	[VIDEO_CC_MVS0_BSE_CLK] = &video_cc_mvs0_bse_clk.clkr,
>> +	[VIDEO_CC_MVS0_BSE_CLK_SRC] = &video_cc_mvs0_bse_clk_src.clkr,
>> +	[VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC] = &video_cc_mvs0_bse_div4_div_clk_src.clkr,
>> +	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
>> +	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
>> +	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
>> +	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
>> +	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
>> +	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
>> +	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
>> +	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
>> +	[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr,
>> +	[VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
>> +	[VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
>> +	[VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr,
>> +	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
>> +	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
>> +	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
>> +};
>> +
>> +static struct gdsc *video_cc_x1p42100_gdscs[] = {
>> +	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
>> +	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
>> +	[VIDEO_CC_MVS1_GDSC] = &video_cc_mvs1_gdsc,
>> +	[VIDEO_CC_MVS1C_GDSC] = &video_cc_mvs1c_gdsc,
>> +};
>> +
>> +static const struct qcom_reset_map video_cc_x1p42100_resets[] = {
>> +	[CVP_VIDEO_CC_INTERFACE_BCR] = { 0x80f0 },
>> +	[CVP_VIDEO_CC_MVS0_BCR] = { 0x80a0 },
>> +	[CVP_VIDEO_CC_MVS0C_BCR] = { 0x8048 },
>> +	[CVP_VIDEO_CC_MVS1_BCR] = { 0x80c8 },
>> +	[CVP_VIDEO_CC_MVS1C_BCR] = { 0x8074 },
>> +	[VIDEO_CC_MVS0_BSE_BCR] = { 0x816c },
>> +	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
>> +	[VIDEO_CC_MVS1C_CLK_ARES] = { 0x8090, 2 },
>> +	[VIDEO_CC_XO_CLK_ARES] = { 0x8124, 2 },
> 
> C99 for non-single-reg entries, please. SM8550 also hase udelay here, is
> there a reason for not having it here?
> 

I will add the delay and non-single-reg entries similar to SM8550.

Thanks,
Jagadeesh

>> +};
>> +
>> +static struct clk_alpha_pll *video_cc_x1p42100_plls[] = {
>> +	&video_cc_pll0,
>> +	&video_cc_pll1,
>> +};
>> +
>> +static u32 video_cc_x1p42100_critical_cbcrs[] = {
>> +	0x80f4, /* VIDEO_CC_AHB_CLK */
>> +	0x8150, /* VIDEO_CC_SLEEP_CLK */
>> +	0x8124, /* VIDEO_CC_XO_CLK */
>> +};
>> +
>> +static const struct regmap_config video_cc_x1p42100_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.max_register = 0x9f54,
>> +	.fast_io = true,
>> +};
>> +
>> +static struct qcom_cc_driver_data video_cc_x1p42100_driver_data = {
>> +	.alpha_plls = video_cc_x1p42100_plls,
>> +	.num_alpha_plls = ARRAY_SIZE(video_cc_x1p42100_plls),
>> +	.clk_cbcrs = video_cc_x1p42100_critical_cbcrs,
>> +	.num_clk_cbcrs = ARRAY_SIZE(video_cc_x1p42100_critical_cbcrs),
>> +};
>> +
>> +static const struct qcom_cc_desc video_cc_x1p42100_desc = {
>> +	.config = &video_cc_x1p42100_regmap_config,
>> +	.clks = video_cc_x1p42100_clocks,
>> +	.num_clks = ARRAY_SIZE(video_cc_x1p42100_clocks),
>> +	.resets = video_cc_x1p42100_resets,
>> +	.num_resets = ARRAY_SIZE(video_cc_x1p42100_resets),
>> +	.gdscs = video_cc_x1p42100_gdscs,
>> +	.num_gdscs = ARRAY_SIZE(video_cc_x1p42100_gdscs),
>> +	.use_rpm = true,
>> +	.driver_data = &video_cc_x1p42100_driver_data,
>> +};
>> +
>> +static const struct of_device_id video_cc_x1p42100_match_table[] = {
>> +	{ .compatible = "qcom,x1p42100-videocc" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, video_cc_x1p42100_match_table);
>> +
>> +static int video_cc_x1p42100_probe(struct platform_device *pdev)
>> +{
>> +	return qcom_cc_probe(pdev, &video_cc_x1p42100_desc);
>> +}
>> +
>> +static struct platform_driver video_cc_x1p42100_driver = {
>> +	.probe = video_cc_x1p42100_probe,
>> +	.driver = {
>> +		.name = "videocc-x1p42100",
>> +		.of_match_table = video_cc_x1p42100_match_table,
>> +	},
>> +};
>> +
>> +module_platform_driver(video_cc_x1p42100_driver);
>> +
>> +MODULE_DESCRIPTION("QTI VIDEOCC X1P42100 Driver");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>
> 


