Return-Path: <linux-arm-msm+bounces-107366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGGOBLWPBGoVLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:50:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A981353570C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56A7D30087F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30D4388E45;
	Wed, 13 May 2026 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDibc9RI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYxInNtU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA53F412D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683763; cv=none; b=FZXRr59NOoHCN/qr8rWnVzSSi2mrIrgDbZssD7nWRPPStvZPeZPgUApfajn31jXiR8uF9t5xlj0s6QjPcbQw+OXrlzEw9/ZemjU0eoOpVec/skMwun7l9JDqUSHy38uwrWgIoSpZiZil0U8NSggn8i575h2Cj7L/iPe0Uy2uWQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683763; c=relaxed/simple;
	bh=i70C4aRZh+kIEBITMBuj4aQpXlGiwrUm5uQdOMwzqew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttSjCrGS0YtC9Arnpdf/ESoJX2PwMWbUWEGgE1CZMYXE6CMrZr5F0el8XPfBZvNo8yrOpgE6eqdCX4eH9ckym270AG1xqnRsKDUfvQVPq7wAy5dZkgTKIYbpOt3LDIfC3gz20YK/LOnvc1hJlBeKt5Gd7ZTiY598yLpy6lZopFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDibc9RI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYxInNtU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCROWi2965200
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/T7hxv19XiV1Jl5lUrqjqNhW3gg50rO24lB9xj5+Eo=; b=eDibc9RIBkzz+Z9/
	P/PeSzDNM43QtDVcqJ+Ghsd0lV82ZlqEOSte9xKjnHYuWO/MwvrRCtOkrUts2XOL
	coKbbKe/1pg4xOVj8Kv0qMYAO18yv0dNwX+ZhO+4uOiBooWyGqW+7PfStLaWzmLk
	k/sBvk9J31lBNprOoVqgsh9wYoa1qbkaR+Cm+Pj5pGfyWM+Xfml6sVLH9LxuwU+6
	DvvEYX0I+Y7aME/666TBSbwERU8pPlAKxrRs/eFdG+6NqIgHl1m1SmPvgUH/kbEU
	bosooiWhDpjfN1MJgYingQ1qd3sZfpUvmJqc/ZnXvNY0xaBsNZCdsP4rPF7ZJISC
	RKcGQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59w0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:49:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso27333941cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683759; x=1779288559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/T7hxv19XiV1Jl5lUrqjqNhW3gg50rO24lB9xj5+Eo=;
        b=QYxInNtU1jKvCHDyucA7ecK47ISlItH9dJnUpP9nvy4Nt3OiQQmmuuJyABOctIEUJ+
         18cHncBBS/iycWUUsxZk7RE2rbQFo0WEjx6NpE+RnFLhezGHw7x7pcCwt5nsHLKo9Dg5
         cc9C/SPquNdN/xW8NwbQryDPOiwpPvTkGK+YeMykuy2R8OE4chRjetKFZLsbCWn6/ROi
         Y/ADHAhscLRBXE4/hKy2cX9GMb7WX3jRU7e/ZVX145E4vsFrItGHZ2yCX/J1bzemVr34
         OCcB0pIN0W5o17s6DMHKFChFlht+NpYpbIOu/bQSIacb4YGI8/WBaPKNTgdpfxMCn/I8
         Glzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683759; x=1779288559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/T7hxv19XiV1Jl5lUrqjqNhW3gg50rO24lB9xj5+Eo=;
        b=Set+71Ar8WhtWvyHSyYUCdHJUQfNIHrS9H2o+AKJONiYzyBLGSgdx77GM8c0Yughfq
         cK+oBE/e78zOVU2fyTZYzDhidHFxki9pQofHamsHhKDZI3GrfMORCylq8bOy8xrLUO/7
         J7848+qB6r7d+lzSiN//IvVxXIwjhLoAJob3yPnyXELsstotrlkwhiCe8iX4Bu+VSUfH
         Cd1aZnMN6PrhCnk2ro4vRR5ISDBijDxQdD3CylrrnfDJXCtkpBPpwQ2LQZ9v6Wa6Lf99
         TiqGh+LqnW4ym3y06B+7uyq53zzP1+CD2JqfTgXkTjQ/iGgXs6COmx3gYcvwwz0Vy9zm
         QfBA==
