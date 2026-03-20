Return-Path: <linux-arm-msm+bounces-98926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOWyIMM/vWmJ8AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:38:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D4E2DA606
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68DA430EBD4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985F23AF660;
	Fri, 20 Mar 2026 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLY4G3xb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YAUPe+NM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6363AEF37
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010062; cv=none; b=UYMRH1f3xZxqTwuDw2M+LKPL+M0jHap6AoHm6G/rvZlw3XdR1FgHVRaxsyAHo178j6kCIkeHk7KOmQmS04zfulMsHMDt2d+QYK5vYGNZKrl5Rty4Iw0XOWtJDNkM0wX9RYDckAFxTVvf+u1kcku9JZVLV9+VyQumGoo2TiadAec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010062; c=relaxed/simple;
	bh=lEocWDistd+a/+7r13EdA2zND6HPENPTQxBSlwMvoQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXtEJA/UG6zD+u4K09N4McSnneBdnF+wpfgECX7SicKdJ5r5QWRWqa8dvAYHXYdUNp1LMM00Psi+PR1yTXn/Oln/wu5+YUnmFnewIF/vPhezYd5EIDH18sAYZBM+M7iDgl3dDa86y/ulyvKPovNR2Scpo0SE+P4BrHqD9QwIpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLY4G3xb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YAUPe+NM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2YZUn1527177
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 12:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VPR4PG726A+qE/vUZXZhajFmf3xyRoeSJ2nfcoJVvGY=; b=mLY4G3xbvmJkNoxA
	PAueJbXjlseO/EDkSMr6FR1cF+DPc/5Qphkndy8gatV7tsyKHH1MbZPJrIFo/Iq0
	lChnXM1YEyeppUenZR65D/kdfKedA7eh0eCzABjsaP2Bjs+rKM8U5R7lXwB2+M54
	fAixw4bJ89uvyLfi9lG68vspUSaD01Eew0prKQGLT0QrRuxyJAflUhP5SMsLJfly
	EretMRoYn7Kmv2zONKnrYF+SiuV2PAPsgWzu52PdEGpdsKEP4HBG8cDGGAi3YAjQ
	vO/Ko1D8CSu5YfvKTP2FIVJoO+A+xz0BrVNBJbVU6FEm9VjcTIcRmMbbvThopYii
	Hqluig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt93d19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 12:34:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so86470881cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774010058; x=1774614858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPR4PG726A+qE/vUZXZhajFmf3xyRoeSJ2nfcoJVvGY=;
        b=YAUPe+NMmPSjbOTT+cCZSmyS5tcWcQ3hOlTnL5m6M6hcB48lsdnLKc+LUD9l4//iL5
         mf0Apwd/ZukjhSYalJtcfHFP714e81+tE7UOQ3tYn8NogwxAqGuTH1RhdLpNxHUYq84C
         IDsxD2wjW2BOeINK20tux7fkRYb89KhLdtu8+a25XlyXdRPVp3gHrswK5eDD4I3Gbdss
         v10Hea5Khmm3USE+yupBXMQalCnJfTZ2/tWHahIh+a3fE4bb+YRqkVXy6dSRh9UFOXeI
         lpH0qFOwEejTJeBGbmKnJT4+9mwJJ9/pEx6U/pmMlZFwYpIM73Z7QrLqaFA076FiOwU5
         0V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774010058; x=1774614858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPR4PG726A+qE/vUZXZhajFmf3xyRoeSJ2nfcoJVvGY=;
        b=hPWEQd1/IVFCeON/dDBP4/L/cHxvR4yX4Pj6FAPu7xUaHRBZNmzx3OQxTfzQwozbhW
         oeQweoXpm5JSmD85m5gec44RUhOOcUUvWWjZ0b1CnHWPuoyOrA0K0TjsK8OapFCwaDz9
         inSaa4b2T4tfce9OuLwXBK0lBt56VKN7PRbNc3QcScJ05RtAbZE4mAaqJtxheizDU96x
         QwTkx/ErGFzPIrA6aOd3aAY1FqGDfcQdpEQB/IkT+fUmt85qxGmMUQzHV9KsB1CKTRaT
         REobnEUx1y/zr36Nnq+llx9np8Q3yXPvvZk0SuxMH8gD+JqpNwZ0Xu12fBQpTgJI205G
         LVkw==
X-Forwarded-Encrypted: i=1; AJvYcCXicDRknsP+qWyvZz5JOBD/CwueikypAoJuytI0yyTAgXVJxDCilG+KdfHkzgNhuqRT3Uj2qtgkm7/LemYn@vger.kernel.org
X-Gm-Message-State: AOJu0YwWEd+UXeQYq0wcBsgVcdVYJmVhkx4j41y/Ew3YXKPJvavOjXEw
	VEEjqhRuDWLwqX8PmTQYGViJiofdE9zaHSPXpMPBP463vD8//5FX2CKfexqllvXKAT9LK1DRLDY
	IU4n+OE1DVWGIGuYNY0wPGfa8VDMlIVEfpJXrRlFMdFDXtk+tgvBpbAuy4xmfcuYuYYUY
