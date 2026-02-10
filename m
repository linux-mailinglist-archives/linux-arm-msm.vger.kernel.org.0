Return-Path: <linux-arm-msm+bounces-92477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNsbMNMGi2kdPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:22:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E567E119930
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A2913009E1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA09352FBB;
	Tue, 10 Feb 2026 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qs8BXQx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRE0cZHG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE8352FA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770718925; cv=none; b=Ht1G6tnTiwOXFAW3hmZIpUl7AM4l8sL48Hci6+sIvpBfpR6DDCe91aDSNWynDCtB9ag2QUDE0i+z2VpjqZCwwWvP3j2QPyZlHgE/K19cyqJbH2SiIxH1qfOietWgcNKayDdLam1BiBRuZLRMJgYPcMJ8WOj+4JyUbXDMcURwGzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770718925; c=relaxed/simple;
	bh=gI0uSe6xdP7wA3g45lbH73AvP5DIXkQ622aiAYNF9yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYB6vKr5rj4wADG8UADIbTrLcVvafDoEbJ/F6afCRdOm2JSBs+LxRSyVk1xp3v0wsakEKDpBj76I8QFL9peUizljLr7RJ5/JZnVgS59iTwRCJmtm0Ba1SkCCKoE37GH0/ljunoLqF7eiE8sT/539MVyRHxkhQbGq2nlshUTM/U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qs8BXQx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRE0cZHG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7DuaM4003512
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3YjCD5VIamP8jn5HK0Atw0KqI7eQ9Ow3MU1kuHgTnM=; b=Qs8BXQx1Am1qt5NU
	mspb3m8KZh7Gcj703Q3L8v1EeC7iyGdcORhfVyPZ8nGNj4JI3961fDIK1C1z7JPk
	9yQ5/bGOFEFcpEUm6ZTS9IIcCL0QEYHRmQtYDw01U0OzwS8Ad+bmRaNEiHWc7gI1
	gmvGqGUujPMwaDNizDmBmtR9tXNLATpvlMzJMEkemM+YFSJgDMDyQT+7UD+/BF/k
	S5IjlxYlDnuNjdOdAPkebCyixvWCtv08YvFU89+2hSRDECI/vQqpUkYwsazJWz8i
	tuB711GT07RnzvhWNu0UNHW6YeGqYKXPUrKp3cys/wYhBl/cuDuZUFfgVr6v8F2V
	r2bE/Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7r23j5vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:22:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c551e6fe4b4so3847504a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770718923; x=1771323723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L3YjCD5VIamP8jn5HK0Atw0KqI7eQ9Ow3MU1kuHgTnM=;
        b=WRE0cZHGbWg8hal/WynIT4SJBRwGlTwJMNgb6/zGIq8vo1yfRfEpEyGDjwJ9lzCMvK
         0c1xGceSfViEsPxI/BiFarkdKMBNyKcrQE4909RL4WrA6dRTzUTuwVIDaAzugD6KxB3e
         m7XZl62bM5eKxvcoYfNqrePFLmat7tU9QXu0CBqy9QSjx5PZ/kPXVAWYionVVVrFFeZt
         /uXtpeqrmHIaJo3rvNlZZ4nsg8S5XxLnyYucW0F1NHX6tu2/hOPvn1SozPneyTdOi2mH
         GOUMiaq7CyL6dsKlyJ1/aXOfbkIt6e8Fb4/j37mVhftqJJFz6JzXWiSTajNR4V/gUWAJ
         j5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770718923; x=1771323723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3YjCD5VIamP8jn5HK0Atw0KqI7eQ9Ow3MU1kuHgTnM=;
        b=MdDPz75YT6ISkAdQBYcUqdy8w04sfQ4+Rbt1rDjG2kCR6eAdVF7RmbyJZ5iIxg1otv
         eMJBzp07+4W+lDp+QJipqol9KCUmpXdnBeU4IDjx8iG/ifEkse+CTZtGpkN5d+0VrhTk
         s/sRyTB3LkvyG2QYJ9Q6rjVu3m5eSRLpu5RPrvaO0H12Neod29L37jIea/kZFWjTe1ai
         0dKP7GY5hrxQMtGjNdDBnWKxS/2McL+vZr6wnsCX65xcBQuBDei1examWyuFKCj0q07r
         iKS4lB9PNWjyXx93n3ihSBdUuelQoDNcStDvcmG7mG4b5H/wq4tIRpZti+1nIos5EjZg
         POgA==