X-Forwarded-Encrypted: i=1; AFNElJ/dhK9FByJsJaiak3RBg2zguompqvVi8Byd46vkqCvxMlWX6wwC1aEC+gx4JWzMW+L/Qx6qKxEFFUJce4ut@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6gWX9nCderdZv/8Pz0OZ0jj3zWRAvSNl0z2KvajTGQDZpmJDf
	fiBXo9WKrQy7N9s3biD4CWYYHO2HNpiDQaqPYADwDsixNRnjY0StXSDrCJiNdnDNkhdcX8fMTSN
	CVclJwz+jMnx6Od5THVaWAjmecetV+2C/rkgXuh+dhPCHZKyuwXXAgmXDsnIbAw1oyfQp
X-Gm-Gg: Acq92OHrdiMvD3zPlRsnXcYoosuSRiTrDT5hI3EMGKvl5eim9Fwu89n36/CrXEkxZZy
	wYzi/jyXTKbKT52bsT3Ri6x0eYO305vUVtygTSmEeT4IrPzEbFZ0Nd8UU//MMJJ7jop/Iafnq5s
	MUPxj7KhXCI2NafGWoRB8iU7pkJ1cq/Yjtn/lslxAqrCvw0DCS7cqrKQgfAs25BV+GcWlmYjjWS
	HVfIrGFw1peQHgIVH/1/wTM1zpFX7SpXCbXVvciGfYdreRV5DOY1CsuY5blIB/Mx2vmJL/UXOBc
	Dd8xGFUA5bkWFuOZgdItQrqrRoW+ejWbhDOqw86rzQkTMG6/k6QBg3FLkpP0pN7z+/UDsEXxObf
	f4dL1Q9OcTa9ESsRQZlW5geFz6ySljgDYn4Fyng9hepSoAQd9YXN7XTKPrrwMcocSWTMTBA3fZz
	vJZcw=
X-Received: by 2002:a05:622a:230d:b0:509:2a92:8088 with SMTP id d75a77b69052e-5162f438383mr35299761cf.1.1778683758880;
        Wed, 13 May 2026 07:49:18 -0700 (PDT)
X-Received: by 2002:a05:622a:230d:b0:509:2a92:8088 with SMTP id d75a77b69052e-5162f438383mr35299271cf.1.1778683758392;
        Wed, 13 May 2026 07:49:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0dfcfdasm6326090a12.18.2026.05.13.07.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:49:17 -0700 (PDT)
Message-ID: <3345c399-1fb4-4590-8c08-51f0f5396c68@oss.qualcomm.com>
Date: Wed, 13 May 2026 16:49:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260513054412.911048-1-priyansh.jain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513054412.911048-1-priyansh.jain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MiBTYWx0ZWRfXwIsVVdfttEGE
 1eO4LpxnE9tu1bzTOyw+AHzn3oaqYBs2/HJm76qcdQQgY80YKTqg6c0kTWRJG+AkMxxd4mTQoId
 k0FeU2RVYaaG8ZKYjwmRNec4UDy1ysRyGIeYVFbZgDiIVjb7DQZavXiM/XgLP8/gU9jW9roaAt5
 nAUpkgMn4UsHWCCSLwvS4PrWw17TA1bpT7mU+BXSnDU0oyDmaXhona/LqX3C08P1rQy8FVL4snQ
 ZoyiWC57DzRQwCLG5hD6gaxjrQMR6pJMkuhli4TEOpF1dVoyvRWtgaVMSXdxMVzSHJOgxKA5ve7
 RjVme5duEqJtARHlq/yT8WEo28PSd0Z9/70bA3oTdQOzNkgQVv83mw40dc9FBykzZtFWRpO2p24
 65HHUoz7HbnnnDZjZ9wI4AZZoi1CmMXcMfiTx+iHcSRqRE6hU4KlGQ6bB1UUrYABQLcwn2R/mLJ
 xgU2r/G85EbXiaiAY1A==
