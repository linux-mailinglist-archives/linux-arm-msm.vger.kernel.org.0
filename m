Return-Path: <linux-arm-msm+bounces-97918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMGQCwjjt2mzWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:01:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BA0298676
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4FDB302B21D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584CE1A9FB7;
	Mon, 16 Mar 2026 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="csT/I7l6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YwXUzeLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D68D38F63E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658745; cv=none; b=l7M3FgclPfCc+5pV+LJGMZnZwGJhU5ux1eP4GjMTSflXPm9yi1B5sw/L6Gs5GcvDau1YXgeokEBamys7gS2Z5weqEg5Lp4dzjx1Jjh/yH+diu144972STChzo3Rc4NvGodCh2N5ckK2/IQ3y0G+WuTLJccgI5J0H8YnT4vRukZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658745; c=relaxed/simple;
	bh=Cq9/tNNowWbWN+SRb965lUUGFrgBT94hxzirPv+7Vvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErZhT0qig88umnB0YCWgMwolAMphqtOKZ5E4YkUMKEVFaCzGu30irJ2tpNH3zK5E1kvi87bfGa8Yrrqk4d15a4wapwGDDODvQcwvdYlHDLqdV6rF49yc3MdHr2FCk3LPnmDCLNfArzxmzhMIbQl71cRJL2ldyNmds2ZiAjVNPnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csT/I7l6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwXUzeLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64juw744151
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEBCBWOuvOwrAKBTQB46BQsEOuACakW06XjRHsukSoY=; b=csT/I7l6DY6IUV3q
	9kyEw5cHwln3f6qck6kCB+5r5vmgKA3kfFEd2lGGkABfNAYvZdpigJnM3o7BJukE
	kSYKOoWC5pks/EwrYjYv4kC3iRGbGD73WRgJhgeNi5I1w8qJwcyxE7H0AezqNZhY
	KLplJnvnp/9ta9Wm3uRoxhgU7TbjEfVC1bxrE8bfaCmXHcfY5aFHb6peaz4BPv98
	h0a6ehSCaUeIkyFnFSTWYwwKJYF+Y6T54SRIwBzEAKpCMwuc8YuHMmNHUgEGMG4b
	QseUb+PJKvsC98b6+e/bqwht0XGsaku4UZKytNmDuBNKoHhj8ehutXIK8qKL4BbI
	jr040Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bde1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:59:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4b96c259so63727655ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773658742; x=1774263542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iEBCBWOuvOwrAKBTQB46BQsEOuACakW06XjRHsukSoY=;
        b=YwXUzeLdRaBwiQ8ibYp6Rl98OTbkL0VcDRE2CFC5F1fOntQOnbyl7GscUdOKJwRiGV
         DHoA+mw5cD3s+wfY66I7nv5gUtsgXOJCRJIrHX2XAmAgQCVzrvZjcKmc5qwg0EpdXdT9
         ss/+v/lZMX4tPkNI0HVg23YwXDGUiU63MsTF6TFGMV7gue8SrP4Snim/pJhQLQ9Kzs9V
         l2zj/on7XoOd60FE6YS1l10Md7XoFDYsD96dSSs4lXelQ63UC8e9ekFStlhYRGtMqw49
         9GkI4p4bLWfD+5srbacsoh7oXgYrcAfADt/04c62lTo+vFD6thj/gCjI3Rs7adCqJO3U
         d19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658742; x=1774263542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEBCBWOuvOwrAKBTQB46BQsEOuACakW06XjRHsukSoY=;
        b=htjJ+Fdp0FM5TpqxQbGwnjNT2dFK+5uTakhfbe/PVzHyVbuxdzcZdrx8C3qCU/zFYj
         PTKYc64RRCLic8Xu1HmeQvUulDPd36K2aSdzscySZnY+gUGekv5hojYGh1Qapp9mGwMS
         4NzS7Bx/UrwR3LqTMlfr3525Equ0y4pAddR/NtunDWvtlVULD9YK9m1F7VBvnuNClMJI
         qk/9onXf8fpwXrJ686wQSxUSFb9pjVG4vrjzZdwhaXL2BbHtJGV5pYT1PImIHZoqbV5P
         DYU/ykY5hdVk87kvP1sfK9BIHeEYyha4OTsAahjhzlVtv199yiJ+1GBWjX+UnP4ojWau
         DlPw==
X-Forwarded-Encrypted: i=1; AJvYcCW7SmG0TleSTtSWENrq9S5SqRFAOTwq6jWqDew0o2F6WxpbWdNCgSM57VgOmG3KkykNaNyZhCAA7LCdlqok@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/wwe1rIkEiO6Rxkz1meq1vo9Pl4T8jN4kShJjX95rIZQTOb9G
	T1+sO4+sYmO+9lgQLZttQ+edMIpVWKx9AxXZY1SZ/2Y2B1ZdAml0vt1kBm6vbIYLI20bsTCvObb
	6Ol6F1liMXKuB0c2DhMimO5YUZA9OGZsMVMzkH7hQlvT7YWoM8FRt2up37XDvcTSSt4pWKFKhJt
	SZ