X-Forwarded-Encrypted: i=1; AJvYcCVGcBfdzmFFmRkSIz8sZuQTFaK9w1cc0Sm09JlAa+CLA1OxVCJhlScJMU0Ezw5t6CCXFhRE68UiW5ANtmAg@vger.kernel.org
X-Gm-Message-State: AOJu0YwW5DQqwhjfQh5njF0AZJlrDnqnFlUx/A+O26uOO5a07xBQ/w1u
	UMTQ+IGFgfBsARw3ng336/De3OHB5e0UFYr8zMG0ZmADyHE3xamE+4BtvKBZJbpLovo9piVyf2+
	5jdcL2MmrCqdPsRAUjVaXLGGpaCtAMPGbcfPuCpOzW+GDMrEZQmOxIlZU9VCrgGbZwqcB
X-Gm-Gg: AZuq6aI3uaa8mp4KvtE8wajljKhb8mc4WpUUapx9J8l9U4gOq/YRGVRhj/Yba3Q6jWC
	wXcUeJhdUHtnf1lrVA9WftsibOATQKuQJ8rk7qkVxuzg3k7kFoyt1pXLnxiFGDV6VlqLlojTIik
	Yy13ve91HMjVthUzy8gNJ4lgeHuNW/ZbMwMB5bKFfq4L0wcbSVidS7Nv3xx4RQO+lKtQarnvYJa
	v+OGw7vcKZd9g1MvNckFnMzHl2Sz1kmuR2O5zseOfRYhiVlXqPitfd2aDiz7YiSuqzZcr0I6LJc
	QkHTdthNVpRdsZGyR5KZIbWuf/GO5Fi7PQ/fweCN4ro0jWA3qZ5r4BVw/ANFxGLhqEL0kbjmqkr
	7+tiA6bZYxdVng0jy7+AiVS19FjBANv4vYgwYfkRBzRo+iDUwd7ULLPy/inlJPMNmZdhtUpci2X
	UyfiH6c6wN2ojSo/w=
X-Received: by 2002:a05:6a00:9513:b0:81f:45d3:adcc with SMTP id d2e1a72fcca58-824879a5af8mr1785784b3a.18.1770718922719;
        Tue, 10 Feb 2026 02:22:02 -0800 (PST)
X-Received: by 2002:a05:6a00:9513:b0:81f:45d3:adcc with SMTP id d2e1a72fcca58-824879a5af8mr1785760b3a.18.1770718922195;
        Tue, 10 Feb 2026 02:22:02 -0800 (PST)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b7cc3sm12949398b3a.51.2026.02.10.02.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:22:01 -0800 (PST)
Message-ID: <c2d50c56-5a3b-41f4-90a8-1ebdff4dd898@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 18:21:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qcom: edp: Add per-version LDO configuration
 callback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-2-231882bbf3f1@oss.qualcomm.com>
 <nxoukhntz3mn6m5qca2lk6wubhwlmxoldh6xpyxx63voseiw35@5rrwfryx6vww>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <nxoukhntz3mn6m5qca2lk6wubhwlmxoldh6xpyxx63voseiw35@5rrwfryx6vww>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4NyBTYWx0ZWRfX+IA+kdCL+Mmk
 A69pSRD/f3t86cIK9R/YJwdNmI7BEexBEAVx2LkcLOTzM+26Wfr+B2dRnuF56Nm/EEAYrYHikVF
 itJ/MdzmenNQQ4rAwUI9xd9J1u1/uITRd0kCoyHuDWE03wYgjEX9/m2zXEsJ1kLrlx7jvV9WPXW
 WY5t+00TKxKDCX8bYRVXFjaHOenTRfuYsW3Nb5XPKkybnf+LSJI+bkNrM6N1ZZ9qtJXBZDl/2Lx
 nR9kULIU6LP90esVBbL1j5wnR28MwNWM+1EeM5ERjrQhH49/auFzQ3tNjZRl926pYMwYc+3GMcq
 0ib6FG6fLEYLNk4XgSwr7EnbRc1Ni/8WB//oltsYdXHdnS0F1hs4XdOjfJIz3D3esuKxg7YuvL2
 6Cnz+0lLfB8yusA8PeSaXcRjaNVXiEbIUM7aXcs7M9F6cunr0an0XDBX4pSJPIeD+/T0MBJbrvn
 ELAmPmbr1cRbOXLwuXw==
X-Authority-Analysis: v=2.4 cv=MLRtWcZl c=1 sm=1 tr=0 ts=698b06cb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Wno69rA-yjVtWsVoYkYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: jqPIz38_O3GRa7bzjqm322SkPKsKD98k
X-Proofpoint-GUID: jqPIz38_O3GRa7bzjqm322SkPKsKD98k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92477-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E567E119930
X-Rspamd-Action: no action