X-Proofpoint-ORIG-GUID: 07QUjjo-ne401sYp4jurqc_glBU_ULu8
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a048f70 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=n9LmjtgyrI0DaRnITSYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 07QUjjo-ne401sYp4jurqc_glBU_ULu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130152
X-Rspamd-Queue-Id: A981353570C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-107366-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/26 7:44 AM, Priyansh Jain wrote:
> The existing TSENS temperature read logic polls the valid bit and then
> reads the temperature register. When temperature reads are triggered
> at very short intervals, this can race with hardware updates and allow
> the temperature field to be read while it is still being updated.
> 
> In this case, the valid bit may already be asserted even though the
> temperature value is transitioning, resulting in an incorrect reading.
> 
> Hardware programming guidelines require the temperature value and the
> valid bit to be sampled atomically in the same read transaction. A
> reading is considered valid only if the valid bit is observed set in
> that same sample.
> 
> The guidelines further specify that software should attempt the
> temperature read up to three times to account for transient update
> windows. If none of the attempts yields a valid sample, a stable fallback
> value must be returned: if the first and second samples match, the second
> value is returned; otherwise, if the second and third samples match, the
> third value is returned; if neither pair matches, -EAGAIN is returned.
> 
> Update the TSENS sensor read logic to implement atomic sampling along
> with the recommended retry-and-compare fallback behavior. This removes
> the race window and ensures deterministic temperature values in
> accordance with hardware requirements.
> 
> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
> 
> ---

Leaving a couple nits below, feel free to apply my tag with or
without them:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index b1b938312723..96c1ff9e3133 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -330,7 +330,7 @@ static int tsens_read_temp(const struct tsens_sensor *s, int field, int *temp)
 {
        struct tsens_priv *priv = s->priv;
        int temp_val[MAX_READ_RETRY] = {0};
-       u32 status = 0;
+       u32 status;
        int ret;
        u32 last_temp_mask = GENMASK(priv->fields[LAST_TEMP_0].msb,
                                        priv->fields[LAST_TEMP_0].lsb);
@@ -341,7 +341,7 @@ static int tsens_read_temp(const struct tsens_sensor *s, int field, int *temp)
                if (ret)
                        return ret;
 
-               /* VER_0 doesn't have VALID bit */
+               /* VER_0 doesn't have a VALID bit */
                if (!valid_bit) {
                        *temp = status & last_temp_mask;
                        return 0;
@@ -355,7 +355,8 @@ static int tsens_read_temp(const struct tsens_sensor *s, int field, int *temp)
                }
        }
 
-       /* As per the HW guidelines, if none of the attempts observe a
+       /*
+        * As per the HW guidelines, if none of the attempts observe a
         * valid sample, a stable fallback value must be returned. If the
         * first and second samples match, the second value is returned;
         * otherwise, if the second and third samples match, the third
@@ -576,13 +577,17 @@ static int tsens_read_irq_state(struct tsens_priv *priv, u32 hw_id,
                d->crit_irq_mask = 0;
                d->crit_thresh = 0;
        }
+
        ret = regmap_field_read(priv->rf[UP_THRESH_0 + hw_id], &d->up_thresh);
        if (ret)
                return ret;
+
        d->up_thresh = tsens_hw_to_mC(s, d->up_thresh);
+
        ret = regmap_field_read(priv->rf[LOW_THRESH_0 + hw_id], &d->low_thresh);
        if (ret)
                return ret;
+
        d->low_thresh = tsens_hw_to_mC(s, d->low_thresh);
 
        dev_dbg(priv->dev, "[%u] %s%s: status(%u|%u|%u) | clr(%u|%u|%u) | mask(%u|%u|%u)\n",
@@ -807,12 +812,11 @@ static void tsens_disable_irq(struct tsens_priv *priv)
 
 int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp)
 {
-       int ret;
        int hw_id = s->hw_id;
        u32 temp_idx = LAST_TEMP_0 + hw_id;
+       int ret;
 
        ret = tsens_read_temp(s, temp_idx, temp);
-
        if (!ret)
                *temp = tsens_hw_to_mC(s, *temp);