X-Gm-Gg: ATEYQzwYwePnq0PSF/SAjP4s44s8OkRlRX/yvjIZN0lZMvKnN5MQcFQfuFYYDyh4l9E
	jGPMyZjPZ0Pi25slOMjk+b8e9v2VHIDdiUgLLDD2BpHe8SHDhxHGThY56aZuqcVNK5GMalEhPMu
	CY9EnwwvVNvd90KNvfN2kOD2iNnw45WzmXS4uqa++JqVXt3jvVqSJUdTFeVhlv3bmcfBzIoj7RO
	6regtoiHtZw3TsB0CbBYbD2CHiA1OCRPjWStf/to9+hEIEstzXzejj69hVPzeDYcVhBLRSfSamS
	SGdcNDAf2U62P8P6fujCIUtcqE8nArfbu1l4rI2y26DlU+cyl/22crVW/24emSxnSkZBXYGCDbE
	vrDJ2ymVqRNmqunMZk0aoVbr56i8RIpOE3NGFFIYDZOMvVI4Lls4=
X-Received: by 2002:a17:90b:3c81:b0:343:3898:e7c7 with SMTP id 98e67ed59e1d1-35a21fdb688mr9715905a91.12.1773658741997;
        Mon, 16 Mar 2026 03:59:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3c81:b0:343:3898:e7c7 with SMTP id 98e67ed59e1d1-35a21fdb688mr9715875a91.12.1773658741505;
        Mon, 16 Mar 2026 03:59:01 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9230f2fasm5248548a91.9.2026.03.16.03.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:59:01 -0700 (PDT)
Message-ID: <fb8cb7ad-68ab-482a-b70b-5367240232fc@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:28:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
 <20260310-qcom_ice_power_and_clk_vote-v2-11-b9c2a5471d9e@oss.qualcomm.com>
 <3a80a27a-0586-41ea-957d-77fa3d023675@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <3a80a27a-0586-41ea-957d-77fa3d023675@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7e277 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7T9o6mVONip3bYQ_lJkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX1ieg+xKCjK6L
 0GcMRY1R/1OGW3MYbr/pvZnnD5QSMIgWWapMr59aBJ8Fta9Nm0Kzz5WH+bh7Cq5M8VNy7St8F0/
 Y+a2mCax/Rn55f7Xvp7pVImEMAdJcJB0SwsODSi9uaDtw62765MtvBK+7/U6YlmauCSU0T0C5nB
 U+FYYyLH+VzcqXbpQM+iArMYZgyTMfvRFBGCYawemwXvlnUWPlStIsjr0a7HQPXzsn1BLS3o4e8
 Tw8RR/LBXzYzUnvrC01pr7nwexlEQqsEXZsTuUP1PGSCsKpIgNnnHi54ThgZIG4xQDW/VbRRb6y
 qQReVl1PPqqP4EZ5kLDY4ts5njCa6pZjgY+hjC/9PESssUznaJOJQVzLM7wxXkwfvhyeLR5y01M
 KQDFTfQoISJSTwyNPXlbG40HFzOKsabBmuD43TFuaP+kBx+aPWeFGyE6yxKf+u7TuIne+N7K6cd
 o2lrD5YfUnWGKiLIZTw==
X-Proofpoint-GUID: nO2bcUh5870Icd3_sA5LtPkrVGYqy2WZ
X-Proofpoint-ORIG-GUID: nO2bcUh5870Icd3_sA5LtPkrVGYqy2WZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97918-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58BA0298676
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad,

On 3/13/2026 5:21 PM, Konrad Dybcio wrote:
> On 3/10/26 9:06 AM, Harshal Dev wrote:
>> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
>> de-coupled from the QCOM UFS driver, it explicitly votes for its required
>> clocks during probe. For scenarios where the 'clk_ignore_unused' flag is
>> not passed on the kernel command line, to avoid potential unclocked ICE
>> hardware register access during probe the ICE driver should additionally
>> vote on the 'iface' clock.
>> Also update the suspend and resume callbacks to handle un-voting and voting
>> on the 'iface' clock.
>>
>> Fixes: 2afbf43a4aec6 ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/ice.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>> index b203bc685cad..e05dc7b274e0 100644
>> --- a/drivers/soc/qcom/ice.c
>> +++ b/drivers/soc/qcom/ice.c
>> @@ -108,6 +108,7 @@ struct qcom_ice {
>>  	void __iomem *base;
>>  
>>  	struct clk *core_clk;
>> +	struct clk *iface_clk;
>>  	bool use_hwkm;
>>  	bool hwkm_init_complete;
>>  	u8 hwkm_version;
>> @@ -316,6 +317,13 @@ int qcom_ice_resume(struct qcom_ice *ice)
>>  			err);
>>  		return err;
>>  	}
>> +
>> +	err = clk_prepare_enable(ice->iface_clk);
>> +	if (err) {
>> +		dev_err(dev, "failed to enable iface clock (%d)\n",
>> +			err);
> 
> dev_err(dev, "Failed to enable 'iface' clock: %d\n", err);
> 
> (this line is very short, no need to wrap, also some nitty touch-ups)
> 
> [...]
> 

Ack.

>> +	engine->iface_clk = devm_clk_get_optional_enabled(dev, "iface_clk");
> 
> Check for IS_ERR, _optional won't throw an error if it's absent,
> but will if there's anything more serious that's wrong
> 

Thank you for this insight, Ack.

Regards,
Harshal

> Konrad