On 2/7/2026 6:17 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 05, 2026 at 05:20:54PM +0800, Yongxing Mou wrote:
>> Introduce the com_ldo_config callback to support per‑PHY LDO
>> configuration.
> 
> Missing the why part. Is the driver programming incorrect values, or is
> it an optimisation? In the former case it needs Fixes, maybe cc:stable,
> maybe Reported-by, etc.
> 
Sure.. will add next version
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 86 ++++++++++++++++++++++++++++++++-----
>>   1 file changed, 76 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index 10cbb7d9a8a0..388226dbad7f 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -81,6 +81,7 @@ struct phy_ver_ops {
>>   	int (*com_clk_fwd_cfg)(const struct qcom_edp *edp);
>>   	int (*com_configure_pll)(const struct qcom_edp *edp);
>>   	int (*com_configure_ssc)(const struct qcom_edp *edp);
>> +	int (*com_ldo_config)(const struct qcom_edp *edp);
>>   };
>>   
>>   struct qcom_edp_phy_cfg {
>> @@ -273,7 +274,7 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
>>   	const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->cfg->swing_pre_emph_cfg;
>>   	unsigned int v_level = 0;
>>   	unsigned int p_level = 0;
>> -	u8 ldo_config;
>> +	int ret;
>>   	u8 swing;
>>   	u8 emph;
>>   	int i;
>> @@ -300,13 +301,13 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
>>   	if (swing == 0xff || emph == 0xff)
>>   		return -EINVAL;
>>   
>> -	ldo_config = edp->is_edp ? 0x0 : 0x1;
>> +	ret = edp->cfg->ver_ops->com_ldo_config(edp);
>> +	if (ret)
>> +		return ret;
>>   
>> -	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
>>   	writel(swing, edp->tx0 + TXn_TX_DRV_LVL);
>>   	writel(emph, edp->tx0 + TXn_TX_EMP_POST1_LVL);
>>   
>> -	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
>>   	writel(swing, edp->tx1 + TXn_TX_DRV_LVL);
>>   	writel(emph, edp->tx1 + TXn_TX_EMP_POST1_LVL);
>>   
>> @@ -530,6 +531,52 @@ static int qcom_edp_com_configure_pll_v4(const struct qcom_edp *edp)
>>   	return 0;
>>   }
>>   
>> +static int qcom_edp_ldo_config_v3(const struct qcom_edp *edp)
>> +{
>> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
>> +	u32 ldo_config;
>> +
>> +	if (!edp->is_edp)
>> +		ldo_config = 0x0;
>> +	else if (dp_opts->link_rate <= 2700)
>> +		ldo_config = 0x81;
>> +	else
>> +		ldo_config = 0x41;
>> +
>> +	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
>> +	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_edp_ldo_config_v4(const struct qcom_edp *edp)
>> +{
>> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
>> +	u32 ldo_config;
>> +
>> +	if (!edp->is_edp)
>> +		ldo_config = 0x0;
>> +	else if (dp_opts->link_rate <= 2700)
>> +		ldo_config = 0xC1;
> 
> Lowercase hex
> 
Got it . will fix
>> +	else
>> +		ldo_config = 0x81;
>> +
>> +	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
>> +	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct phy_ver_ops qcom_edp_phy_ops_v3 = {
>> +	.com_power_on		= qcom_edp_phy_power_on_v4,
>> +	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v4,
>> +	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v4,
>> +	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
>> +	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
>> +	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
>> +	.com_ldo_config		= qcom_edp_ldo_config_v3,
>> +};
>> +
>>   static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>>   	.com_power_on		= qcom_edp_phy_power_on_v4,
>>   	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v4,
>> @@ -537,6 +584,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>>   	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v4,
>>   	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
>>   	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
>> +	.com_ldo_config		= qcom_edp_ldo_config_v4,
>>   };
>>   
>>   static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>> @@ -550,7 +598,7 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>>   static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>>   	.aux_cfg = edp_phy_aux_cfg_v4,
>>   	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
>> -	.ver_ops = &qcom_edp_phy_ops_v4,
>> +	.ver_ops = &qcom_edp_phy_ops_v3,
> 
> This looks like an extra change. Is it intentional in this patch? If so,
> mention it in the commit message.
> 
Yes.. due to kodiak ldo func not compatable with other phys, will update 
the commit message.
>>   };
>>   
>>   static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
> 