X-Gm-Gg: ATEYQzzmU2n+mSE61BJff01tObD622j+ybSwYOyrZfDRauJYkA3eRHho3sb/qWuc8p2
	tmXDwG3P66k2BOfVx0zdTWn44PznQi1wxrQZXJMnplYUFjCAD5fH0WQPskJlE5Oqokyqqfo3sDj
	hW6SfhtqyqEDRoN+1zLtr0F9cagEUCFDqKX2XNVvbswTMEs/NfxBZ7mVc+UNLAvTUdoQWM4pvoV
	P5ZQmvK5xnkdyaYpR+rg9Y3jTw09V6edEk/4EGFvip64hg8mrLUppiOXqY2Ed3Q+sdM3UUQJ4qL
	7vOWDBZXaOeRjy7VDmu9wKn0F/St5OCQyb0X6srwBR0Xfk1+YkZ+RFFq3+q3txivnYbHmSISw6d
	V3Qmfbq0DYQBHEp1kqgzeHK7VjHgqidsXP06oJpsb1WCb3ViI
X-Received: by 2002:a05:622a:354:b0:509:1dc8:e9e5 with SMTP id d75a77b69052e-50b375252d6mr37859721cf.34.1774010057607;
        Fri, 20 Mar 2026 05:34:17 -0700 (PDT)
X-Received: by 2002:a05:622a:354:b0:509:1dc8:e9e5 with SMTP id d75a77b69052e-50b375252d6mr37859371cf.34.1774010057200;
        Fri, 20 Mar 2026 05:34:17 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6863826f8f.5.2026.03.20.05.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 05:34:15 -0700 (PDT)
Message-ID: <94641371-ad9e-40f3-bf5e-c97e38891eca@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 12:34:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio
 interface support
To: Val Packett <val@packett.cool>, broonie@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309065137.949053-9-srinivas.kandagatla@oss.qualcomm.com>
 <a7058f7d-b9c9-4f4b-87af-7775a2e756dd@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <a7058f7d-b9c9-4f4b-87af-7775a2e756dd@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2EnX30SuYWRrb2EtNX2yvo0QO-wOV8Zn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA5OSBTYWx0ZWRfX61mJNvpCX1lx
 4CNVxFbeW2o9KhXx37lgxLU0XSipusgIusDch6BlB4f9WS2L4ALmVEo+y3ua8WXWwG0//u2OT8v
 nlTZjkF7ZN65Xcvt59++ubQcj3dCFRzobadW1HXFkYyLD9j7nZjlFl3myiho9Xy+Nt65rSvYSZ7
 ZBp1WGEft6RM1h1Lr2kxnwdH+MyR4y0dv1aOQFyifGSeZr99s73muvs7R14eEe9QgQ0qMTi8wXh
 Li6FUDwl2q0oRd+rwINo+QDomFCksgcxiDQPP5oYLNBzHsJseYCdB33jDRJDbxoLF7us4bRwxHR
 jWHhRKKKrsezexA9sXkBqb5MhR2JC2xKU5kgf/IcUhyWqPZ7S4M1nHakLXPY+JAYWl9e3dLiWiO
 Fej9uteMlNtVs7/S9D5cxnP5CXRS7Gpp5Raqy7RnF1Yq/+5y/VKQxIt3iYnLESLQyaOmMRGUHki
 qc6WibjH7OdJccFVC1w==
X-Proofpoint-ORIG-GUID: 2EnX30SuYWRrb2EtNX2yvo0QO-wOV8Zn
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69bd3eca cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=R13D1CNnDosyH6-BdusA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-98926-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19D4E2DA606
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 5:17 AM, Val Packett wrote:
> Hi,
> 
> On 3/9/26 3:51 AM, Srinivas Kandagatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> Introduces support for the Senary MI2S audio interface in the Qualcomm
>> q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
>> necessary mappings in the port configuration  to allow audio routing
>> over the Senary MI2S interface.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/q6afe-dai.c         |  6 +++++
>>   sound/soc/qcom/qdsp6/q6afe.c             |  6 +++++
>>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 29 ++++++++++++++++++++++++
>>   3 files changed, 41 insertions(+)
>> [..]
>> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
>> index 43d877322bae..7bd40e32f758 100644
>> --- a/sound/soc/qcom/qdsp6/q6afe.c
>> +++ b/sound/soc/qcom/qdsp6/q6afe.c
>> [..]
> 
> 
> One chunk is missing for this file, adding it to the big switch in
> q6afe_port_get_from_id:

Thanks Val, I will fold this into this patch.

--srini
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 7bd40e32f7..40237267fd 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -1783,6 +1783,8 @@
>      case AFE_PORT_ID_QUATERNARY_MI2S_TX:
>      case AFE_PORT_ID_QUINARY_MI2S_RX:
>      case AFE_PORT_ID_QUINARY_MI2S_TX:
> +    case AFE_PORT_ID_SENARY_MI2S_RX:
> +    case AFE_PORT_ID_SENARY_MI2S_TX:
>          cfg_type = AFE_PARAM_ID_I2S_CONFIG;
>          break;
>      case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
> 
> 
> With that + adding senary to q6routing and to SoC specific sndcard,
> 
> Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
> 
> (WIP device, patches coming Soon™)
> 
> 
> Thanks,
> ~val
> 


